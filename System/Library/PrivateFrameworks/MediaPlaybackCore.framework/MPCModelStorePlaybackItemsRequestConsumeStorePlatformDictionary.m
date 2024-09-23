@implementation MPCModelStorePlaybackItemsRequestConsumeStorePlatformDictionary

void ___MPCModelStorePlaybackItemsRequestConsumeStorePlatformDictionary_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  NSObject *v26;
  const __CFString *v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t v45[128];
  uint8_t buf[4];
  const __CFString *v47;
  __int16 v48;
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if (_NSIsNSDictionary())
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSString() && objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDDC628]))
    {
      objc_msgSend(v5, "objectForKey:", CFSTR("downloadAssets"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
        {
          v8 = objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
          v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
          v10 = *(void **)(v9 + 40);
          *(_QWORD *)(v9 + 40) = v8;

        }
        v11 = (void *)objc_msgSend(v5, "mutableCopy");
        objc_msgSend(v11, "removeObjectForKey:", CFSTR("downloadAssets"));
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "replaceObjectAtIndex:withObject:", a3, v11);

      }
      if (_NSIsNSDictionary())
      {
        if (*(_QWORD *)(a1 + 40))
        {
          v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            v13 = *(const __CFString **)(a1 + 88);
            v14 = *(_QWORD *)(a1 + 40);
            *(_DWORD *)buf = 134218242;
            v47 = v13;
            v48 = 2114;
            v49 = v14;
            _os_log_impl(&dword_210BD8000, v12, OS_LOG_TYPE_DEFAULT, "[MPCModelStorePlaybackItemsRequest] Siri asset info - Updating response for item %ld with HLS info: %{public}@", buf, 0x16u);
          }

          v15 = (void *)objc_msgSend(v7, "mutableCopy");
          objc_msgSend(v15, "addEntriesFromDictionary:", *(_QWORD *)(a1 + 40));
          v16 = objc_msgSend(v15, "copy");

          v7 = (void *)v16;
        }
        v38 = v6;
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC88A8]), "initWithItemResponseDictionary:urlBag:", v7, *(_QWORD *)(a1 + 48));
        v40 = objc_alloc_init(MEMORY[0x24BDDCA90]);
        objc_msgSend(v40, "setExpirationDate:", *(_QWORD *)(a1 + 56));
        v39 = v17;
        objc_msgSend(v17, "fileAssets");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
        if (v19)
        {
          v20 = v19;
          v21 = 0;
          v22 = *(_QWORD *)v42;
          do
          {
            for (i = 0; i != v20; ++i)
            {
              if (*(_QWORD *)v42 != v22)
                objc_enumerationMutation(v18);
              v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDCC30]), "initWithiTunesCloudStoreFileAssetInfo:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i));
              if (v24)
              {
                if (!v21)
                  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v18, "count"));
                objc_msgSend(v21, "addObject:", v24);
              }

            }
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
          }
          while (v20);
        }
        else
        {
          v21 = 0;
        }
        objc_msgSend(v40, "setFileAssetInfoList:", v21);
        objc_msgSend(v39, "hlsAsset");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          v27 = CFSTR("contains");
          if (!v25)
            v27 = CFSTR("does not contain");
          *(_DWORD *)buf = 138543362;
          v47 = v27;
          _os_log_impl(&dword_210BD8000, v26, OS_LOG_TYPE_DEFAULT, "[MPCModelStorePlaybackItemsRequest] Siri asset info %{public}@ HLS asset info", buf, 0xCu);
        }

        v6 = v38;
        if (v25)
        {
          v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDCC38]), "initWithiTunesCloudStoreHLSAssetInfo:", v25);
          objc_msgSend(v40, "setHlsAssetInfo:", v28);

        }
        v29 = objc_alloc_init(MEMORY[0x24BDDCC18]);
        objc_msgSend(v29, "setAccountID:", *(_QWORD *)(a1 + 96));
        objc_msgSend(v29, "setRequestType:", 2);
        objc_msgSend(v29, "setStoreSubscriptionAdamID:", *(_QWORD *)(a1 + 88));
        v30 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
        if (!v30)
        {
          v31 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 1);
          v32 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
          v33 = *(void **)(v32 + 40);
          *(_QWORD *)(v32 + 40) = v31;

          v30 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
        }
        objc_msgSend(v30, "setObject:forKey:", v40, v29);
        v34 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
        if (!v34)
        {
          v35 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 1);
          v36 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
          v37 = *(void **)(v36 + 40);
          *(_QWORD *)(v36 + 40) = v35;

          v34 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
        }
        objc_msgSend(v34, "addObject:", v29);

      }
    }

  }
}

@end
