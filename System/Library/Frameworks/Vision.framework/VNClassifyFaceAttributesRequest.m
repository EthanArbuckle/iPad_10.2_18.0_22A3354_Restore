@implementation VNClassifyFaceAttributesRequest

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  __CFString *v5;
  __CFString *v6;

  if (a3 - 3737841664u > 6 || a3 == 3737841668)
  {
    if (a4)
    {
      +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:");
      v5 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = CFSTR("VNFaceAnalyzerMultiDetectorType");
    v6 = CFSTR("VNFaceAnalyzerMultiDetectorType");
  }
  return v5;
}

+ (unint64_t)defaultRevision
{
  return 3737841669;
}

+ (id)privateRevisionsSet
{
  if (+[VNClassifyFaceAttributesRequest privateRevisionsSet]::onceToken != -1)
    dispatch_once(&+[VNClassifyFaceAttributesRequest privateRevisionsSet]::onceToken, &__block_literal_global_16184);
  return (id)+[VNClassifyFaceAttributesRequest privateRevisionsSet]::ourPrivateRevisions;
}

- (int64_t)dependencyProcessingOrdinality
{
  return VNRequestDependencyProcessingOrdinalityAdjustedForConfiguredRequest(5000, self);
}

+ (const)dependentRequestMappingTable
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    +[VNClassifyFaceAttributesRequest dependentRequestMappingTable]::ourDependentRequestMappingTable = 3737841664;
    qword_1EE640448 = objc_opt_class();
    unk_1EE640450 = 3737841667;
    qword_1EE640460 = 0;
    unk_1EE640468 = 0;
    qword_1EE640458 = 0;
  }
  return (const $BB6EA70A2DEABF36E8ECE2B2BD0E2E04 *)&+[VNClassifyFaceAttributesRequest dependentRequestMappingTable]::ourDependentRequestMappingTable;
}

+ (id)publicRevisionsSet
{
  return objc_alloc_init(MEMORY[0x1E0CB36B8]);
}

+ (id)descriptionForPrivateRevision:(unint64_t)a3
{
  __CFString *v3;
  objc_super v5;

  if (a3 - 3737841664u < 7 && ((0x6Fu >> a3) & 1) != 0)
  {
    v3 = off_1E4545D28[a3 - 3737841664u];
  }
  else
  {
    v5.receiver = a1;
    v5.super_class = (Class)&OBJC_METACLASS___VNClassifyFaceAttributesRequest;
    objc_msgSendSuper2(&v5, sel_descriptionForPrivateRevision_);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

void __54__VNClassifyFaceAttributesRequest_privateRevisionsSet__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  void *v9;

  VNRequestPrivateRevisionsSet(0xDECAF005uLL, a2, a3, a4, a5, a6, a7, a8, 3737841667);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)+[VNClassifyFaceAttributesRequest privateRevisionsSet]::ourPrivateRevisions;
  +[VNClassifyFaceAttributesRequest privateRevisionsSet]::ourPrivateRevisions = v8;

}

- (BOOL)resultsAreAssignedWithOriginatingRequestSpecifier
{
  return 0;
}

+ (const)revisionAvailability
{
  return (const $FA132638BE9F3789EDBDEDD04080CB9E *)&+[VNClassifyFaceAttributesRequest(Revisioning) revisionAvailability]::ourRevisionAvailability;
}

@end
