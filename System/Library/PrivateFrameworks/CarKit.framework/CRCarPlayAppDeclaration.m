@implementation CRCarPlayAppDeclaration

+ (id)requiredInfoKeys
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("SBStarkLaunchModes"));
}

+ (id)requiredEntitlementKeys
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("CARCapableApp"), CFSTR("SBStarkCapable"), CFSTR("com.apple.developer.playable-content"), CFSTR("com.apple.developer.carplay-messaging"), CFSTR("com.apple.developer.carplay-calling"), CFSTR("com.apple.developer.carplay-protocols"), CFSTR("com.apple.developer.carplay-maps"), CFSTR("com.apple.developer.carplay-audio"), CFSTR("com.apple.developer.carplay-communication"), CFSTR("com.apple.developer.carplay-charging"), CFSTR("com.apple.developer.carplay-parking"), CFSTR("com.apple.developer.carplay-quick-ordering"), CFSTR("com.apple.developer.carplay-public-safety"), CFSTR("com.apple.developer.carplay-fueling"), CFSTR("com.apple.developer.carplay-driving-task"), 0);
}

+ (id)declarationForBundleIdentifier:(id)a3 info:(id)a4 entitlements:(id)a5
{
  return (id)objc_msgSend(a1, "declarationForBundleIdentifier:info:entitlements:bundlePath:", a3, a4, a5, 0);
}

