@implementation HKCountrySet(MenstrualCyclesWristTemperatureInput)

+ (id)localAvailabilityForMenstrualCyclesWristTemperatureInput
{
  void *v4;
  void *v6;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3AB0]), "initWithCountryBitmasks:compatibilityVersion:contentVersion:provenance:", &unk_24DB30518, 1, 7, 3);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKCountrySet+MenstrualCyclesWristTemperatureInput.m"), 40, CFSTR("Local generated country set should never be nil"));

  }
  return v4;
}

@end
