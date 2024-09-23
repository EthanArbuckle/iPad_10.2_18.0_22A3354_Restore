@implementation NFCFeliCaTag

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NFCFeliCaTag;
  return -[NFCTag copyWithZone:](&v4, sel_copyWithZone_, a3);
}

- (void)pollingWithSystemCode:(id)a3 requestCode:(int64_t)a4 timeSlot:(int64_t)a5 completionHandler:(id)a6
{
  char v7;
  char v8;
  id v11;
  id v12;
  NSObject *v13;
  _BYTE *v14;
  int v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[5];
  id v20;
  SEL v21;
  _QWORD v22[5];
  id v23;
  SEL v24;
  os_activity_scope_state_s state;

  v7 = a5;
  v8 = a4;
  v11 = a3;
  v12 = a6;
  v13 = _os_activity_create(&dword_215BBD000, "NFCFeliCaTag pollingWithSystemCode:requestCode:timeSlot:completionHandler:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v13, &state);
  os_activity_scope_leave(&state);

  if (objc_msgSend(v11, "length") == 2)
  {
    v14 = (_BYTE *)objc_msgSend(objc_retainAutorelease(v11), "bytes");
    LOBYTE(state.opaque[0]) = 0;
    BYTE1(state.opaque[0]) = *v14;
    v15 = v14[1];
    BYTE2(state.opaque[0]) = v14[1];
    BYTE3(state.opaque[0]) = v8;
    BYTE4(state.opaque[0]) = v7;
    if (BYTE1(state.opaque[0]) == 255 || v15 == 255)
    {
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __77__NFCFeliCaTag_pollingWithSystemCode_requestCode_timeSlot_completionHandler___block_invoke_10;
      v19[3] = &unk_24D44F860;
      v19[4] = self;
      v20 = v12;
      v21 = a2;
      -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v19);
      v16 = v20;
    }
    else
    {
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", &state, 5);
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __77__NFCFeliCaTag_pollingWithSystemCode_requestCode_timeSlot_completionHandler___block_invoke_12;
      v17[3] = &unk_24D44F888;
      v18 = v12;
      -[NFCFeliCaTag sendFeliCaCommandPacket:completionHandler:](self, "sendFeliCaCommandPacket:completionHandler:", v16, v17);

    }
  }
  else
  {
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __77__NFCFeliCaTag_pollingWithSystemCode_requestCode_timeSlot_completionHandler___block_invoke;
    v22[3] = &unk_24D44F860;
    v22[4] = self;
    v23 = v12;
    v24 = a2;
    -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v22);

  }
}

void __77__NFCFeliCaTag_pollingWithSystemCode_requestCode_timeSlot_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v11;
  NSObject *v12;
  objc_class *v13;
  int v14;
  const char *v15;
  const char *v16;
  const char *Name;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 40);
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *, void *))(v2 + 16))(v2, v3, v4, v5);

  Logger = NFLogGetLogger();
  if (Logger)
  {
    v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v11 = 45;
    if (isMetaClass)
      v11 = 43;
    v7(3, "%c[%{public}s %{public}s]:%i Node size must be 2 bytes long", v11, ClassName, Name, 50);
  }
  NFSharedLogGetLogger();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v13 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v13))
      v14 = 43;
    else
      v14 = 45;
    v15 = object_getClassName(*(id *)(a1 + 32));
    v16 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    v19 = v14;
    v20 = 2082;
    v21 = v15;
    v22 = 2082;
    v23 = v16;
    v24 = 1024;
    v25 = 50;
    _os_log_impl(&dword_215BBD000, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Node size must be 2 bytes long", buf, 0x22u);
  }

}

void __77__NFCFeliCaTag_pollingWithSystemCode_requestCode_timeSlot_completionHandler___block_invoke_10(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v11;
  NSObject *v12;
  objc_class *v13;
  int v14;
  const char *v15;
  const char *v16;
  const char *Name;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 40);
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *, void *))(v2 + 16))(v2, v3, v4, v5);

  Logger = NFLogGetLogger();
  if (Logger)
  {
    v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v11 = 45;
    if (isMetaClass)
      v11 = 43;
    v7(3, "%c[%{public}s %{public}s]:%i System code must not contain the 0xFF wildcard value", v11, ClassName, Name, 61);
  }
  NFSharedLogGetLogger();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v13 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v13))
      v14 = 43;
    else
      v14 = 45;
    v15 = object_getClassName(*(id *)(a1 + 32));
    v16 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    v19 = v14;
    v20 = 2082;
    v21 = v15;
    v22 = 2082;
    v23 = v16;
    v24 = 1024;
    v25 = 61;
    _os_log_impl(&dword_215BBD000, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i System code must not contain the 0xFF wildcard value", buf, 0x22u);
  }

}

void __77__NFCFeliCaTag_pollingWithSystemCode_requestCode_timeSlot_completionHandler___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = (void *)objc_opt_new();
    v9 = (void *)objc_opt_new();
    (*(void (**)(uint64_t, void *, void *, id))(v7 + 16))(v7, v8, v9, v6);
  }
  else
  {
    if (objc_msgSend(v5, "length") != 18 && objc_msgSend(v5, "length") != 20)
    {
      v13 = *(_QWORD *)(a1 + 32);
      v14 = (void *)objc_opt_new();
      v15 = (void *)objc_opt_new();
      v18 = CFSTR("TagResponseInvalidLength");
      v19[0] = MEMORY[0x24BDBD1C8];
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[NFCError errorWithCode:userInfo:](NFCError, "errorWithCode:userInfo:", 102, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, void *, void *))(v13 + 16))(v13, v14, v15, v17);

      goto LABEL_10;
    }
    objc_msgSend(v5, "subdataWithRange:", 10, 8);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v5, "length");
    v11 = *(_QWORD *)(a1 + 32);
    if (v10 == 20)
    {
      objc_msgSend(v5, "subdataWithRange:", 18, 2);
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = objc_opt_new();
    }
    v9 = (void *)v12;
    (*(void (**)(uint64_t, void *, uint64_t, _QWORD))(v11 + 16))(v11, v8, v12, 0);
  }

LABEL_10:
}

