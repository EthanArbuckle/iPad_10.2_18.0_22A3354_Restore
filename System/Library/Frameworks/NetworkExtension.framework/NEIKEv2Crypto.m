@implementation NEIKEv2Crypto

+ (NSObject)createRandomWithSize:(uint64_t)a1
{
  __CFData *v3;
  __CFData *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v8;
  int v9;
  unsigned int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  if (!a2)
  {
    ne_log_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      v9 = 67109120;
      v10 = 0;
      _os_log_fault_impl(&dword_19BD16000, v5, OS_LOG_TYPE_FAULT, "Invalid size %u", (uint8_t *)&v9, 8u);
    }
    goto LABEL_10;
  }
  v3 = +[NSMutableData mutableSensitiveDataPrefilledWithMaxCapacity:](MEMORY[0x1E0C99DF0], a2);
  if (!v3)
  {
    ne_log_obj();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      v9 = 67109120;
      v10 = a2;
      _os_log_fault_impl(&dword_19BD16000, v8, OS_LOG_TYPE_FAULT, "[NEMutableSensitiveData mutableSensitiveDataPrefilledWithMaxCapacity:%u] failed", (uint8_t *)&v9, 8u);
    }

    v5 = 0;
LABEL_10:
    v6 = 0;
    goto LABEL_4;
  }
  v4 = v3;
  arc4random_buf((void *)-[__CFData mutableBytes](v3, "mutableBytes"), a2);
  v5 = v4;
  v6 = v5;
LABEL_4:

  return v6;
}

+ (NSObject)createHMACFromData:(void *)a3 key:(void *)a4 prfProtocol:
{
  id v6;
  id v7;
  id v8;
  unsigned int v9;
  __CFData *v10;
  __CFData *v11;
  unint64_t v12;
  NSObject *v13;
  CCHmacAlgorithm v14;
  NSObject *v15;
  NSObject *v16;
  const char *v18;
  NSObject *v19;
  int v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  v8 = a4;
  objc_opt_self();
  if (!v7)
  {
    ne_log_obj();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      goto LABEL_23;
    v20 = 136315138;
    v21 = "+[NEIKEv2Crypto createHMACFromData:key:prfProtocol:]";
    v18 = "%s called with null key";
LABEL_19:
    _os_log_fault_impl(&dword_19BD16000, v15, OS_LOG_TYPE_FAULT, v18, (uint8_t *)&v20, 0xCu);
    goto LABEL_23;
  }
  if (!v6)
  {
    ne_log_obj();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      goto LABEL_23;
    v20 = 136315138;
    v21 = "+[NEIKEv2Crypto createHMACFromData:key:prfProtocol:]";
    v18 = "%s called with null data";
    goto LABEL_19;
  }
  if (!v8)
  {
    ne_log_obj();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      v20 = 136315138;
      v21 = "+[NEIKEv2Crypto createHMACFromData:key:prfProtocol:]";
      v18 = "%s called with null prfProtocol";
      goto LABEL_19;
    }
LABEL_23:
    v16 = 0;
    goto LABEL_12;
  }
  v9 = -[NEIKEv2PRFProtocol length]((uint64_t)v8);
  v10 = +[NSMutableData mutableSensitiveDataPrefilledWithMaxCapacity:](MEMORY[0x1E0C99DF0], v9);
  if (!v10)
  {
    ne_log_obj();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      v20 = 67109120;
      LODWORD(v21) = v9;
      _os_log_fault_impl(&dword_19BD16000, v19, OS_LOG_TYPE_FAULT, "[NEMutableSensitiveData mutableSensitiveDataPrefilledWithMaxCapacity:%u] failed", (uint8_t *)&v20, 8u);
    }

    v15 = 0;
    goto LABEL_23;
  }
  v11 = v10;
  v12 = objc_msgSend(v8, "type") - 1;
  if (v12 < 7 && ((0x73u >> v12) & 1) != 0)
  {
    v14 = dword_19BED6FD0[v12];
  }
  else
  {
    ne_log_obj();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      v20 = 67109120;
      LODWORD(v21) = objc_msgSend(v8, "type");
      _os_log_fault_impl(&dword_19BD16000, v13, OS_LOG_TYPE_FAULT, "Unknown PRF type %u", (uint8_t *)&v20, 8u);
    }

    v14 = 0;
  }
  CCHmac(v14, (const void *)objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"), (const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"), (void *)-[__CFData mutableBytes](v11, "mutableBytes"));
  v15 = v11;
  v16 = v15;
LABEL_12:

  return v16;
}

+ (uint64_t)signatureAlgorithmTypeForAuthentication:(uint64_t)a1
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;

  v2 = a2;
  objc_opt_self();
  v3 = objc_msgSend(v2, "method");
  v4 = 0;
  switch(v3)
  {
    case 9:
LABEL_2:
      v5 = (uint64_t *)MEMORY[0x1E0CD6DC8];
      goto LABEL_7;
    case 10:
      v5 = (uint64_t *)MEMORY[0x1E0CD6DD0];
      goto LABEL_7;
    case 11:
      v5 = (uint64_t *)MEMORY[0x1E0CD6DD8];
      goto LABEL_7;
    case 12:
    case 13:
      goto LABEL_8;
    case 14:
      switch(objc_msgSend(v2, "digitalSignatureAlgorithm"))
      {
        case 1:
          v5 = (uint64_t *)MEMORY[0x1E0CD6E98];
          goto LABEL_7;
        case 2:
          if (objc_msgSend(v2, "isNonStandard"))
            goto LABEL_2;
          v5 = (uint64_t *)MEMORY[0x1E0CD6DF8];
          goto LABEL_7;
        case 3:
          v5 = (uint64_t *)MEMORY[0x1E0CD6E20];
          goto LABEL_7;
        case 4:
          v5 = (uint64_t *)MEMORY[0x1E0CD6E28];
          goto LABEL_7;
        case 5:
          v5 = (uint64_t *)MEMORY[0x1E0CD6EA0];
          goto LABEL_7;
        case 6:
          v5 = (uint64_t *)MEMORY[0x1E0CD6EA8];
          goto LABEL_7;
        case 7:
          v5 = (uint64_t *)MEMORY[0x1E0CD6E00];
          goto LABEL_7;
        case 8:
          v5 = (uint64_t *)MEMORY[0x1E0CD6E08];
          goto LABEL_7;
        case 9:
          v5 = (uint64_t *)MEMORY[0x1E0CD6EB0];
          goto LABEL_7;
        case 10:
          v5 = (uint64_t *)MEMORY[0x1E0CD6EB8];
          goto LABEL_7;
        case 11:
          v5 = (uint64_t *)MEMORY[0x1E0CD6EC0];
          goto LABEL_7;
        default:
          v4 = 0;
          goto LABEL_8;
      }
    default:
      if (v3 != 1)
        goto LABEL_8;
      v5 = (uint64_t *)MEMORY[0x1E0CD6E88];
LABEL_7:
      v4 = *v5;
LABEL_8:

      return v4;
  }
}

