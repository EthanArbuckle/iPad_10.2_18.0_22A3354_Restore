@implementation CRKShowOpenDialogOperation

- (CRKShowOpenDialogOperation)initWithFileURLs:(id)a3 keepOriginalFiles:(BOOL)a4 previewImageData:(id)a5 senderName:(id)a6 autoAccept:(BOOL)a7
{
  return -[CRKShowOpenDialogOperation initWithFileURLs:keepOriginalFiles:previewImageData:senderName:autoAccept:sourceBundleIdentifier:](self, "initWithFileURLs:keepOriginalFiles:previewImageData:senderName:autoAccept:sourceBundleIdentifier:", a3, a4, a5, a6, a7, 0);
}

- (CRKShowOpenDialogOperation)initWithFileURLs:(id)a3 keepOriginalFiles:(BOOL)a4 previewImageData:(id)a5 senderName:(id)a6 autoAccept:(BOOL)a7 sourceBundleIdentifier:(id)a8
{
  return -[CRKShowOpenDialogOperation initWithFileURLs:keepOriginalFiles:previewImageData:senderName:autoAccept:sourceBundleIdentifier:filesDescription:](self, "initWithFileURLs:keepOriginalFiles:previewImageData:senderName:autoAccept:sourceBundleIdentifier:filesDescription:", a3, a4, a5, a6, a7, a8, 0);
}

- (CRKShowOpenDialogOperation)initWithFileURLs:(id)a3 keepOriginalFiles:(BOOL)a4 previewImageData:(id)a5 senderName:(id)a6 autoAccept:(BOOL)a7 sourceBundleIdentifier:(id)a8 filesDescription:(id)a9
{
  _BOOL8 v10;
  _BOOL8 v13;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  CRKShowOpenDialogOperation *v23;

  v10 = a7;
  v13 = a4;
  v16 = a9;
  v17 = a8;
  v18 = a6;
  v19 = a5;
  v20 = a3;
  v21 = (void *)objc_opt_new();
  v22 = (void *)objc_opt_new();
  v23 = -[CRKShowOpenDialogOperation initWithFileURLs:keepOriginalFiles:previewImageData:senderName:autoAccept:sourceBundleIdentifier:filesDescription:cleanupDelay:sharingPrimitives:fileSystemPrimitives:](self, "initWithFileURLs:keepOriginalFiles:previewImageData:senderName:autoAccept:sourceBundleIdentifier:filesDescription:cleanupDelay:sharingPrimitives:fileSystemPrimitives:", v20, v13, v19, v18, v10, v17, 10.0, v16, v21, v22);

  return v23;
}

- (CRKShowOpenDialogOperation)initWithFileURLs:(id)a3 keepOriginalFiles:(BOOL)a4 previewImageData:(id)a5 senderName:(id)a6 autoAccept:(BOOL)a7 sourceBundleIdentifier:(id)a8 filesDescription:(id)a9 cleanupDelay:(double)a10 sharingPrimitives:(id)a11 fileSystemPrimitives:(id)a12
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  CRKShowOpenDialogOperation *v24;
  CRKShowOpenDialogOperation *v25;
  uint64_t v26;
  NSData *mPreviewImageData;
  uint64_t v28;
  NSString *mSenderName;
  uint64_t v30;
  NSString *mSourceBundleIdentifier;
  uint64_t v32;
  NSString *mFilesDescription;
  void *v35;
  id v38;
  id v39;
  objc_super v40;

  v19 = a3;
  v20 = a5;
  v21 = a6;
  v22 = a8;
  v23 = a9;
  v39 = a11;
  v38 = a12;
  if (!objc_msgSend(v19, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKShowOpenDialogOperation.m"), 107, CFSTR("empty set of URLs"));

  }
  v40.receiver = self;
  v40.super_class = (Class)CRKShowOpenDialogOperation;
  v24 = -[CRKShowOpenDialogOperation init](&v40, sel_init);
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->mURLs, a3);
    v25->mKeepOriginalFiles = a4;
    v26 = objc_msgSend(v20, "copy");
    mPreviewImageData = v25->mPreviewImageData;
    v25->mPreviewImageData = (NSData *)v26;

    v28 = objc_msgSend(v21, "copy");
    mSenderName = v25->mSenderName;
    v25->mSenderName = (NSString *)v28;

    v25->mAutoAccept = a7;
    v30 = objc_msgSend(v22, "copy");
    mSourceBundleIdentifier = v25->mSourceBundleIdentifier;
    v25->mSourceBundleIdentifier = (NSString *)v30;

    v32 = objc_msgSend(v23, "copy");
    mFilesDescription = v25->mFilesDescription;
    v25->mFilesDescription = (NSString *)v32;

    v25->_cleanupDelay = a10;
    objc_storeStrong((id *)&v25->_sharingPrimitives, a11);
    objc_storeStrong((id *)&v25->_fileSystemPrimitives, a12);
  }

  return v25;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)cancel
{
  _QWORD v3[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRKShowOpenDialogOperation;
  -[CRKShowOpenDialogOperation cancel](&v4, sel_cancel);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __36__CRKShowOpenDialogOperation_cancel__block_invoke;
  v3[3] = &unk_24D9C7020;
  v3[4] = self;
  objc_msgSend(MEMORY[0x24BDBCF18], "cat_performBlockOnMainRunLoop:", v3);
}

void __36__CRKShowOpenDialogOperation_cancel__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  if (objc_msgSend(*(id *)(a1 + 32), "isExecuting"))
  {
    v2 = *(void **)(a1 + 32);
    CATErrorWithCodeAndUserInfo();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "failWithError:", v3);

  }
}

