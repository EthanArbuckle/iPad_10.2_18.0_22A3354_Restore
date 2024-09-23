@implementation NSPPrivateAccessTokenChallenge

+ (id)httpAuthenticationScheme
{
  return CFSTR("PrivateToken");
}

+ (id)challengeAttributeName
{
  return CFSTR("challenge");
}

+ (id)tokenKeyAttributeName
{
  return CFSTR("token-key");
}

+ (id)originNameKeyAttributeName
{
  return CFSTR("issuer-encap-key");
}

- (id)challengeDataForTokenType:(unsigned int)a1 issuerName:(void *)a2 redemptionNonce:(void *)a3 originInfo:(void *)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  const char *v11;
  const char *v12;
  size_t v13;
  void *v14;
  const char *v15;
  __int16 v17;
  __int16 v18;
  char v19;
  __int16 v20;
  __int16 v21;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v21 = __rev16(a1);
  objc_msgSend(v10, "appendBytes:length:", &v21, 2);
  v11 = (const char *)objc_msgSend(v7, "UTF8String");
  v20 = bswap32(strlen(v11)) >> 16;
  objc_msgSend(v10, "appendBytes:length:", &v20, 2);
  objc_msgSend(v10, "appendBytes:length:", v11, strlen(v11));
  v19 = 32 * (v8 != 0);
  objc_msgSend(v10, "appendBytes:length:", &v19, 1);
  if (v8)
    objc_msgSend(v10, "appendData:", v8);
  if (v9)
  {
    v12 = (const char *)objc_msgSend(v9, "UTF8String");
    v18 = bswap32(strlen(v12)) >> 16;
    objc_msgSend(v10, "appendBytes:length:", &v18, 2);
    v13 = strlen(v12);
    v14 = v10;
    v15 = v12;
  }
  else
  {
    v17 = 0;
    v15 = (const char *)&v17;
    v14 = v10;
    v13 = 2;
  }
  objc_msgSend(v14, "appendBytes:length:", v15, v13);

  return v10;
}

- (NSPPrivateAccessTokenChallenge)initWithData:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  unsigned __int16 *v8;
  NSPPrivateAccessTokenChallenge *v9;
  NSPPrivateAccessTokenChallenge *v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  size_t v16;
  unint64_t v17;
  int v18;
  void *v19;
  void *v20;
  char *v21;
  void *v22;
  SEL v23;
  void *v24;
  NSObject *v25;
  int v26;
  char *v27;
  char *v28;
  unsigned __int16 *v29;
  uint64_t v30;
  unsigned int v31;
  unint64_t v32;
  unint64_t v33;
  void *v34;
  SEL v35;
  void *v36;
  void *v37;
  const char *v38;
  NSObject *v39;
  uint32_t v40;
  unsigned int v41;
  const void *v42;
  unsigned int v43;
  size_t v44;
  NSObject *v45;
  const char *v46;
  int v47;
  void *v48;
  void *v49;
  void *v50;
  SEL v51;
  SEL v52;
  void *v53;
  SEL v54;
  void *v55;
  void *v56;
  SEL v57;
  const char *v58;
  void *v59;
  int v60;
  void *v61;
  void *v62;
  void *v63;
  SEL v64;
  id Property;
  void *v66;
  SEL v67;
  objc_super v68;
  uint8_t buf[4];
  _DWORD v70[7];

  *(_QWORD *)&v70[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    nplog_obj();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)v70 = "-[NSPPrivateAccessTokenChallenge initWithData:]";
      v46 = "%s called with null data";
      goto LABEL_83;
    }
LABEL_67:

    goto LABEL_16;
  }
  v6 = objc_msgSend(v4, "length");
  v7 = objc_msgSend(v5, "bytes");
  if (!v6)
  {
    nplog_obj();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)v70 = "-[NSPPrivateAccessTokenChallenge initWithData:]";
      v46 = "%s called with null remainingLength";
      goto LABEL_83;
    }
    goto LABEL_67;
  }
  v8 = (unsigned __int16 *)v7;
  if (!v7)
  {
    nplog_obj();
    v45 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
      goto LABEL_67;
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)v70 = "-[NSPPrivateAccessTokenChallenge initWithData:]";
    v46 = "%s called with null cursor";
