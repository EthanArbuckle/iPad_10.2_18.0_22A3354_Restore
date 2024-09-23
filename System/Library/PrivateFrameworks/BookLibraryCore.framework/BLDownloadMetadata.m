@implementation BLDownloadMetadata

- (BLDownloadMetadata)init
{
  return -[BLDownloadMetadata initWithDictionary:](self, "initWithDictionary:", 0);
}

- (BLDownloadMetadata)initWithDictionary:(id)a3
{
  id v4;
  BLDownloadMetadata *v5;
  uint64_t v6;
  NSMutableDictionary *dictionary;
  NSLock *v8;
  NSLock *lock;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BLDownloadMetadata;
  v5 = -[BLDownloadMetadata init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "mutableCopy");
    dictionary = v5->_dictionary;
    v5->_dictionary = (NSMutableDictionary *)v6;

    v8 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    lock = v5->_lock;
    v5->_lock = v8;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[NSLock lock](self->_lock, "lock");
  v6 = -[NSMutableDictionary mutableCopyWithZone:](self->_dictionary, "mutableCopyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  -[NSLock unlock](self->_lock, "unlock");
  return v5;
}

- (unint64_t)artistIdentifier
{
  void *v2;
  unint64_t v3;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("artistId"), CFSTR("artist-id"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = BLGetItemIdentifierFromValue();

  return v3;
}

- (NSString)artistName
{
  void *v2;
  void *v3;
  NSString *v4;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("artistName"), CFSTR("artist-name"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)betaExternalVersionIdentifier
{
  void *v2;
  void *v3;
  id v4;

  -[BLDownloadMetadata valueForMetadataKey:](self, "valueForMetadataKey:", CFSTR("betaExternalVersionIdentifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)bundleIdentifier
{
  void *v2;
  void *v3;
  id v4;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("softwareVersionBundleId"), CFSTR("bundle-id"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)cloudIdentifier
{
  void *v2;
  void *v3;
  id v4;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("cloud-id"), CFSTR("sagaId"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)collectionArtistName
{
  void *v2;
  void *v3;
  id v4;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("playlistArtistName"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (unint64_t)collectionIdentifier
{
  void *v2;
  unint64_t v3;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("playlistId"), CFSTR("collection-id"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = BLGetItemIdentifierFromValue();

  return v3;
}

- (id)collectionIndexInCollectionGroup
{
  void *v2;
  void *v3;
  id v4;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("discNumber"), CFSTR("disc-number"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)collectionName
{
  void *v2;
  void *v3;
  id v4;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("playlistName"), CFSTR("collection-name"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (unint64_t)composerIdentifier
{
  void *v2;
  unint64_t v3;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("composerId"), CFSTR("composer-id"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = BLGetItemIdentifierFromValue();

  return v3;
}

- (id)composerName
{
  void *v2;
  void *v3;
  id v4;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("composerName"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)contentRating
{
  void *v2;
  BLItemContentRating *v3;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("rating"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v3 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = -[BLItemContentRating initWithDictionary:]([BLItemContentRating alloc], "initWithDictionary:", v2);

  return v3;
}

- (id)downloadPermalink
{
  void *v2;
  void *v3;
  id v4;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("download-permalink"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)durationInMilliseconds
{
  void *v2;
  void *v3;
  id v4;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("duration"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)episodeIdentifier
{
  void *v3;
  void *v4;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("episode-number"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLDownloadMetadata _stringValueForValue:](self, "_stringValueForValue:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)episodeSortIdentifier
{
  void *v3;
  id v4;
  void *v5;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("episode-sort-id"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
  }
  else
  {
    -[BLDownloadMetadata indexInCollection](self, "indexInCollection");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (NSURL)fullSizeImageURL
{
  void *v3;
  void *v4;
  uint64_t v5;
  BLItemImageCollection *v6;
  void *v7;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("artworkURL"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("artwork-urls"), 0);
    v5 = objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = -[BLItemImageCollection initWithImageCollection:]([BLItemImageCollection alloc], "initWithImageCollection:", v5);
      -[BLItemImageCollection bestImageForSize:](v6, "bestImageForSize:", 0.0, 0.0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "URL");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      v3 = (void *)v5;
    }
    else
    {
      v3 = 0;
      v4 = 0;
    }
  }

  return (NSURL *)v4;
}

- (NSString)genre
{
  void *v2;
  void *v3;
  NSString *v4;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("genre"), CFSTR("genreName"), CFSTR("genre-name"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (unint64_t)genreIdentifier
{
  void *v2;
  unint64_t v3;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("genreId"), CFSTR("genre-id"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = BLGetItemIdentifierFromValue();

  return v3;
}

- (NSURL)hlsPlaylistURL
{
  void *v2;
  void *v3;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("hls-playlist-url"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v3 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSURL *)v3;
}

- (id)indexInCollection
{
  void *v2;
  void *v3;
  id v4;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("trackNumber"), CFSTR("track-number"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (BOOL)isCompilation
{
  void *v2;
  char v3;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("compilation"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (BOOL)isDeviceBasedVPP
{
  void *v2;
  char v3;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("isDeviceBased"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (BOOL)isExplicitContent
{
  void *v2;
  BOOL v3;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("explicit"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v2, "integerValue") == 1;

  return v3;
}

- (BOOL)hasHDR
{
  void *v2;
  char v3;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("has-hdr"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (BOOL)isHighDefinition
{
  void *v2;
  char v3;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("high-definition"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (BOOL)isRental
{
  void *v2;
  char v3;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("isRental"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (BOOL)isSample
{
  void *v2;
  char v3;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("isSample"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (BOOL)isSharedResource
{
  void *v2;
  char v3;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("isSharedResource"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (unint64_t)itemIdentifier
{
  void *v2;
  unint64_t v3;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("itemId"), CFSTR("songId"), CFSTR("item-id"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = BLGetItemIdentifierFromValue();

  return v3;
}

- (NSString)kind
{
  void *v2;
  void *v3;
  NSString *v4;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("kind"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSURL)launchExtrasUrl
{
  void *v2;
  void *v3;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("launch-extras-url"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v3 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSURL *)v3;
}

- (NSString)longDescription
{
  void *v2;
  void *v3;
  NSString *v4;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("longDescription"), CFSTR("long-description"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)networkName
{
  void *v2;
  void *v3;
  id v4;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("network-name"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)numberOfCollectionsInCollectionGroup
{
  void *v2;
  void *v3;
  id v4;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("discCount"), CFSTR("disc-count"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)numberOfItemsInCollection
{
  void *v2;
  void *v3;
  id v4;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("trackCount"), CFSTR("track-count"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)racGUID
{
  void *v3;
  void *v4;
  void *v5;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("sgGuid"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLDownloadMetadata _stringValueForValue:](self, "_stringValueForValue:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v4);
  else
    v5 = 0;

  return v5;
}

- (id)podcastEpisodeGUID
{
  void *v2;
  void *v3;
  id v4;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("episode-guid"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)podcastFeedURL
{
  void *v3;
  void *v4;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("podcast-feed-url"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLDownloadMetadata _urlValueForValue:](self, "_urlValueForValue:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)podcastType
{
  void *v2;
  void *v3;
  id v4;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("podcast-type"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSDictionary)primaryAssetDictionary
{
  void *v3;
  void *v4;

  -[NSLock lock](self->_lock, "lock");
  -[BLDownloadMetadata _assetDictionary](self, "_assetDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  -[NSLock unlock](self->_lock, "unlock");
  return (NSDictionary *)v4;
}

- (id)purchaseDate
{
  void *v3;
  void *v4;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("purchaseDate"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLDownloadMetadata _dateValueForValue:](self, "_dateValueForValue:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSDate)releaseDate
{
  void *v3;
  void *v4;

  -[BLDownloadMetadata _releaseDateValue](self, "_releaseDateValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLDownloadMetadata _dateValueForValue:](self, "_dateValueForValue:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v4;
}

- (NSNumber)releaseYear
{
  void *v2;
  void *v3;
  NSNumber *v4;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("year"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSNumber)rentalID
{
  void *v2;
  void *v3;
  NSNumber *v4;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("rental-id"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)seasonNumber
{
  void *v2;
  void *v3;
  id v4;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("season-number"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)seriesName
{
  void *v3;
  id v4;
  void *v5;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("show-name"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
  }
  else
  {
    -[BLDownloadMetadata collectionName](self, "collectionName");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (id)longSeasonDescription
{
  void *v2;
  void *v3;
  id v4;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("longSeasonDescription"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (void)setArtistIdentifier:(unint64_t)a3
{
  const __CFString *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "bl_numberWithItemIdentifier:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (-[BLDownloadMetadata keyStyle](self, "keyStyle") == 1)
    v4 = CFSTR("artist-id");
  else
    v4 = CFSTR("artistId");
  -[BLDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v5, v4);

}

- (void)setArtistName:(id)a3
{
  const __CFString *v4;
  id v5;

  v5 = a3;
  if (-[BLDownloadMetadata keyStyle](self, "keyStyle") == 1)
    v4 = CFSTR("artist-name");
  else
    v4 = CFSTR("artistName");
  -[BLDownloadMetadata _setValueCopy:forMetadataKey:](self, "_setValueCopy:forMetadataKey:", v5, v4);

}

- (void)setBetaExternalVersionIdentifier:(id)a3
{
  -[BLDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", a3, CFSTR("betaExternalVersionIdentifier"));
}

- (void)setBundleIdentifier:(id)a3
{
  -[BLDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", a3, CFSTR("softwareVersionBundleId"));
}

- (void)setCloudIdentifier:(id)a3
{
  -[BLDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", a3, CFSTR("cloud-id"));
}

- (void)setCollectionArtistName:(id)a3
{
  -[BLDownloadMetadata _setValueCopy:forMetadataKey:](self, "_setValueCopy:forMetadataKey:", a3, CFSTR("playlistArtistName"));
}

- (void)setCollectionIdentifier:(unint64_t)a3
{
  const __CFString *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "bl_numberWithItemIdentifier:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (-[BLDownloadMetadata keyStyle](self, "keyStyle") == 1)
    v4 = CFSTR("collection-id");
  else
    v4 = CFSTR("playlistId");
  -[BLDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v5, v4);

}

- (void)setCollectionIndexInCollectionGroup:(id)a3
{
  const __CFString *v4;
  id v5;

  v5 = a3;
  if (-[BLDownloadMetadata keyStyle](self, "keyStyle") == 1)
    v4 = CFSTR("disc-number");
  else
    v4 = CFSTR("discNumber");
  -[BLDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v5, v4);

}

- (void)setCollectionName:(id)a3
{
  const __CFString *v4;
  id v5;

  v5 = a3;
  if (-[BLDownloadMetadata keyStyle](self, "keyStyle") == 1)
    v4 = CFSTR("collection-name");
  else
    v4 = CFSTR("playlistName");
  -[BLDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v5, v4);

}

- (void)setCompilation:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BLDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v4, CFSTR("compilation"));

}

- (void)setDeviceBasedVPP:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BLDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v4, CFSTR("isDeviceBased"));

}

- (void)setComposerIdentifier:(unint64_t)a3
{
  const __CFString *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "bl_numberWithItemIdentifier:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (-[BLDownloadMetadata keyStyle](self, "keyStyle") == 1)
    v4 = CFSTR("composer-id");
  else
    v4 = CFSTR("composerId");
  -[BLDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v5, v4);

}

- (void)setComposerName:(id)a3
{
  -[BLDownloadMetadata _setValueCopy:forMetadataKey:](self, "_setValueCopy:forMetadataKey:", a3, CFSTR("composerName"));
}

- (void)setContentRating:(id)a3
{
  id v4;

  objc_msgSend(a3, "contentRatingDictionary");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BLDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v4, CFSTR("rating"));

}

- (void)setDurationInMilliseconds:(id)a3
{
  -[BLDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", a3, CFSTR("duration"));
}

- (void)setEpisodeIdentifier:(id)a3
{
  -[BLDownloadMetadata _setValueCopy:forMetadataKey:](self, "_setValueCopy:forMetadataKey:", a3, CFSTR("episode-number"));
}

- (void)setEpisodeSortIdentifier:(id)a3
{
  -[BLDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", a3, CFSTR("episode-sort-id"));
}

- (void)setExplicitContent:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BLDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v4, CFSTR("explicit"));

}

- (void)setFullSizeImageURL:(id)a3
{
  id v4;

  objc_msgSend(a3, "absoluteString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BLDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v4, CFSTR("artworkURL"));

}

- (void)setGenre:(id)a3
{
  -[BLDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", a3, CFSTR("genre"));
}

- (void)setGenreIdentifier:(unint64_t)a3
{
  const __CFString *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "bl_numberWithItemIdentifier:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (-[BLDownloadMetadata keyStyle](self, "keyStyle") == 1)
    v4 = CFSTR("genre-id");
  else
    v4 = CFSTR("genreId");
  -[BLDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v5, v4);

}

- (void)setHighDefinition:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BLDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v4, CFSTR("high-definition"));

}

- (void)setHlsPlaylistURL:(id)a3
{
  id v4;

  objc_msgSend(a3, "absoluteString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BLDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v4, CFSTR("hls-playlist-url"));

}

- (void)setIndexInCollection:(id)a3
{
  const __CFString *v4;
  id v5;

  v5 = a3;
  if (-[BLDownloadMetadata keyStyle](self, "keyStyle") == 1)
    v4 = CFSTR("track-number");
  else
    v4 = CFSTR("trackNumber");
  -[BLDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v5, v4);

}

- (void)setItemIdentifier:(unint64_t)a3
{
  const __CFString *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "bl_numberWithItemIdentifier:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (-[BLDownloadMetadata keyStyle](self, "keyStyle") == 1)
    v4 = CFSTR("item-id");
  else
    v4 = CFSTR("itemId");
  -[BLDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v5, v4);

}

- (void)setKind:(id)a3
{
  -[BLDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", a3, CFSTR("kind"));
}

- (void)setLaunchExtrasUrl:(id)a3
{
  id v4;

  objc_msgSend(a3, "absoluteString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BLDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v4, CFSTR("launch-extras-url"));

}

- (void)setLongDescription:(id)a3
{
  const __CFString *v4;
  id v5;

  v5 = a3;
  if (-[BLDownloadMetadata keyStyle](self, "keyStyle") == 1)
    v4 = CFSTR("long-description");
  else
    v4 = CFSTR("longDescription");
  -[BLDownloadMetadata _setValueCopy:forMetadataKey:](self, "_setValueCopy:forMetadataKey:", v5, v4);

}

- (void)setNetworkName:(id)a3
{
  -[BLDownloadMetadata _setValueCopy:forMetadataKey:](self, "_setValueCopy:forMetadataKey:", a3, CFSTR("network-name"));
}

- (void)setNumberOfCollectionsInCollectionGroup:(id)a3
{
  const __CFString *v4;
  id v5;

  v5 = a3;
  if (-[BLDownloadMetadata keyStyle](self, "keyStyle") == 1)
    v4 = CFSTR("disc-count");
  else
    v4 = CFSTR("discCount");
  -[BLDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v5, v4);

}

- (void)setNumberOfItemsInCollection:(id)a3
{
  const __CFString *v4;
  id v5;

  v5 = a3;
  if (-[BLDownloadMetadata keyStyle](self, "keyStyle") == 1)
    v4 = CFSTR("track-count");
  else
    v4 = CFSTR("trackCount");
  -[BLDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v5, v4);

}

- (void)setRacGUID:(id)a3
{
  id v4;

  objc_msgSend(a3, "UUIDString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BLDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v4, CFSTR("sgGuid"));

}

- (void)setPodcastEpisodeGUID:(id)a3
{
  -[BLDownloadMetadata _setValueCopy:forMetadataKey:](self, "_setValueCopy:forMetadataKey:", a3, CFSTR("episode-guid"));
}

- (void)setPodcastFeedURL:(id)a3
{
  id v4;

  objc_msgSend(a3, "absoluteString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BLDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v4, CFSTR("podcast-feed-url"));

}

- (void)setPodcastType:(id)a3
{
  -[BLDownloadMetadata _setValueCopy:forMetadataKey:](self, "_setValueCopy:forMetadataKey:", a3, CFSTR("podcast-type"));
}

- (void)setPurchaseDate:(id)a3
{
  -[BLDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", a3, CFSTR("purchaseDate"));
}

- (void)setReleaseDate:(id)a3
{
  const __CFString *v4;
  id v5;

  v5 = a3;
  if (-[BLDownloadMetadata keyStyle](self, "keyStyle") == 1)
    v4 = CFSTR("release-date");
  else
    v4 = CFSTR("releaseDate");
  -[BLDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v5, v4);

}

- (void)setReleaseYear:(id)a3
{
  -[BLDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", a3, CFSTR("year"));
}

- (void)setRental:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BLDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v4, CFSTR("isRental"));

}

- (void)setRentalID:(id)a3
{
  -[BLDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", a3, CFSTR("rental-id"));
}

- (void)setSample:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BLDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v4, CFSTR("isSample"));

}

- (void)setMusicShow:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BLDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v4, CFSTR("is-apple-music-show"));

}

- (void)setSeasonNumber:(id)a3
{
  -[BLDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", a3, CFSTR("season-number"));
}

- (void)setSharedResource:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BLDownloadMetadata _setValueCopy:forMetadataKey:](self, "_setValueCopy:forMetadataKey:", v4, CFSTR("isSharedResource"));

}

- (void)setSeriesName:(id)a3
{
  -[BLDownloadMetadata _setValueCopy:forMetadataKey:](self, "_setValueCopy:forMetadataKey:", a3, CFSTR("show-name"));
}

- (void)setLongSeasonDescription:(id)a3
{
  -[BLDownloadMetadata _setValueCopy:forMetadataKey:](self, "_setValueCopy:forMetadataKey:", a3, CFSTR("longSeasonDescription"));
}

- (void)setShortDescription:(id)a3
{
  -[BLDownloadMetadata _setValueCopy:forMetadataKey:](self, "_setValueCopy:forMetadataKey:", a3, CFSTR("description"));
}

- (void)setSortArtistName:(id)a3
{
  -[BLDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", a3, CFSTR("sort-artist"));
}

- (void)setSortCollectionName:(id)a3
{
  -[BLDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", a3, CFSTR("sort-album"));
}

- (void)setSortTitle:(id)a3
{
  -[BLDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", a3, CFSTR("sort-name"));
}

- (void)setThumbnailNewsstandBindingEdge:(id)a3
{
  -[BLDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", a3, CFSTR("thumbnail-newsstand-binding-edge"));
}

- (void)setThumbnailNewsstandBindingType:(id)a3
{
  -[BLDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", a3, CFSTR("thumbnail-newsstand-binding-type"));
}

- (void)setThumbnailImageURL:(id)a3
{
  id v4;

  objc_msgSend(a3, "absoluteString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BLDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v4, CFSTR("thumbnail-url"));

}

- (void)setTitle:(id)a3
{
  id v4;

  v4 = a3;
  -[BLDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v4, CFSTR("title"));
  -[BLDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v4, CFSTR("unmodified-title"));

}

- (void)setTransactionIdentifier:(id)a3
{
  -[BLDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", a3, CFSTR("download-id"));
}

- (void)setVariantIdentifier:(id)a3
{
  -[BLDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", a3, CFSTR("variantId"));
}

- (void)setVideoDetailsDictionary:(id)a3
{
  -[BLDownloadMetadata _setValueCopy:forMetadataKey:](self, "_setValueCopy:forMetadataKey:", a3, CFSTR("videoDetails"));
}

- (void)setViewStoreItemURL:(id)a3
{
  id v4;

  objc_msgSend(a3, "absoluteString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BLDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v4, CFSTR("url"));

}

- (NSString)shortDescription
{
  void *v2;
  void *v3;
  NSString *v4;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("description"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSString)sortArtistName
{
  void *v3;
  id v4;
  void *v5;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("sort-artist"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
  }
  else
  {
    -[BLDownloadMetadata subtitle](self, "subtitle");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return (NSString *)v5;
}

- (NSString)sortCollectionName
{
  void *v3;
  id v4;
  void *v5;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("sort-album"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
  }
  else
  {
    -[BLDownloadMetadata collectionName](self, "collectionName");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return (NSString *)v5;
}

- (NSString)sortTitle
{
  void *v3;
  id v4;
  void *v5;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("sort-name"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
  }
  else
  {
    -[BLDownloadMetadata title](self, "title");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return (NSString *)v5;
}

- (id)thumbnailImageCollection
{
  void *v3;
  BLItemImageCollection *v4;
  BLItemImageCollection *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("thumbnail-url"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = -[BLDownloadMetadata _newImageCollectionWithURLString:](self, "_newImageCollectionWithURLString:", v3);
    if (v4)
    {
      v5 = v4;
LABEL_6:
      v8 = v3;
      goto LABEL_10;
    }
  }
  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("artwork-urls"), 0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    v5 = -[BLItemImageCollection initWithImageCollection:]([BLItemImageCollection alloc], "initWithImageCollection:", v6);

    if (v5)
      goto LABEL_6;
  }
  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("softwareIcon57x57URL"), CFSTR("icon-url"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = -[BLDownloadMetadata _newImageCollectionWithURLString:](self, "_newImageCollectionWithURLString:", v8);
  else
    v5 = 0;
LABEL_10:

  return v5;
}

- (NSURL)thumbnailImageURL
{
  void *v2;
  void *v3;

  -[BLDownloadMetadata _thumbnailArtworkImage](self, "_thumbnailArtworkImage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSString)title
{
  void *v2;
  void *v3;
  NSString *v4;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("unmodified-title"), CFSTR("title"), CFSTR("itemName"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSString)transactionIdentifier
{
  void *v2;
  void *v3;
  NSString *v4;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("download-id"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)variantIdentifier
{
  void *v2;
  void *v3;
  id v4;

  -[BLDownloadMetadata valueForMetadataKey:](self, "valueForMetadataKey:", CFSTR("variantId"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)videoDetailsDictionary
{
  void *v2;
  void *v3;
  id v4;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("videoDetails"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)viewStoreItemURL
{
  void *v3;
  void *v4;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("url"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLDownloadMetadata _urlValueForValue:](self, "_urlValueForValue:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)showComposer
{
  void *v2;
  void *v3;
  id v4;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("show-composer"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (BOOL)isMusicShow
{
  void *v2;
  char v3;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("is-apple-music-show"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (id)workName
{
  void *v2;
  void *v3;
  id v4;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("work"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)movementName
{
  void *v2;
  void *v3;
  id v4;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("movement"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)movementNumber
{
  void *v2;
  void *v3;
  id v4;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("movement-number"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)movementCount
{
  void *v2;
  void *v3;
  id v4;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("movement-count"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSURL)cancelDownloadURL
{
  void *v2;
  void *v3;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("cancel-download-url"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v3 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSURL *)v3;
}

- (NSString)copyright
{
  void *v2;
  void *v3;
  NSString *v4;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("copyright"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSDictionary)dictionary
{
  return (NSDictionary *)self->_dictionary;
}

- (NSNumber)downloaderAccountIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSNumber *v6;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("com.apple.iTunesStore.downloadInfo"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v3 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("accountInfo"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("DownloaderID"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v3;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

- (NSString)downloadKey
{
  void *v2;
  void *v3;
  NSString *v4;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("downloadKey"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSData)epubRightsData
{
  void *v2;
  void *v3;
  NSData *v4;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("epr"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSString)fileExtension
{
  void *v2;
  void *v3;
  NSString *v4;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("fileExtension"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (int64_t)keyStyle
{
  int64_t keyStyle;

  -[NSLock lock](self->_lock, "lock");
  keyStyle = self->_keyStyle;
  -[NSLock unlock](self->_lock, "unlock");
  return keyStyle;
}

- (BOOL)isAutomaticDownload
{
  void *v2;
  char v3;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("is-auto-download"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (BOOL)isRedownloadDownload
{
  void *v2;
  char v3;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("is-redownload"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (NSArray)MD5HashStrings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSArray *v7;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("chunks"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("chunks"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("md5"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v4 = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v5);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v4;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

- (NSNumber)numberOfBytesToHash
{
  void *v2;
  void *v3;
  void *v4;
  NSNumber *v5;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("chunks"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v3 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("chunkSize"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (NSString)pageProgressionDirection
{
  void *v2;
  void *v3;
  NSString *v4;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("page-progression-direction"), CFSTR("pageProgressionDirection"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSString)preferredAssetFlavor
{
  void *v2;
  void *v3;
  id v4;

  -[BLDownloadMetadata valueForMetadataKey:](self, "valueForMetadataKey:", CFSTR("com.apple.iTunesStore.downloadInfo"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("preferredAssetFlavor"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;

  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (id)publicationVersion
{
  void *v2;
  void *v3;
  id v4;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("publication-version"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (unint64_t)preOrderIdentifier
{
  void *v2;
  unint64_t v3;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("preorder-id"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v3 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "bl_itemIdentifierValue");

  return v3;
}

- (NSURL)primaryAssetURL
{
  void *v2;
  void *v3;

  -[BLDownloadMetadata _valueForFirstAvailableTopLevelKey:](self, "_valueForFirstAvailableTopLevelKey:", CFSTR("URL"), CFSTR("url"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v3 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSURL *)v3;
}

- (NSString)redownloadActionParameters
{
  void *v2;
  void *v3;
  NSString *v4;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("buy-params-256"), CFSTR("buyParams"), CFSTR("action-params"), CFSTR("redownload-params"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSString)releaseDateString
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  NSString *v7;

  -[BLDownloadMetadata _releaseDateValue](self, "_releaseDateValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = -[BLDownloadMetadata _newDateFormatter](self, "_newDateFormatter");
    objc_msgSend(v4, "stringFromDate:", v3);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v3;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

- (NSNumber)requestPersistentID
{
  void *v2;
  void *v3;
  void *v4;

  -[BLDownloadMetadata valueForMetadataKey:](self, "valueForMetadataKey:", CFSTR("com.apple.iTunesStore.downloadInfo"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("requestPersistentID"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = (void *)objc_msgSend(v3, "copy");
    else
      v4 = 0;

  }
  else
  {
    v4 = 0;
  }

  return (NSNumber *)v4;
}

- (id)requiredDeviceCapabilities
{
  void *v2;
  void *v3;
  id v4;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("UIRequiredDeviceCapabilities"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSString)appleID
{
  void *v2;
  void *v3;
  NSString *v4;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("appleId"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (void)setAutomaticDownload:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BLDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v4, CFSTR("is-auto-download"));

}

- (void)setCancelDownloadURL:(id)a3
{
  id v4;

  objc_msgSend(a3, "absoluteString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BLDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v4, CFSTR("cancel-download-url"));

}

- (void)setCopyright:(id)a3
{
  -[BLDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", a3, CFSTR("copyright"));
}

- (void)setDictionary:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *dictionary;
  NSMutableDictionary *v6;

  v6 = (NSMutableDictionary *)a3;
  -[NSLock lock](self->_lock, "lock");
  if (self->_dictionary != v6)
  {
    v4 = (NSMutableDictionary *)-[NSMutableDictionary mutableCopy](v6, "mutableCopy");
    dictionary = self->_dictionary;
    self->_dictionary = v4;

  }
  -[NSLock unlock](self->_lock, "unlock");

}

- (void)setDownloadKey:(id)a3
{
  -[BLDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", a3, CFSTR("downloadKey"));
}

- (void)setDownloadPermalink:(id)a3
{
  -[BLDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", a3, CFSTR("p0"));
}

- (void)setEpubRightsData:(id)a3
{
  -[BLDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", a3, CFSTR("epr"));
}

- (void)setFileExtension:(id)a3
{
  -[BLDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", a3, CFSTR("fileExtension"));
}

- (void)setKeyStyle:(int64_t)a3
{
  -[NSLock lock](self->_lock, "lock");
  self->_keyStyle = a3;
  -[NSLock unlock](self->_lock, "unlock");
}

- (void)setMD5HashStrings:(id)a3 numberOfBytesToHash:(id)a4
{
  id v6;
  id v7;
  BLDownloadMetadata *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (objc_msgSend(v11, "count"))
  {
    if (objc_msgSend(v11, "count") == 1)
    {
      -[BLDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", 0, CFSTR("chunks"));
      objc_msgSend(v11, "objectAtIndex:", 0);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      v8 = self;
      v9 = v7;
    }
    else
    {
      -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("chunks"), 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (id)objc_msgSend(v10, "mutableCopy");

      if (!v7)
        v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      objc_msgSend(v7, "setObject:forKey:", v11, CFSTR("chunks"));
      objc_msgSend(v7, "setObject:forKey:", v6, CFSTR("chunkSize"));
      -[BLDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v7, CFSTR("chunks"));
      v8 = self;
      v9 = 0;
    }
    -[BLDownloadMetadata setValue:forMetadataKey:](v8, "setValue:forMetadataKey:", v9, CFSTR("md5"));

  }
  else
  {
    -[BLDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", 0, CFSTR("chunks"));
    -[BLDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", 0, CFSTR("md5"));
  }

}

- (void)setPageProgressionDirection:(id)a3
{
  -[BLDownloadMetadata _setValueCopy:forMetadataKey:](self, "_setValueCopy:forMetadataKey:", a3, CFSTR("page-progression-direction"));
}

- (void)setPublicationVersion:(id)a3
{
  -[BLDownloadMetadata _setValueCopy:forMetadataKey:](self, "_setValueCopy:forMetadataKey:", a3, CFSTR("publication-version"));
}

- (void)setPreferredAssetFlavor:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  -[BLDownloadMetadata valueForMetadataKey:](self, "valueForMetadataKey:", CFSTR("com.apple.iTunesStore.downloadInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = objc_msgSend(v4, "mutableCopy");
  else
    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 1);
  v6 = (void *)v5;

  if (v7)
    objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("preferredAssetFlavor"));
  else
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("preferredAssetFlavor"));
  -[BLDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v6, CFSTR("com.apple.iTunesStore.downloadInfo"));

}

- (void)setPreOrderIdentifier:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "bl_numberWithItemIdentifier:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BLDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v4, CFSTR("preorder-id"));

}

- (void)setPrimaryAssetURL:(id)a3
{
  id v4;

  objc_msgSend(a3, "absoluteString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BLDownloadMetadata _setValue:forTopLevelKey:](self, "_setValue:forTopLevelKey:", v4, CFSTR("URL"));

}

- (void)setRedownloadActionParameters:(id)a3
{
  -[BLDownloadMetadata _setValueCopy:forMetadataKey:](self, "_setValueCopy:forMetadataKey:", a3, CFSTR("buy-params-256"));
}

- (void)setRedownloadDownload:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BLDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v4, CFSTR("is-redownload"));

}

- (void)setReleaseDateString:(id)a3
{
  const __CFString *v4;
  id v5;

  v5 = a3;
  if (-[BLDownloadMetadata keyStyle](self, "keyStyle") == 1)
    v4 = CFSTR("release-date");
  else
    v4 = CFSTR("releaseDate");
  -[BLDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v5, v4);

}

- (void)setRequestPersistentID:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  -[BLDownloadMetadata valueForMetadataKey:](self, "valueForMetadataKey:", CFSTR("com.apple.iTunesStore.downloadInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = objc_msgSend(v4, "mutableCopy");
  else
    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 1);
  v6 = (void *)v5;

  if (v7)
    objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("requestPersistentID"));
  else
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("requestPersistentID"));
  -[BLDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v6, CFSTR("com.apple.iTunesStore.downloadInfo"));

}

- (void)setRequiredDeviceCapabilities:(id)a3
{
  -[BLDownloadMetadata _setValueCopy:forMetadataKey:](self, "_setValueCopy:forMetadataKey:", a3, CFSTR("UIRequiredDeviceCapabilities"));
}

- (void)setShouldDownloadAutomatically:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BLDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v4, CFSTR("auto-download"));

}

- (void)setSinfs:(id)a3
{
  -[BLDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", a3, CFSTR("sinfs"));
}

- (void)setAppleID:(id)a3
{
  -[BLDownloadMetadata setValue:forKey:](self, "setValue:forKey:", a3, CFSTR("appleId"));
}

- (void)setValue:(id)a3 forMetadataKey:(id)a4
{
  id v6;
  NSMutableDictionary *dictionary;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  uint64_t v10;
  NSMutableDictionary *v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  v6 = a4;
  -[NSLock lock](self->_lock, "lock");
  dictionary = self->_dictionary;
  if (!dictionary)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v9 = self->_dictionary;
    self->_dictionary = v8;

    dictionary = self->_dictionary;
  }
  -[NSMutableDictionary objectForKey:](dictionary, "objectForKey:", CFSTR("metadata"));
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (NSMutableDictionary *)v10;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (objc_msgSend((id)-[NSMutableDictionary classForCoder](v11, "classForCoder"), "isEqual:", objc_opt_class()) & 1) == 0)
    {
      v12 = -[NSMutableDictionary mutableCopy](v11, "mutableCopy");

      -[NSMutableDictionary setObject:forKey:](self->_dictionary, "setObject:forKey:", v12, CFSTR("metadata"));
      v11 = (NSMutableDictionary *)v12;
    }
  }
  else
  {
    v11 = self->_dictionary;
  }
  if (v13)
  {
    -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v13, v6);
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](v11, "removeObjectForKey:", v6);
    -[NSMutableDictionary removeObjectForKey:](self->_dictionary, "removeObjectForKey:", v6);
  }
  -[NSLock unlock](self->_lock, "unlock");

}

- (BOOL)shouldDownloadAutomatically
{
  void *v2;
  char v3;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("auto-download"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (NSArray)sinfs
{
  void *v2;
  void *v3;
  NSArray *v4;

  -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("sinfs"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)valueForFirstAvailableKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id *v8;
  id v9;
  BOOL v10;
  id *v12;
  uint64_t v13;

  v4 = a3;
  -[NSLock lock](self->_lock, "lock");
  -[BLDownloadMetadata _assetDictionary](self, "_assetDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("metadata"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("metadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = (id *)&v13;
  if (v4)
  {
    do
    {
      objc_msgSend(v5, "objectForKey:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
        objc_msgSend(v6, "objectForKey:", v4);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v7)
        {
          -[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", v4);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
      v8 = v12++;
      v9 = *v8;

      if (v9)
        v10 = v7 == 0;
      else
        v10 = 0;
      v4 = v9;
    }
    while (v10);
  }
  else
  {
    v7 = 0;
    v9 = 0;
  }
  -[NSLock unlock](self->_lock, "unlock");

  return v7;
}

- (id)valueForMetadataKey:(id)a3
{
  return -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", a3, 0);
}

- (id)_assetDictionary
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  unint64_t v11;
  void *v12;
  float v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const __CFString *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  unint64_t v25;
  unint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  id v39;
  void *v41;
  id v42;
  void *v43;
  uint64_t v44;
  id v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  -[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("metadata"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("kind"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("assets"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v5 = 0;
    }
  }
  if (!v4)
  {
    -[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("kind"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      objc_msgSend(v5, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v6, "objectForKey:", CFSTR("metadata"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v7, "objectForKey:", CFSTR("kind"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v4 = v8;
          else
            v4 = 0;

        }
        else
        {
          v4 = 0;
        }

      }
      else
      {
        v4 = 0;
      }

    }
  }
  if (objc_msgSend(v5, "count"))
  {
    v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v3, "objectForKey:", CFSTR("com.apple.iTunesStore.downloadInfo"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      -[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("com.apple.iTunesStore.downloadInfo"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v11 = 0x24BDBC000uLL;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "objectForKey:", CFSTR("preferredAssetFlavor"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "length"))
        objc_msgSend(v9, "addObject:", v12);

    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("ebook")))
    {
      GSMainScreenScaleFactor();
      if (v13 == 1.0)
      {
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("lrpluspub"), CFSTR("lrpub"), 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObjectsFromArray:", v14);

      }
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("pluspub"), CFSTR("pub"), 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObjectsFromArray:", v15);

    }
    v42 = v4;
    v43 = v3;
    v41 = v10;
    if (objc_msgSend(v9, "count"))
    {
      v16 = objc_msgSend(v5, "count");
      if (v16 < 1)
      {
        v46 = 0;
      }
      else
      {
        v17 = v16;
        v18 = 0;
        v46 = 0;
        v19 = CFSTR("flavor");
        v44 = 0x7FFFFFFFFFFFFFFFLL;
        v20 = 0x24BDD1000uLL;
        do
        {
          objc_msgSend(v5, "objectAtIndex:", v18);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v21, "objectForKey:", v19);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v23 = v19;
              v24 = v5;
              v25 = v20;
              v26 = v11;
              v27 = v9;
              v28 = objc_msgSend(v9, "indexOfObject:", v22);
              if (v28 < v44)
              {
                v29 = v28;
                v45 = v21;

                v30 = v45;
                v44 = v29;
                v46 = v30;
              }
              v9 = v27;
              v11 = v26;
              v20 = v25;
              v5 = v24;
              v19 = v23;
            }

          }
          ++v18;
        }
        while (v17 != v18);
      }
    }
    else
    {
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      v32 = v5;
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
      if (v33)
      {
        v34 = v33;
        v35 = v9;
        v36 = *(_QWORD *)v48;
        while (2)
        {
          for (i = 0; i != v34; ++i)
          {
            if (*(_QWORD *)v48 != v36)
              objc_enumerationMutation(v32);
            v38 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v46 = v38;
              goto LABEL_50;
            }
          }
          v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
          if (v34)
            continue;
          break;
        }
        v46 = 0;
LABEL_50:
        v9 = v35;
      }
      else
      {
        v46 = 0;
      }

    }
    v4 = v42;
    v3 = v43;
    v31 = v46;
  }
  else
  {
    v31 = 0;
  }
  v39 = v31;

  return v39;
}

- (id)_dateValueForValue:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[BLDownloadMetadata _newDateFormatter](self, "_newDateFormatter");
    objc_msgSend(v5, "dateFromString:", v4);
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v4;
  else
    v7 = 0;
  v8 = v7;

  return v8;
}

- (id)_newImageCollectionWithURLString:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  BLItemArtworkImage *v6;
  BLItemImageCollection *v7;
  void *v8;
  BLItemImageCollection *v9;

  v3 = (objc_class *)MEMORY[0x24BDBCF48];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithString:", v4);

  if (v5)
  {
    v6 = objc_alloc_init(BLItemArtworkImage);
    -[BLItemArtworkImage setURL:](v6, "setURL:", v5);
    -[BLItemArtworkImage setImageKind:](v6, "setImageKind:", CFSTR("download-queue-item.default"));
    v7 = [BLItemImageCollection alloc];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[BLItemImageCollection initWithItemImages:](v7, "initWithItemImages:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_newDateFormatter
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v2, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ss'Z'"));
  objc_msgSend(v2, "setLenient:", 1);
  objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneForSecondsFromGMT:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTimeZone:", v3);

  return v2;
}

- (id)_releaseDateValue
{
  return -[BLDownloadMetadata valueForFirstAvailableKey:](self, "valueForFirstAvailableKey:", CFSTR("releaseDate"), CFSTR("release-date"), 0);
}

- (void)_setValue:(id)a3 forTopLevelKey:(id)a4
{
  id v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *dictionary;
  NSMutableDictionary *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[NSLock lock](self->_lock, "lock");
  if (!self->_dictionary)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    dictionary = self->_dictionary;
    self->_dictionary = v7;

  }
  v9 = self->_dictionary;
  if (v10)
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v10, v6);
  else
    -[NSMutableDictionary removeObjectForKey:](v9, "removeObjectForKey:", v6);
  -[NSLock unlock](self->_lock, "unlock");

}

- (void)_setValueCopy:(id)a3 forMetadataKey:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = (id)objc_msgSend(a3, "copy");
  -[BLDownloadMetadata setValue:forMetadataKey:](self, "setValue:forMetadataKey:", v7, v6);

}

- (id)_stringValueForValue:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "stringValue");
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v3;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

- (id)_thumbnailArtworkImage
{
  void *v2;
  void *v3;
  void *v4;

  -[BLDownloadMetadata thumbnailImageCollection](self, "thumbnailImageCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imagesForKind:", CFSTR("download-queue-item.default"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_urlValueForValue:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v3);
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v3;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

- (id)_valueForFirstAvailableTopLevelKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id *v7;
  id v8;
  BOOL v9;
  id *v11;
  uint64_t v12;

  v4 = a3;
  -[NSLock lock](self->_lock, "lock");
  -[BLDownloadMetadata _assetDictionary](self, "_assetDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id *)&v12;
  if (v4)
  {
    do
    {
      objc_msgSend(v5, "objectForKey:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        -[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", v4);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v7 = v11++;
      v8 = *v7;

      if (v8)
        v9 = v6 == 0;
      else
        v9 = 0;
      v4 = v8;
    }
    while (v9);
  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  -[NSLock unlock](self->_lock, "unlock");

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end
