@implementation _CNReputationGenericHandle

- (void)configureBuilder:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "addCoreRecentsTrust");
  objc_msgSend(v3, "addContactsTrustForEmailAddress");
  objc_msgSend(v3, "addContactsTrustForPhoneNumber");

}

@end
