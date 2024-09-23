@implementation DMCFeatureOverrides

+ (id)stringForDefaultsKey:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (+[DMCFeatureFlags isAppleInternal](DMCFeatureFlags, "isAppleInternal"))
  {
    +[DMCDefaults stringForDefaultsKey:](DMCDefaults, "stringForDefaultsKey:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)numberForDefaultsKey:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (+[DMCFeatureFlags isAppleInternal](DMCFeatureFlags, "isAppleInternal"))
  {
    +[DMCDefaults numberForDefaultsKey:](DMCDefaults, "numberForDefaultsKey:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (BOOL)BOOLForDefaultsKey:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  if (+[DMCFeatureFlags isAppleInternal](DMCFeatureFlags, "isAppleInternal"))
    v4 = +[DMCDefaults BOOLForDefaultsKey:](DMCDefaults, "BOOLForDefaultsKey:", v3);
  else
    v4 = 0;

  return v4;
}

+ (id)dictForDefaultsKey:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (+[DMCFeatureFlags isAppleInternal](DMCFeatureFlags, "isAppleInternal"))
  {
    +[DMCDefaults dictForDefaultsKey:](DMCDefaults, "dictForDefaultsKey:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)objectForDefaultsKey:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (+[DMCFeatureFlags isAppleInternal](DMCFeatureFlags, "isAppleInternal"))
  {
    +[DMCDefaults objectForDefaultsKey:](DMCDefaults, "objectForDefaultsKey:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (BOOL)sentinelExistsAtPath:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  if (+[DMCFeatureFlags isAppleInternal](DMCFeatureFlags, "isAppleInternal"))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (double)accountSignInTimeoutThresholdWithDefaultValue:(double)a3
{
  void *v4;
  void *v5;
  double v6;

  objc_msgSend(a1, "numberForDefaultsKey:", CFSTR("AccountSignInTimeout"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "doubleValue");
    a3 = v6;
  }

  return a3;
}

+ (BOOL)allowAnyMAIDToSignIn
{
  return objc_msgSend(a1, "BOOLForDefaultsKey:", CFSTR("AllowAnyMAID"));
}

+ (id)enrollmentProfileWithDefaultValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(a1, "stringForDefaultsKey:", CFSTR("MDMProfilePath"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  if (v6)
    v7 = v6;
  else
    v7 = v4;
  v8 = v7;

  return v8;
}

+ (double)enrollmentStepTimeoutThresholdWithDefaultValue:(double)a3
{
  void *v4;
  void *v5;
  double v6;

  objc_msgSend(a1, "numberForDefaultsKey:", CFSTR("EnrollmentStepTimeout"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "doubleValue");
    a3 = v6;
  }

  return a3;
}

+ (BOOL)ignoreEnrollmentMode
{
  return objc_msgSend(a1, "BOOLForDefaultsKey:", CFSTR("DMCIgnoreEnrollmentMode"));
}

+ (id)serviceDiscoveryDefaultPortWithValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(a1, "numberForDefaultsKey:", CFSTR("ServiceDiscoveryDefaultPort"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = v4;
  v7 = v5;

  return v7;
}

+ (id)serviceDiscoveryDomainWithValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(a1, "stringForDefaultsKey:", CFSTR("ServiceDiscoveryDomain"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = v4;
  v7 = v5;

  return v7;
}

+ (id)appleMDMWellKnownURLWithDefaultValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(a1, "stringForDefaultsKey:", CFSTR("AppleMDMWellKnownURL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = v4;
  v7 = v5;

  return v7;
}

+ (id)serviceDiscoveryFallbackURLWithValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(a1, "stringForDefaultsKey:", CFSTR("ServiceDiscoveryFallbackURL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = v4;
  v7 = v5;

  return v7;
}

+ (id)serviceDiscoveryFallbackServerVersion
{
  return (id)objc_msgSend(a1, "stringForDefaultsKey:", CFSTR("ServiceDiscoveryFallbackServerVersion"));
}

+ (BOOL)useNonEphemeralWebAuthSession
{
  return objc_msgSend(a1, "BOOLForDefaultsKey:", CFSTR("DMCUseNonEphemeralWebAuthSession"));
}

+ (BOOL)allowAnyESSOApplicationEntitlements
{
  return objc_msgSend(a1, "BOOLForDefaultsKey:", CFSTR("DMCAllowAnyESSOTestApplicationEntitlements"));
}

+ (BOOL)shouldSimulateMDMCommunication
{
  if ((objc_msgSend(a1, "BOOLForDefaultsKey:", CFSTR("SimulateMDMCommunication")) & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "sentinelExistsAtPath:", CFSTR("/var/db/MDM_EnableSim"));
}

+ (BOOL)shouldSimulateDEPCommunication
{
  return objc_msgSend(a1, "BOOLForDefaultsKey:", CFSTR("SimulateDEPCommunication"));
}

+ (BOOL)shouldSimulateMDMAccountDrivenEnrollment
{
  return objc_msgSend(a1, "BOOLForDefaultsKey:", CFSTR("SimulateMDMAccountDrivenEnrollment"));
}

+ (id)simulatedMDMEnrollmentMode
{
  return (id)objc_msgSend(a1, "stringForDefaultsKey:", CFSTR("SimulatedMDMEnrollmentMode"));
}

+ (id)simulatedMDMAccountDrivenEnrollmentDefaultUsername
{
  return (id)objc_msgSend(a1, "stringForDefaultsKey:", CFSTR("SimulatedMDMAccountDrivenEnrollmentDefaultUsername"));
}

+ (id)simulatedMDMAccountDrivenEnrollmentAuthMethod
{
  return (id)objc_msgSend(a1, "stringForDefaultsKey:", CFSTR("SimulatedMDMAccountDrivenEnrollmentAuthMethod"));
}

+ (id)simluatedMDMAccountDrivenEnrollmentAuthenticationResults
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "objectForDefaultsKey:", CFSTR("SimulatedMDMAccountDrivenEnrollmentAuthenticationResults"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  return v3;
}

+ (id)simulatedCloudConfigProfile
{
  return (id)objc_msgSend(a1, "objectForDefaultsKey:", CFSTR("SimulatedCloudConfigProfile"));
}

+ (id)simulatedMDMEnrollmentProfile
{
  return (id)objc_msgSend(a1, "objectForDefaultsKey:", CFSTR("SimulatedMDMEnrollmentProfile"));
}

+ (BOOL)useHTTPLogging
{
  return objc_msgSend(a1, "BOOLForDefaultsKey:", CFSTR("UseHTTPLogging"));
}

+ (BOOL)bypassMDMTLSClientAuthentication
{
  return objc_msgSend(a1, "BOOLForDefaultsKey:", CFSTR("DMCBypassMDMTLSClientAuthentication"));
}

+ (BOOL)bypassWatchUnpairWhenUnenrolling
{
  return objc_msgSend(a1, "BOOLForDefaultsKey:", CFSTR("DMCBypassWatchUnpairWhenUnenrolling"));
}

+ (id)activationRecordFlagsWithFlags:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;

  v4 = a3;
  if ((objc_msgSend(a1, "sentinelExistsAtPath:", *MEMORY[0x1E0D1BEE0]) & 1) != 0
    || (objc_msgSend(a1, "stringForDefaultsKey:", *MEMORY[0x1E0D1BF68]),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = (int)(objc_msgSend(v4, "intValue") | 1);
    else
      v6 = 1;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v4;
  }
  v8 = v7;

  return v8;
}

+ (BOOL)_isUnknownProduct
{
  return 0;
}

+ (id)modelNameWithDefaultValue:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;

  v4 = (__CFString *)a3;
  if ((objc_msgSend(a1, "_isUnknownProduct") & 1) != 0)
  {
    v5 = CFSTR("iProd");
  }
  else
  {
    objc_msgSend(a1, "stringForDefaultsKey:", CFSTR("DMCModelNameOverride"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (v5)
    v6 = v5;
  else
    v6 = v4;
  v7 = v6;

  return v7;
}

+ (id)modelNumberWithDefaultValue:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;

  v4 = (__CFString *)a3;
  if ((objc_msgSend(a1, "_isUnknownProduct") & 1) != 0)
  {
    v5 = CFSTR("iProd");
  }
  else
  {
    objc_msgSend(a1, "stringForDefaultsKey:", CFSTR("DMCModelNumberOverride"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (v5)
    v6 = v5;
  else
    v6 = v4;
  v7 = v6;

  return v7;
}

+ (id)productNameWithDefaultValue:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;

  v4 = (__CFString *)a3;
  if ((objc_msgSend(a1, "_isUnknownProduct") & 1) != 0)
  {
    v5 = CFSTR("iProd1,1");
  }
  else
  {
    objc_msgSend(a1, "stringForDefaultsKey:", CFSTR("DMCProductNameOverride"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (v5)
    v6 = v5;
  else
    v6 = v4;
  v7 = v6;

  return v7;
}

+ (id)deviceNameWithDefaultValue:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;

  v4 = (__CFString *)a3;
  if ((objc_msgSend(a1, "_isUnknownProduct") & 1) != 0)
  {
    v5 = CFSTR("iDevice");
  }
  else
  {
    objc_msgSend(a1, "stringForDefaultsKey:", CFSTR("DMCDeviceNameOverride"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (v5)
    v6 = v5;
  else
    v6 = v4;
  v7 = v6;

  return v7;
}

+ (id)softwareUpdateDeviceIDWithDefaultValue:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;

  v4 = (__CFString *)a3;
  if ((objc_msgSend(a1, "_isUnknownProduct") & 1) != 0)
  {
    v5 = CFSTR("iProd1,1");
  }
  else
  {
    objc_msgSend(a1, "stringForDefaultsKey:", CFSTR("DMCSoftwareUpdateDeviceIDOverride"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (v5)
    v6 = v5;
  else
    v6 = v4;
  v7 = v6;

  return v7;
}

+ (id)attestationRateLimitOverrideMinutes
{
  return (id)objc_msgSend(a1, "numberForDefaultsKey:", CFSTR("DMCAttestationRateLimitOverrideMinutes"));
}

+ (id)gestaltOverrideForKey:(__CFString *)a3 withDefaultValue:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  objc_msgSend(a1, "objectForDefaultsKey:", CFSTR("DMCMobileGestaltOverride"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
    v8 = v6;
  v10 = v8;

  return v10;
}

+ (BOOL)watchEnrollmentAllowLocalProfile
{
  return objc_msgSend(a1, "BOOLForDefaultsKey:", CFSTR("DMCWatchEnrollmentAllowLocalProfile"));
}

+ (id)mdmAppInstallationSourceIdentifierWithDefaultValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(a1, "stringForDefaultsKey:", CFSTR("DMCMDMAppSourceIdentifierOverride"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = v4;
  v7 = v5;

  return v7;
}

+ (BOOL)forceAppInstallUnremovability
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "numberForDefaultsKey:", CFSTR("DMCDefaultsKeyForceAppInstallUnremovability"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

+ (BOOL)forceAppRemovalOnUnenroll
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "numberForDefaultsKey:", CFSTR("DMCDefaultsKeyForceAppRemovalOnUnenroll"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

+ (BOOL)forceMediaCommandSupport
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "numberForDefaultsKey:", CFSTR("DMCEnableMediaCommands"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

+ (BOOL)fakePushToken
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "numberForDefaultsKey:", CFSTR("DMCFakePushToken"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

@end
