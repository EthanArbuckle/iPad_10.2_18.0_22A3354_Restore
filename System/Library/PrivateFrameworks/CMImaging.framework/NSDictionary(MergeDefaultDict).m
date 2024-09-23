@implementation NSDictionary(MergeDefaultDict)

- (CMIDictionaryWithDefaultDict)cmi_dictionaryMergedWithDefaultDict:()MergeDefaultDict
{
  id v4;
  CMIDictionaryWithDefaultDict *v5;
  CMIDictionaryWithDefaultDict *v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = -[CMIDictionaryWithDefaultDict initWithMainDict:defaultDict:]([CMIDictionaryWithDefaultDict alloc], "initWithMainDict:defaultDict:", a1, v4);
  else
    v5 = a1;
  v6 = v5;

  return v6;
}

@end
