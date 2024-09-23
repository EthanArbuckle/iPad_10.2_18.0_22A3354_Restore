@implementation NSMutableURLRequest(AuthKit)

+ (id)ak_anisetteHeadersWithData:()AuthKit
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "machineID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "oneTimePassword");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%llu"), objc_msgSend(v3, "routingInfo"));
  v8 = (void *)v7;
  if (v5 && v6 && v7)
    goto LABEL_7;
  _AKLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    +[NSMutableURLRequest(AuthKit) ak_anisetteHeadersWithData:].cold.1();

  if (v5)
LABEL_7:
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("X-Apple-I-MD-M"));
  if (v6)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("X-Apple-I-MD"));
  if (v8)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("X-Apple-I-MD-RINFO"));
  +[AKDevice currentDevice](AKDevice, "currentDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localUserUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "aaf_toSHA256String");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("X-Apple-I-MD-LU"));
  +[AKConfiguration sharedConfiguration](AKConfiguration, "sharedConfiguration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "shouldAllowTestApplication");

  if (v14 == 1)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("true"), CFSTR("X-Apple-Test-Application"));
  v15 = (void *)objc_msgSend(v4, "copy");

  return v15;
}

+ (id)ak_timeZoneHeader
{
  void *v0;
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "abbreviation");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    v4 = CFSTR("X-Apple-I-TimeZone");
    v5[0] = v1;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v2;
}

+ (id)ak_localeHeader
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  +[AKDevice currentDevice](AKDevice, "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "locale");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localeIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v5 = CFSTR("X-Apple-I-Locale");
    v6[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v3;
}

+ (id)ak_clientTimeHeader
{
  void *v0;
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "ak_serverFriendlyString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    v4 = CFSTR("X-Apple-I-Client-Time");
    v5[0] = v1;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v2;
}

- (void)ak_addInternalBuildHeader
{
  void *v2;
  uint64_t v3;
  id v4;

  +[AKDevice currentDevice](AKDevice, "currentDevice");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isInternalBuild") & 1) != 0)
  {
    +[AKConfiguration sharedConfiguration](AKConfiguration, "sharedConfiguration");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "shouldHideInternalBuildHeader");

    if (v3 != 1)
      objc_msgSend(a1, "setValue:forHTTPHeaderField:", CFSTR("true"), CFSTR("X-Apple-I-88CC-99DE-EE63-2736"));
  }
  else
  {

  }
}

- (void)ak_addSeedBuildHeader
{
  void *v2;
  uint64_t v3;
  id v4;

  +[AKDevice currentDevice](AKDevice, "currentDevice");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isSeedBuild") & 1) != 0)
  {
    +[AKConfiguration sharedConfiguration](AKConfiguration, "sharedConfiguration");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "shouldHideSeedBuildHeader");

    if (v3 != 1)
      objc_msgSend(a1, "setValue:forHTTPHeaderField:", CFSTR("true"), CFSTR("X-Apple-I-B636-170F-9E08-A4C3"));
  }
  else
  {

  }
}

- (void)ak_addFeatureMaskHeader
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  +[AKDevice currentDevice](AKDevice, "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInternalBuild");

  if (v3)
  {
    +[AKConfiguration sharedConfiguration](AKConfiguration, "sharedConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "internalFeaturesMaskValue");

    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringValue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "setValue:forHTTPHeaderField:", v6, CFSTR("X-Apple-I-Experiment-Features"));

    }
  }
}

- (void)ak_addLocalUserUUIDHashHeader
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  +[AKDevice currentDevice](AKDevice, "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localUserUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "aaf_toSHA256String");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v5;
  if (v5)
  {
    objc_msgSend(a1, "setValue:forHTTPHeaderField:", v5, CFSTR("X-Apple-I-MD-LU"));
    v4 = v5;
  }

}

- (uint64_t)ak_addAppleIDHeaderWithValue:()AuthKit
{
  return objc_msgSend(a1, "setValue:forHTTPHeaderField:", a3, CFSTR("X-Apple-I-AppleID"));
}

- (void)ak_addAppleIDUserModeHeaderWithValue:()AuthKit
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setValue:forHTTPHeaderField:", v2, CFSTR("X-Apple-I-DeviceUserMode"));

}

