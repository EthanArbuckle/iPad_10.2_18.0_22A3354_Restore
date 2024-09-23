@implementation MPStoreDownload

- (MPStoreDownload)initWithType:(int64_t)a3 attributes:(id)a4
{
  id v6;
  MPStoreDownload *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *accessQueue;
  uint64_t v10;
  NSDictionary *attributes;
  void *v12;
  objc_super v14;

  v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MPStoreDownload;
  v7 = -[MPStoreDownload init](&v14, sel_init);
  if (v7)
  {
    v8 = dispatch_queue_create("com.apple.MediaPlayer.MPStoreDownload.accessQueue", MEMORY[0x1E0C80D50]);
    accessQueue = v7->_accessQueue;
    v7->_accessQueue = (OS_dispatch_queue *)v8;

    v7->_type = a3;
    v10 = objc_msgSend(v6, "copy");
    attributes = v7->_attributes;
    v7->_attributes = (NSDictionary *)v10;

    objc_msgSend((id)objc_opt_class(), "_SSPurchaseForType:attributes:", a3, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPStoreDownload _setSSPurchase:SSPurchaseResponse:](v7, "_setSSPurchase:SSPurchaseResponse:", v12, 0);

  }
  return v7;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  const __CFString *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPStoreDownload phaseIdentifier](self, "phaseIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPStoreDownload failureError](self, "failureError");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MPStoreDownload isCanceled](self, "isCanceled");
  v9 = CFSTR("NO");
  if (v8)
    v9 = CFSTR("YES");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p %@ error:%@ canceled:%@>"), v5, self, v6, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (int64_t)bytesDownloaded
{
  void *v2;
  int64_t v3;

  -[MPStoreDownload _SSDownload](self, "_SSDownload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "bytesDownloaded");

  return v3;
}

- (int64_t)bytesTotal
{
  void *v2;
  int64_t v3;

  -[MPStoreDownload _SSDownload](self, "_SSDownload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "bytesTotal");

  return v3;
}

- (int64_t)downloadIdentifier
{
  void *v3;
  int64_t v4;
  void *v5;

  -[MPStoreDownload _SSDownload](self, "_SSDownload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "persistentIdentifier");
  if (!v4)
  {
    -[MPStoreDownload _SSPurchase](self, "_SSPurchase");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "placeholderDownloadIdentifier");

  }
  return v4;
}

- (int64_t)downloadSizeLimit
{
  void *v2;
  int64_t v3;

  -[MPStoreDownload _SSDownload](self, "_SSDownload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "downloadSizeLimit");

  return v3;
}

- (NSError)failureError
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if (!-[MPStoreDownload _isCanceled](self, "_isCanceled"))
  {
    -[MPStoreDownload _SSPurchaseResponse](self, "_SSPurchaseResponse");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "error");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v3 = (void *)v5;

      return (NSError *)v3;
    }
    -[MPStoreDownload _SSDownload](self, "_SSDownload");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "failureError");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
      return (NSError *)v3;
    if (!-[MPStoreDownload isCanceled](self, "isCanceled"))
    {
      v3 = 0;
      return (NSError *)v3;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB32E8], -999, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  return (NSError *)v3;
}

- (BOOL)isCanceled
{
  void *v4;
  char v5;

  if (-[MPStoreDownload _isCanceled](self, "_isCanceled"))
    return 1;
  -[MPStoreDownload phaseIdentifier](self, "phaseIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("MPStoreDownloadPhaseCanceled"));

  return v5;
}

- (BOOL)isFinished
{
  BOOL v3;
  void *v4;
  void *v6;
  void *v7;

  if (-[MPStoreDownload _isCanceled](self, "_isCanceled"))
    return 1;
  -[MPStoreDownload phaseIdentifier](self, "phaseIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("MPStoreDownloadPhaseFinished")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("MPStoreDownloadPhaseCanceled")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("MPStoreDownloadPhaseFailed")) & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    -[MPStoreDownload _SSPurchaseResponse](self, "_SSPurchaseResponse");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = v7 != 0;
  }

  return v3;
}

- (BOOL)isPurchasing
{
  void *v2;
  BOOL v3;

  -[MPStoreDownload _SSPurchase](self, "_SSPurchase");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isRestore
{
  _QWORD *v3;
  void *v4;
  void *v5;
  char v6;
  BOOL result;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v3 = (_QWORD *)getSSDownloadPropertyIsRestoreSymbolLoc_ptr;
  v13 = getSSDownloadPropertyIsRestoreSymbolLoc_ptr;
  if (!getSSDownloadPropertyIsRestoreSymbolLoc_ptr)
  {
    v4 = StoreServicesLibrary();
    v3 = dlsym(v4, "SSDownloadPropertyIsRestore");
    v11[3] = (uint64_t)v3;
    getSSDownloadPropertyIsRestoreSymbolLoc_ptr = (uint64_t)v3;
  }
  _Block_object_dispose(&v10, 8);
  if (v3)
  {
    -[MPStoreDownload _valueForDownloadProperty:](self, "_valueForDownloadProperty:", *v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");

    return v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getSSDownloadPropertyIsRestore(void)");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("MPStoreDownload.m"), 49, CFSTR("%s"), dlerror());

    __break(1u);
  }
  return result;
}

- (BOOL)isPaused
{
  void *v2;
  char v3;

  -[MPStoreDownload phaseIdentifier](self, "phaseIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("MPStoreDownloadPhasePaused"));

  return v3;
}

- (unint64_t)libraryItemIdentifier
{
  void *v3;
  void *v4;
  unint64_t v5;

  getSSDownloadPropertyLibraryItemIdentifier();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPStoreDownload _valueForDownloadProperty:](self, "_valueForDownloadProperty:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "longLongValue");

  return v5;
}

- (double)percentComplete
{
  void *v2;
  double v3;
  double v4;

  -[MPStoreDownload _SSDownload](self, "_SSDownload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "percentComplete");
  v4 = v3;

  return v4;
}

- (NSString)phaseIdentifier
{
  void *v3;
  void *v4;
  __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  BOOL v14;
  const __CFString *v15;
  _QWORD *v16;
  void *v17;
  _QWORD *v18;
  void *v19;
  _QWORD *v20;
  void *v21;
  _QWORD *v22;
  void *v23;
  _QWORD *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  char v29;
  void *v30;
  char v31;
  void *v32;
  int v33;
  NSString *result;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;

  -[MPStoreDownload _currentOverridePhaseIdentifier](self, "_currentOverridePhaseIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
LABEL_54:

    return (NSString *)v5;
  }
  -[MPStoreDownload _SSPurchaseResponse](self, "_SSPurchaseResponse");
  v6 = objc_claimAutoreleasedReturnValue();
  -[MPStoreDownload _SSPurchase](self, "_SSPurchase");
  v7 = objc_claimAutoreleasedReturnValue();
  -[MPStoreDownload _SSDownload](self, "_SSDownload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v5 = CFSTR("MPStoreDownloadPhaseWaiting");
  if (v7 | v6 && !v8)
  {
LABEL_53:

    goto LABEL_54;
  }
  if (!v8)
  {
    objc_msgSend((id)v6, "error");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      v14 = v6 == 0;
    else
      v14 = 0;
    v15 = CFSTR("MPStoreDownloadPhasePurchasing");
    if (!v14)
      v15 = CFSTR("MPStoreDownloadPhaseFailed");
    if (v13)
      v5 = CFSTR("MPStoreDownloadPhaseFailed");
    else
      v5 = (__CFString *)v15;
    goto LABEL_53;
  }
  objc_msgSend(v8, "downloadPhaseIdentifier");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v11 = (_QWORD *)getSSDownloadPhaseCanceledSymbolLoc_ptr;
  v40 = getSSDownloadPhaseCanceledSymbolLoc_ptr;
  if (!getSSDownloadPhaseCanceledSymbolLoc_ptr)
  {
    v12 = StoreServicesLibrary();
    v11 = dlsym(v12, "SSDownloadPhaseCanceled");
    v38[3] = (uint64_t)v11;
    getSSDownloadPhaseCanceledSymbolLoc_ptr = (uint64_t)v11;
  }
  _Block_object_dispose(&v37, 8);
  if (v11)
  {
    if ((objc_msgSend(v10, "isEqualToString:", *v11) & 1) != 0)
    {
      v5 = CFSTR("MPStoreDownloadPhaseCanceled");
LABEL_52:

      v5 = v5;
      goto LABEL_53;
    }
    v37 = 0;
    v38 = &v37;
    v39 = 0x2020000000;
    v16 = (_QWORD *)getSSDownloadPhaseDataRestoreSymbolLoc_ptr;
    v40 = getSSDownloadPhaseDataRestoreSymbolLoc_ptr;
    if (!getSSDownloadPhaseDataRestoreSymbolLoc_ptr)
    {
      v17 = StoreServicesLibrary();
      v16 = dlsym(v17, "SSDownloadPhaseDataRestore");
      v38[3] = (uint64_t)v16;
      getSSDownloadPhaseDataRestoreSymbolLoc_ptr = (uint64_t)v16;
    }
    _Block_object_dispose(&v37, 8);
    if (v16)
    {
      if ((objc_msgSend(v10, "isEqualToString:", *v16) & 1) != 0)
      {
        v5 = CFSTR("MPStoreDownloadPhaseDataRestore");
        goto LABEL_52;
      }
      v37 = 0;
      v38 = &v37;
      v39 = 0x2020000000;
      v18 = (_QWORD *)getSSDownloadPhaseDownloadingSymbolLoc_ptr;
      v40 = getSSDownloadPhaseDownloadingSymbolLoc_ptr;
      if (!getSSDownloadPhaseDownloadingSymbolLoc_ptr)
      {
        v19 = StoreServicesLibrary();
        v18 = dlsym(v19, "SSDownloadPhaseDownloading");
        v38[3] = (uint64_t)v18;
        getSSDownloadPhaseDownloadingSymbolLoc_ptr = (uint64_t)v18;
      }
      _Block_object_dispose(&v37, 8);
      if (v18)
      {
        if ((objc_msgSend(v10, "isEqualToString:", *v18) & 1) != 0)
        {
          v5 = CFSTR("MPStoreDownloadPhaseDownloading");
          goto LABEL_52;
        }
        v37 = 0;
        v38 = &v37;
        v39 = 0x2020000000;
        v20 = (_QWORD *)getSSDownloadPhaseFailedSymbolLoc_ptr;
        v40 = getSSDownloadPhaseFailedSymbolLoc_ptr;
        if (!getSSDownloadPhaseFailedSymbolLoc_ptr)
        {
          v21 = StoreServicesLibrary();
          v20 = dlsym(v21, "SSDownloadPhaseFailed");
          v38[3] = (uint64_t)v20;
          getSSDownloadPhaseFailedSymbolLoc_ptr = (uint64_t)v20;
        }
        _Block_object_dispose(&v37, 8);
        if (v20)
        {
          if ((objc_msgSend(v10, "isEqualToString:", *v20) & 1) != 0)
          {
            v5 = CFSTR("MPStoreDownloadPhaseFailed");
            goto LABEL_52;
          }
          v37 = 0;
          v38 = &v37;
          v39 = 0x2020000000;
          v22 = (_QWORD *)getSSDownloadPhaseFinishedSymbolLoc_ptr;
          v40 = getSSDownloadPhaseFinishedSymbolLoc_ptr;
          if (!getSSDownloadPhaseFinishedSymbolLoc_ptr)
          {
            v23 = StoreServicesLibrary();
            v22 = dlsym(v23, "SSDownloadPhaseFinished");
            v38[3] = (uint64_t)v22;
            getSSDownloadPhaseFinishedSymbolLoc_ptr = (uint64_t)v22;
          }
          _Block_object_dispose(&v37, 8);
          if (v22)
          {
            if ((objc_msgSend(v10, "isEqualToString:", *v22) & 1) != 0)
            {
              v5 = CFSTR("MPStoreDownloadPhaseFinished");
              goto LABEL_52;
            }
            v37 = 0;
            v38 = &v37;
            v39 = 0x2020000000;
            v24 = (_QWORD *)getSSDownloadPhaseInstallingSymbolLoc_ptr;
            v40 = getSSDownloadPhaseInstallingSymbolLoc_ptr;
            if (!getSSDownloadPhaseInstallingSymbolLoc_ptr)
            {
              v25 = StoreServicesLibrary();
              v24 = dlsym(v25, "SSDownloadPhaseInstalling");
              v38[3] = (uint64_t)v24;
              getSSDownloadPhaseInstallingSymbolLoc_ptr = (uint64_t)v24;
            }
            _Block_object_dispose(&v37, 8);
            if (v24)
            {
              if ((objc_msgSend(v10, "isEqualToString:", *v24) & 1) != 0)
              {
                v5 = CFSTR("MPStoreDownloadPhaseInstalling");
              }
              else
              {
                getSSDownloadPhasePaused();
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = objc_msgSend(v10, "isEqualToString:", v26);

                if ((v27 & 1) != 0)
                {
                  v5 = CFSTR("MPStoreDownloadPhasePaused");
                }
                else
                {
                  getSSDownloadPhasePreflight();
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  v29 = objc_msgSend(v10, "isEqualToString:", v28);

                  if ((v29 & 1) != 0)
                  {
                    v5 = CFSTR("MPStoreDownloadPhasePreflight");
                  }
                  else
                  {
                    getSSDownloadPhaseProcessing();
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    v31 = objc_msgSend(v10, "isEqualToString:", v30);

                    if ((v31 & 1) != 0)
                    {
                      v5 = CFSTR("MPStoreDownloadPhaseProcessing");
                    }
                    else
                    {
                      getSSDownloadPhaseWaiting();
                      v32 = (void *)objc_claimAutoreleasedReturnValue();
                      v33 = objc_msgSend(v10, "isEqualToString:", v32);

                      if (!v33)
                        v5 = 0;
                    }
                  }
                }
              }
              goto LABEL_52;
            }
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getSSDownloadPhaseInstalling(void)");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "handleFailureInFunction:file:lineNumber:description:", v36, CFSTR("MPStoreDownload.m"), 36, CFSTR("%s"), dlerror());
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getSSDownloadPhaseFinished(void)");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "handleFailureInFunction:file:lineNumber:description:", v36, CFSTR("MPStoreDownload.m"), 35, CFSTR("%s"), dlerror());
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getSSDownloadPhaseFailed(void)");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "handleFailureInFunction:file:lineNumber:description:", v36, CFSTR("MPStoreDownload.m"), 34, CFSTR("%s"), dlerror());
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getSSDownloadPhaseDownloading(void)");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "handleFailureInFunction:file:lineNumber:description:", v36, CFSTR("MPStoreDownload.m"), 33, CFSTR("%s"), dlerror());
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getSSDownloadPhaseDataRestore(void)");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "handleFailureInFunction:file:lineNumber:description:", v36, CFSTR("MPStoreDownload.m"), 32, CFSTR("%s"), dlerror());
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getSSDownloadPhaseCanceled(void)");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInFunction:file:lineNumber:description:", v36, CFSTR("MPStoreDownload.m"), 31, CFSTR("%s"), dlerror());
  }

  __break(1u);
  return result;
}

- (NSError)purchaseError
{
  void *v3;
  void *v4;

  if (-[MPStoreDownload _isCanceled](self, "_isCanceled"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB32E8], -999, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MPStoreDownload _SSPurchaseResponse](self, "_SSPurchaseResponse");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "error");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSError *)v3;
}

- (int64_t)reason
{
  void *v3;
  void *v4;
  uint64_t v5;

  getSSDownloadPropertyReason();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPStoreDownload _valueForDownloadProperty:](self, "_valueForDownloadProperty:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  if (v5 == 1)
    return 1;
  else
    return 2 * (v5 == 2);
}

- (NSDictionary)rentalInformation
{
  void *v2;
  void *v3;
  void *v4;

  -[MPStoreDownload _SSDownload](self, "_SSDownload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  getSSDownloadExternalPropertyRentalInformation();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForExternalProperty:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (int64_t)storeItemIdentifier
{
  void *v3;
  void *v4;
  int64_t v5;

  getSSDownloadPropertyStoreItemIdentifier();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPStoreDownload _valueForDownloadProperty:](self, "_valueForDownloadProperty:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "longLongValue");

  return v5;
}

- (id)assetsForType:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MPStoreDownload _SSDownload](self, "_SSDownload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assetsForType:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)resetCachedRentalInformation
{
  void *v3;
  id v4[2];

  v4[1] = *(id *)MEMORY[0x1E0C80C00];
  getSSDownloadExternalPropertyRentalInformation();
  v4[0] = (id)objc_claimAutoreleasedReturnValue();
  -[MPStoreDownload _SSDownload](self, "_SSDownload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resetCachedExternalProperties:count:", v4, 1);

}

- (BOOL)_isCanceled
{
  NSObject *accessQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__MPStoreDownload__isCanceled__block_invoke;
  v5[3] = &unk_1E3163580;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_setCanceled:(BOOL)a3
{
  NSObject *accessQueue;
  _QWORD v4[5];
  BOOL v5;

  accessQueue = self->_accessQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __32__MPStoreDownload__setCanceled___block_invoke;
  v4[3] = &unk_1E3163468;
  v4[4] = self;
  v5 = a3;
  dispatch_barrier_async(accessQueue, v4);
}

- (void)_setSSDownload:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34__MPStoreDownload__setSSDownload___block_invoke;
  v7[3] = &unk_1E31635F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(accessQueue, v7);

}

- (void)_setSSPurchase:(id)a3 SSPurchaseResponse:(id)a4
{
  id v6;
  id v7;
  NSObject *accessQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__MPStoreDownload__setSSPurchase_SSPurchaseResponse___block_invoke;
  block[3] = &unk_1E3163698;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_barrier_async(accessQueue, block);

}

- (id)_SSDownload
{
  NSObject *accessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__49899;
  v10 = __Block_byref_object_dispose__49900;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__MPStoreDownload__SSDownload__block_invoke;
  v5[3] = &unk_1E3163580;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_SSPurchase
{
  NSObject *accessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__49899;
  v10 = __Block_byref_object_dispose__49900;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__MPStoreDownload__SSPurchase__block_invoke;
  v5[3] = &unk_1E3163580;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_SSPurchaseResponse
{
  NSObject *accessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__49899;
  v10 = __Block_byref_object_dispose__49900;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__MPStoreDownload__SSPurchaseResponse__block_invoke;
  v5[3] = &unk_1E3163580;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_getDownloadFilePath
{
  return self->_downloadFilePath;
}

- (void)_setDownloadFilePath:(id)a3
{
  objc_storeStrong((id *)&self->_downloadFilePath, a3);
}

- (void)_addOverridePhaseIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *accessQueue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    accessQueue = self->_accessQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __47__MPStoreDownload__addOverridePhaseIdentifier___block_invoke;
    v7[3] = &unk_1E31635F8;
    v7[4] = self;
    v8 = v4;
    dispatch_barrier_async(accessQueue, v7);

  }
}

- (void)_removeOverridePhaseIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *accessQueue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    accessQueue = self->_accessQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __50__MPStoreDownload__removeOverridePhaseIdentifier___block_invoke;
    v7[3] = &unk_1E31635F8;
    v7[4] = self;
    v8 = v4;
    dispatch_barrier_async(accessQueue, v7);

  }
}

- (id)_currentOverridePhaseIdentifier
{
  NSObject *accessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__49899;
  v10 = __Block_byref_object_dispose__49900;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__MPStoreDownload__currentOverridePhaseIdentifier__block_invoke;
  v5[3] = &unk_1E3163580;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_valueForDownloadProperty:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[MPStoreDownload _SSDownload](self, "_SSDownload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForProperty:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[MPStoreDownload _SSPurchase](self, "_SSPurchase");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "valueForDownloadProperty:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadFilePath, 0);
  objc_storeStrong((id *)&self->_SSPurchaseResponse, 0);
  objc_storeStrong((id *)&self->_SSPurchase, 0);
  objc_storeStrong((id *)&self->_SSDownload, 0);
  objc_storeStrong((id *)&self->_overridePhaseIdentifiers, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

void __50__MPStoreDownload__currentOverridePhaseIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "lastObject");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __50__MPStoreDownload__removeOverridePhaseIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, void *, uint64_t, _BYTE *);
  void *v9;
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0x7FFFFFFFFFFFFFFFLL;
  v6 = MEMORY[0x1E0C809B0];
  v8 = __50__MPStoreDownload__removeOverridePhaseIdentifier___block_invoke_2;
  v9 = &unk_1E3163490;
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v7 = 3221225472;
  v10 = v2;
  v11 = &v12;
  objc_msgSend(v3, "enumerateObjectsWithOptions:usingBlock:", 2, &v6);
  if (v13[3] != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectAtIndex:", v6, v7, v8, v9);
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(void **)(v4 + 32);
      *(_QWORD *)(v4 + 32) = 0;

    }
  }

  _Block_object_dispose(&v12, 8);
}

uint64_t __50__MPStoreDownload__removeOverridePhaseIdentifier___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "isEqualToString:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

uint64_t __47__MPStoreDownload__addOverridePhaseIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (!v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 32);
    *(_QWORD *)(v4 + 32) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  }
  return objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));
}

void __38__MPStoreDownload__SSPurchaseResponse__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 56));
}

