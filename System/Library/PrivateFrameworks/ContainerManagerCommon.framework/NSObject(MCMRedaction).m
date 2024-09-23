@implementation NSObject(MCMRedaction)

- (__CFString)redactedDescription
{
  void *v1;
  __CFString *v2;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v1, "redactedDescription");
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = CFSTR("<~~~>");
  }

  return v2;
}

@end
