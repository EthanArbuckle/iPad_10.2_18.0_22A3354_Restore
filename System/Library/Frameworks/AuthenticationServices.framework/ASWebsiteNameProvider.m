@implementation ASWebsiteNameProvider

void __33___ASWebsiteNameProvider_prewarm__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD v5[5];
  uint8_t buf[4];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (id)WBS_LOG_CHANNEL_PREFIXWebsiteNameProvider();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v7 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_20E4D9000, v4, OS_LOG_TYPE_INFO, "prewarm found %lu entries", buf, 0xCu);
  }

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __33___ASWebsiteNameProvider_prewarm__block_invoke_91;
  v5[3] = &unk_24C950270;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v5);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "knownWebsiteNamesDidChange");

}

uint64_t __33___ASWebsiteNameProvider_prewarm__block_invoke_91(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processFetchedMetadataEntry:forDomain:", a3, a2);
}

uint64_t __33___ASWebsiteNameProvider_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "close");
}

void __77___ASWebsiteNameProvider_beginLoadingBuiltInAndRemotelyUpdatableWebsiteNames__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), a2);
  v4 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "knownWebsiteNamesDidChange");

}

void __78___ASWebsiteNameProvider_debug_fetchWebsiteNamesForDomains_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
    WeakRetained = (id)*((_QWORD *)WeakRetained + 10);
  (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), WeakRetained);

}

void __54___ASWebsiteNameProvider_debug_deleteAllPersistedData__block_invoke(uint64_t a1, char a2)
{
  NSObject *v3;

  v3 = WBS_LOG_CHANNEL_PREFIXWebsiteNameProvider();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __54___ASWebsiteNameProvider_debug_deleteAllPersistedData__block_invoke_cold_1(a2, v3);
}

uint64_t __56___ASWebsiteNameProvider__bestTitleFromCandidateTitles___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v3 = a2;
  objc_msgSend(v3, "uppercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  v6 = objc_msgSend(v3, "safari_hasCaseInsensitivePrefix:", CFSTR("The "));
  v7 = -2;
  if (!(_DWORD)v5)
    v7 = -1;
  if (v6)
    v8 = v7;
  else
    v8 = v5 << 63 >> 63;
  if ((objc_msgSend(v3, "safari_hasCaseInsensitiveSuffix:", CFSTR(" Website")) & 1) != 0
    || objc_msgSend(v3, "safari_hasCaseInsensitiveSuffix:", CFSTR("Inc.")))
  {
    --v8;
  }
  objc_msgSend(*(id *)(a1 + 32), "_undesirableCharactersCharacterSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v3, "rangeOfCharacterFromSet:options:", v9, 0);

  return v8 - (v10 != 0x7FFFFFFFFFFFFFFFLL);
}

uint64_t __56___ASWebsiteNameProvider__bestTitleFromCandidateTitles___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = a2;
  v6 = a3;
  v7 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v8 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v9 = v7 - v8;
  if (v7 == v8)
  {
    v10 = objc_msgSend(v5, "length");
    v9 = v10 - objc_msgSend(v6, "length");
  }
  v11 = -1;
  if (v9 >= 1)
    v11 = 1;
  if (v9)
    v12 = v11;
  else
    v12 = 0;

  return v12;
}

void __70___ASWebsiteNameProvider_fetchWebsiteNameForDomain_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (id)WBS_LOG_CHANNEL_PREFIXWebsiteNameProvider();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v11 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v5, "siteName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "title");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "originalTitle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138740739;
      v16 = v11;
      v17 = 2117;
      v18 = v12;
      v19 = 2117;
      v20 = v13;
      v21 = 2117;
      v22 = v14;
      _os_log_debug_impl(&dword_20E4D9000, v7, OS_LOG_TYPE_DEBUG, "WebsiteNameProvider got metadata for domain \"%{sensitive}@\": siteName: %{sensitive}@, title: %{sensitive}@, originalTitle: %{sensitive}@", (uint8_t *)&v15, 0x2Au);

    }
    objc_msgSend((id)objc_opt_class(), "websiteNameForLinkMetadata:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = WBS_LOG_CHANNEL_PREFIXWebsiteNameProvider();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __70___ASWebsiteNameProvider_fetchWebsiteNameForDomain_completionHandler___block_invoke_cold_2((uint64_t)v8, a1, v9);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    v10 = WBS_LOG_CHANNEL_PREFIXWebsiteNameProvider();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __70___ASWebsiteNameProvider_fetchWebsiteNameForDomain_completionHandler___block_invoke_cold_1(a1, (uint64_t)v6, v10);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

id __66___ASWebsiteNameProvider__trimErrantLeadingAndTrailingCharacters___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "substringFromIndex:", 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __66___ASWebsiteNameProvider__trimErrantLeadingAndTrailingCharacters___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(v2, "substringToIndex:", objc_msgSend(v2, "length") - 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __47___ASWebsiteNameProvider__openDatabaseIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char v4;
  id v5;
  char v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint8_t buf[24];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 24))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    v3 = *(void **)(v2 + 40);
    v9 = 0;
    v4 = objc_msgSend(v3, "openWithAccessType:error:", 1, &v9);
    v5 = v9;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = v4;
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 24))
    {
      v6 = 1;
    }
    else
    {
      v7 = (id)WBS_LOG_CHANNEL_PREFIXWebsiteNameProvider();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v5, "safari_privacyPreservingDescription");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        __47___ASWebsiteNameProvider__openDatabaseIfNeeded__block_invoke_cold_1(v8, buf, v7);
      }

      v6 = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24);
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v6;

  }
}

