@implementation MPModelLibraryAddToPlaylistChangeRequest

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)(v4 + 16), self->_representativeModelObject);
    objc_storeStrong((id *)(v5 + 24), self->_referralObject);
    objc_storeStrong((id *)(v5 + 8), self->_playlist);
    objc_storeStrong((id *)(v5 + 32), self->_songResults);
    v6 = MEMORY[0x19403A810](self->_storeImportAllowedHandler);
    v7 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v6;

  }
  return (id)v5;
}

- (id)newOperationWithResponseHandler:(id)a3
{
  id v4;
  MPModelLibraryAddToPlaylistChangeRequestOperation *v5;

  v4 = a3;
  v5 = objc_alloc_init(MPModelLibraryAddToPlaylistChangeRequestOperation);
  -[MPModelLibraryAddToPlaylistChangeRequestOperation setRequest:](v5, "setRequest:", self);
  -[MPModelLibraryAddToPlaylistChangeRequestOperation setResponseHandler:](v5, "setResponseHandler:", v4);

  return v5;
}

- (MPModelPlaylist)playlist
{
  return self->_playlist;
}

- (void)setPlaylist:(id)a3
{
  objc_storeStrong((id *)&self->_playlist, a3);
}

- (MPModelObject)representativeModelObject
{
  return self->_representativeModelObject;
}

- (void)setRepresentativeModelObject:(id)a3
{
  objc_storeStrong((id *)&self->_representativeModelObject, a3);
}

- (MPModelObject)referralObject
{
  return self->_referralObject;
}

- (void)setReferralObject:(id)a3
{
  objc_storeStrong((id *)&self->_referralObject, a3);
}

- (MPSectionedCollection)songResults
{
  return self->_songResults;
}

- (void)setSongResults:(id)a3
{
  objc_storeStrong((id *)&self->_songResults, a3);
}

- (id)storeImportAllowedHandler
{
  return self->_storeImportAllowedHandler;
}

- (void)setStoreImportAllowedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_storeImportAllowedHandler, 0);
  objc_storeStrong((id *)&self->_songResults, 0);
  objc_storeStrong((id *)&self->_referralObject, 0);
  objc_storeStrong((id *)&self->_representativeModelObject, 0);
  objc_storeStrong((id *)&self->_playlist, 0);
}

@end
