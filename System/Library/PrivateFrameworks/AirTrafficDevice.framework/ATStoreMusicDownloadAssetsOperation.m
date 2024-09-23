@implementation ATStoreMusicDownloadAssetsOperation

- (void)execute
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint8_t buf[4];
  ATStoreMusicDownloadAssetsOperation *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (-[ATStoreMusicDownloadAssetsOperation isCancelled](self, "isCancelled"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 2, 0);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    -[ATStoreMusicDownloadAssetsOperation finishWithError:operationResult:](self, "finishWithError:operationResult:");

  }
  else
  {
    -[ATStoreDownloadOperation asset](self, "asset");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    _ATLogCategoryStoreDownloads();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v26 = self;
      v27 = 2114;
      v28 = (uint64_t)v3;
      _os_log_impl(&dword_1D1868000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ starting download phase for asset %{public}@", buf, 0x16u);
    }

    -[ATStoreDownloadAssetsOperation prepareOperationResult](self, "prepareOperationResult");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "requestContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[ATStoreDownloadAssetsOperation prepareOperationResult](self, "prepareOperationResult");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "storeMediaResponseItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "downloadableAsset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hlsAsset");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9
      || (objc_msgSend(v10, "playlistURL"), v12 = (void *)objc_claimAutoreleasedReturnValue(), v12, v12))
    {
      v13 = objc_msgSend(v9, "fileSize");
      _ATLogCategoryStoreDownloads();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v26 = self;
        v27 = 2048;
        v28 = v13;
        _os_log_impl(&dword_1D1868000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ downloadable asset size=%lld", buf, 0x16u);
      }

      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __46__ATStoreMusicDownloadAssetsOperation_execute__block_invoke;
      v18[3] = &unk_1E927DE88;
      v24 = v13;
      v18[4] = self;
      v19 = v6;
      v20 = v8;
      v21 = v3;
      v22 = v11;
      v23 = v9;
      -[ATStoreMusicDownloadAssetsOperation _getStorageSpaceAvailableForMediaResponseItem:completion:](self, "_getStorageSpaceAvailableForMediaResponseItem:completion:", v20, v18);

    }
    else
    {
      _ATLogCategoryStoreDownloads();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v26 = self;
        _os_log_impl(&dword_1D1868000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ no asset found in prepare response - stopping", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 26, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATStoreMusicDownloadAssetsOperation finishWithError:operationResult:](self, "finishWithError:operationResult:", v16, 0);

    }
  }
}

- (void)cancel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ATStoreMusicDownloadAssetsOperation;
  -[ATStoreMusicDownloadAssetsOperation cancel](&v3, sel_cancel);
  -[ICMediaAssetDownloadRequest cancel](self->_assetDownloadRequest, "cancel");
}

- (void)finishWithError:(id)a3 operationResult:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  ICMediaAssetDownloadRequest *assetDownloadRequest;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  v9 = v8;
  if (!v8)
  {
    if (-[ATStoreMusicDownloadAssetsOperation isCancelled](self, "isCancelled"))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 2, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)ATStoreMusicDownloadAssetsOperation;
  -[ATStoreDownloadOperation finishWithError:operationResult:](&v11, sel_finishWithError_operationResult_, v9, v7);
  assetDownloadRequest = self->_assetDownloadRequest;
  self->_assetDownloadRequest = 0;

}

- (void)_getStorageSpaceAvailableForMediaResponseItem:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, uint64_t);
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  void (**v13)(id, uint64_t);

  v5 = a3;
  v6 = (void (**)(id, uint64_t))a4;
  objc_msgSend(MEMORY[0x1E0DDBF50], "currentDeviceInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isWatch");

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0DDC068], "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, objc_msgSend(v9, "storageSpaceAvailable"));
  }
  else
  {
    objc_msgSend(v5, "downloadableAsset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "fileSize");
    objc_msgSend(MEMORY[0x1E0DDC068], "sharedManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __96__ATStoreMusicDownloadAssetsOperation__getStorageSpaceAvailableForMediaResponseItem_completion___block_invoke;
    v12[3] = &unk_1E927E288;
    v13 = v6;
    objc_msgSend(v11, "ensureStorageIsAvailable:withCompletionHandler:", v10, v12);

  }
}

- (unint64_t)_minimumBitrateForResolutionPreference:(int64_t)a3
{
  unint64_t result;

  result = a3;
  if (a3 <= 255)
  {
    if (a3 && a3 != 64)
      return 256;
  }
  else if (a3 != 256)
  {
    if (a3 != 192000)
      return 256;
    return 512;
  }
  return result;
}

- (unint64_t)_maximumSampleRateForResolutionPreference:(int64_t)a3
{
  unint64_t v3;

  if (a3 == 48000)
    v3 = 48000;
  else
    v3 = 0;
  if (a3 == 192000)
    return 192000;
  else
    return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetDownloadRequest, 0);
}

