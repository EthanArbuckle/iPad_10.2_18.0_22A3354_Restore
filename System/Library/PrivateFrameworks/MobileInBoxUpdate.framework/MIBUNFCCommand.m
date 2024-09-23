@implementation MIBUNFCCommand

- (MIBUNFCCommand)initWithCommandCode:(int64_t)a3 andPayload:(id)a4
{
  id v6;
  MIBUNFCCommand *v7;
  MIBUNFCCommand *v8;
  void *v9;
  MIBUNFCCommand *v10;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MIBUNFCCommand;
  v7 = -[MIBUNFCCommand init](&v12, sel_init);
  v8 = v7;
  if (v7
    && (v7->_code = a3,
        v9 = (void *)objc_msgSend(v6, "mutableCopy"),
        -[MIBUNFCCommand setMutablePayload:](v8, "setMutablePayload:", v9),
        v9,
        !-[MIBUNFCCommand _initWithCommandCode:](v8, "_initWithCommandCode:", a3)))
  {
    v10 = 0;
  }
  else
  {
    v10 = v8;
  }

  return v10;
}

- (MIBUNFCCommand)initWithAPDU:(id)a3
{
  id v5;
  MIBUNFCCommand *v6;
  MIBUNFCCommand *v7;
  void *v8;
  MIBUNFCCommand *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MIBUNFCCommand;
  v6 = -[MIBUNFCCommand init](&v11, sel_init);
  v7 = v6;
  if (v6
    && (objc_storeStrong((id *)&v6->_apdu, a3),
        v8 = (void *)objc_opt_new(),
        -[MIBUNFCCommand setMutablePayload:](v7, "setMutablePayload:", v8),
        v8,
        !-[MIBUNFCCommand _initWithAPDU:](v7, "_initWithAPDU:", v5)))
  {
    v9 = 0;
  }
  else
  {
    v9 = v7;
  }

  return v9;
}

- (Class)getResponseClass
{
  objc_opt_class();
  -[MIBUNFCCommand code](self, "code");
  return (Class)(id)objc_opt_class();
}

