@implementation HIDDisplayUserAdjustmentInterface

- (HIDDisplayUserAdjustmentInterface)initWithContainerID:(id)a3
{
  id v4;
  HIDDisplayUserAdjustmentInterface *v5;
  HIDDisplayUserAdjustmentInterface *v6;
  HIDDisplayUserAdjustmentInterface *v7;
  NSObject *v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HIDDisplayUserAdjustmentInterface;
  v5 = -[HIDDisplayInterface initWithContainerID:](&v10, sel_initWithContainerID_, v4);
  v6 = v5;
  if (!v5)
  {
    HIDDisplayLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[HIDDisplayUserAdjustmentInterface initWithContainerID:].cold.1();
    goto LABEL_9;
  }
  if (!-[HIDDisplayUserAdjustmentInterface setupInterface](v5, "setupInterface"))
  {
    HIDDisplayLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[HIDDisplayUserAdjustmentInterface initWithContainerID:].cold.2();
LABEL_9:

    v7 = 0;
    goto LABEL_4;
  }
  v7 = v6;
LABEL_4:

  return v7;
}

- (HIDDisplayUserAdjustmentInterface)initWithService:(unsigned int)a3
{
  uint64_t v3;
  HIDDisplayUserAdjustmentInterface *v4;
  HIDDisplayUserAdjustmentInterface *v5;
  HIDDisplayUserAdjustmentInterface *v6;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  objc_super v21;

  v3 = *(_QWORD *)&a3;
  v21.receiver = self;
  v21.super_class = (Class)HIDDisplayUserAdjustmentInterface;
  v4 = -[HIDDisplayInterface initWithService:](&v21, sel_initWithService_);
  v5 = v4;
  if (!v4)
  {
    HIDDisplayLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[HIDDisplayUserAdjustmentInterface initWithService:].cold.1(v3, v8, v9, v10, v11, v12, v13, v14);
    goto LABEL_9;
  }
  if (!-[HIDDisplayUserAdjustmentInterface setupInterface](v4, "setupInterface"))
  {
    HIDDisplayLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[HIDDisplayUserAdjustmentInterface initWithService:].cold.2(v3, v8, v15, v16, v17, v18, v19, v20);
LABEL_9:

    v6 = 0;
    goto LABEL_4;
  }
  v6 = v5;
LABEL_4:

  return v6;
}

- (id)getHIDDevices
{
  return -[HIDDisplayInterface getHIDDevicesForMatching:](self, "getHIDDevicesForMatching:", &unk_24D500488);
}

