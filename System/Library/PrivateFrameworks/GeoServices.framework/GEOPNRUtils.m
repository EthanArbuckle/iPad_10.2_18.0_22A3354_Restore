@implementation GEOPNRUtils

+ (id)_stringByStrippingFormattingAndNotVisiblyAllowable:(id)a3
{
  id v3;
  void *v4;
  id v5;
  const void *v6;
  void *v7;

  v3 = a3;
  v4 = v3;
  if (MEMORY[0x1E0D71078])
  {
    v6 = (const void *)_PNCreateStringByStrippingFormattingAndNotVisiblyAllowable();
    CFAutorelease(v6);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v3;
  }
  v7 = v5;

  return v7;
}

@end
