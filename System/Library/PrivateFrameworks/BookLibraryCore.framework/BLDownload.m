@implementation BLDownload

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BLDownload)initWithCoder:(id)a3
{
  id v4;
  BLDownload *v5;
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
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)BLDownload;
  v5 = -[BLDownload init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("downloadID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLDownload setDownloadID:](v5, "setDownloadID:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("buyParameters"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLDownload setBuyParameters:](v5, "setBuyParameters:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("permlink"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLDownload setPermlink:](v5, "setPermlink:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("storeIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLDownload setStoreIdentifier:](v5, "setStoreIdentifier:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("persistentIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLDownload setPersistentIdentifier:](v5, "setPersistentIdentifier:", v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originalURL"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLDownload setUrl:](v5, "setUrl:", v11);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLDownload setOriginalURL:](v5, "setOriginalURL:", v12);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("target"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLDownload setTargetDownloadDirectory:](v5, "setTargetDownloadDirectory:", v13);

    -[BLDownload setState:](v5, "setState:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("state")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startTime"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLDownload setStartTime:](v5, "setStartTime:", v14);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetPath"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLDownload setAssetPath:](v5, "setAssetPath:", v15);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("publicationVersion"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLDownload setPublicationVersion:](v5, "setPublicationVersion:", v16);

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
  id v15;

  v4 = a3;
  -[BLDownload downloadID](self, "downloadID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("downloadID"));

  -[BLDownload buyParameters](self, "buyParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("buyParameters"));

  -[BLDownload permlink](self, "permlink");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("permlink"));

  -[BLDownload storeIdentifier](self, "storeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("storeIdentifier"));

  -[BLDownload url](self, "url");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("url"));

  -[BLDownload originalURL](self, "originalURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("originalURL"));

  -[BLDownload targetDownloadDirectory](self, "targetDownloadDirectory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("target"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[BLDownload state](self, "state"), CFSTR("state"));
  -[BLDownload startTime](self, "startTime");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("startTime"));

  -[BLDownload assetPath](self, "assetPath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("assetPath"));

  -[BLDownload persistentIdentifier](self, "persistentIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("persistentIdentifier"));

  -[BLDownload publicationVersion](self, "publicationVersion");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("publicationVersion"));

}

- (id)copyWithZone:(_NSZone *)a3
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
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;

  v4 = (void *)objc_opt_new();
  if (v4)
  {
    -[BLDownload downloadID](self, "downloadID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDownloadID:", v5);

    -[BLDownload url](self, "url");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setUrl:", v6);

    -[BLDownload targetDownloadDirectory](self, "targetDownloadDirectory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTargetDownloadDirectory:", v7);

    objc_msgSend(v4, "setState:", -[BLDownload state](self, "state"));
    -[BLDownload startTime](self, "startTime");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setStartTime:", v8);

    -[BLDownload assetPath](self, "assetPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAssetPath:", v9);

    -[BLDownload buyParameters](self, "buyParameters");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBuyParameters:", v10);

    -[BLDownload permlink](self, "permlink");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPermlink:", v11);

    -[BLDownload storeIdentifier](self, "storeIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setStoreIdentifier:", v12);

    -[BLDownload storePlaylistIdentifier](self, "storePlaylistIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setStorePlaylistIdentifier:", v13);

    -[BLDownload clientIdentifier](self, "clientIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setClientIdentifier:", v14);

    -[BLDownload persistentIdentifier](self, "persistentIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPersistentIdentifier:", v15);

    objc_msgSend(v4, "setFileSize:", -[BLDownload fileSize](self, "fileSize"));
    -[BLDownload lastStateChangeTime](self, "lastStateChangeTime");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLastStateChangeTime:", v16);

    -[BLDownload hashType](self, "hashType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHashType:", v17);

    -[BLDownload md5HashStrings](self, "md5HashStrings");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMd5HashStrings:", v18);

    objc_msgSend(v4, "setNumberOfBytesToHash:", -[BLDownload numberOfBytesToHash](self, "numberOfBytesToHash"));
    -[BLDownload serverNumberOfBytesToHash](self, "serverNumberOfBytesToHash");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setServerNumberOfBytesToHash:", v19);

    -[BLDownload publicationVersion](self, "publicationVersion");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPublicationVersion:", v20);

    -[BLDownload isAutomaticDownload](self, "isAutomaticDownload");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setIsAutomaticDownload:", v21);

    -[BLDownload isRestore](self, "isRestore");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setIsRestore:", v22);

    -[BLDownload downloadKey](self, "downloadKey");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDownloadKey:", v23);

    -[BLDownload accountID](self, "accountID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAccountID:", v24);

    -[BLDownload familyAccountID](self, "familyAccountID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFamilyAccountID:", v25);

    -[BLDownload isZipStreamable](self, "isZipStreamable");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setIsZipStreamable:", v26);

    -[BLDownload dpInfo](self, "dpInfo");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDpInfo:", v27);

    -[BLDownload sinfData](self, "sinfData");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSinfData:", v28);

    -[BLDownload isSample](self, "isSample");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setIsSample:", v29);

    -[BLDownload isPurchase](self, "isPurchase");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setIsPurchase:", v30);

    -[BLDownload isLocalCacheServer](self, "isLocalCacheServer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setIsLocalCacheServer:", v31);

    -[BLDownload originalURL](self, "originalURL");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setOriginalURL:", v32);

    -[BLDownload encryptionKey](self, "encryptionKey");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEncryptionKey:", v33);

    -[BLDownload salt](self, "salt");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSalt:", v34);

    -[BLDownload cleanupPending](self, "cleanupPending");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCleanupPending:", v35);

    -[BLDownload purchaseDate](self, "purchaseDate");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPurchaseDate:", v36);

    -[BLDownload artistName](self, "artistName");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setArtistName:", v37);

    -[BLDownload title](self, "title");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTitle:", v38);

    -[BLDownload subtitle](self, "subtitle");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSubtitle:", v39);

    -[BLDownload collectionArtistName](self, "collectionArtistName");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCollectionArtistName:", v40);

    -[BLDownload collectionTitle](self, "collectionTitle");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCollectionTitle:", v41);

    -[BLDownload genre](self, "genre");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setGenre:", v42);

    -[BLDownload kind](self, "kind");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setKind:", v43);

    -[BLDownload thumbnailImageURL](self, "thumbnailImageURL");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setThumbnailImageURL:", v44);

  }
  return v4;
}

- (double)transferProgressFraction
{
  void *v3;
  double result;
  void *v5;
  int v6;

  -[BLDownload dpInfo](self, "dpInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return 0.6;
  -[BLDownload isZipStreamable](self, "isZipStreamable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  result = 0.8;
  if (v6)
    return 1.0;
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[BLDownload downloadID](self, "downloadID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLDownload title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromBLDownloadState(-[BLDownload state](self, "state"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD1500];
  -[BLDownload startTime](self, "startTime");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringFromDate:dateStyle:timeStyle:", v8, 1, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{ DownloadID: %@ Title: %@ State:%@ Started at: %@}"), v4, v5, v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)downloadID
{
  return self->_downloadID;
}

- (void)setDownloadID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)targetDownloadDirectory
{
  return self->_targetDownloadDirectory;
}

- (void)setTargetDownloadDirectory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)assetPath
{
  return self->_assetPath;
}

- (void)setAssetPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)buyParameters
{
  return self->_buyParameters;
}

- (void)setBuyParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)permlink
{
  return self->_permlink;
}

- (void)setPermlink:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSNumber)storeIdentifier
{
  return self->_storeIdentifier;
}

- (void)setStoreIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_storeIdentifier, a3);
}