void __52___ASWebsiteNameProvider_knownWebsiteNameForDomain___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 88), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __52___ASWebsiteNameProvider_knownWebsiteNameForDomain___block_invoke_2(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  SafariShared::WBSSQLiteDatabaseFetch<NSString * const {__strong}&>(*(void **)(a1[4] + 40), CFSTR("SELECT name FROM websiteNames WHERE domain = ?"), a1 + 5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "nextObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringAtIndex:", 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(v7, "statement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

}

void __52___ASWebsiteNameProvider_knownWebsiteNameForDomain___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 80), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __52___ASWebsiteNameProvider_knownWebsiteNameForDomain___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processFetchedMetadataEntry:forDomain:", a2, *(_QWORD *)(a1 + 40));
}

void __71___ASWebsiteNameProvider_fetchOperation_finishedWithResult_completion___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v2, "metadataEntry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(id *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "_cacheFetchedAndKeychainBackedWebsiteName:forDomain:", v5, v3);
  v6 = *(void **)(*(_QWORD *)(a1 + 48) + 104);
  v12[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "knownWebsiteNamesDidChangeOnDomains:", v7);

  objc_msgSend(v4, "updateWebsiteName:", v5);
  v8 = *(void **)(a1 + 56);
  v9 = *(void **)(*(_QWORD *)(a1 + 48) + 56);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __71___ASWebsiteNameProvider_fetchOperation_finishedWithResult_completion___block_invoke_2;
  v10[3] = &unk_24C950528;
  v11 = v8;
  objc_msgSend(v9, "saveMetadataEntry:forDomain:completionHandler:", v4, v3, v10);

}

uint64_t __71___ASWebsiteNameProvider_fetchOperation_finishedWithResult_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __65___ASWebsiteNameProvider__processFetchedMetadataEntry_forDomain___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  if ((objc_msgSend(v3, "isFinished") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32));

  }
  return v4;
}

void __68___ASWebsiteNameProvider__cacheDatabaseBackedWebsiteName_forDomain___block_invoke(uint64_t a1)
{
  id v2;

  if (objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "setObject:forKeyedSubscript:");

  }
}

void __78___ASWebsiteNameProvider__cacheFetchedAndKeychainBackedWebsiteName_forDomain___block_invoke(uint64_t a1)
{
  id v2;

  if (objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "setObject:forKeyedSubscript:");

  }
}

void __54___ASWebsiteNameProvider_debug_deleteAllPersistedData__block_invoke_cold_1(char a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_20E4D9000, a2, OS_LOG_TYPE_DEBUG, "Deleting all persisted data with success: %d", (uint8_t *)v2, 8u);
}

void __70___ASWebsiteNameProvider_fetchWebsiteNameForDomain_completionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138740227;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_20E4D9000, log, OS_LOG_TYPE_ERROR, "Fetch for %{sensitive}@ failed with error %@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_2();
}

void __70___ASWebsiteNameProvider_fetchWebsiteNameForDomain_completionHandler___block_invoke_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a2 + 32);
  v4 = 138740227;
  v5 = a1;
  v6 = 2117;
  v7 = v3;
  _os_log_debug_impl(&dword_20E4D9000, log, OS_LOG_TYPE_DEBUG, "WebsiteNameProvider found \"%{sensitive}@\" as a website name for domain \"%{sensitive}@\", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_2();
}

void __47___ASWebsiteNameProvider__openDatabaseIfNeeded__block_invoke_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_20E4D9000, log, OS_LOG_TYPE_ERROR, "Failed to open database: %{public}@", buf, 0xCu);

}

@end
