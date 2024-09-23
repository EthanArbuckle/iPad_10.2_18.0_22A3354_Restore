@implementation WFBannerManager

- (WFBannerManager)init
{
  WFBannerManager *v2;
  WFBannerManager *v3;
  dispatch_queue_attr_t v4;
  NSObject *v5;
  dispatch_queue_attr_t v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  NSMutableOrderedSet *v10;
  NSMutableOrderedSet *pendingRequests;
  NSMutableDictionary *v12;
  NSMutableDictionary *runningPersistentWorkflows;
  WFScreenOnObserver *v14;
  WFScreenOnObserver *screenOnObserver;
  uint64_t v16;
  FBSDisplayLayoutMonitor *layoutMonitor;
  FBSDisplayMonitor *v18;
  FBSDisplayMonitor *displayMonitor;
  NSHashTable *v20;
  NSHashTable *connectedHosts;
  NSMutableDictionary *v22;
  NSMutableDictionary *singleStepHomeScreenRevokeTimers;
  id v24;
  UISCurrentUserInterfaceStyleValue *v25;
  UISCurrentUserInterfaceStyleValue *userInterfaceStyleValue;
  WFBannerManager *v27;
  void **v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *);
  void *v32;
  id v33;
  id location;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)WFBannerManager;
  v2 = -[WFBannerManager init](&v35, "init");
  v3 = v2;
  if (v2)
  {
    v2->_presentedBannerLock._os_unfair_lock_opaque = 0;
    v2->_inflightRequestLock._os_unfair_lock_opaque = 0;
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_USER_INITIATED, 0);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    v8 = dispatch_queue_create("com.apple.shortcuts.WFBannerManager", v7);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v8;

    v10 = objc_opt_new(NSMutableOrderedSet);
    pendingRequests = v3->_pendingRequests;
    v3->_pendingRequests = v10;

    v12 = objc_opt_new(NSMutableDictionary);
    runningPersistentWorkflows = v3->_runningPersistentWorkflows;
    v3->_runningPersistentWorkflows = v12;

    v14 = (WFScreenOnObserver *)objc_alloc_init((Class)WFScreenOnObserver);
    screenOnObserver = v3->_screenOnObserver;
    v3->_screenOnObserver = v14;

    v16 = objc_claimAutoreleasedReturnValue(-[WFBannerManager configuredDisplayLayoutMonitor](v3, "configuredDisplayLayoutMonitor"));
    layoutMonitor = v3->_layoutMonitor;
    v3->_layoutMonitor = (FBSDisplayLayoutMonitor *)v16;

    v18 = (FBSDisplayMonitor *)objc_alloc_init((Class)FBSDisplayMonitor);
    displayMonitor = v3->_displayMonitor;
    v3->_displayMonitor = v18;

    v3->_shouldObserveDisplayLayout = 0;
    v20 = (NSHashTable *)objc_msgSend(objc_alloc((Class)NSHashTable), "initWithOptions:capacity:", 5, 2);
    connectedHosts = v3->_connectedHosts;
    v3->_connectedHosts = v20;

    v22 = objc_opt_new(NSMutableDictionary);
    singleStepHomeScreenRevokeTimers = v3->_singleStepHomeScreenRevokeTimers;
    v3->_singleStepHomeScreenRevokeTimers = v22;

    objc_initWeak(&location, v3);
    v24 = objc_alloc((Class)UISCurrentUserInterfaceStyleValue);
    v29 = _NSConcreteStackBlock;
    v30 = 3221225472;
    v31 = sub_10001DC58;
    v32 = &unk_100034B98;
    objc_copyWeak(&v33, &location);
    v25 = (UISCurrentUserInterfaceStyleValue *)objc_msgSend(v24, "initWithChangesDeliveredOnQueue:toBlock:", 0, &v29);
    userInterfaceStyleValue = v3->_userInterfaceStyleValue;
    v3->_userInterfaceStyleValue = v25;

    -[WFBannerManager beginObservingScreenOnState](v3, "beginObservingScreenOnState", v29, v30, v31, v32);
    v27 = v3;
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }

  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerManager layoutMonitor](self, "layoutMonitor"));
  objc_msgSend(v3, "invalidate");

  -[WFBannerManager stopObservingScreenOnState](self, "stopObservingScreenOnState");
  v4.receiver = self;
  v4.super_class = (Class)WFBannerManager;
  -[WFBannerManager dealloc](&v4, "dealloc");
}

