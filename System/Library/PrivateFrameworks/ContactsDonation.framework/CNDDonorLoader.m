@implementation CNDDonorLoader

- (CNDDonorLoader)init
{
  CNDDonorLoader *v2;
  uint64_t v3;
  CNDonationLoggerProvider *loggerProvider;
  CNDDonorLoader *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNDDonorLoader;
  v2 = -[CNDDonorLoader init](&v7, sel_init);
  if (v2)
  {
    +[CNDonationLoggerProvider defaultProvider](CNDonationLoggerProvider, "defaultProvider");
    v3 = objc_claimAutoreleasedReturnValue();
    loggerProvider = v2->_loggerProvider;
    v2->_loggerProvider = (CNDonationLoggerProvider *)v3;

    v5 = v2;
  }

  return v2;
}

- (id)donorWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BE19280];
  v6 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __38__CNDDonorLoader_donorWithIdentifier___block_invoke;
  v16[3] = &unk_24C2362E0;
  v7 = v4;
  v17 = v7;
  objc_msgSend(v5, "futureWithBlock:", v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v6;
  v14[1] = 3221225472;
  v14[2] = __38__CNDDonorLoader_donorWithIdentifier___block_invoke_2;
  v14[3] = &unk_24C236308;
  v14[4] = self;
  v9 = v7;
  v15 = v9;
  objc_msgSend(v8, "addSuccessBlock:", v14);
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __38__CNDDonorLoader_donorWithIdentifier___block_invoke_3;
  v12[3] = &unk_24C236330;
  v12[4] = self;
  v13 = v9;
  v10 = v9;
  objc_msgSend(v8, "addFailureBlock:", v12);

  return v8;
}

CNDDonorExtension *__38__CNDDonorLoader_donorWithIdentifier___block_invoke(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  void *v5;
  id v6;
  CNDDonorExtension *v7;
  void *v8;
  void *v9;
  void *v10;
  id v12;

  v4 = *(_QWORD *)(a1 + 32);
  v12 = 0;
  objc_msgSend(MEMORY[0x24BDD1550], "extensionWithIdentifier:error:", v4, &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v12;
  if (v5)
  {
    v7 = -[CNDDonorExtension initWithExtension:]([CNDDonorExtension alloc], "initWithExtension:", v5);
  }
  else
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 2);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), CFSTR("bundle identifier"));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BDD1398]);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CNDonationErrorDomain"), 504, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (a2)
      *a2 = objc_retainAutorelease(v9);

    v7 = 0;
  }

  return v7;
}

void __38__CNDDonorLoader_donorWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "loggerProvider");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extensionLogger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loadedDonorExtension:forIdentifier:", v4, *(_QWORD *)(a1 + 40));

}

void __38__CNDDonorLoader_donorWithIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "loggerProvider");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extensionLogger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "couldNotLoadDonorExtensionForIdentifier:error:", *(_QWORD *)(a1 + 40), v4);

}

+ (id)currentExtensionsObservable
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __45__CNDDonorLoader_currentExtensionsObservable__block_invoke;
  v3[3] = &__block_descriptor_40_e38____CNCancelable__16__0___CNObserver__8l;
  v3[4] = a1;
  objc_msgSend(MEMORY[0x24BE192A0], "observableWithBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __45__CNDDonorLoader_currentExtensionsObservable__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x24BE19230]);
  objc_msgSend(*(id *)(a1 + 32), "extensionAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v4);
  v6 = (void *)MEMORY[0x24BDD1550];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __45__CNDDonorLoader_currentExtensionsObservable__block_invoke_2;
  v9[3] = &unk_24C2363A8;
  objc_copyWeak(&v11, &location);
  v7 = v3;
  v10 = v7;
  objc_msgSend(v6, "extensionsWithMatchingAttributes:completion:", v5, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v4;
}

void __45__CNDDonorLoader_currentExtensionsObservable__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[5];
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v5)
  {
    v16 = v6;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    v10 = MEMORY[0x24BDAC760];
    if (v9)
    {
      v11 = v9;
      v12 = *(_QWORD *)v25;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v25 != v12)
            objc_enumerationMutation(v8);
          v14 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v13);
          v22[0] = v10;
          v22[1] = 3221225472;
          v22[2] = __45__CNDDonorLoader_currentExtensionsObservable__block_invoke_3;
          v22[3] = &unk_24C236358;
          v22[4] = v14;
          v23 = *(id *)(a1 + 32);
          objc_msgSend(WeakRetained, "performBlock:", v22);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v11);
    }

    v20[0] = v10;
    v20[1] = 3221225472;
    v20[2] = __45__CNDDonorLoader_currentExtensionsObservable__block_invoke_4;
    v20[3] = &unk_24C236380;
    v15 = &v21;
    v21 = *(id *)(a1 + 32);
    objc_msgSend(WeakRetained, "performBlock:", v20);
    v6 = v16;
  }
  else
  {
    NSLog(CFSTR("Extension discovery failed: %@"), v6);
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __45__CNDDonorLoader_currentExtensionsObservable__block_invoke_5;
    v17[3] = &unk_24C236358;
    v15 = &v18;
    v18 = *(id *)(a1 + 32);
    v19 = v6;
    objc_msgSend(WeakRetained, "performBlock:", v17);

  }
}