LABEL_83:
    _os_log_fault_impl(&dword_19E8FE000, v45, OS_LOG_TYPE_FAULT, v46, buf, 0xCu);
    goto LABEL_67;
  }
  v68.receiver = self;
  v68.super_class = (Class)NSPPrivateAccessTokenChallenge;
  v9 = -[NSPPrivateAccessTokenChallenge init](&v68, sel_init);
  if (!v9)
  {
    nplog_obj();
    self = (NSPPrivateAccessTokenChallenge *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&self->super, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_19E8FE000, &self->super, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
    }
    goto LABEL_16;
  }
  v10 = v9;
  if (v6 <= 1)
  {
    nplog_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v12 = "Invalid challenge length";
LABEL_8:
      v13 = v11;
      v14 = 2;
LABEL_32:
      _os_log_error_impl(&dword_19E8FE000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  v9->_tokenType = bswap32(*v8) >> 16;
  if (!-[NSPPrivateAccessTokenChallenge isSupportedTokenType](v9, "isSupportedTokenType"))
  {
    nplog_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    v26 = -[NSPPrivateAccessTokenChallenge tokenType](v10, "tokenType");
    *(_DWORD *)buf = 67109120;
    v70[0] = v26;
    v12 = "Unsupported token type %u";
    goto LABEL_31;
  }
  if ((v6 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    nplog_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v12 = "Invalid challenge length";
      goto LABEL_8;
    }
LABEL_14:

LABEL_15:
    self = v10;
LABEL_16:
    v10 = 0;
LABEL_17:

    goto LABEL_18;
  }
  v16 = bswap32(v8[1]) >> 16;
  v17 = v6 - 4;
  if (v6 - 4 < v16 || ((unsigned __int16)(v16 - 257) >> 8) != 255)
  {
    nplog_obj();
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
LABEL_27:

      goto LABEL_15;
    }
    *(_DWORD *)buf = 67109120;
    v70[0] = v16;
    v38 = "Invalid issuer name length %u";
    goto LABEL_48;
  }
  v18 = v16 + 1;
  v19 = malloc_type_calloc(1uLL, (v16 + 1), 0xB2A92CECuLL);
  if (!v19)
  {
    nplog_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_DWORD *)buf = 67109120;
    v70[0] = v18;
    v12 = "calloc of %u bytes failed";
    goto LABEL_31;
  }
  v20 = v19;
  v21 = (char *)(v8 + 2);
  memcpy(v19, v21, v16);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setProperty_atomic(v10, v23, v22, 24);

  free(v20);
  -[NSPPrivateAccessTokenChallenge issuerName](v10, "issuerName");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24)
  {
    nplog_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v12 = "Invalid origin name";
    goto LABEL_8;
  }
  if (v17 == v16)
  {
    nplog_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v12 = "Invalid challenge length";
      goto LABEL_8;
    }
    goto LABEL_14;
  }
  v27 = &v21[v16];
  v28 = &v21[v16];
  v31 = *v28;
  v29 = (unsigned __int16 *)(v28 + 1);
  v30 = v31;
  v32 = v17 + ~v16;
  v33 = v32 - v31;
  if (v32 < v31)
  {
    nplog_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_DWORD *)buf = 67109376;
    v70[0] = v30;
    LOWORD(v70[1]) = 2048;
    *(_QWORD *)((char *)&v70[1] + 2) = v32;
    v12 = "Invalid nonce length %u, cannot fit in %zu";
    v13 = v11;
    v14 = 18;
    goto LABEL_32;
  }
  if ((_DWORD)v30)
  {
    if ((_DWORD)v30 != 32)
    {
      nplog_obj();
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        goto LABEL_14;
      *(_DWORD *)buf = 67109120;
      v70[0] = v30;
      v12 = "Invalid nonce length %u";
      goto LABEL_31;
    }
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v29, v30);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setProperty_atomic(v10, v35, v34, 32);

    -[NSPPrivateAccessTokenChallenge redemptionNonce](v10, "redemptionNonce");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v36)
    {
      nplog_obj();
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        goto LABEL_14;
      *(_WORD *)buf = 0;
      v12 = "Invalid nonce";
      goto LABEL_8;
    }
    v29 = (unsigned __int16 *)(v27 + 33);
    v32 = v33;
  }
  if (-[NSPPrivateAccessTokenChallenge typeRequiresRedemptionNonce](v10, "typeRequiresRedemptionNonce"))
  {
    -[NSPPrivateAccessTokenChallenge redemptionNonce](v10, "redemptionNonce");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v37)
    {
      nplog_obj();
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        goto LABEL_14;
      *(_WORD *)buf = 0;
      v12 = "Redemption nonce is required";
      goto LABEL_8;
    }
  }
  if (v32 <= 1)
  {
    nplog_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v12 = "Invalid challenge length";
    goto LABEL_8;
  }
  v43 = *v29;
  v42 = v29 + 1;
  v41 = v43;
  v44 = __rev16(v43);
  if (v32 - 2 < v44)
  {
    nplog_obj();
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    *(_DWORD *)buf = 67109376;
    v70[0] = v44;
    LOWORD(v70[1]) = 2048;
    *(_QWORD *)((char *)&v70[1] + 2) = v32 - 2;
    v38 = "Invalid origin info length %u, cannot fit in %zu";
    v39 = v25;
    v40 = 18;
    goto LABEL_49;
  }
  if (v44 >= 0xA01)
  {
    nplog_obj();
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    *(_DWORD *)buf = 67109120;
    v70[0] = v44;
    v38 = "Invalid origin info length %u";
LABEL_48:
    v39 = v25;
    v40 = 8;
LABEL_49:
    _os_log_error_impl(&dword_19E8FE000, v39, OS_LOG_TYPE_ERROR, v38, buf, v40);
    goto LABEL_27;
  }
  if (v41)
  {
    v47 = v44 + 1;
    v48 = malloc_type_calloc(1uLL, (v44 + 1), 0xF9F8721BuLL);
    if (v48)
    {
      v49 = v48;
      memcpy(v48, v42, v44);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_setProperty_atomic(v10, v51, v50, 56);

      free(v49);
      objc_msgSend(objc_getProperty(v10, v52, 56, 1), "componentsSeparatedByString:", CFSTR(","));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_setProperty_atomic(v10, v54, v53, 48);

      -[NSPPrivateAccessTokenChallenge originNames](v10, "originNames");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "firstObject");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_setProperty_atomic(v10, v57, v56, 40);

      goto LABEL_73;
    }
    nplog_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_DWORD *)buf = 67109120;
    v70[0] = v47;
    v12 = "calloc of %u bytes failed";
