@implementation ASDTestFlightAppMetadata

- (ASDTestFlightAppMetadata)initWithBundleID:(id)a3
{
  id v5;
  ASDTestFlightAppMetadata *v6;
  ASDTestFlightAppMetadata *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDTestFlightAppMetadata;
  v6 = -[ASDTestFlightAppMetadata init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bundleID, a3);
    v7->_userInitiated = 1;
  }

  return v7;
}

- (BOOL)requiresPowerPluggedIn
{
  return self->_requiresPowerPluggedIn;
}

- (void)setRequiresPowerPluggedIn:(BOOL)a3
{
  self->_requiresPowerPluggedIn = a3;
  self->_requiresPowerPluggedIn_wasSet = 1;
}

- (BOOL)userInitiated
{
  return self->_userInitiated;
}

- (void)setUserInitiated:(BOOL)a3
{
  self->_userInitiated = a3;
  if (!self->_requiresPowerPluggedIn_wasSet)
    self->_requiresPowerPluggedIn = !a3;
}

- (int64_t)metadataType
{
  return 4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ASDTestFlightAppMetadata *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;

  v5 = +[ASDTestFlightAppMetadata allocWithZone:](ASDTestFlightAppMetadata, "allocWithZone:");
  v6 = (void *)-[NSString copyWithZone:](self->_bundleID, "copyWithZone:", a3);
  v7 = -[ASDTestFlightAppMetadata initWithBundleID:](v5, "initWithBundleID:", v6);

  objc_storeStrong((id *)(v7 + 16), self->_account);
  v8 = -[NSURL copyWithZone:](self->_artworkURL, "copyWithZone:", a3);
  v9 = *(void **)(v7 + 24);
  *(_QWORD *)(v7 + 24) = v8;

  v10 = -[NSDictionary copyWithZone:](self->_backgroundAssetMetadata, "copyWithZone:", a3);
  v11 = *(void **)(v7 + 32);
  *(_QWORD *)(v7 + 32) = v10;

  v12 = -[NSString copyWithZone:](self->_betaBuildGroupID, "copyWithZone:", a3);
  v13 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v12;

  v14 = -[NSString copyWithZone:](self->_bundleVersion, "copyWithZone:", a3);
  v15 = *(void **)(v7 + 56);
  *(_QWORD *)(v7 + 56) = v14;

  v16 = -[NSString copyWithZone:](self->_companionBundleID, "copyWithZone:", a3);
  v17 = *(void **)(v7 + 64);
  *(_QWORD *)(v7 + 64) = v16;

  v18 = -[NSURL copyWithZone:](self->_existingBundleURL, "copyWithZone:", a3);
  v19 = *(void **)(v7 + 72);
  *(_QWORD *)(v7 + 72) = v18;

  v20 = -[NSNumber copyWithZone:](self->_externalVersionIdentifier, "copyWithZone:", a3);
  v21 = *(void **)(v7 + 80);
  *(_QWORD *)(v7 + 80) = v20;

  v22 = -[ASDTestFlightAppGenre copyWithZone:](self->_genre, "copyWithZone:", a3);
  v23 = *(void **)(v7 + 88);
  *(_QWORD *)(v7 + 88) = v22;

  v24 = -[NSArray copyWithZone:](self->_genreIDs, "copyWithZone:", a3);
  v25 = *(void **)(v7 + 96);
  *(_QWORD *)(v7 + 96) = v24;

  *(_BYTE *)(v7 + 11) = self->_hasMessagesExtension;
  v26 = -[NSNumber copyWithZone:](self->_initialODRSize, "copyWithZone:", a3);
  v27 = *(void **)(v7 + 104);
  *(_QWORD *)(v7 + 104) = v26;

  v28 = -[NSNumber copyWithZone:](self->_itemID, "copyWithZone:", a3);
  v29 = *(void **)(v7 + 112);
  *(_QWORD *)(v7 + 112) = v28;

  v30 = -[NSString copyWithZone:](self->_itemName, "copyWithZone:", a3);
  v31 = *(void **)(v7 + 120);
  *(_QWORD *)(v7 + 120) = v30;

  *(_BYTE *)(v7 + 12) = self->_launchProhibited;
  v32 = -[NSURL copyWithZone:](self->_messagesArtworkURL, "copyWithZone:", a3);
  v33 = *(void **)(v7 + 136);
  *(_QWORD *)(v7 + 136) = v32;

  *(_QWORD *)(v7 + 144) = self->_packageCompression;
  v34 = -[NSData copyWithZone:](self->_packageDPInfo, "copyWithZone:", a3);
  v35 = *(void **)(v7 + 152);
  *(_QWORD *)(v7 + 152) = v34;

  v36 = -[NSData copyWithZone:](self->_packageSINF, "copyWithZone:", a3);
  v37 = *(void **)(v7 + 160);
  *(_QWORD *)(v7 + 160) = v36;

  v38 = -[NSNumber copyWithZone:](self->_packageSize, "copyWithZone:", a3);
  v39 = *(void **)(v7 + 168);
  *(_QWORD *)(v7 + 168) = v38;

  v40 = -[NSURL copyWithZone:](self->_packageURL, "copyWithZone:", a3);
  v41 = *(void **)(v7 + 176);
  *(_QWORD *)(v7 + 176) = v40;

  v42 = -[NSDictionary copyWithZone:](self->_placeholderEntitlements, "copyWithZone:", a3);
  v43 = *(void **)(v7 + 128);
  *(_QWORD *)(v7 + 128) = v42;

  v44 = -[NSArray copyWithZone:](self->_provisioningProfiles, "copyWithZone:", a3);
  v45 = *(void **)(v7 + 184);
  *(_QWORD *)(v7 + 184) = v44;

  v46 = -[NSData copyWithZone:](self->_receipt, "copyWithZone:", a3);
  v47 = *(void **)(v7 + 192);
  *(_QWORD *)(v7 + 192) = v46;

  *(_BYTE *)(v7 + 9) = self->_requiresPowerPluggedIn;
  v48 = -[NSString copyWithZone:](self->_shortBundleVersion, "copyWithZone:", a3);
  v49 = *(void **)(v7 + 200);
  *(_QWORD *)(v7 + 200) = v48;

  *(_QWORD *)(v7 + 208) = self->_softwarePlatform;
  v50 = -[NSString copyWithZone:](self->_storeCohort, "copyWithZone:", a3);
  v51 = *(void **)(v7 + 216);
  *(_QWORD *)(v7 + 216) = v50;

  v52 = -[NSNumber copyWithZone:](self->_storeFront, "copyWithZone:", a3);
  v53 = *(void **)(v7 + 224);
  *(_QWORD *)(v7 + 224) = v52;

  v54 = -[NSArray copyWithZone:](self->_subGenres, "copyWithZone:", a3);
  v55 = *(void **)(v7 + 232);
  *(_QWORD *)(v7 + 232) = v54;

  v56 = -[NSString copyWithZone:](self->_token, "copyWithZone:", a3);
  v57 = *(void **)(v7 + 240);
  *(_QWORD *)(v7 + 240) = v56;

  *(_BYTE *)(v7 + 10) = self->_userInitiated;
  v58 = -[NSString copyWithZone:](self->_vendorName, "copyWithZone:", a3);
  v59 = *(void **)(v7 + 256);
  *(_QWORD *)(v7 + 256) = v58;

  return (id)v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDTestFlightAppMetadata)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ASDTestFlightAppMetadata *v6;
  uint64_t v7;
  ACAccount *account;
  uint64_t v9;
  NSURL *artworkURL;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSDictionary *backgroundAssetMetadata;
  uint64_t v16;
  NSString *betaBuildGroupID;
  uint64_t v18;
  NSString *bundleVersion;
  uint64_t v20;
  NSString *companionBundleID;
  uint64_t v22;
  NSURL *existingBundleURL;
  uint64_t v24;
  NSNumber *externalVersionIdentifier;
  uint64_t v26;
  ASDTestFlightAppGenre *genre;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  NSArray *genreIDs;
  uint64_t v33;
  NSNumber *initialODRSize;
  uint64_t v35;
  NSNumber *itemID;
  uint64_t v37;
  NSString *itemName;
  uint64_t v39;
  NSURL *messagesArtworkURL;
  uint64_t v41;
  NSData *packageDPInfo;
  uint64_t v43;
  NSData *packageSINF;
  uint64_t v45;
  NSNumber *packageSize;
  uint64_t v47;
  NSURL *packageURL;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  NSDictionary *placeholderEntitlements;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  NSArray *provisioningProfiles;
  uint64_t v61;
  NSData *receipt;
  uint64_t v63;
  NSString *shortBundleVersion;
  uint64_t v65;
  NSString *storeCohort;
  uint64_t v67;
  NSNumber *storeFront;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  NSArray *subGenres;
  uint64_t v74;
  NSString *token;
  uint64_t v76;
  NSString *variantID;
  uint64_t v78;
  NSString *vendorName;
  _QWORD v81[7];

  v81[6] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ASDTestFlightAppMetadata initWithBundleID:](self, "initWithBundleID:", v5);
  if (v6)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AC"));
    v7 = objc_claimAutoreleasedReturnValue();
    account = v6->_account;
    v6->_account = (ACAccount *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AU"));
    v9 = objc_claimAutoreleasedReturnValue();
    artworkURL = v6->_artworkURL;
    v6->_artworkURL = (NSURL *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v81[0] = objc_opt_class();
    v81[1] = objc_opt_class();
    v81[2] = objc_opt_class();
    v81[3] = objc_opt_class();
    v81[4] = objc_opt_class();
    v81[5] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v81, 6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("BA"));
    v14 = objc_claimAutoreleasedReturnValue();
    backgroundAssetMetadata = v6->_backgroundAssetMetadata;
    v6->_backgroundAssetMetadata = (NSDictionary *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("GI"));
    v16 = objc_claimAutoreleasedReturnValue();
    betaBuildGroupID = v6->_betaBuildGroupID;
    v6->_betaBuildGroupID = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BV"));
    v18 = objc_claimAutoreleasedReturnValue();
    bundleVersion = v6->_bundleVersion;
    v6->_bundleVersion = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CI"));
    v20 = objc_claimAutoreleasedReturnValue();
    companionBundleID = v6->_companionBundleID;
    v6->_companionBundleID = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EB"));
    v22 = objc_claimAutoreleasedReturnValue();
    existingBundleURL = v6->_existingBundleURL;
    v6->_existingBundleURL = (NSURL *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EV"));
    v24 = objc_claimAutoreleasedReturnValue();
    externalVersionIdentifier = v6->_externalVersionIdentifier;
    v6->_externalVersionIdentifier = (NSNumber *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("GE"));
    v26 = objc_claimAutoreleasedReturnValue();
    genre = v6->_genre;
    v6->_genre = (ASDTestFlightAppGenre *)v26;

    v28 = (void *)MEMORY[0x1E0C99E60];
    v29 = objc_opt_class();
    objc_msgSend(v28, "setWithObjects:", v29, objc_opt_class(), 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v30, CFSTR("GN"));
    v31 = objc_claimAutoreleasedReturnValue();
    genreIDs = v6->_genreIDs;
    v6->_genreIDs = (NSArray *)v31;

    v6->_hasMessagesExtension = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HM"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("IO"));
    v33 = objc_claimAutoreleasedReturnValue();
    initialODRSize = v6->_initialODRSize;
    v6->_initialODRSize = (NSNumber *)v33;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ID"));
    v35 = objc_claimAutoreleasedReturnValue();
    itemID = v6->_itemID;
    v6->_itemID = (NSNumber *)v35;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("IN"));
    v37 = objc_claimAutoreleasedReturnValue();
    itemName = v6->_itemName;
    v6->_itemName = (NSString *)v37;

    v6->_launchProhibited = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("LP"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MU"));
    v39 = objc_claimAutoreleasedReturnValue();
    messagesArtworkURL = v6->_messagesArtworkURL;
    v6->_messagesArtworkURL = (NSURL *)v39;

    v6->_packageCompression = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("PC"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PD"));
    v41 = objc_claimAutoreleasedReturnValue();
    packageDPInfo = v6->_packageDPInfo;
    v6->_packageDPInfo = (NSData *)v41;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PS"));
    v43 = objc_claimAutoreleasedReturnValue();
    packageSINF = v6->_packageSINF;
    v6->_packageSINF = (NSData *)v43;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PZ"));
    v45 = objc_claimAutoreleasedReturnValue();
    packageSize = v6->_packageSize;
    v6->_packageSize = (NSNumber *)v45;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PU"));
    v47 = objc_claimAutoreleasedReturnValue();
    packageURL = v6->_packageURL;
    v6->_packageURL = (NSURL *)v47;

    v49 = (void *)MEMORY[0x1E0C99E60];
    v50 = objc_opt_class();
    v51 = objc_opt_class();
    v52 = objc_opt_class();
    objc_msgSend(v49, "setWithObjects:", v50, v51, v52, objc_opt_class(), 0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v53, CFSTR("PE"));
    v54 = objc_claimAutoreleasedReturnValue();
    placeholderEntitlements = v6->_placeholderEntitlements;
    v6->_placeholderEntitlements = (NSDictionary *)v54;

    v56 = (void *)MEMORY[0x1E0C99E60];
    v57 = objc_opt_class();
    objc_msgSend(v56, "setWithObjects:", v57, objc_opt_class(), 0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v58, CFSTR("PV"));
    v59 = objc_claimAutoreleasedReturnValue();
    provisioningProfiles = v6->_provisioningProfiles;
    v6->_provisioningProfiles = (NSArray *)v59;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RC"));
    v61 = objc_claimAutoreleasedReturnValue();
    receipt = v6->_receipt;
    v6->_receipt = (NSData *)v61;

    v6->_requiresPowerPluggedIn = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("RP"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SV"));
    v63 = objc_claimAutoreleasedReturnValue();
    shortBundleVersion = v6->_shortBundleVersion;
    v6->_shortBundleVersion = (NSString *)v63;

    v6->_softwarePlatform = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("SP"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SC"));
    v65 = objc_claimAutoreleasedReturnValue();
    storeCohort = v6->_storeCohort;
    v6->_storeCohort = (NSString *)v65;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SF"));
    v67 = objc_claimAutoreleasedReturnValue();
    storeFront = v6->_storeFront;
    v6->_storeFront = (NSNumber *)v67;

    v69 = (void *)MEMORY[0x1E0C99E60];
    v70 = objc_opt_class();
    objc_msgSend(v69, "setWithObjects:", v70, objc_opt_class(), 0);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v71, CFSTR("SG"));
    v72 = objc_claimAutoreleasedReturnValue();
    subGenres = v6->_subGenres;
    v6->_subGenres = (NSArray *)v72;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TK"));
    v74 = objc_claimAutoreleasedReturnValue();
    token = v6->_token;
    v6->_token = (NSString *)v74;

    v6->_userInitiated = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UI"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("VA"));
    v76 = objc_claimAutoreleasedReturnValue();
    variantID = v6->_variantID;
    v6->_variantID = (NSString *)v76;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("VN"));
    v78 = objc_claimAutoreleasedReturnValue();
    vendorName = v6->_vendorName;
    v6->_vendorName = (NSString *)v78;

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  ACAccount *account;
  id v5;

  account = self->_account;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", account, CFSTR("AC"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_artworkURL, CFSTR("AU"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_backgroundAssetMetadata, CFSTR("BA"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_betaBuildGroupID, CFSTR("GI"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleID, CFSTR("BI"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleVersion, CFSTR("BV"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_companionBundleID, CFSTR("CI"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_existingBundleURL, CFSTR("EB"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_externalVersionIdentifier, CFSTR("EV"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_genre, CFSTR("GE"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_genreIDs, CFSTR("GN"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasMessagesExtension, CFSTR("HM"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_initialODRSize, CFSTR("IO"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_itemID, CFSTR("ID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_itemName, CFSTR("IN"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_launchProhibited, CFSTR("LP"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_messagesArtworkURL, CFSTR("MU"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_packageCompression, CFSTR("PC"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_packageDPInfo, CFSTR("PD"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_packageSINF, CFSTR("PS"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_packageSize, CFSTR("PZ"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_packageURL, CFSTR("PU"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_placeholderEntitlements, CFSTR("PE"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_provisioningProfiles, CFSTR("PV"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_receipt, CFSTR("RC"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_requiresPowerPluggedIn, CFSTR("RP"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_shortBundleVersion, CFSTR("SV"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_softwarePlatform, CFSTR("SP"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_storeCohort, CFSTR("SC"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_storeFront, CFSTR("SF"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subGenres, CFSTR("SG"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_token, CFSTR("TK"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_userInitiated, CFSTR("UI"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_variantID, CFSTR("VA"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_vendorName, CFSTR("VN"));

}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSURL)artworkURL
{
  return self->_artworkURL;
}

- (void)setArtworkURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDictionary)backgroundAssetMetadata
{
  return self->_backgroundAssetMetadata;
}

- (void)setBackgroundAssetMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)betaBuildGroupID
{
  return self->_betaBuildGroupID;
}

- (void)setBetaBuildGroupID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (void)setBundleVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)companionBundleID
{
  return self->_companionBundleID;
}

- (void)setCompanionBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSURL)existingBundleURL
{
  return self->_existingBundleURL;
}

- (void)setExistingBundleURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)externalVersionIdentifier
{
  return self->_externalVersionIdentifier;
}

- (void)setExternalVersionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (ASDTestFlightAppGenre)genre
{
  return self->_genre;
}

- (void)setGenre:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSArray)genreIDs
{
  return self->_genreIDs;
}

- (void)setGenreIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (BOOL)hasMessagesExtension
{
  return self->_hasMessagesExtension;
}

- (void)setHasMessagesExtension:(BOOL)a3
{
  self->_hasMessagesExtension = a3;
}

- (NSNumber)initialODRSize
{
  return self->_initialODRSize;
}

- (void)setInitialODRSize:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSNumber)itemID
{
  return self->_itemID;
}

- (void)setItemID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)itemName
{
  return self->_itemName;
}

- (void)setItemName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (BOOL)isLaunchProhibited
{
  return self->_launchProhibited;
}

- (void)setLaunchProhibited:(BOOL)a3
{
  self->_launchProhibited = a3;
}

- (NSDictionary)placeholderEntitlements
{
  return self->_placeholderEntitlements;
}

- (void)setPlaceholderEntitlements:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSURL)messagesArtworkURL
{
  return self->_messagesArtworkURL;
}

- (void)setMessagesArtworkURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (int64_t)packageCompression
{
  return self->_packageCompression;
}

- (void)setPackageCompression:(int64_t)a3
{
  self->_packageCompression = a3;
}

- (NSData)packageDPInfo
{
  return self->_packageDPInfo;
}

- (void)setPackageDPInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSData)packageSINF
{
  return self->_packageSINF;
}

- (void)setPackageSINF:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSNumber)packageSize
{
  return self->_packageSize;
}

- (void)setPackageSize:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSURL)packageURL
{
  return self->_packageURL;
}

- (void)setPackageURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSArray)provisioningProfiles
{
  return self->_provisioningProfiles;
}

- (void)setProvisioningProfiles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSData)receipt
{
  return self->_receipt;
}

- (void)setReceipt:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSString)shortBundleVersion
{
  return self->_shortBundleVersion;
}

- (void)setShortBundleVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (int64_t)softwarePlatform
{
  return self->_softwarePlatform;
}

- (void)setSoftwarePlatform:(int64_t)a3
{
  self->_softwarePlatform = a3;
}

- (NSString)storeCohort
{
  return self->_storeCohort;
}

- (void)setStoreCohort:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSNumber)storeFront
{
  return self->_storeFront;
}

- (void)setStoreFront:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSArray)subGenres
{
  return self->_subGenres;
}

- (void)setSubGenres:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (NSString)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (NSString)variantID
{
  return self->_variantID;
}

- (void)setVariantID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (NSString)vendorName
{
  return self->_vendorName;
}

- (void)setVendorName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorName, 0);
  objc_storeStrong((id *)&self->_variantID, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_subGenres, 0);
  objc_storeStrong((id *)&self->_storeFront, 0);
  objc_storeStrong((id *)&self->_storeCohort, 0);
  objc_storeStrong((id *)&self->_shortBundleVersion, 0);
  objc_storeStrong((id *)&self->_receipt, 0);
  objc_storeStrong((id *)&self->_provisioningProfiles, 0);
  objc_storeStrong((id *)&self->_packageURL, 0);
  objc_storeStrong((id *)&self->_packageSize, 0);
  objc_storeStrong((id *)&self->_packageSINF, 0);
  objc_storeStrong((id *)&self->_packageDPInfo, 0);
  objc_storeStrong((id *)&self->_messagesArtworkURL, 0);
  objc_storeStrong((id *)&self->_placeholderEntitlements, 0);
  objc_storeStrong((id *)&self->_itemName, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_initialODRSize, 0);
  objc_storeStrong((id *)&self->_genreIDs, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_externalVersionIdentifier, 0);
  objc_storeStrong((id *)&self->_existingBundleURL, 0);
  objc_storeStrong((id *)&self->_companionBundleID, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_betaBuildGroupID, 0);
  objc_storeStrong((id *)&self->_backgroundAssetMetadata, 0);
  objc_storeStrong((id *)&self->_artworkURL, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
