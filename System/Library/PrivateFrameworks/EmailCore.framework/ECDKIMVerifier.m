@implementation ECDKIMVerifier

void ___ef_log_ECDKIMVerifier_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email", "ECDKIMVerifier");
  v1 = (void *)_ef_log_ECDKIMVerifier_log;
  _ef_log_ECDKIMVerifier_log = (uint64_t)v0;

}

- (ECDKIMVerifier)initWithPublicKeySource:(id)a3
{
  id v5;
  ECDKIMVerifier *v6;
  ECDKIMVerifier *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ECDKIMVerifier;
  v6 = -[ECDKIMVerifier init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_publicKeySource, a3);

  return v7;
}

- (ECDKIMVerifier)init
{
  ECDNSClient *v3;
  ECDKIMVerifier *v4;

  v3 = objc_alloc_init(ECDNSClient);
  v4 = -[ECDKIMVerifier initWithPublicKeySource:](self, "initWithPublicKeySource:", v3);

  return v4;
}

- (id)verifiableMessageForMessageData:(id)a3 dkimSignatureHeaders:(id *)a4 error:(id *)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  ECDKIMMessageHeader *v17;
  void *v18;
  void *v19;
  ECDKIMMessageHeader *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  char v28;
  NSObject *v29;
  ECDKIMVerifiableMessage *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  id *v35;
  void *v36;
  void *v37;
  ECRawMessageHeaders *v38;
  void *v39;
  void *v40;
  id *v41;
  void *v42;
  id v43;
  id v44;
  char v45;
  _BYTE v46[15];
  char v47;
  _BYTE v48[7];
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  int v54;
  uint8_t buf[4];
  uint64_t v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v43 = a3;
  if (a4)
    *a4 = 0;
  if (a5)
    *a5 = 0;
  v54 = 168626701;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v54, 4);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v43, "ef_rangeOfData:");
  v9 = v8;
  v41 = a5;
  if (v8)
  {
    v10 = v7;
    objc_msgSend(v43, "ef_subdataToIndex:", objc_msgSend(CFSTR("\r\n"), "length") + v7);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v39, 4);
    objc_msgSend(v43, "ef_subdataFromIndex:", v10 + v9);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = -[ECRawMessageHeaders initWithHeaderString:]([ECRawMessageHeaders alloc], "initWithHeaderString:", v40);
    -[ECRawMessageHeaders headersForKey:](v38, "headersForKey:", CFSTR("dkim-signature"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = a4;
    v44 = (id)objc_opt_new();
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v11 = v36;
    v12 = 0;
    v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v51 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
          v17 = [ECDKIMMessageHeader alloc];
          objc_msgSend(v16, "transmittedName");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "body");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = 0;
          v20 = -[ECDKIMMessageHeader initWithHeaderFieldName:headerBody:error:](v17, "initWithHeaderFieldName:headerBody:error:", v18, v19, &v49);
          v21 = v49;

          if (v21)
          {
            _ef_log_ECDKIMVerifier();
            v22 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v21, "ef_publicDescription");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              -[ECDKIMVerifier verifiableMessageForMessageData:dkimSignatureHeaders:error:].cold.4(v23, buf, &v56, v22);
            }

            v12 = v21;
          }
          else
          {
            -[ECDKIMMessageHeader agentOrUserIdentifier](v20, "agentOrUserIdentifier");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[ECDKIMMessageHeader signingDomainIdentifier](v20, "signingDomainIdentifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v24, "ef_hasCaseInsensitiveSuffix:", v25);

            if ((v26 & 1) != 0)
            {
              -[ECDKIMMessageHeader signedHeaderFields](v20, "signedHeaderFields");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = objc_msgSend(v27, "containsObject:", CFSTR("from"));

              if ((v28 & 1) != 0)
              {
                objc_msgSend(v44, "addObject:", v20);
                v12 = 0;
                goto LABEL_23;
              }
              _ef_log_ECDKIMVerifier();
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                -[ECDKIMVerifier verifiableMessageForMessageData:dkimSignatureHeaders:error:].cold.2(&v45, v46);
            }
            else
            {
              _ef_log_ECDKIMVerifier();
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                -[ECDKIMVerifier verifiableMessageForMessageData:dkimSignatureHeaders:error:].cold.3(&v47, v48);
            }

            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ECDKIMVerifier"), 1, 0);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
          }
LABEL_23:

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
      }
      while (v13);
    }

    if (objc_msgSend(v44, "count") || !v12)
    {
      if (v35)
        *v35 = objc_retainAutorelease(v44);
      v30 = -[ECDKIMVerifiableMessage initWithHeaders:bodyData:]([ECDKIMVerifiableMessage alloc], "initWithHeaders:bodyData:", v38, v37);
    }
    else
    {
      v30 = 0;
      if (v41)
        *v41 = objc_retainAutorelease(v12);
    }

  }
  else
  {
    _ef_log_ECDKIMVerifier();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      -[ECDKIMVerifier verifiableMessageForMessageData:dkimSignatureHeaders:error:].cold.1(v31, v32, v33);

    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ECDKIMVerifier"), 1, 0);
      v30 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v30 = 0;
    }
  }

  return v30;
}

