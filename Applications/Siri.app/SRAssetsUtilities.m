@implementation SRAssetsUtilities

- (SRAssetsUtilities)init
{
  SRAssetsUtilities *v2;
  UAFAssetUtilities *v3;
  UAFAssetUtilities *assetUtilities;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SRAssetsUtilities;
  v2 = -[SRAssetsUtilities init](&v6, "init");
  if (v2)
  {
    v3 = (UAFAssetUtilities *)objc_alloc_init((Class)UAFAssetUtilities);
    assetUtilities = v2->_assetUtilities;
    v2->_assetUtilities = v3;

  }
  return v2;
}

- (void)checkAssetsWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  unsigned __int8 v6;
  unint64_t v7;
  unint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  const char *v15;
  __int16 v16;
  unint64_t v17;

  v4 = (void (**)(id, _QWORD))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](AFPreferences, "sharedPreferences"));
  v6 = objc_msgSend(v5, "assistantIsEnabled");

  if ((v6 & 1) != 0)
  {
    -[UAFAssetUtilities refreshUnderstandingOnDeviceAssetsAvailableAsync](self->_assetUtilities, "refreshUnderstandingOnDeviceAssetsAvailableAsync");
    v7 = -[SRAssetsUtilities _mockSiriAssetState](self, "_mockSiriAssetState");
    if (v7)
    {
      v8 = v7;
      v9 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        v14 = 136315394;
        v15 = "-[SRAssetsUtilities checkAssetsWithCompletion:]";
        v16 = 2048;
        v17 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s Using mock value for Siri asset state: %lu", (uint8_t *)&v14, 0x16u);
      }
      v4[2](v4, v8);
    }
    else
    {
      if (-[UAFAssetUtilities understandingOnDeviceAssetsAvailable](self->_assetUtilities, "understandingOnDeviceAssetsAvailable"))
      {
        v10 = AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
        {
          v14 = 136315138;
          v15 = "-[SRAssetsUtilities checkAssetsWithCompletion:]";
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s Task shows finished asset state", (uint8_t *)&v14, 0xCu);
        }
        v11 = 3;
      }
      else if (-[UAFAssetUtilities hasSufficientDiskSpaceForDownload](self->_assetUtilities, "hasSufficientDiskSpaceForDownload"))
      {
        -[UAFAssetUtilities downloadSiriAssetsIfNeeded](self->_assetUtilities, "downloadSiriAssetsIfNeeded");
        v12 = AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
        {
          v14 = 136315138;
          v15 = "-[SRAssetsUtilities checkAssetsWithCompletion:]";
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s Task shows downloading asset state", (uint8_t *)&v14, 0xCu);
        }
        v11 = 2;
      }
      else
      {
        v13 = AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
        {
          v14 = 136315138;
          v15 = "-[SRAssetsUtilities checkAssetsWithCompletion:]";
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Task shows out of space asset state", (uint8_t *)&v14, 0xCu);
        }
        v11 = 4;
      }
      v4[2](v4, v11);
    }
  }
  else
  {
    v4[2](v4, 1);
  }

}

- (unint64_t)_mockSiriAssetState
{
  id v2;
  id v3;

  v2 = objc_msgSend(objc_alloc((Class)SRUIFPreferences), "initWithSuiteName:", CFSTR("com.apple.SiriViewService"));
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("MockSiriAssetState")));

  if (v3)
    v3 = objc_msgSend(v2, "integerForKey:", CFSTR("MockSiriAssetState"));

  return (unint64_t)v3;
}

