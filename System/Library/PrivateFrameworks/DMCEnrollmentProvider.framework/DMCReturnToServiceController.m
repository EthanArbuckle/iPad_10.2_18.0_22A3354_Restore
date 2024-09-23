@implementation DMCReturnToServiceController

- (DMCReturnToServiceController)init
{
  DMCReturnToServiceController *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *workerQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DMCReturnToServiceController;
  v2 = -[DMCReturnToServiceController init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("DMCReturnToServiceController_worker_queue", 0);
    workerQueue = v2->_workerQueue;
    v2->_workerQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (BOOL)shouldDoReturnToService
{
  void *v2;
  char v3;

  -[DMCReturnToServiceController obliterationShelter](self, "obliterationShelter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasConfigFile");

  return v3;
}

- (id)languageStrings
{
  void *v3;
  void *v4;

  if (-[DMCReturnToServiceController shouldDoReturnToService](self, "shouldDoReturnToService"))
  {
    -[DMCReturnToServiceController obliterationShelter](self, "obliterationShelter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "languageStrings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)localeString
{
  void *v3;
  void *v4;

  if (-[DMCReturnToServiceController shouldDoReturnToService](self, "shouldDoReturnToService"))
  {
    -[DMCReturnToServiceController obliterationShelter](self, "obliterationShelter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localeString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)installWiFiProfileIfNeeded:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  BOOL v10;
  NSObject *v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (!-[DMCReturnToServiceController shouldDoReturnToService](self, "shouldDoReturnToService"))
    return 1;
  -[DMCReturnToServiceController obliterationShelter](self, "obliterationShelter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "wifiProfileData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    v8 = (id)objc_msgSend(v7, "installProfileData:options:outError:", v6, 0, &v14);
    v9 = v14;

    v10 = v9 == 0;
    if (v9)
    {
      v11 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v16 = v9;
        _os_log_impl(&dword_216358000, v11, OS_LOG_TYPE_ERROR, "Failed to install WiFi data with error: %{public}@", buf, 0xCu);
      }
      if (a3)
        *a3 = objc_retainAutorelease(v9);
    }

  }
  else
  {
    v12 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_216358000, v12, OS_LOG_TYPE_DEFAULT, "No WiFi data, return.", buf, 2u);
    }
    v10 = 1;
  }

  return v10;
}

- (void)configureMDMWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[DMCReturnToServiceController workerQueue](self, "workerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __66__DMCReturnToServiceController_configureMDMWithCompletionHandler___block_invoke;
  v7[3] = &unk_24D52E7A8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __66__DMCReturnToServiceController_configureMDMWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  if ((objc_msgSend(*(id *)(a1 + 32), "shouldDoReturnToService") & 1) != 0)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __66__DMCReturnToServiceController_configureMDMWithCompletionHandler___block_invoke_2;
    v3[3] = &unk_24D52ED20;
    v2 = *(void **)(a1 + 40);
    v4 = *(id *)(a1 + 32);
    v5 = v2;
    objc_msgSend(v4, "_fetchAndStoreCloudConfigurationIfNeededWithCompletionHandler:", v3);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __66__DMCReturnToServiceController_configureMDMWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  v6 = *(void **)(a1 + 32);
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "obliterationShelter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "clear");

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __66__DMCReturnToServiceController_configureMDMWithCompletionHandler___block_invoke_3;
    v8[3] = &unk_24D52ECF8;
    v9 = *(id *)(a1 + 40);
    objc_msgSend(v6, "_fetchAndInstallMDMProfileIfNeededWithCloudConfig:completionHandler:", a2, v8);

  }
}

uint64_t __66__DMCReturnToServiceController_configureMDMWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)returnToServiceFlowCompleted
{
  id v3;

  if (-[DMCReturnToServiceController shouldDoReturnToService](self, "shouldDoReturnToService"))
  {
    -[DMCReturnToServiceController obliterationShelter](self, "obliterationShelter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "clear");

  }
}

- (void)_fetchAndStoreCloudConfigurationIfNeededWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[DMCReturnToServiceController workerQueue](self, "workerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __94__DMCReturnToServiceController__fetchAndStoreCloudConfigurationIfNeededWithCompletionHandler___block_invoke;
  v7[3] = &unk_24D52E7A8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __94__DMCReturnToServiceController__fetchAndStoreCloudConfigurationIfNeededWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  id v19;
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "obliterationShelter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cloudConfigurationDetails");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v2, "activationRecordIndicatesCloudConfigurationIsAvailable");
  v6 = *(NSObject **)DMCLogObjects();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if ((v5 & 1) != 0 || v4)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_216358000, v6, OS_LOG_TYPE_INFO, "Activation record indicates cloud configuration is available, will fetch...", buf, 2u);
    }
    objc_msgSend(v2, "cloudConfigurationDetails");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_216358000, v9, OS_LOG_TYPE_INFO, "Cloud Configuration is available already, returning...", buf, 2u);
      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      v14 = MEMORY[0x24BDAC760];
      v15 = 3221225472;
      v16 = __94__DMCReturnToServiceController__fetchAndStoreCloudConfigurationIfNeededWithCompletionHandler___block_invoke_4;
      v17 = &unk_24D52ED48;
      v19 = *(id *)(a1 + 40);
      v10 = v2;
      v18 = v10;
      v11 = (void *)MEMORY[0x2199F7854](&v14);
      v12 = *(NSObject **)DMCLogObjects();
      v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      if (v5)
      {
        if (v13)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_216358000, v12, OS_LOG_TYPE_DEFAULT, "Fetching cloud config from cloud...", buf, 2u);
        }
        objc_msgSend(v10, "retrieveAndStoreCloudConfigurationDetailsCompletionBlock:", v11, v14, v15, v16, v17);
      }
      else
      {
        if (v13)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_216358000, v12, OS_LOG_TYPE_DEFAULT, "Restoring stashed cloud config from disk...", buf, 2u);
        }
        objc_msgSend(v10, "storeCloudConfigurationDetails:completion:", v4, v11, v14, v15, v16, v17);
      }

    }
  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_216358000, v6, OS_LOG_TYPE_INFO, "No cloud configuration according to activation record and obliteration shelter.", buf, 2u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __94__DMCReturnToServiceController__fetchAndStoreCloudConfigurationIfNeededWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(NSObject **)DMCLogObjects();
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v7 = 138543362;
      v8 = v3;
      _os_log_impl(&dword_216358000, v4, OS_LOG_TYPE_ERROR, "Failed to retrieve and store cloud configuration with error: %{public}@", (uint8_t *)&v7, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_216358000, v4, OS_LOG_TYPE_INFO, "Cloud Configuration fetched & stored.", (uint8_t *)&v7, 2u);
    }
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "cloudConfigurationDetails");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v5 + 16))(v5, v6, 0);

  }
}