- (BOOL)verifyMessageData:(id)a3
{
  return -[ECDKIMVerifier verifyMessageData:options:](self, "verifyMessageData:options:", a3, 3);
}

- (BOOL)verifyMessageData:(id)a3 options:(int64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  id v10;

  v10 = 0;
  -[ECDKIMVerifier verifiableMessageForMessageData:dkimSignatureHeaders:error:](self, "verifiableMessageForMessageData:dkimSignatureHeaders:error:", a3, &v10, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v10;
  -[ECDKIMVerifier verifyMessage:withDKIMSignatureHeaders:options:error:](self, "verifyMessage:withDKIMSignatureHeaders:options:error:", v6, v7, a4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8 != 0;
}

- (id)verifyMessage:(id)a3 withDKIMSignatureHeaders:(id)a4 options:(int64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;

  v10 = a3;
  v11 = a4;
  -[ECDKIMVerifier publicKeySource](self, "publicKeySource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ECDKIMVerifier _verifyMessage:withDKIMSignatureHeaders:publicKeySource:options:error:](self, "_verifyMessage:withDKIMSignatureHeaders:publicKeySource:options:error:", v10, v11, v12, a5, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_verifyMessage:(id)a3 withDKIMSignatureHeaders:(id)a4 publicKeySource:(id)a5 options:(int64_t)a6 error:(id *)a7
{
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  id v26;
  id obj;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  v11 = a4;
  v26 = a5;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v11;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v31;
LABEL_3:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v31 != v13)
        objc_enumerationMutation(obj);
      v15 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v14);
      if ((a6 & 2) != 0)
      {
        objc_msgSend(v28, "bodyData");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[ECDKIMVerifier _verifyMessageBodyData:withOptions:usingSignature:](self, "_verifyMessageBodyData:withOptions:usingSignature:", v17, a6, v15);

      }
      else
      {
        v16 = 1;
      }
      if ((a6 & 1) != 0)
      {
        objc_msgSend(v28, "headers");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 0;
        v18 = -[ECDKIMVerifier _verifyMessageHeaders:usingSignature:publicKeySource:error:](self, "_verifyMessageHeaders:usingSignature:publicKeySource:error:", v19, v15, v26, &v29);
        v20 = v29;

        if (v20)
        {
          if (a7)
          {
            v22 = (void *)MEMORY[0x1E0CB35C8];
            v34 = *MEMORY[0x1E0CB3388];
            v35 = v20;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("ECDKIMVerifier"), 0, v23);
            *a7 = (id)objc_claimAutoreleasedReturnValue();

          }
          v21 = 0;
          goto LABEL_23;
        }
      }
      else
      {
        v18 = 1;
      }
      if (v16 && v18)
      {
        if (a7)
          *a7 = 0;
        v21 = v15;
LABEL_23:

        goto LABEL_24;
      }
      if (v12 == ++v14)
      {
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
        if (v12)
          goto LABEL_3;
        break;
      }
    }
  }

  if (a7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ECDKIMVerifier"), 1, 0);
    v21 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }
