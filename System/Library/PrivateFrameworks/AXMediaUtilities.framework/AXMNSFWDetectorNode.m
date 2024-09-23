@implementation AXMNSFWDetectorNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)isSupported
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "physicalMemory") > 0x773593FF;

  return v3;
}

+ (id)title
{
  return CFSTR("NSFW Detector");
}

- (BOOL)validateVisionKitSoftLinkSymbols
{
  NSObject *v4;
  objc_super v5;

  if (getVNVYvzEtX1JlUdu8xx5qhDIClass())
  {
    v5.receiver = self;
    v5.super_class = (Class)AXMNSFWDetectorNode;
    return -[AXMVisionEngineNode validateVisionKitSoftLinkSymbols](&v5, sel_validateVisionKitSoftLinkSymbols);
  }
  else
  {
    AXMediaLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[AXMNSFWDetectorNode validateVisionKitSoftLinkSymbols].cold.1(v4);

    return 0;
  }
}

- (void)evaluate:(id)a3 metrics:(id)a4
{
  id v6;
  id v7;
  id v8;
  VNVYvzEtX1JlUdu8xx5qhDI *request;
  VNVYvzEtX1JlUdu8xx5qhDI *v10;
  VNVYvzEtX1JlUdu8xx5qhDI *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  float v20;
  void *context;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  _QWORD v28[3];

  v28[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)AXMNSFWDetectorNode;
  v8 = -[AXMEvaluationNode evaluate:metrics:](&v26, sel_evaluate_metrics_, v6, v7);
  context = (void *)MEMORY[0x1B5E128FC](v8);
  request = self->_request;
  if (!request)
  {
    v10 = (VNVYvzEtX1JlUdu8xx5qhDI *)objc_alloc_init((Class)getVNVYvzEtX1JlUdu8xx5qhDIClass());
    v11 = self->_request;
    self->_request = v10;

    request = self->_request;
  }
  v28[0] = request;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMEvaluationNode evaluateRequests:withContext:requestHandlerOptions:metrics:error:](self, "evaluateRequests:withContext:requestHandlerOptions:metrics:error:", v12, v6, 0, v7, 0);

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[VNVYvzEtX1JlUdu8xx5qhDI results](self->_request, "results");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v18, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "confidence");
        +[AXMNSFWDetectorNode addNSFWResultToContext:forIdentifier:confidence:markAsSensitiveCaptionContent:](AXMNSFWDetectorNode, "addNSFWResultToContext:forIdentifier:confidence:markAsSensitiveCaptionContent:", v6, v19, 0, v20);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v15);
  }

  objc_autoreleasePoolPop(context);
}

+ (BOOL)addNSFWResultToContext:(id)a3 forIdentifier:(id)a4 confidence:(double)a5 markAsSensitiveCaptionContent:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  _QWORD *v11;
  void *v12;
  int v13;
  float v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  _Unwind_Exception *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v6 = a6;
  v9 = a3;
  v10 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v11 = (_QWORD *)getVN81aedeb999c79d74e79af7f1c922cf97SymbolLoc_ptr;
  v24 = getVN81aedeb999c79d74e79af7f1c922cf97SymbolLoc_ptr;
  if (!getVN81aedeb999c79d74e79af7f1c922cf97SymbolLoc_ptr)
  {
    v12 = (void *)VisionLibrary_5();
    v11 = dlsym(v12, "VN81aedeb999c79d74e79af7f1c922cf97");
    v22[3] = (uint64_t)v11;
    getVN81aedeb999c79d74e79af7f1c922cf97SymbolLoc_ptr = (uint64_t)v11;
  }
  _Block_object_dispose(&v21, 8);
  if (!v11)
  {
    v20 = (_Unwind_Exception *)__77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
    _Block_object_dispose(&v21, 8);
    _Unwind_Resume(v20);
  }
  v13 = objc_msgSend(v10, "isEqualToString:", *v11, v21);
  if (v13)
  {
    objc_msgSend(v9, "size");
    v16 = v15;
    v14 = a5;
    *(float *)&v15 = v14;
    +[AXMVisionFeature nsfwClassificationWithCategory:confidence:canvasSize:](AXMVisionFeature, "nsfwClassificationWithCategory:confidence:canvasSize:", CFSTR("NSFW Explicit"), v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setCaptionMayContainSensitiveContent:", v6);
    objc_msgSend(v9, "appendFeature:", v18);

  }
  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
}

- (void)validateVisionKitSoftLinkSymbols
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B0E3B000, log, OS_LOG_TYPE_ERROR, "Could not evaluate. VNClassifyNSFWImageRequestSoft was nil", v1, 2u);
}

@end