- (void)ak_addDeviceUDIDHeader
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  id v6;

  +[AKDevice currentDevice](AKDevice, "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isVirtualMachine");

  +[AKDevice currentDevice](AKDevice, "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "provisioningDeviceIdentifier");
  else
    objc_msgSend(v4, "uniqueDeviceIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "setValue:forHTTPHeaderField:", v6, CFSTR("X-Mme-Device-Id"));
}

- (void)ak_addProvisioningUDIDHeader
{
  void *v2;
  id v3;

  +[AKDevice currentDevice](AKDevice, "currentDevice");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "provisioningDeviceIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setValue:forHTTPHeaderField:", v2, CFSTR("X-Apple-I-Provisioning-Device-Id"));

}

- (uint64_t)ak_addProxiedDeviceUDIDHeader:()AuthKit
{
  return objc_msgSend(a1, "setValue:forHTTPHeaderField:", a3, CFSTR("X-Mme-Proxied-Device-Id"));
}

- (void)ak_addClientInfoHeader
{
  void *v2;
  id v3;

  +[AKDevice currentDevice](AKDevice, "currentDevice");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serverFriendlyDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setValue:forHTTPHeaderField:", v2, CFSTR("X-MMe-Client-Info"));

}

- (void)ak_addClientTimeHeader
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ak_serverFriendlyString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setValue:forHTTPHeaderField:", v2, CFSTR("X-Apple-I-Client-Time"));

}

- (void)ak_addCircleStatusHeader
{
  int v2;
  __CFString **v3;
  id v4;

  +[AKDevice currentDevice](AKDevice, "currentDevice");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v4, "isInCircle");
  v3 = AKTrueValue;
  if (!v2)
    v3 = AKFalseValue;
  objc_msgSend(a1, "setValue:forHTTPHeaderField:", *v3, CFSTR("X-Apple-I-CDP-Circle-Status"));

}

- (uint64_t)ak_addOTStatusHeaderForAltDSID:()AuthKit
{
  _BOOL4 v2;
  __CFString **v3;

  v2 = +[AKCDPFactory cdpAccountIsOTEnabledForAltDSID:](AKCDPFactory, "cdpAccountIsOTEnabledForAltDSID:");
  v3 = AKTrueValue;
  if (!v2)
    v3 = AKFalseValue;
  return objc_msgSend(a1, "setValue:forHTTPHeaderField:", *v3, CFSTR("X-Apple-I-OT-Status"));
}

- (uint64_t)ak_addCDPStatusHeaderForDSID:()AuthKit
{
  _BOOL4 v2;
  __CFString **v3;

  v2 = +[AKCDPFactory cdpAccountIsICDPEnabledForDSID:](AKCDPFactory, "cdpAccountIsICDPEnabledForDSID:");
  v3 = AKTrueValue;
  if (!v2)
    v3 = AKFalseValue;
  return objc_msgSend(a1, "setValue:forHTTPHeaderField:", *v3, CFSTR("X-Apple-I-CDP-Status"));
}

- (uint64_t)ak_addCircleStatusHeaderForCircleStatus:()AuthKit
{
  __CFString **v3;

  v3 = AKTrueValue;
  if (!a3)
    v3 = AKFalseValue;
  return objc_msgSend(a1, "setValue:forHTTPHeaderField:", *v3, CFSTR("X-Apple-I-CDP-Circle-Status"));
}

- (uint64_t)ak_addCompanionClientInfoHeader:()AuthKit
{
  return objc_msgSend(a1, "setValue:forHTTPHeaderField:", a3, CFSTR("X-MMe-Companion-Client-Info"));
}

- (uint64_t)ak_addProxiedClientInfoHeader:()AuthKit
{
  return objc_msgSend(a1, "setValue:forHTTPHeaderField:", a3, CFSTR("X-MMe-Proxied-Client-Info"));
}

- (uint64_t)ak_addEphemeralAuthHeader
{
  return objc_msgSend(a1, "setValue:forHTTPHeaderField:", CFSTR("true"), CFSTR("X-Apple-Ephemeral-Auth"));
}

- (void)ak_addAttestationDataHeaders
{
  void *v5;
  uint64_t v6;
  uint8_t v7[12];
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  v8 = 2112;
  v9 = a2;
  OUTLINED_FUNCTION_3_0(&dword_19202F000, a3, v6, "Unable to get Attestation data for request %@! Error: %@", v7);

}

