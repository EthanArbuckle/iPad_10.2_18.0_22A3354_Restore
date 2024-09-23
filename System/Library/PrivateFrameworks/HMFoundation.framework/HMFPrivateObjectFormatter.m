@implementation HMFPrivateObjectFormatter

+ (id)defaultFormatter
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (id)privateStringForObjectValue:(id)a3
{
  id v3;
  uint64_t v4;
  __CFString *v5;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "privateDescription");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v5 = CFSTR("<redacted>");
      goto LABEL_7;
    }
    objc_msgSend(v3, "redactedDescription");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (__CFString *)v4;
LABEL_7:

  return v5;
}

- (id)stringForObjectValue:(id)a3
{
  return (id)objc_msgSend(a3, "description");
}

@end
