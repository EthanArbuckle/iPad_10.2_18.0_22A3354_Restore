@implementation GKContactsIntegrationUserSettings

+ (int)integrationConsentValueFromServerResult:(id)a3
{
  id v3;
  id v4;
  int v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("allowed")) & 1) != 0)
    v5 = 1;
  else
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("denied")) - 1;

  return v5;
}

+ (id)associationIDFromServerResult:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  if (objc_msgSend(v5, "length"))
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

+ (id)dateFromServerResult:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "_gkDateFromServerTimestamp:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (void)applySettingsToObject:(id)a3 fromResults:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("allow-contact-lookup"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContactsIntegrationConsent:", objc_msgSend(a1, "integrationConsentValueFromServerResult:", v8));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("contact-association-id"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "associationIDFromServerResult:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContactsAssociationID:", v10);

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("last-updated"));
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "dateFromServerResult:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setServiceLastUpdatedTimestamp:", v11);

}

@end