LABEL_24:

  return v21;
}

- (BOOL)_verifyMessageBodyData:(id)a3 withOptions:(int64_t)a4 usingSignature:(id)a5
{
  char v5;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint8_t v25[16];

  v5 = a4;
  v8 = a5;
  v9 = (void *)objc_msgSend(a3, "mutableCopy");
  v10 = objc_msgSend(v8, "bodyCanonicalizationAlgorithm");
  if (v10)
  {
    if (v10 == 1)
      -[ECDKIMVerifier _canonicalizeBodyDataUsingRelaxedAlgorithm:](self, "_canonicalizeBodyDataUsingRelaxedAlgorithm:", v9);
  }
  else
  {
    -[ECDKIMVerifier _canonicalizeBodyDataUsingSimpleAlgorithm:](self, "_canonicalizeBodyDataUsingSimpleAlgorithm:", v9);
  }
  objc_msgSend(v8, "bodyLength");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_7;
  objc_msgSend(v8, "bodyLength");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "unsignedIntegerValue");
  v14 = objc_msgSend(v9, "length");

  if (v13 == v14)
    goto LABEL_7;
  objc_msgSend(v8, "bodyLength");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "unsignedIntegerValue");
  v20 = objc_msgSend(v9, "length");

  if (v19 > v20)
  {
    _ef_log_ECDKIMVerifier();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[ECDKIMVerifier _verifyMessageBodyData:withOptions:usingSignature:].cold.1(v21, v22, v23);
LABEL_14:

    v17 = 0;
    goto LABEL_15;
  }
  if ((v5 & 4) != 0)
  {
    _ef_log_ECDKIMVerifier();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_1B9ADE000, v21, OS_LOG_TYPE_DEFAULT, "Ignoring DKIM signature that did not sign the entire body (required by options).", v25, 2u);
    }
    goto LABEL_14;
  }
LABEL_7:
  -[ECDKIMVerifier _base64HashBodyData:usingSignature:](self, "_base64HashBodyData:usingSignature:", v9, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "canonicalizedBodyHash");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "isEqualToString:", v16);

LABEL_15:
  return v17;
}

- (id)_base64HashBodyData:(id)a3 usingSignature:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  const void *v14;
  uint64_t v15;
  void *v16;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "hashingAlgorithm");
  if (v7)
    v8 = 32 * (v7 == 1);
  else
    v8 = 20;
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bodyLength");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v6, "bodyLength");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "unsignedIntegerValue");

  }
  else
  {
    v12 = objc_msgSend(v5, "length");
  }

  objc_msgSend(v5, "subdataWithRange:", 0, v12);
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v14 = (const void *)objc_msgSend(v13, "bytes");

  v15 = objc_msgSend(v6, "hashingAlgorithm");
  if (v15)
  {
    if (v15 == 1)
      CC_SHA256(v14, v12, (unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v9), "mutableBytes"));
  }
  else
  {
    CC_SHA1(v14, v12, (unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v9), "mutableBytes"));
  }
  objc_msgSend(v9, "base64EncodedStringWithOptions:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (BOOL)_verifyMessageHeaders:(id)a3 usingSignature:(id)a4 publicKeySource:(id)a5 error:(id *)a6
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  BOOL v29;
  ECDKIMVerifier *v31;
  id v33;
  id v34;
  id obj;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  _QWORD v39[4];
  id v40;
  id v41;
  uint64_t *v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  char v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v31 = self;
  v64 = *MEMORY[0x1E0C80C00];
  v34 = a4;
  v33 = a5;
  objc_msgSend(a3, "allHeaders");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reverseObjectEnumerator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_opt_new();
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  objc_msgSend(v34, "signedHeaderFields");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  obj = v11;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
  if (v12)
  {
    v36 = *(_QWORD *)v59;
    do
    {
      v38 = v12;
      for (i = 0; i != v38; ++i)
      {
        if (*(_QWORD *)v59 != v36)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i);
        v54 = 0u;
        v55 = 0u;
        v56 = 0u;
        v57 = 0u;
        v15 = v37;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
        if (v16)
        {
          v17 = *(_QWORD *)v55;
          do
          {
            for (j = 0; j != v16; ++j)
            {
              if (*(_QWORD *)v55 != v17)
                objc_enumerationMutation(v15);
              v19 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * j);
              objc_msgSend(v19, "name", v31);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v20, "isEqualToString:", v14))
              {
                v21 = objc_msgSend(v10, "containsObject:", v19);

                if ((v21 & 1) == 0)
                {
                  objc_msgSend(v10, "addObject:", v19);
                  goto LABEL_17;
                }
              }
              else
              {

              }
            }
            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
          }
          while (v16);
        }
