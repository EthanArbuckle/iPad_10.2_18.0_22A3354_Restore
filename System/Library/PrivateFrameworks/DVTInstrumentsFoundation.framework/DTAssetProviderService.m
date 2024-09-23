@implementation DTAssetProviderService

- (DTAssetProviderService)initWithChannel:(id)a3
{
  DTAssetProviderService *v3;
  dispatch_queue_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DTAssetProviderService;
  v3 = -[DTXService initWithChannel:](&v6, sel_initWithChannel_, a3);
  if (v3)
  {
    v4 = dispatch_queue_create("com.apple.dt.DTAssetProviderService", MEMORY[0x24BDAC9C0]);
    -[DTAssetProviderService setConcurrentRequestQueue:](v3, "setConcurrentRequestQueue:", v4);

  }
  return v3;
}

+ (void)beginProvidingAssetsForRemoteApplication:(id)a3 workingDirectory:(id)a4 connection:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("DTAssetProviderService.m"), 107, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = sub_222B351A8;
  v18[3] = &unk_24EB28C20;
  v19 = v11;
  v20 = v14;
  v15 = v14;
  v16 = v11;
  objc_msgSend(a1, "assetProviderWithConnection:workingDirectory:completion:", v13, v12, v18);

}

+ (void)beginProvidingAssetsForLocalApplication:(id)a3 connection:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("DTAssetProviderService.m"), 121, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  if ((objc_msgSend(a1, "shouldStartAssetServerForApplication:", v9) & 1) != 0)
  {
    objc_msgSend(v9, "stringByDeletingLastPathComponent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = sub_222B35388;
    v14[3] = &unk_24EB28C70;
    v16 = v11;
    v15 = v9;
    objc_msgSend(a1, "assetProviderWithConnection:workingDirectory:completion:", v10, v12, v14);

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v9;
      _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "Not starting ODR asset provider because there is no manifest template at %@", buf, 0xCu);
    }
    (*((void (**)(id, _QWORD))v11 + 2))(v11, 0);
  }

}

+ (void)assetProviderWithConnection:(id)a3 workingDirectory:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD))a5;
  if (v8)
  {
    if ((int)objc_msgSend(v8, "remoteCapabilityVersion:", CFSTR("com.apple.instruments.server.services.assets")) > 2)
    {
      objc_msgSend(v8, "setMaximumEnqueueSize:", 40960);
      objc_msgSend(v8, "makeChannelWithIdentifier:", CFSTR("com.apple.instruments.server.services.assets"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithChannel:", v14);
      objc_msgSend(v15, "setWorkingDirectory:", v9);
      objc_msgSend(v15, "setConnection:", v8);
      v10[2](v10, v15, 0);

    }
    else
    {
      v10[2](v10, 0, 0);
    }
  }
  else
  {
    v11 = (void *)MEMORY[0x24BDD1540];
    v16 = *MEMORY[0x24BDD0FC8];
    v17[0] = CFSTR("no connection provided");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("com.apple.dt.AssetProviderService"), 1, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    ((void (**)(id, void *, void *))v10)[2](v10, 0, v13);
  }

}

- (void)startServingAssetsForAppWithPath:(id)a3 withCompletion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  objc_msgSend(MEMORY[0x24BE2A960], "messageWithSelector:objectArguments:", sel_startServerForApplicationWithDevicePath_, a3, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DTXService channel](self, "channel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_222B357A8;
  v10[3] = &unk_24EB28C98;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "sendControlAsync:replyHandler:", v7, v10);

}

- (void)messageReceived:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  DTAssetProviderService *v8;

  v4 = a3;
  if (objc_msgSend(v4, "errorStatus") != 2)
  {
    -[DTAssetProviderService concurrentRequestQueue](self, "concurrentRequestQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = sub_222B35890;
    v6[3] = &unk_24EB28350;
    v7 = v4;
    v8 = self;
    dispatch_async(v5, v6);

  }
}

- (void)serveDataFromZippedDirectory:(id)a3 forRequestIdentifier:(id)a4
{
  MEMORY[0x24BEDD108](self, sel_serveDataWithResultFromZippedDirectory_forRequestIdentifier_);
}

