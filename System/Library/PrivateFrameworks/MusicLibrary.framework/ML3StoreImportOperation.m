@implementation ML3StoreImportOperation

- (unint64_t)importSource
{
  return 6;
}

- (void)main
{
  double v3;
  double v4;
  NSObject *v5;
  int v6;
  int v7;
  double v8;
  uint64_t v9;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  uint8_t buf[4];
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 1;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v4 = v3;
  if (*((_BYTE *)v12 + 24) && (-[ML3StoreImportOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __31__ML3StoreImportOperation_main__block_invoke;
    v10[3] = &unk_1E5B65CC8;
    v10[4] = self;
    v10[5] = &v11;
    -[ML3ImportOperation _writerTransactionWithBlock:](self, "_writerTransactionWithBlock:", v10);
  }
  v5 = os_log_create("com.apple.amp.medialibrary", "Import");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = -[ML3StoreImportOperation isCancelled](self, "isCancelled");
    v7 = *((unsigned __int8 *)v12 + 24);
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    *(_DWORD *)buf = 67109632;
    v16 = v6;
    v17 = 1024;
    v18 = v7;
    v19 = 2048;
    v20 = v8 - v4;
    _os_log_impl(&dword_1AC149000, v5, OS_LOG_TYPE_DEBUG, "[ML3StoreImportOperation] [ML3StoreImportOperation] import operation cancelled=%d success=%d. total time = %.2fs", buf, 0x18u);
  }

  if (*((_BYTE *)v12 + 24))
    v9 = -[ML3StoreImportOperation isCancelled](self, "isCancelled") ^ 1;
  else
    v9 = 0;
  -[ML3ImportOperation setSuccess:](self, "setSuccess:", v9);
  _Block_object_dispose(&v11, 8);
}

- (BOOL)_performImportWithTransaction:(id)a3
{
  id v4;
  ML3StoreItemTrackData *v5;
  void *v6;
  void *v7;
  ML3StoreItemTrackData *v8;
  ML3StoreItemTrackData *trackData;
  ML3StoreItemPlaylistData *v10;
  void *v11;
  void *v12;
  ML3StoreItemPlaylistData *v13;
  ML3StoreItemPlaylistData *playlistData;
  ML3StoreItemAlbumArtistData *v15;
  void *v16;
  void *v17;
  ML3StoreItemAlbumArtistData *v18;
  ML3StoreItemAlbumArtistData *albumArtistData;
  void *v20;
  void *v21;
  int v22;
  int v23;
  void *v24;
  uint64_t v25;
  ML3DatabaseConnection *v26;
  NSObject *v27;
  NSObject *v28;
  BOOL v29;
  NSObject *v30;
  BOOL v31;
  NSObject *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  const char *v38;
  BOOL v39;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint8_t buf[16];
  id v49[340];

  v4 = a3;
  v5 = [ML3StoreItemTrackData alloc];
  -[ML3ImportOperation import](self, "import");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trackData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ML3StoreItemTrackData initWithTrackData:](v5, "initWithTrackData:", v7);
  trackData = self->_trackData;
  self->_trackData = v8;

  v10 = [ML3StoreItemPlaylistData alloc];
  -[ML3ImportOperation import](self, "import");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "playlistData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[ML3StoreItemPlaylistData initWithPlaylistsData:](v10, "initWithPlaylistsData:", v12);
  playlistData = self->_playlistData;
  self->_playlistData = v13;

  v15 = [ML3StoreItemAlbumArtistData alloc];
  -[ML3ImportOperation import](self, "import");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "albumArtistData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[ML3StoreItemAlbumArtistData initWithAlbumArtistData:](v15, "initWithAlbumArtistData:", v17);
  albumArtistData = self->_albumArtistData;
  self->_albumArtistData = v18;

  -[ML3ImportOperation import](self, "import");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v20, "tracksAreLibraryOwnedContent") & 1) != 0)
  {
    -[ML3ImportOperation import](self, "import");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isPendingMatch");

    if (v22)
      v23 = 6;
    else
      v23 = 5;
  }
  else
  {

    v23 = 6;
  }
  -[ML3ImportOperation import](self, "import");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "library");
  v25 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "connection");
  v26 = (ML3DatabaseConnection *)objc_claimAutoreleasedReturnValue();
  ML3ImportSession::ML3ImportSession((ML3ImportSession *)v49, (ML3MusicLibrary *)v25, v26, v23, 1);

  LOBYTE(v25) = ML3ImportSession::begin((ML3ImportSession *)v49, -[ML3StoreItemPlaylistData playlistCount](self->_playlistData, "playlistCount")+ -[ML3StoreItemTrackData trackCount](self->_trackData, "trackCount")+ -[ML3StoreItemAlbumArtistData albumArtistCount](self->_albumArtistData, "albumArtistCount"), 0, 0);
  v27 = os_log_create("com.apple.amp.medialibrary", "Import");
  v28 = v27;
  if ((v25 & 1) == 0)
  {
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      goto LABEL_30;
    *(_WORD *)buf = 0;
    v38 = "[ML3StoreImportOperation] failed to begin import session";
LABEL_29:
    _os_log_impl(&dword_1AC149000, v28, OS_LOG_TYPE_ERROR, v38, buf, 2u);
    goto LABEL_30;
  }
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AC149000, v28, OS_LOG_TYPE_DEBUG, "[ML3StoreImportOperation] importing artist data", buf, 2u);
  }

  v29 = -[ML3StoreImportOperation _importAlbumArtistsUsingImportSession:](self, "_importAlbumArtistsUsingImportSession:", v49);
  v30 = os_log_create("com.apple.amp.medialibrary", "Import");
  v28 = v30;
  if (!v29)
  {
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      goto LABEL_30;
    *(_WORD *)buf = 0;
    v38 = "[ML3StoreImportOperation] failed to import artist data.";
    goto LABEL_29;
  }
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AC149000, v28, OS_LOG_TYPE_DEBUG, "[ML3StoreImportOperation] importing track data", buf, 2u);
  }

  v31 = -[ML3StoreImportOperation _importTracksUsingImportSession:](self, "_importTracksUsingImportSession:", v49);
  v32 = os_log_create("com.apple.amp.medialibrary", "Import");
  v28 = v32;
  if (!v31)
  {
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      goto LABEL_30;
    *(_WORD *)buf = 0;
    v38 = "[ML3StoreImportOperation] failed to import track data.";
    goto LABEL_29;
  }
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AC149000, v28, OS_LOG_TYPE_DEBUG, "[ML3StoreImportOperation] importing playlist data", buf, 2u);
  }

  if (!-[ML3StoreImportOperation _importPlaylistsUsingImportSession:](self, "_importPlaylistsUsingImportSession:", v49))
  {
    v28 = os_log_create("com.apple.amp.medialibrary", "Import");
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      goto LABEL_30;
    *(_WORD *)buf = 0;
    v38 = "[ML3StoreImportOperation] failed to import playlist data.";
    goto LABEL_29;
  }
  if (ML3ImportSession::flush((ML3ImportSession *)v49, 1))
  {
    ML3ImportSession::_finishImport(v49);
    -[ML3ImportOperation returnData](self, "returnData");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      v34 = (void *)MEMORY[0x1E0C99E60];
      v35 = objc_opt_class();
      objc_msgSend(v34, "setWithObjects:", v35, objc_opt_class(), 0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[ML3ImportOperation returnData](self, "returnData");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      MSVUnarchivedObjectOfClasses();
      v28 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v28 = MEMORY[0x1E0C9AA60];
    }

    -[ML3ImportOperation import](self, "import");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v41, "tracksAreLibraryOwnedContent"))
    {
      -[ML3ImportOperation import](self, "import");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v42, "isPendingMatch"))
      {
        v43 = -[NSObject count](v28, "count");

        if (!v43)
        {
LABEL_39:
          v39 = 1;
          goto LABEL_31;
        }
        +[ML3DatabaseStatementRenderer defaultRenderer](ML3DatabaseStatementRenderer, "defaultRenderer");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "statementWithPrefix:inParameterCount:", CFSTR("UPDATE item_store SET cloud_in_my_library = 1 WHERE item_pid"), -[NSObject count](v28, "count"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "connection");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "executeUpdate:withParameters:error:", v41, v28, 0);

        +[ML3DatabaseStatementRenderer defaultRenderer](ML3DatabaseStatementRenderer, "defaultRenderer");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "statementWithPrefix:inParameterCount:", CFSTR("UPDATE item SET in_my_library = 1 WHERE item_pid"), -[NSObject count](v28, "count"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "connection");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "executeUpdate:withParameters:error:", v42, v28, 0);

      }
    }

    goto LABEL_39;
  }
  v28 = os_log_create("com.apple.amp.medialibrary", "Import");
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v38 = "[ML3StoreImportOperation] failed to commit the import session changes";
    goto LABEL_29;
  }
