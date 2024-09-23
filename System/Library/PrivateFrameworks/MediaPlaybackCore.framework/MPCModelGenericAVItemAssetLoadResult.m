@implementation MPCModelGenericAVItemAssetLoadResult

+ (id)assetLoadResultWithStoreAssetPlaybackResponse:(id)a3 assetLoadProperties:(id)a4 source:(int64_t)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  id v42;
  int v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  uint64_t i;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  uint64_t j;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  int v76;
  uint64_t v77;
  uint64_t v78;
  id v80;
  id v81;
  void *v82;
  int64_t v83;
  _QWORD v85[4];
  id v86;
  id v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _QWORD v92[4];
  id v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  _QWORD v98[4];
  id v99;
  const __CFString *v100;
  id v101;
  _BYTE v102[128];
  _BYTE v103[128];
  uint64_t v104;

  v104 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v83 = a5;
  if (objc_msgSend(v9, "isLiveRadioStream"))
  {
    v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v12 = v10;
    if (objc_msgSend(v10, "prefersHighQualityContent"))
      objc_msgSend(v11, "addObject:", &unk_24CB16908);
    objc_msgSend(v11, "addObject:", &unk_24CB16920);
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("flavor IN %@ AND streamURL != nil"), v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "radioStreamAssetInfoList");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "filteredArrayUsingPredicate:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "mutableCopy");

    v98[0] = MEMORY[0x24BDAC760];
    v98[1] = 3221225472;
    v98[2] = __119__MPCModelGenericAVItemAssetLoadResult_assetLoadResultWithStoreAssetPlaybackResponse_assetLoadProperties_source_error___block_invoke;
    v98[3] = &unk_24CAB2568;
    v99 = v11;
    v17 = v11;
    objc_msgSend(v16, "sortUsingComparator:", v98);
    objc_msgSend(v16, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18
      || (objc_msgSend(v9, "radioStreamAssetInfoList"),
          v19 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v19, "firstObject"),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          v19,
          v18))
    {
      v20 = objc_alloc_init((Class)a1);
      objc_msgSend(v18, "streamURL");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setAssetURL:", v21);

      objc_msgSend(v18, "keyServerURL");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setStreamingKeyServerURL:", v22);

      objc_msgSend(v18, "keyCertificateURL");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setStreamingKeyCertificateURL:", v23);

      objc_msgSend(v20, "setITunesStoreStream:", objc_msgSend(v18, "isiTunesStoreStream"));
      objc_msgSend(v20, "setAllowsAssetInfoCaching:", 1);
      objc_msgSend(v20, "setIsCloudStreamingAsset:", 1);
      objc_msgSend(v20, "setIsHLSAsset:", objc_msgSend(v18, "streamProtocol") == 1);
      if (objc_msgSend(v20, "isHLSAsset"))
      {
        objc_msgSend(v9, "hlsAssetInfo");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "keyServerAdamID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setStreamingKeyAdamID:", v25);

        objc_msgSend(v24, "keyServerProtocolType");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setKeyServerProtocolType:", v26);

      }
    }
    else
    {
      v20 = 0;
    }

    v10 = v12;
    a5 = v83;
    if (v20)
      goto LABEL_22;
  }
  if ((objc_msgSend(v10, "allowsHLSContent") & 1) == 0 && objc_msgSend(v10, "preferredAudioAssetType") < 2)
    goto LABEL_23;
  objc_msgSend(v9, "hlsAssetInfo");
  v27 = objc_claimAutoreleasedReturnValue();
  if (!v27)
    goto LABEL_23;
  v28 = (void *)v27;
  v20 = objc_alloc_init((Class)a1);
  objc_msgSend(v28, "playlistURL");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAssetURL:", v29);

  objc_msgSend(v28, "keyServerURL");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setStreamingKeyServerURL:", v30);

  objc_msgSend(v28, "keyCertificateURL");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setStreamingKeyCertificateURL:", v31);

  objc_msgSend(v28, "keyServerProtocolType");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setKeyServerProtocolType:", v32);

  objc_msgSend(v20, "setITunesStoreStream:", objc_msgSend(v28, "isiTunesStoreStream"));
  objc_msgSend(v28, "alternatePlaylistURL");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAlternateHLSPlaylistURL:", v33);

  objc_msgSend(v28, "alternateKeyServerURL");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAlternateHLSKeyServerURL:", v34);

  objc_msgSend(v28, "alternateKeyCertificateURL");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAlternateHLSKeyCertificateURL:", v35);

  objc_msgSend(v20, "setIsHLSAsset:", 1);
  objc_msgSend(v20, "setAllowsAssetInfoCaching:", 1);
  objc_msgSend(v20, "setIsCloudStreamingAsset:", 1);
  objc_msgSend(v20, "setAssetPathExtension:", *MEMORY[0x24BEC8590]);
  objc_msgSend(v20, "setAssetQualityType:", 2);
  objc_msgSend(v28, "keyServerAdamID");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setStreamingKeyAdamID:", v36);

  objc_msgSend(v20, "setAllowsAssetCaching:", objc_msgSend(v10, "prefersVideoContent") ^ 1);
  objc_msgSend(v10, "storeAsset");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "endpointType");

  if ((unint64_t)(v38 - 1) >= 2)
  {
    v40 = v38 == 3 ? 2 : 0;
  }
  else
  {
    objc_msgSend(v28, "keyServerProtocolType");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "isEqualToString:", *MEMORY[0x24BDDC5F0]) ? 2 : 1;

  }
  objc_msgSend(v20, "setAssetProtectionType:", v40);

  if (v20)
  {
LABEL_22:
    v41 = 0;
  }
  else
  {
LABEL_23:
    v42 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v43 = objc_msgSend(v10, "prefersHighQualityContent");
    if (objc_msgSend(v10, "prefersVideoContent"))
    {
      if (v43)
      {
        objc_msgSend(v42, "addObject:", &unk_24CB16938);
        objc_msgSend(v42, "addObject:", &unk_24CB16950);
      }
      objc_msgSend(v42, "addObject:", &unk_24CB16968);
    }
    v81 = v10;
    if (v43)
    {
      objc_msgSend(v42, "addObject:", &unk_24CB16980);
      objc_msgSend(v42, "addObject:", &unk_24CB16998);
    }
    objc_msgSend(v42, "addObject:", &unk_24CB169B0);
    objc_msgSend(v42, "addObject:", &unk_24CB169C8);
    v96 = 0u;
    v97 = 0u;
    v94 = 0u;
    v95 = 0u;
    v82 = v9;
    objc_msgSend(v9, "fileAssetInfoList");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v94, v103, 16);
    if (v45)
    {
      v46 = v45;
      v47 = 0;
      v48 = *(_QWORD *)v95;
      do
      {
        for (i = 0; i != v46; ++i)
        {
          if (*(_QWORD *)v95 != v48)
            objc_enumerationMutation(v44);
          v50 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * i);
          objc_msgSend(v50, "assetURL");
          v51 = (void *)objc_claimAutoreleasedReturnValue();

          if (v51)
          {
            if (!v47)
              v47 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
            objc_msgSend(v47, "addObject:", v50);
          }
        }
        v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v94, v103, 16);
      }
      while (v46);
    }
    else
    {
      v47 = 0;
    }

    v92[0] = MEMORY[0x24BDAC760];
    v92[1] = 3221225472;
    v92[2] = __119__MPCModelGenericAVItemAssetLoadResult_assetLoadResultWithStoreAssetPlaybackResponse_assetLoadProperties_source_error___block_invoke_13;
    v92[3] = &unk_24CAB2590;
    v52 = v42;
    v93 = v52;
    objc_msgSend(v47, "sortUsingComparator:", v92);
    objc_msgSend(v47, "firstObject");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (v53)
    {
      v80 = v52;
      v20 = objc_alloc_init((Class)a1);
      objc_msgSend(v53, "assetURL");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setAssetURL:", v54);

      v55 = objc_msgSend(v53, "flavorType");
      v56 = objc_msgSend(v47, "count");
      if (v55 == 101 || v55 == 102 || v55 == 202 || v55 == 203 || v56 == 1)
        v61 = 2;
      else
        v61 = 1;
      objc_msgSend(v20, "setAssetQualityType:", v61);
      objc_msgSend(v53, "fileExtension");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setAssetPathExtension:", v62);

      objc_msgSend(v20, "setIsCloudStreamingAsset:", 1);
      objc_msgSend(v20, "setOnlineSubscriptionKeysRequired:", objc_msgSend(v82, "onlineSubscriptionKeysRequired"));
      v90 = 0u;
      v91 = 0u;
      v88 = 0u;
      v89 = 0u;
      objc_msgSend(v53, "fairPlayInfoList");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v88, v102, 16);
      if (v64)
      {
        v65 = v64;
        v66 = 0;
        v67 = *(_QWORD *)v89;
        do
        {
          for (j = 0; j != v65; ++j)
          {
            if (*(_QWORD *)v89 != v67)
              objc_enumerationMutation(v63);
            objc_msgSend(*(id *)(*((_QWORD *)&v88 + 1) + 8 * j), "purchaseBundleSinfDictionary");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v69, "count"))
            {
              if (!v66)
                v66 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
              objc_msgSend(v66, "addObject:", v69);
            }

          }
          v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v88, v102, 16);
        }
        while (v65);
      }
      else
      {
        v66 = 0;
      }

      v10 = v81;
      if (objc_msgSend(v66, "count"))
      {
        v100 = CFSTR("sinfs");
        v101 = v66;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v101, &v100, 1);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setPurchaseBundleDictionary:", v71);

      }
      v72 = objc_msgSend(v53, "protectionType");
      if (v72 == 3)
        v73 = 2;
      else
        v73 = v72 == 2;
      objc_msgSend(v20, "setAssetProtectionType:", v73);
      v9 = v82;
      objc_msgSend(v82, "suzeLeaseID");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setSuzeLeaseID:", v74);
      objc_msgSend(v20, "setAllowsAssetInfoCaching:", v74 == 0);
      v75 = objc_msgSend(v53, "protectionType");
      if (!v74 && v75 != 4)
        objc_msgSend(v20, "setAllowsAssetCaching:", 1);
      v85[0] = MEMORY[0x24BDAC760];
      v85[1] = 3221225472;
      v85[2] = __119__MPCModelGenericAVItemAssetLoadResult_assetLoadResultWithStoreAssetPlaybackResponse_assetLoadProperties_source_error___block_invoke_2;
      v85[3] = &unk_24CABA1D0;
      v86 = v53;
      v87 = v82;
      objc_msgSend(v20, "setWillBecomeActivePlayerItemHandler:", v85);

      v41 = 0;
      v52 = v80;
    }
    else
    {
      v70 = (void *)MEMORY[0x24BDD1540];
      v9 = v82;
      objc_msgSend(v82, "fileAssetInfoList");
      v66 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 15, CFSTR("Playback response has no valid file asset: %@"), v66);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 0;
      v10 = v81;
    }

    a5 = v83;
  }
  v76 = objc_msgSend(v20, "isHLSAsset");
  v77 = objc_msgSend(v10, "preferredAudioAssetType");
  if (v76)
  {
    if (v77 < 2)
      v78 = 2;
    else
      v78 = objc_msgSend(v10, "preferredAudioAssetType");
  }
  else
  {
    v78 = v77 != 0;
  }
  objc_msgSend(v20, "setAudioAssetType:", v78);
  objc_msgSend(v20, "setSource:", a5);
  if (a6)
    *a6 = objc_retainAutorelease(v41);

  return v20;
}

