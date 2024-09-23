@implementation ACAccount(MCCommunicationServiceRules)

- (id)communicationServiceRules
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "parentAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1, "parentAccount");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "communicationServiceRules");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "accountPropertyForKey:", CFSTR("MCAccountCommunicationServiceRules"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)setCommunicationServiceRules:()MCCommunicationServiceRules
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(a1, "parentAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(a1, "parentAccount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCommunicationServiceRules:", v6);

  }
  else
  {
    objc_msgSend(a1, "setAccountProperty:forKey:", v6, CFSTR("MCAccountCommunicationServiceRules"));
  }

}

@end
