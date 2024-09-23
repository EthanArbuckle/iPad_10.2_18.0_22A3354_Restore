@implementation AVCustomRoutingController

- (AVCustomRoutingController)init
{
  AVCustomRoutingController *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVCustomRoutingController;
  v2 = -[AVCustomRoutingController init](&v4, sel_init);
  if (v2)
  {
    v2->_pendingEvents = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCE30]);
    v2->_authorizedRoutes = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCE30]);
    v2->_routeEventRecords = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCE30]);
    v2->_customActionItems = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCE30]);
    v2->_knownRouteIPs = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCE30]);
    v2->_session = (DADaemonSession *)objc_alloc_init((Class)getDADaemonSessionClass());
    -[AVCustomRoutingController _startSession](v2, "_startSession");
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:", self);
  -[AVCustomRoutingController _stopSession](self, "_stopSession");

  self->_pendingEvents = 0;
  self->_authorizedRoutes = 0;

  self->_routeEventRecords = 0;
  self->_customActionItems = 0;

  self->_knownRouteIPs = 0;
  -[AVCustomRoutingController setDelegate:](self, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AVCustomRoutingController;
  -[AVCustomRoutingController dealloc](&v3, sel_dealloc);
}

- (void)setKnownRouteIPs:(NSArray *)knownRouteIPs
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  objc_class *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  uint64_t v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (-[DADaemonSession appIsUsingDeviceAccess](-[AVCustomRoutingController session](self, "session"), "appIsUsingDeviceAccess"))
  {

    self->_knownRouteIPs = knownRouteIPs;
    v5 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](knownRouteIPs, "countByEnumeratingWithState:objects:count:", &v12, v23, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(knownRouteIPs);
          v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          v17 = 0;
          v18 = &v17;
          v19 = 0x3052000000;
          v20 = __Block_byref_object_copy_;
          v21 = __Block_byref_object_dispose_;
          v10 = (objc_class *)getDAPartialIPClass_softClass;
          v22 = getDAPartialIPClass_softClass;
          if (!getDAPartialIPClass_softClass)
          {
            v16[0] = MEMORY[0x24BDAC760];
            v16[1] = 3221225472;
            v16[2] = __getDAPartialIPClass_block_invoke;
            v16[3] = &unk_24C3EFCB8;
            v16[4] = &v17;
            __getDAPartialIPClass_block_invoke((uint64_t)v16);
            v10 = (objc_class *)v18[5];
          }
          _Block_object_dispose(&v17, 8);
          v11 = (void *)objc_msgSend([v10 alloc], "initWithAddress:mask:", objc_msgSend(v9, "address"), objc_msgSend(v9, "mask"));
          objc_msgSend(v5, "addObject:", v11);

        }
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](knownRouteIPs, "countByEnumeratingWithState:objects:count:", &v12, v23, 16);
      }
      while (v6);
    }
    objc_msgSend((id)getDADaemonSessionClass(), "setPartialIPsForAppBundleID:partialIPs:error:", -[DADaemonSession bundleID](-[AVCustomRoutingController session](self, "session"), "bundleID"), v5, 0);
  }
}