LABEL_17:

      }
      v11 = obj;
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
    }
    while (v12);
  }

  v22 = objc_msgSend(v34, "headerCanonicalizationAlgorithm");
  if (!v22)
  {
    -[ECDKIMVerifier _canonicalizeHeaders:usingSimpleAlgorithmWithSignatureHeader:](v31, "_canonicalizeHeaders:usingSimpleAlgorithmWithSignatureHeader:", v10, v34);
    v23 = objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  if (v22 == 1)
  {
    -[ECDKIMVerifier _canonicalizeHeaders:usingRelaxedAlgorithmWithSignatureHeader:](v31, "_canonicalizeHeaders:usingRelaxedAlgorithmWithSignatureHeader:", v10, v34);
    v23 = objc_claimAutoreleasedReturnValue();
LABEL_23:
    v24 = (void *)v23;
    goto LABEL_25;
  }
  v24 = 0;
LABEL_25:
  v50 = 0;
  v51 = &v50;
  v52 = 0x2020000000;
  v53 = 0;
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy_;
  v48 = __Block_byref_object_dispose_;
  v49 = 0;
  objc_msgSend(v34, "signingDomainIdentifier", v31);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "selector");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __77__ECDKIMVerifier__verifyMessageHeaders_usingSignature_publicKeySource_error___block_invoke;
  v39[3] = &unk_1E7120C98;
  v42 = &v50;
  v43 = &v44;
  v27 = v24;
  v40 = v27;
  v28 = v34;
  v41 = v28;
  objc_msgSend(v33, "getPublicKeyRecordsFromDomain:withSelector:completionHandler:", v25, v26, v39);

  if (a6)
    *a6 = objc_retainAutorelease((id)v45[5]);
  v29 = *((_BYTE *)v51 + 24) != 0;

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v50, 8);

  return v29;
}

