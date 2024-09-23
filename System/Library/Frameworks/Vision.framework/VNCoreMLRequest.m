@implementation VNCoreMLRequest

- (VNCoreMLRequest)initWithModel:(VNCoreMLModel *)model
{
  return -[VNCoreMLRequest initWithModel:completionHandler:](self, "initWithModel:completionHandler:", model, 0);
}

- (VNCoreMLRequest)initWithModel:(VNCoreMLModel *)model completionHandler:(VNRequestCompletionHandler)completionHandler
{
  VNCoreMLModel *v7;
  VNCoreMLRequest *v8;
  VNCoreMLRequest *v9;
  void *v10;
  VNCoreMLRequest *v11;
  objc_super v13;

  v7 = model;
  v13.receiver = self;
  v13.super_class = (Class)VNCoreMLRequest;
  v8 = -[VNRequest initWithCompletionHandler:](&v13, sel_initWithCompletionHandler_, completionHandler);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_model, model);
    -[VNRequest configuration](v9, "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateWithPropertiesOfModel:", v9->_model);
    v11 = v9;

  }
  return v9;
}

- (VNImageCropAndScaleOption)imageCropAndScaleOption
{
  void *v2;
  VNImageCropAndScaleOption v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "imageCropAndScaleOption");

  return v3;
}

