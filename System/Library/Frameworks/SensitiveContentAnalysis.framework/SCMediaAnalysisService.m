@implementation SCMediaAnalysisService

- (SCMediaAnalysisService)initWithMADService:(id)a3
{
  id v5;
  SCMediaAnalysisService *v6;
  SCMediaAnalysisService *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCMediaAnalysisService;
  v6 = -[SCMediaAnalysisService init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_service, a3);

  return v7;
}

- (SCMediaAnalysisService)init
{
  void *v3;
  id v4;
  void *v5;
  SCMediaAnalysisService *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2050000000;
  v3 = (void *)getMADServiceClass_softClass;
  v12 = getMADServiceClass_softClass;
  if (!getMADServiceClass_softClass)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __getMADServiceClass_block_invoke;
    v8[3] = &unk_2505B7D20;
    v8[4] = &v9;
    __getMADServiceClass_block_invoke((uint64_t)v8);
    v3 = (void *)v10[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v9, 8);
  objc_msgSend(v4, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SCMediaAnalysisService initWithMADService:](self, "initWithMADService:", v5);

  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_service)
  {
    -[SCMediaAnalysisService service](self, "service");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancelAllRequests");

  }
  v4.receiver = self;
  v4.super_class = (Class)SCMediaAnalysisService;
  -[SCMediaAnalysisService dealloc](&v4, sel_dealloc);
}

- (id)obtainCurrentPolicy
{
  NSObject *v3;
  dispatch_semaphore_t v4;
  NSObject *v5;
  NSObject *v6;
  dispatch_time_t v7;
  NSObject *v8;
  id v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  NSObject *v15;
  uint8_t *v16;
  id v17;
  id location;
  uint8_t buf[8];
  uint8_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  +[SCLog client](SCLog, "client");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_234593000, v3, OS_LOG_TYPE_DEFAULT, "MAD request to obtain ScanningPolicy has started", buf, 2u);
  }

  v4 = dispatch_semaphore_create(0);
  *(_QWORD *)buf = 0;
  v20 = buf;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__0;
  v23 = __Block_byref_object_dispose__0;
  v24 = 0;
  objc_initWeak(&location, self);
  dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __45__SCMediaAnalysisService_obtainCurrentPolicy__block_invoke;
  v14 = &unk_2505B7EA0;
  objc_copyWeak(&v17, &location);
  v16 = buf;
  v6 = v4;
  v15 = v6;
  dispatch_async(v5, &v11);

  v7 = dispatch_time(0, 15000000000);
  if (dispatch_semaphore_wait(v6, v7))
  {
    +[SCLog client](SCLog, "client", v11, v12, v13, v14);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SCMediaAnalysisService obtainCurrentPolicy].cold.1(v8);

  }
  v9 = *((id *)v20 + 5);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(buf, 8);

  return v9;
}

void __45__SCMediaAnalysisService_obtainCurrentPolicy__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v3, "userSafetyEnabled:", &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;

  +[SCLog client](SCLog, "client");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v12 = v4;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_234593000, v6, OS_LOG_TYPE_DEFAULT, "MAD request to obtain ScanningPolicy has finished, policy: %@, error: %@", buf, 0x16u);
  }

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v4;
  v9 = v4;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)isSensitiveImage:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint8_t buf[4];
  int v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__0;
  v20 = __Block_byref_object_dispose__0;
  v21 = -[SCMediaAnalysisService _newImageClassificationRequest](self, "_newImageClassificationRequest");
  -[SCMediaAnalysisService service](self, "service");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v17[5];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __61__SCMediaAnalysisService_isSensitiveImage_completionHandler___block_invoke;
  v13[3] = &unk_2505B7EC8;
  v13[4] = self;
  v15 = &v16;
  v10 = v7;
  v14 = v10;
  v11 = objc_msgSend(v8, "performRequests:onImageURL:withIdentifier:completionHandler:", v9, v6, &stru_2505B8068, v13);

  +[SCLog client](SCLog, "client");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v23 = v11;
    _os_log_impl(&dword_234593000, v12, OS_LOG_TYPE_DEFAULT, "MAD request(%d) with imageURL started", buf, 8u);
  }

  _Block_object_dispose(&v16, 8);
}

