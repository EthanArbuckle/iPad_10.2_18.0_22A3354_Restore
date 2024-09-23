@implementation HFURLComponents

+ (id)homeKitObjectURLForDestination:(unint64_t)a3 secondaryDestination:(unint64_t)a4 UUID:(id)a5 queryItems:(id)a6
{
  id v11;
  id v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  v11 = a5;
  v12 = a6;
  if (a3)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HFURLComponents.m"), 693, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("primaryDestination != HFURLComponentsDestinationUnknown"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HFURLComponents.m"), 694, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uuid != nil"));

LABEL_3:
  objc_msgSend(a1, "_URLComponentsForDestination:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 - 1 > 2)
    v14 = CFSTR("quickControl");
  else
    v14 = off_1EA730848[a4 - 1];
  v15 = (void *)MEMORY[0x1E0CB3940];
  v23[0] = CFSTR("/");
  objc_msgSend(v11, "UUIDString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v16;
  v23[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "pathWithComponents:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPath:", v18);

  objc_msgSend(v13, "setQueryItems:", v12);
  objc_msgSend(v13, "URL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)homeKitObjectURLForDestination:(unint64_t)a3 secondaryDestination:(unint64_t)a4 UUID:(id)a5
{
  return (id)objc_msgSend(a1, "homeKitObjectURLForDestination:secondaryDestination:UUID:queryItems:", a3, a4, a5, 0);
}

+ (id)_URLComponentsForDestination:(unint64_t)a3
{
  id v4;
  const __CFString *v5;

  v4 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v4, "setScheme:", CFSTR("com.apple.Home"));
  v5 = CFSTR("invitation");
  switch(a3)
  {
    case 1uLL:
      goto LABEL_31;
    case 2uLL:
      v5 = CFSTR("home");
      goto LABEL_31;
    case 3uLL:
      v5 = CFSTR("room");
      goto LABEL_31;
    case 4uLL:
      v5 = CFSTR("accessory");
      goto LABEL_31;
    case 5uLL:
      v5 = CFSTR("mediaSystem");
      goto LABEL_31;
    case 6uLL:
      v5 = CFSTR("accessoryProfile");
      goto LABEL_31;
    case 7uLL:
      v5 = CFSTR("service");
      goto LABEL_31;
    case 8uLL:
      v5 = CFSTR("trigger");
      goto LABEL_31;
    case 9uLL:
      v5 = CFSTR("person");
      goto LABEL_31;
    case 0xAuLL:
      v5 = CFSTR("unknownPersonEvent");
      goto LABEL_31;
    case 0xBuLL:
      v5 = CFSTR("aboutResidentDevice");
      goto LABEL_31;
    case 0xCuLL:
      v5 = CFSTR("faceRecognitionSettings");
      goto LABEL_31;
    case 0xDuLL:
      v5 = CFSTR("networkRoutersSettings");
      goto LABEL_31;
    case 0xEuLL:
      v5 = CFSTR("firmwareUpdate");
      goto LABEL_31;
    case 0xFuLL:
      v5 = CFSTR("x-hm");
      goto LABEL_31;
    case 0x10uLL:
      v5 = CFSTR("reprovisionDevice");
      goto LABEL_31;
    case 0x11uLL:
      v5 = CFSTR("com.apple.Home.fixSymptom");
      goto LABEL_31;
    case 0x12uLL:
      objc_msgSend(v4, "setScheme:", CFSTR("com.apple.Home-private"));
      v5 = CFSTR("installhomepodprofile");
      goto LABEL_31;
    case 0x13uLL:
      objc_msgSend(v4, "setScheme:", CFSTR("com.apple.Home-private"));
      v5 = CFSTR("homepodSoftwareUpdate");
      goto LABEL_31;
    case 0x14uLL:
      objc_msgSend(v4, "setScheme:", CFSTR("com.apple.Home-private"));
      v5 = CFSTR("homeHubUpdate");
      goto LABEL_31;
    case 0x15uLL:
      v5 = CFSTR("bridgeSettings");
      goto LABEL_31;
    case 0x16uLL:
      objc_msgSend(v4, "setScheme:", CFSTR("com.apple.Home-private"));
      v5 = CFSTR("personalRequestOptIn");
      goto LABEL_31;
    case 0x17uLL:
      objc_msgSend(v4, "setScheme:", CFSTR("com.apple.Home.privacy"));
      v5 = CFSTR("recognizeMyVoiceOptIn");
      goto LABEL_31;
    case 0x18uLL:
      objc_msgSend(v4, "setScheme:", CFSTR("com.apple.Home-private"));
      v5 = CFSTR("userLockSettings");
      goto LABEL_31;
    case 0x19uLL:
      objc_msgSend(v4, "setScheme:", CFSTR("com.apple.Home-private"));
      v5 = CFSTR("locksOnboarding");
      goto LABEL_31;
    case 0x1AuLL:
      objc_msgSend(v4, "setScheme:", CFSTR("com.apple.Home-private"));
      v5 = CFSTR("locksFirmwareUpdateSetup");
      goto LABEL_31;
    case 0x1BuLL:
      objc_msgSend(v4, "setScheme:", CFSTR("com.apple.Home-private"));
      v5 = CFSTR("dropIn");
      goto LABEL_31;
    case 0x1CuLL:
      objc_msgSend(v4, "setScheme:", CFSTR("com.apple.Home-private"));
      v5 = CFSTR("mediaServiceDefaultAccountSettings");
      goto LABEL_31;
    case 0x1DuLL:
      objc_msgSend(v4, "setScheme:", CFSTR("com.apple.Home-private"));
      v5 = CFSTR("connectedServices");
      goto LABEL_31;
    case 0x1EuLL:
      objc_msgSend(v4, "setScheme:", CFSTR("com.apple.Home-private"));
      v5 = CFSTR("userDetails");
LABEL_31:
      objc_msgSend(v4, "setHost:", v5);
      break;
    default:
      return v4;
  }
  return v4;
}

+ (NSURL)aboutResidentDeviceURL
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v2, "setScheme:", CFSTR("com.apple.Home"));
  objc_msgSend(v2, "setHost:", CFSTR("aboutResidentDevice"));
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

+ (NSURL)personalRequestsOptInURL
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v2, "setScheme:", CFSTR("com.apple.Home-private"));
  objc_msgSend(v2, "setHost:", CFSTR("personalRequestOptIn"));
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

