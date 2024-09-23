@implementation HFMediaAccessoryItem

+ (id)itemWithAccessoryRepresentableObject:(id)a3 valueSource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  int v20;
  const char *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  objc_msgSend(v6, "hf_homeKitObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  HFLogForCategory(0);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "hf_homeKitObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hf_containedProfiles");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 136316162;
    v21 = "+[HFMediaAccessoryItem(RepresentableItem) itemWithAccessoryRepresentableObject:valueSource:]";
    v22 = 2112;
    v23 = v6;
    v24 = 2112;
    v25 = v12;
    v26 = 2112;
    v27 = v10;
    v28 = 2112;
    v29 = v13;
    _os_log_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_DEFAULT, "(%s) object: %@, homeKitObject: %@, accessory: %@, containedProfiles: %@", (uint8_t *)&v20, 0x34u);

  }
  if (v10)
  {
    objc_msgSend(v10, "mediaProfile");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = objc_alloc((Class)a1);
      objc_msgSend(v10, "mediaProfile");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v15, "initWithValueSource:mediaProfileContainer:", v7, v16);

    }
    else
    {
      v17 = 0;
    }
  }
  else
  {
    v18 = objc_alloc((Class)a1);
    objc_msgSend(v6, "hf_homeKitObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v18, "initWithValueSource:mediaProfileContainer:", v7, v14);
  }

  return v17;
}

- (HFAccessoryRepresentable)accessoryRepresentableObject
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;

  -[HFMediaAccessoryItem mediaProfileContainer](self, "mediaProfileContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1F03F05E0))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  if (v5)
  {
    v6 = v3;
  }
  else
  {
    -[HFMediaAccessoryItem accessories](self, "accessories");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "anyObject");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (HFAccessoryRepresentable *)v6;
}

- (HFMediaAccessoryItem)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithValueSource_mediaProfileContainer_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFMediaAccessoryItem.m"), 82, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFMediaAccessoryItem init]",
    v5);

  return 0;
}

- (HFMediaAccessoryItem)initWithValueSource:(id)a3 mediaProfileContainer:(id)a4
{
  id v8;
  id v9;
  void *v10;
  HFMediaAccessoryItem *v11;
  HFMediaAccessoryItem *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  HFMediaProfileContainer *v17;
  void *v18;
  void *v19;
  void *v20;
  HFMediaProfileContainer *mediaProfileContainer;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  HFHomeKitSettingsVendor *v26;
  void *v27;
  void *v28;
  void *v29;
  HFHomeKitSettingsVendor *homeKitSettingsVendor;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  HFHomeKitObject *v35;
  void *v36;
  void *v37;
  void *v38;
  HFHomeKitObject *homeKitObject;
  uint64_t v40;
  NSObject *v41;
  void *v43;
  void *v44;
  _BOOL4 v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  objc_super v50;
  uint8_t buf[4];
  _BOOL4 v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFMediaAccessoryItem.m"), 87, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("valueSource"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFMediaAccessoryItem.m"), 88, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mediaProfileContainer"));

LABEL_3:
  v50.receiver = self;
  v50.super_class = (Class)HFMediaAccessoryItem;
  v11 = -[HFMediaAccessoryItem init](&v50, sel_init);
  v12 = v11;
  if (!v11)
    goto LABEL_45;
  objc_storeStrong((id *)&v11->_valueSource, a3);
  v13 = &unk_1F0449888;
  v14 = v10;
  v15 = v14;
  if (!v10)
    goto LABEL_10;
  if (objc_msgSend(v14, "conformsToProtocol:", v13))
    v16 = v15;
  else
    v16 = 0;
  v17 = (HFMediaProfileContainer *)v15;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertProtocolCast(Protocol * _Nonnull __strong, id  _Nonnull __strong)");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromProtocol((Protocol *)v13);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("NSObject+NAAdditions.h"), 71, CFSTR("Expected protocol %@"), v20);

LABEL_10:
    v17 = 0;
  }

  mediaProfileContainer = v12->_mediaProfileContainer;
  v12->_mediaProfileContainer = v17;

  v22 = &unk_1F0420440;
  v23 = v15;
  v24 = v23;
  if (!v10)
  {
LABEL_17:
    v26 = 0;
    goto LABEL_18;
  }
  if (objc_msgSend(v23, "conformsToProtocol:", v22))
    v25 = v24;
  else
    v25 = 0;
  v26 = (HFHomeKitSettingsVendor *)v24;
  if (!v25)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertProtocolCast(Protocol * _Nonnull __strong, id  _Nonnull __strong)");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromProtocol((Protocol *)v22);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, CFSTR("NSObject+NAAdditions.h"), 71, CFSTR("Expected protocol %@"), v29);

    goto LABEL_17;
  }
LABEL_18:

  homeKitSettingsVendor = v12->_homeKitSettingsVendor;
  v12->_homeKitSettingsVendor = v26;

  v31 = &unk_1F0408E78;
  v32 = v24;
  v33 = v32;
  if (v10)
  {
    if (objc_msgSend(v32, "conformsToProtocol:", v31))
      v34 = v33;
    else
      v34 = 0;
    v35 = (HFHomeKitObject *)v33;
    if (v34)
      goto LABEL_25;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertProtocolCast(Protocol * _Nonnull __strong, id  _Nonnull __strong)");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromProtocol((Protocol *)v31);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInFunction:file:lineNumber:description:", v37, CFSTR("NSObject+NAAdditions.h"), 71, CFSTR("Expected protocol %@"), v38);

  }
  v35 = 0;
LABEL_25:

  homeKitObject = v12->_homeKitObject;
  v12->_homeKitObject = v35;

  if (-[HFMediaAccessoryItem isAppleTV](v12, "isAppleTV"))
  {
    v40 = 1;
  }
  else if (-[HFMediaAccessoryItem isStandaloneHomePod](v12, "isStandaloneHomePod"))
  {
    v40 = 2;
  }
  else if (-[HFMediaAccessoryItem isHomePodAndIsInMediaSystem](v12, "isHomePodAndIsInMediaSystem"))
  {
    v40 = 3;
  }
  else if (-[HFMediaAccessoryItem isHomePodStereoPair](v12, "isHomePodStereoPair"))
  {
    v40 = 4;
  }
  else if (-[HFMediaAccessoryItem isAirPort](v12, "isAirPort"))
  {
    v40 = 7;
  }
  else if (-[HFMediaAccessoryItem isAudioReceiver](v12, "isAudioReceiver"))
  {
    v40 = 8;
  }
  else if (-[HFMediaAccessoryItem _isHAPCapableSpeaker](v12, "_isHAPCapableSpeaker"))
  {
    v40 = 6;
  }
  else if (-[HFMediaAccessoryItem _isDumbSpeaker](v12, "_isDumbSpeaker"))
  {
    HFLogForCategory(0x3CuLL);
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
    {
      v45 = -[HFMediaAccessoryItem isSiriEndpointAccessory](v12, "isSiriEndpointAccessory");
      -[HFMediaAccessoryItem accessories](v12, "accessories");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "anyObject");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "mediaProfile");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "hf_siriLanguageOptionsManager");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109378;
      v52 = v45;
      v53 = 2112;
      v54 = v49;
      _os_log_debug_impl(&dword_1DD34E000, v41, OS_LOG_TYPE_DEBUG, "isSiriEndPoint %{BOOL}d siriLanguageOptionsManager = %@", buf, 0x12u);

    }
    v40 = 5;
  }
  else
  {
    v40 = 0;
  }
  v12->_mediaAccessoryItemType = v40;
LABEL_45:

  return v12;
}

- (HFMediaAccessoryItem)initWithValueSource:(id)a3 homeKitObject:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  HFMediaAccessoryItem *v25;
  void *v27;
  void *v28;
  void *v29;

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFMediaAccessoryItem.m"), 148, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("homeKitObject"));

    if (v7)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFMediaAccessoryItem.m"), 149, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("valueSource"));

LABEL_3:
  objc_opt_class();
  v9 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  v12 = v9;
  if (objc_msgSend(v12, "conformsToProtocol:", &unk_1F0449888))
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  objc_msgSend(v11, "mediaProfile");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v15)
    v17 = (void *)v15;
  else
    v17 = v14;
  v18 = &unk_1F0449888;
  v19 = v17;
  v20 = v19;
  if (!v19)
    goto LABEL_18;
  if (objc_msgSend(v19, "conformsToProtocol:", v18))
    v21 = v20;
  else
    v21 = 0;
  v22 = v20;
  if (!v21)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertProtocolCast(Protocol * _Nonnull __strong, id  _Nonnull __strong)");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromProtocol((Protocol *)v18);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInFunction:file:lineNumber:description:", v23, CFSTR("NSObject+NAAdditions.h"), 71, CFSTR("Expected protocol %@"), v24);