- (BOOL)_initWithCommandCode:(int64_t)a3
{
  void *v5;
  NSData *serializedPayload;
  uint64_t *p_code;
  NSData *v8;
  unsigned __int8 v9;
  void *v10;
  NSData *v11;
  NSData *v12;
  NSObject *v13;
  uint64_t v14;
  BOOL v15;
  NSData *v16;
  NSUInteger v17;
  __int16 v18;
  void *v19;
  uint64_t v20;
  NSObject *v22;
  uint64_t v23;
  int v24;
  char v25;
  char v26;
  char v27;

  v5 = (void *)objc_opt_new();
  self->_cla = 0;
  serializedPayload = self->_serializedPayload;
  self->_serializedPayload = 0;

  p_code = &self->_code;
  switch(self->_code)
  {
    case 1:
      *(_WORD *)&self->_ins = 458;
      self->_p2 = 0;
      goto LABEL_16;
    case 2:
      *(_WORD *)&self->_ins = 474;
      self->_p2 = 1;
      -[MIBUNFCCommand _serializeStartUpdate](self, "_serializeStartUpdate");
      v8 = (NSData *)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    case 3:
      *(_WORD *)&self->_ins = 458;
      v9 = 2;
      goto LABEL_15;
    case 4:
      *(_WORD *)&self->_ins = 1188;
      self->_p2 = 0;
      -[MIBUNFCCommand mutablePayload](self, "mutablePayload");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", CFSTR("ApplicationID"));
      v11 = (NSData *)objc_claimAutoreleasedReturnValue();
      v12 = self->_serializedPayload;
      self->_serializedPayload = v11;

      goto LABEL_20;
    case 6:
      *(_WORD *)&self->_ins = 474;
      self->_p2 = 2;
      -[MIBUNFCCommand _serializeRetryAfter](self, "_serializeRetryAfter");
      v8 = (NSData *)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    case 7:
      *(_WORD *)&self->_ins = 474;
      self->_p2 = 3;
      -[MIBUNFCCommand _serializeHeartbeat](self, "_serializeHeartbeat");
      v8 = (NSData *)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    case 8:
      *(_WORD *)&self->_ins = 474;
      v9 = 4;
      goto LABEL_15;
    case 9:
      *(_WORD *)&self->_ins = 458;
      v9 = 3;
LABEL_15:
      self->_p2 = v9;
LABEL_16:
      v8 = (NSData *)objc_opt_new();
      goto LABEL_19;
    case 0xALL:
      *(_WORD *)&self->_ins = 474;
      self->_p2 = 5;
      -[MIBUNFCCommand _serializeConfigureNFC](self, "_serializeConfigureNFC");
      v8 = (NSData *)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    case 0xBLL:
      *(_WORD *)&self->_ins = 474;
      self->_p2 = 6;
      -[MIBUNFCCommand _serializeStartDiag](self, "_serializeStartDiag");
      v8 = (NSData *)objc_claimAutoreleasedReturnValue();
LABEL_19:
      v10 = self->_serializedPayload;
      self->_serializedPayload = v8;
LABEL_20:

      v16 = self->_serializedPayload;
      if (v16)
      {
        v24 = *(_DWORD *)&self->_cla;
        if (-[NSData length](v16, "length"))
        {
          v17 = -[NSData length](self->_serializedPayload, "length");
          v18 = -[NSData length](self->_serializedPayload, "length");
          if (v17 > 0xFF)
          {
            v25 = 0;
            v26 = HIBYTE(v18);
            v27 = v18;
            v19 = v5;
            v20 = 7;
          }
          else
          {
            v25 = v18;
            v19 = v5;
            v20 = 5;
          }
          objc_msgSend(v19, "appendBytes:length:", &v24, v20);
          objc_msgSend(v5, "appendData:", self->_serializedPayload);
        }
        else
        {
          objc_msgSend(v5, "appendBytes:length:", &v24, 4);
        }
        objc_storeStrong((id *)&self->_apdu, v5);
        v15 = 1;
      }
      else
      {
        if (MIBUOnceToken != -1)
          dispatch_once(&MIBUOnceToken, &__block_literal_global_26_1);
        v22 = MIBUConnObj;
        if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
          -[MIBUNFCCommand _initWithCommandCode:].cold.2(p_code, v22, v23);
LABEL_10:
        v15 = 0;
      }

      return v15;
    default:
      if (MIBUOnceToken != -1)
        dispatch_once(&MIBUOnceToken, &__block_literal_global_9);
      v13 = MIBUConnObj;
      if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
        -[MIBUNFCCommand _initWithCommandCode:].cold.1(a3, v13, v14);
      goto LABEL_10;
  }
}

void __39__MIBUNFCCommand__initWithCommandCode___block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __39__MIBUNFCCommand__initWithCommandCode___block_invoke_25()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (BOOL)_initWithAPDU:(id)a3
{
  id v4;
  NSData *serializedPayload;
  id v6;
  unsigned __int8 *v7;
  int v8;
  unsigned __int8 *v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  unsigned int v14;
  NSData *v15;
  uint64_t v16;
  uint64_t v17;
  NSData *v18;
  BOOL v19;
  void *v20;
  void *v21;
  NSData *v22;
  const __CFString *v23;
  int64_t v24;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;

  v4 = a3;
  self->_code = 0;
  serializedPayload = self->_serializedPayload;
  self->_serializedPayload = 0;

  if ((unint64_t)objc_msgSend(v4, "length") <= 3)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_27_1);
    v26 = (void *)MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUNFCCommand _initWithAPDU:].cold.1(v26);
    goto LABEL_82;
  }
  v6 = objc_retainAutorelease(v4);
  v7 = (unsigned __int8 *)objc_msgSend(v6, "bytes");
  v8 = *v7;
  if (*v7)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_29_0);
    v27 = MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUNFCCommand _initWithAPDU:].cold.10(v8, v27);
    goto LABEL_82;
  }
  v9 = v7;
  v10 = v7[1];
  v11 = v7[2];
  v12 = v7[3];
  if (objc_msgSend(v6, "length") == 4)
  {
LABEL_6:
    v15 = (NSData *)objc_opt_new();
    goto LABEL_13;
  }
  v13 = objc_msgSend(v6, "length");
  v14 = v9[4];
  if (v13 == 5)
  {
    if (v9[4])
    {
      if (MIBUOnceToken != -1)
        dispatch_once(&MIBUOnceToken, &__block_literal_global_31_0);
      if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
        -[MIBUNFCCommand _initWithAPDU:].cold.7();
      goto LABEL_82;
    }
    goto LABEL_6;
  }
  if (v9[4])
  {
    v16 = 5;
  }
  else
  {
    if ((unint64_t)objc_msgSend(v6, "length") <= 6)
    {
      if (MIBUOnceToken != -1)
        dispatch_once(&MIBUOnceToken, &__block_literal_global_33_0);
      v29 = (void *)MIBUConnObj;
      if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
        -[MIBUNFCCommand _initWithAPDU:].cold.8(v29);
      goto LABEL_82;
    }
    v14 = bswap32(*(unsigned __int16 *)(v9 + 5)) >> 16;
    v16 = 7;
  }
  v17 = v14;
  if (v16 + (unint64_t)v14 > objc_msgSend(v6, "length"))
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_35_1);
    v28 = (void *)MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUNFCCommand _initWithAPDU:].cold.9(v17, v28);
    goto LABEL_82;
  }
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", objc_msgSend(objc_retainAutorelease(v6), "bytes") + v16, v17, 0);
  v15 = (NSData *)objc_claimAutoreleasedReturnValue();
