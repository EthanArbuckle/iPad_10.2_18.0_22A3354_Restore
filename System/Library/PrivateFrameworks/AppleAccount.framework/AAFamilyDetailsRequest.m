@implementation AAFamilyDetailsRequest

- (AAFamilyDetailsRequest)initWithAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  AAFamilyDetailsRequest *v7;

  v4 = a3;
  objc_msgSend(v4, "accountStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "aida_accountForiCloudAccount:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AAFamilyRequest initWithAppleAccount:grandSlamAccount:accountStore:](self, "initWithAppleAccount:grandSlamAccount:accountStore:", v4, v6, v5);

  return v7;
}

- (id)urlString
{
  void *v2;
  void *v3;

  +[AAURLConfiguration urlConfiguration](AAURLConfiguration, "urlConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getFamilyDetailsURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

@end