- (void)addConnectedHost:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;

  v4 = a3;
  v5 = sub_100017BF8();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[WFBannerManager addConnectedHost:]";
    v13 = 2112;
    v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Adding connected host: %@", buf, 0x16u);
  }

  v7 = objc_claimAutoreleasedReturnValue(-[WFBannerManager queue](self, "queue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001DB28;
  v9[3] = &unk_100034BC0;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_sync(v7, v9);

}

- (void)removeConnectedHost:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;

  v4 = a3;
  v5 = sub_100017BF8();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[WFBannerManager removeConnectedHost:]";
    v13 = 2112;
    v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Removing connected host: %@", buf, 0x16u);
  }

  v7 = objc_claimAutoreleasedReturnValue(-[WFBannerManager queue](self, "queue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001D8CC;
  v9[3] = &unk_100034BC0;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_sync(v7, v9);

}

- (void)beginPersistentModeWithRunningContext:(id)a3 attribution:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  WFBannerManager *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(-[WFBannerManager queue](self, "queue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10001D48C;
  v15[3] = &unk_100034CA8;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (void)completePersistentModeWithSuccess:(id)a3 runningContext:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  WFBannerManager *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(-[WFBannerManager queue](self, "queue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10001D12C;
  v15[3] = &unk_100034CA8;
  v16 = v9;
  v17 = v8;
  v18 = self;
  v19 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(v11, v15);

}

- (void)showDialogRequest:(id)a3 runningContext:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(-[WFBannerManager queue](self, "queue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10001C710;
  v15[3] = &unk_100034CA8;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v8;
  v13 = v10;
  v14 = v9;
  dispatch_async(v11, v15);

}

- (void)dismissPresentedContentForRunningContext:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  WFBannerManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[WFBannerManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001C2D8;
  block[3] = &unk_100034CD0;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)pauseDialogPresentationForDuration:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[WFBannerManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001C284;
  block[3] = &unk_100034CD0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)resumeDialogPresentationWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[WFBannerManager queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001C230;
  v7[3] = &unk_100034C80;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)updateAttribution:(id)a3 runningContext:(id)a4
{
  id v6;
  id v7;
  dispatch_time_t v8;
  NSObject *v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if (-[WFBannerManager presentsApertureStatus](self, "presentsApertureStatus"))
  {
    v8 = dispatch_time(0, 100000000);
    v9 = objc_claimAutoreleasedReturnValue(-[WFBannerManager queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001C0D8;
    block[3] = &unk_100034C30;
    block[4] = self;
    v11 = v7;
    v12 = v6;
    dispatch_after(v8, v9, block);

  }
}

- (void)applicationWillLaunchInForegroundForRunningContext:(id)a3 isLastAction:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;

  v6 = a3;
  v7 = a4;
  if (!-[WFBannerManager presentsApertureStatus](self, "presentsApertureStatus")
    && objc_msgSend(v7, "BOOLValue"))
  {
    v8 = sub_100017BF8();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[WFBannerManager applicationWillLaunchInForegroundForRunningContext:isLastAction:]";
      v15 = 2112;
      v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s Application will launch during last running action for associated running context: %@", buf, 0x16u);
    }

    v10 = objc_claimAutoreleasedReturnValue(-[WFBannerManager queue](self, "queue"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10001BF9C;
    v11[3] = &unk_100034BC0;
    v11[4] = self;
    v12 = v6;
    dispatch_async(v10, v11);

  }
}

- (WFBannerPresentable)presentedBanner
{
  os_unfair_lock_s *p_presentedBannerLock;
  WFBannerPresentable *v4;

  p_presentedBannerLock = &self->_presentedBannerLock;
  os_unfair_lock_lock(&self->_presentedBannerLock);
  v4 = self->_presentedBanner;
  os_unfair_lock_unlock(p_presentedBannerLock);
  return v4;
}

- (void)setPresentedBanner:(id)a3
{
  WFBannerPresentable *v4;
  WFBannerPresentable *presentedBanner;

  v4 = (WFBannerPresentable *)a3;
  os_unfair_lock_lock(&self->_presentedBannerLock);
  presentedBanner = self->_presentedBanner;
  self->_presentedBanner = v4;

  os_unfair_lock_unlock(&self->_presentedBannerLock);
}

- (WFBannerRequest)inflightRequest
{
  os_unfair_lock_s *p_inflightRequestLock;
  WFBannerRequest *v4;

  p_inflightRequestLock = &self->_inflightRequestLock;
  os_unfair_lock_lock(&self->_inflightRequestLock);
  v4 = self->_inflightRequest;
  os_unfair_lock_unlock(p_inflightRequestLock);
  return v4;
}

- (void)setInflightRequest:(id)a3
{
  id v5;
  NSObject *v6;
  _QWORD block[5];

  v5 = a3;
  os_unfair_lock_lock(&self->_inflightRequestLock);
  objc_storeStrong((id *)&self->_inflightRequest, a3);
  os_unfair_lock_unlock(&self->_inflightRequestLock);
  if (!v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[WFBannerManager queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001BF8C;
    block[3] = &unk_100034BE8;
    block[4] = self;
    dispatch_async(v6, block);

  }
}

- (NSMutableOrderedSet)pendingRequests
{
  NSObject *v3;

  v3 = objc_claimAutoreleasedReturnValue(-[WFBannerManager queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  return self->_pendingRequests;
}

- (void)setPendingRequests:(id)a3
{
  objc_storeStrong((id *)&self->_pendingRequests, a3);
}

- (NSMutableDictionary)runningPersistentWorkflows
{
  NSObject *v3;

  v3 = objc_claimAutoreleasedReturnValue(-[WFBannerManager queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  return self->_runningPersistentWorkflows;
}

- (void)setRunningPersistentWorkflows:(id)a3
{
  objc_storeStrong((id *)&self->_runningPersistentWorkflows, a3);
}

- (void)queue_updateStateWithReason:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  void *v30;
  id v31;
  _QWORD *v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  char v51;
  void *v52;
  void *v53;
  unsigned int v54;
  void *v55;
  id v56;
  NSObject *v57;
  id v58;
  NSObject *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  unsigned __int8 v63;
  id v64;
  NSObject *v65;
  void *v66;
  id v67;
  NSObject *v68;
  void *v69;
  void *v70;
  void *v71;
  unsigned int v72;
  id v73;
  NSObject *v74;
  void *v75;
  id v76;
  NSObject *v77;
  id v78;
  NSObject *v79;
  void *v80;
  void *v81;
  id v82;
  unsigned __int8 v83;
  void *v84;
  id v85;
  int v86;
  id v87;
  unsigned int v88;
  _QWORD *v89;
  SEL v90;
  void *v91;
  id v92;
  int isKindOfClass;
  _QWORD v94[5];
  id v95;
  _QWORD v96[5];
  uint8_t buf[4];
  const char *v98;
  __int16 v99;
  id v100;
  __int16 v101;
  void *v102;
  __int16 v103;
  void *v104;

  v5 = a3;
  v6 = objc_claimAutoreleasedReturnValue(-[WFBannerManager queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  v7 = sub_100017BF8();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerManager pendingRequests](self, "pendingRequests"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerManager presentedBanner](self, "presentedBanner"));
    *(_DWORD *)buf = 136315906;
    v98 = "-[WFBannerManager queue_updateStateWithReason:]";
    v99 = 2112;
    v100 = v5;
    v101 = 2112;
    v102 = v9;
    v103 = 2112;
    v104 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Updating state because %@. Current requests: %@, Presented banner: %@", buf, 0x2Au);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerManager presentedBanner](self, "presentedBanner"));
  if (v12)
  {
    v13 = objc_opt_class(WFBannerViewController, v11);
    if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
      v14 = v12;
    else
      v14 = 0;
  }
  else
  {
    v14 = 0;
  }
  v15 = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerManager pendingRequests](self, "pendingRequests"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "firstObject"));

  if (v17)
  {
    if (-[WFBannerManager isDialogPresentationPaused](self, "isDialogPresentationPaused"))
    {
      v18 = sub_100017BF8();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerManager dialogPresentationPausingReason](self, "dialogPresentationPausingReason"));
        *(_DWORD *)buf = 136315394;
        v98 = "-[WFBannerManager queue_updateStateWithReason:]";
        v99 = 2112;
        v100 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%s We've paused dialog request presentation for '%@', as soon as that clears, we'll get back to presenting", buf, 0x16u);

      }
      goto LABEL_91;
    }
    v90 = a2;
    v22 = v17;
    v24 = objc_opt_class(WFQueuedDialog, v23);
    isKindOfClass = objc_opt_isKindOfClass(v22, v24);
    if ((isKindOfClass & 1) != 0)
      v25 = v22;
    else
      v25 = 0;
    v19 = v25;

    v26 = v22;
    v28 = objc_opt_class(WFQueuedStatusPresentation, v27);
    v29 = objc_opt_isKindOfClass(v26, v28);
    if ((v29 & 1) != 0)
      v30 = v26;
    else
      v30 = 0;
    v31 = v30;

    v96[0] = _NSConcreteStackBlock;
    v96[1] = 3221225472;
    v96[2] = sub_10001B724;
    v96[3] = &unk_100034D48;
    v96[4] = self;
    v32 = objc_retainBlock(v96);
    if ((v29 & 1) != 0 && -[WFBannerManager presentsApertureStatus](self, "presentsApertureStatus"))
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerManager pendingRequests](self, "pendingRequests"));
      objc_msgSend(v33, "removeObjectAtIndex:", 0);

      ((void (*)(_QWORD *, id))v32[2])(v32, v26);
LABEL_90:

      goto LABEL_91;
    }
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerManager inflightRequest](self, "inflightRequest"));

    if (v34)
    {
      v35 = sub_100017BF8();
      v36 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v98 = "-[WFBannerManager queue_updateStateWithReason:]";
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%s Mid dialog presentation, nothing to do here", buf, 0xCu);
      }

      goto LABEL_90;
    }
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "embeddedPlatter"));

    v89 = v32;
    if ((isKindOfClass & 1) != 0)
    {
      v38 = v31;
      v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "request"));
      v41 = objc_opt_class(WFSmartPromptDialogRequest, v40);
      v91 = (void *)v39;
      if ((objc_opt_isKindOfClass(v39, v41) & 1) != 0)
      {
        v42 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerManager presentedBanner](self, "presentedBanner"));
        v88 = 0;
        v31 = v38;
        if (v42 && !v37)
        {
          v85 = v42;
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "context"));
          v81 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerManager presentedBanner](self, "presentedBanner"));
          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "associatedRunningContext"));
          v88 = objc_msgSend(v43, "isEqual:", v44);

          v42 = v85;
        }

      }
      else
      {
        v88 = 0;
        v31 = v38;
      }
      v32 = v89;

    }
    else
    {
      v88 = 0;
    }
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerManager presentedPlatter](self, "presentedPlatter"));
    if (v46)
    {
      v47 = objc_opt_class(WFCompactStatusViewController, v45);
      if ((objc_opt_isKindOfClass(v46, v47) & 1) != 0)
        v48 = v46;
      else
        v48 = 0;
    }
    else
    {
      v48 = 0;
    }
    v92 = v48;

    v49 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerManager presentedBanner](self, "presentedBanner"));
    if (!v49 || objc_msgSend(v15, "dismissalPhase") || v92)
    {

      if (v92)
      {
        if (((-[WFBannerManager presentsApertureStatus](self, "presentsApertureStatus") | v29) & 1) == 0)
        {
          if ((isKindOfClass & 1) == 0
            || (v87 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "context")),
                v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "associatedRunningContext")),
                v83 = objc_msgSend(v87, "isEqual:", v55),
                v55,
                v87,
                (v83 & 1) == 0))
          {
            v56 = sub_100017BF8();
            v57 = objc_claimAutoreleasedReturnValue(v56);
            if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              v98 = "-[WFBannerManager queue_updateStateWithReason:]";
              _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "%s There's requests in the queue, but the status is visible for a different shortcut so it must wait", buf, 0xCu);
            }

            goto LABEL_89;
          }
        }
        v82 = v31;
        v86 = 1;
      }
      else
      {
        v82 = v31;
        v86 = 0;
      }
    }
    else
    {
      v50 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerManager runningContextWaitingForFollowUpRequest](self, "runningContextWaitingForFollowUpRequest"));
      if (v50)
        v51 = 1;
      else
        v51 = v88;

      if ((v51 & 1) == 0)
      {
        v58 = sub_100017BF8();
        v59 = objc_claimAutoreleasedReturnValue(v58);
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
        {
          v60 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerManager presentedBanner](self, "presentedBanner"));
          *(_DWORD *)buf = 136315394;
          v98 = "-[WFBannerManager queue_updateStateWithReason:]";
          v99 = 2112;
          v100 = v60;
          _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "%s There's already a presentable on screen (%@) and status isn't visible, nothing to do here", buf, 0x16u);

        }
        v32 = v89;
        goto LABEL_89;
      }
      v82 = v31;
      v86 = 0;
      v32 = v89;
    }
    if (((v15 != 0) & isKindOfClass) != 1)
      goto LABEL_75;
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject context](v19, "context"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "associatedRunningContext"));
    v54 = objc_msgSend(v52, "isEqual:", v53);

    v32 = v89;
    if (!v54)
      goto LABEL_75;
    if ((v86 & 1) != 0)
    {
      if (-[WFBannerManager presentsApertureStatus](self, "presentsApertureStatus"))
        goto LABEL_71;
    }
    else
    {
      v61 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "queuedStatusPlatter"));
      if (!v61)
        goto LABEL_71;
      v62 = (void *)v61;
      v63 = -[WFBannerManager presentsApertureStatus](self, "presentsApertureStatus");

      if ((v63 & 1) != 0)
        goto LABEL_71;
    }
    v64 = sub_100017BF8();
    v65 = objc_claimAutoreleasedReturnValue(v64);
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v98 = "-[WFBannerManager queue_updateStateWithReason:]";
      _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "%s Status is visible, dialog is coming in. Queueing status to come back after dialog.", buf, 0xCu);
    }

    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "associatedRunningContext"));
    -[WFBannerManager queue_enqueuePersistentModeStatusPresentationForRunningContext:](self, "queue_enqueuePersistentModeStatusPresentationForRunningContext:", v66);

