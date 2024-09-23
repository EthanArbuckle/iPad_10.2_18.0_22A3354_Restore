@implementation ICAESCipherUtils

+ (id)_ic_encrypt:(id)a3 withCipherKey:(id)a4 standardKeyLength:(unint64_t)a5 additionalAuthenticatedData:(id)a6 outputTag:(id *)a7 standardTagLength:(unint64_t)a8 outputInitializationVector:(id *)a9 standardInitializationVectorLength:(unint64_t)a10 error:(id *)a11
{
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v43;
  unint64_t v44;
  id *v45;
  id v46;
  id v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  _QWORD v52[2];
  _QWORD v53[2];
  uint64_t v54;
  id v55;
  uint64_t v56;
  _QWORD v57[3];

  v57[1] = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a6;
  if (a11)
  {
    *a11 = 0;
    if (!v16)
    {
      v28 = (void *)MEMORY[0x1E0CB35C8];
      v56 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("plainData is nil"));
      v20 = (id)objc_claimAutoreleasedReturnValue();
      v57[0] = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, &v56, 1);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      v22 = v28;
      v23 = 15;
      goto LABEL_12;
    }
    if (objc_msgSend(v17, "length") != a5)
    {
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v54 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Encrypting key length is %zu, but should be %ld."), objc_msgSend(v17, "length"), a5);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      v55 = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      v22 = v19;
      v23 = 1;
LABEL_12:
      objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("com.apple.notes.cipher"), v23, v21);
      v27 = 0;
      *a11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_25:

      goto LABEL_26;
    }
LABEL_7:
    v47 = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "ic_randomDataOfLength:error:", a10, &v47);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v47;
    *a9 = v24;
    if (v20)
    {
      if (!a11)
      {
        v27 = 0;
LABEL_26:

        goto LABEL_27;
      }
      v25 = (void *)MEMORY[0x1E0CB35C8];
      v52[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("IV generation failed"));
      v21 = (id)objc_claimAutoreleasedReturnValue();
      v52[1] = *MEMORY[0x1E0CB3388];
      v53[0] = v21;
      v53[1] = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 2);
      v26 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("com.apple.notes.cipher"), 2, v26);
      v27 = 0;
      *a11 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
    v45 = a7;
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", objc_msgSend(v16, "length"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", a8);
    v46 = (id)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v30 = objc_retainAutorelease(v18);
      objc_msgSend(v30, "bytes");
      objc_msgSend(v30, "length");
    }
    v31 = objc_retainAutorelease(v17);
    objc_msgSend(v31, "bytes");
    objc_msgSend(v31, "length");
    objc_msgSend(objc_retainAutorelease(*a9), "bytes");
    objc_msgSend(*a9, "length");
    v32 = objc_retainAutorelease(v16);
    objc_msgSend(v32, "bytes");
    v33 = objc_msgSend(v32, "length");
    v21 = objc_retainAutorelease(v29);
    v34 = objc_msgSend(v21, "mutableBytes");
    v26 = objc_retainAutorelease(v46);
    v43 = objc_msgSend(v26, "mutableBytes");
    v44 = a8;
    v35 = CCCryptorGCMOneshotEncrypt();
    if ((_DWORD)v35)
    {
      if (a11)
      {
        v36 = (void *)MEMORY[0x1E0CB35C8];
        v50 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CCCryptorGCM() encryption failed with status %d"), v35, v34, v43, v44);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = v37;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "errorWithDomain:code:userInfo:", CFSTR("com.apple.notes.cipher"), 3, v38);
        *a11 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      if (objc_msgSend(v26, "length", v33, v34, v43, a8) == a8)
      {
        v26 = objc_retainAutorelease(v26);
        *v45 = v26;
        v27 = (void *)objc_msgSend(v21, "copy");
LABEL_24:

        goto LABEL_25;
      }
      if (a11)
      {
        v39 = (void *)MEMORY[0x1E0CB35C8];
        v48 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Tag length changed to %zu during encryption, but should remain %ld"), a8, a8);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = v40;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "errorWithDomain:code:userInfo:", CFSTR("com.apple.notes.cipher"), 4, v41);
        *a11 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    v27 = 0;
    goto LABEL_24;
  }
  if (v16 && objc_msgSend(v17, "length") == a5)
    goto LABEL_7;
  v27 = 0;
LABEL_27:

  return v27;
}

+ (id)_ic_decrypt:(id)a3 withCipherKey:(id)a4 standardKeyLength:(unint64_t)a5 additionalAuthenticatedData:(id)a6 inputTag:(id)a7 standardTagLength:(unint64_t)a8 inputInitializationVector:(id)a9 standardInitializationVectorLength:(unint64_t)a10 error:(id *)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  _QWORD v56[3];

  v56[1] = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a6;
  v19 = a7;
  v20 = a9;
  if (a11)
  {
    *a11 = 0;
    if (!v16)
    {
      v28 = (void *)MEMORY[0x1E0CB35C8];
      v55 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cipherData is nil"));
      v22 = (id)objc_claimAutoreleasedReturnValue();
      v56[0] = v22;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, &v55, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v28;
      v25 = 16;
      goto LABEL_17;
    }
    if (objc_msgSend(v17, "length") != a5)
    {
      v29 = (void *)MEMORY[0x1E0CB35C8];
      v53 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decrypting key length is %zu, but should be %ld."), objc_msgSend(v17, "length"), a5);
      v22 = (id)objc_claimAutoreleasedReturnValue();
      v54 = v22;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "errorWithDomain:code:userInfo:", CFSTR("com.apple.notes.cipher"), 5, v30);
      *a11 = (id)objc_claimAutoreleasedReturnValue();

LABEL_18:
      v27 = 0;
LABEL_19:

      goto LABEL_20;
    }
    if (objc_msgSend(v20, "length") != a10)
    {
      v31 = (void *)MEMORY[0x1E0CB35C8];
      v51 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("IV length is %zu, but should remain %ld"), objc_msgSend(v19, "length"), a10);
      v22 = (id)objc_claimAutoreleasedReturnValue();
      v52 = v22;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v31;
      v25 = 14;
      goto LABEL_17;
    }
    if (objc_msgSend(v19, "length") != a8)
    {
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v49 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Tag length is %zu, but should remain %ld"), objc_msgSend(v19, "length"), a8);
      v22 = (id)objc_claimAutoreleasedReturnValue();
      v50 = v22;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v21;
      v25 = 4;
LABEL_17:
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("com.apple.notes.cipher"), v25, v23);
      *a11 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_18;
    }