LABEL_13:
  v18 = self->_serializedPayload;
  self->_serializedPayload = v15;

  v19 = 1;
  if (v10 > 201)
  {
    if (v10 == 202)
    {
      if (v11 == 1 && !v12)
      {
        v19 = 1;
        self->_code = 1;
        goto LABEL_59;
      }
      if (v11 == 1 && v12 == 2)
      {
        v24 = 3;
      }
      else
      {
        v19 = 1;
        if (v11 != 1 || v12 != 3)
          goto LABEL_59;
        v24 = 9;
      }
    }
    else
    {
      if (v10 != 218)
        goto LABEL_59;
      if (v11 == 1 && v12 == 1)
      {
        self->_code = 2;
        if (-[MIBUNFCCommand _deserializeStartUpdate](self, "_deserializeStartUpdate"))
          goto LABEL_58;
        if (MIBUOnceToken != -1)
          dispatch_once(&MIBUOnceToken, &__block_literal_global_37_2);
        if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
          -[MIBUNFCCommand _initWithAPDU:].cold.2();
        goto LABEL_82;
      }
      if (v11 == 1 && v12 == 2)
      {
        self->_code = 6;
        if (-[MIBUNFCCommand _deserializeRetryAfter](self, "_deserializeRetryAfter"))
          goto LABEL_58;
        if (MIBUOnceToken != -1)
          dispatch_once(&MIBUOnceToken, &__block_literal_global_39_2);
        if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
          -[MIBUNFCCommand _initWithAPDU:].cold.3();
        goto LABEL_82;
      }
      if (v11 == 1 && v12 == 3)
      {
        self->_code = 7;
        if (-[MIBUNFCCommand _deserializeHeartbeat](self, "_deserializeHeartbeat"))
          goto LABEL_58;
        if (MIBUOnceToken != -1)
          dispatch_once(&MIBUOnceToken, &__block_literal_global_41_1);
        if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
          -[MIBUNFCCommand _initWithAPDU:].cold.4();
        goto LABEL_82;
      }
      if (v11 != 1 || v12 != 4)
      {
        if (v11 == 1 && v12 == 5)
        {
          self->_code = 10;
          if (-[MIBUNFCCommand _deserializeConfigureNFC](self, "_deserializeConfigureNFC"))
            goto LABEL_58;
          if (MIBUOnceToken != -1)
            dispatch_once(&MIBUOnceToken, &__block_literal_global_43_0);
          if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
            -[MIBUNFCCommand _initWithAPDU:].cold.5();
        }
        else
        {
          v19 = 1;
          if (v11 != 1 || v12 != 6)
            goto LABEL_59;
          self->_code = 11;
          if (-[MIBUNFCCommand _deserializeStartDiag](self, "_deserializeStartDiag"))
            goto LABEL_58;
          if (MIBUOnceToken != -1)
            dispatch_once(&MIBUOnceToken, &__block_literal_global_45_1);
          if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
            -[MIBUNFCCommand _initWithAPDU:].cold.6();
        }
LABEL_82:
        v19 = 0;
        goto LABEL_59;
      }
      v24 = 8;
    }
    self->_code = v24;
    goto LABEL_58;
  }
  if (v10 == 164)
  {
    v19 = 1;
    if (v11 == 4 && !v12)
    {
      self->_code = 4;
      -[MIBUNFCCommand mutablePayload](self, "mutablePayload");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      v22 = self->_serializedPayload;
      v23 = CFSTR("ApplicationID");
      goto LABEL_30;
    }
  }
  else if (v10 == 194)
  {
    if (!(v11 | v12))
    {
      self->_code = 5;
      -[MIBUNFCCommand mutablePayload](self, "mutablePayload");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      v22 = self->_serializedPayload;
      v23 = CFSTR("EvelopedAPDU");
LABEL_30:
      objc_msgSend(v20, "setObject:forKey:", v22, v23);

    }
LABEL_58:
    v19 = 1;
  }
