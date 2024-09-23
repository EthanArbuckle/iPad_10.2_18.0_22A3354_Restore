@implementation LPiTunesMediaPodcastEpisodeMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPiTunesMediaPodcastEpisodeMetadata)initWithCoder:(id)a3
{
  id v4;
  LPiTunesMediaPodcastEpisodeMetadata *v5;
  uint64_t v6;
  NSString *storeFrontIdentifier;
  uint64_t v8;
  NSString *storeIdentifier;
  uint64_t v10;
  NSString *episodeName;
  uint64_t v12;
  NSString *podcastName;
  uint64_t v14;
  NSString *artist;
  uint64_t v16;
  NSDate *releaseDate;
  uint64_t v18;
  LPImage *artwork;
  uint64_t v20;
  LPArtworkMetadata *artworkMetadata;
  uint64_t v22;
  NSArray *offers;
  LPiTunesMediaPodcastEpisodeMetadata *v24;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)LPiTunesMediaPodcastEpisodeMetadata;
  v5 = -[LPiTunesMediaPodcastEpisodeMetadata init](&v26, sel_init);
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

    decodeStringForKey(v4, (uint64_t)CFSTR("episodeName"));
    v10 = objc_claimAutoreleasedReturnValue();
    episodeName = v5->_episodeName;
    v5->_episodeName = (NSString *)v10;

    decodeStringForKey(v4, (uint64_t)CFSTR("podcastName"));
    v12 = objc_claimAutoreleasedReturnValue();
    podcastName = v5->_podcastName;
    v5->_podcastName = (NSString *)v12;

    decodeStringForKey(v4, (uint64_t)CFSTR("artist"));
    v14 = objc_claimAutoreleasedReturnValue();
    artist = v5->_artist;
    v5->_artist = (NSString *)v14;

    objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("releaseDate"));
    v16 = objc_claimAutoreleasedReturnValue();
    releaseDate = v5->_releaseDate;
    v5->_releaseDate = (NSDate *)v16;

    objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", CFSTR("artwork"));
    v18 = objc_claimAutoreleasedReturnValue();
    artwork = v5->_artwork;
    v5->_artwork = (LPImage *)v18;

    objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("artworkMetadata"));
    v20 = objc_claimAutoreleasedReturnValue();
    artworkMetadata = v5->_artworkMetadata;
    v5->_artworkMetadata = (LPArtworkMetadata *)v20;

    decodeArrayOfStringsForKey(v4);
    v22 = objc_claimAutoreleasedReturnValue();
    offers = v5->_offers;
    v5->_offers = (NSArray *)v22;

    v24 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_storeFrontIdentifier, CFSTR("storeFrontIdentifier"));
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_storeIdentifier, CFSTR("storeIdentifier"));
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_episodeName, CFSTR("episodeName"));
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_podcastName, CFSTR("podcastName"));
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_artist, CFSTR("artist"));
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_releaseDate, CFSTR("releaseDate"));
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_artwork, CFSTR("artwork"));
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_artworkMetadata, CFSTR("artworkMetadata"));
  objc_msgSend(v4, "_lp_encodeArrayIfNotEmpty:forKey:", self->_offers, CFSTR("offers"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  LPiTunesMediaPodcastEpisodeMetadata *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  LPiTunesMediaPodcastEpisodeMetadata *v14;

  v4 = +[LPiTunesMediaPodcastEpisodeMetadata allocWithZone:](LPiTunesMediaPodcastEpisodeMetadata, "allocWithZone:", a3);
  if (v4)
  {
    -[LPiTunesMediaPodcastEpisodeMetadata storeFrontIdentifier](self, "storeFrontIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaPodcastEpisodeMetadata setStoreFrontIdentifier:](v4, "setStoreFrontIdentifier:", v5);

    -[LPiTunesMediaPodcastEpisodeMetadata storeIdentifier](self, "storeIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaPodcastEpisodeMetadata setStoreIdentifier:](v4, "setStoreIdentifier:", v6);

    -[LPiTunesMediaPodcastEpisodeMetadata episodeName](self, "episodeName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaPodcastEpisodeMetadata setEpisodeName:](v4, "setEpisodeName:", v7);

    -[LPiTunesMediaPodcastEpisodeMetadata podcastName](self, "podcastName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaPodcastEpisodeMetadata setPodcastName:](v4, "setPodcastName:", v8);

    -[LPiTunesMediaPodcastEpisodeMetadata artist](self, "artist");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaPodcastEpisodeMetadata setArtist:](v4, "setArtist:", v9);

    -[LPiTunesMediaPodcastEpisodeMetadata releaseDate](self, "releaseDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaPodcastEpisodeMetadata setReleaseDate:](v4, "setReleaseDate:", v10);

    -[LPiTunesMediaPodcastEpisodeMetadata artwork](self, "artwork");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaPodcastEpisodeMetadata setArtwork:](v4, "setArtwork:", v11);

    -[LPiTunesMediaPodcastEpisodeMetadata artworkMetadata](self, "artworkMetadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaPodcastEpisodeMetadata setArtworkMetadata:](v4, "setArtworkMetadata:", v12);

    -[LPiTunesMediaPodcastEpisodeMetadata offers](self, "offers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiTunesMediaPodcastEpisodeMetadata setOffers:](v4, "setOffers:", v13);

    v14 = v4;
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
  v8.super_class = (Class)LPiTunesMediaPodcastEpisodeMetadata;
  if (-[LPiTunesMediaPodcastEpisodeMetadata isEqual:](&v8, sel_isEqual_, v4))
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
        && objectsAreEqual_0(v6[4], self->_episodeName)
        && objectsAreEqual_0(v6[5], self->_podcastName)
        && objectsAreEqual_0(v6[6], self->_artist)
        && objectsAreEqual_0(v6[7], self->_releaseDate)
        && objectsAreEqual_0(v6[8], self->_artwork)
        && objectsAreEqual_0(v6[9], self->_artworkMetadata))
      {
        v5 = objectsAreEqual_0(v6[10], self->_offers);
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
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("storeFrontIdentifier"), CFSTR("storeIdentifier"), CFSTR("episodeName"), CFSTR("podcastName"), CFSTR("artist"), CFSTR("releaseDate"), CFSTR("artwork"), CFSTR("artworkMetadata"), CFSTR("offers"), 0);
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

- (NSString)episodeName
{
  return self->_episodeName;
}

- (void)setEpisodeName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)podcastName
{
  return self->_podcastName;
}

- (void)setPodcastName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)artist
{
  return self->_artist;
}

- (void)setArtist:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDate)releaseDate
{
  return self->_releaseDate;
}

- (void)setReleaseDate:(id)a3
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

- (NSArray)offers
{
  return self->_offers;
}

- (void)setOffers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offers, 0);
  objc_storeStrong((id *)&self->_artworkMetadata, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_releaseDate, 0);
  objc_storeStrong((id *)&self->_artist, 0);
  objc_storeStrong((id *)&self->_podcastName, 0);
  objc_storeStrong((id *)&self->_episodeName, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_storeFrontIdentifier, 0);
}

- (id)presentationPropertiesForTransformer:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
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

  v4 = a3;
  objc_msgSend(v4, "commonPresentationPropertiesForStyle:", 19);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v6, "setDateStyle:", 3);
  -[LPiTunesMediaPodcastEpisodeMetadata releaseDate](self, "releaseDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(LPCaptionBarPresentationProperties);
  objc_msgSend(v5, "setCaptionBar:", v9);

  -[LPiTunesMediaPodcastEpisodeMetadata episodeName](self, "episodeName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPiTunesMediaPodcastEpisodeMetadata podcastName](self, "podcastName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  joinedByDot(v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LPLocalizedString(CFSTR(" Podcasts"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  populateCaptionBar(v5, v10, v12, v13, 0, v4);

  -[LPiTunesMediaPodcastEpisodeMetadata artwork](self, "artwork");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_populateProperties:withPrimaryImage:", v5, v14);

  -[LPiTunesMediaPodcastEpisodeMetadata storeIdentifier](self, "storeIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPiTunesMediaPodcastEpisodeMetadata storeFrontIdentifier](self, "storeFrontIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPiTunesMediaPodcastEpisodeMetadata offers](self, "offers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[LPInlineMediaPlaybackInformation podcastEpisodePlaybackInformationWithStoreIdentifier:storefrontIdentifier:offers:](LPInlineMediaPlaybackInformation, "podcastEpisodePlaybackInformationWithStoreIdentifier:storefrontIdentifier:offers:", v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setInlinePlaybackInformation:", v18);
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
  void *v8;

  v4 = (void *)MEMORY[0x1E0CB3940];
  LPLocalizedString(CFSTR("Podcast: %@ – %@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPiTunesMediaPodcastEpisodeMetadata episodeName](self, "episodeName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPiTunesMediaPodcastEpisodeMetadata podcastName](self, "podcastName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
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
  -[LPiTunesMediaPodcastEpisodeMetadata episodeName](self, "episodeName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v4);

  -[LPiTunesMediaPodcastEpisodeMetadata artwork](self, "artwork");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIcon:", v5);

}

- (id)storeIdentifierForTransformer:(id)a3
{
  -[LPiTunesMediaPodcastEpisodeMetadata storeIdentifier](self, "storeIdentifier", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
