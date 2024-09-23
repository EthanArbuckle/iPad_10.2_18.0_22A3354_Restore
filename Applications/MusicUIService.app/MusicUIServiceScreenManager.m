@implementation MusicUIServiceScreenManager

- (MusicUIServiceScreenManager)init
{
  MusicUIServiceScreenManager *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MusicUIServiceScreenManager;
  v2 = -[MusicUIServiceScreenManager init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, "_screenDidConnect:", UIScreenDidConnectNotification, 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, "_screenDidDisconnect:", UIScreenDidDisconnectNotification, 0);
    MRMediaRemotePostBrowsableContentNotification(kMRMediaRemoteBrowsableContentEndpointChangedNotification, 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MusicUIServiceScreenManager;
  -[MusicUIServiceScreenManager dealloc](&v4, "dealloc");
}

- (void)_screenDidConnect:(id)a3
{
  void *v4;
  uint8_t v5[16];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  if (objc_msgSend(v4, "_isCarScreen"))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Car screen did connect.", v5, 2u);
    }
    objc_storeStrong((id *)&self->_carScreen, v4);
    MRMediaRemotePostBrowsableContentNotification(kMRMediaRemoteBrowsableContentEndpointChangedNotification, 0);
  }

}

- (void)_screenDidDisconnect:(id)a3
{
  UIScreen *v4;
  UIScreen *carScreen;
  uint8_t v6[16];

  v4 = (UIScreen *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  if (v4 == self->_carScreen)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Car screen did disconnect.", v6, 2u);
    }
    carScreen = self->_carScreen;
    self->_carScreen = 0;

    MRMediaRemotePostBrowsableContentNotification(kMRMediaRemoteBrowsableContentEndpointChangedNotification, 0);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carScreen, 0);
}

@end
