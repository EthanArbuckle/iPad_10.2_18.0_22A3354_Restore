@implementation ASCredentialRequestIconGenerator

+ (id)headerIconForPresentationContext:(id)a3
{
  return (id)objc_msgSend(a1, "headerIconForPresentationContext:outIconStyle:", a3, 0);
}

+ (id)headerIconForPresentationContext:(id)a3 outIconStyle:(int64_t *)a4
{
  id v6;
  void *v7;

  if (a4)
    *a4 = 0;
  v6 = a3;
  +[ASViewServiceInterfaceUtilities headerIconSize](ASViewServiceInterfaceUtilities, "headerIconSize");
  objc_msgSend(a1, "_iconForPresentationContext:size:outIconStyle:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)iconForPasswordLoginChoice:(id)a3 presentationContext:(id)a4
{
  id v5;
  void *v6;

  v5 = a3;
  if (objc_msgSend(v5, "isExternal"))
    objc_msgSend(a1, "_providerIconForPasswordLoginChoice:", v5);
  else
    objc_msgSend(a1, "systemPasswordIcon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (UIImage)passwordManagerIcon
{
  void *v3;

  if (!objc_msgSend(MEMORY[0x24BE82CC8], "isPasswordManagerAppEnabledAndInstalled")
    || (objc_msgSend(a1, "iconForApplicationIdentifier:size:", *MEMORY[0x24BE82F68], 128.0, 128.0),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(a1, "_keychainIcon");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (UIImage *)v3;
}

+ (id)iconForPublicKeyCredentialLoginChoiceWithPresentationContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  objc_msgSend(v4, "proxiedIconData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "proxiedIconScale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 && v6)
  {
    objc_msgSend(v6, "doubleValue");
    v9 = v8;
    +[ASViewServiceInterfaceUtilities cellIconSize](ASViewServiceInterfaceUtilities, "cellIconSize");
    objc_msgSend(a1, "iconForData:scale:size:", v5, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "appIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v4, "appIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[ASViewServiceInterfaceUtilities cellIconSize](ASViewServiceInterfaceUtilities, "cellIconSize");
      objc_msgSend(a1, "iconForApplicationIdentifier:size:", v14);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

+ (UIImage)systemPasskeyIcon
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "_systemImageNamed:", CFSTR("person.badge.key.fill"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithAlignmentRectInsets:", *MEMORY[0x24BEBE158], *(double *)(MEMORY[0x24BEBE158] + 8), *(double *)(MEMORY[0x24BEBE158] + 16), *(double *)(MEMORY[0x24BEBE158] + 24));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

+ (UIImage)systemPasswordIcon
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("key.fill"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithAlignmentRectInsets:", *MEMORY[0x24BEBE158], *(double *)(MEMORY[0x24BEBE158] + 8), *(double *)(MEMORY[0x24BEBE158] + 16), *(double *)(MEMORY[0x24BEBE158] + 24));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

+ (UIImage)systemSecurityKeysIcon
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "_systemImageNamed:", CFSTR("security.key"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithAlignmentRectInsets:", *MEMORY[0x24BEBE158], *(double *)(MEMORY[0x24BEBE158] + 8), *(double *)(MEMORY[0x24BEBE158] + 16), *(double *)(MEMORY[0x24BEBE158] + 24));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

+ (UIImage)alternativeSecurityKeysIcon
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BEBD640];
  objc_msgSend(MEMORY[0x24BDD1488], "as_authenticationServicesBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageNamed:inBundle:", CFSTR("SecurityKeysIcon"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v4;
}

+ (id)_systemBiometricsIconForPresentationContext:(id)a3
{
  void *v3;
  id v5;
  const __CFString *v6;
  void *v7;

  v5 = a3;
  switch(objc_msgSend(MEMORY[0x24BE0B290], "biometryType"))
  {
    case 0:
      if ((objc_msgSend(v5, "hasPlatformCredentialRequest") & 1) != 0)
        objc_msgSend(a1, "systemPasskeyIcon");
      else
        objc_msgSend(a1, "passwordManagerIcon");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      v6 = CFSTR("touchid");
      goto LABEL_7;
    case 2:
      v6 = CFSTR("faceid");
      goto LABEL_7;
    case 4:
      v6 = CFSTR("opticid");
LABEL_7:
      objc_msgSend(a1, "_systemImageNamed:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "imageWithAlignmentRectInsets:", *MEMORY[0x24BEBE158], *(double *)(MEMORY[0x24BEBE158] + 8), *(double *)(MEMORY[0x24BEBE158] + 16), *(double *)(MEMORY[0x24BEBE158] + 24));
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      break;
  }

  return v3;
}

+ (id)iconForApplicationIdentifier:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v15;

  height = a4.height;
  width = a4.width;
  v15 = 0;
  objc_msgSend(MEMORY[0x24BDC1558], "bundleRecordWithApplicationIdentifier:error:", a3, &v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v15;
  if (v7)
  {
    v9 = objc_alloc(MEMORY[0x24BE51A90]);
    objc_msgSend(v7, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithBundleIdentifier:", v10);

    objc_msgSend(a1, "_imageForIcon:size:", v11, width, height);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[ASCredentialRequestIconGenerator iconForApplicationIdentifier:size:].cold.1(v13, v8);
    v12 = 0;
  }

  return v12;
}

+ (id)passwordManagerIconWithSize:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  void *v6;

  height = a3.height;
  width = a3.width;
  objc_msgSend(a1, "passwordManagerIcon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageByPreparingThumbnailOfSize:", width, height);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_iconForPresentationContext:(id)a3 size:(CGSize)a4 outIconStyle:(int64_t *)a5
{
  double height;
  double width;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  char isKindOfClass;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v36;

  height = a4.height;
  width = a4.width;
  v9 = a3;
  if (objc_msgSend(v9, "requestTypes") == 64)
    goto LABEL_2;
  if ((objc_msgSend(v9, "isCABLEAuthenticatorRequest") & 1) != 0)
    goto LABEL_6;
  objc_msgSend(v9, "appIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {

    goto LABEL_6;
  }
  objc_msgSend(v9, "proxiedIconData");
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = (void *)v20;
    objc_msgSend(v9, "proxiedIconScale");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
LABEL_6:
      objc_msgSend(v9, "proxiedIconData");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "proxiedIconScale");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v12 && v13)
      {
        if (a5)
          *a5 = 0;
        objc_msgSend(v13, "doubleValue");
        objc_msgSend(a1, "iconForData:scale:size:", v12);
        v15 = objc_claimAutoreleasedReturnValue();
        goto LABEL_34;
      }
      if (objc_msgSend(v9, "hasPlatformCredentialRequest"))
      {
        objc_msgSend(MEMORY[0x24BE82CF0], "sharedMonitor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isKeychainSyncEnabled");

        if (v17)
          v18 = objc_msgSend(v9, "iCloudKeychainPasskeyLoginChoiceCount");
        else
          v18 = 0;
        v23 = objc_msgSend(v9, "externalPasskeyLoginChoiceCount");
        v24 = v23;
        if (!v18)
        {
          if (v23)
          {
            objc_msgSend(v9, "loginChoices");
            v36 = v24;
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "firstObject");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();

            v24 = v36;
            if ((isKindOfClass & 1) != 0)
            {
              objc_msgSend(v9, "loginChoices");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "firstObject");
              v29 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v29, "externalCredentialProviderBundleID");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(a1, "iconForApplicationIdentifier:size:", v30, width, height);
              v10 = (void *)objc_claimAutoreleasedReturnValue();

              if (a5)
                *a5 = 0;

              goto LABEL_53;
            }
          }
        }
        if (((objc_msgSend(v9, "isRegistrationRequest") ^ 1 | v17) & 1) == 0
          && isUserVerificationConfigured())
        {
          if (a5)
            *a5 = 0;
          v19 = a1;
LABEL_33:
          objc_msgSend(v19, "passwordManagerIcon");
          v15 = objc_claimAutoreleasedReturnValue();
LABEL_34:
          v10 = (void *)v15;
LABEL_53:

          goto LABEL_54;
        }
        if (v18 && v24)
        {
          if (a5)
            *a5 = 2;
          objc_msgSend((id)objc_opt_class(), "systemPasskeyIcon");
          v31 = objc_claimAutoreleasedReturnValue();
LABEL_51:
          v32 = (void *)v31;
          objc_msgSend(MEMORY[0x24BEBD660], "configurationWithPointSize:", 50.0);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "imageWithSymbolConfiguration:", v34);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_52;
        }
        if (objc_msgSend(MEMORY[0x24BE0B290], "biometryType") != 1)
        {
          if (a5)
            *a5 = 2;
          objc_msgSend((id)objc_opt_class(), "_systemBiometricsIconForPresentationContext:", v9);
          v31 = objc_claimAutoreleasedReturnValue();
          goto LABEL_51;
        }
        if (a5)
          *a5 = 0;
        objc_msgSend((id)objc_opt_class(), "passwordManagerIcon");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "imageByPreparingThumbnailOfSize:", width, height);
        v33 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if ((objc_msgSend(v9, "requestTypes") & 2) == 0)
        {
          if (a5)
            *a5 = 0;
          v19 = (void *)objc_opt_class();
          goto LABEL_33;
        }
        if (a5)
          *a5 = 0;
        objc_msgSend(v9, "appIdentifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "iconForApplicationIdentifier:size:", v32, width, height);
        v33 = objc_claimAutoreleasedReturnValue();
      }
      v10 = (void *)v33;
LABEL_52:

      goto LABEL_53;
    }
  }
LABEL_2:
  v10 = 0;
LABEL_54:

  return v10;
}

+ (id)iconForData:(id)a3 scale:(double)a4 size:(CGSize)a5
{
  double height;
  id v7;
  uint64_t v8;
  double v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  _QWORD v21[2];

  height = a5.height;
  v21[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEBD640], "imageWithData:scale:", a3, a4, a5.width);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = objc_msgSend(v7, "CGImage");
  objc_msgSend(v7, "scale");
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51A60]), "initWithCGImage:scale:", v8, v9);
  v11 = objc_alloc(MEMORY[0x24BE51A90]);
  v21[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithImages:", v12);

  objc_msgSend(v7, "size");
  v14 = 1.0;
  if (v15 != 0.0)
  {
    objc_msgSend(v7, "size", 1.0);
    v17 = v16;
    objc_msgSend(v7, "size");
    v14 = v17 / v18;
  }
  objc_msgSend(a1, "_imageForIcon:size:", v13, height * v14, height);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)_imageForIcon:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  void *v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD v19[2];

  height = a4.height;
  width = a4.width;
  v19[1] = *MEMORY[0x24BDAC8D0];
  v6 = (void *)MEMORY[0x24BEBD8F8];
  v7 = a3;
  objc_msgSend(v6, "mainScreen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scale");
  v10 = v9;

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51AB0]), "initWithSize:scale:", width, height, v10);
  objc_msgSend(MEMORY[0x24BEBDAB0], "currentTraitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAppearance:", objc_msgSend(v12, "userInterfaceStyle") == 2);

  objc_msgSend(v11, "setShouldApplyMask:", 1);
  objc_msgSend(v11, "setShape:", 1);
  v19[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "prepareImagesForImageDescriptors:", v13);

  objc_msgSend(v7, "imageForImageDescriptor:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x24BEBD640];
  v16 = objc_msgSend(v14, "CGImage");
  objc_msgSend(v14, "scale");
  objc_msgSend(v15, "imageWithCGImage:scale:orientation:", v16, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)_providerIconForPasswordLoginChoice:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if ((objc_msgSend(v4, "isExternal") & 1) != 0)
  {
    objc_msgSend(v4, "providerBundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_iconForPasswordProviderBundleIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "_keychainIcon");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

+ (id)_keychainIcon
{
  return (id)objc_msgSend(MEMORY[0x24BEBD640], "as_imageNamed:", CFSTR("KeyIcon-60"));
}

+ (id)_iconForPasswordProviderBundleIdentifier:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v3 = (void *)MEMORY[0x24BEBD640];
  v4 = (void *)MEMORY[0x24BEBD8F8];
  v5 = a3;
  objc_msgSend(v4, "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  objc_msgSend(v3, "_applicationIconImageForBundleIdentifier:format:scale:", v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[ASCredentialRequestIconGenerator _iconForPasswordProviderBundleIdentifier:].cold.1(v8);
  }
  return v7;
}

+ (id)_systemImageNamed:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v7 = (void *)MEMORY[0x24BEBD640];
    objc_msgSend(MEMORY[0x24BDD1488], "as_authenticationServicesBundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageNamed:inBundle:", v3, v8);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

+ (void)iconForApplicationIdentifier:(void *)a1 size:(void *)a2 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_20E4D9000, v3, OS_LOG_TYPE_ERROR, "Could not get bundle record to get icon for credential with error: %{public}@.", (uint8_t *)&v5, 0xCu);

}

+ (void)_iconForPasswordProviderBundleIdentifier:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20E4D9000, log, OS_LOG_TYPE_ERROR, "Could not get icon for password provider", v1, 2u);
}

@end
