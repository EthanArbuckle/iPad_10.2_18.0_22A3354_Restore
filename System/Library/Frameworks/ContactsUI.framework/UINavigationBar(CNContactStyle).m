@implementation UINavigationBar(CNContactStyle)

- (void)_cnui_applyContactStyle
{
  id v2;

  objc_msgSend(a1, "_cnui_contactStyle");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "barStyle"))
    objc_msgSend(a1, "setBarStyle:", objc_msgSend(v2, "barStyle"));
  if (objc_msgSend(v2, "usesTranslucentBarStyle"))
    objc_msgSend(a1, "setTranslucent:", objc_msgSend(v2, "usesTranslucentBarStyle"));

}

@end
