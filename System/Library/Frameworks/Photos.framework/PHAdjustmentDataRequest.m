@implementation PHAdjustmentDataRequest

- (PHAdjustmentDataRequest)initWithRequestID:(int)a3 requestIndex:(unint64_t)a4 contextType:(int64_t)a5 managerID:(unint64_t)a6 asset:(id)a7 behaviorSpec:(id)a8 delegate:(id)a9
{
  uint64_t v14;
  id v16;
  id v17;
  PHAdjustmentDataRequest *v18;
  PHAdjustmentDataRequest *v19;
  PHAdjustmentDataResult *v20;
  PHAdjustmentDataResult *adjustmentDataResult;
  dispatch_semaphore_t v22;
  OS_dispatch_semaphore *syncDownloadWaitSemaphore;
  void *v24;
  objc_super v26;

  v14 = *(_QWORD *)&a3;
  v16 = a8;
  v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)PHAdjustmentDataRequest;
  v18 = -[PHMediaRequest initWithRequestID:requestIndex:contextType:managerID:asset:delegate:](&v26, sel_initWithRequestID_requestIndex_contextType_managerID_asset_delegate_, v14, a4, a5, a6, a7, v17);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_behaviorSpec, a8);
    objc_storeWeak((id *)&v19->_adjustmentDataDelegate, v17);
    v20 = -[PHCompositeMediaResult initWithRequestID:]([PHAdjustmentDataResult alloc], "initWithRequestID:", v14);
    adjustmentDataResult = v19->_adjustmentDataResult;
    v19->_adjustmentDataResult = v20;

    if (objc_msgSend(v16, "isSynchronous"))
    {
      v22 = dispatch_semaphore_create(0);
      syncDownloadWaitSemaphore = v19->_syncDownloadWaitSemaphore;
      v19->_syncDownloadWaitSemaphore = (OS_dispatch_semaphore *)v22;

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObserver:selector:name:object:", v19, sel__cplDownloadStatusNotification_, *MEMORY[0x1E0D74050], 0);

  }
  return v19;
}

- (void)_finishFromAsynchronousCallback
{
  id v3;

  if (-[PHAdjustmentDataRequestBehaviorSpec isSynchronous](self->_behaviorSpec, "isSynchronous"))
  {
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_syncDownloadWaitSemaphore);
  }
  else
  {
    -[PHMediaRequest delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mediaRequest:didFinishWithResult:", self, self->_adjustmentDataResult);

  }
}

- (BOOL)isSynchronous
{
  return -[PHAdjustmentDataRequestBehaviorSpec isSynchronous](self->_behaviorSpec, "isSynchronous");
}

- (void)startRequest
{
  NSObject *v3;
  void *v4;
  _BOOL4 v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  _QWORD v15[5];
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  PLImageManagerGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[PHMediaRequest identifierString](self, "identifierString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[PHAdjustmentDataRequest isSynchronous](self, "isSynchronous");
    v6 = CFSTR("N");
    if (v5)
      v6 = CFSTR("Y");
    *(_DWORD *)buf = 138412546;
    v17 = v4;
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_1991EC000, v3, OS_LOG_TYPE_DEBUG, "[RM]: %@ starting adjustment data request, sync: %@", buf, 0x16u);

  }
  -[PHMediaRequest asset](self, "asset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "assetsdClient");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "resourceClient");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHMediaRequest asset](self, "asset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PHAdjustmentDataRequestBehaviorSpec isNetworkAccessAllowed](self->_behaviorSpec, "isNetworkAccessAllowed");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __39__PHAdjustmentDataRequest_startRequest__block_invoke;
  v15[3] = &unk_1E35DF880;
  v15[4] = self;
  objc_msgSend(v10, "adjustmentDataForAsset:networkAccessAllowed:trackCPLDownload:completionHandler:", v12, v13, 1, v15);

  if (-[PHAdjustmentDataRequestBehaviorSpec isSynchronous](self->_behaviorSpec, "isSynchronous"))
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_syncDownloadWaitSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    -[PHMediaRequest delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "mediaRequest:didFinishWithResult:", self, self->_adjustmentDataResult);

  }
}

- (void)cancel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  PLCPLDownloadContext *legacyDownloadContext;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PHAdjustmentDataRequest;
  -[PHMediaRequest cancel](&v8, sel_cancel);
  if (self->_legacyDownloadContext)
  {
    -[PHMediaRequest asset](self, "asset");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "photoLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assetsdClient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "cloudClient");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cancelCPLDownloadWithContext:completionHandler:", self->_legacyDownloadContext, 0);

    legacyDownloadContext = self->_legacyDownloadContext;
    self->_legacyDownloadContext = 0;

  }
}

