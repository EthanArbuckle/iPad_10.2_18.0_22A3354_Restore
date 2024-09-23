@implementation AXMProminentObjectsDetectorNode

- (void)nodeInitialize
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)AXMProminentObjectsDetectorNode;
  -[AXMEvaluationNode nodeInitialize](&v2, sel_nodeInitialize);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMProminentObjectsDetectorNode)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AXMProminentObjectsDetectorNode;
  return -[AXMEvaluationNode initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AXMProminentObjectsDetectorNode;
  -[AXMEvaluationNode encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

+ (BOOL)isSupported
{
  return 1;
}

- (BOOL)requiresVisionFramework
{
  return 1;
}

+ (id)title
{
  return CFSTR("Prominent Object Detector");
}

- (BOOL)validateVisionKitSoftLinkSymbols
{
  NSObject *v4;
  objc_super v5;

  if (getVNGenerateAttentionBasedSaliencyImageRequestClass())
  {
    v5.receiver = self;
    v5.super_class = (Class)AXMProminentObjectsDetectorNode;
    return -[AXMVisionEngineNode validateVisionKitSoftLinkSymbols](&v5, sel_validateVisionKitSoftLinkSymbols);
  }
  else
  {
    AXMediaLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[AXMProminentObjectsDetectorNode validateVisionKitSoftLinkSymbols].cold.1(v4);

    return 0;
  }
}

- (void)evaluate:(id)a3 metrics:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  id v24;
  id v25;
  objc_super v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)AXMProminentObjectsDetectorNode;
  v8 = -[AXMEvaluationNode evaluate:metrics:](&v26, sel_evaluate_metrics_, v6, v7);
  v9 = (void *)MEMORY[0x1B5E128FC](v8);
  -[AXMProminentObjectsDetectorNode _imageSaliencyRequest](self, "_imageSaliencyRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v11 = objc_alloc_init((Class)getVNGenerateAttentionBasedSaliencyImageRequestClass());
    -[AXMProminentObjectsDetectorNode set_imageSaliencyRequest:](self, "set_imageSaliencyRequest:", v11);

    -[AXMProminentObjectsDetectorNode _imageSaliencyRequest](self, "_imageSaliencyRequest");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[AXMEvaluationNode configureForRunningOnANEIfPossibleWithRequest:](AXMEvaluationNode, "configureForRunningOnANEIfPossibleWithRequest:", v12);

  }
  -[AXMProminentObjectsDetectorNode _imageSaliencyRequest](self, "_imageSaliencyRequest");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMEvaluationNode evaluateRequests:withContext:requestHandlerOptions:metrics:error:](self, "evaluateRequests:withContext:requestHandlerOptions:metrics:error:", v14, v6, 0, v7, 0);

  objc_msgSend(v13, "results");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "salientObjects");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __52__AXMProminentObjectsDetectorNode_evaluate_metrics___block_invoke;
  v23 = &unk_1E625EBD8;
  v24 = v16;
  v18 = v6;
  v25 = v18;
  v19 = v16;
  objc_msgSend(v17, "enumerateObjectsUsingBlock:", &v20);
  objc_msgSend(v18, "addEvaluatedFeatureType:", 19, v20, v21, v22, v23);

  objc_autoreleasePoolPop(v9);
}

void __52__AXMProminentObjectsDetectorNode_evaluate_metrics___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  float v27;
  void *v28;
  id v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  v29 = a2;
  objc_msgSend(v29, "boundingBox");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(*(id *)(a1 + 32), "narrowedBoundingBox");
  v32.origin.x = v11;
  v32.origin.y = v12;
  v32.size.width = v13;
  v32.size.height = v14;
  v30.origin.x = v4;
  v30.origin.y = v6;
  v30.size.width = v8;
  v30.size.height = v10;
  v31 = CGRectIntersection(v30, v32);
  if (!CGRectIsEmpty(v31))
  {
    objc_msgSend(v29, "boundingBox");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = 1.0 - v21 - v19;
    objc_msgSend(*(id *)(a1 + 40), "size");
    v24 = v23;
    v26 = v25;
    objc_msgSend(v29, "confidence");
    +[AXMVisionFeature prominentObjectWithBoundingBox:canvasSize:confidence:](AXMVisionFeature, "prominentObjectWithBoundingBox:canvasSize:confidence:", v16, v22, v18, v20, v24, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "appendFeature:", v28);

  }
}

- (VNGenerateAttentionBasedSaliencyImageRequest)_imageSaliencyRequest
{
  return self->__imageSaliencyRequest;
}

- (void)set_imageSaliencyRequest:(id)a3
{
  objc_storeStrong((id *)&self->__imageSaliencyRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__imageSaliencyRequest, 0);
}

- (void)validateVisionKitSoftLinkSymbols
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B0E3B000, log, OS_LOG_TYPE_ERROR, "Could not evaluate. VNGenerateAttentionBasedSaliencyImageRequestSoft was nil", v1, 2u);
}

@end
