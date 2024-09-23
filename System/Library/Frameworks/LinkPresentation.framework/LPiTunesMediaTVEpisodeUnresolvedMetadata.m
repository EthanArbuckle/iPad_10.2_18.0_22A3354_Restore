@implementation LPiTunesMediaTVEpisodeUnresolvedMetadata

- (id)resolve
{
  LPiTunesMediaTVEpisodeMetadata *v3;
  void *v4;

  v3 = objc_alloc_init(LPiTunesMediaTVEpisodeMetadata);
  -[LPiTunesMediaTVEpisodeMetadata setStoreFrontIdentifier:](v3, "setStoreFrontIdentifier:", self->_storeFrontIdentifier);
  -[LPiTunesMediaTVEpisodeMetadata setStoreIdentifier:](v3, "setStoreIdentifier:", self->_storeIdentifier);
  -[LPiTunesMediaTVEpisodeMetadata setEpisodeName:](v3, "setEpisodeName:", self->_episodeName);
  -[LPiTunesMediaTVEpisodeMetadata setSeasonName:](v3, "setSeasonName:", self->_seasonName);
  -[LPiTunesMediaTVEpisodeMetadata setGenre:](v3, "setGenre:", self->_genre);
  -[LPiTunesMediaAsset metadata](self->_artwork, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPiTunesMediaTVEpisodeMetadata setArtworkMetadata:](v3, "setArtworkMetadata:", v4);

  return v3;
}

- (id)assetsToFetch
{
  void *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  if (self->_artwork)
  {
    v4[0] = self->_artwork;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v2;
}

- (NSString)storeFrontIdentifier
{
  return self->_storeFrontIdentifier;
}

- (void)setStoreFrontIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)storeIdentifier
{
  return self->_storeIdentifier;
}

- (void)setStoreIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)episodeName
{
  return self->_episodeName;
}

- (void)setEpisodeName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)seasonName
{
  return self->_seasonName;
}

- (void)setSeasonName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)genre
{
  return self->_genre;
}

- (void)setGenre:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (LPiTunesMediaAsset)artwork
{
  return self->_artwork;
}

- (void)setArtwork:(id)a3
{
  objc_storeStrong((id *)&self->_artwork, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_seasonName, 0);
  objc_storeStrong((id *)&self->_episodeName, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_storeFrontIdentifier, 0);
}

@end
