@implementation FMDMagSafeAccessoryManager

+ (id)sharedInstance
{
  if (qword_100031300 != -1)
    dispatch_once(&qword_100031300, &stru_100025510);
  return (id)qword_1000312F8;
}

- (FMDMagSafeAccessoryManager)init
{
  FMDMagSafeAccessoryManager *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  dispatch_queue_t v7;
  dispatch_group_t v8;
  NSObject *v9;
  FMDCoreAccessoryManager *v10;
  NSObject *v11;
  dispatch_time_t v12;
  intptr_t v13;
  id v14;
  NSObject *v15;
  uint8_t v17[16];
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)FMDMagSafeAccessoryManager;
  v2 = -[FMDMagSafeAccessoryManager init](&v18, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMDMagSafeDataStore sharedInstance](FMDMagSafeDataStore, "sharedInstance"));
    -[FMDMagSafeAccessoryManager setDataSource:](v2, "setDataSource:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeAccessoryManager getFindMyEnabledAccessories](v2, "getFindMyEnabledAccessories"));
    -[FMDMagSafeAccessoryManager setAllAccessories:](v2, "setAllAccessories:", v4);

    v5 = sub_100007B7C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "initialising core accessory manager", v17, 2u);
    }

    v7 = dispatch_queue_create("FMDMagSafeAccessoryManager.serialQueue", 0);
    -[FMDMagSafeAccessoryManager setSerialQueue:](v2, "setSerialQueue:", v7);

    v8 = dispatch_group_create();
    -[FMDMagSafeAccessoryManager setCaGroup:](v2, "setCaGroup:", v8);

    v9 = objc_claimAutoreleasedReturnValue(-[FMDMagSafeAccessoryManager caGroup](v2, "caGroup"));
    dispatch_group_enter(v9);

    v10 = -[FMDCoreAccessoryManager initWithDelegate:]([FMDCoreAccessoryManager alloc], "initWithDelegate:", v2);
    -[FMDMagSafeAccessoryManager setCaAccessoryManager:](v2, "setCaAccessoryManager:", v10);

    v11 = objc_claimAutoreleasedReturnValue(-[FMDMagSafeAccessoryManager caGroup](v2, "caGroup"));
    v12 = dispatch_time(0, 1000000000);
    v13 = dispatch_group_wait(v11, v12);

    if (v13)
    {
      v14 = sub_1000045AC();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        sub_100016EEC();

    }
  }
  return v2;
}

- (id)getFindMyEnabledAccessories
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeAccessoryManager dataSource](self, "dataSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "readAllAccessoriesFromDisk"));

  v4 = objc_alloc_init((Class)NSMutableDictionary);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v10, (_QWORD)v13));
        if (objc_msgSend(v11, "findMyEnabled"))
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)getAllAccessories
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeAccessoryManager getFindMyEnabledAccessories](self, "getFindMyEnabledAccessories"));
  -[FMDMagSafeAccessoryManager setAllAccessories:](self, "setAllAccessories:", v3);

  return -[FMDMagSafeAccessoryManager allAccessories](self, "allAccessories");
}

- (void)conncetionStatusFor:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeAccessoryManager allAccessories](self, "allAccessories"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v6));

  if (!v9)
  {
    v10 = sub_1000045AC();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_100016F4C();

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithMessage:](NSError, "errorWithMessage:", CFSTR("accessory not found")));
    v7[2](v7, 0, v12);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeAccessoryManager allAccessories](self, "allAccessories"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v6));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "serialNumbers"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("systemSerialNumber")));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeAccessoryManager connectdAccessoryWithSerialNumber:](self, "connectdAccessoryWithSerialNumber:", v16));
  ((void (**)(id, BOOL, void *))v7)[2](v7, v17 != 0, 0);

}

- (id)styleFor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeAccessoryManager allAccessories](self, "allAccessories"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeAccessoryManager allAccessories](self, "allAccessories"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v4));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "style"));

  }
  else
  {
    v10 = sub_1000045AC();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_100016F4C();

    v9 = 0;
  }

  return v9;
}

- (void)removeAccesoryWithSerialNumber:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  id v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;

  v6 = a3;
  v7 = a4;
  v8 = sub_100007B7C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Removing accessory with serialnumber %@", buf, 0xCu);
  }

  +[FMPreferencesUtil removeKey:inDomain:](FMPreferencesUtil, "removeKey:inDomain:", v6, kFMDNotBackedUpMagSafePrefDomain);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeAccessoryManager connectdAccessoryWithSerialNumber:](self, "connectdAccessoryWithSerialNumber:", v6));
  v11 = sub_100007B7C();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v13)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Accessory is connected removing keys", buf, 2u);
    }

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10000E874;
    v22[3] = &unk_100025560;
    v22[4] = self;
    v23 = v6;
    v24 = v7;
    v14 = v7;
    objc_msgSend(v10, "removeKeysWithCompletion:", v22);

  }
  else
  {
    if (v13)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Accessory not connected removing keys from device", buf, 2u);
    }

    v14 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.accessoryd.mfi4.userPublicKey.%@"), v6));
    v15 = sub_100007B7C();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v14;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "handle_NVMEraseResponse: featureTag: %@", buf, 0xCu);
    }

    v17 = MFi4AuthFeatureGroup();
    DeleteSynchronizableKeyForAuthFeature(0, v14, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeAccessoryManager dataSource](self, "dataSource"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10000EAE8;
    v20[3] = &unk_100025538;
    v20[4] = self;
    v21 = v7;
    v19 = v7;
    objc_msgSend(v18, "removeAccessoryWithSerialNumber:withCompletion:", v6, v20);

  }
}

