@implementation HMFMutableMessage(XPC)

- (uint64_t)setSendPolicy:()XPC
{
  return objc_msgSend(a1, "setUserInfoValue:forKey:", a3, CFSTR("sendPolicy"));
}

- (void)setRequiresSPIEntitlement:()XPC
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setUserInfoValue:forKey:", v2, CFSTR("requiresSPIEntitlement"));

}

- (uint64_t)setRequiresSPIEntitlement
{
  return objc_msgSend(a1, "setRequiresSPIEntitlement:", 1);
}

- (uint64_t)setRequiresNoSPIEntitlement
{
  return objc_msgSend(a1, "setRequiresNoSPIEntitlement:", 1);
}

- (void)setRequiresNoSPIEntitlement:()XPC
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setUserInfoValue:forKey:", v2, CFSTR("requiresNoSPIEntitlement"));

}

- (uint64_t)setRequiresSetupPayloadEntitlement
{
  return objc_msgSend(a1, "setUserInfoValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("requiresSetupPayloadEntitlement"));
}

- (uint64_t)setRequiresMatterSetupPayloadEntitlement
{
  return objc_msgSend(a1, "setUserInfoValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("requiresMatterSetupPayloadEntitlement"));
}

- (uint64_t)setRequiresCameraClipsEntitlement
{
  return objc_msgSend(a1, "setUserInfoValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("requiresCameraClipsEntitlement"));
}

- (uint64_t)setRequiresMultiUserSetupEntitlement
{
  return objc_msgSend(a1, "setUserInfoValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("requiresMultiUserSetupEntitlement"));
}

- (uint64_t)setRequiresPersonManagerEntitlement
{
  return objc_msgSend(a1, "setUserInfoValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("requiresPersonManagerEntitlement"));
}

- (uint64_t)setRequiresWalletKeyEntitlement
{
  return objc_msgSend(a1, "setUserInfoValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("requiresWalletKeyEntitlement"));
}

@end