- (void)requestServiceWithNodeCodeList:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  SEL v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[5];
  id v24;
  SEL v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[5];
  id v31;
  SEL v32;
  os_activity_scope_state_s state;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = _os_activity_create(&dword_215BBD000, "NFCFeliCaTag requestServiceWithNodeCodeList:completionHandler:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  os_activity_scope_leave(&state);

  v10 = (void *)objc_opt_new();
  v11 = (void *)objc_opt_new();
  if (objc_msgSend(v7, "count") && (unint64_t)objc_msgSend(v7, "count") < 0x21)
  {
    v20 = a2;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v13 = v7;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v27;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v27 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          if (objc_msgSend(v18, "length") != 2)
          {
            v23[0] = MEMORY[0x24BDAC760];
            v23[1] = 3221225472;
            v23[2] = __65__NFCFeliCaTag_requestServiceWithNodeCodeList_completionHandler___block_invoke_18;
            v23[3] = &unk_24D44F860;
            v23[4] = self;
            v24 = v8;
            v25 = v20;
            -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v23);

            goto LABEL_5;
          }
          objc_msgSend(v11, "appendData:", v18);
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v15)
          continue;
        break;
      }
    }

    LOBYTE(state.opaque[0]) = 2;
    objc_msgSend(v10, "appendBytes:length:", &state, 1);
    -[NFCTag identifier](self, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appendData:", v19);

    LOBYTE(state.opaque[0]) = objc_msgSend(v13, "count");
    objc_msgSend(v10, "appendBytes:length:", &state, 1);
    objc_msgSend(v10, "appendData:", v11);
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __65__NFCFeliCaTag_requestServiceWithNodeCodeList_completionHandler___block_invoke_19;
    v21[3] = &unk_24D44F888;
    v22 = v8;
    -[NFCFeliCaTag sendFeliCaCommandPacket:completionHandler:](self, "sendFeliCaCommandPacket:completionHandler:", v10, v21);
    v12 = v22;
  }
  else
  {
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __65__NFCFeliCaTag_requestServiceWithNodeCodeList_completionHandler___block_invoke;
    v30[3] = &unk_24D44F860;
    v30[4] = self;
    v31 = v8;
    v32 = a2;
    -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v30);
    v12 = v31;
  }

LABEL_5:
}

void __65__NFCFeliCaTag_requestServiceWithNodeCodeList_completionHandler___block_invoke(uint64_t a1)
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
    v6(3, "%c[%{public}s %{public}s]:%i Number of nodes must be between 1 to 32 inclusively", v10, ClassName, Name, 99);
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
    v24 = 99;
    _os_log_impl(&dword_215BBD000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Number of nodes must be between 1 to 32 inclusively", buf, 0x22u);
  }

}

void __65__NFCFeliCaTag_requestServiceWithNodeCodeList_completionHandler___block_invoke_18(uint64_t a1)
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
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 4);
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
    v6(3, "%c[%{public}s %{public}s]:%i Node size must be 2 bytes long", v10, ClassName, Name, 108);
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
    v24 = 108;
    _os_log_impl(&dword_215BBD000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Node size must be 2 bytes long", buf, 0x22u);
  }

}

void __65__NFCFeliCaTag_requestServiceWithNodeCodeList_completionHandler___block_invoke_19(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t *v11;
  const __CFString **v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  uint64_t v22;
  const __CFString *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = (void *)objc_opt_new();
    (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v8, v6);
LABEL_8:

    goto LABEL_9;
  }
  if ((unint64_t)objc_msgSend(v5, "length") <= 0xC)
  {
    v9 = *(_QWORD *)(a1 + 32);
    v8 = (void *)objc_opt_new();
    v23 = CFSTR("TagResponseInvalidLength");
    v24[0] = MEMORY[0x24BDBD1C8];
    v10 = (void *)MEMORY[0x24BDBCE70];
    v11 = v24;
    v12 = &v23;
LABEL_7:
    objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v11, v12, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[NFCError errorWithCode:userInfo:](NFCError, "errorWithCode:userInfo:", 102, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v9 + 16))(v9, v8, v16);

    goto LABEL_8;
  }
  v13 = objc_retainAutorelease(v5);
  v14 = *(unsigned __int8 *)(objc_msgSend(v13, "bytes") + 10);
  if (objc_msgSend(v13, "length") - 11 < (unint64_t)(2 * v14))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v8 = (void *)objc_opt_new();
    v21 = CFSTR("TagResponseInvalidLength");
    v22 = MEMORY[0x24BDBD1C8];
    v10 = (void *)MEMORY[0x24BDBCE70];
    v11 = &v22;
    v12 = &v21;
    goto LABEL_7;
  }
  v17 = (void *)objc_opt_new();
  if ((_DWORD)v14)
  {
    v18 = 0;
    v19 = 2 * v14;
    do
    {
      objc_msgSend(v13, "subdataWithRange:", v18 + 11, 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v20);

      v18 += 2;
    }
    while (v19 != v18);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

LABEL_9:
}

- (void)requestResponseWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_215BBD000, "NFCFeliCaTag requestResponseWithCompletionHandler:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  LOBYTE(state.opaque[0]) = 4;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithBytes:length:", &state, 1);
  -[NFCTag identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendData:", v7);

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __53__NFCFeliCaTag_requestResponseWithCompletionHandler___block_invoke;
  v9[3] = &unk_24D44F888;
  v10 = v4;
  v8 = v4;
  -[NFCFeliCaTag sendFeliCaCommandPacket:completionHandler:](self, "sendFeliCaCommandPacket:completionHandler:", v6, v9);

}

void __53__NFCFeliCaTag_requestResponseWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else if (objc_msgSend(v5, "length") == 11)
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(objc_msgSend(objc_retainAutorelease(v6), "bytes") + 10), 0);
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 32);
    v10 = CFSTR("TagResponseInvalidLength");
    v11[0] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[NFCError errorWithCode:userInfo:](NFCError, "errorWithCode:userInfo:", 102, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, void *))(v7 + 16))(v7, -1, v9);

  }
}