- (void)ak_addProxiedAnisetteHeaders:()AuthKit
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "ak_proxiedAnisetteHeadersWithData:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "setValue:forHTTPHeaderField:", v11, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (void)ak_addProxiedAttestationHeaders:()AuthKit
{
  id v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];

  v4 = a3;
  _AKLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[NSMutableURLRequest(AuthKit) ak_addProxiedAttestationHeaders:].cold.1();

  objc_msgSend(v4, "attestationHeaders");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__NSMutableURLRequest_AuthKit__ak_addProxiedAttestationHeaders___block_invoke;
  v7[3] = &unk_1E2E5FD18;
  v7[4] = a1;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (uint64_t)ak_addAuthorizationHeaderWithIdentityToken:()AuthKit forAltDSID:
{
  return objc_msgSend(a1, "_setAuthorizationHeaderWithToken:altDSID:key:", a3, a4, CFSTR("X-Apple-Identity-Token"));
}

- (uint64_t)ak_addProxiedAuthorizationHeaderWithIdentityToken:()AuthKit forAltDSID:
{
  return objc_msgSend(a1, "_setAuthorizationHeaderWithToken:altDSID:key:", a3, a4, CFSTR("X-Apple-Proxied-Identity-Token"));
}

- (uint64_t)ak_addAuthorizationHeaderWithServiceToken:()AuthKit forAltDSID:
{
  return objc_msgSend(a1, "_setAuthorizationHeaderWithToken:altDSID:key:", a3, a4, CFSTR("X-Apple-GS-Token"));
}

- (uint64_t)ak_addAuthorizationHeaderWithHeartbeatToken:()AuthKit forAltDSID:
{
  return objc_msgSend(a1, "_setAuthorizationHeaderWithToken:altDSID:key:", a3, a4, CFSTR("X-Apple-HB-Token"));
}

- (uint64_t)ak_addAuthorizationHeaderWithCustodianRecoveryToken:()AuthKit forAltDSID:
{
  return objc_msgSend(a1, "_setAuthorizationHeaderWithToken:altDSID:key:", a3, a4, CFSTR("X-Apple-CR-Token"));
}

- (void)ak_addICSCRecoveryHeaderWithIdentityToken:()AuthKit forAltDSID:
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "_setAuthorizationHeaderWithToken:altDSID:key:", v7, v6, CFSTR("X-Apple-iCSC-Identity-Token"));
  objc_msgSend(a1, "ak_addRecoveryHeaderWithIdentityToken:forAltDSID:", v7, v6);

}

- (uint64_t)ak_addRecoveryHeaderWithIdentityToken:()AuthKit forAltDSID:
{
  return objc_msgSend(a1, "_setAuthorizationHeaderWithToken:altDSID:key:", a3, a4, CFSTR("X-Apple-Recovery-Identity-Token"));
}

- (uint64_t)ak_addShortLivedTokenHeaderWithIdentityToken:()AuthKit forAltDSID:
{
  return objc_msgSend(a1, "_setAuthorizationHeaderWithToken:altDSID:key:", a3, a4, CFSTR("X-Apple-SL-Token"));
}

- (uint64_t)ak_addGuardianAuthorizationHeaderWithIdentityToken:()AuthKit forAltDSID:
{
  return objc_msgSend(a1, "_setAuthorizationHeaderWithToken:altDSID:key:", a3, a4, CFSTR("X-Apple-Guardian-Identity-Token"));
}

- (uint64_t)ak_addGuardianAuthorizationHeaderWithHeartbeatToken:()AuthKit forAltDSID:
{
  return objc_msgSend(a1, "_setAuthorizationHeaderWithToken:altDSID:key:", a3, a4, CFSTR("X-Apple-Guardian-HB-Token"));
}

- (uint64_t)ak_addGuardianAuthorizationHeaderWithServiceToken:()AuthKit forAltDSID:
{
  return objc_msgSend(a1, "_setAuthorizationHeaderWithToken:altDSID:key:", a3, a4, CFSTR("X-Apple-Guardian-GS-Token"));
}

- (void)ak_addGuardianAuthorizationHeaderWithIdentityToken:()AuthKit heartbeatToken:serviceToken:forAltDSID:
{
  id v10;
  id v11;
  id v12;

  v10 = a6;
  v12 = a5;
  v11 = a4;
  objc_msgSend(a1, "ak_addGuardianAuthorizationHeaderWithIdentityToken:forAltDSID:", a3, v10);
  objc_msgSend(a1, "ak_addGuardianAuthorizationHeaderWithHeartbeatToken:forAltDSID:", v11, v10);

  objc_msgSend(a1, "ak_addGuardianAuthorizationHeaderWithServiceToken:forAltDSID:", v12, v10);
}