+ (CFErrorRef)validateSignature:(void *)a3 signedData:(const __CFString *)a4 signatureAlgorithm:(__SecKey *)a5 publicKey:
{
  const __CFData *v8;
  const __CFData *v9;
  int v10;
  NSObject *v11;
  CFErrorRef result;
  CFErrorRef error;
  uint8_t buf[4];
  CFErrorRef v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a2;
  objc_opt_self();
  error = 0;
  v10 = SecKeyVerifySignature(a5, a4, v8, v9, &error);

  if (!error)
    return (CFErrorRef)(v10 != 0);
  ne_log_obj();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v15 = error;
    _os_log_error_impl(&dword_19BD16000, v11, OS_LOG_TYPE_ERROR, "Error when validating signature with public key: %@", buf, 0xCu);
  }

  result = error;
  if (error)
  {
    CFRelease(error);
    return 0;
  }
  return result;
}

+ (uint64_t)validateSignature:(void *)a3 signedData:(void *)a4 authProtocol:(__SecKey *)a5 publicKey:
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  const __CFString *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int8 v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  unsigned __int8 v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  const char *v25;
  NSObject *v26;
  uint32_t v27;
  const char *v28;
  uint64_t v29;
  unsigned __int8 v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a3;
  v10 = a4;
  objc_opt_self();
  if (!objc_msgSend(v8, "length"))
  {
    ne_log_obj();
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      goto LABEL_24;
    *(_DWORD *)buf = 136315138;
    v32 = "+[NEIKEv2Crypto validateSignature:signedData:authProtocol:publicKey:]";
    v28 = "%s called with null signatureData.length";
LABEL_39:
    _os_log_fault_impl(&dword_19BD16000, v22, OS_LOG_TYPE_FAULT, v28, buf, 0xCu);
    goto LABEL_24;
  }
  if (!objc_msgSend(v9, "length"))
  {
    ne_log_obj();
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      goto LABEL_24;
    *(_DWORD *)buf = 136315138;
    v32 = "+[NEIKEv2Crypto validateSignature:signedData:authProtocol:publicKey:]";
    v28 = "%s called with null signedData.length";
    goto LABEL_39;
  }
  if (!v10)
  {
    ne_log_obj();
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      goto LABEL_24;
    *(_DWORD *)buf = 136315138;
    v32 = "+[NEIKEv2Crypto validateSignature:signedData:authProtocol:publicKey:]";
    v28 = "%s called with null authentication";
    goto LABEL_39;
  }
  if (!a5)
  {
    ne_log_obj();
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      goto LABEL_24;
    *(_DWORD *)buf = 136315138;
    v32 = "+[NEIKEv2Crypto validateSignature:signedData:authProtocol:publicKey:]";
    v28 = "%s called with null publicKey";
    goto LABEL_39;
  }
  v11 = +[NEIKEv2Crypto signatureAlgorithmTypeForAuthentication:]((uint64_t)NEIKEv2Crypto, v10);
  if (!v11)
  {
    ne_log_obj();
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      goto LABEL_24;
    *(_DWORD *)buf = 138412290;
    v32 = (const char *)v10;
    v28 = "Invalid signature protcocol %@";
    goto LABEL_39;
  }
  v12 = (const __CFString *)v11;
  if (objc_msgSend(v10, "isDigitalSignature"))
  {
    v30 = 0;
    objc_msgSend(v8, "getBytes:length:", &v30, 1);
    v13 = v30 + 1;
    v14 = objc_msgSend(v8, "length");
    if (objc_msgSend(v8, "length") <= v13)
    {
      ne_log_obj();
      v22 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        goto LABEL_24;
      v29 = objc_msgSend(v8, "length");
      *(_DWORD *)buf = 134218240;
      v32 = (const char *)v29;
      v33 = 1024;
      v34 = v30;
      v25 = "AUTH payload length %zu is too short for signature algorithm length %u";
      v26 = v22;
      v27 = 18;
      goto LABEL_28;
    }
    objc_msgSend(v8, "subdataWithRange:", v13, v14 - v13);
    v15 = objc_claimAutoreleasedReturnValue();

    v8 = (id)v15;
  }
  v16 = +[NEIKEv2Crypto validateSignature:signedData:signatureAlgorithm:publicKey:]((uint64_t)NEIKEv2Crypto, v8, v9, v12, a5);
  ne_log_obj();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if ((v16 & 1) == 0)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19BD16000, v18, OS_LOG_TYPE_ERROR, "Failed to verify signature", buf, 2u);
    }

    if (objc_msgSend(v10, "method") != 1)
      goto LABEL_25;
    ne_log_obj();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19BD16000, v19, OS_LOG_TYPE_INFO, "Retrying legacy RSA signature verification using SHA-256", buf, 2u);
    }

    v20 = +[NEIKEv2Crypto validateSignature:signedData:signatureAlgorithm:publicKey:]((uint64_t)NEIKEv2Crypto, v8, v9, (const __CFString *)*MEMORY[0x1E0CD6E98], a5);
    ne_log_obj();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if ((v20 & 1) != 0)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_19BD16000, v22, OS_LOG_TYPE_DEBUG, "Peer signature is valid on second try", buf, 2u);
      }

      goto LABEL_22;
    }
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
LABEL_24:

LABEL_25:
      v23 = 0;
      goto LABEL_26;
    }
    *(_WORD *)buf = 0;
    v25 = "Failed to verify signature on second try";
    v26 = v22;
    v27 = 2;
LABEL_28:
    _os_log_error_impl(&dword_19BD16000, v26, OS_LOG_TYPE_ERROR, v25, buf, v27);
    goto LABEL_24;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_19BD16000, v18, OS_LOG_TYPE_DEBUG, "Peer signature is valid", buf, 2u);
  }

LABEL_22:
  v23 = 1;
LABEL_26:

  return v23;
}

+ (BOOL)validateCalculatedSharedKeyAuthData:(void *)a3 remoteAuthData:
{
  id v4;
  id v5;
  uint64_t v6;
  _BOOL8 v7;
  NSObject *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  objc_opt_self();
  v6 = objc_msgSend(v4, "length");
  if (v6 == objc_msgSend(v5, "length"))
  {
    objc_msgSend(v4, "length");
    objc_msgSend(v4, "bytes");
    objc_msgSend(v5, "bytes");
    v7 = cc_cmp_safe() == 0;
  }
  else
  {
    ne_log_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = 134218240;
      v11 = objc_msgSend(v4, "length");
      v12 = 2048;
      v13 = objc_msgSend(v5, "length");
      _os_log_error_impl(&dword_19BD16000, v9, OS_LOG_TYPE_ERROR, "calculatedAuthData.length(%zu) != authenticationData.length(%zu)", (uint8_t *)&v10, 0x16u);
    }

    v7 = 0;
  }

  return v7;
}

