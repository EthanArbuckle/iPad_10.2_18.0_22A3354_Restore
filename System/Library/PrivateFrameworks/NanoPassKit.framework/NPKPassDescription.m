@implementation NPKPassDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)isCachingEnabled
{
  if (__InitializeCachingIfNecessary_onceToken != -1)
    dispatch_once(&__InitializeCachingIfNecessary_onceToken, &__block_literal_global_5);
  return __IsCachingEnabled;
}

+ (void)setCachingEnabled:(BOOL)a3
{
  if (__InitializeCachingIfNecessary_onceToken != -1)
    dispatch_once(&__InitializeCachingIfNecessary_onceToken, &__block_literal_global_5);
  __IsCachingEnabled = a3;
}

- (NPKPassDescription)initWithPass:(id)a3
{
  return -[NPKPassDescription initWithPass:lazyLoadEncodedImages:](self, "initWithPass:lazyLoadEncodedImages:", a3, 0);
}

- (NPKPassDescription)initWithPass:(id)a3 lazyLoadEncodedImages:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NPKPassDescription *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  objc_super v41;

  v4 = a4;
  v6 = a3;
  v41.receiver = self;
  v41.super_class = (Class)NPKPassDescription;
  v7 = -[NPKPassDescription init](&v41, sel_init);
  if (v7)
  {
    objc_msgSend(v6, "paymentPass");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPassDescription setLazyLoadEncodedImages:](v7, "setLazyLoadEncodedImages:", v4);
    objc_msgSend(v6, "uniqueID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPassDescription setUniqueID:](v7, "setUniqueID:", v9);

    objc_msgSend(v6, "passTypeIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPassDescription setPassTypeIdentifier:](v7, "setPassTypeIdentifier:", v10);

    objc_msgSend(v6, "npkCompleteHash");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPassDescription setManifestHash:](v7, "setManifestHash:", v11);

    -[NPKPassDescription setStyle:](v7, "setStyle:", objc_msgSend(v6, "style"));
    objc_msgSend(v6, "relevantDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPassDescription setRelevantDate:](v7, "setRelevantDate:", v12);

    objc_msgSend(v6, "logoText");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPassDescription setLogoText:](v7, "setLogoText:", v13);

    objc_msgSend(v6, "logoImage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPassDescription setLogoImage:](v7, "setLogoImage:", v14);

    objc_msgSend(v6, "displayProfile");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "backgroundColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPassDescription setBackgroundColor:](v7, "setBackgroundColor:", v16);

    objc_msgSend(v6, "displayProfile");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "foregroundColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPassDescription setForegroundColor:](v7, "setForegroundColor:", v18);

    objc_msgSend(v6, "displayProfile");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "labelColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPassDescription setLabelColor:](v7, "setLabelColor:", v20);

    objc_msgSend(v6, "ingestedDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPassDescription setIngestionDate:](v7, "setIngestionDate:", v21);

    objc_msgSend(v8, "devicePaymentApplications");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPassDescription setDevicePaymentApplications:](v7, "setDevicePaymentApplications:", v22);

    objc_msgSend(v8, "devicePrimaryPaymentApplication");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPassDescription setDevicePrimaryPaymentApplication:](v7, "setDevicePrimaryPaymentApplication:", v23);

    objc_msgSend(v8, "devicePrimaryContactlessPaymentApplication");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPassDescription setDevicePrimaryContactlessPaymentApplication:](v7, "setDevicePrimaryContactlessPaymentApplication:", v24);

    objc_msgSend(v8, "devicePrimaryInAppPaymentApplication");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPassDescription setDevicePrimaryInAppPaymentApplication:](v7, "setDevicePrimaryInAppPaymentApplication:", v25);

    -[NPKPassDescription setPrivateLabel:](v7, "setPrivateLabel:", objc_msgSend(v8, "isPrivateLabel"));
    -[NPKPassDescription setCobranded:](v7, "setCobranded:", objc_msgSend(v8, "isCobranded"));
    -[NPKPassDescription setDeletePending:](v7, "setDeletePending:", 0);
    objc_msgSend(v6, "backgroundImage");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      if (objc_msgSend(v6, "style") == 2)
      {
        v27 = (void *)MEMORY[0x24BE6EB68];
        objc_msgSend(v6, "backgroundImage");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "size");
        objc_msgSend(v27, "constraintsWithFixedSize:");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "backgroundImage");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "blurredImageWithRadius:constraints:", 27, v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[NPKPassDescription setBackgroundImage:](v7, "setBackgroundImage:", v31);

      }
      else
      {
        objc_msgSend(v6, "backgroundImage");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[NPKPassDescription setBackgroundImage:](v7, "setBackgroundImage:", v29);
      }

    }
    objc_msgSend(v6, "localizedDescription");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPassDescription setLocalizedDescription:](v7, "setLocalizedDescription:", v32);

    objc_msgSend(v6, "nfcPayload");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPassDescription setNfcPayload:](v7, "setNfcPayload:", v33);

    objc_msgSend(v6, "npkCompleteHash");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPassDescription setCompleteHash:](v7, "setCompleteHash:", v34);

    -[NPKPassDescription setHasStoredValue:](v7, "setHasStoredValue:", objc_msgSend(v6, "hasStoredValue"));
    -[NPKPassDescription setSettings:](v7, "setSettings:", objc_msgSend(v6, "settings"));
    objc_msgSend(v8, "issuerCountryCode");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPassDescription setIssuerCountryCode:](v7, "setIssuerCountryCode:", v35);

    objc_msgSend(v8, "availableActions");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPassDescription setAvailableActions:](v7, "setAvailableActions:", v36);

    objc_msgSend(v6, "organizationName");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPassDescription setOrganizationName:](v7, "setOrganizationName:", v37);

    -[NPKPassDescription setExpressPassTypesMask:](v7, "setExpressPassTypesMask:", NPKPassDescriptionExpressTypesMaskWithPass(v6));
    -[NPKPassDescription setHasAssociatedPeerPaymentAccount:](v7, "setHasAssociatedPeerPaymentAccount:", objc_msgSend(v8, "hasAssociatedPeerPaymentAccount"));
    objc_msgSend(v8, "devicePrimaryPaymentApplication");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "subcredentials");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPassDescription setSubcredentials:](v7, "setSubcredentials:", v39);

  }
  return v7;
}

