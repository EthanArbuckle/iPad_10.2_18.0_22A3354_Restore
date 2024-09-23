@implementation FMDMagSafeDataStore

+ (id)defaultStorageLocation
{
  id v2;
  id v3;
  void *v4;
  void *v5;

  v2 = objc_alloc((Class)FMSharedFileContainer);
  v3 = objc_msgSend(v2, "initWithIdentifier:", off_100042AF8);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "url"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fm_preferencesPathURLForDomain:", CFSTR("fmdMagSafeDevices")));

  return v5;
}

+ (id)lostModeStorageLocation
{
  id v2;
  id v3;
  void *v4;
  void *v5;

  v2 = objc_alloc((Class)FMSharedFileContainer);
  v3 = objc_msgSend(v2, "initWithIdentifier:", off_100042AF8);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "url"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fm_preferencesPathURLForDomain:", CFSTR("fmdMagSafeLostDevices")));

  return v5;
}

+ (id)sharedInstance
{
  if (qword_100042DD8 != -1)
    dispatch_once(&qword_100042DD8, &stru_100035B00);
  return (id)qword_100042DD0;
}

- (FMDMagSafeDataStore)init
{
  FMDMagSafeDataStore *v2;
  dispatch_queue_t v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)FMDMagSafeDataStore;
  v2 = -[FMDMagSafeDataStore init](&v21, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("FMDMagSafeDataStore.serialQueue", 0);
    -[FMDMagSafeDataStore setSerialQueue:](v2, "setSerialQueue:", v3);

    v4 = objc_alloc((Class)FMDataArchiver);
    v5 = objc_msgSend((id)objc_opt_class(v2), "defaultStorageLocation");
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = objc_msgSend(v4, "initWithFileURL:", v6);
    -[FMDMagSafeDataStore setDataArchiver:](v2, "setDataArchiver:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeDataStore dataArchiver](v2, "dataArchiver"));
    objc_msgSend(v8, "setDataProtectionClass:", 4);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeDataStore dataArchiver](v2, "dataArchiver"));
    objc_msgSend(v9, "setBackedUp:", 0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeDataStore dataArchiver](v2, "dataArchiver"));
    objc_msgSend(v10, "setCreateDirectories:", 1);

    v11 = objc_alloc((Class)FMDataArchiver);
    v12 = objc_msgSend((id)objc_opt_class(v2), "lostModeStorageLocation");
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = objc_msgSend(v11, "initWithFileURL:", v13);
    -[FMDMagSafeDataStore setLostModeDataArchiver:](v2, "setLostModeDataArchiver:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeDataStore lostModeDataArchiver](v2, "lostModeDataArchiver"));
    objc_msgSend(v15, "setDataProtectionClass:", 4);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeDataStore lostModeDataArchiver](v2, "lostModeDataArchiver"));
    objc_msgSend(v16, "setBackedUp:", 0);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeDataStore lostModeDataArchiver](v2, "lostModeDataArchiver"));
    objc_msgSend(v17, "setCreateDirectories:", 1);

    v18 = sub_1000114EC();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      sub_10001FD30((uint64_t)v2, v19);

  }
  return v2;
}

- (void)clearDataStore
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[FMDMagSafeDataStore serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001BA10;
  block[3] = &unk_100034760;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)addAccessory:(id)a3 withCompletion:(id)a4
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
  v8 = objc_claimAutoreleasedReturnValue(-[FMDMagSafeDataStore serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001BB20;
  block[3] = &unk_100035B50;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)removeAccessoryWithId:(id)a3 withCompletion:(id)a4
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
  v8 = objc_claimAutoreleasedReturnValue(-[FMDMagSafeDataStore serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001BD04;
  block[3] = &unk_100035B50;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)removeAccessoryWithSerialNumber:(id)a3 withCompletion:(id)a4
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
  v8 = objc_claimAutoreleasedReturnValue(-[FMDMagSafeDataStore serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001BECC;
  block[3] = &unk_100035B50;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (id)readAllAccessoriesFromDisk
{
  void *v2;
  uint64_t v3;
  NSSet *v4;
  void *v5;
  void *v6;
  id v7;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  id v13;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeDataStore dataArchiver](self, "dataArchiver"));
  v3 = objc_opt_class(FMDMagSafeAccessory);
  v4 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v3, objc_opt_class(NSString), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v15 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "readDictionaryAndClasses:error:", v5, &v15));
  v7 = v15;

  if ((objc_msgSend(v7, "fm_isFileNotFoundError") & 1) == 0 && (!v6 || v7 != 0))
  {

    v9 = sub_1000114EC();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_10001FDC4();

    v6 = &__NSDictionary0__struct;
  }
  v11 = sub_10001178C();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = objc_msgSend(v6, "count");
    *(_DWORD *)buf = 134218242;
    v17 = v13;
    v18 = 2112;
    v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "readAllAccessoriesFromDisk total = %lu accessories = %@", buf, 0x16u);
  }

  return v6;
}

