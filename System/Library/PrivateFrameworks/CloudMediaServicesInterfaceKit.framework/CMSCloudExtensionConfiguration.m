@implementation CMSCloudExtensionConfiguration

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<CMSCloudExtensionConfiguration: baseURL:%@ globalHeaders:%@ endpointConfigs:%@>"), self->_baseURL, self->_globalHeaders, self->_endpointConfigs);
}

+ (id)_configurationFromJWS:(id)a3 URL:(id)a4 parentNetworkActivity:(id)a5 keyID:(id)a6 publicKey:(id)a7 languageCode:(id)a8 error:(id *)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  CMSJSONWebSignature *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  CMSCloudExtensionConfiguration *v25;
  id v27;

  v14 = a4;
  v15 = a5;
  v16 = a8;
  v17 = a7;
  v18 = a6;
  v19 = a3;
  v20 = -[CMSJSONWebSignature initWithJWSCompactEncodedString:keyID:publicKey:]([CMSJSONWebSignature alloc], "initWithJWSCompactEncodedString:keyID:publicKey:", v19, v18, v17);

  -[CMSJSONWebSignature verificationError](v20, "verificationError");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    v22 = (void *)MEMORY[0x24BDD1608];
    -[CMSJSONWebSignature payload](v20, "payload");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    objc_msgSend(v22, "JSONObjectWithData:options:error:", v23, 0, &v27);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v27;

    if (!v21)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v25 = -[CMSCloudExtensionConfiguration initWithDictionary:fromURL:parentNetworkActivity:languageCode:]([CMSCloudExtensionConfiguration alloc], "initWithDictionary:fromURL:parentNetworkActivity:languageCode:", v24, v14, v15, v16);
        -[CMSCloudExtensionConfiguration parsingError](v25, "parsingError");
        v21 = (id)objc_claimAutoreleasedReturnValue();
        if (!v21)
        {

          goto LABEL_11;
        }

      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cloudextension.errors.configuration"), 0, 0);
        v21 = (id)objc_claimAutoreleasedReturnValue();
      }
    }

  }
  v25 = 0;
  if (a9 && v21)
  {
    v21 = objc_retainAutorelease(v21);
    v25 = 0;
    *a9 = v21;
  }
LABEL_11:

  return v25;
}