LABEL_30:
  v39 = 0;
LABEL_31:

  ML3ImportSession::~ML3ImportSession((ML3ImportSession *)v49);
  return v39;
}

- (BOOL)_importTracksUsingImportSession:(void *)a3
{
  unint64_t v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  unint64_t v21;
  int v22;
  unint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  NSObject *v27;
  NSObject *v28;
  int v29;
  unint64_t v30;
  int v31;
  unint64_t v32;
  ML3StoreItemArtistData *v33;
  void *v34;
  void *v35;
  void *v36;
  std::__shared_weak_count *v37;
  unint64_t *v38;
  unint64_t v39;
  std::__shared_weak_count *v40;
  unint64_t *v41;
  unint64_t v42;
  unint64_t *v43;
  unint64_t v44;
  std::__shared_weak_count *v45;
  unint64_t *v46;
  unint64_t v47;
  std::__shared_weak_count *v48;
  unint64_t *v49;
  unint64_t v50;
  int v51;
  NSObject *v52;
  _BOOL4 v53;
  ML3StoreItemAlbumData *v54;
  void *v55;
  void *v56;
  void *v57;
  _QWORD *v58;
  unint64_t *v59;
  id v60;
  id v61;
  unint64_t v62;
  std::__shared_weak_count *v63;
  unint64_t *v64;
  unint64_t v65;
  unint64_t *v66;
  unint64_t v67;
  std::__shared_weak_count *v68;
  unint64_t *v69;
  unint64_t v70;
  std::__shared_weak_count *v71;
  unint64_t *v72;
  unint64_t v73;
  NSObject *v74;
  const char *v75;
  uint32_t v76;
  char v77;
  std::__shared_weak_count *v78;
  unint64_t *v79;
  unint64_t v80;
  std::__shared_weak_count *v81;
  unint64_t *v82;
  unint64_t v83;
  std::__shared_weak_count *v84;
  unint64_t *v85;
  unint64_t v86;
  int v87;
  unint64_t *v88;
  unint64_t v89;
  NSObject *v90;
  BOOL v91;
  void *v93;
  void *v94;
  ML3StoreItemAlbumArtistData *v95;
  void *v96;
  NSObject *obj;
  uint64_t v99;
  uint64_t v100;
  int v101;
  void *context;
  NSDictionary *v103;
  uint64_t v105[2];
  __int128 v106;
  __int128 v107;
  _QWORD *v108;
  std::__shared_weak_count *v109;
  __int128 v110;
  _QWORD *v111;
  std::__shared_weak_count *v112;
  _QWORD v113[2];
  _QWORD *v114;
  std::__shared_weak_count *v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  uint8_t buf[24];
  _BYTE v123[128];
  uint64_t v124;

  v124 = *MEMORY[0x1E0C80C00];
  v3 = -[ML3StoreItemTrackData trackCount](self->_trackData, "trackCount");
  v4 = os_log_create("com.apple.amp.medialibrary", "Import");
  v5 = v4;
  if (!v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AC149000, v5, OS_LOG_TYPE_ERROR, "[ML3StoreImportOperation] no tracks in store payload. skipping track import.", buf, 2u);
    }
    v91 = 1;
    goto LABEL_144;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v3;
    _os_log_impl(&dword_1AC149000, v5, OS_LOG_TYPE_DEBUG, "[ML3StoreImportOperation] found %lu tracks to import", buf, 0xCu);
  }

  -[ML3StoreItemTrackData parsedStoreItemsImportProperties](self->_trackData, "parsedStoreItemsImportProperties");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = *((_DWORD *)a3 + 8);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v3);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = 0u;
  v119 = 0u;
  v116 = 0u;
  v117 = 0u;
  v6 = v93;
  obj = v6;
  v7 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v116, v123, 16);
  if (!v7)
  {

    goto LABEL_140;
  }
  LOBYTE(v8) = 0;
  v100 = *(_QWORD *)v117;
  do
  {
    v9 = 0;
    v99 = v7;
    do
    {
      if (*(_QWORD *)v117 != v100)
        objc_enumerationMutation(obj);
      v103 = *(NSDictionary **)(*((_QWORD *)&v116 + 1) + 8 * v9);
      context = (void *)MEMORY[0x1AF43CC0C]();
      v10 = (std::__shared_weak_count *)operator new(0x68uLL);
      v10->__shared_owners_ = 0;
      p_shared_owners = (unint64_t *)&v10->__shared_owners_;
      v10->__shared_weak_owners_ = 0;
      v10->__vftable = (std::__shared_weak_count_vtbl *)&off_1E5B51420;
      ML3StoreImportItem::ML3StoreImportItem((ML3StoreImportItem *)&v10[1], v103, v101);
      *(_QWORD *)buf = v10 + 1;
      *(_QWORD *)&buf[8] = v10;
      v12 = ((uint64_t (*)(void))v10[1].__on_zero_shared)();
      -[ML3ImportOperation import](self, "import");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      BYTE2(v10[1].__shared_weak_owners_) = objc_msgSend(v13, "tracksAreLibraryOwnedContent");

      -[ML3ImportOperation import](self, "import");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      BYTE4(v10[4].__vftable) = objc_msgSend(v14, "isPendingMatch");

      if (!v12)
      {
        v28 = os_log_create("com.apple.amp.medialibrary", "Import");
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          LODWORD(v121) = 138543362;
          *(_QWORD *)((char *)&v121 + 4) = v103;
          _os_log_impl(&dword_1AC149000, v28, OS_LOG_TYPE_ERROR, "[ML3StoreImportOperation] Skipping invalid track with properties=%{public}@", (uint8_t *)&v121, 0xCu);
        }
LABEL_29:

LABEL_30:
        v29 = 0;
        goto LABEL_109;
      }
      if (_os_feature_enabled_impl())
      {
        v95 = -[ML3StoreItemAlbumArtistData initWithTrackItemImportProperties:]([ML3StoreItemAlbumArtistData alloc], "initWithTrackItemImportProperties:", v103);
        -[ML3StoreItemAlbumArtistData parsedStoreAlbumArtistImportProperties](v95, "parsedStoreAlbumArtistImportProperties");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "objectAtIndexedSubscript:", 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[ML3ImportOperation import](self, "import");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "library");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (std::__shared_weak_count *)operator new(0x78uLL);
        v18->__shared_owners_ = 0;
        v19 = (unint64_t *)&v18->__shared_owners_;
        v18->__shared_weak_owners_ = 0;
        v18->__vftable = (std::__shared_weak_count_vtbl *)&off_1E5B51538;
        ML3StoreArtistImportItem::ML3StoreArtistImportItem((uint64_t)&v18[1], v15, v101, 7, v17);
        *(_QWORD *)&v121 = v18 + 1;
        *((_QWORD *)&v121 + 1) = v18;

        v114 = &v18[1].__vftable;
        v115 = v18;
        do
          v20 = __ldxr(v19);
        while (__stxr(v20 + 1, v19));
        v113[0] = v10 + 1;
        v113[1] = v10;
        do
          v21 = __ldxr(p_shared_owners);
        while (__stxr(v21 + 1, p_shared_owners));
        v22 = ML3ImportSession::addAlbumArtist((uint64_t)a3, (uint64_t *)&v114, v113);
        do
          v23 = __ldaxr(p_shared_owners);
        while (__stlxr(v23 - 1, p_shared_owners));
        if (!v23)
        {
          ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
          std::__shared_weak_count::__release_weak(v10);
        }
        v24 = v115;
        if (v115)
        {
          v25 = (unint64_t *)&v115->__shared_owners_;
          do
            v26 = __ldaxr(v25);
          while (__stlxr(v26 - 1, v25));
          if (!v26)
          {
            ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
            std::__shared_weak_count::__release_weak(v24);
          }
        }
        if (-[ML3StoreImportOperation isCancelled](self, "isCancelled"))
        {
          v27 = os_log_create("com.apple.amp.medialibrary", "Import");
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            goto LABEL_98;
LABEL_100:
          v77 = 0;
          v29 = 4;
LABEL_101:

          v78 = (std::__shared_weak_count *)*((_QWORD *)&v121 + 1);
          if (*((_QWORD *)&v121 + 1))
          {
            v79 = (unint64_t *)(*((_QWORD *)&v121 + 1) + 8);
            do
              v80 = __ldaxr(v79);
            while (__stlxr(v80 - 1, v79));
            if (!v80)
            {
              ((void (*)(std::__shared_weak_count *))v78->__on_zero_shared)(v78);
              std::__shared_weak_count::__release_weak(v78);
            }
          }

          if ((v77 & 1) == 0)
          {
            LOBYTE(v8) = 0;
            goto LABEL_109;
          }
          LOBYTE(v8) = 1;
          goto LABEL_30;
        }
        if (v22)
        {
          v33 = -[ML3StoreItemArtistData initWithTrackImportItem:]([ML3StoreItemArtistData alloc], "initWithTrackImportItem:", v103);
          -[ML3StoreItemArtistData parsedStoreArtistItemImportProperties](v33, "parsedStoreArtistItemImportProperties");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[ML3ImportOperation import](self, "import");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "library");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = (std::__shared_weak_count *)operator new(0x78uLL);
          v37->__shared_owners_ = 0;
          v38 = (unint64_t *)&v37->__shared_owners_;
          v37->__shared_weak_owners_ = 0;
          v37->__vftable = (std::__shared_weak_count_vtbl *)&off_1E5B51538;
          ML3StoreArtistImportItem::ML3StoreArtistImportItem((uint64_t)&v37[1], v34, v101, 2, v36);
          *(_QWORD *)&v120 = v37 + 1;
          *((_QWORD *)&v120 + 1) = v37;

          v111 = &v37[1].__vftable;
          v112 = v37;
          do
            v39 = __ldxr(v38);
          while (__stxr(v39 + 1, v38));
          v40 = *(std::__shared_weak_count **)&buf[8];
          v110 = *(_OWORD *)buf;
          if (*(_QWORD *)&buf[8])
          {
            v41 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
            do
              v42 = __ldxr(v41);
            while (__stxr(v42 + 1, v41));
          }
          v22 = ML3ImportSession::addItemArtist((uint64_t)a3, &v111, &v110);
          if (v40)
          {
            v43 = (unint64_t *)&v40->__shared_owners_;
            do
              v44 = __ldaxr(v43);
            while (__stlxr(v44 - 1, v43));
            if (!v44)
            {
              ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
              std::__shared_weak_count::__release_weak(v40);
            }
          }
          v45 = v112;
          if (v112)
          {
            v46 = (unint64_t *)&v112->__shared_owners_;
            do
              v47 = __ldaxr(v46);
            while (__stlxr(v47 - 1, v46));
            if (!v47)
            {
              ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
              std::__shared_weak_count::__release_weak(v45);
            }
          }
          v48 = (std::__shared_weak_count *)*((_QWORD *)&v120 + 1);
          if (*((_QWORD *)&v120 + 1))
          {
            v49 = (unint64_t *)(*((_QWORD *)&v120 + 1) + 8);
            do
              v50 = __ldaxr(v49);
            while (__stlxr(v50 - 1, v49));
            if (!v50)
            {
              ((void (*)(std::__shared_weak_count *))v48->__on_zero_shared)(v48);
              std::__shared_weak_count::__release_weak(v48);
            }
          }

        }
        if (-[ML3StoreImportOperation isCancelled](self, "isCancelled"))
        {
          v27 = os_log_create("com.apple.amp.medialibrary", "Import");
          if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            goto LABEL_100;
          goto LABEL_98;
        }
        if (v22)
        {
          v54 = -[ML3StoreItemAlbumData initWithTrackImportItem:]([ML3StoreItemAlbumData alloc], "initWithTrackImportItem:", v103);
          -[ML3StoreItemAlbumData parsedStoreAlbumImportProperties](v54, "parsedStoreAlbumImportProperties");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          -[ML3ImportOperation import](self, "import");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "library");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = operator new(0x68uLL);
          v58[1] = 0;
          v59 = v58 + 1;
          v58[2] = 0;
          *v58 = &off_1E5B514C8;
          v60 = v55;
          v61 = v57;
          v58[3] = &off_1E5B4E130;
          v58[4] = 0;
          *((_WORD *)v58 + 20) = 256;
          *((_BYTE *)v58 + 42) = 1;
          *((_OWORD *)v58 + 3) = 0u;
          *((_OWORD *)v58 + 4) = 0u;
          *((_DWORD *)v58 + 20) = 1065353216;
          v58[11] = objc_msgSend(v60, "copy");
          v58[12] = v61;

          *(_QWORD *)&v120 = v58 + 3;
          *((_QWORD *)&v120 + 1) = v58;

          v108 = v58 + 3;
          v109 = (std::__shared_weak_count *)v58;
          do
            v62 = __ldxr(v59);
          while (__stxr(v62 + 1, v59));
          v63 = *(std::__shared_weak_count **)&buf[8];
          v107 = *(_OWORD *)buf;
          if (*(_QWORD *)&buf[8])
          {
            v64 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
            do
              v65 = __ldxr(v64);
            while (__stxr(v65 + 1, v64));
          }
          v22 = ML3ImportSession::addAlbum((uint64_t)a3, (uint64_t *)&v108, &v107, *(_QWORD *)(v121 + 8));
          if (v63)
          {
            v66 = (unint64_t *)&v63->__shared_owners_;
            do
              v67 = __ldaxr(v66);
            while (__stlxr(v67 - 1, v66));
            if (!v67)
            {
              ((void (*)(std::__shared_weak_count *))v63->__on_zero_shared)(v63);
              std::__shared_weak_count::__release_weak(v63);
            }
          }
          v68 = v109;
          if (v109)
          {
            v69 = (unint64_t *)&v109->__shared_owners_;
            do
              v70 = __ldaxr(v69);
            while (__stlxr(v70 - 1, v69));
            if (!v70)
            {
              ((void (*)(std::__shared_weak_count *))v68->__on_zero_shared)(v68);
              std::__shared_weak_count::__release_weak(v68);
            }
          }
          v71 = (std::__shared_weak_count *)*((_QWORD *)&v120 + 1);
          if (*((_QWORD *)&v120 + 1))
          {
            v72 = (unint64_t *)(*((_QWORD *)&v120 + 1) + 8);
            do
              v73 = __ldaxr(v72);
            while (__stlxr(v73 - 1, v72));
            if (!v73)
            {
              ((void (*)(std::__shared_weak_count *))v71->__on_zero_shared)(v71);
              std::__shared_weak_count::__release_weak(v71);
            }
          }

        }
        if (-[ML3StoreImportOperation isCancelled](self, "isCancelled"))
        {
          v27 = os_log_create("com.apple.amp.medialibrary", "Import");
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            goto LABEL_98;
          goto LABEL_100;
        }
        if (v22)
        {
          v84 = *(std::__shared_weak_count **)&buf[8];
          v106 = *(_OWORD *)buf;
          if (*(_QWORD *)&buf[8])
          {
            v85 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
            do
              v86 = __ldxr(v85);
            while (__stxr(v86 + 1, v85));
          }
          v87 = ML3ImportSession::addTrack((uint64_t)a3, (uint64_t *)&v106, 1);
          if (v84)
          {
            v88 = (unint64_t *)&v84->__shared_owners_;
            do
              v89 = __ldaxr(v88);
            while (__stlxr(v89 - 1, v88));
            if (!v89)
            {
              ((void (*)(std::__shared_weak_count *))v84->__on_zero_shared)(v84);
              std::__shared_weak_count::__release_weak(v84);
            }
          }
          if (-[ML3StoreImportOperation isCancelled](self, "isCancelled"))
          {
            v27 = os_log_create("com.apple.amp.medialibrary", "Import");
            if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              goto LABEL_100;
LABEL_98:
            LOWORD(v120) = 0;
            v74 = v27;
            v75 = "[ML3StoreImportOperation] store import operation cancelled";
            v76 = 2;
LABEL_99:
            _os_log_impl(&dword_1AC149000, v74, OS_LOG_TYPE_ERROR, v75, (uint8_t *)&v120, v76);
            goto LABEL_100;
          }
          if (v87)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(*(_QWORD *)buf + 8));
            v27 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v94, "addObject:", v27);
            v29 = 0;
            v77 = 1;
            goto LABEL_101;
          }
        }
        v27 = os_log_create("com.apple.amp.medialibrary", "Import");
        if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          goto LABEL_100;
        LODWORD(v120) = 138543362;
        *(_QWORD *)((char *)&v120 + 4) = v103;
        v74 = v27;
        v75 = "[ML3StoreImportOperation] failed to import track data with properties=%{public}@";
        v76 = 12;
        goto LABEL_99;
      }
      v105[0] = (uint64_t)&v10[1];
      v105[1] = (uint64_t)v10;
      do
        v30 = __ldxr(p_shared_owners);
      while (__stxr(v30 + 1, p_shared_owners));
      v31 = ML3ImportSession::addTrack((uint64_t)a3, v105, 0);
      v8 = v31;
      do
        v32 = __ldaxr(p_shared_owners);
      while (__stlxr(v32 - 1, p_shared_owners));
      if (v32)
      {
        if (!v31)
          goto LABEL_65;
      }
      else
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
        if (!v8)
          goto LABEL_65;
      }
      if ((-[ML3StoreImportOperation isCancelled](self, "isCancelled") & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(*(_QWORD *)buf + 8));
        v28 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "addObject:", v28);
        LOBYTE(v8) = 1;
        goto LABEL_29;
      }
