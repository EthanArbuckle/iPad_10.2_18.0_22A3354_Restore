@implementation IMBalloonPlugin(CKAppMenuItem)

- (id)__ck_imageForTraitCollection:()CKAppMenuItem
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKAppMenuDataSource imageForIdentifier:traitCollection:](CKAppMenuDataSource, "imageForIdentifier:traitCollection:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
