@implementation AACompleteEmailVettingRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (AACompleteEmailVettingRequest)initWithAccount:(id)a3 token:(id)a4
{
  id v7;
  AACompleteEmailVettingRequest *v8;
  AACompleteEmailVettingRequest *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AACompleteEmailVettingRequest;
  v8 = -[AAEmailVettingRequest initWithAccount:](&v11, sel_initWithAccount_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_token, a4);

  return v9;
}

- (AACompleteEmailVettingRequest)initWithURLString:(id)a3 account:(id)a4 token:(id)a5
{
  id v9;
  AACompleteEmailVettingRequest *v10;
  AACompleteEmailVettingRequest *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)AACompleteEmailVettingRequest;
  v10 = -[AAEmailVettingRequest initWithURLString:account:](&v13, sel_initWithURLString_account_, a3, a4);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_token, a5);

  return v11;
}

- (id)urlString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  +[AAURLConfiguration urlConfiguration](AAURLConfiguration, "urlConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "completeValidateEmailURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[AAEmailVettingRequest account](self, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "username");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("$APPLE_ID$"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithString:", v7);
    objc_msgSend(v8, "string");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)bodyDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99D80];
  -[AAEmailVettingRequest account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aa_primaryEmail");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", v5, CFSTR("emailToVet"), self->_token, CFSTR("token"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
}

@end
