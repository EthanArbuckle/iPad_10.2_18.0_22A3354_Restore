@implementation WFHealthKitLocalizedSampleTypes

void __WFHealthKitLocalizedSampleTypes_block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  WFHealthKitSampleTypeIdentifiers();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  WFHealthKitSampleTypeIdentifierToReadableSampleTypeDictionary();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __WFHealthKitLocalizedSampleTypes_block_invoke_2;
  v6[3] = &unk_24F8B2860;
  v7 = v1;
  v2 = v1;
  objc_msgSend(v0, "if_compactMap:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingComparator:", &__block_literal_global_673);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)WFHealthKitLocalizedSampleTypes_localizedTypes;
  WFHealthKitLocalizedSampleTypes_localizedTypes = v4;

}

id __WFHealthKitLocalizedSampleTypes_block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a2;
  v4 = objc_alloc(MEMORY[0x24BEC1438]);
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithString:", v5);

  objc_msgSend(MEMORY[0x24BDD3E80], "quantityTypeForIdentifier:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v7, "hk_localizedName");
    else
      +[WFHealthKitHelper readableSampleTypeIdentifierFromSampleTypeIdentifier:](WFHealthKitHelper, "readableSampleTypeIdentifierFromSampleTypeIdentifier:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLocalizedValue:", v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v8, "hk_localizedName");
    else
      +[WFHealthKitHelper readableSampleTypeIdentifierFromSampleTypeIdentifier:](WFHealthKitHelper, "readableSampleTypeIdentifierFromSampleTypeIdentifier:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLocalizedValue:", v9);

  }
  return v6;
}

uint64_t __WFHealthKitLocalizedSampleTypes_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "localizedValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedStandardCompare:", v6);
  return v7;
}

@end
