@implementation _BlastDoorLPiTunesMediaTVEpisodeMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPiTunesMediaTVEpisodeMetadata)initWithCoder:(id)a3
{
  id v4;
  _BlastDoorLPiTunesMediaTVEpisodeMetadata *v5;
  uint64_t v6;
  NSString *storeFrontIdentifier;
  uint64_t v8;
  NSString *storeIdentifier;
  uint64_t v10;
  NSString *episodeName;
  uint64_t v12;
  NSString *seasonName;
  uint64_t v14;
  NSString *genre;
  uint64_t v16;
  _BlastDoorLPImage *artwork;
  uint64_t v18;
  _BlastDoorLPArtworkMetadata *artworkMetadata;
  _BlastDoorLPiTunesMediaTVEpisodeMetadata *v20;
  objc_super v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_BlastDoorLPiTunesMediaTVEpisodeMetadata;
  v5 = -[_BlastDoorLPiTunesMediaTVEpisodeMetadata init](&v22, sel_init);
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

    decodeStringForKey(v4, (uint64_t)CFSTR("seasonName"));
    v12 = objc_claimAutoreleasedReturnValue();
    seasonName = v5->_seasonName;
    v5->_seasonName = (NSString *)v12;

    decodeStringForKey(v4, (uint64_t)CFSTR("genre"));
    v14 = objc_claimAutoreleasedReturnValue();
    genre = v5->_genre;
    v5->_genre = (NSString *)v14;

    objc_msgSend(v4, "_bd_lp_strictlyDecodeLPImageForKey:", CFSTR("artwork"));
    v16 = objc_claimAutoreleasedReturnValue();
    artwork = v5->_artwork;
    v5->_artwork = (_BlastDoorLPImage *)v16;

    objc_msgSend(v4, "_bd_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("artworkMetadata"));
    v18 = objc_claimAutoreleasedReturnValue();
    artworkMetadata = v5->_artworkMetadata;
    v5->_artworkMetadata = (_BlastDoorLPArtworkMetadata *)v18;

    v20 = v5;
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
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_seasonName, CFSTR("seasonName"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_genre, CFSTR("genre"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_artwork, CFSTR("artwork"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_artworkMetadata, CFSTR("artworkMetadata"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BlastDoorLPiTunesMediaTVEpisodeMetadata *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BlastDoorLPiTunesMediaTVEpisodeMetadata *v12;

  v4 = +[_BlastDoorLPiTunesMediaTVEpisodeMetadata allocWithZone:](_BlastDoorLPiTunesMediaTVEpisodeMetadata, "allocWithZone:", a3);
  if (v4)
  {
    -[_BlastDoorLPiTunesMediaTVEpisodeMetadata storeFrontIdentifier](self, "storeFrontIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPiTunesMediaTVEpisodeMetadata setStoreFrontIdentifier:](v4, "setStoreFrontIdentifier:", v5);

    -[_BlastDoorLPiTunesMediaTVEpisodeMetadata storeIdentifier](self, "storeIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPiTunesMediaTVEpisodeMetadata setStoreIdentifier:](v4, "setStoreIdentifier:", v6);

    -[_BlastDoorLPiTunesMediaTVEpisodeMetadata episodeName](self, "episodeName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPiTunesMediaTVEpisodeMetadata setEpisodeName:](v4, "setEpisodeName:", v7);

    -[_BlastDoorLPiTunesMediaTVEpisodeMetadata seasonName](self, "seasonName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPiTunesMediaTVEpisodeMetadata setSeasonName:](v4, "setSeasonName:", v8);

    -[_BlastDoorLPiTunesMediaTVEpisodeMetadata genre](self, "genre");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPiTunesMediaTVEpisodeMetadata setGenre:](v4, "setGenre:", v9);

    -[_BlastDoorLPiTunesMediaTVEpisodeMetadata artwork](self, "artwork");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPiTunesMediaTVEpisodeMetadata setArtwork:](v4, "setArtwork:", v10);

    -[_BlastDoorLPiTunesMediaTVEpisodeMetadata artworkMetadata](self, "artworkMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPiTunesMediaTVEpisodeMetadata setArtworkMetadata:](v4, "setArtworkMetadata:", v11);

    v12 = v4;
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
  objc_super v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_BlastDoorLPiTunesMediaTVEpisodeMetadata;
  if (-[_BlastDoorLPiTunesMediaTVEpisodeMetadata isEqual:](&v15, sel_isEqual_, v4))
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
        || (v10 = v6[5], v10 | (unint64_t)self->_seasonName) && !objc_msgSend((id)v10, "isEqual:")
        || (v11 = v6[6], v11 | (unint64_t)self->_genre) && !objc_msgSend((id)v11, "isEqual:")
        || (v12 = v6[7], v12 | (unint64_t)self->_artwork) && !objc_msgSend((id)v12, "isEqual:"))
      {
        v5 = 0;
      }
      else
      {
        v13 = v6[8];
        if (v13 | (unint64_t)self->_artworkMetadata)
          v5 = objc_msgSend((id)v13, "isEqual:");
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
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("storeFrontIdentifier"), CFSTR("storeIdentifier"), CFSTR("episodeName"), CFSTR("seasonName"), CFSTR("genre"), CFSTR("artwork"), CFSTR("artworkMetadata"), 0);
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

- (NSString)seasonName
{
  return self->_seasonName;
}

- (void)setSeasonName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)genre
{
  return self->_genre;
}

- (void)setGenre:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkMetadata, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_seasonName, 0);
  objc_storeStrong((id *)&self->_episodeName, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_storeFrontIdentifier, 0);
}

@end