+ (NSURL)recognizeMyVoiceOptInURL
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v2, "setScheme:", CFSTR("com.apple.Home-private"));
  objc_msgSend(v2, "setHost:", CFSTR("recognizeMyVoiceOptIn"));
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

+ (NSURL)siriPrivacyURL
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v2, "setScheme:", CFSTR("com.apple.Home.privacy"));
  objc_msgSend(v2, "setHost:", CFSTR("privacySiri"));
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

+ (NSURL)musicPrivacyURL
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v2, "setScheme:", CFSTR("com.apple.Home.privacy"));
  objc_msgSend(v2, "setHost:", CFSTR("privacyMusic"));
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

+ (NSURL)locationPrivacyURL
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v2, "setScheme:", CFSTR("com.apple.Home.privacy"));
  objc_msgSend(v2, "setHost:", CFSTR("privacyLocation"));
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

+ (NSURL)musicLoginURL
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v2, "setScheme:", CFSTR("com.apple.Home.appleMusic"));
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

+ (NSURL)homeHub2OnboardingURL
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v2, "setScheme:", CFSTR("com.apple.Home-private"));
  objc_msgSend(v2, "setHost:", CFSTR("homeHubUpdate"));
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

+ (NSURLComponents)dropInURLComponents
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v2, "setScheme:", CFSTR("com.apple.Home-private"));
  objc_msgSend(v2, "setHost:", CFSTR("dropIn"));
  return (NSURLComponents *)v2;
}

