@implementation HIDDisplayPresetData

- (HIDDisplayPresetData)initWithDisplayDevice:(id)a3 index:(int64_t)a4
{
  id v6;
  HIDDisplayPresetData *v7;
  HIDDisplayPresetData *v8;
  HIDDisplayPresetData *v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HIDDisplayPresetData;
  v7 = -[HIDDisplayPresetData init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    -[HIDDisplayPresetData setHidDisplay:](v7, "setHidDisplay:", v6);
    v8->_index = a4;
    v9 = v8;
  }

  return v8;
}

- (id)hidDisplay
{
  return objc_loadWeakRetained((id *)&self->_deviceRef);
}

- (void)setHidDisplay:(id)a3
{
  objc_storeWeak((id *)&self->_deviceRef, a3);
}

- (BOOL)valid
{
  void *v3;
  HIDDisplayPresetInterface **p_deviceRef;
  id WeakRetained;
  int64_t index;
  char v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  int v12;
  BOOL v13;
  NSObject *v14;
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  -[HIDDisplayPresetData hidDisplay](self, "hidDisplay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    p_deviceRef = &self->_deviceRef;
    WeakRetained = objc_loadWeakRetained((id *)&self->_deviceRef);
    index = self->_index;
    v16 = 0;
    v7 = objc_msgSend(WeakRetained, "setCurrentPresetIndex:error:", index, &v16);
    v8 = v16;

    if ((v7 & 1) != 0)
    {
      objc_msgSend(v3, "getHIDElementForUsage:", 6);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        v17[0] = v9;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v3, "extract:error:", v11, 0);

        if (v12)
        {
          v13 = -[NSObject integerValue](v10, "integerValue") == 1;
LABEL_13:

          goto LABEL_14;
        }
      }
      else
      {
        HIDDisplayLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[HIDDisplayPresetData valid].cold.1((id *)p_deviceRef, v14);

      }
    }
    else
    {
      HIDDisplayLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[HIDDisplayPresetData valid].cold.2();
    }
    v13 = 0;
    goto LABEL_13;
  }
  v13 = 0;
LABEL_14:

  return v13;
}

- (BOOL)writable
{
  void *v3;
  HIDDisplayPresetInterface **p_deviceRef;
  id WeakRetained;
  int64_t index;
  char v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  int v12;
  BOOL v13;
  NSObject *v14;
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  -[HIDDisplayPresetData hidDisplay](self, "hidDisplay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    p_deviceRef = &self->_deviceRef;
    WeakRetained = objc_loadWeakRetained((id *)&self->_deviceRef);
    index = self->_index;
    v16 = 0;
    v7 = objc_msgSend(WeakRetained, "setCurrentPresetIndex:error:", index, &v16);
    v8 = v16;

    if ((v7 & 1) != 0)
    {
      objc_msgSend(v3, "getHIDElementForUsage:", 5);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        v17[0] = v9;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v3, "extract:error:", v11, 0);

        if (v12)
        {
          v13 = -[NSObject integerValue](v10, "integerValue") == 1;
LABEL_13:

          goto LABEL_14;
        }
      }
      else
      {
        HIDDisplayLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[HIDDisplayPresetData writable].cold.1((id *)p_deviceRef, v14);

      }
    }
    else
    {
      HIDDisplayLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[HIDDisplayPresetData valid].cold.2();
    }
    v13 = 0;
    goto LABEL_13;
  }
  v13 = 0;
LABEL_14:

  return v13;
}

