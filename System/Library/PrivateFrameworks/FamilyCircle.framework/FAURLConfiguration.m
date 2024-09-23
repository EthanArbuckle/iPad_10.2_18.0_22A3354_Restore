@implementation FAURLConfiguration

- (void)URLForEndpoint:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _FALogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v6;
    _os_log_impl(&dword_1CAEBA000, v8, OS_LOG_TYPE_DEFAULT, "Desired enpoint %@", buf, 0xCu);
  }

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52__FAURLConfiguration_URLForEndpoint_withCompletion___block_invoke;
  v11[3] = &unk_1E8561908;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[FAURLConfiguration fetchAAURLConfigurationWithCompletion:](self, "fetchAAURLConfigurationWithCompletion:", v11);

}

void __52__FAURLConfiguration_URLForEndpoint_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(v5, "urlForEndpoint:", *(_QWORD *)(a1 + 32));
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  if (!(v6 | v7))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "fa_familyErrorWithCode:", -1017);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  if (v6)
  {
    _FALogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __52__FAURLConfiguration_URLForEndpoint_withCompletion___block_invoke_cold_1(v6, v8);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)URLForEndpoint:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0CF0EB0]);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __37__FAURLConfiguration_URLForEndpoint___block_invoke;
  v9[3] = &unk_1E8561930;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  v7 = (void *)objc_msgSend(v5, "initWithBlock:", v9);

  return v7;
}

uint64_t __37__FAURLConfiguration_URLForEndpoint___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "URLForEndpoint:withCompletion:", *(_QWORD *)(a1 + 40), a2);
}

- (void)fetchAAURLConfigurationWithCompletion:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0CFAD08];
  v4 = a3;
  objc_msgSend(v3, "sharedServer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configurationWithCompletion:", v4);

}

- (id)groupKitConfiguration
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D002A0], "sharedBag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "groupKitConfiguration");
  else
    objc_msgSend(v2, "configurationAtKey:", CFSTR("groupkit-cfg"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)groupKitMetricsRateLimit
{
  void *v2;
  void *v3;
  id v4;

  -[FAURLConfiguration groupKitConfiguration](self, "groupKitConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("familyMetricsRateLimit"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void __52__FAURLConfiguration_URLForEndpoint_withCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1CAEBA000, a2, OS_LOG_TYPE_ERROR, "Error getting url configuration %@", (uint8_t *)&v2, 0xCu);
}

@end
