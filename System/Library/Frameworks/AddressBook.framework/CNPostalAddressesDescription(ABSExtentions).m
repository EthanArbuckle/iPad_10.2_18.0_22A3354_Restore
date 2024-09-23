@implementation CNPostalAddressesDescription(ABSExtentions)

- (BOOL)absPropertyID:()ABSExtentions
{
  if (a3)
    *a3 = 5;
  return a3 != 0;
}

- (uint64_t)absPropertyType
{
  return 261;
}

- (id)CNLabeledValueFromABSMultiValueTranform
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[7];

  v8[6] = *MEMORY[0x24BDAC8D0];
  +[ABSConstantsMapping ABToCNLabelConstantsMapping](ABSConstantsMapping, "ABToCNLabelConstantsMapping");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = CFSTR("Street");
  v8[1] = CFSTR("City");
  v8[2] = CFSTR("State");
  v8[3] = CFSTR("ZIP");
  v8[4] = CFSTR("Country");
  v8[5] = CFSTR("CountryCode");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  +[ABSConstantsMapping ABToCNPersonAddressConstantsMapping](ABSConstantsMapping, "ABToCNPersonAddressConstantsMapping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dictionaryBasedMultiValueTransformWithLabelMapping:inputKeys:destinationClass:valueMapping:", v2, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)ABSMultiValueLabeledValueFromCNLabeledValueTransform
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[7];

  v11[6] = *MEMORY[0x24BDAC8D0];
  +[ABSConstantsMapping CNToABLabelConstantsMapping](ABSConstantsMapping, "CNToABLabelConstantsMapping");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x24BDBABC0];
  v11[0] = *MEMORY[0x24BDBABF8];
  v11[1] = v3;
  v4 = *MEMORY[0x24BDBABE0];
  v11[2] = *MEMORY[0x24BDBABF0];
  v11[3] = v4;
  v5 = *MEMORY[0x24BDBABD0];
  v11[4] = *MEMORY[0x24BDBABC8];
  v11[5] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  +[ABSConstantsMapping CNToABPersonAddressConstantsMapping](ABSConstantsMapping, "CNToABPersonAddressConstantsMapping");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dictionaryBasedMultiValueTransformWithLabelMapping:inputKeys:destinationClass:valueMapping:", v2, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