- (NPKPassDescription)initWithCoder:(id)a3
{
  id v4;
  NPKPassDescription *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  objc_super v54;

  v4 = a3;
  v54.receiver = self;
  v54.super_class = (Class)NPKPassDescription;
  v5 = -[NPKPassDescription init](&v54, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uniqueID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPassDescription setUniqueID:](v5, "setUniqueID:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("groupID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPassDescription setGroupID:](v5, "setGroupID:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passTypeIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPassDescription setPassTypeIdentifier:](v5, "setPassTypeIdentifier:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("manifestHash"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPassDescription setManifestHash:](v5, "setManifestHash:", v9);

    -[NPKPassDescription setStyle:](v5, "setStyle:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("style")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("relevantDate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPassDescription setRelevantDate:](v5, "setRelevantDate:", v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ingestionDate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPassDescription setIngestionDate:](v5, "setIngestionDate:", v11);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("logoText"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPassDescription setLogoText:](v5, "setLogoText:", v12);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("backgroundColor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPassDescription setBackgroundColor:](v5, "setBackgroundColor:", v13);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("foregroundColor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPassDescription setForegroundColor:](v5, "setForegroundColor:", v14);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("labelColor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPassDescription setLabelColor:](v5, "setLabelColor:", v15);

    v16 = (void *)MEMORY[0x24BDBCF20];
    v17 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("devicePaymentApplications"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPassDescription setDevicePaymentApplications:](v5, "setDevicePaymentApplications:", v19);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("devicePrimaryPaymentApplication"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPassDescription setDevicePrimaryPaymentApplication:](v5, "setDevicePrimaryPaymentApplication:", v20);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("devicePrimaryContactlessPaymentApplication"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPassDescription setDevicePrimaryContactlessPaymentApplication:](v5, "setDevicePrimaryContactlessPaymentApplication:", v21);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("devicePrimaryInAppPaymentApplication"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPassDescription setDevicePrimaryInAppPaymentApplication:](v5, "setDevicePrimaryInAppPaymentApplication:", v22);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("preferredPaymentApplication"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPassDescription setPreferredPaymentApplication:](v5, "setPreferredPaymentApplication:", v23);

    -[NPKPassDescription setEffectivePaymentApplicationState:](v5, "setEffectivePaymentApplicationState:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("effectivePaymentApplicationState")));
    -[NPKPassDescription setPrivateLabel:](v5, "setPrivateLabel:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("privateLabel")));
    -[NPKPassDescription setCobranded:](v5, "setCobranded:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("cobranded")));
    -[NPKPassDescription setDeletePending:](v5, "setDeletePending:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("deletePending")));
    -[NPKPassDescription setHasUserSelectableContactlessPaymentApplications:](v5, "setHasUserSelectableContactlessPaymentApplications:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasUserSelectablePaymentApplications")));
    -[NPKPassDescription logoImage](v5, "logoImage");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v24)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("logoImageEncoded"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPKPassDescription setLogoImageEncoded:](v5, "setLogoImageEncoded:", v25);

    }
    -[NPKPassDescription backgroundImage](v5, "backgroundImage");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v26)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("backgroundImageEncoded"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPKPassDescription setBackgroundImageEncoded:](v5, "setBackgroundImageEncoded:", v27);

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedDescription"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPassDescription setLocalizedDescription:](v5, "setLocalizedDescription:", v28);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nfcPayload"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPassDescription setNfcPayload:](v5, "setNfcPayload:", v29);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("completeHash"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPassDescription setCompleteHash:](v5, "setCompleteHash:", v30);

    -[NPKPassDescription setHasStoredValue:](v5, "setHasStoredValue:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasStoredValue")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("settings"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (v31)
    {
      v33 = objc_msgSend(v31, "unsignedIntegerValue");
    }
    else if (-[NPKPassDescription style](v5, "style") == 6)
    {
      v33 = 72;
    }
    else
    {
      v33 = 3;
    }
    -[NPKPassDescription setSettings:](v5, "setSettings:", v33);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("issuerCountryCode"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPassDescription setIssuerCountryCode:](v5, "setIssuerCountryCode:", v34);

    v35 = (void *)MEMORY[0x24BDBCF20];
    v36 = objc_opt_class();
    objc_msgSend(v35, "setWithObjects:", v36, objc_opt_class(), 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v37, CFSTR("availableActions"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPassDescription setAvailableActions:](v5, "setAvailableActions:", v38);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("organizationName"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPassDescription setOrganizationName:](v5, "setOrganizationName:", v39);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("felicaTransitAppletState"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPassDescription setTransitAppletState:](v5, "setTransitAppletState:", v40);

    v41 = (void *)MEMORY[0x24BDBCF20];
    v42 = objc_opt_class();
    objc_msgSend(v41, "setWithObjects:", v42, objc_opt_class(), 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v43, CFSTR("frontFieldBuckets"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPassDescription setFrontFieldBuckets:](v5, "setFrontFieldBuckets:", v44);

    v45 = (void *)MEMORY[0x24BDBCF20];
    v46 = objc_opt_class();
    objc_msgSend(v45, "setWithObjects:", v46, objc_opt_class(), 0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v47, CFSTR("backFieldBuckets"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPassDescription setBackFieldBuckets:](v5, "setBackFieldBuckets:", v48);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastAddValueAmount"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPassDescription setLastAddValueAmount:](v5, "setLastAddValueAmount:", v49);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pendingAddValueDate"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPassDescription setPendingAddValueDate:](v5, "setPendingAddValueDate:", v50);

    -[NPKPassDescription setExpressPassTypesMask:](v5, "setExpressPassTypesMask:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("expressPassTypesMask")));
    -[NPKPassDescription setHasAssociatedPeerPaymentAccount:](v5, "setHasAssociatedPeerPaymentAccount:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasAssociatedPeerPaymentAccount")));
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v51, CFSTR("subcredentials"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPassDescription setSubcredentials:](v5, "setSubcredentials:", v52);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
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
  void *v13;
  void *v14;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;

  v4 = a3;
  -[NPKPassDescription uniqueID](self, "uniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("uniqueID"));

  -[NPKPassDescription groupID](self, "groupID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("groupID"));

  -[NPKPassDescription passTypeIdentifier](self, "passTypeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("passTypeIdentifier"));

  -[NPKPassDescription manifestHash](self, "manifestHash");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("manifestHash"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[NPKPassDescription style](self, "style"), CFSTR("style"));
  -[NPKPassDescription relevantDate](self, "relevantDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("relevantDate"));

  -[NPKPassDescription ingestionDate](self, "ingestionDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("ingestionDate"));

  -[NPKPassDescription logoText](self, "logoText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("logoText"));

  -[NPKPassDescription backgroundColor](self, "backgroundColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("backgroundColor"));

  -[NPKPassDescription foregroundColor](self, "foregroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("foregroundColor"));

  -[NPKPassDescription labelColor](self, "labelColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("labelColor"));

  -[NPKPassDescription devicePaymentApplications](self, "devicePaymentApplications");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("devicePaymentApplications"));

  -[NPKPassDescription devicePrimaryPaymentApplication](self, "devicePrimaryPaymentApplication");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("devicePrimaryPaymentApplication"));

  -[NPKPassDescription devicePrimaryContactlessPaymentApplication](self, "devicePrimaryContactlessPaymentApplication");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("devicePrimaryContactlessPaymentApplication"));

  -[NPKPassDescription devicePrimaryInAppPaymentApplication](self, "devicePrimaryInAppPaymentApplication");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("devicePrimaryInAppPaymentApplication"));

  -[NPKPassDescription preferredPaymentApplication](self, "preferredPaymentApplication");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v19, CFSTR("preferredPaymentApplication"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[NPKPassDescription effectivePaymentApplicationState](self, "effectivePaymentApplicationState"), CFSTR("effectivePaymentApplicationState"));
  objc_msgSend(v4, "encodeBool:forKey:", -[NPKPassDescription isPrivateLabel](self, "isPrivateLabel"), CFSTR("privateLabel"));
  objc_msgSend(v4, "encodeBool:forKey:", -[NPKPassDescription isCobranded](self, "isCobranded"), CFSTR("cobranded"));
  objc_msgSend(v4, "encodeBool:forKey:", -[NPKPassDescription deletePending](self, "deletePending"), CFSTR("deletePending"));
  objc_msgSend(v4, "encodeBool:forKey:", -[NPKPassDescription hasUserSelectableContactlessPaymentApplications](self, "hasUserSelectableContactlessPaymentApplications"), CFSTR("hasUserSelectablePaymentApplications"));
  -[NPKPassDescription logoImageEncoded](self, "logoImageEncoded");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v20, CFSTR("logoImageEncoded"));

  -[NPKPassDescription backgroundImageEncoded](self, "backgroundImageEncoded");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v21, CFSTR("backgroundImageEncoded"));

  -[NPKPassDescription localizedDescription](self, "localizedDescription");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v22, CFSTR("localizedDescription"));

  -[NPKPassDescription nfcPayload](self, "nfcPayload");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v23, CFSTR("nfcPayload"));

  -[NPKPassDescription completeHash](self, "completeHash");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v24, CFSTR("completeHash"));

  objc_msgSend(v4, "encodeBool:forKey:", -[NPKPassDescription hasStoredValue](self, "hasStoredValue"), CFSTR("hasStoredValue"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[NPKPassDescription settings](self, "settings"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v25, CFSTR("settings"));

  -[NPKPassDescription issuerCountryCode](self, "issuerCountryCode");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v26, CFSTR("issuerCountryCode"));

  -[NPKPassDescription availableActions](self, "availableActions");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v27, CFSTR("availableActions"));

  -[NPKPassDescription organizationName](self, "organizationName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v28, CFSTR("organizationName"));

  -[NPKPassDescription transitAppletState](self, "transitAppletState");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v29, CFSTR("felicaTransitAppletState"));

  -[NPKPassDescription frontFieldBuckets](self, "frontFieldBuckets");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v30, CFSTR("frontFieldBuckets"));

  -[NPKPassDescription backFieldBuckets](self, "backFieldBuckets");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v31, CFSTR("backFieldBuckets"));

  -[NPKPassDescription lastAddValueAmount](self, "lastAddValueAmount");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v32, CFSTR("lastAddValueAmount"));

  -[NPKPassDescription pendingAddValueDate](self, "pendingAddValueDate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v33, CFSTR("pendingAddValueDate"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[NPKPassDescription expressPassTypesMask](self, "expressPassTypesMask"), CFSTR("expressPassTypesMask"));
  objc_msgSend(v4, "encodeBool:forKey:", -[NPKPassDescription hasAssociatedPeerPaymentAccount](self, "hasAssociatedPeerPaymentAccount"), CFSTR("hasAssociatedPeerPaymentAccount"));
  -[NPKPassDescription subcredentials](self, "subcredentials");
  v34 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v34, CFSTR("subcredentials"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  NPKPassDescription *v4;

  v4 = objc_alloc_init(NPKPassDescription);
  objc_storeStrong((id *)&v4->_uniqueID, self->_uniqueID);
  objc_storeStrong((id *)&v4->_groupID, self->_groupID);
  objc_storeStrong((id *)&v4->_passTypeIdentifier, self->_passTypeIdentifier);
  objc_storeStrong((id *)&v4->_manifestHash, self->_manifestHash);
  v4->_style = self->_style;
  objc_storeStrong((id *)&v4->_relevantDate, self->_relevantDate);
  objc_storeStrong((id *)&v4->_ingestionDate, self->_ingestionDate);
  objc_storeStrong((id *)&v4->_logoText, self->_logoText);
  objc_storeStrong((id *)&v4->_logoImage, self->_logoImage);
  objc_storeStrong((id *)&v4->_logoImageEncoded, self->_logoImageEncoded);
  objc_storeStrong((id *)&v4->_backgroundColor, self->_backgroundColor);
  objc_storeStrong((id *)&v4->_foregroundColor, self->_foregroundColor);
  objc_storeStrong((id *)&v4->_labelColor, self->_labelColor);
  objc_storeStrong((id *)&v4->_backgroundImage, self->_backgroundImage);
  objc_storeStrong((id *)&v4->_backgroundImageEncoded, self->_backgroundImageEncoded);
  objc_storeStrong((id *)&v4->_localizedDescription, self->_localizedDescription);
  objc_storeStrong((id *)&v4->_devicePaymentApplications, self->_devicePaymentApplications);
  objc_storeStrong((id *)&v4->_devicePrimaryPaymentApplication, self->_devicePrimaryPaymentApplication);
  objc_storeStrong((id *)&v4->_devicePrimaryContactlessPaymentApplication, self->_devicePrimaryContactlessPaymentApplication);
  objc_storeStrong((id *)&v4->_devicePrimaryInAppPaymentApplication, self->_devicePrimaryInAppPaymentApplication);
  objc_storeStrong((id *)&v4->_preferredPaymentApplication, self->_preferredPaymentApplication);
  v4->_effectivePaymentApplicationState = self->_effectivePaymentApplicationState;
  v4->_privateLabel = self->_privateLabel;
  v4->_cobranded = self->_cobranded;
  v4->_deletePending = self->_deletePending;
  v4->_hasUserSelectableContactlessPaymentApplications = self->_hasUserSelectableContactlessPaymentApplications;
  objc_storeStrong((id *)&v4->_backgroundColor, self->_backgroundColor);
  objc_storeStrong((id *)&v4->_nfcPayload, self->_nfcPayload);
  objc_storeStrong((id *)&v4->_completeHash, self->_completeHash);
  v4->_hasStoredValue = self->_hasStoredValue;
  v4->_settings = self->_settings;
  objc_storeStrong((id *)&v4->_issuerCountryCode, self->_issuerCountryCode);
  objc_storeStrong((id *)&v4->_availableActions, self->_availableActions);
  objc_storeStrong((id *)&v4->_organizationName, self->_organizationName);
  objc_storeStrong((id *)&v4->_transitAppletState, self->_transitAppletState);
  objc_storeStrong((id *)&v4->_frontFieldBuckets, self->_frontFieldBuckets);
  objc_storeStrong((id *)&v4->_backFieldBuckets, self->_backFieldBuckets);
  objc_storeStrong((id *)&v4->_lastAddValueAmount, self->_lastAddValueAmount);
  objc_storeStrong((id *)&v4->_pendingAddValueDate, self->_pendingAddValueDate);
  v4->_expressPassTypesMask = self->_expressPassTypesMask;
  v4->_hasAssociatedPeerPaymentAccount = self->_hasAssociatedPeerPaymentAccount;
  objc_storeStrong((id *)&v4->_subcredentials, self->_subcredentials);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  NPKPassDescription *v4;
  NSString *uniqueID;
  NSNumber *groupID;
  NSString *passTypeIdentifier;
  NSData *manifestHash;
  NSDate *relevantDate;
  NSDate *ingestionDate;
  NSString *logoText;
  NSData *logoImageEncoded;
  PKColor *backgroundColor;
  uint64_t v14;
  PKColor *foregroundColor;
  uint64_t v16;
  PKColor *labelColor;
  uint64_t v18;
  NSString *localizedDescription;
  NSData *backgroundImageEncoded;
  NSSet *devicePaymentApplications;
  PKPaymentApplication *devicePrimaryPaymentApplication;
  PKPaymentApplication *devicePrimaryContactlessPaymentApplication;
  PKPaymentApplication *devicePrimaryInAppPaymentApplication;
  PKPaymentApplication *preferredPaymentApplication;
  PKNFCPayload *nfcPayload;
  NSData *completeHash;
  NSString *issuerCountryCode;
  NSArray *availableActions;
  NSString *organizationName;
  PKTransitAppletState *transitAppletState;
  NSArray *frontFieldBuckets;
  NSArray *backFieldBuckets;
  NSDecimalNumber *lastAddValueAmount;
  NSDate *pendingAddValueDate;
  NSSet *subcredentials;
  BOOL v37;

  v4 = (NPKPassDescription *)a3;
  if (self == v4)
  {
    v37 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_74;
    uniqueID = self->_uniqueID;
    if ((unint64_t)uniqueID | (unint64_t)v4->_uniqueID)
    {
      if (!-[NSString isEqualToString:](uniqueID, "isEqualToString:"))
        goto LABEL_74;
    }
    groupID = self->_groupID;
    if ((unint64_t)groupID | (unint64_t)v4->_groupID)
    {
      if (!-[NSNumber isEqual:](groupID, "isEqual:"))
        goto LABEL_74;
    }
    passTypeIdentifier = self->_passTypeIdentifier;
    if ((unint64_t)passTypeIdentifier | (unint64_t)v4->_passTypeIdentifier)
    {
      if (!-[NSString isEqualToString:](passTypeIdentifier, "isEqualToString:"))
        goto LABEL_74;
    }
    manifestHash = self->_manifestHash;
    if ((unint64_t)manifestHash | (unint64_t)v4->_manifestHash)
    {
      if (!-[NSData isEqualToData:](manifestHash, "isEqualToData:"))
        goto LABEL_74;
    }
    if (self->_style != v4->_style)
      goto LABEL_74;
    relevantDate = self->_relevantDate;
    if ((unint64_t)relevantDate | (unint64_t)v4->_relevantDate)
    {
      if (!-[NSDate isEqualToDate:](relevantDate, "isEqualToDate:"))
        goto LABEL_74;
    }
    ingestionDate = self->_ingestionDate;
    if ((unint64_t)ingestionDate | (unint64_t)v4->_ingestionDate)
    {
      if (!-[NSDate isEqualToDate:](ingestionDate, "isEqualToDate:"))
        goto LABEL_74;
    }
    logoText = self->_logoText;
    if ((unint64_t)logoText | (unint64_t)v4->_logoText)
    {
      if (!-[NSString isEqualToString:](logoText, "isEqualToString:"))
        goto LABEL_74;
    }
    logoImageEncoded = self->_logoImageEncoded;
    if ((unint64_t)logoImageEncoded | (unint64_t)v4->_logoImageEncoded)
    {
      if (!-[NSData isEqualToData:](logoImageEncoded, "isEqualToData:"))
        goto LABEL_74;
    }
    backgroundColor = self->_backgroundColor;
    if (backgroundColor || v4->_backgroundColor)
    {
      v14 = -[PKColor hash](backgroundColor, "hash");
      if (v14 != -[PKColor hash](v4->_backgroundColor, "hash"))
        goto LABEL_74;
    }
    foregroundColor = self->_foregroundColor;
    if (foregroundColor || v4->_foregroundColor)
    {
      v16 = -[PKColor hash](foregroundColor, "hash");
      if (v16 != -[PKColor hash](v4->_foregroundColor, "hash"))
        goto LABEL_74;
    }
    labelColor = self->_labelColor;
    if (labelColor || v4->_labelColor)
    {
      v18 = -[PKColor hash](labelColor, "hash");
      if (v18 != -[PKColor hash](v4->_labelColor, "hash"))
        goto LABEL_74;
    }
    localizedDescription = self->_localizedDescription;
    if ((unint64_t)localizedDescription | (unint64_t)v4->_localizedDescription
      && !-[NSString isEqualToString:](localizedDescription, "isEqualToString:"))
    {
      goto LABEL_74;
    }
    backgroundImageEncoded = self->_backgroundImageEncoded;
    if ((unint64_t)backgroundImageEncoded | (unint64_t)v4->_backgroundImageEncoded
      && !-[NSData isEqualToData:](backgroundImageEncoded, "isEqualToData:"))
    {
      goto LABEL_74;
    }
    devicePaymentApplications = self->_devicePaymentApplications;
    if ((unint64_t)devicePaymentApplications | (unint64_t)v4->_devicePaymentApplications
      && !-[NSSet isEqual:](devicePaymentApplications, "isEqual:"))
    {
      goto LABEL_74;
    }
    devicePrimaryPaymentApplication = self->_devicePrimaryPaymentApplication;
    if ((unint64_t)devicePrimaryPaymentApplication | (unint64_t)v4->_devicePrimaryPaymentApplication
      && !-[PKPaymentApplication isEqual:](devicePrimaryPaymentApplication, "isEqual:"))
    {
      goto LABEL_74;
    }
    devicePrimaryContactlessPaymentApplication = self->_devicePrimaryContactlessPaymentApplication;
    if ((unint64_t)devicePrimaryContactlessPaymentApplication | (unint64_t)v4->_devicePrimaryContactlessPaymentApplication
      && !-[PKPaymentApplication isEqual:](devicePrimaryContactlessPaymentApplication, "isEqual:"))
    {
      goto LABEL_74;
    }
    devicePrimaryInAppPaymentApplication = self->_devicePrimaryInAppPaymentApplication;
    if ((unint64_t)devicePrimaryInAppPaymentApplication | (unint64_t)v4->_devicePrimaryInAppPaymentApplication
      && !-[PKPaymentApplication isEqual:](devicePrimaryInAppPaymentApplication, "isEqual:"))
    {
      goto LABEL_74;
    }
    preferredPaymentApplication = self->_preferredPaymentApplication;
    if ((unint64_t)preferredPaymentApplication | (unint64_t)v4->_preferredPaymentApplication
      && !-[PKPaymentApplication isEqual:](preferredPaymentApplication, "isEqual:"))
    {
      goto LABEL_74;
    }
    if (self->_effectivePaymentApplicationState != v4->_effectivePaymentApplicationState)
      goto LABEL_74;
    if (self->_privateLabel != v4->_privateLabel)
      goto LABEL_74;
    if (self->_cobranded != v4->_cobranded)
      goto LABEL_74;
    if (self->_deletePending != v4->_deletePending)
      goto LABEL_74;
    if (self->_hasUserSelectableContactlessPaymentApplications != v4->_hasUserSelectableContactlessPaymentApplications)
      goto LABEL_74;
    nfcPayload = self->_nfcPayload;
    if ((unint64_t)nfcPayload | (unint64_t)v4->_nfcPayload)
    {
      if (!-[PKNFCPayload isEqual:](nfcPayload, "isEqual:"))
        goto LABEL_74;
    }
    completeHash = self->_completeHash;
    if ((unint64_t)completeHash | (unint64_t)v4->_completeHash
      && !-[NSData isEqual:](completeHash, "isEqual:"))
    {
      goto LABEL_74;
    }
    if (self->_hasStoredValue != v4->_hasStoredValue)
      goto LABEL_74;
    if (self->_settings != v4->_settings)
      goto LABEL_74;
    issuerCountryCode = self->_issuerCountryCode;
    if ((unint64_t)issuerCountryCode | (unint64_t)v4->_issuerCountryCode)
    {
      if (!-[NSString isEqualToString:](issuerCountryCode, "isEqualToString:"))
        goto LABEL_74;
    }
    availableActions = self->_availableActions;
    if ((unint64_t)availableActions | (unint64_t)v4->_availableActions
      && !-[NSArray isEqual:](availableActions, "isEqual:"))
    {
      goto LABEL_74;
    }
    if (((organizationName = self->_organizationName,
           !((unint64_t)organizationName | (unint64_t)v4->_organizationName))
       || -[NSString isEqual:](organizationName, "isEqual:"))
      && ((transitAppletState = self->_transitAppletState,
           !((unint64_t)transitAppletState | (unint64_t)v4->_transitAppletState))
       || -[PKTransitAppletState isEqual:](transitAppletState, "isEqual:"))
      && ((frontFieldBuckets = self->_frontFieldBuckets,
           !((unint64_t)frontFieldBuckets | (unint64_t)v4->_frontFieldBuckets))
       || -[NSArray isEqual:](frontFieldBuckets, "isEqual:"))
      && ((backFieldBuckets = self->_backFieldBuckets,
           !((unint64_t)backFieldBuckets | (unint64_t)v4->_backFieldBuckets))
       || -[NSArray isEqual:](backFieldBuckets, "isEqual:"))
      && ((lastAddValueAmount = self->_lastAddValueAmount,
           !((unint64_t)lastAddValueAmount | (unint64_t)v4->_lastAddValueAmount))
       || -[NSDecimalNumber isEqual:](lastAddValueAmount, "isEqual:"))
      && ((pendingAddValueDate = self->_pendingAddValueDate,
           !((unint64_t)pendingAddValueDate | (unint64_t)v4->_pendingAddValueDate))
       || -[NSDate isEqual:](pendingAddValueDate, "isEqual:"))
      && self->_expressPassTypesMask == v4->_expressPassTypesMask
      && ((subcredentials = self->_subcredentials,
           !((unint64_t)subcredentials | (unint64_t)v4->_subcredentials))
       || -[NSSet isEqual:](subcredentials, "isEqual:")))
    {
      v37 = self->_hasAssociatedPeerPaymentAccount == v4->_hasAssociatedPeerPaymentAccount;
    }
    else
    {
LABEL_74:
      v37 = 0;
    }
  }

  return v37;
}

- (unint64_t)hash
{
  int64_t style;
  PKColor *backgroundColor;
  NSData *logoImageEncoded;
  NSData *backgroundImageEncoded;
  NSString *localizedDescription;
  NSSet *devicePaymentApplications;
  PKPaymentApplication *devicePrimaryPaymentApplication;
  int64_t effectivePaymentApplicationState;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  PKNFCPayload *nfcPayload;
  NSData *completeHash;
  void *v17;
  void *v18;
  NSString *issuerCountryCode;
  NSArray *availableActions;
  NSArray *frontFieldBuckets;
  NSDate *pendingAddValueDate;
  void *v23;
  void *v24;
  NSSet *subcredentials;
  void *v26;
  unint64_t v27;
  void *v29;
  void *v30;
  NSString *uniqueID;
  __int128 v32;
  NSData *manifestHash;
  void *v34;
  __int128 v35;
  NSString *logoText;
  NSData *v37;
  PKColor *v38;
  __int128 v39;
  NSData *v40;
  NSString *v41;
  NSSet *v42;
  PKPaymentApplication *v43;
  __int128 v44;
  PKPaymentApplication *preferredPaymentApplication;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  PKNFCPayload *v51;
  NSData *v52;
  void *v53;
  void *v54;
  NSString *v55;
  NSArray *v56;
  __int128 v57;
  NSArray *v58;
  __int128 v59;
  NSDate *v60;
  void *v61;
  void *v62;
  NSSet *v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  uniqueID = self->_uniqueID;
  v32 = *(_OWORD *)&self->_groupID;
  style = self->_style;
  manifestHash = self->_manifestHash;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", style);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v30;
  v35 = *(_OWORD *)&self->_relevantDate;
  backgroundColor = self->_backgroundColor;
  backgroundImageEncoded = self->_backgroundImageEncoded;
  logoImageEncoded = self->_logoImageEncoded;
  logoText = self->_logoText;
  v37 = logoImageEncoded;
  v38 = backgroundColor;
  v39 = *(_OWORD *)&self->_foregroundColor;
  localizedDescription = self->_localizedDescription;
  devicePaymentApplications = self->_devicePaymentApplications;
  v40 = backgroundImageEncoded;
  v41 = localizedDescription;
  devicePrimaryPaymentApplication = self->_devicePrimaryPaymentApplication;
  v42 = devicePaymentApplications;
  v43 = devicePrimaryPaymentApplication;
  v44 = *(_OWORD *)&self->_devicePrimaryContactlessPaymentApplication;
  effectivePaymentApplicationState = self->_effectivePaymentApplicationState;
  preferredPaymentApplication = self->_preferredPaymentApplication;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", effectivePaymentApplicationState);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v29;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_privateLabel);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v11;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_cobranded);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v12;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_deletePending);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v13;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_hasUserSelectableContactlessPaymentApplications);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  nfcPayload = self->_nfcPayload;
  completeHash = self->_completeHash;
  v50 = v14;
  v51 = nfcPayload;
  v52 = completeHash;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_hasStoredValue);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v17;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_settings);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  issuerCountryCode = self->_issuerCountryCode;
  availableActions = self->_availableActions;
  v54 = v18;
  v55 = issuerCountryCode;
  v56 = availableActions;
  v57 = *(_OWORD *)&self->_organizationName;
  frontFieldBuckets = self->_frontFieldBuckets;
  v59 = *(_OWORD *)&self->_backFieldBuckets;
  pendingAddValueDate = self->_pendingAddValueDate;
  v58 = frontFieldBuckets;
  v60 = pendingAddValueDate;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_expressPassTypesMask);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v23;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_hasAssociatedPeerPaymentAccount);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  subcredentials = self->_subcredentials;
  v62 = v24;
  v63 = subcredentials;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &uniqueID, 39);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = PKCombinedHash();

  return v27;
}

