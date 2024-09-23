@implementation IMNicknameEncryptionHelpers

+ (id)encryptAndTagPlainFields:(id)a3 withPreKey:(id)a4 returningRecordTag:(id *)a5 error:(id *)a6
{
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  id v26;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[4];
  id v34;
  uint64_t v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  id v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v28 = a4;
  if (!a6)
  {
    v35 = 0;
    a6 = (id *)&v35;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v10, "allKeys");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v37 = v12;
      _os_log_impl(&dword_19E239000, v11, OS_LOG_TYPE_INFO, "Encrypting nickname fields {plainFieldsMap.keys: %@}", buf, 0xCu);

    }
  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v10, "count"));
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = sub_19E261858;
  v33[3] = &unk_1E3FB5008;
  v14 = v13;
  v34 = v14;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v33);
  objc_msgSend(a1, "_encryptAndTagPlainFields:withPreKey:returningRecordTag:error:", v14, v28, a5, a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v15, "count"));
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v17 = v15;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v40, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v30;
    while (2)
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v30 != v19)
          objc_enumerationMutation(v17);
        v21 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v21, "dataRepresentationWithError:", a6);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v22)
        {

          if ((IMOSLoggingEnabled() & 1) != 0)
          {
            OSLogHandleForIMFoundationCategory();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              v26 = *a6;
              *(_DWORD *)buf = 138412546;
              v37 = v26;
              v38 = 2112;
              v39 = v10;
              _os_log_impl(&dword_19E239000, v25, OS_LOG_TYPE_INFO, "Failed to encrypt nickname record {error: %@, plainFieldsMap: %@}", buf, 0x16u);
            }

          }
          v24 = 0;
          goto LABEL_21;
        }
        objc_msgSend(v21, "fieldName");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKey:", v22, v23);

      }
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v40, 16);
      if (v18)
        continue;
      break;
    }
  }

  v24 = v16;
LABEL_21:

  return v24;
}

+ (id)decryptAndVerifyCipherFields:(id)a3 withPreKey:(id)a4 recordTagToVerify:(id)a5 error:(id *)a6
{
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  id v28;
  NSObject *v29;
  id v30;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  uint8_t v44[128];
  uint8_t buf[4];
  id v46;
  __int16 v47;
  id v48;
  __int16 v49;
  id v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v33 = a4;
  v34 = a5;
  if (!a6)
  {
    v43 = 0;
    a6 = (id *)&v43;
  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v9, "count"));
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  objc_msgSend(v9, "allKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v40;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v40 != v13)
          objc_enumerationMutation(v11);
        v15 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v9, "objectForKey:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[IMNicknameEncryptionCipherRecordField cipherRecordFieldWithFieldName:dataRepresentation:error:](IMNicknameEncryptionCipherRecordField, "cipherRecordFieldWithFieldName:dataRepresentation:error:", v15, v16, a6);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v17)
        {

          if ((IMOSLoggingEnabled() & 1) != 0)
          {
            OSLogHandleForIMFoundationCategory();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              v28 = *a6;
              *(_DWORD *)buf = 138412802;
              v46 = v28;
              v47 = 2112;
              v48 = v9;
              v49 = 2112;
              v50 = v34;
              _os_log_impl(&dword_19E239000, v27, OS_LOG_TYPE_INFO, "Failed to create cipherFields from dictionary {error: %@, cipherfieldsMap: %@, tagToVerify: %@}", buf, 0x20u);
            }

          }
          v19 = 0;
          goto LABEL_31;
        }
        objc_msgSend(v10, "addObject:", v17);

      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
      if (v12)
        continue;
      break;
    }
  }

  objc_msgSend(a1, "_decryptAndVerifyCipherFields:withPreKey:recordTagToVerify:error:", v10, v33, v34, a6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v18, "count"));
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v20 = v18;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v36;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v36 != v22)
            objc_enumerationMutation(v20);
          v24 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
          objc_msgSend(v24, "plainData");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "fieldName");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setObject:forKey:", v25, v26);

        }
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
      }
      while (v21);
    }

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        v30 = *a6;
        *(_DWORD *)buf = 138412802;
        v46 = v30;
        v47 = 2112;
        v48 = v9;
        v49 = 2112;
        v50 = v34;
        _os_log_impl(&dword_19E239000, v29, OS_LOG_TYPE_INFO, "Failed to decrypt cipher fields {error: %@, cipherfieldsMap: %@, tagToVerify: %@}", buf, 0x20u);
      }

    }
    v19 = 0;
  }

