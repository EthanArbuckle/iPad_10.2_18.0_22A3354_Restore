@implementation MPCModelGenericAVItemLocalFileLoadOperation

- (MPCModelGenericAVItemLocalFileLoadOperation)initWithEvaluation:(id)a3 properties:(id)a4
{
  id v7;
  id v8;
  MPCModelGenericAVItemLocalFileLoadOperation *v9;
  MPCModelGenericAVItemLocalFileLoadOperation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MPCModelGenericAVItemLocalFileLoadOperation;
  v9 = -[MPAsyncOperation init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fileAssetEvaluation, a3);
    objc_storeStrong((id *)&v10->_assetLoadProperties, a4);
  }

  return v10;
}

- (void)execute
{
  uint64_t v3;
  void (**v4)(void *, _QWORD, id);
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  MPCModelGenericAVItemLocalFileLoadOperation *v21;
  id v22;
  void (**v23)(void *, _QWORD, id);
  _QWORD aBlock[5];

  v3 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__MPCModelGenericAVItemLocalFileLoadOperation_execute__block_invoke;
  aBlock[3] = &unk_24CAB9748;
  aBlock[4] = self;
  v4 = (void (**)(void *, _QWORD, id))_Block_copy(aBlock);
  -[MPCModelGenericAVItemLocalFileLoadOperation assetLoadProperties](self, "assetLoadProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelGenericAVItemLocalFileLoadOperation fileAssetEvaluation](self, "fileAssetEvaluation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "fileIsValid") & 1) != 0)
  {
LABEL_2:
    objc_msgSend(v6, "fileAsset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "fileMatchesRequiredQuality") & 1) == 0
      && ((objc_msgSend(v6, "fileMatchesRequiredQuality") & 1) != 0 || self->_requirePreferredAssetQuality))
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MPCError"), 21, 0);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v4[2](v4, 0, v10);
    }
    else
    {
      objc_msgSend(v7, "filePath");
      v17[0] = v3;
      v17[1] = 3221225472;
      v17[2] = __54__MPCModelGenericAVItemLocalFileLoadOperation_execute__block_invoke_2;
      v17[3] = &unk_24CAB2FA8;
      v18 = (id)objc_claimAutoreleasedReturnValue();
      v19 = v6;
      v8 = v7;
      v20 = v8;
      v21 = self;
      v9 = v5;
      v22 = v9;
      v23 = v4;
      v10 = v18;
      v11 = _Block_copy(v17);
      objc_msgSend(v9, "itemIdentifiers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDCA58]), "initWithFileAsset:sourceItemIdentifiers:", v8, v12);
      objc_msgSend(v13, "setFileAsset:", v8);
      objc_msgSend(v13, "setSourceItemIdentifiers:", v12);
      objc_msgSend(v13, "performWithResponseHandler:", v11);

    }
  }
  else
  {
    switch(objc_msgSend(v6, "status"))
    {
      case 0:
      case 2:
      case 5:
      case 6:
        v14 = (void *)MEMORY[0x24BDD1540];
        v15 = 24;
        break;
      case 3:
        v14 = (void *)MEMORY[0x24BDD1540];
        v15 = 20;
        break;
      case 4:
        v14 = (void *)MEMORY[0x24BDD1540];
        v15 = 22;
        break;
      case 7:
        if (self->_requirePreferredAssetQuality)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 24, CFSTR("File asset not usable for vocal attenuation [HLS file]"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v4[2](v4, 0, v16);

        }
        goto LABEL_2;
      default:
        goto LABEL_2;
    }
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("MPCError"), v15, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v7);
  }

}

- (MPCModelGenericAVItemAssetLoadProperties)assetLoadProperties
{
  return self->_assetLoadProperties;
}

- (MPCAssetLoadPropertiesLocalFileEvaluation)fileAssetEvaluation
{
  return self->_fileAssetEvaluation;
}

- (BOOL)requirePreferredAssetQuality
{
  return self->_requirePreferredAssetQuality;
}

