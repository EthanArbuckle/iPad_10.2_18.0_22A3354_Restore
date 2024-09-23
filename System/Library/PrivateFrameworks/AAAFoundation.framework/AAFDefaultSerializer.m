@implementation AAFDefaultSerializer

- (id)dictionaryFromObject:(id)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  id v8;

  v8 = 0;
  -[AAFDefaultSerializer dictionaryFromObject:error:](self, "dictionaryFromObject:error:", a3, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
  if (v5)
  {
    _AAFLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[AAFDefaultSerializer dictionaryFromObject:].cold.1(self);

  }
  return v4;
}

- (id)dictionaryFromObject:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
    goto LABEL_11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "dataUsingEncoding:", 4);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && !objc_msgSend(v6, "length"))
    goto LABEL_11;
  -[AAFDefaultSerializer _dictionaryFromObject:error:](self, "_dictionaryFromObject:error:", v6, a4);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (a4)
  {
    if (!*a4)
    {
      if (v8)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v10 = (void *)MEMORY[0x1E0CB3940];
          -[AAFDefaultSerializer _className](self, "_className");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = (objc_class *)objc_opt_class();
          NSStringFromClass(v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "stringWithFormat:", CFSTR("[%@] result [%@] was not in the expected format (NSDictionary)"), v11, v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v15 = (void *)MEMORY[0x1E0CB35C8];
          v18 = *MEMORY[0x1E0CB2D50];
          v19[0] = v14;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("AAFSerializationError"), -702, v16);
          *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_11:
          v9 = 0;
        }
      }
    }
  }

  return v9;
}

- (id)dataFromDictionary:(id)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  id v8;

  v8 = 0;
  -[AAFDefaultSerializer dataFromDictionary:error:](self, "dataFromDictionary:error:", a3, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
  if (v5)
  {
    _AAFLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[AAFDefaultSerializer dataFromDictionary:].cold.1(self);

  }
  return v4;
}

- (id)dataFromDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    -[AAFDefaultSerializer _dataFromDictionary:error:](self, "_dataFromDictionary:error:", v6, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)stringFromDictionary:(id)a3
{
  void *v4;
  void *v5;

  -[AAFDefaultSerializer dataFromDictionary:](self, "dataFromDictionary:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAFDefaultSerializer stringFromData:](self, "stringFromData:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)stringFromData:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v3, 4);
  else
    v4 = 0;

  return v4;
}

- (id)_className
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)_raiseException:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Abstract method [%@] must have override in AAFDefaultSerializer subclass."), a3);
}

- (NSArray)mediaTypes
{
  void *v3;

  NSStringFromSelector(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAFDefaultSerializer _raiseException:](self, "_raiseException:", v3);

  return 0;
}

- (id)_dictionaryFromObject:(id)a3 error:(id *)a4
{
  void *v5;

  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAFDefaultSerializer _raiseException:](self, "_raiseException:", v5);

  return 0;
}

- (id)_dataFromDictionary:(id)a3 error:(id *)a4
{
  void *v5;

  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAFDefaultSerializer _raiseException:](self, "_raiseException:", v5);

  return 0;
}

- (void)dictionaryFromObject:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "_className");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1D51A2000, v2, v3, "[%@] unable to parse data, error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)dataFromDictionary:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "_className");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1D51A2000, v2, v3, "[%@] serialization failed, error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

@end