- (BOOL)serveDataWithResultFromZippedDirectory:(id)a3 forRequestIdentifier:(id)a4
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("NotSupportedException"), CFSTR("Serving StreamingZip data for ODR is not supported on device platforms."));
  return 0;
}

- (void)serveDataFromFile:(id)a3 forRequestIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v9 = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "ODR: Serving data for request %@ from file %@", (uint8_t *)&v9, 0x16u);
  }
  objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForReadingAtPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DTAssetProviderService serveDataFromFileHandle:forRequestIdentifier:](self, "serveDataFromFileHandle:forRequestIdentifier:", v8, v7);

}

- (BOOL)serveDataFromFileHandle:(id)a3 forRequestIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  BOOL v23;
  void *v24;
  uint64_t v25;
  DTAssetProviderService *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  unint64_t v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v28 = a3;
  v6 = a4;
  -[DTXService channel](self, "channel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = self;
  -[DTAssetProviderService connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "remoteCapabilityVersion:", CFSTR("com.apple.instruments.server.services.assets.response"));

  v10 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
  if (v9 < 1)
  {
    if (v10)
    {
      *(_DWORD *)buf = 138412290;
      v33 = v6;
      _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "ODR: Using existing channel to send response packets for request %@", buf, 0xCu);
    }
  }
  else
  {
    if (v10)
    {
      *(_DWORD *)buf = 138412290;
      v33 = v6;
      _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "ODR: Opening new channel to send response packets for request %@", buf, 0xCu);
    }
    -[DTAssetProviderService connection](self, "connection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "makeChannelWithIdentifier:", CFSTR("com.apple.instruments.server.services.assets.response"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE2A960], "messageWithSelector:objectArguments:", sel_prepareForResponse, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sendControlSync:replyHandler:", v13, &unk_24EB27730);

    v7 = v12;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v33 = v6;
    _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "ODR: Starting to send data for request %@.", buf, 0xCu);
  }
  objc_msgSend(v28, "availableData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = 0;
    v16 = 0;
    v17 = 0;
    while (objc_msgSend(v14, "length"))
    {
      if (v9 >= 2 && v17 >= v15)
      {
        if (-[DTAssetProviderService hasCancelledRequestWithIdentifier:onChannel:](v27, "hasCancelledRequestWithIdentifier:onChannel:", v6, v7))
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v33 = v6;
            _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "ODR: Request %@ has been cancelled, stopping sending data.", buf, 0xCu);
          }
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412802;
            v33 = v6;
            v34 = 2048;
            v35 = v17;
            v36 = 2048;
            v37 = v16;
            _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "ODR: Cancelled request %@ after sending %llu bytes from %llu messages.", buf, 0x20u);
          }
          v23 = 0;
          goto LABEL_22;
        }
        v15 += 0x100000;
      }
      +[DTAssetResponse responseWithIdentifier:data:](DTAssetResponse, "responseWithIdentifier:data:", v6, v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "message");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "sendMessage:replyHandler:", v19, 0);

      v17 += objc_msgSend(v14, "length");
      ++v16;

      objc_msgSend(v28, "availableData");
      v20 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v20;
      if (!v20)
        break;
    }
  }
  else
  {
    v17 = 0;
    v16 = 0;
  }
  +[DTAssetResponse completedResponseWithIdentifier:](DTAssetResponse, "completedResponseWithIdentifier:", v6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "message");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sendMessage:replyHandler:", v22, 0);

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v33 = v6;
    v34 = 2048;
    v35 = v17;
    v36 = 2048;
    v37 = v16;
    _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "ODR: Finished sending request %@. Sent bytes: %llu from %llu messages.", buf, 0x20u);
  }

  v23 = 1;
LABEL_22:
  -[DTXService channel](v27, "channel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 != v24)
  {
    v25 = *MEMORY[0x24BE2A978];
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = sub_222B36104;
    v29[3] = &unk_24EB27E80;
    v30 = v6;
    v31 = v7;
    objc_msgSend(v31, "sendMessageAsync:replyHandler:", v25, v29);

  }
  return v23;
}

