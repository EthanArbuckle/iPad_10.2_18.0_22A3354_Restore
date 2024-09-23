@implementation CAFControlParameter

- (NSString)formatString
{
  return (NSString *)NSStringFromCharacteristicMetadataFormat(-[CAFControlParameter format](self, "format"));
}

- (CAFControlParameter)initWithConfig:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  CAFCachedDescription *v11;
  void *v12;
  CAFControlParameter *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CAFControlParameter;
  v5 = -[CAFControlParameter init](&v24, sel_init);
  if (!v5)
    goto LABEL_13;
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  v8 = (void *)*((_QWORD *)v5 + 2);
  *((_QWORD *)v5 + 2) = v7;

  if (!*((_QWORD *)v5 + 2))
  {
    CAFCharacteristicLogging();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[CAFControlParameter initWithConfig:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);

    goto LABEL_20;
  }
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("format"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9 && (objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;

  if (!v10)
  {
    CAFCharacteristicLogging();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[CAFControlParameter initWithConfig:].cold.2((uint64_t *)v5 + 2, v22);

LABEL_20:
    v13 = 0;
    goto LABEL_21;
  }
  *((_QWORD *)v5 + 3) = objc_msgSend(v10, "unsignedIntegerValue");
  *((_BYTE *)v5 + 8) = +[CAFCarConfiguration getBoolean:key:](CAFCarConfiguration, "getBoolean:key:", v4, CFSTR("supportsInvalid"));
  v11 = -[CAFCachedDescription initWithCacheable:]([CAFCachedDescription alloc], "initWithCacheable:", v5);
  v12 = (void *)*((_QWORD *)v5 + 4);
  *((_QWORD *)v5 + 4) = v11;

LABEL_13:
  v13 = (CAFControlParameter *)v5;
LABEL_21:

  return v13;
}

+ (id)parseParameters:(id)a3
{
  id v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v3 = a3;
  if (v3)
  {
    v7 = 0;
    v8 = &v7;
    v9 = 0x3032000000;
    v10 = __Block_byref_object_copy__0;
    v11 = __Block_byref_object_dispose__0;
    v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __39__CAFControlParameter_parseParameters___block_invoke;
    v6[3] = &unk_2508FE8E0;
    v6[4] = &v7;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);
    v4 = (id)v8[5];
    _Block_object_dispose(&v7, 8);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void __39__CAFControlParameter_parseParameters___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  id v7;
  CAFControlParameter *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;

  v6 = a2;
  objc_opt_class();
  v7 = v6;
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = -[CAFControlParameter initWithConfig:]([CAFControlParameter alloc], "initWithConfig:", v7);
    if (v8)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v8);
    }
    else
    {
      CAFServiceLogging();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        __39__CAFControlParameter_parseParameters___block_invoke_cold_2(v19, v20, v21, v22, v23, v24, v25, v26);

      v27 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v28 = *(void **)(v27 + 40);
      *(_QWORD *)(v27 + 40) = 0;

      *a4 = 1;
    }

  }
  else
  {

    CAFServiceLogging();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __39__CAFControlParameter_parseParameters___block_invoke_cold_1(v9, v10, v11, v12, v13, v14, v15, v16);

    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = 0;

    *a4 = 1;
  }

}

- (id)currentDescriptionForCache:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  const __CFString *v9;
  void *v10;

  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = objc_opt_class();
  -[CAFControlParameter name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFControlParameter formatString](self, "formatString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CAFControlParameter supportsInvalid](self, "supportsInvalid");
  v9 = &stru_2508FF798;
  if (v8)
    v9 = CFSTR("?");
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p %@ %@%@>"), v5, self, v6, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)format
{
  return self->_format;
}

- (BOOL)supportsInvalid
{
  return self->_supportsInvalid;
}

- (CAFCachedDescription)cachedDescription
{
  return self->_cachedDescription;
}

- (void)setCachedDescription:(id)a3
{
  objc_storeStrong((id *)&self->_cachedDescription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedDescription, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)initWithConfig:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_1(&dword_237717000, a1, a3, "Parsing control parameter failed for name", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_15();
}

- (void)initWithConfig:(uint64_t *)a1 .cold.2(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_237717000, a2, OS_LOG_TYPE_ERROR, "Parsing control parameter: %@ failed for format", (uint8_t *)&v3, 0xCu);
}

void __39__CAFControlParameter_parseParameters___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_1(&dword_237717000, a1, a3, "Parsing control parameter config failed", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_15();
}

void __39__CAFControlParameter_parseParameters___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_1(&dword_237717000, a1, a3, "Creating control parameter failed", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_15();
}

@end