LABEL_31:
  return v19;
}

+ (id)_encryptAndTagPlainFields:(id)a3 withPreKey:(id)a4 returningRecordTag:(id *)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v10 = a4;
  v11 = a3;
  objc_msgSend(v10, "fieldEncryptionKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fieldTaggingKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_encryptPlainFields:withFieldEncryptionKey:fieldTaggingKey:error:", v11, v12, v13, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v10, "recordTaggingKey");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_recordTagForCipherFields:recordTaggingKey:error:", v14, v15, a6);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

+ (id)encryptAndTagPlainField:(id)a3 withPreKey:(id)a4 returningFieldTag:(id *)a5 error:(id *)a6
{
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v20 = a3;
    v10 = (void *)MEMORY[0x1E0C99D20];
    v11 = a4;
    v12 = a3;
    objc_msgSend(v10, "arrayWithObjects:count:", &v20, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "fieldEncryptionKey", v20, v21);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fieldTaggingKey");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "_encryptPlainFields:withFieldEncryptionKey:fieldTaggingKey:error:", v13, v14, v15, a6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16 && objc_msgSend(v16, "count"))
    {
      objc_msgSend(v16, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "fieldTag");
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }
  return v18;
}

+ (id)_decryptAndVerifyCipherFields:(id)a3 withPreKey:(id)a4 recordTagToVerify:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  id v21;
  id v22;
  int v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v12)
  {
    objc_msgSend(v11, "recordTaggingKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_recordTagForCipherFields:recordTaggingKey:error:", v10, v13, a6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      if ((objc_msgSend(v14, "isEqualToTag:error:", v12, a6) & 1) != 0)
      {
        objc_msgSend(v11, "fieldEncryptionKey");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "fieldTaggingKey");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_decryptCipherFields:withFieldEncryptionKey:fieldTaggingKey:error:", v10, v15, v16, a6);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_20;
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          v22 = *a6;
          v24 = 138412802;
          v25 = v22;
          v26 = 2112;
          v27 = v14;
          v28 = 2112;
          v29 = v12;
          _os_log_impl(&dword_19E239000, v20, OS_LOG_TYPE_INFO, "Tag mismatch -- record decryption failed {error: %@, tag: %@, recordTagToVerify: %@}", (uint8_t *)&v24, 0x20u);
        }
LABEL_18:

      }
    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v21 = *a6;
        v24 = 138412546;
        v25 = v21;
        v26 = 2112;
        v27 = v10;
        _os_log_impl(&dword_19E239000, v20, OS_LOG_TYPE_INFO, "Failed to compute record tag -- nickname decryption failed {error: %@, cipherFields: %@}", (uint8_t *)&v24, 0x16u);
      }
      goto LABEL_18;
    }
    v17 = 0;
    goto LABEL_20;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v24 = 138412290;
      v25 = v10;
      _os_log_impl(&dword_19E239000, v18, OS_LOG_TYPE_INFO, "Missing tag to verify -- Nickname decryption failed {cipherFields: %@}", (uint8_t *)&v24, 0xCu);
    }

  }
  if (!a6)
  {
    v17 = 0;
    goto LABEL_21;
  }
  v19 = (void *)MEMORY[0x1E0CB35C8];
  v30 = *MEMORY[0x1E0CB2938];
  v31[0] = CFSTR("Missing recordTagToVerify");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("IMNicknameEncryptionHelpersErrorDomain"), -1000, v14);
  v17 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_20:

LABEL_21:
  return v17;
}

+ (id)_encryptPlainFields:(id)a3 withFieldEncryptionKey:(id)a4 fieldTaggingKey:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v10, "count"));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v14 = v10;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v24;
    while (2)
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(a1, "_encryptPlainField:withFieldEncryptionKey:fieldTaggingKey:error:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v18), v11, v12, a6, (_QWORD)v23);
        v19 = objc_claimAutoreleasedReturnValue();
        if (!v19)
        {

          v21 = 0;
          goto LABEL_11;
        }
        v20 = (void *)v19;
        objc_msgSend(v13, "addObject:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v16)
        continue;
      break;
    }
  }

  v21 = v13;