- (void)readWithoutEncryptionWithServiceCodeList:(id)a3 blockList:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  SEL v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[5];
  id v35;
  SEL v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[5];
  id v42;
  SEL v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[5];
  id v49;
  SEL v50;
  os_activity_scope_state_s state;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = _os_activity_create(&dword_215BBD000, "NFCFeliCaTag readWithoutEncryptionWithServiceCodeList:blockList:completionHandler:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v12, &state);
  os_activity_scope_leave(&state);

  if (objc_msgSend(v9, "count") && (unint64_t)objc_msgSend(v9, "count") < 0x11)
  {
    v31 = a2;
    v13 = (void *)objc_opt_new();
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v14 = v9;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v45;
      while (2)
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v45 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
          if (objc_msgSend(v19, "length") != 2)
          {
            v41[0] = MEMORY[0x24BDAC760];
            v41[1] = 3221225472;
            v41[2] = __85__NFCFeliCaTag_readWithoutEncryptionWithServiceCodeList_blockList_completionHandler___block_invoke_22;
            v41[3] = &unk_24D44F860;
            v41[4] = self;
            v42 = v11;
            v43 = v31;
            -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v41);

            v20 = v14;
            goto LABEL_25;
          }
          objc_msgSend(v13, "appendData:", v19);
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
        if (v16)
          continue;
        break;
      }
    }
    v29 = v11;

    v20 = (void *)objc_opt_new();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v30 = v10;
    v21 = v10;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v52, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v38;
      while (2)
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v38 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
          if (objc_msgSend(v26, "length") != 2 && objc_msgSend(v26, "length") != 3)
          {
            v34[0] = MEMORY[0x24BDAC760];
            v34[1] = 3221225472;
            v34[2] = __85__NFCFeliCaTag_readWithoutEncryptionWithServiceCodeList_blockList_completionHandler___block_invoke_23;
            v34[3] = &unk_24D44F860;
            v11 = v29;
            v34[4] = self;
            v35 = v29;
            v36 = v31;
            -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v34);

            goto LABEL_24;
          }
          objc_msgSend(v20, "appendData:", v26);
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v52, 16);
        if (v23)
          continue;
        break;
      }
    }

    LOBYTE(state.opaque[0]) = 6;
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithBytes:length:", &state, 1);
    -[NFCTag identifier](self, "identifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "appendData:", v28);

    LOBYTE(state.opaque[0]) = objc_msgSend(v14, "count");
    objc_msgSend(v27, "appendBytes:length:", &state, 1);
    objc_msgSend(v27, "appendData:", v13);
    LOBYTE(state.opaque[0]) = objc_msgSend(v21, "count");
    objc_msgSend(v27, "appendBytes:length:", &state, 1);
    objc_msgSend(v27, "appendData:", v20);
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __85__NFCFeliCaTag_readWithoutEncryptionWithServiceCodeList_blockList_completionHandler___block_invoke_25;
    v32[3] = &unk_24D44F888;
    v11 = v29;
    v33 = v29;
    -[NFCFeliCaTag sendFeliCaCommandPacket:completionHandler:](self, "sendFeliCaCommandPacket:completionHandler:", v27, v32);

LABEL_24:
    v10 = v30;
LABEL_25:

  }
  else
  {
    v48[0] = MEMORY[0x24BDAC760];
    v48[1] = 3221225472;
    v48[2] = __85__NFCFeliCaTag_readWithoutEncryptionWithServiceCodeList_blockList_completionHandler___block_invoke;
    v48[3] = &unk_24D44F860;
    v48[4] = self;
    v49 = v11;
    v50 = a2;
    -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v48);
    v13 = v49;
  }

}

void __85__NFCFeliCaTag_readWithoutEncryptionWithServiceCodeList_blockList_completionHandler___block_invoke(uint64_t a1)
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
  (*(void (**)(uint64_t, uint64_t, uint64_t, void *, void *))(v2 + 16))(v2, -1, -1, v3, v4);

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
    v6(3, "%c[%{public}s %{public}s]:%i Number of service codes must be between 1 to 16 inclusively", v10, ClassName, Name, 189);
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
    v24 = 189;
    _os_log_impl(&dword_215BBD000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Number of service codes must be between 1 to 16 inclusively", buf, 0x22u);
  }

}

void __85__NFCFeliCaTag_readWithoutEncryptionWithServiceCodeList_blockList_completionHandler___block_invoke_22(uint64_t a1)
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
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, uint64_t, void *, void *))(v2 + 16))(v2, -1, -1, v3, v4);

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
    v6(3, "%c[%{public}s %{public}s]:%i Node size must be 2 bytes long", v10, ClassName, Name, 199);
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
    v24 = 199;
    _os_log_impl(&dword_215BBD000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Node size must be 2 bytes long", buf, 0x22u);
  }

}

void __85__NFCFeliCaTag_readWithoutEncryptionWithServiceCodeList_blockList_completionHandler___block_invoke_23(uint64_t a1)
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
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, uint64_t, void *, void *))(v2 + 16))(v2, -1, -1, v3, v4);

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
    v6(3, "%c[%{public}s %{public}s]:%i Block list element must be 2 or 3 bytes long", v10, ClassName, Name, 211);
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
    v24 = 211;
    _os_log_impl(&dword_215BBD000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Block list element must be 2 or 3 bytes long", buf, 0x22u);
  }

}