void __61__SCMediaAnalysisService_isSensitiveImage_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  void *v5;
  NSObject *v6;
  void *v7;
  unsigned __int8 v8;
  uint8_t buf[4];
  int v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v3 = a2;
  v15 = *MEMORY[0x24BDAC8D0];
  v8 = 0;
  objc_msgSend(*(id *)(a1 + 32), "_processMADResults:requestID:error:request:", &v8, a2, a3, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SCLog client](SCLog, "client");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    v10 = v3;
    v11 = 1024;
    v12 = v8;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_234593000, v6, OS_LOG_TYPE_DEFAULT, "MAD request(%d) returns following results: (%d, '%@')", buf, 0x18u);
  }

  +[SCAnalytics sharedInstance](SCAnalytics, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "collectMediaAnalysisServiceEvent::", 1, v8);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)isSensitiveCGImage:(CGImage *)a3 withOrientation:(unsigned int)a4 completionHandler:(id)a5
{
  uint64_t v5;
  id v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  NSObject *v13;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint8_t buf[4];
  int v24;
  _QWORD v25[2];

  v5 = *(_QWORD *)&a4;
  v25[1] = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  v22 = -[SCMediaAnalysisService _newImageClassificationRequest](self, "_newImageClassificationRequest");
  -[SCMediaAnalysisService service](self, "service");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v18[5];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __79__SCMediaAnalysisService_isSensitiveCGImage_withOrientation_completionHandler___block_invoke;
  v14[3] = &unk_2505B7EC8;
  v14[4] = self;
  v16 = &v17;
  v11 = v8;
  v15 = v11;
  v12 = objc_msgSend(v9, "performRequests:onCGImage:withOrientation:andIdentifier:completionHandler:", v10, a3, v5, &stru_2505B8068, v14);

  +[SCLog client](SCLog, "client");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v24 = v12;
    _os_log_impl(&dword_234593000, v13, OS_LOG_TYPE_DEFAULT, "MAD request(%d) with cgImage has started", buf, 8u);
  }

  _Block_object_dispose(&v17, 8);
}

void __79__SCMediaAnalysisService_isSensitiveCGImage_withOrientation_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  void *v5;
  NSObject *v6;
  void *v7;
  unsigned __int8 v8;
  uint8_t buf[4];
  int v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v3 = a2;
  v15 = *MEMORY[0x24BDAC8D0];
  v8 = 0;
  objc_msgSend(*(id *)(a1 + 32), "_processMADResults:requestID:error:request:", &v8, a2, a3, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SCLog client](SCLog, "client");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    v10 = v3;
    v11 = 1024;
    v12 = v8;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_234593000, v6, OS_LOG_TYPE_DEFAULT, "MAD request(%d) returns following results: (%d, '%@')", buf, 0x18u);
  }

  +[SCAnalytics sharedInstance](SCAnalytics, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "collectMediaAnalysisServiceEvent::", 1, v8);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)isSensitiveVideoFile:(id)a3 useBlastdoor:(BOOL)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  int v19;
  NSObject *v20;
  _QWORD v21[5];
  id v22;
  uint64_t *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint8_t buf[4];
  int v34;
  _QWORD v35[2];

  v8 = a4;
  v35[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__0;
  v31 = __Block_byref_object_dispose__0;
  v32 = -[SCMediaAnalysisService _newVideoClassificationRequest](self, "_newVideoClassificationRequest");
  objc_msgSend((id)v28[5], "setRequiresBlastdoor:", v8);
  -[SCMediaAnalysisService service](self, "service");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v28[5];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __94__SCMediaAnalysisService_isSensitiveVideoFile_useBlastdoor_progressHandler_completionHandler___block_invoke;
  v24[3] = &unk_2505B7EF0;
  v16 = v11;
  v26 = v16;
  v17 = v10;
  v25 = v17;
  v21[0] = v15;
  v21[1] = 3221225472;
  v21[2] = __94__SCMediaAnalysisService_isSensitiveVideoFile_useBlastdoor_progressHandler_completionHandler___block_invoke_2;
  v21[3] = &unk_2505B7EC8;
  v21[4] = self;
  v23 = &v27;
  v18 = v12;
  v22 = v18;
  v19 = objc_msgSend(v13, "performRequests:videoURL:identifier:progressHandler:completionHandler:", v14, v17, &stru_2505B8068, v24, v21);

  +[SCLog client](SCLog, "client");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v34 = v19;
    _os_log_impl(&dword_234593000, v20, OS_LOG_TYPE_DEFAULT, "MAD request(%d) with videoURL started", buf, 8u);
  }

  _Block_object_dispose(&v27, 8);
}