LABEL_11:

  return v21;
}

+ (id)_recordTagForCipherFields:(id)a3 recordTaggingKey:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  objc_msgSend(a3, "sortedArrayUsingComparator:", &unk_1E3FB3308);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v25;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v15), "fieldTag", (_QWORD)v24);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "dataRepresentation");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "appendData:", v17);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v13);
  }

  objc_msgSend(v8, "data");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_tagForData:key:error:", v10, v18, a5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  +[IMNicknameEncryptionRecordTag tagWithDataRepresentation:error:](IMNicknameEncryptionRecordTag, "tagWithDataRepresentation:error:", v19, a5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
    v22 = v20;

  return v21;
}

+ (id)_encryptPlainField:(id)a3 withFieldEncryptionKey:(id)a4 fieldTaggingKey:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  IMNicknameEncryptionCipherRecordField *v18;
  void *v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  id v25;
  int v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(a1, "_randomBytesWithLength:error:", 16, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v10, "plainData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_performOperation:onData:withFieldEncryptionKey:iv:error:", 0, v14, v11, v13, a6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v10, "fieldName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_fieldTagForFieldName:cipherData:IV:fieldTaggingKey:error:", v16, v15, v13, v12, a6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        v18 = [IMNicknameEncryptionCipherRecordField alloc];
        objc_msgSend(v10, "fieldName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        a6 = -[IMNicknameEncryptionCipherRecordField initWithFieldName:cipherData:IV:tag:](v18, "initWithFieldName:cipherData:IV:tag:", v19, v15, v13, v17);

      }
      else if (a6)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            v25 = *a6;
            v27 = 138412546;
            v28 = v25;
            v29 = 2112;
            v30 = v10;
            _os_log_impl(&dword_19E239000, v24, OS_LOG_TYPE_INFO, "Failed to compute tag -- nickname encryption failed {error: %@, plainField: %@}", (uint8_t *)&v27, 0x16u);
          }

        }
        a6 = 0;
      }

    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          v23 = *a6;
          v27 = 138412546;
          v28 = v23;
          v29 = 2112;
          v30 = v10;
          _os_log_impl(&dword_19E239000, v22, OS_LOG_TYPE_INFO, "Failed to encrypt data -- nickname encryption failed {error: %@, plainField: %@}", (uint8_t *)&v27, 0x16u);
        }

      }
      a6 = 0;
    }

  }
  else if (a6)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v21 = *a6;
        v27 = 138412546;
        v28 = v21;
        v29 = 2112;
        v30 = v10;
        _os_log_impl(&dword_19E239000, v20, OS_LOG_TYPE_INFO, "Failed to generate IV -- nickname encryption failed {error: %@, plainField: %@}", (uint8_t *)&v27, 0x16u);
      }

    }
    a6 = 0;
  }

  return a6;
}

+ (id)_decryptCipherFields:(id)a3 withFieldEncryptionKey:(id)a4 fieldTaggingKey:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  NSObject *v20;
  id v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v10, "count"));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v14 = v10;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(v14);
        objc_msgSend(a1, "_decryptCipherField:withFieldEncryptionKey:fieldTaggingKey:error:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i), v11, v12, a6, (_QWORD)v23);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v18)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              v21 = *a6;
              *(_DWORD *)buf = 138412546;
              v28 = v21;
              v29 = 2112;
              v30 = v14;
              _os_log_impl(&dword_19E239000, v20, OS_LOG_TYPE_INFO, "Failed to decrypt cipher field {error: %@, cipherField: %@}", buf, 0x16u);
            }

          }
          v19 = 0;
          goto LABEL_15;
        }
        objc_msgSend(v13, "addObject:", v18);

      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      if (v15)
        continue;
      break;
    }
  }

  v19 = v13;
LABEL_15:

  return v19;
}

+ (id)_decryptCipherField:(id)a3 withFieldEncryptionKey:(id)a4 fieldTaggingKey:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  IMNicknameEncryptionPlainRecordField *v22;
  void *v23;
  IMNicknameEncryptionPlainRecordField *v24;
  NSObject *v25;
  id v26;
  id v27;
  NSObject *v28;
  id v29;
  void *v30;
  int v32;
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v10, "fieldName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cipherData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "IV");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_fieldTagForFieldName:cipherData:IV:fieldTaggingKey:error:", v13, v14, v15, v12, a6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v26 = *a6;
        v32 = 138412546;
        v33 = v26;
        v34 = 2112;
        v35 = v10;
        _os_log_impl(&dword_19E239000, v25, OS_LOG_TYPE_INFO, "Failed to calculate field tag -- nickname decryption failed {error: %@, cipherField: %@}", (uint8_t *)&v32, 0x16u);
      }
      goto LABEL_12;
    }