+ (id)accessoryDetailsURLForAccessory:(id)a3 home:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(a3, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB39D8];
  objc_msgSend(v5, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "queryItemWithName:value:", CFSTR("HFURLComponentsHome"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFURLComponents homeKitObjectURLForDestination:secondaryDestination:UUID:queryItems:](HFURLComponents, "homeKitObjectURLForDestination:secondaryDestination:UUID:queryItems:", 4, 0, v6, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)serviceDetailsURLForService:(id)a3 home:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(a3, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB39D8];
  objc_msgSend(v5, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "queryItemWithName:value:", CFSTR("HFURLComponentsHome"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFURLComponents homeKitObjectURLForDestination:secondaryDestination:UUID:queryItems:](HFURLComponents, "homeKitObjectURLForDestination:secondaryDestination:UUID:queryItems:", 7, 0, v6, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)cameraProfileDetailsURLForCameraProfile:(id)a3 home:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(a3, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB39D8];
  objc_msgSend(v5, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "queryItemWithName:value:", CFSTR("HFURLComponentsHome"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFURLComponents homeKitObjectURLForDestination:secondaryDestination:UUID:queryItems:](HFURLComponents, "homeKitObjectURLForDestination:secondaryDestination:UUID:queryItems:", 6, 0, v6, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)bridgeSettingsURLForAccessory:(id)a3 home:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a3, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_settingsURLHostString:UUID:forHome:", CFSTR("bridgeSettings"), v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)networkRouterSettingsURLForHome:(id)a3
{
  return (id)objc_msgSend(a1, "_settingsURLHostString:forHome:", CFSTR("networkRoutersSettings"), a3);
}

+ (id)faceRecognitionSettingsURLForHome:(id)a3
{
  return (id)objc_msgSend(a1, "_settingsURLHostString:forHome:", CFSTR("faceRecognitionSettings"), a3);
}

+ (id)userLockSettingsURLForHome:(id)a3
{
  return (id)objc_msgSend(a1, "_privateSettingsURLHostString:UUID:forHome:", CFSTR("userLockSettings"), 0, a3);
}

+ (id)locksOnboardingURLForHome:(id)a3
{
  return (id)objc_msgSend(a1, "_privateSettingsURLHostString:UUID:forHome:", CFSTR("userLockSettings"), 0, a3);
}

+ (id)connectedServicesURLForAccessory:(id)a3 home:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(a3, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB39D8];
  objc_msgSend(v5, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "queryItemWithName:value:", CFSTR("HFURLComponentsHome"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFURLComponents homeKitObjectURLForDestination:secondaryDestination:UUID:queryItems:](HFURLComponents, "homeKitObjectURLForDestination:secondaryDestination:UUID:queryItems:", 29, 3, v6, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)personalRequestsOptInURLForHomeID:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v4, "setScheme:", CFSTR("com.apple.Home-private"));
  objc_msgSend(v4, "setHost:", CFSTR("personalRequestOptIn"));
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("homeId"), v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setQueryItems:", v6);

  }
  objc_msgSend(v4, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)roomURLForRoom:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[HFURLComponents _URLComponentsForDestination:](HFURLComponents, "_URLComponentsForDestination:", 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3940];
  v12[0] = CFSTR("/");
  objc_msgSend(v3, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathWithComponents:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPath:", v9);

  objc_msgSend(v4, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)_settingsURLHostString:(id)a3 forHome:(id)a4
{
  return (id)objc_msgSend(a1, "_settingsURLHostString:UUID:forHome:", a3, 0, a4);
}

+ (id)_settingsURLHostString:(id)a3 UUID:(id)a4 forHome:(id)a5
{
  return (id)objc_msgSend(a1, "_settingsURLHostString:scheme:UUID:forHome:", a3, CFSTR("com.apple.Home"), a4, a5);
}

+ (id)_privateSettingsURLHostString:(id)a3 UUID:(id)a4 forHome:(id)a5
{
  return (id)objc_msgSend(a1, "_settingsURLHostString:scheme:UUID:forHome:", a3, CFSTR("com.apple.Home-private"), a4, a5);
}

+ (id)_settingsURLHostString:(id)a3 scheme:(id)a4 UUID:(id)a5 forHome:(id)a6
{
  id v9;
  id v10;
  objc_class *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = a6;
  v11 = (objc_class *)MEMORY[0x1E0CB3998];
  v12 = a4;
  v13 = a3;
  v14 = objc_alloc_init(v11);
  objc_msgSend(v14, "setScheme:", v12);

  objc_msgSend(v14, "setHost:", v13);
  if (v9)
  {
    v15 = (void *)MEMORY[0x1E0CB3940];
    v27[0] = CFSTR("/");
    objc_msgSend(v9, "UUIDString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "pathWithComponents:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPath:", v18);

  }
  v19 = (void *)MEMORY[0x1E0CB39D8];
  objc_msgSend(v10, "uniqueIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "UUIDString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "queryItemWithName:value:", CFSTR("HFURLComponentsHome"), v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setQueryItems:", v23);

  objc_msgSend(v14, "URL");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

+ (id)fixSymptomURLForAccessory:(id)a3 symptom:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a3, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fixSymptomURLForAccessoryWithUUID:symptom:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)fixSymptomURLForAccessoryWithUUID:(id)a3 symptom:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setScheme:", CFSTR("com.apple.Home.fixSymptom"));
  objc_msgSend(v6, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(CFSTR("/"), "stringByAppendingPathComponent:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPath:", v9);

  objc_msgSend(v7, "setHost:", CFSTR("symptomHandler"));
  v10 = (void *)MEMORY[0x1E0CB39D8];
  v11 = objc_msgSend(v5, "type");

  NSStringFromHMSymptomType(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "queryItemWithName:value:", CFSTR("fixSymptom"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setQueryItems:", v14);

  objc_msgSend(v7, "URL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (NSURL)aboutImproveSiriAndDictationURL
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v2, "setScheme:", CFSTR("com.apple.Home.privacy"));
  objc_msgSend(v2, "setHost:", CFSTR("aboutImproveSiriAndDictation"));
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

+ (id)symptomFromURL:(id)a3 accessory:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[5];

  v5 = (objc_class *)MEMORY[0x1E0CB3998];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithURL:resolvingAgainstBaseURL:", v7, 0);

  objc_msgSend(v8, "queryItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "na_firstObjectPassingTest:", &__block_literal_global_69);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "value");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = NSStringToHMSymptomType(v11);

  objc_msgSend(v6, "symptomsHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "symptoms");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __44__HFURLComponents_symptomFromURL_accessory___block_invoke_2;
  v17[3] = &__block_descriptor_40_e19_B16__0__HMSymptom_8l;
  v17[4] = v12;
  objc_msgSend(v14, "na_firstObjectPassingTest:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

uint64_t __44__HFURLComponents_symptomFromURL_accessory___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("fixSymptom"));

  return v3;
}

BOOL __44__HFURLComponents_symptomFromURL_accessory___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == *(_QWORD *)(a1 + 32);
}

+ (BOOL)isHomeAppURL:(id)a3
{
  id v3;
  id v4;
  id v5;
  char v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  if (_MergedGlobals_243 != -1)
    dispatch_once(&_MergedGlobals_243, &__block_literal_global_82_1);
  v4 = (id)qword_1ED379000;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __32__HFURLComponents_isHomeAppURL___block_invoke_3;
  v8[3] = &unk_1EA726EA8;
  v9 = v3;
  v5 = v3;
  v6 = objc_msgSend(v4, "na_any:", v8);

  return v6;
}

void __32__HFURLComponents_isHomeAppURL___block_invoke_2()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[7];

  v4[6] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("com.apple.Home");
  v4[1] = CFSTR("com.apple.Home-private");
  v4[2] = CFSTR("X-HM");
  v4[3] = CFSTR("com.apple.Home.privacy");
  v4[4] = CFSTR("com.apple.Home.appleMusic");
  v4[5] = CFSTR("com.apple.Home.fixSymptom");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 6);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED379000;
  qword_1ED379000 = v2;

}

BOOL __32__HFURLComponents_isHomeAppURL___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "scheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "caseInsensitiveCompare:", v4);

  return v5 == 0;
}

- (HFURLComponents)initWithURL:(id)a3
{
  id v4;
  void *v5;
  HFURLComponents *v6;

  v4 = a3;
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HFURLComponents initWithURL:homeKitDispatcher:](self, "initWithURL:homeKitDispatcher:", v4, v5);

  return v6;
}

- (HFURLComponents)initWithURL:(id)a3 homeKitDispatcher:(id)a4
{
  id v7;
  id v8;
  HFURLComponents *v9;
  HFURLComponents *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFURLComponents;
  v9 = -[HFURLComponents init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_URL, a3);
    objc_storeStrong((id *)&v10->_homeKitDispatcher, a4);
  }

  return v10;
}

- (unint64_t)destination
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  char v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  uint64_t v95;
  void *v96;
  void *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  uint64_t v101;
  void *v102;
  void *v103;
  uint64_t v104;
  void *v105;
  void *v106;
  uint64_t v107;

  -[HFURLComponents URL](self, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    goto LABEL_5;
  -[HFURLComponents URL](self, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "caseInsensitiveCompare:", CFSTR("X-HM"));

  if (!v7)
    return 15;
  -[HFURLComponents URL](self, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scheme");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "caseInsensitiveCompare:", CFSTR("com.apple.Home.fixSymptom"));

  if (!v10)
    return 17;
  -[HFURLComponents URL](self, "URL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "scheme");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "caseInsensitiveCompare:", CFSTR("com.apple.Home-private"));

  if (v13)
    goto LABEL_5;
  -[HFURLComponents URL](self, "URL");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "host");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v72, "caseInsensitiveCompare:", CFSTR("installhomepodprofile")))
  {

    return 18;
  }
  -[HFURLComponents URL](self, "URL");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "host");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "uppercaseString");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("installhomepodprofile&"), "uppercaseString");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = objc_msgSend(v75, "hasPrefix:", v76);

  if ((v77 & 1) != 0)
    return 18;
  -[HFURLComponents URL](self, "URL");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "host");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = objc_msgSend(v79, "caseInsensitiveCompare:", CFSTR("homepodSoftwareUpdate"));

  if (!v80)
    return 19;
  -[HFURLComponents URL](self, "URL");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "host");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = objc_msgSend(v82, "caseInsensitiveCompare:", CFSTR("addAccessory"));

  if (!v83)
    return 15;
  -[HFURLComponents URL](self, "URL");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "host");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = objc_msgSend(v85, "caseInsensitiveCompare:", CFSTR("userLockSettings"));

  if (!v86)
    return 24;
  -[HFURLComponents URL](self, "URL");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "host");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = objc_msgSend(v88, "caseInsensitiveCompare:", CFSTR("locksOnboarding"));

  if (!v89)
    return 25;
  -[HFURLComponents URL](self, "URL");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "host");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = objc_msgSend(v91, "caseInsensitiveCompare:", CFSTR("locksFirmwareUpdateSetup"));

  if (!v92)
    return 26;
  -[HFURLComponents URL](self, "URL");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "host");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = objc_msgSend(v94, "caseInsensitiveCompare:", CFSTR("homeHubUpdate"));

  if (!v95)
    return 20;
  -[HFURLComponents URL](self, "URL");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "host");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = objc_msgSend(v97, "caseInsensitiveCompare:", CFSTR("dropIn"));

  if (!v98)
    return 27;
  -[HFURLComponents URL](self, "URL");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "host");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = objc_msgSend(v100, "caseInsensitiveCompare:", CFSTR("mediaServiceDefaultAccountSettings"));

  if (!v101)
    return 28;
  -[HFURLComponents URL](self, "URL");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "host");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = objc_msgSend(v103, "caseInsensitiveCompare:", CFSTR("connectedServices"));

  if (!v104)
    return 29;
  -[HFURLComponents URL](self, "URL");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "host");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = objc_msgSend(v106, "caseInsensitiveCompare:", CFSTR("userDetails"));

  if (!v107)
    return 30;