- (id)description
{
  _BOOL4 v3;
  _BOOL4 v4;
  _BOOL4 v5;
  void *v6;
  _BOOL4 v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  int64_t v24;
  PKImage *logoImage;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  PKImage *backgroundImage;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  objc_super v48;

  v36 = (void *)MEMORY[0x24BDD17C8];
  v48.receiver = self;
  v48.super_class = (Class)NPKPassDescription;
  -[NPKPassDescription description](&v48, sel_description);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassDescription uniqueID](self, "uniqueID");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassDescription groupID](self, "groupID");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassDescription passTypeIdentifier](self, "passTypeIdentifier");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassDescription manifestHash](self, "manifestHash");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = -[NPKPassDescription style](self, "style");
  -[NPKPassDescription relevantDate](self, "relevantDate");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassDescription ingestionDate](self, "ingestionDate");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassDescription logoText](self, "logoText");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  logoImage = self->_logoImage;
  -[NPKPassDescription logoImageEncoded](self, "logoImageEncoded");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassDescription backgroundColor](self, "backgroundColor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassDescription foregroundColor](self, "foregroundColor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassDescription labelColor](self, "labelColor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  backgroundImage = self->_backgroundImage;
  -[NPKPassDescription backgroundImageEncoded](self, "backgroundImageEncoded");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassDescription localizedDescription](self, "localizedDescription");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassDescription devicePaymentApplications](self, "devicePaymentApplications");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassDescription devicePrimaryPaymentApplication](self, "devicePrimaryPaymentApplication");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassDescription devicePrimaryContactlessPaymentApplication](self, "devicePrimaryContactlessPaymentApplication");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassDescription devicePrimaryInAppPaymentApplication](self, "devicePrimaryInAppPaymentApplication");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassDescription preferredPaymentApplication](self, "preferredPaymentApplication");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[NPKPassDescription effectivePaymentApplicationState](self, "effectivePaymentApplicationState");
  v23 = -[NPKPassDescription isPrivateLabel](self, "isPrivateLabel");
  v3 = -[NPKPassDescription isCobranded](self, "isCobranded");
  v4 = -[NPKPassDescription deletePending](self, "deletePending");
  v5 = -[NPKPassDescription hasUserSelectableContactlessPaymentApplications](self, "hasUserSelectableContactlessPaymentApplications");
  -[NPKPassDescription nfcPayload](self, "nfcPayload");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassDescription completeHash](self, "completeHash");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NPKPassDescription hasStoredValue](self, "hasStoredValue");
  v8 = -[NPKPassDescription settings](self, "settings");
  -[NPKPassDescription issuerCountryCode](self, "issuerCountryCode");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "stringWithFormat:", CFSTR("<%@> (uniqueID %@ groupID %@ passTypeIdentifier %@ manifestHash %@ style %d relevantDate %@ ingestionDate %@ logoText %@ logoImage %@ logoImageEncoded %p backgroundColor %@ foregroundColor %@ labelColor %@ backgroundImage %@ backgroundImageEncoded %p, localizedDescription %@, devicePaymentApplications (%@) devicePrimaryPaymentApplication (%@) devicePrimaryContactlessPaymentApplication (%@) devicePrimaryInAppPaymentApplication (%@) preferredPaymentApplication (%@) effectivePaymentApplicationState %d privateLabel %d cobranded %d deletePending %d hasUserSelectableContactlessPaymentApplications %d nfcPayload %@ completeHash %@ hasStoredValue %d settings %d issuerCountryCode %@ expressPassTypesMask %lu)"), v47, v46, v45, v44, v43, v35, v42, v41, v40, logoImage, v38, v39, v34, v33, backgroundImage, v32,
    v31,
    v29,
    v28,
    v27,
    v22,
    v26,
    v24,
    v23,
    v3,
    v4,
    v5,
    v21,
    v6,
    v7,
    v8,
    v20,
    -[NPKPassDescription expressPassTypesMask](self, "expressPassTypesMask"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  -[NPKPassDescription availableActions](self, "availableActions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassDescription organizationName](self, "organizationName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassDescription transitAppletState](self, "transitAppletState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassDescription frontFieldBuckets](self, "frontFieldBuckets");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassDescription backFieldBuckets](self, "backFieldBuckets");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassDescription lastAddValueAmount](self, "lastAddValueAmount");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPassDescription pendingAddValueDate](self, "pendingAddValueDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "stringByAppendingFormat:", CFSTR(" (availableActions %@ organizationName %@ transitAppletState %@ frontFieldBuckets %@ backFieldBuckets %@ lastAddValueAmount %@ pendingAddValueDate %@  hasAssociatedPeerPaymentAccount %d)"), v9, v10, v11, v12, v13, v14, v15, -[NPKPassDescription hasAssociatedPeerPaymentAccount](self, "hasAssociatedPeerPaymentAccount"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[NPKPassDescription subcredentials](self, "subcredentials");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringByAppendingFormat:", CFSTR("(subcredentials %@)"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)encodeAsData:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  if (a3)
  {
    v3 = (void *)MEMORY[0x24BDBCE50];
    NPKSecureArchiveObject(a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dataWithData:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)encodeObject:(id)a3 asDataInCoder:(id)a4 withKey:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  -[NPKPassDescription encodeAsData:](self, "encodeAsData:", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v10, v8);

}

- (void)setLogoImage:(id)a3
{
  NSData *v5;
  NSData *logoImageEncoded;
  id v7;

  v7 = a3;
  objc_storeStrong((id *)&self->_logoImage, a3);
  if (-[NPKPassDescription lazyLoadEncodedImages](self, "lazyLoadEncodedImages") || !self->_logoImage)
  {
    logoImageEncoded = self->_logoImageEncoded;
    self->_logoImageEncoded = 0;
  }
  else
  {
    -[NPKPassDescription encodeAsData:](self, "encodeAsData:");
    v5 = (NSData *)objc_claimAutoreleasedReturnValue();
    logoImageEncoded = self->_logoImageEncoded;
    self->_logoImageEncoded = v5;
  }

}

- (void)setBackgroundImage:(id)a3
{
  NSData *v5;
  NSData *backgroundImageEncoded;
  id v7;

  v7 = a3;
  objc_storeStrong((id *)&self->_backgroundImage, a3);
  if (-[NPKPassDescription lazyLoadEncodedImages](self, "lazyLoadEncodedImages") || !self->_backgroundImage)
  {
    backgroundImageEncoded = self->_backgroundImageEncoded;
    self->_backgroundImageEncoded = 0;
  }
  else
  {
    -[NPKPassDescription encodeAsData:](self, "encodeAsData:");
    v5 = (NSData *)objc_claimAutoreleasedReturnValue();
    backgroundImageEncoded = self->_backgroundImageEncoded;
    self->_backgroundImageEncoded = v5;
  }

}

- (NSData)backgroundImageEncoded
{
  NSData *v3;
  NSData *backgroundImageEncoded;

  if (!self->_backgroundImageEncoded)
  {
    if (self->_backgroundImage)
    {
      -[NPKPassDescription encodeAsData:](self, "encodeAsData:");
      v3 = (NSData *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }
    backgroundImageEncoded = self->_backgroundImageEncoded;
    self->_backgroundImageEncoded = v3;

  }
  return self->_backgroundImageEncoded;
}

- (void)setLogoImageEncoded:(id)a3
{
  NSData *v4;
  PKImage *logoImage;
  NSData *logoImageEncoded;

  v4 = (NSData *)a3;
  logoImage = self->_logoImage;
  self->_logoImage = 0;

  logoImageEncoded = self->_logoImageEncoded;
  self->_logoImageEncoded = v4;

}

- (NSData)logoImageEncoded
{
  NSData *v3;
  NSData *logoImageEncoded;

  if (!self->_logoImageEncoded)
  {
    if (self->_logoImage)
    {
      -[NPKPassDescription encodeAsData:](self, "encodeAsData:");
      v3 = (NSData *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }
    logoImageEncoded = self->_logoImageEncoded;
    self->_logoImageEncoded = v3;

  }
  return self->_logoImageEncoded;
}

- (void)setBackgroundImageEncoded:(id)a3
{
  NSData *v4;
  PKImage *backgroundImage;
  NSData *backgroundImageEncoded;

  v4 = (NSData *)a3;
  backgroundImage = self->_backgroundImage;
  self->_backgroundImage = 0;

  backgroundImageEncoded = self->_backgroundImageEncoded;
  self->_backgroundImageEncoded = v4;

}

- (PKImage)logoImage
{
  PKImage *logoImage;
  PKImage **p_logoImage;
  PKImage *v4;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  uint8_t v12[16];

  p_logoImage = &self->_logoImage;
  logoImage = self->_logoImage;
  if (logoImage)
  {
    v4 = logoImage;
  }
  else
  {
    -[NPKPassDescription logoImageEncoded](self, "logoImageEncoded");
    v4 = (PKImage *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      pk_ui_log();
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

      if (v8)
      {
        pk_ui_log();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v12 = 0;
          _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Notice: decoding logo image from data on demand", v12, 2u);
        }

      }
      -[NPKPassDescription logoImageEncoded](self, "logoImageEncoded");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_opt_class();
      NPKSecureUnarchiveObject(v10, v11);
      v4 = (PKImage *)objc_claimAutoreleasedReturnValue();

      if (v4 && objc_msgSend((id)objc_opt_class(), "isCachingEnabled"))
        objc_storeStrong((id *)p_logoImage, v4);
    }
  }
  return v4;
}

- (PKImage)backgroundImage
{
  PKImage *backgroundImage;
  PKImage **p_backgroundImage;
  PKImage *v4;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  uint8_t v12[16];

  p_backgroundImage = &self->_backgroundImage;
  backgroundImage = self->_backgroundImage;
  if (backgroundImage)
  {
    v4 = backgroundImage;
  }
  else
  {
    -[NPKPassDescription backgroundImageEncoded](self, "backgroundImageEncoded");
    v4 = (PKImage *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      pk_ui_log();
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

      if (v8)
      {
        pk_ui_log();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v12 = 0;
          _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Notice: decoding background image from data on demand", v12, 2u);
        }

      }
      -[NPKPassDescription backgroundImageEncoded](self, "backgroundImageEncoded");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_opt_class();
      NPKSecureUnarchiveObject(v10, v11);
      v4 = (PKImage *)objc_claimAutoreleasedReturnValue();

      if (v4 && objc_msgSend((id)objc_opt_class(), "isCachingEnabled"))
        objc_storeStrong((id *)p_backgroundImage, v4);
    }
  }
  return v4;
}

- (int64_t)effectiveContactlessPaymentApplicationState
{
  void *v3;
  int64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[NPKPassDescription devicePrimaryPaymentApplication](self, "devicePrimaryPaymentApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "state");

  if (v4 == 1)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[NPKPassDescription devicePaymentApplications](self, "devicePaymentApplications", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      while (2)
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "state");
          if (v10 != 1)
          {
            v4 = v10;
            goto LABEL_12;
          }
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v7)
          continue;
        break;
      }
    }
    v4 = 1;
LABEL_12:

  }
  return v4;
}

