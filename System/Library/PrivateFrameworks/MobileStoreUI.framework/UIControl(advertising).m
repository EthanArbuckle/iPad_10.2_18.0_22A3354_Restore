@implementation UIControl(advertising)

- (id)adPrivacyData
{
  return objc_getAssociatedObject(a1, sel_adPrivacyData);
}

- (void)setAdPrivacyData:()advertising
{
  void *v4;
  id value;

  value = a3;
  objc_msgSend(a1, "adPrivacyData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(a1, "removeTarget:action:forControlEvents:", 0, sel_suuiadvertising_adTransparencyButtonTapped_, 64);
  objc_setAssociatedObject(a1, sel_adPrivacyData, value, (void *)3);
  if (value)
    objc_msgSend(a1, "addTarget:action:forControlEvents:", 0, sel_suuiadvertising_adTransparencyButtonTapped_, 64);

}

@end
