@implementation NFCISO15693Tag

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NFCISO15693Tag;
  return -[NFCTag copyWithZone:](&v4, sel_copyWithZone_, a3);
}

- (id)_generateRequestHeader:(unsigned __int8)a3 flags:(unsigned __int8)a4
{
  unsigned int v4;
  int v6;
  char v7;
  void *v8;
  void *v9;
  char v11;
  objc_super v12;
  _BYTE v13[2];

  v4 = a3;
  v13[0] = a4;
  v13[1] = a3;
  v6 = 1;
  if (a3 <= 0x9Fu && a3 != 57)
  {
    if ((a4 & 0x10) != 0)
    {
      v6 = 0;
      v7 = a4 & 0xDF;
    }
    else
    {
      v7 = a4 | 0x20;
    }
    v13[0] = v7;
  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithBytes:length:", v13, 2);
  if (v4 == 57 || v4 > 0x9F || !v6)
  {
    if ((v4 + 96) <= 0x3Fu)
    {
      v11 = -[NFCISO15693Tag icManufacturerCode](self, "icManufacturerCode");
      objc_msgSend(v8, "appendBytes:length:", &v11, 1);
    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)NFCISO15693Tag;
    -[NFCTag identifier](&v12, sel_identifier);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendData:", v9);

  }
  return v8;
}

- (NSData)identifier
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NFCISO15693Tag;
  -[NFCTag identifier](&v5, sel_identifier);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[NFCISO15693ReaderSessionTag reverseByteOrder:](NFCISO15693ReaderSessionTag, "reverseByteOrder:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (unint64_t)icManufacturerCode
{
  void *v2;
  _BOOL4 v3;
  unint64_t v5;

  v5 = 0;
  -[NFCISO15693Tag identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[NFCISO15693ReaderSessionTag decodeIdentifier:manufacturerCode:serialNumber:](NFCISO15693ReaderSessionTag, "decodeIdentifier:manufacturerCode:serialNumber:", v2, &v5, 0);

  if (v3)
    return v5;
  else
    return 0;
}

- (NSData)icSerialNumber
{
  void *v2;
  _BOOL4 v3;
  id v4;
  id v5;
  void *v6;
  id v8;

  -[NFCISO15693Tag identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v3 = +[NFCISO15693ReaderSessionTag decodeIdentifier:manufacturerCode:serialNumber:](NFCISO15693ReaderSessionTag, "decodeIdentifier:manufacturerCode:serialNumber:", v2, 0, &v8);
  v4 = v8;

  if (v3)
    v5 = v4;
  else
    v5 = (id)objc_opt_new();
  v6 = v5;

  return (NSData *)v6;
}

- (id)_parseResponseErrorWithData:(id)a3
{
  id v3;
  _BYTE *v4;
  void *v5;
  void *v6;
  uint64_t *v7;
  const __CFString **v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  uint64_t v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_retainAutorelease(a3);
  v4 = (_BYTE *)objc_msgSend(v3, "bytes");
  if (!objc_msgSend(v3, "length"))
  {
    v16 = CFSTR("TagResponseInvalidLength");
    v17[0] = MEMORY[0x24BDBD1C8];
    v6 = (void *)MEMORY[0x24BDBCE70];
    v7 = v17;
    v8 = &v16;
    goto LABEL_8;
  }
  if ((*v4 & 1) != 0)
  {
    if (objc_msgSend(v3, "length") == 2)
    {
      v14 = CFSTR("ISO15693TagResponseErrorCode");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v4[1]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v9;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[NFCError errorWithCode:userInfo:](NFCError, "errorWithCode:userInfo:", 102, v10);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
      goto LABEL_10;
    }
    v12 = CFSTR("TagResponseInvalidLength");
    v13 = MEMORY[0x24BDBD1C8];
    v6 = (void *)MEMORY[0x24BDBCE70];
    v7 = &v13;
    v8 = &v12;
LABEL_8:
    objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v7, v8, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[NFCError errorWithCode:userInfo:](NFCError, "errorWithCode:userInfo:", 102, v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v5 = 0;
LABEL_10:

  return v5;
}

- (void)readMultipleBlocksWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __72__NFCISO15693Tag_readMultipleBlocksWithConfiguration_completionHandler___block_invoke;
  v7[3] = &unk_24D44F8B0;
  v8 = v5;
  v6 = v5;
  -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v7);

}

void __72__NFCISO15693Tag_readMultipleBlocksWithConfiguration_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  v3 = (id)objc_opt_new();
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v1 + 16))(v1, v3, v2);

}

- (void)sendCustomCommandWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __71__NFCISO15693Tag_sendCustomCommandWithConfiguration_completionHandler___block_invoke;
  v7[3] = &unk_24D44F8B0;
  v8 = v5;
  v6 = v5;
  -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v7);

}

void __71__NFCISO15693Tag_sendCustomCommandWithConfiguration_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  v3 = (id)objc_opt_new();
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v1 + 16))(v1, v3, v2);

}

- (void)stayQuietWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_215BBD000, "NFCISO15693Tag stayQuietWithCompletionHandler:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  -[NFCISO15693Tag _generateRequestHeader:flags:](self, "_generateRequestHeader:flags:", 2, 32);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __49__NFCISO15693Tag_stayQuietWithCompletionHandler___block_invoke;
  v8[3] = &unk_24D44F888;
  v9 = v4;
  v7 = v4;
  -[NFCTag _transceiveWithData:completionHandler:](self, "_transceiveWithData:completionHandler:", v6, v8);

}

void __49__NFCISO15693Tag_stayQuietWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  id v6;

  v5 = a3;
  if (objc_msgSend(v5, "code") == 100)
  {

    v4 = 0;
  }
  else
  {
    v4 = v5;
  }
  v6 = v4;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)readSingleBlockWithRequestFlags:(unsigned __int8)a3 blockNumber:(unsigned __int8)a4 completionHandler:(id)a5
{
  uint64_t v5;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  os_activity_scope_state_s state;
  unsigned __int8 v14;

  v5 = a3;
  v14 = a4;
  v7 = a5;
  v8 = _os_activity_create(&dword_215BBD000, "NFCISO15693Tag readSingleBlockWithRequestFlags:blockNumber:completionHandler:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  -[NFCISO15693Tag _generateRequestHeader:flags:](self, "_generateRequestHeader:flags:", 32, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendBytes:length:", &v14, 1);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __80__NFCISO15693Tag_readSingleBlockWithRequestFlags_blockNumber_completionHandler___block_invoke;
  v11[3] = &unk_24D44FC08;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  -[NFCTag _transceiveWithData:completionHandler:](self, "_transceiveWithData:completionHandler:", v9, v11);

}

void __80__NFCISO15693Tag_readSingleBlockWithRequestFlags_blockNumber_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (v5
    || (objc_msgSend(*(id *)(a1 + 32), "_parseResponseErrorWithData:", v8),
        (v5 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = objc_opt_new();
  }
  else
  {
    objc_msgSend(v8, "subdataWithRange:", 1, objc_msgSend(v8, "length") - 1);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)writeSingleBlockWithRequestFlags:(unsigned __int8)a3 blockNumber:(unsigned __int8)a4 dataBlock:(id)a5 completionHandler:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;
  SEL v19;
  os_activity_scope_state_s state;
  unsigned __int8 v21;

  v7 = a3;
  v21 = a4;
  v10 = a5;
  v11 = a6;
  v12 = _os_activity_create(&dword_215BBD000, "NFCISO15693Tag writeSingleBlockWithRequestFlags:blockNumber:dataBlock:completionHandler:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v12, &state);
  os_activity_scope_leave(&state);

  if (objc_msgSend(v10, "length"))
  {
    -[NFCISO15693Tag _generateRequestHeader:flags:](self, "_generateRequestHeader:flags:", 33, v7);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "appendBytes:length:", &v21, 1);
    objc_msgSend(v13, "appendData:", v10);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __91__NFCISO15693Tag_writeSingleBlockWithRequestFlags_blockNumber_dataBlock_completionHandler___block_invoke_17;
    v15[3] = &unk_24D44FC08;
    v15[4] = self;
    v16 = v11;
    v14 = v11;
    -[NFCTag _transceiveWithData:completionHandler:](self, "_transceiveWithData:completionHandler:", v13, v15);

  }
  else
  {
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __91__NFCISO15693Tag_writeSingleBlockWithRequestFlags_blockNumber_dataBlock_completionHandler___block_invoke;
    v17[3] = &unk_24D44F860;
    v17[4] = self;
    v18 = v11;
    v19 = a2;
    v13 = v11;
    -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v17);
    v14 = v18;
  }

}

void __91__NFCISO15693Tag_writeSingleBlockWithRequestFlags_blockNumber_dataBlock_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t Logger;
  void (*v5)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v9;
  NSObject *v10;
  objc_class *v11;
  int v12;
  const char *v13;
  const char *v14;
  const char *Name;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 40);
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  Logger = NFLogGetLogger();
  if (Logger)
  {
    v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v9 = 45;
    if (isMetaClass)
      v9 = 43;
    v5(3, "%c[%{public}s %{public}s]:%i Data block length must be greater than 0", v9, ClassName, Name, 183);
  }
  NFSharedLogGetLogger();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11))
      v12 = 43;
    else
      v12 = 45;
    v13 = object_getClassName(*(id *)(a1 + 32));
    v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    v17 = v12;
    v18 = 2082;
    v19 = v13;
    v20 = 2082;
    v21 = v14;
    v22 = 1024;
    v23 = 183;
    _os_log_impl(&dword_215BBD000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Data block length must be greater than 0", buf, 0x22u);
  }

}