- (NSNumber)storePlaylistIdentifier
{
  return self->_storePlaylistIdentifier;
}

- (void)setStorePlaylistIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_storePlaylistIdentifier, a3);
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)persistentIdentifier
{
  return self->_persistentIdentifier;
}

- (void)setPersistentIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_persistentIdentifier, a3);
}

- (NSString)transactionIdentifier
{
  return self->_transactionIdentifier;
}

- (void)setTransactionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)cancelDownloadURL
{
  return self->_cancelDownloadURL;
}

- (void)setCancelDownloadURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (unint64_t)fileSize
{
  return self->_fileSize;
}

- (void)setFileSize:(unint64_t)a3
{
  self->_fileSize = a3;
}

- (NSDate)lastStateChangeTime
{
  return self->_lastStateChangeTime;
}

- (void)setLastStateChangeTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)hashType
{
  return self->_hashType;
}

- (void)setHashType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)md5HashStrings
{
  return self->_md5HashStrings;
}

- (void)setMd5HashStrings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (int64_t)numberOfBytesToHash
{
  return self->_numberOfBytesToHash;
}

- (void)setNumberOfBytesToHash:(int64_t)a3
{
  self->_numberOfBytesToHash = a3;
}

- (NSNumber)serverNumberOfBytesToHash
{
  return self->_serverNumberOfBytesToHash;
}

- (void)setServerNumberOfBytesToHash:(id)a3
{
  objc_storeStrong((id *)&self->_serverNumberOfBytesToHash, a3);
}

- (NSNumber)publicationVersion
{
  return self->_publicationVersion;
}

- (void)setPublicationVersion:(id)a3
{
  objc_storeStrong((id *)&self->_publicationVersion, a3);
}

- (NSNumber)isAutomaticDownload
{
  return self->_isAutomaticDownload;
}

- (void)setIsAutomaticDownload:(id)a3
{
  objc_storeStrong((id *)&self->_isAutomaticDownload, a3);
}