uint64_t __94__SCMediaAnalysisService_isSensitiveVideoFile_useBlastdoor_progressHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

void __94__SCMediaAnalysisService_isSensitiveVideoFile_useBlastdoor_progressHandler_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  void *v5;
  NSObject *v6;
  void *v7;
  unsigned __int8 v8;
  uint8_t buf[4];
  int v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v3 = a2;
  v15 = *MEMORY[0x24BDAC8D0];
  v8 = 0;
  objc_msgSend(*(id *)(a1 + 32), "_processMADResults:requestID:error:videoRequest:", &v8, a2, a3, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SCLog client](SCLog, "client");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    v10 = v3;
    v11 = 1024;
    v12 = v8;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_234593000, v6, OS_LOG_TYPE_DEFAULT, "MAD request(%d) returns following results: (%d, '%@')", buf, 0x18u);
  }

  +[SCAnalytics sharedInstance](SCAnalytics, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "collectMediaAnalysisServiceEvent::", 2, v8);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)isSensitiveImageWithLocalIdentifier:(id)a3 fromPhotoLibraryWithURL:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  int v14;
  NSObject *v15;
  _QWORD v16[5];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint8_t buf[4];
  int v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__0;
  v23 = __Block_byref_object_dispose__0;
  v24 = -[SCMediaAnalysisService _newImageClassificationRequest](self, "_newImageClassificationRequest");
  -[SCMediaAnalysisService service](self, "service");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v20[5];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __104__SCMediaAnalysisService_isSensitiveImageWithLocalIdentifier_fromPhotoLibraryWithURL_completionHandler___block_invoke;
  v16[3] = &unk_2505B7EC8;
  v16[4] = self;
  v18 = &v19;
  v13 = v10;
  v17 = v13;
  v14 = objc_msgSend(v11, "performRequests:onAssetWithLocalIdentifier:fromPhotoLibraryWithURL:completionHandler:", v12, v8, v9, v16);

  +[SCLog client](SCLog, "client");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v26 = v14;
    _os_log_impl(&dword_234593000, v15, OS_LOG_TYPE_DEFAULT, "MAD request(%d) with Image's LocalIdentifier started", buf, 8u);
  }

  _Block_object_dispose(&v19, 8);
}

