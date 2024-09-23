@implementation ML3SetCloudIDImportOperation

- (unint64_t)importSource
{
  return 9;
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
  if (*((_BYTE *)v12 + 24) && (-[ML3SetCloudIDImportOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __36__ML3SetCloudIDImportOperation_main__block_invoke;
    v10[3] = &unk_1E5B65CC8;
    v10[4] = self;
    v10[5] = &v11;
    -[ML3ImportOperation _writerTransactionWithBlock:](self, "_writerTransactionWithBlock:", v10);
  }
  v5 = os_log_create("com.apple.amp.medialibrary", "Import");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = -[ML3SetCloudIDImportOperation isCancelled](self, "isCancelled");
    v7 = *((unsigned __int8 *)v12 + 24);
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    *(_DWORD *)buf = 67109632;
    v16 = v6;
    v17 = 1024;
    v18 = v7;
    v19 = 2048;
    v20 = v8 - v4;
    _os_log_impl(&dword_1AC149000, v5, OS_LOG_TYPE_DEBUG, "[ML3SetCloudIDImportOperation] [ML3SetCloudIDImportOperation] import operation cancelled=%d success=%d. total time = %.2fs", buf, 0x18u);
  }

  if (*((_BYTE *)v12 + 24))
    v9 = -[ML3SetCloudIDImportOperation isCancelled](self, "isCancelled") ^ 1;
  else
    v9 = 0;
  -[ML3ImportOperation setSuccess:](self, "setSuccess:", v9);
  _Block_object_dispose(&v11, 8);
}

- (BOOL)_performImportWithTransaction:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  uint64_t v12;
  _BOOL4 v13;
  NSObject *v14;
  void *v15;
  void *v16;
  BOOL v17;
  id v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  uint64_t v23;
  _BOOL4 v24;
  NSObject *v25;
  __CFString *v26;
  void *v27;
  NSObject *v28;
  id v29;
  void *v30;
  NSObject *v31;
  BOOL v32;
  void *v33;
  void *v34;
  ML3MusicLibrary *v35;
  uint64_t v36;
  NSObject *v37;
  NSObject *v38;
  NSArray *trackInfo;
  NSObject *v40;
  const char *v41;
  void *v43;
  NSObject *v44;
  NSObject *v45;
  void *v46;
  NSObject *v47;
  NSArray *playlistInfo;
  const char *v49;
  id v50;
  void *v51;
  id v52;
  id v53;
  uint8_t v54[4];
  NSObject *v55;
  uint8_t buf[4];
  uint64_t v57;
  __int16 v58;
  const __CFString *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v50 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[ML3ImportOperation import](self, "import");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trackData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (!v6)
  {
    v10 = 0;
    goto LABEL_7;
  }
  v7 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[ML3ImportOperation import](self, "import");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trackData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (__CFString *)objc_msgSend(v7, "initWithData:encoding:", v9, 4);

  if (!v10)
  {
LABEL_7:
    v13 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v51, "attributesOfItemAtPath:error:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "fileSize");

  v13 = v12 != 0;
  v14 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v57 = v12;
    v58 = 2112;
    v59 = v10;
    _os_log_impl(&dword_1AC149000, v14, OS_LOG_TYPE_DEFAULT, "Importing %llu bytes of track data from: %@", buf, 0x16u);
  }

LABEL_8:
  -[ML3ImportOperation import](self, "import");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "playlistData");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "length") == 0;

  if (v17)
    goto LABEL_13;
  v18 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[ML3ImportOperation import](self, "import");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "playlistData");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (const __CFString *)objc_msgSend(v18, "initWithData:encoding:", v20, 4);

  if (!v21)
  {
LABEL_13:
    v26 = 0;
    v24 = 0;
    v21 = &stru_1E5B66908;
  }
  else
  {
    objc_msgSend(v51, "attributesOfItemAtPath:error:", v21, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "fileSize");

    v24 = v23 != 0;
    v25 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v57 = v23;
      v58 = 2112;
      v59 = v21;
      _os_log_impl(&dword_1AC149000, v25, OS_LOG_TYPE_DEFAULT, "Importing %llu bytes of playlist data from: %@", buf, 0x16u);
    }

    v26 = (__CFString *)v21;
  }
  if (v13 || v24)
  {
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v10, 1, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
      {
        v53 = 0;
        objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v27, 0, 0, &v53);
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = v53;
        if (v29)
        {
          v30 = v29;
          v31 = os_log_create("com.apple.amp.medialibrary", "Import");
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            v57 = (uint64_t)v30;
            _os_log_impl(&dword_1AC149000, v31, OS_LOG_TYPE_DEBUG, "[ML3SetCloudIDImportOperation] Failed to deserialize track plist with error: %{public}@", buf, 0xCu);
          }

          v32 = 0;
          goto LABEL_46;
        }
      }
      else
      {
        v28 = 0;
      }

    }
    else
    {
      v28 = 0;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[NSObject objectForKey:](v28, "objectForKey:", CFSTR("tracks"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_storeStrong((id *)&self->_trackInfo, v33);

    }
    -[ML3ImportOperation import](self, "import");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "library");
    v35 = (ML3MusicLibrary *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "connection");
    v36 = objc_claimAutoreleasedReturnValue();
    ML3ImportSession::ML3ImportSession((ML3ImportSession *)buf, v35, (ML3DatabaseConnection *)v36, 0, 1);

    LOBYTE(v36) = ML3ImportSession::begin((ML3ImportSession *)buf, -[NSArray count](self->_trackInfo, "count"), 0, 0);
    v37 = os_log_create("com.apple.amp.medialibrary", "Import");
    v38 = v37;
    if ((v36 & 1) != 0)
    {
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v54 = 0;
        _os_log_impl(&dword_1AC149000, v38, OS_LOG_TYPE_DEBUG, "[ML3SetCloudIDImportOperation] Importing track data", v54, 2u);
      }

      if (-[ML3SetCloudIDImportOperation _importTracksUsingImportSession:](self, "_importTracksUsingImportSession:", buf))
      {
        trackInfo = self->_trackInfo;
        self->_trackInfo = 0;

        if (-[__CFString isEqualToString:](v10, "isEqualToString:", v21))
        {
          v40 = v28;
        }
        else if (v24)
        {
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v26, 1, 0);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          if (v43)
          {
            v52 = 0;
            objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v43, 0, 0, &v52);
            v40 = objc_claimAutoreleasedReturnValue();
            v44 = v52;
            if (v44)
            {
              v38 = v44;
              _ML3LogCategoryImport();
              v45 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)v54 = 138543362;
                v55 = v38;
                _os_log_impl(&dword_1AC149000, v45, OS_LOG_TYPE_DEBUG, "[ML3SetCloudIDImportOperation] Failed to deserialize playlist plist with error: %{public}@", v54, 0xCu);
              }

              v32 = 1;
              goto LABEL_44;
            }
          }
          else
          {
            v40 = 0;
          }

        }
        else
        {
          v40 = 0;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[NSObject objectForKey:](v40, "objectForKey:", CFSTR("playlists"));
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_storeStrong((id *)&self->_playlistInfo, v46);

        }
        v47 = os_log_create("com.apple.amp.medialibrary", "Import");
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v54 = 0;
          _os_log_impl(&dword_1AC149000, v47, OS_LOG_TYPE_DEBUG, "[ML3SetCloudIDImportOperation] Importing playlist data", v54, 2u);
        }

        if (-[ML3SetCloudIDImportOperation _importPlaylistsUsingImportSession:](self, "_importPlaylistsUsingImportSession:", buf))
        {
          playlistInfo = self->_playlistInfo;
          self->_playlistInfo = 0;

          if (ML3ImportSession::flush((ML3ImportSession *)buf, 1))
          {
            ML3ImportSession::_finishImport((id *)buf);
            v32 = 1;
            goto LABEL_45;
          }
          v38 = os_log_create("com.apple.amp.medialibrary", "Import");
          if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            goto LABEL_43;
          *(_WORD *)v54 = 0;
          v49 = "[ML3SetCloudIDImportOperation] Failed to commit the import session changes";
          goto LABEL_69;
        }
        v38 = os_log_create("com.apple.amp.medialibrary", "Import");
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v54 = 0;
          v49 = "[ML3SetCloudIDImportOperation] Failed to import playlist data.";
