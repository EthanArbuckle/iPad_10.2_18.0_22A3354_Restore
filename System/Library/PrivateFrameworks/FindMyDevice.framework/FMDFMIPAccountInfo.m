@implementation FMDFMIPAccountInfo

- (FMDFMIPAccountInfo)initWithUserName:(id)a3 dsid:(id)a4 oneTimeRemoveAuthToken:(id)a5 serverURL:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  FMDFMIPAccountInfo *v14;
  FMDFMIPAccountInfo *v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)FMDFMIPAccountInfo;
  v14 = -[FMDFMIPAccountInfo init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    -[FMDFMIPAccountInfo setUsername:](v14, "setUsername:", v10);
    -[FMDFMIPAccountInfo setDsid:](v15, "setDsid:", v11);
    -[FMDFMIPAccountInfo setOneTimeRemoveAuthToken:](v15, "setOneTimeRemoveAuthToken:", v12);
    -[FMDFMIPAccountInfo setServerURL:](v15, "setServerURL:", v13);
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FMDFMIPAccountInfo)initWithCoder:(id)a3
{
  id v4;
  FMDFMIPAccountInfo *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)FMDFMIPAccountInfo;
  v5 = -[FMDFMIPAccountInfo init](&v19, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_username);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDFMIPAccountInfo setUsername:](v5, "setUsername:", v8);

    v9 = objc_opt_class();
    NSStringFromSelector(sel_dsid);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDFMIPAccountInfo setDsid:](v5, "setDsid:", v11);

    v12 = objc_opt_class();
    NSStringFromSelector(sel_oneTimeRemoveAuthToken);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDFMIPAccountInfo setOneTimeRemoveAuthToken:](v5, "setOneTimeRemoveAuthToken:", v14);

    v15 = objc_opt_class();
    NSStringFromSelector(sel_serverURL);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDFMIPAccountInfo setServerURL:](v5, "setServerURL:", v17);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[FMDFMIPAccountInfo username](self, "username");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_username);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[FMDFMIPAccountInfo dsid](self, "dsid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_dsid);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[FMDFMIPAccountInfo oneTimeRemoveAuthToken](self, "oneTimeRemoveAuthToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_oneTimeRemoveAuthToken);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, v10);

  -[FMDFMIPAccountInfo serverURL](self, "serverURL");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_serverURL);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, v11);

}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)dsid
{
  return self->_dsid;
}

- (void)setDsid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)oneTimeRemoveAuthToken
{
  return self->_oneTimeRemoveAuthToken;
}

- (void)setOneTimeRemoveAuthToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSURL)serverURL
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (void)setServerURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverURL, 0);
  objc_storeStrong((id *)&self->_oneTimeRemoveAuthToken, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_username, 0);
}

@end
