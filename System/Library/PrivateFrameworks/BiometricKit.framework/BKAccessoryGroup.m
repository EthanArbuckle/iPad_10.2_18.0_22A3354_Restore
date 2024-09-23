@implementation BKAccessoryGroup

- (BKAccessoryGroup)initWithServerAccessoryGroup:(id)a3 device:(id)a4
{
  id v6;
  id v7;
  BKAccessoryGroup *v8;
  uint64_t v9;
  NSUUID *uuid;
  uint64_t v11;
  NSString *name;
  NSObject *v14;
  objc_super v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)BKAccessoryGroup;
  v8 = -[BKAccessoryGroup init](&v15, sel_init);
  if (v8)
  {
    if (v6)
    {
      v8->_type = objc_msgSend(v6, "type");
      objc_msgSend(v6, "uuid");
      v9 = objc_claimAutoreleasedReturnValue();
      uuid = v8->_uuid;
      v8->_uuid = (NSUUID *)v9;

      objc_msgSend(v6, "name");
      v11 = objc_claimAutoreleasedReturnValue();
      name = v8->_name;
      v8->_name = (NSString *)v11;

      objc_storeStrong((id *)&v8->_device, a4);
    }
    else
    {
      if (__osLog)
        v14 = __osLog;
      else
        v14 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v17 = "serverAccessoryGroup";
        v18 = 2048;
        v19 = 0;
        v20 = 2080;
        v21 = &unk_1AF575226;
        v22 = 2080;
        v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKAccessoryGroup.m";
        v24 = 1024;
        v25 = 33;
        _os_log_impl(&dword_1AF533000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }

      v8 = 0;
    }
  }

  return v8;
}

- (id)serverAccessoryGroup
{
  BiometricKitAccessoryGroup *v3;

  v3 = objc_alloc_init(BiometricKitAccessoryGroup);
  -[BiometricKitAccessoryGroup setType:](v3, "setType:", self->_type);
  -[BiometricKitAccessoryGroup setUuid:](v3, "setUuid:", self->_uuid);
  -[BiometricKitAccessoryGroup setName:](v3, "setName:", self->_name);
  return v3;
}

- (id)accessoriesWithError:(id *)a3
{
  NSObject *v4;
  NSObject *v5;
  BiometricKitXPCClient *xpcClient;
  NSObject *v7;
  uint64_t v8;
  BiometricKitXPCClient *v9;
  int v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  _BOOL4 v20;
  BKAccessory *v21;
  NSObject *v22;
  _QWORD *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  _QWORD *v27;
  _QWORD *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  id v36;
  uint8_t v37[128];
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  int v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v5 = __osLogTrace;
  else
    v5 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_device->_xpcClient;
    v7 = v5;
    v8 = -[BiometricKitXPCClient connectionId](xpcClient, "connectionId");
    *(_DWORD *)buf = 134217984;
    v39 = (const char *)v8;
    _os_log_impl(&dword_1AF533000, v7, OS_LOG_TYPE_DEFAULT, "BKAccessoryGroup::accessoriesWithError: (_cid %lu)\n", buf, 0xCu);

  }
  v9 = self->_device->_xpcClient;
  v36 = 0;
  v10 = -[BiometricKitXPCClient listAccessories:](v9, "listAccessories:", &v36, a3);
  v11 = v36;
  if (v10)
  {
    v24 = (void *)v10;
    if (__osLog)
      v25 = __osLog;
    else
      v25 = v4;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v39 = "err == 0 ";
      v40 = 2048;
      v41 = v24;
      v42 = 2080;
      v43 = &unk_1AF575226;
      v44 = 2080;
      v45 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKAccessoryGroup.m";
      v46 = 1024;
      v47 = 72;
      _os_log_impl(&dword_1AF533000, v25, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    setErrorWithOSStatus(v24, v30);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v31 = v11;
    v13 = v11;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v33 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v18, "group");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = -[BKAccessoryGroup isEqualToServerAccessoryGroup:](self, "isEqualToServerAccessoryGroup:", v19);

          if (v20)
          {
            v21 = -[BKAccessory initWithServerAccessory:device:]([BKAccessory alloc], "initWithServerAccessory:device:", v18, self->_device);
            objc_msgSend(v12, "addObject:", v21);

          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v15);
    }

    v11 = v31;
    v4 = MEMORY[0x1E0C81028];
    if (v12)
    {
      if (__osLogTrace)
        v22 = __osLogTrace;
      else
        v22 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = v30;
        if (v30)
          v23 = (_QWORD *)*v30;
        *(_DWORD *)buf = 138412546;
        v39 = (const char *)v12;
        v40 = 2112;
        v41 = v23;
        _os_log_impl(&dword_1AF533000, v22, OS_LOG_TYPE_DEFAULT, "BKAccessoryGroup::accessoriesWithError: -> %@ %@\n", buf, 0x16u);
      }
      goto LABEL_38;
    }
  }
  if (__osLogTrace)
    v26 = __osLogTrace;
  else
    v26 = v4;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    v27 = v30;
    if (v30)
      v27 = (_QWORD *)*v30;
    *(_DWORD *)buf = 138412546;
    v39 = 0;
    v40 = 2112;
    v41 = v27;
    _os_log_impl(&dword_1AF533000, v26, OS_LOG_TYPE_ERROR, "BKAccessoryGroup::accessoriesWithError: -> %@ %@\n", buf, 0x16u);
  }
  v12 = 0;