void __85__NFCFeliCaTag_readWithoutEncryptionWithServiceCodeList_blockList_completionHandler___block_invoke_25(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  uint64_t v24;
  const __CFString *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    v9 = objc_retainAutorelease(v5);
    v10 = objc_msgSend(v9, "bytes");
    if ((unint64_t)objc_msgSend(v9, "length") <= 0xB)
    {
      v11 = *(_QWORD *)(a1 + 32);
      v8 = (void *)objc_opt_new();
      v25 = CFSTR("TagResponseInvalidLength");
      v26[0] = MEMORY[0x24BDBD1C8];
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[NFCError errorWithCode:userInfo:](NFCError, "errorWithCode:userInfo:", 102, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, uint64_t, void *, void *))(v11 + 16))(v11, -1, -1, v8, v13);

      goto LABEL_5;
    }
    v14 = (void *)objc_opt_new();
    if (!*(_BYTE *)(v10 + 10))
    {
      v15 = *(unsigned __int8 *)(v10 + 12);
      if (objc_msgSend(v9, "length") - 13 < (unint64_t)(16 * v15))
      {
        v16 = *(_QWORD *)(a1 + 32);
        v17 = (void *)objc_opt_new();
        v23 = CFSTR("TagResponseInvalidLength");
        v24 = MEMORY[0x24BDBD1C8];
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        +[NFCError errorWithCode:userInfo:](NFCError, "errorWithCode:userInfo:", 102, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, uint64_t, uint64_t, void *, void *))(v16 + 16))(v16, -1, -1, v17, v19);

        goto LABEL_9;
      }
      if ((_DWORD)v15)
      {
        v20 = 0;
        v21 = 16 * v15;
        do
        {
          objc_msgSend(v9, "subdataWithRange:", v20 + 13, 16);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v22);

          v20 += 16;
        }
        while (v21 != v20);
      }
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_9:

    goto LABEL_6;
  }
  v7 = *(_QWORD *)(a1 + 32);
  v8 = (void *)objc_opt_new();
  (*(void (**)(uint64_t, uint64_t, uint64_t, void *, id))(v7 + 16))(v7, -1, -1, v8, v6);
LABEL_5:

LABEL_6:
}

- (void)writeWithoutEncryptionWithServiceCodeList:(id)a3 blockList:(id)a4 blockData:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  id obj;
  _QWORD v43[4];
  id v44;
  _QWORD v45[5];
  id v46;
  SEL v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[5];
  id v53;
  SEL v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _QWORD v59[5];
  id v60;
  SEL v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _QWORD v66[5];
  id v67;
  SEL v68;
  _QWORD v69[5];
  id v70;
  SEL v71;
  _QWORD v72[5];
  id v73;
  SEL v74;
  os_activity_scope_state_s state;
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = _os_activity_create(&dword_215BBD000, "NFCFeliCaTag writeWithoutEncryptionWithServiceCodeList:blockList:blockData:completionHandler:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[1] = 0;
  state.opaque[0] = 0;
  os_activity_scope_enter(v15, &state);
  os_activity_scope_leave(&state);

  if (objc_msgSend(v11, "count") && (unint64_t)objc_msgSend(v11, "count") < 0x11)
  {
    v17 = objc_msgSend(v12, "count");
    if (v17 == objc_msgSend(v13, "count"))
    {
      if ((unint64_t)objc_msgSend(v12, "count") < 0x100)
      {
        v40 = v13;
        v16 = (void *)objc_opt_new();
        v62 = 0u;
        v63 = 0u;
        v64 = 0u;
        v65 = 0u;
        obj = v11;
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v78, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v63;
          while (2)
          {
            for (i = 0; i != v19; ++i)
            {
              if (*(_QWORD *)v63 != v20)
                objc_enumerationMutation(obj);
              v22 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
              if (objc_msgSend(v22, "length") != 2)
              {
                v59[0] = MEMORY[0x24BDAC760];
                v59[1] = 3221225472;
                v59[2] = __96__NFCFeliCaTag_writeWithoutEncryptionWithServiceCodeList_blockList_blockData_completionHandler___block_invoke_30;
                v59[3] = &unk_24D44F860;
                v59[4] = self;
                v60 = v14;
                v61 = a2;
                -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v59);
                v36 = v60;
                v23 = obj;
                goto LABEL_39;
              }
              objc_msgSend(v16, "appendData:", v22);
            }
            v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v78, 16);
            if (v19)
              continue;
            break;
          }
        }

        v23 = (void *)objc_opt_new();
        v55 = 0u;
        v56 = 0u;
        v57 = 0u;
        v58 = 0u;
        v38 = v12;
        v41 = v12;
        v24 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v55, v77, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v56;
          while (2)
          {
            for (j = 0; j != v25; ++j)
            {
              if (*(_QWORD *)v56 != v26)
                objc_enumerationMutation(v41);
              v28 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * j);
              if (objc_msgSend(v28, "length") != 2 && objc_msgSend(v28, "length") != 3)
              {
                v52[0] = MEMORY[0x24BDAC760];
                v52[1] = 3221225472;
                v52[2] = __96__NFCFeliCaTag_writeWithoutEncryptionWithServiceCodeList_blockList_blockData_completionHandler___block_invoke_31;
                v52[3] = &unk_24D44F860;
                v52[4] = self;
                v53 = v14;
                v54 = a2;
                -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v52);

                v36 = v41;
                goto LABEL_37;
              }
              objc_msgSend(v23, "appendData:", v28);
            }
            v25 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v55, v77, 16);
            if (v25)
              continue;
            break;
          }
        }

        v37 = objc_opt_new();
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        v51 = 0u;
        v39 = v40;
        v29 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v48, v76, 16);
        if (v29)
        {
          v30 = v29;
          v31 = *(_QWORD *)v49;
          while (2)
          {
            for (k = 0; k != v30; ++k)
            {
              if (*(_QWORD *)v49 != v31)
                objc_enumerationMutation(v39);
              v33 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * k);
              if (objc_msgSend(v33, "length", v37) != 16)
              {
                v45[0] = MEMORY[0x24BDAC760];
                v45[1] = 3221225472;
                v45[2] = __96__NFCFeliCaTag_writeWithoutEncryptionWithServiceCodeList_blockList_blockData_completionHandler___block_invoke_32;
                v45[3] = &unk_24D44F860;
                v45[4] = self;
                v46 = v14;
                v47 = a2;
                -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v45);

                v36 = (void *)v37;
                v12 = v38;
                goto LABEL_39;
              }
              objc_msgSend(v23, "appendData:", v33);
            }
            v30 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v48, v76, 16);
            if (v30)
              continue;
            break;
          }
        }

        LOBYTE(state.opaque[0]) = 8;
        v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithBytes:length:", &state, 1);
        -[NFCTag identifier](self, "identifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "appendData:", v35);

        LOBYTE(state.opaque[0]) = objc_msgSend(obj, "count");
        objc_msgSend(v34, "appendBytes:length:", &state, 1);
        objc_msgSend(v34, "appendData:", v16);
        LOBYTE(state.opaque[0]) = objc_msgSend(v41, "count");
        objc_msgSend(v34, "appendBytes:length:", &state, 1);
        objc_msgSend(v34, "appendData:", v23);
        v36 = (void *)v37;
        objc_msgSend(v34, "appendData:", v37);
        v43[0] = MEMORY[0x24BDAC760];
        v43[1] = 3221225472;
        v43[2] = __96__NFCFeliCaTag_writeWithoutEncryptionWithServiceCodeList_blockList_blockData_completionHandler___block_invoke_34;
        v43[3] = &unk_24D44F888;
        v44 = v14;
        -[NFCFeliCaTag sendFeliCaCommandPacket:completionHandler:](self, "sendFeliCaCommandPacket:completionHandler:", v34, v43);

LABEL_37:
        v12 = v38;
LABEL_39:

        v13 = v40;
      }
      else
      {
        v66[0] = MEMORY[0x24BDAC760];
        v66[1] = 3221225472;
        v66[2] = __96__NFCFeliCaTag_writeWithoutEncryptionWithServiceCodeList_blockList_blockData_completionHandler___block_invoke_28;
        v66[3] = &unk_24D44F860;
        v66[4] = self;
        v67 = v14;
        v68 = a2;
        -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v66);
        v16 = v67;
      }
    }
    else
    {
      v69[0] = MEMORY[0x24BDAC760];
      v69[1] = 3221225472;
      v69[2] = __96__NFCFeliCaTag_writeWithoutEncryptionWithServiceCodeList_blockList_blockData_completionHandler___block_invoke_26;
      v69[3] = &unk_24D44F860;
      v70 = v14;
      v69[4] = self;
      v71 = a2;
      -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v69);
      v16 = v70;
    }
  }
  else
  {
    v72[0] = MEMORY[0x24BDAC760];
    v72[1] = 3221225472;
    v72[2] = __96__NFCFeliCaTag_writeWithoutEncryptionWithServiceCodeList_blockList_blockData_completionHandler___block_invoke;
    v72[3] = &unk_24D44F860;
    v73 = v14;
    v72[4] = self;
    v74 = a2;
    -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v72);
    v16 = v73;
  }

}

