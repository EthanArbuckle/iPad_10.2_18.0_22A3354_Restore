@implementation VNRecognizeAnimalFacesRequest

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  __CFString *v4;
  __CFString *v5;

  if (a3 == 1)
  {
    v4 = CFSTR("VNANFDMultiDetectorType");
    v5 = CFSTR("VNANFDMultiDetectorType");
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

- (id)supportedIdentifiersAndReturnError:(id *)a3
{
  objc_class *v5;
  objc_class *v6;
  void *v7;

  v5 = -[VNRequest applicableDetectorClassAndOptions:forRevision:error:](self, "applicableDetectorClassAndOptions:forRevision:error:", 0, -[VNRequest resolvedRevision](self, "resolvedRevision"), a3);
  if (v5)
  {
    v6 = v5;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[objc_class knownAnimalFaceIdentifiers](v6, "knownAnimalFaceIdentifiers");
      v5 = (objc_class *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a3)
      {
        -[VNRequest specifier](self, "specifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        +[VNError errorForUnsupportedRequestSpecifier:](VNError, "errorForUnsupportedRequestSpecifier:", v7);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

      }
      v5 = 0;
    }
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
  return (const $FA132638BE9F3789EDBDEDD04080CB9E *)&+[VNRecognizeAnimalFacesRequest(Revisioning) revisionAvailability]::ourRevisionAvailability;
}

@end
