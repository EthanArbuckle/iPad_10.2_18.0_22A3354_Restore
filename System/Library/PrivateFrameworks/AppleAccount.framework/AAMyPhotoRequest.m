@implementation AAMyPhotoRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (AAMyPhotoRequest)initWithAccount:(id)a3
{
  id v5;
  AAMyPhotoRequest *v6;
  AAMyPhotoRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AAMyPhotoRequest;
  v6 = -[AAMyPhotoRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_account, a3);

  return v7;
}

- (id)urlString
{
  void *v2;
  void *v3;

  +[AAURLConfiguration urlConfiguration](AAURLConfiguration, "urlConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getMyPhotoURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)urlRequest
{
  void *v3;
  void *v4;
  NSString *serverCacheTag;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AAMyPhotoRequest;
  -[AARequest urlRequest](&v7, sel_urlRequest);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setHTTPMethod:", CFSTR("GET"));
  objc_msgSend(v4, "aa_addBasicAuthorizationHeaderWithAccount:preferUsingPassword:", self->_account, 0);
  serverCacheTag = self->_serverCacheTag;
  if (serverCacheTag)
    objc_msgSend(v4, "setValue:forHTTPHeaderField:", serverCacheTag, CFSTR("ETag"));
  return v4;
}

- (NSString)serverCacheTag
{
  return self->_serverCacheTag;
}

- (void)setServerCacheTag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (ACAccount)iTunesAccount
{
  return self->_iTunesAccount;
}

- (void)setiTunesAccount:(id)a3
{
  objc_storeStrong((id *)&self->_iTunesAccount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iTunesAccount, 0);
  objc_storeStrong((id *)&self->_serverCacheTag, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