void __104__SCMediaAnalysisService_isSensitiveImageWithLocalIdentifier_fromPhotoLibraryWithURL_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  void *v5;
  NSObject *v6;
  void *v7;
  unsigned __int8 v8;
  uint8_t buf[4];
  int v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v3 = a2;
  v15 = *MEMORY[0x24BDAC8D0];
  v8 = 0;
  objc_msgSend(*(id *)(a1 + 32), "_processMADResults:requestID:error:request:", &v8, a2, a3, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SCLog client](SCLog, "client");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    v10 = v3;
    v11 = 1024;
    v12 = v8;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_234593000, v6, OS_LOG_TYPE_DEFAULT, "MAD request(%d) returns following results: (%d, '%@')", buf, 0x18u);
  }

  +[SCAnalytics sharedInstance](SCAnalytics, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "collectMediaAnalysisServiceEvent::", 1, v8);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)isSensitiveVideoWithLocalIdentifier:(id)a3 fromPhotoLibraryWithURL:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  int v20;
  NSObject *v21;
  _QWORD v22[5];
  id v23;
  uint64_t *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint8_t buf[4];
  int v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__0;
  v32 = __Block_byref_object_dispose__0;
  v33 = -[SCMediaAnalysisService _newVideoClassificationRequest](self, "_newVideoClassificationRequest");
  -[SCMediaAnalysisService service](self, "service");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v29[5];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __120__SCMediaAnalysisService_isSensitiveVideoWithLocalIdentifier_fromPhotoLibraryWithURL_progressHandler_completionHandler___block_invoke;
  v25[3] = &unk_2505B7EF0;
  v17 = v12;
  v27 = v17;
  v18 = v10;
  v26 = v18;
  v22[0] = v16;
  v22[1] = 3221225472;
  v22[2] = __120__SCMediaAnalysisService_isSensitiveVideoWithLocalIdentifier_fromPhotoLibraryWithURL_progressHandler_completionHandler___block_invoke_2;
  v22[3] = &unk_2505B7EC8;
  v22[4] = self;
  v24 = &v28;
  v19 = v13;
  v23 = v19;
  v20 = objc_msgSend(v14, "performRequests:assetLocalIdentifier:photoLibraryURL:progressHandler:completionHandler:", v15, v18, v11, v25, v22);

  +[SCLog client](SCLog, "client");
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v35 = v20;
    _os_log_impl(&dword_234593000, v21, OS_LOG_TYPE_DEFAULT, "MAD request(%d) with video's LocalIdentifier started", buf, 8u);
  }

  _Block_object_dispose(&v28, 8);
}

uint64_t __120__SCMediaAnalysisService_isSensitiveVideoWithLocalIdentifier_fromPhotoLibraryWithURL_progressHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

void __120__SCMediaAnalysisService_isSensitiveVideoWithLocalIdentifier_fromPhotoLibraryWithURL_progressHandler_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  void *v5;
  NSObject *v6;
  void *v7;
  unsigned __int8 v8;
  uint8_t buf[4];
  int v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v3 = a2;
  v15 = *MEMORY[0x24BDAC8D0];
  v8 = 0;
  objc_msgSend(*(id *)(a1 + 32), "_processMADResults:requestID:error:videoRequest:", &v8, a2, a3, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SCLog client](SCLog, "client");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    v10 = v3;
    v11 = 1024;
    v12 = v8;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_234593000, v6, OS_LOG_TYPE_DEFAULT, "MAD request(%d) returns following results: (%d, '%@')", buf, 0x18u);
  }

  +[SCAnalytics sharedInstance](SCAnalytics, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "collectMediaAnalysisServiceEvent::", 2, v8);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)_processMADResults:(BOOL *)a3 requestID:(int)a4 error:(id)a5 request:(id)a6
{
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v23;

  v9 = a5;
  v10 = a6;
  v11 = v10;
  if (v9)
  {
    +[SCLog client](SCLog, "client");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[SCMediaAnalysisService _processMADResults:requestID:error:request:].cold.3((uint64_t)v9, a4);

    SCErrorCausedBy(100, CFSTR("MADService request has failed with request error"), v9);
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v14 = (void *)v13;
    goto LABEL_12;
  }
  objc_msgSend(v10, "error");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    objc_msgSend(v11, "results");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count");

    if (v19 == 1)
    {
      objc_msgSend(v11, "results");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "firstObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *a3 = objc_msgSend(v21, "isSensitive");

      v14 = 0;
      goto LABEL_12;
    }
    +[SCLog client](SCLog, "client");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[SCMediaAnalysisService _processMADResults:requestID:error:request:].cold.1();

    SCError();
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  +[SCLog client](SCLog, "client");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    -[SCMediaAnalysisService _processMADResults:requestID:error:request:].cold.2();

  objc_msgSend(v11, "error");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  SCErrorCausedBy(100, CFSTR("MADService request has failed with request error"), v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  return v14;
}

- (id)_processMADResults:(BOOL *)a3 requestID:(int)a4 error:(id)a5 videoRequest:(id)a6
{
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v23;

  v9 = a5;
  v10 = a6;
  v11 = v10;
  if (v9)
  {
    +[SCLog client](SCLog, "client");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[SCMediaAnalysisService _processMADResults:requestID:error:videoRequest:].cold.3((uint64_t)v9, a4);

    SCErrorCausedBy(100, CFSTR("MADService video request has failed with request error"), v9);
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v14 = (void *)v13;
    goto LABEL_12;
  }
  objc_msgSend(v10, "error");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    objc_msgSend(v11, "results");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count");

    if (v19 == 1)
    {
      objc_msgSend(v11, "results");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "firstObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *a3 = objc_msgSend(v21, "isSensitive");

      v14 = 0;
      goto LABEL_12;
    }
    +[SCLog client](SCLog, "client");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[SCMediaAnalysisService _processMADResults:requestID:error:videoRequest:].cold.1();

    SCError();
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  +[SCLog client](SCLog, "client");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    -[SCMediaAnalysisService _processMADResults:requestID:error:videoRequest:].cold.2();

  objc_msgSend(v11, "error");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  SCErrorCausedBy(100, CFSTR("MADService video request has failed with request error"), v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  return v14;
}

- (id)_newImageClassificationRequest
{
  void *v2;
  objc_class *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getMADImageSafetyClassificationRequestClass_softClass;
  v9 = getMADImageSafetyClassificationRequestClass_softClass;
  if (!getMADImageSafetyClassificationRequestClass_softClass)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __getMADImageSafetyClassificationRequestClass_block_invoke;
    v5[3] = &unk_2505B7D20;
    v5[4] = &v6;
    __getMADImageSafetyClassificationRequestClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v6, 8);
  return objc_alloc_init(v3);
}

- (id)_newVideoClassificationRequest
{
  void *v2;
  objc_class *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getMADVideoSafetyClassificationRequestClass_softClass;
  v9 = getMADVideoSafetyClassificationRequestClass_softClass;
  if (!getMADVideoSafetyClassificationRequestClass_softClass)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __getMADVideoSafetyClassificationRequestClass_block_invoke;
    v5[3] = &unk_2505B7D20;
    v5[4] = &v6;
    __getMADVideoSafetyClassificationRequestClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v6, 8);
  return objc_alloc_init(v3);
}

