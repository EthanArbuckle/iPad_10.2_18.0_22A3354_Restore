@implementation VNClassifyPotentialLandmarkRequest

+ (id)knownClassificationsForRevision:(unint64_t)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  VNClassificationObservation *v15;
  double v16;
  VNClassificationObservation *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = objc_alloc_init((Class)a1);
  if ((objc_msgSend(v6, "setRevision:error:", a3, a4) & 1) != 0)
  {
    objc_msgSend(v6, "supportedIdentifiersAndReturnError:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v6, "specifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v10 = v7;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v20 != v12)
              objc_enumerationMutation(v10);
            v14 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
            v15 = [VNClassificationObservation alloc];
            LODWORD(v16) = 1.0;
            v17 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v15, "initWithOriginatingRequestSpecifier:identifier:confidence:", v8, v14, v16, (_QWORD)v19);
            objc_msgSend(v9, "addObject:", v17);

          }
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v11);
      }

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)descriptionForPrivateRevision:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  __CFString *v5;
  objc_super v7;
  uint64_t v8;
  uint64_t v9;

  if (a3 == 3737841664)
  {
    v5 = CFSTR("VNClassifyPotentialLandmarkRequestPrivateRevisionStillCapturePipeline");
  }
  else
  {
    v8 = v3;
    v9 = v4;
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___VNClassifyPotentialLandmarkRequest;
    objc_msgSendSuper2(&v7, sel_descriptionForPrivateRevision_);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

+ (BOOL)revision:(unint64_t)a3 mayAcceptResultsProducedByRevision:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  objc_super v7;
  uint64_t v8;
  uint64_t v9;

  if (a3 != a4)
    return 0;
  v8 = v4;
  v9 = v5;
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___VNClassifyPotentialLandmarkRequest;
  return objc_msgSendSuper2(&v7, sel_revision_mayAcceptResultsProducedByRevision_, a3, a3);
}

- (id)supportedIdentifiersAndReturnError:(id *)a3
{
  unint64_t v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v4 = -[VNRequest resolvedRevision](self, "resolvedRevision");
  if (v4 == 1)
  {
    v7[0] = CFSTR("VNPotentialLandmarkIdentifier");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3)
    {
      +[VNError errorForUnsupportedRevision:ofRequestClass:](VNError, "errorForUnsupportedRevision:ofRequestClass:", v4, objc_opt_class());
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      return 0;
    }
    v5 = 0;
  }
  return v5;
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

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  __CFString *v4;
  __CFString *v5;

  if (a3 == 1)
  {
    v4 = CFSTR("VNImageAnalyzerMultiDetectorType");
    v5 = CFSTR("VNImageAnalyzerMultiDetectorType");
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
  unint64_t v8;
  void *v9;
  VNImageAnalyzerMultiDetectorPotentialLandmarkClassificationConfiguration *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)VNClassifyPotentialLandmarkRequest;
  v6 = -[VNRequest newDefaultDetectorOptionsForRequestRevision:session:](&v12, sel_newDefaultDetectorOptionsForRequestRevision_session_, a3, a4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[VNClassifyPotentialLandmarkRequest imageCropAndScaleOption](self, "imageCropAndScaleOption"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("VNDetectorProcessOption_ImageCropAndScaleOption"));

  v8 = +[VNImageAnalyzerMultiDetector modelForRequestClass:revision:](VNImageAnalyzerMultiDetector, "modelForRequestClass:revision:", -[VNRequest frameworkClass](self, "frameworkClass"), a3);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("VNImageAnalyzerMultiDetectorInitializationOption_Model"));

    v10 = -[VNImageAnalyzerMultiDetectorAnalysisConfiguration initWithObservationsRecipient:]([VNImageAnalyzerMultiDetectorPotentialLandmarkClassificationConfiguration alloc], "initWithObservationsRecipient:", self);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("VNImageAnalyzerMultiDetectorOption_PotentialLandmarkConfiguration"));

  }
  return v6;
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4;
  unint64_t v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  v5 = -[VNClassifyPotentialLandmarkRequest imageCropAndScaleOption](self, "imageCropAndScaleOption");
  if (v5 == objc_msgSend(v4, "imageCropAndScaleOption"))
  {
    v8.receiver = self;
    v8.super_class = (Class)VNClassifyPotentialLandmarkRequest;
    v6 = -[VNImageBasedRequest willAcceptCachedResultsFromRequestWithConfiguration:](&v8, sel_willAcceptCachedResultsFromRequestWithConfiguration_, v4);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;

  v8 = a4;
  if (a3 == 1)
  {
    if (a5)
    {
      +[VNError errorForUnsupportedConfigurationOfRequest:](VNError, "errorForUnsupportedConfigurationOfRequest:", self);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
      *a5 = v9;
    }
  }
  else if (a5)
  {
    +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:", a3, self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }

  return 0;
}

@end