LABEL_59:

  return v19;
}

void __32__MIBUNFCCommand__initWithAPDU___block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __32__MIBUNFCCommand__initWithAPDU___block_invoke_28()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __32__MIBUNFCCommand__initWithAPDU___block_invoke_30()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __32__MIBUNFCCommand__initWithAPDU___block_invoke_32()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __32__MIBUNFCCommand__initWithAPDU___block_invoke_34()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __32__MIBUNFCCommand__initWithAPDU___block_invoke_36()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __32__MIBUNFCCommand__initWithAPDU___block_invoke_38()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __32__MIBUNFCCommand__initWithAPDU___block_invoke_40()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __32__MIBUNFCCommand__initWithAPDU___block_invoke_42()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __32__MIBUNFCCommand__initWithAPDU___block_invoke_44()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (id)_serializeStartUpdate
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v7[16];

  if (MIBUOnceToken != -1)
    dispatch_once(&MIBUOnceToken, &__block_literal_global_46);
  v3 = MIBUConnObj;
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_222C3F000, v3, OS_LOG_TYPE_DEFAULT, "Serializing startUpdate command", v7, 2u);
  }
  -[MIBUNFCCommand payload](self, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIBUNFCCommand _serializeTatsuPayload:](self, "_serializeTatsuPayload:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __39__MIBUNFCCommand__serializeStartUpdate__block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (id)_serializeRetryAfter
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  -[MIBUNFCCommand payload](self, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("RetryAfter"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_48);
    v10 = MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUNFCCommand _serializeRetryAfter].cold.1(v10, v11, v12);
    goto LABEL_13;
  }
  v13[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "serialize:withValue:", &unk_24EB5C580, v6);

  if ((v7 & 1) == 0)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_52);
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUNFCCommand _serializeRetryAfter].cold.2();
LABEL_13:
    v8 = 0;
    goto LABEL_4;
  }
  objc_msgSend(v3, "serializedData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_4:

  return v8;
}

void __38__MIBUNFCCommand__serializeRetryAfter__block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __38__MIBUNFCCommand__serializeRetryAfter__block_invoke_51()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (id)_serializeHeartbeat
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  void *v12;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  -[MIBUNFCCommand payload](self, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("HeartbeatPeriod"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_53);
    v14 = MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUNFCCommand _serializeHeartbeat].cold.1(v14, v15, v16);
    goto LABEL_19;
  }
  -[MIBUNFCCommand payload](self, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("HeartbeatTimeout"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v3, "serialize:withValue:", &unk_24EB5C598, v8);

  if ((v9 & 1) == 0)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_60);
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUNFCCommand _serializeHeartbeat].cold.3();
    goto LABEL_18;
  }
  v17 = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v17, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v3, "serialize:withValue:", &unk_24EB5C5B0, v10);

  if ((v11 & 1) == 0)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_65_0);
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUNFCCommand _serializeHeartbeat].cold.2();
LABEL_18:

LABEL_19:
    v12 = 0;
    goto LABEL_5;
  }
  objc_msgSend(v3, "serializedData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_5:
  return v12;
}

void __37__MIBUNFCCommand__serializeHeartbeat__block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __37__MIBUNFCCommand__serializeHeartbeat__block_invoke_59()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __37__MIBUNFCCommand__serializeHeartbeat__block_invoke_64()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (id)_serializeConfigureNFC
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  -[MIBUNFCCommand payload](self, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("NFCInactivityTimeout"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_66);
    v10 = MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUNFCCommand _serializeConfigureNFC].cold.1(v10, v11, v12);
    goto LABEL_13;
  }
  v13[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "serialize:withValue:", &unk_24EB5C5C8, v6);

  if ((v7 & 1) == 0)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_71_0);
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUNFCCommand _serializeConfigureNFC].cold.2();
LABEL_13:
    v8 = 0;
    goto LABEL_4;
  }
  objc_msgSend(v3, "serializedData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_4:

  return v8;
}

void __40__MIBUNFCCommand__serializeConfigureNFC__block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __40__MIBUNFCCommand__serializeConfigureNFC__block_invoke_70()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (id)_serializeStartDiag
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v7[16];

  if (MIBUOnceToken != -1)
    dispatch_once(&MIBUOnceToken, &__block_literal_global_72);
  v3 = MIBUConnObj;
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_222C3F000, v3, OS_LOG_TYPE_DEFAULT, "Serializing startDiag command", v7, 2u);
  }
  -[MIBUNFCCommand payload](self, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIBUNFCCommand _serializeTatsuPayload:](self, "_serializeTatsuPayload:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __37__MIBUNFCCommand__serializeStartDiag__block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (id)_serializeTatsuPayload:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "objectForKey:", CFSTR("TatsuTicket"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("TimeStamp"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_73);
    v13 = MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUNFCCommand _serializeTatsuPayload:].cold.1(v13, v14, v15);
    goto LABEL_23;
  }
  if (!v5)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_75);
    v16 = MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUNFCCommand _serializeTatsuPayload:].cold.2(v16, v17, v18);
    goto LABEL_23;
  }
  v20[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "serialize:withValue:", &unk_24EB5C5E0, v7);

  if ((v8 & 1) == 0)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_80);
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUNFCCommand _serializeTatsuPayload:].cold.4();
    goto LABEL_23;
  }
  v19 = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v19, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "serialize:withValue:", &unk_24EB5C5F8, v9);

  if ((v10 & 1) == 0)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_85);
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUNFCCommand _serializeTatsuPayload:].cold.3();
LABEL_23:
    v11 = 0;
    goto LABEL_6;
  }
  objc_msgSend(v4, "serializedData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v11;
}

void __41__MIBUNFCCommand__serializeTatsuPayload___block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __41__MIBUNFCCommand__serializeTatsuPayload___block_invoke_74()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __41__MIBUNFCCommand__serializeTatsuPayload___block_invoke_79()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __41__MIBUNFCCommand__serializeTatsuPayload___block_invoke_84()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (BOOL)_deserializeStartUpdate
{
  NSObject *v3;
  uint8_t v5[16];

  if (MIBUOnceToken != -1)
    dispatch_once(&MIBUOnceToken, &__block_literal_global_86_0);
  v3 = MIBUConnObj;
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_222C3F000, v3, OS_LOG_TYPE_DEFAULT, "Deserialize startUpdate command", v5, 2u);
  }
  return -[MIBUNFCCommand _deserializeTatsuPayload](self, "_deserializeTatsuPayload");
}

void __41__MIBUNFCCommand__deserializeStartUpdate__block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (BOOL)_deserializeRetryAfter
{
  MIBUDeserializer *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  BOOL v10;
  void *v12;

  v3 = -[MIBUDeserializer initWithData:]([MIBUDeserializer alloc], "initWithData:", self->_serializedPayload);
  -[MIBUDeserializer deserialize](v3, "deserialize");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_88);
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUNFCCommand _initWithAPDU:].cold.3();
    goto LABEL_20;
  }
  objc_msgSend(v4, "objectForKey:", &unk_24EB5C300);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_90_0);
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUNFCCommand _deserializeRetryAfter].cold.2();
    goto LABEL_20;
  }
  v6 = v5;
  objc_msgSend(v5, "doubleValue");
  if (v7 <= 0.0 || (objc_msgSend(v6, "doubleValue"), v8 >= 300.0))
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_92);
    v12 = (void *)MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUNFCCommand _deserializeRetryAfter].cold.3(v12);