void __96__NFCFeliCaTag_writeWithoutEncryptionWithServiceCodeList_blockList_blockData_completionHandler___block_invoke(uint64_t a1)
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
  (*(void (**)(uint64_t, uint64_t, uint64_t, void *))(v2 + 16))(v2, -1, -1, v3);

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
    v5(3, "%c[%{public}s %{public}s]:%i Number of service codes must be between 1 to 16 inclusively", v9, ClassName, Name, 277);
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
    v23 = 277;
    _os_log_impl(&dword_215BBD000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Number of service codes must be between 1 to 16 inclusively", buf, 0x22u);
  }

}

void __96__NFCFeliCaTag_writeWithoutEncryptionWithServiceCodeList_blockList_blockData_completionHandler___block_invoke_26(uint64_t a1)
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
  (*(void (**)(uint64_t, uint64_t, uint64_t, void *))(v2 + 16))(v2, -1, -1, v3);

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
    v5(3, "%c[%{public}s %{public}s]:%i Number of elements in the block list and the block data list does not match", v9, ClassName, Name, 283);
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
    v23 = 283;
    _os_log_impl(&dword_215BBD000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Number of elements in the block list and the block data list does not match", buf, 0x22u);
  }

}

void __96__NFCFeliCaTag_writeWithoutEncryptionWithServiceCodeList_blockList_blockData_completionHandler___block_invoke_28(uint64_t a1)
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
  (*(void (**)(uint64_t, uint64_t, uint64_t, void *))(v2 + 16))(v2, -1, -1, v3);

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
    v5(3, "%c[%{public}s %{public}s]:%i Block list size exceeds the maximum limit", v9, ClassName, Name, 289);
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
    v23 = 289;
    _os_log_impl(&dword_215BBD000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Block list size exceeds the maximum limit", buf, 0x22u);
  }

}

void __96__NFCFeliCaTag_writeWithoutEncryptionWithServiceCodeList_blockList_blockData_completionHandler___block_invoke_30(uint64_t a1)
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
  (*(void (**)(uint64_t, uint64_t, uint64_t, void *))(v2 + 16))(v2, -1, -1, v3);

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
    v5(3, "%c[%{public}s %{public}s]:%i Node size must be 2 bytes long", v9, ClassName, Name, 299);
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
    v23 = 299;
    _os_log_impl(&dword_215BBD000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Node size must be 2 bytes long", buf, 0x22u);
  }

}

void __96__NFCFeliCaTag_writeWithoutEncryptionWithServiceCodeList_blockList_blockData_completionHandler___block_invoke_31(uint64_t a1)
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
  (*(void (**)(uint64_t, uint64_t, uint64_t, void *))(v2 + 16))(v2, -1, -1, v3);

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
    v5(3, "%c[%{public}s %{public}s]:%i Block list element must be 2 or 3 bytes long", v9, ClassName, Name, 311);
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
    v23 = 311;
    _os_log_impl(&dword_215BBD000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Block list element must be 2 or 3 bytes long", buf, 0x22u);
  }

}

void __96__NFCFeliCaTag_writeWithoutEncryptionWithServiceCodeList_blockList_blockData_completionHandler___block_invoke_32(uint64_t a1)
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
  (*(void (**)(uint64_t, uint64_t, uint64_t, void *))(v2 + 16))(v2, -1, -1, v3);

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
    v5(3, "%c[%{public}s %{public}s]:%i Block data length must be 16 bytes long", v9, ClassName, Name, 323);
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
    v23 = 323;
    _os_log_impl(&dword_215BBD000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Block data length must be 16 bytes long", buf, 0x22u);
  }

}

void __96__NFCFeliCaTag_writeWithoutEncryptionWithServiceCodeList_blockList_blockData_completionHandler___block_invoke_34(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else if (objc_msgSend(v5, "length") == 12)
  {
    v7 = objc_msgSend(objc_retainAutorelease(v6), "bytes");
    (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(v7 + 10), *(unsigned __int8 *)(v7 + 11), 0);
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 32);
    v11 = CFSTR("TagResponseInvalidLength");
    v12[0] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[NFCError errorWithCode:userInfo:](NFCError, "errorWithCode:userInfo:", 102, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, uint64_t, void *))(v8 + 16))(v8, -1, -1, v10);

  }
}