- (id)transitProperties
{
  void *v3;
  void *v4;
  void *v5;

  -[NPKPassDescription transitAppletState](self, "transitAppletState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NPKPassDescription devicePrimaryPaymentApplication](self, "devicePrimaryPaymentApplication");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "transitPassPropertiesWithPaymentApplication:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)fieldForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t k;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t m;
  void *v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  uint64_t i;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  int v28;
  id v29;
  NPKPassDescription *v31;
  id obj;
  id obja;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
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
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  -[NPKPassDescription frontFieldBuckets](self, "frontFieldBuckets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
  if (!v36)
  {

LABEL_21:
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    -[NPKPassDescription backFieldBuckets](self, "backFieldBuckets", v31);
    obja = (id)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
    v18 = 0;
    if (v37)
    {
      v35 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v37; ++i)
        {
          if (*(_QWORD *)v43 != v35)
            objc_enumerationMutation(obja);
          v20 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          v38 = 0u;
          v39 = 0u;
          v40 = 0u;
          v41 = 0u;
          v21 = v20;
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v54, 16);
          if (v22)
          {
            v23 = v22;
            v24 = *(_QWORD *)v39;
            while (2)
            {
              for (j = 0; j != v23; ++j)
              {
                if (*(_QWORD *)v39 != v24)
                  objc_enumerationMutation(v21);
                v26 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
                objc_msgSend(v26, "key");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = objc_msgSend(v27, "isEqual:", v4);

                if (v28)
                {
                  v29 = v26;

                  v18 = v29;
                  goto LABEL_36;
                }
              }
              v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v54, 16);
              if (v23)
                continue;
              break;
            }
          }
LABEL_36:

        }
        v37 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
      }
      while (v37);
    }

    v6 = v18;
    goto LABEL_39;
  }
  v31 = self;
  obj = v5;
  v6 = 0;
  v34 = *(_QWORD *)v51;
  do
  {
    for (k = 0; k != v36; ++k)
    {
      if (*(_QWORD *)v51 != v34)
        objc_enumerationMutation(obj);
      v8 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * k);
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v9 = v8;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v47;
        while (2)
        {
          for (m = 0; m != v11; ++m)
          {
            if (*(_QWORD *)v47 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * m);
            objc_msgSend(v14, "key", v31);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "isEqual:", v4);

            if (v16)
            {
              v17 = v14;

              v6 = v17;
              goto LABEL_16;
            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
          if (v11)
            continue;
          break;
        }
      }
LABEL_16:

    }
    v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
  }
  while (v36);

  self = v31;
  if (!v6)
    goto LABEL_21;
