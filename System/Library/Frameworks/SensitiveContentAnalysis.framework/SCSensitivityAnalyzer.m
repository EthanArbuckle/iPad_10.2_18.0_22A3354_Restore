@implementation SCSensitivityAnalyzer

- (SCSensitivityAnalyzer)init
{
  return -[SCSensitivityAnalyzer initWithQueue:](self, "initWithQueue:", 0);
}

+ (id)subscribeForAnalysisAvailabilityChanges:(id)a3
{
  id v4;
  SCSensitivityAnalysisAvailabilityObserver *v5;
  id v6;
  void *v7;
  SCSensitivityAnalysisAvailabilityObserver *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void *v13;
  id v14;
  id v15;

  v4 = a3;
  v5 = [SCSensitivityAnalysisAvailabilityObserver alloc];
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __65__SCSensitivityAnalyzer_subscribeForAnalysisAvailabilityChanges___block_invoke;
  v13 = &unk_2505B7D60;
  v14 = v4;
  v15 = a1;
  v6 = v4;
  +[SCManagedSettingsReader subscribeForScanningPolicyChanges:](SCManagedSettingsReader, "subscribeForScanningPolicyChanges:", &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SCSensitivityAnalysisAvailabilityObserver initWithSubscription:](v5, "initWithSubscription:", v7, v10, v11, v12, v13);

  return v8;
}

- (SCSensitivityAnalyzer)initWithQueue:(id)a3
{
  id v4;
  void *v5;
  SCSensitivityAnalyzer *v6;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = -[SCSensitivityAnalyzer initWithQueue:madService:](self, "initWithQueue:madService:", v4, v5);

  return v6;
}

- (SCSensitivityAnalyzer)initWithQueue:(id)a3 madService:(id)a4
{
  id v7;
  id v8;
  SCSensitivityAnalyzer *v9;
  SCSensitivityAnalyzer *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SCSensitivityAnalyzer;
  v9 = -[SCSensitivityAnalyzer init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dispatchQueue, a3);
    objc_storeStrong((id *)&v10->_madService, a4);
  }

  return v10;
}

- (SCSensitivityAnalysisPolicy)analysisPolicy
{
  void *v3;
  void *v4;
  SCSensitivityAnalysisPolicy v5;

  -[SCSensitivityAnalyzer madService](self, "madService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "obtainCurrentPolicy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SCSensitivityAnalyzer _mapMOScanningPolicyEnumValue:](self, "_mapMOScanningPolicyEnumValue:", v4);

  return v5;
}

+ (int64_t)analysisFeatureEnablement
{
  void *v3;
  int64_t v4;

  objc_msgSend((id)objc_msgSend(a1, "settingsReaderClass"), "currentScanningPolicy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(a1, "_analysisPolicyFrom:", v3);

  return v4;
}

+ (BOOL)isSensitiveContentWarningEnabledForService:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_msgSend(a1, "settingsReaderClass"), "currentScanningPolicy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "_isSensitiveContentWarningEnabledForService:scanningPolicy:", v4, v5);

  return (char)a1;
}

+ (BOOL)isSensitiveContentWarningEnabledForAnyOfServices:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_msgSend(a1, "settingsReaderClass"), "currentScanningPolicy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "_isSensitiveContentWarningEnabledForAnyOfServices:scanningPolicy:", v4, v5);

  return (char)a1;
}

uint64_t __65__SCSensitivityAnalyzer_subscribeForAnalysisAvailabilityChanges___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "_analysisPolicyFrom:", a2));
}

- (void)analyzeImageFile:(NSURL *)fileURL completionHandler:(void *)completionHandler
{
  void *v6;
  NSURL *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = completionHandler;
  v7 = fileURL;
  -[SCSensitivityAnalyzer madService](self, "madService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __60__SCSensitivityAnalyzer_analyzeImageFile_completionHandler___block_invoke;
  v10[3] = &unk_2505B7DB0;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "isSensitiveImage:completionHandler:", v7, v10);

}

void __60__SCSensitivityAnalyzer_analyzeImageFile_completionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __60__SCSensitivityAnalyzer_analyzeImageFile_completionHandler___block_invoke_2;
  v9[3] = &unk_2505B7D88;
  v6 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v10 = v5;
  v11 = v7;
  v12 = a2;
  v8 = v5;
  objc_msgSend(v6, "_runBlockOnDispatchQueueIfSet:", v9);

}

void __60__SCSensitivityAnalyzer_analyzeImageFile_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v3;

  v1 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32))
  {
    (*(void (**)(_QWORD, _QWORD))(v1 + 16))(*(_QWORD *)(a1 + 40), 0);
  }
  else
  {
    +[SCSensitivityAnalysis resultsWithSensitive:](SCSensitivityAnalysis, "resultsWithSensitive:", *(unsigned __int8 *)(a1 + 48));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v3, *(_QWORD *)(a1 + 32));

  }
}

