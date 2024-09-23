@implementation UIViewController(EKUIFutureTraitEnvironment)

- (id)ekui_futureTraitCollection
{
  void *v2;
  void *v3;
  void *v4;

  objc_getAssociatedObject(a1, (const void *)objc_msgSend(a1, "ekui_futureTraitCollectionCategoryPropertyKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(a1, "parentViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3
      || (objc_msgSend(a1, "parentViewController"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v4, "ekui_futureTraitCollection"),
          v2 = (void *)objc_claimAutoreleasedReturnValue(),
          v4,
          !v2))
    {
      objc_msgSend(a1, "traitCollection");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v2;
}

- (void)ekui_futureTraitCollectionCategoryPropertyKey
{
  return &ekui_futureTraitCollectionCategoryPropertyKey;
}

- (void)setEkui_futureTraitCollection:()EKUIFutureTraitEnvironment
{
  void *v4;
  char v5;
  id value;

  value = a3;
  objc_msgSend(a1, "ekui_futureTraitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", value);

  if ((v5 & 1) == 0)
    objc_setAssociatedObject(a1, (const void *)objc_msgSend(a1, "ekui_futureTraitCollectionCategoryPropertyKey"), value, (void *)0x303);

}

@end