LABEL_71:
    v32 = v89;
    if (-[WFBannerManager queuedDialogIsActionUIRequest:](self, "queuedDialogIsActionUIRequest:", v19, v82))
    {
      v67 = sub_100017BF8();
      v68 = objc_claimAutoreleasedReturnValue(v67);
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v98 = "-[WFBannerManager queue_updateStateWithReason:]";
        _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "%s Action UI is next in the queue, immediately revoking the current presentable.", buf, 0xCu);
      }

      -[WFBannerManager queue_dismissPresentableWithReason:interruptible:forced:](self, "queue_dismissPresentableWithReason:interruptible:forced:", CFSTR("platter hinting was interruped by action UI request"), 0, 0);
      v31 = v82;
LABEL_89:

      goto LABEL_90;
    }
LABEL_75:
    v69 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerManager pendingRequests](self, "pendingRequests", v82));
    objc_msgSend(v69, "removeObjectAtIndex:", 0);

    if ((v86 & isKindOfClass) == 1)
    {
      v70 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject context](v19, "context"));
      v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "associatedRunningContext"));
      v72 = objc_msgSend(v70, "isEqual:", v71);

      v32 = v89;
      if (v72)
      {
        v73 = sub_100017BF8();
        v74 = objc_claimAutoreleasedReturnValue(v73);
        if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v98 = "-[WFBannerManager queue_updateStateWithReason:]";
          _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "%s Status is visible, and incoming dialog is from the same run. Removing the status and asking it to come back after", buf, 0xCu);
        }

        -[WFBannerManager queue_dismissPresentableWithReason:interruptible:forced:](self, "queue_dismissPresentableWithReason:interruptible:forced:", CFSTR("dialog request came in and should dismiss status for now"), 0, 0);
        v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "associatedRunningContext"));
        -[WFBannerManager queue_enqueuePersistentModeStatusPresentationForRunningContext:](self, "queue_enqueuePersistentModeStatusPresentationForRunningContext:", v75);

      }
    }
    v31 = v84;
    if ((isKindOfClass & 1) != 0)
    {
      v76 = sub_100017BF8();
      v77 = objc_claimAutoreleasedReturnValue(v76);
      if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v98 = "-[WFBannerManager queue_updateStateWithReason:]";
        v99 = 2112;
        v100 = v26;
        _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEFAULT, "%s Presenting queued dialog: %@", buf, 0x16u);
      }

      -[WFBannerManager setInflightRequest:](self, "setInflightRequest:", v26);
      v94[0] = _NSConcreteStackBlock;
      v94[1] = 3221225472;
      v94[2] = sub_10001B858;
      v94[3] = &unk_100034D20;
      v94[4] = self;
      v95 = v26;
      -[WFBannerManager getBannerForQueuedDialogRequest:dialogIsBreakthroughSmartPrompt:completionHandler:](self, "getBannerForQueuedDialogRequest:dialogIsBreakthroughSmartPrompt:completionHandler:", v95, v88, v94);

    }
    else if ((v29 & 1) != 0)
    {
      ((void (*)(_QWORD *, id))v32[2])(v32, v26);
    }
    else
    {
      v78 = sub_100017BF8();
      v79 = objc_claimAutoreleasedReturnValue(v78);
      if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v98 = "-[WFBannerManager queue_updateStateWithReason:]";
        v99 = 2112;
        v100 = v26;
        _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_ERROR, "%s Unsupported request of type: %@", buf, 0x16u);
      }

      v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v80, "handleFailureInMethod:object:file:lineNumber:description:", v90, self, CFSTR("WFBannerManager.m"), 710, CFSTR("Unsupported type in queued requests"));

    }
    goto LABEL_89;
  }
  v21 = sub_100017BF8();
  v19 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v98 = "-[WFBannerManager queue_updateStateWithReason:]";
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%s No request in queue, nothing to do here", buf, 0xCu);
  }
LABEL_91:

}

- (void)queue_dismissPresentableWithReason:(id)a3 interruptible:(BOOL)a4 forced:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  id v20;
  id v21;
  id v22;
  _BOOL4 v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  id v28;
  void *v29;
  void **v30;
  uint64_t v31;
  void (*v32)(uint64_t);
  void *v33;
  WFBannerManager *v34;
  id v35;
  NSObject *v36;
  id v37;
  BOOL v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  NSObject *v42;
  __int16 v43;
  id v44;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v9 = objc_claimAutoreleasedReturnValue(-[WFBannerManager queue](self, "queue"));
  dispatch_assert_queue_V2(v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerManager presentedBanner](self, "presentedBanner"));
  if (v11)
  {
    v12 = objc_opt_class(WFBannerViewController, v10);
    if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
      v13 = v11;
    else
      v13 = 0;
    v14 = v13;
    if (-[NSObject dismissalPhase](v14, "dismissalPhase") != (id)1 || v6)
    {
      v21 = -[NSObject dismissalPhase](v14, "dismissalPhase");
      v22 = sub_100017BF8();
      v16 = objc_claimAutoreleasedReturnValue(v22);
      v23 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
      if (v21)
      {
        if (v23)
        {
          *(_DWORD *)buf = 136315138;
          v40 = "-[WFBannerManager queue_dismissPresentableWithReason:interruptible:forced:]";
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s Dismissal requested while already dismissing presentable, nothing to do.", buf, 0xCu);
        }
        goto LABEL_27;
      }
      if (!v23)
      {
LABEL_17:

        v16 = objc_claimAutoreleasedReturnValue(-[NSObject associatedRunningContext](v14, "associatedRunningContext"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject embeddedPlatter](v14, "embeddedPlatter"));

        if (v24)
        {
          if (-[NSObject dismissalPhase](v14, "dismissalPhase") && v6)
          {
            v25 = sub_100017BF8();
            v26 = objc_claimAutoreleasedReturnValue(v25);
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              v40 = "-[WFBannerManager queue_dismissPresentableWithReason:interruptible:forced:]";
              v41 = 2112;
              v42 = v14;
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%s Presenting container is already hinting, no need to initiate hint again: %@", buf, 0x16u);
            }

          }
          else
          {
            v30 = _NSConcreteStackBlock;
            v31 = 3221225472;
            v32 = sub_10001B530;
            v33 = &unk_100034D70;
            v34 = self;
            v35 = v11;
            v16 = v16;
            v36 = v16;
            v28 = v8;
            v37 = v28;
            v38 = v5;
            -[NSObject dismissEmbeddedPlatterWithCompletion:interruptible:](v14, "dismissEmbeddedPlatterWithCompletion:interruptible:", &v30, v6);
            -[WFBannerManager queue_updatePresentedStatusForRunningContext:](self, "queue_updatePresentedStatusForRunningContext:", v16);
            if (v6)
            {
              v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("we just hinted a banner, hint reason: %@"), v28, v30, v31, v32, v33, v34, v35, v36));
              -[WFBannerManager queue_updateStateWithReason:](self, "queue_updateStateWithReason:", v29);

            }
          }
        }
        else
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("hinting request did not find embedded platter, revoking immediately. Hint reason: %@"), v8));
          -[WFBannerManager queue_revokePresentableForContext:reason:forced:](self, "queue_revokePresentableForContext:reason:forced:", v16, v27, v5);

        }
LABEL_27:

        goto LABEL_28;
      }
      *(_DWORD *)buf = 136315650;
      v40 = "-[WFBannerManager queue_dismissPresentableWithReason:interruptible:forced:]";
      v41 = 2112;
      v42 = v14;
      v43 = 2112;
      v44 = v8;
      v17 = "%s Hinting dismissal of presented banner: %@, reason: %@";
      v18 = v16;
      v19 = 32;
    }
    else
    {
      v15 = sub_100017BF8();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        goto LABEL_17;
      *(_DWORD *)buf = 136315138;
      v40 = "-[WFBannerManager queue_dismissPresentableWithReason:interruptible:forced:]";
      v17 = "%s Non-interruptible dismissal request received while hinting, immediately pushing to poof phase.";
      v18 = v16;
      v19 = 12;
    }
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
    goto LABEL_17;
  }
  v20 = sub_100017BF8();
  v14 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v40 = "-[WFBannerManager queue_dismissPresentableWithReason:interruptible:forced:]";
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s No presentable to dismiss", buf, 0xCu);
  }
LABEL_28:

}

- (void)queue_revokePresentableForContext:(id)a3 reason:(id)a4 forced:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void (**v21)(_QWORD, _QWORD);
  id v22;
  id v23;
  NSObject *v24;
  void *v25;
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  NSObject *v32;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = sub_100017BF8();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v28 = "-[WFBannerManager queue_revokePresentableForContext:reason:forced:]";
    v29 = 2112;
    v30 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s Revoking banner presentable with reason: %@", buf, 0x16u);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerManager presentedBanner](self, "presentedBanner"));
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[WFBannerViewController requestIdentifierForContext:](WFBannerViewController, "requestIdentifierForContext:", v8));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerManager bannerSource](self, "bannerSource"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerManager dismissalReasonWithReason:](self, "dismissalReasonWithReason:", v9));
    v26 = 0;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "revokePresentableWithRequestIdentifier:reason:animated:userInfo:error:", v13, v15, 0, &__NSDictionary0__struct, &v26));
    v17 = v26;

    if (v16)
    {
      -[WFBannerManager setPresentedBanner:](self, "setPresentedBanner:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerManager inflightRequest](self, "inflightRequest"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "context"));
      if ((objc_msgSend(v19, "isEqual:", v8) & 1) != 0)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerManager bannerPresentationCompletion](self, "bannerPresentationCompletion"));

        if (v20)
        {
          v21 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[WFBannerManager bannerPresentationCompletion](self, "bannerPresentationCompletion"));
          v21[2](v21, 2);

          -[WFBannerManager setBannerPresentationCompletion:](self, "setBannerPresentationCompletion:", 0);
        }
      }
      else
      {

      }
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("we just revoked a banner, revoke reason: %@"), v9));
      -[WFBannerManager queue_updateStateWithReason:](self, "queue_updateStateWithReason:", v25);

    }
    else
    {
      v23 = sub_100017BF8();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v28 = "-[WFBannerManager queue_revokePresentableForContext:reason:forced:]";
        v29 = 2112;
        v30 = v8;
        v31 = 2112;
        v32 = v17;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s Failed to revoke banner for running context: %@, error: %@", buf, 0x20u);
      }

      if (v5)
        -[WFBannerManager revokeAllPresentablesWithReason:](self, "revokeAllPresentablesWithReason:", CFSTR("Banner revoke failed and caller requested forced dismissal"));
    }

  }
  else
  {
    v22 = sub_100017BF8();
    v17 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v28 = "-[WFBannerManager queue_revokePresentableForContext:reason:forced:]";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s No presentable to revoke", buf, 0xCu);
    }
  }

}