- (void)setRequirePreferredAssetQuality:(BOOL)a3
{
  self->_requirePreferredAssetQuality = a3;
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_fileAssetEvaluation, 0);
  objc_storeStrong((id *)&self->_assetLoadProperties, 0);
}

void __54__MPCModelGenericAVItemLocalFileLoadOperation_execute__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = a3;
  v6 = *(_QWORD **)(a1 + 32);
  v7 = v6[37];
  v10 = v5;
  if (v7)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 296);
    *(_QWORD *)(v8 + 296) = 0;

    v5 = v10;
    v6 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v6, "finishWithError:", v5);

}

void __54__MPCModelGenericAVItemLocalFileLoadOperation_execute__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  MPCModelGenericAVItemAssetLoadResult *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD v45[4];
  id v46;
  char v47;
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  int v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = 0;
  v47 = 0;
  if (a2)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "fileExistsAtPath:isDirectory:", *(_QWORD *)(a1 + 32), &v47))
    {
      if (v47)
        v6 = objc_msgSend(*(id *)(a1 + 40), "fileIsHLS");
      else
        v6 = 1;
    }
    else
    {
      v6 = 0;
    }

  }
  objc_msgSend(*(id *)(a1 + 48), "purchaseBundleFilePath");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (!v6 || !v8)
  {
    v16 = 0;
    if (v6)
      goto LABEL_30;
LABEL_17:
    objc_msgSend(*(id *)(a1 + 64), "assetCacheProvider");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 64), "genericObject");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (MPCModelGenericAVItemAssetLoadResult *)v18;
    if (v17 && v18)
    {
      v45[0] = MEMORY[0x24BDAC760];
      v45[1] = 3221225472;
      v45[2] = __54__MPCModelGenericAVItemLocalFileLoadOperation_execute__block_invoke_8;
      v45[3] = &unk_24CAB9A98;
      v46 = *(id *)(a1 + 72);
      objc_msgSend(v17, "clearPlaybackAssetCacheFileAssetForGenericObject:withCompletionHandler:", v19, v45);
      v20 = v46;
    }
    else
    {
      v21 = *(_QWORD *)(a1 + 72);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MPCError"), 22, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v21 + 16))(v21, 0, v20);
    }
    goto LABEL_42;
  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithContentsOfFile:", v8);
  if (objc_msgSend(v10, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v10, 0, 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!_NSIsNSDictionary()
      || (objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("isPlaceholder")),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_msgSend(v12, "BOOLValue"),
          v12,
          (v13 & 1) != 0))
    {
      v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = *(_QWORD *)(a1 + 56);
        *(_DWORD *)buf = 138543618;
        v49 = v15;
        v50 = 2114;
        v51 = v9;
        _os_log_impl(&dword_210BD8000, v14, OS_LOG_TYPE_ERROR, "[AL] - %{public}@: Skipping local asset [invalid purchase bundle] purchaseBundlePath=%{public}@", buf, 0x16u);
      }

      v16 = 0;
      goto LABEL_17;
    }
    v24 = v11;
    v16 = v24;
  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 40), "fileIsCached"))
    {
      if ((objc_msgSend(*(id *)(a1 + 40), "fileIsHLS") & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 64), "fileAsset");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "protectionType");

        if (v23)
          v6 = 0;
      }
    }
    v24 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138543874;
      v49 = v25;
      v50 = 2114;
      v51 = v9;
      v52 = 1024;
      v53 = v6;
      _os_log_impl(&dword_210BD8000, v24, OS_LOG_TYPE_DEFAULT, "[AL] - %{public}@: Skipping purchase bundle [data at path has length zero] purchaseBundlePath=%{public}@ isValidAsset=%{BOOL}u", buf, 0x1Cu);
    }
    v16 = 0;
  }

  if (!v6)
    goto LABEL_17;