- (void)setCustomActionItems:(NSArray *)customActionItems
{
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (-[DADaemonSession appIsUsingDeviceAccess](-[AVCustomRoutingController session](self, "session"), "appIsUsingDeviceAccess"))
  {

    self->_customActionItems = customActionItems;
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("AVCustomRoutingControllerCustomActionItemsDidChangeNotification"), self);
  }
  else
  {
    v5 = _AVRoutingLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315138;
      v7 = "-[AVCustomRoutingController setCustomActionItems:]";
      _os_log_impl(&dword_20AEB2000, v5, OS_LOG_TYPE_DEFAULT, "%s Ignoring custom action items. Only support when app provides discovery extension.", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)handleCustomActionItemSelected:(id)a3
{
  -[AVCustomRoutingController delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(-[AVCustomRoutingController delegate](self, "delegate"), "customRoutingController:didSelectItem:", self, a3);
}

- (void)invalidateAuthorizationForRoute:(AVCustomDeviceRoute *)route
{
  NSObject *v5;
  AVCustomRoutingEvent *v6;
  int v7;
  const char *v8;
  __int16 v9;
  AVCustomDeviceRoute *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = _AVRoutingLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[AVCustomRoutingController invalidateAuthorizationForRoute:]";
    v9 = 2112;
    v10 = route;
    _os_log_impl(&dword_20AEB2000, v5, OS_LOG_TYPE_DEFAULT, "%s invalidateAuthorizationForRoute: %@", (uint8_t *)&v7, 0x16u);
  }
  v6 = objc_alloc_init(AVCustomRoutingEvent);
  -[AVCustomRoutingEvent setReason:](v6, "setReason:", 1);
  -[AVCustomRoutingEvent setRoute:](v6, "setRoute:", route);
  -[AVCustomRoutingEvent setSucceeded:](v6, "setSucceeded:", 1);
  if (-[AVCustomRoutingController isSessionSuspended](self, "isSessionSuspended"))
    -[AVCustomRoutingController _storeRecordForEvent:](self, "_storeRecordForEvent:", v6);
  else
    -[AVCustomRoutingController _updateSessionForEvent:](self, "_updateSessionForEvent:", v6);

}

- (void)setActive:(BOOL)active forRoute:(AVCustomDeviceRoute *)route
{
  _BOOL8 v5;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  AVCustomDeviceRoute *v11;
  uint64_t v12;

  v5 = active;
  v12 = *MEMORY[0x24BDAC8D0];
  if (-[NSArray containsObject:](-[AVCustomRoutingController authorizedRoutes](self, "authorizedRoutes"), "containsObject:", route))
  {
    -[AVCustomRoutingController _setActive:forRoute:](self, "_setActive:forRoute:", v5, route);
    -[AVCustomRoutingController _updateSessionStateToMatchRoute:](self, "_updateSessionStateToMatchRoute:", route);
  }
  else
  {
    v7 = _AVRoutingLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315394;
      v9 = "-[AVCustomRoutingController setActive:forRoute:]";
      v10 = 2112;
      v11 = route;
      _os_log_impl(&dword_20AEB2000, v7, OS_LOG_TYPE_DEFAULT, "%s Route: %@ not authorized. Ignoring setActive:forRoute:", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (BOOL)isRouteActive:(AVCustomDeviceRoute *)route
{
  return -[AVCustomDeviceRoute isActive](route, "isActive");
}

- (DADaemonSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  -[DADaemonSession invalidate](self->_session, "invalidate");

  self->_session = (DADaemonSession *)a3;
  if (a3)
    -[AVCustomRoutingController _startSession](self, "_startSession");
}

- (void)_startSession
{
  uint64_t v3;
  id v4;
  id location;

  -[DADaemonSession setBundleID:](-[AVCustomRoutingController session](self, "session"), "setBundleID:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle"), "bundleIdentifier"));
  objc_initWeak(&location, self);
  v3 = MEMORY[0x24BDAC760];
  objc_copyWeak(&v4, &location);
  -[DADaemonSession setEventHandler:](-[AVCustomRoutingController session](self, "session", v3, 3221225472, __42__AVCustomRoutingController__startSession__block_invoke, &unk_24C3EFBF0), "setEventHandler:", &v3);
  -[DADaemonSession activate](-[AVCustomRoutingController session](self, "session"), "activate");
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __42__AVCustomRoutingController__startSession__block_invoke(uint64_t a1, void *a2)
{
  id Weak;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  NSObject *v17;
  uint32_t v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  AVCustomDeviceRoute *v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  NSObject *v32;
  AVCustomDeviceRoute *v33;
  NSObject *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[5];
  _BYTE v44[128];
  uint8_t v45[128];
  _BYTE buf[24];
  void (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  Weak = objc_loadWeak((id *)(a1 + 32));
  if (!Weak)
    return;
  v4 = Weak;
  v5 = objc_msgSend(a2, "eventType");
  if (v5 <= 30)
  {
    if (v5 <= 19)
    {
      if (v5)
      {
        if (v5 == 10)
        {
          v6 = _AVRoutingLog();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            *(_QWORD *)&buf[4] = "-[AVCustomRoutingController _startSession]_block_invoke";
            _os_log_impl(&dword_20AEB2000, v6, OS_LOG_TYPE_DEFAULT, "%s DAEventTypeActivated", buf, 0xCu);
          }
          objc_msgSend(v4, "_resumeSessionUpdates");
          return;
        }
        goto LABEL_46;
      }
      v7 = _AVRoutingLog();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        return;
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[AVCustomRoutingController _startSession]_block_invoke";
      v8 = "%s DAEventTypeUnknown";
      goto LABEL_43;
    }
    if (v5 == 20)
    {
      v7 = _AVRoutingLog();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        return;
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[AVCustomRoutingController _startSession]_block_invoke";
      v8 = "%s DAEventTypeInvalidated";
      goto LABEL_43;
    }
    if (v5 == 30)
    {
      v7 = _AVRoutingLog();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        return;
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[AVCustomRoutingController _startSession]_block_invoke";
      v8 = "%s DAEventTypeSessionStarted";
LABEL_43:
      v17 = v7;
      v18 = 12;
      goto LABEL_44;
    }
LABEL_46:
    if (objc_msgSend(a2, "eventType") == 60)
    {
      v19 = _AVRoutingLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = "-[AVCustomRoutingController _startSession]_block_invoke";
        _os_log_impl(&dword_20AEB2000, v19, OS_LOG_TYPE_DEFAULT, "%s DAEventTypeXPCInterrupted", buf, 0xCu);
      }
      objc_msgSend(v4, "_suspendSessionUpdates");
    }
    return;
  }
  if (v5 > 40)
  {
    if (v5 == 41)
    {
      v7 = _AVRoutingLog();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        return;
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[AVCustomRoutingController _startSession]_block_invoke";
      v8 = "%s DAEventTypeDeviceLost";
      goto LABEL_43;
    }
    if (v5 != 42)
      goto LABEL_46;
  }
  else
  {
    if (v5 == 31)
    {
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v13 = (void *)objc_msgSend(v4, "authorizedRoutes");
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
      if (v14)
      {
        v15 = *(_QWORD *)v40;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v40 != v15)
              objc_enumerationMutation(v13);
            objc_msgSend(v4, "_informClientOfEventReason:forRoute:", 1, *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i));
          }
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
        }
        while (v14);
      }
      return;
    }
    if (v5 != 40)
      goto LABEL_46;
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3052000000;
  v47 = __Block_byref_object_copy_;
  v48 = __Block_byref_object_dispose_;
  v49 = getDAEventDeviceClass_softClass;
  if (!getDAEventDeviceClass_softClass)
  {
    v43[0] = MEMORY[0x24BDAC760];
    v43[1] = 3221225472;
    v43[2] = __getDAEventDeviceClass_block_invoke;
    v43[3] = &unk_24C3EFCB8;
    v43[4] = buf;
    __getDAEventDeviceClass_block_invoke((uint64_t)v43);
  }
  _Block_object_dispose(buf, 8);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return;
  v9 = (void *)objc_msgSend(a2, "device");
  v10 = _AVRoutingLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[AVCustomRoutingController _startSession]_block_invoke";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v9;
    _os_log_impl(&dword_20AEB2000, v10, OS_LOG_TYPE_DEFAULT, "%s DAEventTypeDeviceChanged/DAEventTypeDeviceFound for device: %@", buf, 0x16u);
  }
  v11 = objc_msgSend(v4, "_routeForDADevice:", v9);
  if (objc_msgSend(v9, "state") == 10)
  {
    if (v11)
    {
      v12 = _AVRoutingLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[AVCustomRoutingController _startSession]_block_invoke";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v11;
        _os_log_impl(&dword_20AEB2000, v12, OS_LOG_TYPE_DEFAULT, "%s DAEventTypeDeviceChanged --> DADeviceStateActivating: Route %@ authorized. Firing AVCustomRoutingEventReasonReactivate.", buf, 0x16u);
      }
      objc_msgSend(v4, "_informClientOfEventReason:forRoute:", 2, v11);
    }
    else
    {
      v22 = objc_alloc_init(AVCustomDeviceRoute);
      -[AVCustomDeviceRoute setDevice:](v22, "setDevice:", v9);
      v23 = _AVRoutingLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[AVCustomRoutingController _startSession]_block_invoke";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v22;
        _os_log_impl(&dword_20AEB2000, v23, OS_LOG_TYPE_DEFAULT, "%s DAEventTypeDeviceChanged --> DADeviceStateActivating: Route %@ not authorized. Firing AVCustomRoutingEventReasonActivate.", buf, 0x16u);
      }
      objc_msgSend(v4, "_informClientOfEventReason:forRoute:", 0, v22);

    }
    return;
  }
  if (objc_msgSend(v9, "state") != 30)
  {
    if (objc_msgSend(v9, "state") != 25)
    {
      v24 = _AVRoutingLog();
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        return;
      v25 = soft_DADeviceStateToString(objc_msgSend(v9, "state"));
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "-[AVCustomRoutingController _startSession]_block_invoke";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v11;
      *(_WORD *)&buf[22] = 2112;
      v47 = (void (*)(uint64_t, uint64_t))v25;
      v8 = "%s DAEventTypeDeviceFound / DAEventTypeDeviceChanged for route %@ but state = %@. Ignoring.";
      v17 = v24;
      v18 = 32;
LABEL_44:
      _os_log_impl(&dword_20AEB2000, v17, OS_LOG_TYPE_DEFAULT, v8, buf, v18);
      return;
    }
    if (!v11)
    {
      v33 = objc_alloc_init(AVCustomDeviceRoute);
      -[AVCustomDeviceRoute setDevice:](v33, "setDevice:", v9);
      v34 = _AVRoutingLog();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[AVCustomRoutingController _startSession]_block_invoke";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v33;
        _os_log_impl(&dword_20AEB2000, v34, OS_LOG_TYPE_DEFAULT, "%s DAEventTypeDeviceChanged --> DADeviceStateAuthorized: Route %@ not authorized. Adding to authorized routes.", buf, 0x16u);
      }
      objc_msgSend(v4, "_addAuthorizedRoute:", v33);

      return;
    }
    v21 = _AVRoutingLog();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      return;
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[AVCustomRoutingController _startSession]_block_invoke";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v11;
    v8 = "%s DAEventTypeDeviceChanged --> DADeviceStateAuthorized: Route %@ authorized. Ignoring.";