LABEL_39:

  return v6;
}

- (BOOL)isAddValuePending
{
  void *v3;
  void *v4;
  double v5;
  BOOL v6;

  -[NPKPassDescription pendingAddValueDate](self, "pendingAddValueDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NPKPassDescription pendingAddValueDate](self, "pendingAddValueDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceNow");
    v6 = fabs(v5) < 600.0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isEnroute
{
  void *v2;
  char v3;
  void *v4;

  -[NPKPassDescription transitProperties](self, "transitProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isInStation") & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(v2, "felicaProperties");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "isInShinkansenStation");

  }
  return v3;
}

- (BOOL)hasValidNFCPayload
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[NPKPassDescription nfcPayload](self, "nfcPayload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "message");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "encryptionPublicKeyData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v5 = 1;
    else
      v5 = PKNFCPassKeyOptional();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)expressPassTypesMask
{
  return self->_expressPassTypesMask;
}

- (void)setExpressPassTypesMask:(unint64_t)a3
{
  self->_expressPassTypesMask = a3;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueID, a3);
}

- (NSNumber)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(id)a3
{
  objc_storeStrong((id *)&self->_groupID, a3);
}

- (NSString)passTypeIdentifier
{
  return self->_passTypeIdentifier;
}

- (void)setPassTypeIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_passTypeIdentifier, a3);
}

