@implementation NSURL(NUDigest)

- (void)nu_updateDigest:()NUDigest
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(a1, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v6, "addString:", v4);
  }
  else
  {
    objc_msgSend(a1, "description");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addString:", v5);

  }
}

@end