void __91__NFCISO15693Tag_writeSingleBlockWithRequestFlags_blockNumber_dataBlock_completionHandler___block_invoke_17(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_parseResponseErrorWithData:", a2);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)lockBlockWithRequestFlags:(unsigned __int8)a3 blockNumber:(unsigned __int8)a4 completionHandler:(id)a5
{
  uint64_t v5;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  os_activity_scope_state_s state;
  unsigned __int8 v14;

  v5 = a3;
  v14 = a4;
  v7 = a5;
  v8 = _os_activity_create(&dword_215BBD000, "NFCISO15693Tag lockBlockWithRequestFlags:blockNumber:completionHandler:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  -[NFCISO15693Tag _generateRequestHeader:flags:](self, "_generateRequestHeader:flags:", 34, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendBytes:length:", &v14, 1);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __74__NFCISO15693Tag_lockBlockWithRequestFlags_blockNumber_completionHandler___block_invoke;
  v11[3] = &unk_24D44FC08;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  -[NFCTag _transceiveWithData:completionHandler:](self, "_transceiveWithData:completionHandler:", v9, v11);

}

void __74__NFCISO15693Tag_lockBlockWithRequestFlags_blockNumber_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_parseResponseErrorWithData:", a2);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)readMultipleBlocksWithRequestFlags:(unsigned __int8)a3 blockRange:(_NSRange)a4 completionHandler:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v7;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  NSUInteger v16;
  NSUInteger v17;
  SEL v18;
  char v19;
  _QWORD v20[5];
  id v21;
  SEL v22;
  os_activity_scope_state_s state;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  v10 = a5;
  v11 = _os_activity_create(&dword_215BBD000, "NFCISO15693Tag readMultipleBlocksWithRequestFlags:blockRange:completionHandler:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  os_activity_scope_leave(&state);

  if (length && location + length < 0x101)
  {
    -[NFCISO15693Tag _generateRequestHeader:flags:](self, "_generateRequestHeader:flags:", 35, v7);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    LOBYTE(state.opaque[0]) = location;
    BYTE1(state.opaque[0]) = length - 1;
    objc_msgSend(v12, "appendBytes:length:", &state, 2);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __82__NFCISO15693Tag_readMultipleBlocksWithRequestFlags_blockRange_completionHandler___block_invoke_20;
    v14[3] = &unk_24D44FC30;
    v19 = v7;
    v16 = location;
    v17 = length;
    v18 = a2;
    v14[4] = self;
    v15 = v10;
    v13 = v10;
    -[NFCTag _transceiveWithData:completionHandler:](self, "_transceiveWithData:completionHandler:", v12, v14);

  }
  else
  {
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __82__NFCISO15693Tag_readMultipleBlocksWithRequestFlags_blockRange_completionHandler___block_invoke;
    v20[3] = &unk_24D44F860;
    v20[4] = self;
    v21 = v10;
    v22 = a2;
    v12 = v10;
    -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v20);

  }
}

void __82__NFCISO15693Tag_readMultipleBlocksWithRequestFlags_blockRange_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  const char *v14;
  const char *v15;
  const char *Name;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 40);
  v3 = (void *)objc_opt_new();
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *))(v2 + 16))(v2, v3, v4);

  Logger = NFLogGetLogger();
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v6(3, "%c[%{public}s %{public}s]:%i Block range must be between 0 to 255 inclusively", v10, ClassName, Name, 228);
  }
  NFSharedLogGetLogger();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12))
      v13 = 43;
    else
      v13 = 45;
    v14 = object_getClassName(*(id *)(a1 + 32));
    v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    v18 = v13;
    v19 = 2082;
    v20 = v14;
    v21 = 2082;
    v22 = v15;
    v23 = 1024;
    v24 = 228;
    _os_log_impl(&dword_215BBD000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Block range must be between 0 to 255 inclusively", buf, 0x22u);
  }

}

void __82__NFCISO15693Tag_readMultipleBlocksWithRequestFlags_blockRange_completionHandler___block_invoke_20(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  uint64_t Logger;
  void (*v14)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v18;
  NSObject *v19;
  objc_class *v20;
  int v21;
  const char *v22;
  const char *v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  void *v27;
  const char *Name;
  uint8_t buf[4];
  int v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  const __CFString *v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = v6;
    v8 = (void *)objc_opt_new();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_parseResponseErrorWithData:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_opt_new();
    if (!v7)
    {
      v9 = *(unsigned __int8 *)(a1 + 72);
      v10 = objc_msgSend(v5, "length");
      v11 = *(_QWORD *)(a1 + 56);
      if (v11 <= v10 - 1)
      {
        if (v11)
        {
          v24 = 0;
          v25 = (v10 - 1) / v11 - ((v9 >> 6) & 1);
          if ((v9 & 0x40) != 0)
            v26 = 2;
          else
            v26 = 1;
          do
          {
            objc_msgSend(v5, "subdataWithRange:", v26, v25);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v27);

            v26 += v25;
            ++v24;
          }
          while (*(_QWORD *)(a1 + 56) > v24);
        }
        v7 = 0;
      }
      else
      {
        v37 = CFSTR("TagResponseInvalidLength");
        v38[0] = MEMORY[0x24BDBD1C8];
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[NFCError errorWithCode:userInfo:](NFCError, "errorWithCode:userInfo:", 102, v12);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        Logger = NFLogGetLogger();
        if (Logger)
        {
          v14 = (void (*)(uint64_t, const char *, ...))Logger;
          Class = object_getClass(*(id *)(a1 + 32));
          isMetaClass = class_isMetaClass(Class);
          ClassName = object_getClassName(*(id *)(a1 + 32));
          Name = sel_getName(*(SEL *)(a1 + 64));
          v18 = 45;
          if (isMetaClass)
            v18 = 43;
          v14(3, "%c[%{public}s %{public}s]:%i Unexpected block size of 0", v18, ClassName, Name, 249);
        }
        NFSharedLogGetLogger();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v20 = object_getClass(*(id *)(a1 + 32));
          if (class_isMetaClass(v20))
            v21 = 43;
          else
            v21 = 45;
          v22 = object_getClassName(*(id *)(a1 + 32));
          v23 = sel_getName(*(SEL *)(a1 + 64));
          *(_DWORD *)buf = 67109890;
          v30 = v21;
          v31 = 2082;
          v32 = v22;
          v33 = 2082;
          v34 = v23;
          v35 = 1024;
          v36 = 249;
          _os_log_impl(&dword_215BBD000, v19, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected block size of 0", buf, 0x22u);
        }

      }
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)writeMultipleBlocksWithRequestFlags:(unsigned __int8)a3 blockRange:(_NSRange)a4 dataBlocks:(id)a5 completionHandler:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v9;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  SEL v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[5];
  id v28;
  SEL v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[5];
  id v35;
  SEL v36;
  _QWORD v37[5];
  id v38;
  SEL v39;
  _QWORD v40[5];
  id v41;
  SEL v42;
  os_activity_scope_state_s state;
  _BYTE v44[128];
  uint64_t v45;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v45 = *MEMORY[0x24BDAC8D0];
  v12 = a5;
  v13 = a6;
  v14 = _os_activity_create(&dword_215BBD000, "NFCISO15693Tag writeMultipleBlocksWithRequestFlags:blockRange:dataBlocks:completionHandler:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v14, &state);
  os_activity_scope_leave(&state);

  if (location + length < 0x101)
  {
    if (objc_msgSend(v12, "count") == length)
    {
      if (length)
      {
        v24 = a2;
        -[NFCISO15693Tag _generateRequestHeader:flags:](self, "_generateRequestHeader:flags:", 36, v9);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(state.opaque[0]) = location;
        BYTE1(state.opaque[0]) = length - 1;
        objc_msgSend(v15, "appendBytes:length:", &state, 2);
        objc_msgSend(v12, "firstObject");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "length");

        v32 = 0u;
        v33 = 0u;
        v30 = 0u;
        v31 = 0u;
        v18 = v12;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v31;
          while (2)
          {
            for (i = 0; i != v20; ++i)
            {
              if (*(_QWORD *)v31 != v21)
                objc_enumerationMutation(v18);
              v23 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
              if (v17 != objc_msgSend(v23, "length"))
              {
                v27[0] = MEMORY[0x24BDAC760];
                v27[1] = 3221225472;
                v27[2] = __94__NFCISO15693Tag_writeMultipleBlocksWithRequestFlags_blockRange_dataBlocks_completionHandler___block_invoke_26;
                v27[3] = &unk_24D44F860;
                v27[4] = self;
                v28 = v13;
                v29 = v24;
                -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v27);

                goto LABEL_17;
              }
              objc_msgSend(v15, "appendData:", v23);
            }
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
            if (v20)
              continue;
            break;
          }
        }

        v25[0] = MEMORY[0x24BDAC760];
        v25[1] = 3221225472;
        v25[2] = __94__NFCISO15693Tag_writeMultipleBlocksWithRequestFlags_blockRange_dataBlocks_completionHandler___block_invoke_28;
        v25[3] = &unk_24D44FC08;
        v25[4] = self;
        v26 = v13;
        -[NFCTag _transceiveWithData:completionHandler:](self, "_transceiveWithData:completionHandler:", v15, v25);

      }
      else
      {
        v34[0] = MEMORY[0x24BDAC760];
        v34[1] = 3221225472;
        v34[2] = __94__NFCISO15693Tag_writeMultipleBlocksWithRequestFlags_blockRange_dataBlocks_completionHandler___block_invoke_25;
        v34[3] = &unk_24D44F860;
        v34[4] = self;
        v35 = v13;
        v36 = a2;
        -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v34);
        v15 = v35;
      }
    }
    else
    {
      v37[0] = MEMORY[0x24BDAC760];
      v37[1] = 3221225472;
      v37[2] = __94__NFCISO15693Tag_writeMultipleBlocksWithRequestFlags_blockRange_dataBlocks_completionHandler___block_invoke_23;
      v37[3] = &unk_24D44F860;
      v37[4] = self;
      v38 = v13;
      v39 = a2;
      -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v37);
      v15 = v38;
    }
  }
  else
  {
    v40[0] = MEMORY[0x24BDAC760];
    v40[1] = 3221225472;
    v40[2] = __94__NFCISO15693Tag_writeMultipleBlocksWithRequestFlags_blockRange_dataBlocks_completionHandler___block_invoke;
    v40[3] = &unk_24D44F860;
    v40[4] = self;
    v41 = v13;
    v42 = a2;
    -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v40);
    v15 = v41;
  }
LABEL_17:

}

void __94__NFCISO15693Tag_writeMultipleBlocksWithRequestFlags_blockRange_dataBlocks_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t Logger;
  void (*v5)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v9;
  NSObject *v10;
  objc_class *v11;
  int v12;
  const char *v13;
  const char *v14;
  const char *Name;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 40);
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  Logger = NFLogGetLogger();
  if (Logger)
  {
    v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v9 = 45;
    if (isMetaClass)
      v9 = 43;
    v5(3, "%c[%{public}s %{public}s]:%i Block range must be between 0 to 255 inclusively", v9, ClassName, Name, 275);
  }
  NFSharedLogGetLogger();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11))
      v12 = 43;
    else
      v12 = 45;
    v13 = object_getClassName(*(id *)(a1 + 32));
    v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    v17 = v12;
    v18 = 2082;
    v19 = v13;
    v20 = 2082;
    v21 = v14;
    v22 = 1024;
    v23 = 275;
    _os_log_impl(&dword_215BBD000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Block range must be between 0 to 255 inclusively", buf, 0x22u);
  }

}

void __94__NFCISO15693Tag_writeMultipleBlocksWithRequestFlags_blockRange_dataBlocks_completionHandler___block_invoke_23(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t Logger;
  void (*v5)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v9;
  NSObject *v10;
  objc_class *v11;
  int v12;
  const char *v13;
  const char *v14;
  const char *Name;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 40);
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  Logger = NFLogGetLogger();
  if (Logger)
  {
    v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v9 = 45;
    if (isMetaClass)
      v9 = 43;
    v5(3, "%c[%{public}s %{public}s]:%i Specified range length does not match the number of elements in the data block list", v9, ClassName, Name, 281);
  }
  NFSharedLogGetLogger();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11))
      v12 = 43;
    else
      v12 = 45;
    v13 = object_getClassName(*(id *)(a1 + 32));
    v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    v17 = v12;
    v18 = 2082;
    v19 = v13;
    v20 = 2082;
    v21 = v14;
    v22 = 1024;
    v23 = 281;
    _os_log_impl(&dword_215BBD000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Specified range length does not match the number of elements in the data block list", buf, 0x22u);
  }

}

