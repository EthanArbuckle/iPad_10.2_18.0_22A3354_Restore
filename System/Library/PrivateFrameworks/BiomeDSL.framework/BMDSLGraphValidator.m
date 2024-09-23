@implementation BMDSLGraphValidator

- (BOOL)passthrough
{
  return self->_passthrough;
}

- (BOOL)isStreamTypeAllowed:(unint64_t)a3
{
  NSSet *allowedStreamTypes;
  void *v4;

  allowedStreamTypes = self->_allowedStreamTypes;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(allowedStreamTypes) = -[NSSet containsObject:](allowedStreamTypes, "containsObject:", v4);

  return (char)allowedStreamTypes;
}

+ (id)currentProcessValidator
{
  id v2;

  v2 = (id)_currentProcessValidator;
  if (!v2)
  {
    +[BMDSLGraphValidator passthroughValidator](BMDSLGraphValidator, "passthroughValidator");
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (NSSet)validKeyPaths
{
  return self->_validKeyPaths;
}

+ (id)passthroughValidator
{
  BMDSLGraphValidator *v2;

  v2 = objc_alloc_init(BMDSLGraphValidator);
  v2->_passthrough = 1;
  return v2;
}

+ (void)setCurrentProcessValidator:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__BMDSLGraphValidator_setCurrentProcessValidator___block_invoke;
  block[3] = &unk_1E5E363A8;
  v7 = v3;
  v4 = setCurrentProcessValidator__onceToken;
  v5 = v3;
  if (v4 != -1)
    dispatch_once(&setCurrentProcessValidator__onceToken, block);

}

void __50__BMDSLGraphValidator_setCurrentProcessValidator___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)&_currentProcessValidator, *(id *)(a1 + 32));
}

- (BMDSLGraphValidator)init
{
  id v3;
  BMDSLGraphValidator *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E60]);
  v4 = -[BMDSLGraphValidator initWithValidKeyPaths:allowedOperations:allowedStreamTypes:eventStreamClassMapping:](self, "initWithValidKeyPaths:allowedOperations:allowedStreamTypes:eventStreamClassMapping:", v3, v3, v3, MEMORY[0x1E0C9AA70]);

  return v4;
}

- (BMDSLGraphValidator)initWithValidKeyPaths:(id)a3 allowedOperations:(id)a4 allowedStreamTypes:(id)a5 eventStreamClassMapping:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  BMDSLGraphValidator *v14;
  uint64_t v15;
  NSSet *validKeyPaths;
  uint64_t v17;
  NSSet *allowedOperations;
  uint64_t v19;
  NSSet *allowedStreamTypes;
  uint64_t v21;
  NSDictionary *eventStreamClassMapping;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)BMDSLGraphValidator;
  v14 = -[BMDSLGraphValidator init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    validKeyPaths = v14->_validKeyPaths;
    v14->_validKeyPaths = (NSSet *)v15;

    v17 = objc_msgSend(v11, "copy");
    allowedOperations = v14->_allowedOperations;
    v14->_allowedOperations = (NSSet *)v17;

    v19 = objc_msgSend(v12, "copy");
    allowedStreamTypes = v14->_allowedStreamTypes;
    v14->_allowedStreamTypes = (NSSet *)v19;

    v21 = objc_msgSend(v13, "copy");
    eventStreamClassMapping = v14->_eventStreamClassMapping;
    v14->_eventStreamClassMapping = (NSDictionary *)v21;

  }
  return v14;
}

- (BOOL)isExecutionAllowedForGraph:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x1AF4563F8]();
  if (-[BMDSLGraphValidator passthrough](self, "passthrough"))
  {
    __biome_log_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[BMDSLGraphValidator isExecutionAllowedForGraph:].cold.1();
LABEL_4:
    v7 = 1;
  }
  else
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v4, 0);
    if (-[NSObject count](v6, "count"))
    {
      while (1)
      {
        -[NSObject firstObject](v6, "firstObject");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject removeObjectAtIndex:](v6, "removeObjectAtIndex:", 0);
        objc_msgSend(v8, "name");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v9 || !-[NSSet containsObject:](self->_allowedOperations, "containsObject:", v9))
          break;
        objc_msgSend(v8, "upstreams");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject addObjectsFromArray:](v6, "addObjectsFromArray:", v10);

        if (!-[NSObject count](v6, "count"))
          goto LABEL_4;
      }
      __biome_log_for_category();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[BMDSLGraphValidator isExecutionAllowedForGraph:].cold.2();

    }
    v7 = 0;
  }

  objc_autoreleasePoolPop(v5);
  return v7;
}

- (Class)eventClassForString:(id)a3
{
  NSString *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;

  v4 = (NSString *)a3;
  if (-[BMDSLGraphValidator passthrough](self, "passthrough"))
  {
    __biome_log_for_category();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[BMDSLGraphValidator eventClassForString:].cold.1();

    NSClassFromString(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[BMDSLGraphValidator eventStreamClassMapping](self, "eventStreamClassMapping");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "objectForKeyedSubscript:", v4);

    if (v8)
    {
      -[BMDSLGraphValidator eventStreamClassMapping](self, "eventStreamClassMapping");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      __biome_log_for_category();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[BMDSLGraphValidator eventClassForString:].cold.2();

      v6 = 0;
    }
  }

  return (Class)v6;
}

+ (NSSet)genericValidKeyPaths
{
  return (NSSet *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", &unk_1E5E3BB40);
}

+ (NSSet)legacyValidKeyPaths
{
  return (NSSet *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", &unk_1E5E3BB58);
}

- (NSSet)allowedOperations
{
  return self->_allowedOperations;
}

- (NSSet)allowedStreamTypes
{
  return self->_allowedStreamTypes;
}

- (NSDictionary)eventStreamClassMapping
{
  return self->_eventStreamClassMapping;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventStreamClassMapping, 0);
  objc_storeStrong((id *)&self->_allowedStreamTypes, 0);
  objc_storeStrong((id *)&self->_allowedOperations, 0);
  objc_storeStrong((id *)&self->_validKeyPaths, 0);
}

- (void)isExecutionAllowedForGraph:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1AEB18000, v0, v1, "BMDSLGraphValidator allowing execution by passthrough for graph %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)isExecutionAllowedForGraph:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1AEB18000, v0, v1, "Encountered non-allowed operation %@ when checking validity of %@");
  OUTLINED_FUNCTION_1();
}

- (void)eventClassForString:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1AEB18000, v0, v1, "BMDSLGraphValidator looking up event class by passthrough for class string %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)eventClassForString:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1AEB18000, v0, v1, "BMDSLGraphValidator failed to find a valid class for event class string: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
