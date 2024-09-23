@implementation VNDetectHumanRectanglesRequest

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  __CFString *v4;
  __CFString *v5;

  if (a3 - 3737841664u >= 3 && a3 - 1 > 1)
  {
    if (a4)
    {
      +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:");
      v4 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }
  }
  else
  {
    v4 = CFSTR("VNANFDMultiDetectorType");
    v5 = CFSTR("VNANFDMultiDetectorType");
  }
  return v4;
}

- (int64_t)dependencyProcessingOrdinality
{
  return VNRequestDependencyProcessingOrdinalityAdjustedForConfiguredRequest(2000, self);
}

- (BOOL)upperBodyOnly
{
  void *v2;
  char v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "upperBodyOnly");

  return v3;
}

- (void)setUpperBodyOnly:(BOOL)upperBodyOnly
{
  _BOOL8 v3;
  id v5;

  v3 = upperBodyOnly;
  if (+[VNDetectHumanRectanglesRequest revisionSupportsFullBodyDetection:](VNDetectHumanRectanglesRequest, "revisionSupportsFullBodyDetection:", -[VNRequest resolvedRevision](self, "resolvedRevision")))
  {
    -[VNRequest configuration](self, "configuration");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setUpperBodyOnly:", v3);

  }
}

- (void)applyConfigurationOfRequest:(id)a3
{
  VNDetectHumanRectanglesRequest *v4;
  objc_super v5;

  v4 = (VNDetectHumanRectanglesRequest *)a3;
  if (self != v4)
  {
    v5.receiver = self;
    v5.super_class = (Class)VNDetectHumanRectanglesRequest;
    -[VNImageBasedRequest applyConfigurationOfRequest:](&v5, sel_applyConfigurationOfRequest_, v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[VNDetectHumanRectanglesRequest setUpperBodyOnly:](self, "setUpperBodyOnly:", -[VNDetectHumanRectanglesRequest upperBodyOnly](v4, "upperBodyOnly"));
  }

}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4;
  int v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  v5 = -[VNDetectHumanRectanglesRequest upperBodyOnly](self, "upperBodyOnly");
  if (v5 == objc_msgSend(v4, "upperBodyOnly"))
  {
    v8.receiver = self;
    v8.super_class = (Class)VNDetectHumanRectanglesRequest;
    v6 = -[VNImageBasedRequest willAcceptCachedResultsFromRequestWithConfiguration:](&v8, sel_willAcceptCachedResultsFromRequestWithConfiguration_, v4);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)resolvedRevisionDidChangeFromRevision:(unint64_t)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VNDetectHumanRectanglesRequest;
  -[VNRequest resolvedRevisionDidChangeFromRevision:](&v5, sel_resolvedRevisionDidChangeFromRevision_, a3);
  if (-[VNRequest revision](self, "revision") <= 1)
  {
    -[VNRequest configuration](self, "configuration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setUpperBodyOnly:", 1);

  }
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v8.receiver = self;
  v8.super_class = (Class)VNDetectHumanRectanglesRequest;
  -[VNImageBasedRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VNDetectHumanRectanglesRequest upperBodyOnly](self, "upperBodyOnly"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ upperBodyOnly=%@"), v4, v5);

  return v6;
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  objc_class *v7;
  id v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;

  if (a5)
  {
    v7 = -[VNRequest applicableDetectorClassAndOptions:forRevision:error:](self, "applicableDetectorClassAndOptions:forRevision:error:", 0, a3, 0);
    v8 = objc_alloc(MEMORY[0x1E0CB3940]);
    v9 = (objc_class *)objc_opt_class();
    VNRequestRevisionString(v9, a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("%@ is handled by %@"), v10, v11);

    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v12);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

+ (BOOL)revisionSupportsFullBodyDetection:(unint64_t)a3
{
  return a3 != 1 && a3 != 3737841664;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)revision:(unint64_t)a3 mayAcceptResultsProducedByRevision:(unint64_t)a4
{
  objc_super v8;

  if ((objc_msgSend(a1, "supportsAnyRevision:", a4) & 1) != 0)
    return 1;
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___VNDetectHumanRectanglesRequest;
  return objc_msgSendSuper2(&v8, sel_revision_mayAcceptResultsProducedByRevision_, a3, a4);
}

+ (const)revisionAvailability
{
  return (const $FA132638BE9F3789EDBDEDD04080CB9E *)&+[VNDetectHumanRectanglesRequest(Revisioning) revisionAvailability]::ourRevisionAvailability;
}

+ (id)privateRevisionsSet
{
  if (+[VNDetectHumanRectanglesRequest(Revisioning) privateRevisionsSet]::onceToken != -1)
    dispatch_once(&+[VNDetectHumanRectanglesRequest(Revisioning) privateRevisionsSet]::onceToken, &__block_literal_global_17144);
  return (id)+[VNDetectHumanRectanglesRequest(Revisioning) privateRevisionsSet]::ourPrivateRevisions;
}

+ (id)descriptionForPrivateRevision:(unint64_t)a3
{
  objc_super v4;

  if (a3 - 3737841664u < 3)
    return off_1E4545ED0[a3 - 3737841664u];
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___VNDetectHumanRectanglesRequest;
  objc_msgSendSuper2(&v4, sel_descriptionForPrivateRevision_);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __66__VNDetectHumanRectanglesRequest_Revisioning__privateRevisionsSet__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  objc_msgSend(v2, "addIndex:", 3737841664);
  if (+[VNANFDMultiDetectorANSTv1 supportsExecution](VNANFDMultiDetectorANSTv1, "supportsExecution"))
    objc_msgSend(v2, "addIndex:", 3737841665);
  objc_msgSend(v2, "addIndex:", 3737841666);
  v0 = objc_msgSend(v2, "copy");
  v1 = (void *)+[VNDetectHumanRectanglesRequest(Revisioning) privateRevisionsSet]::ourPrivateRevisions;
  +[VNDetectHumanRectanglesRequest(Revisioning) privateRevisionsSet]::ourPrivateRevisions = v0;

}

@end
