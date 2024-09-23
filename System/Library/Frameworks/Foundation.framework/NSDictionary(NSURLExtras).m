@implementation NSDictionary(NSURLExtras)

- (void)_web_intForKey:()NSURLExtras
{
  void *result;

  result = (void *)objc_msgSend(a1, "_web_numberForKey:");
  if (result)
    return (void *)objc_msgSend(result, "intValue");
  return result;
}

- (uint64_t)_web_stringForKey:()NSURLExtras
{
  uint64_t v1;

  v1 = objc_msgSend(a1, "objectForKey:");
  if (_NSIsNSString())
    return v1;
  else
    return 0;
}

- (uint64_t)_web_numberForKey:()NSURLExtras
{
  uint64_t v1;

  v1 = objc_msgSend(a1, "objectForKey:");
  if (_NSIsNSNumber())
    return v1;
  else
    return 0;
}

- (uint64_t)_web_objectForMIMEType:()NSURLExtras
{
  uint64_t result;
  uint64_t v6;

  result = objc_msgSend(a1, "objectForKey:");
  if (!result)
  {
    v6 = objc_msgSend(a3, "rangeOfString:", CFSTR("/"));
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
      return 0;
    else
      return objc_msgSend(a1, "objectForKey:", objc_msgSend(a3, "substringToIndex:", v6 + 1));
  }
  return result;
}

@end
