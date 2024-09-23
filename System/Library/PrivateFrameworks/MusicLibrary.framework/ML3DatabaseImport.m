@implementation ML3DatabaseImport

- (ML3DatabaseImport)initWithLibraryPath:(id)a3 trackData:(id)a4 playlistData:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  ML3DatabaseImport *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  MSVTCCIdentityForCurrentProcess();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[ML3DatabaseImport initWithLibraryPath:trackData:playlistData:clientIdentity:](self, "initWithLibraryPath:trackData:playlistData:clientIdentity:", v10, v9, v8, v11);

  return v12;
}

- (ML3DatabaseImport)initWithLibraryPath:(id)a3 trackData:(id)a4 playlistData:(id)a5 clientIdentity:(id)a6
{
  return -[ML3DatabaseImport initWithLibraryPath:trackData:playlistData:albumArtistData:albumData:clientIdentity:](self, "initWithLibraryPath:trackData:playlistData:albumArtistData:albumData:clientIdentity:", a3, a4, a5, 0, 0, a6);
}

- (ML3DatabaseImport)initWithLibraryPath:(id)a3 trackData:(id)a4 playlistData:(id)a5 albumArtistData:(id)a6 albumData:(id)a7 clientIdentity:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  ML3DatabaseImport *v20;
  uint64_t v21;
  NSString *libraryPath;
  uint64_t v23;
  NSData *trackData;
  uint64_t v25;
  NSData *playlistData;
  uint64_t v27;
  NSData *albumArtistData;
  uint64_t v29;
  NSData *albumData;
  objc_super v32;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v32.receiver = self;
  v32.super_class = (Class)ML3DatabaseImport;
  v20 = -[ML3DatabaseImport init](&v32, sel_init);
  if (v20)
  {
    v21 = objc_msgSend(v14, "copy");
    libraryPath = v20->_libraryPath;
    v20->_libraryPath = (NSString *)v21;

    v23 = objc_msgSend(v15, "copy");
    trackData = v20->_trackData;
    v20->_trackData = (NSData *)v23;

    v25 = objc_msgSend(v16, "copy");
    playlistData = v20->_playlistData;
    v20->_playlistData = (NSData *)v25;

    v27 = objc_msgSend(v17, "copy");
    albumArtistData = v20->_albumArtistData;
    v20->_albumArtistData = (NSData *)v27;

    v29 = objc_msgSend(v18, "copy");
    albumData = v20->_albumData;
    v20->_albumData = (NSData *)v29;

    *(_DWORD *)&v20->_tracksAreLibraryOwnedContent = 257;
    v20->_pairedDeviceCanProcessStandaloneCollections = 0;
    v20->_suspendable = 1;
    objc_storeStrong((id *)&v20->_clientIdentity, a8);
    v20->_clientInitiatedReset = 0;
  }

  return v20;
}

- (ML3DatabaseImport)init
{
  return -[ML3DatabaseImport initWithLibraryPath:trackData:playlistData:](self, "initWithLibraryPath:trackData:playlistData:", 0, 0, 0);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = CFSTR("YES");
  if (self->_tracksAreLibraryOwnedContent)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  if (self->_playlistsAreLibraryOwnedContent)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  if (self->_pendingMatch)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  if (self->_clientInitiatedReset)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  if (!self->_pairedDeviceCanProcessStandaloneCollections)
    v5 = CFSTR("NO");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p libraryOwnedTracks=%@ libraryOwnedPlaylists=%@ pendingMatch=%@ _clientInitiatedReset=%@ pairedDeviceCanProcessStandaloneCollections=%@ libraryPath=\"%@\">"), v4, self, v6, v7, v8, v9, v5, self->_libraryPath);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[ML3DatabaseImport _copyWithZone:usingConcreteClass:](self, "_copyWithZone:usingConcreteClass:", a3, objc_opt_class());
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[ML3DatabaseImport _copyWithZone:usingConcreteClass:](self, "_copyWithZone:usingConcreteClass:", a3, objc_opt_class());
}

