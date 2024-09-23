@implementation AXMTraitDetectorNode

- (void)nodeInitialize
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AXMTraitDetectorNode;
  -[AXMEvaluationNode nodeInitialize](&v3, sel_nodeInitialize);
  self->_shouldEvaluateColorInformation = 0;
  self->_colorDistanceTheshold = 5.0;
  self->_sampleFrequency = 4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
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
  return CFSTR("Traits");
}

- (BOOL)validateVisionKitSoftLinkSymbols
{
  NSObject *v4;
  objc_super v5;

  if (getVNImageScoreObservationClass())
  {
    if (getVNImageBrightnessObservationClass())
    {
      if (getVNImageBlurObservationClass())
      {
        v5.receiver = self;
        v5.super_class = (Class)AXMTraitDetectorNode;
        return -[AXMVisionEngineNode validateVisionKitSoftLinkSymbols](&v5, sel_validateVisionKitSoftLinkSymbols);
      }
      AXMediaLogCommon();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        -[AXMTraitDetectorNode validateVisionKitSoftLinkSymbols].cold.3();
    }
    else
    {
      AXMediaLogCommon();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        -[AXMTraitDetectorNode validateVisionKitSoftLinkSymbols].cold.2();
    }
  }
  else
  {
    AXMediaLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[AXMTraitDetectorNode validateVisionKitSoftLinkSymbols].cold.1();
  }

  return 0;
}

- (void)evaluate:(id)a3 metrics:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  id v13;
  void *v14;
  char v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  int v20;
  int v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  id v26;
  objc_super v27;
  _QWORD v28[5];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)AXMTraitDetectorNode;
  v8 = -[AXMEvaluationNode evaluate:metrics:](&v27, sel_evaluate_metrics_, v6, v7);
  v9 = (void *)MEMORY[0x1B5E128FC](v8);
  if (-[AXMTraitDetectorNode shouldEvaluateColorInformation](self, "shouldEvaluateColorInformation"))
    -[AXMTraitDetectorNode _evaluateColorInformation:](self, "_evaluateColorInformation:", v6);
  objc_msgSend(v6, "visionImageRequestHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v29 = 0;
    v30 = &v29;
    v31 = 0x2050000000;
    v11 = (void *)getVNImageBlurScoreRequestClass_softClass;
    v32 = getVNImageBlurScoreRequestClass_softClass;
    if (!getVNImageBlurScoreRequestClass_softClass)
    {
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __getVNImageBlurScoreRequestClass_block_invoke;
      v28[3] = &unk_1E625C4E8;
      v28[4] = &v29;
      __getVNImageBlurScoreRequestClass_block_invoke((uint64_t)v28);
      v11 = (void *)v30[3];
    }
    v12 = objc_retainAutorelease(v11);
    _Block_object_dispose(&v29, 8);
    v13 = objc_alloc_init(v12);
    v33[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    v15 = objc_msgSend(v10, "performRequests:error:", v14, &v26);
    v16 = v26;
    if ((v15 & 1) != 0)
    {
      objc_msgSend(v13, "results");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXMTraitDetectorNode _blurValueForVisionObservation:](self, "_blurValueForVisionObservation:", v18);
      v19 = objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        -[NSObject floatValue](v19, "floatValue");
        v21 = v20;
        objc_msgSend(v6, "size");
        v23 = v22;
        LODWORD(v22) = v21;
        +[AXMVisionFeature featureWithVisionRequest:blurValue:canvasSize:](AXMVisionFeature, "featureWithVisionRequest:blurValue:canvasSize:", v13, v22, v23, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendFeature:", v25);

      }
    }
    else
    {
      AXMediaLogCommon();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[AXMTraitDetectorNode evaluate:metrics:].cold.2((uint64_t)v16, v19);
    }

  }
  else
  {
    AXMediaLogCommon();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[AXMTraitDetectorNode evaluate:metrics:].cold.1();
  }

  objc_autoreleasePoolPop(v9);
}

- (id)_brightnessValueForVisionObservation:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  getVNImageBrightnessObservationClass();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v3, "brightness");
    objc_msgSend(v4, "numberWithFloat:");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    getVNImageScoreObservationClass();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v3, "exposureScore");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
LABEL_7:

  return v6;
}

- (id)_blurValueForVisionObservation:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  getVNImageBlurObservationClass();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v3, "blurMeasure");
    objc_msgSend(v4, "numberWithFloat:");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    getVNImageScoreObservationClass();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v3, "blurScore");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
LABEL_7:

  return v6;
}

- (int64_t)sampleFrequency
{
  return self->_sampleFrequency;
}

- (void)setSampleFrequency:(int64_t)a3
{
  self->_sampleFrequency = a3;
}

- (BOOL)shouldEvaluateColorInformation
{
  return self->_shouldEvaluateColorInformation;
}

- (void)setShouldEvaluateColorInformation:(BOOL)a3
{
  self->_shouldEvaluateColorInformation = a3;
}

- (double)colorDistanceTheshold
{
  return self->_colorDistanceTheshold;
}

- (void)setColorDistanceTheshold:(double)a3
{
  self->_colorDistanceTheshold = a3;
}

- (void)validateVisionKitSoftLinkSymbols
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1B0E3B000, v0, v1, "Could not evaluate. VNImageBlurObservationSoft was nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)evaluate:metrics:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1B0E3B000, v0, v1, "Could not evaluate. requestHandler was nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)evaluate:(uint64_t)a1 metrics:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1B0E3B000, a2, OS_LOG_TYPE_ERROR, "Could not evaluate: %@", (uint8_t *)&v2, 0xCu);
}

@end
