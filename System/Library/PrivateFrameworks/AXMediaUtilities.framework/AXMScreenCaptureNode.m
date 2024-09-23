@implementation AXMScreenCaptureNode

- (void)nodeInitialize
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AXMScreenCaptureNode;
  -[AXMSourceNode nodeInitialize](&v3, sel_nodeInitialize);
  -[AXMSourceNode setShouldProcessRemotely:](self, "setShouldProcessRemotely:", 1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)isSupported
{
  return 1;
}

+ (id)title
{
  return CFSTR("Screen Capture");
}

- (void)produceImage:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id location;

  v4 = a3;
  v5 = (void *)MEMORY[0x1B5E128FC]();
  objc_initWeak(&location, v4);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__AXMScreenCaptureNode_produceImage___block_invoke;
  v7[3] = &unk_1E625CBC0;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  v6 = v4;
  v8 = v6;
  objc_msgSend(v6, "produceImage:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  objc_autoreleasePoolPop(v5);

}

id __37__AXMScreenCaptureNode_produceImage___block_invoke(id *a1, void *a2, uint64_t a3)
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  id WeakRetained;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("region"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "AXMRectValue");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("orientation"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "integerValue");
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "analysisOptions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "ignoredLayerContextIDs");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(v19, "analysisOptions");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "includedLayerContextIDs");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(v22, "analysisOptions");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "snapshotLayerID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(v25, "analysisOptions");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "snapshotContextID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v18)
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v18, CFSTR("IgnoredLayerContextIDs"));
  if (v21)
    objc_msgSend(v29, "setObject:forKeyedSubscript:", v21, CFSTR("IncludedLayerContextIDs"));
  if (v24)
    objc_msgSend(v29, "setObject:forKeyedSubscript:", v24, CFSTR("SnapshotLayerID"));
  if (v27)
    objc_msgSend(v29, "setObject:forKeyedSubscript:", v27, CFSTR("SnapshotContextID"));
  v30 = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(v30, "analysisOptions");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "preserveInputImageSize");

  if ((v32 & 1) == 0)
  {
    v40[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setObject:forKeyedSubscript:", v33, CFSTR("UsePreferredModelInputSizeForDetectors"));

  }
  objc_msgSend(a1[4], "screenGrabber");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "pipelineMetric");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "grabScreenWithRect:orientation:options:metrics:error:", v15, v29, v35, a3, v7, v9, v11, v13);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  +[AXMPipelineContextInput inputWithCIImage:](AXMPipelineContextInput, "inputWithCIImage:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  return v37;
}

- (AXMScreenGrabber)screenGrabber
{
  AXMScreenGrabber *screenGrabber;
  AXMScreenGrabber *v4;
  AXMScreenGrabber *v5;

  screenGrabber = self->_screenGrabber;
  if (!screenGrabber)
  {
    v4 = objc_alloc_init(AXMScreenGrabber);
    v5 = self->_screenGrabber;
    self->_screenGrabber = v4;

    screenGrabber = self->_screenGrabber;
  }
  return screenGrabber;
}

- (void)triggerWithScreenCaptureRegion:(CGRect)a3 interfaceOrientation:(int64_t)a4 options:(id)a5 cacheKey:(id)a6 resultHandler:(id)a7
{
  double height;
  double width;
  double y;
  double x;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;
  _QWORD v24[3];
  _QWORD v25[4];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v25[3] = *MEMORY[0x1E0C80C00];
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (!v15)
  {
    +[AXMVisionAnalysisOptions defaultOptions](AXMVisionAnalysisOptions, "defaultOptions");
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v24[0] = CFSTR("region");
  objc_msgSend(MEMORY[0x1E0CB3B18], "axmValueWithCGRect:", x, y, width, height);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v18;
  v24[1] = CFSTR("orientation");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v19;
  v24[2] = CFSTR("diagnosticsEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AXMVisionEngineNode areDiagnosticsEnabled](self, "areDiagnosticsEnabled"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  +[AXMVisionPipelineContext contextWithSourceParameters:options:](AXMVisionPipelineContext, "contextWithSourceParameters:options:", v21, v15);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23.receiver = self;
  v23.super_class = (Class)AXMScreenCaptureNode;
  -[AXMSourceNode triggerWithContext:cacheKey:resultHandler:](&v23, sel_triggerWithContext_cacheKey_resultHandler_, v22, v16, v17);

}

- (void)setScreenGrabber:(id)a3
{
  objc_storeStrong((id *)&self->_screenGrabber, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenGrabber, 0);
}

@end