+ (void)configurationFromURL:(id)a3 forSession:(id)a4 usingAuth:(id)a5 authProvider:(id)a6 parentNetworkActivity:(id)a7 keyID:(id)a8 publicKey:(id)a9 URLSessionConfiguration:(id)a10 languageCode:(id)a11 completion:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  NSObject *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  _QWORD v48[4];
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  uint64_t *v55;
  _QWORD v56[4];
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  CMSNetworkActivity *v71;
  uint8_t buf[4];
  const char *v73;
  __int16 v74;
  id v75;
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  v17 = a3;
  v18 = a4;
  v47 = a5;
  v42 = a6;
  v19 = a7;
  v43 = a8;
  v45 = a9;
  v20 = a10;
  v21 = a11;
  v22 = a12;
  if (v20)
    objc_msgSend(MEMORY[0x24BDD1850], "sessionWithConfiguration:", v20);
  else
    objc_msgSend(MEMORY[0x24BDD1850], "sharedSession");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v18;
  v66 = 0;
  v67 = &v66;
  v68 = 0x3032000000;
  v69 = __Block_byref_object_copy_;
  v70 = __Block_byref_object_dispose_;
  v71 = -[CMSNetworkActivity initWithLabel:parentActivity:]([CMSNetworkActivity alloc], "initWithLabel:parentActivity:", 3, v19);
  CMSCreateCloudExtensionHTTPRequest(v17, v47, 0, v18);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-type"));
  objc_msgSend(v25, "setValue:forHTTPHeaderField:", CFSTR("application/jose"), CFSTR("Accept"));
  objc_msgSend(v25, "setCachePolicy:", 3);
  v26 = MEMORY[0x24BDAC760];
  v56[0] = MEMORY[0x24BDAC760];
  v56[1] = 3221225472;
  v56[2] = __175__CMSCloudExtensionConfiguration_configurationFromURL_forSession_usingAuth_authProvider_parentNetworkActivity_keyID_publicKey_URLSessionConfiguration_languageCode_completion___block_invoke;
  v56[3] = &unk_24E1CC6F0;
  v41 = v22;
  v64 = v41;
  v65 = &v66;
  v27 = v17;
  v57 = v27;
  v39 = v19;
  v58 = v39;
  v40 = v43;
  v59 = v40;
  v44 = v45;
  v60 = v44;
  v28 = v21;
  v61 = v28;
  v46 = v20;
  v62 = v46;
  v29 = v23;
  v63 = v29;
  v30 = (void *)MEMORY[0x2207A4EA0](v56);
  v48[0] = v26;
  v48[1] = 3221225472;
  v48[2] = __175__CMSCloudExtensionConfiguration_configurationFromURL_forSession_usingAuth_authProvider_parentNetworkActivity_keyID_publicKey_URLSessionConfiguration_languageCode_completion___block_invoke_53;
  v48[3] = &unk_24E1CC790;
  v31 = v27;
  v49 = v31;
  v32 = v30;
  v54 = v32;
  v33 = v25;
  v50 = v33;
  v34 = v29;
  v51 = v34;
  v35 = v42;
  v52 = v35;
  v36 = v24;
  v53 = v36;
  v55 = &v66;
  objc_msgSend(v34, "dataTaskWithRequest:completionHandler:", v33, v48);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  _CMSILogingFacility();
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v73 = "+[CMSCloudExtensionConfiguration configurationFromURL:forSession:usingAuth:authProvider:parentNetworkActivity:"
          "keyID:publicKey:URLSessionConfiguration:languageCode:completion:]";
    v74 = 2112;
    v75 = v31;
    _os_log_impl(&dword_21DE4E000, v38, OS_LOG_TYPE_DEFAULT, "%s loading configuration from URL %@", buf, 0x16u);
  }

  objc_msgSend((id)v67[5], "associateWithTask:", v37);
  objc_msgSend(v37, "resume");

  _Block_object_dispose(&v66, 8);
}

void __175__CMSCloudExtensionConfiguration_configurationFromURL_forSession_usingAuth_authProvider_parentNetworkActivity_keyID_publicKey_URLSessionConfiguration_languageCode_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint8_t buf[8];
  id v31;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!*(_QWORD *)(a1 + 88))
  {
    v18 = v9;
LABEL_17:
    if (*(_QWORD *)(a1 + 72))
      objc_msgSend(*(id *)(a1 + 80), "invalidateAndCancel");
    goto LABEL_19;
  }
  if (objc_msgSend(v7, "length"))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v7, 4);
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(_QWORD *)(a1 + 40);
    v14 = *(_QWORD *)(a1 + 48);
    v15 = *(_QWORD *)(a1 + 56);
    v16 = *(_QWORD *)(a1 + 64);
    v31 = v10;
    +[CMSCloudExtensionConfiguration _configurationFromJWS:URL:parentNetworkActivity:keyID:publicKey:languageCode:error:](CMSCloudExtensionConfiguration, "_configurationFromJWS:URL:parentNetworkActivity:keyID:publicKey:languageCode:error:", v11, v12, v13, v14, v15, v16, &v31);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v31;

    _CMSILogingFacility();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v17)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v21 = 2;
        _os_log_impl(&dword_21DE4E000, v20, OS_LOG_TYPE_DEFAULT, "Successfully created configuration from JWS encryption", buf, 2u);
      }
      else
      {
        v21 = 2;
      }
    }
    else
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        __175__CMSCloudExtensionConfiguration_configurationFromURL_forSession_usingAuth_authProvider_parentNetworkActivity_keyID_publicKey_URLSessionConfiguration_languageCode_completion___block_invoke_cold_2();
      v21 = 3;
    }

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "completeActivity:", v21);
    (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();

    goto LABEL_17;
  }
  _CMSILogingFacility();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    __175__CMSCloudExtensionConfiguration_configurationFromURL_forSession_usingAuth_authProvider_parentNetworkActivity_keyID_publicKey_URLSessionConfiguration_languageCode_completion___block_invoke_cold_1(v22, v23, v24, v25, v26, v27, v28, v29);

  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cloudextension.errors.configuration"), 0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "completeActivity:", 3);
  v18 = v10;