+ (void)setupBackgroundAssetCheck
{
  SRPreferences *v2;
  void *v3;
  unsigned int v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;

  v2 = objc_alloc_init(SRPreferences);
  if (!-[SRPreferences hasPresentedSiriAssetsNotification](v2, "hasPresentedSiriAssetsNotification"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[BGTaskScheduler sharedScheduler](BGTaskScheduler, "sharedScheduler"));
    v4 = objc_msgSend(v3, "registerForTaskWithIdentifier:usingQueue:launchHandler:", CFSTR("com.apple.siri.CheckAssetStatus"), 0, &stru_100122BA0);

    if (v4)
    {
      +[SRAssetsUtilities _scheduleAssetCheckWithEarliestBeginDate:](SRAssetsUtilities, "_scheduleAssetCheckWithEarliestBeginDate:", 0);
    }
    else
    {
      v5 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
        sub_10009DC14(v5, v6, v7);
    }
  }

}

+ (void)_scheduleAssetCheckWithEarliestBeginDate:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  const char *v12;

  v3 = a3;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "+[SRAssetsUtilities _scheduleAssetCheckWithEarliestBeginDate:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Submitting background task request to check assets.", buf, 0xCu);
  }
  v5 = objc_msgSend(objc_alloc((Class)BGProcessingTaskRequest), "initWithIdentifier:", CFSTR("com.apple.siri.CheckAssetStatus"));
  objc_msgSend(v5, "setRequiresExternalPower:", 0);
  objc_msgSend(v5, "setRequiresNetworkConnectivity:", 1);
  objc_msgSend(v5, "setEarliestBeginDate:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BGTaskScheduler sharedScheduler](BGTaskScheduler, "sharedScheduler"));
  v10 = 0;
  v7 = objc_msgSend(v6, "submitTaskRequest:error:", v5, &v10);
  v8 = v10;

  if ((v7 & 1) == 0)
  {
    v9 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      sub_10009DCA0(v9, v8);
  }

}

+ (void)_runAssetCheckWithTask:(id)a3
{
  id v3;
  SRAssetsUtilities *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  id location[3];

  v3 = a3;
  if ((AFDeviceSupportsSiriUOD() & 1) != 0 || (AFDeviceSupportsHybridUOD() & 1) != 0)
  {
    v4 = objc_alloc_init(SRAssetsUtilities);
    objc_initWeak(location, v3);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100018AD8;
    v8[3] = &unk_100122638;
    objc_copyWeak(&v9, location);
    objc_msgSend(v3, "setExpirationHandler:", v8);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100018BE4;
    v6[3] = &unk_100122BC8;
    v7 = v3;
    -[SRAssetsUtilities checkAssetsWithCompletion:](v4, "checkAssetsWithCompletion:", v6);

    objc_destroyWeak(&v9);
    objc_destroyWeak(location);

  }
  else
  {
    v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      LODWORD(location[0]) = 136315138;
      *(id *)((char *)location + 4) = "+[SRAssetsUtilities _runAssetCheckWithTask:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s UOD not supported by this device. No background task started.", (uint8_t *)location, 0xCu);
    }
  }

}

- (BOOL)_hasSufficientDiskSpaceForDownload
{
  return -[UAFAssetUtilities hasSufficientDiskSpaceForDownload](self->_assetUtilities, "hasSufficientDiskSpaceForDownload");
}

- (BOOL)_hasInexpensiveNetwork
{
  void *v2;
  void *v3;
  unsigned int v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NWPathEvaluator sharedDefaultEvaluator](NWPathEvaluator, "sharedDefaultEvaluator"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "path"));

  if (objc_msgSend(v3, "status") == (id)1)
    v4 = objc_msgSend(v3, "isExpensive") ^ 1;
  else
    LOBYTE(v4) = 0;

  return v4;
}

+ (BOOL)shouldShowAssetDownloadBanner
{
  SRAssetsUtilities *v2;
  unsigned __int8 v3;

  v2 = objc_alloc_init(SRAssetsUtilities);
  if (-[SRAssetsUtilities _hasSufficientDiskSpaceForDownload](v2, "_hasSufficientDiskSpaceForDownload"))
    v3 = -[SRAssetsUtilities _hasInexpensiveNetwork](v2, "_hasInexpensiveNetwork");
  else
    v3 = 0;

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetUtilities, 0);
}

@end
