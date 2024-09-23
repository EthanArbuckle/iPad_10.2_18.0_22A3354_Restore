@implementation SRBackgroundTaskManager

- (SRBackgroundTaskManager)init
{
  SRBackgroundTaskManager *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void **v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;
  objc_super v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  SRBackgroundTaskManager *v17;
  __int16 v18;
  void *v19;

  v13.receiver = self;
  v13.super_class = (Class)SRBackgroundTaskManager;
  v2 = -[SRBackgroundTaskManager init](&v13, "init");
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v7 = _NSConcreteStackBlock;
    v8 = 3221225472;
    v9 = sub_10006D578;
    v10 = &unk_100122638;
    objc_copyWeak(&v11, &location);
    v2->_taskIdentifier = (unint64_t)objc_msgSend(v3, "beginBackgroundTaskWithExpirationHandler:", &v7);

    v4 = AFSiriLogContextConnection;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v2->_taskIdentifier, v7, v8, v9, v10));
      *(_DWORD *)buf = 136315650;
      v15 = "-[SRBackgroundTaskManager init]";
      v16 = 2112;
      v17 = v2;
      v18 = 2112;
      v19 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s %@ - background task identifier: %@", buf, 0x20u);

    }
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  SRBackgroundTaskManager *v8;

  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v6 = "-[SRBackgroundTaskManager dealloc]";
    v7 = 2112;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }
  -[SRBackgroundTaskManager _endBackgroundTask](self, "_endBackgroundTask");
  v4.receiver = self;
  v4.super_class = (Class)SRBackgroundTaskManager;
  -[SRBackgroundTaskManager dealloc](&v4, "dealloc");
}

- (void)_endBackgroundTask
{
  void *v3;
  unint64_t taskIdentifier;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  SRBackgroundTaskManager *v11;
  __int16 v12;
  void *v13;

  if (self->_taskIdentifier != UIBackgroundTaskInvalid)
  {
    v3 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      taskIdentifier = self->_taskIdentifier;
      v5 = v3;
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", taskIdentifier));
      v8 = 136315650;
      v9 = "-[SRBackgroundTaskManager _endBackgroundTask]";
      v10 = 2112;
      v11 = self;
      v12 = 2112;
      v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s %@ - ending background task with id: %@", (uint8_t *)&v8, 0x20u);

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    objc_msgSend(v7, "endBackgroundTask:", self->_taskIdentifier);

    self->_taskIdentifier = UIBackgroundTaskInvalid;
  }
}

@end
