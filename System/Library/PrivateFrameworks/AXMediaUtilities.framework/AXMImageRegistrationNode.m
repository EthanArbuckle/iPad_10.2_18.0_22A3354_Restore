@implementation AXMImageRegistrationNode

- (void)nodeInitialize
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AXMImageRegistrationNode;
  -[AXMEvaluationNode nodeInitialize](&v3, sel_nodeInitialize);
  -[AXMImageRegistrationNode _resetTranspositionHistory](self, "_resetTranspositionHistory");
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
  return CFSTR("Image Registration");
}

- (BOOL)validateVisionKitSoftLinkSymbols
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  objc_super v19;

  if (getVNTranslationalImageRegistrationRequestClass())
  {
    if (getVNImageTranslationAlignmentObservationClass())
    {
      v19.receiver = self;
      v19.super_class = (Class)AXMImageRegistrationNode;
      return -[AXMVisionEngineNode validateVisionKitSoftLinkSymbols](&v19, sel_validateVisionKitSoftLinkSymbols);
    }
    AXMediaLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[AXMImageRegistrationNode validateVisionKitSoftLinkSymbols].cold.2(v4, v12, v13, v14, v15, v16, v17, v18);
  }
  else
  {
    AXMediaLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[AXMImageRegistrationNode validateVisionKitSoftLinkSymbols].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
  }

  return 0;
}

- (id)_translationalImageRegistrationRequestForInput:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  v3 = a3;
  v4 = objc_msgSend(v3, "inputType");
  if (v4 == 2)
  {
    v8 = objc_alloc((Class)getVNTranslationalImageRegistrationRequestClass());
    objc_msgSend(v3, "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "initWithTargetedImageURL:options:", v6, MEMORY[0x1E0C9AA70]);
  }
  else
  {
    if (v4 == 1)
    {
      v10 = objc_alloc((Class)getVNTranslationalImageRegistrationRequestClass());
      objc_msgSend(v3, "pixelBuffer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v6, "pixelBuffer");
      objc_msgSend(v3, "pixelBuffer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "orientation");
      v9 = (void *)objc_msgSend(v10, "initWithTargetedCVPixelBuffer:orientation:options:", v11, v13, MEMORY[0x1E0C9AA70]);

      goto LABEL_8;
    }
    if (v4)
    {
      v9 = 0;
      goto LABEL_10;
    }
    v5 = objc_alloc((Class)getVNTranslationalImageRegistrationRequestClass());
    objc_msgSend(v3, "ciImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "initWithTargetedCIImage:options:", v6, MEMORY[0x1E0C9AA70]);
  }
  v9 = (void *)v7;
LABEL_8:

LABEL_10:
  return v9;
}

- (void)evaluate:(id)a3 metrics:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  AXMPipelineContextInput **p_previousInput;
  AXMPipelineContextInput *v11;
  AXMPipelineContextInput *currentInput;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char isKindOfClass;
  void *v35;
  void *v36;
  uint64_t v37;
  id v38;
  id v39;
  objc_super v40;
  void *v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v40.receiver = self;
  v40.super_class = (Class)AXMImageRegistrationNode;
  v8 = -[AXMEvaluationNode evaluate:metrics:](&v40, sel_evaluate_metrics_, v6, v7);
  v9 = (void *)MEMORY[0x1B5E128FC](v8);
  p_previousInput = &self->_previousInput;
  objc_storeStrong((id *)&self->_previousInput, self->_currentInput);
  objc_msgSend(v6, "sourceInput");
  v11 = (AXMPipelineContextInput *)objc_claimAutoreleasedReturnValue();
  currentInput = self->_currentInput;
  self->_currentInput = v11;

  if (self->_previousInput)
  {
    objc_msgSend(v6, "sequenceRequestManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sequenceRequestHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      AXMediaLogCommon();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[AXMImageRegistrationNode evaluate:metrics:].cold.1(v20, v21, v22, v23, v24, v25, v26, v27);
      goto LABEL_22;
    }
    -[AXMImageRegistrationNode _translationalImageRegistrationRequestForInput:](self, "_translationalImageRegistrationRequestForInput:", self->_currentInput);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = -[AXMPipelineContextInput inputType](*p_previousInput, "inputType");
      if (v16 == 1)
      {
        v42[0] = v15;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXMPipelineContextInput pixelBuffer](*p_previousInput, "pixelBuffer");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v30, "pixelBuffer");
        -[AXMPipelineContextInput pixelBuffer](*p_previousInput, "pixelBuffer");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = 0;
        LOBYTE(v37) = objc_msgSend(v14, "performRequests:onCVPixelBuffer:orientation:error:", v29, v37, objc_msgSend(v31, "orientation"), &v39);
        v20 = v39;

        if ((v37 & 1) != 0)
        {
LABEL_16:
          objc_msgSend(v15, "results");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "firstObject");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          getVNImageTranslationAlignmentObservationClass();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            objc_msgSend(v15, "results");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "firstObject");
            v36 = (void *)objc_claimAutoreleasedReturnValue();

            if (v36)
              objc_msgSend(v36, "alignmentTransform");
            -[AXMImageRegistrationNode _recordTransposition:](self, "_recordTransposition:", 0.0, 0.0);

          }
          objc_msgSend(v6, "setImageRegistrationState:", self->_registrationState);
LABEL_21:

LABEL_22:
          goto LABEL_23;
        }
