@implementation MIBUDeserializer

- (MIBUDeserializer)initWithData:(id)a3
{
  id v4;
  MIBUDeserializer *v5;
  MIBUDeserializer *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MIBUDeserializer;
  v5 = -[MIBUDeserializer init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[MIBUDeserializer setData:](v5, "setData:", v4);
    -[MIBUDeserializer setPos:](v6, "setPos:", 0);
    -[MIBUDeserializer setTagValDict:](v6, "setTagValDict:", 0);
  }

  return v6;
}

- (id)deserialize
{
  void *v3;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  id v12;
  id v13;
  id v14;

  -[MIBUDeserializer tagValDict](self, "tagValDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MIBUDeserializer tagValDict](self, "tagValDict");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)objc_opt_new();
    v6 = 0;
    v7 = 0;
    do
    {
      v8 = v7;
      v9 = v6;
      v13 = v6;
      v14 = v7;
      v10 = -[MIBUDeserializer _deserializeNextTag:withData:](self, "_deserializeNextTag:withData:", &v14, &v13);
      v7 = v14;

      v6 = v13;
      if (!v10)
      {

        v12 = 0;
        goto LABEL_14;
      }
      if (v6 && v7)
      {
        -[MIBUDeserializer _valueForTag:withData:](self, "_valueForTag:withData:", v7, v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "setObject:forKey:", v11, v7);

      }
    }
    while (v7);
    if (objc_msgSend(v5, "count"))
      -[MIBUDeserializer setTagValDict:](self, "setTagValDict:", v5);
    v12 = v5;
LABEL_14:

    return v12;
  }
}

- (BOOL)deserializeResponseError:(id *)a3
{
  return -[MIBUDeserializer _deserializeError:withErrorCodeTag:errorDomainTag:errorDescriptionTag:](self, "_deserializeError:withErrorCodeTag:errorDomainTag:errorDescriptionTag:", a3, &unk_24EB5C1E0, &unk_24EB5C1E0, &unk_24EB5C1F8);
}

- (BOOL)deserializeOperationError:(id *)a3
{
  return -[MIBUDeserializer _deserializeError:withErrorCodeTag:errorDomainTag:errorDescriptionTag:](self, "_deserializeError:withErrorCodeTag:errorDomainTag:errorDescriptionTag:", a3, &unk_24EB5C210, &unk_24EB5C228, &unk_24EB5C240);
}