LABEL_13:
    v24 = 0;
    goto LABEL_20;
  }
  objc_msgSend(v10, "fieldTag");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "isEqualToTag:error:", v17, a6);

  if ((v18 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v27 = *a6;
        v32 = 138412802;
        v33 = v27;
        v34 = 2112;
        v35 = v16;
        v36 = 2112;
        v37 = v10;
        _os_log_impl(&dword_19E239000, v25, OS_LOG_TYPE_INFO, "Field tag mismatch -- nickname decryption failed {error: %@, tag: %@, cipherField: %@}", (uint8_t *)&v32, 0x20u);
      }
LABEL_12:

      goto LABEL_13;
    }
    goto LABEL_13;
  }
  objc_msgSend(v10, "cipherData");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "IV");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_performOperation:onData:withFieldEncryptionKey:iv:error:", 1, v19, v11, v20, a6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v22 = [IMNicknameEncryptionPlainRecordField alloc];
    objc_msgSend(v10, "fieldName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[IMNicknameEncryptionPlainRecordField initWithFieldName:plainData:](v22, "initWithFieldName:plainData:", v23, v21);

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        v29 = *a6;
        objc_msgSend(v10, "IV");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 138412802;
        v33 = v29;
        v34 = 2112;
        v35 = v10;
        v36 = 2112;
        v37 = v30;
        _os_log_impl(&dword_19E239000, v28, OS_LOG_TYPE_INFO, "Decryption operation failed -- nickname decryption failed {error: %@, cipherField: %@, cipherField.IV: %@}", (uint8_t *)&v32, 0x20u);

      }
    }
    v24 = 0;
  }

LABEL_20:
  return v24;
}

+ (id)_performOperation:(unsigned int)a3 onData:(id)a4 withFieldEncryptionKey:(id)a5 iv:(id)a6 error:(id *)a7
{
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  const void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id v26;
  void *v27;
  _CCCryptor *v28;
  id v29;
  const void *v30;
  size_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  size_t dataOutMoved;
  CCCryptorRef cryptorRef;
  uint64_t v40;
  void *v41;
  uint8_t buf[4];
  id v43;
  __int16 v44;
  int v45;
  __int16 v46;
  int v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  _QWORD v51[2];

  v10 = *(_QWORD *)&a3;
  v51[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  cryptorRef = 0;
  if ((unint64_t)objc_msgSend(v13, "length") > 0xF)
  {
    v20 = (const void *)objc_msgSend(objc_retainAutorelease(v13), "bytes");
    v21 = objc_retainAutorelease(v12);
    v22 = CCCryptorCreateWithMode(v10, 4u, 0, 0, v20, (const void *)objc_msgSend(v21, "bytes"), objc_msgSend(v21, "length"), 0, 0, 0, 2u, &cryptorRef);
    if ((_DWORD)v22)
    {
      if (!a7)
        goto LABEL_11;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to create Crytpor {operation: %u, retval: %d}"), v10, v22);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v23 = (void *)MEMORY[0x1E0CB35C8];
      v48 = *MEMORY[0x1E0CB2938];
      v49 = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("IMNicknameEncryptionHelpersErrorDomain"), -2000, v24);
      *a7 = (id)objc_claimAutoreleasedReturnValue();

      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          v26 = *a7;
          *(_DWORD *)buf = 138412802;
          v43 = v26;
          v44 = 1024;
          v45 = v22;
          v46 = 1024;
          v47 = v10;
          _os_log_impl(&dword_19E239000, v25, OS_LOG_TYPE_INFO, "Failed to create cypher -- Failed to perform nickname crypto operation  {error: %@, retval: %d, operation: %d}", buf, 0x18u);
        }

      }
    }
    else
    {
      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", CCCryptorGetOutputLength(cryptorRef, objc_msgSend(v11, "length"), 1));
      dataOutMoved = 0;
      v28 = cryptorRef;
      v29 = objc_retainAutorelease(v11);
      v30 = (const void *)objc_msgSend(v29, "bytes");
      v31 = objc_msgSend(v29, "length");
      v14 = objc_retainAutorelease(v27);
      v32 = CCCryptorUpdate(v28, v30, v31, (void *)objc_msgSend(v14, "mutableBytes"), objc_msgSend(v14, "length"), &dataOutMoved);
      objc_msgSend(v14, "setLength:", dataOutMoved);
      if (cryptorRef)
        CCCryptorRelease(cryptorRef);
      if (!(_DWORD)v32)
      {
        a7 = (id *)v14;
        goto LABEL_10;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Crypto operation failed {operation: %u, retval: %d}"), v10, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)MEMORY[0x1E0CB35C8];
      v40 = *MEMORY[0x1E0CB2938];
      v41 = v33;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "errorWithDomain:code:userInfo:", CFSTR("IMNicknameEncryptionHelpersErrorDomain"), -2000, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          v43 = v36;
          v44 = 1024;
          v45 = v32;
          v46 = 1024;
          v47 = v10;
          _os_log_impl(&dword_19E239000, v37, OS_LOG_TYPE_INFO, "Failed to update cypher -- Failed to perform nickname crypto operation {error: %@, retval: %d, operation: %d}", buf, 0x18u);
        }

      }
      if (a7)
        *a7 = objc_retainAutorelease(v36);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("IV too short {IV: %@}"), v13);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v50 = *MEMORY[0x1E0CB2938];
    v51[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, &v50, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("IMNicknameEncryptionHelpersErrorDomain"), -1000, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v43 = v17;
        v44 = 1024;
        v45 = v10;
        _os_log_impl(&dword_19E239000, v18, OS_LOG_TYPE_INFO, "IV too short -- Failed to perform nickname crypto operation {error: %@, operation: %d}", buf, 0x12u);
      }

    }
    if (a7)
      *a7 = objc_retainAutorelease(v17);

  }
  a7 = 0;