- (void)requestSystemCodeWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_215BBD000, "NFCFeliCaTag requestSystemCodeWithCompletionHandler:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  LOBYTE(state.opaque[0]) = 12;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithBytes:length:", &state, 1);
  -[NFCTag identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendData:", v7);

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __55__NFCFeliCaTag_requestSystemCodeWithCompletionHandler___block_invoke;
  v9[3] = &unk_24D44F888;
  v10 = v4;
  v8 = v4;
  -[NFCFeliCaTag sendFeliCaCommandPacket:completionHandler:](self, "sendFeliCaCommandPacket:completionHandler:", v6, v9);

}

void __55__NFCFeliCaTag_requestSystemCodeWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t *v11;
  const __CFString **v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  uint64_t v22;
  const __CFString *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = (void *)objc_opt_new();
    (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v8, v6);
LABEL_8:

    goto LABEL_9;
  }
  if ((unint64_t)objc_msgSend(v5, "length") <= 0xA)
  {
    v9 = *(_QWORD *)(a1 + 32);
    v8 = (void *)objc_opt_new();
    v23 = CFSTR("TagResponseInvalidLength");
    v24[0] = MEMORY[0x24BDBD1C8];
    v10 = (void *)MEMORY[0x24BDBCE70];
    v11 = v24;
    v12 = &v23;
LABEL_7:
    objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v11, v12, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[NFCError errorWithCode:userInfo:](NFCError, "errorWithCode:userInfo:", 102, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v9 + 16))(v9, v8, v16);

    goto LABEL_8;
  }
  v13 = objc_retainAutorelease(v5);
  v14 = *(unsigned __int8 *)(objc_msgSend(v13, "bytes") + 10);
  if (objc_msgSend(v13, "length") - 11 < (unint64_t)(2 * v14))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v8 = (void *)objc_opt_new();
    v21 = CFSTR("TagResponseInvalidLength");
    v22 = MEMORY[0x24BDBD1C8];
    v10 = (void *)MEMORY[0x24BDBCE70];
    v11 = &v22;
    v12 = &v21;
    goto LABEL_7;
  }
  v17 = (void *)objc_opt_new();
  if ((_DWORD)v14)
  {
    v18 = 0;
    v19 = 2 * v14;
    do
    {
      objc_msgSend(v13, "subdataWithRange:", v18 + 11, 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v20);

      v18 += 2;
    }
    while (v19 != v18);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

LABEL_9:
}

- (void)requestServiceV2WithNodeCodeList:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  SEL v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[5];
  id v24;
  SEL v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[5];
  id v31;
  SEL v32;
  os_activity_scope_state_s state;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = _os_activity_create(&dword_215BBD000, "NFCFeliCaTag requestServiceV2WithNodeCodeList:completionHandler:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  os_activity_scope_leave(&state);

  v10 = (void *)objc_opt_new();
  v11 = (void *)objc_opt_new();
  if (objc_msgSend(v7, "count") && (unint64_t)objc_msgSend(v7, "count") < 0x21)
  {
    v20 = a2;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v13 = v7;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v27;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v27 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          if (objc_msgSend(v18, "length") != 2)
          {
            v23[0] = MEMORY[0x24BDAC760];
            v23[1] = 3221225472;
            v23[2] = __67__NFCFeliCaTag_requestServiceV2WithNodeCodeList_completionHandler___block_invoke_35;
            v23[3] = &unk_24D44F860;
            v23[4] = self;
            v24 = v8;
            v25 = v20;
            -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v23);

            goto LABEL_5;
          }
          objc_msgSend(v11, "appendData:", v18);
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v15)
          continue;
        break;
      }
    }

    LOBYTE(state.opaque[0]) = 50;
    objc_msgSend(v10, "appendBytes:length:", &state, 1);
    -[NFCTag identifier](self, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appendData:", v19);

    LOBYTE(state.opaque[0]) = objc_msgSend(v13, "count");
    objc_msgSend(v10, "appendBytes:length:", &state, 1);
    objc_msgSend(v10, "appendData:", v11);
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __67__NFCFeliCaTag_requestServiceV2WithNodeCodeList_completionHandler___block_invoke_36;
    v21[3] = &unk_24D44F888;
    v22 = v8;
    -[NFCFeliCaTag sendFeliCaCommandPacket:completionHandler:](self, "sendFeliCaCommandPacket:completionHandler:", v10, v21);
    v12 = v22;
  }
  else
  {
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __67__NFCFeliCaTag_requestServiceV2WithNodeCodeList_completionHandler___block_invoke;
    v30[3] = &unk_24D44F860;
    v30[4] = self;
    v31 = v8;
    v32 = a2;
    -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v30);
    v12 = v31;
  }

LABEL_5:
}

void __67__NFCFeliCaTag_requestServiceV2WithNodeCodeList_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v11;
  NSObject *v12;
  objc_class *v13;
  int v14;
  const char *v15;
  const char *v16;
  const char *Name;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 40);
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, void *, void *, void *))(v2 + 16))(v2, -1, -1, 79, v3, v4, v5);

  Logger = NFLogGetLogger();
  if (Logger)
  {
    v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v11 = 45;
    if (isMetaClass)
      v11 = 43;
    v7(3, "%c[%{public}s %{public}s]:%i Number of nodes must be between 1 to 32 inclusively", v11, ClassName, Name, 412);
  }
  NFSharedLogGetLogger();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v13 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v13))
      v14 = 43;
    else
      v14 = 45;
    v15 = object_getClassName(*(id *)(a1 + 32));
    v16 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    v19 = v14;
    v20 = 2082;
    v21 = v15;
    v22 = 2082;
    v23 = v16;
    v24 = 1024;
    v25 = 412;
    _os_log_impl(&dword_215BBD000, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Number of nodes must be between 1 to 32 inclusively", buf, 0x22u);
  }

}