+ (id)declarationForAppProxy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "requiredInfoKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectsForInfoDictionaryKeys:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "requiredEntitlementKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entitlementValuesForKeys:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "declarationForBundleIdentifier:infoPropertyList:entitlementsPropertyList:bundlePath:", v5, v7, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)declarationForBundleIdentifier:(id)a3 infoPropertyList:(id)a4 entitlementsPropertyList:(id)a5 bundlePath:(id)a6
{
  id v9;
  id v10;
  id v11;
  CRCarPlayAppDeclaration *v12;
  CRCarPlayAppDeclaration *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  CRCarPlayAppDeclaration *v21;
  CRCarPlayAppDeclaration *v22;
  CRCarPlayAppDeclaration *v23;
  CRCarPlayAppDeclaration *v24;
  CRCarPlayAppDeclaration *v25;
  CRCarPlayAppDeclaration *v26;
  CRCarPlayAppDeclaration *v27;
  CRCarPlayAppDeclaration *v28;
  CRCarPlayAppDeclaration *v29;
  void *v30;
  void *v31;
  CRCarPlayAppDeclaration *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  CRCarPlayAppDeclaration *v40;
  void *v42;
  id v43;
  id v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v45 = a3;
  v9 = a4;
  v10 = a5;
  v11 = a6;
  if ((objc_msgSend(v10, "BOOLForKey:", CFSTR("CARCapableApp")) & 1) != 0
    || objc_msgSend(v10, "BOOLForKey:", CFSTR("SBStarkCapable")))
  {
    v12 = objc_alloc_init(CRCarPlayAppDeclaration);
    -[CRCarPlayAppDeclaration setBundleIdentifier:](v12, "setBundleIdentifier:", v45);
    v13 = v12;
    -[CRCarPlayAppDeclaration setSystemApp:](v13, "setSystemApp:", 1);

    objc_msgSend(v9, "objectForKey:ofClass:", CFSTR("SBStarkLaunchModes"), objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v43 = v9;
        v42 = v14;
        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        v15 = v14;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
        if (!v16)
          goto LABEL_22;
        v17 = v16;
        v18 = *(_QWORD *)v51;
        while (1)
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v51 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              if (objc_msgSend(v20, "isEqualToString:", CFSTR("Siri")))
              {
                if (!v13)
                {
                  v13 = objc_alloc_init(CRCarPlayAppDeclaration);
                  -[CRCarPlayAppDeclaration setBundleIdentifier:](v13, "setBundleIdentifier:", v45);
                }
                v13 = v13;
                -[CRCarPlayAppDeclaration setLaunchUsingSiri:](v13, "setLaunchUsingSiri:", 1);
              }
              else
              {
                if (!objc_msgSend(v20, "isEqualToString:", CFSTR("GeoSupported")))
                  continue;
                if (!v13)
                {
                  v13 = objc_alloc_init(CRCarPlayAppDeclaration);
                  -[CRCarPlayAppDeclaration setBundleIdentifier:](v13, "setBundleIdentifier:", v45);
                }
                v13 = v13;
                -[CRCarPlayAppDeclaration setRequiresGeoSupport:](v13, "setRequiresGeoSupport:", 1);
              }

            }
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
          if (!v17)
          {
LABEL_22:

            v9 = v43;
            v14 = v42;
            break;
          }
        }
      }
    }

    if ((objc_msgSend(v10, "BOOLForKey:", CFSTR("com.apple.developer.playable-content")) & 1) == 0)
    {
LABEL_29:
      if ((objc_msgSend(v10, "BOOLForKey:", CFSTR("com.apple.developer.carplay-messaging")) & 1) == 0)
        goto LABEL_35;
      if (v13)
      {
LABEL_34:
        v13 = v13;
        -[CRCarPlayAppDeclaration setSupportsMessaging:](v13, "setSupportsMessaging:", 1);

LABEL_35:
        if ((objc_msgSend(v10, "BOOLForKey:", CFSTR("com.apple.developer.carplay-calling")) & 1) == 0)
          goto LABEL_39;
        if (v13)
        {
LABEL_38:
          v13 = v13;
          -[CRCarPlayAppDeclaration setSupportsCalling:](v13, "setSupportsCalling:", 1);

LABEL_39:
          if ((objc_msgSend(v10, "BOOLForKey:", CFSTR("com.apple.developer.carplay-maps")) & 1) == 0)
            goto LABEL_45;
          if (v13)
          {
LABEL_42:
            v21 = v13;
            -[CRCarPlayAppDeclaration setSupportsMaps:](v21, "setSupportsMaps:", 1);

            if (!v21)
            {
              v21 = objc_alloc_init(CRCarPlayAppDeclaration);
              -[CRCarPlayAppDeclaration setBundleIdentifier:](v21, "setBundleIdentifier:", v45);
            }
            v13 = v21;
            -[CRCarPlayAppDeclaration setSupportsTemplates:](v13, "setSupportsTemplates:", 1);

LABEL_45:
            if ((objc_msgSend(v10, "BOOLForKey:", CFSTR("com.apple.developer.carplay-audio")) & 1) == 0)
              goto LABEL_51;
            if (v13)
            {
LABEL_48:
              v22 = v13;
              -[CRCarPlayAppDeclaration setSupportsAudio:](v22, "setSupportsAudio:", 1);

              if (!v22)
              {
                v22 = objc_alloc_init(CRCarPlayAppDeclaration);
                -[CRCarPlayAppDeclaration setBundleIdentifier:](v22, "setBundleIdentifier:", v45);
              }
              v13 = v22;
              -[CRCarPlayAppDeclaration setSupportsTemplates:](v13, "setSupportsTemplates:", 1);

LABEL_51:
              if ((objc_msgSend(v10, "BOOLForKey:", CFSTR("com.apple.developer.carplay-communication")) & 1) == 0)
                goto LABEL_57;
              if (v13)
              {
LABEL_54:
                v23 = v13;
                -[CRCarPlayAppDeclaration setSupportsCommunication:](v23, "setSupportsCommunication:", 1);

                if (!v23)
                {
                  v23 = objc_alloc_init(CRCarPlayAppDeclaration);
                  -[CRCarPlayAppDeclaration setBundleIdentifier:](v23, "setBundleIdentifier:", v45);
                }
                v13 = v23;
                -[CRCarPlayAppDeclaration setSupportsTemplates:](v13, "setSupportsTemplates:", 1);

LABEL_57:
                if ((objc_msgSend(v10, "BOOLForKey:", CFSTR("com.apple.developer.carplay-charging")) & 1) == 0)
                  goto LABEL_63;
                if (v13)
                {
LABEL_60:
                  v24 = v13;
                  -[CRCarPlayAppDeclaration setSupportsCharging:](v24, "setSupportsCharging:", 1);

                  if (!v24)
                  {
                    v24 = objc_alloc_init(CRCarPlayAppDeclaration);
                    -[CRCarPlayAppDeclaration setBundleIdentifier:](v24, "setBundleIdentifier:", v45);
                  }
                  v13 = v24;
                  -[CRCarPlayAppDeclaration setSupportsTemplates:](v13, "setSupportsTemplates:", 1);

LABEL_63:
                  if ((objc_msgSend(v10, "BOOLForKey:", CFSTR("com.apple.developer.carplay-parking")) & 1) == 0)
                    goto LABEL_69;
                  if (v13)
                  {
LABEL_66:
                    v25 = v13;
                    -[CRCarPlayAppDeclaration setSupportsParking:](v25, "setSupportsParking:", 1);

                    if (!v25)
                    {
                      v25 = objc_alloc_init(CRCarPlayAppDeclaration);
                      -[CRCarPlayAppDeclaration setBundleIdentifier:](v25, "setBundleIdentifier:", v45);
                    }
                    v13 = v25;
                    -[CRCarPlayAppDeclaration setSupportsTemplates:](v13, "setSupportsTemplates:", 1);

LABEL_69:
                    if ((objc_msgSend(v10, "BOOLForKey:", CFSTR("com.apple.developer.carplay-quick-ordering")) & 1) == 0)
                      goto LABEL_75;
                    if (v13)
                    {
LABEL_72:
                      v26 = v13;
                      -[CRCarPlayAppDeclaration setSupportsQuickOrdering:](v26, "setSupportsQuickOrdering:", 1);

                      if (!v26)
                      {
                        v26 = objc_alloc_init(CRCarPlayAppDeclaration);
                        -[CRCarPlayAppDeclaration setBundleIdentifier:](v26, "setBundleIdentifier:", v45);
                      }
                      v13 = v26;
                      -[CRCarPlayAppDeclaration setSupportsTemplates:](v13, "setSupportsTemplates:", 1);

LABEL_75:
                      if ((objc_msgSend(v10, "BOOLForKey:", CFSTR("com.apple.developer.carplay-public-safety")) & 1) == 0)
                        goto LABEL_81;
                      if (v13)
                      {
LABEL_78:
                        v27 = v13;
                        -[CRCarPlayAppDeclaration setSupportsPublicSafety:](v27, "setSupportsPublicSafety:", 1);

                        if (!v27)
                        {
                          v27 = objc_alloc_init(CRCarPlayAppDeclaration);
                          -[CRCarPlayAppDeclaration setBundleIdentifier:](v27, "setBundleIdentifier:", v45);
                        }
                        v13 = v27;
                        -[CRCarPlayAppDeclaration setSupportsTemplates:](v13, "setSupportsTemplates:", 1);

LABEL_81:
                        if ((objc_msgSend(v10, "BOOLForKey:", CFSTR("com.apple.developer.carplay-fueling")) & 1) == 0)
                          goto LABEL_87;
                        if (v13)
                        {
LABEL_84:
                          v28 = v13;
                          -[CRCarPlayAppDeclaration setSupportsFueling:](v28, "setSupportsFueling:", 1);

                          if (!v28)
                          {
                            v28 = objc_alloc_init(CRCarPlayAppDeclaration);
                            -[CRCarPlayAppDeclaration setBundleIdentifier:](v28, "setBundleIdentifier:", v45);
                          }
                          v13 = v28;
                          -[CRCarPlayAppDeclaration setSupportsTemplates:](v13, "setSupportsTemplates:", 1);

LABEL_87:
                          if ((objc_msgSend(v10, "BOOLForKey:", CFSTR("com.apple.developer.carplay-driving-task")) & 1) == 0)
                            goto LABEL_93;
                          if (v13)
                            goto LABEL_90;
                          goto LABEL_89;
                        }
LABEL_83:
                        v13 = objc_alloc_init(CRCarPlayAppDeclaration);
                        -[CRCarPlayAppDeclaration setBundleIdentifier:](v13, "setBundleIdentifier:", v45);
                        goto LABEL_84;
                      }
LABEL_77:
                      v13 = objc_alloc_init(CRCarPlayAppDeclaration);
                      -[CRCarPlayAppDeclaration setBundleIdentifier:](v13, "setBundleIdentifier:", v45);
                      goto LABEL_78;
                    }
LABEL_71:
                    v13 = objc_alloc_init(CRCarPlayAppDeclaration);
                    -[CRCarPlayAppDeclaration setBundleIdentifier:](v13, "setBundleIdentifier:", v45);
                    goto LABEL_72;
                  }
LABEL_65:
                  v13 = objc_alloc_init(CRCarPlayAppDeclaration);
                  -[CRCarPlayAppDeclaration setBundleIdentifier:](v13, "setBundleIdentifier:", v45);
                  goto LABEL_66;
                }
LABEL_59:
                v13 = objc_alloc_init(CRCarPlayAppDeclaration);
                -[CRCarPlayAppDeclaration setBundleIdentifier:](v13, "setBundleIdentifier:", v45);
                goto LABEL_60;
              }
LABEL_53:
              v13 = objc_alloc_init(CRCarPlayAppDeclaration);
              -[CRCarPlayAppDeclaration setBundleIdentifier:](v13, "setBundleIdentifier:", v45);
              goto LABEL_54;
            }
LABEL_47:
            v13 = objc_alloc_init(CRCarPlayAppDeclaration);
            -[CRCarPlayAppDeclaration setBundleIdentifier:](v13, "setBundleIdentifier:", v45);
            goto LABEL_48;
          }
LABEL_41:
          v13 = objc_alloc_init(CRCarPlayAppDeclaration);
          -[CRCarPlayAppDeclaration setBundleIdentifier:](v13, "setBundleIdentifier:", v45);
          goto LABEL_42;
        }
LABEL_37:
        v13 = objc_alloc_init(CRCarPlayAppDeclaration);
        -[CRCarPlayAppDeclaration setBundleIdentifier:](v13, "setBundleIdentifier:", v45);
        goto LABEL_38;
      }
LABEL_33:
      v13 = objc_alloc_init(CRCarPlayAppDeclaration);
      -[CRCarPlayAppDeclaration setBundleIdentifier:](v13, "setBundleIdentifier:", v45);
      goto LABEL_34;
    }
    if (v13)
    {
LABEL_28:
      v13 = v13;
      -[CRCarPlayAppDeclaration setSupportsPlayableContent:](v13, "setSupportsPlayableContent:", 1);

      goto LABEL_29;
    }