- (void)main
{
  -[CRKShowOpenDialogOperation performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_startTransfer, 0, 0);
}

- (void)startTransfer
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_218C99000, a2, OS_LOG_TYPE_ERROR, "%{public}@: Invalid item", (uint8_t *)&v2, 0xCu);
}

void __43__CRKShowOpenDialogOperation_startTransfer__block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7;
  id WeakRetained;
  void *v9;
  id v10;

  v10 = a4;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (a3)
    objc_msgSend(WeakRetained, "transferWithIdentifierWasAccepted:", v7);
  else
    objc_msgSend(WeakRetained, "transferWithIdentifierWasDeclined:error:", v7, v10);

}

uint64_t __43__CRKShowOpenDialogOperation_startTransfer__block_invoke_22(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "transferDidStartWithSuccess:destinationPath:error:", a2, a3, a4);
}

- (void)transferDidStartWithSuccess:(BOOL)a3 destinationPath:(id)a4 error:(id)a5
{
  _BOOL4 v7;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id obj;
  uint64_t v41;
  id v42;
  _QWORD v43[5];
  id v44;
  id v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t v51[128];
  uint8_t buf[4];
  CRKShowOpenDialogOperation *v53;
  __int16 v54;
  _BOOL4 v55;
  __int16 v56;
  id v57;
  __int16 v58;
  id v59;
  uint64_t v60;

  v7 = a3;
  v60 = *MEMORY[0x24BDAC8D0];
  v42 = a4;
  v10 = a5;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKShowOpenDialogOperation.m"), 186, CFSTR("%@ must be called from the main thread"), v38);

  }
  if (-[CRKShowOpenDialogOperation isExecuting](self, "isExecuting"))
  {
    _CRKLogOperation();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138544130;
      v53 = self;
      v54 = 1024;
      v55 = v7;
      v56 = 2114;
      v57 = v42;
      v58 = 2114;
      v59 = v10;
      _os_log_impl(&dword_218C99000, v11, OS_LOG_TYPE_INFO, "%{public}@: Transfer did start. success: %d, destination: %{public}@, error: %{public}@", buf, 0x26u);
    }

    if (v7)
    {
      objc_storeStrong((id *)&self->mTransferDirectoryURL, a4);
      v39 = (void *)objc_opt_new();
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      -[CRKShowOpenDialogOperation transfer](self, "transfer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "fileURLs");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      obj = v13;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
      if (v14)
      {
        v15 = v14;
        v41 = *(_QWORD *)v48;
        while (2)
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v48 != v41)
              objc_enumerationMutation(obj);
            v17 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v16);
            v18 = v42;
            if (CRKIsiOS())
            {
              objc_msgSend(MEMORY[0x24BDD1880], "UUID");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "UUIDString");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "URLByAppendingPathComponent:", v20);
              v21 = objc_claimAutoreleasedReturnValue();

              v18 = (id)v21;
            }
            -[CRKShowOpenDialogOperation fileSystemPrimitives](self, "fileSystemPrimitives");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = v10;
            v23 = objc_msgSend(v22, "makeDirectoryAtURL:error:", v18, &v46);
            v24 = v46;

            if (!v23)
            {
              -[CRKShowOpenDialogOperation failWithError:](self, "failWithError:", v24);

              v10 = v24;
              v33 = v39;
              goto LABEL_26;
            }
            objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "lastPathComponent");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "URLByAppendingPathComponent:", v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "crk_collisionAvoidingURLForURL:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            LODWORD(v25) = self->mKeepOriginalFiles;
            -[CRKShowOpenDialogOperation fileSystemPrimitives](self, "fileSystemPrimitives");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = v29;
            if ((_DWORD)v25)
            {
              v45 = v24;
              v31 = objc_msgSend(v29, "copyItemAtURL:toURL:error:", v17, v28, &v45);
              v32 = v45;
            }
            else
            {
              v44 = v24;
              v31 = objc_msgSend(v29, "moveItemAtURL:toURL:error:", v17, v28, &v44);
              v32 = v44;
            }
            v10 = v32;

            if ((v31 & 1) != 0)
              objc_msgSend(v39, "addObject:", v28);
            else
              -[CRKShowOpenDialogOperation failWithError:](self, "failWithError:", v10);

            ++v16;
          }
          while (v15 != v16);
          v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
          if (v15)
            continue;
          break;
        }
      }

      v33 = v39;
      v34 = (void *)objc_msgSend(v39, "copy");
      -[CRKShowOpenDialogOperation transfer](self, "transfer");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setDestFileURLs:", v34);

      -[CRKShowOpenDialogOperation transfer](self, "transfer");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v43[0] = MEMORY[0x24BDAC760];
      v43[1] = 3221225472;
      v43[2] = __80__CRKShowOpenDialogOperation_transferDidStartWithSuccess_destinationPath_error___block_invoke;
      v43[3] = &unk_24D9C91B0;
      v43[4] = self;
      objc_msgSend(v36, "updateWithState:completion:", 2, v43);