- (MADService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
}

- (void)obtainCurrentPolicy
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 134217984;
  v2 = 15;
  _os_log_error_impl(&dword_234593000, log, OS_LOG_TYPE_ERROR, "MAD request failed, not able to obtain current policy: timeout on client (%lldsec)", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_6();
}

- (void)_processMADResults:requestID:error:request:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_5();
  objc_msgSend(v0, "results");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "count");
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_234593000, v2, v3, "MAD request(%d) returns unexpected number of results %lu", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)_processMADResults:requestID:error:request:.cold.2()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_5();
  objc_msgSend(v0, "error");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_234593000, v2, v3, "MAD request(%d) returns error: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)_processMADResults:(uint64_t)a1 requestID:(int)a2 error:request:.cold.3(uint64_t a1, int a2)
{
  NSObject *v2;
  _DWORD v3[6];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109378;
  v3[1] = a2;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_234593000, v2, (uint64_t)v2, "MAD request(%d) failed with error: %@", (uint8_t *)v3);
  OUTLINED_FUNCTION_6();
}

- (void)_processMADResults:requestID:error:videoRequest:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_5();
  objc_msgSend(v0, "results");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "count");
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_234593000, v2, v3, "MAD video request(%d) returns unexpected number of results %lu", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)_processMADResults:requestID:error:videoRequest:.cold.2()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_5();
  objc_msgSend(v0, "error");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_234593000, v2, v3, "MAD video request(%d) returns error: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)_processMADResults:(uint64_t)a1 requestID:(int)a2 error:videoRequest:.cold.3(uint64_t a1, int a2)
{
  NSObject *v2;
  _DWORD v3[6];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109378;
  v3[1] = a2;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_234593000, v2, (uint64_t)v2, "MAD video request(%d) failed with error: %@", (uint8_t *)v3);
  OUTLINED_FUNCTION_6();
}

@end
