@implementation MPPlaceholderAVItem

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)MPPlaceholderAVItem;
  -[MPAVItem description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPPlaceholderAVItem mainTitle](self, "mainTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)mainTitle
{
  return self->_mainTitle;
}

- (double)durationFromExternalMetadata
{
  return self->_durationFromExternalMetadata;
}

- (MPPlaceholderAVItem)init
{
  MPPlaceholderAVItem *v2;
  void *v3;
  uint64_t v4;
  NSString *mainTitle;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MPPlaceholderAVItem;
  v2 = -[MPAVItem init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("LOADING_AUDIO_LABEL"), &stru_1E3163D10, CFSTR("MediaPlayer"));
    v4 = objc_claimAutoreleasedReturnValue();
    mainTitle = v2->_mainTitle;
    v2->_mainTitle = (NSString *)v4;

  }
  return v2;
}

- (void)setMainTitle:(id)a3
{
  NSString *v4;
  NSString *mainTitle;
  BOOL v6;
  NSString *v7;
  NSString *v8;
  void *v9;
  NSString *v10;

  v4 = (NSString *)a3;
  mainTitle = self->_mainTitle;
  if (mainTitle != v4)
  {
    v10 = v4;
    v6 = -[NSString isEqualToString:](mainTitle, "isEqualToString:", v4);
    v4 = v10;
    if (!v6)
    {
      v7 = (NSString *)-[NSString copy](v10, "copy");
      v8 = self->_mainTitle;
      self->_mainTitle = v7;

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "postNotificationName:object:", CFSTR("MPAVItemTitlesDidChangeNotification"), self);

      v4 = v10;
    }
  }

}

- (int64_t)storeItemInt64ID
{
  return self->_storeItemInt64ID;
}

- (BOOL)isExplicitTrack
{
  return *(&self->_supportsLikedState + 3);
}

- (NSString)artist
{
  return self->_artist;
}

- (NSString)album
{
  return self->_album;
}

- (id)artworkCatalogBlock
{
  return self->_artworkCatalogBlock;
}

+ (BOOL)isPlaceholder
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_artworkCatalogBlock, 0);
  objc_storeStrong((id *)&self->_mainTitle, 0);
  objc_storeStrong((id *)&self->_artist, 0);
  objc_storeStrong((id *)&self->_album, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[MPPlaceholderAVItem album](self, "album");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v4[66];
  v4[66] = v5;

  -[MPPlaceholderAVItem artist](self, "artist");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v4[67];
  v4[67] = v7;

  -[MPPlaceholderAVItem durationFromExternalMetadata](self, "durationFromExternalMetadata");
  v4[68] = v9;
  *((_BYTE *)v4 + 525) = -[MPPlaceholderAVItem isExplicitTrack](self, "isExplicitTrack");
  *((_BYTE *)v4 + 526) = -[MPPlaceholderAVItem isLikedStateEnabled](self, "isLikedStateEnabled");
  -[MPPlaceholderAVItem mainTitle](self, "mainTitle");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v4[69];
  v4[69] = v10;

  *((_BYTE *)v4 + 527) = -[MPPlaceholderAVItem supportsLikedState](self, "supportsLikedState");
  v4[70] = -[MPPlaceholderAVItem storeItemInt64ID](self, "storeItemInt64ID");
  -[MPPlaceholderAVItem artworkCatalogBlock](self, "artworkCatalogBlock");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v4[71];
  v4[71] = v12;

  return v4;
}

- (void)setAlbum:(id)a3
{
  NSString *v4;
  NSString *album;
  BOOL v6;
  NSString *v7;
  NSString *v8;
  void *v9;
  NSString *v10;

  v4 = (NSString *)a3;
  album = self->_album;
  if (album != v4)
  {
    v10 = v4;
    v6 = -[NSString isEqualToString:](album, "isEqualToString:", v4);
    v4 = v10;
    if (!v6)
    {
      v7 = (NSString *)-[NSString copy](v10, "copy");
      v8 = self->_album;
      self->_album = v7;

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "postNotificationName:object:", CFSTR("MPAVItemTitlesDidChangeNotification"), self);

      v4 = v10;
    }
  }

}

- (void)setArtist:(id)a3
{
  NSString *v4;
  NSString *artist;
  BOOL v6;
  NSString *v7;
  NSString *v8;
  void *v9;
  NSString *v10;

  v4 = (NSString *)a3;
  artist = self->_artist;
  if (artist != v4)
  {
    v10 = v4;
    v6 = -[NSString isEqualToString:](artist, "isEqualToString:", v4);
    v4 = v10;
    if (!v6)
    {
      v7 = (NSString *)-[NSString copy](v10, "copy");
      v8 = self->_artist;
      self->_artist = v7;

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "postNotificationName:object:", CFSTR("MPAVItemTitlesDidChangeNotification"), self);

      v4 = v10;
    }
  }

}

- (void)setDurationFromExternalMetadata:(double)a3
{
  id v4;

  if (vabdd_f64(self->_durationFromExternalMetadata, a3) > 2.22044605e-16)
  {
    self->_durationFromExternalMetadata = a3;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("MPAVItemDurationAvailableNotification"), self);

  }
}

- (void)setExplicitTrack:(BOOL)a3
{
  id v4;

  if (*(&self->_supportsLikedState + 3) != a3)
  {
    *(&self->_supportsLikedState + 3) = a3;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("MPAVItemIsExplicitDidChangeNotification"), self);

  }
}

- (void)setStoreItemInt64ID:(int64_t)a3
{
  if (self->_storeItemInt64ID != a3)
    self->_storeItemInt64ID = a3;
}

- (void)setSupportsLikedState:(BOOL)a3
{
  if (*(&self->_supportsLikedState + 5) != a3)
    *(&self->_supportsLikedState + 5) = a3;
}

- (BOOL)supportsRateChange
{
  return 0;
}

- (BOOL)isValidPlayerSubstituteForItem:(id)a3
{
  id v3;
  char v4;

  if (self == a3)
    return 1;
  v3 = a3;
  v4 = objc_msgSend(v3, "isMemberOfClass:", objc_opt_class());

  return v4;
}

- (void)loadAssetAndPlayerItemWithTask:(id)a3 completion:(id)a4
{
  (*((void (**)(id, _QWORD, _QWORD))a4 + 2))(a4, 0, 0);
}

- (BOOL)isLikedStateEnabled
{
  return *(&self->_supportsLikedState + 4);
}

- (BOOL)supportsLikedState
{
  return *(&self->_supportsLikedState + 5);
}

- (void)setArtworkCatalogBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 568);
}

@end
