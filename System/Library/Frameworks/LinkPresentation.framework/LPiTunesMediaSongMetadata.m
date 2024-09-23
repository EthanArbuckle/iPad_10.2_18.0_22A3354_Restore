@implementation LPiTunesMediaSongMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPiTunesMediaSongMetadata)initWithCoder:(id)a3
{
  id v4;
  LPiTunesMediaSongMetadata *v5;
  uint64_t v6;
  NSString *storeFrontIdentifier;
  uint64_t v8;
  NSString *storeIdentifier;
  uint64_t v10;
  NSString *name;
  uint64_t v12;
  NSString *artist;
  uint64_t v14;
  NSString *album;
  uint64_t v16;
  NSString *lyrics;
  uint64_t v18;
  LPImage *artwork;
  uint64_t v20;
  LPArtworkMetadata *artworkMetadata;
  uint64_t v22;
  NSURL *previewURL;
  uint64_t v24;
  NSArray *offers;
  uint64_t v26;
  LPLyricExcerptMetadata *lyricExcerpt;
  LPiTunesMediaSongMetadata *v28;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)LPiTunesMediaSongMetadata;
  v5 = -[LPiTunesMediaSongMetadata init](&v30, sel_init);
  if (v5)
  {
    decodeStringForKey(v4, (uint64_t)CFSTR("storeFrontIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    storeFrontIdentifier = v5->_storeFrontIdentifier;
    v5->_storeFrontIdentifier = (NSString *)v6;

    decodeStringForKey(v4, (uint64_t)CFSTR("storeIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    storeIdentifier = v5->_storeIdentifier;
    v5->_storeIdentifier = (NSString *)v8;

    decodeStringForKey(v4, (uint64_t)CFSTR("name"));
    v10 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v10;

    decodeStringForKey(v4, (uint64_t)CFSTR("artist"));
    v12 = objc_claimAutoreleasedReturnValue();
    artist = v5->_artist;
    v5->_artist = (NSString *)v12;

    decodeStringForKey(v4, (uint64_t)CFSTR("album"));
    v14 = objc_claimAutoreleasedReturnValue();
    album = v5->_album;
    v5->_album = (NSString *)v14;

    decodeStringForKey(v4, (uint64_t)CFSTR("lyrics"));
    v16 = objc_claimAutoreleasedReturnValue();
    lyrics = v5->_lyrics;
    v5->_lyrics = (NSString *)v16;

    objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", CFSTR("artwork"));
    v18 = objc_claimAutoreleasedReturnValue();
    artwork = v5->_artwork;
    v5->_artwork = (LPImage *)v18;

    objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("artworkMetadata"));
    v20 = objc_claimAutoreleasedReturnValue();
    artworkMetadata = v5->_artworkMetadata;
    v5->_artworkMetadata = (LPArtworkMetadata *)v20;

    decodeURLForKey(v4, CFSTR("previewURL"));
    v22 = objc_claimAutoreleasedReturnValue();
    previewURL = v5->_previewURL;
    v5->_previewURL = (NSURL *)v22;

    decodeArrayOfStringsForKey(v4);
    v24 = objc_claimAutoreleasedReturnValue();
    offers = v5->_offers;
    v5->_offers = (NSArray *)v24;

    objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lyricExcerpt"));
    v26 = objc_claimAutoreleasedReturnValue();
    lyricExcerpt = v5->_lyricExcerpt;
    v5->_lyricExcerpt = (LPLyricExcerptMetadata *)v26;

    v28 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_storeFrontIdentifier, CFSTR("storeFrontIdentifier"));
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_storeIdentifier, CFSTR("storeIdentifier"));
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_artist, CFSTR("artist"));
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_album, CFSTR("album"));
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_lyrics, CFSTR("lyrics"));
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_artwork, CFSTR("artwork"));
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_artworkMetadata, CFSTR("artworkMetadata"));
  objc_msgSend(v4, "_lp_encodeURLIfNotNilOrLocalFile:forKey:", self->_previewURL, CFSTR("previewURL"));
  objc_msgSend(v4, "_lp_encodeArrayIfNotEmpty:forKey:", self->_offers, CFSTR("offers"));
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_lyricExcerpt, CFSTR("lyricExcerpt"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  LPiTunesMediaSongMetadata *v4;
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
  LPiTunesMediaSongMetadata *v15;

  v4 = +[LPiTunesMediaSongMetadata allocWithZone:](LPiTunesMediaSongMetadata, "allocWithZone:", a3);
  if (v4)
  {
    -[LPiTunesMediaSongMetadata storeFrontIdentifier](self, "storeFrontIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaSongMetadata setStoreFrontIdentifier:](v4, "setStoreFrontIdentifier:", v5);

    -[LPiTunesMediaSongMetadata storeIdentifier](self, "storeIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaSongMetadata setStoreIdentifier:](v4, "setStoreIdentifier:", v6);

    -[LPiTunesMediaSongMetadata name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaSongMetadata setName:](v4, "setName:", v7);

    -[LPiTunesMediaSongMetadata artist](self, "artist");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaSongMetadata setArtist:](v4, "setArtist:", v8);

    -[LPiTunesMediaSongMetadata album](self, "album");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaSongMetadata setAlbum:](v4, "setAlbum:", v9);

    -[LPiTunesMediaSongMetadata artwork](self, "artwork");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaSongMetadata setArtwork:](v4, "setArtwork:", v10);

    -[LPiTunesMediaSongMetadata artworkMetadata](self, "artworkMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaSongMetadata setArtworkMetadata:](v4, "setArtworkMetadata:", v11);

    -[LPiTunesMediaSongMetadata previewURL](self, "previewURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaSongMetadata setPreviewURL:](v4, "setPreviewURL:", v12);

    -[LPiTunesMediaSongMetadata offers](self, "offers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaSongMetadata setOffers:](v4, "setOffers:", v13);

    -[LPiTunesMediaSongMetadata lyricExcerpt](self, "lyricExcerpt");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaSongMetadata setLyricExcerpt:](v4, "setLyricExcerpt:", v14);

    v15 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  void **v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPiTunesMediaSongMetadata;
  if (-[LPiTunesMediaSongMetadata isEqual:](&v8, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (void **)v4;
      if ((objectsAreEqual_0(v6[2], self->_storeFrontIdentifier) & 1) != 0
        && objectsAreEqual_0(v6[3], self->_storeIdentifier)
        && objectsAreEqual_0(v6[4], self->_name)
        && objectsAreEqual_0(v6[5], self->_artist)
        && objectsAreEqual_0(v6[6], self->_album)
        && objectsAreEqual_0(v6[8], self->_artwork)
        && objectsAreEqual_0(v6[9], self->_artworkMetadata)
        && objectsAreEqual_0(v6[10], self->_previewURL)
        && objectsAreEqual_0(v6[11], self->_offers))
      {
        v5 = objectsAreEqual_0(v6[12], self->_lyricExcerpt);
      }
      else
      {
        v5 = 0;
      }

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_storeIdentifier, "hash");
}

- (void)_enumerateAsynchronousFields:(id)a3
{
  (*((void (**)(id, const __CFString *))a3 + 2))(a3, CFSTR("artwork"));
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("storeFrontIdentifier"), CFSTR("storeIdentifier"), CFSTR("name"), CFSTR("artist"), CFSTR("album"), CFSTR("artwork"), CFSTR("artworkMetadata"), CFSTR("previewURL"), CFSTR("offers"), CFSTR("lyricExcerpt"), 0);
}

- (NSString)storeFrontIdentifier
{
  return self->_storeFrontIdentifier;
}

- (void)setStoreFrontIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)storeIdentifier
{
  return self->_storeIdentifier;
}

- (void)setStoreIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)artist
{
  return self->_artist;
}