- (void)queue_revokeIslandPresentableForContext:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  dispatch_time_t v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  WFBannerManager *v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;

  v6 = a3;
  v7 = a4;
  v8 = sub_100017BF8();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v20 = "-[WFBannerManager queue_revokeIslandPresentableForContext:reason:]";
    v21 = 2112;
    v22 = v6;
    v23 = 2112;
    v24 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s Revoking pill presentable for context: %@, reason: %@", buf, 0x20u);
  }

  v10 = objc_claimAutoreleasedReturnValue(-[WFBannerManager queue](self, "queue"));
  dispatch_assert_queue_V2(v10);

  v11 = dispatch_time(0, 80000000);
  v12 = objc_claimAutoreleasedReturnValue(-[WFBannerManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001B3D8;
  block[3] = &unk_100034C30;
  v16 = v6;
  v17 = self;
  v18 = v7;
  v13 = v7;
  v14 = v6;
  dispatch_after(v11, v12, block);

}

- (void)queue_presentBanner:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  id v12;
  unsigned int v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned int v29;
  id v30;
  NSObject *v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  NSObject *v44;
  void *v45;
  void (**v46)(_QWORD, _QWORD, _QWORD);
  id v47;
  void *v48;
  id v49;
  id v50;
  uint64_t v51;
  void *i;
  void *v53;
  void *v54;
  void *v55;
  _QWORD block[5];
  id v57;
  char v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t v63[128];
  uint8_t buf[4];
  const char *v65;
  __int16 v66;
  id v67;
  __int16 v68;
  void *v69;

  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  v8 = sub_100017BF8();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "requestIdentifier"));
    *(_DWORD *)buf = 136315650;
    v65 = "-[WFBannerManager queue_presentBanner:completion:]";
    v66 = 2112;
    v67 = v6;
    v68 = 2112;
    v69 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s Preparing banner for presentation (%@) for running context (%@)", buf, 0x20u);

  }
  v11 = objc_claimAutoreleasedReturnValue(-[WFBannerManager queue](self, "queue"));
  dispatch_assert_queue_V2(v11);

  v12 = (id)objc_claimAutoreleasedReturnValue(-[WFBannerManager presentedBanner](self, "presentedBanner"));
  if (v12 == v6)
  {
    v24 = sub_100017BF8();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "requestIdentifier"));
      *(_DWORD *)buf = 136315650;
      v65 = "-[WFBannerManager queue_presentBanner:completion:]";
      v66 = 2112;
      v67 = v6;
      v68 = 2112;
      v69 = v26;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s Presentable is already on screen (%@), (%@)", buf, 0x20u);

    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "associatedRunningContext"));
    -[WFBannerManager queue_updatePresentedStatusForRunningContext:](self, "queue_updatePresentedStatusForRunningContext:", v27);

    v7[2](v7, 1);
  }
  else
  {
    v13 = -[WFBannerManager presentableIsIslandPresentable:](self, "presentableIsIslandPresentable:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerManager inflightRequest](self, "inflightRequest"));
    if (!v14 || -[WFBannerManager screenOn](self, "screenOn"))
    {

      goto LABEL_7;
    }

    if ((v13 & 1) != 0)
    {
LABEL_7:
      if (!-[WFBannerManager presentsApertureStatus](self, "presentsApertureStatus"))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "associatedRunningContext"));
        v16 = -[WFBannerManager runningContextIsInPersistentMode:](self, "runningContextIsInPersistentMode:", v15);

        if (v16)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "associatedRunningContext"));
          -[WFBannerManager setPresentedPersistentRunningContext:](self, "setPresentedPersistentRunningContext:", v17);

        }
      }
      if (-[WFBannerManager presentsApertureStatus](self, "presentsApertureStatus") && v13)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "associatedRunningContext"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerManager runningPersistentWorkflows](self, "runningPersistentWorkflows"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", v18));

        if (v20)
        {
          v22 = objc_opt_class(WFRunningPersistentModeWorkflow, v21);
          if ((objc_opt_isKindOfClass(v20, v22) & 1) != 0)
            v23 = v20;
          else
            v23 = 0;
        }
        else
        {
          v23 = 0;
        }
        v36 = v23;

        objc_msgSend(v36, "setAssociatedPill:", v6);
        v7[2](v7, 1);

      }
      else
      {
        -[WFBannerManager setBannerPresentationCompletion:](self, "setBannerPresentationCompletion:", v7);
      }
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001B0AC;
      block[3] = &unk_100034DD8;
      block[4] = self;
      v57 = v6;
      v58 = v13;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

      goto LABEL_28;
    }
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "associatedRunningContext"));
    v29 = objc_msgSend(v28, "isShortcutsApp");
    v30 = sub_100017BF8();
    v31 = objc_claimAutoreleasedReturnValue(v30);
    v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
    if (v29)
    {
      if (v32)
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerManager inflightRequest](self, "inflightRequest"));
        *(_DWORD *)buf = 136315394;
        v65 = "-[WFBannerManager queue_presentBanner:completion:]";
        v66 = 2112;
        v67 = v33;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%s Display is off, putting inflight request (%@) back on top of the queue and observing display layout", buf, 0x16u);

      }
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerManager pendingRequests](self, "pendingRequests"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerManager inflightRequest](self, "inflightRequest"));
      objc_msgSend(v34, "insertObject:atIndex:", v35, 0);

      -[WFBannerManager setInflightRequest:](self, "setInflightRequest:", 0);
      -[WFBannerManager setShouldObserveDisplayLayout:](self, "setShouldObserveDisplayLayout:", 1);
      v7[2](v7, 3);
    }
    else
    {
      if (v32)
      {
        *(_DWORD *)buf = 136315138;
        v65 = "-[WFBannerManager queue_presentBanner:completion:]";
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%s Display is off, requesting for workflow pause", buf, 0xCu);
      }

      v38 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerManager inflightRequest](self, "inflightRequest"));
      if (v38)
      {
        v39 = objc_opt_class(WFQueuedDialog, v37);
        if ((objc_opt_isKindOfClass(v38, v39) & 1) != 0)
          v40 = v38;
        else
          v40 = 0;
      }
      else
      {
        v40 = 0;
      }
      v41 = v40;

      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "request"));
      if (!v42)
      {
        v43 = sub_100017BF8();
        v44 = objc_claimAutoreleasedReturnValue(v43);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315138;
          v65 = "-[WFBannerManager queue_presentBanner:completion:]";
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_FAULT, "%s Attempting to pause a workflow when presenting a non-queued dialog request", buf, 0xCu);
        }

      }
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "completionHandler"));

      if (v45)
      {
        v46 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "completionHandler"));
        v47 = objc_msgSend(objc_alloc((Class)WFDialogResponse), "initWithResponseCode:", 3);
        ((void (**)(_QWORD, id, _QWORD))v46)[2](v46, v47, 0);

        objc_msgSend(v41, "setCompletionHandler:", 0);
      }
      -[WFBannerManager setInflightRequest:](self, "setInflightRequest:", 0, v41);
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerManager connectedHosts](self, "connectedHosts"));
      v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
      if (v49)
      {
        v50 = v49;
        v51 = *(_QWORD *)v60;
        do
        {
          for (i = 0; i != v50; i = (char *)i + 1)
          {
            if (*(_QWORD *)v60 != v51)
              objc_enumerationMutation(v48);
            v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)i), "remoteTarget"));
            v54 = v53;
            if (v53)
              objc_msgSend(v53, "presenterRequestedWorkflowPauseForContext:dialogRequest:completionHandler:", v28, v42, &stru_100034DB0);

          }
          v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
        }
        while (v50);
      }

      v7[2](v7, 4);
    }

  }
LABEL_28:

}

- (id)bannerSource
{
  return +[BNBannerSource bannerSourceForDestination:forRequesterIdentifier:](BNBannerSource, "bannerSourceForDestination:forRequesterIdentifier:", 0, VCBundleIdentifierShortcutsUI);
}

- (id)defaultPostOptions
{
  _QWORD v3[3];
  _QWORD v4[3];

  v3[0] = kSBUIPresentableShouldBypassScreenSharingUserInfoKey;
  v3[1] = kSBUIPresentableWantsDismissalPreventionContextUserInfoKey;
  v4[0] = &__kCFBooleanTrue;
  v4[1] = &__kCFBooleanTrue;
  v3[2] = kSBUIPresentableCustomTransitionStyleUserInfoKey;
  v4[2] = &off_100036F48;
  return (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 3));
}

