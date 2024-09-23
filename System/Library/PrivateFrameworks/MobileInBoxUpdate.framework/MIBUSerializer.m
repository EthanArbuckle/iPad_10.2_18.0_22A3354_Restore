@implementation MIBUSerializer

- (MIBUSerializer)init
{
  MIBUSerializer *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MIBUSerializer;
  v2 = -[MIBUSerializer init](&v5, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[MIBUSerializer setData:](v2, "setData:", v3);

  }
  return v2;
}

- (BOOL)serialize:(id)a3 withValue:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  BOOL v10;
  void *v11;
  NSObject *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, uint64_t, _BYTE *);
  void *v17;
  _QWORD *v18;
  uint64_t *v19;
  id v20;
  id location;
  _QWORD v22[5];
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint8_t buf[24];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  v29 = (id)objc_opt_new();
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy_;
  v22[4] = __Block_byref_object_dispose_;
  v8 = v7;
  v23 = v8;
  objc_initWeak(&location, self);
  v9 = objc_msgSend(v6, "count");
  v10 = v9 == objc_msgSend(v8, "count");
  if (v10)
  {
    v14 = MEMORY[0x24BDAC760];
    v15 = 3221225472;
    v16 = __38__MIBUSerializer_serialize_withValue___block_invoke_3;
    v17 = &unk_24EB552E0;
    objc_copyWeak(&v20, &location);
    v18 = v22;
    v19 = &v24;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", &v14);
    objc_destroyWeak(&v20);
    v11 = (void *)v25[5];
    if (!v11 || !objc_msgSend(v11, "length", v14, v15, v16, v17))
    {
      v10 = 0;
      goto LABEL_7;
    }
    -[MIBUSerializer data](self, "data");
    v12 = objc_claimAutoreleasedReturnValue();
    -[NSObject appendData:](v12, "appendData:", v25[5]);
  }
  else
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_8);
    v12 = (id)MIBUConnObj;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[MIBUSerializer serialize:withValue:].cold.1(buf, objc_msgSend(v8, "count"), objc_msgSend(v6, "count"), v12);
  }

LABEL_7:
  objc_destroyWeak(&location);
  _Block_object_dispose(v22, 8);

  _Block_object_dispose(&v24, 8);
  return v10;
}

void __38__MIBUSerializer_serialize_withValue___block_invoke()
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

void __38__MIBUSerializer_serialize_withValue___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  id WeakRetained;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;

  v7 = a2;
  v8 = (void *)MEMORY[0x22767B6E0]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectAtIndex:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "_serializeValue:forTag:", v10, v7);
      v11 = objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v12 = (void *)v11;
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "appendData:", v11);
LABEL_5:

        goto LABEL_6;
      }
      if (MIBUOnceToken != -1)
        dispatch_once(&MIBUOnceToken, &__block_literal_global_6_1);
      v21 = (void *)MIBUConnObj;
      if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
        __38__MIBUSerializer_serialize_withValue___block_invoke_3_cold_2(v21, v7, (uint64_t)v10);
    }
    else
    {
      if (MIBUOnceToken != -1)
        dispatch_once(&MIBUOnceToken, &__block_literal_global_4_2);
      v13 = MIBUConnObj;
      if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
        __38__MIBUSerializer_serialize_withValue___block_invoke_3_cold_1(v13, v14, v15, v16, v17, v18, v19, v20);
    }
    *a4 = 1;
    v22 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v22 + 40);
    *(_QWORD *)(v22 + 40) = 0;
    goto LABEL_5;
  }
LABEL_6:

  objc_autoreleasePoolPop(v8);
}

void __38__MIBUSerializer_serialize_withValue___block_invoke_2()
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

void __38__MIBUSerializer_serialize_withValue___block_invoke_5()
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

- (BOOL)serializeResponseError:(id)a3
{
  return -[MIBUSerializer _serializeError:withErrorCodeTag:errorDomainTag:errorDescriptionTag:](self, "_serializeError:withErrorCodeTag:errorDomainTag:errorDescriptionTag:", a3, &unk_24EB5C258, &unk_24EB5C270, &unk_24EB5C288);
}