+ (NEIKEv2AuthenticationProtocol)copyAuthenticationProtocolForAuthMethod:(void *)a3 authData:
{
  id v4;
  NEIKEv2AuthenticationProtocol *v5;
  unsigned __int8 *v6;
  unint64_t v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  NEIKEv2AuthenticationProtocol *v12;
  NEIKEv2AuthenticationProtocol *v14;
  NSObject *v15;
  int v16;
  char v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  char v23;
  int v24;
  int v25;
  int v26;
  char v27;
  int v28;
  int v29;
  uint64_t v30;
  int v31;
  int v32;
  const char *v33;
  NSObject *v34;
  uint32_t v35;
  const char *v36;
  uint8_t *v37;
  NSObject *p_super;
  uint32_t v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  NSObject *v47;
  const char *v48;
  NSObject *v49;
  uint32_t v50;
  _QWORD v51[2];
  __int128 v52;
  __int128 v53;
  int v54;
  int v55;
  uint8_t v56[4];
  int v57;
  __int16 v58;
  int v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint8_t buf[32];
  __int128 v67;
  __int128 v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_self();
  if (a2 != 14)
  {
    if (a2 == 12)
      v5 = -[NEIKEv2AuthenticationProtocol initWithSecurePassword:]([NEIKEv2AuthenticationProtocol alloc], "initWithSecurePassword:", -1);
    else
      v5 = -[NEIKEv2AuthenticationProtocol initWithMethod:]([NEIKEv2AuthenticationProtocol alloc], "initWithMethod:", a2);
    goto LABEL_13;
  }
  if (!objc_msgSend(v4, "length"))
  {
    ne_log_obj();
    v12 = (NEIKEv2AuthenticationProtocol *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v12->super, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "+[NEIKEv2Crypto copyAuthenticationProtocolForAuthMethod:authData:]";
      _os_log_fault_impl(&dword_19BD16000, &v12->super, OS_LOG_TYPE_FAULT, "%s called with null authData.length", buf, 0xCu);
    }
    goto LABEL_54;
  }
  v6 = (unsigned __int8 *)objc_msgSend(v4, "bytes");
  v7 = *v6;
  if (objc_msgSend(v4, "length") - 1 < v7)
  {
    ne_log_obj();
    v12 = (NEIKEv2AuthenticationProtocol *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(&v12->super, OS_LOG_TYPE_ERROR))
      goto LABEL_54;
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = v7;
    *(_WORD *)&buf[8] = 2112;
    *(_QWORD *)&buf[10] = v4;
    v33 = "AuthData too short for first byte AlgorithmIdentifier, len %u %@";
    goto LABEL_68;
  }
  if ((_DWORD)v7 != 4 || *(_DWORD *)(v6 + 1) != 1885668097)
  {
    v52 = 0u;
    v53 = 0u;
    v51[0] = v6 + 1;
    v51[1] = v7;
    v8 = DERParseSequenceToObject((uint64_t)v51, (unsigned __int16)DERNumAlgorithmIdItemSpecs, (uint64_t)&DERAlgorithmIdItemSpecs, (unint64_t)&v52, 0x20uLL, 0x20uLL);
    v54 = v8;
    if (v8)
    {
      v40 = v8;
      ne_log_obj();
      v12 = (NEIKEv2AuthenticationProtocol *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v12->super, OS_LOG_TYPE_ERROR))
        goto LABEL_54;
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&buf[4] = v40;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v7;
      *(_WORD *)&buf[14] = 2112;
      *(_QWORD *)&buf[16] = v4;
      v33 = "Could not parse AlgorithmIdentifier, error %d payload len %u payload %@";
    }
    else
    {
      v9 = NEIKEv2ASN1CheckForNULLItem((uint64_t)&v53, &v54);
      if (!v54)
      {
        v10 = v9;
        if (DEROidCompare((uint64_t)&v52, (uint64_t)&oidEd25519))
        {
          v11 = 3;
        }
        else if (DEROidCompare((uint64_t)&v52, (uint64_t)&oidEd448))
        {
          v11 = 4;
        }
        else if (DEROidCompare((uint64_t)&v52, (uint64_t)&oidSha256Rsa))
        {
          v11 = 1;
        }
        else if (DEROidCompare((uint64_t)&v52, (uint64_t)&oidSha384Rsa))
        {
          v11 = 5;
        }
        else if (DEROidCompare((uint64_t)&v52, (uint64_t)&oidSha512Rsa))
        {
          v11 = 6;
        }
        else if (DEROidCompare((uint64_t)&v52, (uint64_t)&oidSha256Ecdsa))
        {
          v11 = 2;
        }
        else if (DEROidCompare((uint64_t)&v52, (uint64_t)&oidSha384Ecdsa))
        {
          v11 = 7;
        }
        else
        {
          if (!DEROidCompare((uint64_t)&v52, (uint64_t)&oidSha512Ecdsa))
          {
LABEL_35:
            if (!DEROidCompare((uint64_t)&v52, (uint64_t)&oidPSSRsa))
            {
              ne_log_obj();
              v12 = (NEIKEv2AuthenticationProtocol *)objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(&v12->super, OS_LOG_TYPE_ERROR))
                goto LABEL_54;
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)&buf[4] = v7;
              *(_WORD *)&buf[8] = 2112;
              *(_QWORD *)&buf[10] = v4;
              v33 = "Unrecognized digital signature AlgorithmIdentifier OID, payload len %u payload %@";
              goto LABEL_68;
            }
            if (!v10)
            {
              objc_opt_self();
              v67 = 0u;
              v68 = 0u;
              memset(buf, 0, sizeof(buf));
              v16 = DERParseSequenceToObject((uint64_t)&v53, 4u, (uint64_t)&NEIKEv2ASN1RSAPSSAlgoParamItemSpecs, (unint64_t)buf, 0x40uLL, 0x40uLL);
              v55 = v16;
              if (v16)
              {
                v42 = v16;
                ne_log_obj();
                v12 = (NEIKEv2AuthenticationProtocol *)objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(&v12->super, OS_LOG_TYPE_ERROR))
                  goto LABEL_64;
                LODWORD(v64) = 67109120;
                DWORD1(v64) = v42;
                v36 = "Could not parse RSA-PSS parameters, error %d";
              }
              else
              {
                v17 = NEIKEv2ASN1CheckForNULLItem((uint64_t)&v68, &v55);
                v18 = v55;
                if (v55)
                {
                  ne_log_obj();
                  v12 = (NEIKEv2AuthenticationProtocol *)objc_claimAutoreleasedReturnValue();
                  if (!os_log_type_enabled(&v12->super, OS_LOG_TYPE_ERROR))
                    goto LABEL_64;
                  LODWORD(v64) = 67109120;
                  DWORD1(v64) = v18;
                  v36 = "Could not parse RSA-PSS trailer field parameter, error %d";
                }
                else
                {
                  if ((v17 & 1) != 0)
                    goto LABEL_42;
                  v19 = NEIKEv2ASN1DecodeIntegerItem((uint64_t)&v68, &v55);
                  v20 = v55;
                  if (v55)
                  {
                    ne_log_obj();
                    v12 = (NEIKEv2AuthenticationProtocol *)objc_claimAutoreleasedReturnValue();
                    if (!os_log_type_enabled(&v12->super, OS_LOG_TYPE_ERROR))
                      goto LABEL_64;
                    LODWORD(v64) = 67109120;
                    DWORD1(v64) = v20;
                    v36 = "Could not parse RSA-PSS trailer field parameter, error %d";
                  }
                  else
                  {
                    v21 = v19;
                    if (v19 == 1)
                    {
LABEL_42:
                      v64 = 0u;
                      v65 = 0u;
                      v22 = DERParseSequenceToObject((uint64_t)buf, (unsigned __int16)DERNumAlgorithmIdItemSpecs, (uint64_t)&DERAlgorithmIdItemSpecs, (unint64_t)&v64, 0x20uLL, 0x20uLL);
                      v55 = v22;
                      if (v22)
                      {
                        v43 = v22;
                        ne_log_obj();
                        v12 = (NEIKEv2AuthenticationProtocol *)objc_claimAutoreleasedReturnValue();
                        if (!os_log_type_enabled(&v12->super, OS_LOG_TYPE_ERROR))
                          goto LABEL_64;
                        LODWORD(v62) = 67109120;
                        DWORD1(v62) = v43;
                        v36 = "Could not parse RSA-PSS HashAlgorithm, error %d";
                      }
                      else
                      {
                        v23 = NEIKEv2ASN1CheckForNULLItem((uint64_t)&v65, &v55);
                        v24 = v55;
                        if (!v55)
                        {
                          if ((v23 & 1) != 0)
                          {
                            v62 = 0u;
                            v63 = 0u;
                            v25 = DERParseSequenceToObject((uint64_t)&buf[16], (unsigned __int16)DERNumAlgorithmIdItemSpecs, (uint64_t)&DERAlgorithmIdItemSpecs, (unint64_t)&v62, 0x20uLL, 0x20uLL);
                            if (v25)
                            {
                              v44 = v25;
                              ne_log_obj();
                              v12 = (NEIKEv2AuthenticationProtocol *)objc_claimAutoreleasedReturnValue();
                              if (!os_log_type_enabled(&v12->super, OS_LOG_TYPE_ERROR))
                                goto LABEL_64;
                              LODWORD(v60) = 67109120;
                              DWORD1(v60) = v44;
                              v36 = "Could not parse RSA-PSS MaskGenAlgorithm, error %d";
                              v37 = (uint8_t *)&v60;
                              goto LABEL_118;
                            }
                            if (DEROidCompare((uint64_t)&v62, (uint64_t)&oidMfg1))
                            {
                              v60 = 0u;
                              v61 = 0u;
                              v26 = DERParseSequenceToObject((uint64_t)&v63, (unsigned __int16)DERNumAlgorithmIdItemSpecs, (uint64_t)&DERAlgorithmIdItemSpecs, (unint64_t)&v60, 0x20uLL, 0x20uLL);
                              v55 = v26;
                              if (v26)
                              {
                                v45 = v26;
                                ne_log_obj();
                                v12 = (NEIKEv2AuthenticationProtocol *)objc_claimAutoreleasedReturnValue();
                                if (!os_log_type_enabled(&v12->super, OS_LOG_TYPE_ERROR))
                                  goto LABEL_64;
                                *(_DWORD *)v56 = 67109120;
                                v57 = v45;
                                v36 = "Could not parse RSA-PSS MaskGenAlgorithm parameters, error %d";
                              }
                              else
                              {
                                v27 = NEIKEv2ASN1CheckForNULLItem((uint64_t)&v61, &v55);
                                v28 = v55;
                                if (!v55)
                                {
                                  if ((v27 & 1) != 0)
                                  {
                                    if (DEROidCompare((uint64_t)&v64, (uint64_t)&v60))
                                    {
                                      if (DEROidCompare((uint64_t)&v64, (uint64_t)&oidSha256))
                                      {
                                        v29 = 32;
                                        v30 = 9;
                                        goto LABEL_59;
                                      }
                                      if (DEROidCompare((uint64_t)&v64, (uint64_t)&oidSha384))
                                      {
                                        v29 = 48;
                                        v30 = 10;
                                        goto LABEL_59;
                                      }
                                      if (DEROidCompare((uint64_t)&v64, (uint64_t)&oidSha512))
                                      {
                                        v29 = 64;
                                        v30 = 11;
LABEL_59:
                                        v12 = -[NEIKEv2AuthenticationProtocol initWithDigitalSignature:]([NEIKEv2AuthenticationProtocol alloc], "initWithDigitalSignature:", v30);
                                        v31 = NEIKEv2ASN1DecodeIntegerItem((uint64_t)&v67, &v55);
                                        if (v55)
                                        {
                                          v46 = v55;
                                          ne_log_obj();
                                          v47 = objc_claimAutoreleasedReturnValue();
                                          if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
                                          {
LABEL_112:

                                            goto LABEL_64;
                                          }
                                          *(_DWORD *)v56 = 67109120;
                                          v57 = v46;
                                          v48 = "Could not parse RSA-PSS salt length parameter, error %d";
                                          v49 = v47;
                                          v50 = 8;
                                        }
                                        else
                                        {
                                          v32 = v31;
                                          if (v31 == v29)
                                          {
                                            if (v12)
                                              goto LABEL_14;
                                            goto LABEL_65;
                                          }
                                          ne_log_obj();
                                          v47 = objc_claimAutoreleasedReturnValue();
                                          if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
                                            goto LABEL_112;
                                          *(_DWORD *)v56 = 67109376;
                                          v57 = v32;
                                          v58 = 1024;
                                          v59 = v29;
                                          v48 = "RSA-PSS salt length %u != expected %u";
                                          v49 = v47;
                                          v50 = 14;
                                        }
                                        _os_log_error_impl(&dword_19BD16000, v49, OS_LOG_TYPE_ERROR, v48, v56, v50);
                                        goto LABEL_112;
                                      }
                                      ne_log_obj();
                                      v12 = (NEIKEv2AuthenticationProtocol *)objc_claimAutoreleasedReturnValue();
                                      if (!os_log_type_enabled(&v12->super, OS_LOG_TYPE_ERROR))
                                      {
LABEL_64:

LABEL_65:
                                        ne_log_obj();
                                        v12 = (NEIKEv2AuthenticationProtocol *)objc_claimAutoreleasedReturnValue();
                                        if (!os_log_type_enabled(&v12->super, OS_LOG_TYPE_ERROR))
                                          goto LABEL_54;
                                        *(_DWORD *)buf = 67109378;
                                        *(_DWORD *)&buf[4] = v7;
                                        *(_WORD *)&buf[8] = 2112;
                                        *(_QWORD *)&buf[10] = v4;
                                        v33 = "Unable to get RSA-PSS authentication protocol, payload len %u payload %@";
                                        goto LABEL_68;
                                      }
                                      *(_WORD *)v56 = 0;
                                      v36 = "Unrecognized PSA-PSS hash algorithm OID";
                                    }
                                    else
                                    {
                                      ne_log_obj();
                                      v12 = (NEIKEv2AuthenticationProtocol *)objc_claimAutoreleasedReturnValue();
                                      if (!os_log_type_enabled(&v12->super, OS_LOG_TYPE_ERROR))
                                        goto LABEL_64;
                                      *(_WORD *)v56 = 0;
                                      v36 = "PSA-PSS hash algorithm OIDs do not match";
                                    }
                                  }
                                  else
                                  {
                                    ne_log_obj();
                                    v12 = (NEIKEv2AuthenticationProtocol *)objc_claimAutoreleasedReturnValue();
                                    if (!os_log_type_enabled(&v12->super, OS_LOG_TYPE_ERROR))
                                      goto LABEL_64;
                                    *(_WORD *)v56 = 0;
                                    v36 = "Unexpected non-NULL RSA-PSS MaskGenAlgorithm.HashAlgorithm parameters";
                                  }
                                  v37 = v56;
                                  goto LABEL_72;
                                }
                                ne_log_obj();
                                v12 = (NEIKEv2AuthenticationProtocol *)objc_claimAutoreleasedReturnValue();
                                if (!os_log_type_enabled(&v12->super, OS_LOG_TYPE_ERROR))
                                  goto LABEL_64;
                                *(_DWORD *)v56 = 67109120;
                                v57 = v28;
                                v36 = "Could not parse RSA-PSS MaskGenAlgorithm.HashAlgorithm parameters, error %d";
                              }
                              v37 = v56;
LABEL_118:
                              p_super = &v12->super;
                              v39 = 8;
                              goto LABEL_73;
                            }
                            ne_log_obj();
                            v12 = (NEIKEv2AuthenticationProtocol *)objc_claimAutoreleasedReturnValue();
                            if (!os_log_type_enabled(&v12->super, OS_LOG_TYPE_ERROR))
                              goto LABEL_64;
                            LOWORD(v60) = 0;
                            v36 = "Incorrect RSA-PSS MaskGenAlgorithm.OID";
                            v37 = (uint8_t *)&v60;
                          }
                          else
                          {
                            ne_log_obj();
                            v12 = (NEIKEv2AuthenticationProtocol *)objc_claimAutoreleasedReturnValue();
                            if (!os_log_type_enabled(&v12->super, OS_LOG_TYPE_ERROR))
                              goto LABEL_64;
                            LOWORD(v62) = 0;
                            v36 = "Unexpected non-NULL HashAlgorithm parameters";
                            v37 = (uint8_t *)&v62;
                          }
LABEL_72:
                          p_super = &v12->super;
                          v39 = 2;
LABEL_73:
                          _os_log_error_impl(&dword_19BD16000, p_super, OS_LOG_TYPE_ERROR, v36, v37, v39);
                          goto LABEL_64;
                        }
                        ne_log_obj();
                        v12 = (NEIKEv2AuthenticationProtocol *)objc_claimAutoreleasedReturnValue();
                        if (!os_log_type_enabled(&v12->super, OS_LOG_TYPE_ERROR))
                          goto LABEL_64;
                        LODWORD(v62) = 67109120;
                        DWORD1(v62) = v24;
                        v36 = "Could not parse RSA-PSS HashAlgorithm parameters, error %d";
                      }
                      v37 = (uint8_t *)&v62;
                      goto LABEL_118;
                    }
                    ne_log_obj();
                    v12 = (NEIKEv2AuthenticationProtocol *)objc_claimAutoreleasedReturnValue();
                    if (!os_log_type_enabled(&v12->super, OS_LOG_TYPE_ERROR))
                      goto LABEL_64;
                    LODWORD(v64) = 67109120;
                    DWORD1(v64) = v21;
                    v36 = "Incorrect RSA-PSS trailer field parameter value %u";
                  }
                }
              }
              v37 = (uint8_t *)&v64;
              goto LABEL_118;
            }
            ne_log_obj();
            v12 = (NEIKEv2AuthenticationProtocol *)objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(&v12->super, OS_LOG_TYPE_ERROR))
              goto LABEL_54;
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)&buf[4] = v7;
            *(_WORD *)&buf[8] = 2112;
            *(_QWORD *)&buf[10] = v4;
            v33 = "Unexpected NULL parameters for RSA-PSS, payload len %u payload %@";