LABEL_79:
    v17 = v21;
    v18 = 22;
    goto LABEL_44;
  }
  if (v11)
  {
    v20 = _AVRoutingLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[AVCustomRoutingController _startSession]_block_invoke";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v11;
      _os_log_impl(&dword_20AEB2000, v20, OS_LOG_TYPE_DEFAULT, "%s DAEventTypeDeviceChanged --> DADeviceStateInvalidating: Route %@ authorized. Firing AVCustomRoutingEventReasonDeactivate.", buf, 0x16u);
    }
    objc_msgSend(v4, "_informClientOfEventReason:forRoute:", 1, v11);
    return;
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v26 = (void *)objc_msgSend(v4, "pendingEvents", 0);
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
  if (!v27)
  {
LABEL_77:
    v21 = _AVRoutingLog();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      return;
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[AVCustomRoutingController _startSession]_block_invoke";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = 0;
    v8 = "%s DAEventTypeDeviceChanged --> DADeviceStateInvalidating: Route %@ not authorized and not pending events. Ignoring.";
    goto LABEL_79;
  }
  v28 = *(_QWORD *)v36;
LABEL_66:
  v29 = 0;
  while (1)
  {
    if (*(_QWORD *)v36 != v28)
      objc_enumerationMutation(v26);
    v30 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v29);
    if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v30, "route"), "device"), "identifier"), "isEqualToString:", objc_msgSend(v9, "identifier")) & 1) != 0)break;
    if (v27 == ++v29)
    {
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
      if (v27)
        goto LABEL_66;
      goto LABEL_77;
    }
  }
  if (!v30)
    goto LABEL_77;
  v31 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", objc_msgSend(v4, "pendingEvents"));
  objc_msgSend(v31, "removeObject:", v30);
  objc_msgSend(v4, "_setPendingEvents:", v31);
  v32 = _AVRoutingLog();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[AVCustomRoutingController _startSession]_block_invoke";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = 0;
    _os_log_impl(&dword_20AEB2000, v32, OS_LOG_TYPE_DEFAULT, "%s DAEventTypeDeviceChanged --> DADeviceStateInvalidating: Route %@ not authorized but activation event pending. Firing AVCustomRoutingEventReasonDeactivate.", buf, 0x16u);
  }
  objc_msgSend(v4, "_informClientOfEventReason:forRoute:", 1, objc_msgSend(v30, "route"));
}