- (id)connectdAccessoryWithSerialNumber:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  unsigned __int8 v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v4 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeAccessoryManager caAccessoryManager](self, "caAccessoryManager", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accessoryRawInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allValues"));

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v19;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[FMDAccessoryTypeValidator sharedInstance](FMDAccessoryTypeValidator, "sharedInstance"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "accessoryType"));
        if (objc_msgSend(v12, "isAllowedAccessoryWithType:", v13)
          && objc_msgSend(v11, "isMF4i"))
        {
          v14 = objc_msgSend(v11, "authPassed");

          if (v14)
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "serialNumber"));
            v16 = objc_msgSend(v4, "isEqualToString:", v15);

            if ((v16 & 1) != 0)
            {
              v8 = v11;
              goto LABEL_14;
            }
          }
        }
        else
        {

        }
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }
LABEL_14:

  return v8;
}

- (void)setPhoneNumberForAccessoryId:(id)a3 phoneNumber:(id)a4 completion:(id)a5
{
  void (**v5)(id, void *);
  id v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  v5 = (void (**)(id, void *))a5;
  v6 = sub_100007B7C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "not supported", v9, 2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithMessage:](NSError, "errorWithMessage:", CFSTR("Not supported")));
  v5[2](v5, v8);

}

- (void)launchSetupModuleWithInfo:(id)a3 withCompletion:(id)a4
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
  v8 = objc_claimAutoreleasedReturnValue(-[FMDMagSafeAccessoryManager serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000EF48;
  block[3] = &unk_1000248E0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)launchSetupModuleWithInfo2:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = sub_1000045AC();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "### get asked to launch setup module with info = %@", buf, 0xCu);
  }

  v10 = objc_claimAutoreleasedReturnValue(-[FMDMagSafeAccessoryManager serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F384;
  block[3] = &unk_1000248E0;
  block[4] = self;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  dispatch_async(v10, block);

}

- (void)updateCompletedFor:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeAccessoryManager connectdAccessoryWithSerialNumber:](self, "connectdAccessoryWithSerialNumber:", v6));
  v9 = sub_10000430C();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "### setting keysUpdated for %@", buf, 0xCu);
  }

  if (v8)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100010990;
    v13[3] = &unk_1000256A8;
    v14 = v8;
    v15 = v6;
    v16 = v7;
    objc_msgSend(v14, "getPairingDataWithCompletion:", v13);

  }
  else
  {
    v11 = sub_10000430C();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "### accessory not connected storing the operation", buf, 2u);
    }

    +[FMPreferencesUtil setBool:forKey:inDomain:](FMPreferencesUtil, "setBool:forKey:inDomain:", 1, v6, kFMDNotBackedUpMagSafePrefDomain);
  }

}

- (void)accessoryDidConnect:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;

  v4 = a3;
  v5 = sub_100007B7C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "-[FMDMagSafeAccessoryManager accessoryDidConnect:]";
    v14 = 2112;
    v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeAccessoryManager caGroup](self, "caGroup"));
  if (v7)
  {
    v8 = objc_claimAutoreleasedReturnValue(-[FMDMagSafeAccessoryManager caGroup](self, "caGroup"));
    dispatch_group_leave(v8);

    -[FMDMagSafeAccessoryManager setCaGroup:](self, "setCaGroup:", 0);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMagSafeAccessoryManager connectdAccessoryWithSerialNumber:](self, "connectdAccessoryWithSerialNumber:", v4));
  -[FMDMagSafeAccessoryManager setConnectedAccessory:](self, "setConnectedAccessory:", v9);

  v10 = objc_claimAutoreleasedReturnValue(-[FMDMagSafeAccessoryManager serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100010CC4;
  block[3] = &unk_100024890;
  block[4] = self;
  dispatch_async(v10, block);

}

- (void)accessoryDidDisconnect:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;

  v4 = a3;
  v5 = sub_100007B7C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[FMDMagSafeAccessoryManager accessoryDidDisconnect:]";
    v9 = 2112;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v7, 0x16u);
  }

  -[FMDMagSafeAccessoryManager setConnectedAccessory:](self, "setConnectedAccessory:", 0);
}

- (void)accessoryDidUpdate:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;

  v3 = a3;
  v4 = sub_100007B7C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[FMDMagSafeAccessoryManager accessoryDidUpdate:]";
    v8 = 2112;
    v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v6, 0x16u);
  }

}

- (BOOL)isExtension
{
  return 1;
}

- (NSDictionary)allAccessories
{
  return self->_allAccessories;
}

- (void)setAllAccessories:(id)a3
{
  objc_storeStrong((id *)&self->_allAccessories, a3);
}

- (FMDMagSafeDataStore)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (FMDCoreAccessoryManager)caAccessoryManager
{
  return self->_caAccessoryManager;
}

- (void)setCaAccessoryManager:(id)a3
{
  objc_storeStrong((id *)&self->_caAccessoryManager, a3);
}

- (FMDMagSafeProtocol)connectedAccessory
{
  return self->_connectedAccessory;
}

- (void)setConnectedAccessory:(id)a3
{
  objc_storeStrong((id *)&self->_connectedAccessory, a3);
}

- (OS_dispatch_group)caGroup
{
  return self->_caGroup;
}

- (void)setCaGroup:(id)a3
{
  objc_storeStrong((id *)&self->_caGroup, a3);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (FMFuture)launchFlowFuture
{
  return self->_launchFlowFuture;
}

- (void)setLaunchFlowFuture:(id)a3
{
  objc_storeStrong((id *)&self->_launchFlowFuture, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchFlowFuture, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_caGroup, 0);
  objc_storeStrong((id *)&self->_connectedAccessory, 0);
  objc_storeStrong((id *)&self->_caAccessoryManager, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_allAccessories, 0);
}

@end
