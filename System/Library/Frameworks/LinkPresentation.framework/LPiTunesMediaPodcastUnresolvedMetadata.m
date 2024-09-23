@implementation LPiTunesMediaPodcastUnresolvedMetadata

- (id)resolve
{
  LPiTunesMediaPodcastMetadata *v3;
  void *v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(LPiTunesMediaPodcastMetadata);
  -[LPiTunesMediaPodcastMetadata setStoreFrontIdentifier:](v3, "setStoreFrontIdentifier:", self->_storeFrontIdentifier);
  -[LPiTunesMediaPodcastMetadata setStoreIdentifier:](v3, "setStoreIdentifier:", self->_storeIdentifier);
  -[LPiTunesMediaPodcastMetadata setName:](v3, "setName:", self->_name);
  -[LPiTunesMediaPodcastMetadata setArtist:](v3, "setArtist:", self->_artist);
  -[LPiTunesMediaAsset metadata](self->_artwork, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPiTunesMediaPodcastMetadata setArtworkMetadata:](v3, "setArtworkMetadata:", v4);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = self->_offers;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "type", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  -[LPiTunesMediaPodcastMetadata setOffers:](v3, "setOffers:", v5);
  return v3;
}

- (id)assetsToFetch
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self->_artwork;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
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

- (NSString)artist
{
  return self->_artist;
}

- (void)setArtist:(id)a3
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
  objc_storeStrong((id *)&self->_artist, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_storeFrontIdentifier, 0);
}

@end
