@implementation HFHeaterCoolerItemUtilities

+ (id)targetHeatingCoolingModeValueInResponse:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "responseForCharacteristicType:", *MEMORY[0x1E0CB8AB8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueWithExpectedClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