- (void)queue_enqueuePersistentModeStatusPresentationForRunningContext:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  WFQueuedStatusPresentation *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void **v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  WFQueuedStatusPresentation *v22;
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  id v27;

  v4 = a3;
  v5 = sub_100017BF8();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v25 = "-[WFBannerManager queue_enqueuePersistentModeStatusPresentationForRunningContext:]";
    v26 = 2112;
    v27 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Submitting persistent mode request for %@", buf, 0x16u);
  }

  v7 = objc_claimAutoreleasedReturnValue(-[WFBannerManager queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerManager runningPersistentWorkflows](self, "runningPersistentWorkflows"));
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v4));

  if (v9
    && (v11 = objc_opt_class(WFRunningPersistentModeWorkflow, v10),
        (objc_opt_isKindOfClass(v9, v11) & 1) != 0))
  {
    v12 = -[WFQueuedStatusPresentation initWithRunningContext:]([WFQueuedStatusPresentation alloc], "initWithRunningContext:", v4);
    if (-[WFBannerManager presentsApertureStatus](self, "presentsApertureStatus"))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerManager pendingRequests](self, "pendingRequests"));
      objc_msgSend(v13, "addObject:", v12);

    }
    else
    {
      objc_initWeak((id *)buf, self);
      v15 = objc_alloc((Class)WFDispatchSourceTimer);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerManager queue](self, "queue"));
      v18 = _NSConcreteStackBlock;
      v19 = 3221225472;
      v20 = sub_10001B050;
      v21 = &unk_100034E00;
      objc_copyWeak(&v23, (id *)buf);
      v22 = v12;
      v17 = objc_msgSend(v15, "initWithInterval:queue:handler:", v16, &v18, 0.2);

      objc_msgSend(v17, "setPreventSuspension:", 1, v18, v19, v20, v21);
      objc_msgSend(v17, "start");

      objc_destroyWeak(&v23);
      objc_destroyWeak((id *)buf);
    }

  }
  else
  {

    v14 = sub_100017BF8();
    v9 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[WFBannerManager queue_enqueuePersistentModeStatusPresentationForRunningContext:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s Unable to enqueue persistent mode status presentation because the backing workflow is not running", buf, 0xCu);
    }
  }

}

- (void)queue_stopTrackingPersistentModeContext:(id)a3 withReason:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  int v17;
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;

  v6 = a3;
  v7 = a4;
  v8 = sub_100017BF8();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 136315650;
    v18 = "-[WFBannerManager queue_stopTrackingPersistentModeContext:withReason:]";
    v19 = 2112;
    v20 = v6;
    v21 = 2114;
    v22 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s Removing state for %@ because %{public}@", (uint8_t *)&v17, 0x20u);
  }

  v10 = objc_claimAutoreleasedReturnValue(-[WFBannerManager queue](self, "queue"));
  dispatch_assert_queue_V2(v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerManager runningPersistentWorkflows](self, "runningPersistentWorkflows"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v6));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "progressSubscriber"));
  objc_msgSend(v6, "removeProgressSubscriber:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerManager runningPersistentWorkflows](self, "runningPersistentWorkflows"));
  objc_msgSend(v14, "removeObjectForKey:", v6);

  if (!-[WFBannerManager presentsApertureStatus](self, "presentsApertureStatus"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerManager presentedPersistentRunningContext](self, "presentedPersistentRunningContext"));
    v16 = objc_msgSend(v15, "isEqual:", v6);

    if (v16)
      -[WFBannerManager setPresentedPersistentRunningContext:](self, "setPresentedPersistentRunningContext:", 0);
  }

}

- (void)queue_removePendingStatusPresentationsForRunningContext:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  WFBannerManager *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[WFBannerManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v6 = objc_alloc_init((Class)NSMutableArray);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v19 = self;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerManager pendingRequests](self, "pendingRequests"));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v13 = *(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        if (v13)
        {
          v14 = objc_opt_class(WFQueuedStatusPresentation, v12);
          if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
            v15 = v13;
          else
            v15 = 0;
        }
        else
        {
          v15 = 0;
        }
        v16 = v15;

        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "context"));
        LODWORD(v16) = objc_msgSend(v17, "isEqual:", v4);

        if ((_DWORD)v16)
          objc_msgSend(v6, "addObject:", v13);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerManager pendingRequests](v19, "pendingRequests"));
  objc_msgSend(v18, "removeObjectsInArray:", v6);

}

- (void)queue_updatePresentedStatusForRunningContext:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  unsigned int v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  unsigned __int8 v30;
  dispatch_time_t v31;
  dispatch_time_t v32;
  NSObject *v33;
  NSObject *v34;
  id v35;
  _QWORD v36[4];
  NSObject *v37;
  id v38;
  _QWORD v39[5];
  id v40;
  _QWORD v41[4];
  NSObject *v42;
  _QWORD block[4];
  NSObject *v44;
  id v45;
  WFBannerManager *v46;
  id v47;
  uint8_t buf[4];
  const char *v49;
  __int16 v50;
  id v51;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[WFBannerManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v6 = sub_100017BF8();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v49 = "-[WFBannerManager queue_updatePresentedStatusForRunningContext:]";
    v50 = 2112;
    v51 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Updating presented status platters with progress if applicable. Running context: (%@)", buf, 0x16u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerManager runningPersistentWorkflows](self, "runningPersistentWorkflows"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v4));

  if (v9)
  {
    v11 = objc_opt_class(WFRunningPersistentModeWorkflow, v10);
    if ((objc_opt_isKindOfClass(v9, v11) & 1) != 0)
    {
      if (-[WFBannerManager presentsApertureStatus](self, "presentsApertureStatus"))
      {
        v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "associatedPill"));
        if (v13)
        {
          v14 = objc_opt_class(WFApertureStatusViewController, v12);
          if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
          {
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_10001AB58;
            block[3] = &unk_100034E28;
            v44 = v13;
            v45 = v9;
            v46 = self;
            v47 = v4;
            v9 = v9;
            v15 = v13;
            dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

            goto LABEL_34;
          }
        }
      }
      else
      {
        v13 = objc_claimAutoreleasedReturnValue(-[WFBannerManager presentedPlatter](self, "presentedPlatter"));
        if (!v13
          || (v23 = objc_opt_class(WFCompactStatusViewController, v22),
              (objc_opt_isKindOfClass(v13, v23) & 1) == 0))
        {

          v25 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerManager presentedBanner](self, "presentedBanner"));
          if (v25)
          {
            v26 = objc_opt_class(WFBannerViewController, v24);
            v27 = (objc_opt_isKindOfClass(v25, v26) & 1) != 0 ? v25 : 0;
          }
          else
          {
            v27 = 0;
          }
          v28 = v27;

          v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "queuedStatusPlatter"));
          if (!v13)
            goto LABEL_29;
        }
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject associatedRunningContext](v13, "associatedRunningContext"));
        v30 = objc_msgSend(v29, "isEqual:", v4);

        if ((v30 & 1) != 0)
        {
          if (objc_msgSend(v9, "completed"))
          {
            v31 = dispatch_time(0, 50000000);
            v41[0] = _NSConcreteStackBlock;
            v41[1] = 3221225472;
            v41[2] = sub_10001ADBC;
            v41[3] = &unk_100034BE8;
            v13 = v13;
            v42 = v13;
            dispatch_after(v31, (dispatch_queue_t)&_dispatch_main_q, v41);
            v32 = dispatch_time(0, 1000000000);
            v33 = objc_claimAutoreleasedReturnValue(-[WFBannerManager queue](self, "queue"));
            v39[0] = _NSConcreteStackBlock;
            v39[1] = 3221225472;
            v39[2] = sub_10001AE84;
            v39[3] = &unk_100034BC0;
            v39[4] = self;
            v40 = v4;
            dispatch_after(v32, v33, v39);

            v34 = v42;
          }
          else
          {
            v36[0] = _NSConcreteStackBlock;
            v36[1] = 3221225472;
            v36[2] = sub_10001AF54;
            v36[3] = &unk_100034BC0;
            v13 = v13;
            v37 = v13;
            v38 = v9;
            dispatch_async((dispatch_queue_t)&_dispatch_main_q, v36);

            v34 = v37;
          }
        }
        else
        {
LABEL_29:
          v35 = sub_100017BF8();
          v34 = objc_claimAutoreleasedReturnValue(v35);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v49 = "-[WFBannerManager queue_updatePresentedStatusForRunningContext:]";
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%s No status view controller found", buf, 0xCu);
          }
        }

      }
      goto LABEL_34;
    }
  }

  v9 = (id)objc_claimAutoreleasedReturnValue(-[WFBannerManager presentedPlatter](self, "presentedPlatter"));
  if (v9
    && (v17 = objc_opt_class(WFCompactStatusViewController, v16),
        (objc_opt_isKindOfClass(v9, v17) & 1) != 0))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "associatedRunningContext"));
    v19 = objc_msgSend(v18, "isEqual:", v4);

    if (v19)
    {
      v20 = sub_100017BF8();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v49 = "-[WFBannerManager queue_updatePresentedStatusForRunningContext:]";
        v50 = 2112;
        v51 = v4;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s While updating platters for progress, shortcut with context (%@) was found to no longer be tracked. Revoking...", buf, 0x16u);
      }

      -[WFBannerManager queue_dismissPresentableWithReason:interruptible:forced:](self, "queue_dismissPresentableWithReason:interruptible:forced:", CFSTR("shortcut was found to be no longer running as determined by updating progress process after presenting status"), 0, 0);
      goto LABEL_34;
    }
  }
  else
  {

    v9 = 0;
  }
  if (-[WFBannerManager presentsApertureStatus](self, "presentsApertureStatus"))
    -[WFBannerManager queue_revokeIslandPresentableForContext:reason:](self, "queue_revokeIslandPresentableForContext:reason:", v4, CFSTR("shortcut was found to be no longer running as determined by updating progress process after presenting status"));