- (BOOL)serializeOperationError:(id)a3
{
  return -[MIBUSerializer _serializeError:withErrorCodeTag:errorDomainTag:errorDescriptionTag:](self, "_serializeError:withErrorCodeTag:errorDomainTag:errorDescriptionTag:", a3, &unk_24EB5C2A0, &unk_24EB5C2B8, &unk_24EB5C2D0);
}

- (id)_serializeValue:(id)a3 forTag:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  NSObject *v21;
  int v22;
  uint64_t v23;
  int v24;
  _BYTE v25[5];
  uint8_t buf[8];
  __int16 v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v25[4] = 0;
  *(_DWORD *)v25 = objc_msgSend(v6, "charValue");
  +[MIBUSerializationUtil typeForTag:](MIBUSerializationUtil, "typeForTag:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    +[MIBUSerializationUtil maxLengthForTag:](MIBUSerializationUtil, "maxLengthForTag:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      switch(objc_msgSend(v7, "unsignedIntValue"))
      {
        case 1u:
        case 3u:
        case 4u:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v9 = v5;
            v10 = objc_msgSend(v9, "longLongValue");
            goto LABEL_20;
          }
          if (MIBUOnceToken != -1)
            dispatch_once(&MIBUOnceToken, &__block_literal_global_16_0);
          if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
            goto LABEL_50;
          goto LABEL_10;
        case 2u:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v9 = v5;
            objc_msgSend(v9, "doubleValue");
            *(_QWORD *)buf = v14;
            goto LABEL_21;
          }
          if (MIBUOnceToken != -1)
            dispatch_once(&MIBUOnceToken, &__block_literal_global_19_1);
          if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
            goto LABEL_50;
          goto LABEL_10;
        case 5u:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v5, "dataUsingEncoding:", 4);
            v15 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_17;
          }
          if (MIBUOnceToken != -1)
            dispatch_once(&MIBUOnceToken, &__block_literal_global_22_1);
          if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
            -[MIBUSerializer _serializeValue:forTag:].cold.4();
          goto LABEL_10;
        case 6u:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (MIBUOnceToken != -1)
              dispatch_once(&MIBUOnceToken, &__block_literal_global_24_0);
            if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
              -[MIBUSerializer _serializeValue:forTag:].cold.5();
            goto LABEL_10;
          }
          v15 = v5;
LABEL_17:
          v12 = v15;
          goto LABEL_22;
        case 7u:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (MIBUOnceToken != -1)
              dispatch_once(&MIBUOnceToken, &__block_literal_global_26_0);
            if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
LABEL_50:
              -[MIBUSerializer _serializeValue:forTag:].cold.2();
            goto LABEL_10;
          }
          v9 = v5;
          v10 = objc_msgSend(v9, "unsignedLongLongValue");
LABEL_20:
          *(_QWORD *)buf = v10;