- (void)setImageCropAndScaleOption:(VNImageCropAndScaleOption)imageCropAndScaleOption
{
  id v4;

  -[VNRequest configuration](self, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImageCropAndScaleOption:", imageCropAndScaleOption);

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  -[VNRequest configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)VNCoreMLRequest;
  -[VNImageBasedRequest description](&v10, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  VNImageCropAndScaleOptionToString(-[VNCoreMLRequest imageCropAndScaleOption](self, "imageCropAndScaleOption"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "modelCachingIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ %@ model=%@"), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)newDuplicateInstance
{
  id v3;
  VNCoreMLModel *model;
  void *v5;
  void *v6;

  v3 = objc_alloc((Class)objc_opt_class());
  model = self->_model;
  -[VNRequest completionHandler](self, "completionHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithModel:completionHandler:", model, v5);

  return v6;
}

- (BOOL)allowsCachingOfResults
{
  void *v2;
  void *v3;
  BOOL v4;

  -[VNCoreMLRequest model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "featureProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  return v4;
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4;
  VNImageCropAndScaleOption v5;
  void *v6;
  void *v7;
  char v8;
  BOOL v9;
  objc_super v11;

  v4 = a3;
  v5 = -[VNCoreMLRequest imageCropAndScaleOption](self, "imageCropAndScaleOption");
  if (v5 == objc_msgSend(v4, "imageCropAndScaleOption")
    && (-[VNCoreMLModel cachingIdentifier](self->_model, "cachingIdentifier"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "modelCachingIdentifier"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v6, "isEqual:", v7),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    v11.receiver = self;
    v11.super_class = (Class)VNCoreMLRequest;
    v9 = -[VNImageBasedRequest willAcceptCachedResultsFromRequestWithConfiguration:](&v11, sel_willAcceptCachedResultsFromRequestWithConfiguration_, v4);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)sequencedRequestPreviousObservationsKey
{
  id v3;
  void *v4;
  VNImageCropAndScaleOption v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v9.receiver = self;
  v9.super_class = (Class)VNCoreMLRequest;
  -[VNRequest sequencedRequestPreviousObservationsKey](&v9, sel_sequencedRequestPreviousObservationsKey);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[VNCoreMLRequest imageCropAndScaleOption](self, "imageCropAndScaleOption");
  -[VNCoreMLModel sequencedRequestPreviousObservationsKey](self->_model, "sequencedRequestPreviousObservationsKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@:imageCropAndScaleOption=%lu:Model=%@"), v4, v5, v6);

  return v7;
}

- (void)applyConfigurationOfRequest:(id)a3
{
  VNCoreMLRequest *v4;
  objc_super v5;

  v4 = (VNCoreMLRequest *)a3;
  if (self != v4)
  {
    v5.receiver = self;
    v5.super_class = (Class)VNCoreMLRequest;
    -[VNImageBasedRequest applyConfigurationOfRequest:](&v5, sel_applyConfigurationOfRequest_, v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[VNCoreMLRequest setImageCropAndScaleOption:](self, "setImageCropAndScaleOption:", -[VNCoreMLRequest imageCropAndScaleOption](v4, "imageCropAndScaleOption"));
  }

}

- (id)supportedComputeStageDevicesAndReturnError:(id *)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  -[VNCoreMLRequest model](self, "model", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "supportedComputeDevices");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }
  v8 = CFSTR("VNComputeStageMain");
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  VNCoreMLTransformer *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  BOOL v29;
  void *v31;
  void *v32;
  id v33;
  VNCoreMLTransformer *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  objc_msgSend(v8, "imageBufferAndReturnError:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v8, "session");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[VNRequest newDefaultDetectorOptionsForRequestRevision:session:](self, "newDefaultDetectorOptionsForRequestRevision:session:", a3);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[VNCoreMLRequest imageCropAndScaleOption](self, "imageCropAndScaleOption"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("VNDetectorProcessOption_ImageCropAndScaleOption"));

    -[VNCoreMLRequest model](self, "model");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0;
    v13 = -[VNCoreMLTransformer initWithOptions:model:error:]([VNCoreMLTransformer alloc], "initWithOptions:model:error:", v10, v12, &v38);
    v36 = v38;
    if (!v13)
    {
      if (!a5)
      {
        v29 = 0;
LABEL_30:

        goto LABEL_31;
      }
      v34 = 0;
      +[VNError errorWithCode:message:underlyingError:](VNError, "errorWithCode:message:underlyingError:", 3, CFSTR("Failed to initialize VNCoreMLTransformer"), v36);
      v29 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_29:
      v13 = v34;
      goto LABEL_30;
    }
    v34 = v13;
    v39[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, CFSTR("VNDetectorProcessOption_InputImageBuffers"));

    objc_msgSend(v12, "scenePrintRequestSpecifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      v33 = v10;
      v15 = v32;
      v16 = v8;
      v17 = v16;
      if (!self)
      {

        goto LABEL_25;
      }
      -[VNCoreMLRequest _printProducingDependentRequestFromSpecifier:performedInContext:error:](self, v15, v16, a5);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (!v18)
      {

        goto LABEL_25;
      }
      objc_msgSend(v18, "VNCoreMLTransformerSceneprintsAndReturnError:", a5);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v20)
      {

        goto LABEL_25;
      }
      objc_msgSend(v33, "setObject:forKeyedSubscript:", v20, CFSTR("VNDetectorProcessOption_ScenePrints"));

    }
    objc_msgSend(v12, "detectionPrintRequestSpecifier");
    v33 = (id)objc_claimAutoreleasedReturnValue();
    if (!v33)
    {
LABEL_13:
      v27 = objc_msgSend(v8, "qosClass", v31);
      -[VNImageBasedRequest regionOfInterest](self, "regionOfInterest");
      v37 = v36;
      -[VNDetector processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:](v34, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v27, v10, self, &v37, 0);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v28 = v37;

      if (v15)
      {
        -[VNRequest setResults:](self, "setResults:", v15);
        v29 = 1;
      }
      else if (a5)
      {
        +[VNError errorWithCode:message:underlyingError:](VNError, "errorWithCode:message:underlyingError:", 3, CFSTR("The VNCoreMLTransform request failed"), v28);
        v29 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v29 = 0;
      }
      v36 = v28;
      goto LABEL_28;
    }
    v15 = v10;
    v21 = v33;
    v22 = v8;
    v23 = v22;
    if (self)
    {
      v31 = v21;
      -[VNCoreMLRequest _printProducingDependentRequestFromSpecifier:performedInContext:error:](self, v21, v22, a5);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (v24)
      {
        objc_msgSend(v24, "VNCoreMLTransformerDetectionprintAndReturnError:", a5);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26)
        {
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v26, CFSTR("VNCoreMLTransformerProcessOption_Detectionprint"));

          goto LABEL_13;
        }

      }
      else
      {

      }
    }
    else
    {

    }
LABEL_25:
    v29 = 0;
LABEL_28:

    goto LABEL_29;
  }
  v29 = 0;
LABEL_31:

  return v29;
}

- (VNCoreMLModel)model
{
  return self->_model;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
}

- (_QWORD)_printProducingDependentRequestFromSpecifier:(void *)a3 performedInContext:(_QWORD *)a4 error:
{
  id v7;
  id v8;
  objc_class *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = (objc_class *)objc_msgSend(v7, "requestClassAndReturnError:", a4);
  if (v9)
  {
    v10 = objc_alloc_init(v9);
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "applyConfigurationOfRequest:", a1);
      if ((objc_msgSend(v11, "setRevision:error:", objc_msgSend(v7, "requestRevision"), a4) & 1) != 0)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "imageCropAndScaleOption"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setValue:forKey:", v12, CFSTR("imageCropAndScaleOption"));

        }
        objc_msgSend(v8, "requestPerformerAndReturnError:", a4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13
          && (v18[0] = v11,
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1),
              v14 = (void *)objc_claimAutoreleasedReturnValue(),
              v15 = objc_msgSend(v13, "performDependentRequests:onBehalfOfRequest:inContext:error:", v14, a1, v8, a4),
              v14,
              (v15 & 1) != 0))
        {
          a4 = v11;
        }
        else
        {
          a4 = 0;
        }

        goto LABEL_15;
      }
    }
    else
    {
      if (!a4)
      {
LABEL_15:

        goto LABEL_16;
      }
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("could not create a dependent %@ to perform on behalf of %@"), v7, a1);
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v16);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    a4 = 0;
    goto LABEL_15;
  }
  a4 = 0;
LABEL_16:

  return a4;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportedRevisionsAreFilteredBasedOnAvailableComputeDevices
{
  return 0;
}

@end
