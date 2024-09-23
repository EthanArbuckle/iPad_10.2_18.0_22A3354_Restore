@implementation CNContact(ContactsUICore)

- (CNUIBackgroundColors)backgroundColors
{
  CNUIBackgroundColors *v2;
  void *v3;
  CNUIBackgroundColors *v4;

  v2 = [CNUIBackgroundColors alloc];
  objc_msgSend(a1, "imageBackgroundColorsData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CNUIBackgroundColors initWithData:](v2, "initWithData:", v3);

  return v4;
}

@end