LABEL_21:
          objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", buf, objc_msgSend(v8, "unsignedIntValue"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_22:
          *(_DWORD *)&v25[1] = objc_msgSend(v12, "length");
          if (objc_msgSend(v8, "unsignedIntValue") < *(_DWORD *)&v25[1])
          {
            if (MIBUOnceToken != -1)
              dispatch_once(&MIBUOnceToken, &__block_literal_global_30_1);
            v16 = (void *)MIBUConnObj;
            if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
            {
              v21 = v16;
              v22 = objc_msgSend(v6, "charValue");
              v23 = objc_msgSend(v12, "length");
              v24 = objc_msgSend(v8, "unsignedIntValue");
              *(_DWORD *)buf = 67109890;
              *(_DWORD *)&buf[4] = v22;
              v27 = 2114;
              v28 = v12;
              v29 = 2048;
              v30 = v23;
              v31 = 1024;
              v32 = v24;
              _os_log_error_impl(&dword_222C3F000, v21, OS_LOG_TYPE_ERROR, "Truncating tag 0x%X - %{public}@ with data length %ld to %d", buf, 0x22u);

            }
            v17 = (void *)MEMORY[0x24BDBCE50];
            v18 = objc_retainAutorelease(v12);
            objc_msgSend(v17, "dataWithBytes:length:", objc_msgSend(v18, "bytes"), objc_msgSend(v8, "unsignedIntValue"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            *(_DWORD *)&v25[1] = objc_msgSend(v12, "length");
          }
          v13 = (void *)objc_opt_new();
          objc_msgSend(v13, "appendBytes:length:", v25, 1);
          objc_msgSend(v13, "appendBytes:length:", &v25[1], 4);
          objc_msgSend(v13, "appendData:", v12);
          break;
        default:
          if (MIBUOnceToken != -1)
            dispatch_once(&MIBUOnceToken, &__block_literal_global_28);
          v11 = (void *)MIBUConnObj;
          if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
            -[MIBUSerializer _serializeValue:forTag:].cold.1(v11, v7);
          goto LABEL_10;
      }
    }
    else
    {
LABEL_10:
      v12 = 0;
      v13 = 0;
    }
  }
  else
  {
    v12 = 0;
    v13 = 0;
    v8 = 0;
  }
  v19 = v13;

  return v19;
}

void __41__MIBUSerializer__serializeValue_forTag___block_invoke()
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

void __41__MIBUSerializer__serializeValue_forTag___block_invoke_18()
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

void __41__MIBUSerializer__serializeValue_forTag___block_invoke_21()
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

void __41__MIBUSerializer__serializeValue_forTag___block_invoke_23()
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

void __41__MIBUSerializer__serializeValue_forTag___block_invoke_25()
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

void __41__MIBUSerializer__serializeValue_forTag___block_invoke_27()
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

void __41__MIBUSerializer__serializeValue_forTag___block_invoke_29()
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

- (BOOL)_serializeError:(id)a3 withErrorCodeTag:(id)a4 errorDomainTag:(id)a5 errorDescriptionTag:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  MIBUSerializer *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  BOOL v27;
  BOOL v28;
  void *v29;
  BOOL v30;
  NSObject *v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  __CFString *v42;
  void *v43;
  _QWORD v44[3];
  _QWORD v45[3];
  _QWORD v46[2];

  v46[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x22767B6E0]();
  -[MIBUSerializer data](self, "data");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (void *)objc_msgSend(v15, "copy");

  objc_msgSend(v10, "description");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v10, "description");
    v17 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = &stru_24EB57B88;
  }

  v42 = (__CFString *)v17;
  if (!v10)
  {
    v46[0] = v11;
    v28 = 1;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v46, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[MIBUSerializer serialize:withValue:](self, "serialize:withValue:", v29, &unk_24EB5C568);

    v22 = self;
    if (v30)
      goto LABEL_9;
    goto LABEL_10;
  }
  objc_msgSend(v10, "domain");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_35_0);
    v33 = MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUSerializer _serializeError:withErrorCodeTag:errorDomainTag:errorDescriptionTag:].cold.2(v33, v34, v35, v36, v37, v38, v39, v40);
    goto LABEL_18;
  }
  v45[0] = v11;
  v45[1] = v12;
  v45[2] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v45, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v14;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v10, "code"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v20;
  objc_msgSend(v10, "domain");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = v21;
  v44[2] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v44, 3);
  v22 = self;
  v23 = v11;
  v24 = v13;
  v25 = v12;
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[MIBUSerializer serialize:withValue:](v22, "serialize:withValue:", v19, v26);

  v12 = v25;
  v13 = v24;
  v11 = v23;

  v14 = v41;
  if (!v27)
  {
LABEL_10:
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_37_1);
    self = v22;
    v32 = MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUSerializer _serializeError:withErrorCodeTag:errorDomainTag:errorDescriptionTag:].cold.1((uint64_t)v10, v32);