LABEL_19:

}

void __175__CMSCloudExtensionConfiguration_configurationFromURL_forSession_usingAuth_authProvider_parentNetworkActivity_keyID_publicKey_URLSessionConfiguration_languageCode_completion___block_invoke_53(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  char *v16;
  char *v17;
  double v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  char *v23;
  void *v24;
  id v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  char *v35;
  NSObject *v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  void *v44;
  NSObject *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  char v53;
  _QWORD v54[4];
  char *v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  uint64_t v61;
  uint8_t buf[4];
  const char *v63;
  __int16 v64;
  uint64_t v65;
  __int16 v66;
  char *v67;
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = objc_msgSend(v8, "statusCode");
  if (a4 || v9 != 200)
  {
LABEL_28:
    objc_msgSend(*(id *)(a1 + 40), "setCachePolicy:", 0);
    _CMSILogingFacility();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v39 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      v63 = "+[CMSCloudExtensionConfiguration configurationFromURL:forSession:usingAuth:authProvider:parentNetworkActivit"
            "y:keyID:publicKey:URLSessionConfiguration:languageCode:completion:]_block_invoke";
      v64 = 2112;
      v65 = v39;
      _os_log_impl(&dword_21DE4E000, v38, OS_LOG_TYPE_DEFAULT, "%s configuration from URL %@ no usable cached response - trying network", buf, 0x16u);
    }

    v41 = *(_QWORD *)(a1 + 40);
    v40 = *(void **)(a1 + 48);
    v54[0] = MEMORY[0x24BDAC760];
    v54[1] = 3221225472;
    v54[2] = __175__CMSCloudExtensionConfiguration_configurationFromURL_forSession_usingAuth_authProvider_parentNetworkActivity_keyID_publicKey_URLSessionConfiguration_languageCode_completion___block_invoke_55;
    v54[3] = &unk_24E1CC768;
    v55 = (char *)*(id *)(a1 + 56);
    v56 = *(id *)(a1 + 32);
    v42 = *(id *)(a1 + 64);
    v43 = *(_QWORD *)(a1 + 80);
    v57 = v42;
    v61 = v43;
    v58 = *(id *)(a1 + 40);
    v59 = *(id *)(a1 + 48);
    v60 = *(id *)(a1 + 72);
    objc_msgSend(v40, "dataTaskWithRequest:completionHandler:", v41, v54);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "associateWithTask:", v44);
    objc_msgSend(v44, "resume");

    v16 = v55;
    goto LABEL_31;
  }
  v10 = v8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v16 = 0;
