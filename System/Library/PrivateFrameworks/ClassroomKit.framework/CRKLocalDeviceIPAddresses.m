@implementation CRKLocalDeviceIPAddresses

- (CRKLocalDeviceIPAddresses)init
{
  CRKLocalDeviceIPAddresses *v2;
  uint64_t v3;
  NSSet *IPAddresses;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRKLocalDeviceIPAddresses;
  v2 = -[CRKLocalDeviceIPAddresses init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend((id)objc_opt_class(), "makeIPAddresses");
    v3 = objc_claimAutoreleasedReturnValue();
    IPAddresses = v2->_IPAddresses;
    v2->_IPAddresses = (NSSet *)v3;

  }
  return v2;
}

- (BOOL)containsIPAddress:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[CRKLocalDeviceIPAddresses IPAddresses](self, "IPAddresses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

+ (id)makeIPAddresses
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  id v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v19 = 0;
  +[CRKIfaddrsEnumerator internetInterfaceEnumeratorWithError:](CRKIfaddrsEnumerator, "internetInterfaceEnumeratorWithError:", &v19);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v19;
  if (v3)
  {
    v5 = (void *)objc_opt_new();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "IPAddress", (_QWORD)v15);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
            objc_msgSend(v5, "addObject:", v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v8);
    }

    v12 = (void *)objc_msgSend(v5, "copy");
  }
  else
  {
    if (_CRKLogGeneral_onceToken_45 != -1)
      dispatch_once(&_CRKLogGeneral_onceToken_45, &__block_literal_global_120);
    v13 = (void *)_CRKLogGeneral_logObj_45;
    if (os_log_type_enabled((os_log_t)_CRKLogGeneral_logObj_45, OS_LOG_TYPE_ERROR))
      +[CRKLocalDeviceIPAddresses makeIPAddresses].cold.1(v13, (uint64_t)a1, v4);
    v12 = (void *)objc_opt_new();
  }

  return v12;
}

- (NSSet)IPAddresses
{
  return self->_IPAddresses;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_IPAddresses, 0);
}

+ (void)makeIPAddresses
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a1;
  v5 = objc_opt_class();
  objc_msgSend(a3, "verboseDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = v5;
  v9 = 2114;
  v10 = v6;
  _os_log_error_impl(&dword_218C99000, v4, OS_LOG_TYPE_ERROR, "Failed to create ifaddrs enumerator in %{public}@: %{public}@", (uint8_t *)&v7, 0x16u);

}

@end