void __94__NFCISO15693Tag_writeMultipleBlocksWithRequestFlags_blockRange_dataBlocks_completionHandler___block_invoke_25(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t Logger;
  void (*v5)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v9;
  NSObject *v10;
  objc_class *v11;
  int v12;
  const char *v13;
  const char *v14;
  const char *Name;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 40);
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  Logger = NFLogGetLogger();
  if (Logger)
  {
    v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v9 = 45;
    if (isMetaClass)
      v9 = 43;
    v5(3, "%c[%{public}s %{public}s]:%i Block range must be between 0 to 255 inclusively", v9, ClassName, Name, 287);
  }
  NFSharedLogGetLogger();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11))
      v12 = 43;
    else
      v12 = 45;
    v13 = object_getClassName(*(id *)(a1 + 32));
    v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    v17 = v12;
    v18 = 2082;
    v19 = v13;
    v20 = 2082;
    v21 = v14;
    v22 = 1024;
    v23 = 287;
    _os_log_impl(&dword_215BBD000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Block range must be between 0 to 255 inclusively", buf, 0x22u);
  }

}

void __94__NFCISO15693Tag_writeMultipleBlocksWithRequestFlags_blockRange_dataBlocks_completionHandler___block_invoke_26(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t Logger;
  void (*v5)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v9;
  NSObject *v10;
  objc_class *v11;
  int v12;
  const char *v13;
  const char *v14;
  const char *Name;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 40);
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  Logger = NFLogGetLogger();
  if (Logger)
  {
    v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v9 = 45;
    if (isMetaClass)
      v9 = 43;
    v5(3, "%c[%{public}s %{public}s]:%i Elements in the data block list are inconsistent in size", v9, ClassName, Name, 300);
  }
  NFSharedLogGetLogger();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11))
      v12 = 43;
    else
      v12 = 45;
    v13 = object_getClassName(*(id *)(a1 + 32));
    v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    v17 = v12;
    v18 = 2082;
    v19 = v13;
    v20 = 2082;
    v21 = v14;
    v22 = 1024;
    v23 = 300;
    _os_log_impl(&dword_215BBD000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Elements in the data block list are inconsistent in size", buf, 0x22u);
  }

}

void __94__NFCISO15693Tag_writeMultipleBlocksWithRequestFlags_blockRange_dataBlocks_completionHandler___block_invoke_28(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_parseResponseErrorWithData:", a2);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)selectWithRequestFlags:(unsigned __int8)a3 completionHandler:(id)a4
{
  int v4;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  os_activity_scope_state_s state;

  v4 = a3;
  v6 = a4;
  v7 = _os_activity_create(&dword_215BBD000, "NFCISO15693Tag selectWithRequestFlags:completionHandler:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  os_activity_scope_leave(&state);

  -[NFCISO15693Tag _generateRequestHeader:flags:](self, "_generateRequestHeader:flags:", 37, v4 & 0xFFFFFFCF | 0x20);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __59__NFCISO15693Tag_selectWithRequestFlags_completionHandler___block_invoke;
  v10[3] = &unk_24D44FC08;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  -[NFCTag _transceiveWithData:completionHandler:](self, "_transceiveWithData:completionHandler:", v8, v10);

}

void __59__NFCISO15693Tag_selectWithRequestFlags_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_parseResponseErrorWithData:", a2);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)resetToReadyWithRequestFlags:(unsigned __int8)a3 completionHandler:(id)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  os_activity_scope_state_s state;

  v4 = a3;
  v6 = a4;
  v7 = _os_activity_create(&dword_215BBD000, "NFCISO15693Tag resetToReadyWithRequestFlags:completionHandler:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  os_activity_scope_leave(&state);

  -[NFCISO15693Tag _generateRequestHeader:flags:](self, "_generateRequestHeader:flags:", 38, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __65__NFCISO15693Tag_resetToReadyWithRequestFlags_completionHandler___block_invoke;
  v10[3] = &unk_24D44FC08;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  -[NFCTag _transceiveWithData:completionHandler:](self, "_transceiveWithData:completionHandler:", v8, v10);

}

void __65__NFCISO15693Tag_resetToReadyWithRequestFlags_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_parseResponseErrorWithData:", a2);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)writeAFIWithRequestFlag:(unsigned __int8)a3 afi:(unsigned __int8)a4 completionHandler:(id)a5
{
  uint64_t v5;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  os_activity_scope_state_s state;
  unsigned __int8 v14;

  v5 = a3;
  v14 = a4;
  v7 = a5;
  v8 = _os_activity_create(&dword_215BBD000, "NFCISO15693Tag writeAFIWithRequestFlag:afi:completionHandler:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  -[NFCISO15693Tag _generateRequestHeader:flags:](self, "_generateRequestHeader:flags:", 39, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendBytes:length:", &v14, 1);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __64__NFCISO15693Tag_writeAFIWithRequestFlag_afi_completionHandler___block_invoke;
  v11[3] = &unk_24D44FC08;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  -[NFCTag _transceiveWithData:completionHandler:](self, "_transceiveWithData:completionHandler:", v9, v11);

}

void __64__NFCISO15693Tag_writeAFIWithRequestFlag_afi_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_parseResponseErrorWithData:", a2);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)lockAFIWithRequestFlag:(unsigned __int8)a3 completionHandler:(id)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  os_activity_scope_state_s state;

  v4 = a3;
  v6 = a4;
  v7 = _os_activity_create(&dword_215BBD000, "NFCISO15693Tag lockAFIWithRequestFlag:completionHandler:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  os_activity_scope_leave(&state);

  -[NFCISO15693Tag _generateRequestHeader:flags:](self, "_generateRequestHeader:flags:", 40, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __59__NFCISO15693Tag_lockAFIWithRequestFlag_completionHandler___block_invoke;
  v10[3] = &unk_24D44FC08;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  -[NFCTag _transceiveWithData:completionHandler:](self, "_transceiveWithData:completionHandler:", v8, v10);

}

void __59__NFCISO15693Tag_lockAFIWithRequestFlag_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_parseResponseErrorWithData:", a2);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)writeDSFIDWithRequestFlag:(unsigned __int8)a3 dsfid:(unsigned __int8)a4 completionHandler:(id)a5
{
  uint64_t v5;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  os_activity_scope_state_s state;
  unsigned __int8 v14;

  v5 = a3;
  v14 = a4;
  v7 = a5;
  v8 = _os_activity_create(&dword_215BBD000, "NFCISO15693Tag writeDSFIDWithRequestFlag:dsfid:completionHandler:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  -[NFCISO15693Tag _generateRequestHeader:flags:](self, "_generateRequestHeader:flags:", 41, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendBytes:length:", &v14, 1);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __68__NFCISO15693Tag_writeDSFIDWithRequestFlag_dsfid_completionHandler___block_invoke;
  v11[3] = &unk_24D44FC08;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  -[NFCTag _transceiveWithData:completionHandler:](self, "_transceiveWithData:completionHandler:", v9, v11);

}

void __68__NFCISO15693Tag_writeDSFIDWithRequestFlag_dsfid_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_parseResponseErrorWithData:", a2);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)lockDSFIDWithRequestFlag:(unsigned __int8)a3 completionHandler:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v6 = a4;
  -[NFCISO15693Tag _generateRequestHeader:flags:](self, "_generateRequestHeader:flags:", 42, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __61__NFCISO15693Tag_lockDSFIDWithRequestFlag_completionHandler___block_invoke;
  v9[3] = &unk_24D44FC08;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  -[NFCTag _transceiveWithData:completionHandler:](self, "_transceiveWithData:completionHandler:", v7, v9);

}

void __61__NFCISO15693Tag_lockDSFIDWithRequestFlag_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_parseResponseErrorWithData:", a2);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)getSystemInfoWithRequestFlag:(unsigned __int8)a3 completionHandler:(id)a4
{
  uint64_t v4;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __65__NFCISO15693Tag_getSystemInfoWithRequestFlag_completionHandler___block_invoke;
  v8[3] = &unk_24D44FC58;
  v9 = v6;
  v7 = v6;
  -[NFCISO15693Tag getSystemInfoAndUIDWithRequestFlag:completionHandler:](self, "getSystemInfoAndUIDWithRequestFlag:completionHandler:", v4, v8);

}

uint64_t __65__NFCISO15693Tag_getSystemInfoWithRequestFlag_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getSystemInfoAndUIDWithRequestFlag:(unsigned __int8)a3 completionHandler:(id)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  os_activity_scope_state_s state;

  v4 = a3;
  v6 = a4;
  v7 = _os_activity_create(&dword_215BBD000, "NFCISO15693Tag getSystemInfoAndUIDWithRequestFlag:completionHandler:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  os_activity_scope_leave(&state);

  -[NFCISO15693Tag _generateRequestHeader:flags:](self, "_generateRequestHeader:flags:", 43, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __71__NFCISO15693Tag_getSystemInfoAndUIDWithRequestFlag_completionHandler___block_invoke;
  v10[3] = &unk_24D44FC08;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  -[NFCTag _transceiveWithData:completionHandler:](self, "_transceiveWithData:completionHandler:", v8, v10);

}

void __71__NFCISO15693Tag_getSystemInfoAndUIDWithRequestFlag_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  char v11;
  unsigned int v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6
    || (objc_msgSend(*(id *)(a1 + 32), "_parseResponseErrorWithData:", v5),
        (v6 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v7 = v6;
LABEL_4:
    v8 = 0;
    goto LABEL_5;
  }
  if ((unint64_t)objc_msgSend(v5, "length") <= 9)
  {
    v13 = CFSTR("TagResponseInvalidLength");
    v14[0] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[NFCError errorWithCode:userInfo:](NFCError, "errorWithCode:userInfo:", 102, v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_4;
  }
  objc_msgSend(v5, "subdataWithRange:", 2, 8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_retainAutorelease(v5);
  v11 = *(_BYTE *)(objc_msgSend(v10, "bytes") + 1);
  if ((v11 & 1) != 0 && (unint64_t)objc_msgSend(v10, "length") >= 0xB)
    v12 = 11;
  else
    v12 = 10;
  if ((v11 & 2) != 0 && objc_msgSend(v10, "length") > (unint64_t)v12)
    ++v12;
  if ((v11 & 4) != 0 && objc_msgSend(v10, "length") > (unint64_t)v12 + 1)
    v12 += 2;
  if ((v11 & 8) != 0 && objc_msgSend(v10, "length") > (unint64_t)v12)
    v7 = 0;
  else
    v7 = 0;
LABEL_5:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)getMultipleBlockSecurityStatusWithRequestFlag:(unsigned __int8)a3 blockRange:(_NSRange)a4 completionHandler:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v7;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  NSUInteger v16;
  NSUInteger v17;
  _QWORD v18[5];
  id v19;
  SEL v20;
  os_activity_scope_state_s state;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  v10 = a5;
  v11 = _os_activity_create(&dword_215BBD000, "NFCISO15693Tag getMultipleBlockSecurityStatusWithRequestFlag:blockRange:completionHandler:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  os_activity_scope_leave(&state);

  if (location + length < 0x101)
  {
    -[NFCISO15693Tag _generateRequestHeader:flags:](self, "_generateRequestHeader:flags:", 44, v7);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    LOBYTE(state.opaque[0]) = location;
    BYTE1(state.opaque[0]) = length - 1;
    objc_msgSend(v12, "appendBytes:length:", &state, 2);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __93__NFCISO15693Tag_getMultipleBlockSecurityStatusWithRequestFlag_blockRange_completionHandler___block_invoke_30;
    v14[3] = &unk_24D44FC80;
    v16 = location;
    v17 = length;
    v14[4] = self;
    v15 = v10;
    v13 = v10;
    -[NFCTag _transceiveWithData:completionHandler:](self, "_transceiveWithData:completionHandler:", v12, v14);

  }
  else
  {
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __93__NFCISO15693Tag_getMultipleBlockSecurityStatusWithRequestFlag_blockRange_completionHandler___block_invoke;
    v18[3] = &unk_24D44F860;
    v18[4] = self;
    v19 = v10;
    v20 = a2;
    v12 = v10;
    -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v18);

  }
}

void __93__NFCISO15693Tag_getMultipleBlockSecurityStatusWithRequestFlag_blockRange_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  const char *v14;
  const char *v15;
  const char *Name;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 40);
  v3 = (void *)objc_opt_new();
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *))(v2 + 16))(v2, v3, v4);

  Logger = NFLogGetLogger();
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v6(3, "%c[%{public}s %{public}s]:%i Block range must be between 0 to 255 inclusively", v10, ClassName, Name, 505);
  }
  NFSharedLogGetLogger();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12))
      v13 = 43;
    else
      v13 = 45;
    v14 = object_getClassName(*(id *)(a1 + 32));
    v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    v18 = v13;
    v19 = 2082;
    v20 = v14;
    v21 = 2082;
    v22 = v15;
    v23 = 1024;
    v24 = 505;
    _os_log_impl(&dword_215BBD000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Block range must be between 0 to 255 inclusively", buf, 0x22u);
  }

}

