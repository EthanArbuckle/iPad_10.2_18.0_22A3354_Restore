@implementation AKCertificatePinning

+ (BOOL)isValidCertificateTrust:(__SecTrust *)a3 forHostname:(id)a4
{
  __CFString *v5;
  const void *AppleGSService;
  const void *v7;
  int v8;
  BOOL v9;
  void *v10;
  int v11;
  SecPolicyRef SSL;
  SecPolicyRef v13;
  int v16;

  v5 = (__CFString *)a4;
  v16 = 0;
  AppleGSService = (const void *)SecPolicyCreateAppleGSService();
  if (AppleGSService)
  {
    v7 = AppleGSService;
    if (SecTrustSetPolicies(a3, AppleGSService) || MEMORY[0x194022804](a3, &v16))
    {
      CFRelease(v7);
    }
    else
    {
      v8 = v16;
      CFRelease(v7);
      v9 = 1;
      if (v8 == 1 || v8 == 4)
        goto LABEL_19;
    }
  }
  +[AKDevice currentDevice](AKDevice, "currentDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isInternalBuild");

  if (v11
    && CFPreferencesGetAppBooleanValue(CFSTR("AppleIDAuthSupportNoPinning"), CFSTR(".GlobalPreferences"), 0)
    && (SSL = SecPolicyCreateSSL(1u, v5)) != 0)
  {
    v13 = SSL;
    v9 = !SecTrustSetPolicies(a3, SSL) && !MEMORY[0x194022804](a3, &v16) && (v16 == 4 || v16 == 1);
    CFRelease(v13);
  }
  else
  {
    v9 = 0;
  }
LABEL_19:

  return v9;
}

@end