LABEL_25:
    _CMSILogingFacility();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v37 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      v63 = "+[CMSCloudExtensionConfiguration configurationFromURL:forSession:usingAuth:authProvider:parentNetworkActivit"
            "y:keyID:publicKey:URLSessionConfiguration:languageCode:completion:]_block_invoke";
      v64 = 2112;
      v65 = v37;
      v66 = 2112;
      v67 = v16;
      _os_log_impl(&dword_21DE4E000, v36, OS_LOG_TYPE_DEFAULT, "%s cached configuration for URL %@ has expired -  expiration %@", buf, 0x20u);
    }

    goto LABEL_28;
  }
  v11 = v10;
  objc_msgSend(v11, "valueForHTTPHeaderField:", CFSTR("Date"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v11, "valueForHTTPHeaderField:", CFSTR("Cache-Control"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "componentsSeparatedByString:", CFSTR(","));
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v16 = (char *)objc_msgSend(v15, "count");
      if (v16)
      {
        v47 = v13;
        v48 = a1;
        v49 = v12;
        v50 = v11;
        v51 = v8;
        v52 = v7;
        v53 = 0;
        v17 = 0;
        v18 = 0.0;
        v19 = CFSTR("=");
        do
        {
          objc_msgSend(v15, "objectAtIndex:", v17, v47);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "stringByTrimmingCharactersInSet:", v14);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v21, "componentsSeparatedByString:", v19);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v22, "count") == 2)
          {
            objc_msgSend(v22, "objectAtIndex:", 0);
            v23 = v16;
            v24 = v14;
            v25 = v15;
            v26 = v19;
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "objectAtIndex:", 0);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v27, "compare:options:range:", CFSTR("Max-Age"), 9, 0, objc_msgSend(v28, "length"));

            v19 = v26;
            v15 = v25;
            v14 = v24;
            v16 = v23;
            if (!v29)
            {
              v53 = 1;
              objc_msgSend(v22, "objectAtIndex:", 1);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "doubleValue");
              v18 = v31;

            }
          }

          ++v17;
        }
        while (v16 != v17);

        if ((v53 & 1) == 0)
        {
          v16 = 0;
          v8 = v51;
          v7 = v52;
          v12 = v49;
          v11 = v50;
          v13 = v47;
          a1 = v48;
LABEL_22:

          goto LABEL_23;
        }
        v15 = objc_alloc_init(MEMORY[0x24BDD1500]);
        objc_msgSend(v15, "setDateFormat:", CFSTR("EE, dd LLL yyyy HH:mm:ss zz"));
        v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEA0]), "initWithLocaleIdentifier:", CFSTR("en_US"));
        objc_msgSend(v15, "setLocale:", v32);

        v12 = v49;
        objc_msgSend(v15, "dateFromString:", v49);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v33;
        v8 = v51;
        v7 = v52;
        v11 = v50;
        a1 = v48;
        if (v33)
        {
          objc_msgSend(v33, "dateByAddingTimeInterval:", v18);
          v16 = (char *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v16 = 0;
        }
        v13 = v47;
      }

      goto LABEL_22;
    }
    v16 = 0;
    goto LABEL_22;
  }
  v16 = 0;
LABEL_23:

  if (!v16)
    goto LABEL_25;
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "laterDate:", v34);
  v35 = (char *)objc_claimAutoreleasedReturnValue();

  if (v35 != v16)
    goto LABEL_25;
  _CMSILogingFacility();
  v45 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    v46 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315650;
    v63 = "+[CMSCloudExtensionConfiguration configurationFromURL:forSession:usingAuth:authProvider:parentNetworkActivity:"
          "keyID:publicKey:URLSessionConfiguration:languageCode:completion:]_block_invoke";
    v64 = 2112;
    v65 = v46;
    v66 = 2112;
    v67 = v16;
    _os_log_impl(&dword_21DE4E000, v45, OS_LOG_TYPE_DEFAULT, "%s using cached configuration for URL %@: Expires %@", buf, 0x20u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
LABEL_31:

}

