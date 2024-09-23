@implementation VSOpaqueAuthenticationToken

- (VSOpaqueAuthenticationToken)init
{
  VSOpaqueAuthenticationToken *v2;
  VSOpaqueAuthenticationToken *v3;
  NSString *body;
  uint64_t v5;
  NSDate *expirationDate;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VSOpaqueAuthenticationToken;
  v2 = -[VSOpaqueAuthenticationToken init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    body = v2->_body;
    v2->_body = (NSString *)&stru_1E93A8CC0;

    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v5 = objc_claimAutoreleasedReturnValue();
    expirationDate = v3->_expirationDate;
    v3->_expirationDate = (NSDate *)v5;

  }
  return v3;
}

- (VSOpaqueAuthenticationToken)initWithSerializedData:(id)a3
{
  id v4;
  VSOpaqueAuthenticationToken *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  objc_class *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  objc_class *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  objc_class *v24;
  void *v25;
  NSObject *v26;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;

  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The serializedData parameter must not be nil."));
  v5 = -[VSOpaqueAuthenticationToken init](self, "init");
  if (v5)
  {
    v31 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v4, 0, 0, &v31);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v31;
    if (v6)
    {
      v8 = v6;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v9 = (void *)MEMORY[0x1E0C99DA0];
          v10 = *MEMORY[0x1E0C99778];
          v11 = (objc_class *)objc_opt_class();
          NSStringFromClass(v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "raise:format:", v10, CFSTR("Unexpectedly, plist was %@, instead of NSDictionary."), v12);

        }
        v13 = v8;
        -[NSObject objectForKey:](v13, "objectForKey:", CFSTR("expirationDate"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14)
        {
          v16 = v14;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v29 = (void *)MEMORY[0x1E0C99DA0];
              v17 = *MEMORY[0x1E0C99778];
              v18 = (objc_class *)objc_opt_class();
              NSStringFromClass(v18);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "raise:format:", v17, CFSTR("Unexpectedly, expirationDate was %@, instead of NSDate."), v19);

            }
            -[VSOpaqueAuthenticationToken setExpirationDate:](v5, "setExpirationDate:", v16);
          }
          else
          {
            VSErrorLogObject();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              -[VSOpaqueAuthenticationToken initWithSerializedData:].cold.5();

          }
        }
        else
        {
          VSErrorLogObject();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            -[VSOpaqueAuthenticationToken initWithSerializedData:].cold.4();
        }

        -[NSObject objectForKey:](v13, "objectForKey:", CFSTR("body"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if (v21)
        {
          v23 = v21;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v30 = (void *)MEMORY[0x1E0C99DA0];
              v28 = *MEMORY[0x1E0C99778];
              v24 = (objc_class *)objc_opt_class();
              NSStringFromClass(v24);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "raise:format:", v28, CFSTR("Unexpectedly, body was %@, instead of NSString."), v25);

            }
            -[VSOpaqueAuthenticationToken setBody:](v5, "setBody:", v23);
          }
          else
          {
            VSErrorLogObject();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
              -[VSOpaqueAuthenticationToken initWithSerializedData:].cold.3();

          }
        }
        else
        {
          VSErrorLogObject();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            -[VSOpaqueAuthenticationToken initWithSerializedData:].cold.2();
        }

      }
      else
      {
        VSErrorLogObject();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          -[VSOpaqueAuthenticationToken initWithSerializedData:].cold.6();
      }

    }
    else
    {
      VSErrorLogObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[VSOpaqueAuthenticationToken initWithSerializedData:].cold.1();
    }

  }
  return v5;
}

- (BOOL)isValid
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "vs_currentDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSOpaqueAuthenticationToken expirationDate](self, "expirationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "vs_isAfter:", v3);

  return v5;
}

- (BOOL)isOpaque
{
  return 1;
}

- (BOOL)isFromUnsupportedProvider
{
  void *v2;
  BOOL v3;

  -[VSOpaqueAuthenticationToken body](self, "body");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") == 0;

  return v3;
}

- (NSData)serializedData
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v12;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[VSOpaqueAuthenticationToken expirationDate](self, "expirationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "forceUnwrapObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("expirationDate"));

  -[VSOpaqueAuthenticationToken body](self, "body");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("body"));

  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v3, 100, 0, &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v12;
  if (!v8)
  {
    VSErrorLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[VSOpaqueAuthenticationToken serializedData].cold.1();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Unable to serialize opaque authentication token."));
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The data parameter must not be nil."));
  }

  return (NSData *)v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[VSOpaqueAuthenticationToken serializedData](self, "serializedData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  VSOpaqueAuthenticationToken *v4;
  VSOpaqueAuthenticationToken *v5;
  VSOpaqueAuthenticationToken *v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  void *v10;
  VSOpaqueAuthenticationToken *v11;
  void *v12;
  void *v13;
  char v14;

  v4 = (VSOpaqueAuthenticationToken *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v14 = 1;
  }
  else if (v4)
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v7 = (void *)MEMORY[0x1E0C99DA0];
        v8 = *MEMORY[0x1E0C99778];
        v9 = (objc_class *)objc_opt_class();
        NSStringFromClass(v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "raise:format:", v8, CFSTR("Unexpectedly, object was %@, instead of VSOpaqueAuthenticationToken."), v10);

      }
      v11 = v6;
      -[VSOpaqueAuthenticationToken serializedData](self, "serializedData");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSOpaqueAuthenticationToken serializedData](v11, "serializedData");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = objc_msgSend(v12, "isEqual:", v13);
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSOpaqueAuthenticationToken expirationDate](self, "expirationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %@=%@>"), v5, CFSTR("expirationDate"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_body, 0);
}

- (void)initWithSerializedData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D2419000, v0, v1, "Error deserializing opaque authentication token: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithSerializedData:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1D2419000, v0, v1, "Body for opaque authentication token is nil.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)initWithSerializedData:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1D2419000, v0, v1, "Body for opaque authentication token is not a string.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)initWithSerializedData:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1D2419000, v0, v1, "Expiration date for opaque authentication token is nil.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)initWithSerializedData:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1D2419000, v0, v1, "Expiration date for opaque authentication token is not a date.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)initWithSerializedData:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1D2419000, v0, v1, "Property list for opqaue authentication token is not a dictionary.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)serializedData
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D2419000, v0, v1, "Unable to serialize opaque authentication token: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