LABEL_20:
    v10 = 0;
    goto LABEL_6;
  }
  -[MIBUNFCCommand mutablePayload](self, "mutablePayload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v6, CFSTR("RetryAfter"));

  v10 = 1;
LABEL_6:

  return v10;
}

void __40__MIBUNFCCommand__deserializeRetryAfter__block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __40__MIBUNFCCommand__deserializeRetryAfter__block_invoke_89()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __40__MIBUNFCCommand__deserializeRetryAfter__block_invoke_91()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (BOOL)_deserializeHeartbeat
{
  MIBUDeserializer *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v17;
  void *v18;

  v3 = -[MIBUDeserializer initWithData:]([MIBUDeserializer alloc], "initWithData:", self->_serializedPayload);
  -[MIBUDeserializer deserialize](v3, "deserialize");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_93);
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUNFCCommand _initWithAPDU:].cold.4();
    goto LABEL_32;
  }
  objc_msgSend(v4, "objectForKey:", &unk_24EB5C318);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_95);
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUNFCCommand _deserializeHeartbeat].cold.2();
    goto LABEL_32;
  }
  v6 = v5;
  objc_msgSend(v5, "doubleValue");
  if (v7 < 0.0 || (objc_msgSend(v6, "doubleValue"), v8 >= 300.0))
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_97);
    v17 = (void *)MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUNFCCommand _deserializeHeartbeat].cold.3(v17);
    goto LABEL_31;
  }
  objc_msgSend(v4, "objectForKey:", &unk_24EB5C330);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_99);
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUNFCCommand _deserializeHeartbeat].cold.4();
    goto LABEL_31;
  }
  v10 = v9;
  objc_msgSend(v9, "doubleValue");
  if (v11 < 0.0 || (objc_msgSend(v6, "doubleValue"), v12 >= 300.0))
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_101);
    v18 = (void *)MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUNFCCommand _deserializeHeartbeat].cold.5(v18);

LABEL_31:
LABEL_32:
    v15 = 0;
    goto LABEL_9;
  }
  -[MIBUNFCCommand mutablePayload](self, "mutablePayload");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", v6, CFSTR("HeartbeatPeriod"));

  -[MIBUNFCCommand mutablePayload](self, "mutablePayload");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v10, CFSTR("HeartbeatTimeout"));

  v15 = 1;
LABEL_9:

  return v15;
}

void __39__MIBUNFCCommand__deserializeHeartbeat__block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __39__MIBUNFCCommand__deserializeHeartbeat__block_invoke_94()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __39__MIBUNFCCommand__deserializeHeartbeat__block_invoke_96()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __39__MIBUNFCCommand__deserializeHeartbeat__block_invoke_98()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __39__MIBUNFCCommand__deserializeHeartbeat__block_invoke_100()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (BOOL)_deserializeConfigureNFC
{
  MIBUDeserializer *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  BOOL v9;
  void *v11;

  v3 = -[MIBUDeserializer initWithData:]([MIBUDeserializer alloc], "initWithData:", self->_serializedPayload);
  -[MIBUDeserializer deserialize](v3, "deserialize");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_102);
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUNFCCommand _deserializeConfigureNFC].cold.1();
    goto LABEL_19;
  }
  objc_msgSend(v4, "objectForKey:", &unk_24EB5C348);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_104);
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUNFCCommand _deserializeConfigureNFC].cold.2();
    goto LABEL_19;
  }
  v6 = v5;
  objc_msgSend(v5, "doubleValue");
  if (v7 < 0.0)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_106);
    v11 = (void *)MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUNFCCommand _deserializeConfigureNFC].cold.3(v11);

LABEL_19:
    v9 = 0;
    goto LABEL_5;
  }
  -[MIBUNFCCommand mutablePayload](self, "mutablePayload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v6, CFSTR("NFCInactivityTimeout"));

  v9 = 1;
LABEL_5:

  return v9;
}