- (void)setArtist:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)album
{
  return self->_album;
}

- (void)setAlbum:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)lyrics
{
  return self->_lyrics;
}

- (void)setLyrics:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (LPImage)artwork
{
  return self->_artwork;
}

- (void)setArtwork:(id)a3
{
  objc_storeStrong((id *)&self->_artwork, a3);
}

- (LPArtworkMetadata)artworkMetadata
{
  return self->_artworkMetadata;
}

- (void)setArtworkMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSURL)previewURL
{
  return self->_previewURL;
}

- (void)setPreviewURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSArray)offers
{
  return self->_offers;
}

- (void)setOffers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (LPLyricExcerptMetadata)lyricExcerpt
{
  return self->_lyricExcerpt;
}

- (void)setLyricExcerpt:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lyricExcerpt, 0);
  objc_storeStrong((id *)&self->_offers, 0);
  objc_storeStrong((id *)&self->_previewURL, 0);
  objc_storeStrong((id *)&self->_artworkMetadata, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_lyrics, 0);
  objc_storeStrong((id *)&self->_album, 0);
  objc_storeStrong((id *)&self->_artist, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_storeFrontIdentifier, 0);
}

- (id)inlinePlaybackInformationForURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[LPiTunesMediaSongMetadata storeIdentifier](self, "storeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPiTunesMediaSongMetadata storeFrontIdentifier](self, "storeFrontIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    storefrontIdentifierFromURL(v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[LPiTunesMediaSongMetadata offers](self, "offers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPiTunesMediaSongMetadata previewURL](self, "previewURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPiTunesMediaSongMetadata lyricExcerpt](self, "lyricExcerpt");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[LPInlineMediaPlaybackInformation songPlaybackInformationWithStoreIdentifier:storefrontIdentifier:offers:previewURL:lyricExcerpt:](LPInlineMediaPlaybackInformation, "songPlaybackInformationWithStoreIdentifier:storefrontIdentifier:offers:previewURL:lyricExcerpt:", v5, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  return v11;
}

- (id)presentationPropertiesForTransformer:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  LPCaptionBarPresentationProperties *v9;
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
  LPCaptionBarPresentationProperties *v21;
  id v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;

  v4 = a3;
  -[LPiTunesMediaSongMetadata lyricExcerpt](self, "lyricExcerpt");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && objc_msgSend(v4, "_rowConfigurationForStyle:", 5) == 3)
  {
    v6 = sizeClassAllowsMedia(objc_msgSend(v4, "effectiveSizeClass"));

    if (v6)
      v7 = 42;
    else
      v7 = 5;
  }
  else
  {

    v6 = 0;
    v7 = 5;
  }
  objc_msgSend(v4, "commonPresentationPropertiesForStyle:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(LPCaptionBarPresentationProperties);
  objc_msgSend(v8, "setCaptionBar:", v9);

  -[LPiTunesMediaSongMetadata name](self, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPiTunesMediaSongMetadata artist](self, "artist");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  appleMusicWordmark(v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  populateCaptionBar(v8, v10, v11, v12, 1, v4);

  -[LPiTunesMediaSongMetadata artwork](self, "artwork");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_populateProperties:withPrimaryImage:", v8, v13);

  objc_msgSend(v4, "canonicalURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPiTunesMediaSongMetadata inlinePlaybackInformationForURL:](self, "inlinePlaybackInformationForURL:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setInlinePlaybackInformation:", v15);

  if (v6)
  {
    -[LPiTunesMediaSongMetadata lyricExcerpt](self, "lyricExcerpt");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "lyrics");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setQuotedText:", v17);

    -[LPiTunesMediaSongMetadata artwork](self, "artwork");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    lyricBackgroundImage(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundImage:", v19);

    objc_msgSend(v8, "captionBar");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setLeadingIcon:", 0);

    objc_msgSend(v8, "setImage:", 0);
    v21 = objc_alloc_init(LPCaptionBarPresentationProperties);
    objc_msgSend(v8, "setMediaBottomCaptionBar:", v21);

    if (objc_msgSend(v4, "allowsPlaybackControls"))
    {
      v22 = objc_alloc_init(MEMORY[0x1E0CB3570]);
      objc_msgSend(v22, "setUnitsStyle:", 0);
      objc_msgSend(v22, "setAllowedUnits:", 192);
      objc_msgSend(v22, "setZeroFormattingBehavior:", 0);
      -[LPiTunesMediaSongMetadata lyricExcerpt](self, "lyricExcerpt");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "endTime");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "doubleValue");
      v25 = v24;
      -[LPiTunesMediaSongMetadata lyricExcerpt](self, "lyricExcerpt");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "startTime");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "doubleValue");
      objc_msgSend(v22, "stringFromTimeInterval:", v25 - v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "mediaBottomCaptionBar");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "top");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "trailing");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setText:", v29);

    }
  }

  return v8;
}

- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3
{
  return +[LPPresentationSpecializations isiTunesStoreOrAdjacentURL:](LPPresentationSpecializations, "isiTunesStoreOrAdjacentURL:", a3);
}

- (id)previewSummaryForTransformer:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[LPiTunesMediaSongMetadata lyricExcerpt](self, "lyricExcerpt", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CB3940];
  if (v4)
    LPLocalizedString(CFSTR("Lyrics: %@ – %@"));
  else
    LPLocalizedString(CFSTR("Song: %@ – %@"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPiTunesMediaSongMetadata name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPiTunesMediaSongMetadata artist](self, "artist");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)previewImageForTransformer:(id)a3
{
  return 0;
}

- (void)populateMetadataForBackwardCompatibility:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[LPiTunesMediaSongMetadata name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPiTunesMediaSongMetadata artist](self, "artist");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  joinedByEmDash(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitle:", v6);

  -[LPiTunesMediaSongMetadata artwork](self, "artwork");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setIcon:", v7);

  -[LPiTunesMediaSongMetadata lyricExcerpt](self, "lyricExcerpt");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lyrics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSelectedText:", v9);

}

- (id)storeIdentifierForTransformer:(id)a3
{
  -[LPiTunesMediaSongMetadata storeIdentifier](self, "storeIdentifier", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)sourceApplicationMetadataForTransformer:(id)a3
{
  id v3;
  LPSourceApplicationMetadata *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  v4 = objc_alloc_init(LPSourceApplicationMetadata);
  objc_msgSend(v3, "scaleFactor");
  v6 = v5;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A820]), "initWithBundleIdentifier:", CFSTR("com.apple.Music"));
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A830]), "initWithSize:scale:", 16.0, 16.0, v6);
  objc_msgSend(v8, "setShouldApplyMask:", 0);
  objc_msgSend(v7, "prepareImageForDescriptor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[LPImage _initWithCGImage:]([LPImage alloc], "_initWithCGImage:", objc_msgSend(v9, "CGImage"));

  -[LPSourceApplicationMetadata setIcon:](v4, "setIcon:", v10);
  return v4;
}