LABEL_68:
            v34 = &v12->super;
            v35 = 18;
LABEL_69:
            _os_log_error_impl(&dword_19BD16000, v34, OS_LOG_TYPE_ERROR, v33, buf, v35);
            goto LABEL_54;
          }
          v11 = 8;
        }
        v14 = -[NEIKEv2AuthenticationProtocol initWithDigitalSignature:]([NEIKEv2AuthenticationProtocol alloc], "initWithDigitalSignature:", v11);
        if (v14)
        {
          v12 = v14;
          if ((v10 & 1) != 0)
            goto LABEL_14;
          ne_log_obj();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = v12;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v7;
            *(_WORD *)&buf[18] = 2112;
            *(_QWORD *)&buf[20] = v4;
            _os_log_error_impl(&dword_19BD16000, v15, OS_LOG_TYPE_ERROR, "Unexpected non-NULL parameters for %@, payload len %u payload %@", buf, 0x1Cu);
          }

LABEL_54:
          v12 = 0;
          goto LABEL_14;
        }
        goto LABEL_35;
      }
      v41 = v54;
      ne_log_obj();
      v12 = (NEIKEv2AuthenticationProtocol *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v12->super, OS_LOG_TYPE_ERROR))
        goto LABEL_54;
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&buf[4] = v41;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v7;
      *(_WORD *)&buf[14] = 2112;
      *(_QWORD *)&buf[16] = v4;
      v33 = "Could not parse AlgorithmIdentifier parameters, error %d payload len %u payload %@";
    }
    v34 = &v12->super;
    v35 = 24;
    goto LABEL_69;
  }
  v5 = -[NEIKEv2AuthenticationProtocol initWithNonStandardDigitalSignature:]([NEIKEv2AuthenticationProtocol alloc], "initWithNonStandardDigitalSignature:", 3);
