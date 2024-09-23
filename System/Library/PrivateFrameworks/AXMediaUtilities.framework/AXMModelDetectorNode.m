@implementation AXMModelDetectorNode

- (void)nodeInitialize
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)AXMModelDetectorNode;
  -[AXMEvaluationNode nodeInitialize](&v2, sel_nodeInitialize);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMModelDetectorNode)initWithCoder:(id)a3
{
  id v4;
  AXMModelDetectorNode *v5;
  void *v6;
  uint64_t v7;
  NSURL *modelURL;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AXMModelDetectorNode;
  v5 = -[AXMEvaluationNode initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("modelURL"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
      modelURL = v5->_modelURL;
      v5->_modelURL = (NSURL *)v7;

    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AXMModelDetectorNode;
  v4 = a3;
  -[AXMEvaluationNode encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[NSURL path](self->_modelURL, "path", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("modelURL"));

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
  return CFSTR("Model Detector");
}

- (NSString)modelIdentifier
{
  void *v2;
  void *v3;

  -[NSURL lastPathComponent](self->_modelURL, "lastPathComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByDeletingPathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setModelURL:(id)a3
{
  VNCoreMLModel *model;
  id v6;

  v6 = a3;
  if ((-[NSURL isEqual:](self->_modelURL, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_modelURL, a3);
    model = self->_model;
    self->_model = 0;

  }
}

- (BOOL)preloadModelIfNeeded:(id *)a3
{
  return self->_model || -[AXMModelDetectorNode _loadModel:](self, "_loadModel:", a3);
}

- (BOOL)_loadModel:(id *)a3
{
  void *v4;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id MLModelClass;
  void *v14;
  void *v15;
  id v16;
  __CFString *v17;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  VNCoreMLModel *v40;
  id v41;
  VNCoreMLModel *model;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  id v51;
  id v52;
  id v53;
  uint8_t buf[4];
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  if (self->_model)
  {
    v4 = 0;
    if (!a3)
      goto LABEL_19;
    goto LABEL_18;
  }
  -[AXMModelDetectorNode modelURL](self, "modelURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v17 = CFSTR("Could not load model. modelURL was nil");
    goto LABEL_17;
  }
  if (!getMLModelClass())
  {
    v17 = CFSTR("Could not load model. MLModelSoft unexpectedly NULL");
    goto LABEL_17;
  }
  getMLModelClass();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v17 = CFSTR("Could not load model. MLModelSoft does not respond to modelWithContentsOfURL:error:");
    goto LABEL_17;
  }
  if (!getVNCoreMLModelClass())
  {
    v17 = CFSTR("Could not load model. VNCoreMLModelSoft unexpectedly NULL");
    goto LABEL_17;
  }
  getVNCoreMLModelClass();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v17 = CFSTR("Could not load model. VNCoreMLModelSoft does not respond to modelForMLModel:error:");
LABEL_17:
    _AXMMakeError(0, v17, v7, v8, v9, v10, v11, v12, v49);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a3)
      goto LABEL_19;
LABEL_18:
    *a3 = objc_retainAutorelease(v4);
    goto LABEL_19;
  }
  MLModelClass = getMLModelClass();
  -[AXMModelDetectorNode modelURL](self, "modelURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0;
  objc_msgSend(MLModelClass, "modelWithContentsOfURL:error:", v14, &v53);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v53;

  if (!v15 || v16)
  {
    AXMediaLogCommon();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B0E3B000, v19, OS_LOG_TYPE_DEFAULT, "CoreML model may need to be compiled first. Attempting to compile...", buf, 2u);
    }

    v20 = getMLModelClass();
    -[AXMModelDetectorNode modelURL](self, "modelURL");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = 0;
    objc_msgSend(v20, "compileModelAtURL:error:", v21, &v52);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v52;

    if (!v22 || v23)
    {
      -[AXMModelDetectorNode modelURL](self, "modelURL");
      v27 = (id)objc_claimAutoreleasedReturnValue();
      _AXMMakeError(0, CFSTR("Failed to compile model on the fly at URL: %@. error:%@\nTried to compile model due to original error: %@"), v34, v35, v36, v37, v38, v39, (uint64_t)v27);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = (uint64_t)v15;
    }
    else
    {

      AXMediaLogCommon();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v22, "path");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v55 = v25;
        _os_log_impl(&dword_1B0E3B000, v24, OS_LOG_TYPE_DEFAULT, "Successfully compiled CoreML model to %@", buf, 0xCu);

      }
      v51 = 0;
      objc_msgSend(getMLModelClass(), "modelWithContentsOfURL:error:", v22, &v51);
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = v51;

      if (v26 && !v27)
      {
        v4 = 0;
LABEL_32:

        v15 = (void *)v26;
        goto LABEL_33;
      }
      _AXMMakeError(0, CFSTR("Could not load model at URL: %@. error:%@"), v28, v29, v30, v31, v32, v33, (uint64_t)v22);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_32;
  }
  v4 = 0;
LABEL_33:
  if (v15)
  {
    if (!v4)
    {
      v50 = 0;
      objc_msgSend(getVNCoreMLModelClass(), "modelForMLModel:error:", v15, &v50);
      v40 = (VNCoreMLModel *)objc_claimAutoreleasedReturnValue();
      v41 = v50;
      model = self->_model;
      self->_model = v40;

      if (!self->_model || (v4 = 0, v41))
      {
        _AXMMakeError(0, CFSTR("Could not craete VNCoreMLModel. error:%@"), v43, v44, v45, v46, v47, v48, (uint64_t)v41);
        v4 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
  }

  if (a3)
    goto LABEL_18;
LABEL_19:

  return v4 == 0;
}

- (void)evaluate:(id)a3 metrics:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  BOOL v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  float v19;
  double v20;
  double v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  __CFString *v46;
  __CFString *v47;
  NSObject *v48;
  id v49;
  objc_super v50;
  _QWORD v51[2];

  v51[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v50.receiver = self;
  v50.super_class = (Class)AXMModelDetectorNode;
  v8 = -[AXMEvaluationNode evaluate:metrics:](&v50, sel_evaluate_metrics_, v6, v7);
  v9 = (void *)MEMORY[0x1B5E128FC](v8);
  if (getVNClassificationObservationClass())
  {
    if (getVNCoreMLRequestClass())
    {
      -[AXMModelDetectorNode modelURL](self, "modelURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v49 = 0;
        v11 = -[AXMModelDetectorNode _loadModel:](self, "_loadModel:", &v49);
        v12 = v49;
        if (v11)
        {
          v13 = objc_msgSend(objc_alloc((Class)getVNCoreMLRequestClass()), "initWithModel:", self->_model);
          -[NSObject setImageCropAndScaleOption:](v13, "setImageCropAndScaleOption:", 0);
          v51[0] = v13;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = v12;
          -[AXMEvaluationNode evaluateRequests:withContext:requestHandlerOptions:metrics:error:](self, "evaluateRequests:withContext:requestHandlerOptions:metrics:error:", v14, v6, 0, v7, &v48);
          v15 = v48;

          -[NSObject results](v13, "results");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "firstObject");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          getVNClassificationObservationClass();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v18 = v17;
            objc_msgSend(v18, "confidence");
            v20 = v19;
            -[AXMEvaluationNode minimumConfidence](self, "minimumConfidence");
            if (v21 <= v20)
            {
              -[AXMModelDetectorNode modelIdentifier](self, "modelIdentifier");
              v44 = objc_claimAutoreleasedReturnValue();
              v45 = (void *)v44;
              v46 = CFSTR("UnknownModel");
              if (v44)
                v46 = (__CFString *)v44;
              v47 = v46;

              objc_msgSend(v6, "size");
              +[AXMVisionFeature featureWithVisionRequest:modelClassificationResult:modelIdentifier:canvasSize:](AXMVisionFeature, "featureWithVisionRequest:modelClassificationResult:modelIdentifier:canvasSize:", v13, v18, v47);
              v22 = objc_claimAutoreleasedReturnValue();

              objc_msgSend(v6, "appendFeature:", v22);
            }
            else
            {
              AXMediaLogResults();
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
                -[AXMModelDetectorNode evaluate:metrics:].cold.4(self, (uint64_t)v18, v22);
            }

          }
          v12 = v15;
        }
        else
        {
          AXMediaLogCommon();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            -[AXMModelDetectorNode evaluate:metrics:].cold.5((uint64_t)v12, v13);
        }

      }
      else
      {
        AXMediaLogCommon();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          -[AXMModelDetectorNode evaluate:metrics:].cold.3(v12, v37, v38, v39, v40, v41, v42, v43);
      }
    }
    else
    {
      AXMediaLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[AXMModelDetectorNode evaluate:metrics:].cold.2(v12, v30, v31, v32, v33, v34, v35, v36);
    }
  }
  else
  {
    AXMediaLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[AXMModelDetectorNode evaluate:metrics:].cold.1(v12, v23, v24, v25, v26, v27, v28, v29);
  }

  objc_autoreleasePoolPop(v9);
}

- (NSURL)modelURL
{
  return self->_modelURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelURL, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

- (void)evaluate:(uint64_t)a3 metrics:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1B0E3B000, a1, a3, "Could not evaluate. VNClassificationObservationSoft was nil", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)evaluate:(uint64_t)a3 metrics:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1B0E3B000, a1, a3, "Could not evaluate. VNCoreMLRequestSoft was nil", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)evaluate:(uint64_t)a3 metrics:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1B0E3B000, a1, a3, "Could not evaluate. modelURL was nil", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)evaluate:(NSObject *)a3 metrics:.cold.4(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "minimumConfidence");
  v6 = 134218242;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_debug_impl(&dword_1B0E3B000, a3, OS_LOG_TYPE_DEBUG, "Discarding classification result due to low confidence. minimumAllowed:%.2f . %@", (uint8_t *)&v6, 0x16u);
}

- (void)evaluate:(uint64_t)a1 metrics:(NSObject *)a2 .cold.5(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1B0E3B000, a2, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v2, 0xCu);
}

@end
