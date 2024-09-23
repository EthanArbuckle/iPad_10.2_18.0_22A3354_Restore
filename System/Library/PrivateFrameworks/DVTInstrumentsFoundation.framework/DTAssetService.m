@implementation DTAssetService

+ (void)registerCapabilities:(id)a3
{
  objc_msgSend(a3, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.server.services.assets"), 4, a1);
}

+ (id)translatedManifest:(id)a3 withAssetServicePort:(unsigned int)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
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
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  uint64_t v29;
  char v30;
  id v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("resources"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (!v9)
  {
    v26 = 0;
    v25 = v8;
LABEL_18:

    goto LABEL_20;
  }
  v10 = v9;
  v30 = 0;
  v11 = *(_QWORD *)v34;
  v28 = v5;
  v29 = a4;
  v31 = v8;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v34 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
      v14 = (void *)objc_msgSend(v13, "mutableCopy");
      v15 = (void *)MEMORY[0x24BDBCF48];
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("URL"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "URLWithString:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(v17, "scheme");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v18, "hasPrefix:", CFSTR("http")))
        {
          objc_msgSend(v17, "host");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v19, "isEqual:", CFSTR("localhost")))
          {

          }
          else
          {
            objc_msgSend(v17, "host");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "isEqual:", CFSTR("127.0.0.1"));

            v8 = v31;
            if (!v21)
              goto LABEL_13;
          }
          objc_msgSend(v17, "path");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD14A8], "URLPathAllowedCharacterSet");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "stringByAddingPercentEncodingWithAllowedCharacters:", v23);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          v8 = v31;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("http://localhost:%li%@"), v29, v18);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setObject:forKeyedSubscript:", v24, CFSTR("URL"));
          objc_msgSend(v14, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("isStreamable"));

          v30 = 1;
        }

      }
LABEL_13:
      objc_msgSend(v7, "addObject:", v14);

    }
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  }
  while (v10);

  if ((v30 & 1) != 0)
  {
    v5 = v28;
    v25 = (void *)objc_msgSend(v28, "mutableCopy");
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v7, CFSTR("resources"));
    v32 = 0;
    objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v25, 100, 0, &v32);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  v26 = 0;
  v5 = v28;
LABEL_20:

  return v26;
}

- (void)messageReceived:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if ((id)*MEMORY[0x24BE2A988] == v5)
  {
    -[DTAssetService server](self, "server");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stopListening");
  }
  else
  {
    +[DTAssetResponseBroker sharedBroker](DTAssetResponseBroker, "sharedBroker");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "forwardMessage:", v5);
  }

}

- (id)startServerForApplicationWithDevicePath:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;

  v4 = a3;
  -[DTAssetService startServer](self, "startServer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "pathForResource:ofType:", CFSTR("AssetPackManifestTemplate"), CFSTR("plist"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(v6, "pathForResource:ofType:", CFSTR("AssetPackManifest"), CFSTR("plist"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[DTAssetService translatedManifest:withAssetServicePort:](DTAssetService, "translatedManifest:withAssetServicePort:", v8, objc_msgSend(v5, "unsignedIntValue"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[DTAssetService appendAllowedResources:](self, "appendAllowedResources:", v9);
    v11 = (void *)objc_opt_new();
    -[DTAssetService ondemandConnection](self, "ondemandConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = sub_222B2B354;
    v23[3] = &unk_24EB283C8;
    v14 = v11;
    v24 = v14;
    objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v23);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v20[0] = v13;
    v20[1] = 3221225472;
    v20[2] = sub_222B2B364;
    v20[3] = &unk_24EB287B8;
    v16 = v14;
    v21 = v16;
    v22 = v5;
    v17 = v5;
    objc_msgSend(v15, "registerManifest:forBundleID:replyBlock:", v9, v10, v20);
    v18 = v22;
    v5 = v16;

  }
  return v5;
}

- (id)startServer
{
  void *v3;
  DTAssetHTTPServer *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[DTAssetService server](self, "server");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(DTAssetHTTPServer);
    -[DTAssetService setServer:](self, "setServer:", v4);

    -[DTXService channel](self, "channel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[DTAssetService server](self, "server");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setChannel:", v5);

    -[DTAssetService server](self, "server");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "startListeningWithError:", 0);

  }
  -[DTAssetService connectToOnDemandDaemon](self, "connectToOnDemandDaemon");
  v8 = (void *)MEMORY[0x24BDD16E0];
  -[DTAssetService server](self, "server");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v9, "port"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)connectToOnDemandDaemon
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id location;

  -[DTAssetService ondemandConnection](self, "ondemandConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.ondemandd.devtools"), 4096);
    -[DTAssetService setOndemandConnection:](self, "setOndemandConnection:", v4);

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255785FE8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[DTAssetService ondemandConnection](self, "ondemandConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRemoteObjectInterface:", v5);

    objc_initWeak(&location, self);
    v9 = MEMORY[0x24BDAC760];
    objc_copyWeak(&v10, &location);
    -[DTAssetService ondemandConnection](self, "ondemandConnection", v9, 3221225472, sub_222B2B5C4, &unk_24EB28000);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setInvalidationHandler:", &v9);

    -[DTAssetService ondemandConnection](self, "ondemandConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "resume");

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (id)registerApplicationIdentifier:(id)a3 manifest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  -[DTAssetService appendAllowedResources:](self, "appendAllowedResources:", v6);
  -[DTAssetService ondemandConnection](self, "ondemandConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = sub_222B2B740;
  v19[3] = &unk_24EB283C8;
  v11 = v8;
  v20 = v11;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = sub_222B2B750;
  v17[3] = &unk_24EB283C8;
  v13 = v11;
  v18 = v13;
  objc_msgSend(v12, "registerManifest:forBundleID:replyBlock:", v6, v7, v17);

  v14 = v18;
  v15 = v13;

  return v15;
}

- (void)appendAllowedResources:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v4, 0, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("resources"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11), "objectForKeyedSubscript:", CFSTR("URL"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }
  v13 = (void *)objc_msgSend(v5, "copy");
  -[DTAssetService server](self, "server");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAllowedResources:", v13);

}

- (DTAssetHTTPServer)server
{
  return (DTAssetHTTPServer *)objc_getProperty(self, a2, 16, 1);
}

- (void)setServer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSXPCConnection)ondemandConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOndemandConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ondemandConnection, 0);
  objc_storeStrong((id *)&self->_server, 0);
}

@end
