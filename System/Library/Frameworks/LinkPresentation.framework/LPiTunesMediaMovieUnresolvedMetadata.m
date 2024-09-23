@implementation LPiTunesMediaMovieUnresolvedMetadata

- (id)resolve
{
  LPiTunesMediaMovieMetadata *v3;
  void *v4;

  v3 = objc_alloc_init(LPiTunesMediaMovieMetadata);
  -[LPiTunesMediaMovieMetadata setStoreFrontIdentifier:](v3, "setStoreFrontIdentifier:", self->_storeFrontIdentifier);
  -[LPiTunesMediaMovieMetadata setStoreIdentifier:](v3, "setStoreIdentifier:", self->_storeIdentifier);
  -[LPiTunesMediaMovieMetadata setName:](v3, "setName:", self->_name);
  -[LPiTunesMediaMovieMetadata setGenre:](v3, "setGenre:", self->_genre);
  -[LPiTunesMediaAsset metadata](self->_artwork, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPiTunesMediaMovieMetadata setArtworkMetadata:](v3, "setArtworkMetadata:", v4);

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

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)genre
{
  return self->_genre;
}

- (void)setGenre:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (LPiTunesMediaAsset)artwork
{
  return self->_artwork;
}

- (void)setArtwork:(id)a3
{
  objc_storeStrong((id *)&self->_artwork, a3);
}

- (NSArray)offers
{
  return self->_offers;
}

- (void)setOffers:(id)a3
{
  objc_storeStrong((id *)&self->_offers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offers, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_storeFrontIdentifier, 0);
}

@end