uint64_t __96__ATStoreMusicDownloadAssetsOperation__getStorageSpaceAvailableForMediaResponseItem_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __46__ATStoreMusicDownloadAssetsOperation_execute__block_invoke(uint64_t a1, unint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  int v26;
  void *v27;
  int v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  int v36;
  unsigned int v37;
  uint64_t v38;
  int v39;
  NSObject *v40;
  uint64_t v41;
  _QWORD *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  __CFString *v57;
  void *v58;
  char v59;
  __CFString *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  NSObject *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  NSObject *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  id v84;
  uint64_t v85;
  unsigned int v86;
  int v87;
  int v88;
  uint64_t v89;
  _QWORD v90[5];
  id v91;
  id v92;
  id v93;
  _BYTE *v94;
  uint64_t v95;
  char v96;
  _BYTE buf[48];
  _BYTE v98[24];
  uint64_t v99;
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 80) > a2)
  {
    _ATLogCategoryStoreDownloads();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 80);
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v5;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = a2;
      *(_WORD *)&buf[22] = 2048;
      *(_QWORD *)&buf[24] = v6;
      _os_log_impl(&dword_1D1868000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ not enough free space available for download. available=%lld, needed=%lld", buf, 0x20u);
    }

    v7 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 14, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "finishWithError:operationResult:", v8, 0);

    return;
  }
  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0DDBF88]), "initWithRequestContext:storeMediaResponseItem:resumeData:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 328);
  *(_QWORD *)(v10 + 328) = v9;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 328), "setAllowsCellularFallback:", *(_QWORD *)(a1 + 80) >> 21 < 0x19uLL);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 328), "setAllowsCellularData:", objc_msgSend(*(id *)(a1 + 56), "canUseCellularData"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 328), "setAllowsProxyCellularData:", objc_msgSend(*(id *)(a1 + 56), "canProxyUseCellularData"));
  v12 = *(_QWORD **)(a1 + 32);
  v13 = (void *)v12[41];
  objc_msgSend(v12, "asset");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "isForeground"))
    v15 = 25;
  else
    v15 = -1;
  objc_msgSend(v13, "setQualityOfService:", v15);

  objc_msgSend(MEMORY[0x1E0DDBF50], "currentDeviceInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v16, "isWatch"))
  {
    objc_msgSend(*(id *)(a1 + 56), "assetType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("Music"));

    if (!v18)
      goto LABEL_15;
    objc_msgSend(*(id *)(a1 + 64), "playlistURL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(*(id *)(a1 + 64), "keyServerURL");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        objc_msgSend(*(id *)(a1 + 64), "keyCertificateURL");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          objc_msgSend(*(id *)(a1 + 64), "keyServerProtocolType");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "isEqualToString:", *MEMORY[0x1E0DDBDD8]);

        }
        else
        {
          v23 = 0;
        }

      }
      else
      {
        v23 = 0;
      }

    }
    else
    {
      v23 = 0;
    }

    objc_msgSend(*(id *)(a1 + 64), "audioTraits");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = objc_msgSend(v25, "containsObject:", *MEMORY[0x1E0DDBE10]);
    v87 = objc_msgSend(v25, "containsObject:", *MEMORY[0x1E0DDBE08]);
    if ((objc_msgSend(v25, "containsObject:", *MEMORY[0x1E0DDBE00]) & 1) != 0
      || (objc_msgSend(v25, "containsObject:", *MEMORY[0x1E0DDBE18]) & 1) != 0)
    {
      v26 = 1;
    }
    else
    {
      v26 = objc_msgSend(v25, "containsObject:", *MEMORY[0x1E0DDBE20]);
    }
    objc_msgSend(*(id *)(a1 + 56), "assetType");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("MusicVideo"));

    *(_QWORD *)v98 = 0;
    *(_QWORD *)&v98[8] = v98;
    *(_QWORD *)&v98[16] = 0x2050000000;
    v29 = (void *)getMPPlaybackUserDefaultsClass_softClass;
    v99 = getMPPlaybackUserDefaultsClass_softClass;
    if (!getMPPlaybackUserDefaultsClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getMPPlaybackUserDefaultsClass_block_invoke;
      *(_QWORD *)&buf[24] = &unk_1E927E328;
      *(_QWORD *)&buf[32] = v98;
      __getMPPlaybackUserDefaultsClass_block_invoke((uint64_t)buf);
      v29 = *(void **)(*(_QWORD *)&v98[8] + 24);
    }
    v30 = objc_retainAutorelease(v29);
    _Block_object_dispose(v98, 8);
    objc_msgSend(v30, "standardUserDefaults");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "preferredMusicDownloadResolution");
    v33 = v32;
    if (((v23 ^ 1 | v28) & 1) == 0)
    {
      v23 = v32 > 47999 ? v88 | v87 : 0;
      if ((v23 & 1) == 0 && ((v26 ^ 1) & 1) == 0)
        v23 = objc_msgSend(v31, "prefersSpatialDownloads");
    }
    _ATLogCategoryStoreDownloads();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      v35 = *(_QWORD *)(a1 + 32);
      v36 = objc_msgSend(v31, "prefersSpatialDownloads");
      *(_DWORD *)buf = 138544386;
      *(_QWORD *)&buf[4] = v35;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v23;
      *(_WORD *)&buf[18] = 2114;
      *(_QWORD *)&buf[20] = v25;
      *(_WORD *)&buf[28] = 2048;
      *(_QWORD *)&buf[30] = v33;
      *(_WORD *)&buf[38] = 1024;
      *(_DWORD *)&buf[40] = v36;
      _os_log_impl(&dword_1D1868000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@ isHLSDownload=%{BOOL}u [traits=%{public}@, preferredDownloadResolution=%ld, prefersSpatialDownloads=%{BOOL}u]", buf, 0x2Cu);
    }

    if (!v23)
    {
      v24 = 0;
LABEL_81:

      goto LABEL_82;
    }
    v37 = objc_msgSend(v31, "prefersSpatialDownloads");
    v38 = v26 & v37;
    v39 = (v88 | v87) & ~(_DWORD)v38;
    if (v33 <= 47999)
      v39 = 0;
    v86 = v39;
    _ATLogCategoryStoreDownloads();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      v41 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v41;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v25;
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = v37;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = v33 > 47999;
      _os_log_impl(&dword_1D1868000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@ HLS Download input: traits=%{public}@, prefersSpatialAudio=%{BOOL}u, prefersLossless=%{BOOL}u", buf, 0x22u);
    }

    v42 = *(_QWORD **)(a1 + 32);
    if ((v86 & 1) != 0)
    {
      v85 = objc_msgSend(v42, "_maximumSampleRateForResolutionPreference:", v33);
      v43 = *(void **)(*(_QWORD *)(a1 + 32) + 328);
      if (v85)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setMaximumSampleRate:", v44);

LABEL_47:
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 328), "setPrefersLossless:", v86);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 328), "setPrefersMultichannel:", v38);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 328), "setPrefersHLSAsset:", 1);
        _ATLogCategoryStoreDownloads();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          v46 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138544130;
          *(_QWORD *)&buf[4] = v46;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v86;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = v38;
          *(_WORD *)&buf[24] = 2048;
          *(_QWORD *)&buf[26] = v85;
          _os_log_impl(&dword_1D1868000, v45, OS_LOG_TYPE_DEFAULT, "%{public}@ HLS Download setup: shouldUseLosslessAsset=%{BOOL}u, shouldUseSpatialAsset=%{BOOL}u, sample rate=%lu", buf, 0x22u);
        }

        if ((_DWORD)v38)
        {
          if (objc_msgSend(v25, "containsObject:", *MEMORY[0x1E0DDBE00]))
            v47 = 9;
          else
            v47 = 8;
          if (objc_msgSend(v25, "containsObject:", *MEMORY[0x1E0DDBE18]))
            v47 |= 0x20uLL;
          if (objc_msgSend(v25, "containsObject:", *MEMORY[0x1E0DDBE20]))
            v24 = v47 | 2;
          else
            v24 = v47;
        }
        else
        {
          v48 = 8;
          if ((v88 & (v33 > 47999)) != 0)
            v48 = 4;
          if ((v87 & (v33 == 192000)) != 0)
            v24 = 16;
          else
            v24 = v48;
        }
        _ATLogCategoryStoreDownloads();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          v89 = *(_QWORD *)(a1 + 32);
          v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 6);
          if ((v24 & 8) != 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("lossy stereo"));
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "addObject:", v51);

          }
          if ((v24 & 4) != 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("lossless"));
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "addObject:", v52);

          }
          if ((v24 & 0x10) != 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("high-res lossless"));
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "addObject:", v53);

          }
          if ((v24 & 0x20) != 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("spatial"));
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "addObject:", v54);

          }
          if ((v24 & 1) != 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("atmos"));
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "addObject:", v55);

          }
          if ((v24 & 2) != 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("surround"));
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "addObject:", v56);

          }
          if (objc_msgSend(v50, "count"))
          {
            objc_msgSend(v50, "componentsJoinedByString:", CFSTR(", "));
            v57 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v57 = CFSTR("None");
          }

          *(_DWORD *)buf = 138544386;
          *(_QWORD *)&buf[4] = v89;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v57;
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = v38;
          *(_WORD *)&buf[28] = 1024;
          *(_DWORD *)&buf[30] = v86;
          *(_WORD *)&buf[34] = 2048;
          *(_QWORD *)&buf[36] = v85;
          _os_log_impl(&dword_1D1868000, v49, OS_LOG_TYPE_DEFAULT, "%{public}@ HLS Download outcome: traits=[%{public}@], spatial=%{BOOL}u, lossless=%{BOOL}u, sample rate=%lu", buf, 0x2Cu);

        }
        goto LABEL_81;
      }
    }
    else
    {
      v43 = (void *)v42[41];
    }
    objc_msgSend(v43, "setMaximumSampleRate:", 0);
    v85 = 0;
    goto LABEL_47;
  }