void __30__MPStoreDownload__SSPurchase__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 48));
}

void __30__MPStoreDownload__SSDownload__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 40));
}

void __53__MPStoreDownload__setSSPurchase_SSPurchaseResponse___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  id *v4;
  void *v5;
  void *v6;

  v2 = a1[4];
  v3 = (void *)a1[5];
  if (*(void **)(v2 + 48) != v3)
  {
    objc_storeStrong((id *)(v2 + 48), v3);
    v2 = a1[4];
  }
  v5 = *(void **)(v2 + 56);
  v4 = (id *)(v2 + 56);
  v6 = (void *)a1[6];
  if (v5 != v6)
    objc_storeStrong(v4, v6);
}

void __34__MPStoreDownload__setSSDownload___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id *v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v5 = *(void **)(v2 + 40);
  v4 = (id *)(v2 + 40);
  if (v5 != v3)
    objc_storeStrong(v4, v3);
}

uint64_t __32__MPStoreDownload__setCanceled___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 24) != v2)
    *(_BYTE *)(v1 + 24) = v2;
  return result;
}

uint64_t __30__MPStoreDownload__isCanceled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 24);
  return result;
}

+ (id)storeDownloadForMediaItem:(id)a3 type:(int64_t)a4 attributes:(id)a5
{
  id v7;
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  const __CFString *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  __int16 v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _BOOL4 v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v44;
  void *v45;
  id v46;
  int64_t v47;
  _QWORD v48[2];

  v48[1] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  if (a3)
  {
    v8 = (objc_class *)MEMORY[0x1E0C99E08];
    v9 = a3;
    v10 = (void *)objc_msgSend([v8 alloc], "initWithCapacity:", objc_msgSend(v7, "count"));
    v47 = a4;
    if (storeDownloadForMediaItem_type_attributes__sOnceToken != -1)
      dispatch_once(&storeDownloadForMediaItem_type_attributes__sOnceToken, &__block_literal_global_49975);
    objc_msgSend(v9, "valuesForProperties:", storeDownloadForMediaItem_type_attributes__sPropertiesToFetch);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "objectForKey:", CFSTR("storeSagaID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "unsignedLongLongValue");

    objc_msgSend(v11, "objectForKey:", CFSTR("storeItemAdamID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "longLongValue");

    objc_msgSend(v11, "objectForKey:", CFSTR("subscriptionStoreItemAdamID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "longLongValue");

    objc_msgSend(v11, "objectForKey:", CFSTR("storePlaybackEndpointType"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "integerValue");

    v20 = 1;
    if (v13)
      v20 = 2;
    if (v19)
      v20 = v19;
    v44 = v17;
    if (v20 == 3)
    {
      v22 = CFSTR("redownloadProduct");
      v21 = 1;
    }
    else
    {
      v21 = 0;
      if (v20 == 2)
        v22 = CFSTR("paidRedownloadProduct");
      else
        v22 = CFSTR("redownloadProduct");
    }
    objc_msgSend(v11, "objectForKey:", CFSTR("persistentID"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "longLongValue");

    if (v24)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lli"), v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v25, CFSTR("MPStoreDownloadAttributeLibraryItemIdentifier"));

    }
    objc_msgSend(v11, "objectForKey:", CFSTR("title"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
      objc_msgSend(v10, "setObject:forKey:", v26, CFSTR("MPStoreDownloadAttributeTitle"));
    objc_msgSend(v11, "objectForKey:", CFSTR("mediaType"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "unsignedIntegerValue");

    MPStoreDownloadSSDownloadKindFromMPMediaType(v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v29, CFSTR("MPStoreDownloadAttributeKind"));
    if ((v21 & 1) != 0)
    {
      if (!v15)
        v15 = v44;
      if (v15)
      {
        v45 = v29;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v15);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKey:", v30, CFSTR("MPStoreDownloadAttributeStoreItemIdentifier"));

        v31 = objc_alloc_init(MEMORY[0x1E0CB3998]);
        v32 = (void *)MEMORY[0x1E0CB39D8];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), v15);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "queryItemWithName:value:", CFSTR("salableAdamId"), v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v48[0] = v34;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 1);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setQueryItems:", v35);

        objc_msgSend(v31, "query");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (v36)
          objc_msgSend(v10, "setObject:forKey:", v36, CFSTR("MPStoreDownloadAttributeBuyParameters"));

        v37 = 1;
        v22 = CFSTR("subDownload");
        v29 = v45;
      }
      else
      {
        v37 = 0;
        v22 = CFSTR("subDownload");
      }
    }
    else
    {
      v46 = v7;
      objc_msgSend(v11, "objectForKey:", CFSTR("storeRedownloadParameters"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v38 != 0;
      if (v38)
        objc_msgSend(v10, "setObject:forKey:", v38, CFSTR("MPStoreDownloadAttributeBuyParameters"));
      if (v13)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v13);
        v39 = v29;
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKey:", v40, CFSTR("MPStoreDownloadAttributeStoreSagaItemIdentifier"));

        v29 = v39;
      }
      if (v15)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v15);
        v41 = v29;
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKey:", v42, CFSTR("MPStoreDownloadAttributeStoreItemIdentifier"));

        v29 = v41;
      }

      v7 = v46;
    }
    objc_msgSend(v10, "setObject:forKey:", v22, CFSTR("MPStoreDownloadAttributeURLBagKey"));
    if (objc_msgSend(v7, "count"))
      objc_msgSend(v10, "addEntriesFromDictionary:", v7);
    if (v37)
      a3 = (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithType:attributes:", v47, v10);
    else
      a3 = 0;

  }
  return a3;
}

+ (id)storeDownloadWithDownloadIdentifier:(int64_t)a3
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithType:attributes:", 0, 0);
  v10 = 0;
  v11 = &v10;
  v12 = 0x2050000000;
  v5 = (void *)getSSDownloadClass_softClass;
  v13 = getSSDownloadClass_softClass;
  if (!getSSDownloadClass_softClass)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __getSSDownloadClass_block_invoke;
    v9[3] = &unk_1E31639A0;
    v9[4] = &v10;
    __getSSDownloadClass_block_invoke((uint64_t)v9);
    v5 = (void *)v11[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v10, 8);
  v7 = (void *)objc_msgSend([v6 alloc], "initWithPersistentIdentifier:", a3);
  objc_msgSend(v4, "_setSSDownload:", v7);

  return v4;
}

+ (id)_SSPurchaseForType:(int64_t)a3 attributes:(id)a4
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  objc_class *v9;
  id v10;
  void *v11;
  id *v12;
  void *v13;
  id v14;
  id *v15;
  void *v16;
  id v17;
  id *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id *v23;
  void *v24;
  id v25;
  id *v26;
  void *v27;
  id v28;
  id *v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  id v40;
  _QWORD *v41;
  void *v42;
  void *v43;
  objc_class *v44;
  id v45;
  id v46;
  _QWORD *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  int v55;
  id *v56;
  void *v57;
  id v58;
  id *v59;
  void *v60;
  id v61;
  void *v62;
  int v63;
  void *v64;
  void *v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t i;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  __CFString *v74;
  const __CFString *v75;
  void *v76;
  objc_class *v77;
  void *v78;
  id v79;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  id v101;
  void *v102;
  void *v103;
  void *v104;
  id v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  uint64_t *v124;
  uint64_t v125;
  uint64_t *v126;
  uint64_t v127;
  uint64_t v128;
  _BYTE v129[128];
  _QWORD v130[2];
  _QWORD v131[3];

  v131[1] = *MEMORY[0x1E0C80C00];
  v4 = a4;
  objc_msgSend(v4, "objectForKey:", CFSTR("MPStoreDownloadAttributeBuyParameters"));
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("MPStoreDownloadAttributeOriginator"));
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  if (v107)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("&reporting=%@"), v107);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  if (objc_msgSend(v5, "length"))
  {
    v6 = v5;
    objc_msgSend(v114, "stringByAppendingString:", v5);
    v7 = objc_claimAutoreleasedReturnValue();

    v114 = (void *)v7;
    v5 = v6;
  }
  v125 = 0;
  v126 = &v125;
  v127 = 0x2050000000;
  v8 = (void *)getSSPurchaseClass_softClass;
  v128 = getSSPurchaseClass_softClass;
  if (!getSSPurchaseClass_softClass)
  {
    v120 = MEMORY[0x1E0C809B0];
    v121 = 3221225472;
    v122 = (uint64_t)__getSSPurchaseClass_block_invoke;
    v123 = &unk_1E31639A0;
    v124 = &v125;
    __getSSPurchaseClass_block_invoke((uint64_t)&v120);
    v8 = (void *)v126[3];
  }
  v104 = v5;
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v125, 8);
  v10 = objc_alloc_init(v9);
  objc_msgSend(v10, "setBuyParameters:", v114);
  objc_msgSend(v10, "setIgnoresForcedPasswordRestriction:", a3 == 1);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
  objc_msgSend(v4, "objectForKey:", CFSTR("MPStoreDownloadAttributeTitle"));
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  if (v113)
  {
    v120 = 0;
    v121 = (uint64_t)&v120;
    v122 = 0x2020000000;
    v12 = (id *)getSSDownloadPropertyTitleSymbolLoc_ptr;
    v123 = (void *)getSSDownloadPropertyTitleSymbolLoc_ptr;
    if (!getSSDownloadPropertyTitleSymbolLoc_ptr)
    {
      v13 = StoreServicesLibrary();
      v12 = (id *)dlsym(v13, "SSDownloadPropertyTitle");
      *(_QWORD *)(v121 + 24) = v12;
      getSSDownloadPropertyTitleSymbolLoc_ptr = (uint64_t)v12;
    }
    _Block_object_dispose(&v120, 8);
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getSSDownloadPropertyTitle(void)");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "handleFailureInFunction:file:lineNumber:description:", v82, CFSTR("MPStoreDownload.m"), 50, CFSTR("%s"), dlerror());

      goto LABEL_109;
    }
    v14 = *v12;
    objc_msgSend(v11, "setObject:forKey:", v113, v14);

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("MPStoreDownloadAttributeKind"));
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  if (v115)
  {
    v120 = 0;
    v121 = (uint64_t)&v120;
    v122 = 0x2020000000;
    v15 = (id *)getSSDownloadPropertyKindSymbolLoc_ptr;
    v123 = (void *)getSSDownloadPropertyKindSymbolLoc_ptr;
    if (!getSSDownloadPropertyKindSymbolLoc_ptr)
    {
      v16 = StoreServicesLibrary();
      v15 = (id *)dlsym(v16, "SSDownloadPropertyKind");
      *(_QWORD *)(v121 + 24) = v15;
      getSSDownloadPropertyKindSymbolLoc_ptr = (uint64_t)v15;
    }
    _Block_object_dispose(&v120, 8);
    if (!v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getSSDownloadPropertyKind(void)");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "handleFailureInFunction:file:lineNumber:description:", v84, CFSTR("MPStoreDownload.m"), 29, CFSTR("%s"), dlerror());

      goto LABEL_109;
    }
    v17 = *v15;
    objc_msgSend(v11, "setObject:forKey:", v115, v17);

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("MPStoreDownloadAttributeDownloadHandlerIdentifier"));
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  if (v112)
  {
    v120 = 0;
    v121 = (uint64_t)&v120;
    v122 = 0x2020000000;
    v18 = (id *)getSSDownloadPropertyHandlerIDSymbolLoc_ptr;
    v123 = (void *)getSSDownloadPropertyHandlerIDSymbolLoc_ptr;
    if (!getSSDownloadPropertyHandlerIDSymbolLoc_ptr)
    {
      v19 = StoreServicesLibrary();
      v18 = (id *)dlsym(v19, "SSDownloadPropertyHandlerID");
      *(_QWORD *)(v121 + 24) = v18;
      getSSDownloadPropertyHandlerIDSymbolLoc_ptr = (uint64_t)v18;
    }
    _Block_object_dispose(&v120, 8);
    if (!v18)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getSSDownloadPropertyHandlerID(void)");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "handleFailureInFunction:file:lineNumber:description:", v86, CFSTR("MPStoreDownload.m"), 51, CFSTR("%s"), dlerror());

      goto LABEL_109;
    }
    v20 = *v18;
    objc_msgSend(v11, "setObject:forKey:", v112, v20);

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("MPStoreDownloadAttributeStoreItemIdentifier"));
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  if (v111)
  {
    getSSDownloadPropertyStoreItemIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v111, v21);

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("MPStoreDownloadAttributeLibraryItemIdentifier"));
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  if (v110)
  {
    getSSDownloadPropertyLibraryItemIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v110, v22);

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("MPStoreDownloadAttributeStoreSagaItemIdentifier"));
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  if (v109)
  {
    v120 = 0;
    v121 = (uint64_t)&v120;
    v122 = 0x2020000000;
    v23 = (id *)getSSDownloadPropertyStoreSagaIdentifierSymbolLoc_ptr;
    v123 = (void *)getSSDownloadPropertyStoreSagaIdentifierSymbolLoc_ptr;
    if (!getSSDownloadPropertyStoreSagaIdentifierSymbolLoc_ptr)
    {
      v24 = StoreServicesLibrary();
      v23 = (id *)dlsym(v24, "SSDownloadPropertyStoreSagaIdentifier");
      *(_QWORD *)(v121 + 24) = v23;
      getSSDownloadPropertyStoreSagaIdentifierSymbolLoc_ptr = (uint64_t)v23;
    }
    _Block_object_dispose(&v120, 8);
    if (!v23)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getSSDownloadPropertyStoreSagaIdentifier(void)");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "handleFailureInFunction:file:lineNumber:description:", v88, CFSTR("MPStoreDownload.m"), 41, CFSTR("%s"), dlerror());

      goto LABEL_109;
    }
    v25 = *v23;
    objc_msgSend(v11, "setObject:forKey:", v109, v25);

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("MPStoreDownloadAttributeClientBundleIdentifier"));
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  if (v108)
  {
    v120 = 0;
    v121 = (uint64_t)&v120;
    v122 = 0x2020000000;
    v26 = (id *)getSSDownloadPropertyClientBundleIdentifierSymbolLoc_ptr;
    v123 = (void *)getSSDownloadPropertyClientBundleIdentifierSymbolLoc_ptr;
    if (!getSSDownloadPropertyClientBundleIdentifierSymbolLoc_ptr)
    {
      v27 = StoreServicesLibrary();
      v26 = (id *)dlsym(v27, "SSDownloadPropertyClientBundleIdentifier");
      *(_QWORD *)(v121 + 24) = v26;
      getSSDownloadPropertyClientBundleIdentifierSymbolLoc_ptr = (uint64_t)v26;
    }
    _Block_object_dispose(&v120, 8);
    if (!v26)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getSSDownloadPropertyClientBundleIdentifier(void)");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "handleFailureInFunction:file:lineNumber:description:", v90, CFSTR("MPStoreDownload.m"), 43, CFSTR("%s"), dlerror());

      goto LABEL_109;
    }
    v28 = *v26;
    objc_msgSend(v11, "setObject:forKey:", v108, v28);

  }
  if (v115)
  {
    v106 = v115;
  }
  else
  {
    v120 = 0;
    v121 = (uint64_t)&v120;
    v122 = 0x2020000000;
    v29 = (id *)getSSDownloadKindMusicSymbolLoc_ptr;
    v123 = (void *)getSSDownloadKindMusicSymbolLoc_ptr;
    if (!getSSDownloadKindMusicSymbolLoc_ptr)
    {
      v30 = StoreServicesLibrary();
      v29 = (id *)dlsym(v30, "SSDownloadKindMusic");
      *(_QWORD *)(v121 + 24) = v29;
      getSSDownloadKindMusicSymbolLoc_ptr = (uint64_t)v29;
    }
    _Block_object_dispose(&v120, 8);
    if (!v29)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getSSDownloadKindMusic(void)");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "handleFailureInFunction:file:lineNumber:description:", v96, CFSTR("MPStoreDownload.m"), 42, CFSTR("%s"), dlerror());

      goto LABEL_109;
    }
    v106 = *v29;

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("MPStoreDownloadAttributeShouldDisableCellularRestrictionEnforcement"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "BOOLValue");

  if ((v32 & 1) != 0)
    goto LABEL_68;
  objc_msgSend(v4, "objectForKey:", CFSTR("MPStoreDownloadAttributeShouldRespectStoreCellularDataRestriction"));
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v103 || objc_msgSend(v103, "BOOLValue"))
  {
    objc_msgSend(v10, "downloadPolicy");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v33)
      v33 = (void *)objc_msgSend(objc_alloc((Class)getSSDownloadPolicyClass()), "initWithDownloadKind:URLBagType:", v106, 0);
    v34 = objc_alloc_init((Class)getSSDownloadPolicyRuleClass());
    objc_msgSend(v34, "setCellularDataStates:", 2);
    objc_msgSend(v33, "policyRules");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)objc_msgSend(v35, "mutableCopy");

    if (v36)
    {
      objc_msgSend(v36, "arrayByAddingObject:", v34);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v131[0] = v34;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v131, 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v33, "setPolicyRules:", v37);
    objc_msgSend(v10, "setDownloadPolicy:", v33);

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("MPStoreDownloadAttributeShouldRespectMusicCellularDataRestriction"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "BOOLValue");

  if (v39)
  {
    objc_msgSend(v10, "downloadPolicy");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v102)
      v102 = (void *)objc_msgSend(objc_alloc((Class)getSSDownloadPolicyClass()), "initWithDownloadKind:URLBagType:", v106, 0);
    v101 = objc_alloc_init((Class)getSSDownloadPolicyRuleClass());
    v40 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    objc_msgSend(v40, "addObject:", &unk_1E31E4EE8);
    objc_msgSend(v40, "addObject:", &unk_1E31E4F00);
    objc_msgSend(v40, "addObject:", &unk_1E31E4F18);
    objc_msgSend(v40, "addObject:", &unk_1E31E4F30);
    objc_msgSend(v40, "addObject:", &unk_1E31E4F48);
    objc_msgSend(v40, "addObject:", &unk_1E31E4F60);
    objc_msgSend(v40, "addObject:", &unk_1E31E4F78);
    objc_msgSend(v40, "addObject:", &unk_1E31E4F90);
    objc_msgSend(v101, "setNetworkTypes:", v40);
    v120 = 0;
    v121 = (uint64_t)&v120;
    v122 = 0x2020000000;
    v41 = (_QWORD *)getSSDownloadSizeLimitNoLimitSymbolLoc_ptr;
    v123 = (void *)getSSDownloadSizeLimitNoLimitSymbolLoc_ptr;
    if (!getSSDownloadSizeLimitNoLimitSymbolLoc_ptr)
    {
      v42 = StoreServicesLibrary();
      v41 = dlsym(v42, "SSDownloadSizeLimitNoLimit");
      *(_QWORD *)(v121 + 24) = v41;
      getSSDownloadSizeLimitNoLimitSymbolLoc_ptr = (uint64_t)v41;
    }
    _Block_object_dispose(&v120, 8);
    if (v41)
    {
      objc_msgSend(v101, "setDownloadSizeLimit:", *v41);
      v125 = 0;
      v126 = &v125;
      v127 = 0x2050000000;
      v43 = (void *)getSSDownloadPolicyUserDefaultStateClass_softClass;
      v128 = getSSDownloadPolicyUserDefaultStateClass_softClass;
      if (!getSSDownloadPolicyUserDefaultStateClass_softClass)
      {
        v120 = MEMORY[0x1E0C809B0];
        v121 = 3221225472;
        v122 = (uint64_t)__getSSDownloadPolicyUserDefaultStateClass_block_invoke;
        v123 = &unk_1E31639A0;
        v124 = &v125;
        __getSSDownloadPolicyUserDefaultStateClass_block_invoke((uint64_t)&v120);
        v43 = (void *)v126[3];
      }
      v44 = objc_retainAutorelease(v43);
      _Block_object_dispose(&v125, 8);
      v45 = objc_alloc_init(v44);
      objc_msgSend(v45, "setDomain:", CFSTR("com.apple.Music"));
      objc_msgSend(v45, "setKey:", CFSTR("AllowsCellularDataDownloads"));
      objc_msgSend(v45, "setFallbackNumberValue:", MEMORY[0x1E0C9AAA0]);
      objc_msgSend(v101, "addUserDefaultState:", v45);
      v46 = objc_alloc_init((Class)getSSDownloadPolicyRuleClass());
      objc_msgSend(v46, "setNetworkTypes:", v40);
      v120 = 0;
      v121 = (uint64_t)&v120;
      v122 = 0x2020000000;
      v47 = (_QWORD *)getSSDownloadSizeLimitDisabledSymbolLoc_ptr;
      v123 = (void *)getSSDownloadSizeLimitDisabledSymbolLoc_ptr;
      if (!getSSDownloadSizeLimitDisabledSymbolLoc_ptr)
      {
        v48 = StoreServicesLibrary();
        v47 = dlsym(v48, "SSDownloadSizeLimitDisabled");
        *(_QWORD *)(v121 + 24) = v47;
        getSSDownloadSizeLimitDisabledSymbolLoc_ptr = (uint64_t)v47;
      }
      _Block_object_dispose(&v120, 8);
      if (v47)
      {
        objc_msgSend(v46, "setDownloadSizeLimit:", *v47);
        v49 = (void *)objc_msgSend(v45, "copy");
        objc_msgSend(v49, "setShouldInvertBoolValue:", 1);
        objc_msgSend(v46, "addUserDefaultState:", v49);
        v130[0] = v101;
        v130[1] = v46;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v130, 2);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "policyRules");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = v51;
        if (v51)
        {
          objc_msgSend(v51, "arrayByAddingObjectsFromArray:", v50);
          v53 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v53 = v50;
        }
        objc_msgSend(v102, "setPolicyRules:", v53);
        objc_msgSend(v10, "setDownloadPolicy:", v102);

        goto LABEL_67;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "off_t getSSDownloadSizeLimitDisabled(void)");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "handleFailureInFunction:file:lineNumber:description:", v100, CFSTR("MPStoreDownload.m"), 53, CFSTR("%s"), dlerror());

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "off_t getSSDownloadSizeLimitNoLimit(void)");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "handleFailureInFunction:file:lineNumber:description:", v98, CFSTR("MPStoreDownload.m"), 52, CFSTR("%s"), dlerror());

    }
