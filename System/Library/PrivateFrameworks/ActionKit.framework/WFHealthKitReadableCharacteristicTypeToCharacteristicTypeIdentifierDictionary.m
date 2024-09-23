@implementation WFHealthKitReadableCharacteristicTypeToCharacteristicTypeIdentifierDictionary

void __WFHealthKitReadableCharacteristicTypeToCharacteristicTypeIdentifierDictionary_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  _QWORD v7[5];

  v7[4] = *MEMORY[0x24BDAC8D0];
  WFLocalizedContentPropertyNameMarker(CFSTR("Biological Sex"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v0;
  v7[0] = *MEMORY[0x24BDD2A78];
  WFLocalizedContentPropertyNameMarker(CFSTR("Blood Type"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v1;
  v7[1] = *MEMORY[0x24BDD2A80];
  WFLocalizedContentPropertyNameMarker(CFSTR("Date of Birth"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2] = v2;
  v7[2] = *MEMORY[0x24BDD2A88];
  WFLocalizedContentPropertyNameMarker(CFSTR("Wheelchair Use"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[3] = v3;
  v7[3] = *MEMORY[0x24BDD2A98];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)WFHealthKitReadableCharacteristicTypeToCharacteristicTypeIdentifierDictionary_dictionary;
  WFHealthKitReadableCharacteristicTypeToCharacteristicTypeIdentifierDictionary_dictionary = v4;

}

@end