- (void)analyzeCGImage:(CGImageRef)image completionHandler:(void *)completionHandler
{
  -[SCSensitivityAnalyzer analyzeCGImage:orientation:completionHandler:](self, "analyzeCGImage:orientation:completionHandler:", image, 1, completionHandler);
}

- (void)analyzeCGImage:(CGImage *)a3 orientation:(unsigned int)a4 completionHandler:(id)a5
{
  uint64_t v5;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v5 = *(_QWORD *)&a4;
  v8 = a5;
  -[SCSensitivityAnalyzer madService](self, "madService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __70__SCSensitivityAnalyzer_analyzeCGImage_orientation_completionHandler___block_invoke;
  v11[3] = &unk_2505B7DB0;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v9, "isSensitiveCGImage:withOrientation:completionHandler:", a3, v5, v11);

}

void __70__SCSensitivityAnalyzer_analyzeCGImage_orientation_completionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __70__SCSensitivityAnalyzer_analyzeCGImage_orientation_completionHandler___block_invoke_2;
  v9[3] = &unk_2505B7D88;
  v6 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v10 = v5;
  v11 = v7;
  v12 = a2;
  v8 = v5;
  objc_msgSend(v6, "_runBlockOnDispatchQueueIfSet:", v9);

}

void __70__SCSensitivityAnalyzer_analyzeCGImage_orientation_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v3;

  v1 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32))
  {
    (*(void (**)(_QWORD, _QWORD))(v1 + 16))(*(_QWORD *)(a1 + 40), 0);
  }
  else
  {
    +[SCSensitivityAnalysis resultsWithSensitive:](SCSensitivityAnalysis, "resultsWithSensitive:", *(unsigned __int8 *)(a1 + 48));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v3, *(_QWORD *)(a1 + 32));

  }
}

- (NSProgress)analyzeVideoFile:(NSURL *)fileURL completionHandler:(void *)completionHandler
{
  NSURL *v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v6 = fileURL;
  v7 = completionHandler;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  objc_msgSend(MEMORY[0x24BDD1768], "progressWithTotalUnitCount:", 100);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v12[5], "setCompletedUnitCount:", 0);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __60__SCSensitivityAnalyzer_analyzeVideoFile_completionHandler___block_invoke;
  v10[3] = &unk_2505B7DD8;
  v10[4] = &v11;
  -[SCSensitivityAnalyzer analyzeVideoFile:progressHandler:completionHandler:](self, "analyzeVideoFile:progressHandler:completionHandler:", v6, v10, v7);
  v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSProgress *)v8;
}

uint64_t __60__SCSensitivityAnalyzer_analyzeVideoFile_completionHandler___block_invoke(uint64_t a1, double a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setCompletedUnitCount:", (uint64_t)a2);
}

- (void)analyzeVideoFile:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  -[SCSensitivityAnalyzer analyzeVideoFile:useBlastdoor:progressHandler:completionHandler:](self, "analyzeVideoFile:useBlastdoor:progressHandler:completionHandler:", a3, 0, a4, a5);
}

- (void)analyzeVideoFile:(id)a3 useBlastdoor:(BOOL)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;

  v7 = a4;
  v10 = a5;
  v11 = a6;
  v12 = a3;
  -[SCSensitivityAnalyzer madService](self, "madService");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __89__SCSensitivityAnalyzer_analyzeVideoFile_useBlastdoor_progressHandler_completionHandler___block_invoke;
  v18[3] = &unk_2505B7E28;
  v18[4] = self;
  v19 = v10;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __89__SCSensitivityAnalyzer_analyzeVideoFile_useBlastdoor_progressHandler_completionHandler___block_invoke_3;
  v16[3] = &unk_2505B7DB0;
  v16[4] = self;
  v17 = v11;
  v14 = v11;
  v15 = v10;
  objc_msgSend(v13, "isSensitiveVideoFile:useBlastdoor:progressHandler:completionHandler:", v12, v7, v18, v16);

}

void __89__SCSensitivityAnalyzer_analyzeVideoFile_useBlastdoor_progressHandler_completionHandler___block_invoke(uint64_t a1, double a2)
{
  void *v2;
  void *v4;
  _QWORD v5[4];
  id v6;
  double v7;

  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    v4 = *(void **)(a1 + 32);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __89__SCSensitivityAnalyzer_analyzeVideoFile_useBlastdoor_progressHandler_completionHandler___block_invoke_2;
    v5[3] = &unk_2505B7E00;
    v6 = v2;
    v7 = a2;
    objc_msgSend(v4, "_runBlockOnDispatchQueueIfSet:", v5);

  }
}