- (void)initializeForTransformer:(id)a3
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  v3 = a3;
  objc_initWeak(&location, v3);
  +[LPiTunesStoreInformation shared](LPiTunesStoreInformation, "shared");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__LPiTunesMediaSongMetadata_Transformer__initializeForTransformer___block_invoke;
  v5[3] = &unk_1E44A84B8;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "registerForStoreAvailablityChangesWithToken:handler:", v3, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

void __67__LPiTunesMediaSongMetadata_Transformer__initializeForTransformer___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = v4;
    if (v2)
    {
      objc_msgSend(v4, "delegate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "statusTransformerDidUpdate:", v4);

      WeakRetained = v4;
    }
  }

}

- (void)destroyForTransformer:(id)a3
{
  id v4;

  +[LPiTunesStoreInformation shared](LPiTunesStoreInformation, "shared", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unregisterForStoreAvailablityChangesWithToken:", self);

}

+ (id)transcriptBoldTextFont
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((void *)transcriptBoldTextFont_contentSizeCategory != v3)
  {
    emphasizedPreferredFontForTextStyle(*MEMORY[0x1E0DC4AA0]);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)transcriptBoldTextFont_font;
    transcriptBoldTextFont_font = v4;

    objc_storeStrong((id *)&transcriptBoldTextFont_contentSizeCategory, v3);
  }
  v6 = (id)transcriptBoldTextFont_font;

  return v6;
}