LABEL_13:
  v12 = v5;
LABEL_14:

  return v12;
}

+ (uint64_t)isRemoteAuthenticationPacketProtocol:(void *)a3 compatibleWithConfiguredProtocol:
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  NEIKEv2SignatureHashProtocol *v12;

  v4 = a2;
  v5 = a3;
  objc_opt_self();
  if ((objc_msgSend(v5, "isEqual:", v4) & 1) != 0)
    goto LABEL_2;
  if (!objc_msgSend(v5, "isDigitalSignature"))
  {
    if (objc_msgSend(v4, "isDigitalSignature"))
    {
      if (v4)
      {
        v8 = objc_msgSend(v4, "method");
        if (v8 == 245 || v8 == 14 && (unint64_t)(objc_msgSend(v4, "digitalSignatureAlgorithm") - 9) <= 2)
        {
          v6 = -[NEIKEv2AuthenticationProtocol isRSA]((uint64_t)v5);
          goto LABEL_22;
        }
        v9 = objc_msgSend(v4, "method");
        if (v9 == 1
          || v9 == 14 && (v10 = objc_msgSend(v4, "digitalSignatureAlgorithm"), v10 <= 6) && ((0x62u >> v10) & 1) != 0)
        {
          v6 = objc_msgSend(v5, "method") == 1;
          goto LABEL_22;
        }
      }
      if (-[NEIKEv2AuthenticationProtocol isECDSA]((uint64_t)v4)
        && -[NEIKEv2AuthenticationProtocol isECDSA]((uint64_t)v5))
      {
        v11 = (void *)+[NEIKEv2Crypto copySignHashSetForAuthMethod:]((uint64_t)NEIKEv2Crypto, v5);
        v12 = +[NEIKEv2Crypto copySignHashProtocolForAuth:]((uint64_t)NEIKEv2Crypto, v4);
        v6 = objc_msgSend(v11, "containsObject:", v12);

        goto LABEL_22;
      }
    }
LABEL_21:
    v6 = 0;
    goto LABEL_22;
  }
  v7 = objc_msgSend(v5, "digitalSignatureAlgorithm");
  if (v7 != objc_msgSend(v4, "digitalSignatureAlgorithm")
    || (objc_msgSend(v5, "isNonStandard") & 1) == 0 && (objc_msgSend(v4, "isNonStandard") & 1) == 0)
  {
    goto LABEL_21;
  }
LABEL_2:
  v6 = 1;
LABEL_22:

  return v6;
}

