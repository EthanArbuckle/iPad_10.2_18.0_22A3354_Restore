@implementation SSRemoteAlertMonitor

- (SSRemoteAlertMonitor)initWithBundleID:(id)a3 dismissHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  SSRemoteAlertMonitor *v11;
  void *v12;
  id v13;
  NSObject *v14;
  SSRemoteAlertMonitor *v15;
  id v16;
  id dismissHandler;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (objc_msgSend(v6, "length"))
    {
      v8 = v6;
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bundleIdentifier"));

      v13 = sub_10000CE68();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_10000FCD8((uint64_t)v8, v14);

    }
    v19.receiver = self;
    v19.super_class = (Class)SSRemoteAlertMonitor;
    v15 = -[SSRemoteAlertMonitor init](&v19, "init");
    if (v15)
    {
      v16 = objc_retainBlock(v7);
      dismissHandler = v15->_dismissHandler;
      v15->_dismissHandler = v16;

      v15->_displayState = 0;
      objc_storeStrong((id *)&v15->_bundleID, v8);
      -[SSRemoteAlertMonitor _startObserving](v15, "_startObserving");
    }
    self = v15;
    v6 = v8;
    v11 = self;
  }
  else
  {
    v9 = sub_10000CE68();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_10000FC58(v10);

    v11 = 0;
  }

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[SSRemoteAlertMonitor _stopObserving](self, "_stopObserving");
  v3.receiver = self;
  v3.super_class = (Class)SSRemoteAlertMonitor;
  -[SSRemoteAlertMonitor dealloc](&v3, "dealloc");
}

- (void)_startObserving
{
  id v3;
  NSObject *v4;
  NSString *bundleID;
  void *v6;
  FBSDisplayLayoutMonitor *v7;
  FBSDisplayLayoutMonitor *monitor;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  NSString *v12;
  __int16 v13;
  const char *v14;

  if (!self->_monitor)
  {
    v3 = sub_10000CE68();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      bundleID = self->_bundleID;
      *(_DWORD *)buf = 138412546;
      v12 = bundleID;
      v13 = 2080;
      v14 = "-[SSRemoteAlertMonitor _startObserving]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "start fbs monitor for %@ @%s", buf, 0x16u);
    }

    objc_initWeak((id *)buf, self);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[FBSDisplayLayoutMonitorConfiguration configurationForDefaultMainDisplayMonitor](FBSDisplayLayoutMonitorConfiguration, "configurationForDefaultMainDisplayMonitor"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000C8F0;
    v9[3] = &unk_10001C930;
    objc_copyWeak(&v10, (id *)buf);
    objc_msgSend(v6, "setTransitionHandler:", v9);
    v7 = (FBSDisplayLayoutMonitor *)objc_claimAutoreleasedReturnValue(+[FBSDisplayLayoutMonitor monitorWithConfiguration:](FBSDisplayLayoutMonitor, "monitorWithConfiguration:", v6));
    monitor = self->_monitor;
    self->_monitor = v7;

    objc_destroyWeak(&v10);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_stopObserving
{
  id v3;
  NSObject *v4;
  FBSDisplayLayoutMonitor *monitor;
  int v6;
  const char *v7;

  v3 = sub_10000CE68();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[SSRemoteAlertMonitor _stopObserving]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "stop fbs monitor @%s", (uint8_t *)&v6, 0xCu);
  }

  -[FBSDisplayLayoutMonitor invalidate](self->_monitor, "invalidate");
  monitor = self->_monitor;
  self->_monitor = 0;

}

- (void)_handleLayoutUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  __int128 v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  unsigned int v15;
  id v16;
  NSObject *v17;
  _BOOL4 v18;
  char *v19;
  const char *v20;
  NSString *bundleID;
  void *v22;
  char *v23;
  const char *v24;
  NSString *v25;
  void *v26;
  id v27;
  NSObject *v28;
  NSString *v29;
  id v30;
  NSObject *v31;
  NSNumber *isUIApplication;
  NSNumber *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  const char *v44;
  _BYTE v45[128];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "elements"));
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "elements"));
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
      if (v9)
      {
        v11 = v9;
        v12 = *(_QWORD *)v36;
        *(_QWORD *)&v10 = 138412802;
        v34 = v10;
        while (2)
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(_QWORD *)v36 != v12)
              objc_enumerationMutation(v8);
            v14 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
            v15 = objc_msgSend(v14, "isUIApplicationElement", v34);
            v16 = sub_10000CE68();
            v17 = objc_claimAutoreleasedReturnValue(v16);
            v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
            if (v15)
            {
              if (v18)
              {
                v19 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bundleIdentifier"));
                v20 = (const char *)objc_msgSend(v14, "level");
                *(_DWORD *)buf = v34;
                v40 = v19;
                v41 = 2048;
                v42 = v20;
                v43 = 2080;
                v44 = "-[SSRemoteAlertMonitor _handleLayoutUpdate:]";
                _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%@ lvl:%ld @%s", buf, 0x20u);

              }
              bundleID = self->_bundleID;
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bundleIdentifier"));
              LODWORD(bundleID) = -[NSString isEqualToString:](bundleID, "isEqualToString:", v22);

              if ((_DWORD)bundleID)
              {
                isUIApplication = self->_isUIApplication;
                v33 = (NSNumber *)&__kCFBooleanTrue;
LABEL_27:
                self->_isUIApplication = v33;

                self->_displayState = 1;
                goto LABEL_28;
              }
            }
            else
            {
              if (v18)
              {
                v23 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
                v24 = (const char *)objc_msgSend(v14, "level");
                *(_DWORD *)buf = v34;
                v40 = v23;
                v41 = 2048;
                v42 = v24;
                v43 = 2080;
                v44 = "-[SSRemoteAlertMonitor _handleLayoutUpdate:]";
                _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%@ lvl:%ld @%s", buf, 0x20u);

              }
              v25 = self->_bundleID;
              v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
              LODWORD(v25) = -[NSString isEqualToString:](v25, "isEqualToString:", v26);

              if ((_DWORD)v25)
              {
                isUIApplication = self->_isUIApplication;
                v33 = (NSNumber *)&__kCFBooleanFalse;
                goto LABEL_27;
              }
            }
          }
          v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
          if (v11)
            continue;
          break;
        }
      }

      if (self->_displayState == 1)
      {
        v27 = sub_10000CE68();
        v28 = objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          v29 = self->_bundleID;
          *(_DWORD *)buf = 138412546;
          v40 = (const char *)v29;
          v41 = 2080;
          v42 = "-[SSRemoteAlertMonitor _handleLayoutUpdate:]";
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%@ is dismissed @%s", buf, 0x16u);
        }

        (*((void (**)(void))self->_dismissHandler + 2))();
        if (!-[NSNumber BOOLValue](self->_isUIApplication, "BOOLValue"))
          -[SSRemoteAlertMonitor _stopObserving](self, "_stopObserving");
      }
    }
    else
    {
      v30 = sub_10000CE68();
      v31 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v40 = "-[SSRemoteAlertMonitor _handleLayoutUpdate:]";
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "no elements @%s", buf, 0xCu);
      }

    }
  }
LABEL_28:

}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (FBSDisplayLayoutMonitor)monitor
{
  return (FBSDisplayLayoutMonitor *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMonitor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (id)dismissHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setDismissHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (unint64_t)displayState
{
  return self->_displayState;
}

- (void)setDisplayState:(unint64_t)a3
{
  self->_displayState = a3;
}

- (NSNumber)isUIApplication
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setIsUIApplication:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isUIApplication, 0);
  objc_storeStrong(&self->_dismissHandler, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
