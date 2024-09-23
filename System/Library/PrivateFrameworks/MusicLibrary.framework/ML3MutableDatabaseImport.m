@implementation ML3MutableDatabaseImport

- (void)setLibraryPath:(id)a3
{
  NSString *v4;
  NSString *libraryPath;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  libraryPath = self->super._libraryPath;
  self->super._libraryPath = v4;

}

- (void)setTrackData:(id)a3
{
  NSData *v4;
  NSData *trackData;

  v4 = (NSData *)objc_msgSend(a3, "copy");
  trackData = self->super._trackData;
  self->super._trackData = v4;

}

- (void)setPlaylistData:(id)a3
{
  NSData *v4;
  NSData *playlistData;

  v4 = (NSData *)objc_msgSend(a3, "copy");
  playlistData = self->super._playlistData;
  self->super._playlistData = v4;

}

- (void)setFileHandle:(id)a3
{
  objc_storeStrong((id *)&self->super._fileHandle, a3);
}

- (void)setSyncAnchor:(id)a3
{
  NSString *v4;
  NSString *syncAnchor;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  syncAnchor = self->super._syncAnchor;
  self->super._syncAnchor = v4;

}

- (void)setResetSync:(BOOL)a3
{
  self->super._resetSync = a3;
}

- (void)setSagaEnabled:(BOOL)a3
{
  self->super._sagaEnabled = a3;
}

- (void)setStoreAccountID:(int64_t)a3
{
  self->super._storeAccountID = a3;
}

- (void)setPreferredVideoQuality:(int64_t)a3
{
  self->super._preferredVideoQuality = a3;
}

- (void)setHomeSharingBasePlaylistID:(unsigned int)a3
{
  self->super._homeSharingBasePlaylistID = a3;
}

- (void)setTracksAreLibraryOwnedContent:(BOOL)a3
{
  self->super._tracksAreLibraryOwnedContent = a3;
}

- (void)setPlaylistsAreLibraryOwnedContent:(BOOL)a3
{
  self->super._playlistsAreLibraryOwnedContent = a3;
}

- (void)setPendingMatch:(BOOL)a3
{
  self->super._pendingMatch = a3;
}

- (void)setIsServerImport:(BOOL)a3
{
  self->super._isServerImport = a3;
}

- (void)setSyncLibraryID:(id)a3
{
  NSString *v4;
  NSString *syncLibraryID;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  syncLibraryID = self->super._syncLibraryID;
  self->super._syncLibraryID = v4;

}

- (void)setSuspendable:(BOOL)a3
{
  self->super._suspendable = a3;
}

- (void)setPairedDeviceCanProcessStandaloneCollections:(BOOL)a3
{
  self->super._pairedDeviceCanProcessStandaloneCollections = a3;
}

@end