void __175__CMSCloudExtensionConfiguration_configurationFromURL_forSession_usingAuth_authProvider_parentNetworkActivity_keyID_publicKey_URLSessionConfiguration_languageCode_completion___block_invoke_55(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v8;
  v11 = objc_msgSend(v10, "statusCode");
  if (!v9 && (v11 & 0xFFFFFFFFFFFFFFFDLL) == 0x191 && *(_QWORD *)(a1 + 32))
  {
    _CMSILogingFacility();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 136315394;
      v29 = "+[CMSCloudExtensionConfiguration configurationFromURL:forSession:usingAuth:authProvider:parentNetworkActivit"
            "y:keyID:publicKey:URLSessionConfiguration:languageCode:completion:]_block_invoke";
      v30 = 2112;
      v31 = v13;
      _os_log_impl(&dword_21DE4E000, v12, OS_LOG_TYPE_DEFAULT, "%s configuration from URL %@ auth challenge - trying to renew credentials", buf, 0x16u);
    }

    v14 = *(void **)(a1 + 32);
    v15 = *(void **)(a1 + 48);
    v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __175__CMSCloudExtensionConfiguration_configurationFromURL_forSession_usingAuth_authProvider_parentNetworkActivity_keyID_publicKey_URLSessionConfiguration_languageCode_completion___block_invoke_56;
    v19[3] = &unk_24E1CC740;
    v20 = v15;
    v21 = *(id *)(a1 + 56);
    v22 = *(id *)(a1 + 64);
    v17 = *(id *)(a1 + 72);
    v18 = *(_QWORD *)(a1 + 80);
    v26 = v17;
    v27 = v18;
    v23 = 0;
    v24 = v7;
    v25 = v10;
    objc_msgSend(v14, "authRenewalForSessionIdentifier:parentNetworkActivity:completion:", v20, v16, v19);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }

}

void __175__CMSCloudExtensionConfiguration_configurationFromURL_forSession_usingAuth_authProvider_parentNetworkActivity_keyID_publicKey_URLSessionConfiguration_languageCode_completion___block_invoke_56(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  CMSNetworkActivity *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v8 || v9 || objc_msgSend(*(id *)(a1 + 32), "compare:", v7))
  {
    _CMSILogingFacility();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v19 = v10;
      if (!v10)
        v19 = *(void **)(a1 + 56);
      *(_DWORD *)buf = 136315394;
      v23 = "+[CMSCloudExtensionConfiguration configurationFromURL:forSession:usingAuth:authProvider:parentNetworkActivit"
            "y:keyID:publicKey:URLSessionConfiguration:languageCode:completion:]_block_invoke";
      v24 = 2112;
      v25 = v19;
      _os_log_error_impl(&dword_21DE4E000, v11, OS_LOG_TYPE_ERROR, "%s failed to get new tokens: %@", buf, 0x16u);
    }

    v12 = v10;
    if (!v10)
      v12 = *(void **)(a1 + 56);
    (*(void (**)(_QWORD, _QWORD, _QWORD, void *))(*(_QWORD *)(a1 + 80) + 16))(*(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), v12);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setValue:forHTTPHeaderField:", v8, CFSTR("Authorization"));
    v14 = *(_QWORD *)(a1 + 40);
    v13 = *(void **)(a1 + 48);
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __175__CMSCloudExtensionConfiguration_configurationFromURL_forSession_usingAuth_authProvider_parentNetworkActivity_keyID_publicKey_URLSessionConfiguration_languageCode_completion___block_invoke_2;
    v20[3] = &unk_24E1CC718;
    v21 = *(id *)(a1 + 80);
    objc_msgSend(v13, "dataTaskWithRequest:completionHandler:", v14, v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[CMSNetworkActivity initWithRetry:]([CMSNetworkActivity alloc], "initWithRetry:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40));
    -[CMSNetworkActivity associateWithTask:](v16, "associateWithTask:", v15);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "completeActivity:", 3);
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

    objc_msgSend(v15, "resume");
  }

}