LABEL_69:
          _os_log_impl(&dword_1AC149000, v38, OS_LOG_TYPE_ERROR, v49, v54, 2u);
        }
LABEL_43:
        v32 = 0;
LABEL_44:

LABEL_45:
        ML3ImportSession::~ML3ImportSession((ML3ImportSession *)buf);

        goto LABEL_46;
      }
      v38 = os_log_create("com.apple.amp.medialibrary", "Import");
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v54 = 0;
        v41 = "[ML3SetCloudIDImportOperation] Failed to import track data.";
        goto LABEL_41;
      }
    }
    else if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v54 = 0;
      v41 = "[ML3SetCloudIDImportOperation] Failed to begin import session";
LABEL_41:
      _os_log_impl(&dword_1AC149000, v38, OS_LOG_TYPE_ERROR, v41, v54, 2u);
    }
    v40 = 0;
    goto LABEL_43;
  }
  v28 = os_log_create("com.apple.amp.medialibrary", "Import");
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AC149000, v28, OS_LOG_TYPE_DEBUG, "[ML3SetCloudIDImportOperation] No track data or playlist data to import, finishing import operation...", buf, 2u);
  }
  v32 = 1;
LABEL_46:

  return v32;
}

- (BOOL)_importTracksUsingImportSession:(void *)a3
{
  NSArray *v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  NSDictionary *v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  std::__shared_weak_count *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  unint64_t *v17;
  unint64_t v18;
  unint64_t v19;
  int updated;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  unint64_t *v25;
  unint64_t v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  int v30;
  unint64_t *v31;
  unint64_t v32;
  std::__shared_weak_count *v33;
  unint64_t *v34;
  unint64_t v35;
  std::__shared_weak_count *v36;
  unint64_t *v37;
  unint64_t v38;
  std::__shared_weak_count *v39;
  unint64_t *v40;
  uint64_t v41;
  unint64_t v42;
  std::__shared_weak_count *v43;
  unint64_t *v44;
  unint64_t v45;
  int v46;
  unint64_t *v47;
  unint64_t v48;
  std::__shared_weak_count *v49;
  unint64_t *v50;
  unint64_t v51;
  std::__shared_weak_count *v52;
  unint64_t *v53;
  unint64_t v54;
  std::__shared_weak_count *v55;
  unint64_t *v56;
  unint64_t v57;
  unint64_t *v58;
  unint64_t v59;
  NSObject *v60;
  void *p_p;
  unint64_t v62;
  unint64_t v63;
  std::__shared_weak_count *v64;
  std::__shared_weak_count *v65;
  unint64_t *v66;
  unint64_t v67;
  NSObject *v68;
  const char *v69;
  int v70;
  std::__shared_weak_count *v71;
  unint64_t *v72;
  unint64_t v73;
  BOOL v74;
  ML3SetCloudIDImportOperation *v76;
  NSArray *obj;
  void *__p;
  std::__shared_weak_count *v80;
  char v81;
  uint64_t v82[2];
  uint64_t v83[2];
  _QWORD v84[2];
  uint64_t v85;
  std::__shared_weak_count *v86;
  _QWORD v87[2];
  __int128 v88;
  _QWORD v89[2];
  void *v90;
  std::__shared_weak_count *v91;
  uint64_t v92;
  uint64_t v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 buf;
  _BYTE v99[128];
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  if (!-[NSArray count](self->_trackInfo, "count"))
  {
    v4 = (NSArray *)os_log_create("com.apple.amp.medialibrary", "Import");
    if (os_log_type_enabled(&v4->super, OS_LOG_TYPE_ERROR))
    {
      LOWORD(__p) = 0;
      _os_log_impl(&dword_1AC149000, &v4->super, OS_LOG_TYPE_ERROR, "[ML3SetCloudIDImportOperation] No tracks in cloud-id mapping payload, skipping track import.", (uint8_t *)&__p, 2u);
    }
    goto LABEL_123;
  }
  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  v4 = self->_trackInfo;
  obj = v4;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v94, v99, 16);
  if (!v5)
  {
LABEL_123:
    v74 = 1;
    goto LABEL_124;
  }
  v76 = self;
  v6 = 1;
  v7 = *(_QWORD *)v95;