LABEL_34:

}

- (void)getBannerForQueuedStatusPresentation:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  _QWORD block[5];
  id v8;
  id v9;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001A3D4;
  block[3] = &unk_100034CD0;
  block[4] = self;
  v8 = a3;
  v9 = a4;
  v5 = v9;
  v6 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (id)requestContainerForRunningContext:(id)a3
{
  id v4;
  void ***v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  char isKindOfClass;
  WFBannerViewController *v15;
  void **v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  WFBannerManager *v22;

  v17 = _NSConcreteStackBlock;
  v18 = 3221225472;
  v19 = sub_10001A084;
  v20 = &unk_100034E98;
  v4 = a3;
  v21 = v4;
  v22 = self;
  v5 = objc_retainBlock(&v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerManager presentedBanner](self, "presentedBanner", v17, v18, v19, v20));
  if (v7)
  {
    v8 = objc_opt_class(WFBannerViewController, v6);
    if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
      v9 = v7;
    else
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;

  objc_msgSend(v10, "setDismissalHandler:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerManager presentedPlatter](self, "presentedPlatter"));
  v13 = objc_opt_class(WFCompactStatusViewController, v12);
  isKindOfClass = objc_opt_isKindOfClass(v11, v13);

  if (objc_msgSend(v10, "dismissalPhase") || (isKindOfClass & 1) != 0)
  {
    v15 = (WFBannerViewController *)v10;
  }
  else
  {
    v15 = -[WFBannerViewController initWithDelegate:associatedRunningContext:]([WFBannerViewController alloc], "initWithDelegate:associatedRunningContext:", self, v4);
    -[WFBannerViewController setDismissalHandler:](v15, "setDismissalHandler:", v5);
  }

  return v15;
}

- (BOOL)dialogRequestShouldNotEmbed:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char isKindOfClass;
  uint64_t v10;

  v3 = a3;
  v5 = objc_opt_class(WFInputTextDialogRequest, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0
    || (v7 = objc_opt_class(WFChooseFromListDialogRequest, v6), (objc_opt_isKindOfClass(v3, v7) & 1) != 0))
  {
    isKindOfClass = 1;
  }
  else
  {
    v10 = objc_opt_class(WFAskParameterDialogRequest, v8);
    isKindOfClass = objc_opt_isKindOfClass(v3, v10);
  }

  return isKindOfClass & 1;
}

- (void)getBannerForQueuedDialogRequest:(id)a3 dialogIsBreakthroughSmartPrompt:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  WFBannerManager *v16;
  id v17;
  BOOL v18;
  uint8_t buf[4];
  const char *v20;

  v8 = a3;
  v9 = a5;
  v10 = sub_100017BF8();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[WFBannerManager getBannerForQueuedDialogRequest:dialogIsBreakthroughSmartPrompt:completionHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s Getting dialog banner...", buf, 0xCu);
  }

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100019864;
  v14[3] = &unk_100034F10;
  v15 = v8;
  v16 = self;
  v17 = v9;
  v18 = a4;
  v12 = v9;
  v13 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v14);

}

- (id)queue_pauseDialogPresentationForDuration:(id)a3 withReason:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31[2];
  _BYTE buf[12];
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  void *v38;
  NSErrorUserInfoKey v39;

  v7 = a3;
  v8 = a4;
  v9 = objc_claimAutoreleasedReturnValue(-[WFBannerManager queue](self, "queue"));
  dispatch_assert_queue_V2(v9);

  objc_msgSend(v7, "doubleValue");
  v11 = v10;
  if (-[WFBannerManager isDialogPresentationPaused](self, "isDialogPresentationPaused"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerManager dialogPresentationPausingReason](self, "dialogPresentationPausingReason"));
    v13 = sub_100017BF8();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "-[WFBannerManager queue_pauseDialogPresentationForDuration:withReason:]";
      v33 = 2048;
      v34 = v11;
      v35 = 2112;
      v36 = v8;
      v37 = 2112;
      v38 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s Wanted to pause dialog presentation for %.2f seconds for '%@', but it was already paused for '%@'", buf, 0x2Au);
    }

    v15 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Dialog presentation is already paused for '%@'"), v12));
    v16 = (void *)v15;
    if (v15)
    {
      v39 = NSLocalizedDescriptionKey;
      *(_QWORD *)buf = v15;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", buf, &v39, 1));
    }
    else
    {
      v17 = 0;
    }
    v26 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.shortcuts.bannermanager"), 1, v17);

  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerManager pauseTimer](self, "pauseTimer"));

    if (v18)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFBannerManager.m"), 1234, CFSTR("Dialog presentation isn't paused, but the pause timer is non-nil"));

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerManager dialogPresentationPausingReason](self, "dialogPresentationPausingReason"));

    if (v19)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFBannerManager.m"), 1235, CFSTR("Dialog presentation isn't paused, but there is a pausing reason"));

    }
    v20 = sub_100017BF8();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "-[WFBannerManager queue_pauseDialogPresentationForDuration:withReason:]";
      v33 = 2048;
      v34 = v11;
      v35 = 2112;
      v36 = v8;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s Pausing dialog presentation for %.2f seconds for '%@'", buf, 0x20u);
    }

    -[WFBannerManager setDialogPresentationResumingReason:](self, "setDialogPresentationResumingReason:", 0);
    v22 = objc_msgSend(v8, "copy");
    -[WFBannerManager setDialogPresentationPausingReason:](self, "setDialogPresentationPausingReason:", v22);

    -[WFBannerManager setDialogPresentationPaused:](self, "setDialogPresentationPaused:", 1);
    objc_initWeak((id *)buf, self);
    v23 = objc_alloc((Class)WFDispatchSourceTimer);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerManager queue](self, "queue"));
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_1000197F0;
    v30[3] = &unk_100034F38;
    objc_copyWeak(v31, (id *)buf);
    v31[1] = v11;
    v25 = objc_msgSend(v23, "initWithInterval:queue:handler:", v24, v30, *(double *)&v11);

    objc_msgSend(v25, "setPreventSuspension:", 1);
    objc_msgSend(v25, "start");
    -[WFBannerManager setPauseTimer:](self, "setPauseTimer:", v25);

    objc_destroyWeak(v31);
    objc_destroyWeak((id *)buf);
    v26 = 0;
  }

  return v26;
}

- (id)queue_resumeDialogPresentationWithReason:(id)a3 onRequestFromHost:(BOOL)a4
{
  __CFString *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  __CFString *v12;
  id v13;
  void *v14;
  __CFString *v15;
  id v16;
  uint64_t v17;
  void *v18;
  __CFString *v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  _BYTE buf[12];
  __int16 v29;
  __CFString *v30;
  __int16 v31;
  __CFString *v32;
  NSErrorUserInfoKey v33;

  v6 = (__CFString *)a3;
  v7 = objc_claimAutoreleasedReturnValue(-[WFBannerManager queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  if (-[WFBannerManager isDialogPresentationPaused](self, "isDialogPresentationPaused"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerManager pauseTimer](self, "pauseTimer"));

    if (!v8)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFBannerManager.m"), 1264, CFSTR("Dialog presentation is paused, but there is no pause timer"));

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerManager dialogPresentationResumingReason](self, "dialogPresentationResumingReason"));

    if (v9)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFBannerManager.m"), 1265, CFSTR("Dialog presentation is paused, but there is a resuming reason"));

    }
    v10 = sub_100017BF8();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue(-[WFBannerManager dialogPresentationPausingReason](self, "dialogPresentationPausingReason"));
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "-[WFBannerManager queue_resumeDialogPresentationWithReason:onRequestFromHost:]";
      v29 = 2112;
      v30 = v12;
      v31 = 2112;
      v32 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s Resuming dialog presentation (paused for '%@') for '%@'", buf, 0x20u);

    }
    v13 = -[__CFString copy](v6, "copy");
    -[WFBannerManager setDialogPresentationResumingReason:](self, "setDialogPresentationResumingReason:", v13);

    -[WFBannerManager setDialogPresentationPausingReason:](self, "setDialogPresentationPausingReason:", 0);
    -[WFBannerManager setDialogPresentationPaused:](self, "setDialogPresentationPaused:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerManager pauseTimer](self, "pauseTimer"));
    objc_msgSend(v14, "cancel");

    -[WFBannerManager setPauseTimer:](self, "setPauseTimer:", 0);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("we just resumed dialog presentation for '%@'"), v6));
    -[WFBannerManager queue_updateStateWithReason:](self, "queue_updateStateWithReason:", v15);
    v16 = 0;
  }
  else
  {
    v17 = objc_claimAutoreleasedReturnValue(-[WFBannerManager dialogPresentationResumingReason](self, "dialogPresentationResumingReason"));
    v18 = (void *)v17;
    v19 = CFSTR("never paused");
    if (v17)
      v19 = (__CFString *)v17;
    v15 = v19;

    v20 = sub_100017BF8();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "-[WFBannerManager queue_resumeDialogPresentationWithReason:onRequestFromHost:]";
      v29 = 2112;
      v30 = v6;
      v31 = 2112;
      v32 = v15;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s Wanted to resume dialog presentation for '%@', but it was already resumed for '%@'", buf, 0x20u);
    }

    v22 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Dialog presentation was resumed for '%@'"), v15));
    v23 = (void *)v22;
    if (v22)
    {
      v33 = NSLocalizedDescriptionKey;
      *(_QWORD *)buf = v22;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", buf, &v33, 1));
    }
    else
    {
      v24 = 0;
    }
    v16 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.shortcuts.bannermanager"), 2, v24);

  }
  return v16;
}