- (BOOL)_deserializeNextTag:(id *)a3 withData:(id *)a4
{
  unint64_t v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  unint64_t v20;
  void *v21;
  unint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  BOOL v27;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  int v36;
  unsigned int v37;
  int v38;
  void *v39;
  unsigned int v40;
  NSObject *v41;
  void *v42;
  unsigned int v43;
  unsigned __int8 v44;
  uint8_t buf[4];
  _BYTE v46[28];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v44 = 0;
  v43 = 0;
  v7 = -[MIBUDeserializer pos](self, "pos");
  -[MIBUDeserializer data](self, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v7 == v9)
  {
LABEL_19:
    v18 = 0;
    v16 = 0;
    v26 = 0;
    goto LABEL_10;
  }
  v10 = v7 + 5;
  -[MIBUDeserializer data](self, "data");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  if (v7 + 5 >= v12)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_7);
    v29 = (void *)MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
    {
      v30 = v29;
      -[MIBUDeserializer data](self, "data");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIBUDeserializer data](self, "data");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)v46 = v31;
      *(_WORD *)&v46[8] = 2048;
      *(_QWORD *)&v46[10] = v7;
      *(_WORD *)&v46[18] = 2048;
      *(_QWORD *)&v46[20] = objc_msgSend(v32, "length");
      _os_log_impl(&dword_222C3F000, v30, OS_LOG_TYPE_DEFAULT, "Warning: Data %{public}@ Terminating deserialization at %lu for data length: %lu", buf, 0x20u);

    }
    goto LABEL_19;
  }
  v13 = v7 + 1;
  -[MIBUDeserializer data](self, "data");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "getBytes:range:", &v44, v7, 1);

  -[MIBUDeserializer data](self, "data");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "getBytes:range:", &v43, v13, 4);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v44);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[MIBUSerializationUtil maxLengthForTag:](MIBUSerializationUtil, "maxLengthForTag:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = v17;
    v19 = v43;
    if (v19 > objc_msgSend(v17, "unsignedIntValue"))
    {
      if (MIBUOnceToken != -1)
        dispatch_once(&MIBUOnceToken, &__block_literal_global_13);
      v34 = (void *)MIBUConnObj;
      if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      {
        v35 = v34;
        v36 = objc_msgSend(v16, "charValue");
        v37 = v43;
        v38 = objc_msgSend(v18, "unsignedIntValue");
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)v46 = v36;
        *(_WORD *)&v46[4] = 1024;
        *(_DWORD *)&v46[6] = v37;
        *(_WORD *)&v46[10] = 1024;
        *(_DWORD *)&v46[12] = v38;
        _os_log_error_impl(&dword_222C3F000, v35, OS_LOG_TYPE_ERROR, "0x%X field len: %u is > expected len: %u", buf, 0x14u);

      }
    }
    else
    {
      v20 = v10 + v43;
      -[MIBUDeserializer data](self, "data");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "length");

      if (v20 <= v22)
      {
        if (v43)
        {
          v23 = (void *)MEMORY[0x24BDBCE50];
          -[MIBUDeserializer data](self, "data");
          v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v25 = objc_msgSend(v24, "bytes");
          objc_msgSend(v23, "dataWithBytesNoCopy:length:freeWhenDone:", v25 + v10, v43, 0);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          v10 += v43;
        }
        else
        {
          v26 = 0;
        }
        -[MIBUDeserializer setPos:](self, "setPos:", v10);
LABEL_10:
        v27 = 1;
        if (!a3)
          goto LABEL_12;
        goto LABEL_11;
      }
      if (MIBUOnceToken != -1)
        dispatch_once(&MIBUOnceToken, &__block_literal_global_15);
      v39 = (void *)MIBUConnObj;
      if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      {
        v40 = v43;
        v41 = v39;
        -[MIBUDeserializer data](self, "data");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v46 = v40;
        *(_WORD *)&v46[4] = 2048;
        *(_QWORD *)&v46[6] = v10;
        *(_WORD *)&v46[14] = 2114;
        *(_QWORD *)&v46[16] = v42;
        _os_log_error_impl(&dword_222C3F000, v41, OS_LOG_TYPE_ERROR, "Failed to deserialize %u bytes data at %lu; data %{public}@ too short",
          buf,
          0x1Cu);

      }
    }
  }
  else
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_11);
    v33 = (void *)MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUDeserializer _deserializeNextTag:withData:].cold.1(v33, v16);
    v18 = 0;
  }
  v26 = 0;
  v27 = 0;
  if (a3)
LABEL_11:
    *a3 = objc_retainAutorelease(v16);
LABEL_12:
  if (a4)
    *a4 = objc_retainAutorelease(v26);

  return v27;
}

void __49__MIBUDeserializer__deserializeNextTag_withData___block_invoke()
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

void __49__MIBUDeserializer__deserializeNextTag_withData___block_invoke_10()
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

void __49__MIBUDeserializer__deserializeNextTag_withData___block_invoke_12()
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

void __49__MIBUDeserializer__deserializeNextTag_withData___block_invoke_14()
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