LABEL_5:
  -[HFURLComponents URL](self, "URL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "host");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
    return 0;
  -[HFURLComponents URL](self, "URL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "host");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "caseInsensitiveCompare:", CFSTR("invitation"));

  if (!v18)
    return 1;
  -[HFURLComponents URL](self, "URL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "host");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "caseInsensitiveCompare:", CFSTR("home"));

  if (!v21)
    return 2;
  -[HFURLComponents URL](self, "URL");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "host");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "caseInsensitiveCompare:", CFSTR("room"));

  if (!v24)
    return 3;
  -[HFURLComponents URL](self, "URL");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "host");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "caseInsensitiveCompare:", CFSTR("accessory"));

  if (!v27)
    return 4;
  -[HFURLComponents URL](self, "URL");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "host");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "caseInsensitiveCompare:", CFSTR("mediaSystem"));

  if (!v30)
    return 5;
  -[HFURLComponents URL](self, "URL");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "host");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "caseInsensitiveCompare:", CFSTR("accessoryProfile"));

  if (!v33)
    return 6;
  -[HFURLComponents URL](self, "URL");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "host");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "caseInsensitiveCompare:", CFSTR("service"));

  if (!v36)
    return 7;
  -[HFURLComponents URL](self, "URL");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "host");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "caseInsensitiveCompare:", CFSTR("trigger"));

  if (!v39)
    return 8;
  -[HFURLComponents URL](self, "URL");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "host");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "caseInsensitiveCompare:", CFSTR("person"));

  if (!v42)
    return 9;
  -[HFURLComponents URL](self, "URL");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "host");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "caseInsensitiveCompare:", CFSTR("unknownPersonEvent"));

  if (!v45)
    return 10;
  -[HFURLComponents URL](self, "URL");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "host");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "caseInsensitiveCompare:", CFSTR("aboutResidentDevice"));

  if (!v48)
    return 11;
  -[HFURLComponents URL](self, "URL");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "host");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v50, "caseInsensitiveCompare:", CFSTR("faceRecognitionSettings"));

  if (!v51)
    return 12;
  -[HFURLComponents URL](self, "URL");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "host");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v53, "caseInsensitiveCompare:", CFSTR("networkRoutersSettings"));

  if (!v54)
    return 13;
  -[HFURLComponents URL](self, "URL");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "host");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v56, "caseInsensitiveCompare:", CFSTR("bridgeSettings"));

  if (!v57)
    return 21;
  -[HFURLComponents URL](self, "URL");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "host");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend(v59, "caseInsensitiveCompare:", CFSTR("firmwareUpdate"));

  if (!v60)
    return 14;
  -[HFURLComponents URL](self, "URL");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "host");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(v62, "caseInsensitiveCompare:", CFSTR("reprovisionDevice"));

  if (!v63)
    return 16;
  -[HFURLComponents URL](self, "URL");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "host");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend(v65, "caseInsensitiveCompare:", CFSTR("personalRequestOptIn"));

  if (!v66)
    return 22;
  -[HFURLComponents URL](self, "URL");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "host");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = objc_msgSend(v68, "caseInsensitiveCompare:", CFSTR("recognizeMyVoiceOptIn"));

  if (v69)
    return 0;
  return 23;
}