void __93__NFCISO15693Tag_getMultipleBlockSecurityStatusWithRequestFlag_blockRange_completionHandler___block_invoke_30(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = v6;
    v8 = (void *)objc_opt_new();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_parseResponseErrorWithData:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_opt_new();
    if (!v7)
    {
      v9 = *(_QWORD *)(a1 + 56);
      if (v9 == objc_msgSend(v5, "length") - 1)
      {
        v10 = objc_retainAutorelease(v5);
        v11 = objc_msgSend(v10, "bytes");
        if ((unint64_t)objc_msgSend(v10, "length") >= 2)
        {
          v12 = 1;
          do
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithChar:", *(char *)(v11 + v12));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v13);

            ++v12;
          }
          while (objc_msgSend(v10, "length") > v12);
        }
        v7 = 0;
      }
      else
      {
        v15 = CFSTR("TagResponseInvalidLength");
        v16[0] = MEMORY[0x24BDBD1C8];
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[NFCError errorWithCode:userInfo:](NFCError, "errorWithCode:userInfo:", 102, v14);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)fastReadMultipleBlocksWithRequestFlag:(unsigned __int8)a3 blockRange:(_NSRange)a4 completionHandler:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v7;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  NSUInteger v16;
  NSUInteger v17;
  SEL v18;
  _QWORD v19[5];
  id v20;
  SEL v21;
  os_activity_scope_state_s state;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  v10 = a5;
  v11 = _os_activity_create(&dword_215BBD000, "NFCISO15693Tag fastReadMultipleBlocksWithRequestFlag:blockRange:completionHandler:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  os_activity_scope_leave(&state);

  if (location + length < 0x101)
  {
    -[NFCISO15693Tag _generateRequestHeader:flags:](self, "_generateRequestHeader:flags:", 45, v7);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    LOBYTE(state.opaque[0]) = location;
    BYTE1(state.opaque[0]) = length - 1;
    objc_msgSend(v12, "appendBytes:length:", &state, 2);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __85__NFCISO15693Tag_fastReadMultipleBlocksWithRequestFlag_blockRange_completionHandler___block_invoke_31;
    v14[3] = &unk_24D44FCA8;
    v16 = location;
    v17 = length;
    v18 = a2;
    v14[4] = self;
    v15 = v10;
    v13 = v10;
    -[NFCTag _transceiveWithData:completionHandler:](self, "_transceiveWithData:completionHandler:", v12, v14);

  }
  else
  {
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __85__NFCISO15693Tag_fastReadMultipleBlocksWithRequestFlag_blockRange_completionHandler___block_invoke;
    v19[3] = &unk_24D44F860;
    v19[4] = self;
    v20 = v10;
    v21 = a2;
    v12 = v10;
    -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v19);

  }
}

void __85__NFCISO15693Tag_fastReadMultipleBlocksWithRequestFlag_blockRange_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  const char *v14;
  const char *v15;
  const char *Name;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 40);
  v3 = (void *)objc_opt_new();
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *))(v2 + 16))(v2, v3, v4);

  Logger = NFLogGetLogger();
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v6(3, "%c[%{public}s %{public}s]:%i Block range must be between 0 to 255 inclusively", v10, ClassName, Name, 544);
  }
  NFSharedLogGetLogger();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12))
      v13 = 43;
    else
      v13 = 45;
    v14 = object_getClassName(*(id *)(a1 + 32));
    v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    v18 = v13;
    v19 = 2082;
    v20 = v14;
    v21 = 2082;
    v22 = v15;
    v23 = 1024;
    v24 = 544;
    _os_log_impl(&dword_215BBD000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Block range must be between 0 to 255 inclusively", buf, 0x22u);
  }

}

void __85__NFCISO15693Tag_fastReadMultipleBlocksWithRequestFlag_blockRange_completionHandler___block_invoke_31(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  uint64_t Logger;
  void (*v14)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v18;
  NSObject *v19;
  objc_class *v20;
  int v21;
  const char *v22;
  const char *v23;
  unint64_t v24;
  uint64_t v25;
  void *v26;
  const char *Name;
  uint8_t buf[4];
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  const __CFString *v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = v6;
    v8 = (void *)objc_opt_new();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_parseResponseErrorWithData:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_opt_new();
    if (!v7)
    {
      v9 = objc_msgSend(v5, "length") - 1;
      v10 = *(_QWORD *)(a1 + 56);
      if (v10 > v9 || (v11 = v9 / v10, v9 % v10))
      {
        v36 = CFSTR("TagResponseInvalidLength");
        v37[0] = MEMORY[0x24BDBD1C8];
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[NFCError errorWithCode:userInfo:](NFCError, "errorWithCode:userInfo:", 102, v12);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        Logger = NFLogGetLogger();
        if (Logger)
        {
          v14 = (void (*)(uint64_t, const char *, ...))Logger;
          Class = object_getClass(*(id *)(a1 + 32));
          isMetaClass = class_isMetaClass(Class);
          ClassName = object_getClassName(*(id *)(a1 + 32));
          Name = sel_getName(*(SEL *)(a1 + 64));
          v18 = 45;
          if (isMetaClass)
            v18 = 43;
          v14(3, "%c[%{public}s %{public}s]:%i Unexpected block size of 0", v18, ClassName, Name, 565);
        }
        NFSharedLogGetLogger();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v20 = object_getClass(*(id *)(a1 + 32));
          if (class_isMetaClass(v20))
            v21 = 43;
          else
            v21 = 45;
          v22 = object_getClassName(*(id *)(a1 + 32));
          v23 = sel_getName(*(SEL *)(a1 + 64));
          *(_DWORD *)buf = 67109890;
          v29 = v21;
          v30 = 2082;
          v31 = v22;
          v32 = 2082;
          v33 = v23;
          v34 = 1024;
          v35 = 565;
          _os_log_impl(&dword_215BBD000, v19, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected block size of 0", buf, 0x22u);
        }

      }
      else
      {
        v24 = 0;
        v25 = 1;
        do
        {
          objc_msgSend(v5, "subdataWithRange:", v25, v11);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v26);

          v25 += v11;
          ++v24;
        }
        while (*(_QWORD *)(a1 + 56) > v24);
        v7 = 0;
      }
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)customCommandWithRequestFlag:(unsigned __int8)a3 customCommandCode:(int64_t)a4 customRequestParameters:(id)a5 completionHandler:(id)a6
{
  uint64_t v8;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;
  SEL v20;
  os_activity_scope_state_s state;

  v8 = a3;
  v11 = a5;
  v12 = a6;
  v13 = _os_activity_create(&dword_215BBD000, "NFCISO15693Tag customCommandWithRequestFlag:customCommandCode:customRequestParameters:completionHandler:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v13, &state);
  os_activity_scope_leave(&state);

  if ((unint64_t)(a4 - 224) > 0xFFFFFFFFFFFFFFBFLL)
  {
    -[NFCISO15693Tag _generateRequestHeader:flags:](self, "_generateRequestHeader:flags:", a4, v8);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "length"))
      objc_msgSend(v14, "appendData:", v11);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __107__NFCISO15693Tag_customCommandWithRequestFlag_customCommandCode_customRequestParameters_completionHandler___block_invoke_33;
    v16[3] = &unk_24D44FC08;
    v16[4] = self;
    v17 = v12;
    v15 = v12;
    -[NFCTag _transceiveWithData:completionHandler:](self, "_transceiveWithData:completionHandler:", v14, v16);

  }
  else
  {
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __107__NFCISO15693Tag_customCommandWithRequestFlag_customCommandCode_customRequestParameters_completionHandler___block_invoke;
    v18[3] = &unk_24D44F860;
    v18[4] = self;
    v19 = v12;
    v20 = a2;
    v14 = v12;
    -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v18);
    v15 = v19;
  }

}

void __107__NFCISO15693Tag_customCommandWithRequestFlag_customCommandCode_customRequestParameters_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  const char *v14;
  const char *v15;
  const char *Name;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 40);
  v3 = (void *)objc_opt_new();
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *))(v2 + 16))(v2, v3, v4);

  Logger = NFLogGetLogger();
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v6(3, "%c[%{public}s %{public}s]:%i Custom command code must be between 0xA0 to 0xDF inclusively", v10, ClassName, Name, 589);
  }
  NFSharedLogGetLogger();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12))
      v13 = 43;
    else
      v13 = 45;
    v14 = object_getClassName(*(id *)(a1 + 32));
    v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    v18 = v13;
    v19 = 2082;
    v20 = v14;
    v21 = 2082;
    v22 = v15;
    v23 = 1024;
    v24 = 589;
    _os_log_impl(&dword_215BBD000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Custom command code must be between 0xA0 to 0xDF inclusively", buf, 0x22u);
  }

}

