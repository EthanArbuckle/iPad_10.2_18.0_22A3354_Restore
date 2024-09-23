@implementation APUIRouteManager

- (APUIRouteManager)init
{
  APUIRouteManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  dispatch_queue_t v5;
  OS_dispatch_queue *notificationQueue;
  dispatch_queue_t v7;
  OS_dispatch_queue *irQueue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)APUIRouteManager;
  v2 = -[APUIRouteManager init](&v10, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("APUIRouteManager.queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = dispatch_queue_create("APUIRouteManager.notification", 0);
    notificationQueue = v2->_notificationQueue;
    v2->_notificationQueue = (OS_dispatch_queue *)v5;

    if (APSSettingsIsFeatureEnabled(CFSTR("BrokeredDiscoveryRouteSuggestionSupport")))
    {
      v7 = dispatch_queue_create("APUIRouteManager.intelligentRouting", 0);
      irQueue = v2->_irQueue;
      v2->_irQueue = (OS_dispatch_queue *)v7;

    }
  }
  if (dword_10001E9D8 <= 50
    && (dword_10001E9D8 != -1 || _LogCategory_Initialize(&dword_10001E9D8, 33554482)))
  {
    LogPrintF(&dword_10001E9D8, "-[APUIRouteManager init]", 33554482, "APUIRouteManager [%{ptr}] created.", v2);
  }
  return v2;
}

- (void)invalidate
{
  -[IRSession setDelegate:](self->_irSession, "setDelegate:", 0);
  -[IRSession invalidate](self->_irSession, "invalidate");
}

- (void)_pickRouteWithID:(id)a3 authString:(id)a4 useRemoteControl:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  dispatch_semaphore_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  __CFString *v17;
  NSObject *v18;
  void *v19;
  dispatch_time_t v20;
  const __CFString *v21;
  uint64_t v22;
  OS_dispatch_queue *notificationQueue;
  void *v24;
  id v25;
  _QWORD block[4];
  id v27;
  _QWORD v28[5];
  id v29;
  __CFString *v30;
  NSObject *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v7 = a5;
  v10 = a3;
  v25 = a4;
  v11 = a6;
  v12 = objc_msgSend(objc_alloc((Class)AVOutputDeviceDiscoverySession), "initWithDeviceFeatures:", objc_msgSend((id)objc_opt_class(self), "discoveryFeatures:", v7));
  v13 = dispatch_semaphore_create(0);
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = sub_100003C3C;
  v37 = sub_100003C4C;
  v38 = 0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v15 = AVOutputDeviceDiscoverySessionAvailableOutputDevicesDidChangeNotification;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100003C54;
  v28[3] = &unk_100018520;
  v28[4] = self;
  v16 = v12;
  v29 = v16;
  v17 = (__CFString *)v10;
  v30 = v17;
  v32 = &v33;
  v18 = v13;
  v31 = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "addObserverForName:object:queue:usingBlock:", v15, v16, 0, v28));

  objc_msgSend(v16, "setDiscoveryMode:", 2);
  v20 = dispatch_time(0, 3000000000);
  if (dispatch_semaphore_wait(v18, v20))
  {
    if (dword_10001E9D8 <= 90
      && (dword_10001E9D8 != -1 || _LogCategory_Initialize(&dword_10001E9D8, 33554522)))
    {
      if (v17 && !IsAppleInternalBuild())
        v21 = CFSTR("#Redacted#");
      else
        v21 = v17;
      LogPrintF(&dword_10001E9D8, "-[APUIRouteManager _pickRouteWithID:authString:useRemoteControl:completion:]", 33554522, "[%{ptr}] Failed to discover device with deviceID=%@ in %d seconds", self, v21, 3);
    }
    if (v11)
    {
      notificationQueue = self->_notificationQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100004230;
      block[3] = &unk_100018548;
      v27 = v11;
      dispatch_async((dispatch_queue_t)notificationQueue, block);

    }
  }
  else
  {
    v22 = v34[5];
    if (v7)
      -[APUIRouteManager _createSilentConnectionToDevice:authString:completion:](self, "_createSilentConnectionToDevice:authString:completion:", v22, v25, v11);
    else
      -[APUIRouteManager _addOutputDeviceToSystemMusicContext:authString:completion:](self, "_addOutputDeviceToSystemMusicContext:authString:completion:", v22, v25, v11);
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v24, "removeObserver:", v19);

  objc_msgSend(v16, "setDiscoveryMode:", 0);
  _Block_object_dispose(&v33, 8);

}

