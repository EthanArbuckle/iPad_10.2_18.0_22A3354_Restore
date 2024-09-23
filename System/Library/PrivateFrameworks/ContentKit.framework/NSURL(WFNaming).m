@implementation NSURL(WFNaming)

- (id)wfName
{
  void *v1;
  id v2;
  void *v3;

  objc_msgSend(a1, "absoluteString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v1, "length") <= 0x64)
  {
    v2 = v1;
  }
  else
  {
    objc_msgSend(v1, "substringToIndex:", 100);
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  v3 = v2;

  return v3;
}

@end
