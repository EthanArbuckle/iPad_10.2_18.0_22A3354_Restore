@implementation CNContactListSearchBar

- (void)buildMenuWithBuilder:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNContactListSearchBar;
  v3 = a3;
  -[CNContactListSearchBar buildMenuWithBuilder:](&v4, sel_buildMenuWithBuilder_, v3);
  objc_msgSend(v3, "removeMenuForIdentifier:", CFSTR("com.apple.menu.insert-from-external-sources"), v4.receiver, v4.super_class);

}

@end
