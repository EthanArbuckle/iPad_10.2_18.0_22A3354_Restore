@implementation INPaymentAccount(AssistantCardService)

- (id)acs_formattedAccountName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "nickname");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "spokenPhrase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
    objc_msgSend(a1, "nickname");
  else
    objc_msgSend(a1, "organizationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "spokenPhrase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
