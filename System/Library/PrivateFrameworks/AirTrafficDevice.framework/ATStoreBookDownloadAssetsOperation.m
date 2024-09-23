@implementation ATStoreBookDownloadAssetsOperation

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(getBLDownloadQueueNonUIClass(), "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ATStoreBookDownloadAssetsOperation;
  -[ATStoreBookDownloadAssetsOperation dealloc](&v4, sel_dealloc);
}

- (void)execute
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  _QWORD *v12;
  void *v13;
  objc_class *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD v28[5];
  _QWORD v29[5];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  _BYTE buf[24];
  void *v36;
  uint64_t *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (-[ATStoreBookDownloadAssetsOperation isCancelled](self, "isCancelled"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 2, 0);
    v27 = (id)objc_claimAutoreleasedReturnValue();
    -[ATStoreBookDownloadAssetsOperation finishWithError:operationResult:](self, "finishWithError:operationResult:", v27, 0);

  }
  else
  {
    -[ATStoreDownloadOperation asset](self, "asset");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "storeInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _ATLogCategoryStoreDownloads();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v3;
      _os_log_impl(&dword_1D1868000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Starting download for asset %{public}@.", buf, 0x16u);
    }

    objc_msgSend(getBLDownloadQueueNonUIClass(), "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:", self);
    if (objc_msgSend(v3, "isRestore"))
    {
      objc_msgSend(v3, "storeInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "downloadDictionary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v8, "mutableCopy");

      objc_msgSend(v9, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0DAF970]);
      objc_msgSend(v3, "assetType");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("Audiobook"));
      v12 = (_QWORD *)MEMORY[0x1E0DAF800];
      if (!v11)
        v12 = (_QWORD *)MEMORY[0x1E0DAF810];
      objc_msgSend(v9, "setObject:forKey:", *v12, *MEMORY[0x1E0DAF988]);

      v30 = 0;
      v31 = &v30;
      v32 = 0x2050000000;
      v13 = (void *)getBLRestoreRequestItemClass_softClass;
      v33 = getBLRestoreRequestItemClass_softClass;
      if (!getBLRestoreRequestItemClass_softClass)
      {
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __getBLRestoreRequestItemClass_block_invoke;
        v36 = &unk_1E927E328;
        v37 = &v30;
        __getBLRestoreRequestItemClass_block_invoke((uint64_t)buf);
        v13 = (void *)v31[3];
      }
      v14 = objc_retainAutorelease(v13);
      _Block_object_dispose(&v30, 8);
      v15 = [v14 alloc];
      objc_msgSend(v3, "storeInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "assetDictionary");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v15, "initWithDownloadDictionary:assetDictionary:", v9, v17);

      v34 = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __45__ATStoreBookDownloadAssetsOperation_execute__block_invoke;
      v29[3] = &unk_1E927D370;
      v29[4] = self;
      objc_msgSend(v6, "addDownloadsWithRestoreContentRequestItems:completion:", v19, v29);

    }
    else
    {
      v30 = 0;
      v31 = &v30;
      v32 = 0x2050000000;
      v20 = (void *)getBLPurchaseRequestClass_softClass;
      v33 = getBLPurchaseRequestClass_softClass;
      v21 = MEMORY[0x1E0C809B0];
      if (!getBLPurchaseRequestClass_softClass)
      {
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __getBLPurchaseRequestClass_block_invoke;
        v36 = &unk_1E927E328;
        v37 = &v30;
        __getBLPurchaseRequestClass_block_invoke((uint64_t)buf);
        v20 = (void *)v31[3];
      }
      v22 = objc_retainAutorelease(v20);
      _Block_object_dispose(&v30, 8);
      objc_msgSend(v4, "redownloadParams");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "adamID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "requestWithBuyParameters:storeIdentifier:", v23, v24);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "setRestore:", objc_msgSend(v3, "isRestore"));
      objc_msgSend(v3, "assetType");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setAudiobook:", objc_msgSend(v25, "isEqualToString:", CFSTR("Audiobook")));

      objc_msgSend(v4, "DSID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setAccountIdentifier:", v26);

      v28[0] = v21;
      v28[1] = 3221225472;
      v28[2] = __45__ATStoreBookDownloadAssetsOperation_execute__block_invoke_7;
      v28[3] = &unk_1E927D398;
      v28[4] = self;
      objc_msgSend(v6, "purchaseWithRequest:completion:", v9, v28);
    }

  }
}

- (void)cancel
{
  void *v3;
  NSString *bookDownloadID;
  objc_super v5;
  _QWORD v6[5];

  if (self->_bookDownloadID)
  {
    objc_msgSend(getBLDownloadQueueNonUIClass(), "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    bookDownloadID = self->_bookDownloadID;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __44__ATStoreBookDownloadAssetsOperation_cancel__block_invoke;
    v6[3] = &unk_1E927E0D0;
    v6[4] = self;
    objc_msgSend(v3, "cancelDownloadWithID:withCompletion:", bookDownloadID, v6);

  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)ATStoreBookDownloadAssetsOperation;
    -[ATStoreBookDownloadAssetsOperation cancel](&v5, sel_cancel);
  }
}