LABEL_15:
  v24 = 0;
  LOBYTE(v23) = 0;
LABEL_82:
  objc_msgSend(MEMORY[0x1E0DDBF50], "currentDeviceInfo");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v58, "isWatch");

  if ((v59 & 1) == 0)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 328), "setRequiresPower:", objc_msgSend(*(id *)(a1 + 56), "powerRequired"));
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  *(_QWORD *)&buf[24] = __Block_byref_object_copy__4051;
  *(_QWORD *)&buf[32] = __Block_byref_object_dispose__4052;
  *(_QWORD *)&buf[40] = 0;
  if ((v23 & 1) != 0)
  {
    v60 = CFSTR("movpkg");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 72), "fileExtension");
    v60 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v61 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 56), "identifier");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "UUIDString");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "stringWithFormat:", CFSTR("%@_%@"), v62, v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "stringByAppendingPathExtension:", v60);
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  +[ATStoreDownloadService downloadDirectoryPath](ATStoreDownloadService, "downloadDirectoryPath");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "stringByAppendingPathComponent:", v66);
  v68 = objc_claimAutoreleasedReturnValue();
  v69 = *(void **)(*(_QWORD *)&buf[8] + 40);
  *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v68;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v67, 1, 0, 0);

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "removeItemAtPath:error:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40), 0);

  _ATLogCategoryStoreDownloads();
  v72 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
  {
    v73 = *(_QWORD *)(a1 + 32);
    v74 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
    *(_DWORD *)v98 = 138543618;
    *(_QWORD *)&v98[4] = v73;
    *(_WORD *)&v98[12] = 2114;
    *(_QWORD *)&v98[14] = v74;
    _os_log_impl(&dword_1D1868000, v72, OS_LOG_TYPE_DEFAULT, "%{public}@ downloading to temporary file %{public}@", v98, 0x16u);
  }

  v75 = *(void **)(*(_QWORD *)(a1 + 32) + 328);
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "setDestinationURL:", v76);

  objc_msgSend(*(id *)(a1 + 32), "progress");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 328), "progress");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "addChild:withPendingUnitCount:", v78, 100);

  _ATLogCategoryStoreDownloads();
  v79 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
  {
    v80 = *(_QWORD *)(a1 + 32);
    v81 = *(_QWORD *)(v80 + 328);
    *(_DWORD *)v98 = 138543618;
    *(_QWORD *)&v98[4] = v80;
    *(_WORD *)&v98[12] = 2114;
    *(_QWORD *)&v98[14] = v81;
    _os_log_impl(&dword_1D1868000, v79, OS_LOG_TYPE_DEFAULT, "%{public}@ Initiating download using request %{public}@", v98, 0x16u);
  }

  v82 = *(_QWORD *)(a1 + 32);
  v83 = *(void **)(v82 + 328);
  v90[0] = MEMORY[0x1E0C809B0];
  v90[1] = 3221225472;
  v90[2] = __46__ATStoreMusicDownloadAssetsOperation_execute__block_invoke_74;
  v90[3] = &unk_1E927DE60;
  v90[4] = v82;
  v91 = *(id *)(a1 + 48);
  v84 = *(id *)(a1 + 40);
  v96 = v23;
  v92 = v84;
  v95 = v24;
  v93 = *(id *)(a1 + 64);
  v94 = buf;
  objc_msgSend(v83, "performRequestWithResponseHandler:", v90);

  _Block_object_dispose(buf, 8);
}

