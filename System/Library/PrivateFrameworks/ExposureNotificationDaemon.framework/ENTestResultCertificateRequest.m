@implementation ENTestResultCertificateRequest

+ (id)certificateRequestWithToken:(id)a3 temporaryExposureKeys:(id)a4 APIKey:(id)a5 requestURL:(id)a6 URLSession:(id)a7 queue:(id)a8 error:(id *)a9
{
  id *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  id v29;

  v15 = a9;
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  NSRandomData();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  if (v22)
  {
    v15 = (id *)objc_msgSend(objc_alloc((Class)a1), "initWithRequestURL:URLSession:queue:", v19, v20, v21);
    objc_msgSend(v15, "setAPIKey:", v18);
    v24 = objc_msgSend(v16, "copy");
    v25 = v15[10];
    v15[10] = (id)v24;

    v26 = objc_msgSend(v22, "copy");
    v27 = v15[11];
    v15[11] = (id)v26;

    objc_msgSend((id)objc_opt_class(), "deriveHMACForTemporaryExposureKeys:symmetricKey:", v17, v22);
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = v15[12];
    v15[12] = (id)v28;

  }
  else if (a9)
  {
    ENNestedErrorF();
    v15 = 0;
    *a9 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (id)bodyJSON
{
  NSString *token;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  token = self->_token;
  v6[0] = CFSTR("token");
  v6[1] = CFSTR("ekeyhmac");
  v7[0] = token;
  -[NSData base64EncodedStringWithOptions:](self->_HMAC, "base64EncodedStringWithOptions:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D88], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)handleResponse:(id)a3 body:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_storeStrong((id *)&self->_certificate, v6);
    v7 = 0;
  }
  else
  {
    ENTestResultErrorF(4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (id)deriveHMACForTemporaryExposureKeys:(id)a3 symmetricKey:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  id v24;
  const char *v25;
  id v26;
  void *v27;
  id v29;
  void *v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _OWORD v40[2];
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v29 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0C99E00]);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v37 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v12, "keyData");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "base64EncodedStringWithOptions:", 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, v14);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    }
    while (v9);
  }
  v30 = v7;

  v15 = objc_alloc_init(MEMORY[0x1E0CB3798]);
  objc_msgSend(v6, "allKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sortedArrayUsingSelector:", sel_compare_);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v17;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v33;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v33 != v20)
          objc_enumerationMutation(obj);
        v22 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j);
        objc_msgSend(v6, "objectForKeyedSubscript:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "length"))
          objc_msgSend(v15, "appendString:", CFSTR(","));
        objc_msgSend(v15, "appendFormat:", CFSTR("%@.%u.%u.%u"), v22, objc_msgSend(v23, "rollingStartNumber"), objc_msgSend(v23, "rollingPeriod"), objc_msgSend(v23, "transmissionRiskLevel"));

      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
    }
    while (v19);
  }

  v24 = objc_retainAutorelease(v15);
  v25 = (const char *)objc_msgSend(v24, "UTF8String");
  memset(v40, 0, sizeof(v40));
  ccsha256_di();
  objc_msgSend(v29, "length");
  v26 = objc_retainAutorelease(v29);
  objc_msgSend(v26, "bytes");
  strlen(v25);
  cchmac();
  objc_msgSend(MEMORY[0x1E0C99D58], "dataWithBytes:length:", v40, 32);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (NSString)token
{
  return self->_token;
}

- (NSData)symmetricKey
{
  return self->_symmetricKey;
}

- (NSData)HMAC
{
  return self->_HMAC;
}

- (NSString)certificate
{
  return self->_certificate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_certificate, 0);
  objc_storeStrong((id *)&self->_HMAC, 0);
  objc_storeStrong((id *)&self->_symmetricKey, 0);
  objc_storeStrong((id *)&self->_token, 0);
}

@end
