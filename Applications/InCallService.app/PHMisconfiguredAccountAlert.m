@implementation PHMisconfiguredAccountAlert

- (PHMisconfiguredAccountAlert)initWithDialAction:(id)a3
{
  id v4;
  PHMisconfiguredAccountAlert *v5;
  PHMisconfiguredAccountAlert *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PHMisconfiguredAccountAlert;
  v5 = -[PHMisconfiguredAccountAlert init](&v8, "init");
  v6 = v5;
  if (v5)
    -[PHMisconfiguredAccountAlert setDialAction:](v5, "setDialAction:", v4);

  return v6;
}

- (id)title
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("MISCONFIGURED_ACCOUNT_TITLE"), &stru_10028DC20, CFSTR("InCallService")));

  return v3;
}

- (id)message
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMAccountController sharedInstance](IMAccountController, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMService facetimeService](IMService, "facetimeService"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "accountsForService:", v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));

  v6 = objc_alloc_init((Class)TUFeatureFlags);
  LODWORD(v3) = objc_msgSend(v6, "appleAccountRebrandEnabled");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = v7;
  if ((_DWORD)v3)
    v9 = CFSTR("MISCONFIGURED_ACCOUNT_%@_MESSAGE_APPLEACCOUNT");
  else
    v9 = CFSTR("MISCONFIGURED_ACCOUNT_%@_MESSAGE");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_10028DC20, CFSTR("InCallService")));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
  v12 = IMStripLoginID();
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = TUHomeCountryCode();
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = TUFormattedPhoneNumber(v13, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v17));

  return v18;
}

- (id)alternateButtonTitle
{
  return 0;
}

- (id)otherButtonTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("MISCONFIGURED_ACCOUNT_ADD_EMAIL_ADDRESS"), &stru_10028DC20, CFSTR("InCallService")));

  return v3;
}

- (id)defaultButtonTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("MISCONFIGURED_ACCOUNT_CANCEL"), &stru_10028DC20, CFSTR("InCallService")));

  return v3;
}

- (void)otherResponse
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("https://appleid.apple.com")));
  objc_msgSend(v3, "openURL:withCompletionHandler:", v2, 0);

}

- (id)dialAction
{
  return self->_dialAction;
}

- (void)setDialAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dialAction, 0);
}

@end