- (void)ak_addURLSwitchingHeaderWithURLKey:()AuthKit altDSID:
{
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  if (a4)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), a4, a3);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(":%@"), a3, v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataUsingEncoding:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setValue:forHTTPHeaderField:", v6, CFSTR("X-Apple-I-UrlSwitch-Info"));

}

- (uint64_t)ak_addDataCenterHeaderWithIdentifier:()AuthKit
{
  return objc_msgSend(a1, "setValue:forHTTPHeaderField:", a3, CFSTR("X-Apple-I-DC"));
}

- (id)ak_valueForEncodedHeaderWithKey:()AuthKit
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "valueForHTTPHeaderField:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v1, 0);
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v2, 4);

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)_setAuthorizationHeaderWithToken:()AuthKit altDSID:key:
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = a5;
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@:%@"), a4, a3);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dataUsingEncoding:", 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "base64EncodedStringWithOptions:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setValue:forHTTPHeaderField:", v11, v9);

}

- (void)ak_setBodyWithParameters:()AuthKit
{
  void *v4;
  id v5;
  NSObject *v6;
  id v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", a3, 100, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v7;
  if (v5)
  {
    _AKLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[NSMutableURLRequest(AuthKit) ak_setBodyWithParameters:].cold.1();

  }
  else
  {
    objc_msgSend(a1, "setHTTPBody:", v4);
  }

}

- (void)ak_setJSONBodyWithParameters:()AuthKit
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8[5];

  v8[4] = *(id *)MEMORY[0x1E0C80C00];
  v4 = a3;
  v8[0] = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v4, 0, v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v8[0];
  if (v6)
  {
    _AKLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[NSMutableURLRequest(AuthKit) ak_setBodyWithParameters:].cold.1();

  }
  else
  {
    objc_msgSend(a1, "setHTTPBody:", v5);
  }

}

- (uint64_t)ak_addJSONRequestHeader
{
  return objc_msgSend(a1, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
}

- (void)ak_addAbsintheHeaderWithValue:()AuthKit
{
  if (a3)
    return (void *)objc_msgSend(a1, "setValue:forHTTPHeaderField:", a3, CFSTR("X-Mme-Nas-Qualify"));
  return a1;
}

- (void)ak_addLoggedInServicesHeaderForServices:()AuthKit
{
  id v4;
  void *v5;
  NSObject *v6;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR(","));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _AKLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[NSMutableURLRequest(AuthKit) ak_addLoggedInServicesHeaderForServices:].cold.1();

    objc_msgSend(a1, "setValue:forHTTPHeaderField:", v5, CFSTR("X-Apple-I-Logged-In-Services"));
  }

}

- (void)ak_addContextHeaderForServiceType:()AuthKit
{
  uint64_t v3;

  v3 = a3 - 1;
  if ((unint64_t)(a3 - 1) <= 6 && ((0x7Bu >> v3) & 1) != 0)
    return (void *)objc_msgSend(a1, "setValue:forHTTPHeaderField:", off_1E2E5FD38[v3], CFSTR("X-Apple-AK-Context-Type"));
  return a1;
}

- (void)ak_addContinutationKeyHeader:()AuthKit
{
  void *v4;
  id v5;

  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setValue:forHTTPHeaderField:", v4, CFSTR("X-Apple-I-CK"));

}

- (uint64_t)ak_addContinutationKeyPresenceHeader:()AuthKit
{
  __CFString **v3;

  v3 = AKTrueValue;
  if (!a3)
    v3 = AKFalseValue;
  return objc_msgSend(a1, "setValue:forHTTPHeaderField:", *v3, CFSTR("X-Apple-I-CK-Presence"));
}

- (void)ak_addPasswordResetKeyHeader:()AuthKit
{
  void *v4;
  id v5;

  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setValue:forHTTPHeaderField:", v4, CFSTR("X-Apple-I-PRK"));

}

- (void)ak_addCountryHeader
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0C997B0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uppercaseString");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v5;
  if (v5)
  {
    objc_msgSend(a1, "setValue:forHTTPHeaderField:", v5, CFSTR("X-MMe-Country"));
    v4 = v5;
  }

}

- (void)ak_addSKUCountryHeader
{
  void *v2;
  void *v3;

  MGGetStringAnswer();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(a1, "setValue:forHTTPHeaderField:", v2, CFSTR("X-Apple-I-SKU-Country"));
    v2 = v3;
  }

}

