@implementation GEOAmenityItem(RibbonExtras)

- (__CFString)resolvedRibbonSymbolName
{
  __CFString *v2;

  if (objc_msgSend(a1, "isApplePayAmenity"))
  {
    v2 = CFSTR("applePay");
  }
  else
  {
    objc_msgSend(a1, "symbolImageName");
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

@end
