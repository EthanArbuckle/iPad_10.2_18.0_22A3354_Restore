@implementation IMAccount(CommunicationsSetupUI)

- (id)loginDisplayString
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "login");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2199B88A4]();
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v2, "_appearsToBePhoneNumber"))
  {
    CNFRegFormattedPhoneNumberForString(v2);
    v3 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v3;
  }
  return v2;
}

- (BOOL)isAccountKeyCDPSyncingOrWaitingForUser
{
  return (objc_msgSend(a1, "registrationFailureReason") & 0xFFFFFFFELL) == 28;
}

@end