LABEL_27:
    v13 = objc_alloc_init(CRCarPlayAppDeclaration);
    -[CRCarPlayAppDeclaration setBundleIdentifier:](v13, "setBundleIdentifier:", v45);
    goto LABEL_28;
  }
  if ((objc_msgSend(v10, "BOOLForKey:", CFSTR("com.apple.developer.playable-content")) & 1) != 0)
    goto LABEL_27;
  if ((objc_msgSend(v10, "BOOLForKey:", CFSTR("com.apple.developer.carplay-messaging")) & 1) != 0)
    goto LABEL_33;
  if ((objc_msgSend(v10, "BOOLForKey:", CFSTR("com.apple.developer.carplay-calling")) & 1) != 0)
    goto LABEL_37;
  if ((objc_msgSend(v10, "BOOLForKey:", CFSTR("com.apple.developer.carplay-maps")) & 1) != 0)
    goto LABEL_41;
  if ((objc_msgSend(v10, "BOOLForKey:", CFSTR("com.apple.developer.carplay-audio")) & 1) != 0)
    goto LABEL_47;
  if ((objc_msgSend(v10, "BOOLForKey:", CFSTR("com.apple.developer.carplay-communication")) & 1) != 0)
    goto LABEL_53;
  if ((objc_msgSend(v10, "BOOLForKey:", CFSTR("com.apple.developer.carplay-charging")) & 1) != 0)
    goto LABEL_59;
  if ((objc_msgSend(v10, "BOOLForKey:", CFSTR("com.apple.developer.carplay-parking")) & 1) != 0)
    goto LABEL_65;
  if ((objc_msgSend(v10, "BOOLForKey:", CFSTR("com.apple.developer.carplay-quick-ordering")) & 1) != 0)
    goto LABEL_71;
  if ((objc_msgSend(v10, "BOOLForKey:", CFSTR("com.apple.developer.carplay-public-safety")) & 1) != 0)
    goto LABEL_77;
  if ((objc_msgSend(v10, "BOOLForKey:", CFSTR("com.apple.developer.carplay-fueling")) & 1) != 0)
    goto LABEL_83;
  if ((objc_msgSend(v10, "BOOLForKey:", CFSTR("com.apple.developer.carplay-driving-task")) & 1) == 0)
  {
    v13 = 0;
    goto LABEL_93;
  }
