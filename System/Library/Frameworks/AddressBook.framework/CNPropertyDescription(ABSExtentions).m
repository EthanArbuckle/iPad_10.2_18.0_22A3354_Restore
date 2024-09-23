@implementation CNPropertyDescription(ABSExtentions)

- (uint64_t)absPropertyID:()ABSExtentions
{
  return 0;
}

- (uint64_t)absPropertyType
{
  return 0;
}

- (uint64_t)convertABSValue:()ABSExtentions toCNValue:error:
{
  void *v6;
  id v7;

  objc_msgSend(a1, "CNValueFromABSValue:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "assertValueType:", v6);
  v7 = objc_retainAutorelease(v6);
  *a4 = v7;

  return 1;
}

- (uint64_t)ABSValueFromCNValue:()ABSExtentions
{
  return a3;
}

- (id)CNValueFromABSValue:()ABSExtentions
{
  return a3;
}

@end