- (BOOL)hasCancelledRequestWithIdentifier:(id)a3 onChannel:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  int v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BE2A960], "messageWithSelector:objectArguments:", sel_canContinueServingRequestWithIdentifier_, v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_222B363B4;
  v19 = sub_222B363C4;
  v20 = 0;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = sub_222B363CC;
  v14[3] = &unk_24EB28CC0;
  v14[4] = &v15;
  objc_msgSend(v6, "sendMessageSync:replyHandler:", v7, v14);
  objc_msgSend((id)v16[5], "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = MEMORY[0x24BDACB70];
    v10 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend((id)v16[5], "error");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v22 = v5;
      v23 = 2112;
      v24 = v11;
      _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "ODR: Error checking if request %@ is cancelled: %@", buf, 0x16u);

    }
    LOBYTE(v12) = 1;
  }
  else
  {
    objc_msgSend((id)v16[5], "object");
    v9 = objc_claimAutoreleasedReturnValue();
    v12 = -[NSObject BOOLValue](v9, "BOOLValue") ^ 1;
  }

  _Block_object_dispose(&v15, 8);
  return v12;
}

+ (id)assetManifestPathForApplication:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathForResource:ofType:", CFSTR("AssetPackManifestTemplate"), CFSTR("plist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)shouldStartAssetServerForApplication:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x24BDD1580];
  v5 = a3;
  objc_msgSend(v4, "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "assetManifestPathForApplication:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v6, "fileExistsAtPath:", v7);
  return (char)v5;
}

+ (void)beginProvidingAssetsForApplication:(id)a3 onChannel:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  void (**v17)(_QWORD);

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  if ((objc_msgSend(a1, "shouldStartAssetServerForApplication:", v8) & 1) != 0 && v9)
  {
    v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithChannel:", v9);
    objc_msgSend(v8, "stringByDeletingLastPathComponent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWorkingDirectory:", v12);

    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = sub_222B365C8;
    v14[3] = &unk_24EB28C48;
    v17 = v10;
    v15 = v11;
    v16 = v8;
    v13 = v11;
    objc_msgSend(v13, "startServerOnDeviceWithCompletion:", v14);

  }
  else
  {
    v10[2](v10);
  }

}

- (void)startServerOnDeviceWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE2A960], "messageWithSelector:objectArguments:", sel_startServer, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DTXService channel](self, "channel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = sub_222B3675C;
  v8[3] = &unk_24EB28C98;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "sendMessageAsync:replyHandler:", v5, v8);

}

- (void)registerManifestForApplicationAtPath:(id)a3 onPort:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", a3);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "pathForResource:ofType:", CFSTR("AssetPackManifestTemplate"), CFSTR("plist"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[DTAssetService translatedManifest:withAssetServicePort:](DTAssetService, "translatedManifest:withAssetServicePort:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)MEMORY[0x24BE2A960];
    objc_msgSend(v13, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "messageWithSelector:objectArguments:", sel_registerApplicationIdentifier_manifest_, v10, v8, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[DTXService channel](self, "channel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sendMessageAsync:replyHandler:", v11, &unk_24EB28CE0);

  }
}