- (id)_valueForTag:(id)a3 withData:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  unsigned int v10;
  unsigned int v11;
  id v12;
  void *v13;
  void *v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double v34;

  v5 = a4;
  v6 = a3;
  +[MIBUSerializationUtil typeForTag:](MIBUSerializationUtil, "typeForTag:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MIBUSerializationUtil maxLengthForTag:](MIBUSerializationUtil, "maxLengthForTag:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v9 = v8 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    switch(objc_msgSend(v7, "unsignedIntValue"))
    {
      case 1u:
      case 3u:
      case 4u:
        v10 = objc_msgSend(v8, "unsignedIntValue");
        if (!v5 || (v11 = v10, !objc_msgSend(v5, "length")))
        {
          if (MIBUOnceToken != -1)
            dispatch_once(&MIBUOnceToken, &__block_literal_global_17);
          v20 = MIBUConnObj;
          if (!os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
            break;
          goto LABEL_33;
        }
        if (v11 - 9 <= 0xFFFFFFF7)
        {
          if (MIBUOnceToken != -1)
            dispatch_once(&MIBUOnceToken, &__block_literal_global_19_0);
          if (!os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
            break;
          goto LABEL_57;
        }
        if (objc_msgSend(v5, "length") == v11)
        {
          v34 = 0.0;
          objc_msgSend(v5, "getBytes:range:", &v34, 0, v11);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", *(_QWORD *)&v34);
          v12 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_28;
        }
        if (MIBUOnceToken != -1)
          dispatch_once(&MIBUOnceToken, &__block_literal_global_21_0);
        if (!os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
          break;
        goto LABEL_65;
      case 2u:
        v15 = objc_msgSend(v8, "unsignedIntValue");
        if (!v5 || (v16 = v15, !objc_msgSend(v5, "length")))
        {
          if (MIBUOnceToken != -1)
            dispatch_once(&MIBUOnceToken, &__block_literal_global_23_0);
          v20 = MIBUConnObj;
          if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
LABEL_33:
            -[MIBUDeserializer _valueForTag:withData:].cold.2((uint64_t)v5, v20, v21, v22, v23, v24, v25, v26);
          break;
        }
        if (v16 - 9 <= 0xFFFFFFF7)
        {
          if (MIBUOnceToken != -1)
            dispatch_once(&MIBUOnceToken, &__block_literal_global_25_0);
          if (!os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
            break;
          goto LABEL_57;
        }
        if (objc_msgSend(v5, "length") == v16)
        {
          v34 = 0.0;
          objc_msgSend(v5, "getBytes:range:", &v34, 0, v16);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v34);
          v12 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_28;
        }
        if (MIBUOnceToken != -1)
          dispatch_once(&MIBUOnceToken, &__block_literal_global_27_0);
        if (!os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
          break;
        goto LABEL_65;
      case 5u:
        v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v5, 4);
        goto LABEL_28;
      case 6u:
        v12 = v5;
        goto LABEL_28;
      case 7u:
        v17 = objc_msgSend(v8, "unsignedIntValue");
        if (!v5 || (v18 = v17, !objc_msgSend(v5, "length")))
        {
          if (MIBUOnceToken != -1)
            dispatch_once(&MIBUOnceToken, &__block_literal_global_30_0);
          v27 = MIBUConnObj;
          if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
            -[MIBUDeserializer _valueForTag:withData:].cold.8((uint64_t)v5, v27, v28, v29, v30, v31, v32, v33);
          break;
        }
        if (v18 - 9 <= 0xFFFFFFF7)
        {
          if (MIBUOnceToken != -1)
            dispatch_once(&MIBUOnceToken, &__block_literal_global_32_0);
          if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
LABEL_57:
            -[MIBUDeserializer _valueForTag:withData:].cold.3();
        }
        else
        {
          if (objc_msgSend(v5, "length") == v18)
          {
            v34 = 0.0;
            objc_msgSend(v5, "getBytes:range:", &v34, 0, v18);
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)&v34);
            v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_28:
            v14 = v12;
            goto LABEL_29;
          }
          if (MIBUOnceToken != -1)
            dispatch_once(&MIBUOnceToken, &__block_literal_global_34);
          if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
LABEL_65:
            -[MIBUDeserializer _valueForTag:withData:].cold.4();
        }
        break;
      default:
        if (MIBUOnceToken != -1)
          dispatch_once(&MIBUOnceToken, &__block_literal_global_36);
        v13 = (void *)MIBUConnObj;
        if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
          -[MIBUDeserializer _valueForTag:withData:].cold.1(v13, v7);
        break;
    }
  }
  v14 = 0;
LABEL_29:

  return v14;
}

void __42__MIBUDeserializer__valueForTag_withData___block_invoke()
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

void __42__MIBUDeserializer__valueForTag_withData___block_invoke_18()
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

void __42__MIBUDeserializer__valueForTag_withData___block_invoke_20()
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

void __42__MIBUDeserializer__valueForTag_withData___block_invoke_22()
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

void __42__MIBUDeserializer__valueForTag_withData___block_invoke_24()
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

void __42__MIBUDeserializer__valueForTag_withData___block_invoke_26()
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

void __42__MIBUDeserializer__valueForTag_withData___block_invoke_29()
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

void __42__MIBUDeserializer__valueForTag_withData___block_invoke_31()
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

void __42__MIBUDeserializer__valueForTag_withData___block_invoke_33()
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

