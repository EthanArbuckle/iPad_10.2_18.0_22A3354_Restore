@implementation BKAccessory

- (BKAccessory)initWithServerAccessory:(id)a3 device:(id)a4
{
  id v6;
  id v7;
  BKAccessory *v8;
  uint64_t v9;
  NSUUID *uuid;
  uint64_t v11;
  NSString *name;
  BKAccessoryGroup *v13;
  void *v14;
  uint64_t v15;
  BKAccessoryGroup *accessoryGroup;
  NSObject *v18;
  objc_super v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)BKAccessory;
  v8 = -[BKAccessory init](&v19, sel_init);
  if (v8)
  {
    if (v6)
    {
      v8->_type = objc_msgSend(v6, "type");
      objc_msgSend(v6, "uuid");
      v9 = objc_claimAutoreleasedReturnValue();
      uuid = v8->_uuid;
      v8->_uuid = (NSUUID *)v9;

      v8->_flags = objc_msgSend(v6, "flags");
      objc_msgSend(v6, "name");
      v11 = objc_claimAutoreleasedReturnValue();
      name = v8->_name;
      v8->_name = (NSString *)v11;

      v13 = [BKAccessoryGroup alloc];
      objc_msgSend(v6, "group");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[BKAccessoryGroup initWithServerAccessoryGroup:device:](v13, "initWithServerAccessoryGroup:device:", v14, v7);
      accessoryGroup = v8->_accessoryGroup;
      v8->_accessoryGroup = (BKAccessoryGroup *)v15;

      objc_storeStrong((id *)&v8->_device, a4);
    }
    else
    {
      if (__osLog)
        v18 = __osLog;
      else
        v18 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v21 = "serverAccessory";
        v22 = 2048;
        v23 = 0;
        v24 = 2080;
        v25 = &unk_1AF575226;
        v26 = 2080;
        v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKAccessory.m";
        v28 = 1024;
        v29 = 34;
        _os_log_impl(&dword_1AF533000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }

      v8 = 0;
    }
  }

  return v8;
}

- (id)serverAccessory
{
  BiometricKitAccessory *v3;
  void *v4;

  v3 = objc_alloc_init(BiometricKitAccessory);
  -[BiometricKitAccessory setType:](v3, "setType:", self->_type);
  -[BiometricKitAccessory setUuid:](v3, "setUuid:", self->_uuid);
  -[BiometricKitAccessory setName:](v3, "setName:", self->_name);
  -[BiometricKitAccessory setFlags:](v3, "setFlags:", self->_flags);
  -[BKAccessoryGroup serverAccessoryGroup](self->_accessoryGroup, "serverAccessoryGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BiometricKitAccessory setGroup:](v3, "setGroup:", v4);

  return v3;
}

- (BOOL)isRemovable
{
  return self->_flags & 1;
}

- (NSData)uid
{
  void *v2;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  if (self->_type == 2)
  {
    v4[0] = 0;
    v4[1] = 0;
    -[NSUUID getUUIDBytes:](self->_uuid, "getUUIDBytes:", v4);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v4, 16);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return (NSData *)v2;
}

- (BOOL)isEqualToServerAccessory:(id)a3
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

- (BOOL)isEqualToAccessory:(id)a3
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
  BKAccessory *v4;
  BOOL v5;

  v4 = (BKAccessory *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[BKAccessory isEqualToAccessory:](self, "isEqualToAccessory:", v4);
  }

  return v5;
}

- (unint64_t)hash
{
  return self->_type;
}

- (BOOL)isConnected:(BOOL *)a3 error:(id *)a4
{
  NSObject *v7;
  NSObject *v8;
  BiometricKitXPCClient *xpcClient;
  NSObject *v10;
  BiometricKitXPCClient *v11;
  int v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  NSObject *v20;
  _BOOL4 v21;
  id v22;
  BOOL v23;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  _BOOL4 v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  uint8_t v36[128];
  uint8_t buf[4];
  _BYTE v38[18];
  __int16 v39;
  void *v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  int v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v7 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v8 = __osLogTrace;
  else
    v8 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_device->_xpcClient;
    v10 = v8;
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)v38 = -[BiometricKitXPCClient connectionId](xpcClient, "connectionId");
    _os_log_impl(&dword_1AF533000, v10, OS_LOG_TYPE_DEFAULT, "BKAccessory:isConnected: (_cid %lu)\n", buf, 0xCu);

  }
  if (!a3)
  {
    if (__osLog)
      v25 = __osLog;
    else
      v25 = v7;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v38 = "connected";
      *(_WORD *)&v38[8] = 2048;
      *(_QWORD *)&v38[10] = 0;
      v39 = 2080;
      v40 = &unk_1AF575226;
      v41 = 2080;
      v42 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKAccessory.m";
      v43 = 1024;
      v44 = 138;
      _os_log_impl(&dword_1AF533000, v25, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    setError((id)1, a4);
    v14 = 0;
    goto LABEL_40;
  }
  v11 = self->_device->_xpcClient;
  v35 = 0;
  v12 = -[BiometricKitXPCClient listAccessories:](v11, "listAccessories:", &v35);
  v13 = v35;
  v14 = v13;
  if (v12)
  {
    v26 = (void *)v12;
    if (__osLog)
      v27 = __osLog;
    else
      v27 = v7;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v38 = "err == 0 ";
      *(_WORD *)&v38[8] = 2048;
      *(_QWORD *)&v38[10] = v26;
      v39 = 2080;
      v40 = &unk_1AF575226;
      v41 = 2080;
      v42 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKAccessory.m";
      v43 = 1024;
      v44 = 141;
      _os_log_impl(&dword_1AF533000, v27, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    setErrorWithOSStatus(v26, a4);
LABEL_40:
    if (__osLogTrace)
      v28 = __osLogTrace;
    else
      v28 = v7;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      if (a3)
        v29 = *a3;
      else
        v29 = 0;
      if (a4)
        v30 = *a4;
      else
        v30 = 0;
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v38 = v29;
      *(_WORD *)&v38[4] = 2112;
      *(_QWORD *)&v38[6] = v30;
      _os_log_impl(&dword_1AF533000, v28, OS_LOG_TYPE_ERROR, "BKAccessory::isConnected: -> %u %@\n", buf, 0x12u);
    }
    v23 = 0;
    goto LABEL_27;
  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v14 = v13;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v32;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v32 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        if (-[BKAccessory isEqualToServerAccessory:](self, "isEqualToServerAccessory:", v19, (_QWORD)v31))
        {
          *a3 = (objc_msgSend(v19, "flags") & 2) != 0;
          goto LABEL_18;
        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      if (v16)
        continue;
      break;
    }
  }
LABEL_18:

  if (__osLogTrace)
    v20 = __osLogTrace;
  else
    v20 = v7;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = *a3;
    if (a4)
      v22 = *a4;
    else
      v22 = 0;
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v38 = v21;
    *(_WORD *)&v38[4] = 2112;
    *(_QWORD *)&v38[6] = v22;
    _os_log_impl(&dword_1AF533000, v20, OS_LOG_TYPE_DEFAULT, "BKAccessory::isConnected: -> %u %@\n", buf, 0x12u);
  }
  v23 = 1;