- (void)handleSingleStepHomeScreenDialogRequest:(id)a3 runningContext:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;

  v8 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100019068;
  v12[3] = &unk_100034CA8;
  v12[4] = self;
  v13 = a4;
  v14 = v8;
  v15 = a5;
  v9 = v15;
  v10 = v8;
  v11 = v13;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);

}

- (void)queue_resetWithReason:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;

  v4 = a3;
  v5 = sub_100017BF8();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315394;
    v11 = "-[WFBannerManager queue_resetWithReason:]";
    v12 = 2112;
    v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Clearing ALL state because %@", (uint8_t *)&v10, 0x16u);
  }

  v7 = objc_claimAutoreleasedReturnValue(-[WFBannerManager queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerManager pendingRequests](self, "pendingRequests"));
  objc_msgSend(v8, "removeAllObjects");

  -[WFBannerManager setInflightRequest:](self, "setInflightRequest:", 0);
  -[WFBannerManager setPresentedBanner:](self, "setPresentedBanner:", 0);
  -[WFBannerManager setActionUserInterfaceListener:](self, "setActionUserInterfaceListener:", 0);
  -[WFBannerManager setRunningContextWaitingForFollowUpRequest:](self, "setRunningContextWaitingForFollowUpRequest:", 0);
  -[WFBannerManager setBannerPresentationCompletion:](self, "setBannerPresentationCompletion:", 0);
  -[WFBannerManager setDialogRequestCompletionHandler:](self, "setDialogRequestCompletionHandler:", 0);
  -[WFBannerManager setPresentedPersistentRunningContext:](self, "setPresentedPersistentRunningContext:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerManager runningPersistentWorkflows](self, "runningPersistentWorkflows"));
  objc_msgSend(v9, "removeAllObjects");

  -[WFBannerManager setShouldObserveDisplayLayout:](self, "setShouldObserveDisplayLayout:", 0);
}

- (void)revokeAllPresentablesWithReason:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerManager bannerSource](self, "bannerSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerManager dismissalReasonWithReason:](self, "dismissalReasonWithReason:", v4));

  v7 = objc_msgSend(v5, "revokeAllPresentablesWithReason:userInfo:error:", v6, &__NSDictionary0__struct, 0);
  -[WFBannerManager setPresentedBanner:](self, "setPresentedBanner:", 0);
}

- (void)cancelAllPendingRequestsForSystemDismiss
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[WFBannerManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018EE0;
  block[3] = &unk_100034BE8;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)dialogViewController:(id)a3 didFinishWithResponse:(id)a4 waitForFollowUpRequest:(BOOL)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  WFBannerManager *v16;
  BOOL v17;

  v8 = a3;
  v9 = a4;
  v10 = objc_claimAutoreleasedReturnValue(-[WFBannerManager queue](self, "queue"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100018710;
  v13[3] = &unk_100035070;
  v14 = v8;
  v15 = v9;
  v17 = a5;
  v16 = self;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

- (id)viewControllerForPresentingActionUserInterface:(id)a3
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerManager presentedBanner](self, "presentedBanner", a3));
  if (v4)
  {
    v5 = objc_opt_class(UIViewController, v3);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
      v6 = v4;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  return v7;
}

- (id)presentationAnchorForActionUserInterface:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerManager viewControllerForPresentingActionUserInterface:](self, "viewControllerForPresentingActionUserInterface:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));

  return v5;
}

- (void)actionUserInterface:(id)a3 showViewControllerInPlatter:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;

  v6 = a4;
  v7 = a3;
  v16 = objc_alloc_init((Class)WFCompactPlatterViewController);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "platterView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "attribution"));

  objc_msgSend(v8, "setAttribution:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "platterView"));
  objc_msgSend(v10, "applyMaterialViewStyling");

  objc_msgSend(v16, "setContentViewController:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerManager presentedBanner](self, "presentedBanner"));
  if (v12)
  {
    v13 = objc_opt_class(UIViewController, v11);
    if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
      v14 = v12;
    else
      v14 = 0;
  }
  else
  {
    v14 = 0;
  }
  v15 = v14;

  objc_msgSend(v15, "presentViewController:animated:completion:", v16, 1, 0);
}

- (void)dismissPlatterForActionUserInterface:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD block[4];
  id v16;
  WFBannerManager *v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "viewControllerForPresenting"));

  if (v8)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100018584;
    block[3] = &unk_100034CD0;
    v16 = v6;
    v17 = self;
    v18 = v7;
    v9 = v7;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    v10 = v16;
  }
  else
  {
    v11 = objc_claimAutoreleasedReturnValue(-[WFBannerManager queue](self, "queue"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100018610;
    v13[3] = &unk_100034C80;
    v13[4] = self;
    v14 = v7;
    v12 = v7;
    dispatch_async(v11, v13);

    v10 = v14;
  }

}

- (void)bannerViewController:(id)a3 didPresentBanner:(id)a4
{
  NSObject *v5;
  _QWORD block[5];

  v5 = objc_claimAutoreleasedReturnValue(-[WFBannerManager queue](self, "queue", a3, a4));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001851C;
  block[3] = &unk_100034BE8;
  block[4] = self;
  dispatch_async(v5, block);

}

- (void)bannerViewController:(id)a3 willDismissWithReason:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  WFBannerManager *v14;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[WFBannerManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018334;
  block[3] = &unk_100034C30;
  v12 = v7;
  v13 = v6;
  v14 = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

- (void)bannerViewControllerHomeGestureDidPassThreshold:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  WFBannerManager *v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000181B0;
  v5[3] = &unk_100034BC0;
  v6 = a3;
  v7 = self;
  v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

}

- (void)bannerViewControllerActionUserInterfaceNeedsDismissal:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001815C;
  block[3] = &unk_100034BE8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)bannerViewControllerRequestedTapDismissal:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  WFBannerManager *v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100017FD8;
  v5[3] = &unk_100034BC0;
  v6 = a3;
  v7 = self;
  v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

}

- (void)statusViewControllerDidTransitionFromVisibleToCustomLayout:(id)a3
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  const char *v15;

  v5 = a3;
  if (v5)
  {
    v6 = objc_opt_class(WFSingleStepHomeScreenCompletionStatusViewController, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v7 = sub_100017BF8();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 136315138;
        v15 = "-[WFBannerManager statusViewControllerDidTransitionFromVisibleToCustomLayout:]";
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Single step home screen island expanded to custom", (uint8_t *)&v14, 0xCu);
      }

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerManager singleStepHomeScreenRevokeTimers](self, "singleStepHomeScreenRevokeTimers"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "associatedRunningContext"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v10));

      if (v11)
      {
        objc_msgSend(v11, "invalidate");
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerManager singleStepHomeScreenRevokeTimers](self, "singleStepHomeScreenRevokeTimers"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "associatedRunningContext"));
        objc_msgSend(v12, "removeObjectForKey:", v13);

      }
    }
  }

}

- (void)statusViewControllerDidCollapseFromCustomLayout:(id)a3
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  WFBannerManager *v17;
  uint8_t buf[4];
  const char *v19;

  v5 = a3;
  if (v5)
  {
    v6 = objc_opt_class(WFSingleStepHomeScreenCompletionStatusViewController, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v7 = sub_100017BF8();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v19 = "-[WFBannerManager statusViewControllerDidCollapseFromCustomLayout:]";
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Single step home screen island collapsed from custom", buf, 0xCu);
      }

      v12 = _NSConcreteStackBlock;
      v13 = 3221225472;
      v14 = sub_100017EDC;
      v15 = &unk_1000350F8;
      v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "associatedRunningContext"));
      v17 = self;
      v9 = v16;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v12, 1.0));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerManager singleStepHomeScreenRevokeTimers](self, "singleStepHomeScreenRevokeTimers", v12, v13, v14, v15));
      objc_msgSend(v11, "setObject:forKey:", v10, v9);

    }
  }

}

- (id)configuredDisplayLayoutMonitor
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FBSDisplayLayoutMonitorConfiguration configurationForDefaultMainDisplayMonitor](FBSDisplayLayoutMonitorConfiguration, "configurationForDefaultMainDisplayMonitor"));
  objc_msgSend(v3, "setNeedsUserInteractivePriority:", 1);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100017C6C;
  v6[3] = &unk_100035120;
  v6[4] = self;
  objc_msgSend(v3, "setTransitionHandler:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FBSDisplayLayoutMonitor monitorWithConfiguration:](FBSDisplayLayoutMonitor, "monitorWithConfiguration:", v3));

  return v4;
}

