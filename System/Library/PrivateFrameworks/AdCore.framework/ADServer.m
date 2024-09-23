@implementation ADServer

+ (NSOperationQueue)workQueue
{
  return (NSOperationQueue *)(id)_staticWorkQueue;
}

- (void)handleRequest:(id)a3 serverURL:(id)a4 responseHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  int v41;
  const __CFString *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  __CFString *v59;
  __CFString *v60;
  void *v61;
  ADServer *v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  __CFString *v67;
  void *v68;
  _QWORD v69[5];
  id v70;
  _QWORD v71[6];
  _QWORD v72[8];

  v72[6] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v65 = a5;
  if (!v65)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("[%@] How in the world is the completionHandler nil?!!?!"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog(CFSTR("iAdServerRequestLogging"), v13, 16);

  }
  -[ADServer serverURLForMessageClass:serverURL:](self, "serverURLForMessageClass:serverURL:", objc_opt_class(), v9);
  v14 = objc_claimAutoreleasedReturnValue();

  +[ADCoreSettings sharedInstance](ADCoreSettings, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0CB37A8];
  objc_msgSend(v15, "adServerTimeoutInterval");
  v66 = (void *)v14;
  objc_msgSend(v16, "requestWithURL:cachePolicy:timeoutInterval:", v14, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v15, "deviceModel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v15, "deviceModel");
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing deviceModel"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog(CFSTR("iAdServerRequestLogging"), v20, 16);

    v19 = CFSTR("MISSING_DEVICE_MODEL");
  }
  objc_msgSend(v15, "osVersionAndBuild");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v15, "osVersionAndBuild");
    v22 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing osVersionAndBuild"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog(CFSTR("iAdServerRequestLogging"), v23, 16);

    v22 = CFSTR("MISSING_VERSION_AND_BUILD");
  }
  objc_msgSend(v15, "bundleIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v15, "bundleIdentifier");
    v25 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing bundleIdentifier"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog(CFSTR("iAdServerRequestLogging"), v26, 16);

    v25 = CFSTR("MISSING_BUNDLE_IDENTIFIER");
  }
  objc_msgSend(v15, "iTunesStorefront");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v64 = v8;
  v68 = v17;
  v62 = self;
  if (v27)
  {
    objc_msgSend(v15, "iTunesStorefront");
    v67 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing iTunesStorefront"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog(CFSTR("iAdServerRequestLogging"), v28, 16);

    v67 = CFSTR("MISSING_ITUNES_STOREFRONT");
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (double)(int)objc_msgSend(v29, "AD_toServerTime");

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%f"), *(_QWORD *)&v30);
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v15, "deviceModel");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "osVersionAndBuild");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bundleIdentifier");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "iTunesStorefront");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "stringWithFormat:", CFSTR("%@; %@; %@; %@"), v33, v34, v35, v36);
  v37 = objc_claimAutoreleasedReturnValue();

  v71[0] = CFSTR("timestamp");
  v71[1] = CFSTR("User-Agent");
  v63 = (void *)v31;
  v72[0] = v31;
  v72[1] = v37;
  v61 = (void *)v37;
  v71[2] = CFSTR("bundleID");
  v71[3] = CFSTR("device");
  v59 = (__CFString *)v22;
  v60 = (__CFString *)v25;
  v72[2] = v25;
  v72[3] = v19;
  v71[4] = CFSTR("os_Version");
  v71[5] = CFSTR("storefront");
  v72[4] = v22;
  v72[5] = v67;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v72, v71, 6);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setAllHTTPHeaderFields:", v38);

  v39 = objc_opt_class();
  if (v39 == objc_opt_class())
  {
    +[ADCoreSettings sharedInstance](ADCoreSettings, "sharedInstance");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "isPersonalizedAdsEnabled");

    if (v41)
      v42 = CFSTR("false");
    else
      v42 = CFSTR("true");
    objc_msgSend(v68, "addValue:forHTTPHeaderField:", v42, CFSTR("limitAdTracking"));
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "allHTTPHeaderFields");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setObject:forKey:", v44, CFSTR("headers"));

  objc_msgSend(v64, "dictionaryRepresentation");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setObject:forKey:", v45, CFSTR("body"));

  v46 = (void *)MEMORY[0x1E0CB3940];
  v47 = objc_opt_class();
  v48 = objc_opt_class();
  objc_msgSend(v68, "URL");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "absoluteString");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "AD_jsonString");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "stringWithFormat:", CFSTR("[%@ handleRequest]: Sending request %@ to AdPlatforms %@ with object: %@"), v47, v48, v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog(CFSTR("iAdServerRequestLogging"), v52, 0);

  +[ADIDManager sharedInstance](ADIDManager, "sharedInstance");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_opt_class();
  objc_msgSend(v53, "logIDs:", CFSTR("[%@ handleRequest]: IDs for %@"), v54, objc_opt_class());

  -[ADServer serializeMessage:](v62, "serializeMessage:", v64);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[ADServer session](v62, "session");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v69[0] = MEMORY[0x1E0C809B0];
  v69[1] = 3221225472;
  v69[2] = __52__ADServer_handleRequest_serverURL_responseHandler___block_invoke;
  v69[3] = &unk_1E82B22C8;
  v69[4] = v62;
  v70 = v65;
  v57 = v65;
  objc_msgSend(v56, "uploadTaskWithRequest:fromData:completionHandler:", v68, v55, v69);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v58, "resume");
}

