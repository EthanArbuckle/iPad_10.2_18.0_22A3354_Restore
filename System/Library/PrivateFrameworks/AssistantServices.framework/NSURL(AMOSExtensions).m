@implementation NSURL(AMOSExtensions)

- (BOOL)isAMOSIdentifier
{
  void *v1;
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "scheme");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("amos")) == 0;
  else
    v3 = 0;

  return v3;
}

- (BOOL)isAMOSCommittedIdentifier
{
  void *v2;
  void *v3;
  uint64_t v4;
  _BOOL8 v5;

  if (!objc_msgSend(a1, "isAMOSIdentifier"))
    return 0;
  objc_msgSend(a1, "query");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1, "query");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "rangeOfString:", CFSTR("committed=yes"));
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