+ (uint64_t)copySignHashSetForAuthMethod:(uint64_t)a1
{
  id v2;
  NEIKEv2SignatureHashProtocol *v3;
  id v4;
  void *v5;
  uint64_t v6;
  NEIKEv2SignatureHashProtocol *v7;
  NEIKEv2SignatureHashProtocol *v8;
  NEIKEv2SignatureHashProtocol *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NEIKEv2SignatureHashProtocol *v13;
  NEIKEv2SignatureHashProtocol *v14;
  _QWORD v16[3];
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_self();
  v3 = +[NEIKEv2Crypto copySignHashProtocolForAuth:]((uint64_t)NEIKEv2Crypto, v2);
  if (!v3 || !objc_msgSend(v2, "isDigitalSignature"))
  {
    if (-[NEIKEv2AuthenticationProtocol isRSA]((uint64_t)v2))
    {
      v7 = -[NEIKEv2SignatureHashProtocol initWithHashType:]([NEIKEv2SignatureHashProtocol alloc], "initWithHashType:", 4);
      v16[0] = v7;
      v8 = -[NEIKEv2SignatureHashProtocol initWithHashType:]([NEIKEv2SignatureHashProtocol alloc], "initWithHashType:", 3);
      v16[1] = v8;
      v9 = -[NEIKEv2SignatureHashProtocol initWithHashType:]([NEIKEv2SignatureHashProtocol alloc], "initWithHashType:", 2);
      v16[2] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v10);
      goto LABEL_13;
    }
    if (!-[NEIKEv2AuthenticationProtocol isECDSA]((uint64_t)v2))
    {
      v6 = 0;
      goto LABEL_13;
    }
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
    objc_msgSend(v11, "addObject:", v3);
    v12 = -[NEIKEv2SignatureHashProtocol hashType](v3, "hashType");
    if (v12 != 3)
    {
      if (v12 != 2)
      {
LABEL_11:
        v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v11);

        goto LABEL_13;
      }
      v13 = -[NEIKEv2SignatureHashProtocol initWithHashType:]([NEIKEv2SignatureHashProtocol alloc], "initWithHashType:", 3);

      objc_msgSend(v11, "addObject:", v13);
      v3 = v13;
    }
    v14 = -[NEIKEv2SignatureHashProtocol initWithHashType:]([NEIKEv2SignatureHashProtocol alloc], "initWithHashType:", 4);

    objc_msgSend(v11, "addObject:", v14);
    v3 = v14;
    goto LABEL_11;
  }
  v4 = objc_alloc(MEMORY[0x1E0C99E60]);
  v17[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "initWithArray:", v5);

LABEL_13:
  return v6;
}

+ (NEIKEv2SignatureHashProtocol)copySignHashProtocolForAuth:(uint64_t)a1
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = a2;
  objc_opt_self();
  v3 = v2;
  objc_opt_self();
  v4 = objc_msgSend(v3, "method");
  switch(v4)
  {
    case 9:
      v5 = 2;
      goto LABEL_9;
    case 10:
      v5 = 3;
      goto LABEL_9;
    case 11:
      v5 = 4;
      goto LABEL_9;
    case 12:
    case 13:
      goto LABEL_10;
    case 14:
      v6 = objc_msgSend(v3, "digitalSignatureAlgorithm");
      if ((unint64_t)(v6 - 1) >= 0xB)
        goto LABEL_10;
      v5 = qword_19BED7098[v6 - 1];
      goto LABEL_9;
    default:
      v5 = v4;
      if (v4 == 1)
      {
LABEL_9:

        return -[NEIKEv2SignatureHashProtocol initWithHashType:]([NEIKEv2SignatureHashProtocol alloc], "initWithHashType:", v5);
      }
      else
      {
LABEL_10:

        return 0;
      }
  }
}

+ (id)copySignHashDataForSet:(void *)a3 authenticationSet:
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  v6 = objc_opt_self();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", v4);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)+[NEIKEv2Crypto copySignHashSetForAuthMethod:]((uint64_t)NEIKEv2Crypto, *(void **)(*((_QWORD *)&v16 + 1) + 8 * v12));
        objc_msgSend(v7, "unionSet:", v13, (_QWORD)v16);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  v14 = +[NEIKEv2Crypto copySignHashDataForSet:](v6, v7);
  return v14;
}

+ (id)copySignHashDataForSet:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unsigned int v12;
  id v13;
  __int16 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_self();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "allObjects");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sortedArrayUsingSelector:", sel_compare_);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", 2 * objc_msgSend(v4, "count"));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v4, "reverseObjectEnumerator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v10);
          v15 = 0;
          v12 = objc_msgSend(v11, "hashType");
          v15 = bswap32(v12) >> 16;
          if ((_WORD)v12)
            objc_msgSend(v5, "appendBytes:length:", &v15, 2);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }

    if (objc_msgSend(v5, "length"))
      v13 = v5;
    else
      v13 = 0;

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)copySignHashDataForSet:(void *)a3 authentication:
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  v6 = objc_opt_self();
  v7 = v6;
  if (v5)
  {
    v8 = objc_alloc(MEMORY[0x1E0C99E60]);
    v13[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithArray:", v9);
    v11 = +[NEIKEv2Crypto copySignHashDataForSet:authenticationSet:](v7, v4, v10);

  }
  else
  {
    v11 = +[NEIKEv2Crypto copySignHashDataForSet:](v6, v4);
  }

  return v11;
}

+ (void)copySignHashSetForData:(uint64_t)a1
{
  id v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  unsigned __int16 *v8;
  uint64_t v9;
  unsigned int v10;
  unint64_t v11;
  NEIKEv2SignatureHashProtocol *v12;
  NSObject *v13;
  uint8_t buf[4];
  unint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_self();
  v3 = objc_msgSend(v2, "length");
  if (!v3)
  {
LABEL_16:
    v6 = 0;
    goto LABEL_17;
  }
  v4 = v3;
  if ((v3 & 1) != 0)
  {
    ne_log_obj();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v16 = v4;
      _os_log_error_impl(&dword_19BD16000, v13, OS_LOG_TYPE_ERROR, "Sign hash data length %zu is not divisible by sizeof(uint16_t)", buf, 0xCu);
    }

    goto LABEL_16;
  }
  v5 = v3 >> 1;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", v3 >> 1);
  v7 = objc_msgSend(v2, "bytes");
  if (v4 >= 2)
  {
    v8 = (unsigned __int16 *)v7;
    if (v5 <= 1)
      v9 = 1;
    else
      v9 = v4 >> 1;
    do
    {
      v10 = *v8++;
      v11 = bswap32(v10) >> 16;
      if ((unsigned __int16)(v11 - 6) > 0xFFFAu)
      {
        v12 = -[NEIKEv2SignatureHashProtocol initWithHashType:]([NEIKEv2SignatureHashProtocol alloc], "initWithHashType:", v11);
        objc_msgSend(v6, "addObject:", v12);
      }
      else
      {
        ne_log_obj();
        v12 = (NEIKEv2SignatureHashProtocol *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v12->super, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          v16 = v11;
          _os_log_impl(&dword_19BD16000, &v12->super, OS_LOG_TYPE_INFO, "Ignoring sign hash algorithm %zu", buf, 0xCu);
        }
      }

      --v9;
    }
    while (v9);
  }
LABEL_17:

  return v6;
}

