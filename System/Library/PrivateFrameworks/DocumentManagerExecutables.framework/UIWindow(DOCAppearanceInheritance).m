@implementation UIWindow(DOCAppearanceInheritance)

- (void)setAppearance:()DOCAppearanceInheritance
{
  id v4;

  objc_setAssociatedObject(a1, &_docAppearanceIdentifier, a3, (void *)3);
  objc_msgSend(a1, "effectiveAppearance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_notifyAppearanceChange:", v4);

}

- (id)effectiveAppearance
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  objc_super v7;

  objc_msgSend(a1, "appearance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&off_2554AB018;
    objc_msgSendSuper2(&v7, sel_effectiveAppearance);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (id)appearance
{
  return objc_getAssociatedObject(a1, &_docAppearanceIdentifier);
}

@end
