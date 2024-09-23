@implementation IMNicknameEncryptionCipherRecordField

+ (id)cipherRecordFieldWithFieldName:(id)a3 dataRepresentation:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  IMNicknameEncryptionCipherRecordField *v20;
  NSObject *v21;
  id v22;
  int v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v8, 0, 0, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "objectForKey:", CFSTR("v"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          if (a5)
            v13 = *a5;
          else
            v13 = 0;
          v24 = 138412802;
          v25 = v13;
          v26 = 2112;
          v27 = v7;
          v28 = 2112;
          v29 = v10;
          _os_log_impl(&dword_19E239000, v12, OS_LOG_TYPE_INFO, "Unsupported cipherField version -- nickname decryption failed {error: %@, fieldName: %@, dictionaryRepresentation: %@}", (uint8_t *)&v24, 0x20u);
        }

      }
      v20 = 0;
    }
    else
    {
      objc_msgSend(v10, "objectForKey:", CFSTR("t"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[IMNicknameEncryptionFieldTag tagWithDataRepresentation:error:](IMNicknameEncryptionFieldTag, "tagWithDataRepresentation:error:", v16, a5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        objc_msgSend(v10, "objectForKey:", CFSTR("i"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", CFSTR("d"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = -[IMNicknameEncryptionCipherRecordField initWithFieldName:cipherData:IV:tag:]([IMNicknameEncryptionCipherRecordField alloc], "initWithFieldName:cipherData:IV:tag:", v7, v19, v18, v17);

      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            if (a5)
              v22 = *a5;
            else
              v22 = 0;
            v24 = 138413058;
            v25 = v22;
            v26 = 2112;
            v27 = v7;
            v28 = 2112;
            v29 = v16;
            v30 = 2112;
            v31 = v10;
            _os_log_impl(&dword_19E239000, v21, OS_LOG_TYPE_INFO, "Failed to get tag from tagData {error: %@, fieldName: %@, tagData: %@, dictionaryRepresentation: %@}", (uint8_t *)&v24, 0x2Au);
          }

        }
        v20 = 0;
      }

    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        if (a5)
          v15 = *a5;
        else
          v15 = 0;
        v24 = 138412802;
        v25 = v15;
        v26 = 2112;
        v27 = v7;
        v28 = 2112;
        v29 = v8;
        _os_log_impl(&dword_19E239000, v14, OS_LOG_TYPE_INFO, "Failed to parse cipherField dataRepresentation -- nickname decryption failed {error: %@, fieldName: %@, dataRepresentation: %@}", (uint8_t *)&v24, 0x20u);
      }

    }
    v20 = 0;
  }

  return v20;
}

- (IMNicknameEncryptionCipherRecordField)initWithFieldName:(id)a3 cipherData:(id)a4 IV:(id)a5 tag:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  IMNicknameEncryptionCipherRecordField *v15;
  IMNicknameEncryptionCipherRecordField *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)IMNicknameEncryptionCipherRecordField;
  v15 = -[IMNicknameEncryptionCipherRecordField init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_fieldName, a3);
    objc_storeStrong((id *)&v16->_cipherData, a4);
    objc_storeStrong((id *)&v16->_IV, a5);
    objc_storeStrong((id *)&v16->_fieldTag, a6);
  }

  return v16;
}

- (id)dataRepresentationWithError:(id *)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[IMNicknameEncryptionCipherRecordField IV](self, "IV");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("i"));

  -[IMNicknameEncryptionCipherRecordField cipherData](self, "cipherData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("d"));

  -[IMNicknameEncryptionCipherRecordField fieldTag](self, "fieldTag");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v9, CFSTR("t"));

  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v5, 200, 0, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[IMNicknameEncryptionCipherRecordField fieldName](self, "fieldName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMNicknameEncryptionCipherRecordField cipherData](self, "cipherData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMNicknameEncryptionCipherRecordField IV](self, "IV");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMNicknameEncryptionCipherRecordField fieldTag](self, "fieldTag");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p recordKey: %@, cipherData: %@, IV: %@, tag: %@>"), v4, self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)fieldName
{
  return self->_fieldName;
}

- (void)setFieldName:(id)a3
{
  objc_storeStrong((id *)&self->_fieldName, a3);
}

- (NSData)cipherData
{
  return self->_cipherData;
}

- (void)setCipherData:(id)a3
{
  objc_storeStrong((id *)&self->_cipherData, a3);
}

- (NSData)IV
{
  return self->_IV;
}

- (void)setIV:(id)a3
{
  objc_storeStrong((id *)&self->_IV, a3);
}

- (IMNicknameEncryptionFieldTag)fieldTag
{
  return self->_fieldTag;
}

- (void)setFieldTag:(id)a3
{
  objc_storeStrong((id *)&self->_fieldTag, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldTag, 0);
  objc_storeStrong((id *)&self->_IV, 0);
  objc_storeStrong((id *)&self->_cipherData, 0);
  objc_storeStrong((id *)&self->_fieldName, 0);
}

@end