LABEL_65:
      v51 = -[ML3StoreImportOperation isCancelled](self, "isCancelled");
      v52 = os_log_create("com.apple.amp.medialibrary", "Import");
      v53 = os_log_type_enabled(v52, OS_LOG_TYPE_ERROR);
      if (v51)
      {
        if (v53)
        {
          LOWORD(v121) = 0;
          _os_log_impl(&dword_1AC149000, v52, OS_LOG_TYPE_ERROR, "[ML3StoreImportOperation] store import operation cancelled", (uint8_t *)&v121, 2u);
        }

        LOBYTE(v8) = 0;
      }
      else
      {
        if (v53)
        {
          LOWORD(v121) = 0;
          _os_log_impl(&dword_1AC149000, v52, OS_LOG_TYPE_ERROR, "[ML3StoreImportOperation] failed to import track data", (uint8_t *)&v121, 2u);
        }

      }
      v29 = 4;
LABEL_109:
      v81 = *(std::__shared_weak_count **)&buf[8];
      if (*(_QWORD *)&buf[8])
      {
        v82 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
        do
          v83 = __ldaxr(v82);
        while (__stlxr(v83 - 1, v82));
        if (!v83)
        {
          ((void (*)(std::__shared_weak_count *))v81->__on_zero_shared)(v81);
          std::__shared_weak_count::__release_weak(v81);
        }
      }
      objc_autoreleasePoolPop(context);
      if (v29)
        goto LABEL_134;
      ++v9;
    }
    while (v9 != v99);
    v7 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v116, v123, 16);
  }
  while (v7);
