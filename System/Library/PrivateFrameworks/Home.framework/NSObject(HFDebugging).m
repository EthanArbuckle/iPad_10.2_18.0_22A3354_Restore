@implementation NSObject(HFDebugging)

- (uint64_t)hf_prettyDescription
{
  return objc_msgSend(a1, "hf_prettyDescriptionWithDetailLevel:", 0);
}

- (id)hf_prettyDescriptionWithDetailLevel:()HFDebugging
{
  void *v5;
  void *v6;
  void *v7;

  if (+[HFUtilities hasInternalDiagnostics](HFUtilities, "hasInternalDiagnostics")
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    +[HFStateDumpBuilderContext contextWithDetailLevel:](HFStateDumpBuilderContext, "contextWithDetailLevel:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "hf_stateDumpBuilderWithContext:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "buildDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (uint64_t)hf_prettyExpensiveDescription
{
  return objc_msgSend(a1, "hf_prettyDescriptionWithDetailLevel:", 1);
}

- (uint64_t)hf_prettyFullDescription
{
  return objc_msgSend(a1, "hf_prettyDescriptionWithDetailLevel:", 2);
}

@end
