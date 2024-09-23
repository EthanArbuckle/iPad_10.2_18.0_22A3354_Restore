@implementation AFPeerInfo

- (AFPeerInfo)initWithIsDeviceOwnedByCurrentUser:(BOOL)a3 assistantIdentifier:(id)a4 idsIdentifier:(id)a5 idsDeviceUniqueIdentifier:(id)a6 sharedUserID:(id)a7 rapportEffectiveIdentifier:(id)a8 homeKitAccessoryIdentifier:(id)a9 mediaSystemIdentifier:(id)a10 mediaRouteIdentifier:(id)a11 isCommunalDevice:(BOOL)a12 roomName:(id)a13 name:(id)a14 productType:(id)a15 buildVersion:(id)a16 userInterfaceIdiom:(id)a17 aceVersion:(id)a18 myriadTrialTreatment:(id)a19
{
  uint64_t v20;
  uint64_t v21;

  LOWORD(v21) = 256;
  LOBYTE(v20) = a12;
  return -[AFPeerInfo initWithIsDeviceOwnedByCurrentUser:assistantIdentifier:sharedUserIdentifier:idsIdentifier:idsDeviceUniqueIdentifier:rapportEffectiveIdentifier:homeKitAccessoryIdentifier:mediaSystemIdentifier:mediaRouteIdentifier:isCommunalDevice:roomName:name:productType:buildVersion:userInterfaceIdiom:aceVersion:isLocationSharingDevice:isSiriCloudSyncEnabled:myriadTrialTreatment:](self, "initWithIsDeviceOwnedByCurrentUser:assistantIdentifier:sharedUserIdentifier:idsIdentifier:idsDeviceUniqueIdentifier:rapportEffectiveIdentifier:homeKitAccessoryIdentifier:mediaSystemIdentifier:mediaRouteIdentifier:isCommunalDevice:roomName:name:productType:buildVersion:userInterfaceIdiom:aceVersion:isLocationSharingDevice:isSiriCloudSyncEnabled:myriadTrialTreatment:", a3, a4, a7, a5, a6, a8, a9, a10, a11, v20, a13, a14, a15, a16,
           a17,
           a18,
           v21,
           a19);
}

