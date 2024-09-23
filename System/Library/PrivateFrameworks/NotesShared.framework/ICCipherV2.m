@implementation ICCipherV2

+ (int64_t)standardWrappedKeyLength
{
  return (int)*MEMORY[0x1E0C803D0] + 32;
}

+ (id)wrapKey:(id)a3 withWrapper:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = a3;
  +[ICAESCipherUtils _ic_wrap:withWrapper:standardKeyLength:standardWrappedKeyLength:error:](ICAESCipherUtils, "_ic_wrap:withWrapper:standardKeyLength:standardWrappedKeyLength:error:", v9, v8, 32, objc_msgSend(a1, "standardWrappedKeyLength"), a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)unwrapKey:(id)a3 withWrapper:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = a3;
  +[ICAESCipherUtils _ic_unwrap:withWrapper:standardKeyLength:standardWrappedKeyLength:error:](ICAESCipherUtils, "_ic_unwrap:withWrapper:standardKeyLength:standardWrappedKeyLength:error:", v9, v8, 32, objc_msgSend(a1, "standardWrappedKeyLength"), a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)encryptData:(id)a3 withKey:(id)a4 additionalAuthenticatedData:(id)a5 error:(id *)a6
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v12;
  id v13;

  v12 = 0;
  v13 = 0;
  +[ICAESCipherUtils _ic_encrypt:withCipherKey:standardKeyLength:additionalAuthenticatedData:outputTag:standardTagLength:outputInitializationVector:standardInitializationVectorLength:error:](ICAESCipherUtils, "_ic_encrypt:withCipherKey:standardKeyLength:additionalAuthenticatedData:outputTag:standardTagLength:outputInitializationVector:standardInitializationVectorLength:error:", a3, a4, 32, a5, &v13, 16, &v12, 32, a6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;
  v9 = v12;
  objc_msgSend(a1, "serializedData:initializationVector:tag:", v7, v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)decryptData:(id)a3 withKey:(id)a4 additionalAuthenticatedData:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    v22 = 0;
    v23 = 0;
    objc_msgSend(a1, "deserializedData:initializationVector:tag:", v10, &v23, &v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v23;
    v15 = v22;
    if (v15 && v14 && v13)
    {
      +[ICAESCipherUtils _ic_decrypt:withCipherKey:standardKeyLength:additionalAuthenticatedData:inputTag:standardTagLength:inputInitializationVector:standardInitializationVectorLength:error:](ICAESCipherUtils, "_ic_decrypt:withCipherKey:standardKeyLength:additionalAuthenticatedData:inputTag:standardTagLength:inputInitializationVector:standardInitializationVectorLength:error:", v13, v11, 32, v12, v15, 16, v14, 32, a6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a6)
      {
        v21 = (void *)MEMORY[0x1E0CB35C8];
        v24 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cipherData cannot be parsed"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v18;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("com.apple.notes.cipher"), 17, v19);
        *a6 = (id)objc_claimAutoreleasedReturnValue();

      }
      v16 = 0;
    }

  }
  else
  {
    if (!a6)
    {
      v16 = 0;
      goto LABEL_13;
    }
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v26 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cipherData is nil"));
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v27[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("com.apple.notes.cipher"), 16, v14);
    v16 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_13:
  return v16;
}

+ (id)serializedData:(id)a3 initializationVector:(id)a4 tag:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v9, "appendData:", v8);

  objc_msgSend(v9, "appendData:", v7);
  v10 = (void *)objc_msgSend(v9, "copy");

  return v10;
}

+ (id)deserializedData:(id)a3 initializationVector:(id *)a4 tag:(id *)a5
{
  id v7;
  void *v8;

  v7 = a3;
  if ((unint64_t)objc_msgSend(v7, "length") >= 0x30)
  {
    if (a4)
    {
      objc_msgSend(v7, "subdataWithRange:", objc_msgSend(v7, "length") - 48, 32);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (a5)
    {
      objc_msgSend(v7, "subdataWithRange:", objc_msgSend(v7, "length") - 16, 16);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "subdataWithRange:", 0, objc_msgSend(v7, "length") - 48);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
