@implementation HKMCMenstruationDisplayTypeIdentifiers

void ___HKMCMenstruationDisplayTypeIdentifiers_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];

  v2[2] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("DisplayTypeIdentifierIntermenstrualBleeding");
  v2[1] = CFSTR("DisplayTypeIdentifierSymptoms");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_HKMCMenstruationDisplayTypeIdentifiers_displayTypeIdentifiers;
  _HKMCMenstruationDisplayTypeIdentifiers_displayTypeIdentifiers = v0;

}

@end