LABEL_26:
    }
    else
    {
      -[CRKShowOpenDialogOperation failWithError:](self, "failWithError:", v10);
    }
  }

}

uint64_t __80__CRKShowOpenDialogOperation_transferDidStartWithSuccess_destinationPath_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "transferDidProgressWithSuccess:destinationPath:error:", a2, a3, a4);
}

- (void)transferDidProgressWithSuccess:(BOOL)a3 destinationPath:(id)a4 error:(id)a5
{
  _BOOL4 v6;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  uint8_t buf[4];
  CRKShowOpenDialogOperation *v22;
  __int16 v23;
  _BYTE v24[24];
  uint64_t v25;

  v6 = a3;
  v25 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKShowOpenDialogOperation.m"), 244, CFSTR("%@ must be called from the main thread"), v18);

  }
  if (-[CRKShowOpenDialogOperation isExecuting](self, "isExecuting"))
  {
    _CRKLogOperation();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138544130;
      v22 = self;
      v23 = 1024;
      *(_DWORD *)v24 = v6;
      *(_WORD *)&v24[4] = 2114;
      *(_QWORD *)&v24[6] = v9;
      *(_WORD *)&v24[14] = 2114;
      *(_QWORD *)&v24[16] = v10;
      _os_log_impl(&dword_218C99000, v11, OS_LOG_TYPE_INFO, "%{public}@: Transfer did progress: success: %d, destination: %{public}@, error: %{public}@", buf, 0x26u);
    }

    if (v6)
    {
      _CRKLogOperation();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        -[CRKShowOpenDialogOperation transfer](self, "transfer");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[CRKShowOpenDialogOperation transfer](self, "transfer");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v22 = self;
        v23 = 2114;
        *(_QWORD *)v24 = v14;
        *(_WORD *)&v24[8] = 2114;
        *(_QWORD *)&v24[10] = v15;
        _os_log_impl(&dword_218C99000, v12, OS_LOG_TYPE_INFO, "%{public}@: Finishing transfer. Identifier: %{public}@. Info: %{public}@", buf, 0x20u);

      }
      -[CRKShowOpenDialogOperation transfer](self, "transfer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __83__CRKShowOpenDialogOperation_transferDidProgressWithSuccess_destinationPath_error___block_invoke;
      v19[3] = &unk_24D9C91D8;
      v19[4] = self;
      v20 = v9;
      objc_msgSend(v16, "updateWithState:completion:", 5, v19);

    }
    else
    {
      -[CRKShowOpenDialogOperation failWithError:](self, "failWithError:", v10);
    }
  }

}

uint64_t __83__CRKShowOpenDialogOperation_transferDidProgressWithSuccess_destinationPath_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "transferDidFinishWithSuccess:destinationPath:error:", a2, *(_QWORD *)(a1 + 40), a4);
}