- (void)pickRouteWithRouteID:(id)a3 authString:(id)a4 useRemoteControl:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v7;
  __CFString *v10;
  id v11;
  id v12;
  const __CFString *v13;
  const char *v14;
  OS_dispatch_queue *queue;
  id v16;
  id v17;
  __CFString *v18;
  _QWORD block[5];
  __CFString *v20;
  id v21;
  id v22;
  BOOL v23;

  v7 = a5;
  v10 = (__CFString *)a3;
  v11 = a4;
  v12 = a6;
  if (dword_10001E9D8 <= 50
    && (dword_10001E9D8 != -1 || _LogCategory_Initialize(&dword_10001E9D8, 33554482)))
  {
    if (v10 && !IsAppleInternalBuild())
      v13 = CFSTR("#Redacted#");
    else
      v13 = v10;
    v14 = "Audio/Video";
    if (v7)
      v14 = "Remote Control";
    LogPrintF(&dword_10001E9D8, "-[APUIRouteManager pickRouteWithRouteID:authString:useRemoteControl:completion:]", 33554482, "[%{ptr}] Picking route with routeID=%@ with %s", self, v13, v14);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004404;
  block[3] = &unk_100018570;
  block[4] = self;
  v20 = v10;
  v23 = v7;
  v21 = v11;
  v22 = v12;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_async((dispatch_queue_t)queue, block);

}

- (void)_addOutputDeviceToSystemMusicContext:(id)a3 authString:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, AVOutputContextAddOutputDeviceOptionCancelIfAuthRequired);
  if (v9)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, AVOutputContextAddOutputDeviceOptionAuthorizationToken);
  if (dword_10001E9D8 <= 50
    && (dword_10001E9D8 != -1 || _LogCategory_Initialize(&dword_10001E9D8, 33554482)))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deviceID"));
    if (v12 && !IsAppleInternalBuild())
    {
      LogPrintF(&dword_10001E9D8, "-[APUIRouteManager _addOutputDeviceToSystemMusicContext:authString:completion:]", 33554482, "[%{ptr}] Found device with deviceID=%@. Start adding device to output context.", self, CFSTR("#Redacted#"));
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deviceID"));
      LogPrintF(&dword_10001E9D8, "-[APUIRouteManager _addOutputDeviceToSystemMusicContext:authString:completion:]", 33554482, "[%{ptr}] Found device with deviceID=%@. Start adding device to output context.", self, v13);

    }
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[AVOutputContext sharedAudioPresentationOutputContext](AVOutputContext, "sharedAudioPresentationOutputContext"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100004610;
  v17[3] = &unk_1000185C0;
  v17[4] = self;
  v18 = v8;
  v19 = v10;
  v15 = v10;
  v16 = v8;
  objc_msgSend(v14, "addOutputDevice:options:completionHandler:", v16, v11, v17);

}

- (void)_createSilentConnectionToDevice:(id)a3 authString:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, AVOutputDeviceCommunicationChannelOptionCancelIfAuthRequired);
  if (v9)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, AVOutputContextAddOutputDeviceOptionAuthorizationToken);
  v12 = AVOutputDeviceCommunicationChannelDataDestinationFitness;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100004A54;
  v15[3] = &unk_1000185E8;
  v15[4] = self;
  v16 = v8;
  v17 = v10;
  v13 = v10;
  v14 = v8;
  objc_msgSend(v14, "openCommunicationChannelToDestination:options:completionHandler:", v12, v11, v15);

}

- (void)session:(id)a3 didSpotOnLocationComplete:(id)a4
{
  NSError *v6;
  int v7;
  uint64_t v8;
  APUIRouteManager *v9;
  NSError *spotOnLocationError;
  NSError *v11;
  id v12;

  v12 = a3;
  v6 = (NSError *)a4;
  if (v6)
    v7 = 50;
  else
    v7 = 90;
  if (v7 >= dword_10001E9D8)
  {
    v8 = v7 | 0x2000000u;
    if (dword_10001E9D8 != -1 || _LogCategory_Initialize(&dword_10001E9D8, v7 | 0x2000000u))
      LogPrintF(&dword_10001E9D8, "-[APUIRouteManager session:didSpotOnLocationComplete:]", v8, "[%{ptr}] IRSession [%{ptr}] setSpotOnLocation completed with %{error}", self, self->_irSession, v6, v12);
  }
  v9 = self;
  objc_sync_enter(v9);
  spotOnLocationError = v9->_spotOnLocationError;
  v9->_spotOnLocationError = v6;
  v11 = v6;

  objc_sync_exit(v9);
  dispatch_semaphore_signal((dispatch_semaphore_t)v9->_spotOnLocationSemaphore);

}

