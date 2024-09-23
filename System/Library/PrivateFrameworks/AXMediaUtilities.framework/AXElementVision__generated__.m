@implementation AXElementVision__generated__

+ (id)urlOfModelInThisBundle
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathForResource:ofType:", CFSTR("AXElementVision"), CFSTR("mlmodelc"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (AXElementVision__generated__)init
{
  void *v3;
  AXElementVision__generated__ *v4;

  objc_msgSend((id)objc_opt_class(), "urlOfModelInThisBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[AXElementVision__generated__ initWithContentsOfURL:error:](self, "initWithContentsOfURL:error:", v3, 0);

  return v4;
}

- (AXElementVision__generated__)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  id v6;
  AXElementVision__generated__ *v7;
  uint64_t v8;
  MLModel *model;
  AXElementVision__generated__ *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AXElementVision__generated__;
  v7 = -[AXElementVision__generated__ init](&v12, sel_init);
  if (v7
    && (objc_msgSend(MEMORY[0x1E0C9E940], "modelWithContentsOfURL:error:", v6, a4),
        v8 = objc_claimAutoreleasedReturnValue(),
        model = v7->_model,
        v7->_model = (MLModel *)v8,
        model,
        v7->_model))
  {
    v10 = v7;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (AXElementVision__generated__)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  AXElementVision__generated__ *v8;

  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "urlOfModelInThisBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AXElementVision__generated__ initWithContentsOfURL:configuration:error:](self, "initWithContentsOfURL:configuration:error:", v7, v6, a4);

  return v8;
}

- (AXElementVision__generated__)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  AXElementVision__generated__ *v10;
  uint64_t v11;
  MLModel *model;
  AXElementVision__generated__ *v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)AXElementVision__generated__;
  v10 = -[AXElementVision__generated__ init](&v15, sel_init);
  if (v10
    && (objc_msgSend(MEMORY[0x1E0C9E940], "modelWithContentsOfURL:configuration:error:", v8, v9, a5),
        v11 = objc_claimAutoreleasedReturnValue(),
        model = v10->_model,
        v10->_model = (MLModel *)v11,
        model,
        v10->_model))
  {
    v13 = v10;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)predictionFromFeatures:(id)a3 error:(id *)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;

  v6 = (objc_class *)MEMORY[0x1E0C9E9B0];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  -[AXElementVision__generated__ predictionFromFeatures:options:error:](self, "predictionFromFeatures:options:error:", v7, v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  void *v5;
  AXElementVision__generated__Output *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  AXElementVision__generated__Output *v11;

  -[MLModel predictionFromFeatures:options:error:](self->_model, "predictionFromFeatures:options:error:", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [AXElementVision__generated__Output alloc];
  objc_msgSend(v5, "featureValueForName:", CFSTR("confidence"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "multiArrayValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "featureValueForName:", CFSTR("coordinates"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "multiArrayValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[AXElementVision__generated__Output initWithConfidence:coordinates:](v6, "initWithConfidence:coordinates:", v8, v10);

  return v11;
}

- (id)predictionFromImage:(__CVBuffer *)a3 iouThreshold:(double)a4 confidenceThreshold:(double)a5 error:(id *)a6
{
  AXElementVision__generated__Input *v8;
  void *v9;

  v8 = -[AXElementVision__generated__Input initWithImage:iouThreshold:confidenceThreshold:]([AXElementVision__generated__Input alloc], "initWithImage:iouThreshold:confidenceThreshold:", a3, a4, a5);
  -[AXElementVision__generated__ predictionFromFeatures:error:](self, "predictionFromFeatures:error:", v8, a6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)predictionsFromInputs:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  AXElementVision__generated__Output *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  AXElementVision__generated__Output *v18;
  void *v20;
  void *v21;
  void *v22;

  v7 = a3;
  v8 = a4;
  v22 = v7;
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E8E0]), "initWithFeatureProviderArray:", v7);
  v21 = v8;
  -[MLModel predictionsFromBatch:options:error:](self->_model, "predictionsFromBatch:options:error:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count") >= 1)
  {
    v11 = 0;
    do
    {
      objc_msgSend(v9, "featuresAtIndex:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = [AXElementVision__generated__Output alloc];
      objc_msgSend(v12, "featureValueForName:", CFSTR("confidence"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "multiArrayValue");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "featureValueForName:", CFSTR("coordinates"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "multiArrayValue");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[AXElementVision__generated__Output initWithConfidence:coordinates:](v13, "initWithConfidence:coordinates:", v15, v17);

      objc_msgSend(v10, "addObject:", v18);
      ++v11;
    }
    while (v11 < objc_msgSend(v9, "count"));
  }

  return v10;
}

- (MLModel)model
{
  return self->_model;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
}

@end
