@implementation ICEncryptionObject

- (ICEncryptionObject)initWithMetadata:(id)a3 wrappedEncryptionKey:(id)a4 encryptedData:(id)a5
{
  id v9;
  id v10;
  id v11;
  ICEncryptionObject *v12;
  ICEncryptionObject *v13;
  uint64_t v14;
  NSData *wrappedEncryptionKey;
  uint64_t v16;
  NSData *encryptedData;
  ICEncryptionObject *v18;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)ICEncryptionObject;
  v12 = -[ICEncryptionObject init](&v20, sel_init);
  v13 = v12;
  if (!v12)
    goto LABEL_3;
  objc_storeStrong((id *)&v12->_metadata, a3);
  v14 = objc_msgSend(v10, "copy");
  wrappedEncryptionKey = v13->_wrappedEncryptionKey;
  v13->_wrappedEncryptionKey = (NSData *)v14;

  v16 = objc_msgSend(v11, "copy");
  encryptedData = v13->_encryptedData;
  v13->_encryptedData = (NSData *)v16;

  if (!-[ICEncryptionObject validate](v13, "validate"))
    v18 = 0;
  else
LABEL_3:
    v18 = v13;

  return v18;
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
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICEncryptionObject metadata](self, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICEncryptionObject wrappedEncryptionKey](self, "wrappedEncryptionKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ic_sha256");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICEncryptionObject encryptedData](self, "encryptedData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ic_sha256");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, metadata: %@, wrappedEncryptionKey.sha256: %@, encryptedData.sha256: %@>"), v5, self, v6, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  if (a3 == self)
    return 1;
  v4 = a3;
  objc_opt_class();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICEncryptionObject metadata](self, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqual:", v7))
  {
    objc_msgSend(v5, "wrappedEncryptionKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICEncryptionObject wrappedEncryptionKey](self, "wrappedEncryptionKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqual:", v9))
    {
      objc_msgSend(v5, "encryptedData");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICEncryptionObject encryptedData](self, "encryptedData");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  unint64_t result;
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  result = self->_hash;
  if (!result)
  {
    -[ICEncryptionObject metadata](self, "metadata");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hash");
    -[ICEncryptionObject wrappedEncryptionKey](self, "wrappedEncryptionKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hash");
    -[ICEncryptionObject encryptedData](self, "encryptedData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hash");
    self->_hash = ICHashWithHashKeys(v5, v9, v10, v11, v12, v13, v14, v15, v7);

    return self->_hash;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[ICEncryptionObject metadata](self, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serializedData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("unauthenticatedMetadata"));

  -[ICEncryptionObject metadata](self, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "authenticatedData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("metadata"));

  -[ICEncryptionObject wrappedEncryptionKey](self, "wrappedEncryptionKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("wrappedEncryptionKey"));

  -[ICEncryptionObject encryptedData](self, "encryptedData");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("encryptedData"));

}

- (ICEncryptionObject)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  NSObject *p_super;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  ICEncryptionMetadata *v19;
  ICEncryptionObject *v20;
  id *p_isa;
  ICEncryptionObject *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  objc_super v32;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("unauthenticatedMetadata"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metadata"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("wrappedEncryptionKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("encryptedData"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (v9 || v8 == 0)
  {
    p_super = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      -[ICEncryptionObject initWithCoder:].cold.2(p_super, v12, v13, v14, v15, v16, v17, v18);
    goto LABEL_18;
  }
  v19 = -[ICEncryptionMetadata initWithSerializedData:authenticatedData:]([ICEncryptionMetadata alloc], "initWithSerializedData:authenticatedData:", v5, v6);
  p_super = &v19->super;
  if (!v19)
  {
    v23 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[ICEncryptionObject initWithCoder:].cold.1(v23, v24, v25, v26, v27, v28, v29, v30);

LABEL_18:
    v22 = 0;
    goto LABEL_19;
  }
  v32.receiver = self;
  v32.super_class = (Class)ICEncryptionObject;
  v20 = -[ICEncryptionObject init](&v32, sel_init);
  p_isa = (id *)&v20->super.isa;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_metadata, p_super);
    objc_storeStrong(p_isa + 3, v7);
    objc_storeStrong(p_isa + 4, v8);
  }
  self = p_isa;
  v22 = self;
LABEL_19:

  return v22;
}

- (ICEncryptionObject)initWithSerializedData:(id)a3
{
  id v4;
  ICEncryptionObject *v5;
  void *v6;
  id v7;
  ICEncryptionObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v17;
  _QWORD block[4];
  ICEncryptionObject *v19;

  v4 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__ICEncryptionObject_initWithSerializedData___block_invoke;
  block[3] = &unk_1E76C73F8;
  v5 = self;
  v19 = v5;
  if (initWithSerializedData__onceToken != -1)
    dispatch_once(&initWithSerializedData__onceToken, block);
  v17 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v4, &v17);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v17;
  if (v7 || (objc_msgSend(v6, "validate") & 1) == 0)
  {
    if (objc_msgSend(v7, "code") != 4864)
    {
      v9 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[ICEncryptionObject initWithSerializedData:].cold.1((uint64_t)v7, v9, v10, v11, v12, v13, v14, v15);

    }
    v8 = 0;
  }
  else
  {
    v8 = v6;
  }

  return v8;
}

uint64_t __45__ICEncryptionObject_initWithSerializedData___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0CB3710], "setClass:forClassName:", objc_opt_class(), CFSTR("ICCryptoEncryptionObject"));
}

- (id)serialized
{
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v14;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__ICEncryptionObject_serialized__block_invoke;
  block[3] = &unk_1E76C73F8;
  block[4] = self;
  if (serialized_onceToken != -1)
    dispatch_once(&serialized_onceToken, block);
  v14 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v14);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v14;
  if (v4)
  {
    v5 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[ICEncryptionObject serialized].cold.1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

    v12 = 0;
  }
  else
  {
    v12 = v3;
  }

  return v12;
}

uint64_t __32__ICEncryptionObject_serialized__block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0CB36F8], "setClassName:forClass:", CFSTR("ICCryptoEncryptionObject"), objc_opt_class());
}

- (BOOL)validate
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  -[ICEncryptionObject metadata](self, "metadata");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[ICEncryptionObject wrappedEncryptionKey](self, "wrappedEncryptionKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
    {
      -[ICEncryptionObject encryptedData](self, "encryptedData");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "length");

      if (v7)
        return 1;
    }
    else
    {

    }
  }
  v9 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[ICEncryptionObject validate].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);

  return 0;
}

- (ICEncryptionMetadata)metadata
{
  return self->_metadata;
}

- (NSData)wrappedEncryptionKey
{
  return self->_wrappedEncryptionKey;
}

- (NSData)encryptedData
{
  return self->_encryptedData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptedData, 0);
  objc_storeStrong((id *)&self->_wrappedEncryptionKey, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1BD918000, a1, a3, "Cannot decode encryption object because metadata cannot be decoded", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

- (void)initWithCoder:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1BD918000, a1, a3, "Cannot decode encryption object because some data is missing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

- (void)initWithSerializedData:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, a2, a3, "Cannot deserialize encryption object {error: %@}", a5, a6, a7, a8, 2u);
}

- (void)serialized
{
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, a2, a3, "Cannot serialize encryption object {error: %@}", a5, a6, a7, a8, 2u);
}

- (void)validate
{
  OUTLINED_FUNCTION_0_3(&dword_1BD918000, a1, a3, "Encryption object data is missing — failing encryption object validation", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

@end