LABEL_10:

LABEL_11:
  return a7;
}

+ (id)_fieldTagForFieldName:(id)a3 cipherData:(id)a4 IV:(id)a5 fieldTaggingKey:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v12 = a6;
  v13 = a5;
  v14 = a4;
  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");

  objc_msgSend(v16, "appendData:", v13);
  objc_msgSend(v16, "appendData:", v14);

  objc_msgSend(v12, "data");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_tagForData:key:error:", v16, v17, a7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  +[IMNicknameEncryptionFieldTag tagWithDataRepresentation:error:](IMNicknameEncryptionFieldTag, "tagWithDataRepresentation:error:", v18, a7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)_tagForData:(id)a3 key:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(v8, "length");
  if (a5 && !v10)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0CB2938];
    v16[0] = CFSTR("Passed empty data to tag calculation");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("IMNicknameEncryptionHelpersErrorDomain"), -1000, v12);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(a1, "_hmacForData:key:", v8, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)_hmacForData:(id)a3 key:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  const void *v10;
  size_t v11;
  id v12;
  const void *v13;
  size_t v14;
  id v15;

  v5 = (objc_class *)MEMORY[0x1E0C99DF0];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithLength:", 32);
  v9 = objc_retainAutorelease(v6);
  v10 = (const void *)objc_msgSend(v9, "bytes");
  v11 = objc_msgSend(v9, "length");

  v12 = objc_retainAutorelease(v7);
  v13 = (const void *)objc_msgSend(v12, "bytes");
  v14 = objc_msgSend(v12, "length");

  v15 = objc_retainAutorelease(v8);
  CCHmac(2u, v10, v11, v13, v14, (void *)objc_msgSend(v15, "mutableBytes"));
  return v15;
}

+ (id)_randomBytesWithLength:(unint64_t)a3 error:(id *)a4
{
  id v6;
  uint64_t Bytes;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  Bytes = CCRandomGenerateBytes((void *)objc_msgSend(v6, "mutableBytes"), a3);
  if ((_DWORD)Bytes)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Call to CCRandomGenerateBytes faield {status: %d}"), Bytes);
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0CB2938];
    v15[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("IMNicknameEncryptionHelpersErrorDomain"), -2000, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4)
      *a4 = objc_retainAutorelease(v11);

    v12 = 0;
  }
  else
  {
    v12 = v6;
  }

  return v12;
}

@end
