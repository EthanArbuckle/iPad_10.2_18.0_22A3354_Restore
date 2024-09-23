@implementation CNInstantMessageAddressesDescription(ABSExtentions)

- (BOOL)absPropertyID:()ABSExtentions
{
  if (a3)
    *a3 = 13;
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
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  +[ABSConstantsMapping ABToCNLabelConstantsMapping](ABSConstantsMapping, "ABToCNLabelConstantsMapping");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = CFSTR("username");
  v8[1] = CFSTR("service");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  +[ABSConstantsMapping ABToCNPersonInstantMessageConstantsMapping](ABSConstantsMapping, "ABToCNPersonInstantMessageConstantsMapping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dictionaryBasedMultiValueTransformWithLabelMapping:inputKeys:destinationClass:valueMapping:", v2, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)ABSMultiValueLabeledValueFromCNLabeledValueTransform
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  +[ABSConstantsMapping CNToABLabelConstantsMapping](ABSConstantsMapping, "CNToABLabelConstantsMapping");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x24BDBA468];
  v9[0] = *MEMORY[0x24BDBA470];
  v9[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  +[ABSConstantsMapping CNToABPersonInstantMessageConstantsMapping](ABSConstantsMapping, "CNToABPersonInstantMessageConstantsMapping");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dictionaryBasedMultiValueTransformWithLabelMapping:inputKeys:destinationClass:valueMapping:", v2, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
