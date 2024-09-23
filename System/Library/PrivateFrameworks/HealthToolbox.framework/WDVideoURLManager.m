@implementation WDVideoURLManager

+ (void)fetchURLForVideoWithIdentifier:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __60__WDVideoURLManager_fetchURLForVideoWithIdentifier_handler___block_invoke;
  v10[3] = &unk_24D38DF90;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  objc_msgSend(a1, "_fetchPreferredURLForIdentifier:completion:", v9, v10);

}

void __60__WDVideoURLManager_fetchURLForVideoWithIdentifier_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __60__WDVideoURLManager_fetchURLForVideoWithIdentifier_handler___block_invoke_2;
  v10[3] = &unk_24D38DF68;
  v11 = *(id *)(a1 + 32);
  v12 = v5;
  v7 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v7;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v10);

}

uint64_t __60__WDVideoURLManager_fetchURLForVideoWithIdentifier_handler___block_invoke_2(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v2 = *MEMORY[0x24BDD3070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v4 = a1[5];
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_215814000, v2, OS_LOG_TYPE_DEFAULT, "Fetched URL for %@: %@", (uint8_t *)&v6, 0x16u);
  }
  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

+ (BOOL)isVideoPlaybackEnabled
{
  return 1;
}

+ (void)_fetchPreferredURLForIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __64__WDVideoURLManager__fetchPreferredURLForIdentifier_completion___block_invoke;
  v10[3] = &unk_24D38DFB8;
  v12 = v7;
  v13 = a1;
  v11 = v6;
  v8 = v7;
  v9 = v6;
  objc_msgSend(a1, "_fetchRawManifestForIdentifier:completion:", v9, v10);

}

void __64__WDVideoURLManager__fetchPreferredURLForIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  os_log_t *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 48), "_parseJSON:", a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    _HKInitializeLogging();
    v4 = (os_log_t *)MEMORY[0x24BDD3070];
    v5 = *MEMORY[0x24BDD3070];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(void **)(a1 + 32);
      v15 = 138543618;
      v16 = v6;
      v17 = 2114;
      v18 = v3;
      _os_log_impl(&dword_215814000, v5, OS_LOG_TYPE_DEFAULT, "Received JSON dictionary for identifier %{public}@: %{public}@", (uint8_t *)&v15, 0x16u);
    }
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("languages"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "preferredLanguageFromLanguages:languagePreferences:", v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    _HKInitializeLogging();
    v11 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138543362;
      v16 = v10;
      _os_log_impl(&dword_215814000, v11, OS_LOG_TYPE_DEFAULT, "Chose language code %{public}@", (uint8_t *)&v15, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 48), "_baseURLForIdentifier:", *(_QWORD *)(a1 + 32));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "URLByAppendingPathComponent:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "URLByAppendingPathComponent:", CFSTR("stream.m3u8"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0);
  }
}

+ (id)preferredLanguageFromLanguages:(id)a3 languagePreferences:(id)a4
{
  id v5;
  id v6;
  void *v7;
  __CFString *v8;
  NSObject *v9;
  int v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count") && objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "preferredLocalizationsFromArray:forPreferences:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _HKInitializeLogging();
    v9 = *MEMORY[0x24BDD3070];
    v8 = CFSTR("en");
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138543362;
      v12 = CFSTR("en");
      _os_log_impl(&dword_215814000, v9, OS_LOG_TYPE_DEFAULT, "Received empty array of languages, returning %{public}@", (uint8_t *)&v11, 0xCu);
    }
  }

  return v8;
}

+ (id)_parseJSON:(id)a3
{
  uint64_t v4;

  v4 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", a3, 0, &v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)_fetchRawManifestForIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  objc_msgSend(a1, "_baseURLForIdentifier:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:", CFSTR("manifest.json"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1850], "sharedSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __63__WDVideoURLManager__fetchRawManifestForIdentifier_completion___block_invoke;
  v12[3] = &unk_24D38DFE0;
  v13 = v6;
  v10 = v6;
  objc_msgSend(v9, "dataTaskWithURL:completionHandler:", v8, v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "resume");
}

void __63__WDVideoURLManager__fetchRawManifestForIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;

  v9 = a2;
  v7 = a3;
  v8 = a4;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

+ (id)_baseURLForIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCF50];
  v4 = a3;
  objc_msgSend(v3, "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringForKey:", *MEMORY[0x24BDD4680]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "hk_stripLeadingTrailingWhitespace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hk_copyNonEmptyString");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v9 = v8;
  else
    v9 = CFSTR("https://health-assets.cdn-apple.com/videos");
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URLByAppendingPathComponent:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  _HKInitializeLogging();
  v12 = (void *)*MEMORY[0x24BDD3070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_DEFAULT))
  {
    v13 = v12;
    objc_msgSend(v11, "absoluteString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412290;
    v17 = v14;
    _os_log_impl(&dword_215814000, v13, OS_LOG_TYPE_DEFAULT, "Server base URL: %@", (uint8_t *)&v16, 0xCu);

  }
  return v11;
}

@end