- (void)ak_addProxiedDeviceCountryHeader:()AuthKit
{
  id v4;

  if (a3)
  {
    objc_msgSend(a3, "uppercaseString");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setValue:forHTTPHeaderField:", v4, CFSTR("X-MMe-Proxied-Country"));

  }
}

- (void)ak_addLocaleHeader
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  +[AKDevice currentDevice](AKDevice, "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "locale");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v3 = v5;
  if (v5)
  {
    objc_msgSend(v5, "localeIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setValue:forHTTPHeaderField:", v4, CFSTR("X-Apple-I-Locale"));

    v3 = v5;
  }

}

- (void)ak_addTimeZoneHeaders
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(a1, "setValue:forHTTPHeaderField:", v7, CFSTR("X-Apple-I-TimeZone"));
  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "secondsFromGMT");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setValue:forHTTPHeaderField:", v6, CFSTR("X-Apple-I-TimeZone-Offset"));

}

- (uint64_t)ak_addPRKRequestHeader
{
  return objc_msgSend(a1, "setValue:forHTTPHeaderField:", CFSTR("true"), CFSTR("X-Apple-I-PRK-Gen"));
}

- (uint64_t)ak_addCKRequestHeader
{
  return objc_msgSend(a1, "setValue:forHTTPHeaderField:", CFSTR("true"), CFSTR("X-Apple-I-CK-Gen"));
}

- (uint64_t)ak_addProxiedDevicePRKRequestHeader
{
  return objc_msgSend(a1, "setValue:forHTTPHeaderField:", CFSTR("true"), CFSTR("X-Apple-I-Proxied-PRK-Gen"));
}

- (uint64_t)ak_addICSCIntentHeader
{
  return objc_msgSend(a1, "setValue:forHTTPHeaderField:", CFSTR("true"), CFSTR("X-Apple-I-ICSCREC"));
}

- (uint64_t)ak_addLocalUserHasAppleIDLoginHeader
{
  return objc_msgSend(a1, "setValue:forHTTPHeaderField:", CFSTR("true"), CFSTR("X-Apple-I-Local-Login-Uses-AppleID"));
}

- (void)ak_addDeviceROMHeader
{
  void *v2;
  void *v3;
  id v4;

  +[AKDevice currentDevice](AKDevice, "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ROMAddress");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v3 = v4;
  if (v4)
  {
    objc_msgSend(a1, "setValue:forHTTPHeaderField:", v4, CFSTR("X-Apple-I-ROM"));
    v3 = v4;
  }

}

- (void)ak_addDeviceMLBHeader
{
  void *v2;
  void *v3;
  id v4;

  +[AKDevice currentDevice](AKDevice, "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MLBSerialNumber");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v3 = v4;
  if (v4)
  {
    objc_msgSend(a1, "setValue:forHTTPHeaderField:", v4, CFSTR("X-Apple-I-MLB"));
    v3 = v4;
  }

}

- (void)ak_addDeviceSerialNumberHeader
{
  void *v2;
  void *v3;
  id v4;

  +[AKDevice currentDevice](AKDevice, "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serialNumber");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v3 = v4;
  if (v4)
  {
    objc_msgSend(a1, "setValue:forHTTPHeaderField:", v4, CFSTR("X-Apple-I-SRL-NO"));
    v3 = v4;
  }

}

- (void)ak_addProxiedDeviceSerialNumberHeader:()AuthKit
{
  if (a3)
    return (void *)objc_msgSend(a1, "setValue:forHTTPHeaderField:", a3, CFSTR("X-Apple-I-Proxied-SRL-NO"));
  return a1;
}

- (void)ak_addPhoneNumberHeader
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "Failed to attach PTN header", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (uint64_t)ak_addPhoneNumberCertificateHeaderWithValue:()AuthKit
{
  return objc_msgSend(a1, "setValue:forHTTPHeaderField:", a3, CFSTR("X-Apple-IDS-PAC"));
}

- (void)ak_addPhoneInformationHeaderWithValue:()AuthKit
{
  void *v4;
  NSObject *v5;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "ak_base64EncodedJsonFromObject:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(a1, "setValue:forHTTPHeaderField:", v4, CFSTR("X-Apple-I-Phone"));
    }
    else
    {
      _AKLogSystem();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[NSMutableURLRequest(AuthKit) ak_addPhoneInformationHeaderWithValue:].cold.1();

    }
  }
}

- (void)ak_addAcceptedSLAHeaderWithVersion:()AuthKit
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setValue:forHTTPHeaderField:", v2, CFSTR("X-Apple-iOS-SLA-Version"));

}