LABEL_18:
    v22 = 0;
  }

  v25 = -[HFMediaAccessoryItem initWithValueSource:mediaProfileContainer:](self, "initWithValueSource:mediaProfileContainer:", v7, v22);
  return v25;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  id v5;

  -[HFMediaAccessoryItem valueSource](self, "valueSource", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HFMediaAccessoryItem copyWithValueSource:](self, "copyWithValueSource:", v4);

  return v5;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMediaAccessoryItem mediaProfileContainer](self, "mediaProfileContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_prettyDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", v5, CFSTR("mediaProfile"));

  -[HFItem latestResults](self, "latestResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("childItems"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendObject:withName:", v8, CFSTR("controlItems"));

  objc_msgSend(v3, "build");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (HFMediaValueSource)mediaValueSource
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;

  -[HFMediaAccessoryItem valueSource](self, "valueSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1F0411F10))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  if (v5)
  {
    v6 = v3;
  }
  else
  {
    -[HFMediaAccessoryItem mediaProfileContainer](self, "mediaProfileContainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hf_mediaValueSource");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (HFMediaValueSource *)v6;
}

- (id)createControlItemsWithOptions:(id)a3
{
  void *v4;
  HFMediaControlItem *v5;
  void *v6;
  void *v7;
  HFMediaControlItem *v8;
  void *v9;
  int v10;
  HFHomePodAlarmControlItem *v11;
  void *v12;
  HFHomePodAlarmControlItem *v13;
  HFHomePodTimerControlItem *v14;
  void *v15;
  HFHomePodTimerControlItem *v16;

  v4 = (void *)objc_opt_new();
  if (-[HFMediaAccessoryItem supportsMediaQuickControls](self, "supportsMediaQuickControls"))
  {
    v5 = [HFMediaControlItem alloc];
    -[HFMediaAccessoryItem mediaValueSource](self, "mediaValueSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFMediaAccessoryItem mediaProfileContainer](self, "mediaProfileContainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[HFMediaControlItem initWithValueSource:mediaProfileContainer:mediaAccessoryItemType:displayResults:](v5, "initWithValueSource:mediaProfileContainer:mediaAccessoryItemType:displayResults:", v6, v7, -[HFMediaAccessoryItem mediaAccessoryItemType](self, "mediaAccessoryItemType"), 0);
    objc_msgSend(v4, "na_safeAddObject:", v8);

  }
  -[HFMediaAccessoryItem home](self, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hf_currentUserIsAdministrator");

  if (v10)
  {
    if (-[HFMediaAccessoryItem supportsAlarmQuickControls](self, "supportsAlarmQuickControls"))
    {
      v11 = [HFHomePodAlarmControlItem alloc];
      -[HFMediaAccessoryItem mediaProfileContainer](self, "mediaProfileContainer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[HFHomePodAlarmControlItem initWithMediaProfileContainer:displayResults:](v11, "initWithMediaProfileContainer:displayResults:", v12, 0);
      objc_msgSend(v4, "na_safeAddObject:", v13);

    }
    if (-[HFMediaAccessoryItem supportsTimerQuickControls](self, "supportsTimerQuickControls"))
    {
      v14 = [HFHomePodTimerControlItem alloc];
      -[HFMediaAccessoryItem mediaProfileContainer](self, "mediaProfileContainer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[HFHomePodTimerControlItem initWithMediaProfileContainer:displayResults:](v14, "initWithMediaProfileContainer:displayResults:", v15, 0);
      objc_msgSend(v4, "na_safeAddObject:", v16);

    }
  }
  return v4;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  HFMediaAccessoryItem *v11;

  v4 = a3;
  -[HFMediaAccessoryItem performStandardUpdateWithOptions:](self, "performStandardUpdateWithOptions:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__HFMediaAccessoryItem__subclass_updateWithOptions___block_invoke;
  v9[3] = &unk_1EA740810;
  v10 = v4;
  v11 = self;
  v6 = v4;
  objc_msgSend(v5, "flatMap:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __52__HFMediaAccessoryItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  __CFString *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  HFMutableItemUpdateOutcome *v10;
  void *v11;
  HFMutableItemUpdateOutcome *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  int v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  HFMediaActionSetting *v41;
  HFMediaActionSetting *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  _QWORD v80[4];
  HFMediaActionSetting *v81;
  uint8_t buf[4];
  const char *v83;
  __int16 v84;
  void *v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v4 = HFItemUpdateOptionActionBuilders;
  v5 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_firstObjectPassingTest:", &__block_literal_global_229);
  v7 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", HFItemUpdateOptionFastInitialUpdate);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  v79 = (void *)v7;
  objc_msgSend(*(id *)(a1 + 40), "setIsItemInActionBuilder:", v7 != 0);
  v10 = [HFMutableItemUpdateOutcome alloc];
  objc_msgSend(v5, "standardResults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[HFItemUpdateOutcome initWithResults:](v10, "initWithResults:", v11);
  objc_msgSend(*(id *)(a1 + 40), "mediaProfileContainer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v13, CFSTR("HFMediaAccessoryItemProfileContainerKey"));

  objc_msgSend(*(id *)(a1 + 40), "mediaProfileContainer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v14, CFSTR("HFResultHomeKitSettingsVendorKey"));

  objc_msgSend(*(id *)(a1 + 40), "mediaProfileContainer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "hf_mediaRouteIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v16, CFSTR("HFResultMediaRouteIdentifierKey"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v17, CFSTR("HFResultMediaRouteIdentifierKey"));

  }
  +[HFExecutionEnvironment sharedInstance](HFExecutionEnvironment, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "hostProcess") == 100)
  {

  }
  else
  {
    +[HFExecutionEnvironment sharedInstance](HFExecutionEnvironment, "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "hostProcess");

    if (v20 != 3)
      goto LABEL_9;
  }
  if (!+[HFUtilities isDeviceUnlocked](HFUtilities, "isDeviceUnlocked"))
    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("isDisabled"));
LABEL_9:
  objc_msgSend(*(id *)(a1 + 40), "_decorateServiceLikeItemKeys:", v12);
  if (v9)
    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", &unk_1EA7CD618, CFSTR("state"));
  else
    objc_msgSend(*(id *)(a1 + 40), "_decorateWithMediaSessionKeys:", v12);
  objc_msgSend(*(id *)(a1 + 40), "_decorateOutcomeWithAccessorySpecificKeys:", v12);
  objc_msgSend(*(id *)(a1 + 40), "_decorateWithMediaSystemSpecificKeys:", v12);
  objc_msgSend(*(id *)(a1 + 40), "_decorateWithSiriEndpointProfileSpecificKeys:", v12);
  objc_msgSend(*(id *)(a1 + 40), "mediaProfileContainer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v21, "hf_isReachable") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "mediaProfileContainer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "hasValidSettings");

    if ((v23 & 1) == 0)
      objc_msgSend(*(id *)(a1 + 40), "_decorateSettingsSyncKeys:", v12);
  }
  else
  {

  }
  if (objc_msgSend(*(id *)(a1 + 40), "isHomePod"))
  {
    +[HFMediaAccessoryUtility sharedInstance](HFMediaAccessoryUtility, "sharedInstance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "mediaProfileContainer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "hf_backingAccessory");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "uniqueIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "UUIDString");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v24, "isHomePodRestartingCurrently:", v28);

  }
  else
  {
    v29 = 0;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "isHomePodAndIsInMediaSystem"))
  {
    +[HFMediaAccessoryUtility sharedInstance](HFMediaAccessoryUtility, "sharedInstance");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "mediaProfileContainer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "uniqueIdentifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "UUIDString");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v30, "isHomePodRestartingCurrently:", v33);

    v35 = v34 ^ 1;
    if (!v29)
      goto LABEL_21;
LABEL_24:
    HFLogForCategory(0);
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 40), "mediaProfileContainer");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "hf_backingAccessory");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "uniqueIdentifier");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v83 = "-[HFMediaAccessoryItem _subclass_updateWithOptions:]_block_invoke";
      v84 = 2112;
      v85 = v75;
      _os_log_debug_impl(&dword_1DD34E000, v36, OS_LOG_TYPE_DEBUG, "%s container is a solo HomePod that's restarting (uuid: %@)", buf, 0x16u);

    }
    HFLogForCategory(0);
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 40), "mediaProfileContainer");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "uniqueIdentifier");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "UUIDString");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v83 = "-[HFMediaAccessoryItem _subclass_updateWithOptions:]_block_invoke";
      v84 = 2112;
      v85 = v78;
      _os_log_debug_impl(&dword_1DD34E000, v37, OS_LOG_TYPE_DEBUG, "%s container is a stereo pair HomePod that's restarting (uuid: %@)", buf, 0x16u);

    }
    if ((v9 & 1) != 0)
      goto LABEL_30;
    goto LABEL_29;
  }
  v35 = 1;
  if (v29)
    goto LABEL_24;
