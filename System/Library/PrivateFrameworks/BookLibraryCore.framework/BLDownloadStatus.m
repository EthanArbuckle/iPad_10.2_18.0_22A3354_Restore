@implementation BLDownloadStatus

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

  v4 = (void *)objc_opt_new();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setStoreID:", self->_storeID);
    -[BLDownloadStatus storePlaylistID](self, "storePlaylistID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setStorePlaylistID:", v6);

    -[BLDownloadStatus permLink](self, "permLink");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPermLink:", v7);

    -[BLDownloadStatus downloadID](self, "downloadID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDownloadID:", v8);

    objc_msgSend(v5, "setPersistentIdentifier:", -[BLDownloadStatus persistentIdentifier](self, "persistentIdentifier"));
    -[BLDownloadStatus percentComplete](self, "percentComplete");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPercentComplete:", v9);

    -[BLDownloadStatus estimatedTimeRemaining](self, "estimatedTimeRemaining");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEstimatedTimeRemaining:", v10);

    -[BLDownloadStatus transferBytesWritten](self, "transferBytesWritten");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTransferBytesWritten:", v11);

    -[BLDownloadStatus transferBytesExpected](self, "transferBytesExpected");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTransferBytesExpected:", v12);

    objc_msgSend(v5, "setDownloadPhase:", -[BLDownloadStatus downloadPhase](self, "downloadPhase"));
    objc_msgSend(v5, "setIsAudiobook:", -[BLDownloadStatus isAudiobook](self, "isAudiobook"));
    objc_msgSend(v5, "setIsRestore:", -[BLDownloadStatus isRestore](self, "isRestore"));
    objc_msgSend(v5, "setIsSample:", -[BLDownloadStatus isSample](self, "isSample"));
    objc_msgSend(v5, "setIsPurchase:", -[BLDownloadStatus isPurchase](self, "isPurchase"));
    -[BLDownloadStatus purchaseDate](self, "purchaseDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPurchaseDate:", v13);

    objc_msgSend(v5, "setPersistentIdentifier:", -[BLDownloadStatus persistentIdentifier](self, "persistentIdentifier"));
    -[BLDownloadStatus storeAccountIdentifier](self, "storeAccountIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setStoreAccountIdentifier:", v14);

    -[BLDownloadStatus artistName](self, "artistName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setArtistName:", v15);

    -[BLDownloadStatus title](self, "title");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTitle:", v16);

    -[BLDownloadStatus subtitle](self, "subtitle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSubtitle:", v17);

    -[BLDownloadStatus collectionArtistName](self, "collectionArtistName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCollectionArtistName:", v18);

    -[BLDownloadStatus collectionTitle](self, "collectionTitle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCollectionTitle:", v19);

    -[BLDownloadStatus genre](self, "genre");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setGenre:", v20);

    -[BLDownloadStatus thumbnailImageURL](self, "thumbnailImageURL");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setThumbnailImageURL:", v21);

    -[BLDownloadStatus assetKind](self, "assetKind");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAssetKind:", v22);

  }
  return v5;
}

- (NSNumber)storeID
{
  return self->_storeID;
}

- (void)setStoreID:(id)a3
{
  objc_storeStrong((id *)&self->_storeID, a3);
}

- (NSNumber)storePlaylistID
{
  return self->_storePlaylistID;
}

- (void)setStorePlaylistID:(id)a3
{
  objc_storeStrong((id *)&self->_storePlaylistID, a3);
}

- (NSString)permLink
{
  return self->_permLink;
}

- (void)setPermLink:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)downloadID
{
  return self->_downloadID;
}

- (void)setDownloadID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)percentComplete
{
  return self->_percentComplete;
}

- (void)setPercentComplete:(id)a3
{
  objc_storeStrong((id *)&self->_percentComplete, a3);
}

- (NSNumber)estimatedTimeRemaining
{
  return self->_estimatedTimeRemaining;
}

- (void)setEstimatedTimeRemaining:(id)a3
{
  objc_storeStrong((id *)&self->_estimatedTimeRemaining, a3);
}

- (NSNumber)transferBytesWritten
{
  return self->_transferBytesWritten;
}

- (void)setTransferBytesWritten:(id)a3
{
  objc_storeStrong((id *)&self->_transferBytesWritten, a3);
}

- (NSNumber)transferBytesExpected
{
  return self->_transferBytesExpected;
}

- (void)setTransferBytesExpected:(id)a3
{
  objc_storeStrong((id *)&self->_transferBytesExpected, a3);
}

- (int64_t)downloadPhase
{
  return self->_downloadPhase;
}

- (void)setDownloadPhase:(int64_t)a3
{
  self->_downloadPhase = a3;
}

- (BOOL)isAudiobook
{
  return self->_isAudiobook;
}

- (void)setIsAudiobook:(BOOL)a3
{
  self->_isAudiobook = a3;
}

- (BOOL)isRestore
{
  return self->_isRestore;
}

- (void)setIsRestore:(BOOL)a3
{
  self->_isRestore = a3;
}

- (BOOL)canPause
{
  return self->_canPause;
}

- (void)setCanPause:(BOOL)a3
{
  self->_canPause = a3;
}

- (BOOL)isSample
{
  return self->_isSample;
}

- (void)setIsSample:(BOOL)a3
{
  self->_isSample = a3;
}

- (BOOL)isPurchase
{
  return self->_isPurchase;
}

- (void)setIsPurchase:(BOOL)a3
{
  self->_isPurchase = a3;
}

- (NSDate)purchaseDate
{
  return self->_purchaseDate;
}

- (void)setPurchaseDate:(id)a3
{
  objc_storeStrong((id *)&self->_purchaseDate, a3);
}

- (int64_t)persistentIdentifier
{
  return self->_persistentIdentifier;
}

- (void)setPersistentIdentifier:(int64_t)a3
{
  self->_persistentIdentifier = a3;
}

- (NSNumber)storeAccountIdentifier
{
  return self->_storeAccountIdentifier;
}

- (void)setStoreAccountIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_storeAccountIdentifier, a3);
}

- (NSString)artistName
{
  return self->_artistName;
}

- (void)setArtistName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)collectionArtistName
{
  return self->_collectionArtistName;
}

- (void)setCollectionArtistName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)collectionTitle
{
  return self->_collectionTitle;
}

- (void)setCollectionTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)genre
{
  return self->_genre;
}

- (void)setGenre:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSString)thumbnailImageURL
{
  return self->_thumbnailImageURL;
}

- (void)setThumbnailImageURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSString)assetKind
{
  return self->_assetKind;
}

- (void)setAssetKind:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetKind, 0);
  objc_storeStrong((id *)&self->_thumbnailImageURL, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_collectionTitle, 0);
  objc_storeStrong((id *)&self->_collectionArtistName, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
  objc_storeStrong((id *)&self->_storeAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_purchaseDate, 0);
  objc_storeStrong((id *)&self->_transferBytesExpected, 0);
  objc_storeStrong((id *)&self->_transferBytesWritten, 0);
  objc_storeStrong((id *)&self->_estimatedTimeRemaining, 0);
  objc_storeStrong((id *)&self->_percentComplete, 0);
  objc_storeStrong((id *)&self->_downloadID, 0);
  objc_storeStrong((id *)&self->_permLink, 0);
  objc_storeStrong((id *)&self->_storePlaylistID, 0);
  objc_storeStrong((id *)&self->_storeID, 0);
}

@end