- (id)get:(id *)a3
{
  id v5;
  id v6;
  void *v7;
  HIDDisplayPresetInterface **p_deviceRef;
  id WeakRetained;
  int64_t *p_index;
  int64_t index;
  int v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  __CFString **v21;
  void *v22;
  uint64_t v23;
  __CFString **v24;
  void *v25;
  void *v26;
  NSObject *v27;
  __CFString **v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  __CFString **v33;
  NSObject *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  const char *v38;
  id v39;
  id v40;
  NSObject *v41;
  NSObject *v42;
  id v43;
  int64_t v44;
  id *location;
  uint8_t buf[4];
  id v48;
  __int16 v49;
  int64_t v50;
  __int16 v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[HIDDisplayPresetData hidDisplay](self, "hidDisplay");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    if (a3)
    {
      v39 = objc_alloc(MEMORY[0x24BDD1540]);
      v16 = 0;
      v40 = 0;
      *a3 = (id)objc_msgSend(v39, "initWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -536870911, 0);
      goto LABEL_60;
    }
    goto LABEL_56;
  }
  p_deviceRef = &self->_deviceRef;
  WeakRetained = objc_loadWeakRetained((id *)&self->_deviceRef);
  index = self->_index;
  p_index = &self->_index;
  v12 = objc_msgSend(WeakRetained, "setCurrentPresetIndex:error:", index, a3);

  if (!v12)
  {
    HIDDisplayLog();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      -[HIDDisplayPresetData valid].cold.2();

    goto LABEL_56;
  }
  for (i = 0; i != 9; ++i)
  {
    objc_msgSend(v7, "getHIDElementForUsage:", qword_2161C3BB0[i]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      objc_msgSend(v6, "addObject:", v14);

  }
  if (!objc_msgSend(v7, "extract:error:", v6, a3))
  {
LABEL_56:
    v16 = 0;
    v40 = 0;
    goto LABEL_60;
  }
  location = (id *)p_deviceRef;
  v15 = 0;
  v16 = 0;
  do
  {
    v17 = qword_2161C3BB0[v15];
    objc_msgSend(v7, "getHIDElementForUsage:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      switch(v17)
      {
        case 5:
          if (objc_msgSend(v18, "integerValue") == 1)
            v20 = MEMORY[0x24BDBD1C8];
          else
            v20 = MEMORY[0x24BDBD1C0];
          v21 = &kHIDDisplayPresetFieldWritableKey;
          goto LABEL_19;
        case 6:
          if (objc_msgSend(v18, "integerValue") == 1)
            v20 = MEMORY[0x24BDBD1C8];
          else
            v20 = MEMORY[0x24BDBD1C0];
          v21 = &kHIDDisplayPresetFieldValidKey;
LABEL_19:
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v20, *v21);
          break;
        case 8:
          objc_msgSend(v18, "dataValue");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          getUnicharStringFromData(v22);
          v23 = objc_claimAutoreleasedReturnValue();

          if (v23)
          {
            v24 = &kHIDDisplayPresetFieldNameKey;
            goto LABEL_24;
          }
          HIDDisplayLog();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v19, "dataValue");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v48 = v32;
            _os_log_impl(&dword_2161BB000, v31, OS_LOG_TYPE_DEFAULT, "Invalid / Empty Name Data %@", buf, 0xCu);

          }
          v33 = &kHIDDisplayPresetFieldNameKey;
          goto LABEL_41;
        case 9:
          objc_msgSend(v18, "dataValue");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          getUnicharStringFromData(v25);
          v23 = objc_claimAutoreleasedReturnValue();

          if (v23)
          {
            v24 = &kHIDDisplayPresetFieldDescriptionKey;
LABEL_24:
            objc_msgSend(v5, "setObject:forKeyedSubscript:", v23, *v24);
            v16 = (void *)v23;
          }
          else
          {
            HIDDisplayLog();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v19, "dataValue");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v48 = v35;
              _os_log_impl(&dword_2161BB000, v34, OS_LOG_TYPE_DEFAULT, "Invalid / Empty Description Data %@", buf, 0xCu);

            }
            v33 = &kHIDDisplayPresetFieldDescriptionKey;
LABEL_41:
            objc_msgSend(v5, "setObject:forKeyedSubscript:", &stru_24D4FF448, *v33);
            v16 = 0;
          }
          break;
        case 10:
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v18, "integerValue"));
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = &kHIDDisplayPresetFieldDataBlockOneLengthKey;
          goto LABEL_33;
        case 11:
          objc_msgSend(v18, "dataValue");
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (v26)
          {
            objc_msgSend(v19, "dataValue");
            v27 = objc_claimAutoreleasedReturnValue();
            v28 = &kHIDDisplayPresetFieldDataBlockOneKey;
            goto LABEL_33;
          }
          HIDDisplayLog();
          v27 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            goto LABEL_34;
          objc_msgSend(v19, "dataValue");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v48 = v36;
          v37 = v27;
          v38 = "Invalid Data Block One Data %@";
          goto LABEL_50;
        case 12:
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v18, "integerValue"));
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = &kHIDDisplayPresetFieldDataBlockTwoLengthKey;
          goto LABEL_33;
        case 13:
          objc_msgSend(v18, "dataValue");
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (v29)
          {
            objc_msgSend(v19, "dataValue");
            v27 = objc_claimAutoreleasedReturnValue();
            v28 = &kHIDDisplayPresetFieldDataBlockTwoKey;
            goto LABEL_33;
          }
          HIDDisplayLog();
          v27 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            goto LABEL_34;
          objc_msgSend(v19, "dataValue");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v48 = v36;
          v37 = v27;
          v38 = "Invalid Data Block Two Data %@";
          goto LABEL_50;
        case 14:
          objc_msgSend(v18, "dataValue");
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          if (v30)
          {
            objc_msgSend(v19, "dataValue");
            v27 = objc_claimAutoreleasedReturnValue();
            v28 = &kHIDDisplayPresetUniqueIDKey;
LABEL_33:
            objc_msgSend(v5, "setObject:forKeyedSubscript:", v27, *v28);
          }
          else
          {
            HIDDisplayLog();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v19, "dataValue");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v48 = v36;
              v37 = v27;
              v38 = "Invalid UUID Data %@";