- (NSData)manifestHash
{
  return self->_manifestHash;
}

- (void)setManifestHash:(id)a3
{
  objc_storeStrong((id *)&self->_manifestHash, a3);
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (NSDate)relevantDate
{
  return self->_relevantDate;
}

- (void)setRelevantDate:(id)a3
{
  objc_storeStrong((id *)&self->_relevantDate, a3);
}

- (NSDate)ingestionDate
{
  return self->_ingestionDate;
}

- (void)setIngestionDate:(id)a3
{
  objc_storeStrong((id *)&self->_ingestionDate, a3);
}

- (PKNFCPayload)nfcPayload
{
  return self->_nfcPayload;
}

- (void)setNfcPayload:(id)a3
{
  objc_storeStrong((id *)&self->_nfcPayload, a3);
}

- (BOOL)hasStoredValue
{
  return self->_hasStoredValue;
}

- (void)setHasStoredValue:(BOOL)a3
{
  self->_hasStoredValue = a3;
}

- (NSData)completeHash
{
  return self->_completeHash;
}

- (void)setCompleteHash:(id)a3
{
  objc_storeStrong((id *)&self->_completeHash, a3);
}

- (unint64_t)settings
{
  return self->_settings;
}

- (void)setSettings:(unint64_t)a3
{
  self->_settings = a3;
}

- (NSString)logoText
{
  return self->_logoText;
}

- (void)setLogoText:(id)a3
{
  objc_storeStrong((id *)&self->_logoText, a3);
}

- (PKColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (PKColor)foregroundColor
{
  return self->_foregroundColor;
}

- (void)setForegroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_foregroundColor, a3);
}

