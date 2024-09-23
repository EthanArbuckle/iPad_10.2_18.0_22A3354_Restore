@implementation COConditionBundle

- (COConditionBundle)initWithURL:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)COConditionBundle;
  return -[COConditionBundle initWithURL:](&v4, sel_initWithURL_, a3);
}

- (BOOL)loadAndReturnError:(id *)a3
{
  BOOL v5;
  id v6;
  void *v7;
  unsigned __int8 v8;
  id v9;
  BOOL v10;
  objc_super v12;
  id v13;
  id v14;

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    -[COConditionBundle loadAndReturnError:].cold.3(self);
  v14 = 0;
  v5 = -[COConditionBundle isRunnable:](self, "isRunnable:", &v14);
  v6 = v14;
  v7 = v6;
  if (v5)
  {
    v12.receiver = self;
    v12.super_class = (Class)COConditionBundle;
    v13 = v6;
    v8 = -[COConditionBundle loadAndReturnError:](&v12, sel_loadAndReturnError_, &v13);
    v9 = v13;

    if ((v8 & 1) != 0)
    {
      v10 = 1;
      goto LABEL_14;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[COConditionBundle loadAndReturnError:].cold.1(self);
    v7 = v9;
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[COConditionBundle loadAndReturnError:].cold.2(self);
  }
  if (a3)
  {
    v9 = objc_retainAutorelease(v7);
    v10 = 0;
    *a3 = v9;
  }
  else
  {
    v10 = 0;
    v9 = v7;
  }
LABEL_14:

  return v10;
}

- (id)conditions
{
  void *v3;
  id v4;
  const char **v5;
  const char **v6;
  unint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  objc_class *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  id v17;
  id v18;
  id v19;
  unsigned int outCount;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  outCount = 0;
  if ((-[COConditionBundle isLoaded](self, "isLoaded") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[COConditionBundle executablePath](self, "executablePath");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = objc_copyClassNamesForImage((const char *)objc_msgSend(v4, "UTF8String"), &outCount);
    v6 = v5;
    if (outCount)
    {
      v7 = 0;
      v8 = 0;
      v9 = 0;
      v10 = MEMORY[0x24BDACB70];
      do
      {
        v11 = v8;

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v6[v7]);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = 0;
        v12 = -[COConditionBundle classNamed:error:](self, "classNamed:error:", v8, &v19);
        v9 = v19;
        v13 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
        if (v9)
        {
          if (v13)
          {
            -[COConditionBundle bundlePath](self, "bundlePath");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v22 = v14;
            v23 = 2112;
            v24 = v8;
            v25 = 2112;
            v26 = v9;
            _os_log_debug_impl(&dword_21F8CF000, v10, OS_LOG_TYPE_DEBUG, "Bundle: %@ skipping Class: %@ - %@", buf, 0x20u);

          }
        }
        else
        {
          if (v13)
          {
            -[COConditionBundle bundlePath](self, "bundlePath");
            v18 = v4;
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v22 = v15;
            v23 = 2112;
            v24 = v8;
            _os_log_debug_impl(&dword_21F8CF000, v10, OS_LOG_TYPE_DEBUG, "Bundle: %@ found COCondition Class: %@", buf, 0x16u);

            v4 = v18;
          }
          objc_msgSend(v3, "addObject:", v12);
        }
        ++v7;
      }
      while (v7 < outCount);

    }
    else if (!v5)
    {
LABEL_17:
      v17 = v3;

      return v17;
    }
    free(v6);
    goto LABEL_17;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[COConditionBundle conditions].cold.1();
  return 0;
}

- (Class)classNamed:(id)a3 error:(id *)a4
{
  __CFString *v6;
  objc_class *v7;
  objc_class *v8;
  id v9;
  __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  objc_class *v20;
  objc_super v22;
  uint8_t buf[4];
  const __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = (__CFString *)a3;
  if (v6)
  {
    v22.receiver = self;
    v22.super_class = (Class)COConditionBundle;
    v7 = -[COConditionBundle classNamed:](&v22, sel_classNamed_, v6);
  }
  else
  {
    v7 = (objc_class *)-[COConditionBundle principalClass](self, "principalClass");
  }
  v8 = v7;
  if (!v7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      if (v6)
        v14 = v6;
      else
        v14 = CFSTR("principalClass");
      *(_DWORD *)buf = 138412290;
      v24 = v14;
      _os_log_error_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Class: %@ not found", buf, 0xCu);
    }
    else if (v6)
    {
      v14 = v6;
    }
    else
    {
      v14 = CFSTR("principalClass");
    }
    createConditionInducerError((uint64_t)"-[COConditionBundle classNamed:error:]", 104, 1, 0, CFSTR("Class: %@ not found"), v11, v12, v13, (uint64_t)v14);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = &stru_24E4716F0;
    if (!a4)
    {
LABEL_22:
      v8 = 0;
      goto LABEL_24;
    }
LABEL_12:
    v9 = objc_retainAutorelease(v9);
    v8 = 0;
    *a4 = v9;
    goto LABEL_24;
  }
  if ((-[objc_class isSubclassOfClass:](v7, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
  {
    if ((-[objc_class instancesRespondToSelector:](v8, "instancesRespondToSelector:", sel_setUp) & 1) != 0)
    {
      v10 = &stru_24E4716F0;
    }
    else
    {
      objc_msgSend(&stru_24E4716F0, "stringByAppendingString:", CFSTR(" setUp"));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    if ((-[objc_class instancesRespondToSelector:](v8, "instancesRespondToSelector:", sel_tearDown) & 1) == 0)
    {
      -[__CFString stringByAppendingString:](v10, "stringByAppendingString:", CFSTR(" tearDown"));
      v15 = objc_claimAutoreleasedReturnValue();

      v10 = (__CFString *)v15;
    }
    if ((-[objc_class instancesRespondToSelector:](v8, "instancesRespondToSelector:", sel_active) & 1) == 0)
    {
      -[__CFString stringByAppendingString:](v10, "stringByAppendingString:", CFSTR(" active"));
      v16 = objc_claimAutoreleasedReturnValue();

      v10 = (__CFString *)v16;
    }
    if (!-[__CFString length](v10, "length"))
    {
      v9 = 0;
      goto LABEL_24;
    }
    createConditionInducerError((uint64_t)"-[COConditionBundle classNamed:error:]", 130, 3, 0, CFSTR("Class %@, does not conform to required COConditionProtocol. Missing methods: %@"), v17, v18, v19, (uint64_t)v6);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (!a4)
      goto LABEL_22;
    goto LABEL_12;
  }
  v9 = 0;
  v10 = &stru_24E4716F0;
LABEL_24:
  v20 = v8;

  return v20;
}

- (Class)classNamed:(id)a3
{
  return -[COConditionBundle classNamed:error:](self, "classNamed:error:", a3, 0);
}

- (BOOL)isRunnable:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t i;
  void *v17;
  void *v18;
  char v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  BOOL v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v34;
  id *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t v41[4];
  uint64_t v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  -[COConditionBundle objectForInfoDictionaryKey:](self, "objectForInfoDictionaryKey:", CFSTR("RequiresRootPrivileges"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  isNSNumber(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[COConditionBundle isRunnable:].cold.5(self);

    v5 = (void *)MEMORY[0x24BDBD1C8];
  }
  if (objc_msgSend(v5, "BOOLValue"))
  {
    NSUserName();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("root"));

    if ((v8 & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[COConditionBundle isRunnable:].cold.4(self);
      -[COConditionBundle bundlePath](self, "bundlePath");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      createConditionInducerError((uint64_t)"-[COConditionBundle isRunnable:]", 172, 5, 0, CFSTR("%@ must be loaded as root."), v30, v31, v32, (uint64_t)v29);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = 0;
      v9 = 0;
      goto LABEL_33;
    }
  }
  -[COConditionBundle objectForInfoDictionaryKey:](self, "objectForInfoDictionaryKey:", CFSTR("RequiresEntitlements"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  isNSDictionary(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[COConditionBundle isRunnable:].cold.3(self);

    v9 = (id)MEMORY[0x24BDBD1B8];
    goto LABEL_13;
  }
  if (v9)
  {
LABEL_13:
    v34 = v5;
    v35 = a3;
    v11 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v9 = v9;
    v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v38;
      v15 = MEMORY[0x24BDACB70];
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v38 != v14)
            objc_enumerationMutation(v9);
          v17 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          objc_msgSend(v9, "valueForKey:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = 0;
          v19 = hasEntitlementValue(v17, v18, &v36);
          v20 = v36;

          if ((v19 & 1) == 0)
          {
            objc_msgSend(v9, "valueForKey:", v17);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setObject:forKeyedSubscript:", v21, v17);

            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
              -[COConditionBundle isRunnable:].cold.2(v41, (uint64_t)v20, &v42);
          }

        }
        v13 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
      }
      while (v13);
    }

    v5 = v34;
    a3 = v35;
    goto LABEL_24;
  }
  v11 = 0;
LABEL_24:
  if (!objc_msgSend(v11, "count"))
  {
    v27 = 0;
    v28 = 1;
    if (!a3)
      goto LABEL_35;
    goto LABEL_34;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[COConditionBundle isRunnable:].cold.1((uint64_t)v11, v22, v23);
  createConditionInducerError((uint64_t)"-[COConditionBundle isRunnable:]", 202, 5, 0, CFSTR("Missing required entitlements: %@"), v24, v25, v26, (uint64_t)v11);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_33:
  v28 = 0;
  if (a3)
LABEL_34:
    *a3 = objc_retainAutorelease(v27);
LABEL_35:

  return v28;
}

- (void)loadAndReturnError:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "bundlePath");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_21F8CF000, MEMORY[0x24BDACB70], v2, "Failed to load bundle at %@ - %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2();
}

- (void)loadAndReturnError:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "bundlePath");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_21F8CF000, MEMORY[0x24BDACB70], v2, "Bundle %@ is not runable in current environment - %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2();
}

- (void)loadAndReturnError:(void *)a1 .cold.3(void *a1)
{
  void *v1;
  int v2;
  void *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "bundlePath");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = 138412290;
  v3 = v1;
  _os_log_debug_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "Loading Bundle %@", (uint8_t *)&v2, 0xCu);

  OUTLINED_FUNCTION_2();
}

