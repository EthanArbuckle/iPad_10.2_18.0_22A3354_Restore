@implementation VNRecognizeAnimalsRequest

+ (NSArray)knownAnimalIdentifiersForRevision:(NSUInteger)requestRevision error:(NSError *)error
{
  id v6;
  void *v7;

  v6 = objc_alloc_init((Class)a1);
  if ((objc_msgSend(v6, "setRevision:error:", requestRevision, error) & 1) != 0)
  {
    objc_msgSend(v6, "supportedIdentifiersAndReturnError:", error);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return (NSArray *)v7;
}

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

- (NSArray)supportedIdentifiersAndReturnError:(NSError *)error
{
  objc_class *v5;
  objc_class *v6;
  void *v7;

  v5 = -[VNRequest applicableDetectorClassAndOptions:forRevision:error:](self, "applicableDetectorClassAndOptions:forRevision:error:", 0, -[VNRequest resolvedRevision](self, "resolvedRevision"), error);
  if (v5)
  {
    v6 = v5;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[objc_class knownAnimalIdentifiers](v6, "knownAnimalIdentifiers");
      v5 = (objc_class *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (error)
      {
        -[VNRequest specifier](self, "specifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        +[VNError errorForUnsupportedRequestSpecifier:](VNError, "errorForUnsupportedRequestSpecifier:", v7);
        *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();

      }
      v5 = 0;
    }
  }
  return (NSArray *)v5;
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
  return (const $FA132638BE9F3789EDBDEDD04080CB9E *)&+[VNRecognizeAnimalsRequest(Revisioning) revisionAvailability]::ourRevisionAvailability;
}

+ (id)privateRevisionsSet
{
  if (+[VNRecognizeAnimalsRequest(Revisioning) privateRevisionsSet]::onceToken != -1)
    dispatch_once(&+[VNRecognizeAnimalsRequest(Revisioning) privateRevisionsSet]::onceToken, &__block_literal_global_15819);
  return (id)+[VNRecognizeAnimalsRequest(Revisioning) privateRevisionsSet]::ourPrivateRevisions;
}

+ (id)descriptionForPrivateRevision:(unint64_t)a3
{
  objc_super v4;

  if (a3 - 3737841664u < 3)
    return *((id *)&off_1E4545C80 + a3 - 3737841664u);
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___VNRecognizeAnimalsRequest;
  objc_msgSendSuper2(&v4, sel_descriptionForPrivateRevision_);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __61__VNRecognizeAnimalsRequest_Revisioning__privateRevisionsSet__block_invoke()
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
  v1 = (void *)+[VNRecognizeAnimalsRequest(Revisioning) privateRevisionsSet]::ourPrivateRevisions;
  +[VNRecognizeAnimalsRequest(Revisioning) privateRevisionsSet]::ourPrivateRevisions = v0;

}

@end