LABEL_11:
    v46 = v18;
    if (v18)
    {
      v26 = objc_retainAutorelease(v18);
      objc_msgSend(v26, "bytes");
      objc_msgSend(v26, "length");
    }
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", objc_msgSend(v16, "length"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_retainAutorelease(v17);
    objc_msgSend(v34, "bytes");
    objc_msgSend(v34, "length");
    v35 = objc_retainAutorelease(v20);
    objc_msgSend(v35, "bytes");
    objc_msgSend(v35, "length");
    v36 = objc_retainAutorelease(v16);
    objc_msgSend(v36, "bytes");
    v37 = objc_msgSend(v36, "length");
    v22 = objc_retainAutorelease(v33);
    v38 = objc_msgSend(v22, "mutableBytes");
    v39 = objc_retainAutorelease(v19);
    v44 = objc_msgSend(v39, "bytes");
    v45 = objc_msgSend(v39, "length");
    v40 = CCCryptorGCMOneshotDecrypt();
    if ((_DWORD)v40)
    {
      if (a11)
      {
        v41 = (void *)MEMORY[0x1E0CB35C8];
        v47 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CCCryptorGCM() decryption failed with status %d"), v40, v38, v44, v45);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = v42;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "errorWithDomain:code:userInfo:", CFSTR("com.apple.notes.cipher"), 6, v43);
        *a11 = (id)objc_claimAutoreleasedReturnValue();

      }
      v27 = 0;
    }
    else
    {
      v27 = (void *)objc_msgSend(v22, "copy", v37, v38, v44, v45);
    }
    v18 = v46;
    goto LABEL_19;
  }
  if (v16
    && objc_msgSend(v17, "length") == a5
    && objc_msgSend(v20, "length") == a10
    && objc_msgSend(v19, "length") == a8)
  {
    goto LABEL_11;
  }
  v27 = 0;
LABEL_20:

  return v27;
}

+ (id)_ic_wrap:(id)a3 withWrapper:(id)a4 standardKeyLength:(unint64_t)a5 standardWrappedKeyLength:(unint64_t)a6 error:(id *)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const uint8_t *v20;
  size_t v21;
  id v22;
  const uint8_t *v23;
  size_t v24;
  id v25;
  const uint8_t *v26;
  size_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v37;
  size_t wrappedKeyLen;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  _QWORD v46[2];

  v46[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = v12;
  if (a7)
  {
    *a7 = 0;
    if (objc_msgSend(v12, "length") != a5)
    {
      v34 = (void *)MEMORY[0x1E0CB35C8];
      v45 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Wrapper key length is %zu when wrapping, but should be %ld."), objc_msgSend(v13, "length"), a5);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v46[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, &v45, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v34;
      v18 = 9;
      goto LABEL_11;
    }
    if (objc_msgSend(v11, "length") != a5)
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v43 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Raw key length is %zu when wrapping, but should be %ld."), objc_msgSend(v11, "length"), a5);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v44 = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v14;
      v18 = 10;
LABEL_11:
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("com.apple.notes.cipher"), v18, v16);
      *a7 = (id)objc_claimAutoreleasedReturnValue();

      a7 = 0;
LABEL_19:

      goto LABEL_20;
    }
