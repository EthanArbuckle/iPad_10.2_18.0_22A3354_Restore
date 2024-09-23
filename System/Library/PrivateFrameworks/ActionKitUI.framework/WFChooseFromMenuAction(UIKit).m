@implementation WFChooseFromMenuAction(UIKit)

- (id)attributedLocalizedName
{
  void *v2;
  void *v3;
  objc_super v5;

  if (objc_msgSend(a1, "mode") == 1)
  {
    objc_msgSend(a1, "itemTitle");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "attributedString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    return v3;
  }
  else
  {
    v5.receiver = a1;
    v5.super_class = (Class)&off_2554AFD20;
    objc_msgSendSuper2(&v5, sel_attributedLocalizedName);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

@end
