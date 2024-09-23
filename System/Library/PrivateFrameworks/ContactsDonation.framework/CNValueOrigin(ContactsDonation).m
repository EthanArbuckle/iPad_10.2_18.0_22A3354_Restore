@implementation CNValueOrigin(ContactsDonation)

- (uint64_t)initWithDonationOrigin:()ContactsDonation
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  objc_msgSend(v4, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedApplicationNameForBundleIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "donationIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDBADC0]), "initWithLocalizedApplicationName:donationIdentifier:", v7, v8);
  return v9;
}

+ (__CFString)localizedApplicationNameForBundleIdentifier:()ContactsDonation
{
  id v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  __CFString *v7;

  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.contacts.donation.accounts")))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("ACCOUNTS_APP_NAME");
LABEL_7:
    objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_24C236758, CFSTR("ContactsDonation"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.contacts.donation.phonenumber")))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("SETTINGS_APP_NAME");
    goto LABEL_7;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.routined")))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("SIGNIFICANT_LOCATIONS_APP_NAME");
    goto LABEL_7;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.contacts.donationtool")))
    v7 = CFSTR("Test Data");
  else
    v7 = &stru_24C236758;
LABEL_8:

  return v7;
}

@end
