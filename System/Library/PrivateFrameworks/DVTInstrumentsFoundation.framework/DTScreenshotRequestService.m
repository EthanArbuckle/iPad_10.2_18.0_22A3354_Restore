@implementation DTScreenshotRequestService

+ (void)registerCapabilities:(id)a3
{
  id v4;
  id v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v6 = 138412290;
    *(_QWORD *)&v6[4] = objc_opt_class();
    v5 = *(id *)&v6[4];
    _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "Registering service %@", v6, 0xCu);

  }
  objc_msgSend(v4, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.server.services.screenshot"), 2, a1, *(_OWORD *)v6);

}

- (id)takeScreenshot
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v17 = 0;
  -[DTScreenshotRequestService _screenshotWithError:](self, "_screenshotWithError:", &v17);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v17;
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      v7 = (void *)objc_opt_class();
      v8 = v7;
      v9 = objc_msgSend(v4, "length");
      *(_DWORD *)buf = 138412546;
      v19 = v7;
      v20 = 2048;
      v21 = v9;
      _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%@: Screenshot succeeded (%lu bytes)", buf, 0x16u);

    }
    v10 = v4;
  }
  else
  {
    if (!v5)
    {
      v11 = (void *)MEMORY[0x24BDD1540];
      v22 = *MEMORY[0x24BDD0FC8];
      v23[0] = CFSTR("Unknown error.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("DTScreenshotRequestService"), 1, v12);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v13 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v19 = v13;
      v20 = 2112;
      v21 = (uint64_t)v6;
      v14 = v13;
      _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%@: Screenshot failed: %@", buf, 0x16u);

    }
    objc_msgSend(v3, "invokeCompletionWithReturnValue:error:", v6, v6);
    v10 = v3;
  }
  v15 = v10;

  return v15;
}

- (id)_screenshotWithError:(id *)a3
{
  return (id)MEMORY[0x24BEDD108](self, sel__screenshotServiceRequestWithError_);
}

- (id)_screenshotServiceRequestWithError:(id *)a3
{
  void *v4;
  void *v5;
  dispatch_semaphore_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v11[4];
  NSObject *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithServiceName:", CFSTR("com.apple.dt.DTScreenshotService"));
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255786108);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRemoteObjectInterface:", v5);

  objc_msgSend(v4, "resume");
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_222B78760;
  v25 = sub_222B78770;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_222B78760;
  v19 = sub_222B78770;
  v20 = 0;
  v6 = dispatch_semaphore_create(0);
  objc_msgSend(v4, "remoteObjectProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_222B78778;
  v11[3] = &unk_24EB29508;
  v13 = &v21;
  v14 = &v15;
  v8 = v6;
  v12 = v8;
  objc_msgSend(v7, "takeScreenshotWithReply:", v11);

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  if (a3)
    *a3 = objc_retainAutorelease((id)v16[5]);
  objc_msgSend(v4, "invalidate");
  v9 = (id)v22[5];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

@end
