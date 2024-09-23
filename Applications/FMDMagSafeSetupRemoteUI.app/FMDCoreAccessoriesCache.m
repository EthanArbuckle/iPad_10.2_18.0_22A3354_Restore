@implementation FMDCoreAccessoriesCache

- (FMDCoreAccessoriesCache)init
{
  FMDCoreAccessoriesCache *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *accessoryRawInfo;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FMDCoreAccessoriesCache;
  v2 = -[FMDCoreAccessoriesCache init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSMutableDictionary);
    accessoryRawInfo = v2->_accessoryRawInfo;
    v2->_accessoryRawInfo = v3;

  }
  return v2;
}

- (id)accessoriesRawInfo
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCoreAccessoriesCache accessoryRawInfo](self, "accessoryRawInfo"));
  v3 = objc_msgSend(v2, "copy");

  return v3;
}

- (id)getAccessoryWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCoreAccessoriesCache accessoryRawInfo](self, "accessoryRawInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  return v6;
}

- (BOOL)isCachedAccessoryWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCoreAccessoriesCache accessoryRawInfo](self, "accessoryRawInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  return v6 != 0;
}

- (void)saveAccessory:(id)a3 withUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "serialNumber"));
  -[FMDCoreAccessoriesCache _cleanupDuplicationsOfAccessoryWithSerialNumber:currentAccessoryUUID:](self, "_cleanupDuplicationsOfAccessoryWithSerialNumber:currentAccessoryUUID:", v8, v6);

  v9 = (id)objc_claimAutoreleasedReturnValue(-[FMDCoreAccessoriesCache accessoryRawInfo](self, "accessoryRawInfo"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, v6);

}

- (void)accessoryDidUpdateWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[FMDCoreAccessoriesCache accessoryRawInfo](self, "accessoryRawInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "serialNumber"));
  -[FMDCoreAccessoriesCache _cleanupDuplicationsOfAccessoryWithSerialNumber:currentAccessoryUUID:](self, "_cleanupDuplicationsOfAccessoryWithSerialNumber:currentAccessoryUUID:", v6, v4);

}

- (void)deleteAccessoryWithUUID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[FMDCoreAccessoriesCache accessoryRawInfo](self, "accessoryRawInfo"));
  objc_msgSend(v5, "removeObjectForKey:", v4);

}

- (void)_cleanupDuplicationsOfAccessoryWithSerialNumber:(id)a3 currentAccessoryUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  NSMutableArray *v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;

  v6 = a3;
  v7 = a4;
  if (v6 && objc_msgSend(v6, "length"))
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = sub_100004B1C;
    v22 = sub_100004B2C;
    v23 = objc_opt_new(NSMutableArray);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCoreAccessoriesCache accessoryRawInfo](self, "accessoryRawInfo"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100004B34;
    v14[3] = &unk_100034640;
    v9 = v6;
    v15 = v9;
    v16 = v7;
    v17 = &v18;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v14);

    if (objc_msgSend((id)v19[5], "count"))
    {
      v10 = sub_100005190();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = objc_msgSend((id)v19[5], "count");
        *(_DWORD *)buf = 134218242;
        v25 = v12;
        v26 = 2112;
        v27 = v9;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "FMDCoreAccessoriesCache removing %lu duplications of accessory with %@ serial number", buf, 0x16u);
      }

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCoreAccessoriesCache accessoryRawInfo](self, "accessoryRawInfo"));
    objc_msgSend(v13, "removeObjectsForKeys:", v19[5]);

    _Block_object_dispose(&v18, 8);
  }

}

- (NSMutableDictionary)accessoryRawInfo
{
  return self->_accessoryRawInfo;
}

- (void)setAccessoryRawInfo:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryRawInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryRawInfo, 0);
}

@end