- (unint64_t)secondaryDestination
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  char v7;
  unint64_t v8;
  void *v9;
  char v10;

  -[HFURLComponents URL](self, "URL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v3, "count") < 3)
    goto LABEL_6;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("quickControl"));

  if ((v5 & 1) != 0)
    goto LABEL_6;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("detailsAction"));

  if ((v7 & 1) == 0)
  {
    v8 = 2;
    objc_msgSend(v3, "objectAtIndexedSubscript:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("alternateAction"));

    if ((v10 & 1) != 0)
      goto LABEL_7;
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  v8 = 1;
LABEL_7:

  return v8;
}

- (NAFuture)homeKitObjectFuture
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  -[HFURLComponents homeKitDispatcher](self, "homeKitDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allHomesFuture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__HFURLComponents_homeKitObjectFuture__block_invoke;
  v7[3] = &unk_1EA72A438;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v4, "flatMap:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
  return (NAFuture *)v5;
}

id __38__HFURLComponents_homeKitObjectFuture__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v60;
  void *v61;
  id v62;
  _QWORD v63[5];
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint64_t v72;
  void *v73;
  _BYTE v74[128];
  _BYTE v75[128];
  _QWORD v76[4];

  v76[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "homeKitDispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "homeManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(WeakRetained, "valueForParameter:", CFSTR("HFURLComponentsHome"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithUUIDString:", v8);
  objc_msgSend(v6, "hf_homeWithIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(WeakRetained, "destination");
  if (v11 == 10)
  {
    if (v10)
    {
      v13 = v10;
    }
    else
    {
      +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "home");
      v13 = (id)objc_claimAutoreleasedReturnValue();

    }
    v27 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(WeakRetained, "valueForParameter:", CFSTR("HFURLComponentsCameraProfile"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v27, "initWithUUIDString:", v28);
    objc_msgSend(v13, "hf_cameraProfileWithIdentifier:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "_homeKitIdentifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "hf_significantEventWithIdentifier:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = v11;
    if (v11 == 9)
    {
      if (v10)
      {
        v13 = v10;
      }
      else
      {
        +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "home");
        v13 = (id)objc_claimAutoreleasedReturnValue();

      }
      v20 = objc_alloc(MEMORY[0x1E0CB3A28]);
      objc_msgSend(WeakRetained, "valueForParameter:", CFSTR("HFURLComponentsPersonManager"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v20, "initWithUUIDString:", v21);
      objc_msgSend(v13, "hf_personManagerWithIdentifier:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v23)
      {
        v25 = v23;
      }
      else
      {
        objc_msgSend(v13, "personManager");
        v25 = (id)objc_claimAutoreleasedReturnValue();
      }
      v33 = v25;

      objc_msgSend(WeakRetained, "_homeKitIdentifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "hf_personWithIdentifier:", v34);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_53:
      goto LABEL_54;
    }
    v13 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    if (v12 == 27)
    {
      if (v10)
      {
        v33 = v10;
      }
      else
      {
        +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "home");
        v33 = (id)objc_claimAutoreleasedReturnValue();

      }
      v55 = objc_alloc(MEMORY[0x1E0CB3A28]);
      objc_msgSend(WeakRetained, "valueForParameter:", CFSTR("accessoryId"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = (void *)objc_msgSend(v55, "initWithUUIDString:", v56);
      objc_msgSend(v33, "hf_accessoryWithIdentifier:", v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v58);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_53;
    }
    v61 = v10;
    v14 = v12 - 1;
    if (v12 == 1)
    {
      objc_msgSend(WeakRetained, "homeKitDispatcher");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "homeManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "incomingHomeInvitations");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObjectsFromArray:", v17);

    }
    v60 = WeakRetained;
    if (v10)
    {
      v76[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v18 = v3;
    }
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v3 = v18;
    v35 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v68, v75, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v69;
      v62 = v3;
      do
      {
        for (i = 0; i != v36; ++i)
        {
          if (*(_QWORD *)v69 != v37)
            objc_enumerationMutation(v3);
          v39 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
          switch(v14)
          {
            case 0:
              objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * i), "outgoingInvitations");
              v40 = objc_claimAutoreleasedReturnValue();
              goto LABEL_44;
            case 1:
            case 13:
            case 18:
            case 19:
            case 23:
            case 24:
            case 25:
            case 27:
              objc_msgSend(v13, "addObject:", v39);
              continue;
            case 2:
              objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * i), "hf_allRooms");
              v40 = objc_claimAutoreleasedReturnValue();
              goto LABEL_44;
            case 3:
            case 16:
            case 28:
              objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * i), "accessories");
              v40 = objc_claimAutoreleasedReturnValue();
              goto LABEL_44;
            case 4:
              objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * i), "mediaSystems");
              v40 = objc_claimAutoreleasedReturnValue();
              goto LABEL_44;
            case 5:
              v66 = 0u;
              v67 = 0u;
              v64 = 0u;
              v65 = 0u;
              objc_msgSend(v39, "accessories");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v64, v74, 16);
              if (v42)
              {
                v43 = v42;
                v44 = *(_QWORD *)v65;
                do
                {
                  for (j = 0; j != v43; ++j)
                  {
                    if (*(_QWORD *)v65 != v44)
                      objc_enumerationMutation(v41);
                    objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * j), "cameraProfiles", v60);
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v13, "addObjectsFromArray:", v46);

                  }
                  v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v64, v74, 16);
                }
                while (v43);
              }

              v3 = v62;
              continue;
            case 6:
              objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * i), "hf_allServices");
              v40 = objc_claimAutoreleasedReturnValue();
              goto LABEL_44;
            case 7:
              objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * i), "triggers");
              v40 = objc_claimAutoreleasedReturnValue();
              goto LABEL_44;
            case 20:
              objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * i), "hf_allBridgeAccessories");
              v40 = objc_claimAutoreleasedReturnValue();
