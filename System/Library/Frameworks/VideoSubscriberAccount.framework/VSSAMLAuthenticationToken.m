@implementation VSSAMLAuthenticationToken

- (VSSAMLAuthenticationToken)initWithSerializedData:(id)a3
{
  id v4;
  VSSAMLAuthenticationToken *v5;
  uint64_t v6;
  NSData *serializedData;

  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The serializedData parameter must not be nil."));
  v5 = -[VSSAMLAuthenticationToken init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    serializedData = v5->_serializedData;
    v5->_serializedData = (NSData *)v6;

  }
  return v5;
}

- (NSDate)expirationDate
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v10;

  VSSharedSAMLParserController();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSAMLAuthenticationToken body](self, "body");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v3, "parseCachedResponse:error:", v4, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;

  if (v5)
  {
    objc_msgSend(v5, "authenticationTTL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    VSErrorLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[VSSAMLAuthenticationToken expirationDate].cold.1();

    v7 = 0;
  }

  return (NSDate *)v7;
}

- (BOOL)isValid
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  char v7;
  NSObject *v8;
  id v10;

  VSSharedSAMLParserController();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSAMLAuthenticationToken body](self, "body");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v3, "parseCachedResponse:error:", v4, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;

  if (v5)
  {
    v7 = objc_msgSend(v5, "hasValidAuthentication");
  }
  else
  {
    VSErrorLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[VSSAMLAuthenticationToken expirationDate].cold.1();

    v7 = 0;
  }

  return v7;
}

- (BOOL)isOpaque
{
  return 0;
}

- (BOOL)isFromUnsupportedProvider
{
  return 0;
}

- (NSString)body
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v21;
  uint8_t buf[16];

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[VSSAMLAuthenticationToken serializedData](self, "serializedData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithData:encoding:", v4, 4);

  +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unwrapWithFallback:", &stru_1E93A8CC0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[VSSAMLAuthenticationToken simulatedExpirationDate](self, "simulatedExpirationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
LABEL_11:
    v18 = v7;
    goto LABEL_12;
  }
  VSDefaultLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2419000, v9, OS_LOG_TYPE_DEFAULT, "Simulate expired token enabled, will return augmented token body.", buf, 2u);
  }

  VSSharedSAMLParserController();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The currentBody parameter must not be nil."));
  v21 = 0;
  objc_msgSend(v10, "parseCachedResponse:error:", v7, &v21);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v21;

  if (!v11)
  {
    VSErrorLogObject();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[VSSAMLAuthenticationToken body].cold.1();

    goto LABEL_11;
  }
  v13 = (void *)MEMORY[0x1E0C99D68];
  v14 = v11;
  objc_msgSend(v13, "distantPast");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAuthenticationTTL:", v15);

  objc_msgSend(v14, "xmlString:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "unwrapWithFallback:", &stru_1E93A8CC0);
  v18 = (id)objc_claimAutoreleasedReturnValue();

LABEL_12:
  return (NSString *)v18;
}

- (void)setBody:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The body parameter must not be nil."));
  objc_msgSend(v4, "dataUsingEncoding:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__VSSAMLAuthenticationToken_setBody___block_invoke;
  v7[3] = &unk_1E939FCD8;
  v7[4] = self;
  objc_msgSend(v6, "conditionallyUnwrapObject:otherwise:", v7, &__block_literal_global_18);

}

uint64_t __37__VSSAMLAuthenticationToken_setBody___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSerializedData:", a2);
}

uint64_t __37__VSSAMLAuthenticationToken_setBody___block_invoke_2()
{
  return objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unable to encode body string as UTF-8 data."));
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[VSSAMLAuthenticationToken serializedData](self, "serializedData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  VSSAMLAuthenticationToken *v4;
  VSSAMLAuthenticationToken *v5;
  VSSAMLAuthenticationToken *v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  void *v10;
  VSSAMLAuthenticationToken *v11;
  void *v12;
  void *v13;
  char v14;

  v4 = (VSSAMLAuthenticationToken *)a3;
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
        objc_msgSend(v7, "raise:format:", v8, CFSTR("Unexpectedly, object was %@, instead of VSSAMLAuthenticationToken."), v10);

      }
      v11 = v6;
      -[VSSAMLAuthenticationToken serializedData](self, "serializedData");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSSAMLAuthenticationToken serializedData](v11, "serializedData");
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
  -[VSSAMLAuthenticationToken expirationDate](self, "expirationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %@=%@>"), v5, CFSTR("expirationDate"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSData)serializedData
{
  return self->_serializedData;
}

- (void)setSerializedData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDate)simulatedExpirationDate
{
  return self->_simulatedExpirationDate;
}

- (void)setSimulatedExpirationDate:(id)a3
{
  objc_storeStrong((id *)&self->_simulatedExpirationDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simulatedExpirationDate, 0);
  objc_storeStrong((id *)&self->_serializedData, 0);
}

- (void)expirationDate
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D2419000, v0, v1, "Error parsing SAML authentication token: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)body
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D2419000, v0, v1, "Error parsing SAML response for expired token simulation: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
