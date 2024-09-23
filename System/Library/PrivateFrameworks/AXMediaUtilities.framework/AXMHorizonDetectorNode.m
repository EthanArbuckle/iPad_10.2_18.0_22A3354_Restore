@implementation AXMHorizonDetectorNode

- (void)nodeInitialize
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)AXMHorizonDetectorNode;
  -[AXMEvaluationNode nodeInitialize](&v2, sel_nodeInitialize);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMHorizonDetectorNode)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AXMHorizonDetectorNode;
  return -[AXMEvaluationNode initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AXMHorizonDetectorNode;
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
  return CFSTR("Horizon Detector");
}

- (BOOL)validateVisionKitSoftLinkSymbols
{
  NSObject *v4;
  objc_super v5;

  if (getVNDetectHorizonRequestClass())
  {
    v5.receiver = self;
    v5.super_class = (Class)AXMHorizonDetectorNode;
    return -[AXMVisionEngineNode validateVisionKitSoftLinkSymbols](&v5, sel_validateVisionKitSoftLinkSymbols);
  }
  else
  {
    AXMediaLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[AXMHorizonDetectorNode validateVisionKitSoftLinkSymbols].cold.1(v4);

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
  objc_super v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)AXMHorizonDetectorNode;
  v8 = -[AXMEvaluationNode evaluate:metrics:](&v17, sel_evaluate_metrics_, v6, v7);
  v9 = (void *)MEMORY[0x1B5E128FC](v8);
  -[AXMHorizonDetectorNode _detectHorizonRequest](self, "_detectHorizonRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v11 = objc_alloc_init((Class)getVNDetectHorizonRequestClass());
    -[AXMHorizonDetectorNode _setDetectHorizonRequest:](self, "_setDetectHorizonRequest:", v11);

  }
  -[AXMHorizonDetectorNode _detectHorizonRequest](self, "_detectHorizonRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMEvaluationNode evaluateRequests:withContext:requestHandlerOptions:metrics:error:](self, "evaluateRequests:withContext:requestHandlerOptions:metrics:error:", v13, v6, 0, v7, 0);

  objc_msgSend(v12, "results");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v6, "size");
    +[AXMVisionFeature featureWithVisionRequest:horizonResult:canvasSize:](AXMVisionFeature, "featureWithVisionRequest:horizonResult:canvasSize:", v12, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFeature:", v16);

  }
  objc_autoreleasePoolPop(v9);

}

- (VNDetectHorizonRequest)_detectHorizonRequest
{
  return self->__detectHorizonRequest;
}

- (void)_setDetectHorizonRequest:(id)a3
{
  objc_storeStrong((id *)&self->__detectHorizonRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__detectHorizonRequest, 0);
}

- (void)validateVisionKitSoftLinkSymbols
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B0E3B000, log, OS_LOG_TYPE_ERROR, "Could not evaluate. VNDetectHorizonRequestSoft was nil", v1, 2u);
}

@end