LABEL_18:
    -[MIBUSerializer setData:](self, "setData:", v43);
    v28 = 0;
    goto LABEL_9;
  }
  v28 = 1;
LABEL_9:

  objc_autoreleasePoolPop(v14);
  return v28;
}

void __86__MIBUSerializer__serializeError_withErrorCodeTag_errorDomainTag_errorDescriptionTag___block_invoke()
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

void __86__MIBUSerializer__serializeError_withErrorCodeTag_errorDomainTag_errorDescriptionTag___block_invoke_36()
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

- (NSMutableData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

- (void)serialize:(uint64_t)a3 withValue:(os_log_t)log .cold.1(uint8_t *buf, uint64_t a2, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 134218240;
  *(_QWORD *)(buf + 4) = a2;
  *((_WORD *)buf + 6) = 2048;
  *(_QWORD *)(buf + 14) = a3;
  _os_log_error_impl(&dword_222C3F000, log, OS_LOG_TYPE_ERROR, "Serialization tag list size %lu != data list size %lu", buf, 0x16u);
}

void __38__MIBUSerializer_serialize_withValue___block_invoke_3_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_222C3F000, a1, a3, "MIBUSerializer released before enumeration block", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __38__MIBUSerializer_serialize_withValue___block_invoke_3_cold_2(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6[0] = 67109378;
  v6[1] = objc_msgSend(a2, "charValue");
  v7 = 2114;
  v8 = a3;
  _os_log_error_impl(&dword_222C3F000, v5, OS_LOG_TYPE_ERROR, "Failed to serialize tag 0x%X with value %{public}@, skip serialization", (uint8_t *)v6, 0x12u);

}

- (void)_serializeValue:(void *)a1 forTag:(void *)a2 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4[0] = 67109120;
  v4[1] = objc_msgSend(a2, "unsignedIntValue");
  _os_log_error_impl(&dword_222C3F000, v3, OS_LOG_TYPE_ERROR, "Unrecognized serialization data type: 0x%X", (uint8_t *)v4, 8u);

}

- (void)_serializeValue:forTag:.cold.2()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8_0(v2);
  OUTLINED_FUNCTION_7_1();
  v3 = (id)OUTLINED_FUNCTION_6_0();
  v4 = (void *)OUTLINED_FUNCTION_5_0();
  v5 = OUTLINED_FUNCTION_1_0(v4);
  OUTLINED_FUNCTION_3_2(&dword_222C3F000, v6, v7, "Tag 0x%X - class %{public}@ != %{public}@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_2_1();
}

- (void)_serializeValue:forTag:.cold.4()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8_0(v2);
  OUTLINED_FUNCTION_7_1();
  v3 = (id)OUTLINED_FUNCTION_6_0();
  v4 = (void *)OUTLINED_FUNCTION_5_0();
  v5 = OUTLINED_FUNCTION_1_0(v4);
  OUTLINED_FUNCTION_3_2(&dword_222C3F000, v6, v7, "Tag 0x%X - class %{public}@ != %{public}@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_2_1();
}

- (void)_serializeValue:forTag:.cold.5()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8_0(v2);
  OUTLINED_FUNCTION_7_1();
  v3 = (id)OUTLINED_FUNCTION_6_0();
  v4 = (void *)OUTLINED_FUNCTION_5_0();
  v5 = OUTLINED_FUNCTION_1_0(v4);
  OUTLINED_FUNCTION_3_2(&dword_222C3F000, v6, v7, "Tag 0x%X - class %{public}@ != %{public}@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_2_1();
}

- (void)_serializeError:(uint64_t)a1 withErrorCodeTag:(NSObject *)a2 errorDomainTag:errorDescriptionTag:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_222C3F000, a2, OS_LOG_TYPE_ERROR, "Failed to serialize error: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_serializeError:(uint64_t)a3 withErrorCodeTag:(uint64_t)a4 errorDomainTag:(uint64_t)a5 errorDescriptionTag:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_222C3F000, a1, a3, "Cannot serialize error, error domain is nil", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
