@implementation VNDetectHumanHeadRectanglesRequest

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  __CFString *v5;
  __CFString *v6;

  if (a3 - 3737841664u < 4 || a3 == 1)
  {
    v5 = CFSTR("VNANFDMultiDetectorType");
    v6 = CFSTR("VNANFDMultiDetectorType");
  }
  else if (a4)
  {
    +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:");
    v5 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (int64_t)dependencyProcessingOrdinality
{
  return VNRequestDependencyProcessingOrdinalityAdjustedForConfiguredRequest(2000, self);
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

+ (const)revisionAvailability
{
  return (const $FA132638BE9F3789EDBDEDD04080CB9E *)&+[VNDetectHumanHeadRectanglesRequest(Revisioning) revisionAvailability]::ourRevisionAvailability;
}

+ (id)privateRevisionsSet
{
  if (+[VNDetectHumanHeadRectanglesRequest(Revisioning) privateRevisionsSet]::onceToken != -1)
    dispatch_once(&+[VNDetectHumanHeadRectanglesRequest(Revisioning) privateRevisionsSet]::onceToken, &__block_literal_global_28);
  return (id)+[VNDetectHumanHeadRectanglesRequest(Revisioning) privateRevisionsSet]::ourPrivateRevisions;
}

+ (id)descriptionForPrivateRevision:(unint64_t)a3
{
  objc_super v4;

  if (a3 - 3737841664u < 4)
    return off_1E4541E50[a3 - 3737841664u];
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___VNDetectHumanHeadRectanglesRequest;
  objc_msgSendSuper2(&v4, sel_descriptionForPrivateRevision_);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __70__VNDetectHumanHeadRectanglesRequest_Revisioning__privateRevisionsSet__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  objc_msgSend(v2, "addIndex:", 3737841664);
  objc_msgSend(v2, "addIndex:", 3737841665);
  if (+[VNANFDMultiDetectorANSTv1 supportsExecution](VNANFDMultiDetectorANSTv1, "supportsExecution"))
    objc_msgSend(v2, "addIndex:", 3737841666);
  objc_msgSend(v2, "addIndex:", 3737841667);
  v0 = objc_msgSend(v2, "copy");
  v1 = (void *)+[VNDetectHumanHeadRectanglesRequest(Revisioning) privateRevisionsSet]::ourPrivateRevisions;
  +[VNDetectHumanHeadRectanglesRequest(Revisioning) privateRevisionsSet]::ourPrivateRevisions = v0;

}

@end
