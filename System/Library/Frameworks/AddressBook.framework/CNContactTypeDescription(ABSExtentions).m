@implementation CNContactTypeDescription(ABSExtentions)

- (BOOL)absPropertyID:()ABSExtentions
{
  if (a3)
    *a3 = 15;
  return a3 != 0;
}

- (uint64_t)absPropertyType
{
  return 2;
}

- (uint64_t)ABSValueFromCNValue:()ABSExtentions
{
  id v1;
  void *v2;
  uint64_t v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&off_2545FE4F8;
  v1 = objc_msgSendSuper2(&v5, sel_ABSValueFromCNValue_);
  +[ABSConstantsMapping CNToABPersonKindConstantsMapping](ABSConstantsMapping, "CNToABPersonKindConstantsMapping");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "mappedConstant:", v1);

  return v3;
}

- (id)CNValueFromABSValue:()ABSExtentions
{
  void *v1;
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&off_2545FE4F8;
  objc_msgSendSuper2(&v5, sel_CNValueFromABSValue_);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[ABSConstantsMapping ABToCNPersonKindConstantsMapping](ABSConstantsMapping, "ABToCNPersonKindConstantsMapping");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mappedConstant:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