LABEL_109:
    __break(1u);
  }
LABEL_67:

LABEL_68:
  objc_msgSend(v4, "objectForKey:", CFSTR("MPStoreDownloadAttributeBackgroundRequest"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v54, "BOOLValue");

  if (!v55)
    goto LABEL_76;
  v120 = 0;
  v121 = (uint64_t)&v120;
  v122 = 0x2020000000;
  v56 = (id *)getSSDownloadPropertyShouldCancelOnFailureSymbolLoc_ptr;
  v123 = (void *)getSSDownloadPropertyShouldCancelOnFailureSymbolLoc_ptr;
  if (!getSSDownloadPropertyShouldCancelOnFailureSymbolLoc_ptr)
  {
    v57 = StoreServicesLibrary();
    v56 = (id *)dlsym(v57, "SSDownloadPropertyShouldCancelOnFailure");
    *(_QWORD *)(v121 + 24) = v56;
    getSSDownloadPropertyShouldCancelOnFailureSymbolLoc_ptr = (uint64_t)v56;
  }
  _Block_object_dispose(&v120, 8);
  if (!v56)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getSSDownloadPropertyShouldCancelOnFailure(void)");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "handleFailureInFunction:file:lineNumber:description:", v92, CFSTR("MPStoreDownload.m"), 44, CFSTR("%s"), dlerror());

    goto LABEL_109;
  }
  v58 = *v56;
  objc_msgSend(v11, "setObject:forKey:", MEMORY[0x1E0C9AAB0], v58);

  v120 = 0;
  v121 = (uint64_t)&v120;
  v122 = 0x2020000000;
  v59 = (id *)getSSDownloadPropertyShouldSuppressErrorDialogsSymbolLoc_ptr;
  v123 = (void *)getSSDownloadPropertyShouldSuppressErrorDialogsSymbolLoc_ptr;
  if (!getSSDownloadPropertyShouldSuppressErrorDialogsSymbolLoc_ptr)
  {
    v60 = StoreServicesLibrary();
    v59 = (id *)dlsym(v60, "SSDownloadPropertyShouldSuppressErrorDialogs");
    *(_QWORD *)(v121 + 24) = v59;
    getSSDownloadPropertyShouldSuppressErrorDialogsSymbolLoc_ptr = (uint64_t)v59;
  }
  _Block_object_dispose(&v120, 8);
  if (!v59)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getSSDownloadPropertyShouldSuppressErrorDialogs(void)");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "handleFailureInFunction:file:lineNumber:description:", v94, CFSTR("MPStoreDownload.m"), 45, CFSTR("%s"), dlerror());

    goto LABEL_109;
  }
  v61 = *v59;
  objc_msgSend(v11, "setObject:forKey:", MEMORY[0x1E0C9AAB0], v61);

  objc_msgSend(v10, "setBackgroundPurchase:", 1);