LABEL_7:
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", a6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    wrappedKeyLen = objc_msgSend(v19, "length");
    v20 = (const uint8_t *)*MEMORY[0x1E0C803C8];
    v21 = *MEMORY[0x1E0C803D0];
    v22 = objc_retainAutorelease(v13);
    v23 = (const uint8_t *)objc_msgSend(v22, "bytes");
    v24 = objc_msgSend(v22, "length");
    v37 = v11;
    v25 = objc_retainAutorelease(v11);
    v26 = (const uint8_t *)objc_msgSend(v25, "bytes");
    v27 = objc_msgSend(v25, "length");
    v15 = objc_retainAutorelease(v19);
    v28 = CCSymmetricKeyWrap(1u, v20, v21, v23, v24, v26, v27, (uint8_t *)objc_msgSend(v15, "mutableBytes"), &wrappedKeyLen);
    if ((_DWORD)v28)
    {
      if (a7)
      {
        v29 = (void *)MEMORY[0x1E0CB35C8];
        v41 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CCSymmetricKeyWrap() wrapping failed with status %d"), v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v30;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v29;
        v33 = 8;
LABEL_17:
        objc_msgSend(v32, "errorWithDomain:code:userInfo:", CFSTR("com.apple.notes.cipher"), v33, v31);
        *a7 = (id)objc_claimAutoreleasedReturnValue();

        a7 = 0;
      }
    }
    else if (wrappedKeyLen == a6)
    {
      a7 = (id *)objc_msgSend(v15, "copy");
    }
    else if (a7)
    {
      v35 = (void *)MEMORY[0x1E0CB35C8];
      v39 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Wrapped key length is %zu, but should be %ld"), wrappedKeyLen, a6);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v30;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v35;
      v33 = 11;
      goto LABEL_17;
    }
    v11 = v37;
    goto LABEL_19;
  }
  if (objc_msgSend(v12, "length") == a5 && objc_msgSend(v11, "length") == a5)
    goto LABEL_7;
  a7 = 0;
LABEL_20:

  return a7;
}

+ (id)_ic_unwrap:(id)a3 withWrapper:(id)a4 standardKeyLength:(unint64_t)a5 standardWrappedKeyLength:(unint64_t)a6 error:(id *)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  const uint8_t *v18;
  size_t v19;
  id v20;
  const uint8_t *v21;
  size_t v22;
  id v23;
  const uint8_t *v24;
  size_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  id v36;
  size_t rawKeyLen;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = v12;
  if (a7)
  {
    *a7 = 0;
    if (objc_msgSend(v12, "length") != a5)
    {
      v32 = (void *)MEMORY[0x1E0CB35C8];
      v44 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Wrapper key length is %zu when unwrapping, but should be %ld."), objc_msgSend(v13, "length"), a5);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v45[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "errorWithDomain:code:userInfo:", CFSTR("com.apple.notes.cipher"), 9, v33);
      *a7 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_11;
    }
    if (objc_msgSend(v11, "length") != a6)
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v42 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Wrapped key length is %zu when unwrapping, but should be %ld."), objc_msgSend(v11, "length"), a6);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v43 = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("com.apple.notes.cipher"), 11, v16);
      *a7 = (id)objc_claimAutoreleasedReturnValue();

LABEL_11:
      a7 = 0;
LABEL_19:

      goto LABEL_20;
    }
LABEL_7:
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", a5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    rawKeyLen = objc_msgSend(v17, "length");
    v18 = (const uint8_t *)*MEMORY[0x1E0C803C8];
    v19 = *MEMORY[0x1E0C803D0];
    v20 = objc_retainAutorelease(v13);
    v21 = (const uint8_t *)objc_msgSend(v20, "bytes");
    v22 = objc_msgSend(v20, "length");
    v36 = v11;
    v23 = objc_retainAutorelease(v11);
    v24 = (const uint8_t *)objc_msgSend(v23, "bytes");
    v25 = objc_msgSend(v23, "length");
    v15 = objc_retainAutorelease(v17);
    v26 = CCSymmetricKeyUnwrap(1u, v18, v19, v21, v22, v24, v25, (uint8_t *)objc_msgSend(v15, "mutableBytes"), &rawKeyLen);
    if ((_DWORD)v26)
    {
      if (a7)
      {
        v27 = (void *)MEMORY[0x1E0CB35C8];
        v40 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CCSymmetricKeyUnwrap() unwrapping failed with status %d"), v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v28;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v27;
        v31 = 8;
LABEL_17:
        objc_msgSend(v30, "errorWithDomain:code:userInfo:", CFSTR("com.apple.notes.cipher"), v31, v29);
        *a7 = (id)objc_claimAutoreleasedReturnValue();

        a7 = 0;
      }
    }
    else if (rawKeyLen == a5)
    {
      a7 = (id *)objc_msgSend(v15, "copy");
    }
    else if (a7)
    {
      v34 = (void *)MEMORY[0x1E0CB35C8];
      v38 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unwrapped key length is %zu, but should be %ld"), rawKeyLen, a5);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v28;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v34;
      v31 = 10;
      goto LABEL_17;
    }
    v11 = v36;
    goto LABEL_19;
  }
  if (objc_msgSend(v12, "length") == a5 && objc_msgSend(v11, "length") == a6)
    goto LABEL_7;
  a7 = 0;
LABEL_20:

  return a7;
}

@end