- (void)_fetchAndInstallMDMProfileIfNeededWithCloudConfig:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  DMCReturnToServiceController *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[DMCReturnToServiceController workerQueue](self, "workerQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __100__DMCReturnToServiceController__fetchAndInstallMDMProfileIfNeededWithCloudConfig_completionHandler___block_invoke;
  block[3] = &unk_24D52EDE8;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

void __100__DMCReturnToServiceController__fetchAndInstallMDMProfileIfNeededWithCloudConfig_completionHandler___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  char v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  void *v18;
  NSObject *v19;
  void (**v20)(id, void *);
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void (**v26)(id, void *);
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void (**v32)(id, void *);
  void *v33;
  _QWORD v34[4];
  id v35;
  void (**v36)(_QWORD, _QWORD, _QWORD);
  uint8_t buf[8];
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "installedMDMProfileIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    v4 = MEMORY[0x24BDAC760];
    v38[0] = MEMORY[0x24BDAC760];
    v38[1] = 3221225472;
    v38[2] = __100__DMCReturnToServiceController__fetchAndInstallMDMProfileIfNeededWithCloudConfig_completionHandler___block_invoke_2;
    v38[3] = &unk_24D52ED98;
    v5 = v2;
    v39 = v5;
    v6 = a1[4];
    v7 = a1[5];
    v40 = v6;
    v41 = v7;
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x2199F7854](v38);
    objc_msgSend(a1[5], "obliterationShelter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isSupervised");

    if ((v10 & 1) != 0
      || (objc_msgSend(a1[4], "objectForKeyedSubscript:", *MEMORY[0x24BE2A498]),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = objc_msgSend(v11, "BOOLValue"),
          v11,
          !v12))
    {
      objc_msgSend(a1[5], "obliterationShelter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "mdmProfileData");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        v16 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_216358000, v16, OS_LOG_TYPE_INFO, "MDM profile exists.", buf, 2u);
        }
        ((void (**)(_QWORD, void *, id))v8)[2](v8, v15, a1[6]);
      }
      else
      {
        v17 = a1[4];
        if (v17)
        {
          objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x24BE2A490]);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            objc_msgSend(a1[5], "_handleORGOEnrollmentWithCompletionHandler:", a1[6]);
          }
          else
          {
            v22 = (void *)MEMORY[0x24BDBCF48];
            objc_msgSend(a1[4], "objectForKeyedSubscript:", *MEMORY[0x24BE2A480]);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "URLWithString:", v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            if (v24)
            {
              v25 = *(NSObject **)DMCLogObjects();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_216358000, v25, OS_LOG_TYPE_ERROR, "WebURL is not supported during Return to Service.", buf, 2u);
              }
              v26 = (void (**)(id, void *))a1[6];
              objc_msgSend(a1[5], "_webURLNotSupportedError");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v26[2](v26, v27);
            }
            else
            {
              v28 = (void *)MEMORY[0x24BDBCF48];
              objc_msgSend(a1[4], "objectForKeyedSubscript:", *MEMORY[0x24BE2A478]);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "URLWithString:", v29);
              v27 = (void *)objc_claimAutoreleasedReturnValue();

              if (v27)
              {
                objc_msgSend(a1[4], "objectForKeyedSubscript:", *MEMORY[0x24BE63D40]);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                certificatesFromDERCertificateDataArray();
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                v34[0] = v4;
                v34[1] = 3221225472;
                v34[2] = __100__DMCReturnToServiceController__fetchAndInstallMDMProfileIfNeededWithCloudConfig_completionHandler___block_invoke_12;
                v34[3] = &unk_24D52EDC0;
                v35 = a1[6];
                v36 = v8;
                objc_msgSend(v5, "retrieveCloudConfigurationFromURL:username:password:anchorCertificates:completionBlock:", v27, 0, 0, v33, v34);

              }
              else
              {
                v31 = *(NSObject **)DMCLogObjects();
                if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_216358000, v31, OS_LOG_TYPE_ERROR, "Configuration URL is missing.", buf, 2u);
                }
                v32 = (void (**)(id, void *))a1[6];
                objc_msgSend(a1[5], "_configurationURLMissingError");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                v32[2](v32, v30);
              }

            }
          }

        }
        else
        {
          v19 = *(NSObject **)DMCLogObjects();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_216358000, v19, OS_LOG_TYPE_ERROR, "No local mdm profile or cloud config, returning...", buf, 2u);
          }
          v20 = (void (**)(id, void *))a1[6];
          objc_msgSend(a1[5], "_cloudConfigMissingError");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v20[2](v20, v21);

        }
      }

    }
    else
    {
      v13 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_216358000, v13, OS_LOG_TYPE_DEFAULT, "Device was unsupervised and now we are changing supervision state. Abort", buf, 2u);
      }
      (*((void (**)(void))a1[6] + 2))();
    }

  }
}