LABEL_44:
              v47 = (void *)v40;
              objc_msgSend(v13, "addObjectsFromArray:", v40, v60);

              break;
            default:
              continue;
          }
        }
        v36 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v68, v75, 16);
      }
      while (v36);
    }

    v63[0] = MEMORY[0x1E0C809B0];
    v63[1] = 3221225472;
    v63[2] = __38__HFURLComponents_homeKitObjectFuture__block_invoke_2;
    v63[3] = &unk_1EA72E198;
    WeakRetained = v60;
    v63[4] = v60;
    objc_msgSend(v13, "na_firstObjectPassingTest:", v63);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (v48)
    {
      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v48);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v49 = (void *)MEMORY[0x1E0CB35C8];
      v50 = *MEMORY[0x1E0CB32E8];
      v72 = *MEMORY[0x1E0CB32F0];
      objc_msgSend(v60, "URL");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = v51;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "errorWithDomain:code:userInfo:", v50, -1000, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithError:", v53);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v10 = v61;
  }
LABEL_54:

  return v32;
}

uint64_t __38__HFURLComponents_homeKitObjectFuture__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_homeKitIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFURLComponents URL](self, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("url"));

  v6 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[HFURLComponents destination](self, "destination"), CFSTR("destination"));
  v7 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[HFURLComponents secondaryDestination](self, "secondaryDestination"), CFSTR("secondaryDestination"));
  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)valueForParameter:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = (void *)MEMORY[0x1E0CB3998];
    -[HFURLComponents URL](self, "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "absoluteString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsWithString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "queryItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __37__HFURLComponents_valueForParameter___block_invoke;
    v14[3] = &unk_1EA730828;
    v15 = v4;
    objc_msgSend(v9, "na_firstObjectPassingTest:", v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "value");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    HFLogForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "-[HFURLComponents valueForParameter:]";
      _os_log_debug_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_DEBUG, "(%s) parameter.length = 0", buf, 0xCu);
    }

    v11 = 0;
  }

  return v11;
}