LABEL_31:
    v13 = v11;
    v14 = 8;
    goto LABEL_32;
  }
LABEL_73:
  if (-[NSPPrivateAccessTokenChallenge typeRequiresOriginName](v10, "typeRequiresOriginName")
    && !objc_getProperty(v10, v58, 56, 1))
  {
    nplog_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v12 = "Origin name is required";
    goto LABEL_8;
  }
  objc_setProperty_atomic(v10, v58, v5, 16);
  if (os_variant_allows_internal_security_policies())
  {
    -[NSPPrivateAccessTokenChallenge issuerName](v10, "issuerName");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v59, "containsString:", CFSTR(";"));

    if (v60)
    {
      -[NSPPrivateAccessTokenChallenge issuerName](v10, "issuerName");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "componentsSeparatedByString:", CFSTR(";"));
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "firstObject");
      self = (NSPPrivateAccessTokenChallenge *)objc_claimAutoreleasedReturnValue();

      LODWORD(v61) = -[NSPPrivateAccessTokenChallenge tokenType](v10, "tokenType");
      -[NSPPrivateAccessTokenChallenge redemptionNonce](v10, "redemptionNonce");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      Property = objc_getProperty(v10, v64, 56, 1);
      -[NSPPrivateAccessTokenChallenge challengeDataForTokenType:issuerName:redemptionNonce:originInfo:](v61, self, v63, Property);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_setProperty_atomic(v10, v67, v66, 16);

      goto LABEL_17;
    }
  }
LABEL_18:

  return v10;
}

- (NSObject)initWithType:(void *)a3 issuerName:(void *)a4 redemptionNonce:(void *)a5 originNames:
{
  id v9;
  id v10;
  id v11;
  _WORD *v12;
  const char *v13;
  void *v14;
  SEL v15;
  SEL v16;
  void *v17;
  void *v18;
  SEL v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  SEL v29;
  void *v30;
  SEL v31;
  NSObject *v32;
  NSObject *v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  objc_super v41;
  uint8_t v42[128];
  uint8_t buf[4];
  const char *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!a1)
  {
    v32 = 0;
    goto LABEL_19;
  }
  if (v10 && objc_msgSend(v10, "length") != 32)
  {
    nplog_obj();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v44 = "-[NSPPrivateAccessTokenChallenge initWithType:issuerName:redemptionNonce:originNames:]";
      _os_log_fault_impl(&dword_19E8FE000, v34, OS_LOG_TYPE_FAULT, "%s called with null (redemptionNonce.length == 32)", buf, 0xCu);
    }

  }
  else
  {
    v41.receiver = a1;
    v41.super_class = (Class)NSPPrivateAccessTokenChallenge;
    v12 = -[NSObject init](&v41, sel_init);
    if (v12)
    {
      v14 = v12;
      v12[4] = a2;
      objc_setProperty_atomic(v12, v13, v9, 24);
      objc_setProperty_atomic(v14, v15, v10, 32);
      objc_setProperty_atomic(v14, v16, v11, 48);
      objc_msgSend(v14, "originNames");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_setProperty_atomic(v14, v19, v18, 40);

      objc_msgSend(v14, "originNames");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "count");

      if (v21)
      {
        v35 = v11;
        v36 = v9;
        v22 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        objc_msgSend(v14, "originNames");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v38;
          do
          {
            v27 = 0;
            do
            {
              if (*(_QWORD *)v38 != v26)
                objc_enumerationMutation(v23);
              v28 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v27);
              if (objc_msgSend(v22, "length", v35, v36))
                objc_msgSend(v22, "appendString:", CFSTR(","));
              objc_msgSend(v22, "appendString:", v28);
              ++v27;
            }
            while (v25 != v27);
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
          }
          while (v25);
        }

        objc_setProperty_atomic(v14, v29, v22, 56);
        v11 = v35;
        v9 = v36;
      }
      else
      {
        v22 = 0;
      }
      -[NSPPrivateAccessTokenChallenge challengeDataForTokenType:issuerName:redemptionNonce:originInfo:](a2, v9, v10, v22);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_setProperty_atomic(v14, v31, v30, 16);

      a1 = v14;
      v32 = a1;
      goto LABEL_18;
    }
    nplog_obj();
    a1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(a1, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_19E8FE000, a1, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
    }
  }
  v32 = 0;