- (id)_writeAccessoriesToDisk:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeDataStore dataArchiver](self, "dataArchiver"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "saveDictionary:", v4));

  return v6;
}

- (id)writeLostModeInfo:(id)a3 version:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  __CFNotificationCenter *DarwinNotifyCenter;
  _QWORD v13[2];
  _QWORD v14[2];

  v13[0] = CFSTR("accessoryList");
  v13[1] = CFSTR("version");
  v14[0] = a3;
  v14[1] = a4;
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 2));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeDataStore lostModeDataArchiver](self, "lostModeDataArchiver"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "saveDictionary:", v8));

  if (!v10)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.icloud.findmydeviced.findkit.magSafe.added"), 0, 0, 1u);
  }

  return v10;
}

- (id)readLostModeAccessoriesList
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  NSSet *v5;
  void *v6;
  void *v7;
  id v8;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeDataStore lostModeDataArchiver](self, "lostModeDataArchiver"));
  v3 = objc_opt_class(NSString);
  v4 = objc_opt_class(NSArray);
  v5 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v3, v4, objc_opt_class(NSNumber), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v18 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "readDictionaryAndClasses:error:", v6, &v18));
  v8 = v18;

  if ((objc_msgSend(v8, "fm_isFileNotFoundError") & 1) == 0 && (!v7 || v8 != 0))
  {
    v10 = sub_1000114EC();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_10001FDC4();

  }
  v12 = sub_10001178C();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("accessoryList")));
    v15 = objc_msgSend(v14, "count");
    *(_DWORD *)buf = 134218242;
    v20 = v15;
    v21 = 2112;
    v22 = v7;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "readLostModeAccessoriesList total = %lu accessories = %@", buf, 0x16u);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("accessoryList")));

  return v16;
}

- (id)readLostModeAccessoriesListVersion
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  NSSet *v5;
  void *v6;
  void *v7;
  id v8;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeDataStore lostModeDataArchiver](self, "lostModeDataArchiver"));
  v3 = objc_opt_class(NSString);
  v4 = objc_opt_class(NSArray);
  v5 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v3, v4, objc_opt_class(NSNumber), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v18 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "readDictionaryAndClasses:error:", v6, &v18));
  v8 = v18;

  if ((objc_msgSend(v8, "fm_isFileNotFoundError") & 1) == 0 && (!v7 || v8 != 0))
  {
    v10 = sub_1000114EC();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_10001FDC4();

  }
  v12 = sub_10001178C();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("accessoryList")));
    v15 = objc_msgSend(v14, "count");
    *(_DWORD *)buf = 134218242;
    v20 = v15;
    v21 = 2112;
    v22 = v7;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "readLostModeAccessoriesList total = %lu accessories = %@", buf, 0x16u);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("version")));

  return v16;
}

- (void)updateLostModeKeyRollTimeFor:(id)a3 lastLostModeKeyRollTime:(id)a4 withCompletion:(id)a5
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
  v11 = objc_claimAutoreleasedReturnValue(-[FMDMagSafeDataStore serialQueue](self, "serialQueue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10001C9B8;
  v15[3] = &unk_100035BA0;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (FMDataArchiver)dataArchiver
{
  return self->_dataArchiver;
}

- (void)setDataArchiver:(id)a3
{
  objc_storeStrong((id *)&self->_dataArchiver, a3);
}

- (FMDataArchiver)lostModeDataArchiver
{
  return self->_lostModeDataArchiver;
}

- (void)setLostModeDataArchiver:(id)a3
{
  objc_storeStrong((id *)&self->_lostModeDataArchiver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lostModeDataArchiver, 0);
  objc_storeStrong((id *)&self->_dataArchiver, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end