uint64_t __119__MPCModelGenericAVItemAssetLoadResult_assetLoadResultWithStoreAssetPlaybackResponse_assetLoadProperties_source_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;

  v5 = *(void **)(a1 + 32);
  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a3;
  objc_msgSend(v6, "numberWithInteger:", objc_msgSend(a2, "flavor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "indexOfObject:", v8);

  v10 = *(void **)(a1 + 32);
  v11 = (void *)MEMORY[0x24BDD16E0];
  v12 = objc_msgSend(v7, "flavor");

  objc_msgSend(v11, "numberWithInteger:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v10, "indexOfObject:", v13);

  v15 = -1;
  if (v9 >= v14)
    v15 = 1;
  if (v9 == v14)
    return 0;
  else
    return v15;
}

uint64_t __119__MPCModelGenericAVItemAssetLoadResult_assetLoadResultWithStoreAssetPlaybackResponse_assetLoadProperties_source_error___block_invoke_13(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;

  v5 = *(void **)(a1 + 32);
  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a3;
  objc_msgSend(v6, "numberWithInteger:", objc_msgSend(a2, "flavorType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "indexOfObject:", v8);

  v10 = *(void **)(a1 + 32);
  v11 = (void *)MEMORY[0x24BDD16E0];
  v12 = objc_msgSend(v7, "flavorType");

  objc_msgSend(v11, "numberWithInteger:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v10, "indexOfObject:", v13);

  v15 = -1;
  if (v9 >= v14)
    v15 = 1;
  if (v9 == v14)
    return 0;
  else
    return v15;
}

void __119__MPCModelGenericAVItemAssetLoadResult_assetLoadResultWithStoreAssetPlaybackResponse_assetLoadProperties_source_error___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDDCC10], "sharedCache");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateForPlaybackOfFileAsset:fromResponse:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (BOOL)hasValidAsset
{
  void *v2;
  BOOL v3;

  -[MPCModelGenericAVItemAssetLoadResult assetURL](self, "assetURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[MPCModelGenericAVItemAssetLoadResult descriptionDictionary](self, "descriptionDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)descriptionDictionary
{
  void *v3;
  const __CFString *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  int64_t v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  _QWORD v55[8];

  v55[7] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 3);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDD17C8];
  if (-[MPCModelGenericAVItemAssetLoadResult allowsAssetCaching](self, "allowsAssetCaching"))
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("allows caching: %@"), v4);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v53;
  v5 = (void *)MEMORY[0x24BDD17C8];
  if (-[MPCModelGenericAVItemAssetLoadResult isHLSAsset](self, "isHLSAsset"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v5, "stringWithFormat:", CFSTR("HLS: %@"), v6);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = v52;
  v7 = (void *)MEMORY[0x24BDD17C8];
  if (-[MPCModelGenericAVItemAssetLoadResult isCloudStreamingAsset](self, "isCloudStreamingAsset"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  objc_msgSend(v7, "stringWithFormat:", CFSTR("cloud streaming: %@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v55[2] = v9;
  v10 = (void *)MEMORY[0x24BDD17C8];
  if (-[MPCModelGenericAVItemAssetLoadResult onlineSubscriptionKeysRequired](self, "onlineSubscriptionKeysRequired"))
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  objc_msgSend(v10, "stringWithFormat:", CFSTR("online keys required: %@"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v55[3] = v12;
  v13 = (void *)MEMORY[0x24BDD17C8];
  -[MPCModelGenericAVItemAssetLoadResult assetPathExtension](self, "assetPathExtension");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  v16 = CFSTR("N/A");
  if (v14)
    v16 = (const __CFString *)v14;
  objc_msgSend(v13, "stringWithFormat:", CFSTR("path extension: %@"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v55[4] = v17;
  v18 = (void *)MEMORY[0x24BDD17C8];
  v19 = -[MPCModelGenericAVItemAssetLoadResult audioAssetType](self, "audioAssetType");
  if ((unint64_t)(v19 - 1) > 4)
    v20 = CFSTR("Unspecified");
  else
    v20 = off_24CAB25B0[v19 - 1];
  objc_msgSend(v18, "stringWithFormat:", CFSTR("audio asset type: %@"), v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v55[5] = v21;
  v22 = (void *)MEMORY[0x24BDD17C8];
  if (-[MPCModelGenericAVItemAssetLoadResult isDownloadedAsset](self, "isDownloadedAsset"))
    v23 = CFSTR("YES");
  else
    v23 = CFSTR("NO");
  objc_msgSend(v22, "stringWithFormat:", CFSTR("downloaded: %@"), v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v55[6] = v24;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v55, 7);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "componentsJoinedByString:", CFSTR(" - "));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setObject:forKeyedSubscript:", v26, CFSTR("Overview"));

  -[MPCModelGenericAVItemAssetLoadResult purchaseBundleDictionary](self, "purchaseBundleDictionary");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    -[MPCModelGenericAVItemAssetLoadResult purchaseBundleDictionary](self, "purchaseBundleDictionary");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setObject:forKeyedSubscript:", v28, CFSTR("Purchase bundle dictionary"));

  }
  -[MPCModelGenericAVItemAssetLoadResult assetURL](self, "assetURL");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29
    || (-[MPCModelGenericAVItemAssetLoadResult alternateHLSPlaylistURL](self, "alternateHLSPlaylistURL"),
        (v29 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

  }
  else
  {
    -[MPCModelGenericAVItemAssetLoadResult protectedContentSupportStorageFileURL](self, "protectedContentSupportStorageFileURL");
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v50)
      goto LABEL_27;
  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 3);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelGenericAVItemAssetLoadResult assetURL](self, "assetURL");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setObject:forKeyedSubscript:", v31, CFSTR("assetURL"));

  -[MPCModelGenericAVItemAssetLoadResult alternateHLSPlaylistURL](self, "alternateHLSPlaylistURL");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setObject:forKeyedSubscript:", v32, CFSTR("alt. HLS playlist URL"));

  -[MPCModelGenericAVItemAssetLoadResult protectedContentSupportStorageFileURL](self, "protectedContentSupportStorageFileURL");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setObject:forKeyedSubscript:", v33, CFSTR("protected content support storage URL"));

  objc_msgSend(v54, "setObject:forKeyedSubscript:", v30, CFSTR("URLs"));
LABEL_27:
  -[MPCModelGenericAVItemAssetLoadResult streamingKeyCertificateURL](self, "streamingKeyCertificateURL");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34
    || (-[MPCModelGenericAVItemAssetLoadResult alternateHLSKeyCertificateURL](self, "alternateHLSKeyCertificateURL"),
        (v34 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    || (-[MPCModelGenericAVItemAssetLoadResult streamingKeyServerURL](self, "streamingKeyServerURL"),
        (v34 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

  }
  else
  {
    -[MPCModelGenericAVItemAssetLoadResult alternateHLSKeyServerURL](self, "alternateHLSKeyServerURL");
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v51)
      goto LABEL_44;
  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 6);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelGenericAVItemAssetLoadResult streamingKeyCertificateURL](self, "streamingKeyCertificateURL");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    -[MPCModelGenericAVItemAssetLoadResult streamingKeyCertificateURL](self, "streamingKeyCertificateURL");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setObject:forKeyedSubscript:", v37, CFSTR("key certificate URL"));

  }
  -[MPCModelGenericAVItemAssetLoadResult streamingKeyServerURL](self, "streamingKeyServerURL");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    -[MPCModelGenericAVItemAssetLoadResult streamingKeyServerURL](self, "streamingKeyServerURL");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setObject:forKeyedSubscript:", v39, CFSTR("key server URL"));

  }
  -[MPCModelGenericAVItemAssetLoadResult alternateHLSKeyCertificateURL](self, "alternateHLSKeyCertificateURL");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    -[MPCModelGenericAVItemAssetLoadResult alternateHLSKeyCertificateURL](self, "alternateHLSKeyCertificateURL");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setObject:forKeyedSubscript:", v41, CFSTR("alt. HLS key certificate URL"));

  }
  -[MPCModelGenericAVItemAssetLoadResult alternateHLSKeyServerURL](self, "alternateHLSKeyServerURL");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    -[MPCModelGenericAVItemAssetLoadResult alternateHLSKeyServerURL](self, "alternateHLSKeyServerURL");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setObject:forKeyedSubscript:", v43, CFSTR("alt. HLS key server URL"));

  }
  -[MPCModelGenericAVItemAssetLoadResult keyServerProtocolType](self, "keyServerProtocolType");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    -[MPCModelGenericAVItemAssetLoadResult keyServerProtocolType](self, "keyServerProtocolType");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setObject:forKeyedSubscript:", v45, CFSTR("key server protocol type"));

  }
  -[MPCModelGenericAVItemAssetLoadResult streamingKeyAdamID](self, "streamingKeyAdamID");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    -[MPCModelGenericAVItemAssetLoadResult streamingKeyAdamID](self, "streamingKeyAdamID");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setObject:forKeyedSubscript:", v47, CFSTR("streaming key adam ID"));

  }
  objc_msgSend(v54, "setObject:forKeyedSubscript:", v35, CFSTR("SKD"));

LABEL_44:
  v48 = (void *)objc_msgSend(v54, "copy");

  return v48;
}

- (BOOL)allowsAssetCaching
{
  return self->_allowsAssetCaching;
}

- (void)setAllowsAssetCaching:(BOOL)a3
{
  self->_allowsAssetCaching = a3;
}

- (BOOL)allowsAssetInfoCaching
{
  return self->_allowsAssetInfoCaching;
}

- (void)setAllowsAssetInfoCaching:(BOOL)a3
{
  self->_allowsAssetInfoCaching = a3;
}

- (NSString)assetPathExtension
{
  return self->_assetPathExtension;
}

- (void)setAssetPathExtension:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)assetProtectionType
{
  return self->_assetProtectionType;
}

- (void)setAssetProtectionType:(int64_t)a3
{
  self->_assetProtectionType = a3;
}

- (int64_t)assetQualityType
{
  return self->_assetQualityType;
}

- (void)setAssetQualityType:(int64_t)a3
{
  self->_assetQualityType = a3;
}

- (NSURL)assetURL
{
  return self->_assetURL;
}

- (void)setAssetURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)isHomeSharingAsset
{
  return self->_isHomeSharingAsset;
}

- (void)setIsHomeSharingAsset:(BOOL)a3
{
  self->_isHomeSharingAsset = a3;
}

- (BOOL)isHLSAsset
{
  return self->_isHLSAsset;
}

- (void)setIsHLSAsset:(BOOL)a3
{
  self->_isHLSAsset = a3;
}

- (BOOL)isCloudStreamingAsset
{
  return self->_isCloudStreamingAsset;
}

- (void)setIsCloudStreamingAsset:(BOOL)a3
{
  self->_isCloudStreamingAsset = a3;
}

- (BOOL)onlineSubscriptionKeysRequired
{
  return self->_onlineSubscriptionKeysRequired;
}

- (void)setOnlineSubscriptionKeysRequired:(BOOL)a3
{
  self->_onlineSubscriptionKeysRequired = a3;
}

- (NSURL)protectedContentSupportStorageFileURL
{
  return self->_protectedContentSupportStorageFileURL;
}

- (void)setProtectedContentSupportStorageFileURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDictionary)purchaseBundleDictionary
{
  return self->_purchaseBundleDictionary;
}

