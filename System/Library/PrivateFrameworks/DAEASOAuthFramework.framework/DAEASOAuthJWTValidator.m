@implementation DAEASOAuthJWTValidator

- (DAEASOAuthJWTValidator)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DAEASOAuthJWTValidator.m"), 41, CFSTR("DAEASOAuthJWTValidator cannot be initialized with this method."));

  return 0;
}

- (DAEASOAuthJWTValidator)initWithIdToken:(id)a3
{
  id v5;
  DAEASOAuthJWTValidator *v6;
  void *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  NSString *rawHeader;
  uint64_t v14;
  NSString *rawPayload;
  uint64_t v16;
  NSString *rawSignature;
  uint64_t v18;
  NSData *decodedHeader;
  uint64_t v20;
  NSData *decodedPayload;
  uint64_t v22;
  NSData *decodedSignature;
  NSData *v24;
  uint64_t v25;
  id headerJSONObject;
  os_log_type_t v27;
  NSString *v28;
  const char *v29;
  DAEASOAuthJWTValidator *v30;
  NSData *v31;
  uint64_t v32;
  id payloadJSONObject;
  NSString *v34;
  void *v36;
  id v37;
  id v38;
  objc_super v39;
  uint8_t buf[4];
  id v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DAEASOAuthJWTValidator.m"), 46, CFSTR("DAEASOAuthJWTValidator cannot be initialized with nil idToken"));

  }
  v39.receiver = self;
  v39.super_class = (Class)DAEASOAuthJWTValidator;
  v6 = -[DAEASOAuthJWTValidator init](&v39, sel_init);
  if (!v6)
    goto LABEL_19;
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("."));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v7, "count") <= 2)
  {
    DALoggingwithCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
    if (os_log_type_enabled(v8, v9))
    {
      v10 = objc_msgSend(v7, "count");
      *(_DWORD *)buf = 138412546;
      v41 = v7;
      v42 = 2048;
      v43 = v10;
      _os_log_impl(&dword_21EC86000, v8, v9, "DAEASOAuthJWTValidator Error separating idToken components: %@ %lu", buf, 0x16u);
    }
    v11 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v12 = objc_claimAutoreleasedReturnValue();
  rawHeader = v6->_rawHeader;
  v6->_rawHeader = (NSString *)v12;

  objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
  v14 = objc_claimAutoreleasedReturnValue();
  rawPayload = v6->_rawPayload;
  v6->_rawPayload = (NSString *)v14;

  objc_msgSend(v7, "objectAtIndexedSubscript:", 2);
  v16 = objc_claimAutoreleasedReturnValue();
  rawSignature = v6->_rawSignature;
  v6->_rawSignature = (NSString *)v16;

  +[DAEASOAuthJWTValidator base64URLDecode:](DAEASOAuthJWTValidator, "base64URLDecode:", v6->_rawHeader);
  v18 = objc_claimAutoreleasedReturnValue();
  decodedHeader = v6->_decodedHeader;
  v6->_decodedHeader = (NSData *)v18;

  +[DAEASOAuthJWTValidator base64URLDecode:](DAEASOAuthJWTValidator, "base64URLDecode:", v6->_rawPayload);
  v20 = objc_claimAutoreleasedReturnValue();
  decodedPayload = v6->_decodedPayload;
  v6->_decodedPayload = (NSData *)v20;

  +[DAEASOAuthJWTValidator base64URLDecode:](DAEASOAuthJWTValidator, "base64URLDecode:", v6->_rawSignature);
  v22 = objc_claimAutoreleasedReturnValue();
  decodedSignature = v6->_decodedSignature;
  v6->_decodedSignature = (NSData *)v22;

  v24 = v6->_decodedHeader;
  v38 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v24, 4, &v38);
  v25 = objc_claimAutoreleasedReturnValue();
  v11 = v38;
  headerJSONObject = v6->_headerJSONObject;
  v6->_headerJSONObject = (id)v25;

  if (v11 || !v6->_headerJSONObject)
  {
    DALoggingwithCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    v27 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
    if (os_log_type_enabled(v8, v27))
    {
      v28 = v6->_rawHeader;
      *(_DWORD *)buf = 138412546;
      v41 = v11;
      v42 = 2112;
      v43 = (uint64_t)v28;
      v29 = "DAEASOAuthJWTValidator Error parsing JWT header: %@ %@";
LABEL_11:
      _os_log_impl(&dword_21EC86000, v8, v27, v29, buf, 0x16u);
    }
  }
  else
  {
    v31 = v6->_decodedPayload;
    v37 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v31, 1, &v37);
    v32 = objc_claimAutoreleasedReturnValue();
    v11 = v37;
    payloadJSONObject = v6->_payloadJSONObject;
    v6->_payloadJSONObject = (id)v32;

    if (!v11 && v6->_payloadJSONObject)
    {

LABEL_19:
      v30 = v6;
      goto LABEL_20;
    }
    DALoggingwithCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    v27 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
    if (os_log_type_enabled(v8, v27))
    {
      v34 = v6->_rawPayload;
      *(_DWORD *)buf = 138412546;
      v41 = v11;
      v42 = 2112;
      v43 = (uint64_t)v34;
      v29 = "DAEASOAuthJWTValidator Error parsing JWT payload: %@ %@";
      goto LABEL_11;
    }
  }