- (uint64_t)ak_addClientApp:()AuthKit
{
  return objc_msgSend(a1, "setValue:forHTTPHeaderField:", a3, CFSTR("X-Apple-Client-App-Name"));
}

- (uint64_t)ak_addProxyApp:()AuthKit
{
  return objc_msgSend(a1, "setValue:forHTTPHeaderField:", a3, CFSTR("X-Apple-Proxied-App-Name"));
}

- (uint64_t)ak_addAppProvidedContext:()AuthKit
{
  return objc_msgSend(a1, "setValue:forHTTPHeaderField:", a3, CFSTR("X-Apple-I-App-Provided-Context"));
}

- (uint64_t)ak_addReAuthenticationHeader
{
  return objc_msgSend(a1, "setValue:forHTTPHeaderField:", CFSTR("true"), CFSTR("X-Apple-I-ReAuth"));
}

- (void)ak_addOfferSecurityUpgrade:()AuthKit
{
  if (a3)
    return (void *)objc_msgSend(a1, "setValue:forHTTPHeaderField:", CFSTR("1"), CFSTR("X-Apple-Offer-Security-Upgrade"));
  return a1;
}

- (uint64_t)ak_addProxiedDeviceICSCIntentHeader
{
  return objc_msgSend(a1, "setValue:forHTTPHeaderField:", CFSTR("true"), CFSTR("X-Apple-I-Proxied-ICSCREC"));
}

+ (id)ak_clientInfoHeader
{
  void *v0;
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  +[AKDevice currentDevice](AKDevice, "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "serverFriendlyDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    v4 = CFSTR("X-MMe-Client-Info");
    v5[0] = v1;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v2;
}

+ (id)ak_deviceUDIDHeader
{
  void *v0;
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  +[AKDevice currentDevice](AKDevice, "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "uniqueDeviceIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    v4 = CFSTR("X-Mme-Device-Id");
    v5[0] = v1;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v2;
}

+ (id)ak_anisetteHeadersWithCompanionData:()AuthKit
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "machineID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "oneTimePassword");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%llu"), objc_msgSend(v3, "routingInfo"));
  v8 = (void *)v7;
  if (v5 && v6 && v7)
    goto LABEL_7;
  _AKLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    +[NSMutableURLRequest(AuthKit) ak_anisetteHeadersWithCompanionData:].cold.1();

  if (v5)
LABEL_7:
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("X-Apple-I-Companion-MD-M"));
  if (v6)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("X-Apple-I-Companion-MD"));
  if (v8)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("X-Apple-I-Companion-MD-RINFO"));

  return v4;
}

+ (id)ak_proxiedHeadersForDevice:()AuthKit anisetteData:
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v6 = (objc_class *)MEMORY[0x1E0C99E08];
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(v6);
  objc_msgSend(a1, "ak_proxiedAnisetteHeadersWithData:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addEntriesFromDictionary:", v10);
  objc_msgSend(a1, "ak_proxiedClientInfoHeadersWithDevice:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addEntriesFromDictionary:", v11);
  return v9;
}

+ (id)ak_proxiedAnisetteHeadersWithData:()AuthKit
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "machineID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "oneTimePassword");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%llu"), objc_msgSend(v3, "routingInfo"));
  v8 = (void *)v7;
  if (v5 && v6 && v7)
    goto LABEL_7;
  _AKLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    +[NSMutableURLRequest(AuthKit) ak_proxiedAnisetteHeadersWithData:].cold.1();

  if (v5)
LABEL_7:
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("X-Apple-I-Proxied-MD-M"));
  if (v6)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("X-Apple-I-Proxied-MD"));
  if (v8)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("X-Apple-I-Proxied-MD-RINFO"));

  return v4;
}

+ (id)ak_proxiedClientInfoHeadersWithDevice:()AuthKit
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "serverFriendlyDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "serverFriendlyDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("X-MMe-Proxied-Client-Info"));

  }
  objc_msgSend(v3, "uniqueDeviceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v3, "uniqueDeviceIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("X-Mme-Proxied-Device-Id"));

  }
  return v4;
}

- (uint64_t)ak_addShowWarranty
{
  return objc_msgSend(a1, "setValue:forHTTPHeaderField:", CFSTR("true"), CFSTR("X-Mme-Show-Warranty"));
}