void __100__DMCReturnToServiceController__fetchAndInstallMDMProfileIfNeededWithCloudConfig_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v5;
    _os_log_impl(&dword_216358000, v7, OS_LOG_TYPE_INFO, "Storing mdm profile %@...", buf, 0xCu);
  }
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __100__DMCReturnToServiceController__fetchAndInstallMDMProfileIfNeededWithCloudConfig_completionHandler___block_invoke_5;
  v12[3] = &unk_24D52ED70;
  v16 = v6;
  v8 = *(void **)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 48);
  v14 = v9;
  v15 = v10;
  v11 = v6;
  objc_msgSend(v8, "storeProfileData:completion:", v5, v12);

}

void __100__DMCReturnToServiceController__fetchAndInstallMDMProfileIfNeededWithCloudConfig_completionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  void *v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v21 = v3;
      _os_log_impl(&dword_216358000, v4, OS_LOG_TYPE_ERROR, "Failed to store mdm data with error: %{public}@", buf, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    if (*(_QWORD *)(a1 + 32))
      objc_msgSend(*(id *)(a1 + 40), "cloudConfigurationUIDidCompleteWasApplied:", 1);
    v5 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_216358000, v5, OS_LOG_TYPE_INFO, "Installing mdm profile...", buf, 2u);
    }
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", *MEMORY[0x24BE2A8A0], *MEMORY[0x24BE63DC0]);
    objc_msgSend(*(id *)(a1 + 48), "obliterationShelter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "wifiProfileData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = (void *)MEMORY[0x24BE63CA8];
      objc_msgSend(*(id *)(a1 + 48), "obliterationShelter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "wifiProfileData");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "profileWithData:outError:", v11, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(v12, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v14;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v19, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, *MEMORY[0x24BE63DA8]);

      }
    }
    v16 = *(void **)(a1 + 40);
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __100__DMCReturnToServiceController__fetchAndInstallMDMProfileIfNeededWithCloudConfig_completionHandler___block_invoke_9;
    v17[3] = &unk_24D52ECF8;
    v18 = *(id *)(a1 + 56);
    objc_msgSend(v16, "installStoredProfileDataWithExtraOptions:completion:", v6, v17);

  }
}

