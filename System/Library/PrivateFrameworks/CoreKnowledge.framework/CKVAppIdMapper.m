@implementation CKVAppIdMapper

+ (id)convertToUnversalAppId:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  id v9;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[CKVAppIdMapper _getKnownAppIdMap](CKVAppIdMapper, "_getKnownAppIdMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v3;
  if (v5)
  {
    v7 = CKLogContextVocabulary;
    v8 = os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO);
    v6 = v5;
    if (v8)
    {
      v11 = 136315650;
      v12 = "+[CKVAppIdMapper convertToUnversalAppId:]";
      v13 = 2112;
      v14 = v3;
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_1A48B3000, v7, OS_LOG_TYPE_INFO, "%s Convert %@ to a universal appId: %@", (uint8_t *)&v11, 0x20u);
      v6 = v5;
    }
  }
  v9 = v6;

  return v9;
}

+ (BOOL)isKnownAppId:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  objc_msgSend(a1, "_getAllKnownAppIds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

+ (id)_getKnownAppIdMap
{
  if (_getKnownAppIdMap_sharedMapToken != -1)
    dispatch_once(&_getKnownAppIdMap_sharedMapToken, &__block_literal_global_373);
  return (id)_getKnownAppIdMap_sharedMap;
}

+ (id)_buildKnownIdentifierToUniversalOriginAppIdMap
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[6];
  _QWORD v7[7];

  v7[6] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D42B88];
  v6[0] = CFSTR("com.apple.siriVoiceShortcuts");
  v6[1] = CFSTR("com.apple.VoiceShortcuts");
  v7[0] = v2;
  v7[1] = v2;
  v3 = *MEMORY[0x1E0D42B68];
  v6[2] = CFSTR("com.apple.MobileSMS");
  v6[3] = CFSTR("com.apple.iChat");
  v7[2] = v3;
  v7[3] = v3;
  v4 = *MEMORY[0x1E0D42B70];
  v6[4] = CFSTR("com.apple.mobileslideshow");
  v6[5] = CFSTR("com.apple.Photos");
  v7[4] = v4;
  v7[5] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 6);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_getAllKnownAppIds
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__CKVAppIdMapper__getAllKnownAppIds__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_getAllKnownAppIds_sharedSetToken != -1)
    dispatch_once(&_getAllKnownAppIds_sharedSetToken, block);
  return (id)_getAllKnownAppIds_allKnownAppIds;
}

void __36__CKVAppIdMapper__getAllKnownAppIds__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_getKnownAppIdMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v3);

  objc_msgSend(*(id *)(a1 + 32), "_getKnownAppIdMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v5);

  objc_msgSend(v8, "addObject:", *MEMORY[0x1E0D42B38]);
  objc_msgSend(v8, "addObject:", *MEMORY[0x1E0D42B20]);
  objc_msgSend(v8, "addObject:", *MEMORY[0x1E0D42B50]);
  objc_msgSend(v8, "addObject:", *MEMORY[0x1E0D42B60]);
  objc_msgSend(v8, "addObject:", *MEMORY[0x1E0D42B58]);
  objc_msgSend(v8, "addObject:", *MEMORY[0x1E0D42B40]);
  objc_msgSend(v8, "addObject:", *MEMORY[0x1E0D42B80]);
  objc_msgSend(v8, "addObject:", *MEMORY[0x1E0D42B28]);
  objc_msgSend(v8, "addObject:", *MEMORY[0x1E0D42B48]);
  objc_msgSend(v8, "addObject:", *MEMORY[0x1E0D42B90]);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v8);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)_getAllKnownAppIds_allKnownAppIds;
  _getAllKnownAppIds_allKnownAppIds = v6;

}

void __35__CKVAppIdMapper__getKnownAppIdMap__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[CKVAppIdMapper _buildKnownIdentifierToUniversalOriginAppIdMap](CKVAppIdMapper, "_buildKnownIdentifierToUniversalOriginAppIdMap");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_getKnownAppIdMap_sharedMap;
  _getKnownAppIdMap_sharedMap = v0;

}

@end