void __42__MIBUNFCCommand__deserializeConfigureNFC__block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __42__MIBUNFCCommand__deserializeConfigureNFC__block_invoke_103()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __42__MIBUNFCCommand__deserializeConfigureNFC__block_invoke_105()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (BOOL)_deserializeStartDiag
{
  NSObject *v3;
  uint8_t v5[16];

  if (MIBUOnceToken != -1)
    dispatch_once(&MIBUOnceToken, &__block_literal_global_107);
  v3 = MIBUConnObj;
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_222C3F000, v3, OS_LOG_TYPE_DEFAULT, "Deserialize startDiag command", v5, 2u);
  }
  return -[MIBUNFCCommand _deserializeTatsuPayload](self, "_deserializeTatsuPayload");
}

void __39__MIBUNFCCommand__deserializeStartDiag__block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (BOOL)_deserializeTatsuPayload
{
  MIBUDeserializer *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;

  v3 = -[MIBUDeserializer initWithData:]([MIBUDeserializer alloc], "initWithData:", self->_serializedPayload);
  -[MIBUDeserializer deserialize](v3, "deserialize");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_108);
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUNFCCommand _deserializeTatsuPayload].cold.1();
    goto LABEL_19;
  }
  objc_msgSend(v4, "objectForKey:", &unk_24EB5C360);
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_110);
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUNFCCommand _deserializeTatsuPayload].cold.2();
    goto LABEL_19;
  }
  v6 = (void *)v5;
  objc_msgSend(v4, "objectForKey:", &unk_24EB5C378);
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_112);
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUNFCCommand _deserializeTatsuPayload].cold.3();

LABEL_19:
    v11 = 0;
    goto LABEL_5;
  }
  v8 = (void *)v7;
  -[MIBUNFCCommand mutablePayload](self, "mutablePayload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v6, CFSTR("TatsuTicket"));

  -[MIBUNFCCommand mutablePayload](self, "mutablePayload");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v8, CFSTR("TimeStamp"));

  v11 = 1;
LABEL_5:

  return v11;
}

void __42__MIBUNFCCommand__deserializeTatsuPayload__block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __42__MIBUNFCCommand__deserializeTatsuPayload__block_invoke_109()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __42__MIBUNFCCommand__deserializeTatsuPayload__block_invoke_111()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (int64_t)code
{
  return self->_code;
}

- (NSData)apdu
{
  return self->_apdu;
}

- (unsigned)cla
{
  return self->_cla;
}

- (unsigned)ins
{
  return self->_ins;
}

- (unsigned)p1
{
  return self->_p1;
}

- (unsigned)p2
{
  return self->_p2;
}

- (NSData)serializedPayload
{
  return self->_serializedPayload;
}

- (NSMutableDictionary)mutablePayload
{
  return self->_mutablePayload;
}

- (void)setMutablePayload:(id)a3
{
  objc_storeStrong((id *)&self->_mutablePayload, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutablePayload, 0);
  objc_storeStrong((id *)&self->_serializedPayload, 0);
  objc_storeStrong((id *)&self->_apdu, 0);
}

- (void)_initWithCommandCode:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 134217984;
  v4 = a1;
  OUTLINED_FUNCTION_2_2(&dword_222C3F000, a2, a3, "Unrecognized command code %ld; failed to initialize command object",
    (uint8_t *)&v3);
  OUTLINED_FUNCTION_4();
}

- (void)_initWithCommandCode:(uint64_t)a3 .cold.2(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 134217984;
  v5 = v3;
  OUTLINED_FUNCTION_2_2(&dword_222C3F000, a2, a3, "Failed to serialize payload dictionary for command: %ld", (uint8_t *)&v4);
  OUTLINED_FUNCTION_4();
}

- (void)_initWithAPDU:(void *)a1 .cold.1(void *a1)
{
  NSObject *v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  OUTLINED_FUNCTION_9_0(a1);
  v3 = 134217984;
  v4 = OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2_2(&dword_222C3F000, v1, v2, "APDU too short; length = %lu", (uint8_t *)&v3);

  OUTLINED_FUNCTION_7_2();
}