uint64_t __100__DMCReturnToServiceController__fetchAndInstallMDMProfileIfNeededWithCloudConfig_completionHandler___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __100__DMCReturnToServiceController__fetchAndInstallMDMProfileIfNeededWithCloudConfig_completionHandler___block_invoke_12(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if (v5 || !a3)
  {
    v6 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 138543362;
      v8 = v5;
      _os_log_impl(&dword_216358000, v6, OS_LOG_TYPE_ERROR, "Failed to retrieve mdm profile data with error: %{public}@", (uint8_t *)&v7, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)_handleORGOEnrollmentWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE2A4D8]), "initWithPresenter:managedConfigurationHelper:", self, v5);
  -[DMCReturnToServiceController setEnrollmentFlowController:](self, "setEnrollmentFlowController:", v6);

  -[DMCReturnToServiceController enrollmentFlowController](self, "enrollmentFlowController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE60D68], "sharedConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "enrollmentServerURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE60D68], "sharedConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "enrollmentAnchorCertificates");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __75__DMCReturnToServiceController__handleORGOEnrollmentWithCompletionHandler___block_invoke;
  v13[3] = &unk_24D52EE10;
  v13[4] = self;
  v14 = v4;
  v12 = v4;
  objc_msgSend(v7, "startORGOEnrollmentFlowWithServiceURL:anchorCertificates:restartIfFail:completionHandler:", v9, v11, 0, v13);

}

void __75__DMCReturnToServiceController__handleORGOEnrollmentWithCompletionHandler___block_invoke(uint64_t a1, int a2, int a3, void *a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v7 = a4;
  v11 = v7;
  if (a2)
  {
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cloudConfigurationUIDidCompleteWasApplied:", 1);

    objc_msgSend(*(id *)(a1 + 32), "_markWiFiProfileAsManagedIfNeeded");
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0);
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 40);
    if (a3)
    {
      objc_msgSend(*(id *)(a1 + 32), "_ORGONotSupportedError");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

    }
    else
    {
      (*(void (**)(_QWORD, id))(v9 + 16))(*(_QWORD *)(a1 + 40), v7);
    }
  }

}

- (void)_markWiFiProfileAsManagedIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  -[DMCReturnToServiceController obliterationShelter](self, "obliterationShelter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "wifiProfileData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "installedMDMProfileIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(MEMORY[0x24BE63CA8], "profileWithData:outError:", v4, &v16);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v16;
    objc_msgSend(v7, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      goto LABEL_4;
    objc_msgSend(v5, "removeProfileWithIdentifier:", v9);
    -[DMCReturnToServiceController obliterationShelter](self, "obliterationShelter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "wifiProfileData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *MEMORY[0x24BE63DF8];
    v20[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v13 = (id)objc_msgSend(v5, "installProfileData:options:outError:", v11, v12, &v15);
    v8 = v15;

    if (v8)
    {
LABEL_4:
      v14 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v18 = v8;
        _os_log_impl(&dword_216358000, v14, OS_LOG_TYPE_ERROR, "Failed to update wifi profile with error: %{public}@", buf, 0xCu);
      }
    }

  }
}

- (void)requestMAIDAuthenticationWithManagedAppleID:(id)a3 personaID:(id)a4 ephemeral:(BOOL)a5 requireAppleMAID:(BOOL)a6 completionHandler:(id)a7
{
  id v7;
  NSObject *v8;
  uint8_t v9[16];

  v7 = a7;
  v8 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_216358000, v8, OS_LOG_TYPE_ERROR, "Return to Service is not supported with ORGO enrollment + user subscription.", v9, 2u);
  }
  (*((void (**)(id, _QWORD, uint64_t, _QWORD))v7 + 2))(v7, 0, 1, 0);

}

- (void)requestMAIDSignInWithAuthenticationResults:(id)a3 personaID:(id)a4 makeiTunesAccountActive:(BOOL)a5 completionHandler:(id)a6
{
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v6 = a6;
  v7 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_216358000, v7, OS_LOG_TYPE_ERROR, "Return to Service is not supported with ORGO enrollment + user subscription.", v8, 2u);
  }
  (*((void (**)(id, _QWORD, uint64_t, _QWORD))v6 + 2))(v6, 0, 1, 0);

}

- (id)_webURLNotSupportedError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BE2A698];
  DMCErrorArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v3, 16000, v4, 0, *MEMORY[0x24BE2A588], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_ORGONotSupportedError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BE2A698];
  DMCErrorArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v3, 16003, v4, 0, *MEMORY[0x24BE2A588], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_cloudConfigMissingError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BE2A698];
  DMCErrorArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v3, 16001, v4, 0, *MEMORY[0x24BE2A588], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_configurationURLMissingError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BE2A698];
  DMCErrorArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v3, 16002, v4, 0, *MEMORY[0x24BE2A588], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (DMCObliterationShelter)obliterationShelter
{
  DMCObliterationShelter *obliterationShelter;
  DMCObliterationShelter *v4;
  DMCObliterationShelter *v5;
  DMCObliterationShelter *v6;
  uint64_t v8;

  obliterationShelter = self->_obliterationShelter;
  if (!obliterationShelter)
  {
    v4 = (DMCObliterationShelter *)objc_opt_new();
    v5 = self->_obliterationShelter;
    self->_obliterationShelter = v4;

    v6 = self->_obliterationShelter;
    v8 = 0;
    -[DMCObliterationShelter retrieveWithError:](v6, "retrieveWithError:", &v8);
    obliterationShelter = self->_obliterationShelter;
  }
  return obliterationShelter;
}

- (OS_dispatch_queue)workerQueue
{
  return self->_workerQueue;
}

- (void)setWorkerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workerQueue, a3);
}

- (void)setObliterationShelter:(id)a3
{
  objc_storeStrong((id *)&self->_obliterationShelter, a3);
}

- (DMCEnrollmentFlowController)enrollmentFlowController
{
  return self->_enrollmentFlowController;
}

- (void)setEnrollmentFlowController:(id)a3
{
  objc_storeStrong((id *)&self->_enrollmentFlowController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enrollmentFlowController, 0);
  objc_storeStrong((id *)&self->_obliterationShelter, 0);
  objc_storeStrong((id *)&self->_workerQueue, 0);
}

@end
