@implementation NSURL(FileExtension)

- (BOOL)hasPathExtension:()FileExtension
{
  id v4;
  void *v5;
  _BOOL8 v6;

  v4 = a3;
  objc_msgSend(a1, "pathExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "caseInsensitiveCompare:", v4) == 0;

  return v6;
}

@end
