@implementation ICEncryptionKey

- (ICEncryptionKey)initWithKeyData:(id)a3 metadata:(id)a4
{
  id v6;
  id v7;
  ICEncryptionKey *v8;
  uint64_t v9;
  NSData *keyData;
  ICEncryptionKey *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ICEncryptionKey;
  v8 = -[ICEncryptionKey init](&v13, sel_init);
  if (!v8
    || (v9 = objc_msgSend(v6, "copy"),
        keyData = v8->_keyData,
        v8->_keyData = (NSData *)v9,
        keyData,
        objc_storeStrong((id *)&v8->_metadata, a4),
        -[ICEncryptionKey validate](v8, "validate"))
    && -[ICEncryptionKey serialize](v8, "serialize"))
  {
    v11 = v8;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICEncryptionKey keyData](self, "keyData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ic_sha256");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICEncryptionKey metadata](self, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, keyData.sha256: %@, metadata: %@>"), v5, self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  if (a3 == self)
    return 1;
  v4 = a3;
  objc_opt_class();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "keyData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICEncryptionKey keyData](self, "keyData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqual:", v7))
  {
    objc_msgSend(v5, "metadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICEncryptionKey metadata](self, "metadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t result;
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  result = self->_hash;
  if (!result)
  {
    -[ICEncryptionKey keyData](self, "keyData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hash");
    -[ICEncryptionKey metadata](self, "metadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hash");
    self->_hash = ICHashWithHashKeys(v5, v8, v9, v10, v11, v12, v13, v14, v7);

    return self->_hash;
  }
  return result;
}

- (ICEncryptionKey)initWithSerializedData:(id)a3
{
  id v4;
  ICEncryptionKey *v5;
  ICEncryptionKey *v6;
  ICEncryptionKey *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICEncryptionKey;
  v5 = -[ICEncryptionKey init](&v9, sel_init);
  v6 = v5;
  if (!v5
    || -[ICEncryptionKey deserializeWithData:](v5, "deserializeWithData:", v4)
    && -[ICEncryptionKey validate](v6, "validate"))
  {
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)serialize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSData *v8;
  id v9;
  NSData *serializedData;
  NSData *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v20;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_setNonNilObject:forKey:", self->_keyData, CFSTR("key"));
  -[ICEncryptionMetadata serializedData](self->_metadata, "serializedData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_setNonNilObject:forKey:", v4, CFSTR("metadata"));

  -[ICEncryptionMetadata authenticatedData](self->_metadata, "authenticatedData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_setNonNilObject:forKey:", v5, CFSTR("authenticatedData"));

  v6 = (void *)MEMORY[0x1E0CB38B0];
  v7 = (void *)objc_msgSend(v3, "copy");
  v20 = 0;
  objc_msgSend(v6, "dataWithPropertyList:format:options:error:", v7, 200, 0, &v20);
  v8 = (NSData *)objc_claimAutoreleasedReturnValue();
  v9 = v20;
  serializedData = self->_serializedData;
  self->_serializedData = v8;

  v11 = self->_serializedData;
  if (!v11)
  {
    v12 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ICEncryptionKey serialize].cold.1((uint64_t)v9, v12, v13, v14, v15, v16, v17, v18);

  }
  return v11 != 0;
}

- (BOOL)deserializeWithData:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  BOOL v9;
  void *v10;
  NSData *v11;
  NSData *keyData;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  ICEncryptionMetadata *v20;
  ICEncryptionMetadata *metadata;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v36;

  v5 = a3;
  if (objc_msgSend(v5, "length"))
  {
    objc_opt_class();
    v36 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v5, 0, 0, &v36);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v36;
    ICCheckedDynamicCast();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v8 != 0;
    if (v8)
    {
      objc_storeStrong((id *)&self->_serializedData, a3);
      objc_opt_class();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("key"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      ICCheckedDynamicCast();
      v11 = (NSData *)objc_claimAutoreleasedReturnValue();
      keyData = self->_keyData;
      self->_keyData = v11;

      objc_opt_class();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("metadata"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      ICCheckedDynamicCast();
      v14 = objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("authenticatedData"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      ICCheckedDynamicCast();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v16;
      if (v16)
        v18 = (void *)v16;
      else
        v18 = v14;
      v19 = v18;

      if (v14)
      {
        v20 = -[ICEncryptionMetadata initWithSerializedData:authenticatedData:]([ICEncryptionMetadata alloc], "initWithSerializedData:authenticatedData:", v14, v19);
        metadata = self->_metadata;
        self->_metadata = v20;

      }
    }
    else
    {
      v14 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[ICEncryptionKey deserializeWithData:].cold.2((uint64_t)v7, v14, v29, v30, v31, v32, v33, v34);
    }

  }
  else
  {
    v7 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[ICEncryptionKey deserializeWithData:].cold.1(v7, v22, v23, v24, v25, v26, v27, v28);
    v9 = 0;
  }

  return v9;
}

- (BOOL)validate
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v7;
  uint64_t v8;
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
  uint64_t v21;

  -[ICEncryptionKey keyData](self, "keyData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    -[ICEncryptionKey metadata](self, "metadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      return 1;
    v7 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[ICEncryptionKey validate].cold.2(v7, v15, v16, v17, v18, v19, v20, v21);
  }
  else
  {
    v7 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[ICEncryptionKey validate].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
  }

  return 0;
}

- (NSData)keyData
{
  return self->_keyData;
}

- (ICEncryptionMetadata)metadata
{
  return self->_metadata;
}

- (NSData)serializedData
{
  return self->_serializedData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedData, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_keyData, 0);
}

- (void)serialize
{
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, a2, a3, "Cannot encode encryption main key — failing {error: %@}", a5, a6, a7, a8, 2u);
}

- (void)deserializeWithData:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1BD918000, a1, a3, "Cannot decode empty encryption main key — failing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

- (void)deserializeWithData:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, a2, a3, "Cannot decode encryption main key — failing {error: %@}", a5, a6, a7, a8, 2u);
}

- (void)validate
{
  OUTLINED_FUNCTION_0_3(&dword_1BD918000, a1, a3, "No encryption metadata — failing encryption main key validation", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

@end