LABEL_4:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v95 != v7)
      objc_enumerationMutation(obj);
    v9 = *(NSDictionary **)(*((_QWORD *)&v94 + 1) + 8 * v8);
    v10 = (std::__shared_weak_count *)operator new(0x68uLL);
    v10->__shared_owners_ = 0;
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    v10->__shared_weak_owners_ = 0;
    v10->__vftable = (std::__shared_weak_count_vtbl *)&off_1E5B515E0;
    v12 = v10 + 1;
    ML3SetCloudIDImportItem::ML3SetCloudIDImportItem((ML3SetCloudIDImportItem *)&v10[1], v9);
    v10[1].__vftable = (std::__shared_weak_count_vtbl *)&off_1E5B4F340;
    objc_msgSend((id)v10[3].__shared_weak_owners_, "objectForKey:", CFSTR("persistent-id"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    __p = 0;
    if (objc_msgSend(v14, "scanHexLongLong:", &__p))
    {
      v10[1].__shared_owners_ = (uint64_t)__p;
      objc_msgSend((id)v10[3].__shared_weak_owners_, "objectForKey:", CFSTR("cloud-id"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v10[4].__vftable = (std::__shared_weak_count_vtbl *)objc_msgSend(v15, "longLongValue");

    }
    v92 = (uint64_t)&v10[1];
    v93 = (uint64_t)v10;
    v16 = ((uint64_t (*)(std::__shared_weak_count *))v10[1].__on_zero_shared)(v12);
    if (!v16)
    {
      v60 = os_log_create("com.apple.amp.medialibrary", "Import");
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
      {
        ((void (*)(void **__return_ptr, std::__shared_weak_count *))v12->__vftable[2].~__shared_weak_count_0)(&__p, v12);
        p_p = &__p;
        if (v81 < 0)
          p_p = __p;
        LODWORD(buf) = 136315138;
        *(_QWORD *)((char *)&buf + 4) = p_p;
        _os_log_impl(&dword_1AC149000, v60, OS_LOG_TYPE_DEBUG, "[ML3SetCloudIDImportOperation] Skipping invalid track: %s", (uint8_t *)&buf, 0xCu);
        if (v81 < 0)
          operator delete(__p);
      }
      goto LABEL_106;
    }
    if (_os_feature_enabled_impl())
    {
      _ZNSt3__115allocate_sharedB8ne180100I29ML3SetCloudIDArtistImportItemNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&__p);
      v90 = __p;
      v91 = v80;
      if (v80)
      {
        v17 = (unint64_t *)&v80->__shared_owners_;
        do
          v18 = __ldxr(v17);
        while (__stxr(v18 + 1, v17));
      }
      v89[0] = v10 + 1;
      v89[1] = v10;
      do
        v19 = __ldxr(p_shared_owners);
      while (__stxr(v19 + 1, p_shared_owners));
      updated = ML3ImportSession::updateAlbumArtist((uint64_t)a3, (uint64_t *)&v90, v89, 1);
      do
        v21 = __ldaxr(p_shared_owners);
      while (__stlxr(v21 - 1, p_shared_owners));
      if (!v21)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
      v22 = v91;
      if (!v91)
        goto LABEL_24;
      v23 = (unint64_t *)&v91->__shared_owners_;
      do
        v24 = __ldaxr(v23);
      while (__stlxr(v24 - 1, v23));
      if (!v24)
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
        if (!updated)
        {
LABEL_91:
          v65 = v80;
          if (!v80)
            goto LABEL_95;
          v66 = (unint64_t *)&v80->__shared_owners_;
          do
            v67 = __ldaxr(v66);
          while (__stlxr(v67 - 1, v66));
          if (v67)
            goto LABEL_95;
          ((void (*)(std::__shared_weak_count *))v65->__on_zero_shared)(v65);
          v64 = v65;
          goto LABEL_101;
        }
      }
      else
      {
LABEL_24:
        if (!updated)
          goto LABEL_91;
      }
      _ZNSt3__115allocate_sharedB8ne180100I29ML3SetCloudIDArtistImportItemNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&buf);
      v88 = buf;
      if (*((_QWORD *)&buf + 1))
      {
        v25 = (unint64_t *)(*((_QWORD *)&buf + 1) + 8);
        do
          v26 = __ldxr(v25);
        while (__stxr(v26 + 1, v25));
      }
      v27 = (std::__shared_weak_count *)v93;
      v87[0] = v92;
      v87[1] = v93;
      if (v93)
      {
        v28 = (unint64_t *)(v93 + 8);
        do
          v29 = __ldxr(v28);
        while (__stxr(v29 + 1, v28));
      }
      v30 = ML3ImportSession::updateItemArtist((uint64_t)a3, &v88, v87, 1);
      if (v27)
      {
        v31 = (unint64_t *)&v27->__shared_owners_;
        do
          v32 = __ldaxr(v31);
        while (__stlxr(v32 - 1, v31));
        if (!v32)
        {
          ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
          std::__shared_weak_count::__release_weak(v27);
        }
      }
      v33 = (std::__shared_weak_count *)*((_QWORD *)&v88 + 1);
      if (*((_QWORD *)&v88 + 1))
      {
        v34 = (unint64_t *)(*((_QWORD *)&v88 + 1) + 8);
        do
          v35 = __ldaxr(v34);
        while (__stlxr(v35 - 1, v34));
        if (!v35)
        {
          ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
          std::__shared_weak_count::__release_weak(v33);
        }
      }
      v36 = (std::__shared_weak_count *)*((_QWORD *)&buf + 1);
      if (!*((_QWORD *)&buf + 1))
        goto LABEL_45;
      v37 = (unint64_t *)(*((_QWORD *)&buf + 1) + 8);
      do
        v38 = __ldaxr(v37);
      while (__stlxr(v38 - 1, v37));
      if (!v38)
      {
        ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
        std::__shared_weak_count::__release_weak(v36);
        if (v30)
          goto LABEL_46;
      }
      else
      {
LABEL_45:
        if (v30)
        {
LABEL_46:
          v39 = (std::__shared_weak_count *)operator new(0x68uLL);
          v39->__shared_owners_ = 0;
          v40 = (unint64_t *)&v39->__shared_owners_;
          v39->__shared_weak_owners_ = 0;
          v39->__vftable = (std::__shared_weak_count_vtbl *)&off_1E5B515A8;
          ML3SetCloudIDImportItem::ML3SetCloudIDImportItem((ML3SetCloudIDImportItem *)&v39[1], 0);
          v39[1].__vftable = (std::__shared_weak_count_vtbl *)&off_1E5B4F258;
          *(_QWORD *)&buf = v41;
          *((_QWORD *)&buf + 1) = v39;
          v85 = v41;
          v86 = v39;
          do
            v42 = __ldxr(v40);
          while (__stxr(v42 + 1, v40));
          v43 = (std::__shared_weak_count *)v93;
          v84[0] = v92;
          v84[1] = v93;
          if (v93)
          {
            v44 = (unint64_t *)(v93 + 8);
            do
              v45 = __ldxr(v44);
            while (__stxr(v45 + 1, v44));
          }
          v46 = ML3ImportSession::updateAlbum((uint64_t)a3, &v85, v84, *((_QWORD *)__p + 1), 1);
          if (v43)
          {
            v47 = (unint64_t *)&v43->__shared_owners_;
            do
              v48 = __ldaxr(v47);
            while (__stlxr(v48 - 1, v47));
            if (!v48)
            {
              ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
              std::__shared_weak_count::__release_weak(v43);
            }
          }
          v49 = v86;
          if (v86)
          {
            v50 = (unint64_t *)&v86->__shared_owners_;
            do
              v51 = __ldaxr(v50);
            while (__stlxr(v51 - 1, v50));
            if (!v51)
            {
              ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
              std::__shared_weak_count::__release_weak(v49);
            }
          }
          v52 = (std::__shared_weak_count *)*((_QWORD *)&buf + 1);
          if (!*((_QWORD *)&buf + 1))
            goto LABEL_65;
          v53 = (unint64_t *)(*((_QWORD *)&buf + 1) + 8);
          do
            v54 = __ldaxr(v53);
          while (__stlxr(v54 - 1, v53));
          if (!v54)
          {
            ((void (*)(std::__shared_weak_count *))v52->__on_zero_shared)(v52);
            std::__shared_weak_count::__release_weak(v52);
            if (v46)
              goto LABEL_66;
          }
          else
          {
LABEL_65:
            if (v46)
            {
LABEL_66:
              v55 = (std::__shared_weak_count *)v93;
              v83[0] = v92;
              v83[1] = v93;
              if (v93)
              {
                v56 = (unint64_t *)(v93 + 8);
                do
                  v57 = __ldxr(v56);
                while (__stxr(v57 + 1, v56));
              }
              LOBYTE(updated) = ML3ImportSession::updateTrack((uint64_t)a3, v83, 1, 1);
              if (v55)
              {
                v58 = (unint64_t *)&v55->__shared_owners_;
                do
                  v59 = __ldaxr(v58);
                while (__stlxr(v59 - 1, v58));
                if (!v59)
                {
                  ((void (*)(std::__shared_weak_count *))v55->__on_zero_shared)(v55);
                  std::__shared_weak_count::__release_weak(v55);
                }
              }
              goto LABEL_91;
            }
          }
        }
      }
      LOBYTE(updated) = 0;
      goto LABEL_91;
    }
    v82[0] = (uint64_t)&v10[1];
    v82[1] = (uint64_t)v10;
    do
      v62 = __ldxr(p_shared_owners);
    while (__stxr(v62 + 1, p_shared_owners));
    LOBYTE(updated) = ML3ImportSession::updateTrack((uint64_t)a3, v82, 0, 1);
    do
      v63 = __ldaxr(p_shared_owners);
    while (__stlxr(v63 - 1, p_shared_owners));
    if (v63)
    {
LABEL_95:
      if ((updated & 1) == 0)
        goto LABEL_102;
      goto LABEL_96;
    }
    ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
    v64 = v10;
LABEL_101:
    std::__shared_weak_count::__release_weak(v64);
    if ((updated & 1) == 0)
    {
LABEL_102:
      v60 = os_log_create("com.apple.amp.medialibrary", "Import");
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        LOWORD(__p) = 0;
        v68 = v60;
        v69 = "[ML3SetCloudIDImportOperation] Failed to import track data";
        goto LABEL_104;
      }
LABEL_105:
      v6 = 0;
LABEL_106:

      v70 = v16 ^ 1;
      goto LABEL_107;
    }