- (void)encodeWithCoder:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if ((objc_msgSend(v7, "allowsKeyedCoding") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3DatabaseImport.m"), 121, CFSTR("%@: coder must support keyed coding"), v6);

  }
  objc_msgSend(v7, "encodeObject:forKey:", self->_libraryPath, CFSTR("libraryPath"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_trackData, CFSTR("trackData"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_playlistData, CFSTR("playlistData"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_albumArtistData, CFSTR("albumArtistData"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_albumData, CFSTR("albumData"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_fileHandle, CFSTR("fileHandle"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_syncAnchor, CFSTR("syncAnchor"));
  objc_msgSend(v7, "encodeBool:forKey:", self->_resetSync, CFSTR("resetSync"));
  objc_msgSend(v7, "encodeBool:forKey:", self->_sagaEnabled, CFSTR("sagaEnabled"));
  objc_msgSend(v7, "encodeInt64:forKey:", self->_storeAccountID, CFSTR("storeAccountID"));
  objc_msgSend(v7, "encodeInt64:forKey:", self->_preferredVideoQuality, CFSTR("preferredVideoQuality"));
  objc_msgSend(v7, "encodeInt32:forKey:", self->_homeSharingBasePlaylistID, CFSTR("homeSharingBasePlaylistID"));
  objc_msgSend(v7, "encodeBool:forKey:", self->_tracksAreLibraryOwnedContent, CFSTR("tracksAreLibraryOwnedContent"));
  objc_msgSend(v7, "encodeBool:forKey:", self->_playlistsAreLibraryOwnedContent, CFSTR("playlistsAreLibraryOwnedContent"));
  objc_msgSend(v7, "encodeBool:forKey:", self->_pendingMatch, CFSTR("pendingMatch"));
  objc_msgSend(v7, "encodeBool:forKey:", self->_isServerImport, CFSTR("isServerImport"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_syncLibraryID, CFSTR("syncLibraryUUID"));
  objc_msgSend(v7, "encodeBool:forKey:", self->_suspendable, CFSTR("suspendable"));
  objc_msgSend(v7, "encodeBool:forKey:", self->_pairedDeviceCanProcessStandaloneCollections, CFSTR("pairedDeviceCanProcessStandaloneCollections"));
  objc_msgSend(v7, "encodeBool:forKey:", self->_clientInitiatedReset, CFSTR("clientInitiatedResetSync"));
  objc_msgSend(v7, "encodeTCCIdentity:forKey:", self->_clientIdentity, CFSTR("clientIdentity"));

}

- (ML3DatabaseImport)initWithCoder:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  ML3DatabaseImport *v12;
  uint64_t v13;
  NSFileHandle *fileHandle;
  uint64_t v15;
  NSString *syncAnchor;
  uint64_t v17;
  NSString *syncLibraryID;
  void *v20;
  void *v21;

  v5 = a3;
  if ((objc_msgSend(v5, "allowsKeyedCoding") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3DatabaseImport.m"), 148, CFSTR("%@: coder must support keyed coding"), v21);

  }
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("libraryPath"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("trackData"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("playlistData"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeTCCIdentityForKey:", CFSTR("clientIdentity"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("albumArtistData"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("albumData"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[ML3DatabaseImport initWithLibraryPath:trackData:playlistData:albumArtistData:albumData:clientIdentity:](self, "initWithLibraryPath:trackData:playlistData:albumArtistData:albumData:clientIdentity:", v6, v7, v8, v10, v11, v9);
  if (v12)
  {
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fileHandle"));
    v13 = objc_claimAutoreleasedReturnValue();
    fileHandle = v12->_fileHandle;
    v12->_fileHandle = (NSFileHandle *)v13;

    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("syncAnchor"));
    v15 = objc_claimAutoreleasedReturnValue();
    syncAnchor = v12->_syncAnchor;
    v12->_syncAnchor = (NSString *)v15;

    v12->_resetSync = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("resetSync"));
    v12->_sagaEnabled = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("sagaEnabled"));
    v12->_storeAccountID = objc_msgSend(v5, "decodeInt64ForKey:", CFSTR("storeAccountID"));
    v12->_preferredVideoQuality = objc_msgSend(v5, "decodeInt64ForKey:", CFSTR("preferredVideoQuality"));
    v12->_homeSharingBasePlaylistID = objc_msgSend(v5, "decodeInt32ForKey:", CFSTR("homeSharingBasePlaylistID"));
    v12->_tracksAreLibraryOwnedContent = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("tracksAreLibraryOwnedContent"));
    v12->_playlistsAreLibraryOwnedContent = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("playlistsAreLibraryOwnedContent"));
    v12->_pendingMatch = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("pendingMatch"));
    v12->_isServerImport = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("isServerImport"));
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("syncLibraryUUID"));
    v17 = objc_claimAutoreleasedReturnValue();
    syncLibraryID = v12->_syncLibraryID;
    v12->_syncLibraryID = (NSString *)v17;

    v12->_suspendable = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("suspendable"));
    v12->_pairedDeviceCanProcessStandaloneCollections = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("pairedDeviceCanProcessStandaloneCollections"));
    v12->_clientInitiatedReset = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("clientInitiatedResetSync"));
  }

  return v12;
}

