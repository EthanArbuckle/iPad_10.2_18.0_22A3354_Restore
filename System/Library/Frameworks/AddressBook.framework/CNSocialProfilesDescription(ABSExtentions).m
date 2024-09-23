@implementation CNSocialProfilesDescription(ABSExtentions)

- (BOOL)absPropertyID:()ABSExtentions
{
  if (a3)
    *a3 = 46;
  return a3 != 0;
}

- (uint64_t)absPropertyType
{
  return 261;
}

- (id)CNLabeledValueFromABSMultiValueTranform
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __85__CNSocialProfilesDescription_ABSExtentions__CNLabeledValueFromABSMultiValueTranform__block_invoke;
  v2[3] = &unk_24C2F4BB0;
  v2[4] = a1;
  return (id)MEMORY[0x20BD234E4](v2);
}

- (id)ABSMultiValueLabeledValueFromCNLabeledValueTransform
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v10[4] = *MEMORY[0x24BDAC8D0];
  +[ABSConstantsMapping CNToABLabelConstantsMapping](ABSConstantsMapping, "CNToABLabelConstantsMapping");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x24BDBAC68];
  v10[0] = *MEMORY[0x24BDBAC58];
  v10[1] = v3;
  v4 = *MEMORY[0x24BDBAC20];
  v10[2] = *MEMORY[0x24BDBAC60];
  v10[3] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  +[ABSConstantsMapping CNToABPersonSocialProfileConstantsMapping](ABSConstantsMapping, "CNToABPersonSocialProfileConstantsMapping");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dictionaryBasedMultiValueTransformWithLabelMapping:inputKeys:destinationClass:valueMapping:", v2, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