- (NSURLSession)session
{
  return (NSURLSession *)objc_getProperty(self, a2, 32, 1);
}

- (id)serializeMessage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v10;
  unsigned int v11;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("messageIndex"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_opt_new();
  objc_msgSend(v3, "writeTo:", v6);

  objc_msgSend(v6, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = bswap32(objc_msgSend(v5, "integerValue"));
  v10 = bswap32(objc_msgSend(v7, "length"));
  objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendBytes:length:", &v11, 4);
  objc_msgSend(v8, "appendBytes:length:", &v10, 4);
  objc_msgSend(v8, "appendData:", v7);

  return v8;
}

- (id)serverURLForMessageClass:(Class)a3 serverURL:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v6 = a4;
  +[ADCoreSettings sharedInstance](ADCoreSettings, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ADServer configurations](self, "configurations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v7, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[objc_class options](a3, "options");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("messageIndex"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        v15 = v13;

        v6 = v15;
      }

    }
  }
  -[objc_class options](a3, "options");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("URLSuffix"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[objc_class options](a3, "options");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("messageProtocolVersion"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    ADAdsOptions();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("protocolVersion"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v6, "URLByAppendingPathComponent:", v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "URLByAppendingPathComponent:", v17);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("serverURLForMessageClass %@ %@ "), a3, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog(CFSTR("iAdServerRequestLogging"), v23, 0);

  return v22;
}

- (void)saveConfig
{
  id v2;

  -[ADServer configurations](self, "configurations");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  ADSaveToPromotedContentKeychain((uint64_t)v2, CFSTR("APServerConfigurationSettings.serverConfigRecord"));

}

- (NSDictionary)configurations
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)saveProxyURL
{
  id v2;

  -[ADServer resourceConnectProxyURL](self, "resourceConnectProxyURL");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  ADSaveToPromotedContentKeychain((uint64_t)v2, CFSTR("APProxySettings.resourceConnectProxyURL"));

}

- (NSString)resourceConnectProxyURL
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)buildConfigurationDictionary:(id)a3
{
  id v3;
  int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  NSString *v19;
  NSString *resourceConnectProxyURL;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(MEMORY[0x1E0C99D68], "AD_maxServerTime");
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v25 = v3;
  objc_msgSend(v3, "theConfigurations");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v10, "expirationDate");
        if (v11 < (double)v4)
        {
          objc_msgSend(v10, "expirationDate");
          v4 = (int)v12;
        }
        objc_msgSend(v10, "bundleId");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v10, "requestType"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "baseUrl");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", v13);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v17)
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, v13);
        }
        if (v14)
          v18 = v16 == 0;
        else
          v18 = 1;
        if (!v18)
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v14);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v7);
  }

  objc_storeStrong((id *)&self->_configurations, v5);
  self->_configurationExpirationTime = v4;
  if (objc_msgSend(v25, "hasResourceConnectProxyURL"))
  {
    objc_msgSend(v25, "resourceConnectProxyURL");
    v19 = (NSString *)objc_claimAutoreleasedReturnValue();
    resourceConnectProxyURL = self->_resourceConnectProxyURL;
    self->_resourceConnectProxyURL = v19;

  }
  v21 = (void *)MEMORY[0x1E0CB3940];
  -[NSDictionary AD_jsonString](self->_configurations, "AD_jsonString");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringWithFormat:", CFSTR("Configuration Dictionary: %@"), v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog(CFSTR("iAdServerRequestLogging"), v23, 0);

}

- (void)setConfigurationExpirationTime:(int)a3
{
  self->_configurationExpirationTime = a3;
}

- (int)configurationExpirationTime
{
  return self->_configurationExpirationTime;
}

uint64_t __52__ADServer_handleRequest_serverURL_responseHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

+ (void)initialize
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v3 = (void *)_staticWorkQueue;
  _staticWorkQueue = (uint64_t)v2;

  objc_msgSend((id)_staticWorkQueue, "setName:", CFSTR("com.apple.queue.adplatforms.serial"));
  objc_msgSend((id)_staticWorkQueue, "setMaxConcurrentOperationCount:", 1);
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__ADServer_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__onceToken_3 != -1)
    dispatch_once(&sharedInstance__onceToken_3, block);
  return (id)sharedInstance__instance_3;
}

