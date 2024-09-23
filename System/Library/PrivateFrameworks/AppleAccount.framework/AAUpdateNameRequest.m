@implementation AAUpdateNameRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (AAUpdateNameRequest)initWithGrandSlamAccount:(id)a3 accountStore:(id)a4 firstName:(id)a5 lastName:(id)a6
{
  id v11;
  id v12;
  AAUpdateNameRequest *v13;
  AAUpdateNameRequest *v14;
  objc_super v16;

  v11 = a5;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)AAUpdateNameRequest;
  v13 = -[AAAppleIDSettingsRequest initWithGrandSlamAccount:accountStore:](&v16, sel_initWithGrandSlamAccount_accountStore_, a3, a4);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_newFirstName, a5);
    objc_storeStrong((id *)&v14->_newLastName, a6);
  }

  return v14;
}

- (id)urlString
{
  void *v2;
  void *v3;

  +[AAURLConfiguration urlConfiguration](AAURLConfiguration, "urlConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateNameURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)urlRequest
{
  void *v3;
  void *v4;
  NSString *newFirstName;
  NSString *newLastName;
  void *v7;
  objc_super v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)AAUpdateNameRequest;
  -[AAAppleIDSettingsRequest urlRequest](&v9, sel_urlRequest);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  newFirstName = self->_newFirstName;
  if (newFirstName)
  {
    newLastName = self->_newLastName;
    if (newLastName)
    {
      v10[0] = CFSTR("firstName");
      v10[1] = CFSTR("lastName");
      v11[0] = newFirstName;
      v11[1] = newLastName;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "aa_setBodyWithParameters:", v7);

    }
  }
  objc_msgSend(v4, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v4, "addValue:forHTTPHeaderField:", CFSTR("application/x-plist"), CFSTR("Content-Type"));
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_newLastName, 0);
  objc_storeStrong((id *)&self->_newFirstName, 0);
}

@end