void __67__NFCFeliCaTag_requestServiceV2WithNodeCodeList_completionHandler___block_invoke_35(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v11;
  NSObject *v12;
  objc_class *v13;
  int v14;
  const char *v15;
  const char *v16;
  const char *Name;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 40);
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, void *, void *, void *))(v2 + 16))(v2, -1, -1, 79, v3, v4, v5);

  Logger = NFLogGetLogger();
  if (Logger)
  {
    v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v11 = 45;
    if (isMetaClass)
      v11 = 43;
    v7(3, "%c[%{public}s %{public}s]:%i Node size must be 2 bytes long", v11, ClassName, Name, 421);
  }
  NFSharedLogGetLogger();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v13 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v13))
      v14 = 43;
    else
      v14 = 45;
    v15 = object_getClassName(*(id *)(a1 + 32));
    v16 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    v19 = v14;
    v20 = 2082;
    v21 = v15;
    v22 = 2082;
    v23 = v16;
    v24 = 1024;
    v25 = 421;
    _os_log_impl(&dword_215BBD000, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Node size must be 2 bytes long", buf, 0x22u);
  }

}

void __67__NFCFeliCaTag_requestServiceV2WithNodeCodeList_completionHandler___block_invoke_36(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t *v14;
  const __CFString **v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  const __CFString *v37;
  uint64_t v38;
  const __CFString *v39;
  uint64_t v40;
  const __CFString *v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = (void *)objc_opt_new();
    v9 = (void *)objc_opt_new();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, void *, void *, id))(v7 + 16))(v7, -1, -1, -1, v8, v9, v6);

    goto LABEL_8;
  }
  if ((unint64_t)objc_msgSend(v5, "length") <= 0xB)
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = (void *)objc_opt_new();
    v12 = (void *)objc_opt_new();
    v41 = CFSTR("TagResponseInvalidLength");
    v42[0] = MEMORY[0x24BDBD1C8];
    v13 = (void *)MEMORY[0x24BDBCE70];
    v14 = v42;
    v15 = &v41;
LABEL_5:
    objc_msgSend(v13, "dictionaryWithObjects:forKeys:count:", v14, v15, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[NFCError errorWithCode:userInfo:](NFCError, "errorWithCode:userInfo:", 102, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, void *, void *, void *))(v10 + 16))(v10, -1, -1, -1, v11, v12, v17);

    goto LABEL_8;
  }
  v18 = objc_retainAutorelease(v5);
  v19 = objc_msgSend(v18, "bytes");
  v20 = v19;
  v21 = *(unsigned __int8 *)(v19 + 10);
  if (*(_BYTE *)(v19 + 10))
  {
    v22 = *(_QWORD *)(a1 + 32);
    v23 = *(unsigned __int8 *)(v19 + 11);
    v24 = (void *)objc_opt_new();
    v25 = (void *)objc_opt_new();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, void *, void *, _QWORD))(v22 + 16))(v22, v21, v23, -1, v24, v25, 0);

    goto LABEL_8;
  }
  if ((unint64_t)objc_msgSend(v18, "length") <= 0xC)
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = (void *)objc_opt_new();
    v12 = (void *)objc_opt_new();
    v39 = CFSTR("TagResponseInvalidLength");
    v40 = MEMORY[0x24BDBD1C8];
    v13 = (void *)MEMORY[0x24BDBCE70];
    v14 = &v40;
    v15 = &v39;
    goto LABEL_5;
  }
  v26 = *(unsigned __int8 *)(v20 + 12);
  v27 = *(unsigned __int8 *)(v20 + 13);
  v28 = 1;
  if ((_DWORD)v26 == 65)
    v28 = 2;
  if (objc_msgSend(v18, "length") - 14 < (unint64_t)(v27 << v28))
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = (void *)objc_opt_new();
    v12 = (void *)objc_opt_new();
    v37 = CFSTR("TagResponseInvalidLength");
    v38 = MEMORY[0x24BDBD1C8];
    v13 = (void *)MEMORY[0x24BDBCE70];
    v14 = &v38;
    v15 = &v37;
    goto LABEL_5;
  }
  v36 = v26;
  v29 = (void *)objc_opt_new();
  v30 = (void *)objc_opt_new();
  if ((_DWORD)v27)
  {
    v31 = 0;
    v32 = 2 * v27;
    do
    {
      objc_msgSend(v18, "subdataWithRange:", v31 + 14, 2, v36);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "addObject:", v33);

      v31 += 2;
    }
    while (v32 != v31);
    if ((_DWORD)v36 == 65)
    {
      v34 = 0;
      do
      {
        objc_msgSend(v18, "subdataWithRange:", v32 + v34 + 14, 2);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "addObject:", v35);

        v34 += 2;
      }
      while (v32 != v34);
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

LABEL_8:
}

- (void)requestSpecificationVersionWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  char v11;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_215BBD000, "NFCFeliCaTag requestSpecificationVersionWithCompletionHandler:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  v6 = (void *)objc_opt_new();
  v11 = 60;
  objc_msgSend(v6, "appendBytes:length:", &v11, 1);
  -[NFCTag identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendData:", v7);

  LOWORD(state.opaque[0]) = 0;
  objc_msgSend(v6, "appendBytes:length:", &state, 2);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __65__NFCFeliCaTag_requestSpecificationVersionWithCompletionHandler___block_invoke;
  v9[3] = &unk_24D44F888;
  v10 = v4;
  v8 = v4;
  -[NFCFeliCaTag sendFeliCaCommandPacket:completionHandler:](self, "sendFeliCaCommandPacket:completionHandler:", v6, v9);

}

void __65__NFCFeliCaTag_requestSpecificationVersionWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t *v14;
  const __CFString **v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  uint64_t v31;
  const __CFString *v32;
  uint64_t v33;
  const __CFString *v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = (void *)objc_opt_new();
    v9 = (void *)objc_opt_new();
    (*(void (**)(uint64_t, uint64_t, uint64_t, void *, void *, id))(v7 + 16))(v7, -1, -1, v8, v9, v6);

    goto LABEL_8;
  }
  if ((unint64_t)objc_msgSend(v5, "length") <= 0xB)
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = (void *)objc_opt_new();
    v12 = (void *)objc_opt_new();
    v34 = CFSTR("TagResponseInvalidLength");
    v35[0] = MEMORY[0x24BDBD1C8];
    v13 = (void *)MEMORY[0x24BDBCE70];
    v14 = v35;
    v15 = &v34;