uint64_t __37__HFURLComponents_valueForParameter___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)dateForParameter:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[HFURLComponents valueForParameter:](self, "valueForParameter:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HFURLComponents isoDateFormatter](self, "isoDateFormatter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dateFromString:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSISO8601DateFormatter)isoDateFormatter
{
  NSISO8601DateFormatter *isoDateFormatter;
  NSISO8601DateFormatter **p_isoDateFormatter;
  NSISO8601DateFormatter *v4;

  p_isoDateFormatter = &self->_isoDateFormatter;
  isoDateFormatter = self->_isoDateFormatter;
  if (isoDateFormatter)
  {
    v4 = isoDateFormatter;
  }
  else
  {
    v4 = (NSISO8601DateFormatter *)objc_alloc_init(MEMORY[0x1E0CB36A8]);
    -[NSISO8601DateFormatter setFormatOptions:](v4, "setFormatOptions:", 3955);
    objc_storeStrong((id *)p_isoDateFormatter, v4);
  }
  return v4;
}

- (id)_homeKitIdentifier
{
  void *v3;
  void *v4;
  unint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[HFURLComponents URL](self, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 < 2)
  {
    v10 = 0;
  }
  else
  {
    v6 = objc_alloc(MEMORY[0x1E0CB3A28]);
    -[HFURLComponents URL](self, "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pathComponents");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v6, "initWithUUIDString:", v9);

  }
  return v10;
}

- (NSURL)URL
{
  return self->_URL;
}

- (HFHomeKitDispatcher)homeKitDispatcher
{
  return self->_homeKitDispatcher;
}

- (void)setIsoDateFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_isoDateFormatter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isoDateFormatter, 0);
  objc_storeStrong((id *)&self->_homeKitDispatcher, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end
