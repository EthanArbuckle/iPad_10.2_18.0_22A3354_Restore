@implementation LSBundleRecord(DOCExtensions)

- (id)containingApplicationRecord
{
  id v1;
  void *v2;
  id v3;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v1, "containingBundleRecord");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = v2;
    else
      v3 = 0;

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

+ (id)doc_applicationExtensionRecordAtURL:()DOCExtensions
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x24BDC1528];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithURL:error:", v4, 0);

  return v5;
}

@end
