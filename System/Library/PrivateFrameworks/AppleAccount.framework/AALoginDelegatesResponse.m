@implementation AALoginDelegatesResponse

- (NSNumber)status
{
  void *v2;
  void *v3;

  -[AAResponse responseDictionary](self, "responseDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("status"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (NSString)statusMessage
{
  void *v2;
  void *v3;

  -[AAResponse responseDictionary](self, "responseDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("status-message"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSDictionary)responseParameters
{
  void *v2;
  void *v3;

  -[AAResponse responseDictionary](self, "responseDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("delegates"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (id)responseParametersForServiceIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[AALoginDelegatesResponse responseParameters](self, "responseParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)dsid
{
  void *v2;
  void *v3;

  -[AAResponse responseDictionary](self, "responseDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("dsid"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)altDSID
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[AALoginDelegatesResponse responseParameters](self, "responseParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("com.apple.mobileme"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("service-data"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appleAccountInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("aDsID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)augmentedResponseParametersForServiceIdentifier:(id)a3 withAppleID:(id)a4 password:(id)a5 DSID:(id)a6 altDSID:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  -[AALoginDelegatesResponse responseParametersForServiceIdentifier:](self, "responseParametersForServiceIdentifier:", a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("service-data"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id)objc_msgSend(v17, "mutableCopy");

  if (!v18)
    v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("status"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("status"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v20, CFSTR("status"));

  }
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("status-message"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("status-message"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v22, CFSTR("status-message"));

  }
  if (v12)
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v12, CFSTR("appleIDEnteredByUser"));
  if (v13)
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v13, CFSTR("password"));
  if (v14)
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v14, CFSTR("dsid"));
  if (v15)
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v15, CFSTR("altDSID"));
  v23 = (void *)objc_msgSend(v18, "copy");

  return v23;
}

@end