- (void)transferDidFinishWithSuccess:(BOOL)a3 destinationPath:(id)a4 error:(id)a5
{
  _BOOL4 v6;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  CRKShowOpenDialogOperation *v15;
  __int16 v16;
  _BOOL4 v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v6 = a3;
  v22 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKShowOpenDialogOperation.m"), 266, CFSTR("%@ must be called from the main thread"), v13);

  }
  if (-[CRKShowOpenDialogOperation isExecuting](self, "isExecuting"))
  {
    _CRKLogOperation();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138544130;
      v15 = self;
      v16 = 1024;
      v17 = v6;
      v18 = 2114;
      v19 = v9;
      v20 = 2114;
      v21 = v10;
      _os_log_impl(&dword_218C99000, v11, OS_LOG_TYPE_INFO, "%{public}@: Transfer did finish. success: %d, destination: %{public}@, error: %{public}@", buf, 0x26u);
    }

    if (v6)
    {
      self->mTransferFinished = 1;
      -[CRKShowOpenDialogOperation succeedIfNeeded](self, "succeedIfNeeded");
    }
    else
    {
      -[CRKShowOpenDialogOperation failWithError:](self, "failWithError:", v10);
    }
  }

}

- (void)transferWithIdentifierWasAccepted:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  double v25;
  dispatch_time_t v26;
  void *v27;
  void *v28;
  id v29;
  id obj;
  void *v31;
  CRKShowOpenDialogOperation *v32;
  _QWORD block[5];
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t v39[128];
  uint8_t buf[4];
  CRKShowOpenDialogOperation *v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKShowOpenDialogOperation.m"), 287, CFSTR("%@ must be called from the main thread"), v28);

  }
  if (-[CRKShowOpenDialogOperation isExecuting](self, "isExecuting"))
  {
    _CRKLogOperation();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v41 = self;
      v42 = 2114;
      v43 = v5;
      _os_log_impl(&dword_218C99000, v6, OS_LOG_TYPE_INFO, "%{public}@: Transfer with identifier %{public}@ ACCEPTED", buf, 0x16u);
    }

    if (CRKIsOSX())
    {
      v29 = v5;
      v7 = (void *)MEMORY[0x24BDBCEF0];
      -[CRKShowOpenDialogOperation transfer](self, "transfer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "destFileURLs");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setWithCapacity:", objc_msgSend(v9, "count"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v32 = self;
      -[CRKShowOpenDialogOperation transfer](self, "transfer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "destFileURLs");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      obj = v11;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v36;
        while (2)
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v36 != v14)
              objc_enumerationMutation(obj);
            v16 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
            objc_msgSend(v16, "URLByDeletingLastPathComponent");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "addObject:", v17);
            objc_msgSend(v16, "lastPathComponent");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "URLByDeletingLastPathComponent");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "URLByAppendingPathComponent:", v18);
            v21 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "crk_collisionAvoidingURLForURL:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            -[CRKShowOpenDialogOperation fileSystemPrimitives](v32, "fileSystemPrimitives");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = 0;
            LOBYTE(v21) = objc_msgSend(v23, "copyItemAtURL:toURL:error:", v16, v22, &v34);
            v24 = v34;

            if ((v21 & 1) == 0)
            {
              -[CRKShowOpenDialogOperation failWithError:](v32, "failWithError:", v24);

              v5 = v29;
              goto LABEL_18;
            }

          }
          v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
          if (v13)
            continue;
          break;
        }
      }

      self = v32;
      -[CRKShowOpenDialogOperation cleanupDelay](v32, "cleanupDelay");
      v26 = dispatch_time(0, (uint64_t)(v25 * 1000000000.0));
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __64__CRKShowOpenDialogOperation_transferWithIdentifierWasAccepted___block_invoke;
      block[3] = &unk_24D9C7020;
      block[4] = v32;
      dispatch_after(v26, MEMORY[0x24BDAC9B8], block);

      v5 = v29;
    }
    self->mTransferAccepted = 1;
    -[CRKShowOpenDialogOperation succeedIfNeeded](self, "succeedIfNeeded");
  }
LABEL_18:

}

uint64_t __64__CRKShowOpenDialogOperation_transferWithIdentifierWasAccepted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cleanupHiddenTransferItemsIfNeeded");
}

- (void)transferWithIdentifierWasDeclined:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  CRKShowOpenDialogOperation *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKShowOpenDialogOperation.m"), 330, CFSTR("%@ must be called from the main thread"), v14);

  }
  if (-[CRKShowOpenDialogOperation isExecuting](self, "isExecuting"))
  {
    objc_msgSend(v8, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = CFSTR("UNABLE TO OPEN");
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("ClassroomKit.error"))
      && objc_msgSend(v8, "code") == 18)
    {
      v10 = CFSTR("DECLINED");
    }
    v11 = v10;

    _CRKLogOperation();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543874;
      v16 = self;
      v17 = 2114;
      v18 = v7;
      v19 = 2114;
      v20 = v11;
      _os_log_impl(&dword_218C99000, v12, OS_LOG_TYPE_INFO, "%{public}@: Transfer with identifier %{public}@ %{public}@", buf, 0x20u);
    }

    -[CRKShowOpenDialogOperation failWithError:](self, "failWithError:", v8);
  }

}

