@implementation AAInitiateEmailVettingRequest

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
  objc_msgSend(v3, "initiateValidateEmailURL");
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
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99D80];
  -[AAEmailVettingRequest account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "aa_primaryEmail");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithObject:forKey:", v4, CFSTR("emailToVet"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