LABEL_50:
              _os_log_impl(&dword_2161BB000, v37, OS_LOG_TYPE_DEFAULT, v38, buf, 0xCu);

            }
          }
LABEL_34:

          break;
        default:
          break;
      }
    }

    ++v15;
  }
  while (v15 != 9);
  HIDDisplayLog();
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    v43 = objc_loadWeakRetained(location);
    v44 = *p_index;
    *(_DWORD *)buf = 138412802;
    v48 = v43;
    v49 = 2048;
    v50 = v44;
    v51 = 2114;
    v52 = v5;
    _os_log_impl(&dword_2161BB000, v42, OS_LOG_TYPE_DEFAULT, "%@ get preset for index %ld returned data %{public}@", buf, 0x20u);

  }
  v40 = v5;
LABEL_60:

  return v40;
}

- (BOOL)set:(id)a3 error:(id *)a4
{
  uint64_t (*v6)(uint64_t, uint64_t);
  NSObject *v7;
  id WeakRetained;
  int64_t index;
  void *v10;
  void *v11;
  _BOOL4 v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  id v17;
  BOOL v18;
  NSObject *v19;
  NSObject *v20;
  id obj;
  _QWORD v23[5];
  id v24;
  uint64_t *v25;
  _BYTE *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  _BYTE buf[24];
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v6 = (uint64_t (*)(uint64_t, uint64_t))a3;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy_;
  v36 = __Block_byref_object_dispose_;
  v37 = (id)0xAAAAAAAAAAAAAAAALL;
  v37 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 1;
  HIDDisplayLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_deviceRef);
    index = self->_index;
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = WeakRetained;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = index;
    *(_WORD *)&buf[22] = 2114;
    v39 = v6;
    _os_log_impl(&dword_2161BB000, v7, OS_LOG_TYPE_DEFAULT, "%@ set preset for index %ld data %{public}@", buf, 0x20u);

  }
  -[HIDDisplayPresetData hidDisplay](self, "hidDisplay");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v39 = __Block_byref_object_copy_;
    v40 = __Block_byref_object_dispose_;
    v41 = 0;
    -[HIDDisplayPresetData get:](self, "get:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11 == 0;

    if (v12)
    {
      HIDDisplayLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[HIDDisplayPresetData set:error:].cold.1((uint64_t)self);

      v18 = 0;
    }
    else
    {
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __34__HIDDisplayPresetData_set_error___block_invoke;
      v23[3] = &unk_24D4FF2A0;
      v23[4] = self;
      v13 = v10;
      v24 = v13;
      v25 = &v32;
      v26 = buf;
      v27 = &v28;
      objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v23);
      if (*((_BYTE *)v29 + 24))
      {
        v14 = v33[5];
        v15 = *(_QWORD *)&buf[8];
        obj = *(id *)(*(_QWORD *)&buf[8] + 40);
        v16 = objc_msgSend(v13, "commit:error:", v14, &obj);
        objc_storeStrong((id *)(v15 + 40), obj);
        *((_BYTE *)v29 + 24) = v16;
      }
      else
      {
        HIDDisplayLog();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          -[HIDDisplayPresetData set:error:].cold.2(v20);

      }
      if (a4)
        *a4 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
      v18 = *((_BYTE *)v29 + 24) != 0;

    }
    _Block_object_dispose(buf, 8);

  }
  else if (a4)
  {
    v17 = objc_alloc(MEMORY[0x24BDD1540]);
    v18 = 0;
    *a4 = (id)objc_msgSend(v17, "initWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -536870911, 0);
  }
  else
  {
    v18 = 0;
  }

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);

  return v18;
}

