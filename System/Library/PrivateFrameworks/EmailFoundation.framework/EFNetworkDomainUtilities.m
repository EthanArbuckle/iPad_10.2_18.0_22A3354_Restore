@implementation EFNetworkDomainUtilities

+ (BOOL)domain:(id)a3 isSubdomainOfDomain:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  BOOL v8;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length") && objc_msgSend(v6, "length"))
  {
    v7 = objc_msgSend(v5, "rangeOfString:options:", v6, 13);
    if (!v7)
    {
      v8 = 1;
      goto LABEL_6;
    }
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v8 = objc_msgSend(v5, "characterAtIndex:", v7 - 1) == 46;
      goto LABEL_6;
    }
  }
  v8 = 0;
LABEL_6:

  return v8;
}

@end