+ (uint64_t)createNATDetectionHashForInitiatorSPI:(void *)a3 responderSPI:(void *)a4 address:
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  const void *v10;
  __int16 *v11;
  CC_LONG v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v19;
  uint64_t data;
  __int16 v21;
  uint8_t v22[4];
  uint64_t v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  unsigned __int8 md[20];
  CC_SHA1_CTX buf;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  v8 = a4;
  objc_opt_self();
  if (v8)
  {
    if (objc_msgSend(v8, "addressFamily") == 2)
    {
      v9 = objc_msgSend(v8, "address");
      v10 = (const void *)(v9 + 4);
      v11 = (__int16 *)(v9 + 2);
      v12 = 4;
LABEL_9:
      v21 = *v11;
      data = objc_msgSend(v6, "value");
      v19 = objc_msgSend(v7, "value");
      memset(&buf, 0, sizeof(buf));
      CC_SHA1_Init(&buf);
      CC_SHA1_Update(&buf, &data, 8u);
      CC_SHA1_Update(&buf, &v19, 8u);
      CC_SHA1_Update(&buf, v10, v12);
      CC_SHA1_Update(&buf, &v21, 2u);
      CC_SHA1_Final(md, &buf);
      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", md, 20);
      ne_log_obj();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v22 = 138413058;
        v23 = v14;
        v24 = 2112;
        v25 = v6;
        v26 = 2112;
        v27 = v7;
        v28 = 2112;
        v29 = v8;
        _os_log_debug_impl(&dword_19BD16000, v16, OS_LOG_TYPE_DEBUG, "Created NAT hash (%@) for %@ : %@ : %@", v22, 0x2Au);
      }

      goto LABEL_15;
    }
    if (objc_msgSend(v8, "addressFamily") == 30)
    {
      v15 = objc_msgSend(v8, "address");
      v10 = (const void *)(v15 + 8);
      v11 = (__int16 *)(v15 + 2);
      v12 = 16;
      goto LABEL_9;
    }
    ne_log_obj();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      buf.h0 = 67109120;
      buf.h1 = objc_msgSend(v8, "addressFamily");
      _os_log_fault_impl(&dword_19BD16000, v17, OS_LOG_TYPE_FAULT, "Unknown address family %u", (uint8_t *)&buf, 8u);
    }

    v14 = 0;
  }
  else
  {
    ne_log_obj();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      buf.h0 = 138412546;
      *(_QWORD *)&buf.h1 = v6;
      LOWORD(buf.h3) = 2112;
      *(_QWORD *)((char *)&buf.h3 + 2) = v7;
      _os_log_impl(&dword_19BD16000, v13, OS_LOG_TYPE_DEFAULT, "Generating fake NAT detection hash for %@ %@", (uint8_t *)&buf, 0x16u);
    }

    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &createNATDetectionHashForInitiatorSPI_responderSPI_address__hashBytes, 20);
  }
LABEL_15:

  return v14;
}

+ (uint64_t)copyCertificateFromPersistentData:(int)a3 isModernSystem:
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  OSStatus v14;
  OSStatus v15;
  NSObject *v16;
  uint64_t v17;
  _DWORD v19[4];
  _QWORD v20[4];
  _QWORD v21[4];
  _QWORD v22[4];
  _QWORD v23[4];
  _BYTE result[12];
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_opt_self();
  ne_log_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)result = 138412546;
      *(_QWORD *)&result[4] = v4;
      v25 = 1024;
      v26 = a3;
      _os_log_debug_impl(&dword_19BD16000, v6, OS_LOG_TYPE_DEBUG, "copyCertificateFromPersistentData: %@ isModernSystem %d", result, 0x12u);
    }

    v7 = *MEMORY[0x1E0C9AE50];
    v8 = *MEMORY[0x1E0CD70E0];
    if ((a3 & 1) != 0)
    {
      v20[0] = *MEMORY[0x1E0CD7028];
      v20[1] = v8;
      v9 = *MEMORY[0x1E0CD70C0];
      v20[2] = *MEMORY[0x1E0CD6C98];
      v20[3] = v9;
      v21[0] = v7;
      v21[1] = v4;
      v21[2] = *MEMORY[0x1E0CD6CA0];
      v21[3] = v7;
      v10 = (void *)MEMORY[0x1E0C99D80];
      v11 = v21;
      v12 = v20;
    }
    else
    {
      v22[0] = *MEMORY[0x1E0CD7028];
      v22[1] = v8;
      v13 = *MEMORY[0x1E0CD70C0];
      v22[2] = *MEMORY[0x1E0CD6C98];
      v22[3] = v13;
      v23[0] = v7;
      v23[1] = v4;
      v23[2] = *MEMORY[0x1E0CD6CA0];
      v23[3] = v7;
      v10 = (void *)MEMORY[0x1E0C99D80];
      v11 = v23;
      v12 = v22;
    }
    objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v11, v12, 4);
    v6 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)result = 0;
    v14 = SecItemCopyMatching((CFDictionaryRef)v6, (CFTypeRef *)result);
    if (!v14)
    {
      v17 = *(_QWORD *)result;
      goto LABEL_14;
    }
    v15 = v14;
    ne_log_obj();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v19[0] = 67109120;
      v19[1] = v15;
      _os_log_error_impl(&dword_19BD16000, v16, OS_LOG_TYPE_ERROR, "Failed to retrieve certificate from persistent data (%d)", (uint8_t *)v19, 8u);
    }

    if (*(_QWORD *)result)
      CFRelease(*(CFTypeRef *)result);
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)result = 136315138;
    *(_QWORD *)&result[4] = "+[NEIKEv2Crypto copyCertificateFromPersistentData:isModernSystem:]";
    _os_log_fault_impl(&dword_19BD16000, v6, OS_LOG_TYPE_FAULT, "%s called with null persistentData", result, 0xCu);
  }
  v17 = 0;
LABEL_14:

  return v17;
}

+ (NSObject)copyDataFromPersistentReference:(uint64_t)a1
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const __CFDictionary *v6;
  OSStatus v7;
  NSObject *v8;
  CFTypeID v9;
  CFTypeID TypeID;
  CFDataRef v11;
  uint8_t v13[16];
  _QWORD v14[4];
  _QWORD v15[4];
  _BYTE result[24];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_self();
  if (v2)
  {
    v3 = *MEMORY[0x1E0C9AE50];
    v4 = *MEMORY[0x1E0CD70E0];
    v14[0] = *MEMORY[0x1E0CD7018];
    v14[1] = v4;
    v5 = *MEMORY[0x1E0CD70C0];
    v14[2] = *MEMORY[0x1E0CD6C98];
    v14[3] = v5;
    v15[0] = v3;
    v15[1] = v2;
    v15[2] = *MEMORY[0x1E0CD6CA8];
    v15[3] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
    v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)result = 0;
    v7 = SecItemCopyMatching(v6, (CFTypeRef *)result);
    v8 = *(NSObject **)result;
    if (!*(_QWORD *)result
      || v7
      || (v9 = CFGetTypeID(*(CFTypeRef *)result), TypeID = CFDataGetTypeID(), v8 = *(NSObject **)result, v9 != TypeID))
    {
      if (v8)
      {
        CFRelease(v8);
        *(_QWORD *)result = 0;
      }
      ne_log_obj();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v13 = 0;
        _os_log_error_impl(&dword_19BD16000, v8, OS_LOG_TYPE_ERROR, "SecItemCopyMatching", v13, 2u);
      }
      v11 = 0;
      goto LABEL_12;
    }
    *(_QWORD *)result = 0;
    if (!+[NSData isSensitiveDataInstance:](MEMORY[0x1E0C99D50], v8))
    {
      v11 = +[NSData sensitiveDataWithData:](MEMORY[0x1E0C99D50], v8);
LABEL_12:

      v8 = v11;
    }
  }
  else
  {
    ne_log_obj();
    v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)result = 136315138;
      *(_QWORD *)&result[4] = "+[NEIKEv2Crypto copyDataFromPersistentReference:]";
      _os_log_fault_impl(&dword_19BD16000, (os_log_t)v6, OS_LOG_TYPE_FAULT, "%s called with null persistentReference", result, 0xCu);
    }
    v8 = 0;
  }

  return v8;
}