+ (id)statusForText:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v22[2];
  _QWORD v23[2];
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v24 = *MEMORY[0x1E0DC32A0];
  v4 = v24;
  objc_msgSend((id)objc_opt_class(), "transcriptBoldTextFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v5;
  v25 = *MEMORY[0x1E0DC32A8];
  v6 = v25;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v24, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v3, v8);
  v22[0] = v4;
  objc_msgSend((id)objc_opt_class(), "transcriptBoldTextFont");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v6;
  v23[0] = v10;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemPinkColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "string");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "rangeOfString:", CFSTR("<link>"));
  v16 = v15;

  objc_msgSend(v9, "replaceCharactersInRange:withString:", v14, v16, &stru_1E44AB1C8);
  objc_msgSend(v9, "string");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "rangeOfString:", CFSTR("</link>"));
  v20 = v19;

  objc_msgSend(v9, "replaceCharactersInRange:withString:", v18, v20, &stru_1E44AB1C8);
  objc_msgSend(v9, "addAttributes:range:", v12, v14, v18 - v14);

  return v9;
}

- (id)statusForTransformer:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  objc_msgSend(a3, "canonicalURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPiTunesMediaSongMetadata inlinePlaybackInformationForURL:](self, "inlinePlaybackInformationForURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[LPiTunesStoreInformation shared](LPiTunesStoreInformation, "shared");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "storefrontIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "userStateForMediaStorefrontIdentifier:", v7);

  if ((v8 & 0xFFFFFFFFFFFFFFFBLL) != 0)
  {
    v9 = objc_msgSend(v5, "availability");
    if (v9 < 2)
    {
      subscribeToAppleMusicStatus(v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        v12 = 0;
        goto LABEL_10;
      }
      +[LPiTunesMediaSongMetadata statusForText:](LPiTunesMediaSongMetadata, "statusForText:", v10);
      v11 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v12 = (void *)v11;
LABEL_10:

      goto LABEL_11;
    }
    if (v9 == 2)
    {
      LPLocalizedString(CFSTR("Buy Song on <link>iTunes</link>"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[LPiTunesMediaSongMetadata statusForText:](LPiTunesMediaSongMetadata, "statusForText:", v10);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (id)actionURLForTransformer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v4 = a3;
  objc_msgSend(v4, "canonicalURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPiTunesMediaSongMetadata inlinePlaybackInformationForURL:](self, "inlinePlaybackInformationForURL:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[LPiTunesStoreInformation shared](LPiTunesStoreInformation, "shared");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "storefrontIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "userStateForMediaStorefrontIdentifier:", v8);

  if ((v9 & 0xFFFFFFFFFFFFFFFBLL) == 0)
    goto LABEL_8;
  v10 = objc_msgSend(v6, "availability");
  if (v10 >= 2)
  {
    if (v10 == 2)
    {
      objc_msgSend(v4, "canonicalURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      replaceScheme(v11, CFSTR("itms"));
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
LABEL_8:
    v13 = 0;
    goto LABEL_9;
  }
  if (v9 == 1)
    goto LABEL_8;
  objc_msgSend(v4, "canonicalURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  replaceScheme(v11, CFSTR("music"));
  v12 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v13 = (void *)v12;

LABEL_9:
  return v13;
}

@end
