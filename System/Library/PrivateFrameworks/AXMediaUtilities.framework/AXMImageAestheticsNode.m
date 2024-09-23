@implementation AXMImageAestheticsNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMImageAestheticsNode)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AXMImageAestheticsNode;
  return -[AXMEvaluationNode initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AXMImageAestheticsNode;
  -[AXMEvaluationNode encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

+ (BOOL)isSupported
{
  return 1;
}

+ (id)title
{
  return CFSTR("Aesthetics");
}

- (BOOL)validateVisionKitSoftLinkSymbols
{
  NSObject *v4;
  objc_super v5;

  if (getVNClassifyImageAestheticsRequestClass())
  {
    v5.receiver = self;
    v5.super_class = (Class)AXMImageAestheticsNode;
    return -[AXMVisionEngineNode validateVisionKitSoftLinkSymbols](&v5, sel_validateVisionKitSoftLinkSymbols);
  }
  else
  {
    AXMediaLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[AXMImageAestheticsNode validateVisionKitSoftLinkSymbols].cold.1(v4);

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
  objc_super v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)AXMImageAestheticsNode;
  v8 = -[AXMEvaluationNode evaluate:metrics:](&v18, sel_evaluate_metrics_, v6, v7);
  v9 = (void *)MEMORY[0x1B5E128FC](v8);
  -[AXMImageAestheticsNode _imageAestheticsRequest](self, "_imageAestheticsRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v11 = objc_alloc_init((Class)getVNClassifyImageAestheticsRequestClass());
    -[AXMImageAestheticsNode set_imageAestheticsRequest:](self, "set_imageAestheticsRequest:", v11);

    -[AXMImageAestheticsNode _imageAestheticsRequest](self, "_imageAestheticsRequest");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[AXMEvaluationNode configureForRunningOnANEIfPossibleWithRequest:](AXMEvaluationNode, "configureForRunningOnANEIfPossibleWithRequest:", v12);

  }
  -[AXMImageAestheticsNode _imageAestheticsRequest](self, "_imageAestheticsRequest");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMEvaluationNode evaluateRequests:withContext:requestHandlerOptions:metrics:error:](self, "evaluateRequests:withContext:requestHandlerOptions:metrics:error:", v14, v6, 0, v7, 0);

  objc_msgSend(v13, "results");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    +[AXMVisionFeature featureWithImageAestheticsObservation:](AXMVisionFeature, "featureWithImageAestheticsObservation:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFeature:", v17);

  }
  objc_autoreleasePoolPop(v9);

}

- (VNClassifyImageAestheticsRequest)_imageAestheticsRequest
{
  return self->__imageAestheticsRequest;
}

- (void)set_imageAestheticsRequest:(id)a3
{
  objc_storeStrong((id *)&self->__imageAestheticsRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__imageAestheticsRequest, 0);
}

- (void)validateVisionKitSoftLinkSymbols
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B0E3B000, log, OS_LOG_TYPE_ERROR, "Could not evaluate. VNClassifyImageAestheticsRequestSoft was nil", v1, 2u);
}

@end