- (void)conditions
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Bundle not loaded", v0, 2u);
}

- (void)isRunnable:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_1_1(&dword_21F8CF000, MEMORY[0x24BDACB70], a3, "Missing required entitlements: %@", (uint8_t *)&v3);
}

- (void)isRunnable:(_QWORD *)a3 .cold.2(uint8_t *a1, uint64_t a2, _QWORD *a3)
{
  *(_DWORD *)a1 = 138412290;
  *a3 = a2;
  OUTLINED_FUNCTION_1_1(&dword_21F8CF000, MEMORY[0x24BDACB70], (uint64_t)a3, "%@", a1);
}

- (void)isRunnable:(void *)a1 .cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "bundlePath");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_21F8CF000, MEMORY[0x24BDACB70], v2, "%@/Info.plist missing key:value '%@':<NSDictionary>'. Assuming no entitlements.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2();
}

- (void)isRunnable:(void *)a1 .cold.4(void *a1)
{
  void *v1;
  uint64_t v2;
  int v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "bundlePath");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 138412290;
  v4 = v1;
  OUTLINED_FUNCTION_1_1(&dword_21F8CF000, MEMORY[0x24BDACB70], v2, "%@ must be loaded as root.", (uint8_t *)&v3);

  OUTLINED_FUNCTION_2();
}

- (void)isRunnable:(void *)a1 .cold.5(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "bundlePath");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_21F8CF000, MEMORY[0x24BDACB70], v2, "%@/Info.plist missing '%@:<NSNumber>'. Assuming ROOT required.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2();
}

@end
