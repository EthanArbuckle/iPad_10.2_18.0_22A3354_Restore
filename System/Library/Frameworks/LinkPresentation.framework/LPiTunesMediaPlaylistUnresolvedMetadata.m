@implementation LPiTunesMediaPlaylistUnresolvedMetadata

- (id)resolve
{
  LPiTunesMediaPlaylistMetadata *v3;
  void *v4;

  v3 = objc_alloc_init(LPiTunesMediaPlaylistMetadata);
  -[LPiTunesMediaPlaylistMetadata setStoreFrontIdentifier:](v3, "setStoreFrontIdentifier:", self->_storeFrontIdentifier);
  -[LPiTunesMediaPlaylistMetadata setStoreIdentifier:](v3, "setStoreIdentifier:", self->_storeIdentifier);
  -[LPiTunesMediaPlaylistMetadata setName:](v3, "setName:", self->_name);
  -[LPiTunesMediaPlaylistMetadata setCurator:](v3, "setCurator:", self->_curator);
  -[LPiTunesMediaPlaylistMetadata setCuratorHandle:](v3, "setCuratorHandle:", self->_curatorHandle);
  -[LPiTunesMediaAsset metadata](self->_artwork, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPiTunesMediaPlaylistMetadata setArtworkMetadata:](v3, "setArtworkMetadata:", v4);

  return v3;
}

- (id)assetsToFetch
{
  void *v3;
  void *v4;
  LPiTunesMediaAsset *v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_artwork)
    objc_msgSend(v3, "addObject:");
  if (self->_curatorID)
  {
    v5 = -[LPiTunesMediaAsset initWithName:curatorID:]([LPiTunesMediaAsset alloc], "initWithName:curatorID:", CFSTR("curatorProfileURL"), self->_curatorID);
    objc_msgSend(v4, "addObject:", v5);

  }
  return v4;
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

- (NSString)curator
{
  return self->_curator;
}

- (void)setCurator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)curatorHandle
{
  return self->_curatorHandle;
}

- (void)setCuratorHandle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)curatorID
{
  return self->_curatorID;
}

- (void)setCuratorID:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_curatorID, 0);
  objc_storeStrong((id *)&self->_curatorHandle, 0);
  objc_storeStrong((id *)&self->_curator, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_storeFrontIdentifier, 0);
}

@end