- (void)ak_addDeviceModel
{
  void *v2;
  void *v3;
  id v4;

  +[AKDevice currentDevice](AKDevice, "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modelNumber");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v3 = v4;
  if (v4)
  {
    objc_msgSend(a1, "setValue:forHTTPHeaderField:", v4, CFSTR("X-MMe-Device-Model"));
    v3 = v4;
  }

}

- (uint64_t)ak_addCFUHeader:()AuthKit
{
  return objc_msgSend(a1, "setValue:forHTTPHeaderField:", a3, CFSTR("X-Apple-I-CFU-State"));
}

- (void)ak_addDeviceConfigurationModeHeader
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), +[AKDevice currentDeviceAuthenticationMode](AKDevice, "currentDeviceAuthenticationMode"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setValue:forHTTPHeaderField:", v2, CFSTR("X-Apple-I-Device-Configuration-Mode"));

}

- (void)ak_addDeviceConfigurationModeHeaderForAuthContext:()AuthKit
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), +[AKDevice currentDeviceAuthenticationModeForAuthContext:](AKDevice, "currentDeviceAuthenticationModeForAuthContext:"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setValue:forHTTPHeaderField:", v2, CFSTR("X-Apple-I-Device-Configuration-Mode"));

}

- (void)ak_addRequestUUIDHeader:()AuthKit
{
  if (a3)
    return (void *)objc_msgSend(a1, "setValue:forHTTPHeaderField:", a3, CFSTR("X-Apple-I-Request-UUID"));
  return a1;
}

- (uint64_t)ak_addExecutionModeHeader:()AuthKit
{
  void *v3;
  NSObject *v4;

  if (a3)
  {
    v3 = (void *)result;
    _AKLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[NSMutableURLRequest(AuthKit) ak_addExecutionModeHeader:].cold.1();

    return objc_msgSend(v3, "setValue:forHTTPHeaderField:", CFSTR("cli"), CFSTR("X-Apple-I-Exec-Mode"));
  }
  return result;
}

- (void)ak_addClientBundleIDHeader:()AuthKit
{
  if (a3)
    return (void *)objc_msgSend(a1, "setValue:forHTTPHeaderField:", a3, CFSTR("X-Apple-I-Client-Bundle-Id"));
  return a1;
}

- (void)ak_addProxiedBundleIDHeader:()AuthKit
{
  if (a3)
    return (void *)objc_msgSend(a1, "setValue:forHTTPHeaderField:", a3, CFSTR("X-Apple-I-Proxied-Bundle-Id"));
  return a1;
}

- (void)ak_addFidoRecoveryTokenHeader:()AuthKit
{
  if (a3)
    return (void *)objc_msgSend(a1, "setValue:forHTTPHeaderField:", a3, CFSTR("X-Apple-I-Fido-Recovery-Token"));
  return a1;
}

- (void)ak_addWalrusStatusHeader
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Got unknown Walrus status when setting header", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (uint64_t)ak_addWalrusDeviceRegionHeader
{
  return objc_msgSend(a1, "setValue:forHTTPHeaderField:", CFSTR("true"), CFSTR("X-Apple-I-Device-Region-Required"));
}

- (void)ak_addPrivateEmailDomainHeader:()AuthKit
{
  if (a3)
    return (void *)objc_msgSend(a1, "setValue:forHTTPHeaderField:", a3, CFSTR("X-Apple-I-Private-Email-Domain"));
  return a1;
}

- (void)ak_addPrivateEmailOriginHeader:()AuthKit
{
  if (a3)
    return (void *)objc_msgSend(a1, "setValue:forHTTPHeaderField:", a3, CFSTR("X-Apple-I-Private-Email-Origin"));
  return a1;
}

