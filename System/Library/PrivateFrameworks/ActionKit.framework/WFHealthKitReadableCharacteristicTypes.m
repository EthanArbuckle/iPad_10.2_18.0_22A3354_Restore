@implementation WFHealthKitReadableCharacteristicTypes

void __WFHealthKitReadableCharacteristicTypes_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];

  v5[3] = *MEMORY[0x24BDAC8D0];
  WFLocalizedContentPropertyNameMarker(CFSTR("Biological Sex"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v0;
  WFLocalizedContentPropertyNameMarker(CFSTR("Blood Type"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = v1;
  WFLocalizedContentPropertyNameMarker(CFSTR("Date of Birth"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)WFHealthKitReadableCharacteristicTypes_readableTypes;
  WFHealthKitReadableCharacteristicTypes_readableTypes = v3;

}

@end