- (void)_cplDownloadStatusNotification:(id)a3
{
  void *v4;
  PLCPLDownloadContext *legacyDownloadContext;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  legacyDownloadContext = self->_legacyDownloadContext;
  if (legacyDownloadContext)
  {
    -[PLCPLDownloadContext taskIdentifier](legacyDownloadContext, "taskIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D74060]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if (v8)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D74040]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "BOOLValue");

      objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D74058]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        objc_msgSend(v11, "doubleValue");
        v14 = v13;
      }
      else
      {
        v14 = NAN;
      }
      objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D74048]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHAdjustmentDataRequest adjustmentDataDelegate](self, "adjustmentDataDelegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "adjustmentDataRequest:didReportProgress:completed:error:", self, v10, v15, v14);

      if ((_DWORD)v10)
      {
        -[PHMediaRequest asset](self, "asset");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "photoLibrary");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "assetsdClient");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v19, "resourceClient");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHMediaRequest asset](self, "asset");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __58__PHAdjustmentDataRequest__cplDownloadStatusNotification___block_invoke;
        v23[3] = &unk_1E35DF880;
        v23[4] = self;
        objc_msgSend(v20, "adjustmentDataForAsset:networkAccessAllowed:trackCPLDownload:completionHandler:", v22, 0, 0, v23);

      }
    }
  }

}

- (PHAdjustmentDataRequestDelegate)adjustmentDataDelegate
{
  return (PHAdjustmentDataRequestDelegate *)objc_loadWeakRetained((id *)&self->_adjustmentDataDelegate);
}

- (PHAdjustmentDataRequestBehaviorSpec)behaviorSpec
{
  return self->_behaviorSpec;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_behaviorSpec, 0);
  objc_destroyWeak((id *)&self->_adjustmentDataDelegate);
  objc_storeStrong((id *)&self->_syncDownloadWaitSemaphore, 0);
  objc_storeStrong((id *)&self->_adjustmentDataResult, 0);
  objc_storeStrong((id *)&self->_legacyDownloadContext, 0);
}

void __58__PHAdjustmentDataRequest__cplDownloadStatusNotification___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6, char a7, void *a8)
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  PHAdjustmentData *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v15 = a2;
  v16 = a3;
  v17 = a4;
  v18 = a6;
  v19 = a8;
  v20 = objc_msgSend(v15, "length");
  v21 = 0;
  if (v18 && v20)
    v21 = -[PHAdjustmentData initWithFormatIdentifier:formatVersion:data:]([PHAdjustmentData alloc], "initWithFormatIdentifier:formatVersion:data:", v15, v16, v18);
  objc_msgSend(v19, "error");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {

    v19 = 0;
  }
  -[PHAdjustmentData setEditorBundleID:](v21, "setEditorBundleID:", v17);
  -[PHAdjustmentData setBaseVersion:](v21, "setBaseVersion:", a5);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 128), v19);
  if (v21)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "setAdjustmentData:", v21);
  }
  else if ((a7 & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "setIsInCloud:", 1);
    if (!v22)
    {
      v23 = (void *)MEMORY[0x1E0CB35C8];
      v25 = *MEMORY[0x1E0CB2D50];
      v26[0] = CFSTR("Missing adjustment data");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v24);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "setError:", v22);
  objc_msgSend(*(id *)(a1 + 32), "_finishFromAsynchronousCallback");

}

void __39__PHAdjustmentDataRequest_startRequest__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6, char a7, void *a8)
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  PHAdjustmentData *v22;
  void *v23;
  void *v24;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  const __CFString *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v14 = a2;
  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a8;
  PLImageManagerGetLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "identifierString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v31 = v20;
    v32 = 2112;
    v33 = v14;
    v34 = 2112;
    v35 = v15;
    v36 = 2112;
    v37 = v16;
    _os_log_impl(&dword_1991EC000, v19, OS_LOG_TYPE_DEBUG, "[RM]: %@ adjustment data request finished with formatID: %@, version: %@, editor: %@", buf, 0x2Au);

  }
  v21 = objc_msgSend(v14, "length");
  v22 = 0;
  if (v17 && v21)
    v22 = -[PHAdjustmentData initWithFormatIdentifier:formatVersion:data:]([PHAdjustmentData alloc], "initWithFormatIdentifier:formatVersion:data:", v14, v15, v17);
  objc_msgSend(v18, "error");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {

    v18 = 0;
  }
  -[PHAdjustmentData setEditorBundleID:](v22, "setEditorBundleID:", v16);
  -[PHAdjustmentData setBaseVersion:](v22, "setBaseVersion:", a5);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 128), v18);
  if (v22)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "setAdjustmentData:", v22);
  }
  else if ((a7 & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "setIsInCloud:", 1);
    v26 = (void *)MEMORY[0x1E0CB35C8];
    v28 = *MEMORY[0x1E0CB2D50];
    v29 = CFSTR("Missing adjustment data");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v24);
    v27 = objc_claimAutoreleasedReturnValue();

    v23 = (void *)v27;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "setError:", v23);
  if (v22 || !v18)
    objc_msgSend(*(id *)(a1 + 32), "_finishFromAsynchronousCallback");

}

@end