LABEL_18:

LABEL_19:
  return v32;
}

- (id)initRSABlindSignatureChallengeWithIssuerName:(id)a3 redemptionNonce:(id)a4 originNames:(id)a5
{
  NSPPrivateAccessTokenChallenge *v5;
  NSPPrivateAccessTokenChallenge *v6;
  NSObject *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v5 = self;
  v11 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v5 = -[NSPPrivateAccessTokenChallenge initWithType:issuerName:redemptionNonce:originNames:](&self->super, 2u, a3, a4, a5);
    v6 = v5;
  }
  else
  {
    nplog_obj();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      v9 = 136315138;
      v10 = "-[NSPPrivateAccessTokenChallenge initRSABlindSignatureChallengeWithIssuerName:redemptionNonce:originNames:]";
      _os_log_fault_impl(&dword_19E8FE000, v8, OS_LOG_TYPE_FAULT, "%s called with null issuerName", (uint8_t *)&v9, 0xCu);
    }

    v6 = 0;
  }

  return v6;
}

- (id)initRateLimitedRSABlindSignatureChallengeWithIssuerName:(id)a3 redemptionNonce:(id)a4 originNames:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSPPrivateAccessTokenChallenge *v12;
  NSObject *v14;
  const char *v15;
  int v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (!v8)
  {
    nplog_obj();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      v16 = 136315138;
      v17 = "-[NSPPrivateAccessTokenChallenge initRateLimitedRSABlindSignatureChallengeWithIssuerName:redemptionNonce:originNames:]";
      v15 = "%s called with null issuerName";
      goto LABEL_13;
    }
LABEL_11:

    v12 = 0;
    goto LABEL_5;
  }
  if (!v9)
  {
    nplog_obj();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      v16 = 136315138;
      v17 = "-[NSPPrivateAccessTokenChallenge initRateLimitedRSABlindSignatureChallengeWithIssuerName:redemptionNonce:originNames:]";
      v15 = "%s called with null redemptionNonce";
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  if (!objc_msgSend(v10, "count"))
  {
    nplog_obj();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      goto LABEL_11;
    v16 = 136315138;
    v17 = "-[NSPPrivateAccessTokenChallenge initRateLimitedRSABlindSignatureChallengeWithIssuerName:redemptionNonce:originNames:]";
    v15 = "%s called with null originNames.count";
LABEL_13:
    _os_log_fault_impl(&dword_19E8FE000, v14, OS_LOG_TYPE_FAULT, v15, (uint8_t *)&v16, 0xCu);
    goto LABEL_11;
  }
  self = -[NSPPrivateAccessTokenChallenge initWithType:issuerName:redemptionNonce:originNames:](&self->super, 3u, v8, v9, v11);
  v12 = self;
LABEL_5:

  return v12;
}

- (BOOL)isSupportedTokenType
{
  return -[NSPPrivateAccessTokenChallenge tokenType](self, "tokenType") == 2
      || -[NSPPrivateAccessTokenChallenge tokenType](self, "tokenType") == 3;
}

- (BOOL)typeRequiresOriginName
{
  return -[NSPPrivateAccessTokenChallenge tokenType](self, "tokenType") == 3;
}

- (BOOL)typeRequiresRedemptionNonce
{
  return -[NSPPrivateAccessTokenChallenge tokenType](self, "tokenType") == 3;
}

- (BOOL)typeHasAllowedOriginList
{
  return -[NSPPrivateAccessTokenChallenge tokenType](self, "tokenType") == 2;
}

- (NSData)challengeData
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (unsigned)tokenType
{
  return self->_tokenType;
}

- (NSString)issuerName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSData)redemptionNonce
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)originName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSArray)originNames
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originInfo, 0);
  objc_storeStrong((id *)&self->_originNames, 0);
  objc_storeStrong((id *)&self->_originName, 0);
  objc_storeStrong((id *)&self->_redemptionNonce, 0);
  objc_storeStrong((id *)&self->_issuerName, 0);
  objc_storeStrong((id *)&self->_challengeData, 0);
}

@end