LABEL_96:
    if (-[ML3SetCloudIDImportOperation isCancelled](v76, "isCancelled"))
    {
      v60 = os_log_create("com.apple.amp.medialibrary", "Import");
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        LOWORD(__p) = 0;
        v68 = v60;
        v69 = "[ML3SetCloudIDImportOperation] Set-cloud-id import operation cancelled";
LABEL_104:
        _os_log_impl(&dword_1AC149000, v68, OS_LOG_TYPE_ERROR, v69, (uint8_t *)&__p, 2u);
        goto LABEL_105;
      }
      goto LABEL_105;
    }
    v70 = 1;
    v6 = 1;
LABEL_107:
    v71 = (std::__shared_weak_count *)v93;
    if (v93)
    {
      v72 = (unint64_t *)(v93 + 8);
      do
        v73 = __ldaxr(v72);
      while (__stlxr(v73 - 1, v72));
      if (!v73)
      {
        ((void (*)(std::__shared_weak_count *))v71->__on_zero_shared)(v71);
        std::__shared_weak_count::__release_weak(v71);
      }
    }
    if (!v70)
      break;
    if (++v8 == v5)
    {
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v94, v99, 16);
      if (v5)
        goto LABEL_4;

      if ((v6 & 1) != 0)
        return 1;
      goto LABEL_116;
    }
  }

  if ((v6 & 1) != 0)
    return 1;
