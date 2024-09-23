@implementation ICCipherV1Neo

+ (id)keyForPassphrase:(id)a3 salt:(id)a4 iterationCount:(unint64_t)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  size_t v21;
  id v22;
  const uint8_t *v23;
  size_t v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  char *password;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (objc_msgSend(v9, "length"))
  {
    if (objc_msgSend(v10, "length") == 32)
    {
      if (a5 - 0x100000000 > 0xFFFFFFFF00000000)
      {
        objc_msgSend(v9, "precomposedStringWithCanonicalMapping");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "dataUsingEncoding:", 4);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 32);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_retainAutorelease(v19);
        password = (char *)objc_msgSend(v12, "bytes");
        v21 = objc_msgSend(v12, "length");
        v22 = objc_retainAutorelease(v10);
        v23 = (const uint8_t *)objc_msgSend(v22, "bytes");
        v24 = objc_msgSend(v22, "length");
        v25 = objc_retainAutorelease(v20);
        v26 = CCKeyDerivationPBKDF(2u, password, v21, v23, v24, 3u, a5, (uint8_t *)objc_msgSend(v25, "mutableBytes"), objc_msgSend(v25, "length"));
        if ((_DWORD)v26)
        {
          if (a6)
          {
            v27 = (void *)MEMORY[0x1E0CB35C8];
            v32 = *MEMORY[0x1E0CB2D50];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CCKeyDerivationPBKDF() key derivation failed with status %d"), v26);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = v28;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("com.apple.notes.cipher"), 13, v29);
            *a6 = (id)objc_claimAutoreleasedReturnValue();

          }
          v15 = 0;
        }
        else
        {
          v15 = v25;
        }

        goto LABEL_18;
      }
      if (a6)
      {
        v11 = (void *)MEMORY[0x1E0CB35C8];
        v34 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Iteration count is %lu"), a5);
        v12 = (id)objc_claimAutoreleasedReturnValue();
        v35 = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("com.apple.notes.cipher"), 19, v13);
        *a6 = (id)objc_claimAutoreleasedReturnValue();

LABEL_10:
        v15 = 0;
        goto LABEL_18;
      }
    }
    else if (a6)
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v36 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Salt length is %lu, but should be %lu"), objc_msgSend(v10, "length"), 32);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v37 = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("com.apple.notes.cipher"), 12, v17);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    }
  }
  else if (a6)
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v38 = *MEMORY[0x1E0CB2D50];
    v39[0] = CFSTR("Passphrase is nil or zero length");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("com.apple.notes.cipher"), 18, v12);
    v15 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:

    goto LABEL_19;
  }
  v15 = 0;
LABEL_19:

  return v15;
}

+ (id)wrapKey:(id)a3 withWrapper:(id)a4 error:(id *)a5
{
  return +[ICCipherV2 wrapKey:withWrapper:error:](ICCipherV2, "wrapKey:withWrapper:error:", a3, a4, a5);
}

+ (id)unwrapKey:(id)a3 withWrapper:(id)a4 error:(id *)a5
{
  return +[ICCipherV2 unwrapKey:withWrapper:error:](ICCipherV2, "unwrapKey:withWrapper:error:", a3, a4, a5);
}

+ (id)encryptData:(id)a3 withKey:(id)a4 additionalAuthenticatedData:(id)a5 error:(id *)a6
{
  return +[ICCipherV2 encryptData:withKey:additionalAuthenticatedData:error:](ICCipherV2, "encryptData:withKey:additionalAuthenticatedData:error:", a3, a4, a5, a6);
}

+ (id)decryptData:(id)a3 withKey:(id)a4 additionalAuthenticatedData:(id)a5 error:(id *)a6
{
  return +[ICCipherV2 decryptData:withKey:additionalAuthenticatedData:error:](ICCipherV2, "decryptData:withKey:additionalAuthenticatedData:error:", a3, a4, a5, a6);
}

@end