LABEL_38:

  return v12;
}

- (id)connectedAccessoriesWithError:(id *)a3
{
  NSObject *v4;
  NSObject *v5;
  BiometricKitXPCClient *xpcClient;
  NSObject *v7;
  uint64_t v8;
  BiometricKitXPCClient *v9;
  int v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  BKAccessory *v19;
  char v20;
  NSObject *v21;
  _QWORD *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  _QWORD *v26;
  _QWORD *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  uint8_t v36[128];
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  int v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v5 = __osLogTrace;
  else
    v5 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_device->_xpcClient;
    v7 = v5;
    v8 = -[BiometricKitXPCClient connectionId](xpcClient, "connectionId");
    *(_DWORD *)buf = 134217984;
    v38 = (const char *)v8;
    _os_log_impl(&dword_1AF533000, v7, OS_LOG_TYPE_DEFAULT, "BKAccessoryGroup::connectedAccessoriesWithError: (_cid %lu)\n", buf, 0xCu);

  }
  v9 = self->_device->_xpcClient;
  v35 = 0;
  v10 = -[BiometricKitXPCClient listAccessories:](v9, "listAccessories:", &v35, a3);
  v11 = v35;
  if (v10)
  {
    v23 = (void *)v10;
    if (__osLog)
      v24 = __osLog;
    else
      v24 = v4;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v38 = "err == 0 ";
      v39 = 2048;
      v40 = v23;
      v41 = 2080;
      v42 = &unk_1AF575226;
      v43 = 2080;
      v44 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKAccessoryGroup.m";
      v45 = 1024;
      v46 = 100;
      _os_log_impl(&dword_1AF533000, v24, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    setErrorWithOSStatus(v23, v29);
    goto LABEL_32;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v30 = v11;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (!v14)
    goto LABEL_18;
  v15 = v14;
  v16 = *(_QWORD *)v32;
  do
  {
    for (i = 0; i != v15; ++i)
    {
      if (*(_QWORD *)v32 != v16)
        objc_enumerationMutation(v13);
      v18 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
      objc_msgSend(v18, "group");
      v19 = (BKAccessory *)objc_claimAutoreleasedReturnValue();
      if (-[BKAccessoryGroup isEqualToServerAccessoryGroup:](self, "isEqualToServerAccessoryGroup:", v19))
      {
        v20 = objc_msgSend(v18, "flags");

        if ((v20 & 2) == 0)
          continue;
        v19 = -[BKAccessory initWithServerAccessory:device:]([BKAccessory alloc], "initWithServerAccessory:device:", v18, self->_device);
        objc_msgSend(v12, "addObject:", v19);
      }

    }
    v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  }
  while (v15);
LABEL_18:

  v11 = v30;
  v4 = MEMORY[0x1E0C81028];
  if (v12)
  {
    if (__osLogTrace)
      v21 = __osLogTrace;
    else
      v21 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = v29;
      if (v29)
        v22 = (_QWORD *)*v29;
      *(_DWORD *)buf = 138412546;
      v38 = (const char *)v12;
      v39 = 2112;
      v40 = v22;
      _os_log_impl(&dword_1AF533000, v21, OS_LOG_TYPE_DEFAULT, "BKAccessoryGroup::connectedAccessoriesWithError: -> %@ %@\n", buf, 0x16u);
    }
    goto LABEL_40;
  }
LABEL_32:
  if (__osLogTrace)
    v25 = __osLogTrace;
  else
    v25 = v4;
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    v26 = v29;
    if (v29)
      v26 = (_QWORD *)*v29;
    *(_DWORD *)buf = 138412546;
    v38 = 0;
    v39 = 2112;
    v40 = v26;
    _os_log_impl(&dword_1AF533000, v25, OS_LOG_TYPE_ERROR, "BKAccessoryGroup::connectedAccessoriesWithError: -> %@ %@\n", buf, 0x16u);
  }
  v12 = 0;
LABEL_40:

  return v12;
}

- (BOOL)isEqualToServerAccessoryGroup:(id)a3
{
  id v4;
  void *v5;
  unsigned int type;
  NSUUID *uuid;
  void *v8;
  char v9;

  v4 = a3;
  v5 = v4;
  if (v4 && (type = self->_type, type == objc_msgSend(v4, "type")))
  {
    uuid = self->_uuid;
    objc_msgSend(v5, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[NSUUID isEqual:](uuid, "isEqual:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isEqualToAccessoryGroup:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  v5 = v4;
  if (v4 && self->_type == *((_DWORD *)v4 + 2))
    v6 = -[NSUUID isEqual:](self->_uuid, "isEqual:", *((_QWORD *)v4 + 2));
  else
    v6 = 0;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  BKAccessoryGroup *v4;
  BOOL v5;

  v4 = (BKAccessoryGroup *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[BKAccessoryGroup isEqualToAccessoryGroup:](self, "isEqualToAccessoryGroup:", v4);
  }

  return v5;
}

- (unint64_t)hash
{
  return self->_type;
}

- (NSString)name
{
  return self->_name;
}

- (BKDevice)device
{
  return self->_device;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
