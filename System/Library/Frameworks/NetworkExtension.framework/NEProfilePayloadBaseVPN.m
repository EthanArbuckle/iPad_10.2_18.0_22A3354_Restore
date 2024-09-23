@implementation NEProfilePayloadBaseVPN

- (NEProfilePayloadBaseVPN)initWithPayload:(id)a3
{
  id v4;
  NSObject *v5;
  NEProfilePayloadBaseVPN *v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSString *proxyUserName;
  void *v15;
  uint64_t v16;
  NSString *v17;
  NSString *v18;
  NSString *proxyPassword;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSString *userName;
  void *v35;
  void *v36;
  uint64_t v37;
  NSString *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  NSString *v45;
  NSString *password;
  id v47;
  NSObject *v48;
  void *v49;
  void *v50;
  __CFString **v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  int v59;
  void *v60;
  id v61;
  CFStringRef v62;
  const __CFString *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  size_t v67;
  char *v68;
  char *v69;
  char *v70;
  char v71;
  size_t v72;
  void *v73;
  void *v74;
  int v75;
  const char *BytePtr;
  CFIndex v77;
  const __CFAllocator *v78;
  const UInt8 *v79;
  CFStringEncoding v80;
  void *v81;
  void *v82;
  int v83;
  NSObject *v84;
  id v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v91;
  void *v92;
  id v93;
  void *v94;
  id v95;
  void *v96;
  uint64_t v97;
  NSString *v98;
  void *v99;
  void *v100;
  id v101;
  void *v102;
  id v103;
  void *v104;
  void *v105;
  objc_super v106;
  uint8_t buf[4];
  id v108;
  __int16 v109;
  id v110;
  uint64_t v111;

  v111 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  ne_log_large_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v108 = (id)objc_opt_class();
    v109 = 2112;
    v110 = v4;
    v40 = v108;
    _os_log_debug_impl(&dword_19BD16000, v5, OS_LOG_TYPE_DEBUG, "%@ NEProfilePayloadVPNBase initWithPayload: payloadDict %@", buf, 0x16u);

  }
  v106.receiver = self;
  v106.super_class = (Class)NEProfilePayloadBaseVPN;
  v6 = -[NEProfilePayloadBase initWithPayload:](&v106, sel_initWithPayload_, v4);
  ne_log_large_obj();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    -[NEProfilePayloadBase payloadAtom](v6, "payloadAtom");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v108 = v6;
    v109 = 2112;
    v110 = v41;
    _os_log_debug_impl(&dword_19BD16000, v7, OS_LOG_TYPE_DEBUG, "NEProfilePayloadVPNBase initWithPayload: self %@,  cached atom %@", buf, 0x16u);

  }
  v8 = v4;
  if (v6)
  {
    ne_log_large_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v42 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v108 = v42;
      v109 = 2112;
      v110 = v8;
      v43 = v42;
      _os_log_debug_impl(&dword_19BD16000, v9, OS_LOG_TYPE_DEBUG, "%@ extractPayloadContents: payloadDict %@", buf, 0x16u);

    }
    if (v8)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Proxies"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("HTTPProxyAuthenticated"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v6->_proxyUserNameRequired = objc_msgSend(v12, "intValue") != 0;
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("HTTPProxyUsername"));
          v13 = objc_claimAutoreleasedReturnValue();
          proxyUserName = v6->_proxyUserName;
          v6->_proxyUserName = (NSString *)v13;

        }
        else
        {
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("HTTPProxyUsername"));
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = v6->_proxyUserName;
          v6->_proxyUserName = (NSString *)v16;

          v6->_proxyUserNameRequired = v6->_proxyUserName != 0;
        }
        v6->_proxyPasswordRequired = v6->_proxyUserNameRequired;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("HTTPProxyPassword"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v15 = 0;
      }
      if (isa_nsdata(v15))
        v18 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v15, 4);
      else
        v18 = v15;
      proxyPassword = v6->_proxyPassword;
      v6->_proxyPassword = v18;

      v20 = v8;
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("PPP"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v21)
      {
        objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("AuthEAPPlugins"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v23;
        if (v23)
          v25 = objc_msgSend(v23, "containsObject:", CFSTR("EAP-RSA"));
        else
          v25 = 0;

      }
      else
      {
        v25 = 0;
      }
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("IPSec"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("XAuthPasswordEncryption"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v27;
        if (v27)
          v29 = objc_msgSend(v27, "isEqualToString:", CFSTR("Prompt"));
        else
          v29 = 0;

      }
      else
      {
        v29 = 0;
      }
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("VPNType"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v30, "isEqualToString:", CFSTR("IPSec")))
      {
        objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("IPSec"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v31)
        {
          objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("AuthenticationMethod"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v32;
          if (v32)
          {
            if (objc_msgSend(v32, "isEqualToString:", CFSTR("SharedSecret")))
            {
              objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("XAuthName"));
              v33 = objc_claimAutoreleasedReturnValue();
              userName = v6->_userName;
              v6->_userName = (NSString *)v33;

              v6->_userNameRequired = 1;
            }
            if (v25 && v29 || (objc_msgSend(v26, "isEqualToString:", CFSTR("Certificate")) & 1) != 0)
              goto LABEL_60;
          }
          else if (v25 && v29)
          {
            goto LABEL_60;
          }
          objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("PayloadCertificateUUID"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          if (v39)
          {

          }
          else
          {
            objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("PayloadCertificateIdentityUUID"));
            v44 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v44)
            {
              objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("XAuthPassword"));
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v6->_passwordRequired = 1;
              goto LABEL_61;
            }
          }
LABEL_60:
          v35 = 0;
LABEL_61:

          goto LABEL_62;
        }
