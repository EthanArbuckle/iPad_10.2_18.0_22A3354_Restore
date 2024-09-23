@implementation NSDictionary(AMSAccount)

- (id)ams_accountFlags
{
  void *v1;
  id v2;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("accountFlags"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

- (id)ams_username
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "valueForKeyPath:", CFSTR("accountInfo.appleId"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;

    if (v3)
      return v3;
  }
  else
  {

  }
  objc_msgSend(a1, "valueForKeyPath:", CFSTR("accountInfo.accountName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v4;

    if (v3)
      return v3;
  }
  else
  {

  }
  objc_msgSend(a1, "valueForKeyPath:", CFSTR("personInfo.acAccountName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v5;
  else
    v3 = 0;

  return v3;
}

- (id)ams_altDSID
{
  void *v1;
  id v2;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("altDsPersonId"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

- (id)ams_creditsString
{
  void *v1;
  id v2;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("creditDisplay"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

- (id)ams_DSID
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("dsPersonId"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v1, "longLongValue"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (uint64_t)ams_errorCode
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("failureType"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v2 = objc_msgSend(v1, "integerValue");
  else
    v2 = 0;

  return v2;
}

- (id)ams_firstName
{
  void *v1;
  id v2;

  objc_msgSend(a1, "valueForKeyPath:", CFSTR("accountInfo.address.firstName"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

- (uint64_t)ams_isManagedAppleID
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("isManagedStudent"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v2 = objc_msgSend(v1, "BOOLValue");
  else
    v2 = 0;

  return v2;
}

- (id)ams_lastName
{
  void *v1;
  id v2;

  objc_msgSend(a1, "valueForKeyPath:", CFSTR("accountInfo.address.lastName"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

- (id)ams_privacyAcknowledgement
{
  void *v1;
  id v2;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("privacyAcknowledgement"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

- (id)ams_secureToken
{
  void *v1;
  id v2;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("passwordToken"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

@end