LABEL_134:

  if ((v8 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v94, 1, 0);
    v90 = objc_claimAutoreleasedReturnValue();
    -[ML3ImportOperation setReturnData:](self, "setReturnData:", v90);
    v91 = 1;
    goto LABEL_143;
  }
LABEL_140:
  v90 = os_log_create("com.apple.amp.medialibrary", "Import");
  if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AC149000, v90, OS_LOG_TYPE_ERROR, "[ML3StoreImportOperation] failed to import tracks", buf, 2u);
  }
  v91 = 0;
LABEL_143:

  v5 = obj;
LABEL_144:

  return v91;
}

- (BOOL)_importPlaylistsUsingImportSession:(void *)a3
{
  unint64_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  BOOL v10;
  uint64_t v11;
  uint64_t i;
  NSDictionary *v13;
  int v14;
  std::__shared_weak_count *v15;
  unint64_t *p_shared_owners;
  void *v17;
  unint64_t v18;
  int v19;
  int v20;
  unint64_t v21;
  NSObject *v22;
  unint64_t shared_owners;
  NSObject *v24;
  NSObject *v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  __int128 v30;
  NSObject *v31;
  id obj;
  uint64_t v34[2];
  std::__shared_weak_count *v35;
  std::__shared_weak_count *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  unint64_t v42;
  __int16 v43;
  NSObject *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = -[ML3StoreItemPlaylistData playlistCount](self->_playlistData, "playlistCount");
  v5 = os_log_create("com.apple.amp.medialibrary", "Import");
  v6 = v5;
  if (!v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AC149000, v6, OS_LOG_TYPE_ERROR, "[ML3StoreImportOperation] no playlists in store payload. skipping playlist import.", buf, 2u);
    }
    v10 = 1;
    goto LABEL_39;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v42 = v4;
    _os_log_impl(&dword_1AC149000, v6, OS_LOG_TYPE_DEBUG, "[ML3StoreImportOperation] found %lu playlists to import", buf, 0xCu);
  }

  -[ML3ImportOperation import](self, "import");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "library");
  v31 = objc_claimAutoreleasedReturnValue();

  -[ML3StoreItemPlaylistData parsedStorePlaylistsImportProperties](self->_playlistData, "parsedStorePlaylistsImportProperties");
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
  v10 = v8 != 0;
  if (!v8)
    goto LABEL_35;
  v11 = *(_QWORD *)v38;
  *(_QWORD *)&v9 = 134218242;
  v30 = v9;
  while (2)
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v38 != v11)
        objc_enumerationMutation(obj);
      v13 = *(NSDictionary **)(*((_QWORD *)&v37 + 1) + 8 * i);
      v14 = *((_DWORD *)a3 + 8);
      v15 = (std::__shared_weak_count *)operator new(0x68uLL);
      v15->__shared_owners_ = 0;
      p_shared_owners = (unint64_t *)&v15->__shared_owners_;
      v15->__shared_weak_owners_ = 0;
      v15->__vftable = (std::__shared_weak_count_vtbl *)&off_1E5B51570;
      ML3StoreImportItem::ML3StoreImportItem((ML3StoreImportItem *)&v15[1], v13, v14);
      v15[1].__vftable = (std::__shared_weak_count_vtbl *)&off_1E5B4EBE8;
      v35 = v15 + 1;
      v36 = v15;
      -[ML3ImportOperation import](self, "import");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      BYTE2(v15[1].__shared_weak_owners_) = objc_msgSend(v17, "playlistsAreLibraryOwnedContent");

      v34[0] = (uint64_t)&v15[1];
      v34[1] = (uint64_t)v15;
      do
        v18 = __ldxr(p_shared_owners);
      while (__stxr(v18 + 1, p_shared_owners));
      v19 = ML3ImportSession::addContainer((uint64_t)a3, v34);
      v20 = v19;
      do
        v21 = __ldaxr(p_shared_owners);
      while (__stlxr(v21 - 1, p_shared_owners));
      if (v21)
      {
        if ((v19 & 1) != 0)
          goto LABEL_15;
      }
      else
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
        if ((v20 & 1) != 0)
        {
LABEL_15:
          -[NSDictionary objectForKey:](v13, "objectForKey:", &unk_1E5BABD78, v30);
          v22 = objc_claimAutoreleasedReturnValue();
          if (-[NSObject length](v22, "length"))
          {
            shared_owners = v35->__shared_owners_;
            v24 = *((id *)a3 + 2);
            v25 = os_log_create("com.apple.amp.medialibrary", "Import");
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v30;
              v42 = shared_owners;
              v43 = 2112;
              v44 = v22;
              _os_log_impl(&dword_1AC149000, v25, OS_LOG_TYPE_DEBUG, "[ML3StoreImportOperation] importing artwork for container %lld using token %@", buf, 0x16u);
            }

            -[NSObject importArtworkTokenForEntityPersistentID:entityType:artworkToken:artworkType:sourceType:usingConnection:](v31, "importArtworkTokenForEntityPersistentID:entityType:artworkToken:artworkType:sourceType:usingConnection:", shared_owners, 1, v22, 5, 600, v24);
            -[NSObject updateBestArtworkTokenForEntityPersistentID:entityType:artworkType:retrievalTime:usingConnection:](v31, "updateBestArtworkTokenForEntityPersistentID:entityType:artworkType:retrievalTime:usingConnection:", shared_owners, 1, 5, v24, 0.0);
          }
          else
          {
            v24 = os_log_create("com.apple.amp.medialibrary", "Import");
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1AC149000, v24, OS_LOG_TYPE_ERROR, "[ML3StoreImportOperation] no playlist artwork provided in playlist data.", buf, 2u);
            }
          }

          goto LABEL_25;
        }
      }
      v22 = os_log_create("com.apple.amp.medialibrary", "Import");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AC149000, v22, OS_LOG_TYPE_ERROR, "[ML3StoreImportOperation] failed to add container to import session.", buf, 2u);
      }