void __34__HIDDisplayPresetData_set_error___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id WeakRetained;
  uint64_t v21;
  NSObject *v22;
  id v23;
  const __CFString *v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  __int16 v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  HIDDisplayLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    *(_DWORD *)buf = 138413058;
    v32 = WeakRetained;
    v33 = 2048;
    v34 = v21;
    v35 = 2112;
    v36 = v7;
    v37 = 2112;
    v38 = v8;
    _os_log_debug_impl(&dword_2161BB000, v9, OS_LOG_TYPE_DEBUG, "%@ set preset for index %ld key : %@ value : %@", buf, 0x2Au);

  }
  if (objc_msgSend(v7, "isEqualToString:", kHIDDisplayPresetFieldNameKey))
  {
    objc_msgSend(*(id *)(a1 + 40), "getHIDElementForUsage:", 8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
      goto LABEL_55;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_55;
    objc_msgSend(v8, "dataUsingEncoding:", 2483028224);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11 && objc_msgSend(v11, "length"))
      goto LABEL_19;
    v30 = 0;
    v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", &v30, 2);

    HIDDisplayLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      goto LABEL_18;
    *(_DWORD *)buf = 138412290;
    v32 = v8;
    v15 = "Invalid Name %@ , Converting it to 2 byte null value";
    goto LABEL_17;
  }
  if (objc_msgSend(v7, "isEqualToString:", kHIDDisplayPresetFieldDescriptionKey))
  {
    objc_msgSend(*(id *)(a1 + 40), "getHIDElementForUsage:", 9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
      goto LABEL_55;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_55;
    objc_msgSend(v8, "dataUsingEncoding:", 2483028224);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v16;
    if (v16 && objc_msgSend(v16, "length"))
      goto LABEL_19;
    v30 = 0;
    v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", &v30, 2);

    HIDDisplayLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
LABEL_18:

      v12 = (void *)v13;
LABEL_19:
      objc_msgSend(v10, "setDataValue:", v12);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v10);

LABEL_55:
      goto LABEL_56;
    }
    *(_DWORD *)buf = 138412290;
    v32 = v8;
    v15 = "Invalid Description %@ , Converting it to 2 byte null value";
