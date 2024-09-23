@implementation VNScreenGazeDetectorRevision2

+ (BOOL)supportsExecution
{
  void *v2;
  void *v3;
  BOOL v4;

  VNANEArchitectureName();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  VNANEGenerationNumberForArchitectureName((uint64_t)v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (unint64_t)objc_msgSend(v3, "integerValue") > 0xC;

  return v4;
}

+ (BOOL)modelFullyANEResident
{
  void *v2;
  void *v3;
  BOOL v4;

  VNANEArchitectureName();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  VNANEGenerationNumberForArchitectureName((uint64_t)v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue") != 13;

  return v4;
}

@end