void __42__MIBUDeserializer__valueForTag_withData___block_invoke_35()
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

- (BOOL)_deserializeError:(id *)a3 withErrorCodeTag:(id)a4 errorDomainTag:(id)a5 errorDescriptionTag:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)objc_opt_new();
  -[MIBUDeserializer tagValDict](self, "tagValDict");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_37_0);
    v24 = MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUDeserializer _deserializeError:withErrorCodeTag:errorDomainTag:errorDescriptionTag:].cold.1(v24, v25, v26, v27, v28, v29, v30, v31);
LABEL_18:
    v20 = 0;
    v18 = 0;
    v16 = 0;
    v22 = 0;
    v21 = 0;
    if (!a3)
      goto LABEL_9;
    goto LABEL_8;
  }
  -[MIBUDeserializer tagValDict](self, "tagValDict");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_39_1);
    v32 = MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      -[MIBUDeserializer _deserializeError:withErrorCodeTag:errorDomainTag:errorDescriptionTag:].cold.2(v32, v33, v34, v35, v36, v37, v38, v39);
    goto LABEL_18;
  }
  if (objc_msgSend(v16, "longValue"))
  {
    -[MIBUDeserializer tagValDict](self, "tagValDict");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKey:", v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[MIBUDeserializer tagValDict](self, "tagValDict");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKey:", v12);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v20, *MEMORY[0x24BDD0FC8]);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v18, objc_msgSend(v16, "longValue"), v13);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
    v18 = 0;
    v21 = 0;
  }
  v22 = 1;
  if (a3)
LABEL_8:
    *a3 = objc_retainAutorelease(v21);
LABEL_9:

  return v22;
}

void __90__MIBUDeserializer__deserializeError_withErrorCodeTag_errorDomainTag_errorDescriptionTag___block_invoke()
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

void __90__MIBUDeserializer__deserializeError_withErrorCodeTag_errorDomainTag_errorDescriptionTag___block_invoke_38()
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

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (unint64_t)pos
{
  return self->_pos;
}

- (void)setPos:(unint64_t)a3
{
  self->_pos = a3;
}

- (NSDictionary)tagValDict
{
  return self->_tagValDict;
}

- (void)setTagValDict:(id)a3
{
  objc_storeStrong((id *)&self->_tagValDict, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagValDict, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (void)_deserializeNextTag:(void *)a1 withData:(void *)a2 .cold.1(void *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = a1;
  objc_msgSend(a2, "charValue");
  OUTLINED_FUNCTION_7_0(&dword_222C3F000, v4, v5, "Tag 0x%X is not recognized", v6, v7, v8, v9, 0);

  OUTLINED_FUNCTION_4();
}

- (void)_valueForTag:(void *)a1 withData:(void *)a2 .cold.1(void *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = a1;
  objc_msgSend(a2, "unsignedIntValue");
  OUTLINED_FUNCTION_7_0(&dword_222C3F000, v4, v5, "Unrecognized deserialization data type: 0x%X", v6, v7, v8, v9, 0);

  OUTLINED_FUNCTION_4();
}

- (void)_valueForTag:(uint64_t)a3 withData:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_222C3F000, a2, a3, "Cannot convert data %{public}@ to number", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)_valueForTag:withData:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_222C3F000, v0, v1, "Len of num to convert %u cannot be greater than %lu", v2);
  OUTLINED_FUNCTION_4();
}

- (void)_valueForTag:withData:.cold.4()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_1(&dword_222C3F000, v0, (uint64_t)v0, "Data %{public}@ does not have expected len %u", v1);
  OUTLINED_FUNCTION_4();
}

- (void)_valueForTag:(uint64_t)a3 withData:(uint64_t)a4 .cold.8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_222C3F000, a2, a3, "Cannot convert data %{public}@ to number. Data is NULL or empty", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)_deserializeError:(uint64_t)a3 withErrorCodeTag:(uint64_t)a4 errorDomainTag:(uint64_t)a5 errorDescriptionTag:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_222C3F000, a1, a3, "Data must be deserialized before deserializing error", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)_deserializeError:(uint64_t)a3 withErrorCodeTag:(uint64_t)a4 errorDomainTag:(uint64_t)a5 errorDescriptionTag:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_222C3F000, a1, a3, "Failed to convert error code data to number", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
