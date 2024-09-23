@implementation WFHealthKitReadableSampleTypes

void __WFHealthKitReadableSampleTypes_block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  WFHealthKitSampleTypeIdentifiers();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  WFHealthKitSampleTypeIdentifierToReadableSampleTypeDictionary();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __WFHealthKitReadableSampleTypes_block_invoke_2;
  v5[3] = &unk_24F8B2B88;
  v6 = v1;
  v2 = v1;
  objc_msgSend(v0, "if_compactMap:", v5);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)WFHealthKitReadableSampleTypes_readableTypes;
  WFHealthKitReadableSampleTypes_readableTypes = v3;

}

uint64_t __WFHealthKitReadableSampleTypes_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
}

@end