- (BOOL)setupInterface
{
  void *v3;
  void *v4;
  BOOL v5;

  -[HIDDisplayInterface getDeviceElements:](self, "getDeviceElements:", &unk_24D5004B0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    objc_storeStrong((id *)&self->_usageElementMap, v4);
    v5 = 1;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)valid
{
  NSDictionary *usageElementMap;
  uint64_t v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  NSObject *v8;
  BOOL v9;
  NSObject *v10;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  usageElementMap = self->_usageElementMap;
  if (!usageElementMap
    || (-[NSDictionary objectForKey:](usageElementMap, "objectForKey:", &unk_24D500158),
        (v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    HIDDisplayLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[HIDDisplayUserAdjustmentInterface valid].cold.1();
    goto LABEL_10;
  }
  v5 = (void *)v4;
  v13[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v7 = -[HIDDisplayInterface extract:error:](self, "extract:error:", v6, &v12);
  v8 = v12;

  if (!v7)
  {
    HIDDisplayLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[HIDDisplayUserAdjustmentInterface valid].cold.2();

LABEL_10:
    v9 = 0;
    goto LABEL_11;
  }
  v9 = objc_msgSend(v5, "integerValue") != 0;

LABEL_11:
  return v9;
}

- (BOOL)invalidate:(id *)a3
{
  NSDictionary *usageElementMap;
  void *v6;
  NSObject *v7;
  void *v8;
  BOOL v9;
  void *v11;
  uint8_t buf[4];
  HIDDisplayUserAdjustmentInterface *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  usageElementMap = self->_usageElementMap;
  if (usageElementMap)
  {
    -[NSDictionary objectForKey:](usageElementMap, "objectForKey:", &unk_24D500158);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  HIDDisplayLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = self;
    _os_log_impl(&dword_2161BB000, v7, OS_LOG_TYPE_DEFAULT, "%@ invalidate user adjustement", buf, 0xCu);
  }

  if (v6)
  {
    objc_msgSend(v6, "setIntegerValue:", 0);
    v11 = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HIDDisplayInterface commit:error:](self, "commit:error:", v8, a3);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)set:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  BOOL v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD v16[7];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  _BYTE buf[24];
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  v22 = (id)0xAAAAAAAAAAAAAAAALL;
  v22 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  HIDDisplayLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v6;
    _os_log_impl(&dword_2161BB000, v7, OS_LOG_TYPE_INFO, "%@ set adjustment %@", buf, 0x16u);
  }

  -[HIDDisplayUserAdjustmentInterface get:](self, "get:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8 == 0;

  if (v9)
  {
    HIDDisplayLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[HIDDisplayUserAdjustmentInterface set:error:].cold.1();

  }
  else
  {
    if (v6)
    {
      -[NSDictionary objectForKey:](self->_usageElementMap, "objectForKey:", &unk_24D500158);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        objc_msgSend(v10, "setIntegerValue:", 1);
        objc_msgSend((id)v18[5], "addObject:", v11);
      }
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v24 = __Block_byref_object_copy__0;
      v25 = __Block_byref_object_dispose__0;
      v26 = 0;
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __47__HIDDisplayUserAdjustmentInterface_set_error___block_invoke;
      v16[3] = &unk_24D4FF2C8;
      v16[4] = self;
      v16[5] = &v17;
      v16[6] = buf;
      objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v16);
      if (objc_msgSend((id)v18[5], "count"))
      {
        v12 = -[HIDDisplayInterface commit:error:](self, "commit:error:", v18[5], a4);
        if (!a4)
          goto LABEL_21;
      }
      else
      {
        HIDDisplayLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[HIDDisplayUserAdjustmentInterface set:error:].cold.2();

        if (!a4)
        {
          v12 = 0;
          goto LABEL_21;
        }
        v12 = 0;
        *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("Invalid argument"), -536870206, 0);
      }
      *a4 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
LABEL_21:
      _Block_object_dispose(buf, 8);

      goto LABEL_22;
    }
    if (a4)
    {
      v12 = 0;
      *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("Invalid argument"), -536870206, 0);
      goto LABEL_22;
    }
  }
  v12 = 0;
LABEL_22:
  _Block_object_dispose(&v17, 8);

  return v12;
}

void __47__HIDDisplayUserAdjustmentInterface_set_error___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int16 v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "isEqualToString:", kHIDDisplayUserAdjustmentDescriptionKey))
  {
    v7 = *(void **)(a1[4] + 40);
    if (v7)
    {
      objc_msgSend(v7, "objectForKey:", &unk_24D500170);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v6, "dataUsingEncoding:", 2483028224);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v9;
          if (!v9 || !objc_msgSend(v9, "length"))
          {
            v18 = 0;
            v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", &v18, 2);

            HIDDisplayLog();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v20 = v6;
              _os_log_impl(&dword_2161BB000, v12, OS_LOG_TYPE_DEFAULT, "Invalid Description %@ , Converting it to 2 byte null value", buf, 0xCu);
            }

            v10 = (id)v11;
          }
          goto LABEL_15;
        }
      }
      goto LABEL_18;
    }
LABEL_17:
    v8 = 0;
    goto LABEL_18;
  }
  if (!objc_msgSend(v5, "isEqualToString:", kHIDDisplayUserAdjustmentInformationKey))
    goto LABEL_17;
  v13 = *(void **)(a1[4] + 40);
  if (!v13)
    goto LABEL_17;
  objc_msgSend(v13, "objectForKey:", &unk_24D500188);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v6;
      if (!objc_msgSend(v10, "length"))
      {
        HIDDisplayLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          __47__HIDDisplayUserAdjustmentInterface_set_error___block_invoke_cold_1();

        v15 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("Invalid User Adjsutment Information"), -536870206, 0);
        v16 = *(_QWORD *)(a1[6] + 8);
        v17 = *(void **)(v16 + 40);
        *(_QWORD *)(v16 + 40) = v15;

        goto LABEL_16;
      }
LABEL_15:
      objc_msgSend(v8, "setDataValue:", v10);
      objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "addObject:", v8);
LABEL_16:

    }
  }
LABEL_18:

}

