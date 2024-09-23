@implementation OTInheritanceKey(CDP)

- (uint64_t)initFromAccessKey:()CDP
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  id v33;
  NSObject *v34;
  uint64_t v36;
  uint64_t v37;

  v4 = a3;
  objc_msgSend(v4, "wrappingKeyData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    _CDPLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[OTInheritanceKey(CDP) initFromAccessKey:].cold.3(v7, v8, v9, v10, v11, v12, v13, v14);

    v15 = objc_alloc(MEMORY[0x24BE6E110]);
    objc_msgSend(v4, "wrappedKeyData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "wrappingKeyData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "beneficiaryID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0;
    v19 = (id *)&v37;
    v20 = objc_msgSend(v15, "initWithWrappedKeyData:wrappingKeyData:uuid:error:", v16, v17, v18, &v37);
  }
  else
  {
    objc_msgSend(v4, "wrappingKeyString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "length");

    if (!v22)
    {
      v32 = 0;
      v33 = 0;
      goto LABEL_14;
    }
    _CDPLogSystem();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      -[OTInheritanceKey(CDP) initFromAccessKey:].cold.2(v23, v24, v25, v26, v27, v28, v29, v30);

    v31 = objc_alloc(MEMORY[0x24BE6E110]);
    objc_msgSend(v4, "wrappedKeyData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "wrappingKeyString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "beneficiaryID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0;
    v19 = (id *)&v36;
    v20 = objc_msgSend(v31, "initWithWrappedKeyData:wrappingKeyString:uuid:error:", v16, v17, v18, &v36);
  }
  v32 = v20;
  v33 = *v19;

  if (v33)
  {
    _CDPLogSystem();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      -[OTInheritanceKey(CDP) initFromAccessKey:].cold.1((uint64_t)v33, v34);

  }
LABEL_14:

  return v32;
}

- (id)accessCode
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = objc_alloc(MEMORY[0x24BE0AD98]);
  objc_msgSend(a1, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithBeneficiairyIdentifier:", v3);

  objc_msgSend(a1, "claimTokenData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClaimTokenData:", v5);

  objc_msgSend(a1, "claimTokenString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClaimTokenString:", v6);

  objc_msgSend(a1, "wrappingKeyData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWrappingKeyData:", v7);

  objc_msgSend(a1, "wrappingKeyString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWrappingKeyString:", v8);

  objc_msgSend(a1, "wrappedKeyData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWrappedKeyData:", v9);

  objc_msgSend(a1, "wrappedKeyString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWrappedKeyString:", v10);

  return v4;
}

- (void)initFromAccessKey:()CDP .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_20D7E6000, a2, OS_LOG_TYPE_ERROR, "\"Error creating key from access key string. Error - %@\", (uint8_t *)&v2, 0xCu);
}

- (void)initFromAccessKey:()CDP .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20D7E6000, a1, a3, "\"Creating the access code from string.\", a5, a6, a7, a8, 0);
}

- (void)initFromAccessKey:()CDP .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20D7E6000, a1, a3, "\"Creating the access code from data.\", a5, a6, a7, a8, 0);
}

@end