- (id)ad_shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;

  v15 = (void *)MEMORY[0x1E0CB3940];
  -[AFPeerInfo assistantIdentifier](self, "assistantIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "ad_shortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFPeerInfo idsDeviceUniqueIdentifier](self, "idsDeviceUniqueIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "ad_shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFPeerInfo mediaSystemIdentifier](self, "mediaSystemIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ad_shortDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFPeerInfo mediaRouteIdentifier](self, "mediaRouteIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ad_shortDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFPeerInfo name](self, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFPeerInfo roomName](self, "roomName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[AFPeerInfo isCommunalDevice](self, "isCommunalDevice");
  -[AFPeerInfo myriadTrialTreatment](self, "myriadTrialTreatment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("(assistant=%@, ids=%@, media(s/r)=%@/%@, nm=%@, rm=%@, communal=%d, tt=%@)"), v3, v4, v6, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (AFPeerInfo)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFPeerInfoMutation *);
  AFPeerInfo *v5;
  AFPeerInfo *v6;
  _AFPeerInfoMutation *v7;
  void *v8;
  uint64_t v9;
  NSString *assistantIdentifier;
  void *v11;
  uint64_t v12;
  NSString *sharedUserIdentifier;
  void *v14;
  uint64_t v15;
  NSString *idsIdentifier;
  void *v17;
  uint64_t v18;
  NSString *idsDeviceUniqueIdentifier;
  void *v20;
  uint64_t v21;
  NSString *rapportEffectiveIdentifier;
  void *v23;
  uint64_t v24;
  NSString *homeKitAccessoryIdentifier;
  void *v26;
  uint64_t v27;
  NSString *mediaSystemIdentifier;
  void *v29;
  uint64_t v30;
  NSString *mediaRouteIdentifier;
  void *v32;
  uint64_t v33;
  NSString *roomName;
  void *v35;
  uint64_t v36;
  NSString *name;
  void *v38;
  uint64_t v39;
  NSString *productType;
  void *v41;
  uint64_t v42;
  NSString *buildVersion;
  void *v44;
  uint64_t v45;
  NSString *userInterfaceIdiom;
  void *v47;
  uint64_t v48;
  NSString *aceVersion;
  void *v50;
  uint64_t v51;
  NSString *myriadTrialTreatment;
  objc_super v54;

  v4 = (void (**)(id, _AFPeerInfoMutation *))a3;
  v54.receiver = self;
  v54.super_class = (Class)AFPeerInfo;
  v5 = -[AFPeerInfo init](&v54, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFPeerInfoMutation initWithBase:]([_AFPeerInfoMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFPeerInfoMutation isDirty](v7, "isDirty"))
    {
      v6->_isDeviceOwnedByCurrentUser = -[_AFPeerInfoMutation getIsDeviceOwnedByCurrentUser](v7, "getIsDeviceOwnedByCurrentUser");
      -[_AFPeerInfoMutation getAssistantIdentifier](v7, "getAssistantIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      assistantIdentifier = v6->_assistantIdentifier;
      v6->_assistantIdentifier = (NSString *)v9;

      -[_AFPeerInfoMutation getSharedUserIdentifier](v7, "getSharedUserIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      sharedUserIdentifier = v6->_sharedUserIdentifier;
      v6->_sharedUserIdentifier = (NSString *)v12;

      -[_AFPeerInfoMutation getIdsIdentifier](v7, "getIdsIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "copy");
      idsIdentifier = v6->_idsIdentifier;
      v6->_idsIdentifier = (NSString *)v15;

      -[_AFPeerInfoMutation getIdsDeviceUniqueIdentifier](v7, "getIdsDeviceUniqueIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "copy");
      idsDeviceUniqueIdentifier = v6->_idsDeviceUniqueIdentifier;
      v6->_idsDeviceUniqueIdentifier = (NSString *)v18;

      -[_AFPeerInfoMutation getRapportEffectiveIdentifier](v7, "getRapportEffectiveIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "copy");
      rapportEffectiveIdentifier = v6->_rapportEffectiveIdentifier;
      v6->_rapportEffectiveIdentifier = (NSString *)v21;

      -[_AFPeerInfoMutation getHomeKitAccessoryIdentifier](v7, "getHomeKitAccessoryIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "copy");
      homeKitAccessoryIdentifier = v6->_homeKitAccessoryIdentifier;
      v6->_homeKitAccessoryIdentifier = (NSString *)v24;

      -[_AFPeerInfoMutation getMediaSystemIdentifier](v7, "getMediaSystemIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "copy");
      mediaSystemIdentifier = v6->_mediaSystemIdentifier;
      v6->_mediaSystemIdentifier = (NSString *)v27;

      -[_AFPeerInfoMutation getMediaRouteIdentifier](v7, "getMediaRouteIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "copy");
      mediaRouteIdentifier = v6->_mediaRouteIdentifier;
      v6->_mediaRouteIdentifier = (NSString *)v30;

      v6->_isCommunalDevice = -[_AFPeerInfoMutation getIsCommunalDevice](v7, "getIsCommunalDevice");
      -[_AFPeerInfoMutation getRoomName](v7, "getRoomName");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "copy");
      roomName = v6->_roomName;
      v6->_roomName = (NSString *)v33;

      -[_AFPeerInfoMutation getName](v7, "getName");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "copy");
      name = v6->_name;
      v6->_name = (NSString *)v36;

      -[_AFPeerInfoMutation getProductType](v7, "getProductType");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "copy");
      productType = v6->_productType;
      v6->_productType = (NSString *)v39;

      -[_AFPeerInfoMutation getBuildVersion](v7, "getBuildVersion");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "copy");
      buildVersion = v6->_buildVersion;
      v6->_buildVersion = (NSString *)v42;

      -[_AFPeerInfoMutation getUserInterfaceIdiom](v7, "getUserInterfaceIdiom");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "copy");
      userInterfaceIdiom = v6->_userInterfaceIdiom;
      v6->_userInterfaceIdiom = (NSString *)v45;

      -[_AFPeerInfoMutation getAceVersion](v7, "getAceVersion");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "copy");
      aceVersion = v6->_aceVersion;
      v6->_aceVersion = (NSString *)v48;

      v6->_isLocationSharingDevice = -[_AFPeerInfoMutation getIsLocationSharingDevice](v7, "getIsLocationSharingDevice");
      v6->_isSiriCloudSyncEnabled = -[_AFPeerInfoMutation getIsSiriCloudSyncEnabled](v7, "getIsSiriCloudSyncEnabled");
      -[_AFPeerInfoMutation getMyriadTrialTreatment](v7, "getMyriadTrialTreatment");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v50, "copy");
      myriadTrialTreatment = v6->_myriadTrialTreatment;
      v6->_myriadTrialTreatment = (NSString *)v51;

    }
  }

  return v6;
}

- (AFPeerInfo)init
{
  return -[AFPeerInfo initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFPeerInfo)initWithIsDeviceOwnedByCurrentUser:(BOOL)a3 assistantIdentifier:(id)a4 sharedUserIdentifier:(id)a5 idsIdentifier:(id)a6 idsDeviceUniqueIdentifier:(id)a7 rapportEffectiveIdentifier:(id)a8 homeKitAccessoryIdentifier:(id)a9 mediaSystemIdentifier:(id)a10 mediaRouteIdentifier:(id)a11 isCommunalDevice:(BOOL)a12 roomName:(id)a13 name:(id)a14 productType:(id)a15 buildVersion:(id)a16 userInterfaceIdiom:(id)a17 aceVersion:(id)a18 isLocationSharingDevice:(BOOL)a19 myriadTrialTreatment:(id)a20
{
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  AFPeerInfo *v40;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v50;
  id v51;
  id v52;
  id v54;
  id v55;
  id v56;
  id v57;
  _QWORD v58[4];
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  BOOL v74;
  BOOL v75;
  BOOL v76;

  v57 = a4;
  v56 = a5;
  v55 = a6;
  v54 = a7;
  v24 = a8;
  v25 = a9;
  v26 = a10;
  v27 = a11;
  v28 = a13;
  v29 = a14;
  v30 = a15;
  v31 = a16;
  v32 = a17;
  v33 = a18;
  v34 = a20;
  v58[0] = MEMORY[0x1E0C809B0];
  v58[1] = 3221225472;
  v58[2] = __358__AFPeerInfo_initWithIsDeviceOwnedByCurrentUser_assistantIdentifier_sharedUserIdentifier_idsIdentifier_idsDeviceUniqueIdentifier_rapportEffectiveIdentifier_homeKitAccessoryIdentifier_mediaSystemIdentifier_mediaRouteIdentifier_isCommunalDevice_roomName_name_productType_buildVersion_userInterfaceIdiom_aceVersion_isLocationSharingDevice_myriadTrialTreatment___block_invoke;
  v58[3] = &unk_1E3A36D18;
  v74 = a3;
  v59 = v57;
  v60 = v56;
  v61 = v55;
  v62 = v54;
  v63 = v24;
  v64 = v25;
  v65 = v26;
  v66 = v27;
  v75 = a12;
  v67 = v28;
  v68 = v29;
  v69 = v30;
  v70 = v31;
  v71 = v32;
  v72 = v33;
  v76 = a19;
  v73 = v34;
  v52 = v34;
  v51 = v33;
  v50 = v32;
  v48 = v31;
  v47 = v30;
  v46 = v29;
  v45 = v28;
  v44 = v27;
  v43 = v26;
  v42 = v25;
  v35 = v24;
  v36 = v54;
  v37 = v55;
  v38 = v56;
  v39 = v57;
  v40 = -[AFPeerInfo initWithBuilder:](self, "initWithBuilder:", v58);

  return v40;
}

- (AFPeerInfo)initWithIsDeviceOwnedByCurrentUser:(BOOL)a3 assistantIdentifier:(id)a4 sharedUserIdentifier:(id)a5 idsIdentifier:(id)a6 idsDeviceUniqueIdentifier:(id)a7 rapportEffectiveIdentifier:(id)a8 homeKitAccessoryIdentifier:(id)a9 mediaSystemIdentifier:(id)a10 mediaRouteIdentifier:(id)a11 isCommunalDevice:(BOOL)a12 roomName:(id)a13 name:(id)a14 productType:(id)a15 buildVersion:(id)a16 userInterfaceIdiom:(id)a17 aceVersion:(id)a18 isLocationSharingDevice:(BOOL)a19 isSiriCloudSyncEnabled:(BOOL)a20 myriadTrialTreatment:(id)a21
{
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  AFPeerInfo *v41;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v50;
  id v51;
  id v52;
  id v53;
  id v55;
  id v56;
  id v57;
  id v58;
  _QWORD v59[4];
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  BOOL v75;
  BOOL v76;
  BOOL v77;
  BOOL v78;

  v58 = a4;
  v57 = a5;
  v56 = a6;
  v55 = a7;
  v25 = a8;
  v26 = a9;
  v27 = a10;
  v28 = a11;
  v29 = a13;
  v30 = a14;
  v31 = a15;
  v32 = a16;
  v33 = a17;
  v34 = a18;
  v35 = a21;
  v59[0] = MEMORY[0x1E0C809B0];
  v59[1] = 3221225472;
  v59[2] = __381__AFPeerInfo_initWithIsDeviceOwnedByCurrentUser_assistantIdentifier_sharedUserIdentifier_idsIdentifier_idsDeviceUniqueIdentifier_rapportEffectiveIdentifier_homeKitAccessoryIdentifier_mediaSystemIdentifier_mediaRouteIdentifier_isCommunalDevice_roomName_name_productType_buildVersion_userInterfaceIdiom_aceVersion_isLocationSharingDevice_isSiriCloudSyncEnabled_myriadTrialTreatment___block_invoke;
  v59[3] = &unk_1E3A36D40;
  v75 = a3;
  v60 = v58;
  v61 = v57;
  v62 = v56;
  v63 = v55;
  v64 = v25;
  v65 = v26;
  v66 = v27;
  v67 = v28;
  v76 = a12;
  v68 = v29;
  v69 = v30;
  v70 = v31;
  v71 = v32;
  v72 = v33;
  v73 = v34;
  v77 = a19;
  v78 = a20;
  v74 = v35;
  v53 = v35;
  v52 = v34;
  v51 = v33;
  v50 = v32;
  v48 = v31;
  v47 = v30;
  v46 = v29;
  v45 = v28;
  v44 = v27;
  v43 = v26;
  v36 = v25;
  v37 = v55;
  v38 = v56;
  v39 = v57;
  v40 = v58;
  v41 = -[AFPeerInfo initWithBuilder:](self, "initWithBuilder:", v59);

  return v41;
}

- (NSString)description
{
  return (NSString *)-[AFPeerInfo _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  objc_super v13;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v13.receiver = self;
  v13.super_class = (Class)AFPeerInfo;
  -[AFPeerInfo description](&v13, sel_description);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = CFSTR("YES");
  if (self->_isDeviceOwnedByCurrentUser)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  if (self->_isCommunalDevice)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  if (self->_isLocationSharingDevice)
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  if (!self->_isSiriCloudSyncEnabled)
    v7 = CFSTR("NO");
  v11 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {isDeviceOwnedByCurrentUser = %@, assistantIdentifier = %@, sharedUserIdentifier = %@, idsIdentifier = %@, idsDeviceUniqueIdentifier = %@, rapportEffectiveIdentifier = %@, homeKitAccessoryIdentifier = %@, mediaSystemIdentifier = %@, mediaRouteIdentifier = %@, isCommunalDevice = %@, roomName = %@, name = %@, productType = %@, buildVersion = %@, userInterfaceIdiom = %@, aceVersion = %@, isLocationSharingDevice = %@, isSiriCloudSyncEnabled = %@, trialTreatment = %@}"), v5, v8, *(_OWORD *)&self->_assistantIdentifier, *(_OWORD *)&self->_idsIdentifier, *(_OWORD *)&self->_rapportEffectiveIdentifier, self->_mediaSystemIdentifier, self->_mediaRouteIdentifier, v9, *(_OWORD *)&self->_roomName, *(_OWORD *)&self->_productType, self->_userInterfaceIdiom, self->_aceVersion, v10, v7, self->_myriadTrialTreatment);

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  void *v13;
  uint64_t v14;
  NSUInteger v15;
  NSUInteger v16;
  NSUInteger v17;
  NSUInteger v18;
  NSUInteger v19;
  NSUInteger v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSUInteger v25;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isDeviceOwnedByCurrentUser);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[NSString hash](self->_assistantIdentifier, "hash");
  v6 = v5 ^ -[NSString hash](self->_sharedUserIdentifier, "hash");
  v7 = v6 ^ -[NSString hash](self->_idsIdentifier, "hash") ^ v4;
  v8 = -[NSString hash](self->_idsDeviceUniqueIdentifier, "hash");
  v9 = v8 ^ -[NSString hash](self->_rapportEffectiveIdentifier, "hash");
  v10 = v9 ^ -[NSString hash](self->_homeKitAccessoryIdentifier, "hash");
  v11 = v7 ^ v10 ^ -[NSString hash](self->_mediaSystemIdentifier, "hash");
  v12 = -[NSString hash](self->_mediaRouteIdentifier, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isCommunalDevice);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");
  v15 = v11 ^ v14 ^ -[NSString hash](self->_roomName, "hash");
  v16 = -[NSString hash](self->_name, "hash");
  v17 = v16 ^ -[NSString hash](self->_productType, "hash");
  v18 = v17 ^ -[NSString hash](self->_buildVersion, "hash");
  v19 = v18 ^ -[NSString hash](self->_userInterfaceIdiom, "hash");
  v20 = v19 ^ -[NSString hash](self->_aceVersion, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isLocationSharingDevice);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v15 ^ v20 ^ objc_msgSend(v21, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isSiriCloudSyncEnabled);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "hash");
  v25 = v22 ^ v24 ^ -[NSString hash](self->_myriadTrialTreatment, "hash");

  return v25;
}

- (BOOL)isEqual:(id)a3
{
  AFPeerInfo *v4;
  AFPeerInfo *v5;
  _BOOL4 isDeviceOwnedByCurrentUser;
  _BOOL4 isCommunalDevice;
  _BOOL4 isLocationSharingDevice;
  _BOOL4 isSiriCloudSyncEnabled;
  NSString *v10;
  NSString *assistantIdentifier;
  NSString *v12;
  NSString *sharedUserIdentifier;
  NSString *v14;
  NSString *idsIdentifier;
  NSString *v16;
  NSString *idsDeviceUniqueIdentifier;
  NSString *v18;
  NSString *rapportEffectiveIdentifier;
  NSString *v20;
  NSString *homeKitAccessoryIdentifier;
  NSString *v22;
  NSString *mediaSystemIdentifier;
  NSString *v24;
  NSString *mediaRouteIdentifier;
  NSString *v26;
  NSString *roomName;
  NSString *v28;
  NSString *name;
  NSString *v30;
  NSString *productType;
  uint64_t v32;
  NSString *buildVersion;
  NSString *v34;
  NSString *userInterfaceIdiom;
  uint64_t v36;
  NSString *aceVersion;
  uint64_t v38;
  NSString *myriadTrialTreatment;
  void *v40;
  BOOL v41;
  NSString *v43;
  void *v44;
  NSString *v45;
  void *v46;
  NSString *v47;
  NSString *v48;
  NSString *v49;
  NSString *v50;

  v4 = (AFPeerInfo *)a3;
  if (self == v4)
  {
    v41 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      isDeviceOwnedByCurrentUser = self->_isDeviceOwnedByCurrentUser;
      if (isDeviceOwnedByCurrentUser == -[AFPeerInfo isDeviceOwnedByCurrentUser](v5, "isDeviceOwnedByCurrentUser")
        && (isCommunalDevice = self->_isCommunalDevice,
            isCommunalDevice == -[AFPeerInfo isCommunalDevice](v5, "isCommunalDevice"))
        && (isLocationSharingDevice = self->_isLocationSharingDevice,
            isLocationSharingDevice == -[AFPeerInfo isLocationSharingDevice](v5, "isLocationSharingDevice"))
        && (isSiriCloudSyncEnabled = self->_isSiriCloudSyncEnabled,
            isSiriCloudSyncEnabled == -[AFPeerInfo isSiriCloudSyncEnabled](v5, "isSiriCloudSyncEnabled")))
      {
        -[AFPeerInfo assistantIdentifier](v5, "assistantIdentifier");
        v10 = (NSString *)objc_claimAutoreleasedReturnValue();
        assistantIdentifier = self->_assistantIdentifier;
        if (assistantIdentifier == v10 || -[NSString isEqual:](assistantIdentifier, "isEqual:", v10))
        {
          -[AFPeerInfo sharedUserIdentifier](v5, "sharedUserIdentifier");
          v12 = (NSString *)objc_claimAutoreleasedReturnValue();
          sharedUserIdentifier = self->_sharedUserIdentifier;
          if (sharedUserIdentifier == v12 || -[NSString isEqual:](sharedUserIdentifier, "isEqual:", v12))
          {
            -[AFPeerInfo idsIdentifier](v5, "idsIdentifier");
            v14 = (NSString *)objc_claimAutoreleasedReturnValue();
            idsIdentifier = self->_idsIdentifier;
            if (idsIdentifier == v14 || -[NSString isEqual:](idsIdentifier, "isEqual:", v14))
            {
              -[AFPeerInfo idsDeviceUniqueIdentifier](v5, "idsDeviceUniqueIdentifier");
              v16 = (NSString *)objc_claimAutoreleasedReturnValue();
              idsDeviceUniqueIdentifier = self->_idsDeviceUniqueIdentifier;
              if (idsDeviceUniqueIdentifier == v16
                || -[NSString isEqual:](idsDeviceUniqueIdentifier, "isEqual:", v16))
              {
                -[AFPeerInfo rapportEffectiveIdentifier](v5, "rapportEffectiveIdentifier");
                v18 = (NSString *)objc_claimAutoreleasedReturnValue();
                rapportEffectiveIdentifier = self->_rapportEffectiveIdentifier;
                if (rapportEffectiveIdentifier == v18
                  || -[NSString isEqual:](rapportEffectiveIdentifier, "isEqual:", v18))
                {
                  -[AFPeerInfo homeKitAccessoryIdentifier](v5, "homeKitAccessoryIdentifier");
                  v20 = (NSString *)objc_claimAutoreleasedReturnValue();
                  homeKitAccessoryIdentifier = self->_homeKitAccessoryIdentifier;
                  if (homeKitAccessoryIdentifier == v20
                    || -[NSString isEqual:](homeKitAccessoryIdentifier, "isEqual:", v20))
                  {
                    -[AFPeerInfo mediaSystemIdentifier](v5, "mediaSystemIdentifier");
                    v22 = (NSString *)objc_claimAutoreleasedReturnValue();
                    mediaSystemIdentifier = self->_mediaSystemIdentifier;
                    if (mediaSystemIdentifier == v22
                      || -[NSString isEqual:](mediaSystemIdentifier, "isEqual:", v22))
                    {
                      v50 = v22;
                      -[AFPeerInfo mediaRouteIdentifier](v5, "mediaRouteIdentifier");
                      v24 = (NSString *)objc_claimAutoreleasedReturnValue();
                      mediaRouteIdentifier = self->_mediaRouteIdentifier;
                      if (mediaRouteIdentifier == v24
                        || -[NSString isEqual:](mediaRouteIdentifier, "isEqual:", v24))
                      {
                        v49 = v24;
                        -[AFPeerInfo roomName](v5, "roomName");
                        v26 = (NSString *)objc_claimAutoreleasedReturnValue();
                        roomName = self->_roomName;
                        if (roomName == v26 || -[NSString isEqual:](roomName, "isEqual:", v26))
                        {
                          v48 = v26;
                          -[AFPeerInfo name](v5, "name");
                          v28 = (NSString *)objc_claimAutoreleasedReturnValue();
                          name = self->_name;
                          if (name == v28 || -[NSString isEqual:](name, "isEqual:", v28))
                          {
                            v47 = v28;
                            -[AFPeerInfo productType](v5, "productType");
                            v30 = (NSString *)objc_claimAutoreleasedReturnValue();
                            productType = self->_productType;
                            if (productType == v30 || -[NSString isEqual:](productType, "isEqual:", v30))
                            {
                              v45 = v30;
                              -[AFPeerInfo buildVersion](v5, "buildVersion");
                              v32 = objc_claimAutoreleasedReturnValue();
                              buildVersion = self->_buildVersion;
                              v46 = (void *)v32;
                              if (buildVersion == (NSString *)v32
                                || -[NSString isEqual:](buildVersion, "isEqual:", v32))
                              {
                                -[AFPeerInfo userInterfaceIdiom](v5, "userInterfaceIdiom");
                                v34 = (NSString *)objc_claimAutoreleasedReturnValue();
                                userInterfaceIdiom = self->_userInterfaceIdiom;
                                if (userInterfaceIdiom == v34
                                  || -[NSString isEqual:](userInterfaceIdiom, "isEqual:", v34))
                                {
                                  -[AFPeerInfo aceVersion](v5, "aceVersion", v34);
                                  v36 = objc_claimAutoreleasedReturnValue();
                                  aceVersion = self->_aceVersion;
                                  v44 = (void *)v36;
                                  if (aceVersion == (NSString *)v36
                                    || -[NSString isEqual:](aceVersion, "isEqual:", v36))
                                  {
                                    -[AFPeerInfo myriadTrialTreatment](v5, "myriadTrialTreatment");
                                    v38 = objc_claimAutoreleasedReturnValue();
                                    myriadTrialTreatment = self->_myriadTrialTreatment;
                                    v40 = (void *)v38;
                                    v41 = myriadTrialTreatment == (NSString *)v38
                                       || -[NSString isEqual:](myriadTrialTreatment, "isEqual:", v38);

                                  }
                                  else
                                  {
                                    v41 = 0;
                                  }

                                  v34 = v43;
                                }
                                else
                                {
                                  v41 = 0;
                                }

                              }
                              else
                              {
                                v41 = 0;
                              }

                              v30 = v45;
                            }
                            else
                            {
                              v41 = 0;
                            }

                            v28 = v47;
                          }
                          else
                          {
                            v41 = 0;
                          }

                          v26 = v48;
                        }
                        else
                        {
                          v41 = 0;
                        }

                        v24 = v49;
                      }
                      else
                      {
                        v41 = 0;
                      }

                      v22 = v50;
                    }
                    else
                    {
                      v41 = 0;
                    }

                  }
                  else
                  {
                    v41 = 0;
                  }

                }
                else
                {
                  v41 = 0;
                }

              }
              else
              {
                v41 = 0;
              }

            }
            else
            {
              v41 = 0;
            }

          }
          else
          {
            v41 = 0;
          }

        }
        else
        {
          v41 = 0;
        }

      }
      else
      {
        v41 = 0;
      }

    }
    else
    {
      v41 = 0;
    }
  }

  return v41;
}