void __107__NFCISO15693Tag_customCommandWithRequestFlag_customCommandCode_customRequestParameters_completionHandler___block_invoke_33(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (v5
    || (objc_msgSend(*(id *)(a1 + 32), "_parseResponseErrorWithData:", v8),
        (v5 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = objc_opt_new();
  }
  else
  {
    objc_msgSend(v8, "subdataWithRange:", 1, objc_msgSend(v8, "length") - 1);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)extendedReadSingleBlockWithRequestFlags:(unsigned __int8)a3 blockNumber:(int64_t)a4 completionHandler:(id)a5
{
  uint64_t v6;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;
  SEL v17;
  os_activity_scope_state_s state;

  v6 = a3;
  v9 = a5;
  v10 = _os_activity_create(&dword_215BBD000, "NFCISO15693Tag extendedReadSingleBlockWithRequestFlags:blockNumber:completionHandler:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  os_activity_scope_leave(&state);

  if ((unint64_t)a4 < 0x10000)
  {
    -[NFCISO15693Tag _generateRequestHeader:flags:](self, "_generateRequestHeader:flags:", 48, v6);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    LOWORD(state.opaque[0]) = a4;
    objc_msgSend(v11, "appendBytes:length:", &state, 2);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __88__NFCISO15693Tag_extendedReadSingleBlockWithRequestFlags_blockNumber_completionHandler___block_invoke_34;
    v13[3] = &unk_24D44FC08;
    v13[4] = self;
    v14 = v9;
    v12 = v9;
    -[NFCTag _transceiveWithData:completionHandler:](self, "_transceiveWithData:completionHandler:", v11, v13);

  }
  else
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __88__NFCISO15693Tag_extendedReadSingleBlockWithRequestFlags_blockNumber_completionHandler___block_invoke;
    v15[3] = &unk_24D44F860;
    v15[4] = self;
    v16 = v9;
    v17 = a2;
    v11 = v9;
    -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v15);

  }
}

void __88__NFCISO15693Tag_extendedReadSingleBlockWithRequestFlags_blockNumber_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  const char *v14;
  const char *v15;
  const char *Name;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 40);
  v3 = (void *)objc_opt_new();
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *))(v2 + 16))(v2, v3, v4);

  Logger = NFLogGetLogger();
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v6(3, "%c[%{public}s %{public}s]:%i Block range must be between 0 to 255 inclusively", v10, ClassName, Name, 625);
  }
  NFSharedLogGetLogger();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12))
      v13 = 43;
    else
      v13 = 45;
    v14 = object_getClassName(*(id *)(a1 + 32));
    v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    v18 = v13;
    v19 = 2082;
    v20 = v14;
    v21 = 2082;
    v22 = v15;
    v23 = 1024;
    v24 = 625;
    _os_log_impl(&dword_215BBD000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Block range must be between 0 to 255 inclusively", buf, 0x22u);
  }

}

void __88__NFCISO15693Tag_extendedReadSingleBlockWithRequestFlags_blockNumber_completionHandler___block_invoke_34(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (v5
    || (objc_msgSend(*(id *)(a1 + 32), "_parseResponseErrorWithData:", v8),
        (v5 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = objc_opt_new();
  }
  else
  {
    objc_msgSend(v8, "subdataWithRange:", 1, objc_msgSend(v8, "length") - 1);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)extendedWriteSingleBlockWithRequestFlags:(unsigned __int8)a3 blockNumber:(int64_t)a4 dataBlock:(id)a5 completionHandler:(id)a6
{
  uint64_t v8;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;
  SEL v19;
  _QWORD v20[5];
  id v21;
  SEL v22;
  os_activity_scope_state_s state;

  v8 = a3;
  v11 = a5;
  v12 = a6;
  v13 = _os_activity_create(&dword_215BBD000, "NFCISO15693Tag extendedWriteSingleBlockWithRequestFlags:blockNumber:dataBlock:completionHandler:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v13, &state);
  os_activity_scope_leave(&state);

  if ((unint64_t)a4 < 0x10000)
  {
    if (objc_msgSend(v11, "length"))
    {
      -[NFCISO15693Tag _generateRequestHeader:flags:](self, "_generateRequestHeader:flags:", 49, v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LOWORD(state.opaque[0]) = a4;
      objc_msgSend(v14, "appendBytes:length:", &state, 2);
      objc_msgSend(v14, "appendData:", v11);
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __99__NFCISO15693Tag_extendedWriteSingleBlockWithRequestFlags_blockNumber_dataBlock_completionHandler___block_invoke_36;
      v15[3] = &unk_24D44FC08;
      v15[4] = self;
      v16 = v12;
      -[NFCTag _transceiveWithData:completionHandler:](self, "_transceiveWithData:completionHandler:", v14, v15);

    }
    else
    {
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __99__NFCISO15693Tag_extendedWriteSingleBlockWithRequestFlags_blockNumber_dataBlock_completionHandler___block_invoke_35;
      v17[3] = &unk_24D44F860;
      v17[4] = self;
      v18 = v12;
      v19 = a2;
      -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v17);
      v14 = v18;
    }
  }
  else
  {
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __99__NFCISO15693Tag_extendedWriteSingleBlockWithRequestFlags_blockNumber_dataBlock_completionHandler___block_invoke;
    v20[3] = &unk_24D44F860;
    v20[4] = self;
    v21 = v12;
    v22 = a2;
    -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v20);
    v14 = v21;
  }

}

void __99__NFCISO15693Tag_extendedWriteSingleBlockWithRequestFlags_blockNumber_dataBlock_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t Logger;
  void (*v5)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v9;
  NSObject *v10;
  objc_class *v11;
  int v12;
  const char *v13;
  const char *v14;
  const char *Name;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 40);
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  Logger = NFLogGetLogger();
  if (Logger)
  {
    v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v9 = 45;
    if (isMetaClass)
      v9 = 43;
    v5(3, "%c[%{public}s %{public}s]:%i Block range must be between 0 to 255 inclusively", v9, ClassName, Name, 661);
  }
  NFSharedLogGetLogger();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11))
      v12 = 43;
    else
      v12 = 45;
    v13 = object_getClassName(*(id *)(a1 + 32));
    v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    v17 = v12;
    v18 = 2082;
    v19 = v13;
    v20 = 2082;
    v21 = v14;
    v22 = 1024;
    v23 = 661;
    _os_log_impl(&dword_215BBD000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Block range must be between 0 to 255 inclusively", buf, 0x22u);
  }

}

void __99__NFCISO15693Tag_extendedWriteSingleBlockWithRequestFlags_blockNumber_dataBlock_completionHandler___block_invoke_35(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t Logger;
  void (*v5)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v9;
  NSObject *v10;
  objc_class *v11;
  int v12;
  const char *v13;
  const char *v14;
  const char *Name;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 40);
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  Logger = NFLogGetLogger();
  if (Logger)
  {
    v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v9 = 45;
    if (isMetaClass)
      v9 = 43;
    v5(3, "%c[%{public}s %{public}s]:%i Data block length must be greater than 0", v9, ClassName, Name, 669);
  }
  NFSharedLogGetLogger();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11))
      v12 = 43;
    else
      v12 = 45;
    v13 = object_getClassName(*(id *)(a1 + 32));
    v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    v17 = v12;
    v18 = 2082;
    v19 = v13;
    v20 = 2082;
    v21 = v14;
    v22 = 1024;
    v23 = 669;
    _os_log_impl(&dword_215BBD000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Data block length must be greater than 0", buf, 0x22u);
  }

}

void __99__NFCISO15693Tag_extendedWriteSingleBlockWithRequestFlags_blockNumber_dataBlock_completionHandler___block_invoke_36(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_parseResponseErrorWithData:", a2);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)extendedLockBlockWithRequestFlags:(unsigned __int8)a3 blockNumber:(int64_t)a4 completionHandler:(id)a5
{
  uint64_t v6;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;
  SEL v17;
  os_activity_scope_state_s state;

  v6 = a3;
  v9 = a5;
  v10 = _os_activity_create(&dword_215BBD000, "NFCISO15693Tag extendedLockBlockWithRequestFlags:blockNumber:completionHandler:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  os_activity_scope_leave(&state);

  if ((unint64_t)a4 < 0x10000)
  {
    -[NFCISO15693Tag _generateRequestHeader:flags:](self, "_generateRequestHeader:flags:", 50, v6);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    LOWORD(state.opaque[0]) = a4;
    objc_msgSend(v11, "appendBytes:length:", &state, 2);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __82__NFCISO15693Tag_extendedLockBlockWithRequestFlags_blockNumber_completionHandler___block_invoke_37;
    v13[3] = &unk_24D44FC08;
    v13[4] = self;
    v14 = v9;
    v12 = v9;
    -[NFCTag _transceiveWithData:completionHandler:](self, "_transceiveWithData:completionHandler:", v11, v13);

  }
  else
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __82__NFCISO15693Tag_extendedLockBlockWithRequestFlags_blockNumber_completionHandler___block_invoke;
    v15[3] = &unk_24D44F860;
    v15[4] = self;
    v16 = v9;
    v17 = a2;
    v11 = v9;
    -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v15);

  }
}

void __82__NFCISO15693Tag_extendedLockBlockWithRequestFlags_blockNumber_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t Logger;
  void (*v5)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v9;
  NSObject *v10;
  objc_class *v11;
  int v12;
  const char *v13;
  const char *v14;
  const char *Name;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 40);
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  Logger = NFLogGetLogger();
  if (Logger)
  {
    v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v9 = 45;
    if (isMetaClass)
      v9 = 43;
    v5(3, "%c[%{public}s %{public}s]:%i Block range must be between 0 to 255 inclusively", v9, ClassName, Name, 698);
  }
  NFSharedLogGetLogger();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11))
      v12 = 43;
    else
      v12 = 45;
    v13 = object_getClassName(*(id *)(a1 + 32));
    v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    v17 = v12;
    v18 = 2082;
    v19 = v13;
    v20 = 2082;
    v21 = v14;
    v22 = 1024;
    v23 = 698;
    _os_log_impl(&dword_215BBD000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Block range must be between 0 to 255 inclusively", buf, 0x22u);
  }

}