LABEL_89:
  v13 = objc_alloc_init(CRCarPlayAppDeclaration);
  -[CRCarPlayAppDeclaration setBundleIdentifier:](v13, "setBundleIdentifier:", v45);
LABEL_90:
  v29 = v13;
  -[CRCarPlayAppDeclaration setSupportsDrivingTask:](v29, "setSupportsDrivingTask:", 1);

  if (!v29)
  {
    v29 = objc_alloc_init(CRCarPlayAppDeclaration);
    -[CRCarPlayAppDeclaration setBundleIdentifier:](v29, "setBundleIdentifier:", v45);
  }
  v13 = v29;
  -[CRCarPlayAppDeclaration setSupportsTemplates:](v13, "setSupportsTemplates:", 1);

LABEL_93:
  objc_msgSend(v10, "objectForKey:ofClass:", CFSTR("com.apple.developer.carplay-protocols"), objc_opt_class());
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (v30)
  {
    v44 = v11;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v32 = v30;
    v33 = -[CRCarPlayAppDeclaration countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v47;
      while (2)
      {
        for (j = 0; j != v34; ++j)
        {
          if (*(_QWORD *)v47 != v35)
            objc_enumerationMutation(v32);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v38 = 0;
            goto LABEL_106;
          }
        }
        v34 = -[CRCarPlayAppDeclaration countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
        if (v34)
          continue;
        break;
      }
    }

    if (!v13)
    {
      v13 = objc_alloc_init(CRCarPlayAppDeclaration);
      -[CRCarPlayAppDeclaration setBundleIdentifier:](v13, "setBundleIdentifier:", v45);
    }
    v13 = v13;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v32);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRCarPlayAppDeclaration setAutoMakerProtocols:](v13, "setAutoMakerProtocols:", v37);

    v38 = 32;
    v32 = v13;
