@implementation SGModelAsset

+ (void)registerOnUpdateBlock:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;

  v3 = setup_onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&setup_onceToken, &__block_literal_global_10);
  objc_msgSend((id)_lock, "lock");
  v5 = (void *)_updateBlocks;
  v6 = (void *)MEMORY[0x22075400C](v4);

  objc_msgSend(v5, "addObject:", v6);
  objc_msgSend((id)_lock, "unlock");
}

+ (void)_invokeOnUpdateBlock
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (setup_onceToken != -1)
    dispatch_once(&setup_onceToken, &__block_literal_global_10);
  objc_msgSend((id)_lock, "lock");
  v2 = (void *)objc_msgSend((id)_updateBlocks, "copy");
  objc_msgSend((id)_lock, "unlock");
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * i) + 16))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * i));
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

+ (void)_reset
{
  if (setup_onceToken != -1)
    dispatch_once(&setup_onceToken, &__block_literal_global_10);
  objc_msgSend((id)_lock, "lock");
  objc_msgSend((id)_cache, "removeAllObjects");
  objc_msgSend((id)_lock, "unlock");
}

+ (id)_assetWithName:(id)a3 andLoadBlock:(id)a4
{
  id v5;
  void (**v6)(_QWORD);
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a3;
  v6 = (void (**)(_QWORD))a4;
  if (setup_onceToken != -1)
    dispatch_once(&setup_onceToken, &__block_literal_global_10);
  objc_msgSend((id)_lock, "lock");
  objc_msgSend((id)_cache, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v6[2](v6);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)_cache;
    if (v8)
    {
      v7 = (void *)v8;
      objc_msgSend((id)_cache, "setObject:forKey:", v8, v5);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", v10, v5);

      v7 = 0;
    }
  }
  objc_msgSend((id)_lock, "unlock");
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 == v11)
    v12 = 0;
  else
    v12 = v7;
  v13 = v12;

  return v13;
}

+ (id)rules
{
  return +[SGModelAsset dictionaryWithPlistFilename:](SGModelAsset, "dictionaryWithPlistFilename:", CFSTR("MLModelRules.plist"));
}

+ (id)mappings
{
  return +[SGModelAsset dictionaryWithPlistFilename:](SGModelAsset, "dictionaryWithPlistFilename:", CFSTR("MLModelMappings.plist"));
}

+ (id)quickResponses
{
  return +[SGModelAsset dictionaryWithPlistFilename:](SGModelAsset, "dictionaryWithPlistFilename:", CFSTR("MLQuickResponsesTraining.plist"));
}

+ (id)quickResponsesVocab
{
  return +[SGModelAsset vocabWithTrieFilename:](SGModelAsset, "vocabWithTrieFilename:", CFSTR("MLQuickResponsesTraining.trie"));
}

+ (id)metricsConfig
{
  return +[SGModelAsset dictionaryWithPlistFilename:](SGModelAsset, "dictionaryWithPlistFilename:", CFSTR("MetricsConfig.plist"));
}

+ (id)signatureRules
{
  return +[SGModelAsset dictionaryWithPlistFilename:](SGModelAsset, "dictionaryWithPlistFilename:", CFSTR("SignatureDetectorRules.plist"));
}

+ (id)dpRecorderRules
{
  return +[SGModelAsset dictionaryWithPlistFilename:](SGModelAsset, "dictionaryWithPlistFilename:", CFSTR("DPRecorderRules.plist"));
}

+ (id)nameDetectorRules
{
  return +[SGModelAsset dictionaryWithPlistFilename:](SGModelAsset, "dictionaryWithPlistFilename:", CFSTR("NameDetectorRules.plist"));
}

+ (id)dictionaryWithPlistFilename:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  if (setup_onceToken != -1)
    dispatch_once(&setup_onceToken, &__block_literal_global_10);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44__SGModelAsset_dictionaryWithPlistFilename___block_invoke;
  v7[3] = &unk_24DDC3F78;
  v8 = v3;
  v4 = v3;
  +[SGModelAsset _assetWithName:andLoadBlock:](SGModelAsset, "_assetWithName:andLoadBlock:", v4, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)vocabWithTrieFilename:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  if (setup_onceToken != -1)
    dispatch_once(&setup_onceToken, &__block_literal_global_10);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __38__SGModelAsset_vocabWithTrieFilename___block_invoke;
  v7[3] = &unk_24DDC3F78;
  v8 = v3;
  v4 = v3;
  +[SGModelAsset _assetWithName:andLoadBlock:](SGModelAsset, "_assetWithName:andLoadBlock:", v4, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)asset
{
  if (setup_onceToken != -1)
    dispatch_once(&setup_onceToken, &__block_literal_global_10);
  return (id)_assetInstance;
}

id __38__SGModelAsset_vocabWithTrieFilename___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  +[SGModelAsset asset](SGModelAsset, "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filesystemPathForAssetDataRelativePath:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    +[SGDefaultAssets vocabWithTrieAssetPath:](SGDefaultAssets, "vocabWithTrieAssetPath:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138412290;
      v8 = v6;
      _os_log_error_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Error finding model trie path for %@", (uint8_t *)&v7, 0xCu);
    }
    v4 = 0;
  }

  return v4;
}

id __44__SGModelAsset_dictionaryWithPlistFilename___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  +[SGModelAsset asset](SGModelAsset, "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filesystemPathForAssetDataRelativePath:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    +[SGDefaultAssets dictionaryWithPlistAssetPath:](SGDefaultAssets, "dictionaryWithPlistAssetPath:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138412290;
      v8 = v6;
      _os_log_error_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Error finding model plist path for %@", (uint8_t *)&v7, 0xCu);
    }
    v4 = 0;
  }

  return v4;
}

@end