uint64_t __175__CMSCloudExtensionConfiguration_configurationFromURL_forSession_usingAuth_authProvider_parentNetworkActivity_keyID_publicKey_URLSessionConfiguration_languageCode_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_configureEndpoint:(id)a3 withDictionary:(id)a4 headers:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  objc_class *v18;
  void *v19;
  int v20;
  id v21;
  void *v22;
  void *v23;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "componentsSeparatedByString:", CFSTR("/"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cmsOptionalDictionaryForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("url"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      v15 = (void *)objc_msgSend(v13, "mutableCopy");
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v8, CFSTR("url"));
      v16 = objc_msgSend(v15, "copy");

      v13 = (void *)v16;
    }
    _CMSILogingFacility();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[CMSCloudExtensionConfiguration _configureEndpoint:withDictionary:headers:].cold.1();

    v18 = (objc_class *)objc_opt_class();
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("intent"));

    if (v20)
      v18 = (objc_class *)objc_opt_class();
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("queues/contentProtectionKey")))
      v18 = (objc_class *)objc_opt_class();
    v21 = [v18 alloc];
    -[CMSCloudExtensionConfiguration baseURL](self, "baseURL");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v21, "initWithDictionary:endpoint:baseURL:groupHeaders:", v13, v8, v22, v9);

    if (v23)
      -[NSMutableDictionary setObject:forKey:](self->_endpointConfigs, "setObject:forKey:", v23, v8);

  }
}

- (CMSCloudExtensionConfiguration)init
{
  void *v3;
  CMSCloudExtensionConfiguration *v4;

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", &stru_24E1CDD40);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CMSCloudExtensionConfiguration initWithDictionary:fromURL:parentNetworkActivity:languageCode:](self, "initWithDictionary:fromURL:parentNetworkActivity:languageCode:", MEMORY[0x24BDBD1B8], v3, 0, 0);

  return v4;
}

- (CMSCloudExtensionConfiguration)initWithDictionary:(id)a3 fromURL:(id)a4 parentNetworkActivity:(id)a5 languageCode:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CMSCloudExtensionConfiguration *v15;
  CMSCloudExtensionConfiguration *v16;
  uint64_t v17;
  NSString *version;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSError *parsingError;
  CMSCloudExtensionConfiguration *v24;
  uint64_t v25;
  NSError *v26;
  uint64_t v27;
  NSMutableDictionary *endpointConfigs;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  NSURL *baseURL;
  uint64_t v35;
  NSDictionary *globalHeaders;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  CMSCloudExtensionConfiguration *v44;
  uint64_t v45;
  NSError *v46;
  CMSCloudExtensionConfiguration *v47;
  void *v49;
  void *v50;
  objc_super v51;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v51.receiver = self;
  v51.super_class = (Class)CMSCloudExtensionConfiguration;
  v15 = -[CMSCloudExtensionConfiguration init](&v51, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_configDictionary, a3);
    objc_storeStrong((id *)&v16->_configUrl, a4);
    objc_msgSend(v11, "cmsOptionalStringForKey:", CFSTR("version"));
    v17 = objc_claimAutoreleasedReturnValue();
    version = v16->_version;
    v16->_version = (NSString *)v17;

    objc_storeStrong((id *)&v16->_parentNetworkActivity, a5);
    objc_storeStrong((id *)&v16->_languageCode, a6);
    -[NSString componentsSeparatedByString:](v16->_version, "componentsSeparatedByString:", CFSTR("."));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "count"))
    {
      objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "integerValue");

      if (v21 >= 2)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cloudextension.errors.configuration"), 1, 0);
        v22 = objc_claimAutoreleasedReturnValue();
        parsingError = v16->_parsingError;
        v16->_parsingError = (NSError *)v22;

        v24 = v16;