- (id)get:(id *)a3
{
  id v5;
  uint64_t v6;
  char v7;
  char v8;
  NSDictionary *usageElementMap;
  void *v10;
  void *v11;
  __int128 v12;
  uint64_t v13;
  char v14;
  char v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  const __CFString *v21;
  NSObject *v22;
  HIDDisplayUserAdjustmentInterface *v23;
  __CFString *v24;
  void *v25;
  void *v26;
  HIDDisplayUserAdjustmentInterface *v27;
  id v28;
  void *v29;
  NSObject *v30;
  BOOL v31;
  __int128 v33;
  id v34;
  uint8_t buf[4];
  HIDDisplayUserAdjustmentInterface *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v34 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v6 = 0;
  v7 = 1;
  do
  {
    v8 = v7;
    usageElementMap = self->_usageElementMap;
    if (usageElementMap)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", qword_2161C3C00[v6]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary objectForKey:](usageElementMap, "objectForKey:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v5, "addObject:", v11);

      }
    }
    v7 = 0;
    v6 = 1;
  }
  while ((v8 & 1) != 0);
  if (!-[HIDDisplayInterface extract:error:](self, "extract:error:", v5, a3))
  {
    v28 = 0;
    v29 = v34;
    goto LABEL_29;
  }
  v13 = 0;
  v14 = 1;
  *(_QWORD *)&v12 = 138412290;
  v33 = v12;
  do
  {
    v15 = v14;
    v16 = self->_usageElementMap;
    if (v16)
    {
      v17 = qword_2161C3C00[v13];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKey:", v18);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        if (v17 == 3)
        {
          objc_msgSend(v16, "dataValue");
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v26)
          {
            HIDDisplayLog();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v16, "dataValue");
              v27 = (HIDDisplayUserAdjustmentInterface *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v33;
              v36 = v27;
              _os_log_impl(&dword_2161BB000, v20, OS_LOG_TYPE_DEFAULT, "Invalid user adjustment information %@", buf, 0xCu);

            }
            goto LABEL_20;
          }
          objc_msgSend(v16, "dataValue");
          v20 = objc_claimAutoreleasedReturnValue();
          v24 = kHIDDisplayUserAdjustmentInformationKey;
          v25 = v34;
          v21 = (const __CFString *)v20;
        }
        else
        {
          if (v17 != 2)
            goto LABEL_21;
          objc_msgSend(v16, "dataValue");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          getUnicharStringFromData(v19);
          v20 = objc_claimAutoreleasedReturnValue();

          v21 = (const __CFString *)v20;
          if (!v20)
          {
            HIDDisplayLog();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v16, "dataValue");
              v23 = (HIDDisplayUserAdjustmentInterface *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v33;
              v36 = v23;
              _os_log_impl(&dword_2161BB000, v22, OS_LOG_TYPE_DEFAULT, "Invalid / Empty user adjustment description %@", buf, 0xCu);

            }
            v21 = &stru_24D4FF448;
          }
          v24 = kHIDDisplayUserAdjustmentDescriptionKey;
          v25 = v34;
        }
        objc_msgSend(v25, "setObject:forKeyedSubscript:", v21, v24, v33);
LABEL_20:

      }
    }
LABEL_21:

    v14 = 0;
    v13 = 1;
  }
  while ((v15 & 1) != 0);
  HIDDisplayLog();
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
  v29 = v34;
  if (v31)
  {
    *(_DWORD *)buf = 138412546;
    v36 = self;
    v37 = 2114;
    v38 = v34;
    _os_log_impl(&dword_2161BB000, v30, OS_LOG_TYPE_DEFAULT, "%@ get user adjustment returned data %{public}@", buf, 0x16u);
  }

  v28 = v34;
LABEL_29:

  return v28;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usageElementMap, 0);
}

- (void)initWithContainerID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_2161BB000, v0, v1, "Failed to create HIDDisplayUserAdjustmentInterface for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithContainerID:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_2161BB000, v0, v1, "Failed to setup HIDDisplayUserAdjustmentInterface for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithService:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_2161BB000, a2, a3, "Failed to create HIDDisplayUserAdjustmentInterface for %d", a5, a6, a7, a8, 0);
}

- (void)initWithService:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_2161BB000, a2, a3, "Failed to setup HIDDisplayUserAdjustmentInterface for %d", a5, a6, a7, a8, 0);
}

- (void)valid
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_2161BB000, v1, OS_LOG_TYPE_ERROR, "%@ failed to extract valid element value with error %@", v2, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)set:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_2161BB000, v0, v1, "%@ Failed to update elements", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)set:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_2161BB000, v0, v1, "%@ no matching element to set ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __47__HIDDisplayUserAdjustmentInterface_set_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_2161BB000, v0, v1, "Invalid User Adjsutment Information %@ Cancel Device Transaction", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