- (void)_stopSession
{
  -[DADaemonSession invalidate](self->_session, "invalidate");

  self->_session = 0;
}

- (void)_addAuthorizedRoute:(id)a3
{
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (-[NSArray containsObject:](-[AVCustomRoutingController authorizedRoutes](self, "authorizedRoutes"), "containsObject:", a3))
  {
    v5 = _AVRoutingLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315394;
      v7 = "-[AVCustomRoutingController _addAuthorizedRoute:]";
      v8 = 2112;
      v9 = a3;
      _os_log_impl(&dword_20AEB2000, v5, OS_LOG_TYPE_DEFAULT, "%s AVVSRC.authorizedRoutes already contains route: %@. Ignoring.", (uint8_t *)&v6, 0x16u);
    }
  }
  else
  {
    -[AVCustomRoutingController _setAuthorizedRoutes:](self, "_setAuthorizedRoutes:", -[NSArray arrayByAddingObject:](-[AVCustomRoutingController authorizedRoutes](self, "authorizedRoutes"), "arrayByAddingObject:", a3));
  }
}

- (void)_removeAuthorizedRoute:(id)a3
{
  void *v5;

  v5 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", -[AVCustomRoutingController authorizedRoutes](self, "authorizedRoutes"));
  objc_msgSend(v5, "removeObject:", a3);
  -[AVCustomRoutingController _setAuthorizedRoutes:](self, "_setAuthorizedRoutes:", v5);
}

