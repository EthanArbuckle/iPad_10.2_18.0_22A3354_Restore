@implementation _BlastDoorLPiTunesMediaPodcastEpisodeMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPiTunesMediaPodcastEpisodeMetadata)initWithCoder:(id)a3
{
  id v4;
  _BlastDoorLPiTunesMediaPodcastEpisodeMetadata *v5;
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
  _BlastDoorLPImage *artwork;
  uint64_t v20;
  _BlastDoorLPArtworkMetadata *artworkMetadata;
  uint64_t v22;
  NSArray *offers;
  _BlastDoorLPiTunesMediaPodcastEpisodeMetadata *v24;
  objc_super v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)_BlastDoorLPiTunesMediaPodcastEpisodeMetadata;
  v5 = -[_BlastDoorLPiTunesMediaPodcastEpisodeMetadata init](&v26, sel_init);
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

    objc_msgSend(v4, "_bd_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("releaseDate"));
    v16 = objc_claimAutoreleasedReturnValue();
    releaseDate = v5->_releaseDate;
    v5->_releaseDate = (NSDate *)v16;

    objc_msgSend(v4, "_bd_lp_strictlyDecodeLPImageForKey:", CFSTR("artwork"));
    v18 = objc_claimAutoreleasedReturnValue();
    artwork = v5->_artwork;
    v5->_artwork = (_BlastDoorLPImage *)v18;

    objc_msgSend(v4, "_bd_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("artworkMetadata"));
    v20 = objc_claimAutoreleasedReturnValue();
    artworkMetadata = v5->_artworkMetadata;
    v5->_artworkMetadata = (_BlastDoorLPArtworkMetadata *)v20;

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
  NSString *storeFrontIdentifier;
  id v5;

  storeFrontIdentifier = self->_storeFrontIdentifier;
  v5 = a3;
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", storeFrontIdentifier, CFSTR("storeFrontIdentifier"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_storeIdentifier, CFSTR("storeIdentifier"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_episodeName, CFSTR("episodeName"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_podcastName, CFSTR("podcastName"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_artist, CFSTR("artist"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_releaseDate, CFSTR("releaseDate"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_artwork, CFSTR("artwork"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_artworkMetadata, CFSTR("artworkMetadata"));
  objc_msgSend(v5, "_bd_lp_encodeArrayIfNotEmpty:forKey:", self->_offers, CFSTR("offers"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BlastDoorLPiTunesMediaPodcastEpisodeMetadata *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BlastDoorLPiTunesMediaPodcastEpisodeMetadata *v14;

  v4 = +[_BlastDoorLPiTunesMediaPodcastEpisodeMetadata allocWithZone:](_BlastDoorLPiTunesMediaPodcastEpisodeMetadata, "allocWithZone:", a3);
  if (v4)
  {
    -[_BlastDoorLPiTunesMediaPodcastEpisodeMetadata storeFrontIdentifier](self, "storeFrontIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPiTunesMediaPodcastEpisodeMetadata setStoreFrontIdentifier:](v4, "setStoreFrontIdentifier:", v5);

    -[_BlastDoorLPiTunesMediaPodcastEpisodeMetadata storeIdentifier](self, "storeIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPiTunesMediaPodcastEpisodeMetadata setStoreIdentifier:](v4, "setStoreIdentifier:", v6);

    -[_BlastDoorLPiTunesMediaPodcastEpisodeMetadata episodeName](self, "episodeName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPiTunesMediaPodcastEpisodeMetadata setEpisodeName:](v4, "setEpisodeName:", v7);

    -[_BlastDoorLPiTunesMediaPodcastEpisodeMetadata podcastName](self, "podcastName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPiTunesMediaPodcastEpisodeMetadata setPodcastName:](v4, "setPodcastName:", v8);

    -[_BlastDoorLPiTunesMediaPodcastEpisodeMetadata artist](self, "artist");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPiTunesMediaPodcastEpisodeMetadata setArtist:](v4, "setArtist:", v9);

    -[_BlastDoorLPiTunesMediaPodcastEpisodeMetadata releaseDate](self, "releaseDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPiTunesMediaPodcastEpisodeMetadata setReleaseDate:](v4, "setReleaseDate:", v10);

    -[_BlastDoorLPiTunesMediaPodcastEpisodeMetadata artwork](self, "artwork");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPiTunesMediaPodcastEpisodeMetadata setArtwork:](v4, "setArtwork:", v11);

    -[_BlastDoorLPiTunesMediaPodcastEpisodeMetadata artworkMetadata](self, "artworkMetadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPiTunesMediaPodcastEpisodeMetadata setArtworkMetadata:](v4, "setArtworkMetadata:", v12);

    -[_BlastDoorLPiTunesMediaPodcastEpisodeMetadata offers](self, "offers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPiTunesMediaPodcastEpisodeMetadata setOffers:](v4, "setOffers:", v13);

    v14 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  _QWORD *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  objc_super v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_BlastDoorLPiTunesMediaPodcastEpisodeMetadata;
  if (-[_BlastDoorLPiTunesMediaPodcastEpisodeMetadata isEqual:](&v17, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v4;
      v7 = v6[2];
      if (v7 | (unint64_t)self->_storeFrontIdentifier && !objc_msgSend((id)v7, "isEqual:")
        || (v8 = v6[3], v8 | (unint64_t)self->_storeIdentifier)
        && !objc_msgSend((id)v8, "isEqual:")
        || (v9 = v6[4], v9 | (unint64_t)self->_episodeName) && !objc_msgSend((id)v9, "isEqual:")
        || (v10 = v6[5], v10 | (unint64_t)self->_podcastName) && !objc_msgSend((id)v10, "isEqual:")
        || (v11 = v6[6], v11 | (unint64_t)self->_artist) && !objc_msgSend((id)v11, "isEqual:")
        || (v12 = v6[7], v12 | (unint64_t)self->_releaseDate) && !objc_msgSend((id)v12, "isEqual:")
        || (v13 = v6[8], v13 | (unint64_t)self->_artwork) && !objc_msgSend((id)v13, "isEqual:")
        || (v14 = v6[9], v14 | (unint64_t)self->_artworkMetadata)
        && !objc_msgSend((id)v14, "isEqual:"))
      {
        v5 = 0;
      }
      else
      {
        v15 = v6[10];
        if (v15 | (unint64_t)self->_offers)
          v5 = objc_msgSend((id)v15, "isEqual:");
        else
          v5 = 1;
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

- (_BlastDoorLPImage)artwork
{
  return self->_artwork;
}

- (void)setArtwork:(id)a3
{
  objc_storeStrong((id *)&self->_artwork, a3);
}

- (_BlastDoorLPArtworkMetadata)artworkMetadata
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

@end