LABEL_106:
    v11 = v44;

  }
  else
  {
    v38 = 0;
  }
  if (objc_msgSend(v45, "isEqualToString:", CFSTR("com.apple.Maps")))
    v38 |= 8uLL;
  if (objc_msgSend(v45, "isEqualToString:", CFSTR("com.apple.mobilecal")))
    v38 |= 0x400uLL;
  if ((objc_msgSend(v45, "isEqualToString:", CFSTR("com.apple.Music")) & 1) != 0
    || (objc_msgSend(v45, "isEqualToString:", CFSTR("com.apple.iBooks")) & 1) != 0
    || (objc_msgSend(v45, "isEqualToString:", CFSTR("com.apple.podcasts")) & 1) != 0
    || (objc_msgSend(v10, "BOOLForKey:", CFSTR("com.apple.developer.playable-content")) & 1) != 0
    || objc_msgSend(v10, "BOOLForKey:", CFSTR("com.apple.developer.carplay-audio")))
  {
    v38 |= 0x10uLL;
  }
  if ((objc_msgSend(v10, "BOOLForKey:", CFSTR("com.apple.developer.carplay-calling")) & 1) != 0
    || objc_msgSend(v45, "isEqualToString:", CFSTR("com.apple.mobilephone")))
  {
    v38 |= 4uLL;
  }
  if ((objc_msgSend(v10, "BOOLForKey:", CFSTR("com.apple.developer.carplay-messaging")) & 1) != 0
    || objc_msgSend(v45, "isEqualToString:", CFSTR("com.apple.MobileSMS")))
  {
    v38 |= 2uLL;
  }
  if (objc_msgSend(v10, "BOOLForKey:", CFSTR("com.apple.developer.carplay-communication")))
    v38 |= 6uLL;
  if (objc_msgSend(v10, "BOOLForKey:", CFSTR("com.apple.developer.carplay-charging")))
    v38 |= 0x100uLL;
  if (objc_msgSend(v10, "BOOLForKey:", CFSTR("com.apple.developer.carplay-parking")))
    v38 |= 0x200uLL;
  if (objc_msgSend(v10, "BOOLForKey:", CFSTR("com.apple.developer.carplay-quick-ordering")))
    v38 |= 0x80uLL;
  if (objc_msgSend(v10, "BOOLForKey:", CFSTR("com.apple.developer.carplay-fueling")))
    v38 |= 0x800uLL;
  if (objc_msgSend(v10, "BOOLForKey:", CFSTR("com.apple.developer.carplay-driving-task")))
    v39 = v38 | 0x1000;
  else
    v39 = v38;
  if (v39)
  {
    if (!v13)
    {
      v13 = objc_alloc_init(CRCarPlayAppDeclaration);
      -[CRCarPlayAppDeclaration setBundleIdentifier:](v13, "setBundleIdentifier:", v45);
    }
    v13 = v13;
    -[CRCarPlayAppDeclaration set_applicationCategory:](v13, "set_applicationCategory:", v39);

  }
  if (v13)
    -[CRCarPlayAppDeclaration setBundlePath:](v13, "setBundlePath:", v11);
  v40 = v13;

  return v40;
}