LABEL_54:
        v35 = 0;
        goto LABEL_62;
      }
      if (objc_msgSend(v30, "isEqualToString:", CFSTR("IKEv2")))
      {
        objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("IKEv2"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v31)
          goto LABEL_54;
        objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("ExtendedAuthEnabled"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v35)
          goto LABEL_62;
        objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("LocalCertificate"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (v36
          || (objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("PayloadCertificateUUID")),
              (v36 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
          || (objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("PayloadCertificateFileName")),
              (v36 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
          || (objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("PayloadCertificateIdentityUUID")),
              (v36 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {

          goto LABEL_54;
        }
        objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("ExtensibleSSOProvider"));
        v96 = (void *)objc_claimAutoreleasedReturnValue();

        if (v96)
          goto LABEL_54;
        objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("AuthName"));
        v97 = objc_claimAutoreleasedReturnValue();
        v98 = v6->_userName;
        v6->_userName = (NSString *)v97;

        objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("AuthPassword"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v6->_userNameRequired = 1;
      }
      else
      {
        if ((objc_msgSend(v30, "isEqualToString:", CFSTR("VPN")) & 1) != 0)
        {
          v35 = 0;
          v31 = v26;
          goto LABEL_62;
        }
        objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("PPP"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        v6->_userNameRequired = 1;
        if (!v31)
          goto LABEL_54;
        objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("AuthName"));
        v37 = objc_claimAutoreleasedReturnValue();
        v38 = v6->_userName;
        v6->_userName = (NSString *)v37;

        if (v25)
        {
          if (v29)
            goto LABEL_54;
        }
        objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("AuthPassword"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v6->_passwordRequired = 1;
LABEL_62:
      if (isa_nsdata(v35))
        v45 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v35, 4);
      else
        v45 = v35;
      password = v6->_password;
      v6->_password = v45;

      v47 = v20;
      ne_log_large_obj();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
      {
        v60 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138412546;
        v108 = v60;
        v109 = 2112;
        v110 = v47;
        v61 = v60;
        _os_log_debug_impl(&dword_19BD16000, v48, OS_LOG_TYPE_DEBUG, "%@ extractPayloadContentsSharedSecret: dict %@", buf, 0x16u);

      }
      objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("VPNType"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v49;
      if (!v49)
      {
LABEL_127:

        v85 = v47;
        objc_msgSend(v85, "objectForKeyedSubscript:", CFSTR("VPNType"));
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v86, "isEqualToString:", CFSTR("IPSec")))
        {
          objc_msgSend(v85, "objectForKeyedSubscript:", CFSTR("IPSec"));
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          v88 = v87;
          if (v87)
          {
            objc_msgSend(v87, "objectForKeyedSubscript:", CFSTR("PromptForVPNPIN"));
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            if (v89)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v89, "intValue") == 1)
                v6->_pinRequired = 1;
            }
            goto LABEL_135;
          }
        }
        else
        {
          v88 = 0;
        }
        v89 = 0;
LABEL_135:

        goto LABEL_136;
      }
      if ((objc_msgSend(v49, "isEqualToString:", CFSTR("IPSec")) & 1) != 0
        || (objc_msgSend(v50, "isEqualToString:", CFSTR("L2TP")) & 1) != 0)
      {
        v51 = kNEIPSecKey;
      }
      else
      {
        if (!objc_msgSend(v50, "isEqualToString:", CFSTR("IKEv2")))
          goto LABEL_127;
        v51 = kNEIKEv2Key;
      }
      objc_msgSend(v47, "objectForKeyedSubscript:", *v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v52)
        goto LABEL_127;
      v53 = v52;
      objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("AuthenticationMethod"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = v54;
      if (!v54 || (objc_msgSend(v54, "isEqualToString:", CFSTR("Certificate")) & 1) == 0)
      {
        objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("PayloadCertificateUUID"));
        v56 = (id)objc_claimAutoreleasedReturnValue();
        if (!v56)
        {
          objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("PayloadCertificateIdentityUUID"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v26)
            goto LABEL_88;
        }
        objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("ExtendedAuthEnabled"));
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        if (!isa_nsnumber(v57))
        {

          if (!v56)
            v56 = v26;
          goto LABEL_125;
        }
        v104 = v55;
        objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("ExtendedAuthEnabled"));
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = objc_msgSend(v58, "BOOLValue");

        if (v56)
        {

          v55 = v104;
          if (!v59)
            goto LABEL_126;
LABEL_88:
          objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("IPSecSharedSecret"));
          v56 = (id)objc_claimAutoreleasedReturnValue();
          if (v56
            || (objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("SharedSecret")),
                (v56 = (id)objc_claimAutoreleasedReturnValue()) != 0))
          {
            if (!isa_nsdata(v56))
            {
              if ((isa_nsstring(v56) & 1) != 0)
                goto LABEL_115;
              ne_log_obj();
              v64 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
              {
                v99 = v55;
                v100 = (void *)objc_opt_class();
                v101 = v100;
                v102 = (void *)objc_opt_class();
                *(_DWORD *)buf = 138412546;
                v108 = v100;
                v109 = 2112;
                v110 = v102;
                v103 = v102;
                _os_log_debug_impl(&dword_19BD16000, v64, OS_LOG_TYPE_DEBUG, "%@ extractPayloadContentsSharedSecret: Invalid shared secret object type %@, setting to nil", buf, 0x16u);

                v55 = v99;
              }

              v63 = 0;
              goto LABEL_114;
            }
            v62 = (CFStringRef)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v56, 4);
          }
          else
          {
            objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("ExportedSharedSecret"));
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            if (v65)
            {
              v56 = v65;
              if (objc_msgSend(v56, "length"))
              {
                v66 = v55;
                v67 = objc_msgSend(v56, "length");
                v68 = (char *)malloc_type_malloc(v67, 0x9AA3A2uLL);
                objc_msgSend(v56, "getBytes:length:", v68, v67);
                if (v67)
                {
                  v69 = &kVPNObfuscationKey;
                  v70 = v68;
                  do
                  {
                    v71 = *v69++;
                    *v70++ ^= v71;
                    if (v69 == "؛[]y<I@")
                      v69 = &kVPNObfuscationKey;
                    --v67;
                  }
                  while (v67);
                }
                v72 = strlen(v68);
                v63 = (const __CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v68, v72, 4);
                memset_s(v68, v72, 0, v72);
                free(v68);
                v55 = v66;
              }
              else
              {
                v63 = &stru_1E3CC53C8;
              }

              goto LABEL_114;
            }
            objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("IPSecSharedSecretObf"));
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            v56 = v73;
            if (!v73)
              goto LABEL_115;
            if (!objc_msgSend(v73, "length"))
            {
              v63 = &stru_1E3CC53C8;
              goto LABEL_114;
            }
            v74 = v55;
            if (*CFDataGetBytePtr((CFDataRef)v56))
              v75 = 335544576;
            else
              v75 = 268435712;
            BytePtr = (const char *)CFDataGetBytePtr((CFDataRef)v56);
            v77 = strlen(BytePtr);
            v78 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
            v79 = CFDataGetBytePtr((CFDataRef)v56);
            v80 = v75;
            v55 = v74;
            v62 = CFStringCreateWithBytes(v78, v79, v77, v80, 0);
          }
          v63 = v62;
