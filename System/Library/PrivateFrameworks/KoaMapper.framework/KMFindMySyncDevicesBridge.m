@implementation KMFindMySyncDevicesBridge

- (KMFindMySyncDevicesBridge)init
{
  _TtC9KoaMapper27KMFindMySyncDevicesProvider *v3;
  KMFindMySyncDevicesBridge *v4;

  v3 = objc_alloc_init(_TtC9KoaMapper27KMFindMySyncDevicesProvider);
  v4 = -[KMFindMySyncDevicesBridge initWithDevicesProvider:](self, "initWithDevicesProvider:", v3);

  return v4;
}

- (KMFindMySyncDevicesBridge)initWithDevicesProvider:(id)a3
{
  id v5;
  KMFindMySyncDevicesBridge *v6;
  KMFindMySyncDevicesBridge *v7;
  KMFindMySyncDevicesBridge *v8;
  NSObject *v9;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)KMFindMySyncDevicesBridge;
  v6 = -[KMFindMySyncDevicesBridge init](&v11, sel_init);
  v7 = v6;
  if (v6 && (objc_storeStrong((id *)&v6->_devicesProvider, a3), !v7->_devicesProvider))
  {
    v9 = KMLogContextCore;
    if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[KMFindMySyncDevicesBridge initWithDevicesProvider:]";
      _os_log_error_impl(&dword_218838000, v9, OS_LOG_TYPE_ERROR, "%s nil devicesProvider.", buf, 0xCu);
    }
    v8 = 0;
  }
  else
  {
    v8 = v7;
  }

  return v8;
}

- (unsigned)cascadeItemType
{
  return 27122;
}

- (id)originAppId
{
  return (id)*MEMORY[0x24BE5E890];
}

- (BOOL)enumerateItemsWithError:(id *)a3 usingBlock:(id)a4
{
  uint64_t (**v5)(id, _QWORD);
  _TtC9KoaMapper27KMFindMySyncDevicesProvider *devicesProvider;
  void *v7;
  id v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  BOOL v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  uint8_t v26[128];
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = (uint64_t (**)(id, _QWORD))a4;
  devicesProvider = self->_devicesProvider;
  v25 = 0;
  -[KMFindMySyncDevicesProvider getSyncDevices:](devicesProvider, "getSyncDevices:", &v25);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v25;
  v9 = v8;
  if (v7)
    v10 = v8 == 0;
  else
    v10 = 0;
  if (v10)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v13 = v7;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v22;
      while (2)
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v22 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v17);
          v19 = (void *)MEMORY[0x219A1AD04](v14);
          LODWORD(v18) = v5[2](v5, v18);
          objc_autoreleasePoolPop(v19);
          if (!(_DWORD)v18)
          {
            v12 = 0;
            goto LABEL_18;
          }
          ++v17;
        }
        while (v15 != v17);
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        v15 = v14;
        if (v14)
          continue;
        break;
      }
    }
    v12 = 1;
LABEL_18:

  }
  else
  {
    v11 = KMLogContextCore;
    if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v28 = "-[KMFindMySyncDevicesBridge enumerateItemsWithError:usingBlock:]";
      v29 = 2112;
      v30 = v9;
      _os_log_error_impl(&dword_218838000, v11, OS_LOG_TYPE_ERROR, "%s Failed to fetch FindMy devices with error: %@.", buf, 0x16u);
    }
    KVSetError();
    v12 = 0;
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devicesProvider, 0);
}

@end