void __82__NFCISO15693Tag_extendedLockBlockWithRequestFlags_blockNumber_completionHandler___block_invoke_37(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_parseResponseErrorWithData:", a2);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)extendedReadMultipleBlocksWithRequestFlags:(unsigned __int8)a3 blockRange:(_NSRange)a4 completionHandler:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v7;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  NSUInteger v16;
  NSUInteger v17;
  _QWORD v18[5];
  id v19;
  SEL v20;
  os_activity_scope_state_s state;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  v10 = a5;
  v11 = _os_activity_create(&dword_215BBD000, "NFCISO15693Tag extendedReadMultipleBlocksWithRequestFlags:blockRange:completionHandler:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  os_activity_scope_leave(&state);

  if (location + length <= 0x10000)
  {
    -[NFCISO15693Tag _generateRequestHeader:flags:](self, "_generateRequestHeader:flags:", 51, v7);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    LOWORD(state.opaque[0]) = location;
    WORD1(state.opaque[0]) = length - 1;
    objc_msgSend(v12, "appendBytes:length:", &state, 4);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __90__NFCISO15693Tag_extendedReadMultipleBlocksWithRequestFlags_blockRange_completionHandler___block_invoke_38;
    v14[3] = &unk_24D44FC80;
    v16 = location;
    v17 = length;
    v14[4] = self;
    v15 = v10;
    v13 = v10;
    -[NFCTag _transceiveWithData:completionHandler:](self, "_transceiveWithData:completionHandler:", v12, v14);

  }
  else
  {
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __90__NFCISO15693Tag_extendedReadMultipleBlocksWithRequestFlags_blockRange_completionHandler___block_invoke;
    v18[3] = &unk_24D44F860;
    v18[4] = self;
    v19 = v10;
    v20 = a2;
    v12 = v10;
    -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v18);

  }
}

void __90__NFCISO15693Tag_extendedReadMultipleBlocksWithRequestFlags_blockRange_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  const char *v14;
  const char *v15;
  const char *Name;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 40);
  v3 = (void *)objc_opt_new();
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *))(v2 + 16))(v2, v3, v4);

  Logger = NFLogGetLogger();
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v6(3, "%c[%{public}s %{public}s]:%i Block range must be between 0 to 255 inclusively", v10, ClassName, Name, 725);
  }
  NFSharedLogGetLogger();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12))
      v13 = 43;
    else
      v13 = 45;
    v14 = object_getClassName(*(id *)(a1 + 32));
    v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    v18 = v13;
    v19 = 2082;
    v20 = v14;
    v21 = 2082;
    v22 = v15;
    v23 = 1024;
    v24 = 725;
    _os_log_impl(&dword_215BBD000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Block range must be between 0 to 255 inclusively", buf, 0x22u);
  }

}

void __90__NFCISO15693Tag_extendedReadMultipleBlocksWithRequestFlags_blockRange_completionHandler___block_invoke_38(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = v6;
    v8 = (void *)objc_opt_new();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_parseResponseErrorWithData:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_opt_new();
    if (!v7)
    {
      v9 = objc_msgSend(v5, "length");
      v10 = *(_QWORD *)(a1 + 56);
      v11 = (v9 - 1) / v10;
      if ((v9 - 1) % v10)
      {
        v15 = CFSTR("TagResponseInvalidLength");
        v16[0] = MEMORY[0x24BDBD1C8];
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[NFCError errorWithCode:userInfo:](NFCError, "errorWithCode:userInfo:", 102, v12);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v13 = 0;
        do
        {
          objc_msgSend(v5, "subdataWithRange:", v13 * v11 + 1, v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

          ++v13;
        }
        while (*(_QWORD *)(a1 + 56) > v13);
        v7 = 0;
      }
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)extendedWriteMultipleBlocksWithRequestFlags:(unsigned __int8)a3 blockRange:(_NSRange)a4 dataBlocks:(id)a5 completionHandler:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v9;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  SEL v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[5];
  id v28;
  SEL v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[5];
  id v35;
  SEL v36;
  _QWORD v37[5];
  id v38;
  SEL v39;
  _QWORD v40[5];
  id v41;
  SEL v42;
  os_activity_scope_state_s state;
  _BYTE v44[128];
  uint64_t v45;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v45 = *MEMORY[0x24BDAC8D0];
  v12 = a5;
  v13 = a6;
  v14 = _os_activity_create(&dword_215BBD000, "NFCISO15693Tag extendedWriteMultipleBlocksWithRequestFlags:blockRange:dataBlock:completionHandler:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v14, &state);
  os_activity_scope_leave(&state);

  if (location + length <= 0x10000)
  {
    if (objc_msgSend(v12, "count") == length)
    {
      if (length)
      {
        v24 = a2;
        -[NFCISO15693Tag _generateRequestHeader:flags:](self, "_generateRequestHeader:flags:", 52, v9);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        LOWORD(state.opaque[0]) = location;
        WORD1(state.opaque[0]) = length - 1;
        objc_msgSend(v15, "appendBytes:length:", &state, 4);
        objc_msgSend(v12, "firstObject");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "length");

        v32 = 0u;
        v33 = 0u;
        v30 = 0u;
        v31 = 0u;
        v18 = v12;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v31;
          while (2)
          {
            for (i = 0; i != v20; ++i)
            {
              if (*(_QWORD *)v31 != v21)
                objc_enumerationMutation(v18);
              v23 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
              if (v17 != objc_msgSend(v23, "length"))
              {
                v27[0] = MEMORY[0x24BDAC760];
                v27[1] = 3221225472;
                v27[2] = __102__NFCISO15693Tag_extendedWriteMultipleBlocksWithRequestFlags_blockRange_dataBlocks_completionHandler___block_invoke_41;
                v27[3] = &unk_24D44F860;
                v27[4] = self;
                v28 = v13;
                v29 = v24;
                -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v27);

                goto LABEL_17;
              }
              objc_msgSend(v15, "appendData:", v23);
            }
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
            if (v20)
              continue;
            break;
          }
        }

        v25[0] = MEMORY[0x24BDAC760];
        v25[1] = 3221225472;
        v25[2] = __102__NFCISO15693Tag_extendedWriteMultipleBlocksWithRequestFlags_blockRange_dataBlocks_completionHandler___block_invoke_42;
        v25[3] = &unk_24D44FC08;
        v25[4] = self;
        v26 = v13;
        -[NFCTag _transceiveWithData:completionHandler:](self, "_transceiveWithData:completionHandler:", v15, v25);

      }
      else
      {
        v34[0] = MEMORY[0x24BDAC760];
        v34[1] = 3221225472;
        v34[2] = __102__NFCISO15693Tag_extendedWriteMultipleBlocksWithRequestFlags_blockRange_dataBlocks_completionHandler___block_invoke_40;
        v34[3] = &unk_24D44F860;
        v34[4] = self;
        v35 = v13;
        v36 = a2;
        -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v34);
        v15 = v35;
      }
    }
    else
    {
      v37[0] = MEMORY[0x24BDAC760];
      v37[1] = 3221225472;
      v37[2] = __102__NFCISO15693Tag_extendedWriteMultipleBlocksWithRequestFlags_blockRange_dataBlocks_completionHandler___block_invoke_39;
      v37[3] = &unk_24D44F860;
      v37[4] = self;
      v38 = v13;
      v39 = a2;
      -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v37);
      v15 = v38;
    }
  }
  else
  {
    v40[0] = MEMORY[0x24BDAC760];
    v40[1] = 3221225472;
    v40[2] = __102__NFCISO15693Tag_extendedWriteMultipleBlocksWithRequestFlags_blockRange_dataBlocks_completionHandler___block_invoke;
    v40[3] = &unk_24D44F860;
    v40[4] = self;
    v41 = v13;
    v42 = a2;
    -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v40);
    v15 = v41;
  }
LABEL_17:

}

void __102__NFCISO15693Tag_extendedWriteMultipleBlocksWithRequestFlags_blockRange_dataBlocks_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t Logger;
  void (*v5)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v9;
  NSObject *v10;
  objc_class *v11;
  int v12;
  const char *v13;
  const char *v14;
  const char *Name;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 40);
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  Logger = NFLogGetLogger();
  if (Logger)
  {
    v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v9 = 45;
    if (isMetaClass)
      v9 = 43;
    v5(3, "%c[%{public}s %{public}s]:%i Block range must be between 0 to 255 inclusively", v9, ClassName, Name, 769);
  }
  NFSharedLogGetLogger();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11))
      v12 = 43;
    else
      v12 = 45;
    v13 = object_getClassName(*(id *)(a1 + 32));
    v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    v17 = v12;
    v18 = 2082;
    v19 = v13;
    v20 = 2082;
    v21 = v14;
    v22 = 1024;
    v23 = 769;
    _os_log_impl(&dword_215BBD000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Block range must be between 0 to 255 inclusively", buf, 0x22u);
  }

}

void __102__NFCISO15693Tag_extendedWriteMultipleBlocksWithRequestFlags_blockRange_dataBlocks_completionHandler___block_invoke_39(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t Logger;
  void (*v5)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v9;
  NSObject *v10;
  objc_class *v11;
  int v12;
  const char *v13;
  const char *v14;
  const char *Name;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 40);
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  Logger = NFLogGetLogger();
  if (Logger)
  {
    v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v9 = 45;
    if (isMetaClass)
      v9 = 43;
    v5(3, "%c[%{public}s %{public}s]:%i Specified range length does not match the number of elements in the data block list", v9, ClassName, Name, 775);
  }
  NFSharedLogGetLogger();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11))
      v12 = 43;
    else
      v12 = 45;
    v13 = object_getClassName(*(id *)(a1 + 32));
    v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    v17 = v12;
    v18 = 2082;
    v19 = v13;
    v20 = 2082;
    v21 = v14;
    v22 = 1024;
    v23 = 775;
    _os_log_impl(&dword_215BBD000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Specified range length does not match the number of elements in the data block list", buf, 0x22u);
  }

}

void __102__NFCISO15693Tag_extendedWriteMultipleBlocksWithRequestFlags_blockRange_dataBlocks_completionHandler___block_invoke_40(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t Logger;
  void (*v5)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v9;
  NSObject *v10;
  objc_class *v11;
  int v12;
  const char *v13;
  const char *v14;
  const char *Name;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 40);
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  Logger = NFLogGetLogger();
  if (Logger)
  {
    v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v9 = 45;
    if (isMetaClass)
      v9 = 43;
    v5(3, "%c[%{public}s %{public}s]:%i Block range must be between 0 to 255 inclusively", v9, ClassName, Name, 781);
  }
  NFSharedLogGetLogger();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11))
      v12 = 43;
    else
      v12 = 45;
    v13 = object_getClassName(*(id *)(a1 + 32));
    v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    v17 = v12;
    v18 = 2082;
    v19 = v13;
    v20 = 2082;
    v21 = v14;
    v22 = 1024;
    v23 = 781;
    _os_log_impl(&dword_215BBD000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Block range must be between 0 to 255 inclusively", buf, 0x22u);
  }

}

void __102__NFCISO15693Tag_extendedWriteMultipleBlocksWithRequestFlags_blockRange_dataBlocks_completionHandler___block_invoke_41(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t Logger;
  void (*v5)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v9;
  NSObject *v10;
  objc_class *v11;
  int v12;
  const char *v13;
  const char *v14;
  const char *Name;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 40);
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  Logger = NFLogGetLogger();
  if (Logger)
  {
    v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v9 = 45;
    if (isMetaClass)
      v9 = 43;
    v5(3, "%c[%{public}s %{public}s]:%i Elements in the data block list are inconsistent in size", v9, ClassName, Name, 795);
  }
  NFSharedLogGetLogger();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11))
      v12 = 43;
    else
      v12 = 45;
    v13 = object_getClassName(*(id *)(a1 + 32));
    v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    v17 = v12;
    v18 = 2082;
    v19 = v13;
    v20 = 2082;
    v21 = v14;
    v22 = 1024;
    v23 = 795;
    _os_log_impl(&dword_215BBD000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Elements in the data block list are inconsistent in size", buf, 0x22u);
  }

}