- (void)_setAuthorizedRoutes:(id)a3
{
  NSObject *v5;
  NSArray *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (!-[NSArray isEqualToArray:](-[AVCustomRoutingController authorizedRoutes](self, "authorizedRoutes"), "isEqualToArray:", a3))
  {
    v5 = _AVRoutingLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315394;
      v9 = "-[AVCustomRoutingController _setAuthorizedRoutes:]";
      v10 = 2112;
      v11 = a3;
      _os_log_impl(&dword_20AEB2000, v5, OS_LOG_TYPE_DEFAULT, "%s AVVSRC.authorizedRoutes = %@", (uint8_t *)&v8, 0x16u);
    }

    v6 = (NSArray *)a3;
    if (!v6)
      v6 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCE30]);
    self->_authorizedRoutes = v6;
    v7 = _AVRoutingLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315138;
      v9 = "-[AVCustomRoutingController _setAuthorizedRoutes:]";
      _os_log_impl(&dword_20AEB2000, v7, OS_LOG_TYPE_DEFAULT, "%s Posting AVCustomRoutingControllerAuthorizedRoutesDidChangeNotification.", (uint8_t *)&v8, 0xCu);
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("AVCustomRoutingControllerAuthorizedRoutesDidChangeNotification"), self);
  }
}

- (void)_setPendingEvents:(id)a3
{
  NSObject *v5;
  NSArray *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = _AVRoutingLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[AVCustomRoutingController _setPendingEvents:]";
    v9 = 2112;
    v10 = a3;
    _os_log_impl(&dword_20AEB2000, v5, OS_LOG_TYPE_DEFAULT, "%s AVVSRC.pendingEvents = %@", (uint8_t *)&v7, 0x16u);
  }

  v6 = (NSArray *)a3;
  if (!v6)
    v6 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCE30]);
  self->_pendingEvents = v6;
}

