@implementation CNContactNameSorting

+ (BOOL)shouldSortByGivenName
{
  void *v2;
  BOOL v3;

  +[CNContactsUserDefaults sharedDefaults](CNContactsUserDefaults, "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "displayNameOrder") == 1;

  return v3;
}

@end