- (void)_initWithAPDU:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_222C3F000, v0, v1, "Failed to deserialize SU Start command", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_initWithAPDU:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_222C3F000, v0, v1, "Failed to deserialize RetryAfter command", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_initWithAPDU:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_222C3F000, v0, v1, "Failed to deserialize Heartbeat command", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_initWithAPDU:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_222C3F000, v0, v1, "Failed to deserialize ConfigureNFC command", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_initWithAPDU:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_222C3F000, v0, v1, "Failed to deserialize startDiag command", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_initWithAPDU:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_222C3F000, v0, v1, "Only handling APDU command with Le=0x00", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_initWithAPDU:(void *)a1 .cold.8(void *a1)
{
  NSObject *v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  OUTLINED_FUNCTION_9_0(a1);
  v3 = 134217984;
  v4 = OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2_2(&dword_222C3F000, v1, v2, "APDU has 3 byte Lc field but length = %lu", (uint8_t *)&v3);

  OUTLINED_FUNCTION_7_2();
}

- (void)_initWithAPDU:(unsigned __int16)a1 .cold.9(unsigned __int16 a1, void *a2)
{
  NSObject *v2;
  int v3;
  id v4;
  _DWORD v5[2];
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  v5[0] = 67109376;
  v5[1] = v3;
  v6 = 2048;
  v7 = OUTLINED_FUNCTION_10();
  _os_log_error_impl(&dword_222C3F000, v2, OS_LOG_TYPE_ERROR, "APDU has Lc=%d; but APDU has length=%lu",
    (uint8_t *)v5,
    0x12u);

}

- (void)_initWithAPDU:(int)a1 .cold.10(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_222C3F000, a2, OS_LOG_TYPE_ERROR, "Unsupported APDU CLA %x", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_1();
}

- (void)_serializeRetryAfter
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3_3(&dword_222C3F000, v0, v1, "Failed to serialize %{public}@ key with value: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)_serializeHeartbeat
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3_3(&dword_222C3F000, v0, v1, "Failed to serialize %{public}@ key with value: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)_serializeConfigureNFC
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3_3(&dword_222C3F000, v0, v1, "Failed to serialize %{public}@ key with value: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)_serializeTatsuPayload:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138543362;
  v4 = CFSTR("TimeStamp");
  OUTLINED_FUNCTION_2_2(&dword_222C3F000, a1, a3, "Failed start tatsu ticket payload serialization; payload does not have %{public}@ key",
    (uint8_t *)&v3);
  OUTLINED_FUNCTION_4();
}

- (void)_serializeTatsuPayload:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138543362;
  v4 = CFSTR("TatsuTicket");
  OUTLINED_FUNCTION_2_2(&dword_222C3F000, a1, a3, "Failed start tatsu ticket payload serialization; payload does not have %{public}@ key",
    (uint8_t *)&v3);
  OUTLINED_FUNCTION_4();
}

- (void)_serializeTatsuPayload:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3_3(&dword_222C3F000, v0, v1, "Failed to serialize %{public}@ key with value: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)_serializeTatsuPayload:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3_3(&dword_222C3F000, v0, v1, "Failed to serialize %{public}@ key with data: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)_deserializeRetryAfter
{
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[24];

  OUTLINED_FUNCTION_9_0(a1);
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_2_2(&dword_222C3F000, v1, v2, "Invalid RetryAfter time %lfs", v3);

  OUTLINED_FUNCTION_7_2();
}

- (void)_deserializeHeartbeat
{
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[24];

  OUTLINED_FUNCTION_9_0(a1);
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_2_2(&dword_222C3F000, v1, v2, "Invalid heartbeat timeout %lfs", v3);

  OUTLINED_FUNCTION_7_2();
}

- (void)_deserializeConfigureNFC
{
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[24];

  OUTLINED_FUNCTION_9_0(a1);
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_2_2(&dword_222C3F000, v1, v2, "Invalid nfcInactivity timeout %lfs", v3);

  OUTLINED_FUNCTION_7_2();
}

- (void)_deserializeTatsuPayload
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_222C3F000, v0, v1, "Failed to deserialize timestamp from command APDU", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