LABEL_116:
  v4 = (NSArray *)os_log_create("com.apple.amp.medialibrary", "Import");
  if (os_log_type_enabled(&v4->super, OS_LOG_TYPE_ERROR))
  {
    LOWORD(__p) = 0;
    _os_log_impl(&dword_1AC149000, &v4->super, OS_LOG_TYPE_ERROR, "[ML3SetCloudIDImportOperation] Failed to import tracks", (uint8_t *)&__p, 2u);
  }
  v74 = 0;
LABEL_124:

  return v74;
}

- (BOOL)_importPlaylistsUsingImportSession:(void *)a3
{
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  NSDictionary *v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  std::__shared_weak_count *v13;
  void *v14;
  void *v15;
  int v16;
  unint64_t v17;
  NSObject *v18;
  _BYTE *v19;
  unint64_t v20;
  uint64_t ContainerPersistentID;
  uint64_t v22;
  unint64_t v23;
  unint64_t *v24;
  unint64_t v25;
  int v26;
  int v27;
  unint64_t *v28;
  unint64_t v29;
  char *v30;
  unint64_t v31;
  _QWORD *v32;
  NSObject *v33;
  _BYTE *v34;
  NSObject *v35;
  uint64_t shared_owners;
  char *v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  BOOL v41;
  unint64_t v42;
  uint64_t v43;
  char v44;
  uint64_t *v45;
  uint64_t v46;
  _QWORD *v47;
  unint64_t v48;
  unint64_t *v49;
  unint64_t v50;
  _QWORD *v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  unint64_t v55;
  char *v56;
  uint64_t v57;
  char *v58;
  unint64_t *v59;
  unint64_t v60;
  _QWORD *v61;
  _QWORD *v62;
  char *v63;
  __int128 v64;
  int64x2_t v65;
  uint64_t v66;
  unint64_t *v67;
  unint64_t v68;
  NSObject *v69;
  const char *v70;
  int v71;
  unint64_t *v72;
  unint64_t v73;
  int64x2_t *v75;
  BOOL v76;
  ML3SetCloudIDImportOperation *v77;
  NSArray *obj;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  uint8_t v85[128];
  __int128 buf;
  _BYTE v87[24];
  uint64_t v88;
  char *v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  if (!-[NSArray count](self->_playlistInfo, "count"))
  {
    v5 = (NSArray *)os_log_create("com.apple.amp.medialibrary", "Import");
    if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v87 = 0;
      _os_log_impl(&dword_1AC149000, &v5->super, OS_LOG_TYPE_ERROR, "[ML3SetCloudIDImportOperation] No playlists in cloud-id mapping payload, skipping playlist import.", v87, 2u);
    }
    v76 = 1;
    goto LABEL_115;
  }
  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  v5 = self->_playlistInfo;
  obj = v5;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v80, v85, 16);
  v76 = 1;
  if (v6)
  {
    v77 = self;
    v75 = (int64x2_t *)((char *)a3 + 2344);
    v7 = *(_QWORD *)v81;
    v8 = 1;
LABEL_4:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v81 != v7)
        objc_enumerationMutation(obj);
      v10 = *(NSDictionary **)(*((_QWORD *)&v80 + 1) + 8 * v9);
      v11 = (std::__shared_weak_count *)operator new(0x68uLL);
      v11->__shared_owners_ = 0;
      p_shared_owners = (unint64_t *)&v11->__shared_owners_;
      v11->__shared_weak_owners_ = 0;
      v11->__vftable = (std::__shared_weak_count_vtbl *)&off_1E5B51650;
      v13 = v11 + 1;
      ML3SetCloudIDImportItem::ML3SetCloudIDImportItem((ML3SetCloudIDImportItem *)&v11[1], v10);
      v11[1].__vftable = (std::__shared_weak_count_vtbl *)&off_1E5B4FEC8;
      objc_msgSend((id)v11[3].__shared_weak_owners_, "objectForKey:", CFSTR("persistent-id"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v11[1].__shared_owners_ = objc_msgSend(v14, "longLongValue");

      objc_msgSend((id)v11[3].__shared_weak_owners_, "objectForKey:", CFSTR("cloud-id"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v11[4].__vftable = (std::__shared_weak_count_vtbl *)objc_msgSend(v15, "longLongValue");

      v16 = ((uint64_t (*)(std::__shared_weak_count *))v11[1].__on_zero_shared)(&v11[1]);
      if (!v16)
      {
        v33 = os_log_create("com.apple.amp.medialibrary", "Import");
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          ((void (*)(_BYTE *__return_ptr, std::__shared_weak_count *))v13->__vftable[2].~__shared_weak_count_0)(v87, v13);
          v34 = v87;
          if (v87[23] < 0)
            v34 = *(_BYTE **)v87;
          LODWORD(buf) = 136315138;
          *(_QWORD *)((char *)&buf + 4) = v34;
          _os_log_impl(&dword_1AC149000, v33, OS_LOG_TYPE_DEBUG, "[ML3SetCloudIDImportOperation] Skipping invalid playlist: %s", (uint8_t *)&buf, 0xCu);
          if ((v87[23] & 0x80000000) != 0)
            operator delete(*(void **)v87);
        }
        goto LABEL_97;
      }
      *(_QWORD *)&v79 = v11 + 1;
      *((_QWORD *)&v79 + 1) = v11;
      do
        v17 = __ldxr(p_shared_owners);
      while (__stxr(v17 + 1, p_shared_owners));
      v18 = os_log_create("com.apple.amp.medialibrary", "Import");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        ((void (*)(_BYTE *__return_ptr, std::__shared_weak_count *))v13->__vftable[2].~__shared_weak_count_0)(v87, v13);
        v19 = v87;
        if (v87[23] < 0)
          v19 = *(_BYTE **)v87;
        LODWORD(buf) = 136446210;
        *(_QWORD *)((char *)&buf + 4) = v19;
        _os_log_impl(&dword_1AC149000, v18, OS_LOG_TYPE_DEFAULT, "updating container %{public}s", (uint8_t *)&buf, 0xCu);
        if ((v87[23] & 0x80000000) != 0)
          operator delete(*(void **)v87);
      }

      ++*((_DWORD *)a3 + 42);
      if ((*((_QWORD *)a3 + 192) != *((_QWORD *)a3 + 191)
         || *((_QWORD *)a3 + 195) != *((_QWORD *)a3 + 194)
         || objc_msgSend(*((id *)a3 + 197), "count")
         || *((_QWORD *)a3 + 291) != *((_QWORD *)a3 + 290))
        && !ML3ImportSession::flush((ML3ImportSession *)a3, 0))
      {
        break;
      }
      *(_QWORD *)&buf = v11 + 1;
      *((_QWORD *)&buf + 1) = v11;
      do
        v20 = __ldxr(p_shared_owners);
      while (__stxr(v20 + 1, p_shared_owners));
      ContainerPersistentID = ML3ImportSession::_getContainerPersistentID((uint64_t)a3, &buf);
      v22 = ContainerPersistentID;
      do
        v23 = __ldaxr(p_shared_owners);
      while (__stlxr(v23 - 1, p_shared_owners));
      if (v23)
      {
        if (!ContainerPersistentID)
          goto LABEL_42;
      }
      else
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
        if (!v22)
        {
LABEL_42:
          v35 = os_log_create("com.apple.amp.medialibrary", "Import");
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            shared_owners = v11[1].__shared_owners_;
            *(_DWORD *)v87 = 134217984;
            *(_QWORD *)&v87[4] = shared_owners;
            _os_log_impl(&dword_1AC149000, v35, OS_LOG_TYPE_ERROR, "updateContainer ignoring non-existing container with pid %lld", v87, 0xCu);
          }

LABEL_82:
          v44 = 1;
          goto LABEL_83;
        }
      }
      *(_BYTE *)(v79 + 16) = 1;
      *(_QWORD *)(v79 + 8) = v22;
      v84 = v79;
      if (v11)
      {
        v24 = (unint64_t *)&v11->__shared_owners_;
        do
          v25 = __ldxr(v24);
        while (__stxr(v25 + 1, v24));
      }
      v26 = ML3ImportSession::_prepareContainerData((uint64_t)a3, (uint64_t *)&v84);
      v27 = v26;
      if (!v11)
        goto LABEL_33;
      v28 = (unint64_t *)&v11->__shared_owners_;
      do
        v29 = __ldaxr(v28);
      while (__stlxr(v29 - 1, v28));
      if (!v29)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
        if (!v27)
          break;
      }
      else
      {
LABEL_33:
        if (!v26)
          break;
      }
      v30 = (char *)*((_QWORD *)a3 + 288);
      v31 = *((_QWORD *)a3 + 289);
      if ((unint64_t)v30 >= v31)
      {
        v37 = (char *)*((_QWORD *)a3 + 287);
        v38 = (v30 - v37) >> 3;
        v39 = v38 + 1;
        if ((unint64_t)(v38 + 1) >> 61)
          std::vector<long long>::__throw_length_error[abi:ne180100]();
        v40 = v31 - (_QWORD)v37;
        if (v40 >> 2 > v39)
          v39 = v40 >> 2;
        v41 = (unint64_t)v40 >= 0x7FFFFFFFFFFFFFF8;
        v42 = 0x1FFFFFFFFFFFFFFFLL;
        if (!v41)
          v42 = v39;
        if (v42)
        {
          v42 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<long long>>(v42);
          v30 = (char *)*((_QWORD *)a3 + 288);
          v37 = (char *)*((_QWORD *)a3 + 287);
        }
        else
        {
          v43 = 0;
        }
        v45 = (uint64_t *)(v42 + 8 * v38);
        *v45 = v22;
        v32 = v45 + 1;
        while (v30 != v37)
        {
          v46 = *((_QWORD *)v30 - 1);
          v30 -= 8;
          *--v45 = v46;
        }
        *((_QWORD *)a3 + 287) = v45;
        *((_QWORD *)a3 + 288) = v32;
        *((_QWORD *)a3 + 289) = v42 + 8 * v43;
        if (v37)
          operator delete(v37);
      }
      else
      {
        *(_QWORD *)v30 = v22;
        v32 = v30 + 8;
      }
      *((_QWORD *)a3 + 288) = v32;
      v47 = (_QWORD *)*((_QWORD *)a3 + 294);
      v48 = *((_QWORD *)a3 + 295);
      if ((unint64_t)v47 >= v48)
      {
        v52 = ((uint64_t)v47 - v75->i64[0]) >> 4;
        v53 = v52 + 1;
        if ((unint64_t)(v52 + 1) >> 60)
          std::vector<long long>::__throw_length_error[abi:ne180100]();
        v54 = v48 - v75->i64[0];
        if (v54 >> 3 > v53)
          v53 = v54 >> 3;
        if ((unint64_t)v54 >= 0x7FFFFFFFFFFFFFF0)
          v55 = 0xFFFFFFFFFFFFFFFLL;
        else
          v55 = v53;
        v89 = (char *)a3 + 2360;
        v56 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<ML3ImportItem>>>(v55);
        v58 = &v56[16 * v52];
        *(_OWORD *)v58 = v79;
        if (v11)
        {
          v59 = (unint64_t *)&v11->__shared_owners_;
          do
            v60 = __ldxr(v59);
          while (__stxr(v60 + 1, v59));
        }
        v61 = (_QWORD *)*((_QWORD *)a3 + 294);
        v62 = (_QWORD *)*((_QWORD *)a3 + 293);
        if (v61 == v62)
        {
          v65 = vdupq_n_s64((unint64_t)v61);
          v63 = &v56[16 * v52];
        }
        else
        {
          v63 = &v56[16 * v52];
          do
          {
            v64 = *((_OWORD *)v61 - 1);
            v61 -= 2;
            *((_OWORD *)v63 - 1) = v64;
            v63 -= 16;
            *v61 = 0;
            v61[1] = 0;
          }
          while (v61 != v62);
          v65 = *v75;
        }
        v51 = v58 + 16;
        *((_QWORD *)a3 + 293) = v63;
        *((_QWORD *)a3 + 294) = v58 + 16;
        *(int64x2_t *)&v87[8] = v65;
        v66 = *((_QWORD *)a3 + 295);
        *((_QWORD *)a3 + 295) = &v56[16 * v57];
        v88 = v66;
        *(_QWORD *)v87 = v65.i64[0];
        std::__split_buffer<std::shared_ptr<ML3ImportItem>>::~__split_buffer((uint64_t)v87);
      }
      else
      {
        *v47 = v79;
        v47[1] = v11;
        if (v11)
        {
          v49 = (unint64_t *)&v11->__shared_owners_;
          do
            v50 = __ldxr(v49);
          while (__stxr(v50 + 1, v49));
        }
        v51 = v47 + 2;
      }
      *((_QWORD *)a3 + 294) = v51;
      if (v51 == *((_QWORD **)a3 + 293))
        goto LABEL_82;
      v44 = ML3ImportSession::flush((ML3ImportSession *)a3, 0);
      if (!v11)
        goto LABEL_87;