+ (id)declarationForBundleIdentifier:(id)a3 infoPropertyList:(id)a4 entitlementsPropertyList:(id)a5
{
  return (id)objc_msgSend(a1, "declarationForBundleIdentifier:infoPropertyList:entitlementsPropertyList:bundlePath:", a3, a4, a5, 0);
}

+ (id)declarationForAppRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "infoDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entitlements");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "declarationForBundleIdentifier:infoPropertyList:entitlementsPropertyList:", v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)declarationForBundleIdentifier:(id)a3 entitlements:(id)a4 infoPlist:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;

  v8 = (objc_class *)MEMORY[0x1E0CA5888];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = [v8 alloc];
  objc_msgSend(a1, "requiredInfoKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "_initWithKeys:forDictionary:", v13, v9);

  v15 = objc_alloc(MEMORY[0x1E0CA5888]);
  objc_msgSend(a1, "requiredEntitlementKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "_initWithKeys:forDictionary:", v16, v10);

  objc_msgSend(a1, "declarationForBundleIdentifier:info:entitlements:", v11, v14, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isSystemApp
{
  return self->_systemApp;
}

- (void)setSystemApp:(BOOL)a3
{
  self->_systemApp = a3;
}

- (BOOL)requiresGeoSupport
{
  return self->_requiresGeoSupport;
}

- (void)setRequiresGeoSupport:(BOOL)a3
{
  self->_requiresGeoSupport = a3;
}

- (BOOL)launchUsingSiri
{
  return self->_launchUsingSiri;
}

- (void)setLaunchUsingSiri:(BOOL)a3
{
  self->_launchUsingSiri = a3;
}

- (BOOL)launchNotificationsUsingSiri
{
  return self->_launchNotificationsUsingSiri;
}

- (void)setLaunchNotificationsUsingSiri:(BOOL)a3
{
  self->_launchNotificationsUsingSiri = a3;
}

- (BOOL)supportsPlayableContent
{
  return self->_supportsPlayableContent;
}

- (void)setSupportsPlayableContent:(BOOL)a3
{
  self->_supportsPlayableContent = a3;
}

- (BOOL)supportsMessaging
{
  return self->_supportsMessaging;
}

- (void)setSupportsMessaging:(BOOL)a3
{
  self->_supportsMessaging = a3;
}

- (BOOL)supportsCalling
{
  return self->_supportsCalling;
}

- (void)setSupportsCalling:(BOOL)a3
{
  self->_supportsCalling = a3;
}

- (BOOL)supportsMaps
{
  return self->_supportsMaps;
}

- (void)setSupportsMaps:(BOOL)a3
{
  self->_supportsMaps = a3;
}

- (BOOL)supportsAudio
{
  return self->_supportsAudio;
}

- (void)setSupportsAudio:(BOOL)a3
{
  self->_supportsAudio = a3;
}

- (BOOL)supportsCommunication
{
  return self->_supportsCommunication;
}

- (void)setSupportsCommunication:(BOOL)a3
{
  self->_supportsCommunication = a3;
}

- (BOOL)supportsTemplates
{
  return self->_supportsTemplates;
}

- (void)setSupportsTemplates:(BOOL)a3
{
  self->_supportsTemplates = a3;
}

- (BOOL)supportsCharging
{
  return self->_supportsCharging;
}

- (void)setSupportsCharging:(BOOL)a3
{
  self->_supportsCharging = a3;
}

- (BOOL)supportsParking
{
  return self->_supportsParking;
}

- (void)setSupportsParking:(BOOL)a3
{
  self->_supportsParking = a3;
}

- (BOOL)supportsPublicSafety
{
  return self->_supportsPublicSafety;
}

- (void)setSupportsPublicSafety:(BOOL)a3
{
  self->_supportsPublicSafety = a3;
}

- (BOOL)supportsQuickOrdering
{
  return self->_supportsQuickOrdering;
}

- (void)setSupportsQuickOrdering:(BOOL)a3
{
  self->_supportsQuickOrdering = a3;
}

- (BOOL)supportsFueling
{
  return self->_supportsFueling;
}

- (void)setSupportsFueling:(BOOL)a3
{
  self->_supportsFueling = a3;
}

- (BOOL)supportsDrivingTask
{
  return self->_supportsDrivingTask;
}

- (void)setSupportsDrivingTask:(BOOL)a3
{
  self->_supportsDrivingTask = a3;
}

- (NSSet)autoMakerProtocols
{
  return self->_autoMakerProtocols;
}

- (void)setAutoMakerProtocols:(id)a3
{
  objc_storeStrong((id *)&self->_autoMakerProtocols, a3);
}

- (unint64_t)_applicationCategory
{
  return self->__applicationCategory;
}

- (void)set_applicationCategory:(unint64_t)a3
{
  self->__applicationCategory = a3;
}

- (NSString)bundlePath
{
  return self->_bundlePath;
}

- (void)setBundlePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundlePath, 0);
  objc_storeStrong((id *)&self->_autoMakerProtocols, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