LABEL_27:

  return v23;
}

- (BOOL)isAuthorized:(BOOL *)a3 error:(id *)a4
{
  NSObject *v7;
  NSObject *v8;
  BiometricKitXPCClient *xpcClient;
  NSObject *v10;
  BiometricKitXPCClient *v11;
  int v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  NSObject *v20;
  _BOOL4 v21;
  id v22;
  BOOL v23;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  _BOOL4 v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  uint8_t v36[128];
  uint8_t buf[4];
  _BYTE v38[18];
  __int16 v39;
  void *v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  int v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v7 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v8 = __osLogTrace;
  else
    v8 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_device->_xpcClient;
    v10 = v8;
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)v38 = -[BiometricKitXPCClient connectionId](xpcClient, "connectionId");
    _os_log_impl(&dword_1AF533000, v10, OS_LOG_TYPE_DEFAULT, "BKAccessory:isAuthorized: (_cid %lu)\n", buf, 0xCu);

  }
  if (!a3)
  {
    if (__osLog)
      v25 = __osLog;
    else
      v25 = v7;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v38 = "authorized";
      *(_WORD *)&v38[8] = 2048;
      *(_QWORD *)&v38[10] = 0;
      v39 = 2080;
      v40 = &unk_1AF575226;
      v41 = 2080;
      v42 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKAccessory.m";
      v43 = 1024;
      v44 = 170;
      _os_log_impl(&dword_1AF533000, v25, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    setError((id)1, a4);
    v14 = 0;
    goto LABEL_40;
  }
  v11 = self->_device->_xpcClient;
  v35 = 0;
  v12 = -[BiometricKitXPCClient listAccessories:](v11, "listAccessories:", &v35);
  v13 = v35;
  v14 = v13;
  if (v12)
  {
    v26 = (void *)v12;
    if (__osLog)
      v27 = __osLog;
    else
      v27 = v7;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v38 = "err == 0 ";
      *(_WORD *)&v38[8] = 2048;
      *(_QWORD *)&v38[10] = v26;
      v39 = 2080;
      v40 = &unk_1AF575226;
      v41 = 2080;
      v42 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKAccessory.m";
      v43 = 1024;
      v44 = 173;
      _os_log_impl(&dword_1AF533000, v27, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    setErrorWithOSStatus(v26, a4);
LABEL_40:
    if (__osLogTrace)
      v28 = __osLogTrace;
    else
      v28 = v7;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      if (a3)
        v29 = *a3;
      else
        v29 = 0;
      if (a4)
        v30 = *a4;
      else
        v30 = 0;
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v38 = v29;
      *(_WORD *)&v38[4] = 2112;
      *(_QWORD *)&v38[6] = v30;
      _os_log_impl(&dword_1AF533000, v28, OS_LOG_TYPE_ERROR, "BKAccessory::isAuthorized: -> %u %@\n", buf, 0x12u);
    }
    v23 = 0;
    goto LABEL_27;
  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v14 = v13;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v32;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v32 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        if (-[BKAccessory isEqualToServerAccessory:](self, "isEqualToServerAccessory:", v19, (_QWORD)v31))
        {
          *a3 = (objc_msgSend(v19, "flags") & 4) != 0;
          goto LABEL_18;
        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      if (v16)
        continue;
      break;
    }
  }
LABEL_18:

  if (__osLogTrace)
    v20 = __osLogTrace;
  else
    v20 = v7;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = *a3;
    if (a4)
      v22 = *a4;
    else
      v22 = 0;
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v38 = v21;
    *(_WORD *)&v38[4] = 2112;
    *(_QWORD *)&v38[6] = v22;
    _os_log_impl(&dword_1AF533000, v20, OS_LOG_TYPE_DEFAULT, "BKAccessory::isAuthorized: -> %u %@\n", buf, 0x12u);
  }
  v23 = 1;
LABEL_27:

  return v23;
}

- (NSString)name
{
  return self->_name;
}

- (BKAccessoryGroup)accessoryGroup
{
  return self->_accessoryGroup;
}

- (BKDevice)device
{
  return self->_device;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_accessoryGroup, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