LABEL_83:
      v67 = (unint64_t *)&v11->__shared_owners_;
      do
        v68 = __ldaxr(v67);
      while (__stlxr(v68 - 1, v67));
      if (!v68)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
        if ((v44 & 1) == 0)
        {
LABEL_93:
          v33 = os_log_create("com.apple.amp.medialibrary", "Import");
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v87 = 0;
            v69 = v33;
            v70 = "[ML3SetCloudIDImportOperation] Failed to import playlist data";
LABEL_95:
            _os_log_impl(&dword_1AC149000, v69, OS_LOG_TYPE_ERROR, v70, v87, 2u);
          }
LABEL_96:
          v8 = 0;
LABEL_97:

          v71 = v16 ^ 1;
          goto LABEL_98;
        }
      }
      else
      {
LABEL_87:
        if ((v44 & 1) == 0)
          goto LABEL_93;
      }
      if (-[ML3SetCloudIDImportOperation isCancelled](v77, "isCancelled"))
      {
        v33 = os_log_create("com.apple.amp.medialibrary", "Import");
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v87 = 0;
          v69 = v33;
          v70 = "[ML3SetCloudIDImportOperation] Set-cloud-id import operation cancelled";
          goto LABEL_95;
        }
        goto LABEL_96;
      }
      v71 = 1;
      v8 = 1;
