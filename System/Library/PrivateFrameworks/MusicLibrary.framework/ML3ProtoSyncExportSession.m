@implementation ML3ProtoSyncExportSession

- (ML3ProtoSyncExportSession)initWithLibrary:(id)a3 outputStream:(id)a4 syncType:(int)a5
{
  id v8;
  ML3ProtoSyncExportSession *v9;
  uint64_t v10;
  NSString *libraryUUID;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ML3ProtoSyncExportSession;
  v9 = -[ML3ExportSession initWithLibrary:outputStream:](&v13, sel_initWithLibrary_outputStream_, v8, a4);
  if (v9)
  {
    objc_msgSend(v8, "libraryUID");
    v10 = objc_claimAutoreleasedReturnValue();
    libraryUUID = v9->_libraryUUID;
    v9->_libraryUUID = (NSString *)v10;

    v9->_syncType = a5;
  }

  return v9;
}

- (id)begin:(unsigned int)a3
{
  uint64_t v3;
  NSObject *v5;
  double v6;
  id v7;
  void *v8;
  MSVStreamWriter *v9;
  MSVStreamWriter *streamWriter;
  MSPMediaSyncPackage *v11;
  MSPMediaSyncHeader *v12;
  void *v13;
  _DWORD v15[2];
  uint64_t v16;

  v3 = *(_QWORD *)&a3;
  v16 = *MEMORY[0x1E0C80C00];
  v5 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v15[0] = 67109120;
    v15[1] = v3;
    _os_log_impl(&dword_1AC149000, v5, OS_LOG_TYPE_DEFAULT, "starting proto export session. numOperations=%d", (uint8_t *)v15, 8u);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  self->_sessionStartTime = v6;
  v7 = objc_alloc(MEMORY[0x1E0D4D0F0]);
  -[ML3ExportSession outputStream](self, "outputStream");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (MSVStreamWriter *)objc_msgSend(v7, "initWithOutputStream:queue:", v8, 0);
  streamWriter = self->_streamWriter;
  self->_streamWriter = v9;

  -[MSVStreamWriter start](self->_streamWriter, "start");
  v11 = objc_alloc_init(MSPMediaSyncPackage);
  -[MSPMediaSyncPackage setType:](v11, "setType:", 2);
  -[MSPMediaSyncPackage setLastPackage:](v11, "setLastPackage:", 0);
  v12 = objc_alloc_init(MSPMediaSyncHeader);
  -[MSPMediaSyncHeader setTotalPackages:](v12, "setTotalPackages:", v3);
  -[MSPMediaSyncHeader setSyncType:](v12, "setSyncType:", self->_syncType);
  -[MSPMediaSyncPackage setHeader:](v11, "setHeader:", v12);
  -[ML3ProtoSyncExportSession _writSyncPackageToStream:](self, "_writSyncPackageToStream:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)end
{
  MSPMediaSyncPackage *v3;
  void *v4;
  NSObject *v5;
  int trackAdds;
  int trackUpdates;
  int trackDeletes;
  int playlistAdds;
  int playlistDeletes;
  unsigned int totalSize;
  double v12;
  double v13;
  int playlistUpdates;
  int artistAdds;
  int artistUpdates;
  int albumUpdates;
  uint8_t buf[4];
  unsigned int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  __int16 v31;
  int v32;
  __int16 v33;
  int v34;
  __int16 v35;
  int v36;
  __int16 v37;
  int v38;
  __int16 v39;
  double v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MSPMediaSyncPackage);
  -[MSPMediaSyncPackage setType:](v3, "setType:", 1);
  -[MSPMediaSyncPackage setLastPackage:](v3, "setLastPackage:", 1);
  -[ML3ProtoSyncExportSession _writSyncPackageToStream:](self, "_writSyncPackageToStream:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSVStreamWriter stop](self->_streamWriter, "stop");
  v5 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    trackAdds = self->_stats.trackAdds;
    trackUpdates = self->_stats.trackUpdates;
    trackDeletes = self->_stats.trackDeletes;
    playlistAdds = self->_stats.playlistAdds;
    playlistDeletes = self->_stats.playlistDeletes;
    playlistUpdates = self->_stats.playlistUpdates;
    artistAdds = self->_stats.artistAdds;
    totalSize = self->_stats.totalSize;
    artistUpdates = self->_stats.artistUpdates;
    albumUpdates = self->_stats.albumUpdates;
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v13 = v12 - self->_sessionStartTime;
    *(_DWORD *)buf = 67111680;
    v20 = totalSize;
    v21 = 1024;
    v22 = trackAdds;
    v23 = 1024;
    v24 = trackDeletes;
    v25 = 1024;
    v26 = trackUpdates;
    v27 = 1024;
    v28 = playlistAdds;
    v29 = 1024;
    v30 = playlistDeletes;
    v31 = 1024;
    v32 = playlistUpdates;
    v33 = 1024;
    v34 = artistAdds;
    v35 = 1024;
    v36 = artistUpdates;
    v37 = 1024;
    v38 = albumUpdates;
    v39 = 2048;
    v40 = v13;
    _os_log_impl(&dword_1AC149000, v5, OS_LOG_TYPE_DEFAULT, "finished export session: %d bytes, %d add_tracks, %d delete_tracks, %d update_tracks, %d add_playlists, %d delete_playlists, %d update_playlists, %d add_artists, %d update_artists, %d update_albums in %.2f seconds", buf, 0x48u);
  }

  return v4;
}

- (id)exportTrackAdded:(unint64_t)a3
{
  MSPMediaSyncPackage *v5;
  MSPMediaSyncOperation *v6;
  ML3Track *v7;
  void *v8;
  ML3Track *v9;
  void *v10;
  void *v11;
  void *v12;

  ++self->_stats.trackAdds;
  v5 = objc_alloc_init(MSPMediaSyncPackage);
  -[MSPMediaSyncPackage setType:](v5, "setType:", 4);
  v6 = objc_alloc_init(MSPMediaSyncOperation);
  -[MSPMediaSyncOperation setOperationType:](v6, "setOperationType:", 1);
  v7 = [ML3Track alloc];
  -[ML3ExportSession library](self, "library");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ML3Entity initWithPersistentID:inLibrary:](v7, "initWithPersistentID:inLibrary:", a3, v8);

  -[ML3Track protocolItem](v9, "protocolItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPMediaSyncOperation setMediaItem:](v6, "setMediaItem:", v10);

  -[ML3Track multiverseIdentifierLibraryOnly:](v9, "multiverseIdentifierLibraryOnly:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPMediaSyncOperation setMultiverseId:](v6, "setMultiverseId:", v11);

  -[MSPMediaSyncPackage setSyncOperation:](v5, "setSyncOperation:", v6);
  -[ML3ProtoSyncExportSession _writSyncPackageToStream:](self, "_writSyncPackageToStream:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)exportTrackUpdated:(unint64_t)a3
{
  MSPMediaSyncPackage *v5;
  MSPMediaSyncOperation *v6;
  ML3Track *v7;
  void *v8;
  ML3Track *v9;
  void *v10;
  void *v11;
  void *v12;

  ++self->_stats.trackUpdates;
  v5 = objc_alloc_init(MSPMediaSyncPackage);
  -[MSPMediaSyncPackage setType:](v5, "setType:", 4);
  v6 = objc_alloc_init(MSPMediaSyncOperation);
  -[MSPMediaSyncOperation setOperationType:](v6, "setOperationType:", 2);
  v7 = [ML3Track alloc];
  -[ML3ExportSession library](self, "library");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ML3Entity initWithPersistentID:inLibrary:](v7, "initWithPersistentID:inLibrary:", a3, v8);

  -[ML3Track protocolItemForDynamicUpdate](v9, "protocolItemForDynamicUpdate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPMediaSyncOperation setMediaItem:](v6, "setMediaItem:", v10);

  -[ML3Track multiverseIdentifierLibraryOnly:](v9, "multiverseIdentifierLibraryOnly:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPMediaSyncOperation setMultiverseId:](v6, "setMultiverseId:", v11);

  -[MSPMediaSyncPackage setSyncOperation:](v5, "setSyncOperation:", v6);
  -[ML3ProtoSyncExportSession _writSyncPackageToStream:](self, "_writSyncPackageToStream:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)exportTrackDeleted:(unint64_t)a3
{
  MSPMediaSyncPackage *v5;
  MSPMediaSyncOperation *v6;
  ML3Track *v7;
  void *v8;
  ML3Track *v9;
  void *v10;
  void *v11;

  ++self->_stats.trackDeletes;
  v5 = objc_alloc_init(MSPMediaSyncPackage);
  -[MSPMediaSyncPackage setType:](v5, "setType:", 4);
  v6 = objc_alloc_init(MSPMediaSyncOperation);
  -[MSPMediaSyncOperation setOperationType:](v6, "setOperationType:", 3);
  v7 = [ML3Track alloc];
  -[ML3ExportSession library](self, "library");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ML3Entity initWithPersistentID:inLibrary:](v7, "initWithPersistentID:inLibrary:", a3, v8);

  -[ML3Track multiverseIdentifierLibraryOnly:](v9, "multiverseIdentifierLibraryOnly:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPMediaSyncOperation setMultiverseId:](v6, "setMultiverseId:", v10);

  -[MSPMediaSyncPackage setSyncOperation:](v5, "setSyncOperation:", v6);
  -[ML3ProtoSyncExportSession _writSyncPackageToStream:](self, "_writSyncPackageToStream:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)exportPlaylistAdded:(unint64_t)a3
{
  MSPMediaSyncPackage *v5;
  MSPMediaSyncOperation *v6;
  ML3Container *v7;
  void *v8;
  ML3Container *v9;
  void *v10;
  void *v11;
  void *v12;

  ++self->_stats.playlistAdds;
  v5 = objc_alloc_init(MSPMediaSyncPackage);
  -[MSPMediaSyncPackage setType:](v5, "setType:", 4);
  v6 = objc_alloc_init(MSPMediaSyncOperation);
  -[MSPMediaSyncOperation setOperationType:](v6, "setOperationType:", 1);
  v7 = [ML3Container alloc];
  -[ML3ExportSession library](self, "library");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ML3Entity initWithPersistentID:inLibrary:](v7, "initWithPersistentID:inLibrary:", a3, v8);

  -[ML3Container protocolItem](v9, "protocolItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPMediaSyncOperation setPlaylist:](v6, "setPlaylist:", v10);

  -[ML3Container multiverseIdentifier](v9, "multiverseIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPMediaSyncOperation setMultiverseId:](v6, "setMultiverseId:", v11);

  -[MSPMediaSyncPackage setSyncOperation:](v5, "setSyncOperation:", v6);
  -[ML3ProtoSyncExportSession _writSyncPackageToStream:](self, "_writSyncPackageToStream:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)exportPlaylistDeleted:(unint64_t)a3
{
  MSPMediaSyncPackage *v5;
  MSPMediaSyncOperation *v6;
  ML3Container *v7;
  void *v8;
  ML3Container *v9;
  void *v10;
  void *v11;

  ++self->_stats.playlistDeletes;
  v5 = objc_alloc_init(MSPMediaSyncPackage);
  -[MSPMediaSyncPackage setType:](v5, "setType:", 4);
  v6 = objc_alloc_init(MSPMediaSyncOperation);
  -[MSPMediaSyncOperation setOperationType:](v6, "setOperationType:", 3);
  v7 = [ML3Container alloc];
  -[ML3ExportSession library](self, "library");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ML3Entity initWithPersistentID:inLibrary:](v7, "initWithPersistentID:inLibrary:", a3, v8);

  -[ML3Container multiverseIdentifier](v9, "multiverseIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPMediaSyncOperation setMultiverseId:](v6, "setMultiverseId:", v10);

  -[MSPMediaSyncPackage setSyncOperation:](v5, "setSyncOperation:", v6);
  -[ML3ProtoSyncExportSession _writSyncPackageToStream:](self, "_writSyncPackageToStream:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)exportPlaylistUpdated:(unint64_t)a3
{
  MSPMediaSyncPackage *v5;
  MSPMediaSyncOperation *v6;
  ML3Container *v7;
  void *v8;
  ML3Container *v9;
  void *v10;
  void *v11;
  void *v12;

  ++self->_stats.playlistUpdates;
  v5 = objc_alloc_init(MSPMediaSyncPackage);
  -[MSPMediaSyncPackage setType:](v5, "setType:", 4);
  v6 = objc_alloc_init(MSPMediaSyncOperation);
  -[MSPMediaSyncOperation setOperationType:](v6, "setOperationType:", 2);
  v7 = [ML3Container alloc];
  -[ML3ExportSession library](self, "library");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ML3Entity initWithPersistentID:inLibrary:](v7, "initWithPersistentID:inLibrary:", a3, v8);

  -[ML3Container protocolItemForDynamicUpdate](v9, "protocolItemForDynamicUpdate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPMediaSyncOperation setPlaylist:](v6, "setPlaylist:", v10);

  -[ML3Container multiverseIdentifier](v9, "multiverseIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPMediaSyncOperation setMultiverseId:](v6, "setMultiverseId:", v11);

  -[MSPMediaSyncPackage setSyncOperation:](v5, "setSyncOperation:", v6);
  -[ML3ProtoSyncExportSession _writSyncPackageToStream:](self, "_writSyncPackageToStream:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)exportAlbumArtistAdded:(unint64_t)a3
{
  MSPMediaSyncPackage *v5;
  MSPMediaSyncOperation *v6;
  ML3AlbumArtist *v7;
  void *v8;
  ML3AlbumArtist *v9;
  void *v10;
  void *v11;
  void *v12;

  ++self->_stats.artistAdds;
  v5 = objc_alloc_init(MSPMediaSyncPackage);
  -[MSPMediaSyncPackage setType:](v5, "setType:", 4);
  v6 = objc_alloc_init(MSPMediaSyncOperation);
  -[MSPMediaSyncOperation setOperationType:](v6, "setOperationType:", 1);
  v7 = [ML3AlbumArtist alloc];
  -[ML3ExportSession library](self, "library");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ML3Entity initWithPersistentID:inLibrary:](v7, "initWithPersistentID:inLibrary:", a3, v8);

  -[ML3AlbumArtist protocolItem](v9, "protocolItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPMediaSyncOperation setArtist:](v6, "setArtist:", v10);

  -[ML3AlbumArtist multiverseIdentifier](v9, "multiverseIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPMediaSyncOperation setMultiverseId:](v6, "setMultiverseId:", v11);

  -[MSPMediaSyncPackage setSyncOperation:](v5, "setSyncOperation:", v6);
  -[ML3ProtoSyncExportSession _writSyncPackageToStream:](self, "_writSyncPackageToStream:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)exportAlbumArtistDeleted:(unint64_t)a3
{
  MSPMediaSyncPackage *v5;
  MSPMediaSyncOperation *v6;
  ML3AlbumArtist *v7;
  void *v8;
  ML3AlbumArtist *v9;
  void *v10;
  void *v11;
  void *v12;

  ++self->_stats.artistUpdates;
  v5 = objc_alloc_init(MSPMediaSyncPackage);
  -[MSPMediaSyncPackage setType:](v5, "setType:", 4);
  v6 = objc_alloc_init(MSPMediaSyncOperation);
  -[MSPMediaSyncOperation setOperationType:](v6, "setOperationType:", 3);
  v7 = [ML3AlbumArtist alloc];
  -[ML3ExportSession library](self, "library");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ML3Entity initWithPersistentID:inLibrary:](v7, "initWithPersistentID:inLibrary:", a3, v8);

  -[ML3AlbumArtist protocolItem](v9, "protocolItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPMediaSyncOperation setArtist:](v6, "setArtist:", v10);

  -[ML3AlbumArtist multiverseIdentifier](v9, "multiverseIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPMediaSyncOperation setMultiverseId:](v6, "setMultiverseId:", v11);

  -[MSPMediaSyncPackage setSyncOperation:](v5, "setSyncOperation:", v6);
  -[ML3ProtoSyncExportSession _writSyncPackageToStream:](self, "_writSyncPackageToStream:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)exportAlbumArtistUpdated:(unint64_t)a3
{
  MSPMediaSyncPackage *v5;
  MSPMediaSyncOperation *v6;
  ML3AlbumArtist *v7;
  void *v8;
  ML3AlbumArtist *v9;
  void *v10;
  void *v11;
  void *v12;

  ++self->_stats.artistUpdates;
  v5 = objc_alloc_init(MSPMediaSyncPackage);
  -[MSPMediaSyncPackage setType:](v5, "setType:", 4);
  v6 = objc_alloc_init(MSPMediaSyncOperation);
  -[MSPMediaSyncOperation setOperationType:](v6, "setOperationType:", 2);
  v7 = [ML3AlbumArtist alloc];
  -[ML3ExportSession library](self, "library");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ML3Entity initWithPersistentID:inLibrary:](v7, "initWithPersistentID:inLibrary:", a3, v8);

  -[ML3AlbumArtist protocolItem](v9, "protocolItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPMediaSyncOperation setArtist:](v6, "setArtist:", v10);

  -[ML3AlbumArtist multiverseIdentifier](v9, "multiverseIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPMediaSyncOperation setMultiverseId:](v6, "setMultiverseId:", v11);

  -[MSPMediaSyncPackage setSyncOperation:](v5, "setSyncOperation:", v6);
  -[ML3ProtoSyncExportSession _writSyncPackageToStream:](self, "_writSyncPackageToStream:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)exportAlbumUpdated:(unint64_t)a3
{
  MSPMediaSyncPackage *v5;
  MSPMediaSyncOperation *v6;
  ML3Album *v7;
  void *v8;
  ML3Album *v9;
  void *v10;
  void *v11;
  void *v12;

  ++self->_stats.albumUpdates;
  v5 = objc_alloc_init(MSPMediaSyncPackage);
  -[MSPMediaSyncPackage setType:](v5, "setType:", 4);
  v6 = objc_alloc_init(MSPMediaSyncOperation);
  -[MSPMediaSyncOperation setOperationType:](v6, "setOperationType:", 2);
  v7 = [ML3Album alloc];
  -[ML3ExportSession library](self, "library");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ML3Entity initWithPersistentID:inLibrary:](v7, "initWithPersistentID:inLibrary:", a3, v8);

  -[ML3Album protocolItem](v9, "protocolItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPMediaSyncOperation setAlbum:](v6, "setAlbum:", v10);

  -[ML3Album multiverseIdentifier](v9, "multiverseIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPMediaSyncOperation setMultiverseId:](v6, "setMultiverseId:", v11);

  -[MSPMediaSyncPackage setSyncOperation:](v5, "setSyncOperation:", v6);
  -[ML3ProtoSyncExportSession _writSyncPackageToStream:](self, "_writSyncPackageToStream:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_writSyncPackageToStream:(id)a3
{
  void *v4;
  void *v5;
  MSVStreamWriter *streamWriter;
  char v7;
  id v8;
  MSVStreamWriter *v9;
  char v10;
  id v11;
  NSObject *v12;
  int v13;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  _BYTE v19[10];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "length");
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v19, PBDataWriterWriteBareVarint(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  streamWriter = self->_streamWriter;
  v16 = 0;
  v7 = -[MSVStreamWriter writeAllData:error:](streamWriter, "writeAllData:error:", v5, &v16);
  v8 = v16;
  if ((v7 & 1) == 0)
  {
    v12 = os_log_create("com.apple.amp.medialibrary", "SyncData");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v18 = v8;
      _os_log_impl(&dword_1AC149000, v12, OS_LOG_TYPE_ERROR, "failed to write package len. err=%{public}@", buf, 0xCu);
    }
    goto LABEL_8;
  }
  v9 = self->_streamWriter;
  v15 = v8;
  v10 = -[MSVStreamWriter writeAllData:error:](v9, "writeAllData:error:", v4, &v15);
  v11 = v15;

  if ((v10 & 1) == 0)
  {
    v12 = os_log_create("com.apple.amp.medialibrary", "SyncData");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v18 = v11;
      _os_log_impl(&dword_1AC149000, v12, OS_LOG_TYPE_ERROR, "failed to write package data. err=%{public}@", buf, 0xCu);
    }
    v8 = v11;
LABEL_8:

    v11 = v8;
  }
  v13 = objc_msgSend(v5, "length");
  self->_stats.totalSize += objc_msgSend(v4, "length") + v13;

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamWriter, 0);
  objc_storeStrong((id *)&self->_libraryUUID, 0);
}

@end