LABEL_76:
  objc_msgSend(v4, "objectForKey:", CFSTR("MPStoreDownloadAttributeDisplaysOnLockscreen"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(v62, "BOOLValue");

  if (v63)
    objc_msgSend(v10, "setDisplaysOnLockScreen:", 1);
  objc_msgSend(v4, "objectForKey:", CFSTR("MPStoreDownloadAttributeReason"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  if (v64)
  {
    getSSDownloadPropertyReason();
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v64, v65);

  }
  v118 = 0u;
  v119 = 0u;
  v116 = 0u;
  v117 = 0u;
  v66 = v11;
  v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v116, v129, 16);
  if (v67)
  {
    v68 = *(_QWORD *)v117;
    do
    {
      for (i = 0; i != v67; ++i)
      {
        if (*(_QWORD *)v117 != v68)
          objc_enumerationMutation(v66);
        v70 = *(_QWORD *)(*((_QWORD *)&v116 + 1) + 8 * i);
        objc_msgSend(v66, "objectForKey:", v70);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setValue:forDownloadProperty:", v71, v70);

      }
      v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v116, v129, 16);
    }
    while (v67);
  }

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v115
    || (objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), CFSTR("MPStoreDownloadURLBagKeyOverride"), v115), v73 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v72, "objectForKey:", v73), v74 = (__CFString *)objc_claimAutoreleasedReturnValue(), v73, !v74))
  {
    objc_msgSend(v72, "objectForKey:", CFSTR("MPStoreDownloadURLBagKeyOverride"));
    v74 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!v74)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("MPStoreDownloadAttributeURLBagKey"));
      v74 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (!v74)
      {
        v75 = CFSTR("buyProduct");
        if (a3 != 2)
          v75 = 0;
        if (a3 == 1)
          v74 = CFSTR("redownloadProduct");
        else
          v74 = (__CFString *)v75;
      }
    }
  }
  v125 = 0;
  v126 = &v125;
  v127 = 0x2050000000;
  v76 = (void *)getSSMutableURLRequestPropertiesClass_softClass;
  v128 = getSSMutableURLRequestPropertiesClass_softClass;
  if (!getSSMutableURLRequestPropertiesClass_softClass)
  {
    v120 = MEMORY[0x1E0C809B0];
    v121 = 3221225472;
    v122 = (uint64_t)__getSSMutableURLRequestPropertiesClass_block_invoke;
    v123 = &unk_1E31639A0;
    v124 = &v125;
    __getSSMutableURLRequestPropertiesClass_block_invoke((uint64_t)&v120);
    v76 = (void *)v126[3];
  }
  v77 = objc_retainAutorelease(v76);
  _Block_object_dispose(&v125, 8);
  v78 = (void *)objc_msgSend([v77 alloc], "initWithURLRequest:", 0);
  objc_msgSend(v78, "setURLBagKey:", v74);
  objc_msgSend(v10, "setRequestProperties:", v78);
  v79 = v10;

  return v79;
}

void __61__MPStoreDownload_storeDownloadForMediaItem_type_attributes___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("storeRedownloadParameters"), CFSTR("persistentID"), CFSTR("storeSagaID"), CFSTR("title"), CFSTR("storeItemAdamID"), CFSTR("subscriptionStoreItemAdamID"), CFSTR("mediaType"), CFSTR("storePlaybackEndpointType"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)storeDownloadForMediaItem_type_attributes__sPropertiesToFetch;
  storeDownloadForMediaItem_type_attributes__sPropertiesToFetch = v0;

}

@end