void __52__ADServer_handleRequest_serverURL_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    v10 = v9;
    v11 = 0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = v8;
      objc_msgSend(v12, "MIMEType");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "hasPrefix:", CFSTR("text")))
      {
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v7, 4);
        v15 = (void *)MEMORY[0x1E0CB35C8];
        v16 = objc_msgSend(v12, "statusCode");
        v27 = *MEMORY[0x1E0CB2D50];
        v28[0] = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("com.apple.AdPlatforms"), v16, v17);
        v10 = (id)objc_claimAutoreleasedReturnValue();

        v11 = 0;
        v7 = 0;
      }
      else if (objc_msgSend(v13, "hasPrefix:", CFSTR("application/octet-stream")))
      {
        v18 = *(void **)(a1 + 32);
        v26 = 0;
        objc_msgSend(v18, "deserializeMessage:error:", v7, &v26);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v26;
      }
      else
      {
        v11 = 0;
        v10 = 0;
      }

    }
    else
    {
      v11 = 0;
      v10 = 0;
    }
  }
  v19 = *(void **)(a1 + 40);
  if (v19)
  {
    v20 = (void *)_staticWorkQueue;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __52__ADServer_handleRequest_serverURL_responseHandler___block_invoke_2;
    v21[3] = &unk_1E82B22A0;
    v25 = v19;
    v22 = v11;
    v23 = v8;
    v24 = v10;
    objc_msgSend(v20, "addOperationWithBlock:", v21);

  }
}

- (id)deserializeMessage:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (!v5 || (unint64_t)objc_msgSend(v5, "length") <= 7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@] ERROR: We cannot deserialize data less than 8 bytes: %@"), objc_opt_class(), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog(CFSTR("iAdServerRequestLogging"), v7, 16);

LABEL_4:
    a4 = 0;
    goto LABEL_5;
  }
  v12 = 0;
  objc_msgSend(v6, "getBytes:range:", (char *)&v12 + 4, 0, 4);
  HIDWORD(v12) = bswap32(HIDWORD(v12));
  objc_msgSend(v6, "getBytes:range:", &v12, 4, 4);
  v9 = bswap32(v12);
  LODWORD(v12) = v9;
  if (v9 + 8 <= (unint64_t)objc_msgSend(v6, "length"))
  {
    objc_msgSend(v6, "subdataWithRange:", 8, v9);
    a4 = (id *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (a4)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v13 = *MEMORY[0x1E0CB2D50];
    v14[0] = CFSTR("Bad protocol response header; is the server up-to-date?");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("com.apple.AdPlatforms"), 1, v11);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_4;
  }
LABEL_5:

  return a4;
}

void __26__ADServer_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance__instance_3;
  sharedInstance__instance_3 = (uint64_t)v0;

}

- (ADServer)init
{
  ADServer *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ADServer;
  v2 = -[ADServer init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB39F8], "ephemeralSessionConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[ADCoreSettings sharedInstance](ADCoreSettings, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "NSURLConnectionTimeout");
    objc_msgSend(v3, "setTimeoutIntervalForRequest:");

    +[ADCoreSettings sharedInstance](ADCoreSettings, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "NSURLTransactionTimeout");
    objc_msgSend(v3, "setTimeoutIntervalForResource:");

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3990]), "initWithMemoryCapacity:diskCapacity:diskPath:", 0, 0, 0);
    objc_msgSend(v3, "setURLCache:", v6);
    objc_msgSend(MEMORY[0x1E0CB39F0], "sessionWithConfiguration:delegate:delegateQueue:", v3, v2, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ADServer setSession:](v2, "setSession:", v7);

    v2->_configurationExpirationTime = objc_msgSend(MEMORY[0x1E0C99D68], "AD_maxServerTime");
    if (-[ADServer shouldRestoreConfiguration](v2, "shouldRestoreConfiguration"))
      -[ADServer restoreConfiguration](v2, "restoreConfiguration");

  }
  return v2;
}

- (BOOL)shouldRestoreConfiguration
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  char v7;

  if (!MGGetBoolAnswer())
    return 1;
  +[ADCoreSettings sharedInstance](ADCoreSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultConfigurationServerURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("https://cf-invalid.iad.apple.com/adserver"));
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The Configuration Message has been disabled in Internal Settings."));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog(CFSTR("iAdInternalLogging"), v6, 0);

  }
  v7 = v5 ^ 1;

  return v7;
}

- (void)restoreConfiguration
{
  uint64_t v3;
  void *v4;
  BOOL v5;
  ADConfigurationResponse *v6;
  OSStatus v7;

  v7 = 0;
  ADCopyDataFromKeychain(CFSTR("ADConfigurationsKeychainKey"), &v7);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v7)
    v5 = 1;
  else
    v5 = v3 == 0;
  if (!v5)
  {
    v6 = -[ADConfigurationResponse initWithData:]([ADConfigurationResponse alloc], "initWithData:", v3);
    -[ADServer buildConfigurationDictionary:](self, "buildConfigurationDictionary:", v6);

  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("URLSession %@ task %@ didCompleteWithError %@"), a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog(CFSTR("iAdServerRequestLogging"), v5, 16);

}

- (void)setConfigurations:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void)setResourceConnectProxyURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void)setSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_resourceConnectProxyURL, 0);
  objc_storeStrong((id *)&self->_configurations, 0);
}

@end