- (id)_copyWithZone:(_NSZone *)a3 usingConcreteClass:(Class)a4
{
  objc_class *v5;
  uint64_t v6;
  void *v7;

  v5 = -[objc_class initWithLibraryPath:trackData:playlistData:albumArtistData:albumData:clientIdentity:](-[objc_class allocWithZone:](a4, "allocWithZone:", a3), "initWithLibraryPath:trackData:playlistData:albumArtistData:albumData:clientIdentity:", self->_libraryPath, self->_trackData, self->_playlistData, self->_albumArtistData, self->_albumData, self->_clientIdentity);
  objc_storeStrong((id *)v5 + 6, self->_fileHandle);
  v6 = -[NSString copy](self->_syncAnchor, "copy");
  v7 = (void *)*((_QWORD *)v5 + 7);
  *((_QWORD *)v5 + 7) = v6;

  *((_BYTE *)v5 + 64) = self->_resetSync;
  *((_BYTE *)v5 + 65) = self->_sagaEnabled;
  *((_QWORD *)v5 + 9) = self->_storeAccountID;
  *((_QWORD *)v5 + 10) = self->_preferredVideoQuality;
  *((_DWORD *)v5 + 22) = self->_homeSharingBasePlaylistID;
  *((_BYTE *)v5 + 92) = self->_tracksAreLibraryOwnedContent;
  *((_BYTE *)v5 + 93) = self->_playlistsAreLibraryOwnedContent;
  *((_BYTE *)v5 + 94) = self->_pendingMatch;
  *((_BYTE *)v5 + 95) = self->_isServerImport;
  objc_storeStrong((id *)v5 + 13, self->_syncLibraryID);
  *((_BYTE *)v5 + 112) = self->_suspendable;
  *((_BYTE *)v5 + 96) = self->_pairedDeviceCanProcessStandaloneCollections;
  *((_BYTE *)v5 + 113) = self->_clientInitiatedReset;
  return v5;
}

- (NSString)libraryPath
{
  return self->_libraryPath;
}

- (NSData)trackData
{
  return self->_trackData;
}

- (NSData)playlistData
{
  return self->_playlistData;
}

- (NSData)albumArtistData
{
  return self->_albumArtistData;
}

- (NSData)albumData
{
  return self->_albumData;
}

- (NSFileHandle)fileHandle
{
  return self->_fileHandle;
}

- (NSString)syncAnchor
{
  return self->_syncAnchor;
}

- (BOOL)isResetSync
{
  return self->_resetSync;
}

- (BOOL)isSagaEnabled
{
  return self->_sagaEnabled;
}

- (int64_t)storeAccountID
{
  return self->_storeAccountID;
}

- (int64_t)preferredVideoQuality
{
  return self->_preferredVideoQuality;
}

- (unsigned)homeSharingBasePlaylistID
{
  return self->_homeSharingBasePlaylistID;
}

- (BOOL)clientInitiatedReset
{
  return self->_clientInitiatedReset;
}

- (void)setClientInitiatedReset:(BOOL)a3
{
  self->_clientInitiatedReset = a3;
}

- (BOOL)tracksAreLibraryOwnedContent
{
  return self->_tracksAreLibraryOwnedContent;
}

- (BOOL)playlistsAreLibraryOwnedContent
{
  return self->_playlistsAreLibraryOwnedContent;
}

- (BOOL)isPendingMatch
{
  return self->_pendingMatch;
}

- (BOOL)isServerImport
{
  return self->_isServerImport;
}

- (BOOL)pairedDeviceCanProcessStandaloneCollections
{
  return self->_pairedDeviceCanProcessStandaloneCollections;
}

- (NSString)syncLibraryID
{
  return self->_syncLibraryID;
}

- (BOOL)isSuspendable
{
  return self->_suspendable;
}

- (OS_tcc_identity)clientIdentity
{
  return self->_clientIdentity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentity, 0);
  objc_storeStrong((id *)&self->_syncLibraryID, 0);
  objc_storeStrong((id *)&self->_syncAnchor, 0);
  objc_storeStrong((id *)&self->_fileHandle, 0);
  objc_storeStrong((id *)&self->_albumData, 0);
  objc_storeStrong((id *)&self->_albumArtistData, 0);
  objc_storeStrong((id *)&self->_playlistData, 0);
  objc_storeStrong((id *)&self->_trackData, 0);
  objc_storeStrong((id *)&self->_libraryPath, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