+ (uint64_t)copySecIdentity:(void *)a3 keyData:(int)a4 isModernSystem:
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  const void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _BYTE *v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  OSStatus v25;
  OSStatus v26;
  NSObject *v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  const __CFDictionary *v31;
  OSStatus v32;
  OSStatus v33;
  NSObject *v34;
  NSObject *v35;
  const void *v37;
  const char *v38;
  _QWORD v39[4];
  _QWORD v40[4];
  uint8_t v41[4];
  OSStatus v42;
  _QWORD v43[4];
  _QWORD v44[4];
  uint8_t buf[8];
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _BYTE result[24];
  uint64_t v50;
  _BYTE v51[12];
  __int16 v52;
  int v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  objc_opt_self();
  if (v6)
  {
    if (v7 && objc_msgSend(v7, "length"))
    {
      v8 = v6;
      v9 = v7;
      v10 = objc_opt_self();
      ne_log_obj();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)result = 138412802;
        *(_QWORD *)&result[4] = v8;
        *(_WORD *)&result[12] = 2112;
        *(_QWORD *)&result[14] = v9;
        *(_WORD *)&result[22] = 1024;
        LODWORD(v50) = a4;
        _os_log_debug_impl(&dword_19BD16000, v11, OS_LOG_TYPE_DEBUG, "copySecIdentityFromModernDP %@ %@ %d", result, 0x1Cu);
      }

      v12 = +[NEIKEv2Crypto copyCertificateFromPersistentData:isModernSystem:](v10, v8, a4);
      if (v12)
      {
        v13 = (const void *)v12;
        v14 = v9;
        objc_opt_self();
        ne_log_obj();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v51 = 138412546;
          *(_QWORD *)&v51[4] = v14;
          v52 = 1024;
          v53 = a4;
          _os_log_debug_impl(&dword_19BD16000, v15, OS_LOG_TYPE_DEBUG, "copyKeyFromPersistentData: %@ isModernSystem %d", v51, 0x12u);
        }

        v16 = *MEMORY[0x1E0C9AE50];
        v17 = *MEMORY[0x1E0CD70E0];
        if ((a4 & 1) != 0)
        {
          v43[0] = *MEMORY[0x1E0CD7028];
          v43[1] = v17;
          v18 = *MEMORY[0x1E0CD70C0];
          v43[2] = *MEMORY[0x1E0CD6C98];
          v43[3] = v18;
          v44[0] = v16;
          v44[1] = v14;
          v44[2] = *MEMORY[0x1E0CD6CC0];
          v44[3] = v16;
          v19 = (void *)MEMORY[0x1E0C99D80];
          v20 = v44;
          v21 = (uint8_t *)v43;
        }
        else
        {
          *(_QWORD *)buf = *MEMORY[0x1E0CD7028];
          v46 = v17;
          v30 = *MEMORY[0x1E0CD70C0];
          v47 = *MEMORY[0x1E0CD6C98];
          v48 = v30;
          *(_QWORD *)result = v16;
          *(_QWORD *)&result[8] = v14;
          *(_QWORD *)&result[16] = *MEMORY[0x1E0CD6CC0];
          v50 = v16;
          v19 = (void *)MEMORY[0x1E0C99D80];
          v20 = result;
          v21 = buf;
        }
        objc_msgSend(v19, "dictionaryWithObjects:forKeys:count:", v20, v21, 4);
        v31 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)v51 = 0;
        v32 = SecItemCopyMatching(v31, (CFTypeRef *)v51);
        if (v32)
        {
          v33 = v32;
          ne_log_obj();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v41 = 67109120;
            v42 = v33;
            _os_log_error_impl(&dword_19BD16000, v34, OS_LOG_TYPE_ERROR, "Failed to retrieve private key from persistent data (%d)", v41, 8u);
          }

          if (*(_QWORD *)v51)
            CFRelease(*(CFTypeRef *)v51);

          goto LABEL_27;
        }
        v37 = *(const void **)v51;

        if (!v37)
        {
LABEL_27:
          ne_log_obj();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)result = 0;
            _os_log_error_impl(&dword_19BD16000, v35, OS_LOG_TYPE_ERROR, "Failed to retrieve certificate key reference for configured local certificate", result, 2u);
          }

          CFRelease(v13);
          goto LABEL_30;
        }
        v28 = SecIdentityCreate();
        CFRelease(v13);
        CFRelease(v37);
        if (v28)
          goto LABEL_31;
        ne_log_obj();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)result = 0;
          v38 = "Failed to create identity reference for configured local certificate";
LABEL_38:
          _os_log_error_impl(&dword_19BD16000, v29, OS_LOG_TYPE_ERROR, v38, result, 2u);
        }
      }
      else
      {
        ne_log_obj();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)result = 0;
          v38 = "Failed to retrieve certificate reference for configured local certificate";
          goto LABEL_38;
        }
      }

LABEL_30:
      v28 = 0;
LABEL_31:

      goto LABEL_32;
    }
    v22 = *MEMORY[0x1E0C9AE50];
    v23 = *MEMORY[0x1E0CD70E0];
    v39[0] = *MEMORY[0x1E0CD7028];
    v39[1] = v23;
    v24 = *MEMORY[0x1E0CD70C0];
    v39[2] = *MEMORY[0x1E0CD6C98];
    v39[3] = v24;
    v40[0] = v22;
    v40[1] = v6;
    v40[2] = *MEMORY[0x1E0CD6CB0];
    v40[3] = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 4);
    v8 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)result = 0;
    v25 = SecItemCopyMatching((CFDictionaryRef)v8, (CFTypeRef *)result);
    if (!v25)
    {
      v28 = *(_QWORD *)result;
      goto LABEL_32;
    }
    v26 = v25;
    ne_log_obj();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v26;
      _os_log_error_impl(&dword_19BD16000, v27, OS_LOG_TYPE_ERROR, "Failed to retrieve data for configured local certificate identity (%d)", buf, 8u);
    }

    if (*(_QWORD *)result)
      CFRelease(*(CFTypeRef *)result);
  }
  else
  {
    ne_log_obj();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)result = 136315138;
      *(_QWORD *)&result[4] = "+[NEIKEv2Crypto copySecIdentity:keyData:isModernSystem:]";
      _os_log_fault_impl(&dword_19BD16000, v8, OS_LOG_TYPE_FAULT, "%s called with null certIdentityData", result, 0xCu);
    }
  }
  v28 = 0;
LABEL_32:

  return v28;
}

@end