void __77__ECDKIMVerifier__verifyMessageHeaders_usingSignature_publicKeySource_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  ECDKIMPublicKey *v8;
  void *v9;
  _BOOL4 v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  BOOL v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  id v19;
  void *v20;
  id obj;
  uint64_t v22;
  id v23;
  char v24;
  _BYTE v25[15];
  char v26;
  _BYTE v27[15];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  NSObject *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v19 = a2;
  v18 = a3;
  if (v18)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "dataUsingEncoding:", 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    obj = v19;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v29;
      while (2)
      {
        v22 = v5;
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v29 != v6)
            objc_enumerationMutation(obj);
          v8 = -[ECDKIMPublicKey initWithRecord:]([ECDKIMPublicKey alloc], "initWithRecord:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i));
          -[ECDKIMPublicKey publicKeyData](v8, "publicKeyData");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v9 == 0;

          if (v10)
          {
            _ef_log_ECDKIMVerifier();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              __77__ECDKIMVerifier__verifyMessageHeaders_usingSignature_publicKeySource_error___block_invoke_cold_1(&v26, v27);
          }
          else
          {
            v11 = -[ECDKIMPublicKey signingAlgorithm](v8, "signingAlgorithm");
            if (v11 == objc_msgSend(*(id *)(a1 + 40), "signingAlgorithm"))
            {
              objc_msgSend(*(id *)(a1 + 40), "signatureData");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              -[ECDKIMPublicKey publicKeyData](v8, "publicKeyData");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = objc_msgSend(*(id *)(a1 + 40), "hashingAlgorithm");
              v23 = 0;
              v15 = +[ECDKIMCryptoUtil verifySignedData:withSignatureData:publicKeyData:hashingAlgorithm:error:](ECDKIMCryptoUtil, "verifySignedData:withSignatureData:publicKeyData:hashingAlgorithm:error:", v20, v12, v13, v14, &v23);
              v16 = v23;
              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v15;

              if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
              {

                goto LABEL_22;
              }
              _ef_log_ECDKIMVerifier();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                v33 = v16;
                _os_log_error_impl(&dword_1B9ADE000, v17, OS_LOG_TYPE_ERROR, "Failed to verify DKIM signed data: %{public}@", buf, 0xCu);
              }

            }
            else
            {
              _ef_log_ECDKIMVerifier();
              v16 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
                __77__ECDKIMVerifier__verifyMessageHeaders_usingSignature_publicKeySource_error___block_invoke_cold_2(&v24, v25);
            }
          }

        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_22:

  }
}

- (void)_canonicalizeBodyDataUsingSimpleAlgorithm:(id)a3
{
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend(MEMORY[0x1E0C99D50], "ef_crlfData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v13, "ef_hasSuffix:", v3);

  if (v4)
  {
    while ((unint64_t)objc_msgSend(v13, "length") >= 4)
    {
      v5 = objc_msgSend(v13, "length");
      objc_msgSend(MEMORY[0x1E0C99D50], "ef_crlfData");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "subdataWithRange:", v5 - 4, objc_msgSend(v6, "length"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D50], "ef_crlfData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToData:", v8);

      if (!v9)
        break;
      v10 = objc_msgSend(v13, "length");
      objc_msgSend(MEMORY[0x1E0C99D50], "ef_crlfData");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "ef_deleteBytesInRange:", v10 - 4, objc_msgSend(v11, "length"));

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "ef_crlfData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "appendData:", v12);

  }
}

- (void)_canonicalizeBodyDataUsingRelaxedAlgorithm:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  __int16 v14;

  v3 = a3;
  v14 = 2336;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v14, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "ef_crlfData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ef_deleteBytesInData:beforeOccurrencesOfData:", v4, v5);

  v13 = 32;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v13, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ef_replaceContiguousSequencesOfBytesInData:withData:", v4, v6);
  while (1)
  {

    objc_msgSend(MEMORY[0x1E0C99D50], "ef_crlfData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v3, "ef_hasSuffix:", v7);

    if (!v8)
      break;
    v9 = objc_msgSend(v3, "length");
    objc_msgSend(MEMORY[0x1E0C99D50], "ef_crlfData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ef_deleteBytesInRange:", v9 - 2, objc_msgSend(v6, "length"));
  }
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "ef_crlfData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v3, "ef_hasSuffix:", v10);

    if ((v11 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "ef_crlfData");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendData:", v12);

    }
  }

}

