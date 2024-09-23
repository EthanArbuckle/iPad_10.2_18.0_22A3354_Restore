@implementation LPiTunesMediaSongUnresolvedMetadata

- (id)resolve
{
  LPiTunesMediaSongMetadata *v3;
  void *v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(LPiTunesMediaSongMetadata);
  -[LPiTunesMediaSongMetadata setStoreFrontIdentifier:](v3, "setStoreFrontIdentifier:", self->_storeFrontIdentifier);
  -[LPiTunesMediaSongMetadata setStoreIdentifier:](v3, "setStoreIdentifier:", self->_storeIdentifier);
  -[LPiTunesMediaSongMetadata setName:](v3, "setName:", self->_name);
  -[LPiTunesMediaSongMetadata setArtist:](v3, "setArtist:", self->_artist);
  -[LPiTunesMediaSongMetadata setAlbum:](v3, "setAlbum:", self->_album);
  -[LPiTunesMediaAsset metadata](self->_artwork, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPiTunesMediaSongMetadata setArtworkMetadata:](v3, "setArtworkMetadata:", v4);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = self->_offers;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "type", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        -[LPiTunesMediaSongMetadata previewURL](v3, "previewURL");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v11) = v12 == 0;

        if ((_DWORD)v11)
        {
          objc_msgSend(v10, "previewURL");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[LPiTunesMediaSongMetadata setPreviewURL:](v3, "setPreviewURL:", v13);

        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  -[LPiTunesMediaSongMetadata setOffers:](v3, "setOffers:", v5);
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

- (NSString)artist
{
  return self->_artist;
}

- (void)setArtist:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)album
{
  return self->_album;
}

- (void)setAlbum:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)lyrics
{
  return self->_lyrics;
}

- (void)setLyrics:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
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
  objc_storeStrong((id *)&self->_lyrics, 0);
  objc_storeStrong((id *)&self->_album, 0);
  objc_storeStrong((id *)&self->_artist, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_storeFrontIdentifier, 0);
}

@end