- (NSNumber)isRestore
{
  return self->_isRestore;
}

- (void)setIsRestore:(id)a3
{
  objc_storeStrong((id *)&self->_isRestore, a3);
}

- (NSString)downloadKey
{
  return self->_downloadKey;
}

- (void)setDownloadKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSNumber)accountID
{
  return self->_accountID;
}

- (void)setAccountID:(id)a3
{
  objc_storeStrong((id *)&self->_accountID, a3);
}

- (NSNumber)familyAccountID
{
  return self->_familyAccountID;
}

- (void)setFamilyAccountID:(id)a3
{
  objc_storeStrong((id *)&self->_familyAccountID, a3);
}

- (NSNumber)isZipStreamable
{
  return self->_isZipStreamable;
}

- (void)setIsZipStreamable:(id)a3
{
  objc_storeStrong((id *)&self->_isZipStreamable, a3);
}

- (NSData)dpInfo
{
  return self->_dpInfo;
}

- (void)setDpInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSData)sinfData
{
  return self->_sinfData;
}

- (void)setSinfData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (NSNumber)isSample
{
  return self->_isSample;
}

- (void)setIsSample:(id)a3
{
  objc_storeStrong((id *)&self->_isSample, a3);
}

- (NSNumber)isPurchase
{
  return self->_isPurchase;
}

- (void)setIsPurchase:(id)a3
{
  objc_storeStrong((id *)&self->_isPurchase, a3);
}

- (NSDate)purchaseDate
{
  return self->_purchaseDate;
}

- (void)setPurchaseDate:(id)a3
{
  objc_storeStrong((id *)&self->_purchaseDate, a3);
}

- (NSNumber)isLocalCacheServer
{
  return self->_isLocalCacheServer;
}

- (void)setIsLocalCacheServer:(id)a3
{
  objc_storeStrong((id *)&self->_isLocalCacheServer, a3);
}

- (NSString)originalURL
{
  return self->_originalURL;
}

- (void)setOriginalURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (NSString)encryptionKey
{
  return self->_encryptionKey;
}

- (void)setEncryptionKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (NSString)salt
{
  return self->_salt;
}

- (void)setSalt:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (NSNumber)cleanupPending
{
  return self->_cleanupPending;
}

- (void)setCleanupPending:(id)a3
{
  objc_storeStrong((id *)&self->_cleanupPending, a3);
}

- (NSString)artistName
{
  return self->_artistName;
}

- (void)setArtistName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (NSString)collectionArtistName
{
  return self->_collectionArtistName;
}

- (void)setCollectionArtistName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (NSString)collectionTitle
{
  return self->_collectionTitle;
}

- (void)setCollectionTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (NSString)genre
{
  return self->_genre;
}

- (void)setGenre:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 344);
}

- (NSString)kind
{
  return self->_kind;
}

- (void)setKind:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 352);
}

- (NSString)thumbnailImageURL
{
  return self->_thumbnailImageURL;
}

- (void)setThumbnailImageURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 360);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailImageURL, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_collectionTitle, 0);
  objc_storeStrong((id *)&self->_collectionArtistName, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
  objc_storeStrong((id *)&self->_cleanupPending, 0);
  objc_storeStrong((id *)&self->_salt, 0);
  objc_storeStrong((id *)&self->_encryptionKey, 0);
  objc_storeStrong((id *)&self->_originalURL, 0);
  objc_storeStrong((id *)&self->_isLocalCacheServer, 0);
  objc_storeStrong((id *)&self->_purchaseDate, 0);
  objc_storeStrong((id *)&self->_isPurchase, 0);
  objc_storeStrong((id *)&self->_isSample, 0);
  objc_storeStrong((id *)&self->_sinfData, 0);
  objc_storeStrong((id *)&self->_dpInfo, 0);
  objc_storeStrong((id *)&self->_isZipStreamable, 0);
  objc_storeStrong((id *)&self->_familyAccountID, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_downloadKey, 0);
  objc_storeStrong((id *)&self->_isRestore, 0);
  objc_storeStrong((id *)&self->_isAutomaticDownload, 0);
  objc_storeStrong((id *)&self->_publicationVersion, 0);
  objc_storeStrong((id *)&self->_serverNumberOfBytesToHash, 0);
  objc_storeStrong((id *)&self->_md5HashStrings, 0);
  objc_storeStrong((id *)&self->_hashType, 0);
  objc_storeStrong((id *)&self->_lastStateChangeTime, 0);
  objc_storeStrong((id *)&self->_cancelDownloadURL, 0);
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
  objc_storeStrong((id *)&self->_persistentIdentifier, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_storePlaylistIdentifier, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_permlink, 0);
  objc_storeStrong((id *)&self->_buyParameters, 0);
  objc_storeStrong((id *)&self->_assetPath, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_targetDownloadDirectory, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_downloadID, 0);
}

@end