- (void)startIntelligentRoutingLocationSensing
{
  uint64_t v3;
  void *v4;
  id v5;
  IRSession *v6;
  IRSession *irSession;
  OS_dispatch_semaphore *v8;
  OS_dispatch_semaphore *spotOnLocationSemaphore;
  id v10;
  OS_dispatch_queue *irQueue;
  const char *v12;
  _QWORD block[5];

  if (APSSettingsIsFeatureEnabled(CFSTR("BrokeredDiscoveryRouteSuggestionSupport")))
  {
    v3 = objc_claimAutoreleasedReturnValue(+[IRServiceToken serviceTokenForServiceIdentifier:](IRServiceToken, "serviceTokenForServiceIdentifier:", CFSTR("com.apple.mediaremoted")));
    if (v3)
    {
      v4 = (void *)v3;
      v5 = objc_msgSend(objc_alloc((Class)IRConfiguration), "initWithServiceToken:", v3);
      objc_msgSend(v5, "setMode:", 0);
      v6 = (IRSession *)objc_alloc_init((Class)IRSession);
      irSession = self->_irSession;
      self->_irSession = v6;

      -[IRSession setDelegate:](self->_irSession, "setDelegate:", self);
      -[IRSession runWithConfiguration:](self->_irSession, "runWithConfiguration:", v5);
      v8 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
      spotOnLocationSemaphore = self->_spotOnLocationSemaphore;
      self->_spotOnLocationSemaphore = v8;

      v10 = objc_alloc_init((Class)IRSessionSpotOnLocationParameters);
      objc_msgSend(v10, "setResetAllBrokerDiscoveredCandidates:", 1);
      if (dword_10001E9D8 <= 50
        && (dword_10001E9D8 != -1 || _LogCategory_Initialize(&dword_10001E9D8, 33554482)))
      {
        LogPrintF(&dword_10001E9D8, "-[APUIRouteManager startIntelligentRoutingLocationSensing]", 33554482, "[%{ptr}] IRSession [%{ptr}] setting spotOnLocation", self, self->_irSession);
      }
      -[IRSession setSpotOnLocationWithParameters:](self->_irSession, "setSpotOnLocationWithParameters:", v10);
      irQueue = self->_irQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000050F4;
      block[3] = &unk_100018610;
      block[4] = self;
      dispatch_async((dispatch_queue_t)irQueue, block);

      goto LABEL_14;
    }
    APSLogErrorAt(0, "-[APUIRouteManager startIntelligentRoutingLocationSensing]", 286, 0);
    if (dword_10001E9D8 > 90)
    {
      v4 = 0;
      v5 = 0;
      goto LABEL_20;
    }
    if (dword_10001E9D8 != -1 || _LogCategory_Initialize(&dword_10001E9D8, 33554522))
      LogPrintF(&dword_10001E9D8, "-[APUIRouteManager startIntelligentRoutingLocationSensing]", 33554522, "APUIRouteManager [%{ptr}] failed to get IRServiceToken.", self);
  }
  v5 = 0;
  v4 = 0;
LABEL_14:
  if (dword_10001E9D8 <= 50
    && (dword_10001E9D8 != -1 || _LogCategory_Initialize(&dword_10001E9D8, 33554482)))
  {
    v12 = "created";
    if (!self->_irSession)
      v12 = "failed to create";
    LogPrintF(&dword_10001E9D8, "-[APUIRouteManager startIntelligentRoutingLocationSensing]", 33554482, "[%{ptr}] %s IRSession [%{ptr}] with IRServiceToken [%{ptr}].", self, v12, self->_irSession, v4);
  }
LABEL_20:

}

+ (unint64_t)discoveryFeatures:(BOOL)a3
{
  if (a3)
    return 8;
  else
    return 5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_irSession, 0);
  objc_storeStrong((id *)&self->_spotOnLocationError, 0);
  objc_storeStrong((id *)&self->_spotOnLocationSemaphore, 0);
  objc_storeStrong((id *)&self->_irQueue, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
