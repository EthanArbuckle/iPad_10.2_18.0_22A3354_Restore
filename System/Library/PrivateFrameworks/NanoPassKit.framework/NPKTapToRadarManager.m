@implementation NPKTapToRadarManager

- (void)fileRadarWithRequest:(id)a3 requestUserPermision:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if (v6)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __77__NPKTapToRadarManager_fileRadarWithRequest_requestUserPermision_completion___block_invoke;
    v10[3] = &unk_24CFE7B30;
    v10[4] = self;
    v11 = v8;
    v12 = v9;
    -[NPKTapToRadarManager _requestUserPermisionToFileRadarWithRequest:completion:](self, "_requestUserPermisionToFileRadarWithRequest:completion:", v11, v10);

  }
  else
  {
    -[NPKTapToRadarManager _openTapToRadarWithRequest:completion:](self, "_openTapToRadarWithRequest:completion:", v8, v9);
  }

}

uint64_t __77__NPKTapToRadarManager_fileRadarWithRequest_requestUserPermision_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  else
    return objc_msgSend(*(id *)(a1 + 32), "_openTapToRadarWithRequest:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_requestUserPermisionToFileRadarWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  const __CFDictionary *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;
  _QWORD v19[4];
  _QWORD v20[5];

  v20[4] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v6, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("(Internal Only)\n\nPlease file a radar to help us improve the product.\n\nIssue detected:\n%@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = *MEMORY[0x24BDBD6E0];
  v19[0] = *MEMORY[0x24BDBD6D8];
  v19[1] = v11;
  v20[0] = CFSTR("Wallet detected an issue");
  v20[1] = v10;
  v12 = *MEMORY[0x24BDBD6F0];
  v19[2] = *MEMORY[0x24BDBD6F8];
  v19[3] = v12;
  v20[2] = CFSTR("Tap-To-Radar");
  v20[3] = CFSTR("Cancel");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 4);
  v13 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __79__NPKTapToRadarManager__requestUserPermisionToFileRadarWithRequest_completion___block_invoke;
  v15[3] = &unk_24CFE9380;
  objc_copyWeak(&v17, &location);
  v14 = v7;
  v16 = v14;
  NPKPresentUserNotification(v13, v15);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __79__NPKTapToRadarManager__requestUserPermisionToFileRadarWithRequest_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  uint8_t v14[16];
  uint8_t buf[8];
  id to;

  objc_copyWeak(&to, (id *)(a1 + 40));
  v5 = objc_loadWeakRetained(&to);

  if (v5)
  {
    if (a3)
    {
      pk_General_log();
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

      if (v7)
      {
        pk_General_log();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v14 = 0;
          _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Notice: User rejected to Open Tap-To-Radar", v14, 2u);
        }

      }
      v9 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("NPKTapToRadarManagerErrorDomain"), 0, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

    }
    else
    {
      pk_General_log();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

      if (v12)
      {
        pk_General_log();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_213518000, v13, OS_LOG_TYPE_DEFAULT, "Notice: User accepted to Open Tap-To-Radar", buf, 2u);
        }

      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
  }
  objc_destroyWeak(&to);
}

- (void)_openTapToRadarWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  pk_General_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_General_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Requested to Open Tap-To-Radar", buf, 2u);
    }

  }
  -[NPKTapToRadarManager _applicationWorkSpace](self, "_applicationWorkSpace");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tapToRadarURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __62__NPKTapToRadarManager__openTapToRadarWithRequest_completion___block_invoke;
  v15[3] = &unk_24CFE93A8;
  v16 = v6;
  v17 = v7;
  v13 = v7;
  v14 = v6;
  objc_msgSend(v11, "openURL:configuration:completionHandler:", v12, 0, v15);

}

void __62__NPKTapToRadarManager__openTapToRadarWithRequest_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDD1540];
    v9[0] = CFSTR("requestURL");
    objc_msgSend(*(id *)(a1 + 32), "tapToRadarURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[1] = *MEMORY[0x24BDD1398];
    v10[0] = v6;
    v10[1] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("NPKTapToRadarManagerErrorDomain"), 1, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)_applicationWorkSpace
{
  return (id)objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
}

@end
