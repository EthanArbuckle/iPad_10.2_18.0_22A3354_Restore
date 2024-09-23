@implementation MPModelLibraryPlaylistEditChangeRequest

- (MPModelLibraryPlaylistEditChangeRequest)init
{
  MPModelLibraryPlaylistEditChangeRequest *v2;
  uint64_t v3;
  MPMediaLibrary *mediaLibrary;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MPModelLibraryPlaylistEditChangeRequest;
  v2 = -[MPModelLibraryPlaylistEditChangeRequest init](&v6, sel_init);
  if (v2)
  {
    +[MPMediaLibrary deviceMediaLibrary](MPMediaLibrary, "deviceMediaLibrary");
    v3 = objc_claimAutoreleasedReturnValue();
    mediaLibrary = v2->_mediaLibrary;
    v2->_mediaLibrary = (MPMediaLibrary *)v3;

  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)(v4 + 16), self->_mediaLibrary);
    v6 = -[MPSectionedCollection copy](self->_musicKitPlaylistEntries, "copy");
    v7 = *(void **)(v5 + 144);
    *(_QWORD *)(v5 + 144) = v6;

    *(_BYTE *)(v5 + 9) = self->_didSetPlaylistUserImage;
    objc_storeStrong((id *)(v5 + 136), self->_playlist);
    v8 = -[MPSectionedCollection copy](self->_playlistEntries, "copy");
    v9 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v8;

    objc_storeStrong((id *)(v5 + 32), self->_playlistDescription);
    objc_storeStrong((id *)(v5 + 40), self->_playlistName);
    objc_storeStrong((id *)(v5 + 48), self->_playlistUserImage);
    *(_BYTE *)(v5 + 8) = self->_shouldCreatePlaylist;
    objc_storeStrong((id *)(v5 + 128), self->_parentPlaylist);
    objc_storeStrong((id *)(v5 + 56), self->_publicPlaylist);
    objc_storeStrong((id *)(v5 + 64), self->_visiblePlaylist);
    objc_storeStrong((id *)(v5 + 72), self->_curatorPlaylist);
    objc_storeStrong((id *)(v5 + 80), self->_isOwner);
    objc_storeStrong((id *)(v5 + 88), self->_authorStoreIdentifier);
    objc_storeStrong((id *)(v5 + 96), self->_authorDisplayName);
    objc_storeStrong((id *)(v5 + 104), self->_coverArtworkRecipe);
    objc_storeStrong((id *)(v5 + 112), self->_trackListChanges);
    objc_storeStrong((id *)(v5 + 120), self->_deletedEntryUUIDs);
  }
  return (id)v5;
}

- (void)setPlaylistUserImage:(id)a3
{
  objc_storeStrong((id *)&self->_playlistUserImage, a3);
  self->_didSetPlaylistUserImage = 1;
}

- (id)newOperationWithLocalPersistenceResponseHandler:(id)a3 completeResponseHandler:(id)a4
{
  id v6;
  id v7;
  MPModelLibraryPlaylistEditChangeRequestOperation *v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(MPModelLibraryPlaylistEditChangeRequestOperation);
  -[MPModelLibraryPlaylistEditChangeRequestOperation setRequest:](v8, "setRequest:", self);
  -[MPModelLibraryPlaylistEditChangeRequestOperation setCompleteResponseHandler:](v8, "setCompleteResponseHandler:", v6);

  -[MPModelLibraryPlaylistEditChangeRequestOperation setLocalPersistenceResponseHandler:](v8, "setLocalPersistenceResponseHandler:", v7);
  return v8;
}

- (id)newSDKOperationWithLocalPersistenceResponseHandler:(id)a3 completeResponseHandler:(id)a4
{
  id v6;
  id v7;
  MPModelLibrarySDKPlaylistEditChangeRequestOperation *v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(MPModelLibrarySDKPlaylistEditChangeRequestOperation);
  -[MPModelLibraryPlaylistEditChangeRequestOperation setRequest:](v8, "setRequest:", self);
  -[MPModelLibraryPlaylistEditChangeRequestOperation setCompleteResponseHandler:](v8, "setCompleteResponseHandler:", v6);

  -[MPModelLibraryPlaylistEditChangeRequestOperation setLocalPersistenceResponseHandler:](v8, "setLocalPersistenceResponseHandler:", v7);
  return v8;
}

