@implementation HKCountrySet(IrregularRhythmNotificationsV2)

+ (id)localAvailabilityForIrregularRhythmNotificationsV2
{
  void *v4;
  void *v6;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6538]), "initWithCountryBitmasks:compatibilityVersion:contentVersion:provenance:", &unk_1E8800210, 1, 14, 3);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKCountrySet+IrregularRhythmNotificationsV2.m"), 55, CFSTR("Local generated country set should never be nil"));

  }
  return v4;
}

@end
