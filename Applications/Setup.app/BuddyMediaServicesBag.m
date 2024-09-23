@implementation BuddyMediaServicesBag

- (BuddyMediaServicesBag)init
{
  id v2;
  void *v3;
  BuddyMediaServicesBag *v4;
  objc_super v6;
  SEL v7;
  id location;

  v7 = a2;
  location = 0;
  v6.receiver = self;
  v6.super_class = (Class)BuddyMediaServicesBag;
  location = -[BuddyMediaServicesBag init](&v6, "init");
  objc_storeStrong(&location, location);
  if (location)
  {
    v2 = objc_msgSend((id)objc_opt_class(location), "createBagForSubProfile");
    v3 = (void *)*((_QWORD *)location + 1);
    *((_QWORD *)location + 1) = v2;

  }
  v4 = (BuddyMediaServicesBag *)location;
  objc_storeStrong(&location, 0);
  return v4;
}

- (id)getAppStoreURL
{
  AMSBag *v2;
  id v3;
  id v5;
  id location[2];
  BuddyMediaServicesBag *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = +[ACAccountStore ams_sharedAccountStore](ACAccountStore, "ams_sharedAccountStore");
  v5 = objc_msgSend(location[0], "ams_activeiTunesAccount");
  v2 = -[BuddyMediaServicesBag underlyingBag](v7, "underlyingBag");
  v3 = -[AMSBag URLForKey:account:](v2, "URLForKey:account:", CFSTR("postOnboardingUrl"), v5);

  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
  return v3;
}

- (id)getAppStoreMessage
{
  AMSBag *v2;
  id v3;

  v2 = -[BuddyMediaServicesBag underlyingBag](self, "underlyingBag", a2, self);
  v3 = -[AMSBag stringForKey:](v2, "stringForKey:", CFSTR("postOnboardingMessage"));

  return v3;
}

- (id)getBundleURL
{
  AMSBag *v2;
  id v3;

  v2 = -[BuddyMediaServicesBag underlyingBag](self, "underlyingBag", a2, self);
  v3 = -[AMSBag URLForKey:](v2, "URLForKey:", CFSTR("dynamic-ui-bundle-gdpr-url"));

  return v3;
}

+ (AMSBagKeySet)bagKeySet
{
  AMSBagKeySet *v2;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = objc_alloc_init((Class)AMSMutableBagKeySet);
  objc_msgSend(location[0], "addBagKey:valueType:", CFSTR("guid-urls/regex"), 0);
  objc_msgSend(location[0], "addBagKey:valueType:", CFSTR("guid-urls/schemes"), 0);
  objc_msgSend(location[0], "addBagKey:valueType:", CFSTR("storefront-header-suffix"), 4);
  objc_msgSend(location[0], "addBagKey:valueType:", CFSTR("trustedDomains"), 0);
  objc_msgSend(location[0], "addBagKey:valueType:", CFSTR("sign-sap-setup-cert"), 5);
  objc_msgSend(location[0], "addBagKey:valueType:", CFSTR("sign-sap-setup"), 5);
  objc_msgSend(location[0], "addBagKey:valueType:", CFSTR("signed-actions"), 6);
  objc_msgSend(location[0], "addBagKey:valueType:", CFSTR("sign-sap-request"), 6);
  objc_msgSend(location[0], "addBagKey:valueType:", CFSTR("sign-sap-response"), 6);
  objc_msgSend(location[0], "addBagKey:valueType:", CFSTR("metrics/metricsUrl"), 5);
  objc_msgSend(location[0], "addBagKey:valueType:", CFSTR("metrics"), 6);
  objc_msgSend(location[0], "addBagKey:valueType:", CFSTR("postOnboardingUrl"), 5);
  objc_msgSend(location[0], "addBagKey:valueType:", CFSTR("postOnboardingMessage"), 4);
  objc_msgSend(location[0], "addBagKey:valueType:", CFSTR("dynamic-ui-bundle-gdpr-url"), 5);
  v2 = (AMSBagKeySet *)location[0];
  objc_storeStrong(location, 0);
  return v2;
}

+ (NSString)bagSubProfile
{
  return (NSString *)CFSTR("setup");
}

+ (NSString)bagSubProfileVersion
{
  return (NSString *)CFSTR("1");
}

+ (id)createBagForSubProfile
{
  id v2;

  v2 = objc_msgSend((id)objc_opt_class(a1), "bagKeySet", a2, a1);
  +[AMSBagKeySet registerBagKeySet:forProfile:profileVersion:](AMSBagKeySet, "registerBagKeySet:forProfile:profileVersion:", v2, CFSTR("setup"), CFSTR("1"));

  return +[AMSBag bagForProfile:profileVersion:](AMSBag, "bagForProfile:profileVersion:", CFSTR("setup"), CFSTR("1"));
}

- (AMSBag)underlyingBag
{
  return self->_underlyingBag;
}

- (void)setUnderlyingBag:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingBag, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingBag, 0);
}

@end
