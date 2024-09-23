@implementation LPiTunesMediaPodcastMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPiTunesMediaPodcastMetadata)initWithCoder:(id)a3
{
  id v4;
  LPiTunesMediaPodcastMetadata *v5;
  uint64_t v6;
  NSString *storeFrontIdentifier;
  uint64_t v8;
  NSString *storeIdentifier;
  uint64_t v10;
  NSString *name;
  uint64_t v12;
  NSString *artist;
  uint64_t v14;
  LPImage *artwork;
  uint64_t v16;
  LPArtworkMetadata *artworkMetadata;
  uint64_t v18;
  NSArray *offers;
  LPiTunesMediaPodcastMetadata *v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)LPiTunesMediaPodcastMetadata;
  v5 = -[LPiTunesMediaPodcastMetadata init](&v22, sel_init);
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

    objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", CFSTR("artwork"));
    v14 = objc_claimAutoreleasedReturnValue();
    artwork = v5->_artwork;
    v5->_artwork = (LPImage *)v14;

    objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("artworkMetadata"));
    v16 = objc_claimAutoreleasedReturnValue();
    artworkMetadata = v5->_artworkMetadata;
    v5->_artworkMetadata = (LPArtworkMetadata *)v16;

    decodeArrayOfStringsForKey(v4);
    v18 = objc_claimAutoreleasedReturnValue();
    offers = v5->_offers;
    v5->_offers = (NSArray *)v18;

    v20 = v5;
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
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_artwork, CFSTR("artwork"));
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_artworkMetadata, CFSTR("artworkMetadata"));
  objc_msgSend(v4, "_lp_encodeArrayIfNotEmpty:forKey:", self->_offers, CFSTR("offers"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  LPiTunesMediaPodcastMetadata *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  LPiTunesMediaPodcastMetadata *v12;

  v4 = +[LPiTunesMediaPodcastMetadata allocWithZone:](LPiTunesMediaPodcastMetadata, "allocWithZone:", a3);
  if (v4)
  {
    -[LPiTunesMediaPodcastMetadata storeFrontIdentifier](self, "storeFrontIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaPodcastMetadata setStoreFrontIdentifier:](v4, "setStoreFrontIdentifier:", v5);

    -[LPiTunesMediaPodcastMetadata storeIdentifier](self, "storeIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaPodcastMetadata setStoreIdentifier:](v4, "setStoreIdentifier:", v6);

    -[LPiTunesMediaPodcastMetadata name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaPodcastMetadata setName:](v4, "setName:", v7);

    -[LPiTunesMediaPodcastMetadata artist](self, "artist");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaPodcastMetadata setArtist:](v4, "setArtist:", v8);

    -[LPiTunesMediaPodcastMetadata artwork](self, "artwork");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaPodcastMetadata setArtwork:](v4, "setArtwork:", v9);

    -[LPiTunesMediaPodcastMetadata artworkMetadata](self, "artworkMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaPodcastMetadata setArtworkMetadata:](v4, "setArtworkMetadata:", v10);

    -[LPiTunesMediaPodcastMetadata offers](self, "offers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaPodcastMetadata setOffers:](v4, "setOffers:", v11);

    v12 = v4;
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
  v8.super_class = (Class)LPiTunesMediaPodcastMetadata;
  if (-[LPiTunesMediaPodcastMetadata isEqual:](&v8, sel_isEqual_, v4))
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
        && objectsAreEqual_0(v6[6], self->_artwork)
        && objectsAreEqual_0(v6[7], self->_artworkMetadata))
      {
        v5 = objectsAreEqual_0(v6[8], self->_offers);
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
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("storeFrontIdentifier"), CFSTR("storeIdentifier"), CFSTR("name"), CFSTR("artist"), CFSTR("artwork"), CFSTR("artworkMetadata"), CFSTR("offers"), 0);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)offers
{
  return self->_offers;
}

- (void)setOffers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offers, 0);
  objc_storeStrong((id *)&self->_artworkMetadata, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_artist, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_storeFrontIdentifier, 0);
}

- (id)presentationPropertiesForTransformer:(id)a3
{
  id v4;
  void *v5;
  LPCaptionBarPresentationProperties *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  objc_msgSend(v4, "commonPresentationPropertiesForStyle:", 20);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(LPCaptionBarPresentationProperties);
  objc_msgSend(v5, "setCaptionBar:", v6);

  -[LPiTunesMediaPodcastMetadata name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPiTunesMediaPodcastMetadata artist](self, "artist");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LPLocalizedString(CFSTR(" Podcasts"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  populateCaptionBar(v5, v7, v8, v9, 1, v4);

  -[LPiTunesMediaPodcastMetadata artwork](self, "artwork");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_populateProperties:withPrimaryImage:", v5, v10);

  -[LPiTunesMediaPodcastMetadata storeIdentifier](self, "storeIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPiTunesMediaPodcastMetadata storeFrontIdentifier](self, "storeFrontIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPiTunesMediaPodcastMetadata offers](self, "offers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[LPInlineMediaPlaybackInformation podcastPlaybackInformationWithStoreIdentifier:storefrontIdentifier:offers:](LPInlineMediaPlaybackInformation, "podcastPlaybackInformationWithStoreIdentifier:storefrontIdentifier:offers:", v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setInlinePlaybackInformation:", v14);
  return v5;
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

  v4 = (void *)MEMORY[0x1E0CB3940];
  LPLocalizedString(CFSTR("Podcast: %@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPiTunesMediaPodcastMetadata name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)previewImageForTransformer:(id)a3
{
  return 0;
}

- (void)populateMetadataForBackwardCompatibility:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[LPiTunesMediaPodcastMetadata name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v4);

  -[LPiTunesMediaPodcastMetadata artwork](self, "artwork");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", v5);

}

- (id)storeIdentifierForTransformer:(id)a3
{
  -[LPiTunesMediaPodcastMetadata storeIdentifier](self, "storeIdentifier", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