- (PKColor)labelColor
{
  return self->_labelColor;
}

- (void)setLabelColor:(id)a3
{
  objc_storeStrong((id *)&self->_labelColor, a3);
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void)setLocalizedDescription:(id)a3
{
  objc_storeStrong((id *)&self->_localizedDescription, a3);
}

- (NSSet)devicePaymentApplications
{
  return self->_devicePaymentApplications;
}

- (void)setDevicePaymentApplications:(id)a3
{
  objc_storeStrong((id *)&self->_devicePaymentApplications, a3);
}

- (PKPaymentApplication)devicePrimaryPaymentApplication
{
  return self->_devicePrimaryPaymentApplication;
}

- (void)setDevicePrimaryPaymentApplication:(id)a3
{
  objc_storeStrong((id *)&self->_devicePrimaryPaymentApplication, a3);
}

- (PKPaymentApplication)devicePrimaryContactlessPaymentApplication
{
  return self->_devicePrimaryContactlessPaymentApplication;
}

- (void)setDevicePrimaryContactlessPaymentApplication:(id)a3
{
  objc_storeStrong((id *)&self->_devicePrimaryContactlessPaymentApplication, a3);
}

- (PKPaymentApplication)devicePrimaryInAppPaymentApplication
{
  return self->_devicePrimaryInAppPaymentApplication;
}