- (id)_canonicalizeHeaders:(id)a3 usingSimpleAlgorithmWithSignatureHeader:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v12, "transmittedName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "body");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "appendFormat:", CFSTR("%@:%@"), v13, v14, (_QWORD)v18);

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  objc_msgSend(v6, "headerNameForCanonicalization");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bodyForCanonicalization");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("%@:%@"), v15, v16);

  while (objc_msgSend(v7, "hasSuffix:", CFSTR("\r\n")))
    objc_msgSend(v7, "deleteCharactersInRange:", objc_msgSend(v7, "length") - objc_msgSend(CFSTR("\r\n"), "length"), objc_msgSend(CFSTR("\r\n"), "length"));

  return v7;
}

- (id)_canonicalizeHeaders:(id)a3 usingRelaxedAlgorithmWithSignatureHeader:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v13, "name");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "body");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[ECDKIMVerifier _relaxedCanonicalizationForHeaderName:headerBody:](self, "_relaxedCanonicalizationForHeaderName:headerBody:", v14, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "appendString:", v16);
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  objc_msgSend(v7, "headerNameForCanonicalization");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bodyForCanonicalization");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ECDKIMVerifier _relaxedCanonicalizationForHeaderName:headerBody:](self, "_relaxedCanonicalizationForHeaderName:headerBody:", v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "appendString:", v19);
  while (objc_msgSend(v8, "hasSuffix:", CFSTR("\r\n")))
    objc_msgSend(v8, "deleteCharactersInRange:", objc_msgSend(v8, "length") - objc_msgSend(CFSTR("\r\n"), "length"), objc_msgSend(CFSTR("\r\n"), "length"));

  return v8;
}

- (id)_relaxedCanonicalizationForHeaderName:(id)a3 headerBody:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a4;
  objc_msgSend(a3, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  v8 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(v8, "ef_rfc5322Unfold");
  objc_msgSend(MEMORY[0x1E0CB3500], "ef_rfc6376WhitespaceCharacterSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ef_replaceContiguousSequencesOfCharactersInSet:withString:", v9, CFSTR(" "));

  objc_msgSend(MEMORY[0x1E0CB3500], "ef_rfc6376WhitespaceCharacterSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ef_trimTrailingCharactersInSet:", v10);

  objc_msgSend(MEMORY[0x1E0CB3500], "ef_rfc6376WhitespaceCharacterSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ef_trimTrailingCharactersInSet:", v11);

  objc_msgSend(MEMORY[0x1E0CB3500], "ef_rfc6376WhitespaceCharacterSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ef_trimLeadingCharactersInSet:", v12);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), v7, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)verificationContextForMessageData:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  ECDKIMVerificationContext *v8;
  NSObject *v9;
  uint8_t v11[8];
  id v12;

  v12 = 0;
  -[ECDKIMVerifier verifiableMessageForMessageData:dkimSignatureHeaders:error:](self, "verifiableMessageForMessageData:dkimSignatureHeaders:error:", a3, &v12, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v12;
  v7 = v6;
  if (!v5)
    goto LABEL_8;
  if (!objc_msgSend(v6, "count"))
  {
    _ef_log_ECDKIMVerifier();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1B9ADE000, v9, OS_LOG_TYPE_DEFAULT, "No DKIM signature headers found.", v11, 2u);
    }

    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ECDKIMVerifier"), 1, 0);
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
LABEL_8:
    v8 = 0;
    goto LABEL_9;
  }
  v8 = -[ECDKIMVerificationContext initWithVerifiableMessage:dkimSignatureHeaders:]([ECDKIMVerificationContext alloc], "initWithVerifiableMessage:dkimSignatureHeaders:", v5, v7);
LABEL_9:

  return v8;
}

