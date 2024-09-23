@implementation VNRecognizeDocumentElementsRequest

- (id)supportedIdentifiersAndReturnError:(id *)a3
{
  VNSession *v5;
  void *v6;
  id v7;
  void *v8;
  id v10;

  v5 = objc_alloc_init(VNSession);
  v10 = 0;
  -[VNRequest applicableDetectorAndOptions:forRevision:loadedInSession:error:](self, "applicableDetectorAndOptions:forRevision:loadedInSession:error:", &v10, -[VNRequest resolvedRevision](self, "resolvedRevision"), v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v10;
  if (!v6)
    goto LABEL_6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a3)
    {
      +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:", -[VNRequest resolvedRevision](self, "resolvedRevision"), self);
      v8 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  objc_msgSend(v6, "supportedDocumentElementIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v8;
}

- (unint64_t)imageCropAndScaleOption
{
  void *v2;
  unint64_t v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "imageCropAndScaleOption");

  return v3;
}

- (void)setImageCropAndScaleOption:(unint64_t)a3
{
  id v4;

  -[VNRequest configuration](self, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImageCropAndScaleOption:", a3);

}

- (VNRecognizeDocumentElementsRequestElementConfiguration)documentElements
{
  void *v2;
  void *v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "documentElements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (VNRecognizeDocumentElementsRequestElementConfiguration *)v3;
}

- (VNRecognizeDocumentElementsRequestElementConfiguration)textElements
{
  void *v2;
  void *v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textElements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (VNRecognizeDocumentElementsRequestElementConfiguration *)v3;
}

- (VNRecognizeDocumentElementsRequestElementConfiguration)machineReadableCodeElements
{
  void *v2;
  void *v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "machineReadableCodeElements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (VNRecognizeDocumentElementsRequestElementConfiguration *)v3;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  __CFString *v4;
  __CFString *v5;

  if (a3 == 1)
  {
    v4 = CFSTR("VNSmartCam5GatingDetectorType");
    v5 = CFSTR("VNSmartCam5GatingDetectorType");
  }
  else if (a4)
  {
    +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:");
    v4 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)VNRecognizeDocumentElementsRequest;
  v6 = -[VNRequest newDefaultDetectorOptionsForRequestRevision:session:](&v16, sel_newDefaultDetectorOptionsForRequestRevision_session_, a3, a4);
  v7 = v6;
  if (a3 == 1)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("VNDetectorOption_OriginatingRequestSpecifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("VNSmartCam5GatingDetectorProcessingOption_GatingOriginatingRequestSpecifier"));

    -[VNRecognizeDocumentElementsRequest documentElements](self, "documentElements");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "recognize"))
    {
      objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("VNSmartCam5GatingDetectorProcessingOption_DocumentRegionGatingEnabled"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v9, "generateSegmentationMask"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("VNSmartCam5GatingDetectorProcessingOption_DocumentRegionGatingGenerateSegmentationMask"));

    }
    -[VNRecognizeDocumentElementsRequest textElements](self, "textElements");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "recognize"))
    {
      objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("VNSmartCam5GatingDetectorProcessingOption_TextRegionGatingEnabled"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v11, "generateSegmentationMask"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, CFSTR("VNSmartCam5GatingDetectorProcessingOption_TextRegionGatingGenerateSegmentationMask"));

    }
    -[VNRecognizeDocumentElementsRequest machineReadableCodeElements](self, "machineReadableCodeElements");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "recognize"))
    {
      objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("VNSmartCam5GatingDetectorProcessingOption_MachineReadableCodesGatingEnabled"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v13, "generateSegmentationMask"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, CFSTR("VNSmartCam5GatingDetectorProcessingOption_MachineReadableCodesGatingGenerateSegmentationMask"));

    }
  }
  return v7;
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;
  BOOL v15;
  objc_super v17;

  v4 = a3;
  v5 = -[VNRecognizeDocumentElementsRequest imageCropAndScaleOption](self, "imageCropAndScaleOption");
  if (v5 != objc_msgSend(v4, "imageCropAndScaleOption"))
    goto LABEL_6;
  -[VNRecognizeDocumentElementsRequest documentElements](self, "documentElements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "documentElements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if ((v8 & 1) == 0)
    goto LABEL_6;
  -[VNRecognizeDocumentElementsRequest textElements](self, "textElements");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textElements");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if ((v11 & 1) == 0)
    goto LABEL_6;
  -[VNRecognizeDocumentElementsRequest machineReadableCodeElements](self, "machineReadableCodeElements");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "machineReadableCodeElements");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isEqual:", v13);

  if ((v14 & 1) != 0)
  {
    v17.receiver = self;
    v17.super_class = (Class)VNRecognizeDocumentElementsRequest;
    v15 = -[VNImageBasedRequest willAcceptCachedResultsFromRequestWithConfiguration:](&v17, sel_willAcceptCachedResultsFromRequestWithConfiguration_, v4);
  }
  else
  {
LABEL_6:
    v15 = 0;
  }

  return v15;
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  if (a5)
  {
    +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:", a3, self);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (const)revisionAvailability
{
  return (const $FA132638BE9F3789EDBDEDD04080CB9E *)&+[VNRecognizeDocumentElementsRequest revisionAvailability]::ourRevisionAvailability;
}

@end