- (void)ak_addPrivateEmailAppBundleIdHeader:()AuthKit
{
  void *v4;
  id v5;

  if (a3)
  {
    objc_msgSend(a3, "dataUsingEncoding:", 4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setValue:forHTTPHeaderField:", v4, CFSTR("X-Apple-I-Private-Email-Client-Bundle"));

  }
}

- (void)ak_addPrivateEmailAppNameHeader:()AuthKit
{
  void *v4;
  id v5;

  if (a3)
  {
    objc_msgSend(a3, "dataUsingEncoding:", 4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setValue:forHTTPHeaderField:", v4, CFSTR("X-Apple-I-Private-Email-App-Name"));

  }
}

- (void)ak_addDeviceModeHeader
{
  void *v2;
  int v3;

  +[AKDevice currentDevice](AKDevice, "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInRestrictedSharingMode");

  if (v3)
    objc_msgSend(a1, "setValue:forHTTPHeaderField:", CFSTR("1"), CFSTR("X-Apple-I-Device-Mode"));
}

- (uint64_t)ak_addCustodianSyncActionHeader
{
  return objc_msgSend(a1, "setValue:forHTTPHeaderField:", CFSTR("true"), CFSTR("X-Apple-I-Recovery-Contact-Sync-Action"));
}

- (void)ak_addRequestContextHeader:()AuthKit
{
  if (a3)
    return (void *)objc_msgSend(a1, "setValue:forHTTPHeaderField:", a3, CFSTR("X-Apple-I-Request-Context"));
  return a1;
}

- (void)ak_addExperimentModeHeader
{
  OUTLINED_FUNCTION_4(&dword_19202F000, a2, a3, "AllowExperimentMode header state is %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (uint64_t)ak_addPasscodeAuthHeader
{
  return objc_msgSend(a1, "setValue:forHTTPHeaderField:", CFSTR("true"), CFSTR("X-Apple-I-Passcode-Auth"));
}

- (void)ak_addHeaderForSourceAltDSID:()AuthKit
{
  if (a3)
    return (void *)objc_msgSend(a1, "setValue:forHTTPHeaderField:", a3, CFSTR("X-Apple-I-Source-Alternate-Id"));
  return a1;
}

- (uint64_t)ak_addTelemetryDeviceSessionID:()AuthKit
{
  return objc_msgSend(a1, "setValue:forHTTPHeaderField:", a3, CFSTR("X-Apple-I-Device-Session-Id"));
}

- (uint64_t)ak_addTelemetryFlowID:()AuthKit
{
  return objc_msgSend(a1, "setValue:forHTTPHeaderField:", a3, CFSTR("X-Apple-I-Flow-Id"));
}

- (uint64_t)ak_addHeaderForDeviceManagementState:()AuthKit
{
  return objc_msgSend(a1, "setValue:forHTTPHeaderField:", a3, CFSTR("X-Apple-I-MDM-Device-Posture"));
}

- (uint64_t)ak_addHeaderForMDMOrganizationToken:()AuthKit
{
  return objc_msgSend(a1, "setValue:forHTTPHeaderField:", a3, CFSTR("X-Apple-I-MDM-Org-Token"));
}

- (void)ak_addHeaderForSecurityCode:()AuthKit
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setValue:forHTTPHeaderField:", v2, CFSTR("security-code"));

}

- (void)ak_addHeaderForDCRT:()AuthKit
{
  id v4;

  objc_msgSend(a3, "base64EncodedStringWithOptions:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setValue:forHTTPHeaderField:", v4, CFSTR("X-Apple-I-Dcrt"));

}

- (uint64_t)ak_addPreviousTransactionIdHeader:()AuthKit
{
  return objc_msgSend(a1, "setValue:forHTTPHeaderField:", a3, CFSTR("X-Apple-I-Previous-PTXID"));
}

- (void)ak_addServiceHeaderForServiceType:()AuthKit
{
  void *v4;
  void *v5;

  AKStringFromServiceType(a3, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(a1, "setValue:forHTTPHeaderField:", v4, CFSTR("X-Apple-I-Service-Type"));
    v4 = v5;
  }

}

- (void)ak_addProxiedAttestationHeaders:()AuthKit .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_19202F000, v0, v1, "Adding proxied attestation headers - %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)ak_setBodyWithParameters:()AuthKit .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Unable to serialize request parameters! Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)ak_setJSONBodyWithParameters:()AuthKit .cold.1(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_3_0(&dword_19202F000, a4, a3, "JSON Serialization exception: %@\nInvalid JSON input: %@", (uint8_t *)a3);

}

- (void)ak_addLoggedInServicesHeaderForServices:()AuthKit .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_19202F000, v0, v1, "Adding header with services: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)ak_addPhoneInformationHeaderWithValue:()AuthKit .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "Failed to attach Phone Information header", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

+ (void)ak_anisetteHeadersWithData:()AuthKit .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Encountered incomplete Anisette data! %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)ak_anisetteHeadersWithCompanionData:()AuthKit .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Encountered incomplete companion Anisette data! %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)ak_proxiedAnisetteHeadersWithData:()AuthKit .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Encountered incomplete Anisette data for proxied device! %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)ak_addExecutionModeHeader:()AuthKit .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Setting Execution mode header to CLI", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

@end