- (void)setDevicePrimaryInAppPaymentApplication:(id)a3
{
  objc_storeStrong((id *)&self->_devicePrimaryInAppPaymentApplication, a3);
}

- (PKPaymentApplication)preferredPaymentApplication
{
  return self->_preferredPaymentApplication;
}

- (void)setPreferredPaymentApplication:(id)a3
{
  objc_storeStrong((id *)&self->_preferredPaymentApplication, a3);
}

- (int64_t)effectivePaymentApplicationState
{
  return self->_effectivePaymentApplicationState;
}

- (void)setEffectivePaymentApplicationState:(int64_t)a3
{
  self->_effectivePaymentApplicationState = a3;
}

- (BOOL)isPrivateLabel
{
  return self->_privateLabel;
}

- (void)setPrivateLabel:(BOOL)a3
{
  self->_privateLabel = a3;
}

- (BOOL)isCobranded
{
  return self->_cobranded;
}

- (void)setCobranded:(BOOL)a3
{
  self->_cobranded = a3;
}

- (BOOL)deletePending
{
  return self->_deletePending;
}

- (void)setDeletePending:(BOOL)a3
{
  self->_deletePending = a3;
}

- (BOOL)hasUserSelectableContactlessPaymentApplications
{
  return self->_hasUserSelectableContactlessPaymentApplications;
}

- (void)setHasUserSelectableContactlessPaymentApplications:(BOOL)a3
{
  self->_hasUserSelectableContactlessPaymentApplications = a3;
}

- (NSString)issuerCountryCode
{
  return self->_issuerCountryCode;
}

- (void)setIssuerCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_issuerCountryCode, a3);
}

- (NSArray)availableActions
{
  return self->_availableActions;
}

- (void)setAvailableActions:(id)a3
{
  objc_storeStrong((id *)&self->_availableActions, a3);
}

- (NSString)organizationName
{
  return self->_organizationName;
}

- (void)setOrganizationName:(id)a3
{
  objc_storeStrong((id *)&self->_organizationName, a3);
}

- (PKTransitAppletState)transitAppletState
{
  return self->_transitAppletState;
}

- (void)setTransitAppletState:(id)a3
{
  objc_storeStrong((id *)&self->_transitAppletState, a3);
}

- (NSArray)frontFieldBuckets
{
  return self->_frontFieldBuckets;
}

- (void)setFrontFieldBuckets:(id)a3
{
  objc_storeStrong((id *)&self->_frontFieldBuckets, a3);
}

- (NSArray)backFieldBuckets
{
  return self->_backFieldBuckets;
}

- (void)setBackFieldBuckets:(id)a3
{
  objc_storeStrong((id *)&self->_backFieldBuckets, a3);
}

- (NSDecimalNumber)lastAddValueAmount
{
  return self->_lastAddValueAmount;
}

- (void)setLastAddValueAmount:(id)a3
{
  objc_storeStrong((id *)&self->_lastAddValueAmount, a3);
}

- (NSDate)pendingAddValueDate
{
  return self->_pendingAddValueDate;
}

- (void)setPendingAddValueDate:(id)a3
{
  objc_storeStrong((id *)&self->_pendingAddValueDate, a3);
}

- (BOOL)hasAssociatedPeerPaymentAccount
{
  return self->_hasAssociatedPeerPaymentAccount;
}

- (void)setHasAssociatedPeerPaymentAccount:(BOOL)a3
{
  self->_hasAssociatedPeerPaymentAccount = a3;
}

- (NSSet)subcredentials
{
  return self->_subcredentials;
}

- (void)setSubcredentials:(id)a3
{
  objc_storeStrong((id *)&self->_subcredentials, a3);
}

- (BOOL)lazyLoadEncodedImages
{
  return self->_lazyLoadEncodedImages;
}

- (void)setLazyLoadEncodedImages:(BOOL)a3
{
  self->_lazyLoadEncodedImages = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subcredentials, 0);
  objc_storeStrong((id *)&self->_pendingAddValueDate, 0);
  objc_storeStrong((id *)&self->_lastAddValueAmount, 0);
  objc_storeStrong((id *)&self->_backFieldBuckets, 0);
  objc_storeStrong((id *)&self->_frontFieldBuckets, 0);
  objc_storeStrong((id *)&self->_transitAppletState, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_availableActions, 0);
  objc_storeStrong((id *)&self->_issuerCountryCode, 0);
  objc_storeStrong((id *)&self->_preferredPaymentApplication, 0);
  objc_storeStrong((id *)&self->_devicePrimaryInAppPaymentApplication, 0);
  objc_storeStrong((id *)&self->_devicePrimaryContactlessPaymentApplication, 0);
  objc_storeStrong((id *)&self->_devicePrimaryPaymentApplication, 0);
  objc_storeStrong((id *)&self->_devicePaymentApplications, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_labelColor, 0);
  objc_storeStrong((id *)&self->_foregroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_logoText, 0);
  objc_storeStrong((id *)&self->_completeHash, 0);
  objc_storeStrong((id *)&self->_nfcPayload, 0);
  objc_storeStrong((id *)&self->_ingestionDate, 0);
  objc_storeStrong((id *)&self->_relevantDate, 0);
  objc_storeStrong((id *)&self->_manifestHash, 0);
  objc_storeStrong((id *)&self->_passTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_logoImageEncoded, 0);
  objc_storeStrong((id *)&self->_backgroundImageEncoded, 0);
  objc_storeStrong((id *)&self->_backgroundImage, 0);
  objc_storeStrong((id *)&self->_logoImage, 0);
}

@end