LABEL_21:
  if ((v9 & 1) != 0)
    goto LABEL_30;
LABEL_29:
  if ((objc_msgSend(*(id *)(a1 + 40), "isItemInActionBuilder") & v29 ^ 1 | v35) == 1)
  {
LABEL_30:
    HFLogForCategory(0);
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v83 = "-[HFMediaAccessoryItem _subclass_updateWithOptions:]_block_invoke";
      _os_log_debug_impl(&dword_1DD34E000, v38, OS_LOG_TYPE_DEBUG, "%s Decorating with Software Update State keys", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "_decorateWithSoftwareUpdateStateKeys:", v12);
    goto LABEL_36;
  }
  HFLogForCategory(0);
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v83 = "-[HFMediaAccessoryItem _subclass_updateWithOptions:]_block_invoke";
    _os_log_debug_impl(&dword_1DD34E000, v39, OS_LOG_TYPE_DEBUG, "%s NOT decorating with Software Update State keys", buf, 0xCu);
  }

LABEL_36:
  objc_msgSend(*(id *)(a1 + 40), "createControlItemsWithOptions:", *(_QWORD *)(a1 + 32));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 40), "isItemInActionBuilder"))
  {
    v41 = -[HFMediaActionSetting initWithActionBuilder:]([HFMediaActionSetting alloc], "initWithActionBuilder:", v79);
    v80[0] = MEMORY[0x1E0C809B0];
    v80[1] = 3221225472;
    v80[2] = __52__HFMediaAccessoryItem__subclass_updateWithOptions___block_invoke_295;
    v80[3] = &unk_1EA7407C8;
    v81 = v41;
    v42 = v41;
    objc_msgSend(v40, "na_each:", v80);

  }
  objc_msgSend(*(id *)(a1 + 40), "mediaProfileContainer");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "accessories");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "na_any:", &__block_literal_global_299) ^ 1;

  v46 = (id)objc_msgSend(*(id *)(a1 + 40), "_decorateWithDiagnosticInfoKeys:cdpStatusGood:", v12, v45);
  objc_msgSend(*(id *)(a1 + 40), "_decorateWithSymptomFixInFlightKeys:", v12);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", HFItemUpdateOptionPreviousResults);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("childItems"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v48;
  if (v48)
  {
    v50 = v48;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v50 = (id)objc_claimAutoreleasedReturnValue();
  }
  v51 = v50;

  objc_msgSend(v51, "na_setByDiffingWithSet:", v40);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v52, CFSTR("childItems"));
  -[HFItemUpdateOutcome objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("description"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  if (v53)
  {
    v54 = (void *)MEMORY[0x1E0CB3498];
    -[HFItemUpdateOutcome objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("description"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFItemUpdateOutcome objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("title"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "hf_attributedStringWithInflectableAccessoryStatus:accessoryName:", v55, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "string");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v58, CFSTR("description"));

  }
  -[HFItemUpdateOutcome objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("controlDescription"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  if (v59)
  {
    v60 = (void *)MEMORY[0x1E0CB3498];
    -[HFItemUpdateOutcome objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("controlDescription"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFItemUpdateOutcome objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("title"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "hf_attributedStringWithInflectableAccessoryStatus:accessoryName:", v61, v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "string");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v64, CFSTR("controlDescription"));

  }
  -[HFItemUpdateOutcome objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("detailedControlDescription"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  if (v65)
  {
    v66 = (void *)MEMORY[0x1E0CB3498];
    -[HFItemUpdateOutcome objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("detailedControlDescription"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFItemUpdateOutcome objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("title"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "hf_attributedStringWithInflectableAccessoryStatus:accessoryName:", v67, v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "string");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v70, CFSTR("detailedControlDescription"));

  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v12);
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  return v71;
}

uint64_t __52__HFMediaAccessoryItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __52__HFMediaAccessoryItem__subclass_updateWithOptions___block_invoke_295(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;

  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    v3 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
    v5 = v4;

    objc_msgSend(v5, "setMediaActionSetting:", *(_QWORD *)(a1 + 32));
  }

}

uint64_t __52__HFMediaAccessoryItem__subclass_updateWithOptions___block_invoke_2_297(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  int v5;

  v2 = a2;
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "diagnosticInfoManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isCDPStatusGoodForAccessory:", v2);

  return v5 ^ 1u;
}

- (id)room
{
  void *v2;
  void *v3;

  -[HFMediaAccessoryItem mediaProfileContainer](self, "mediaProfileContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_parentRoom");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HFMediaAccessoryCommonSettingsManager)commonSettingsManager
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[HFMediaAccessoryItem accessories](self, "accessories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "mediaProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_mediaAccessoryCommonSettingsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (HFMediaAccessoryCommonSettingsManager *)v5;
}

- (BOOL)isSiriEndpointAccessory
{
  void *v2;
  void *v3;

  -[HFMediaAccessoryItem accessories](self, "accessories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "hf_isSiriEndpoint");
  return (char)v2;
}

- (BOOL)_hasOnboarded
{
  void *v2;
  void *v3;

  -[HFMediaAccessoryItem accessories](self, "accessories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "hf_needsOnboarding") ^ 1;
  return (char)v2;
}

- (BOOL)isAnnounceEnabled
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  -[HFMediaAccessoryItem mediaProfileContainer](self, "mediaProfileContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_settingsValueManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[HFMediaAccessoryItem isSiriEndpointAccessory](self, "isSiriEndpointAccessory"))
  {
    if (v4)
    {
      objc_msgSend(v3, "settings");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "hf_accessorySettingAtKeyPath:", CFSTR("root.announce.enabled"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      objc_msgSend(v4, "valueForSetting:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 = v9;
      else
        v10 = 0;
      v7 = v10;

      if (v7)
      {
        LOBYTE(v7) = objc_msgSend(v7, "BOOLValue");

        v6 = v9;
      }
      goto LABEL_10;
    }
LABEL_11:
    LOBYTE(v7) = 0;
    goto LABEL_12;
  }
  -[HFMediaAccessoryItem commonSettingsManager](self, "commonSettingsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "settingValueForKeyPath:", HFAnnounceEnabledKeyPath);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_11;
  LOBYTE(v7) = objc_msgSend(v6, "BOOLValue");
LABEL_10:

LABEL_12:
  return (char)v7;
}

- (id)setEnableAnnounce:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = a3;
  -[HFMediaAccessoryItem mediaProfileContainer](self, "mediaProfileContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_settingsValueManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_backingAccessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HFMediaAccessoryItem isSiriEndpointAccessory](self, "isSiriEndpointAccessory"))
  {
    -[HFMediaAccessoryItem commonSettingsManager](self, "commonSettingsManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hf_backingAccessory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "home");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uniqueIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = HFAnnounceEnabledKeyPath;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateAccessorySettingWithHomeIdentifier:accessoryIdentifier:keyPath:rawSettingValue:", v12, v8, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v5, "settings");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "hf_accessorySettingAtKeyPath:", CFSTR("root.announce.enabled"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v17 = v6;
    else
      v17 = 0;
    objc_msgSend(v17, "changeValueForSetting:toValue:", v9, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (BOOL)isAudioAnalysisEnabled
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[HFMediaAccessoryItem mediaProfileContainer](self, "mediaProfileContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_settingsValueManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[HFMediaAccessoryItem isSiriEndpointAccessory](self, "isSiriEndpointAccessory"))
  {
    if (v4)
    {
      objc_msgSend(v3, "settings");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "hf_accessorySettingAtKeyPath:", CFSTR("root.audioAnalysis.enabled"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      objc_msgSend(v4, "valueForSetting:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 = v9;
      else
        v10 = 0;
      v7 = v10;

      HFLogForCategory(0);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 136315650;
        v14 = "-[HFMediaAccessoryItem isAudioAnalysisEnabled]";
        v15 = 2112;
        v16 = v6;
        v17 = 2112;
        v18 = v3;
        _os_log_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_DEFAULT, "%s audioAnalysisEnabledSetting = %@ for mediaProfileContainer = %@", (uint8_t *)&v13, 0x20u);
      }

      if (v7)
      {
        LOBYTE(v7) = objc_msgSend(v7, "BOOLValue");

        v6 = v9;
      }
      goto LABEL_12;
    }
LABEL_13:
    LOBYTE(v7) = 0;
    goto LABEL_14;
  }
  -[HFMediaAccessoryItem commonSettingsManager](self, "commonSettingsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "settingValueForKeyPath:", HFAudioAnalysisEnabledKeyPath);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_13;
  LOBYTE(v7) = objc_msgSend(v6, "BOOLValue");
LABEL_12:

LABEL_14:
  return (char)v7;
}

- (id)setEnableAudioAnalysis:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = a3;
  -[HFMediaAccessoryItem mediaProfileContainer](self, "mediaProfileContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_settingsValueManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_backingAccessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HFMediaAccessoryItem isSiriEndpointAccessory](self, "isSiriEndpointAccessory"))
  {
    -[HFMediaAccessoryItem commonSettingsManager](self, "commonSettingsManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hf_backingAccessory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "home");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uniqueIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = HFAudioAnalysisEnabledKeyPath;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateAccessorySettingWithHomeIdentifier:accessoryIdentifier:keyPath:rawSettingValue:", v12, v8, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v5, "settings");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "hf_accessorySettingAtKeyPath:", CFSTR("root.audioAnalysis.enabled"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "changeValueForSetting:toValue:", v9, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (id)profiles
{
  void *v2;
  void *v3;

  -[HFMediaAccessoryItem mediaProfileContainer](self, "mediaProfileContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaProfiles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)settings
{
  void *v2;
  void *v3;

  -[HFMediaAccessoryItem mediaProfileContainer](self, "mediaProfileContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)copyWithValueSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  -[HFMediaAccessoryItem homeKitObject](self, "homeKitObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "conformsToProtocol:", &unk_1F0449888))
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  v8 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithValueSource:mediaProfileContainer:", v4, v7);
  objc_msgSend(v8, "copyLatestResultsFromItem:", self);
  return v8;
}

- (unint64_t)_effectiveLoadingStateForSuggestedLoadingState:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;

  -[HFMediaAccessoryItem mediaProfileContainer](self, "mediaProfileContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_settingsValueManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "pendingWrites");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    a3 = 2;
  }
  else
  {
    -[HFMediaAccessoryItem mediaValueSource](self, "mediaValueSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFMediaAccessoryItem mediaProfileContainer](self, "mediaProfileContainer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hf_mediaRouteIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "hasPendingWritesForRouteID:", v11);

    if (v12)
      a3 = 2;
  }

  return a3;
}

- (HMHome)home
{
  void *v2;
  void *v3;

  -[HFMediaAccessoryItem mediaProfileContainer](self, "mediaProfileContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMHome *)v3;
}

- (NSSet)services
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (id)accessories
{
  void *v2;
  void *v3;

  -[HFMediaAccessoryItem mediaProfileContainer](self, "mediaProfileContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)mediaProfileContainers
{
  void *v2;
  void *v3;
  void *v4;

  -[HFMediaAccessoryItem profiles](self, "profiles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_map:", &__block_literal_global_307_1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __46__HFMediaAccessoryItem_mediaProfileContainers__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1F0449888))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)serviceLikeBuilderInHome:(id)a3
{
  id v4;
  HFMediaSystemBuilder *v5;
  id v6;
  HFAccessoryBuilder *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v4 = a3;
  if (-[HFMediaAccessoryItem isHomePodMediaSystem](self, "isHomePodMediaSystem"))
  {
    v5 = [HFMediaSystemBuilder alloc];
    -[HFMediaAccessoryItem homeKitObject](self, "homeKitObject");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = -[HFMediaSystemBuilder initWithExistingObject:inHome:](v5, "initWithExistingObject:inHome:", v6, v4);
  }
  else
  {
    objc_opt_class();
    -[HFMediaAccessoryItem homeKitObject](self, "homeKitObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v6 = v9;

    objc_msgSend(v6, "accessory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      -[HFMediaAccessoryItem homeKitObject](self, "homeKitObject");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;

    v7 = -[HFAccessoryBuilder initWithExistingObject:inHome:]([HFAccessoryBuilder alloc], "initWithExistingObject:inHome:", v13, v4);
    v4 = v13;
  }

  return v7;
}

- (id)namingComponentForHomeKitObject
{
  void *v2;
  void *v3;

  -[HFMediaAccessoryItem homeKitObject](self, "homeKitObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFNamingComponents namingComponentFromHomeKitObject:](HFNamingComponents, "namingComponentFromHomeKitObject:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isItemGroup
{
  void *v2;
  char isKindOfClass;

  -[HFMediaAccessoryItem mediaProfileContainer](self, "mediaProfileContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (unint64_t)numberOfItemsContainedWithinGroup
{
  void *v2;
  unint64_t v3;

  -[HFMediaAccessoryItem mediaProfileContainer](self, "mediaProfileContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfItemsContainedWithinGroup");

  return v3;
}

- (NSSet)accessoriesSupportingSoftwareUpdate
{
  void *v2;
  void *v3;

  -[HFMediaAccessoryItem accessories](self, "accessories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_filter:", &__block_literal_global_313_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

BOOL __59__HFMediaAccessoryItem_accessoriesSupportingSoftwareUpdate__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "softwareUpdateController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)allowsAppleMusicAccount
{
  return (unint64_t)(-[HFMediaAccessoryItem mediaAccessoryItemType](self, "mediaAccessoryItemType") - 1) < 4;
}

- (BOOL)supportsMediaAction
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[HFMediaAccessoryItem allowsAppleMusicAccount](self, "allowsAppleMusicAccount");
  if (v3)
  {
    -[HFMediaAccessoryItem mediaProfileContainer](self, "mediaProfileContainer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hf_supportsMediaActions");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isHomePodMediaSystem
{
  void *v3;
  void *v4;
  id v5;
  BOOL v6;

  objc_opt_class();
  -[HFMediaAccessoryItem homeKitObject](self, "homeKitObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  v6 = v5 != 0;

  return v6;
}

- (BOOL)isHomePod
{
  void *v2;
  void *v3;
  char v4;

  -[HFMediaAccessoryItem mediaProfileContainer](self, "mediaProfileContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_backingAccessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hf_isHomePod");

  return v4;
}

- (unint64_t)homePodVariant
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;

  if (-[HFMediaAccessoryItem isHomePod](self, "isHomePod"))
  {
    -[HFMediaAccessoryItem mediaProfileContainer](self, "mediaProfileContainer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "hf_backingAccessory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "homePodVariant");
  }
  else
  {
    if (!-[HFMediaAccessoryItem isHomePodMediaSystem](self, "isHomePodMediaSystem"))
      return 0;
    -[HFMediaAccessoryItem mediaProfileContainer](self, "mediaProfileContainer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessories");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "anyObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "homePodVariant");

  }
  return v5;
}

- (BOOL)supportsMultiUser
{
  int v3;
  void *v4;
  void *v5;
  char v6;
  BOOL v7;

  v3 = _os_feature_enabled_impl();
  -[HFMediaAccessoryItem mediaProfileContainer](self, "mediaProfileContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = objc_msgSend(v4, "hf_supportsMultiUser");
  else
    v6 = objc_msgSend(v4, "hf_homePodSupportsMultiUser");
  v7 = v6;

  return v7;
}

- (BOOL)isStandaloneHomePod
{
  _BOOL4 v3;

  v3 = -[HFMediaAccessoryItem isHomePod](self, "isHomePod");
  if (v3)
    LOBYTE(v3) = !-[HFMediaAccessoryItem isContainedWithinItemGroup](self, "isContainedWithinItemGroup");
  return v3;
}

- (BOOL)isHomePodStereoPair
{
  _BOOL4 v3;

  v3 = -[HFMediaAccessoryItem isHomePodMediaSystem](self, "isHomePodMediaSystem");
  if (v3)
    LOBYTE(v3) = !-[HFMediaAccessoryItem isContainedWithinItemGroup](self, "isContainedWithinItemGroup");
  return v3;
}

- (BOOL)isHomePodAndIsInMediaSystem
{
  _BOOL4 v3;

  v3 = -[HFMediaAccessoryItem isHomePod](self, "isHomePod");
  if (v3)
    LOBYTE(v3) = -[HFMediaAccessoryItem isContainedWithinMediaSystem](self, "isContainedWithinMediaSystem");
  return v3;
}

- (BOOL)isContainedWithinMediaSystem
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (-[HFMediaAccessoryItem isHomePodMediaSystem](self, "isHomePodMediaSystem"))
    return 0;
  -[HFMediaAccessoryItem room](self, "room");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMediaAccessoryItem mediaProfileContainer](self, "mediaProfileContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hf_backingAccessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_mediaSystemForAccessory:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v8 != 0;

  return v3;
}

- (BOOL)isAppleTV
{
  void *v2;
  void *v3;
  char v4;

  -[HFMediaAccessoryItem mediaProfileContainer](self, "mediaProfileContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_backingAccessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hf_isAppleTV");

  return v4;
}

- (BOOL)isAirPort
{
  void *v2;
  void *v3;
  char v4;

  -[HFMediaAccessoryItem mediaProfileContainer](self, "mediaProfileContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_backingAccessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hf_isAirPortExpressSpeaker");

  return v4;
}

- (BOOL)_isDumbSpeaker
{
  void *v2;
  void *v3;
  char v4;

  -[HFMediaAccessoryItem mediaProfileContainer](self, "mediaProfileContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_backingAccessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hf_isDumbSpeaker");

  return v4;
}

- (BOOL)_isHAPCapableSpeaker
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[HFMediaAccessoryItem mediaProfileContainer](self, "mediaProfileContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_backingAccessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mediaProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "capability") == 1;

  return v5;
}

- (BOOL)isAudioReceiver
{
  void *v2;
  void *v3;
  char v4;

  -[HFMediaAccessoryItem mediaProfileContainer](self, "mediaProfileContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_backingAccessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hf_isAudioReceiver");

  return v4;
}

- (BOOL)isSiriDisabled
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[HFMediaAccessoryItem mediaProfileContainer](self, "mediaProfileContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_settingsValueManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFMediaAccessoryItem mediaProfileContainer](self, "mediaProfileContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_backingAccessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hf_isSiriEndpoint");

  if (v7)
  {
    -[HFMediaAccessoryItem commonSettingsManager](self, "commonSettingsManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "settingValueForKeyPath:", HFAllowHeySiriSettingKeyPath);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = objc_msgSend(v9, "BOOLValue") ^ 1;
LABEL_14:

      goto LABEL_15;
    }
  }
  else if (v4)
  {
    -[HFMediaAccessoryItem settings](self, "settings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hf_accessorySettingAtKeyPath:", CFSTR("root.siri.allowHeySiri"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    HFLogForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      -[HFMediaAccessoryItem mediaProfileContainer](self, "mediaProfileContainer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412802;
      v19 = v17;
      v20 = 2080;
      v21 = "-[HFMediaAccessoryItem isSiriDisabled]";
      v22 = 2112;
      v23 = v9;
      _os_log_debug_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_DEBUG, "%@:%s heySiriSetting = %@", (uint8_t *)&v18, 0x20u);

    }
    objc_opt_class();
    objc_msgSend(v4, "valueForSetting:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
    v15 = v14;

    if (v15)
    {
      v10 = objc_msgSend(v15, "BOOLValue") ^ 1;

    }
    else
    {
      LOBYTE(v10) = 0;
    }
    goto LABEL_14;
  }
  LOBYTE(v10) = 0;
LABEL_15:

  return v10;
}

- (id)setSiriDisabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = a3;
  -[HFMediaAccessoryItem mediaProfileContainer](self, "mediaProfileContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_backingAccessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hf_isSiriEndpoint");

  -[HFMediaAccessoryItem mediaProfileContainer](self, "mediaProfileContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    objc_msgSend(v8, "hf_backingAccessory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uniqueIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[HFMediaAccessoryItem commonSettingsManager](self, "commonSettingsManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFMediaAccessoryItem home](self, "home");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "uniqueIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = HFAllowHeySiriSettingKeyPath;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", !v3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "updateAccessorySettingWithHomeIdentifier:accessoryIdentifier:keyPath:rawSettingValue:", v14, v11, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v8, "hf_settingsValueManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[HFMediaAccessoryItem settings](self, "settings");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "hf_accessorySettingAtKeyPath:", CFSTR("root.siri.allowHeySiri"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", !v3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "changeValueForSetting:toValue:", v12, v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (BOOL)isDoorbellChimeEnabled
{
  void *v2;
  BOOL v3;

  -[HFMediaAccessoryItem mediaProfileContainer](self, "mediaProfileContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[HFMediaHelper isDoorbellChimeEnabled:](HFMediaHelper, "isDoorbellChimeEnabled:", v2);

  return v3;
}

- (id)enableDoorbellChime:(BOOL)a3
{
  _BOOL8 v3;
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
  __CFString *v17;
  void *v18;
  void *v19;
  void *v21;

  v3 = a3;
  -[HFMediaAccessoryItem mediaProfileContainer](self, "mediaProfileContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_settingsValueManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFMediaAccessoryItem settings](self, "settings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hf_accessorySettingAtKeyPath:", CFSTR("root.doorbellChime.enabled"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 || !-[HFMediaAccessoryItem isSiriEndpointAccessory](self, "isSiriEndpointAccessory"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "changeValueForSetting:toValue:", v8, v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HFMediaAccessoryItem mediaProfileContainer](self, "mediaProfileContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hf_backingAccessory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "mediaProfile");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hf_mediaAccessoryCommonSettingsManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[HFMediaAccessoryItem home](self, "home");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "uniqueIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFMediaAccessoryItem mediaProfileContainer](self, "mediaProfileContainer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "hf_backingAccessory");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = HFDoorbellChimeEnabledKeyPath;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "updateAccessorySettingWithHomeIdentifier:accessoryIdentifier:keyPath:rawSettingValue:", v13, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v19;
}

- (BOOL)supportsPlaybackState
{
  unint64_t v2;

  v2 = -[HFMediaAccessoryItem mediaAccessoryItemType](self, "mediaAccessoryItemType");
  return (v2 > 8) | (0x5Fu >> v2) & 1;
}

- (BOOL)supportsMediaQuickControls
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[HFMediaAccessoryItem mediaProfileContainer](self, "mediaProfileContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_mediaValueSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0;
  v5 = -[HFMediaAccessoryItem mediaAccessoryItemType](self, "mediaAccessoryItemType");
  if (v5 <= 9)
    return (0x1F6u >> v5) & 1;
  else
    return 1;
}

- (BOOL)supportsAlarmQuickControls
{
  return -[HFMediaAccessoryItem isStandaloneHomePod](self, "isStandaloneHomePod")
      || -[HFMediaAccessoryItem isHomePodStereoPair](self, "isHomePodStereoPair")
      || -[HFMediaAccessoryItem isSiriEndpointAccessory](self, "isSiriEndpointAccessory")
      && -[HFMediaAccessoryItem supportsCoordinationForAlarmsAndTimers](self, "supportsCoordinationForAlarmsAndTimers");
}

- (BOOL)supportsTimerQuickControls
{
  _BOOL4 v3;

  v3 = -[HFMediaAccessoryItem supportsCoordinationForAlarmsAndTimers](self, "supportsCoordinationForAlarmsAndTimers");
  if (v3)
    LOBYTE(v3) = -[HFMediaAccessoryItem isStandaloneHomePod](self, "isStandaloneHomePod")
              || -[HFMediaAccessoryItem isHomePodStereoPair](self, "isHomePodStereoPair")
              || -[HFMediaAccessoryItem isSiriEndpointAccessory](self, "isSiriEndpointAccessory")
              && -[HFMediaAccessoryItem supportsCoordinationForAlarmsAndTimers](self, "supportsCoordinationForAlarmsAndTimers");
  return v3;
}

- (BOOL)supportsCoordinationForAlarmsAndTimers
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v8;
  void *v9;
  char v10;

  if (-[HFMediaAccessoryItem isHomePod](self, "isHomePod"))
  {
    -[HFMediaAccessoryItem mediaProfileContainer](self, "mediaProfileContainer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "hf_backingAccessory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "softwareVersion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hf_canSupportCoordination");

    return v6;
  }
  else if (-[HFMediaAccessoryItem isHomePodMediaSystem](self, "isHomePodMediaSystem"))
  {
    -[HFMediaAccessoryItem mediaProfileContainer](self, "mediaProfileContainer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessories");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "na_all:", &__block_literal_global_317_1);

    return v10;
  }
  else
  {
    return _os_feature_enabled_impl();
  }
}

uint64_t __62__HFMediaAccessoryItem_supportsCoordinationForAlarmsAndTimers__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "softwareVersion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hf_canSupportCoordination");

  return v3;
}

- (BOOL)supportsDirectObliteration
{
  void *v3;
  void *v4;
  void *v5;

  if (!-[HFMediaAccessoryItem isHomePod](self, "isHomePod") || !_os_feature_enabled_impl())
    return 0;
  -[HFMediaAccessoryItem accessories](self, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v5, "supportsCompanionInitiatedObliterate");
  return (char)v3;
}

- (void)_decorateOutcomeWithAccessorySpecificKeys:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[HFMediaAccessoryItem iconDescriptor:](self, "iconDescriptor:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (objc_msgSend(v7, "isSystemImage"))
  {
    objc_msgSend(v7, "imageIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, CFSTR("iconNames"));

  }
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v5, CFSTR("icon"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HFMediaAccessoryItem preferredActionOnTap:](self, "preferredActionOnTap:", v11));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, CFSTR("controlItemPurpose"));

  if (-[HFMediaAccessoryItem shouldShowMutedMicIcon](self, "shouldShowMutedMicIcon"))
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("descriptionBadge"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      objc_msgSend(v11, "setObject:forKeyedSubscript:", &unk_1EA7CD630, CFSTR("descriptionBadge"));
  }

}

- (BOOL)shouldShowMutedMicIcon
{
  _BOOL4 v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _BOOL4 v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  _BOOL4 v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = -[HFMediaAccessoryItem isSiriDisabled](self, "isSiriDisabled");
  v4 = v3;
  HFLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    -[HFMediaAccessoryItem mediaProfileContainer](self, "mediaProfileContainer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138413058;
    v21 = v14;
    v22 = 2080;
    v23 = "-[HFMediaAccessoryItem shouldShowMutedMicIcon]";
    v24 = 1024;
    v25 = v3;
    v26 = 1024;
    LODWORD(v27) = -[HFMediaAccessoryItem isSiriDisabled](self, "isSiriDisabled");
    _os_log_debug_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEBUG, "%@:%s shouldShowMutedMicIcon = %{BOOL}d AND  self.isSiriDisabled = %{BOOL}d", (uint8_t *)&v20, 0x22u);

  }
  -[HFMediaAccessoryItem mediaProfileContainer](self, "mediaProfileContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "na_all:", &__block_literal_global_324);
  HFLogForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    -[HFMediaAccessoryItem mediaProfileContainer](self, "mediaProfileContainer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFMediaAccessoryItem home](self, "home");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "audioAnalysisClassifierOptions");
    v18 = -[HFMediaAccessoryItem isAudioAnalysisEnabled](self, "isAudioAnalysisEnabled");
    v20 = 138413314;
    v21 = v15;
    v22 = 2080;
    v23 = "-[HFMediaAccessoryItem shouldShowMutedMicIcon]";
    v24 = 1024;
    v25 = v8;
    v26 = 2048;
    v27 = v17;
    v28 = 1024;
    v29 = v18;
    _os_log_debug_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEBUG, "%@:%s supportsAudioAnalysis = %{BOOL}d AND self.home.audioAnalysisClassifierOptions = %lu, isAudioAnalysisEnabled = %{BOOL}d", (uint8_t *)&v20, 0x2Cu);

  }
  if (v8)
  {
    -[HFMediaAccessoryItem home](self, "home");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "audioAnalysisClassifierOptions");

    v4 = !v11 && v3;
    if (v11 && v3)
      v4 = !-[HFMediaAccessoryItem isAudioAnalysisEnabled](self, "isAudioAnalysisEnabled");
  }
  HFLogForCategory(0);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    -[HFMediaAccessoryItem mediaProfileContainer](self, "mediaProfileContainer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138412802;
    v21 = v19;
    v22 = 2080;
    v23 = "-[HFMediaAccessoryItem shouldShowMutedMicIcon]";
    v24 = 1024;
    v25 = v4;
    _os_log_debug_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_DEBUG, "%@:%s Returning  shouldShowMutedMicIcon = %{BOOL}d", (uint8_t *)&v20, 0x1Cu);

  }
  return v4;
}

uint64_t __46__HFMediaAccessoryItem_shouldShowMutedMicIcon__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "supportsAudioAnalysis");
}

- (void)_decorateWithSoftwareUpdateStateKeys:(id)a3
{
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  id v14;

  v14 = a3;
  if (!-[HFMediaAccessoryItem isHomePod](self, "isHomePod")
    && !-[HFMediaAccessoryItem isHomePodMediaSystem](self, "isHomePodMediaSystem"))
  {
    goto LABEL_16;
  }
  -[HFMediaAccessoryItem valueSource](self, "valueSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    goto LABEL_16;
  -[HFMediaAccessoryItem mediaProfileContainer](self, "mediaProfileContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hf_home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hf_currentUserIsOwner");

  if (!v8)
    goto LABEL_16;
  -[HFMediaAccessoryItem accessoriesSupportingSoftwareUpdate](self, "accessoriesSupportingSoftwareUpdate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "na_firstObjectPassingTest:", &__block_literal_global_326_0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "hf_isReadyToInstallSoftwareUpdate"))
  {
    objc_msgSend(v14, "setObject:forKeyedSubscript:", &unk_1EA7CD648, CFSTR("badge"));
    objc_msgSend(v14, "setObject:forKeyedSubscript:", &unk_1EA7CD660, CFSTR("descriptionBadge"));
    _HFLocalizedStringWithDefaultValue(CFSTR("HFMediaAccessoryStateDescriptionUpdateAvailable"), CFSTR("HFMediaAccessoryStateDescriptionUpdateAvailable"), 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v11, CFSTR("detailedControlDescription"));

  }
  if (objc_msgSend(v10, "hf_isInstallingSoftwareUpdate"))
  {
    v12 = CFSTR("HFFirmwareUpdateInstallingDescription");
    goto LABEL_11;
  }
  if (objc_msgSend(v10, "hf_isDownloadingSoftwareUpdate"))
  {
    v12 = CFSTR("HFFirmwareUpdateDownloadingDescription");
LABEL_11:
    _HFLocalizedStringWithDefaultValue(v12, v12, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, CFSTR("description"));
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, CFSTR("detailedControlDescription"));

    }
  }
  if (objc_msgSend(v10, "supportsSoftwareUpdateV2"))
    objc_msgSend(v14, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("hasSoftwareUpdateV2Dependency"));

LABEL_16:
}

uint64_t __61__HFMediaAccessoryItem__decorateWithSoftwareUpdateStateKeys___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "hf_isReadyToInstallSoftwareUpdate")
    && (objc_msgSend(v2, "isControllable") & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    v3 = objc_msgSend(v2, "hf_isSoftwareUpdateInProgress");
  }

  return v3;
}

- (void)_decorateWithMediaSessionKeys:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  __CFString *v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  -[HFMediaAccessoryItem mediaValueSource](self, "mediaValueSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMediaAccessoryItem mediaProfileContainer](self, "mediaProfileContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_mediaRouteIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "lastPlaybackStateForProfileForRouteID:", v6);

  -[HFMediaAccessoryItem mediaProfileContainer](self, "mediaProfileContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mediaProfiles");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "na_any:", &__block_literal_global_336_0);

  if ((v10 & 1) != 0 || -[HFMediaAccessoryItem isItemInActionBuilder](self, "isItemInActionBuilder"))
  {
    switch(v7)
    {
      case 0:
        if (-[HFMediaAccessoryItem isItemInActionBuilder](self, "isItemInActionBuilder"))
          goto LABEL_8;
        if (!v10)
          goto LABEL_10;
        v11 = CFSTR("HFStatusDescriptionSpeaker_NotPlaying");
        goto LABEL_9;
      case 1:
        if (-[HFMediaAccessoryItem isItemInActionBuilder](self, "isItemInActionBuilder"))
          v13 = CFSTR("HFMediaAccessoryStateControlDescriptionPlay");
        else
          v13 = CFSTR("HFMediaAccessoryStateDescriptionPlaying");
        v7 = 1;
        goto LABEL_26;
      case 3:
        if (-[HFMediaAccessoryItem isItemInActionBuilder](self, "isItemInActionBuilder"))
          v14 = CFSTR("HFMediaAccessoryStateControlDescriptionStop");
        else
          v14 = CFSTR("HFMediaAccessoryStateDescriptionStopped");
        _HFLocalizedStringWithDefaultValue(v14, v14, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = 3;
        break;
      case 4:
        if (-[HFMediaAccessoryItem isItemInActionBuilder](self, "isItemInActionBuilder"))
        {
          v12 = 0;
        }
        else
        {
          _HFLocalizedStringWithDefaultValue(CFSTR("HFMediaAccessoryStateDescriptionInterrupted"), CFSTR("HFMediaAccessoryStateDescriptionInterrupted"), 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v7 = 4;
        break;
      case 6:
        if (-[HFMediaAccessoryItem isItemInActionBuilder](self, "isItemInActionBuilder"))
        {
          v12 = 0;
        }
        else
        {
          _HFLocalizedStringWithDefaultValue(CFSTR("HFMediaAccessoryStateDescriptionLoading"), CFSTR("HFMediaAccessoryStateDescriptionLoading"), 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v7 = 6;
        break;
      default:
        if (-[HFMediaAccessoryItem isItemInActionBuilder](self, "isItemInActionBuilder"))
          v13 = CFSTR("HFMediaAccessoryStateControlDescriptionPause");
        else
          v13 = CFSTR("HFMediaAccessoryStateDescriptionPaused");
LABEL_26:
        _HFLocalizedStringWithDefaultValue(v13, v13, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        break;
    }
  }
  else if (-[HFMediaAccessoryItem isItemInActionBuilder](self, "isItemInActionBuilder"))
  {
LABEL_8:
    v11 = CFSTR("HFMediaAccessoryStateControlDescriptionVolume");
LABEL_9:
    _HFLocalizedStringWithDefaultValue(v11, v11, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
  }
  else
  {
LABEL_10:
    v7 = 0;
    v12 = 0;
  }
  if (-[HFMediaAccessoryItem isItemInActionBuilder](self, "isItemInActionBuilder"))
  {
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v12, CFSTR("description"));
    if (v7 == 2)
      v15 = 1;
    else
      v15 = 2;
  }
  else
  {
    if (v12)
    {
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("description"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
        if (-[HFMediaAccessoryItem supportsPlaybackState](self, "supportsPlaybackState"))
          v17 = v12;
        else
          v17 = 0;
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v17, CFSTR("description"));
      }
    }
    if (v7 == 1)
      v15 = 2;
    else
      v15 = 1;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, CFSTR("state"));

}

uint64_t __54__HFMediaAccessoryItem__decorateWithMediaSessionKeys___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v2 = a2;
  objc_msgSend(v2, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "settings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_msgSend(v4, "isControllable");
  }
  else
  {
    objc_msgSend(v2, "accessory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_msgSend(v4, "isReachable");
  }
  v6 = v5;

  return v6;
}

- (void)_decorateSettingsSyncKeys:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((-[HFMediaAccessoryItem isHomePod](self, "isHomePod")
     || -[HFMediaAccessoryItem isHomePodMediaSystem](self, "isHomePodMediaSystem"))
    && !-[HFMediaAccessoryItem isItemInActionBuilder](self, "isItemInActionBuilder"))
  {
    _HFLocalizedStringWithDefaultValue(CFSTR("HFMediaAccessoryStateSettingsSyncingStatus"), CFSTR("HFMediaAccessoryStateSettingsSyncingStatus"), 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("description"));

    _HFLocalizedStringWithDefaultValue(CFSTR("HFMediaAccessoryStateSettingsSyncingDescription"), CFSTR("HFMediaAccessoryStateSettingsSyncingDescription"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("longErrorDescription"));

    HFLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      -[HFMediaAccessoryItem mediaProfileContainer](self, "mediaProfileContainer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 136315394;
      v10 = "-[HFMediaAccessoryItem _decorateSettingsSyncKeys:]";
      v11 = 2112;
      v12 = v8;
      _os_log_debug_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEBUG, "%s mediaProfileContainer: %@ is Configuring", (uint8_t *)&v9, 0x16u);

    }
  }

}

- (void)_decorateServiceLikeItemKeys:(id)a3
{
  void *v4;
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
  id v15;

  v15 = a3;
  -[HFMediaAccessoryItem serviceNameComponents](self, "serviceNameComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v4, CFSTR("serviceNameComponents"));
    objc_msgSend(v4, "composedString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v5, CFSTR("title"));
    objc_msgSend(v4, "serviceName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v6, CFSTR("shortTitle"));

  }
  -[HFMediaAccessoryItem room](self, "room");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "safeSetObject:forKey:", v8, CFSTR("roomIdentifier"));

  -[HFMediaAccessoryItem mediaProfileContainer](self, "mediaProfileContainer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hf_dateAdded");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "safeSetObject:forKey:", v10, CFSTR("dateAdded"));

  -[HFMediaAccessoryItem mediaProfileContainer](self, "mediaProfileContainer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = objc_msgSend(v11, "hf_hasSetFavorite");

  if ((_DWORD)v10)
  {
    v12 = (void *)MEMORY[0x1E0CB37E8];
    -[HFMediaAccessoryItem mediaProfileContainer](self, "mediaProfileContainer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "numberWithBool:", objc_msgSend(v13, "hf_isFavorite"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, CFSTR("isFavorite"));

  }
}

- (void)_decorateWithMediaSystemSpecificKeys:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (-[HFMediaAccessoryItem isHomePodMediaSystem](self, "isHomePodMediaSystem")
    || -[HFMediaAccessoryItem isHomePod](self, "isHomePod"))
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("dependentHomeKitObjects"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "mutableCopy");
    v6 = v5;
    if (v5)
      v7 = v5;
    else
      v7 = (id)objc_opt_new();
    v8 = v7;

    -[HFMediaAccessoryItem settings](self, "settings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hf_accessorySettingAtKeyPath:", CFSTR("root.siri.allowHeySiri"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "na_safeAddObject:", v10);

    objc_msgSend(v12, "setObject:forKeyedSubscript:", v8, CFSTR("dependentHomeKitObjects"));
    if (-[HFMediaAccessoryItem isHomePodMediaSystem](self, "isHomePodMediaSystem"))
    {
      _HFLocalizedStringWithDefaultValue(CFSTR("HFMediaSystemTypeDescription"), CFSTR("HFMediaSystemTypeDescription"), 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, CFSTR("detailText"));

    }
  }

}

- (void)_decorateWithSiriEndpointProfileSpecificKeys:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (-[HFMediaAccessoryItem isSiriEndpointAccessory](self, "isSiriEndpointAccessory"))
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("dependentHomeKitObjects"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "mutableCopy");
    v6 = v5;
    if (v5)
      v7 = v5;
    else
      v7 = (id)objc_opt_new();
    v8 = v7;

    -[HFMediaAccessoryItem accessories](self, "accessories");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "anyObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hf_siriEndpointProfile");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "na_safeAddObject:", v11);

    objc_msgSend(v12, "setObject:forKeyedSubscript:", v8, CFSTR("dependentHomeKitObjects"));
  }

}

- (id)_decorateWithDiagnosticInfoKeys:(id)a3 cdpStatusGood:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  __CFString *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v4 = a4;
  v6 = a3;
  if (-[HFMediaAccessoryItem _shouldDecorateDiagnosticInfoWithKeys:cdpStatusGood:](self, "_shouldDecorateDiagnosticInfoWithKeys:cdpStatusGood:", v6, v4))
  {
    _HFLocalizedStringWithDefaultValue(CFSTR("HFSymptomDescriptionProblemAccount"), CFSTR("HFSymptomDescriptionProblemAccount"), 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("description"));

    if (-[HFMediaAccessoryItem isAppleTV](self, "isAppleTV"))
      v8 = CFSTR("HFSymptomDescriptionProblemAccountMessageAppleTV");
    else
      v8 = CFSTR("HFSymptomDescriptionProblemAccountMessageHomePod");
    _HFLocalizedStringWithDefaultValue(v8, v8, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("longErrorDescription"));

    if (-[HFMediaAccessoryItem isAppleTV](self, "isAppleTV"))
      v10 = CFSTR("HFSymptomDescriptionProblemFixAccountMessageAppleTV");
    else
      v10 = CFSTR("HFSymptomDescriptionProblemFixAccountMessageHomePod");
    _HFLocalizedStringWithDefaultValue(v10, v10, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("errorMessageTitle"));

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("descriptionBadge"));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12)
      v14 = (void *)v12;
    else
      v14 = &unk_1EA7CD678;
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, CFSTR("descriptionBadge"));

  }
  return v6;
}

- (void)_decorateWithSymptomFixInFlightKeys:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_opt_class();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("symptom"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("updateInProgress"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if (v7 && (objc_msgSend(v5, "type") == 1 || objc_msgSend(v5, "type") == 2 || objc_msgSend(v5, "type") == 20))
  {
    _HFLocalizedStringWithDefaultValue(CFSTR("HFServiceDescriptionAuthenticatingAccount"), CFSTR("HFServiceDescriptionAuthenticatingAccount"), 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("updateInProgressTitle"));

  }
}

- (id)performStandardUpdateWithOptions:(id)a3
{
  id v4;
  HFMediaAccessoryItemUpdateRequest *v5;
  void *v6;
  void *v7;
  HFMediaAccessoryItemUpdateRequest *v8;
  void *v9;

  v4 = a3;
  v5 = [HFMediaAccessoryItemUpdateRequest alloc];
  -[HFMediaAccessoryItem mediaProfileContainer](self, "mediaProfileContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMediaAccessoryItem valueSource](self, "valueSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HFMediaAccessoryItemUpdateRequest initWithMediaProfileContainer:valueSource:](v5, "initWithMediaProfileContainer:valueSource:", v6, v7);

  -[HFMediaAccessoryItemUpdateRequest updateWithOptions:](v8, "updateWithOptions:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)_shouldDecorateDiagnosticInfoWithKeys:(id)a3 cdpStatusGood:(BOOL)a4
{
  id v6;
  BOOL v7;
  void *v8;
  BOOL v9;
  BOOL v10;

  v6 = a3;
  v7 = -[HFMediaAccessoryItem isHomePod](self, "isHomePod")
    || -[HFMediaAccessoryItem isHomePodMediaSystem](self, "isHomePodMediaSystem")
    || -[HFMediaAccessoryItem isAppleTV](self, "isAppleTV");
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("symptom"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v9 = 0;
  else
    v9 = v7;
  v10 = v9 && !a4;

  return v10;
}

- (BOOL)_isInstallingSoftwareUpdate
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[HFMediaAccessoryItem accessoriesSupportingSoftwareUpdate](self, "accessoriesSupportingSoftwareUpdate", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "hf_isInstallingSoftwareUpdate") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)serviceNameComponents
{
  void *v2;
  void *v3;

  -[HFMediaAccessoryItem mediaProfileContainer](self, "mediaProfileContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_serviceNameComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)iconDescriptor:(id)a3
{
  void *v4;
  uint64_t v5;
  __CFString **v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HFImageIconDescriptor *v13;
  const __CFString *v14;
  void *v15;
  _BOOL4 v16;
  HFCAPackageIconDescriptor *v17;
  void *v18;
  _BOOL4 v19;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("state"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  v6 = &HFCAPackageStateOn;
  if (v5 != 2)
    v6 = &HFCAPackageStateOff;
  v7 = *v6;
  v8 = (void *)MEMORY[0x1E0CEA650];
  objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configurationWithHierarchicalColor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithTextStyle:scale:", *MEMORY[0x1E0CEB5B8], 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "configurationByApplyingConfiguration:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  switch(-[HFMediaAccessoryItem mediaAccessoryItemType](self, "mediaAccessoryItemType"))
  {
    case 0:
    case 5:
    case 6:
    case 9:
      v13 = [HFImageIconDescriptor alloc];
      v14 = CFSTR("hifispeaker.fill");
      goto LABEL_14;
    case 1:
      v13 = [HFImageIconDescriptor alloc];
      v14 = CFSTR("appletv.fill");
      goto LABEL_14;
    case 2:
    case 3:
      -[HFMediaAccessoryItem mediaProfileContainer](self, "mediaProfileContainer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = +[HFMediaHelper isHomePodMini:](HFMediaHelper, "isHomePodMini:", v15);

      v13 = [HFImageIconDescriptor alloc];
      if (v16)
        v14 = CFSTR("homepodmini.fill");
      else
        v14 = CFSTR("homepod.fill");
      goto LABEL_14;
    case 4:
      -[HFMediaAccessoryItem mediaProfileContainer](self, "mediaProfileContainer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = +[HFMediaHelper isHomePodMiniMediaSystem:](HFMediaHelper, "isHomePodMiniMediaSystem:", v18);

      v13 = [HFImageIconDescriptor alloc];
      if (v19)
        v14 = CFSTR("homepodmini.2.fill");
      else
        v14 = CFSTR("homepod.2.fill");
      goto LABEL_14;
    case 7:
      v13 = [HFImageIconDescriptor alloc];
      v14 = CFSTR("airport.extreme");
LABEL_14:
      v17 = -[HFImageIconDescriptor initWithSystemImageNamed:configuration:](v13, "initWithSystemImageNamed:configuration:", v14, v12);
      goto LABEL_15;
    case 8:
      v17 = -[HFCAPackageIconDescriptor initWithPackageIdentifier:state:]([HFCAPackageIconDescriptor alloc], "initWithPackageIdentifier:state:", CFSTR("HFCAPackageIconIdentifierReceiver"), v7);
LABEL_15:
      self = (HFMediaAccessoryItem *)v17;
      break;
    default:
      break;
  }

  return self;
}

- (unint64_t)preferredActionOnTap:(id)a3
{
  unint64_t v4;

  if (-[HFMediaAccessoryItem isItemInActionBuilder](self, "isItemInActionBuilder", a3))
    return 8;
  v4 = -[HFMediaAccessoryItem mediaAccessoryItemType](self, "mediaAccessoryItemType");
  if (v4 > 9)
    return 8;
  else
    return qword_1DD669DB0[v4];
}

- (BOOL)containsActions
{
  return 1;
}

- (BOOL)actionsMayRequireDeviceUnlock
{
  return 0;
}

- (id)currentStateActionBuildersForHome:(id)a3
{
  id v4;
  HFMediaPlaybackActionBuilder *v5;
  void *v6;
  void *v7;
  void *v8;
  HFPlaybackArchive *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = -[HFItemBuilder initWithHome:]([HFMediaPlaybackActionBuilder alloc], "initWithHome:", v4);

  v6 = (void *)MEMORY[0x1E0C99E20];
  -[HFMediaAccessoryItem mediaProfileContainer](self, "mediaProfileContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMediaPlaybackActionBuilder setMediaProfiles:](v5, "setMediaProfiles:", v8);

  if (+[HFUtilities isAMac](HFUtilities, "isAMac")
    || +[HFUtilities isAVisionPro](HFUtilities, "isAVisionPro"))
  {
    -[HFMediaPlaybackActionBuilder setTargetPlayState:](v5, "setTargetPlayState:", 2);
    -[HFMediaPlaybackActionBuilder setPlaybackArchive:](v5, "setPlaybackArchive:", 0);
  }
  else
  {
    -[HFMediaPlaybackActionBuilder setTargetPlayState:](v5, "setTargetPlayState:", 1);
    v9 = -[HFPlaybackArchive initWithMediaPlayerPlaybackArchive:]([HFPlaybackArchive alloc], "initWithMediaPlayerPlaybackArchive:", 0);
    -[HFMediaPlaybackActionBuilder setPlaybackArchive:](v5, "setPlaybackArchive:", v9);

  }
  v10 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "futureWithResult:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (HFHomeKitObject)homeKitObject
{
  return self->_homeKitObject;
}

- (HFHomeKitSettingsVendor)homeKitSettingsVendor
{
  return self->_homeKitSettingsVendor;
}

- (HFCharacteristicValueSource)valueSource
{
  return self->_valueSource;
}

- (HFMediaProfileContainer)mediaProfileContainer
{
  return self->_mediaProfileContainer;
}

- (int64_t)mediaAccessoryItemType
{
  return self->_mediaAccessoryItemType;
}

- (BOOL)isItemInActionBuilder
{
  return self->_isItemInActionBuilder;
}

- (void)setIsItemInActionBuilder:(BOOL)a3
{
  self->_isItemInActionBuilder = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaProfileContainer, 0);
  objc_storeStrong((id *)&self->_valueSource, 0);
  objc_storeStrong((id *)&self->_homeKitSettingsVendor, 0);
  objc_storeStrong((id *)&self->_homeKitObject, 0);
}

@end
