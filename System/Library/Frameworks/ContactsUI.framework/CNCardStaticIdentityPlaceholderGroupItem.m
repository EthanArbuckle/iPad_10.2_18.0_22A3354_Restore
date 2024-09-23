@implementation CNCardStaticIdentityPlaceholderGroupItem

- (NSString)title
{
  void *v2;
  void *v3;

  CNContactsUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("CARD_ACTION_ADD_STATIC_IDENTITY"), &stru_1E20507A8, CFSTR("Localized-NARWHAL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

@end