- (void)_informClientOfEventReason:(int64_t)a3 forRoute:(id)a4
{
  AVCustomRoutingEvent *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  AVCustomRoutingEvent *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v7 = objc_alloc_init(AVCustomRoutingEvent);
  -[AVCustomRoutingEvent setRoute:](v7, "setRoute:", a4);
  -[AVCustomRoutingEvent setReason:](v7, "setReason:", a3);
  -[AVCustomRoutingController _setPendingEvents:](self, "_setPendingEvents:", -[NSArray arrayByAddingObject:](-[AVCustomRoutingController pendingEvents](self, "pendingEvents"), "arrayByAddingObject:", v7));
  v8 = _AVRoutingLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "-[AVCustomRoutingController _informClientOfEventReason:forRoute:]";
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_20AEB2000, v8, OS_LOG_TYPE_DEFAULT, "%s Informing delegate of route event: %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  v9 = -[AVCustomRoutingController delegate](self, "delegate");
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __65__AVCustomRoutingController__informClientOfEventReason_forRoute___block_invoke;
  v10[3] = &unk_24C3EFC18;
  objc_copyWeak(&v11, (id *)buf);
  v10[4] = v7;
  objc_msgSend(v9, "customRoutingController:handleEvent:completionHandler:", self, v7, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

void __65__AVCustomRoutingController__informClientOfEventReason_forRoute___block_invoke(uint64_t a1, uint64_t a2)
{
  id Weak;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  Weak = objc_loadWeak((id *)(a1 + 40));
  if (Weak)
  {
    v5 = Weak;
    v6 = _AVRoutingLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v10 = 136315650;
      v11 = "-[AVCustomRoutingController _informClientOfEventReason:forRoute:]_block_invoke";
      v12 = 2112;
      v13 = v7;
      v14 = 1024;
      v15 = a2;
      _os_log_impl(&dword_20AEB2000, v6, OS_LOG_TYPE_DEFAULT, "%s Route event: %@ completed with success: %d", (uint8_t *)&v10, 0x1Cu);
    }
    objc_msgSend(*(id *)(a1 + 32), "setSucceeded:", a2);
    v8 = objc_msgSend(v5, "isSessionSuspended");
    v9 = *(_QWORD *)(a1 + 32);
    if (v8)
      objc_msgSend(v5, "_storeRecordForEvent:", v9);
    else
      objc_msgSend(v5, "_updateSessionForEvent:", v9);
  }

}

- (void)_updateSessionForEvent:(id)a3
{
  uint64_t v5;
  void *v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  DADaemonSession *v18;
  uint64_t v19;
  id *v20;
  NSObject *v21;
  uint64_t v22;
  DADaemonSession *v23;
  uint64_t v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[5];
  id v28;
  char v29;
  id location;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  _BYTE v34[10];
  __int16 v35;
  int v36;
  __int16 v37;
  int v38;
  __int16 v39;
  int v40;
  __int16 v41;
  int v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  objc_initWeak(&location, self);
  v5 = objc_msgSend(a3, "reason");
  v6 = (void *)objc_msgSend(a3, "route");
  v7 = objc_msgSend(a3, "succeeded");
  if (v5)
    v8 = 0;
  else
    v8 = v7;
  if (v5)
    v9 = 0;
  else
    v9 = v7 ^ 1;
  if (v5 == 1)
    v10 = v7;
  else
    v10 = 0;
  if (v5 == 1)
    v11 = v7 ^ 1;
  else
    v11 = 0;
  if (v5 == 2)
    v12 = v7;
  else
    v12 = 0;
  if (v5 == 2)
    v13 = v7 ^ 1;
  else
    v13 = 0;
  v14 = _AVRoutingLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316674;
    v32 = "-[AVCustomRoutingController _updateSessionForEvent:]";
    v33 = 1024;
    *(_DWORD *)v34 = v8;
    *(_WORD *)&v34[4] = 1024;
    *(_DWORD *)&v34[6] = v9;
    v35 = 1024;
    v36 = v10;
    v37 = 1024;
    v38 = v11;
    v39 = 1024;
    v40 = v12;
    v41 = 1024;
    v42 = v13;
    _os_log_impl(&dword_20AEB2000, v14, OS_LOG_TYPE_DEFAULT, "%s activateSucceeded: %d, activateFailed: %d, deactivateSucceeded: %d, deactivateFailed: %d, reactivateSucceeded: %d, reactivateFailed: %d", buf, 0x30u);
  }
  v15 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", -[AVCustomRoutingController pendingEvents](self, "pendingEvents"));
  objc_msgSend(v15, "removeObject:", a3);
  -[AVCustomRoutingController _setPendingEvents:](self, "_setPendingEvents:", v15);
  if ((v8 | v12) == 1)
  {
    v16 = _AVRoutingLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_msgSend(v6, "device");
      *(_DWORD *)buf = 136315394;
      v32 = "-[AVCustomRoutingController _updateSessionForEvent:]";
      v33 = 2112;
      *(_QWORD *)v34 = v17;
    }
    v18 = -[AVCustomRoutingController session](self, "session");
    v19 = objc_msgSend(v6, "device");
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __52__AVCustomRoutingController__updateSessionForEvent___block_invoke;
    v27[3] = &unk_24C3EFC40;
    v20 = &v28;
    objc_copyWeak(&v28, &location);
    v27[4] = v6;
    v29 = v12;
    -[DADaemonSession setState:device:completionHandler:](v18, "setState:device:completionHandler:", 20, v19, v27);
LABEL_29:
    objc_destroyWeak(v20);
    goto LABEL_30;
  }
  if ((v9 | v13 | v11 | v10) == 1)
  {
    -[AVCustomRoutingController _removeAuthorizedRoute:](self, "_removeAuthorizedRoute:", v6);
    -[AVCustomRoutingController _setActive:forRoute:](self, "_setActive:forRoute:", 0, v6);
    v21 = _AVRoutingLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = objc_msgSend(v6, "device");
      *(_DWORD *)buf = 136315394;
      v32 = "-[AVCustomRoutingController _updateSessionForEvent:]";
      v33 = 2112;
      *(_QWORD *)v34 = v22;
    }
    v23 = -[AVCustomRoutingController session](self, "session");
    v24 = objc_msgSend(v6, "device");
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __52__AVCustomRoutingController__updateSessionForEvent___block_invoke_17;
    v25[3] = &unk_24C3EFC68;
    v20 = &v26;
    objc_copyWeak(&v26, &location);
    v25[4] = v6;
    -[DADaemonSession setState:device:completionHandler:](v23, "setState:device:completionHandler:", 0, v24, v25);
    goto LABEL_29;
  }
LABEL_30:
  objc_destroyWeak(&location);
}

