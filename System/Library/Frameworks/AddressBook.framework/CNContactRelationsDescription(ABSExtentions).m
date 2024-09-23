@implementation CNContactRelationsDescription(ABSExtentions)

- (BOOL)absPropertyID:()ABSExtentions
{
  if (a3)
    *a3 = 23;
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
  objc_msgSend(a1, "multiValueTransformWithLabelMapping:valueTransform:", v2, &__block_literal_global_43);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)ABSMultiValueLabeledValueFromCNLabeledValueTransform
{
  void *v2;
  void *v3;

  +[ABSConstantsMapping CNToABLabelConstantsMapping](ABSConstantsMapping, "CNToABLabelConstantsMapping");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "multiValueTransformWithLabelMapping:valueTransform:", v2, &__block_literal_global_45);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