LABEL_114:

          v56 = (id)v63;
LABEL_115:
          v6->_sharedSecretRequired = 1;
          objc_storeStrong((id *)&v6->_sharedSecret, v56);
          if (v6->_sharedSecretRequired
            && objc_msgSend(v50, "isEqualToString:", CFSTR("IKEv2"))
            && objc_msgSend(v55, "isEqualToString:", CFSTR("None")))
          {
            objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("ExtendedAuthEnabled"));
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            if ((isa_nsnumber(v81) & 1) != 0)
            {
              objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("ExtendedAuthEnabled"));
              v105 = v55;
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              v83 = objc_msgSend(v82, "BOOLValue");

              v55 = v105;
              if (v83)
                v6->_sharedSecretRequired = 0;
            }
            else
            {

            }
          }
          ne_log_obj();
          v84 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
          {
            v91 = v55;
            v92 = (void *)objc_opt_class();
            v93 = v92;
            v94 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138412546;
            v108 = v92;
            v109 = 2112;
            v110 = v94;
            v95 = v94;
            _os_log_debug_impl(&dword_19BD16000, v84, OS_LOG_TYPE_DEBUG, "%@ extractPayloadContentsSharedSecret: (value class %@)", buf, 0x16u);

            v55 = v91;
          }

