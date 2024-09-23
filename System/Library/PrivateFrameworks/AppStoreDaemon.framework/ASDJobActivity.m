@implementation ASDJobActivity

- (BOOL)isValid
{
  return -[NSString length](self->_bundleID, "length") != 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ASDJobActivity *v5;
  uint64_t v6;
  NSData *appReceiptData;
  uint64_t v8;
  NSNumber *artistID;
  uint64_t v10;
  NSString *artistName;
  uint64_t v12;
  NSArray *assets;
  uint64_t v14;
  NSNumber *betaExternalVersionIdentifier;
  uint64_t v16;
  NSString *bundleID;
  uint64_t v18;
  NSString *bundleVersion;
  uint64_t v20;
  NSString *buyParams;
  uint64_t v22;
  NSString *cancelDownloadURL;
  uint64_t v24;
  NSString *clientID;
  uint64_t v26;
  NSString *collectionName;
  uint64_t v28;
  NSNumber *divertedTrackingID;
  uint64_t v30;
  NSNumber *enableExtensions;
  uint64_t v32;
  NSString *genre;
  uint64_t v34;
  NSNumber *genreID;
  uint64_t v36;
  NSNumber *iAdAttribution;
  uint64_t v38;
  NSDate *iAdConversionDate;
  uint64_t v40;
  NSDate *iAdImpressionDate;
  uint64_t v42;
  NSNumber *itemID;
  uint64_t v44;
  NSString *kind;
  uint64_t v46;
  NSString *messagesArtworkURL;
  uint64_t v48;
  NSNumber *persistentID;
  uint64_t v50;
  NSDate *purchaseDate;
  uint64_t v52;
  NSNumber *purchaseID;
  uint64_t v54;
  NSString *ratingLabel;
  uint64_t v56;
  NSNumber *ratingRank;
  uint64_t v58;
  NSDate *releaseDate;
  uint64_t v60;
  NSNumber *softwareVersionExternalIdentifier;
  uint64_t v62;
  NSNumber *storeAccountID;
  uint64_t v64;
  NSString *storeAccountName;
  uint64_t v66;
  NSString *storeCohort;
  uint64_t v68;
  NSDictionary *storeDownloadInfo;
  uint64_t v70;
  NSString *storeDownloadKey;
  uint64_t v72;
  NSString *storefront;
  uint64_t v74;
  NSString *storeTransactionID;
  uint64_t v76;
  NSString *thumbnailURL;
  uint64_t v78;
  NSString *title;
  uint64_t v80;
  NSString *variantID;

  v5 = -[ASDJobActivity init](+[ASDJobActivity allocWithZone:](ASDJobActivity, "allocWithZone:"), "init");
  v6 = -[NSData copyWithZone:](self->_appReceiptData, "copyWithZone:", a3);
  appReceiptData = v5->_appReceiptData;
  v5->_appReceiptData = (NSData *)v6;

  v8 = -[NSNumber copyWithZone:](self->_artistID, "copyWithZone:", a3);
  artistID = v5->_artistID;
  v5->_artistID = (NSNumber *)v8;

  v10 = -[NSString copyWithZone:](self->_artistName, "copyWithZone:", a3);
  artistName = v5->_artistName;
  v5->_artistName = (NSString *)v10;

  v12 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99DE8], "allocWithZone:", a3), "initWithArray:copyItems:", self->_assets, 1);
  assets = v5->_assets;
  v5->_assets = (NSArray *)v12;

  v14 = -[NSNumber copyWithZone:](self->_betaExternalVersionIdentifier, "copyWithZone:", a3);
  betaExternalVersionIdentifier = v5->_betaExternalVersionIdentifier;
  v5->_betaExternalVersionIdentifier = (NSNumber *)v14;

  v16 = -[NSString copyWithZone:](self->_bundleID, "copyWithZone:", a3);
  bundleID = v5->_bundleID;
  v5->_bundleID = (NSString *)v16;

  v18 = -[NSString copyWithZone:](self->_bundleVersion, "copyWithZone:", a3);
  bundleVersion = v5->_bundleVersion;
  v5->_bundleVersion = (NSString *)v18;

  v20 = -[NSString copyWithZone:](self->_buyParams, "copyWithZone:", a3);
  buyParams = v5->_buyParams;
  v5->_buyParams = (NSString *)v20;

  v22 = -[NSString copyWithZone:](self->_cancelDownloadURL, "copyWithZone:", a3);
  cancelDownloadURL = v5->_cancelDownloadURL;
  v5->_cancelDownloadURL = (NSString *)v22;

  v5->_cancelIfDuplicate = self->_cancelIfDuplicate;
  v24 = -[NSString copyWithZone:](self->_clientID, "copyWithZone:", a3);
  clientID = v5->_clientID;
  v5->_clientID = (NSString *)v24;

  v26 = -[NSString copyWithZone:](self->_collectionName, "copyWithZone:", a3);
  collectionName = v5->_collectionName;
  v5->_collectionName = (NSString *)v26;

  v28 = -[NSNumber copyWithZone:](self->_divertedTrackingID, "copyWithZone:", a3);
  divertedTrackingID = v5->_divertedTrackingID;
  v5->_divertedTrackingID = (NSNumber *)v28;

  v30 = -[NSNumber copyWithZone:](self->_enableExtensions, "copyWithZone:", a3);
  enableExtensions = v5->_enableExtensions;
  v5->_enableExtensions = (NSNumber *)v30;

  v5->_explicitContent = self->_explicitContent;
  objc_storeStrong((id *)&v5->_externalOrderKey, self->_externalOrderKey);
  v32 = -[NSString copyWithZone:](self->_genre, "copyWithZone:", a3);
  genre = v5->_genre;
  v5->_genre = (NSString *)v32;

  v34 = -[NSNumber copyWithZone:](self->_genreID, "copyWithZone:", a3);
  genreID = v5->_genreID;
  v5->_genreID = (NSNumber *)v34;

  v5->_hasMessagesExtension = self->_hasMessagesExtension;
  v5->_hasWatchApp = self->_hasWatchApp;
  v36 = -[NSNumber copyWithZone:](self->_iAdAttribution, "copyWithZone:", a3);
  iAdAttribution = v5->_iAdAttribution;
  v5->_iAdAttribution = (NSNumber *)v36;

  v38 = -[NSDate copyWithZone:](self->_iAdConversionDate, "copyWithZone:", a3);
  iAdConversionDate = v5->_iAdConversionDate;
  v5->_iAdConversionDate = (NSDate *)v38;

  v40 = -[NSDate copyWithZone:](self->_iAdImpressionDate, "copyWithZone:", a3);
  iAdImpressionDate = v5->_iAdImpressionDate;
  v5->_iAdImpressionDate = (NSDate *)v40;

  v5->_isAutomatic = self->_isAutomatic;
  v5->_isCompatibilityUpdate = self->_isCompatibilityUpdate;
  v5->_isDeviceBasedVPP = self->_isDeviceBasedVPP;
  v5->_isFromStore = self->_isFromStore;
  v5->_isGameCenterEnabled = self->_isGameCenterEnabled;
  v5->_isInQueue = self->_isInQueue;
  v5->_isPendingApproval = self->_isPendingApproval;
  v5->_isPurchasedRedownload = self->_isPurchasedRedownload;
  v5->_isRestore = self->_isRestore;
  v5->_isShared = self->_isShared;
  v5->_isTVTemplate = self->_isTVTemplate;
  v5->_isUpdate = self->_isUpdate;
  v42 = -[NSNumber copyWithZone:](self->_itemID, "copyWithZone:", a3);
  itemID = v5->_itemID;
  v5->_itemID = (NSNumber *)v42;

  v44 = -[NSString copyWithZone:](self->_kind, "copyWithZone:", a3);
  kind = v5->_kind;
  v5->_kind = (NSString *)v44;

  v5->_launchProhibited = self->_launchProhibited;
  v46 = -[NSString copyWithZone:](self->_messagesArtworkURL, "copyWithZone:", a3);
  messagesArtworkURL = v5->_messagesArtworkURL;
  v5->_messagesArtworkURL = (NSString *)v46;

  v48 = -[NSNumber copyWithZone:](self->_persistentID, "copyWithZone:", a3);
  persistentID = v5->_persistentID;
  v5->_persistentID = (NSNumber *)v48;

  v50 = -[NSDate copyWithZone:](self->_purchaseDate, "copyWithZone:", a3);
  purchaseDate = v5->_purchaseDate;
  v5->_purchaseDate = (NSDate *)v50;

  v52 = -[NSNumber copyWithZone:](self->_purchaseID, "copyWithZone:", a3);
  purchaseID = v5->_purchaseID;
  v5->_purchaseID = (NSNumber *)v52;

  v54 = -[NSString copyWithZone:](self->_ratingLabel, "copyWithZone:", a3);
  ratingLabel = v5->_ratingLabel;
  v5->_ratingLabel = (NSString *)v54;

  v56 = -[NSNumber copyWithZone:](self->_ratingRank, "copyWithZone:", a3);
  ratingRank = v5->_ratingRank;
  v5->_ratingRank = (NSNumber *)v56;

  v58 = -[NSDate copyWithZone:](self->_releaseDate, "copyWithZone:", a3);
  releaseDate = v5->_releaseDate;
  v5->_releaseDate = (NSDate *)v58;

  v5->_softwareIconNeedsShine = self->_softwareIconNeedsShine;
  v60 = -[NSNumber copyWithZone:](self->_softwareVersionExternalIdentifier, "copyWithZone:", a3);
  softwareVersionExternalIdentifier = v5->_softwareVersionExternalIdentifier;
  v5->_softwareVersionExternalIdentifier = (NSNumber *)v60;

  v62 = -[NSNumber copyWithZone:](self->_storeAccountID, "copyWithZone:", a3);
  storeAccountID = v5->_storeAccountID;
  v5->_storeAccountID = (NSNumber *)v62;

  v64 = -[NSString copyWithZone:](self->_storeAccountName, "copyWithZone:", a3);
  storeAccountName = v5->_storeAccountName;
  v5->_storeAccountName = (NSString *)v64;

  v66 = -[NSString copyWithZone:](self->_storeCohort, "copyWithZone:", a3);
  storeCohort = v5->_storeCohort;
  v5->_storeCohort = (NSString *)v66;

  v68 = -[NSDictionary copyWithZone:](self->_storeDownloadInfo, "copyWithZone:", a3);
  storeDownloadInfo = v5->_storeDownloadInfo;
  v5->_storeDownloadInfo = (NSDictionary *)v68;

  v70 = -[NSString copyWithZone:](self->_storeDownloadKey, "copyWithZone:", a3);
  storeDownloadKey = v5->_storeDownloadKey;
  v5->_storeDownloadKey = (NSString *)v70;

  v72 = -[NSString copyWithZone:](self->_storefront, "copyWithZone:", a3);
  storefront = v5->_storefront;
  v5->_storefront = (NSString *)v72;

  v74 = -[NSString copyWithZone:](self->_storeTransactionID, "copyWithZone:", a3);
  storeTransactionID = v5->_storeTransactionID;
  v5->_storeTransactionID = (NSString *)v74;

  v5->_thirtyTwoBitOnly = self->_thirtyTwoBitOnly;
  v76 = -[NSString copyWithZone:](self->_thumbnailURL, "copyWithZone:", a3);
  thumbnailURL = v5->_thumbnailURL;
  v5->_thumbnailURL = (NSString *)v76;

  v78 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  title = v5->_title;
  v5->_title = (NSString *)v78;

  v80 = -[NSString copyWithZone:](self->_variantID, "copyWithZone:", a3);
  variantID = v5->_variantID;
  v5->_variantID = (NSString *)v80;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDJobActivity)initWithCoder:(id)a3
{
  id v4;
  ASDJobActivity *v5;
  uint64_t v6;
  NSData *appReceiptData;
  uint64_t v8;
  NSNumber *artistID;
  uint64_t v10;
  NSString *artistName;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSArray *assets;
  uint64_t v17;
  NSString *bundleID;
  uint64_t v19;
  NSNumber *betaExternalVersionIdentifier;
  uint64_t v21;
  NSString *bundleVersion;
  uint64_t v23;
  NSString *buyParams;
  uint64_t v25;
  NSString *cancelDownloadURL;
  uint64_t v27;
  NSString *clientID;
  uint64_t v29;
  NSString *collectionName;
  uint64_t v31;
  NSNumber *divertedTrackingID;
  uint64_t v33;
  NSNumber *enableExtensions;
  uint64_t v35;
  NSNumber *externalOrderKey;
  uint64_t v37;
  NSString *genre;
  uint64_t v39;
  NSNumber *genreID;
  uint64_t v41;
  NSNumber *iAdAttribution;
  uint64_t v43;
  NSDate *iAdConversionDate;
  uint64_t v45;
  NSDate *iAdImpressionDate;
  uint64_t v47;
  NSNumber *itemID;
  uint64_t v49;
  NSString *kind;
  uint64_t v51;
  NSString *messagesArtworkURL;
  uint64_t v53;
  NSNumber *persistentID;
  uint64_t v55;
  NSDate *purchaseDate;
  uint64_t v57;
  NSNumber *purchaseID;
  uint64_t v59;
  NSString *ratingLabel;
  uint64_t v61;
  NSNumber *ratingRank;
  uint64_t v63;
  NSDate *releaseDate;
  uint64_t v65;
  NSNumber *storeAccountID;
  uint64_t v67;
  NSString *storeAccountName;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  NSDictionary *storeDownloadInfo;
  uint64_t v76;
  NSString *storefront;
  uint64_t v78;
  NSNumber *softwareVersionExternalIdentifier;
  uint64_t v80;
  NSString *storeDownloadKey;
  uint64_t v82;
  NSString *storeTransactionID;
  uint64_t v84;
  NSString *storeCohort;
  uint64_t v86;
  NSString *thumbnailURL;
  uint64_t v88;
  NSString *title;
  uint64_t v90;
  NSString *variantID;
  objc_super v93;

  v4 = a3;
  v93.receiver = self;
  v93.super_class = (Class)ASDJobActivity;
  v5 = -[ASDJobActivity init](&v93, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appReceipt"));
    v6 = objc_claimAutoreleasedReturnValue();
    appReceiptData = v5->_appReceiptData;
    v5->_appReceiptData = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("artistID"));
    v8 = objc_claimAutoreleasedReturnValue();
    artistID = v5->_artistID;
    v5->_artistID = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("artistName"));
    v10 = objc_claimAutoreleasedReturnValue();
    artistName = v5->_artistName;
    v5->_artistName = (NSString *)v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("assets"));
    v15 = objc_claimAutoreleasedReturnValue();
    assets = v5->_assets;
    v5->_assets = (NSArray *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleID"));
    v17 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("betaExternalVersionIdentifier"));
    v19 = objc_claimAutoreleasedReturnValue();
    betaExternalVersionIdentifier = v5->_betaExternalVersionIdentifier;
    v5->_betaExternalVersionIdentifier = (NSNumber *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleVersion"));
    v21 = objc_claimAutoreleasedReturnValue();
    bundleVersion = v5->_bundleVersion;
    v5->_bundleVersion = (NSString *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("buyParams"));
    v23 = objc_claimAutoreleasedReturnValue();
    buyParams = v5->_buyParams;
    v5->_buyParams = (NSString *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cancelDownloadURL"));
    v25 = objc_claimAutoreleasedReturnValue();
    cancelDownloadURL = v5->_cancelDownloadURL;
    v5->_cancelDownloadURL = (NSString *)v25;

    v5->_cancelIfDuplicate = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("cancelIfDuplicate"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientID"));
    v27 = objc_claimAutoreleasedReturnValue();
    clientID = v5->_clientID;
    v5->_clientID = (NSString *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("collectionName"));
    v29 = objc_claimAutoreleasedReturnValue();
    collectionName = v5->_collectionName;
    v5->_collectionName = (NSString *)v29;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("divertedTrackingID"));
    v31 = objc_claimAutoreleasedReturnValue();
    divertedTrackingID = v5->_divertedTrackingID;
    v5->_divertedTrackingID = (NSNumber *)v31;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("enableExtensions"));
    v33 = objc_claimAutoreleasedReturnValue();
    enableExtensions = v5->_enableExtensions;
    v5->_enableExtensions = (NSNumber *)v33;

    v5->_explicitContent = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("explicitContent"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("externalOrderKey"));
    v35 = objc_claimAutoreleasedReturnValue();
    externalOrderKey = v5->_externalOrderKey;
    v5->_externalOrderKey = (NSNumber *)v35;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("genre"));
    v37 = objc_claimAutoreleasedReturnValue();
    genre = v5->_genre;
    v5->_genre = (NSString *)v37;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("genreID"));
    v39 = objc_claimAutoreleasedReturnValue();
    genreID = v5->_genreID;
    v5->_genreID = (NSNumber *)v39;

    v5->_hasMessagesExtension = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasMessagesExtension"));
    v5->_hasWatchApp = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasWatchApp"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iAdAttribution"));
    v41 = objc_claimAutoreleasedReturnValue();
    iAdAttribution = v5->_iAdAttribution;
    v5->_iAdAttribution = (NSNumber *)v41;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iAdConversionDate"));
    v43 = objc_claimAutoreleasedReturnValue();
    iAdConversionDate = v5->_iAdConversionDate;
    v5->_iAdConversionDate = (NSDate *)v43;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iAdImpressionDate"));
    v45 = objc_claimAutoreleasedReturnValue();
    iAdImpressionDate = v5->_iAdImpressionDate;
    v5->_iAdImpressionDate = (NSDate *)v45;

    v5->_isAutomatic = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isAutomatic"));
    v5->_isCompatibilityUpdate = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isCompatibilityUpdate"));
    v5->_isDeviceBasedVPP = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isDeviceBasedVPP"));
    v5->_isFromStore = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isFromStore"));
    v5->_isGameCenterEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isGameCenterEnabled"));
    v5->_isInQueue = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isInQueue"));
    v5->_isPendingApproval = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isPendingApproval"));
    v5->_isPurchasedRedownload = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isPurchasedRedownload"));
    v5->_isRestore = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isRestore"));
    v5->_isShared = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isShared"));
    v5->_isTVTemplate = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isTVTemplate"));
    v5->_isUpdate = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isUpdate"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("itemID"));
    v47 = objc_claimAutoreleasedReturnValue();
    itemID = v5->_itemID;
    v5->_itemID = (NSNumber *)v47;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kind"));
    v49 = objc_claimAutoreleasedReturnValue();
    kind = v5->_kind;
    v5->_kind = (NSString *)v49;

    v5->_launchProhibited = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("launchProhibited"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("messagesArtworkURL"));
    v51 = objc_claimAutoreleasedReturnValue();
    messagesArtworkURL = v5->_messagesArtworkURL;
    v5->_messagesArtworkURL = (NSString *)v51;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("persistentID"));
    v53 = objc_claimAutoreleasedReturnValue();
    persistentID = v5->_persistentID;
    v5->_persistentID = (NSNumber *)v53;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("purchaseDate"));
    v55 = objc_claimAutoreleasedReturnValue();
    purchaseDate = v5->_purchaseDate;
    v5->_purchaseDate = (NSDate *)v55;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("purchaseID"));
    v57 = objc_claimAutoreleasedReturnValue();
    purchaseID = v5->_purchaseID;
    v5->_purchaseID = (NSNumber *)v57;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ratingLabel"));
    v59 = objc_claimAutoreleasedReturnValue();
    ratingLabel = v5->_ratingLabel;
    v5->_ratingLabel = (NSString *)v59;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ratingRank"));
    v61 = objc_claimAutoreleasedReturnValue();
    ratingRank = v5->_ratingRank;
    v5->_ratingRank = (NSNumber *)v61;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("releaseDate"));
    v63 = objc_claimAutoreleasedReturnValue();
    releaseDate = v5->_releaseDate;
    v5->_releaseDate = (NSDate *)v63;

    v5->_softwareIconNeedsShine = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("softwareIconNeedsShine"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("storeAccountID"));
    v65 = objc_claimAutoreleasedReturnValue();
    storeAccountID = v5->_storeAccountID;
    v5->_storeAccountID = (NSNumber *)v65;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("storeAccountName"));
    v67 = objc_claimAutoreleasedReturnValue();
    storeAccountName = v5->_storeAccountName;
    v5->_storeAccountName = (NSString *)v67;

    v69 = (void *)MEMORY[0x1E0C99E60];
    v70 = objc_opt_class();
    v71 = objc_opt_class();
    v72 = objc_opt_class();
    objc_msgSend(v69, "setWithObjects:", v70, v71, v72, objc_opt_class(), 0);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v73, CFSTR("storeDownloadInfo"));
    v74 = objc_claimAutoreleasedReturnValue();
    storeDownloadInfo = v5->_storeDownloadInfo;
    v5->_storeDownloadInfo = (NSDictionary *)v74;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("storefront"));
    v76 = objc_claimAutoreleasedReturnValue();
    storefront = v5->_storefront;
    v5->_storefront = (NSString *)v76;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("softwareVersionExternalIdentifier"));
    v78 = objc_claimAutoreleasedReturnValue();
    softwareVersionExternalIdentifier = v5->_softwareVersionExternalIdentifier;
    v5->_softwareVersionExternalIdentifier = (NSNumber *)v78;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("storeDownloadKey"));
    v80 = objc_claimAutoreleasedReturnValue();
    storeDownloadKey = v5->_storeDownloadKey;
    v5->_storeDownloadKey = (NSString *)v80;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("storeTransactionID"));
    v82 = objc_claimAutoreleasedReturnValue();
    storeTransactionID = v5->_storeTransactionID;
    v5->_storeTransactionID = (NSString *)v82;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("storeCohort"));
    v84 = objc_claimAutoreleasedReturnValue();
    storeCohort = v5->_storeCohort;
    v5->_storeCohort = (NSString *)v84;

    v5->_thirtyTwoBitOnly = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("thirtyTwoBitOnly"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("thumbnailURL"));
    v86 = objc_claimAutoreleasedReturnValue();
    thumbnailURL = v5->_thumbnailURL;
    v5->_thumbnailURL = (NSString *)v86;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v88 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v88;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("variantID"));
    v90 = objc_claimAutoreleasedReturnValue();
    variantID = v5->_variantID;
    v5->_variantID = (NSString *)v90;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *appReceiptData;
  id v5;

  appReceiptData = self->_appReceiptData;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", appReceiptData, CFSTR("appReceipt"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_artistID, CFSTR("artistID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_artistName, CFSTR("artistName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_assets, CFSTR("assets"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_betaExternalVersionIdentifier, CFSTR("betaExternalVersionIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleID, CFSTR("bundleID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleVersion, CFSTR("bundleVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_buyParams, CFSTR("buyParams"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cancelDownloadURL, CFSTR("cancelDownloadURL"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_cancelIfDuplicate, CFSTR("cancelIfDuplicate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clientID, CFSTR("clientID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_collectionName, CFSTR("collectionName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_divertedTrackingID, CFSTR("divertedTrackingID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_enableExtensions, CFSTR("enableExtensions"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_explicitContent, CFSTR("explicitContent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_externalOrderKey, CFSTR("externalOrderKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_genre, CFSTR("genre"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_genreID, CFSTR("genreID"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasMessagesExtension, CFSTR("hasMessagesExtension"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasWatchApp, CFSTR("hasWatchApp"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_iAdAttribution, CFSTR("iAdAttribution"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_iAdConversionDate, CFSTR("iAdConversionDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_iAdImpressionDate, CFSTR("iAdImpressionDate"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isAutomatic, CFSTR("isAutomatic"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isCompatibilityUpdate, CFSTR("isCompatibilityUpdate"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isDeviceBasedVPP, CFSTR("isDeviceBasedVPP"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isFromStore, CFSTR("isFromStore"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isGameCenterEnabled, CFSTR("isGameCenterEnabled"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isInQueue, CFSTR("isInQueue"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isPendingApproval, CFSTR("isPendingApproval"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isPurchasedRedownload, CFSTR("isPurchasedRedownload"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isRestore, CFSTR("isRestore"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isShared, CFSTR("isShared"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isTVTemplate, CFSTR("isDeviceBasedVPP"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isUpdate, CFSTR("isUpdate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_itemID, CFSTR("itemID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_kind, CFSTR("kind"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_launchProhibited, CFSTR("launchProhibited"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_messagesArtworkURL, CFSTR("messagesArtworkURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_persistentID, CFSTR("persistentID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_purchaseDate, CFSTR("purchaseDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_purchaseID, CFSTR("purchaseID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ratingLabel, CFSTR("ratingLabel"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ratingRank, CFSTR("ratingRank"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_releaseDate, CFSTR("releaseDate"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_softwareIconNeedsShine, CFSTR("softwareIconNeedsShine"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_softwareVersionExternalIdentifier, CFSTR("softwareVersionExternalIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_storeAccountID, CFSTR("storeAccountID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_storeAccountName, CFSTR("storeAccountName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_storeCohort, CFSTR("storeCohort"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_storeDownloadInfo, CFSTR("storeDownloadInfo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_storeDownloadKey, CFSTR("storeDownloadKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_storefront, CFSTR("storefront"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_storeTransactionID, CFSTR("storeTransactionID"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_thirtyTwoBitOnly, CFSTR("thirtyTwoBitOnly"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_thumbnailURL, CFSTR("thumbnailURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_variantID, CFSTR("variantID"));

}

- (NSData)appReceiptData
{
  return self->_appReceiptData;
}

- (void)setAppReceiptData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)assets
{
  return self->_assets;
}

- (void)setAssets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)artistID
{
  return self->_artistID;
}

- (void)setArtistID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)artistName
{
  return self->_artistName;
}

- (void)setArtistName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)betaExternalVersionIdentifier
{
  return self->_betaExternalVersionIdentifier;
}

- (void)setBetaExternalVersionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (void)setBundleVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)buyParams
{
  return self->_buyParams;
}

- (void)setBuyParams:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)cancelDownloadURL
{
  return self->_cancelDownloadURL;
}

- (void)setCancelDownloadURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)clientID
{
  return self->_clientID;
}

- (void)setClientID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)cancelIfDuplicate
{
  return self->_cancelIfDuplicate;
}

- (void)setCancelIfDuplicate:(BOOL)a3
{
  self->_cancelIfDuplicate = a3;
}

- (NSString)collectionName
{
  return self->_collectionName;
}

- (void)setCollectionName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSNumber)divertedTrackingID
{
  return self->_divertedTrackingID;
}

- (void)setDivertedTrackingID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSNumber)enableExtensions
{
  return self->_enableExtensions;
}

- (void)setEnableExtensions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (BOOL)explicitContent
{
  return self->_explicitContent;
}

- (void)setExplicitContent:(BOOL)a3
{
  self->_explicitContent = a3;
}

- (NSNumber)externalOrderKey
{
  return self->_externalOrderKey;
}

- (void)setExternalOrderKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)genre
{
  return self->_genre;
}

- (void)setGenre:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSNumber)genreID
{
  return self->_genreID;
}

- (void)setGenreID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (BOOL)hasMessagesExtension
{
  return self->_hasMessagesExtension;
}

- (void)setHasMessagesExtension:(BOOL)a3
{
  self->_hasMessagesExtension = a3;
}

- (BOOL)hasWatchApp
{
  return self->_hasWatchApp;
}

- (void)setHasWatchApp:(BOOL)a3
{
  self->_hasWatchApp = a3;
}

- (BOOL)isAutomatic
{
  return self->_isAutomatic;
}

- (void)setIsAutomatic:(BOOL)a3
{
  self->_isAutomatic = a3;
}

- (BOOL)isCompatibilityUpdate
{
  return self->_isCompatibilityUpdate;
}

- (void)setIsCompatibilityUpdate:(BOOL)a3
{
  self->_isCompatibilityUpdate = a3;
}

- (BOOL)isDeviceBasedVPP
{
  return self->_isDeviceBasedVPP;
}

- (void)setIsDeviceBasedVPP:(BOOL)a3
{
  self->_isDeviceBasedVPP = a3;
}

- (BOOL)isGameCenterEnabled
{
  return self->_isGameCenterEnabled;
}

- (void)setIsGameCenterEnabled:(BOOL)a3
{
  self->_isGameCenterEnabled = a3;
}

- (BOOL)isInQueue
{
  return self->_isInQueue;
}

- (void)setIsInQueue:(BOOL)a3
{
  self->_isInQueue = a3;
}

- (BOOL)isFromStore
{
  return self->_isFromStore;
}

- (void)setIsFromStore:(BOOL)a3
{
  self->_isFromStore = a3;
}

- (BOOL)isPurchasedRedownload
{
  return self->_isPurchasedRedownload;
}

- (void)setIsPurchasedRedownload:(BOOL)a3
{
  self->_isPurchasedRedownload = a3;
}

- (BOOL)isPendingApproval
{
  return self->_isPendingApproval;
}

- (void)setIsPendingApproval:(BOOL)a3
{
  self->_isPendingApproval = a3;
}

- (BOOL)isRestore
{
  return self->_isRestore;
}

- (void)setIsRestore:(BOOL)a3
{
  self->_isRestore = a3;
}

- (BOOL)isShared
{
  return self->_isShared;
}

- (void)setIsShared:(BOOL)a3
{
  self->_isShared = a3;
}

- (BOOL)isTVTemplate
{
  return self->_isTVTemplate;
}

- (void)setIsTVTemplate:(BOOL)a3
{
  self->_isTVTemplate = a3;
}

- (BOOL)isUpdate
{
  return self->_isUpdate;
}

- (void)setIsUpdate:(BOOL)a3
{
  self->_isUpdate = a3;
}

- (NSNumber)itemID
{
  return self->_itemID;
}

- (void)setItemID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSString)kind
{
  return self->_kind;
}

- (void)setKind:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (BOOL)launchProhibited
{
  return self->_launchProhibited;
}

- (void)setLaunchProhibited:(BOOL)a3
{
  self->_launchProhibited = a3;
}

- (NSString)messagesArtworkURL
{
  return self->_messagesArtworkURL;
}

- (void)setMessagesArtworkURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSDate)purchaseDate
{
  return self->_purchaseDate;
}

- (void)setPurchaseDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSNumber)purchaseID
{
  return self->_purchaseID;
}

- (void)setPurchaseID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSString)ratingLabel
{
  return self->_ratingLabel;
}

- (void)setRatingLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSNumber)ratingRank
{
  return self->_ratingRank;
}

- (void)setRatingRank:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSDate)releaseDate
{
  return self->_releaseDate;
}

- (void)setReleaseDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSNumber)storeAccountID
{
  return self->_storeAccountID;
}

- (void)setStoreAccountID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSString)storeAccountName
{
  return self->_storeAccountName;
}

- (void)setStoreAccountName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (NSString)storeCorrelationKey
{
  return self->_storeCorrelationKey;
}

- (void)setStoreCorrelationKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (NSDictionary)storeDownloadInfo
{
  return self->_storeDownloadInfo;
}

- (void)setStoreDownloadInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (NSString)storeDownloadKey
{
  return self->_storeDownloadKey;
}

- (void)setStoreDownloadKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (NSString)storefront
{
  return self->_storefront;
}

- (void)setStorefront:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (NSString)storeTransactionID
{
  return self->_storeTransactionID;
}

- (void)setStoreTransactionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (BOOL)softwareIconNeedsShine
{
  return self->_softwareIconNeedsShine;
}

- (void)setSoftwareIconNeedsShine:(BOOL)a3
{
  self->_softwareIconNeedsShine = a3;
}

- (NSNumber)softwareVersionExternalIdentifier
{
  return self->_softwareVersionExternalIdentifier;
}

- (void)setSoftwareVersionExternalIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (NSString)storeCohort
{
  return self->_storeCohort;
}

- (void)setStoreCohort:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (NSString)thumbnailURL
{
  return self->_thumbnailURL;
}

- (void)setThumbnailURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (BOOL)is32BitOnly
{
  return self->_thirtyTwoBitOnly;
}

- (void)setThirtyTwoBitOnly:(BOOL)a3
{
  self->_thirtyTwoBitOnly = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (NSString)variantID
{
  return self->_variantID;
}

- (void)setVariantID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (NSNumber)iAdAttribution
{
  return self->_iAdAttribution;
}

- (void)setIAdAttribution:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (NSDate)iAdConversionDate
{
  return self->_iAdConversionDate;
}

- (void)setIAdConversionDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (NSDate)iAdImpressionDate
{
  return self->_iAdImpressionDate;
}

- (void)setIAdImpressionDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (NSNumber)persistentID
{
  return self->_persistentID;
}

- (void)setPersistentID:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 344), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentID, 0);
  objc_storeStrong((id *)&self->_iAdImpressionDate, 0);
  objc_storeStrong((id *)&self->_iAdConversionDate, 0);
  objc_storeStrong((id *)&self->_iAdAttribution, 0);
  objc_storeStrong((id *)&self->_variantID, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_thumbnailURL, 0);
  objc_storeStrong((id *)&self->_storeCohort, 0);
  objc_storeStrong((id *)&self->_softwareVersionExternalIdentifier, 0);
  objc_storeStrong((id *)&self->_storeTransactionID, 0);
  objc_storeStrong((id *)&self->_storefront, 0);
  objc_storeStrong((id *)&self->_storeDownloadKey, 0);
  objc_storeStrong((id *)&self->_storeDownloadInfo, 0);
  objc_storeStrong((id *)&self->_storeCorrelationKey, 0);
  objc_storeStrong((id *)&self->_storeAccountName, 0);
  objc_storeStrong((id *)&self->_storeAccountID, 0);
  objc_storeStrong((id *)&self->_releaseDate, 0);
  objc_storeStrong((id *)&self->_ratingRank, 0);
  objc_storeStrong((id *)&self->_ratingLabel, 0);
  objc_storeStrong((id *)&self->_purchaseID, 0);
  objc_storeStrong((id *)&self->_purchaseDate, 0);
  objc_storeStrong((id *)&self->_messagesArtworkURL, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_genreID, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_externalOrderKey, 0);
  objc_storeStrong((id *)&self->_enableExtensions, 0);
  objc_storeStrong((id *)&self->_divertedTrackingID, 0);
  objc_storeStrong((id *)&self->_collectionName, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
  objc_storeStrong((id *)&self->_cancelDownloadURL, 0);
  objc_storeStrong((id *)&self->_buyParams, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_betaExternalVersionIdentifier, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
  objc_storeStrong((id *)&self->_artistID, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_appReceiptData, 0);
}

@end