- (AFPeerInfo)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  unsigned int v24;
  AFPeerInfo *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFPeerInfo::isDeviceOwnedByCurrentUser"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v4, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFPeerInfo::assistantIdentifier"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFPeerInfo::sharedUserIdentifier"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFPeerInfo::idsIdentifier"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFPeerInfo::idsDeviceUniqueIdentifier"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFPeerInfo::rapportEffectiveIdentifier"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFPeerInfo::homeKitAccessoryIdentifier"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFPeerInfo::mediaSystemIdentifier"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFPeerInfo::mediaRouteIdentifier"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFPeerInfo::isCommunalDevice"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v5, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFPeerInfo::roomName"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFPeerInfo::name"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFPeerInfo::productType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFPeerInfo::buildVersion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFPeerInfo::userInterfaceIdiom"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFPeerInfo::aceVersion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFPeerInfo::isLocationSharingDevice"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFPeerInfo::isLocationSharingDevice"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = objc_msgSend(v11, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFPeerInfo::myriadTrialTreatment"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  BYTE1(v15) = (_BYTE)v9;
  LOBYTE(v15) = v10;
  LOBYTE(v14) = v21;
  v26 = -[AFPeerInfo initWithIsDeviceOwnedByCurrentUser:assistantIdentifier:sharedUserIdentifier:idsIdentifier:idsDeviceUniqueIdentifier:rapportEffectiveIdentifier:homeKitAccessoryIdentifier:mediaSystemIdentifier:mediaRouteIdentifier:isCommunalDevice:roomName:name:productType:buildVersion:userInterfaceIdiom:aceVersion:isLocationSharingDevice:isSiriCloudSyncEnabled:myriadTrialTreatment:](self, "initWithIsDeviceOwnedByCurrentUser:assistantIdentifier:sharedUserIdentifier:idsIdentifier:idsDeviceUniqueIdentifier:rapportEffectiveIdentifier:homeKitAccessoryIdentifier:mediaSystemIdentifier:mediaRouteIdentifier:isCommunalDevice:roomName:name:productType:buildVersion:userInterfaceIdiom:aceVersion:isLocationSharingDevice:isSiriCloudSyncEnabled:myriadTrialTreatment:", v24, v30, v29, v28, v27, v23, v22, v20, v19, v14, v18, v17, v6, v7,
          v16,
          v8,
          v15,
          v12);

  return v26;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  _BOOL8 isDeviceOwnedByCurrentUser;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  isDeviceOwnedByCurrentUser = self->_isDeviceOwnedByCurrentUser;
  v10 = a3;
  objc_msgSend(v4, "numberWithBool:", isDeviceOwnedByCurrentUser);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v6, CFSTR("AFPeerInfo::isDeviceOwnedByCurrentUser"));

  objc_msgSend(v10, "encodeObject:forKey:", self->_assistantIdentifier, CFSTR("AFPeerInfo::assistantIdentifier"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_sharedUserIdentifier, CFSTR("AFPeerInfo::sharedUserIdentifier"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_idsIdentifier, CFSTR("AFPeerInfo::idsIdentifier"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_idsDeviceUniqueIdentifier, CFSTR("AFPeerInfo::idsDeviceUniqueIdentifier"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_rapportEffectiveIdentifier, CFSTR("AFPeerInfo::rapportEffectiveIdentifier"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_homeKitAccessoryIdentifier, CFSTR("AFPeerInfo::homeKitAccessoryIdentifier"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_mediaSystemIdentifier, CFSTR("AFPeerInfo::mediaSystemIdentifier"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_mediaRouteIdentifier, CFSTR("AFPeerInfo::mediaRouteIdentifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isCommunalDevice);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v7, CFSTR("AFPeerInfo::isCommunalDevice"));

  objc_msgSend(v10, "encodeObject:forKey:", self->_roomName, CFSTR("AFPeerInfo::roomName"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_name, CFSTR("AFPeerInfo::name"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_productType, CFSTR("AFPeerInfo::productType"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_buildVersion, CFSTR("AFPeerInfo::buildVersion"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_userInterfaceIdiom, CFSTR("AFPeerInfo::userInterfaceIdiom"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_aceVersion, CFSTR("AFPeerInfo::aceVersion"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isLocationSharingDevice);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v8, CFSTR("AFPeerInfo::isLocationSharingDevice"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isSiriCloudSyncEnabled);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v9, CFSTR("AFPeerInfo::isSiriCloudSyncEnabled"));

  objc_msgSend(v10, "encodeObject:forKey:", self->_myriadTrialTreatment, CFSTR("AFPeerInfo::myriadTrialTreatment"));
}

- (AFPeerInfo)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  AFPeerInfo *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  char v31;
  void *v32;
  id v33;
  char v34;
  void *v35;
  id v36;
  uint64_t v38;
  uint64_t v39;
  id v40;
  char v41;
  id v42;
  id v43;
  id v44;
  unsigned int v45;
  AFPeerInfo *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v46 = self;
    objc_msgSend(v4, "objectForKey:", CFSTR("isDeviceOwnedByCurrentUser"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;

    v45 = objc_msgSend(v7, "BOOLValue");
    objc_msgSend(v5, "objectForKey:", CFSTR("assistantIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v52 = v9;
    else
      v52 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("sharedUserIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v51 = v10;
    else
      v51 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("idsIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v44 = v11;
    else
      v44 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("idsDeviceUniqueIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v43 = v12;
    else
      v43 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("rapportEffectiveIdentifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v42 = v13;
    else
      v42 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("homeKitAccessoryIdentifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v50 = v14;
    else
      v50 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("mediaSystemIdentifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v49 = v15;
    else
      v49 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("mediaRouteIdentifier"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v48 = v16;
    else
      v48 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("isCommunalDevice"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = v17;
    else
      v18 = 0;

    v41 = objc_msgSend(v18, "BOOLValue");
    objc_msgSend(v5, "objectForKey:", CFSTR("roomName"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v47 = v19;
    else
      v47 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("name"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v40 = v20;
    else
      v40 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("productType"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v22 = v21;
    else
      v22 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("buildVersion"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v24 = v23;
    else
      v24 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("userInterfaceIdiom"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v26 = v25;
    else
      v26 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("aceVersion"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v28 = v27;
    else
      v28 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("isLocationSharingDevice"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v30 = v29;
    else
      v30 = 0;

    v31 = objc_msgSend(v30, "BOOLValue");
    objc_msgSend(v5, "objectForKey:", CFSTR("isSiriCloudSyncEnabled"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v33 = v32;
    else
      v33 = 0;

    v34 = objc_msgSend(v33, "BOOLValue");
    objc_msgSend(v5, "objectForKey:", CFSTR("trialTreatment"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v36 = v35;
    else
      v36 = 0;

    BYTE1(v39) = v34;
    LOBYTE(v39) = v31;
    LOBYTE(v38) = v41;
    self = objc_retain(-[AFPeerInfo initWithIsDeviceOwnedByCurrentUser:assistantIdentifier:sharedUserIdentifier:idsIdentifier:idsDeviceUniqueIdentifier:rapportEffectiveIdentifier:homeKitAccessoryIdentifier:mediaSystemIdentifier:mediaRouteIdentifier:isCommunalDevice:roomName:name:productType:buildVersion:userInterfaceIdiom:aceVersion:isLocationSharingDevice:isSiriCloudSyncEnabled:myriadTrialTreatment:](v46, "initWithIsDeviceOwnedByCurrentUser:assistantIdentifier:sharedUserIdentifier:idsIdentifier:idsDeviceUniqueIdentifier:rapportEffectiveIdentifier:homeKitAccessoryIdentifier:mediaSystemIdentifier:mediaRouteIdentifier:isCommunalDevice:roomName:name:productType:buildVersion:userInterfaceIdiom:aceVersion:isLocationSharingDevice:isSiriCloudSyncEnabled:myriadTrialTreatment:", v45, v52, v51, v44, v43, v42, v50, v49, v48, v38, v47, v40, v22,
               v24,
               v26,
               v28,
               v39,
               v36));

    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)buildDictionaryRepresentation
{
  id v3;
  void *v4;
  NSString *assistantIdentifier;
  NSString *sharedUserIdentifier;
  NSString *idsIdentifier;
  NSString *idsDeviceUniqueIdentifier;
  NSString *rapportEffectiveIdentifier;
  NSString *homeKitAccessoryIdentifier;
  NSString *mediaSystemIdentifier;
  NSString *mediaRouteIdentifier;
  void *v13;
  NSString *roomName;
  NSString *name;
  NSString *productType;
  NSString *buildVersion;
  NSString *userInterfaceIdiom;
  NSString *aceVersion;
  void *v20;
  void *v21;
  NSString *myriadTrialTreatment;
  void *v23;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isDeviceOwnedByCurrentUser);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("isDeviceOwnedByCurrentUser"));

  assistantIdentifier = self->_assistantIdentifier;
  if (assistantIdentifier)
    objc_msgSend(v3, "setObject:forKey:", assistantIdentifier, CFSTR("assistantIdentifier"));
  sharedUserIdentifier = self->_sharedUserIdentifier;
  if (sharedUserIdentifier)
    objc_msgSend(v3, "setObject:forKey:", sharedUserIdentifier, CFSTR("sharedUserIdentifier"));
  idsIdentifier = self->_idsIdentifier;
  if (idsIdentifier)
    objc_msgSend(v3, "setObject:forKey:", idsIdentifier, CFSTR("idsIdentifier"));
  idsDeviceUniqueIdentifier = self->_idsDeviceUniqueIdentifier;
  if (idsDeviceUniqueIdentifier)
    objc_msgSend(v3, "setObject:forKey:", idsDeviceUniqueIdentifier, CFSTR("idsDeviceUniqueIdentifier"));
  rapportEffectiveIdentifier = self->_rapportEffectiveIdentifier;
  if (rapportEffectiveIdentifier)
    objc_msgSend(v3, "setObject:forKey:", rapportEffectiveIdentifier, CFSTR("rapportEffectiveIdentifier"));
  homeKitAccessoryIdentifier = self->_homeKitAccessoryIdentifier;
  if (homeKitAccessoryIdentifier)
    objc_msgSend(v3, "setObject:forKey:", homeKitAccessoryIdentifier, CFSTR("homeKitAccessoryIdentifier"));
  mediaSystemIdentifier = self->_mediaSystemIdentifier;
  if (mediaSystemIdentifier)
    objc_msgSend(v3, "setObject:forKey:", mediaSystemIdentifier, CFSTR("mediaSystemIdentifier"));
  mediaRouteIdentifier = self->_mediaRouteIdentifier;
  if (mediaRouteIdentifier)
    objc_msgSend(v3, "setObject:forKey:", mediaRouteIdentifier, CFSTR("mediaRouteIdentifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isCommunalDevice);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("isCommunalDevice"));

  roomName = self->_roomName;
  if (roomName)
    objc_msgSend(v3, "setObject:forKey:", roomName, CFSTR("roomName"));
  name = self->_name;
  if (name)
    objc_msgSend(v3, "setObject:forKey:", name, CFSTR("name"));
  productType = self->_productType;
  if (productType)
    objc_msgSend(v3, "setObject:forKey:", productType, CFSTR("productType"));
  buildVersion = self->_buildVersion;
  if (buildVersion)
    objc_msgSend(v3, "setObject:forKey:", buildVersion, CFSTR("buildVersion"));
  userInterfaceIdiom = self->_userInterfaceIdiom;
  if (userInterfaceIdiom)
    objc_msgSend(v3, "setObject:forKey:", userInterfaceIdiom, CFSTR("userInterfaceIdiom"));
  aceVersion = self->_aceVersion;
  if (aceVersion)
    objc_msgSend(v3, "setObject:forKey:", aceVersion, CFSTR("aceVersion"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isLocationSharingDevice);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("isLocationSharingDevice"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isSiriCloudSyncEnabled);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("isSiriCloudSyncEnabled"));

  myriadTrialTreatment = self->_myriadTrialTreatment;
  if (myriadTrialTreatment)
    objc_msgSend(v3, "setObject:forKey:", myriadTrialTreatment, CFSTR("trialTreatment"));
  v23 = (void *)objc_msgSend(v3, "copy");

  return v23;
}

- (BOOL)isDeviceOwnedByCurrentUser
{
  return self->_isDeviceOwnedByCurrentUser;
}

- (NSString)assistantIdentifier
{
  return self->_assistantIdentifier;
}

- (NSString)sharedUserIdentifier
{
  return self->_sharedUserIdentifier;
}

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (NSString)idsDeviceUniqueIdentifier
{
  return self->_idsDeviceUniqueIdentifier;
}

- (NSString)rapportEffectiveIdentifier
{
  return self->_rapportEffectiveIdentifier;
}

- (NSString)homeKitAccessoryIdentifier
{
  return self->_homeKitAccessoryIdentifier;
}

- (NSString)mediaSystemIdentifier
{
  return self->_mediaSystemIdentifier;
}

- (NSString)mediaRouteIdentifier
{
  return self->_mediaRouteIdentifier;
}

- (BOOL)isCommunalDevice
{
  return self->_isCommunalDevice;
}

- (NSString)roomName
{
  return self->_roomName;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)productType
{
  return self->_productType;
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (NSString)userInterfaceIdiom
{
  return self->_userInterfaceIdiom;
}

- (NSString)aceVersion
{
  return self->_aceVersion;
}

- (BOOL)isLocationSharingDevice
{
  return self->_isLocationSharingDevice;
}

- (BOOL)isSiriCloudSyncEnabled
{
  return self->_isSiriCloudSyncEnabled;
}

- (NSString)myriadTrialTreatment
{
  return self->_myriadTrialTreatment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_myriadTrialTreatment, 0);
  objc_storeStrong((id *)&self->_aceVersion, 0);
  objc_storeStrong((id *)&self->_userInterfaceIdiom, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_roomName, 0);
  objc_storeStrong((id *)&self->_mediaRouteIdentifier, 0);
  objc_storeStrong((id *)&self->_mediaSystemIdentifier, 0);
  objc_storeStrong((id *)&self->_homeKitAccessoryIdentifier, 0);
  objc_storeStrong((id *)&self->_rapportEffectiveIdentifier, 0);
  objc_storeStrong((id *)&self->_idsDeviceUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong((id *)&self->_sharedUserIdentifier, 0);
  objc_storeStrong((id *)&self->_assistantIdentifier, 0);
}

void __381__AFPeerInfo_initWithIsDeviceOwnedByCurrentUser_assistantIdentifier_sharedUserIdentifier_idsIdentifier_idsDeviceUniqueIdentifier_rapportEffectiveIdentifier_homeKitAccessoryIdentifier_mediaSystemIdentifier_mediaRouteIdentifier_isCommunalDevice_roomName_name_productType_buildVersion_userInterfaceIdiom_aceVersion_isLocationSharingDevice_isSiriCloudSyncEnabled_myriadTrialTreatment___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(unsigned __int8 *)(a1 + 152);
  v4 = a2;
  objc_msgSend(v4, "setIsDeviceOwnedByCurrentUser:", v3);
  objc_msgSend(v4, "setAssistantIdentifier:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "setSharedUserIdentifier:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setIdsIdentifier:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v4, "setIdsDeviceUniqueIdentifier:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v4, "setRapportEffectiveIdentifier:", *(_QWORD *)(a1 + 64));
  objc_msgSend(v4, "setHomeKitAccessoryIdentifier:", *(_QWORD *)(a1 + 72));
  objc_msgSend(v4, "setMediaSystemIdentifier:", *(_QWORD *)(a1 + 80));
  objc_msgSend(v4, "setMediaRouteIdentifier:", *(_QWORD *)(a1 + 88));
  objc_msgSend(v4, "setIsCommunalDevice:", *(unsigned __int8 *)(a1 + 153));
  objc_msgSend(v4, "setRoomName:", *(_QWORD *)(a1 + 96));
  objc_msgSend(v4, "setName:", *(_QWORD *)(a1 + 104));
  objc_msgSend(v4, "setProductType:", *(_QWORD *)(a1 + 112));
  objc_msgSend(v4, "setBuildVersion:", *(_QWORD *)(a1 + 120));
  objc_msgSend(v4, "setUserInterfaceIdiom:", *(_QWORD *)(a1 + 128));
  objc_msgSend(v4, "setAceVersion:", *(_QWORD *)(a1 + 136));
  objc_msgSend(v4, "setIsLocationSharingDevice:", *(unsigned __int8 *)(a1 + 154));
  objc_msgSend(v4, "setIsSiriCloudSyncEnabled:", *(unsigned __int8 *)(a1 + 155));
  objc_msgSend(v4, "setMyriadTrialTreatment:", *(_QWORD *)(a1 + 144));

}

void __358__AFPeerInfo_initWithIsDeviceOwnedByCurrentUser_assistantIdentifier_sharedUserIdentifier_idsIdentifier_idsDeviceUniqueIdentifier_rapportEffectiveIdentifier_homeKitAccessoryIdentifier_mediaSystemIdentifier_mediaRouteIdentifier_isCommunalDevice_roomName_name_productType_buildVersion_userInterfaceIdiom_aceVersion_isLocationSharingDevice_myriadTrialTreatment___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(unsigned __int8 *)(a1 + 152);
  v4 = a2;
  objc_msgSend(v4, "setIsDeviceOwnedByCurrentUser:", v3);
  objc_msgSend(v4, "setAssistantIdentifier:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "setSharedUserIdentifier:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setIdsIdentifier:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v4, "setIdsDeviceUniqueIdentifier:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v4, "setRapportEffectiveIdentifier:", *(_QWORD *)(a1 + 64));
  objc_msgSend(v4, "setHomeKitAccessoryIdentifier:", *(_QWORD *)(a1 + 72));
  objc_msgSend(v4, "setMediaSystemIdentifier:", *(_QWORD *)(a1 + 80));
  objc_msgSend(v4, "setMediaRouteIdentifier:", *(_QWORD *)(a1 + 88));
  objc_msgSend(v4, "setIsCommunalDevice:", *(unsigned __int8 *)(a1 + 153));
  objc_msgSend(v4, "setRoomName:", *(_QWORD *)(a1 + 96));
  objc_msgSend(v4, "setName:", *(_QWORD *)(a1 + 104));
  objc_msgSend(v4, "setProductType:", *(_QWORD *)(a1 + 112));
  objc_msgSend(v4, "setBuildVersion:", *(_QWORD *)(a1 + 120));
  objc_msgSend(v4, "setUserInterfaceIdiom:", *(_QWORD *)(a1 + 128));
  objc_msgSend(v4, "setAceVersion:", *(_QWORD *)(a1 + 136));
  objc_msgSend(v4, "setIsLocationSharingDevice:", *(unsigned __int8 *)(a1 + 154));
  objc_msgSend(v4, "setIsSiriCloudSyncEnabled:", 1);
  objc_msgSend(v4, "setMyriadTrialTreatment:", *(_QWORD *)(a1 + 144));

}

+ (id)newWithBuilder:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBuilder:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _AFPeerInfoMutation *);
  _AFPeerInfoMutation *v5;
  AFPeerInfo *v6;
  void *v7;
  uint64_t v8;
  NSString *assistantIdentifier;
  void *v10;
  uint64_t v11;
  NSString *sharedUserIdentifier;
  void *v13;
  uint64_t v14;
  NSString *idsIdentifier;
  void *v16;
  uint64_t v17;
  NSString *idsDeviceUniqueIdentifier;
  void *v19;
  uint64_t v20;
  NSString *rapportEffectiveIdentifier;
  void *v22;
  uint64_t v23;
  NSString *homeKitAccessoryIdentifier;
  void *v25;
  uint64_t v26;
  NSString *mediaSystemIdentifier;
  void *v28;
  uint64_t v29;
  NSString *mediaRouteIdentifier;
  void *v31;
  uint64_t v32;
  NSString *roomName;
  void *v34;
  uint64_t v35;
  NSString *name;
  void *v37;
  uint64_t v38;
  NSString *productType;
  void *v40;
  uint64_t v41;
  NSString *buildVersion;
  void *v43;
  uint64_t v44;
  NSString *userInterfaceIdiom;
  void *v46;
  uint64_t v47;
  NSString *aceVersion;
  uint64_t v49;
  NSString *myriadTrialTreatment;

  v4 = (void (**)(id, _AFPeerInfoMutation *))a3;
  if (v4)
  {
    v5 = -[_AFPeerInfoMutation initWithBase:]([_AFPeerInfoMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFPeerInfoMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFPeerInfo);
      v6->_isDeviceOwnedByCurrentUser = -[_AFPeerInfoMutation getIsDeviceOwnedByCurrentUser](v5, "getIsDeviceOwnedByCurrentUser");
      -[_AFPeerInfoMutation getAssistantIdentifier](v5, "getAssistantIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      assistantIdentifier = v6->_assistantIdentifier;
      v6->_assistantIdentifier = (NSString *)v8;

      -[_AFPeerInfoMutation getSharedUserIdentifier](v5, "getSharedUserIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
      sharedUserIdentifier = v6->_sharedUserIdentifier;
      v6->_sharedUserIdentifier = (NSString *)v11;

      -[_AFPeerInfoMutation getIdsIdentifier](v5, "getIdsIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "copy");
      idsIdentifier = v6->_idsIdentifier;
      v6->_idsIdentifier = (NSString *)v14;

      -[_AFPeerInfoMutation getIdsDeviceUniqueIdentifier](v5, "getIdsDeviceUniqueIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "copy");
      idsDeviceUniqueIdentifier = v6->_idsDeviceUniqueIdentifier;
      v6->_idsDeviceUniqueIdentifier = (NSString *)v17;

      -[_AFPeerInfoMutation getRapportEffectiveIdentifier](v5, "getRapportEffectiveIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "copy");
      rapportEffectiveIdentifier = v6->_rapportEffectiveIdentifier;
      v6->_rapportEffectiveIdentifier = (NSString *)v20;

      -[_AFPeerInfoMutation getHomeKitAccessoryIdentifier](v5, "getHomeKitAccessoryIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "copy");
      homeKitAccessoryIdentifier = v6->_homeKitAccessoryIdentifier;
      v6->_homeKitAccessoryIdentifier = (NSString *)v23;

      -[_AFPeerInfoMutation getMediaSystemIdentifier](v5, "getMediaSystemIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "copy");
      mediaSystemIdentifier = v6->_mediaSystemIdentifier;
      v6->_mediaSystemIdentifier = (NSString *)v26;

      -[_AFPeerInfoMutation getMediaRouteIdentifier](v5, "getMediaRouteIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "copy");
      mediaRouteIdentifier = v6->_mediaRouteIdentifier;
      v6->_mediaRouteIdentifier = (NSString *)v29;

      v6->_isCommunalDevice = -[_AFPeerInfoMutation getIsCommunalDevice](v5, "getIsCommunalDevice");
      -[_AFPeerInfoMutation getRoomName](v5, "getRoomName");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "copy");
      roomName = v6->_roomName;
      v6->_roomName = (NSString *)v32;

      -[_AFPeerInfoMutation getName](v5, "getName");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "copy");
      name = v6->_name;
      v6->_name = (NSString *)v35;

      -[_AFPeerInfoMutation getProductType](v5, "getProductType");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "copy");
      productType = v6->_productType;
      v6->_productType = (NSString *)v38;

      -[_AFPeerInfoMutation getBuildVersion](v5, "getBuildVersion");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "copy");
      buildVersion = v6->_buildVersion;
      v6->_buildVersion = (NSString *)v41;

      -[_AFPeerInfoMutation getUserInterfaceIdiom](v5, "getUserInterfaceIdiom");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v43, "copy");
      userInterfaceIdiom = v6->_userInterfaceIdiom;
      v6->_userInterfaceIdiom = (NSString *)v44;

      -[_AFPeerInfoMutation getAceVersion](v5, "getAceVersion");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v46, "copy");
      aceVersion = v6->_aceVersion;
      v6->_aceVersion = (NSString *)v47;

      v6->_isLocationSharingDevice = -[_AFPeerInfoMutation getIsLocationSharingDevice](v5, "getIsLocationSharingDevice");
      v6->_isSiriCloudSyncEnabled = -[_AFPeerInfoMutation getIsSiriCloudSyncEnabled](v5, "getIsSiriCloudSyncEnabled");
      -[_AFPeerInfoMutation getMyriadTrialTreatment](v5, "getMyriadTrialTreatment");
      v49 = objc_claimAutoreleasedReturnValue();
      myriadTrialTreatment = v6->_myriadTrialTreatment;
      v6->_myriadTrialTreatment = (NSString *)v49;

    }
    else
    {
      v6 = (AFPeerInfo *)-[AFPeerInfo copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFPeerInfo *)-[AFPeerInfo copy](self, "copy");
  }

  return v6;
}

@end
