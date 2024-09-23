@implementation HKCountrySet(AFibBurden)

+ (id)localAvailabilityForAFibBurden
{
  void *v4;
  void *v6;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6538]), "initWithCountryBitmasks:compatibilityVersion:contentVersion:provenance:", &unk_1E9C2EA80, 1, 9, 3);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKCountrySet+AFibBurden.m"), 55, CFSTR("Local generated country set should never be nil"));

  }
  return v4;
}

@end