void __45__CNDDonorLoader_currentExtensionsObservable__block_invoke_3(uint64_t a1)
{
  CNDDonorExtension *v2;

  v2 = -[CNDDonorExtension initWithExtension:]([CNDDonorExtension alloc], "initWithExtension:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "observerDidReceiveResult:", v2);

}

uint64_t __45__CNDDonorLoader_currentExtensionsObservable__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidComplete");
}

uint64_t __45__CNDDonorLoader_currentExtensionsObservable__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidFailWithError:", *(_QWORD *)(a1 + 40));
}

+ (id)continuousExtensionsObservable
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __48__CNDDonorLoader_continuousExtensionsObservable__block_invoke;
  v3[3] = &__block_descriptor_40_e38____CNCancelable__16__0___CNObserver__8l;
  v3[4] = a1;
  objc_msgSend(MEMORY[0x24BE192A0], "observableWithBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __48__CNDDonorLoader_continuousExtensionsObservable__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x24BE19230]);
  objc_msgSend(*(id *)(a1 + 32), "extensionAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v4);
  v6 = (void *)MEMORY[0x24BDD1550];
  v7 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __48__CNDDonorLoader_continuousExtensionsObservable__block_invoke_2;
  v13[3] = &unk_24C2363A8;
  objc_copyWeak(&v15, &location);
  v8 = v3;
  v14 = v8;
  objc_msgSend(v6, "beginMatchingExtensionsWithAttributes:completion:", v5, v13);
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __48__CNDDonorLoader_continuousExtensionsObservable__block_invoke_6;
  v11[3] = &unk_24C236380;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v12 = v9;
  objc_msgSend(v4, "addCancelationBlock:", v11);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v4;
}

void __48__CNDDonorLoader_continuousExtensionsObservable__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v5)
  {
    objc_msgSend(v5, "_cn_map:", &__block_literal_global_1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __48__CNDDonorLoader_continuousExtensionsObservable__block_invoke_4;
    v13[3] = &unk_24C236358;
    v14 = *(id *)(a1 + 32);
    v15 = v8;
    v9 = v8;
    objc_msgSend(WeakRetained, "performBlock:", v13);

  }
  else
  {
    NSLog(CFSTR("Extension discovery failed: %@"), v6);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __48__CNDDonorLoader_continuousExtensionsObservable__block_invoke_5;
    v10[3] = &unk_24C236358;
    v11 = *(id *)(a1 + 32);
    v12 = v6;
    objc_msgSend(WeakRetained, "performBlock:", v10);

    v9 = v11;
  }

}

CNDDonorExtension *__48__CNDDonorLoader_continuousExtensionsObservable__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  CNDDonorExtension *v3;

  v2 = a2;
  v3 = -[CNDDonorExtension initWithExtension:]([CNDDonorExtension alloc], "initWithExtension:", v2);

  return v3;
}

uint64_t __48__CNDDonorLoader_continuousExtensionsObservable__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidReceiveResult:", *(_QWORD *)(a1 + 40));
}

uint64_t __48__CNDDonorLoader_continuousExtensionsObservable__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidFailWithError:", *(_QWORD *)(a1 + 40));
}

uint64_t __48__CNDDonorLoader_continuousExtensionsObservable__block_invoke_6(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x24BDD1550], "endMatchingExtensions:", *(_QWORD *)(a1 + 32));
}

+ (id)extensionAttributes
{
  return &unk_24C23B9B8;
}

- (CNDonationLoggerProvider)loggerProvider
{
  return self->_loggerProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggerProvider, 0);
}

@end