LABEL_25:

      v26 = v36;
      if (v36)
      {
        v27 = (unint64_t *)&v36->__shared_owners_;
        do
          v28 = __ldaxr(v27);
        while (__stlxr(v28 - 1, v27));
        if (!v28)
        {
          ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
          std::__shared_weak_count::__release_weak(v26);
        }
      }
      if (!v20)
      {
        v10 = 0;
        goto LABEL_35;
      }
    }
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    if (v8)
      continue;
    break;
  }
  v10 = 1;
LABEL_35:

  v6 = v31;
LABEL_39:

  return v10;
}

- (BOOL)_importAlbumArtistsUsingImportSession:(void *)a3
{
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  id v11;
  id v12;
  id v13;
  unint64_t v14;
  int v15;
  int v16;
  unint64_t v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  os_log_type_t v21;
  const char *v22;
  uint32_t v23;
  int v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  void *v28;
  NSObject *v29;
  void *v31;
  BOOL v32;
  void *v33;
  NSObject *obj;
  uint64_t v35;
  _QWORD v37[2];
  uint64_t v38[2];
  uint8_t v39[8];
  std::__shared_weak_count *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  id v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if (!-[ML3StoreItemAlbumArtistData albumArtistCount](self->_albumArtistData, "albumArtistCount"))
  {
    v29 = os_log_create("com.apple.amp.medialibrary", "Import");
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v39 = 0;
      _os_log_impl(&dword_1AC149000, v29, OS_LOG_TYPE_ERROR, "[ML3StoreImportOperation] no album artists in store payload. skipping import.", v39, 2u);
    }
    v32 = 1;
    goto LABEL_36;
  }
  -[ML3StoreItemAlbumArtistData parsedStoreAlbumArtistImportProperties](self->_albumArtistData, "parsedStoreAlbumArtistImportProperties");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v31;
  v4 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
  v32 = 1;
  if (!v4)
    goto LABEL_32;
  v35 = *(_QWORD *)v42;
  while (2)
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v42 != v35)
        objc_enumerationMutation(obj);
      v6 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
      -[ML3ImportOperation import](self, "import");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "library");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (std::__shared_weak_count *)operator new(0x78uLL);
      v9->__shared_owners_ = 0;
      p_shared_owners = (unint64_t *)&v9->__shared_owners_;
      v9->__shared_weak_owners_ = 0;
      v9->__vftable = (std::__shared_weak_count_vtbl *)&off_1E5B51538;
      v11 = v6;
      v12 = v8;
      v9[1].__vftable = (std::__shared_weak_count_vtbl *)&off_1E5B4E3F0;
      v9[1].__shared_owners_ = 0;
      LOWORD(v9[1].__shared_weak_owners_) = 256;
      BYTE2(v9[1].__shared_weak_owners_) = 1;
      v9[2].std::__shared_count = 0u;
      *(_OWORD *)&v9[2].__shared_weak_owners_ = 0u;
      LODWORD(v9[3].__shared_owners_) = 1065353216;
      v9[3].__shared_weak_owners_ = objc_msgSend(v11, "copy");
      LODWORD(v9[4].__vftable) = 6;
      v9[4].__shared_owners_ = 7;
      v13 = v12;
      v9[4].__shared_weak_owners_ = (uint64_t)v13;
      BYTE1(v9[1].__shared_weak_owners_) = 0;

      *(_QWORD *)v39 = v9 + 1;
      v40 = v9;

      v38[0] = (uint64_t)&v9[1];
      v38[1] = (uint64_t)v9;
      do
        v14 = __ldxr(p_shared_owners);
      while (__stxr(v14 + 1, p_shared_owners));
      v37[0] = 0;
      v37[1] = 0;
      v15 = ML3ImportSession::addAlbumArtist((uint64_t)a3, v38, v37);
      v16 = v15;
      do
        v17 = __ldaxr(p_shared_owners);
      while (__stlxr(v17 - 1, p_shared_owners));
      if (v17)
      {
        if (v15)
          goto LABEL_13;
      }
      else
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
        if (v16)
        {
LABEL_13:
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(*(_QWORD *)v39 + 8));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "addObject:", v18);

          if (!-[ML3StoreImportOperation isCancelled](self, "isCancelled"))
          {
            v24 = 1;
            goto LABEL_22;
          }
          v19 = os_log_create("com.apple.amp.medialibrary", "Import");
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            v20 = v19;
            v21 = OS_LOG_TYPE_ERROR;
            v22 = "[ML3StoreImportOperation] store import operation cancelled";
            v23 = 2;
