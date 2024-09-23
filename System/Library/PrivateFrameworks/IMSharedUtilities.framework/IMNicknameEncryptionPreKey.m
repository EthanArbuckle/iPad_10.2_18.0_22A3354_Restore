@implementation IMNicknameEncryptionPreKey

+ (id)generatePreKeyWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v9[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_19E239000, v5, OS_LOG_TYPE_INFO, "Generating new IMNicknameEncryptionPreKey", v9, 2u);
    }

  }
  +[IMNicknameEncryptionHelpers _randomBytesWithLength:error:](IMNicknameEncryptionHelpers, "_randomBytesWithLength:error:", 16, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(a1, "preKeyWithDataRepresentation:error:", v6, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)preKeyWithDataRepresentation:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  int v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  uint64_t v21;
  const __CFString *v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 48);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (CCKDFParametersCreateHkdf())
  {
    if (a4)
    {
      v8 = (void *)MEMORY[0x1E0CB35C8];
      v25 = *MEMORY[0x1E0CB2938];
      v26[0] = CFSTR("Failed to create key derivation parameters");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("IMNicknameEncryptionHelpersErrorDomain"), -2000, v9);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = *a4;
        *(_DWORD *)buf = 138412290;
        v24 = v11;
        _os_log_impl(&dword_19E239000, v10, OS_LOG_TYPE_INFO, "Failed to create derivation parameters {error: %@}", buf, 0xCu);
      }

    }
  }
  else
  {
    v12 = objc_retainAutorelease(v6);
    objc_msgSend(v12, "bytes");
    objc_msgSend(v12, "length");
    v13 = objc_retainAutorelease(v7);
    objc_msgSend(v13, "mutableBytes");
    objc_msgSend(v13, "length");
    v14 = CCDeriveKey();
    CCKDFParametersDestroy();
    if (!v14)
    {
      v19 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithGeneratedData:derivedData:", v12, v13);
      goto LABEL_16;
    }
    if (a4)
    {
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v21 = *MEMORY[0x1E0CB2938];
      v22 = CFSTR("Failed to derive encryption/signing keys");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("IMNicknameEncryptionHelpersErrorDomain"), -2000, v16);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v18 = *a4;
        *(_DWORD *)buf = 138412290;
        v24 = v18;
        _os_log_impl(&dword_19E239000, v17, OS_LOG_TYPE_INFO, "Failed to create preKey from data representation {error: %@}", buf, 0xCu);
      }

    }
  }
  v19 = 0;
LABEL_16:

  return v19;
}

- (IMNicknameEncryptionPreKey)initWithGeneratedData:(id)a3 derivedData:(id)a4
{
  id v7;
  id v8;
  IMNicknameEncryptionPreKey *v9;
  IMNicknameEncryptionPreKey *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IMNicknameEncryptionPreKey;
  v9 = -[IMNicknameEncryptionPreKey init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_generatedData, a3);
    objc_storeStrong((id *)&v10->_derivedData, a4);
  }

  return v10;
}

- (id)dataRepresentation
{
  return self->_generatedData;
}

- (IMNicknameFieldEncryptionKey)fieldEncryptionKey
{
  void *v2;
  IMNicknameFieldEncryptionKey *v3;

  -[IMNicknameEncryptionPreKey _subDerivedKeyDataAtIndex:](self, "_subDerivedKeyDataAtIndex:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[IMNicknameEncryptionKey initWithData:]([IMNicknameFieldEncryptionKey alloc], "initWithData:", v2);

  return v3;
}

- (IMNicknameFieldTaggingKey)fieldTaggingKey
{
  void *v2;
  IMNicknameFieldTaggingKey *v3;

  -[IMNicknameEncryptionPreKey _subDerivedKeyDataAtIndex:](self, "_subDerivedKeyDataAtIndex:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[IMNicknameEncryptionKey initWithData:]([IMNicknameFieldTaggingKey alloc], "initWithData:", v2);

  return v3;
}

- (IMNicknameRecordTaggingKey)recordTaggingKey
{
  void *v2;
  IMNicknameRecordTaggingKey *v3;

  -[IMNicknameEncryptionPreKey _subDerivedKeyDataAtIndex:](self, "_subDerivedKeyDataAtIndex:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[IMNicknameEncryptionKey initWithData:]([IMNicknameRecordTaggingKey alloc], "initWithData:", v2);

  return v3;
}

- (id)_subDerivedKeyDataAtIndex:(unint64_t)a3
{
  return -[NSData subdataWithRange:](self->_derivedData, "subdataWithRange:", 16 * a3, 16);
}

- (NSData)generatedData
{
  return self->_generatedData;
}

- (void)setGeneratedData:(id)a3
{
  objc_storeStrong((id *)&self->_generatedData, a3);
}

- (NSData)derivedData
{
  return self->_derivedData;
}

- (void)setDerivedData:(id)a3
{
  objc_storeStrong((id *)&self->_derivedData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_derivedData, 0);
  objc_storeStrong((id *)&self->_generatedData, 0);
}

@end