void __102__NFCISO15693Tag_extendedWriteMultipleBlocksWithRequestFlags_blockRange_dataBlocks_completionHandler___block_invoke_42(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_parseResponseErrorWithData:", a2);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)authenticateWithRequestFlags:(unsigned __int8)a3 cryptoSuiteIdentifier:(int64_t)a4 message:(id)a5 completionHandler:(id)a6
{
  char v7;
  uint64_t v8;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  os_activity_scope_state_s state;

  v7 = a4;
  v8 = a3;
  v10 = a5;
  v11 = a6;
  v12 = _os_activity_create(&dword_215BBD000, "NFCISO15693Tag authenticateWithRequestFlags:cryptoSuiteIdentifier:message:completionHandler:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v12, &state);
  os_activity_scope_leave(&state);

  -[NFCISO15693Tag _generateRequestHeader:flags:](self, "_generateRequestHeader:flags:", 53, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(state.opaque[0]) = v7;
  objc_msgSend(v13, "appendBytes:length:", &state, 1);
  if (objc_msgSend(v10, "length"))
    objc_msgSend(v13, "appendData:", v10);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __95__NFCISO15693Tag_authenticateWithRequestFlags_cryptoSuiteIdentifier_message_completionHandler___block_invoke;
  v15[3] = &unk_24D44FC08;
  v15[4] = self;
  v16 = v11;
  v14 = v11;
  -[NFCTag _transceiveWithData:completionHandler:](self, "_transceiveWithData:completionHandler:", v13, v15);

}

void __95__NFCISO15693Tag_authenticateWithRequestFlags_cryptoSuiteIdentifier_message_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_parseResponseErrorWithData:", v8);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  if ((unint64_t)objc_msgSend(v8, "length") < 2)
  {
    v7 = (void *)objc_opt_new();
  }
  else
  {
    v6 = objc_retainAutorelease(v8);
    objc_msgSend(v6, "bytes");
    objc_msgSend(v6, "subdataWithRange:", 1, objc_msgSend(v6, "length") - 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)keyUpdateWithRequestFlags:(unsigned __int8)a3 keyIdentifier:(int64_t)a4 message:(id)a5 completionHandler:(id)a6
{
  char v7;
  uint64_t v8;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  os_activity_scope_state_s state;

  v7 = a4;
  v8 = a3;
  v10 = a5;
  v11 = a6;
  v12 = _os_activity_create(&dword_215BBD000, "NFCISO15693Tag keyUpdateWithRequestFlags:keyIdentifier:message:completionHandler:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v12, &state);
  os_activity_scope_leave(&state);

  -[NFCISO15693Tag _generateRequestHeader:flags:](self, "_generateRequestHeader:flags:", 54, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(state.opaque[0]) = v7;
  objc_msgSend(v13, "appendBytes:length:", &state, 1);
  if (objc_msgSend(v10, "length"))
    objc_msgSend(v13, "appendData:", v10);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __84__NFCISO15693Tag_keyUpdateWithRequestFlags_keyIdentifier_message_completionHandler___block_invoke;
  v15[3] = &unk_24D44FC08;
  v15[4] = self;
  v16 = v11;
  v14 = v11;
  -[NFCTag _transceiveWithData:completionHandler:](self, "_transceiveWithData:completionHandler:", v13, v15);

}

void __84__NFCISO15693Tag_keyUpdateWithRequestFlags_keyIdentifier_message_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_parseResponseErrorWithData:", v8);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  if ((unint64_t)objc_msgSend(v8, "length") < 2)
  {
    v7 = (void *)objc_opt_new();
  }
  else
  {
    v6 = objc_retainAutorelease(v8);
    objc_msgSend(v6, "bytes");
    objc_msgSend(v6, "subdataWithRange:", 1, objc_msgSend(v6, "length") - 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)challengeWithRequestFlags:(unsigned __int8)a3 cryptoSuiteIdentifier:(int64_t)a4 message:(id)a5 completionHandler:(id)a6
{
  char v7;
  uint64_t v8;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  os_activity_scope_state_s state;

  v7 = a4;
  v8 = a3;
  v10 = a5;
  v11 = a6;
  v12 = _os_activity_create(&dword_215BBD000, "NFCISO15693Tag challengeWithRequestFlags:cryptoSuiteIdentifier:message:completionHandler:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v12, &state);
  os_activity_scope_leave(&state);

  -[NFCISO15693Tag _generateRequestHeader:flags:](self, "_generateRequestHeader:flags:", 57, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(state.opaque[0]) = v7;
  objc_msgSend(v13, "appendBytes:length:", &state, 1);
  if (objc_msgSend(v10, "length"))
    objc_msgSend(v13, "appendData:", v10);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __92__NFCISO15693Tag_challengeWithRequestFlags_cryptoSuiteIdentifier_message_completionHandler___block_invoke;
  v15[3] = &unk_24D44F888;
  v16 = v11;
  v14 = v11;
  -[NFCTag _transceiveWithData:completionHandler:](self, "_transceiveWithData:completionHandler:", v13, v15);

}

void __92__NFCISO15693Tag_challengeWithRequestFlags_cryptoSuiteIdentifier_message_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void (*v7)(void);
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = v5;
  if (v5 && objc_msgSend(v5, "code") == 100)
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  else
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  v7();

}

- (void)readBufferWithRequestFlags:(unsigned __int8)a3 completionHandler:(id)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  os_activity_scope_state_s state;

  v4 = a3;
  v6 = a4;
  v7 = _os_activity_create(&dword_215BBD000, "NFCISO15693Tag readBufferWithRequestFlags:completionHandler:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  os_activity_scope_leave(&state);

  -[NFCISO15693Tag _generateRequestHeader:flags:](self, "_generateRequestHeader:flags:", 58, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __63__NFCISO15693Tag_readBufferWithRequestFlags_completionHandler___block_invoke;
  v10[3] = &unk_24D44FC08;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  -[NFCTag _transceiveWithData:completionHandler:](self, "_transceiveWithData:completionHandler:", v8, v10);

}

void __63__NFCISO15693Tag_readBufferWithRequestFlags_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_parseResponseErrorWithData:", v8);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  if ((unint64_t)objc_msgSend(v8, "length") < 2)
  {
    v7 = (void *)objc_opt_new();
  }
  else
  {
    v6 = objc_retainAutorelease(v8);
    objc_msgSend(v6, "bytes");
    objc_msgSend(v6, "subdataWithRange:", 1, objc_msgSend(v6, "length") - 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)extendedGetMultipleBlockSecurityStatusWithRequestFlag:(unsigned __int8)a3 blockRange:(_NSRange)a4 completionHandler:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v7;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  NSUInteger v16;
  NSUInteger v17;
  _QWORD v18[5];
  id v19;
  SEL v20;
  os_activity_scope_state_s state;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  v10 = a5;
  v11 = _os_activity_create(&dword_215BBD000, "NFCISO15693Tag extendedGetMultipleBlockSecurityStatusWithRequestFlag:blockRange:completionHandler:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  os_activity_scope_leave(&state);

  if (location + length <= 0x10000)
  {
    -[NFCISO15693Tag _generateRequestHeader:flags:](self, "_generateRequestHeader:flags:", 60, v7);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    LOWORD(state.opaque[0]) = location;
    WORD1(state.opaque[0]) = length - 1;
    objc_msgSend(v12, "appendBytes:length:", &state, 4);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __101__NFCISO15693Tag_extendedGetMultipleBlockSecurityStatusWithRequestFlag_blockRange_completionHandler___block_invoke_43;
    v14[3] = &unk_24D44FC80;
    v16 = location;
    v17 = length;
    v14[4] = self;
    v15 = v10;
    v13 = v10;
    -[NFCTag _transceiveWithData:completionHandler:](self, "_transceiveWithData:completionHandler:", v12, v14);

  }
  else
  {
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __101__NFCISO15693Tag_extendedGetMultipleBlockSecurityStatusWithRequestFlag_blockRange_completionHandler___block_invoke;
    v18[3] = &unk_24D44F860;
    v18[4] = self;
    v19 = v10;
    v20 = a2;
    v12 = v10;
    -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v18);

  }
}

void __101__NFCISO15693Tag_extendedGetMultipleBlockSecurityStatusWithRequestFlag_blockRange_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  const char *v14;
  const char *v15;
  const char *Name;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 40);
  v3 = (void *)objc_opt_new();
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *))(v2 + 16))(v2, v3, v4);

  Logger = NFLogGetLogger();
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v6(3, "%c[%{public}s %{public}s]:%i Block range must be between 0 to 255 inclusively", v10, ClassName, Name, 932);
  }
  NFSharedLogGetLogger();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12))
      v13 = 43;
    else
      v13 = 45;
    v14 = object_getClassName(*(id *)(a1 + 32));
    v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    v18 = v13;
    v19 = 2082;
    v20 = v14;
    v21 = 2082;
    v22 = v15;
    v23 = 1024;
    v24 = 932;
    _os_log_impl(&dword_215BBD000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Block range must be between 0 to 255 inclusively", buf, 0x22u);
  }

}

void __101__NFCISO15693Tag_extendedGetMultipleBlockSecurityStatusWithRequestFlag_blockRange_completionHandler___block_invoke_43(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = v6;
    v8 = (void *)objc_opt_new();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_parseResponseErrorWithData:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_opt_new();
    if (!v7)
    {
      v9 = *(_QWORD *)(a1 + 56);
      if (v9 == objc_msgSend(v5, "length") - 1)
      {
        v10 = objc_retainAutorelease(v5);
        v11 = objc_msgSend(v10, "bytes");
        if ((unint64_t)objc_msgSend(v10, "length") >= 2)
        {
          v12 = 1;
          do
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithChar:", *(char *)(v11 + v12));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v13);

            ++v12;
          }
          while (objc_msgSend(v10, "length") > v12);
        }
        v7 = 0;
      }
      else
      {
        v15 = CFSTR("TagResponseInvalidLength");
        v16[0] = MEMORY[0x24BDBD1C8];
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[NFCError errorWithCode:userInfo:](NFCError, "errorWithCode:userInfo:", 102, v14);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_wtxRetryWithCommnand:(id)a3 maxRetry:(int64_t)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int64_t v16;
  SEL v17;

  v9 = a3;
  v10 = a5;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __67__NFCISO15693Tag__wtxRetryWithCommnand_maxRetry_completionHandler___block_invoke;
  v13[3] = &unk_24D44FCD0;
  v15 = v10;
  v16 = a4;
  v17 = a2;
  v13[4] = self;
  v14 = v9;
  v11 = v9;
  v12 = v10;
  -[NFCTag _transceiveWithData:completionHandler:](self, "_transceiveWithData:completionHandler:", v11, v13);

}

void __67__NFCISO15693Tag__wtxRetryWithCommnand_maxRetry_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t Logger;
  void (*v16)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v20;
  NSObject *v21;
  objc_class *v22;
  int v23;
  const char *v24;
  const char *v25;
  void *v26;
  dispatch_time_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  const char *Name;
  _QWORD v32[5];
  id v33;
  id v34;
  uint64_t v35;
  uint8_t buf[4];
  int v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  int v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "_parseResponseErrorWithData:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = objc_retainAutorelease(v5);
  v8 = objc_msgSend(v7, "bytes");
  if ((unint64_t)objc_msgSend(v7, "length") < 2 || (*(_BYTE *)v8 & 0x40) == 0)
  {
    if (!v6)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      goto LABEL_9;
    }
    goto LABEL_6;
  }
  if (objc_msgSend(v7, "length") != 3)
  {
    v11 = 0;
    if (!v6)
      goto LABEL_14;
LABEL_6:
    v9 = *(_QWORD *)(a1 + 48);
    v10 = (void *)objc_opt_new();
    (*(void (**)(uint64_t, void *, id))(v9 + 16))(v9, v10, v6);
LABEL_7:

    goto LABEL_9;
  }
  v11 = 302000 * *(unsigned __int16 *)(v8 + 1);
  if (v6)
    goto LABEL_6;
LABEL_14:
  v12 = *(_QWORD *)(a1 + 56);
  v13 = v12 > 0;
  v14 = v12 - v13;
  if (v12 == v13)
  {
    v29 = *(_QWORD *)(a1 + 48);
    v10 = (void *)objc_opt_new();
    +[NFCError errorWithCode:](NFCError, "errorWithCode:", 101);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v29 + 16))(v29, v10, v30);

    goto LABEL_7;
  }
  if (!v11)
  {
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v16 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 64));
      v20 = 45;
      if (isMetaClass)
        v20 = 43;
      v16(4, "%c[%{public}s %{public}s]:%i Forcing minimum 20ms delay", v20, ClassName, Name, 992);
    }
    NFSharedLogGetLogger();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v22))
        v23 = 43;
      else
        v23 = 45;
      v24 = object_getClassName(*(id *)(a1 + 32));
      v25 = sel_getName(*(SEL *)(a1 + 64));
      *(_DWORD *)buf = 67109890;
      v37 = v23;
      v38 = 2082;
      v39 = v24;
      v40 = 2082;
      v41 = v25;
      v42 = 1024;
      v43 = 992;
      _os_log_impl(&dword_215BBD000, v21, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Forcing minimum 20ms delay", buf, 0x22u);
    }

    v11 = 20000000;
  }
  objc_msgSend(*(id *)(a1 + 32), "_getInternalReaderSession");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = dispatch_time(0, v11);
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __67__NFCISO15693Tag__wtxRetryWithCommnand_maxRetry_completionHandler___block_invoke_45;
  v32[3] = &unk_24D44FA28;
  v28 = *(void **)(a1 + 40);
  v32[4] = *(_QWORD *)(a1 + 32);
  v33 = v28;
  v35 = v14;
  v34 = *(id *)(a1 + 48);
  objc_msgSend(v26, "submitBlockOnSessionQueueWithDelay:block:", v27, v32);