void __52__AVCustomRoutingController__updateSessionForEvent___block_invoke(uint64_t a1, uint64_t a2)
{
  id Weak;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  Weak = objc_loadWeak((id *)(a1 + 40));
  if (Weak)
  {
    v5 = Weak;
    v6 = _AVRoutingLog();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (a2)
    {
      if (v7)
      {
        v8 = objc_msgSend(*(id *)(a1 + 32), "device");
        v10 = 136315650;
        v11 = "-[AVCustomRoutingController _updateSessionForEvent:]_block_invoke";
        v12 = 2112;
        v13 = v8;
        v14 = 2112;
        v15 = a2;
      }
    }
    else
    {
      if (v7)
      {
        v9 = objc_msgSend(*(id *)(a1 + 32), "device");
        v10 = 136315394;
        v11 = "-[AVCustomRoutingController _updateSessionForEvent:]_block_invoke";
        v12 = 2112;
        v13 = v9;
      }
      if (!*(_BYTE *)(a1 + 48))
        objc_msgSend(v5, "_addAuthorizedRoute:", *(_QWORD *)(a1 + 32));
      objc_msgSend(v5, "_setActive:forRoute:", 1, *(_QWORD *)(a1 + 32));
    }
  }
}

void __52__AVCustomRoutingController__updateSessionForEvent___block_invoke_17(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (objc_loadWeak((id *)(a1 + 40)))
  {
    v4 = _AVRoutingLog();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (a2)
    {
      if (!v5)
        return;
      v6 = objc_msgSend(*(id *)(a1 + 32), "device");
      v11 = 136315650;
      v12 = "-[AVCustomRoutingController _updateSessionForEvent:]_block_invoke";
      v13 = 2112;
      v14 = v6;
      v15 = 2112;
      v16 = a2;
      v8 = v4;
      v9 = 32;
    }
    else
    {
      if (!v5)
        return;
      v10 = objc_msgSend(*(id *)(a1 + 32), "device");
      v11 = 136315394;
      v12 = "-[AVCustomRoutingController _updateSessionForEvent:]_block_invoke";
      v13 = 2112;
      v14 = v10;
      v8 = v4;
      v9 = 22;
    }
    _os_log_impl(&dword_20AEB2000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v11, v9);
  }
}

- (id)_routeForDADevice:(id)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = -[AVCustomRoutingController authorizedRoutes](self, "authorizedRoutes", 0);
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(v4);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "device"), "identifier"), "isEqualToString:", objc_msgSend(a3, "identifier")) & 1) != 0)return v9;
    if (v6 == ++v8)
    {
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (void)_updateSessionStateToMatchRoute:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  DADaemonSession *v7;
  uint64_t v8;
  _QWORD v9[6];
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (!-[AVCustomRoutingController isSessionSuspended](self, "isSessionSuspended"))
  {
    if (objc_msgSend(a3, "isActive"))
      v5 = 20;
    else
      v5 = 25;
    v6 = _AVRoutingLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v11 = "-[AVCustomRoutingController _updateSessionStateToMatchRoute:]";
      v12 = 2112;
      v13 = soft_DADeviceStateToString(v5);
      v14 = 2112;
      v15 = a3;
      _os_log_impl(&dword_20AEB2000, v6, OS_LOG_TYPE_DEFAULT, "%s Setting DA state: %@ for route: %@.", buf, 0x20u);
    }
    v7 = -[AVCustomRoutingController session](self, "session");
    v8 = objc_msgSend(a3, "device");
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __61__AVCustomRoutingController__updateSessionStateToMatchRoute___block_invoke;
    v9[3] = &unk_24C3EFC90;
    v9[4] = a3;
    v9[5] = v5;
    -[DADaemonSession setState:device:completionHandler:](v7, "setState:device:completionHandler:", v5, v8, v9);
  }
}

void __61__AVCustomRoutingController__updateSessionStateToMatchRoute___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = _AVRoutingLog();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (!v5)
      return;
    v6 = soft_DADeviceStateToString(*(_QWORD *)(a1 + 40));
    v7 = objc_msgSend(*(id *)(a1 + 32), "device");
    v13 = 136315906;
    v14 = "-[AVCustomRoutingController _updateSessionStateToMatchRoute:]_block_invoke";
    v15 = 2112;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    v19 = 2112;
    v20 = a2;
    v8 = "%s Setting state: %@ for device: %@ failed with error: %@.";
    v9 = v4;
    v10 = 42;
  }
  else
  {
    if (!v5)
      return;
    v11 = soft_DADeviceStateToString(*(_QWORD *)(a1 + 40));
    v12 = objc_msgSend(*(id *)(a1 + 32), "device");
    v13 = 136315650;
    v14 = "-[AVCustomRoutingController _updateSessionStateToMatchRoute:]_block_invoke";
    v15 = 2112;
    v16 = v11;
    v17 = 2112;
    v18 = v12;
    v8 = "%s Setting state: %@ for device: %@ succeeded.";
    v9 = v4;
    v10 = 32;
  }
  _os_log_impl(&dword_20AEB2000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v13, v10);
}