LABEL_30:
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", *(_QWORD *)(a1 + 32), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_alloc_init(MPCModelGenericAVItemAssetLoadResult);
  -[MPCModelGenericAVItemAssetLoadResult setAssetURL:](v19, "setAssetURL:", v17);
  objc_msgSend(v17, "pathExtension");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelGenericAVItemAssetLoadResult setAssetPathExtension:](v19, "setAssetPathExtension:", v26);

  -[MPCModelGenericAVItemAssetLoadResult setAssetQualityType:](v19, "setAssetQualityType:", objc_msgSend(*(id *)(a1 + 48), "qualityType"));
  -[MPCModelGenericAVItemAssetLoadResult setPurchaseBundleDictionary:](v19, "setPurchaseBundleDictionary:", v16);
  -[MPCModelGenericAVItemAssetLoadResult setIsHLSAsset:](v19, "setIsHLSAsset:", objc_msgSend(*(id *)(a1 + 40), "fileIsHLS"));
  v27 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(*(id *)(a1 + 48), "hlsKeyServerURL");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "URLWithString:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelGenericAVItemAssetLoadResult setStreamingKeyServerURL:](v19, "setStreamingKeyServerURL:", v29);

  v30 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(*(id *)(a1 + 48), "hlsKeyCertificateURL");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "URLWithString:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelGenericAVItemAssetLoadResult setStreamingKeyCertificateURL:](v19, "setStreamingKeyCertificateURL:", v32);

  objc_msgSend(*(id *)(a1 + 48), "hlsKeyServerProtocol");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelGenericAVItemAssetLoadResult setKeyServerProtocolType:](v19, "setKeyServerProtocolType:", v33);

  -[MPCModelGenericAVItemAssetLoadResult setAudioAssetType:](v19, "setAudioAssetType:", objc_msgSend(*(id *)(a1 + 40), "fileAssetType"));
  -[MPCModelGenericAVItemAssetLoadResult setDownloadedAsset:](v19, "setDownloadedAsset:", objc_msgSend(*(id *)(a1 + 40), "fileIsDownloaded"));
  -[MPCModelGenericAVItemAssetLoadResult setSource:](v19, "setSource:", 1);
  v34 = objc_msgSend(*(id *)(a1 + 40), "fileIsHLS");
  v35 = *(void **)(a1 + 48);
  if (v34)
  {
    objc_msgSend(v35, "hlsKeyServerProtocol");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v36, "isEqualToString:", *MEMORY[0x24BDDC5F0]) & 1) != 0)
      v37 = 2;
    else
      v37 = objc_msgSend(*(id *)(a1 + 48), "protectionType");

  }
  else
  {
    v37 = objc_msgSend(v35, "protectionType");
  }
  -[MPCModelGenericAVItemAssetLoadResult setAssetProtectionType:](v19, "setAssetProtectionType:", v37);
  objc_msgSend(*(id *)(a1 + 64), "genericObject");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "identifiers");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "universalStore");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "assetAdamID");

  if (v40)
    goto LABEL_40;
  objc_msgSend(v20, "universalStore");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v41, "subscriptionAdamID");

  if (v40)
    goto LABEL_40;
  objc_msgSend(v20, "universalStore");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v42, "adamID");

  if (v40
    || (objc_msgSend(v20, "universalStore"),
        v43 = (void *)objc_claimAutoreleasedReturnValue(),
        v40 = objc_msgSend(v43, "reportingAdamID"),
        v43,
        v40))
  {
LABEL_40:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v40);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelGenericAVItemAssetLoadResult setStreamingKeyAdamID:](v19, "setStreamingKeyAdamID:", v44);

  }
  (*(void (**)(_QWORD, MPCModelGenericAVItemAssetLoadResult *, _QWORD))(*(_QWORD *)(a1 + 72) + 16))(*(_QWORD *)(a1 + 72), v19, 0);
LABEL_42:

}

void __54__MPCModelGenericAVItemLocalFileLoadOperation_execute__block_invoke_8(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MPCError"), 22, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

@end