LABEL_12:

  v30 = 0;
LABEL_20:

  return v30;
}

- (BOOL)personalAccount
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  BOOL result;

  -[DAEASOAuthJWTValidator payloadJSONObject](self, "payloadJSONObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("tid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  result = 0;
  if (v4)
  {
    -[DAEASOAuthJWTValidator payloadJSONObject](self, "payloadJSONObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("tid"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("9188040d-6c67-4c5b-b112-36a304b66dad"));

    if ((v7 & 1) != 0)
      return 1;
  }
  return result;
}

- (BOOL)idTokenValidWithJWKS:(id)a3 withAudience:(id)a4 withIssuer:(id)a5
{
  __CFString *v8;
  __CFString *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  __CFString *v19;
  const char *v20;
  os_log_type_t v21;
  const char *v22;
  NSObject *v23;
  os_log_type_t v24;
  uint32_t v25;
  os_log_type_t v26;
  os_log_type_t v27;
  __CFString *payloadJSONObject;
  BOOL v29;
  void *v31;
  uint64_t v32;
  void *v33;
  double v34;
  NSObject *v35;
  double v36;
  NSObject *v37;
  os_log_type_t v38;
  __CFString *v39;
  void *v40;
  double v41;
  double v42;
  os_log_type_t v43;
  __CFString *v44;
  int v45;
  const __CFString *v46;
  __int16 v47;
  __CFString *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v8 = (__CFString *)a3;
  v9 = (__CFString *)a4;
  v10 = a5;
  v11 = v10;
  if (!v8 || !v9 || !v10)
  {
    DALoggingwithCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    v21 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
    if (!os_log_type_enabled(v14, v21))
      goto LABEL_16;
    v45 = 138412802;
    v46 = v8;
    v47 = 2112;
    v48 = v9;
    v49 = 2112;
    v50 = v11;
    v22 = "DAEASOAuthJWTValidator idToken could not be validated, nil params %@ %@ %@";
    v23 = v14;
    v24 = v21;
    v25 = 32;
LABEL_15:
    _os_log_impl(&dword_21EC86000, v23, v24, v22, (uint8_t *)&v45, v25);
    goto LABEL_16;
  }
  if (!-[DAEASOAuthJWTValidator _signatureValid:](self, "_signatureValid:", v8))
  {
    DALoggingwithCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    v26 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
    if (!os_log_type_enabled(v14, v26))
      goto LABEL_16;
    LOWORD(v45) = 0;
    v22 = "DAEASOAuthJWTValidator idToken could not be validated, invalid signature";
    v23 = v14;
    v24 = v26;
    v25 = 2;
    goto LABEL_15;
  }
  objc_msgSend(self->_payloadJSONObject, "objectForKeyedSubscript:", CFSTR("iss"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(self->_payloadJSONObject, "objectForKeyedSubscript:", CFSTR("tid"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", CFSTR("{tenantid}"), v13);
    v14 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(self->_payloadJSONObject, "objectForKeyedSubscript:", CFSTR("iss"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[NSObject caseInsensitiveCompare:](v14, "caseInsensitiveCompare:", v15);

    if (v16)
    {
      DALoggingwithCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
      if (os_log_type_enabled(v17, v18))
      {
        objc_msgSend(self->_payloadJSONObject, "objectForKeyedSubscript:", CFSTR("iss"));
        v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v45 = 138412546;
        v46 = (const __CFString *)v14;
        v47 = 2112;
        v48 = v19;
        v20 = "DAEASOAuthJWTValidator idToken could not be validated, issuer mismatch: %@ %@";
LABEL_24:
        _os_log_impl(&dword_21EC86000, v17, v18, v20, (uint8_t *)&v45, 0x16u);

      }
    }
    else
    {
      objc_msgSend(self->_payloadJSONObject, "objectForKeyedSubscript:", CFSTR("aud"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "isEqualToString:", v9);

      if ((v32 & 1) != 0)
      {
        objc_msgSend(self->_payloadJSONObject, "objectForKeyedSubscript:", CFSTR("nbf"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = (double)objc_msgSend(v33, "integerValue");

        v35 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE60]), "initWithTimeIntervalSinceNow:", 300.0);
        -[NSObject timeIntervalSince1970](v35, "timeIntervalSince1970");
        if (v36 >= v34)
        {
          objc_msgSend(self->_payloadJSONObject, "objectForKeyedSubscript:", CFSTR("exp"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = (double)objc_msgSend(v40, "integerValue");

          v17 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE60]), "initWithTimeIntervalSinceNow:", -300.0);
          -[NSObject timeIntervalSince1970](v17, "timeIntervalSince1970");
          if (v42 <= v41)
          {
            v29 = 1;
            goto LABEL_26;
          }
          DALoggingwithCategory();
          v37 = objc_claimAutoreleasedReturnValue();
          v43 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
          if (os_log_type_enabled(v37, v43))
          {
            -[NSObject timeIntervalSince1970](v17, "timeIntervalSince1970");
            v45 = 134218240;
            v46 = *(const __CFString **)&v41;
            v47 = 2048;
            v48 = v44;
            _os_log_impl(&dword_21EC86000, v37, v43, "DAEASOAuthJWTValidator idToken could not be validated, exp validation failed: %f %f", (uint8_t *)&v45, 0x16u);
          }
          v35 = v17;
        }
        else
        {
          DALoggingwithCategory();
          v37 = objc_claimAutoreleasedReturnValue();
          v38 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
          if (os_log_type_enabled(v37, v38))
          {
            -[NSObject timeIntervalSince1970](v35, "timeIntervalSince1970");
            v45 = 134218240;
            v46 = *(const __CFString **)&v34;
            v47 = 2048;
            v48 = v39;
            _os_log_impl(&dword_21EC86000, v37, v38, "DAEASOAuthJWTValidator idToken could not be validated, nbf validation failed: %f %f", (uint8_t *)&v45, 0x16u);
          }
        }

        v29 = 0;
        v17 = v35;
        goto LABEL_26;
      }
      DALoggingwithCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
      if (os_log_type_enabled(v17, v18))
      {
        objc_msgSend(self->_payloadJSONObject, "objectForKeyedSubscript:", CFSTR("aud"));
        v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v45 = 138412546;
        v46 = v9;
        v47 = 2112;
        v48 = v19;
        v20 = "DAEASOAuthJWTValidator idToken could not be validated, audience mismatch: %@ %@";
        goto LABEL_24;
      }
    }
    v29 = 0;
LABEL_26:

    goto LABEL_17;
  }
  DALoggingwithCategory();
  v14 = objc_claimAutoreleasedReturnValue();
  v27 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
  if (os_log_type_enabled(v14, v27))
  {
    payloadJSONObject = (__CFString *)self->_payloadJSONObject;
    v45 = 138412546;
    v46 = CFSTR("iss");
    v47 = 2112;
    v48 = payloadJSONObject;
    v22 = "DAEASOAuthJWTValidator idToken could not be validated, payload didn't contain the required key: %@ %@";
    v23 = v14;
    v24 = v27;
    v25 = 22;
    goto LABEL_15;
  }
LABEL_16:
  v29 = 0;
LABEL_17:

  return v29;
}

- (BOOL)_signatureValid:(id)a3
{
  __CFString *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  os_log_type_t v20;
  id v21;
  __CFError *payloadJSONObject;
  BOOL v23;
  os_log_type_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  const __CFData *v31;
  __SecCertificate *v32;
  __SecKey *v33;
  void *v34;
  SecKeyAlgorithm *v35;
  const __CFData *v36;
  NSData *decodedSignature;
  int v38;
  NSObject *v39;
  os_log_type_t v40;
  NSData *v41;
  NSObject *v42;
  os_log_type_t v43;
  NSData *v44;
  NSObject *v45;
  os_log_type_t v46;
  os_log_type_t v47;
  const __CFString *headerJSONObject;
  void *v50;
  const __CFData *signedData;
  void *v52;
  __CFString *v53;
  CFErrorRef error;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  id v59;
  uint8_t v60[128];
  uint8_t buf[4];
  id v62;
  __int16 v63;
  const __CFString *v64;
  __int16 v65;
  CFErrorRef v66;
  __int16 v67;
  const __CFString *v68;
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v4 = (__CFString *)a3;
  objc_msgSend(self->_headerJSONObject, "objectForKeyedSubscript:", CFSTR("kid"));
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        objc_msgSend(self->_payloadJSONObject, "objectForKeyedSubscript:", CFSTR("iss")),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    v59 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v4, 0, &v59);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v59;
    if (v9 || !v8)
    {
      DALoggingwithCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      v24 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
      if (os_log_type_enabled(v10, v24))
      {
        *(_DWORD *)buf = 138412546;
        v62 = v9;
        v63 = 2112;
        v64 = v4;
        _os_log_impl(&dword_21EC86000, v10, v24, "DAEASOAuthJWTValidator signature could not be validated: %@ %@", buf, 0x16u);
      }
      v23 = 0;
    }
    else
    {
      v53 = v4;
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v52 = v8;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("keys"));
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
      v12 = MEMORY[0x24BE2AD38];
      if (v11)
      {
        v13 = v11;
        v14 = *(_QWORD *)v56;
LABEL_7:
        v15 = 0;
        while (1)
        {
          if (*(_QWORD *)v56 != v14)
            objc_enumerationMutation(v10);
          v16 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v15);
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("kid"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(self->_headerJSONObject, "objectForKeyedSubscript:", CFSTR("kid"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v17, "isEqualToString:", v18);

          if (v19)
            break;
          if (v13 == ++v15)
          {
            v13 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
            v12 = MEMORY[0x24BE2AD38];
            if (v13)
              goto LABEL_7;
            goto LABEL_45;
          }
        }
        v25 = (void *)MEMORY[0x24BDD17C8];
        -[DAEASOAuthJWTValidator rawHeader](self, "rawHeader");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[DAEASOAuthJWTValidator rawPayload](self, "rawPayload");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "stringWithFormat:", CFSTR("%@.%@"), v26, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v28, "dataUsingEncoding:", 1);
        signedData = (const __CFData *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("x5c"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "firstObject");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        v31 = (const __CFData *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v30, 0);
        if (v31)
        {
          v50 = v28;
          v32 = SecCertificateCreateWithData(0, v31);
          v33 = SecCertificateCopyKey(v32);
          v12 = MEMORY[0x24BE2AD38];
          if (v32)
            CFRelease(v32);
          error = 0;
          objc_msgSend(self->_headerJSONObject, "objectForKeyedSubscript:", CFSTR("alg"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v34, "isEqualToString:", CFSTR("RS256")))
            v35 = (SecKeyAlgorithm *)MEMORY[0x24BDE9350];
          else
            v35 = (SecKeyAlgorithm *)MEMORY[0x24BDE92D8];

          v36 = signedData;
          if (v33)
          {
            if (signedData)
            {
              decodedSignature = self->_decodedSignature;
              if (decodedSignature)
              {
                v38 = SecKeyVerifySignature(v33, *v35, signedData, (CFDataRef)decodedSignature, &error);
                goto LABEL_34;
              }
            }
          }
          DALoggingwithCategory();
          v39 = objc_claimAutoreleasedReturnValue();
          v40 = *(_BYTE *)(v12 + 7);
          if (os_log_type_enabled(v39, v40))
          {
            v41 = self->_decodedSignature;
            *(_DWORD *)buf = 138412802;
            v62 = v33;
            v63 = 2112;
            v64 = (const __CFString *)signedData;
            v65 = 2112;
            v66 = (CFErrorRef)v41;
            _os_log_impl(&dword_21EC86000, v39, v40, "DAEASOAuthJWTValidator SecKeyVerifySignature not invoked with invalid params: %@ %@ %@", buf, 0x20u);
          }

          if (v33)
          {
            v38 = 0;
LABEL_34:
            CFRelease(v33);
            if (error)
            {
              DALoggingwithCategory();
              v42 = objc_claimAutoreleasedReturnValue();
              v43 = *(_BYTE *)(v12 + 7);
              if (os_log_type_enabled(v42, v43))
              {
                v44 = self->_decodedSignature;
                *(_DWORD *)buf = 138412802;
                v62 = signedData;
                v63 = 2112;
                v64 = (const __CFString *)v44;
                v65 = 2112;
                v66 = error;
                _os_log_impl(&dword_21EC86000, v42, v43, "DAEASOAuthJWTValidator Error occurred while verifying signature: %@ %@ %@", buf, 0x20u);
              }

            }
            v28 = v50;
            if (v38 == 1)
            {

              v23 = 1;
              goto LABEL_48;
            }
            goto LABEL_44;
          }
          v28 = v50;
        }
        else
        {
          DALoggingwithCategory();
          v45 = objc_claimAutoreleasedReturnValue();
          v12 = MEMORY[0x24BE2AD38];
          v46 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
          if (os_log_type_enabled(v45, v46))
          {
            *(_DWORD *)buf = 138412290;
            v62 = 0;
            _os_log_impl(&dword_21EC86000, v45, v46, "DAEASOAuthJWTValidator SecCertificateCreateWithData not invoked with invalid param: %@ ", buf, 0xCu);
          }

          v36 = signedData;
        }
LABEL_44:

      }
LABEL_45:

      DALoggingwithCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      v47 = *(_BYTE *)(v12 + 7);
      if (os_log_type_enabled(v10, v47))
      {
        headerJSONObject = (const __CFString *)self->_headerJSONObject;
        *(_DWORD *)buf = 138412546;
        v8 = v52;
        v62 = v52;
        v63 = 2112;
        v64 = headerJSONObject;
        _os_log_impl(&dword_21EC86000, v10, v47, "DAEASOAuthJWTValidator signature could not be validated: %@ %@", buf, 0x16u);
        v23 = 0;
        v9 = 0;
        v4 = v53;
      }
      else
      {
        v23 = 0;
LABEL_48:
        v9 = 0;
        v4 = v53;
        v8 = v52;
      }
    }

  }
  else
  {
    DALoggingwithCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    v20 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
    if (os_log_type_enabled(v9, v20))
    {
      v21 = self->_headerJSONObject;
      payloadJSONObject = (__CFError *)self->_payloadJSONObject;
      *(_DWORD *)buf = 138413058;
      v62 = v21;
      v63 = 2112;
      v64 = CFSTR("kid");
      v65 = 2112;
      v66 = payloadJSONObject;
      v67 = 2112;
      v68 = CFSTR("iss");
      _os_log_impl(&dword_21EC86000, v9, v20, "DAEASOAuthJWTValidator signature could not be validated, keys not found %@ %@ %@ %@", buf, 0x2Au);
    }
    v23 = 0;
  }

  return v23;
}

+ (id)base64URLDecode:(id)a3
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  NSObject *v9;
  os_log_type_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v3, "length") & 3;
    if (v5)
    {
      v6 = (4 - v5);
      objc_msgSend(MEMORY[0x24BDD17C8], "string");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringByPaddingToLength:withString:startingAtIndex:", v6, CFSTR("="), 0);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = &stru_24E370C58;
    }
    objc_msgSend(v4, "stringByAppendingString:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("+"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("/"));
    v9 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v9, 0);
  }
  else
  {
    DALoggingwithCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
    if (os_log_type_enabled(v9, v10))
    {
      v15 = 138412290;
      v16 = 0;
      _os_log_impl(&dword_21EC86000, v9, v10, "DAEASOAuthJWTValidator cannot base64URLDecode: %@", (uint8_t *)&v15, 0xCu);
    }
    v11 = 0;
  }

  return v11;
}

