@implementation VNCreateFaceprintRequest

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  __CFString *v4;

  v4 = CFSTR("VNFaceAnalyzerMultiDetectorType");
  return CFSTR("VNFaceAnalyzerMultiDetectorType");
}

+ (unint64_t)defaultRevision
{
  return 3737841669;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)privateRevisionsSet
{
  if (+[VNCreateFaceprintRequest privateRevisionsSet]::onceToken != -1)
    dispatch_once(&+[VNCreateFaceprintRequest privateRevisionsSet]::onceToken, &__block_literal_global_30588);
  return (id)+[VNCreateFaceprintRequest privateRevisionsSet]::ourPrivateRevisions;
}

- (int64_t)dependencyProcessingOrdinality
{
  return VNRequestDependencyProcessingOrdinalityAdjustedForConfiguredRequest(5000, self);
}

- (BOOL)resultsAreAssignedWithOriginatingRequestSpecifier
{
  return 0;
}

- (BOOL)forceFaceprintCreation
{
  void *v2;
  char v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "forceFaceprintCreation");

  return v3;
}

+ (id)publicRevisionsSet
{
  return objc_alloc_init(MEMORY[0x1E0CB36B8]);
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4;
  int v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  v5 = -[VNCreateFaceprintRequest forceFaceprintCreation](self, "forceFaceprintCreation");
  if (v5 == objc_msgSend(v4, "forceFaceprintCreation"))
  {
    v8.receiver = self;
    v8.super_class = (Class)VNCreateFaceprintRequest;
    v6 = -[VNImageBasedRequest willAcceptCachedResultsFromRequestWithConfiguration:](&v8, sel_willAcceptCachedResultsFromRequestWithConfiguration_, v4);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)createVNEntityIdentificationModelEntryPrintForRevision:(unint64_t)a3 fromDescriptorData:(const void *)a4 length:(unint64_t)a5 elementCount:(unint64_t)a6 error:(id *)a7
{
  VNFaceprint *v11;
  double v12;

  v11 = [VNFaceprint alloc];
  LODWORD(v12) = 1.0;
  return -[VNFaceprint initWithData:elementCount:elementType:lengthInBytes:confidence:requestRevision:](v11, "initWithData:elementCount:elementType:lengthInBytes:confidence:requestRevision:", a4, a6, 1, a5, a3, v12);
}

- (BOOL)warmUpSession:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t (**v7)(void *, uint64_t, id *);
  unint64_t v8;
  char v9;
  BOOL v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t, uint64_t);
  void *v15;
  VNCreateFaceprintRequest *v16;
  id v17;
  objc_super v18;

  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)VNCreateFaceprintRequest;
  if (-[VNRequest warmUpSession:error:](&v18, sel_warmUpSession_error_, v6, a4))
  {
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __48__VNCreateFaceprintRequest_warmUpSession_error___block_invoke;
    v15 = &unk_1E4548710;
    v16 = self;
    v17 = v6;
    v7 = (uint64_t (**)(void *, uint64_t, id *))_Block_copy(&v12);
    v8 = -[VNRequest resolvedRevision](self, "resolvedRevision", v12, v13, v14, v15, v16);
    switch(v8)
    {
      case 0xDECAF001uLL:
        v9 = v7[2](v7, 4, a4);
        goto LABEL_11;
      case 0xDECAF002uLL:
        v9 = v7[2](v7, 100, a4);
        goto LABEL_11;
      case 0xDECAF003uLL:
        v9 = v7[2](v7, 6, a4);
        goto LABEL_11;
      case 0xDECAF004uLL:
      case 0xDECAF005uLL:
        v9 = v7[2](v7, 7, a4);
        goto LABEL_11;
      case 0xDECAF006uLL:
        v9 = v7[2](v7, 101, a4);
LABEL_11:
        if ((v9 & 1) == 0)
          goto LABEL_13;
        v10 = 1;
        break;
      default:
        if (a4)
        {
          +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:", v8, self);
          v10 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
LABEL_13:
          v10 = 0;
        }
        break;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)setForceFaceprintCreation:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VNRequest configuration](self, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setForceFaceprintCreation:", v3);

}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  if (a5)
  {
    +[VNError errorForUnsupportedRevision:ofRequestClass:](VNError, "errorForUnsupportedRevision:ofRequestClass:", 1, objc_opt_class());
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

uint64_t __48__VNCreateFaceprintRequest_warmUpSession_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  VNFaceAnalyzerCompoundRequest *v6;
  void *v7;
  VNFaceAnalyzerCompoundRequest *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = [VNFaceAnalyzerCompoundRequest alloc];
  v14[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[VNCompoundRequest initWithOriginalRequests:](v6, "initWithOriginalRequests:", v7);

  v9 = -[VNRequest newDefaultDetectorOptionsForRequestRevision:session:](v8, "newDefaultDetectorOptionsForRequestRevision:session:", a2, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "detectorOfType:configuredWithOptions:error:", CFSTR("VNFaceAnalyzerMultiDetectorType"), v9, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
    v12 = objc_msgSend(v10, "warmUpSession:withOptions:error:", *(_QWORD *)(a1 + 40), v9, a3);
  else
    v12 = 0;

  return v12;
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
  v7.super_class = (Class)&OBJC_METACLASS___VNCreateFaceprintRequest;
  return objc_msgSendSuper2(&v7, sel_revision_mayAcceptResultsProducedByRevision_, a3, a3);
}

+ (id)descriptionForPrivateRevision:(unint64_t)a3
{
  objc_super v4;

  if (a3 - 3737841665u < 6)
    return off_1E4548750[a3 - 3737841665u];
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___VNCreateFaceprintRequest;
  objc_msgSendSuper2(&v4, sel_descriptionForPrivateRevision_);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __47__VNCreateFaceprintRequest_privateRevisionsSet__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  void *v9;

  VNRequestPrivateRevisionsSet(0xDECAF005uLL, a2, a3, a4, a5, a6, a7, a8, 3737841668);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)+[VNCreateFaceprintRequest privateRevisionsSet]::ourPrivateRevisions;
  +[VNCreateFaceprintRequest privateRevisionsSet]::ourPrivateRevisions = v8;

}

+ (const)revisionAvailability
{
  return (const $FA132638BE9F3789EDBDEDD04080CB9E *)&+[VNCreateFaceprintRequest(Revisioning) revisionAvailability]::ourRevisionAvailability;
}

@end
