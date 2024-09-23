@implementation _CNReputationEmailAddressHandle

- (void)configureBuilder:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "addCoreRecentsTrust");
  objc_msgSend(v3, "addContactsTrustForEmailAddress");

}

@end