- (void)setPurchaseBundleDictionary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSURL)streamingKeyCertificateURL
{
  return self->_streamingKeyCertificateURL;
}

- (void)setStreamingKeyCertificateURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSURL)streamingKeyServerURL
{
  return self->_streamingKeyServerURL;
}

- (void)setStreamingKeyServerURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)keyServerProtocolType
{
  return self->_keyServerProtocolType;
}

- (void)setKeyServerProtocolType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)streamingKeyAdamID
{
  return self->_streamingKeyAdamID;
}

- (void)setStreamingKeyAdamID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSURL)alternateHLSPlaylistURL
{
  return self->_alternateHLSPlaylistURL;
}

- (void)setAlternateHLSPlaylistURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSURL)alternateHLSKeyServerURL
{
  return self->_alternateHLSKeyServerURL;
}

- (void)setAlternateHLSKeyServerURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSURL)alternateHLSKeyCertificateURL
{
  return self->_alternateHLSKeyCertificateURL;
}

- (void)setAlternateHLSKeyCertificateURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (id)suzeLeaseID
{
  return self->_suzeLeaseID;
}

- (void)setSuzeLeaseID:(id)a3
{
  objc_storeStrong(&self->_suzeLeaseID, a3);
}

- (BOOL)isiTunesStoreStream
{
  return self->_iTunesStoreStream;
}