LABEL_5:
    objc_msgSend(v13, "dictionaryWithObjects:forKeys:count:", v14, v15, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[NFCError errorWithCode:userInfo:](NFCError, "errorWithCode:userInfo:", 102, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, uint64_t, void *, void *, void *))(v10 + 16))(v10, -1, -1, v11, v12, v17);

    goto LABEL_8;
  }
  v18 = objc_retainAutorelease(v5);
  v19 = objc_msgSend(v18, "bytes");
  v20 = v19;
  v21 = *(unsigned __int8 *)(v19 + 10);
  if (*(_BYTE *)(v19 + 10))
  {
    v22 = *(_QWORD *)(a1 + 32);
    v23 = *(unsigned __int8 *)(v19 + 11);
    v24 = (void *)objc_opt_new();
    v25 = (void *)objc_opt_new();
    (*(void (**)(uint64_t, uint64_t, uint64_t, void *, void *, _QWORD))(v22 + 16))(v22, v21, v23, v24, v25, 0);

    goto LABEL_8;
  }
  if ((unint64_t)objc_msgSend(v18, "length") <= 0xE)
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = (void *)objc_opt_new();
    v12 = (void *)objc_opt_new();
    v32 = CFSTR("TagResponseInvalidLength");
    v33 = MEMORY[0x24BDBD1C8];
    v13 = (void *)MEMORY[0x24BDBCE70];
    v14 = &v33;
    v15 = &v32;
    goto LABEL_5;
  }
  v26 = *(unsigned __int8 *)(v20 + 15);
  if (objc_msgSend(v18, "length") != 2 * v26 + 16)
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = (void *)objc_opt_new();
    v12 = (void *)objc_opt_new();
    v30 = CFSTR("TagResponseInvalidLength");
    v31 = MEMORY[0x24BDBD1C8];
    v13 = (void *)MEMORY[0x24BDBCE70];
    v14 = &v31;
    v15 = &v30;
    goto LABEL_5;
  }
  objc_msgSend(v18, "subdataWithRange:", 13, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_opt_new();
  if ((_DWORD)v26)
  {
    objc_msgSend(v18, "subdataWithRange:", 16, (2 * v26));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "appendData:", v29);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

LABEL_8:
}

- (void)resetModeWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  char v11;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_215BBD000, "NFCFeliCaTag resetModeWithCompletionHandler:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  v6 = (void *)objc_opt_new();
  v11 = 62;
  objc_msgSend(v6, "appendBytes:length:", &v11, 1);
  -[NFCTag identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendData:", v7);

  LOWORD(state.opaque[0]) = 0;
  objc_msgSend(v6, "appendBytes:length:", &state, 2);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __47__NFCFeliCaTag_resetModeWithCompletionHandler___block_invoke;
  v9[3] = &unk_24D44F888;
  v10 = v4;
  v8 = v4;
  -[NFCFeliCaTag sendFeliCaCommandPacket:completionHandler:](self, "sendFeliCaCommandPacket:completionHandler:", v6, v9);

}

void __47__NFCFeliCaTag_resetModeWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else if (objc_msgSend(v5, "length") == 12)
  {
    v7 = objc_msgSend(objc_retainAutorelease(v6), "bytes");
    (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(v7 + 10), *(unsigned __int8 *)(v7 + 11), 0);
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 32);
    v11 = CFSTR("TagResponseInvalidLength");
    v12[0] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[NFCError errorWithCode:userInfo:](NFCError, "errorWithCode:userInfo:", 102, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, uint64_t, void *))(v8 + 16))(v8, -1, -1, v10);

  }
}

- (void)sendFeliCaCommandPacket:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[5];
  id v18;
  SEL v19;
  os_activity_scope_state_s state;

  v7 = a3;
  v8 = a4;
  v9 = _os_activity_create(&dword_215BBD000, "NFCFeliCaTag sendFeliCaCommandPacket:completionHandler:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  os_activity_scope_leave(&state);

  if (objc_msgSend(v7, "length") && (unint64_t)objc_msgSend(v7, "length") < 0xFF)
  {
    v11 = objc_retainAutorelease(v7);
    if (*(_BYTE *)objc_msgSend(v11, "bytes") || objc_msgSend(v11, "length") == 5)
    {
      LOBYTE(state.opaque[0]) = objc_msgSend(v11, "length") + 1;
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithBytes:length:", &state, 1);
      objc_msgSend(v12, "appendData:", v11);
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __58__NFCFeliCaTag_sendFeliCaCommandPacket_completionHandler___block_invoke_2;
      v13[3] = &unk_24D44F888;
      v14 = v8;
      -[NFCTag _transceiveWithData:completionHandler:](self, "_transceiveWithData:completionHandler:", v12, v13);

      goto LABEL_8;
    }
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __58__NFCFeliCaTag_sendFeliCaCommandPacket_completionHandler___block_invoke_38;
    v15[3] = &unk_24D44F8B0;
    v16 = v8;
    -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v15);
    v10 = v16;
  }
  else
  {
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __58__NFCFeliCaTag_sendFeliCaCommandPacket_completionHandler___block_invoke;
    v17[3] = &unk_24D44F860;
    v17[4] = self;
    v18 = v8;
    v19 = a2;
    -[NFCTag dispatchOnDelegateQueueAsync:](self, "dispatchOnDelegateQueueAsync:", v17);
    v10 = v18;
  }

LABEL_8:
}

void __58__NFCFeliCaTag_sendFeliCaCommandPacket_completionHandler___block_invoke(uint64_t a1)
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
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 4);
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
    v6(3, "%c[%{public}s %{public}s]:%i Command packet length must be between 1 to 254 inclusively", v10, ClassName, Name, 595);
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
    v24 = 595;
    _os_log_impl(&dword_215BBD000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Command packet length must be between 1 to 254 inclusively", buf, 0x22u);
  }

}

void __58__NFCFeliCaTag_sendFeliCaCommandPacket_completionHandler___block_invoke_38(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  v3 = (id)objc_opt_new();
  +[NFCError errorWithCode:](NFCError, "errorWithCode:", 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v1 + 16))(v1, v3, v2);

}

uint64_t __58__NFCFeliCaTag_sendFeliCaCommandPacket_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