LABEL_98:
      if (v11)
      {
        v72 = (unint64_t *)&v11->__shared_owners_;
        do
          v73 = __ldaxr(v72);
        while (__stlxr(v73 - 1, v72));
        if (!v73)
        {
          ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
          std::__shared_weak_count::__release_weak(v11);
        }
      }
      if (!v71)
      {

        if ((v8 & 1) != 0)
          return 1;
LABEL_107:
        v5 = (NSArray *)os_log_create("com.apple.amp.medialibrary", "Import");
        if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v87 = 0;
          _os_log_impl(&dword_1AC149000, &v5->super, OS_LOG_TYPE_ERROR, "[ML3SetCloudIDImportOperation] Failed to import playlists", v87, 2u);
        }
        v76 = 0;
        goto LABEL_115;
      }
      if (++v9 == v6)
      {
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v80, v85, 16);
        if (v6)
          goto LABEL_4;

        if ((v8 & 1) != 0)
          return 1;
        goto LABEL_107;
      }
    }
    v44 = 0;
    goto LABEL_83;
  }
LABEL_115:

  return v76;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playlistInfo, 0);
  objc_storeStrong((id *)&self->_trackInfo, 0);
}

BOOL __36__ML3SetCloudIDImportOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
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
      _os_log_impl(&dword_1AC149000, v7, OS_LOG_TYPE_ERROR, "[ML3SetCloudIDImportOperation] failed to start store import transaction. error=%{public}@", (uint8_t *)&v10, 0xCu);
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