LABEL_19:
            _os_log_impl(&dword_1AC149000, v20, v21, v22, buf, v23);
            goto LABEL_20;
          }
          goto LABEL_20;
        }
      }
      v19 = os_log_create("com.apple.amp.medialibrary", "Import_Oversize");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v46 = v11;
        v20 = v19;
        v21 = OS_LOG_TYPE_DEFAULT;
        v22 = "error importing album artist with payload=%{public}@";
        v23 = 12;
        goto LABEL_19;
      }
LABEL_20:

      v24 = 0;
LABEL_22:
      v25 = v40;
      if (v40)
      {
        v26 = (unint64_t *)&v40->__shared_owners_;
        do
          v27 = __ldaxr(v26);
        while (__stlxr(v27 - 1, v26));
        if (!v27)
        {
          ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
          std::__shared_weak_count::__release_weak(v25);
        }
      }
      if (!v24)
      {
        v32 = 0;
        goto LABEL_32;
      }
    }
    v4 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    if (v4)
      continue;
    break;
  }
  v32 = 1;
LABEL_32:

  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v33, 1, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[ML3ImportOperation setReturnData:](self, "setReturnData:", v28);

  v29 = obj;
LABEL_36:

  return v32;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_albumArtistData, 0);
  objc_storeStrong((id *)&self->_playlistData, 0);
  objc_storeStrong((id *)&self->_trackData, 0);
}

BOOL __31__ML3StoreImportOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL8 v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.medialibrary", "Import");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v10 = 138543362;
      v11 = v6;
      _os_log_impl(&dword_1AC149000, v7, OS_LOG_TYPE_ERROR, "[ML3StoreImportOperation] failed to start store import transaction. error=%{public}@", (uint8_t *)&v10, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    objc_msgSend(*(id *)(a1 + 32), "setError:", v6);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_performImportWithTransaction:", v5);
  }
  v8 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != 0;

  return v8;
}

@end