uint64_t __89__SCSensitivityAnalyzer_analyzeVideoFile_useBlastdoor_progressHandler_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, double))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(double *)(a1 + 40));
}

void __89__SCSensitivityAnalyzer_analyzeVideoFile_useBlastdoor_progressHandler_completionHandler___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __89__SCSensitivityAnalyzer_analyzeVideoFile_useBlastdoor_progressHandler_completionHandler___block_invoke_4;
  v9[3] = &unk_2505B7D88;
  v6 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v10 = v5;
  v11 = v7;
  v12 = a2;
  v8 = v5;
  objc_msgSend(v6, "_runBlockOnDispatchQueueIfSet:", v9);

}

void __89__SCSensitivityAnalyzer_analyzeVideoFile_useBlastdoor_progressHandler_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v3;

  v1 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32))
  {
    (*(void (**)(_QWORD, _QWORD))(v1 + 16))(*(_QWORD *)(a1 + 40), 0);
  }
  else
  {
    +[SCSensitivityAnalysis resultsWithSensitive:](SCSensitivityAnalysis, "resultsWithSensitive:", *(unsigned __int8 *)(a1 + 48));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v3, *(_QWORD *)(a1 + 32));

  }
}

- (void)analyzeImageWithLocalIdentifier:(id)a3 fromPhotoLibraryWithURL:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[SCSensitivityAnalyzer madService](self, "madService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __99__SCSensitivityAnalyzer_analyzeImageWithLocalIdentifier_fromPhotoLibraryWithURL_completionHandler___block_invoke;
  v13[3] = &unk_2505B7DB0;
  v13[4] = self;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v11, "isSensitiveImageWithLocalIdentifier:fromPhotoLibraryWithURL:completionHandler:", v10, v9, v13);

}

void __99__SCSensitivityAnalyzer_analyzeImageWithLocalIdentifier_fromPhotoLibraryWithURL_completionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __99__SCSensitivityAnalyzer_analyzeImageWithLocalIdentifier_fromPhotoLibraryWithURL_completionHandler___block_invoke_2;
  v9[3] = &unk_2505B7D88;
  v6 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v10 = v5;
  v11 = v7;
  v12 = a2;
  v8 = v5;
  objc_msgSend(v6, "_runBlockOnDispatchQueueIfSet:", v9);

}

void __99__SCSensitivityAnalyzer_analyzeImageWithLocalIdentifier_fromPhotoLibraryWithURL_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v3;

  v1 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32))
  {
    (*(void (**)(_QWORD, _QWORD))(v1 + 16))(*(_QWORD *)(a1 + 40), 0);
  }
  else
  {
    +[SCSensitivityAnalysis resultsWithSensitive:](SCSensitivityAnalysis, "resultsWithSensitive:", *(unsigned __int8 *)(a1 + 48));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v3, *(_QWORD *)(a1 + 32));

  }
}

- (void)analyzeVideoWithLocalIdentifier:(id)a3 fromPhotoLibraryWithURL:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;

  v10 = a5;
  v11 = a6;
  v12 = a4;
  v13 = a3;
  -[SCSensitivityAnalyzer madService](self, "madService");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __115__SCSensitivityAnalyzer_analyzeVideoWithLocalIdentifier_fromPhotoLibraryWithURL_progressHandler_completionHandler___block_invoke;
  v19[3] = &unk_2505B7E50;
  v19[4] = self;
  v20 = v10;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __115__SCSensitivityAnalyzer_analyzeVideoWithLocalIdentifier_fromPhotoLibraryWithURL_progressHandler_completionHandler___block_invoke_3;
  v17[3] = &unk_2505B7DB0;
  v17[4] = self;
  v18 = v11;
  v15 = v11;
  v16 = v10;
  objc_msgSend(v14, "isSensitiveVideoWithLocalIdentifier:fromPhotoLibraryWithURL:progressHandler:completionHandler:", v13, v12, v19, v17);

}

void __115__SCSensitivityAnalyzer_analyzeVideoWithLocalIdentifier_fromPhotoLibraryWithURL_progressHandler_completionHandler___block_invoke(uint64_t a1, double a2)
{
  void *v2;
  void *v4;
  _QWORD v5[4];
  id v6;
  double v7;

  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    v4 = *(void **)(a1 + 32);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __115__SCSensitivityAnalyzer_analyzeVideoWithLocalIdentifier_fromPhotoLibraryWithURL_progressHandler_completionHandler___block_invoke_2;
    v5[3] = &unk_2505B7E00;
    v6 = v2;
    v7 = a2;
    objc_msgSend(v4, "_runBlockOnDispatchQueueIfSet:", v5);

  }
}