+ (id)base64URLEncode:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v8;
  os_log_type_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    objc_msgSend(a3, "base64EncodedStringWithOptions:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("+"), CFSTR("-"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR("_"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("="), &stru_24E370C58);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  else
  {
    DALoggingwithCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
    if (os_log_type_enabled(v8, v9))
    {
      v10 = 138412290;
      v11 = 0;
      _os_log_impl(&dword_21EC86000, v8, v9, "DAEASOAuthJWTValidator cannot base64URLEncode: %@", (uint8_t *)&v10, 0xCu);
    }

    return 0;
  }
}

- (NSString)rawHeader
{
  return self->_rawHeader;
}

- (void)setRawHeader:(id)a3
{
  objc_storeStrong((id *)&self->_rawHeader, a3);
}

- (NSString)rawPayload
{
  return self->_rawPayload;
}

- (void)setRawPayload:(id)a3
{
  objc_storeStrong((id *)&self->_rawPayload, a3);
}

- (NSString)rawSignature
{
  return self->_rawSignature;
}

- (void)setRawSignature:(id)a3
{
  objc_storeStrong((id *)&self->_rawSignature, a3);
}

- (NSData)decodedHeader
{
  return self->_decodedHeader;
}

- (void)setDecodedHeader:(id)a3
{
  objc_storeStrong((id *)&self->_decodedHeader, a3);
}