- (void)finishWithError:(id)a3 operationResult:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  objc_super v9;
  uint8_t buf[4];
  ATStoreBookDownloadAssetsOperation *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _ATLogCategoryStoreDownloads();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v11 = self;
    v12 = 2114;
    v13 = v6;
    _os_log_impl(&dword_1D1868000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ finished download with error %{public}@.", buf, 0x16u);
  }

  v9.receiver = self;
  v9.super_class = (Class)ATStoreBookDownloadAssetsOperation;
  -[ATStoreDownloadOperation finishWithError:operationResult:](&v9, sel_finishWithError_operationResult_, v6, v7);

}

- (void)downloadQueue:(id)a3 downloadStatesDidChange:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  float v14;
  float v15;
  void *v16;
  float v17;
  float v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  ATStoreBookDownloadAssetsOperation *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  double v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v5 = a4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(v5);
        if (self->_bookDownloadID)
        {
          v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v10, "downloadID", (_QWORD)v25);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqualToString:", self->_bookDownloadID);

          if (v12)
          {
            if (objc_msgSend(v10, "downloadPhase") == 2)
            {
              objc_msgSend(v10, "transferBytesWritten");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "floatValue");
              v15 = v14;

              objc_msgSend(v10, "transferBytesExpected");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "floatValue");
              v18 = v17;

              _ATLogCategoryStoreDownloads();
              v19 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                -[ATStoreDownloadOperation asset](self, "asset");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v30 = self;
                v31 = 2114;
                v32 = v20;
                v33 = 2048;
                v34 = (float)(v15 / v18);
                _os_log_impl(&dword_1D1868000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ : %.2f", buf, 0x20u);

              }
              -[ICRequestOperation progress](self, "progress");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "transferBytesExpected");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "setTotalUnitCount:", objc_msgSend(v22, "longLongValue"));

              -[ICRequestOperation progress](self, "progress");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "transferBytesWritten");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "setCompletedUnitCount:", objc_msgSend(v24, "longLongValue"));

            }
            goto LABEL_15;
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_15:

}

- (void)downloadQueue:(id)a3 downloadStates:(id)a4 didCompleteWithError:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  int v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        if (self->_bookDownloadID)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "downloadID", (_QWORD)v17);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToString:", self->_bookDownloadID);

          if (v15)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "at_ATErrorFromError:", v8);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[ATStoreBookDownloadAssetsOperation finishWithError:operationResult:](self, "finishWithError:operationResult:", v16, 0);

            goto LABEL_12;
          }
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_12:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookDownloadID, 0);
}

id __44__ATStoreBookDownloadAssetsOperation_cancel__block_invoke(uint64_t a1)
{
  objc_super v2;

  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)ATStoreBookDownloadAssetsOperation;
  return objc_msgSendSuper2(&v2, sel_cancel);
}

void __45__ATStoreBookDownloadAssetsOperation_execute__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  ATStoreDownloadOperationResult *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a2, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "downloadID");
  v7 = objc_claimAutoreleasedReturnValue();

  _ATLogCategoryStoreDownloads();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v15 = 138543874;
    v16 = v9;
    v17 = 2114;
    v18 = v5;
    v19 = 2114;
    v20 = v7;
    _os_log_impl(&dword_1D1868000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Finished adding restore download with err %{public}@. downloadID=%{public}@", (uint8_t *)&v15, 0x20u);
  }

  if (!(v5 | v7))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 0, 0);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  if (v5)
  {
    v10 = objc_alloc_init(ATStoreDownloadOperationResult);
    -[ATStoreDownloadOperationResult setCancelAllRemaining:](v10, "setCancelAllRemaining:", AMSErrorIsEqual());
    v11 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "at_ATErrorFromError:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "finishWithError:operationResult:", v12, v10);

  }
  else
  {
    v13 = *(_QWORD *)(a1 + 32);
    v14 = (id)v7;
    v10 = *(ATStoreDownloadOperationResult **)(v13 + 328);
    *(_QWORD *)(v13 + 328) = v14;
  }

}

void __45__ATStoreBookDownloadAssetsOperation_execute__block_invoke_7(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD *v10;
  void *v11;
  id v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  _ATLogCategoryStoreDownloads();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v13 = 138543874;
    v14 = v9;
    v15 = 2114;
    v16 = v7;
    v17 = 2114;
    v18 = v6;
    _os_log_impl(&dword_1D1868000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Completed purchase with err %{public}@. downloadID=%{public}@", (uint8_t *)&v13, 0x20u);
  }

  v10 = *(_QWORD **)(a1 + 32);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "at_ATErrorFromError:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "finishWithError:operationResult:", v11, 0);
  }
  else
  {
    v12 = v6;
    v11 = (void *)v10[41];
    v10[41] = v12;
  }

}

@end
