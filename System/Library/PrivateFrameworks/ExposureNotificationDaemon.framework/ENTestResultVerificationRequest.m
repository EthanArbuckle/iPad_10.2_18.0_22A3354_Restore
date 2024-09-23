@implementation ENTestResultVerificationRequest

+ (id)verificationRequestWithCode:(id)a3 acceptedReportTypes:(id)a4 APIKey:(id)a5 nonce:(id)a6 requestURL:(id)a7 URLSession:(id)a8 queue:(id)a9 error:(id *)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  objc_class *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v43 = a7;
  v45 = a8;
  v44 = a9;
  if (objc_msgSend(v17, "count"))
  {
    v40 = v19;
    v41 = v18;
    v20 = (objc_class *)a1;
    v21 = v16;
    DiagnosisReportTypeToServerStringMap();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_alloc_init(MEMORY[0x1E0C99E28]);
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v42 = v17;
    v24 = v17;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v47;
      while (2)
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v47 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
          objc_msgSend(v22, "objectForKeyedSubscript:", v29);
          v30 = objc_claimAutoreleasedReturnValue();
          if (!v30)
          {
            v16 = v21;
            v17 = v42;
            v32 = v43;
            v19 = v40;
            if (a10)
            {
              objc_msgSend(v29, "unsignedIntValue");
              ENErrorF();
              *a10 = (id)objc_claimAutoreleasedReturnValue();
            }

            v33 = 0;
            v18 = v41;
            goto LABEL_19;
          }
          v31 = (void *)v30;
          objc_msgSend(v23, "addObject:", v30);

        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
        if (v26)
          continue;
        break;
      }
    }

    v32 = v43;
    v33 = objc_msgSend([v20 alloc], "initWithRequestURL:URLSession:queue:", v43, v45, v44);
    v18 = v41;
    objc_msgSend((id)v33, "setAPIKey:", v41);
    v16 = v21;
    v34 = objc_msgSend(v21, "copy");
    v35 = *(void **)(v33 + 80);
    *(_QWORD *)(v33 + 80) = v34;

    v36 = objc_msgSend(v23, "copy");
    v37 = *(void **)(v33 + 88);
    *(_QWORD *)(v33 + 88) = v36;

    v19 = v40;
    if (v40)
      v38 = (void *)objc_msgSend(v40, "copy");
    else
      v38 = 0;
    objc_storeStrong((id *)(v33 + 96), v38);
    if (v40)

    objc_msgSend((id)v33, "setPaddedRequestSize:", 3072);
    v17 = v42;
LABEL_19:

  }
  else
  {
    if (a10)
    {
      ENErrorF();
      v33 = 0;
      *a10 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v33 = 0;
    }
    v32 = v43;
  }

  return (id)v33;
}

- (id)bodyJSON
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E00]);
  -[NSSet allObjects](self->_acceptedTestTypes, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("accept"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_verificationCode, CFSTR("code"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_nonce, CFSTR("nonce"));
  v5 = (void *)objc_msgSend(v3, "copy");

  return v5;
}

- (id)errorForUnsuccessfulResponse:(id)a3 body:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {

LABEL_5:
    v11.receiver = self;
    v11.super_class = (Class)ENTestResultVerificationRequest;
    -[ENTestResultNetworkRequest errorForUnsuccessfulResponse:body:](&v11, sel_errorForUnsuccessfulResponse_body_, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  -[ENTestResultVerificationRequest _testVerificationErrorForErrorCodeString:](self, "_testVerificationErrorForErrorCodeString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    goto LABEL_5;
LABEL_6:

  return v9;
}

- (id)_testVerificationErrorForErrorCodeString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  objc_msgSend(&unk_1E87EE1B0, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && ((v6 = objc_msgSend(v4, "integerValue"), v6 == 12) || v6 == 3 || v6 == 2))
  {
    ENTestResultErrorF(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)handleResponse:(id)a3 body:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NSDictionary *v10;
  NSDictionary *metadata;
  NSString *v12;
  NSString *token;
  id v14;
  id v16;

  v5 = a4;
  v16 = 0;
  objc_msgSend((id)objc_opt_class(), "_metadataFromVerificationResponseDictionary:error:", v5, &v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v16;
  v8 = v7;
  if (v6)
  {
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (NSDictionary *)objc_msgSend(v6, "copy");
      metadata = self->_metadata;
      self->_metadata = v10;

      v12 = (NSString *)objc_msgSend(v9, "copy");
      token = self->_token;
      self->_token = v12;

      v14 = 0;
    }
    else
    {
      ENTestResultErrorF(4);
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v14 = v7;
  }

  return v14;
}

+ (id)_metadataFromVerificationResponseDictionary:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v20[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  int v27;
  _QWORD v28[4];
  id v29;

  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99E00]);
  v7 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __85__ENTestResultVerificationRequest__metadataFromVerificationResponseDictionary_error___block_invoke;
  v28[3] = &unk_1E87D9E00;
  v8 = v5;
  v29 = v8;
  v9 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17A7E5C](v28);
  v27 = 0;
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "length"))
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__1;
    v25 = __Block_byref_object_dispose__1;
    v26 = &unk_1E87EDEE0;
    objc_msgSend(v10, "lowercaseString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    DiagnosisReportTypeToServerStringMap();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v7;
    v20[1] = 3221225472;
    v20[2] = __85__ENTestResultVerificationRequest__metadataFromVerificationResponseDictionary_error___block_invoke_36;
    v20[3] = &unk_1E87D9E28;
    v20[4] = v11;
    v20[5] = &v21;
    objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v20);

    objc_msgSend(v6, "setObject:forKeyedSubscript:", v22[5], *MEMORY[0x1E0CAA268]);
    _Block_object_dispose(&v21, 8);

  }
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v27 != -6727 && v27)
  {
    if (a4)
    {
      ((void (**)(_QWORD, const __CFString *))v9)[2](v9, CFSTR("symptomDate"));
      v18 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  if (objc_msgSend(v13, "length"))
  {
    v15 = objc_alloc_init(MEMORY[0x1E0CB36A0]);
    objc_msgSend(v15, "setFormatOptions:", 275);
    objc_msgSend(v15, "dateFromString:", v14);
    v16 = objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = (void *)v16;
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0CAA280]);
      objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA8], *MEMORY[0x1E0CAA270]);

      goto LABEL_8;
    }
    if (a4)
    {
      ((void (**)(_QWORD, const __CFString *))v9)[2](v9, CFSTR("symptomDate"));
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_14:
    v18 = 0;
    goto LABEL_15;
  }
LABEL_8:
  v18 = (void *)objc_msgSend(v6, "copy");
LABEL_15:

  return v18;
}

id __85__ENTestResultVerificationRequest__metadataFromVerificationResponseDictionary_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ENTestResultErrorF(4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __85__ENTestResultVerificationRequest__metadataFromVerificationResponseDictionary_error___block_invoke_36(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v8 = *(void **)(a1 + 32);
  objc_msgSend(a3, "lowercaseString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v8, "isEqualToString:", v9);

  if ((_DWORD)v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (NSString)verificationCode
{
  return self->_verificationCode;
}

- (NSSet)acceptedTestTypes
{
  return self->_acceptedTestTypes;
}

- (NSString)nonce
{
  return self->_nonce;
}

- (NSString)token
{
  return self->_token;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_acceptedTestTypes, 0);
  objc_storeStrong((id *)&self->_verificationCode, 0);
}

@end