LABEL_21:

        goto LABEL_22;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cloudextension.errors.configuration"), 0, 0);
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = v16->_parsingError;
      v16->_parsingError = (NSError *)v25;

    }
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 5);
    v27 = objc_claimAutoreleasedReturnValue();
    endpointConfigs = v16->_endpointConfigs;
    v16->_endpointConfigs = (NSMutableDictionary *)v27;

    objc_msgSend(v11, "cmsOptionalURLForKey:relativeToURL:", CFSTR("url"), 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v29)
    {
      objc_msgSend(v29, "baseURL");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v31)
      {
        objc_msgSend(v11, "cmsOptionalURLForKey:relativeToURL:", CFSTR("url"), v12);
        v32 = objc_claimAutoreleasedReturnValue();

        v30 = (void *)v32;
      }
      objc_storeStrong((id *)&v16->_baseURL, v30);
    }
    if (!v16->_baseURL)
    {
      objc_msgSend(v12, "baseURL");
      v33 = objc_claimAutoreleasedReturnValue();
      baseURL = v16->_baseURL;
      v16->_baseURL = (NSURL *)v33;

      if (!v16->_baseURL)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cloudextension.errors.configuration"), 2, 0);
        v45 = objc_claimAutoreleasedReturnValue();
        v46 = v16->_parsingError;
        v16->_parsingError = (NSError *)v45;

        v47 = v16;
        goto LABEL_21;
      }
    }
    objc_msgSend(v11, "cmsOptionalDictionaryForKey:", CFSTR("hdr"), v14, v13);
    v35 = objc_claimAutoreleasedReturnValue();
    globalHeaders = v16->_globalHeaders;
    v16->_globalHeaders = (NSDictionary *)v35;

    objc_msgSend(v11, "cmsOptionalDictionaryForKey:", CFSTR("intent"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    _CMSILogingFacility();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      -[CMSCloudExtensionConfiguration initWithDictionary:fromURL:parentNetworkActivity:languageCode:].cold.2();

    objc_msgSend(v37, "cmsOptionalDictionaryForKey:", CFSTR("hdr"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMSCloudExtensionConfiguration _configureEndpoint:withDictionary:headers:](v16, "_configureEndpoint:withDictionary:headers:", CFSTR("intent/playMedia"), v37, v39);
    -[CMSCloudExtensionConfiguration _configureEndpoint:withDictionary:headers:](v16, "_configureEndpoint:withDictionary:headers:", CFSTR("intent/addMedia"), v37, v39);
    -[CMSCloudExtensionConfiguration _configureEndpoint:withDictionary:headers:](v16, "_configureEndpoint:withDictionary:headers:", CFSTR("intent/updateMediaAffinity"), v37, v39);
    objc_msgSend(v11, "cmsOptionalDictionaryForKey:", CFSTR("media"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "cmsOptionalDictionaryForKey:", CFSTR("queues"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    _CMSILogingFacility();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
      -[CMSCloudExtensionConfiguration initWithDictionary:fromURL:parentNetworkActivity:languageCode:].cold.1();

    objc_msgSend(v41, "cmsOptionalDictionaryForKey:", CFSTR("hdr"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMSCloudExtensionConfiguration _configureEndpoint:withDictionary:headers:](v16, "_configureEndpoint:withDictionary:headers:", CFSTR("queues/playMedia"), v41, v43);
    -[CMSCloudExtensionConfiguration _configureEndpoint:withDictionary:headers:](v16, "_configureEndpoint:withDictionary:headers:", CFSTR("queues/updateActivity"), v41, v43);
    if (+[CMSFeatureStatus isBoldPlayFeatureEnabled](CMSFeatureStatus, "isBoldPlayFeatureEnabled"))
      -[CMSCloudExtensionConfiguration _configureEndpoint:withDictionary:headers:](v16, "_configureEndpoint:withDictionary:headers:", CFSTR("queues/contentProtectionKey"), v41, v43);
    -[CMSCloudExtensionConfiguration _configureEndpoint:withDictionary:headers:](v16, "_configureEndpoint:withDictionary:headers:", CFSTR("queues/contentPlaybackFailure"), v41, v43);

    v14 = v49;
    v13 = v50;
  }
  v44 = v16;
LABEL_22:

  return v16;
}

- (id)configForEndpoint:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  -[NSMutableDictionary objectForKey:](self->_endpointConfigs, "objectForKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    v7 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v4, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    goto LABEL_7;
  objc_msgSend(v5, "endpointURL");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v5, "endpointURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    CMSCreateCloudExtensionHTTPRequest(v8, 0, 4, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[CMSCloudExtensionConfiguration languageCode](self, "languageCode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      CMSCloudExtensionLanguageCode();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "setValue:forHTTPHeaderField:", v10, CFSTR("Accept-Language"));
    -[CMSCloudExtensionConfiguration baseURL](self, "baseURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setMainDocumentURL:", v11);

    objc_msgSend(v9, "setNetworkServiceType:", 6);
    objc_msgSend(v9, "setHTTPShouldUsePipelining:", 1);
    objc_msgSend(v9, "setHTTPShouldHandleCookies:", 1);
    -[CMSCloudExtensionConfiguration globalHeaders](self, "globalHeaders");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    applyHeaderOverrides(v12, v9);

    objc_msgSend(v5, "groupHeaders");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    applyHeaderOverrides(v13, v9);

    objc_msgSend(v5, "headers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    applyHeaderOverrides(v14, v9);

    objc_msgSend(v5, "setRequest:", v9);
LABEL_7:
    v7 = v5;
  }
LABEL_9:

  return v7;
}

- (BOOL)isExpiringSoon
{
  NSDate *configExpiry;
  void *v3;
  double v4;

  configExpiry = self->_configExpiry;
  if (configExpiry)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDate timeIntervalSinceDate:](configExpiry, "timeIntervalSinceDate:", v3);
    LOBYTE(configExpiry) = v4 > -1800.0;

  }
  return (char)configExpiry;
}

- (NSString)version
{
  return self->_version;
}

- (NSError)parsingError
{
  return self->_parsingError;
}

- (NSURL)configUrl
{
  return self->_configUrl;
}

- (NSDictionary)configDictionary
{
  return self->_configDictionary;
}

- (void)setConfigDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_configDictionary, a3);
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (NSMutableDictionary)endpointConfigs
{
  return self->_endpointConfigs;
}

- (void)setEndpointConfigs:(id)a3
{
  objc_storeStrong((id *)&self->_endpointConfigs, a3);
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
  objc_storeStrong((id *)&self->_baseURL, a3);
}

- (NSDictionary)globalHeaders
{
  return self->_globalHeaders;
}

- (NSDate)configExpiry
{
  return self->_configExpiry;
}

- (void)setConfigExpiry:(id)a3
{
  objc_storeStrong((id *)&self->_configExpiry, a3);
}

- (CMSNetworkActivity)parentNetworkActivity
{
  return self->_parentNetworkActivity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentNetworkActivity, 0);
  objc_storeStrong((id *)&self->_configExpiry, 0);
  objc_storeStrong((id *)&self->_globalHeaders, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_endpointConfigs, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_configDictionary, 0);
  objc_storeStrong((id *)&self->_configUrl, 0);
  objc_storeStrong((id *)&self->_parsingError, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

void __175__CMSCloudExtensionConfiguration_configurationFromURL_forSession_usingAuth_authProvider_parentNetworkActivity_keyID_publicKey_URLSessionConfiguration_languageCode_completion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21DE4E000, a1, a3, "%s no configuration data returned", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __175__CMSCloudExtensionConfiguration_configurationFromURL_forSession_usingAuth_authProvider_parentNetworkActivity_keyID_publicKey_URLSessionConfiguration_languageCode_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21DE4E000, v0, v1, "Failed to create configuration from JWS encryption: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_configureEndpoint:withDictionary:headers:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_21DE4E000, v0, v1, "endpointDict: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithDictionary:fromURL:parentNetworkActivity:languageCode:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_21DE4E000, v0, v1, "queuesDict: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithDictionary:fromURL:parentNetworkActivity:languageCode:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_21DE4E000, v0, v1, "intentDict: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