- (BOOL)verifyMessageData:(id)a3 publicKeySource:(id)a4 options:(int64_t)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v13;

  v8 = a4;
  v13 = 0;
  -[ECDKIMVerifier verifiableMessageForMessageData:dkimSignatureHeaders:error:](self, "verifiableMessageForMessageData:dkimSignatureHeaders:error:", a3, &v13, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v13;
  -[ECDKIMVerifier _verifyMessage:withDKIMSignatureHeaders:publicKeySource:options:error:](self, "_verifyMessage:withDKIMSignatureHeaders:publicKeySource:options:error:", v9, v10, v8, a5, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11 != 0;
}

- (BOOL)verifyMessageWithContext:(id)a3 options:(int64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;

  v8 = a3;
  -[ECDKIMVerifier publicKeySource](self, "publicKeySource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = -[ECDKIMVerifier verifyMessageWithContext:publicKeySource:options:error:](self, "verifyMessageWithContext:publicKeySource:options:error:", v8, v9, a4, a5);

  return (char)a5;
}

- (BOOL)verifyMessageWithContext:(id)a3 publicKeySource:(id)a4 options:(int64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  int64_t v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;

  v10 = a3;
  v11 = a4;
  if (objc_msgSend(v10, "requireFullBodySignature"))
    v12 = a5 | 4;
  else
    v12 = a5;
  objc_msgSend(v10, "verifiableMessage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dkimSignatureHeaders");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ECDKIMVerifier _verifyMessage:withDKIMSignatureHeaders:publicKeySource:options:error:](self, "_verifyMessage:withDKIMSignatureHeaders:publicKeySource:options:error:", v13, v14, v11, v12, a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15 != 0;

  return v16;
}

- (ECDKIMPublicKeySource)publicKeySource
{
  return self->_publicKeySource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicKeySource, 0);
}

- (void)verifiableMessageForMessageData:(NSObject *)a1 dkimSignatureHeaders:(uint64_t)a2 error:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_1(&dword_1B9ADE000, a1, a3, "Could not verify message because header/body boundary could not be found.", v3);
}

- (void)verifiableMessageForMessageData:(_BYTE *)a1 dkimSignatureHeaders:(_BYTE *)a2 error:.cold.2(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_1_1(a1, a2);
  OUTLINED_FUNCTION_0_1(&dword_1B9ADE000, v2, (uint64_t)v2, "Ignoring DKIM-Signature because 'From:' header is not signed.", v3);
}

- (void)verifiableMessageForMessageData:(_BYTE *)a1 dkimSignatureHeaders:(_BYTE *)a2 error:.cold.3(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_1_1(a1, a2);
  OUTLINED_FUNCTION_0_1(&dword_1B9ADE000, v2, (uint64_t)v2, "Ignoring DKIM-Signature because domain in 'i=' tag is not a subdomain of the domain in the 'd=' tag.", v3);
}

- (void)verifiableMessageForMessageData:(_QWORD *)a3 dkimSignatureHeaders:(os_log_t)log error:.cold.4(void *a1, uint8_t *buf, _QWORD *a3, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *a3 = a1;
  _os_log_error_impl(&dword_1B9ADE000, log, OS_LOG_TYPE_ERROR, "Error parsing DKIM signature: %{public}@", buf, 0xCu);

}

- (void)_verifyMessageBodyData:(NSObject *)a1 withOptions:(uint64_t)a2 usingSignature:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_1(&dword_1B9ADE000, a1, a3, "Ignoring DKIM signature that specified a body length larger than the length of the body.", v3);
}

void __77__ECDKIMVerifier__verifyMessageHeaders_usingSignature_publicKeySource_error___block_invoke_cold_1(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_1_1(a1, a2);
  OUTLINED_FUNCTION_0_1(&dword_1B9ADE000, v2, (uint64_t)v2, "Ignoring public key record because there's no p= value.", v3);
}

void __77__ECDKIMVerifier__verifyMessageHeaders_usingSignature_publicKeySource_error___block_invoke_cold_2(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_1_1(a1, a2);
  OUTLINED_FUNCTION_0_1(&dword_1B9ADE000, v2, (uint64_t)v2, "Ignoring public key record because it was not signed with the same signing algorithm as the DKIM signature.", v3);
}

@end
