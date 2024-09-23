@implementation CNPhoneNumbersDescription(ABSExtentions)

- (BOOL)absPropertyID:()ABSExtentions
{
  if (a3)
    *a3 = 3;
  return a3 != 0;
}

- (uint64_t)absPropertyType
{
  return 257;
}

- (id)CNLabeledValueFromABSMultiValueTranform
{
  void *v2;
  void *v3;

  +[ABSConstantsMapping ABToCNLabelConstantsMapping](ABSConstantsMapping, "ABToCNLabelConstantsMapping");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "multiValueTransformWithLabelMapping:valueTransform:", v2, &__block_literal_global_7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)ABSMultiValueLabeledValueFromCNLabeledValueTransform
{
  void *v2;
  void *v3;

  +[ABSConstantsMapping CNToABLabelConstantsMapping](ABSConstantsMapping, "CNToABLabelConstantsMapping");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "multiValueTransformWithLabelMapping:valueTransform:", v2, &__block_literal_global_42);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)isABSLabeledValueValue:()ABSExtentions equalToValue:
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = (void *)MEMORY[0x24BDBAD88];
  v6 = a4;
  objc_msgSend(v5, "phoneNumberWithStringValue:", a3);
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBAD88], "phoneNumberWithStringValue:", v6);
  v8 = objc_claimAutoreleasedReturnValue();

  if (v7 | v8)
    v9 = objc_msgSend((id)v8, "isLikePhoneNumber:", v7);
  else
    v9 = 1;

  return v9;
}

@end
