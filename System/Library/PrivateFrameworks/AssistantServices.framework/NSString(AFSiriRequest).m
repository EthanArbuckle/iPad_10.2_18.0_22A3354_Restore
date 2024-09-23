@implementation NSString(AFSiriRequest)

- (__CFString)_af_stringByRemovingPrefixWithLength:()AFSiriRequest
{
  __CFString *v5;

  if (objc_msgSend(a1, "length") >= a3)
  {
    objc_msgSend(a1, "substringFromIndex:", a3);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &stru_1E3A37708;
  }
  return v5;
}

- (id)_af_stringByRemovingSuffix:()AFSiriRequest
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(a1, "hasSuffix:", v4))
  {
    objc_msgSend(a1, "substringToIndex:", objc_msgSend(a1, "length") - objc_msgSend(v4, "length"));
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = objc_msgSend(a1, "copy");
  }
  v6 = (void *)v5;

  return v6;
}

@end
