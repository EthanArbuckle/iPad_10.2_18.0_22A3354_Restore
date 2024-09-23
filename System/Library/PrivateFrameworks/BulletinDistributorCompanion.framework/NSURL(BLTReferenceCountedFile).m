@implementation NSURL(BLTReferenceCountedFile)

- (id)blt_metadataURL
{
  void *v2;
  void *v3;
  int v4;
  id v5;
  void *v6;

  objc_msgSend(a1, "pathExtension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "blt_metadataExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  if (v4)
  {
    v5 = a1;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "blt_metadataExtension");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "URLByAppendingPathExtension:", v6);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

+ (const)blt_metadataExtension
{
  return CFSTR("metadata");
}

@end
