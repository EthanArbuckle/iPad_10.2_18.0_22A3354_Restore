@implementation BMEventBase

+ (id)convertValue:(id)a3 toType:(int64_t)a4
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = a3;
  v8 = v7;
  if (v7)
  {
    switch(a4)
    {
      case 0:
        v9 = v7;
        goto LABEL_14;
      case 1:
        v11 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend(v7, "doubleValue");
        objc_msgSend(v11, "dateWithTimeIntervalSinceReferenceDate:");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      case 2:
        v12 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend(v7, "doubleValue");
        objc_msgSend(v12, "dateWithTimeIntervalSince1970:");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      case 3:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v8);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", objc_msgSend(objc_retainAutorelease(v8), "bytes"));
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("BMEventBase.m"), 190, CFSTR("Unexpected UUID value: %@"), v8);

LABEL_13:
            v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v8);
          }
        }
LABEL_14:
        a1 = v9;
        break;
      case 4:
        goto LABEL_13;
      default:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("BMEventBase.m"), 195, CFSTR("Unknown converted type: %ld"), a4);

        break;
    }
  }
  else
  {
    a1 = 0;
  }

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__validators, 0);
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->__validators;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v9 = v8;
          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (BMEventBase)init
{
  BMEventBase *v2;
  BMEventBase *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BMEventBase;
  v2 = -[BMEventBase init](&v5, sel_init);
  if (v2 && -[BMEventBase isMemberOfClass:](v2, "isMemberOfClass:", objc_opt_class()))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      -[BMEventBase init].cold.1();
    v3 = 0;
  }
  else
  {
    v3 = v2;
  }

  return v3;
}

- (void)set_validators:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)valueForKeyPath:(id)a3
{
  NSString *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_super v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (NSString *)a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->__validators;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
        NSSelectorFromString(v4);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v10, "valueForKey:", v4);
          v11 = objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            v12 = (void *)v11;

            goto LABEL_12;
          }
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }

  v14.receiver = self;
  v14.super_class = (Class)BMEventBase;
  -[BMEventBase valueForKeyPath:](&v14, sel_valueForKeyPath_, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v12;
}

+ (NSArray)columns
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

+ (NSArray)propertyDefinitions
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

+ (NSArray)protoFields
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

+ (NSArray)validKeyPaths
{
  return (NSArray *)&unk_1E26D36E0;
}

- (BOOL)isValidWithContext:(id)a3 error:(id *)a4
{
  id v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t i;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = self->__validators;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v7);
        v10 |= objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "isValidWithContext:error:", v6, a4, (_QWORD)v15) ^ 1;
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
    v13 = v10 ^ 1;
  }
  else
  {
    v13 = 1;
  }

  return v13 & 1;
}

- (BOOL)isCompleteWithContext:(id)a3 error:(id *)a4
{
  id v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t i;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = self->__validators;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v7);
        v10 |= objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "isCompleteWithContext:error:", v6, a4, (_QWORD)v15) ^ 1;
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
    v13 = v10 ^ 1;
  }
  else
  {
    v13 = 1;
  }

  return v13 & 1;
}

- (id)jsonDictionary
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (id)json
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  BOOL v7;
  NSObject *v8;
  id v9;
  id v11;

  -[BMEventBase jsonDictionary](self, "jsonDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v3, 0, &v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v11;
  v6 = v5;
  if (v4)
    v7 = v5 == 0;
  else
    v7 = 0;
  if (v7)
  {
    v9 = v4;
  }
  else
  {
    __biome_log_for_category();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[BMEventBase json].cold.1((uint64_t)self, (uint64_t)v6, v8);

    v9 = 0;
  }

  return v9;
}

- (NSArray)_validators
{
  return self->__validators;
}

- (void)init
{
  objc_class *v0;
  void *v1;
  int v2;
  void *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = 138412290;
  v3 = v1;
  _os_log_fault_impl(&dword_18D810000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Attempt to instantiate pure-virtual base class %@", (uint8_t *)&v2, 0xCu);

  OUTLINED_FUNCTION_0_0();
}

- (void)json
{
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = 138412546;
  v6 = objc_opt_class();
  v7 = 2112;
  v8 = a2;
  _os_log_error_impl(&dword_18D810000, a3, OS_LOG_TYPE_ERROR, "Failed to serialize event %@ to JSON: %@", (uint8_t *)&v5, 0x16u);
  OUTLINED_FUNCTION_0_0();
}

@end
