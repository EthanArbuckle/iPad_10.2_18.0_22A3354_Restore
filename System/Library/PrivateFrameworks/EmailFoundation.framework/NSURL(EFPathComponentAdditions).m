@implementation NSURL(EFPathComponentAdditions)

- (EFPathComponent)ef_lastPathComponent
{
  EFPathComponent *v2;
  void *v3;
  EFPathComponent *v4;

  v2 = [EFPathComponent alloc];
  objc_msgSend(a1, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[EFPathComponent initWithString:](v2, "initWithString:", v3);

  return v4;
}

- (id)ef_URLByAppendingPathComponent:()EFPathComponentAdditions
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "sanitizedString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "URLByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)ef_URLByAppendingPathComponent:()EFPathComponentAdditions isDirectory:
{
  void *v6;
  void *v7;

  objc_msgSend(a3, "sanitizedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "URLByAppendingPathComponent:isDirectory:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