- (void)_setActive:(BOOL)a3 forRoute:(id)a4
{
  objc_msgSend(a4, "setActive:", a3);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("AVCustomRoutingControllerActiveRoutesDidChangeNotification"), self);
}

- (void)_suspendSessionUpdates
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = _AVRoutingLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[AVCustomRoutingController _suspendSessionUpdates]";
    _os_log_impl(&dword_20AEB2000, v3, OS_LOG_TYPE_DEFAULT, "%s Suspending session updates.", (uint8_t *)&v4, 0xCu);
  }
  -[AVCustomRoutingController setSessionSuspended:](self, "setSessionSuspended:", 1);
}

- (void)_resumeSessionUpdates
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = _AVRoutingLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[AVCustomRoutingController _resumeSessionUpdates]";
    _os_log_impl(&dword_20AEB2000, v3, OS_LOG_TYPE_DEFAULT, "%s Resuming session updates.", (uint8_t *)&v4, 0xCu);
  }
  -[AVCustomRoutingController setSessionSuspended:](self, "setSessionSuspended:", 0);
  -[AVCustomRoutingController _updateSessionFromEventRecords](self, "_updateSessionFromEventRecords");
  -[AVCustomRoutingController _updateSessionToReflectCurrentlyActiveRoutes](self, "_updateSessionToReflectCurrentlyActiveRoutes");
}

- (void)_updateSessionFromEventRecords
{
  NSObject *v3;
  NSUInteger v4;
  NSArray *routeEventRecords;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSUInteger v11;
  NSObject *v12;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  NSUInteger v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = _AVRoutingLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = -[NSArray count](self->_routeEventRecords, "count");
    *(_DWORD *)buf = 136315394;
    v21 = "-[AVCustomRoutingController _updateSessionFromEventRecords]";
    v22 = 2048;
    v23 = v4;
    _os_log_impl(&dword_20AEB2000, v3, OS_LOG_TYPE_DEFAULT, "%s %lu stored event records.", buf, 0x16u);
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  routeEventRecords = self->_routeEventRecords;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](routeEventRecords, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v16;
    *(_QWORD *)&v7 = 136315394;
    v14 = v7;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(routeEventRecords);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        v12 = _AVRoutingLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v14;
          v21 = "-[AVCustomRoutingController _updateSessionFromEventRecords]";
          v22 = 2112;
          v23 = v11;
          _os_log_impl(&dword_20AEB2000, v12, OS_LOG_TYPE_DEFAULT, "%s Updating session from event record: %@", buf, 0x16u);
        }
        -[AVCustomRoutingController _updateSessionForEvent:](self, "_updateSessionForEvent:", v11, v14);
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](routeEventRecords, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }
  v13 = _AVRoutingLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v21 = "-[AVCustomRoutingController _updateSessionFromEventRecords]";
    _os_log_impl(&dword_20AEB2000, v13, OS_LOG_TYPE_DEFAULT, "%s Clearing event records.", buf, 0xCu);
  }

  self->_routeEventRecords = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCE30]);
}

- (void)_storeRecordForEvent:(id)a3
{
  NSObject *v5;
  NSArray *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = _AVRoutingLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[AVCustomRoutingController _storeRecordForEvent:]";
    v9 = 2112;
    v10 = a3;
    _os_log_impl(&dword_20AEB2000, v5, OS_LOG_TYPE_DEFAULT, "%s Storing event record: %@", (uint8_t *)&v7, 0x16u);
  }
  v6 = -[NSArray arrayByAddingObject:](self->_routeEventRecords, "arrayByAddingObject:", a3);

  self->_routeEventRecords = v6;
}

- (void)_updateSessionToReflectCurrentlyActiveRoutes
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = -[AVCustomRoutingController authorizedRoutes](self, "authorizedRoutes", 0);
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[AVCustomRoutingController _updateSessionStateToMatchRoute:](self, "_updateSessionStateToMatchRoute:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
}

- (id)delegate
{
  return objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (NSArray)authorizedRoutes
{
  return self->_authorizedRoutes;
}

- (NSArray)knownRouteIPs
{
  return self->_knownRouteIPs;
}

- (NSArray)customActionItems
{
  return self->_customActionItems;
}

- (BOOL)isSessionSuspended
{
  return self->_sessionSuspended;
}

- (void)setSessionSuspended:(BOOL)a3
{
  self->_sessionSuspended = a3;
}

- (NSArray)pendingEvents
{
  return self->_pendingEvents;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