LABEL_125:
          goto LABEL_126;
        }

        v55 = v104;
        if ((v59 & 1) != 0)
          goto LABEL_88;
      }
LABEL_126:

      goto LABEL_127;
    }
  }
LABEL_136:

  return v6;
}

- (id)validatePayload
{
  NSObject *v3;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  ne_log_large_obj();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[NEProfilePayloadBase payloadAtom](self, "payloadAtom");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_debug_impl(&dword_19BD16000, v3, OS_LOG_TYPE_DEBUG, "NEProfilePayloadBaseVPN validate: To-Do. dict %@", (uint8_t *)&v6, 0xCu);

  }
  return 0;
}

- (id)getPreprocessedPayloadContents
{
  id v3;
  void *v4;
  NSString *userName;
  NSString *password;
  NSString *proxyUserName;
  NSString *proxyPassword;
  NSString *sharedSecret;
  NSString *pin;
  NSObject *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  userName = self->_userName;
  if (userName)
    objc_msgSend(v3, "setValue:forKey:", userName, CFSTR("AuthName"));
  if (self->_userNameRequired)
    objc_msgSend(v4, "setValue:forKey:", CFSTR("1"), CFSTR("AuthNameRequired"));
  password = self->_password;
  if (password)
    objc_msgSend(v4, "setValue:forKey:", password, CFSTR("AuthPassword"));
  if (self->_passwordRequired)
    objc_msgSend(v4, "setValue:forKey:", CFSTR("1"), CFSTR("AuthPasswordRequired"));
  proxyUserName = self->_proxyUserName;
  if (proxyUserName)
    objc_msgSend(v4, "setValue:forKey:", proxyUserName, CFSTR("HTTPProxyUsername"));
  if (self->_proxyUserNameRequired)
    objc_msgSend(v4, "setValue:forKey:", CFSTR("1"), CFSTR("HTTPProxyUsernameRequired"));
  proxyPassword = self->_proxyPassword;
  if (proxyPassword)
    objc_msgSend(v4, "setValue:forKey:", proxyPassword, CFSTR("HTTPProxyPassword"));
  if (self->_proxyPasswordRequired)
    objc_msgSend(v4, "setValue:forKey:", self->_proxyPassword, CFSTR("HTTPProxyPasswordRequired"));
  sharedSecret = self->_sharedSecret;
  if (sharedSecret)
    objc_msgSend(v4, "setValue:forKey:", sharedSecret, CFSTR("SharedSecret"));
  if (self->_sharedSecretRequired)
    objc_msgSend(v4, "setValue:forKey:", CFSTR("1"), CFSTR("SharedSecretRequired"));
  pin = self->_pin;
  if (pin)
    objc_msgSend(v4, "setValue:forKey:", pin, CFSTR("PromptForVPNPIN"));
  if (self->_pinRequired)
    objc_msgSend(v4, "setValue:forKey:", CFSTR("1"), CFSTR("PromptForVPNPINRequired"));
  ne_log_large_obj();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v13 = 138412290;
    v14 = v4;
    _os_log_debug_impl(&dword_19BD16000, v11, OS_LOG_TYPE_DEBUG, "NEProfilePayloadBaseVPN getPreprocessedPayloadContents: dict %@", (uint8_t *)&v13, 0xCu);
  }

  return v4;
}

