@implementation IMNotificationCenterEventListener

- (BOOL)isRegisteredForNotification
{
  IMNotificationCenterEventListener *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_registeredNotificationName != 0;
  objc_sync_exit(v2);

  return v3;
}

- (void)_notification:(id)a3
{
  id v4;

  objc_msgSend(a3, "userInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[IMEventListener _didReceiveEvent:userInfo:error:](self, "_didReceiveEvent:userInfo:error:", 1, v4, 0);

}

- (void)registerForNotificationName:(id)a3
{
  -[IMNotificationCenterEventListener registerForNotificationName:object:](self, "registerForNotificationName:object:", a3, 0);
}

- (void)registerForNotificationName:(id)a3 object:(id)a4
{
  id v6;
  IMNotificationCenterEventListener *v7;
  uint64_t v8;
  NSString *notificationName;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  -[IMEventListener _reset](v7, "_reset");
  v8 = objc_msgSend(v10, "copy");
  notificationName = v7->_notificationName;
  v7->_notificationName = (NSString *)v8;

  objc_storeWeak(&v7->_notificationObject, v6);
  objc_sync_exit(v7);

}

+ (id)eventListenerForNotificationName:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "registerForNotificationName:", v3);

  return v4;
}

+ (id)eventListenerForNotificationName:(id)a3 object:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v7, "registerForNotificationName:object:", v6, v5);

  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)IMNotificationCenterEventListener;
  -[IMNotificationCenterEventListener dealloc](&v4, sel_dealloc);
}

- (BOOL)isListening
{
  IMNotificationCenterEventListener *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_registeredNotificationName != 0;
  objc_sync_exit(v2);

  return v3;
}

- (void)willStartListening
{
  NSString **p_registeredNotificationName;
  void *v4;
  NSString *notificationName;
  id WeakRetained;

  p_registeredNotificationName = &self->_registeredNotificationName;
  if (!self->_registeredNotificationName)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    notificationName = self->_notificationName;
    WeakRetained = objc_loadWeakRetained(&self->_notificationObject);
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__notification_, notificationName, WeakRetained);

    objc_storeStrong((id *)p_registeredNotificationName, self->_notificationName);
  }
}

- (void)willStopListening
{
  void *v3;
  NSString *registeredNotificationName;

  if (self->_registeredNotificationName)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self);

    registeredNotificationName = self->_registeredNotificationName;
    self->_registeredNotificationName = 0;

  }
}

- (void)willReset
{
  NSString *notificationName;

  notificationName = self->_notificationName;
  self->_notificationName = 0;

}

- (NSString)registeredNotificationName
{
  return self->_registeredNotificationName;
}

- (NSString)notificationName
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (id)notificationObject
{
  return objc_loadWeakRetained(&self->_notificationObject);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_notificationObject);
  objc_storeStrong((id *)&self->_notificationName, 0);
  objc_storeStrong((id *)&self->_registeredNotificationName, 0);
}

@end