- (BOOL)shouldUpdateStateBasedOnLayout:(id)a3
{
  void *v4;
  id v5;
  id v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  void *i;
  void *v11;
  unsigned __int8 v12;
  id v13;
  NSObject *v14;
  unsigned int v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  unsigned int v26;
  _BYTE v27[128];

  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "elements", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v18;
    v9 = FBSDisplayLayoutElementLockScreenIdentifier;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v4);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i), "identifier"));
        v12 = objc_msgSend(v11, "isEqualToString:", v9);

        v7 |= v12;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  v13 = sub_100017BF8();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = -[WFBannerManager screenOn](self, "screenOn");
    *(_DWORD *)buf = 136315650;
    v22 = "-[WFBannerManager shouldUpdateStateBasedOnLayout:]";
    v23 = 1024;
    v24 = v7 & 1;
    v25 = 1024;
    v26 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s layoutContainsLock: %i, screenOn: %i", buf, 0x18u);
  }

  if ((v7 & 1) != 0)
    return 0;
  else
    return -[WFBannerManager screenOn](self, "screenOn");
}

- (void)beginObservingScreenOnState
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[WFBannerManager screenOnObserver](self, "screenOnObserver"));
  objc_msgSend(v2, "start");

}

- (void)stopObservingScreenOnState
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[WFBannerManager screenOnObserver](self, "screenOnObserver"));
  objc_msgSend(v2, "stop");

}

- (BOOL)screenOn
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  char v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  unsigned __int8 v13;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  _BYTE v24[128];

  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerManager displayMonitor](self, "displayMonitor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "connectedIdentities"));

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "type") == (id)8)
        {
          v10 = sub_100017BF8();
          v11 = objc_claimAutoreleasedReturnValue(v10);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v21 = "-[WFBannerManager screenOn]";
            v22 = 2112;
            v23 = v9;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s Active continuity display found: %@", buf, 0x16u);
          }

          v6 = 1;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerManager screenOnObserver](self, "screenOnObserver"));
  v13 = objc_msgSend(v12, "screenOn");

  return (v13 | v6) & 1;
}

- (BOOL)presentsApertureStatus
{
  void *v2;
  unsigned __int8 v3;
  void *v5;
  unsigned __int8 v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[WFBannerPrototypeSettings sharedSettings](WFBannerPrototypeSettings, "sharedSettings"));
  v3 = objc_msgSend(v2, "testStatusBanners");

  if ((v3 & 1) != 0)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[WFDevice currentDevice](WFDevice, "currentDevice"));
  v6 = objc_msgSend(v5, "hasSystemAperture");

  return v6;
}

- (BOOL)presentableIsIslandPresentable:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  char isKindOfClass;

  v3 = a3;
  v5 = objc_opt_class(WFApertureStatusViewController, v4);
  isKindOfClass = objc_opt_isKindOfClass(v3, v5);

  return isKindOfClass & 1;
}

- (BOOL)queuedDialogIsActionUIRequest:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char isKindOfClass;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "request"));
  v5 = objc_opt_class(WFShowActionInterfaceDialogRequest, v4);
  isKindOfClass = objc_opt_isKindOfClass(v3, v5);

  return isKindOfClass & 1;
}

- (id)presentedPlatter
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerManager presentedBanner](self, "presentedBanner"));
  if (v4 && (v5 = objc_opt_class(WFBannerViewController, v3), (objc_opt_isKindOfClass(v4, v5) & 1) != 0))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "embeddedPlatter"));

  }
  else
  {

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerManager presentedBanner](self, "presentedBanner"));
  }
  return v6;
}

- (id)dismissalReasonWithReason:(id)a3
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), CFSTR("WFBannerManager: "), a3);
}

- (BOOL)runningContextIsInPersistentMode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerManager runningPersistentWorkflows](self, "runningPersistentWorkflows"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allKeys"));
  v7 = objc_msgSend(v6, "containsObject:", v4);

  return v7;
}

- (BOOL)presentedBannerIsStatusForRunningContext:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;

  v4 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerManager presentedPlatter](self, "presentedPlatter"));
  if (v6)
  {
    v7 = objc_opt_class(WFCompactStatusViewController, v5);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
      v8 = v6;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "associatedRunningContext"));
  LOBYTE(v9) = objc_msgSend(v10, "isEqual:", v4);

  return (char)v9;
}

- (CGSize)preferredPresentationSize
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerManager bannerSource](self, "bannerSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "layoutDescriptionWithError:", 0));

  objc_msgSend(v3, "presentationSize");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)preferredContainerSize
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerManager bannerSource](self, "bannerSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "layoutDescriptionWithError:", 0));

  objc_msgSend(v3, "containerSize");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (NSHashTable)connectedHosts
{
  return self->_connectedHosts;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (os_unfair_lock_s)presentedBannerLock
{
  return self->_presentedBannerLock;
}

- (os_unfair_lock_s)inflightRequestLock
{
  return self->_inflightRequestLock;
}

- (WFActionUserInterfaceListener)actionUserInterfaceListener
{
  return self->_actionUserInterfaceListener;
}

- (void)setActionUserInterfaceListener:(id)a3
{
  objc_storeStrong((id *)&self->_actionUserInterfaceListener, a3);
}

- (id)dialogRequestCompletionHandler
{
  return self->_dialogRequestCompletionHandler;
}

- (void)setDialogRequestCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (WFWorkflowRunningContext)runningContextWaitingForFollowUpRequest
{
  return self->_runningContextWaitingForFollowUpRequest;
}

- (void)setRunningContextWaitingForFollowUpRequest:(id)a3
{
  objc_storeStrong((id *)&self->_runningContextWaitingForFollowUpRequest, a3);
}

- (id)bannerPresentationCompletion
{
  return self->_bannerPresentationCompletion;
}

- (void)setBannerPresentationCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (WFWorkflowRunningContext)presentedPersistentRunningContext
{
  return self->_presentedPersistentRunningContext;
}

- (void)setPresentedPersistentRunningContext:(id)a3
{
  objc_storeStrong((id *)&self->_presentedPersistentRunningContext, a3);
}

- (WFScreenOnObserver)screenOnObserver
{
  return self->_screenOnObserver;
}

- (FBSDisplayMonitor)displayMonitor
{
  return self->_displayMonitor;
}

- (FBSDisplayLayoutMonitor)layoutMonitor
{
  return self->_layoutMonitor;
}

- (BOOL)shouldObserveDisplayLayout
{
  return self->_shouldObserveDisplayLayout;
}

- (void)setShouldObserveDisplayLayout:(BOOL)a3
{
  self->_shouldObserveDisplayLayout = a3;
}

- (BOOL)isDialogPresentationPaused
{
  return self->_dialogPresentationPaused;
}

- (void)setDialogPresentationPaused:(BOOL)a3
{
  self->_dialogPresentationPaused = a3;
}

- (WFDispatchSourceTimer)pauseTimer
{
  return self->_pauseTimer;
}

- (void)setPauseTimer:(id)a3
{
  objc_storeStrong((id *)&self->_pauseTimer, a3);
}

- (NSString)dialogPresentationPausingReason
{
  return self->_dialogPresentationPausingReason;
}

- (void)setDialogPresentationPausingReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)dialogPresentationResumingReason
{
  return self->_dialogPresentationResumingReason;
}

- (void)setDialogPresentationResumingReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (UISCurrentUserInterfaceStyleValue)userInterfaceStyleValue
{
  return self->_userInterfaceStyleValue;
}

- (int64_t)currentUserInterfaceStyle
{
  return self->_currentUserInterfaceStyle;
}

- (void)setCurrentUserInterfaceStyle:(int64_t)a3
{
  self->_currentUserInterfaceStyle = a3;
}

- (NSMutableDictionary)singleStepHomeScreenRevokeTimers
{
  return self->_singleStepHomeScreenRevokeTimers;
}

- (void)setSingleStepHomeScreenRevokeTimers:(id)a3
{
  objc_storeStrong((id *)&self->_singleStepHomeScreenRevokeTimers, a3);
}

- (WFDispatchSourceTimer)cleanUpTimer
{
  return self->_cleanUpTimer;
}

- (void)setCleanUpTimer:(id)a3
{
  objc_storeStrong((id *)&self->_cleanUpTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cleanUpTimer, 0);
  objc_storeStrong((id *)&self->_singleStepHomeScreenRevokeTimers, 0);
  objc_storeStrong((id *)&self->_userInterfaceStyleValue, 0);
  objc_storeStrong((id *)&self->_dialogPresentationResumingReason, 0);
  objc_storeStrong((id *)&self->_dialogPresentationPausingReason, 0);
  objc_storeStrong((id *)&self->_pauseTimer, 0);
  objc_storeStrong((id *)&self->_layoutMonitor, 0);
  objc_storeStrong((id *)&self->_displayMonitor, 0);
  objc_storeStrong((id *)&self->_screenOnObserver, 0);
  objc_storeStrong((id *)&self->_presentedPersistentRunningContext, 0);
  objc_storeStrong(&self->_bannerPresentationCompletion, 0);
  objc_storeStrong((id *)&self->_runningContextWaitingForFollowUpRequest, 0);
  objc_storeStrong(&self->_dialogRequestCompletionHandler, 0);
  objc_storeStrong((id *)&self->_actionUserInterfaceListener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connectedHosts, 0);
  objc_storeStrong((id *)&self->_runningPersistentWorkflows, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_inflightRequest, 0);
  objc_storeStrong((id *)&self->_presentedBanner, 0);
}

@end