- (NSData)decodedPayload
{
  return self->_decodedPayload;
}

- (void)setDecodedPayload:(id)a3
{
  objc_storeStrong((id *)&self->_decodedPayload, a3);
}

- (NSData)decodedSignature
{
  return self->_decodedSignature;
}

- (void)setDecodedSignature:(id)a3
{
  objc_storeStrong((id *)&self->_decodedSignature, a3);
}

- (id)headerJSONObject
{
  return self->_headerJSONObject;
}

- (void)setHeaderJSONObject:(id)a3
{
  objc_storeStrong(&self->_headerJSONObject, a3);
}

- (id)payloadJSONObject
{
  return self->_payloadJSONObject;
}

- (void)setPayloadJSONObject:(id)a3
{
  objc_storeStrong(&self->_payloadJSONObject, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_payloadJSONObject, 0);
  objc_storeStrong(&self->_headerJSONObject, 0);
  objc_storeStrong((id *)&self->_decodedSignature, 0);
  objc_storeStrong((id *)&self->_decodedPayload, 0);
  objc_storeStrong((id *)&self->_decodedHeader, 0);
  objc_storeStrong((id *)&self->_rawSignature, 0);
  objc_storeStrong((id *)&self->_rawPayload, 0);
  objc_storeStrong((id *)&self->_rawHeader, 0);
}

@end