LABEL_12:
        AXMediaLogCommon();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          -[AXMTraitDetectorNode evaluate:metrics:].cold.2((uint64_t)v20, v28);

        goto LABEL_21;
      }
      if (!v16)
      {
        v41 = v15;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXMPipelineContextInput ciImage](*p_previousInput, "ciImage");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 0;
        v19 = objc_msgSend(v14, "performRequests:onCIImage:error:", v17, v18, &v38);
        v20 = v38;

        if ((v19 & 1) != 0)
          goto LABEL_16;
        goto LABEL_12;
      }
    }
    v20 = 0;
    goto LABEL_12;
  }
  -[AXMImageRegistrationNode _resetTranspositionHistory](self, "_resetTranspositionHistory");
LABEL_23:
  objc_autoreleasePoolPop(v9);

}

- (void)_resetTranspositionHistory
{
  self->_fillingHistoryBuffer = 1;
  self->_transpositionHistoryLastRecordedIndex = 0;
  self->_transpositionHistoryCircularBuffer[8] = 0u;
  self->_transpositionHistoryCircularBuffer[9] = 0u;
  self->_transpositionHistoryCircularBuffer[6] = 0u;
  self->_transpositionHistoryCircularBuffer[7] = 0u;
  self->_transpositionHistoryCircularBuffer[4] = 0u;
  self->_transpositionHistoryCircularBuffer[5] = 0u;
  self->_transpositionHistoryCircularBuffer[2] = 0u;
  self->_transpositionHistoryCircularBuffer[3] = 0u;
  self->_transpositionHistoryCircularBuffer[0] = 0u;
  self->_transpositionHistoryCircularBuffer[1] = 0u;
  self->_registrationState = 0;
}

- (void)_resetImageRegistration
{
  AXMPipelineContextInput *previousInput;
  AXMPipelineContextInput *currentInput;

  previousInput = self->_previousInput;
  self->_previousInput = 0;

  currentInput = self->_currentInput;
  self->_currentInput = 0;

  -[AXMImageRegistrationNode _resetTranspositionHistory](self, "_resetTranspositionHistory");
}

- (void)_recordTransposition:(CGPoint)a3
{
  unint64_t v3;
  int64_t v4;
  uint64_t v5;
  double v6;
  CGPoint *v7;
  double v8;
  float64x2x2_t v9;

  v3 = (self->_transpositionHistoryLastRecordedIndex + 1) % 0xA;
  self->_transpositionHistoryLastRecordedIndex = v3;
  self->_transpositionHistoryCircularBuffer[v3] = a3;
  if (self->_fillingHistoryBuffer)
  {
    if (v3)
    {
      v4 = 1;
      goto LABEL_14;
    }
    self->_fillingHistoryBuffer = 0;
  }
  v5 = 0;
  v6 = 0.0;
  do
  {
    v7 = &self->_transpositionHistoryCircularBuffer[v5];
    v9 = vld2q_f64(&v7->x);
    v9.val[0] = vsqrtq_f64(vmlaq_f64(vmulq_f64(v9.val[1], v9.val[1]), v9.val[0], v9.val[0]));
    v6 = v6 + v9.val[0].f64[0] + v9.val[0].f64[1];
    v5 += 2;
  }
  while (v5 != 10);
  v8 = v6 / 10.0;
  if (v8 >= 30.0)
  {
    if (v8 >= 70.0)
    {
      if (v8 >= 300.0)
        v4 = 2;
      else
        v4 = 3;
    }
    else
    {
      v4 = 4;
    }
  }
  else
  {
    v4 = 5;
  }
LABEL_14:
  self->_registrationState = v4;
}

- (int64_t)registrationState
{
  return self->_registrationState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentInput, 0);
  objc_storeStrong((id *)&self->_previousInput, 0);
}

- (void)validateVisionKitSoftLinkSymbols
{
  OUTLINED_FUNCTION_0_1(&dword_1B0E3B000, a1, a3, "Could not evaluate. VNImageTranslationAlignmentObservationSoft was nil", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)evaluate:(uint64_t)a3 metrics:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1B0E3B000, a1, a3, "Could not evaluate. requestHandler was nil", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

@end