void __46__ATStoreMusicDownloadAssetsOperation_execute__block_invoke_74(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  ATStoreDownloadOperationResult *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  void *v37;
  _QWORD v38[4];
  _QWORD v39[5];

  v39[4] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v6)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) != 0
      || objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 328), "isCancelled"))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 2, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
  }
  v8 = objc_alloc_init(ATStoreDownloadOperationResult);
  -[ATStoreDownloadOperationResult setStoreMediaResponseItem:](v8, "setStoreMediaResponseItem:", *(_QWORD *)(a1 + 40));
  -[ATStoreDownloadOperationResult setRequestContext:](v8, "setRequestContext:", *(_QWORD *)(a1 + 48));
  -[ATStoreDownloadOperationResult setIsHLSDownload:](v8, "setIsHLSDownload:", *(unsigned __int8 *)(a1 + 80));
  if (*(_BYTE *)(a1 + 80))
  {
    v38[0] = *MEMORY[0x1E0D50D98];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 72));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v29;
    v38[1] = *MEMORY[0x1E0D50DB0];
    objc_msgSend(*(id *)(a1 + 56), "keyCertificateURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "absoluteString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = v10;
    v38[2] = *MEMORY[0x1E0D50DC0];
    objc_msgSend(*(id *)(a1 + 56), "keyServerURL");
    v30 = v6;
    v11 = v5;
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "absoluteString");
    v13 = v7;
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v39[2] = v14;
    v38[3] = *MEMORY[0x1E0D50DB8];
    objc_msgSend(*(id *)(a1 + 56), "keyServerProtocolType");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    v17 = *MEMORY[0x1E0DDBDE0];
    if (v15)
      v17 = v15;
    v39[3] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v13;
    v5 = v11;
    v6 = v30;

    -[ATStoreDownloadOperationResult setAssetClientParams:](v8, "setAssetClientParams:", v18);
  }
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    v31 = 0;
    objc_msgSend(v19, "removeItemAtPath:error:", v20, &v31);
    v21 = v31;

    _ATLogCategoryStoreDownloads();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v21)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v24 = *(_QWORD *)(a1 + 32);
        v25 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
        objc_msgSend(v21, "msv_description");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v33 = v24;
        v34 = 2114;
        v35 = v25;
        v36 = 2114;
        v37 = v26;
        _os_log_impl(&dword_1D1868000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ Performed cleanup for download at path %{public}@ error=%{public}@", buf, 0x20u);

      }
    }
    else if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v27 = *(_QWORD *)(a1 + 32);
      v28 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      *(_DWORD *)buf = 138543618;
      v33 = v27;
      v34 = 2114;
      v35 = v28;
      _os_log_impl(&dword_1D1868000, v23, OS_LOG_TYPE_ERROR, "%{public}@ Performed cleanup for download at path %{public}@", buf, 0x16u);
    }

  }
  else
  {
    -[ATStoreDownloadOperationResult setDownloadFilePath:](v8, "setDownloadFilePath:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithError:operationResult:", v7, v8);

}

@end