LABEL_17:
    _os_log_impl(&dword_2161BB000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 0xCu);
    goto LABEL_18;
  }
  if (objc_msgSend(v7, "isEqualToString:", kHIDDisplayPresetFieldDataBlockOneLengthKey))
  {
    v17 = *(void **)(a1 + 40);
    v18 = 10;
LABEL_52:
    objc_msgSend(v17, "getHIDElementForUsage:", v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v10, "setIntegerValue:", objc_msgSend(v8, "integerValue"));
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v10);
      }
    }
    goto LABEL_55;
  }
  if (objc_msgSend(v7, "isEqualToString:", kHIDDisplayPresetFieldDataBlockOneKey))
  {
    objc_msgSend(*(id *)(a1 + 40), "getHIDElementForUsage:", 11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
      goto LABEL_55;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_55;
    v19 = v8;
    if (objc_msgSend(v19, "length"))
      goto LABEL_26;
    HIDDisplayLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      __34__HIDDisplayPresetData_set_error___block_invoke_cold_1();

    v23 = objc_alloc(MEMORY[0x24BDD1540]);
    v24 = CFSTR("Invalid Block One Data");
LABEL_48:
    v27 = objc_msgSend(v23, "initWithDomain:code:userInfo:", v24, -536870206, 0);
    v28 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v29 = *(void **)(v28 + 40);
    *(_QWORD *)(v28 + 40) = v27;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    *a4 = 1;
    goto LABEL_49;
  }
  if (objc_msgSend(v7, "isEqualToString:", kHIDDisplayPresetFieldDataBlockTwoLengthKey))
  {
    v17 = *(void **)(a1 + 40);
    v18 = 12;
    goto LABEL_52;
  }
  if (objc_msgSend(v7, "isEqualToString:", kHIDDisplayPresetFieldDataBlockTwoKey))
  {
    objc_msgSend(*(id *)(a1 + 40), "getHIDElementForUsage:", 13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
      goto LABEL_55;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_55;
    v19 = v8;
    if (!objc_msgSend(v19, "length"))
    {
      HIDDisplayLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        __34__HIDDisplayPresetData_set_error___block_invoke_cold_1();

      v23 = objc_alloc(MEMORY[0x24BDD1540]);
      v24 = CFSTR("Invalid Block Two Data");
      goto LABEL_48;
    }
LABEL_26:
    objc_msgSend(v10, "setDataValue:", v19);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v10);
LABEL_49:

    goto LABEL_55;
  }
  if (objc_msgSend(v7, "isEqualToString:", kHIDDisplayPresetFieldValidKey))
  {
    v17 = *(void **)(a1 + 40);
    v18 = 6;
    goto LABEL_52;
  }
  if (objc_msgSend(v7, "isEqualToString:", kHIDDisplayPresetUniqueIDKey))
  {
    objc_msgSend(*(id *)(a1 + 40), "getHIDElementForUsage:", 14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
      goto LABEL_55;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_55;
    v19 = v8;
    if (!objc_msgSend(v19, "length"))
    {
      HIDDisplayLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        __34__HIDDisplayPresetData_set_error___block_invoke_cold_3();

      v23 = objc_alloc(MEMORY[0x24BDD1540]);
      v24 = CFSTR("Invalid Unique ID Data");
      goto LABEL_48;
    }
    goto LABEL_26;
  }
  if (objc_msgSend(v7, "isEqualToString:", kHIDDisplayPresetFieldWritableKey))
  {
    v17 = *(void **)(a1 + 40);
    v18 = 5;
    goto LABEL_52;
  }
LABEL_56:

}

- (NSData)uniqueID
{
  void *v3;
  HIDDisplayPresetInterface **p_deviceRef;
  id WeakRetained;
  int64_t index;
  char v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  NSObject *v14;
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  -[HIDDisplayPresetData hidDisplay](self, "hidDisplay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    p_deviceRef = &self->_deviceRef;
    WeakRetained = objc_loadWeakRetained((id *)&self->_deviceRef);
    index = self->_index;
    v16 = 0;
    v7 = objc_msgSend(WeakRetained, "setCurrentPresetIndex:error:", index, &v16);
    v8 = v16;

    if ((v7 & 1) != 0)
    {
      objc_msgSend(v3, "getHIDElementForUsage:", 14);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        v17[0] = v9;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v3, "extract:error:", v11, 0);

        if (v12)
        {
          -[NSObject dataValue](v10, "dataValue");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

          goto LABEL_14;
        }
      }
      else
      {
        HIDDisplayLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[HIDDisplayPresetData uniqueID].cold.1((id *)p_deviceRef, v14);

      }
    }
    else
    {
      HIDDisplayLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[HIDDisplayPresetData valid].cold.2();
    }
    v13 = 0;
    goto LABEL_13;
  }
  v13 = 0;
LABEL_14:

  return (NSData *)v13;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_deviceRef);
}

- (void)valid
{
  void *v0;
  id *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(v1);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_2161BB000, v2, v3, "%@ Failed set preset index %ld", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_1();
}

- (void)writable
{
  id v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = OUTLINED_FUNCTION_4(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_2161BB000, a2, v4, "%@ Preset data writable no associated element", v5);

  OUTLINED_FUNCTION_6();
}

- (void)set:(uint64_t)a1 error:.cold.1(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_2161BB000, v2, v3, "%@ Failed to update elements for preset index %ld", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_1();
}

- (void)set:(os_log_t)log error:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2161BB000, log, OS_LOG_TYPE_ERROR, "Skip Device Transaction due to previous issues", v1, 2u);
}

void __34__HIDDisplayPresetData_set_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_2161BB000, v0, v1, "Invalid Block One Data %@ Cancel Device Transaction", v2);
  OUTLINED_FUNCTION_2();
}

void __34__HIDDisplayPresetData_set_error___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_2161BB000, v0, v1, "Invalid Unique ID Data %@ Cancel Device Transaction", v2);
  OUTLINED_FUNCTION_2();
}

- (void)uniqueID
{
  id v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = OUTLINED_FUNCTION_4(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_2161BB000, a2, v4, "%@ Preset data uniqueID no associated element", v5);

  OUTLINED_FUNCTION_6();
}

@end