- (BOOL)setPostprocessedPayloadContents:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSString *v7;
  NSString *userName;
  void *v9;
  NSString *v10;
  NSString *password;
  void *v12;
  NSString *v13;
  NSString *proxyUserName;
  void *v15;
  NSString *v16;
  NSString *proxyPassword;
  void *v18;
  NSString *v19;
  NSString *sharedSecret;
  void *v21;
  NSString *v22;
  NSString *pin;
  id v25;
  _BYTE v26[24];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  ne_log_large_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v26 = 138412546;
    *(_QWORD *)&v26[4] = objc_opt_class();
    *(_WORD *)&v26[12] = 2112;
    *(_QWORD *)&v26[14] = v4;
    v25 = *(id *)&v26[4];
    _os_log_debug_impl(&dword_19BD16000, v5, OS_LOG_TYPE_DEBUG, "%@ setPostprocessedPayloadContents newContents %@", v26, 0x16u);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AuthName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AuthName"));
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    userName = self->_userName;
    self->_userName = v7;

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AuthPassword"), *(_OWORD *)v26, *(_QWORD *)&v26[16], v27);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AuthPassword"));
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    password = self->_password;
    self->_password = v10;

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HTTPProxyUsername"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HTTPProxyUsername"));
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    proxyUserName = self->_proxyUserName;
    self->_proxyUserName = v13;

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HTTPProxyPassword"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HTTPProxyPassword"));
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    proxyPassword = self->_proxyPassword;
    self->_proxyPassword = v16;

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SharedSecret"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SharedSecret"));
    v19 = (NSString *)objc_claimAutoreleasedReturnValue();
    sharedSecret = self->_sharedSecret;
    self->_sharedSecret = v19;

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PromptForVPNPIN"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PromptForVPNPIN"));
    v22 = (NSString *)objc_claimAutoreleasedReturnValue();
    pin = self->_pin;
    self->_pin = v22;

  }
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pin, 0);
  objc_storeStrong((id *)&self->_sharedSecret, 0);
  objc_storeStrong((id *)&self->_proxyPassword, 0);
  objc_storeStrong((id *)&self->_proxyUserName, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_userName, 0);
}

@end
