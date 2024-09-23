@implementation NSString(EmailCoreAdditions)

- (id)ec_messageIDSubstring
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = a1;
  v2 = objc_msgSend(v1, "rangeOfString:", CFSTR(">"));
  if (v2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = objc_msgSend(v1, "rangeOfString:options:range:", CFSTR("<"), 4, 0, v2);
    if (v3 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v1, "substringWithRange:", v3 + 1, v2 - (v3 + 1));
      v4 = objc_claimAutoreleasedReturnValue();

      v1 = (id)v4;
    }
  }
  return v1;
}

@end