LABEL_9:
}

uint64_t __67__NFCISO15693Tag__wtxRetryWithCommnand_maxRetry_completionHandler___block_invoke_45(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_wtxRetryWithCommnand:maxRetry:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (void)extendedFastReadMultipleBlocksWithRequestFlag:(unsigned __int8)a3 blockRange:(_NSRange)a4 completionHandler:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v7;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  NSUInteger v19;
  NSUInteger v20;
  SEL v21;
  _QWORD v22[5];
  id v23;
  SEL v24;
  os_activity_scope_state_s state;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  v10 = a5;
  v11 = _os_activity_create(&dword_215BBD000, "NFCISO15693Tag extendedFastReadMultipleBlocksWithRequestFlag:blockRange:completionHandler:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  os_activity_scope_leave(&state);

  if (location + length <= 0x10000)
  {
    -[NFCISO15693Tag _generateRequestHeader:flags:](self, "_generateRequestHeader:flags:", 61, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LOWORD(state.opaque[0]) = location;
    WORD1(state.opaque[0]) = length - 1;
    objc_msgSend(v13, "appendBytes:length:", &state, 4);
    -[NFCTag _getInternalReaderSession](self, "_getInternalReaderSession");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __93__NFCISO15693Tag_extendedFastReadMultipleBlocksWithRequestFlag_blockRange_completionHandler___block_invoke_46;
    v16[3] = &unk_24D44FCF8;
    v16[4] = self;
    v17 = v13;
    v20 = length;
    v21 = a2;
    v18 = v10;
    v19 = location;
    v15 = v10;
    v12 = v13;
    objc_msgSend(v14, "submitBlockOnSessionQueue:", v16);

  }
  else
  {
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __93__NFCISO15693Tag_extendedFastReadMultipleBlocksWithRequestFlag_blockRange_completionHandler___block_invoke;
    v22[3] = &unk_24D44F860;
    v22[4] = self;
    v23 = v10;
    v24 = a2;
    v12 = v10;
    -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v22);

  }
}

void __93__NFCISO15693Tag_extendedFastReadMultipleBlocksWithRequestFlag_blockRange_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  const char *v14;
  const char *v15;
  const char *Name;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 40);
  v3 = (void *)objc_opt_new();
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *))(v2 + 16))(v2, v3, v4);

  Logger = NFLogGetLogger();
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v6(3, "%c[%{public}s %{public}s]:%i Block range must be between 0 to 255 inclusively", v10, ClassName, Name, 1020);
  }
  NFSharedLogGetLogger();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12))
      v13 = 43;
    else
      v13 = 45;
    v14 = object_getClassName(*(id *)(a1 + 32));
    v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    v18 = v13;
    v19 = 2082;
    v20 = v14;
    v21 = 2082;
    v22 = v15;
    v23 = 1024;
    v24 = 1020;
    _os_log_impl(&dword_215BBD000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Block range must be between 0 to 255 inclusively", buf, 0x22u);
  }

}

void __93__NFCISO15693Tag_extendedFastReadMultipleBlocksWithRequestFlag_blockRange_completionHandler___block_invoke_46(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[5];
  id v4;
  __int128 v5;
  uint64_t v6;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __93__NFCISO15693Tag_extendedFastReadMultipleBlocksWithRequestFlag_blockRange_completionHandler___block_invoke_2;
  v3[3] = &unk_24D44FCA8;
  v5 = *(_OWORD *)(a1 + 56);
  v3[4] = v1;
  v6 = *(_QWORD *)(a1 + 72);
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v1, "_wtxRetryWithCommnand:maxRetry:completionHandler:", v2, 1, v3);

}

void __93__NFCISO15693Tag_extendedFastReadMultipleBlocksWithRequestFlag_blockRange_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t Logger;
  void (*v13)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v17;
  NSObject *v18;
  objc_class *v19;
  int v20;
  const char *v21;
  const char *v22;
  unint64_t v23;
  uint64_t v24;
  void *v25;
  const char *Name;
  uint8_t buf[4];
  int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  const __CFString *v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  if (!v6)
  {
    v8 = objc_msgSend(v5, "length") - 1;
    v9 = *(_QWORD *)(a1 + 56);
    if (v9 > v8 || (v10 = v8 / v9, v8 % v9))
    {
      v35 = CFSTR("TagResponseInvalidLength");
      v36[0] = MEMORY[0x24BDBD1C8];
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[NFCError errorWithCode:userInfo:](NFCError, "errorWithCode:userInfo:", 102, v11);
      v6 = (id)objc_claimAutoreleasedReturnValue();

      Logger = NFLogGetLogger();
      if (Logger)
      {
        v13 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(*(id *)(a1 + 32));
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(*(id *)(a1 + 32));
        Name = sel_getName(*(SEL *)(a1 + 64));
        v17 = 45;
        if (isMetaClass)
          v17 = 43;
        v13(3, "%c[%{public}s %{public}s]:%i Unexpected block size of 0", v17, ClassName, Name, 1039);
      }
      NFSharedLogGetLogger();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = object_getClass(*(id *)(a1 + 32));
        if (class_isMetaClass(v19))
          v20 = 43;
        else
          v20 = 45;
        v21 = object_getClassName(*(id *)(a1 + 32));
        v22 = sel_getName(*(SEL *)(a1 + 64));
        *(_DWORD *)buf = 67109890;
        v28 = v20;
        v29 = 2082;
        v30 = v21;
        v31 = 2082;
        v32 = v22;
        v33 = 1024;
        v34 = 1039;
        _os_log_impl(&dword_215BBD000, v18, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected block size of 0", buf, 0x22u);
      }

    }
    else
    {
      v23 = 0;
      v24 = 1;
      do
      {
        objc_msgSend(v5, "subdataWithRange:", v24, v10);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v25);

        v24 += v10;
        ++v23;
      }
      while (*(_QWORD *)(a1 + 56) > v23);
      v6 = 0;
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)sendRequestWithFlag:(int64_t)a3 commandCode:(int64_t)a4 data:(id)a5 completionHandler:(id)a6
{
  char v7;
  char v8;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  os_activity_scope_state_s state;

  v7 = a4;
  v8 = a3;
  v10 = a5;
  v11 = a6;
  v12 = _os_activity_create(&dword_215BBD000, "NFCISO15693Tag sendRequestWithFlag:commandCode:data:completionHandler:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v12, &state);
  os_activity_scope_leave(&state);

  LOBYTE(state.opaque[0]) = v8;
  BYTE1(state.opaque[0]) = v7;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithBytes:length:", &state, 2);
  v14 = v13;
  if (v10)
    objc_msgSend(v13, "appendData:", v10);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __73__NFCISO15693Tag_sendRequestWithFlag_commandCode_data_completionHandler___block_invoke;
  v16[3] = &unk_24D44F888;
  v17 = v11;
  v15 = v11;
  -[NFCTag _transceiveWithData:completionHandler:](self, "_transceiveWithData:completionHandler:", v14, v16);

}

void __73__NFCISO15693Tag_sendRequestWithFlag_commandCode_data_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = v6;
LABEL_3:
    v8 = 0;
    goto LABEL_10;
  }
  if (!objc_msgSend(v5, "length"))
  {
    v11 = CFSTR("TagResponseInvalidLength");
    v12[0] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[NFCError errorWithCode:userInfo:](NFCError, "errorWithCode:userInfo:", 102, v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_3;
  }
  v9 = objc_retainAutorelease(v5);
  objc_msgSend(v9, "bytes");
  if ((unint64_t)objc_msgSend(v9, "length") < 2)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v9, "subdataWithRange:", 1, objc_msgSend(v9, "length") - 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = 0;
LABEL_10:
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