- (void)cleanupHiddenTransferItemsIfNeeded
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = *a1;
  v5 = a2;
  objc_msgSend(a3, "verboseDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543618;
  v9 = v4;
  v10 = 2114;
  v11 = v6;
  OUTLINED_FUNCTION_0_2(&dword_218C99000, v5, v7, "Unable to cleanup directory: %{public}@: %{public}@", (uint8_t *)&v8);

}

- (void)succeedIfNeeded
{
  void *v4;
  void *v5;

  if ((-[CRKShowOpenDialogOperation isExecuting](self, "isExecuting") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKShowOpenDialogOperation.m"), 356, CFSTR("Not executing"));

  }
  if (self->mTransferAccepted && self->mTransferFinished)
  {
    -[CRKShowOpenDialogOperation transfer](self, "transfer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    -[CRKShowOpenDialogOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
  }
}

- (void)failWithError:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  SEL v13;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKShowOpenDialogOperation.m"), 365, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("failureError"));

  }
  if ((-[CRKShowOpenDialogOperation isExecuting](self, "isExecuting") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKShowOpenDialogOperation.m"), 366, CFSTR("Not executing"));

  }
  -[CRKShowOpenDialogOperation cleanupHiddenTransferItemsIfNeeded](self, "cleanupHiddenTransferItemsIfNeeded");
  _CRKLogOperation();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[CRKShowOpenDialogOperation failWithError:].cold.1((uint64_t)self, (uint64_t)v5, v6);

  -[CRKShowOpenDialogOperation transfer](self, "transfer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[CRKShowOpenDialogOperation transfer](self, "transfer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __44__CRKShowOpenDialogOperation_failWithError___block_invoke;
    v11[3] = &unk_24D9C9200;
    v13 = a2;
    v11[4] = self;
    v12 = v5;
    objc_msgSend(v8, "updateWithState:completion:", 3, v11);

  }
  else
  {
    -[CRKShowOpenDialogOperation endOperationWithError:](self, "endOperationWithError:", v5);
  }

}

void __44__CRKShowOpenDialogOperation_failWithError___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  int v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(const char **)(a1 + 48);
    v14 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", v13, v14, CFSTR("CRKShowOpenDialogOperation.m"), 378, CFSTR("%@ must be called from the main thread"), v15);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "isExecuting"))
  {
    _CRKLogOperation();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138544130;
      v17 = v10;
      v18 = 1024;
      v19 = a2;
      v20 = 2114;
      v21 = v7;
      v22 = 2114;
      v23 = v8;
      _os_log_impl(&dword_218C99000, v9, OS_LOG_TYPE_INFO, "%{public}@: Transfer canceled: success: %d, destination: %{public}@, error: %{public}@", buf, 0x26u);
    }

    objc_msgSend(*(id *)(a1 + 32), "transfer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "invalidate");

    objc_msgSend(*(id *)(a1 + 32), "endOperationWithError:", *(_QWORD *)(a1 + 40));
  }

}

+ (id)fakeBundleID
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", CFSTR(".fake"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)cleanupDelay
{
  return self->_cleanupDelay;
}

- (CRKSharingPrimitives)sharingPrimitives
{
  return self->_sharingPrimitives;
}

- (CRKFileSystemPrimitives)fileSystemPrimitives
{
  return self->_fileSystemPrimitives;
}

- (CRKSharingAirDropTransfer)transfer
{
  return self->_transfer;
}

- (void)setTransfer:(id)a3
{
  objc_storeStrong((id *)&self->_transfer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transfer, 0);
  objc_storeStrong((id *)&self->_fileSystemPrimitives, 0);
  objc_storeStrong((id *)&self->_sharingPrimitives, 0);
  objc_storeStrong((id *)&self->mTransferDirectoryURL, 0);
  objc_storeStrong((id *)&self->mFilesDescription, 0);
  objc_storeStrong((id *)&self->mSourceBundleIdentifier, 0);
  objc_storeStrong((id *)&self->mSenderName, 0);
  objc_storeStrong((id *)&self->mPreviewImageData, 0);
  objc_storeStrong((id *)&self->mURLs, 0);
}

- (void)failWithError:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  OUTLINED_FUNCTION_0_2(&dword_218C99000, a3, (uint64_t)a3, "%{public}@: Failed. Error: %{public}@", (uint8_t *)&v3);
}

@end