- (MPMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (void)setMediaLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_mediaLibrary, a3);
}

- (MPSectionedCollection)playlistEntries
{
  return self->_playlistEntries;
}

- (void)setPlaylistEntries:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)playlistDescription
{
  return self->_playlistDescription;
}

- (void)setPlaylistDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)playlistName
{
  return self->_playlistName;
}

- (void)setPlaylistName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (UIImage)playlistUserImage
{
  return self->_playlistUserImage;
}

- (NSNumber)isPublicPlaylist
{
  return self->_publicPlaylist;
}

- (void)setPublicPlaylist:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)isVisiblePlaylist
{
  return self->_visiblePlaylist;
}

- (void)setVisiblePlaylist:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSNumber)isCuratorPlaylist
{
  return self->_curatorPlaylist;
}

- (void)setCuratorPlaylist:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)isOwner
{
  return self->_isOwner;
}

- (void)setIsOwner:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)authorStoreIdentifier
{
  return self->_authorStoreIdentifier;
}

- (void)setAuthorStoreIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)authorDisplayName
{
  return self->_authorDisplayName;
}

- (void)setAuthorDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)coverArtworkRecipe
{
  return self->_coverArtworkRecipe;
}

- (void)setCoverArtworkRecipe:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (MPChangeDetails)trackListChanges
{
  return self->_trackListChanges;
}

- (void)setTrackListChanges:(id)a3
{
  objc_storeStrong((id *)&self->_trackListChanges, a3);
}

- (NSDictionary)deletedEntryUUIDs
{
  return self->_deletedEntryUUIDs;
}

- (void)setDeletedEntryUUIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (MPModelPlaylist)parentPlaylist
{
  return self->_parentPlaylist;
}

- (void)setParentPlaylist:(id)a3
{
  objc_storeStrong((id *)&self->_parentPlaylist, a3);
}

- (BOOL)shouldCreatePlaylist
{
  return self->_shouldCreatePlaylist;
}

- (void)setShouldCreatePlaylist:(BOOL)a3
{
  self->_shouldCreatePlaylist = a3;
}

- (MPModelPlaylist)playlist
{
  return self->_playlist;
}

- (void)setPlaylist:(id)a3
{
  objc_storeStrong((id *)&self->_playlist, a3);
}

- (MPSectionedCollection)musicKitPlaylistEntries
{
  return self->_musicKitPlaylistEntries;
}

- (void)setMusicKitPlaylistEntries:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (BOOL)didSetPlaylistUserImage
{
  return self->_didSetPlaylistUserImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_musicKitPlaylistEntries, 0);
  objc_storeStrong((id *)&self->_playlist, 0);
  objc_storeStrong((id *)&self->_parentPlaylist, 0);
  objc_storeStrong((id *)&self->_deletedEntryUUIDs, 0);
  objc_storeStrong((id *)&self->_trackListChanges, 0);
  objc_storeStrong((id *)&self->_coverArtworkRecipe, 0);
  objc_storeStrong((id *)&self->_authorDisplayName, 0);
  objc_storeStrong((id *)&self->_authorStoreIdentifier, 0);
  objc_storeStrong((id *)&self->_isOwner, 0);
  objc_storeStrong((id *)&self->_curatorPlaylist, 0);
  objc_storeStrong((id *)&self->_visiblePlaylist, 0);
  objc_storeStrong((id *)&self->_publicPlaylist, 0);
  objc_storeStrong((id *)&self->_playlistUserImage, 0);
  objc_storeStrong((id *)&self->_playlistName, 0);
  objc_storeStrong((id *)&self->_playlistDescription, 0);
  objc_storeStrong((id *)&self->_playlistEntries, 0);
  objc_storeStrong((id *)&self->_mediaLibrary, 0);
}

+ (id)requiredPlaylistEntryProperties
{
  return +[MPModelLibraryPlaylistEditChangeRequestOperation requiredPlaylistEntryProperties](MPModelLibraryPlaylistEditChangeRequestOperation, "requiredPlaylistEntryProperties");
}

@end