uint64_t __115__SCSensitivityAnalyzer_analyzeVideoWithLocalIdentifier_fromPhotoLibraryWithURL_progressHandler_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, double))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(double *)(a1 + 40));
}

void __115__SCSensitivityAnalyzer_analyzeVideoWithLocalIdentifier_fromPhotoLibraryWithURL_progressHandler_completionHandler___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __115__SCSensitivityAnalyzer_analyzeVideoWithLocalIdentifier_fromPhotoLibraryWithURL_progressHandler_completionHandler___block_invoke_4;
  v9[3] = &unk_2505B7D88;
  v6 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v10 = v5;
  v11 = v7;
  v12 = a2;
  v8 = v5;
  objc_msgSend(v6, "_runBlockOnDispatchQueueIfSet:", v9);

}

void __115__SCSensitivityAnalyzer_analyzeVideoWithLocalIdentifier_fromPhotoLibraryWithURL_progressHandler_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v3;

  v1 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32))
  {
    (*(void (**)(_QWORD, _QWORD))(v1 + 16))(*(_QWORD *)(a1 + 40), 0);
  }
  else
  {
    +[SCSensitivityAnalysis resultsWithSensitive:](SCSensitivityAnalysis, "resultsWithSensitive:", *(unsigned __int8 *)(a1 + 48));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v3, *(_QWORD *)(a1 + 32));

  }
}

+ (int64_t)_analysisPolicyFrom:(id)a3
{
  id v4;
  int64_t v5;

  v4 = a3;
  if ((objc_msgSend(a1, "_isCommunicationSafetyEnabled:", v4) & 1) != 0)
    v5 = 2;
  else
    v5 = objc_msgSend(a1, "_isSensitiveContentWarningEnabled:", v4);

  return v5;
}

+ (BOOL)_isCommunicationSafetyEnabled:(id)a3
{
  return objc_msgSend(a3, "policy") == 2;
}

+ (BOOL)_isSensitiveContentWarningEnabled:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;

  v4 = a3;
  objc_msgSend((id)objc_msgSend(a1, "entitlementsReaderClass"), "readCurrentServices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_msgSend(a1, "_isSensitiveContentWarningEnabledForAnyOfServices:scanningPolicy:", v5, v4);
  }
  else
  {
    objc_msgSend((id)objc_msgSend(a1, "entitlementsReaderClass"), "readCurrentBundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(a1, "_isSensitiveContentWarningEnabledForApplication:scanningPolicy:", v7, v4);

  }
  return v6;
}

+ (BOOL)_isSensitiveContentWarningEnabledForAnyOfServices:(id)a3 scanningPolicy:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        if ((objc_msgSend(a1, "_isSensitiveContentWarningEnabledForService:scanningPolicy:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), v7, (_QWORD)v15) & 1) != 0)
        {
          v13 = 1;
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v10)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

+ (BOOL)_isSensitiveContentWarningEnabledForService:(id)a3 scanningPolicy:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "policy") == 1)
  {
    objc_msgSend(v6, "services");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsObject:", v5);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)_isSensitiveContentWarningEnabledForApplication:(id)a3 scanningPolicy:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "policy") == 1)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE63F10]), "initWithBundleIdentifier:", v5);
    objc_msgSend(v6, "applications");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", v7);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (int64_t)_mapMOScanningPolicyEnumValue:(id)a3
{
  int64_t result;
  NSObject *v4;

  result = objc_msgSend(a3, "integerValue");
  if ((unint64_t)result >= 3)
  {
    +[SCLog client](SCLog, "client");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[SCSensitivityAnalyzer _mapMOScanningPolicyEnumValue:].cold.1(v4);

    return 0;
  }
  return result;
}

- (void)_runBlockOnDispatchQueueIfSet:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  NSObject *dispatchQueue;
  _QWORD block[4];
  void (**v8)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  v5 = v4;
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __55__SCSensitivityAnalyzer__runBlockOnDispatchQueueIfSet___block_invoke;
    block[3] = &unk_2505B7E78;
    v8 = v4;
    dispatch_async(dispatchQueue, block);

  }
  else
  {
    v4[2](v4);
  }

}

uint64_t __55__SCSensitivityAnalyzer__runBlockOnDispatchQueueIfSet___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (Class)settingsReaderClass
{
  return (Class)objc_opt_class();
}

+ (Class)entitlementsReaderClass
{
  return (Class)objc_opt_class();
}

- (SCMediaAnalysisService)madService
{
  return self->_madService;
}

- (void)setMadService:(id)a3
{
  objc_storeStrong((id *)&self->_madService, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_madService, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

- (void)_mapMOScanningPolicyEnumValue:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_234593000, log, OS_LOG_TYPE_ERROR, "MAD returns unrecognized MOScanningPolicy, if you see this error - please file a radar!", v1, 2u);
}

@end