- (void)setITunesStoreStream:(BOOL)a3
{
  self->_iTunesStoreStream = a3;
}

- (id)willBecomeActivePlayerItemHandler
{
  return self->_willBecomeActivePlayerItemHandler;
}

- (void)setWillBecomeActivePlayerItemHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (int64_t)audioAssetType
{
  return self->_audioAssetType;
}

- (void)setAudioAssetType:(int64_t)a3
{
  self->_audioAssetType = a3;
}

- (BOOL)isDownloadedAsset
{
  return self->_downloadedAsset;
}

- (void)setDownloadedAsset:(BOOL)a3
{
  self->_downloadedAsset = a3;
}

- (int64_t)source
{
  return self->_source;
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_willBecomeActivePlayerItemHandler, 0);
  objc_storeStrong(&self->_suzeLeaseID, 0);
  objc_storeStrong((id *)&self->_alternateHLSKeyCertificateURL, 0);
  objc_storeStrong((id *)&self->_alternateHLSKeyServerURL, 0);
  objc_storeStrong((id *)&self->_alternateHLSPlaylistURL, 0);
  objc_storeStrong((id *)&self->_streamingKeyAdamID, 0);
  objc_storeStrong((id *)&self->_keyServerProtocolType, 0);
  objc_storeStrong((id *)&self->_streamingKeyServerURL, 0);
  objc_storeStrong((id *)&self->_streamingKeyCertificateURL, 0);
  objc_storeStrong((id *)&self->_purchaseBundleDictionary, 0);
  objc_storeStrong((id *)&self->_protectedContentSupportStorageFileURL, 0);
  objc_storeStrong((id *)&self->_assetURL, 0);
  objc_storeStrong((id *)&self->_assetPathExtension, 0);
}

@end