- (BOOL)_requestedPath:(id)a3 belongsToWorkingDirectory:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  unint64_t v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "stringByResolvingSymlinksInPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pathComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringByResolvingSymlinksInPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pathComponents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  if (v8 && v10)
  {
    v12 = objc_msgSend(v8, "count");
    if (v12 >= objc_msgSend(v10, "count"))
    {
      v17 = 0;
      v18 = &v17;
      v19 = 0x2020000000;
      v20 = 1;
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = sub_222B36A74;
      v14[3] = &unk_24EB28D08;
      v15 = v8;
      v16 = &v17;
      objc_msgSend(v10, "enumerateObjectsUsingBlock:", v14);
      v11 = *((_BYTE *)v18 + 24) != 0;

      _Block_object_dispose(&v17, 8);
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (id)_bestChannelForRequestWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[DTXService channel](self, "channel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DTAssetProviderService connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "remoteCapabilityVersion:", CFSTR("com.apple.instruments.server.services.assets.response"));

  v8 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
  if (v7 < 1)
  {
    if (v8)
    {
      v13 = 138412290;
      v14 = v4;
      _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "ODR: Using existing channel to send response packets for request %@", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    if (v8)
    {
      v13 = 138412290;
      v14 = v4;
      _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "ODR: Opening new channel to send response packets for request %@", (uint8_t *)&v13, 0xCu);
    }
    -[DTAssetProviderService connection](self, "connection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "makeChannelWithIdentifier:", CFSTR("com.apple.instruments.server.services.assets.response"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE2A960], "messageWithSelector:objectArguments:", sel_prepareForResponse, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sendControlSync:replyHandler:", v11, &unk_24EB28D28);

    v5 = v10;
  }

  return v5;
}

- (void)_completeResponseOnChannel:(id)a3 withIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  +[DTAssetResponse completedResponseWithIdentifier:](DTAssetResponse, "completedResponseWithIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "message");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendMessage:replyHandler:", v9, 0);

  -[DTXService channel](self, "channel");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 != v6)
  {
    v11 = *MEMORY[0x24BE2A978];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = sub_222B36DAC;
    v12[3] = &unk_24EB27E80;
    v13 = v7;
    v14 = v6;
    objc_msgSend(v14, "sendMessageAsync:replyHandler:", v11, v12);

  }
}

- (BOOL)_serveData:(id)a3 usingChannel:(id)a4 forRequestIdentifier:(id)a5 checkForCancellation:(BOOL)a6 error:(id *)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  BOOL v24;
  void *v25;
  uint64_t v26;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint8_t buf[4];
  id v33;
  uint64_t v34;

  v8 = a6;
  v34 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (v13)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v14;
      _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "ODR: Sending data for request %@.", buf, 0xCu);
    }
    if (!v8
      || !-[DTAssetProviderService hasCancelledRequestWithIdentifier:onChannel:](self, "hasCancelledRequestWithIdentifier:onChannel:", v14, v13))
    {
      +[DTAssetResponse responseWithIdentifier:data:](DTAssetResponse, "responseWithIdentifier:data:", v14, v12);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "message");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "sendMessage:replyHandler:", v23, 0);

      v24 = 1;
      goto LABEL_13;
    }
    objc_msgSend(v13, "cancel");
    v15 = (void *)MEMORY[0x24BDD1540];
    v16 = *MEMORY[0x24BDD1128];
    v30 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Request %@ has been cancelled, stopping sending data."), v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v15;
    v20 = v16;
    v21 = 89;
  }
  else
  {
    v25 = (void *)MEMORY[0x24BDD1540];
    v26 = *MEMORY[0x24BDD1128];
    v28 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Request %@ can't send data because there is no channel connection."), v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v25;
    v20 = v26;
    v21 = 57;
  }
  objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, v21, v18);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (a7 && v22)
    *a7 = objc_retainAutorelease(v22);
  v24 = v22 == 0;
LABEL_13:

  return v24;
}

- (DTXConnection)connection
{
  return (DTXConnection *)objc_loadWeakRetained((id *)&self->_connection);
}

- (void)setConnection:(id)a3
{
  objc_storeWeak((id *)&self->_connection, a3);
}

- (OS_dispatch_queue)concurrentRequestQueue
{
  return self->_concurrentRequestQueue;
}

- (void)setConcurrentRequestQueue:(id)a3
{
  objc_storeStrong((id *)&self->_concurrentRequestQueue, a3);
}

- (NSString)workingDirectory
{
  return self->_workingDirectory;
}

- (void)setWorkingDirectory:(id)a3
{
  objc_storeStrong((id *)&self->_workingDirectory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workingDirectory, 0);
  objc_storeStrong((id *)&self->_concurrentRequestQueue, 0);
  objc_destroyWeak((id *)&self->_connection);
}

@end
