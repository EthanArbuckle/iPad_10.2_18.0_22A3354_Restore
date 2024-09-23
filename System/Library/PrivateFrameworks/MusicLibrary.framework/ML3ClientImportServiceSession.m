@implementation ML3ClientImportServiceSession

- (ML3ClientImportServiceSession)initWithLibrary:(id)a3 connection:(id)a4 configuration:(id)a5
{
  id v9;
  id v10;
  id v11;
  ML3ClientImportServiceSession *v12;
  ML3ClientImportServiceSession *v13;
  uint64_t v14;
  ML3ClientImportSessionConfiguration *configuration;
  ML3ImportSession *v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = -[ML3ClientImportServiceSession init](self, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_library, a3);
    objc_storeStrong((id *)&v13->_databaseConnection, a4);
    v14 = -[ML3ClientImportSessionConfiguration copy](v13->_configuration, "copy");
    configuration = v13->_configuration;
    v13->_configuration = (ML3ClientImportSessionConfiguration *)v14;

    v16 = (ML3ImportSession *)operator new();
    ML3ImportSession::ML3ImportSession(v16, v13->_library, v13->_databaseConnection, objc_msgSend(v11, "sourceType"), objc_msgSend(v11, "allowAccountMerging"));
    v13->_importSession = v16;
  }

  return v13;
}

- (void)dealloc
{
  void *importSession;
  objc_super v4;

  importSession = self->_importSession;
  if (importSession)
  {
    (*(void (**)(void *, SEL))(*(_QWORD *)importSession + 8))(importSession, a2);
    self->_importSession = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)ML3ClientImportServiceSession;
  -[ML3ClientImportServiceSession dealloc](&v4, sel_dealloc);
}

- (BOOL)begin
{
  return ML3ImportSession::begin((ML3ImportSession *)self->_importSession, -[ML3ClientImportSessionConfiguration operationCount](self->_configuration, "operationCount"), 0, 0);
}

- (BOOL)finish
{
  ML3ImportSession *importSession;
  int v3;

  importSession = (ML3ImportSession *)self->_importSession;
  v3 = ML3ImportSession::flush(importSession, 1);
  if (v3)
    ML3ImportSession::_finishImport((id *)importSession);
  return v3;
}

- (BOOL)addTrack:(id)a3 persistentID:(id *)a4
{
  id v6;
  ML3ProtoSyncTrackImportItem *v7;
  ML3MusicLibrary *library;
  MIPMultiverseIdentifier *v9;
  MIPMediaItem *v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  uint64_t v13;
  ML3MusicLibrary *v14;
  void *v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  uint64_t v18;
  ML3MusicLibrary *v19;
  void *v20;
  std::__shared_weak_count *v21;
  ML3ProtoSyncAlbumImportItem *v22;
  ML3MusicLibrary *v23;
  MIPMediaItem *v24;
  std::__shared_weak_count *v25;
  void *importSession;
  unint64_t v27;
  unint64_t v28;
  int v29;
  unint64_t v30;
  std::__shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;
  void *v34;
  unint64_t *v35;
  unint64_t v36;
  std::__shared_weak_count *v37;
  unint64_t *v38;
  unint64_t v39;
  _BOOL4 v40;
  unint64_t *v41;
  unint64_t v42;
  std::__shared_weak_count *v43;
  unint64_t *v44;
  unint64_t v45;
  void *v46;
  unint64_t v47;
  char v48;
  unint64_t v49;
  std::__shared_weak_count *v50;
  void *v51;
  unint64_t *v52;
  unint64_t v53;
  std::__shared_weak_count *v54;
  unint64_t *v55;
  unint64_t v56;
  int v57;
  unint64_t *v58;
  unint64_t v59;
  std::__shared_weak_count *v60;
  unint64_t *v61;
  unint64_t v62;
  void *v63;
  std::__shared_weak_count *v64;
  unint64_t *v65;
  unint64_t v66;
  unint64_t *v67;
  unint64_t v68;
  std::__shared_weak_count *v69;
  unint64_t *v70;
  unint64_t v71;
  std::__shared_weak_count *v72;
  unint64_t *v73;
  unint64_t v74;
  std::__shared_weak_count *v75;
  unint64_t *v76;
  unint64_t v77;
  std::__shared_weak_count *v78;
  unint64_t *v79;
  unint64_t v80;
  id *v82;
  void *v83;
  uint64_t v84[2];
  uint64_t v85[2];
  _QWORD v86[2];
  uint64_t v87;
  std::__shared_weak_count *v88;
  _QWORD v89[2];
  uint64_t v90;
  std::__shared_weak_count *v91;
  _QWORD v92[2];
  uint64_t v93;
  std::__shared_weak_count *v94;
  uint64_t v95;
  std::__shared_weak_count *v96;
  uint64_t v97;
  std::__shared_weak_count *v98;
  uint64_t v99;
  std::__shared_weak_count *v100;
  uint64_t v101;
  uint64_t v102;

  v6 = a3;
  v7 = (ML3ProtoSyncTrackImportItem *)operator new();
  library = self->_library;
  objc_msgSend(v6, "multiverseIdentifier");
  v9 = (MIPMultiverseIdentifier *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mediaItem");
  v10 = (MIPMediaItem *)objc_claimAutoreleasedReturnValue();
  ML3ProtoSyncTrackImportItem::ML3ProtoSyncTrackImportItem(v7, library, v9, v10, 0);
  v101 = (uint64_t)v7;
  v11 = (std::__shared_weak_count *)operator new();
  v11->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v11->__shared_owners_;
  v11->__vftable = (std::__shared_weak_count_vtbl *)&off_1E5B51B58;
  v11->__shared_weak_owners_ = 0;
  v11[1].__vftable = (std::__shared_weak_count_vtbl *)v7;
  v102 = (uint64_t)v11;

  if (_os_feature_enabled_impl())
  {
    v83 = v6;
    v13 = operator new();
    v14 = self->_library;
    objc_msgSend(v6, "mediaItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = a4;
    ML3ProtoSyncArtistImportItem::ML3ProtoSyncArtistImportItem(v13, v14, 0, v15, 7, 0);
    v99 = v13;
    v16 = (std::__shared_weak_count *)operator new();
    v16->__shared_owners_ = 0;
    v17 = (unint64_t *)&v16->__shared_owners_;
    v16->__vftable = (std::__shared_weak_count_vtbl *)&off_1E5B51C38;
    v16->__shared_weak_owners_ = 0;
    v16[1].__vftable = (std::__shared_weak_count_vtbl *)v13;
    v100 = v16;

    v18 = operator new();
    v19 = self->_library;
    objc_msgSend(v6, "mediaItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    ML3ProtoSyncArtistImportItem::ML3ProtoSyncArtistImportItem(v18, v19, 0, v20, 2, 0);
    v97 = v18;
    v21 = (std::__shared_weak_count *)operator new();
    v21->__vftable = (std::__shared_weak_count_vtbl *)&off_1E5B51C38;
    v21->__shared_owners_ = 0;
    v21->__shared_weak_owners_ = 0;
    v21[1].__vftable = (std::__shared_weak_count_vtbl *)v18;
    v98 = v21;

    v22 = (ML3ProtoSyncAlbumImportItem *)operator new();
    v23 = self->_library;
    objc_msgSend(v83, "mediaItem");
    v24 = (MIPMediaItem *)objc_claimAutoreleasedReturnValue();
    ML3ProtoSyncAlbumImportItem::ML3ProtoSyncAlbumImportItem(v22, v23, 0, v24, 0);
    v95 = (uint64_t)v22;
    v25 = (std::__shared_weak_count *)operator new();
    v25->__vftable = (std::__shared_weak_count_vtbl *)&off_1E5B51B20;
    v25->__shared_owners_ = 0;
    v25->__shared_weak_owners_ = 0;
    v25[1].__vftable = (std::__shared_weak_count_vtbl *)v22;
    v96 = v25;

    importSession = self->_importSession;
    v93 = v13;
    v94 = v16;
    do
      v27 = __ldxr(v17);
    while (__stxr(v27 + 1, v17));
    v92[0] = v7;
    v92[1] = v11;
    a4 = v82;
    v6 = v83;
    do
      v28 = __ldxr(p_shared_owners);
    while (__stxr(v28 + 1, p_shared_owners));
    v29 = ML3ImportSession::addAlbumArtist((uint64_t)importSession, &v93, v92);
    do
      v30 = __ldaxr(p_shared_owners);
    while (__stlxr(v30 - 1, p_shared_owners));
    if (!v30)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
    v31 = v94;
    if (!v94)
      goto LABEL_14;
    v32 = (unint64_t *)&v94->__shared_owners_;
    do
      v33 = __ldaxr(v32);
    while (__stlxr(v33 - 1, v32));
    if (!v33)
    {
      ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
      std::__shared_weak_count::__release_weak(v31);
      if (!v29)
        goto LABEL_66;
    }
    else
    {
LABEL_14:
      if (!v29)
        goto LABEL_66;
    }
    v34 = self->_importSession;
    v90 = v97;
    v91 = v98;
    if (v98)
    {
      v35 = (unint64_t *)&v98->__shared_owners_;
      do
        v36 = __ldxr(v35);
      while (__stxr(v36 + 1, v35));
    }
    v37 = (std::__shared_weak_count *)v102;
    v89[0] = v101;
    v89[1] = v102;
    if (v102)
    {
      v38 = (unint64_t *)(v102 + 8);
      do
        v39 = __ldxr(v38);
      while (__stxr(v39 + 1, v38));
    }
    v40 = ML3ImportSession::addItemArtist((uint64_t)v34, &v90, v89);
    if (v37)
    {
      v41 = (unint64_t *)&v37->__shared_owners_;
      do
        v42 = __ldaxr(v41);
      while (__stlxr(v42 - 1, v41));
      if (!v42)
      {
        ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
        std::__shared_weak_count::__release_weak(v37);
      }
    }
    v43 = v91;
    if (!v91)
      goto LABEL_30;
    v44 = (unint64_t *)&v91->__shared_owners_;
    do
      v45 = __ldaxr(v44);
    while (__stlxr(v45 - 1, v44));
    if (!v45)
    {
      ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
      std::__shared_weak_count::__release_weak(v43);
      if (!v40)
        goto LABEL_66;
    }
    else
    {
LABEL_30:
      if (!v40)
        goto LABEL_66;
    }
    v51 = self->_importSession;
    v87 = v95;
    v88 = v96;
    if (v96)
    {
      v52 = (unint64_t *)&v96->__shared_owners_;
      do
        v53 = __ldxr(v52);
      while (__stxr(v53 + 1, v52));
    }
    v54 = (std::__shared_weak_count *)v102;
    v86[0] = v101;
    v86[1] = v102;
    if (v102)
    {
      v55 = (unint64_t *)(v102 + 8);
      do
        v56 = __ldxr(v55);
      while (__stxr(v56 + 1, v55));
    }
    v57 = ML3ImportSession::addAlbum((uint64_t)v51, &v87, v86, *(_QWORD *)(v99 + 8));
    if (v54)
    {
      v58 = (unint64_t *)&v54->__shared_owners_;
      do
        v59 = __ldaxr(v58);
      while (__stlxr(v59 - 1, v58));
      if (!v59)
      {
        ((void (*)(std::__shared_weak_count *))v54->__on_zero_shared)(v54);
        std::__shared_weak_count::__release_weak(v54);
      }
    }
    v60 = v88;
    if (!v88)
      goto LABEL_56;
    v61 = (unint64_t *)&v88->__shared_owners_;
    do
      v62 = __ldaxr(v61);
    while (__stlxr(v62 - 1, v61));
    if (!v62)
    {
      ((void (*)(std::__shared_weak_count *))v60->__on_zero_shared)(v60);
      std::__shared_weak_count::__release_weak(v60);
      if ((v57 & 1) != 0)
        goto LABEL_57;
    }
    else
    {
LABEL_56:
      if (v57)
      {
LABEL_57:
        v63 = self->_importSession;
        v64 = (std::__shared_weak_count *)v102;
        v85[0] = v101;
        v85[1] = v102;
        if (v102)
        {
          v65 = (unint64_t *)(v102 + 8);
          do
            v66 = __ldxr(v65);
          while (__stxr(v66 + 1, v65));
        }
        v48 = ML3ImportSession::addTrack((uint64_t)v63, v85, 1);
        if (v64)
        {
          v67 = (unint64_t *)&v64->__shared_owners_;
          do
            v68 = __ldaxr(v67);
          while (__stlxr(v68 - 1, v67));
          if (!v68)
          {
            ((void (*)(std::__shared_weak_count *))v64->__on_zero_shared)(v64);
            std::__shared_weak_count::__release_weak(v64);
          }
        }
LABEL_67:
        v69 = v96;
        if (v96)
        {
          v70 = (unint64_t *)&v96->__shared_owners_;
          do
            v71 = __ldaxr(v70);
          while (__stlxr(v71 - 1, v70));
          if (!v71)
          {
            ((void (*)(std::__shared_weak_count *))v69->__on_zero_shared)(v69);
            std::__shared_weak_count::__release_weak(v69);
          }
        }
        v72 = v98;
        if (v98)
        {
          v73 = (unint64_t *)&v98->__shared_owners_;
          do
            v74 = __ldaxr(v73);
          while (__stlxr(v74 - 1, v73));
          if (!v74)
          {
            ((void (*)(std::__shared_weak_count *))v72->__on_zero_shared)(v72);
            std::__shared_weak_count::__release_weak(v72);
          }
        }
        v75 = v100;
        if (v100)
        {
          v76 = (unint64_t *)&v100->__shared_owners_;
          do
            v77 = __ldaxr(v76);
          while (__stlxr(v77 - 1, v76));
          if (!v77)
          {
            ((void (*)(std::__shared_weak_count *))v75->__on_zero_shared)(v75);
            v50 = v75;
            goto LABEL_82;
          }
        }
        goto LABEL_83;
      }
    }
LABEL_66:
    v48 = 0;
    goto LABEL_67;
  }
  v46 = self->_importSession;
  v84[0] = (uint64_t)v7;
  v84[1] = (uint64_t)v11;
  do
    v47 = __ldxr(p_shared_owners);
  while (__stxr(v47 + 1, p_shared_owners));
  v48 = ML3ImportSession::addTrack((uint64_t)v46, v84, 0);
  do
    v49 = __ldaxr(p_shared_owners);
  while (__stlxr(v49 - 1, p_shared_owners));
  if (!v49)
  {
    ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
    v50 = v11;
LABEL_82:
    std::__shared_weak_count::__release_weak(v50);
  }
LABEL_83:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(v101 + 8));
  *a4 = (id)objc_claimAutoreleasedReturnValue();
  v78 = (std::__shared_weak_count *)v102;
  if (v102)
  {
    v79 = (unint64_t *)(v102 + 8);
    do
      v80 = __ldaxr(v79);
    while (__stlxr(v80 - 1, v79));
    if (!v80)
    {
      ((void (*)(std::__shared_weak_count *))v78->__on_zero_shared)(v78);
      std::__shared_weak_count::__release_weak(v78);
    }
  }

  return v48;
}

- (BOOL)updateTrack:(id)a3 persistentID:(id *)a4
{
  id v6;
  ML3ProtoSyncTrackImportItem *v7;
  ML3MusicLibrary *library;
  MIPMultiverseIdentifier *v9;
  MIPMediaItem *v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  ML3MusicLibrary *v13;
  MIPMultiverseIdentifier *v14;
  void *v15;
  ML3ClientImportServiceSession *v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  uint64_t v19;
  ML3MusicLibrary *v20;
  MIPMultiverseIdentifier *v21;
  void *v22;
  std::__shared_weak_count *v23;
  ML3ProtoSyncAlbumImportItem *v24;
  ML3MusicLibrary *v25;
  MIPMultiverseIdentifier *v26;
  MIPMediaItem *v27;
  std::__shared_weak_count *v28;
  uint64_t importSession;
  unint64_t v30;
  unint64_t v31;
  int updated;
  unint64_t v33;
  std::__shared_weak_count *v34;
  unint64_t *v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t *v38;
  unint64_t v39;
  std::__shared_weak_count *v40;
  unint64_t *v41;
  unint64_t v42;
  int v43;
  unint64_t *v44;
  unint64_t v45;
  std::__shared_weak_count *v46;
  unint64_t *v47;
  unint64_t v48;
  void *v49;
  unint64_t v50;
  char v51;
  unint64_t v52;
  std::__shared_weak_count *v53;
  uint64_t v54;
  unint64_t *v55;
  unint64_t v56;
  std::__shared_weak_count *v57;
  unint64_t *v58;
  unint64_t v59;
  int v60;
  unint64_t *v61;
  unint64_t v62;
  std::__shared_weak_count *v63;
  unint64_t *v64;
  unint64_t v65;
  uint64_t v66;
  std::__shared_weak_count *v67;
  unint64_t *v68;
  unint64_t v69;
  unint64_t *v70;
  unint64_t v71;
  std::__shared_weak_count *v72;
  unint64_t *v73;
  unint64_t v74;
  std::__shared_weak_count *v75;
  unint64_t *v76;
  unint64_t v77;
  std::__shared_weak_count *v78;
  unint64_t *v79;
  unint64_t v80;
  std::__shared_weak_count *v81;
  unint64_t *v82;
  unint64_t v83;
  id *v85;
  uint64_t v86;
  void *v87;
  uint64_t v88[2];
  uint64_t v89[2];
  _QWORD v90[2];
  ML3ProtoSyncAlbumImportItem *v91;
  std::__shared_weak_count *v92;
  _QWORD v93[2];
  uint64_t v94;
  std::__shared_weak_count *v95;
  _QWORD v96[2];
  uint64_t v97;
  std::__shared_weak_count *v98;
  ML3ProtoSyncAlbumImportItem *v99;
  std::__shared_weak_count *v100;
  uint64_t v101;
  std::__shared_weak_count *v102;
  uint64_t v103;
  std::__shared_weak_count *v104;
  uint64_t v105;
  uint64_t v106;

  v6 = a3;
  v7 = (ML3ProtoSyncTrackImportItem *)operator new();
  library = self->_library;
  objc_msgSend(v6, "multiverseIdentifier");
  v9 = (MIPMultiverseIdentifier *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mediaItem");
  v10 = (MIPMediaItem *)objc_claimAutoreleasedReturnValue();
  ML3ProtoSyncTrackImportItem::ML3ProtoSyncTrackImportItem(v7, library, v9, v10, 0);
  v105 = (uint64_t)v7;
  v11 = (std::__shared_weak_count *)operator new();
  v11->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v11->__shared_owners_;
  v11->__vftable = (std::__shared_weak_count_vtbl *)&off_1E5B51B58;
  v11->__shared_weak_owners_ = 0;
  v11[1].__vftable = (std::__shared_weak_count_vtbl *)v7;
  v106 = (uint64_t)v11;

  if (_os_feature_enabled_impl())
  {
    v85 = a4;
    v87 = v6;
    v86 = operator new();
    v13 = self->_library;
    objc_msgSend(v6, "multiverseIdentifier");
    v14 = (MIPMultiverseIdentifier *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mediaItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = self;
    ML3ProtoSyncArtistImportItem::ML3ProtoSyncArtistImportItem(v86, v13, v14, v15, 7, 0);
    v103 = v86;
    v17 = (std::__shared_weak_count *)operator new();
    v17->__shared_owners_ = 0;
    v18 = (unint64_t *)&v17->__shared_owners_;
    v17->__vftable = (std::__shared_weak_count_vtbl *)&off_1E5B51C38;
    v17->__shared_weak_owners_ = 0;
    v17[1].__vftable = (std::__shared_weak_count_vtbl *)v86;
    v104 = v17;

    v19 = operator new();
    v20 = v16->_library;
    objc_msgSend(v6, "multiverseIdentifier");
    v21 = (MIPMultiverseIdentifier *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mediaItem");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    ML3ProtoSyncArtistImportItem::ML3ProtoSyncArtistImportItem(v19, v20, v21, v22, 2, 0);
    v101 = v19;
    v23 = (std::__shared_weak_count *)operator new();
    v23->__vftable = (std::__shared_weak_count_vtbl *)&off_1E5B51C38;
    v23->__shared_owners_ = 0;
    v23->__shared_weak_owners_ = 0;
    v23[1].__vftable = (std::__shared_weak_count_vtbl *)v19;
    v102 = v23;

    v24 = (ML3ProtoSyncAlbumImportItem *)operator new();
    v25 = v16->_library;
    objc_msgSend(v87, "multiverseIdentifier");
    v26 = (MIPMultiverseIdentifier *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "mediaItem");
    v27 = (MIPMediaItem *)objc_claimAutoreleasedReturnValue();
    ML3ProtoSyncAlbumImportItem::ML3ProtoSyncAlbumImportItem(v24, v25, v26, v27, 0);
    v99 = v24;
    v28 = (std::__shared_weak_count *)operator new();
    v28->__vftable = (std::__shared_weak_count_vtbl *)&off_1E5B51B20;
    v28->__shared_owners_ = 0;
    v28->__shared_weak_owners_ = 0;
    v28[1].__vftable = (std::__shared_weak_count_vtbl *)v24;
    v100 = v28;

    importSession = (uint64_t)v16->_importSession;
    v97 = v86;
    v98 = v17;
    do
      v30 = __ldxr(v18);
    while (__stxr(v30 + 1, v18));
    v96[0] = v7;
    v96[1] = v11;
    v6 = v87;
    a4 = v85;
    do
      v31 = __ldxr(p_shared_owners);
    while (__stxr(v31 + 1, p_shared_owners));
    updated = ML3ImportSession::updateAlbumArtist(importSession, &v97, v96, 0);
    do
      v33 = __ldaxr(p_shared_owners);
    while (__stlxr(v33 - 1, p_shared_owners));
    if (!v33)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
    v34 = v98;
    if (!v98)
      goto LABEL_14;
    v35 = (unint64_t *)&v98->__shared_owners_;
    do
      v36 = __ldaxr(v35);
    while (__stlxr(v36 - 1, v35));
    if (!v36)
    {
      ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
      std::__shared_weak_count::__release_weak(v34);
      if (!updated)
        goto LABEL_66;
    }
    else
    {
LABEL_14:
      if (!updated)
        goto LABEL_66;
    }
    v37 = (uint64_t)v16->_importSession;
    v94 = v101;
    v95 = v102;
    if (v102)
    {
      v38 = (unint64_t *)&v102->__shared_owners_;
      do
        v39 = __ldxr(v38);
      while (__stxr(v39 + 1, v38));
    }
    v40 = (std::__shared_weak_count *)v106;
    v93[0] = v105;
    v93[1] = v106;
    if (v106)
    {
      v41 = (unint64_t *)(v106 + 8);
      do
        v42 = __ldxr(v41);
      while (__stxr(v42 + 1, v41));
    }
    v43 = ML3ImportSession::updateItemArtist(v37, &v94, v93, 0);
    if (v40)
    {
      v44 = (unint64_t *)&v40->__shared_owners_;
      do
        v45 = __ldaxr(v44);
      while (__stlxr(v45 - 1, v44));
      if (!v45)
      {
        ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
        std::__shared_weak_count::__release_weak(v40);
      }
    }
    v46 = v95;
    if (!v95)
      goto LABEL_30;
    v47 = (unint64_t *)&v95->__shared_owners_;
    do
      v48 = __ldaxr(v47);
    while (__stlxr(v48 - 1, v47));
    if (!v48)
    {
      ((void (*)(std::__shared_weak_count *))v46->__on_zero_shared)(v46);
      std::__shared_weak_count::__release_weak(v46);
      if ((v43 & 1) == 0)
        goto LABEL_66;
    }
    else
    {
LABEL_30:
      if (!v43)
        goto LABEL_66;
    }
    v54 = (uint64_t)v16->_importSession;
    v91 = v99;
    v92 = v100;
    if (v100)
    {
      v55 = (unint64_t *)&v100->__shared_owners_;
      do
        v56 = __ldxr(v55);
      while (__stxr(v56 + 1, v55));
    }
    v57 = (std::__shared_weak_count *)v106;
    v90[0] = v105;
    v90[1] = v106;
    if (v106)
    {
      v58 = (unint64_t *)(v106 + 8);
      do
        v59 = __ldxr(v58);
      while (__stxr(v59 + 1, v58));
    }
    v60 = ML3ImportSession::updateAlbum(v54, &v91, v90, *(_QWORD *)(v103 + 8), 0);
    if (v57)
    {
      v61 = (unint64_t *)&v57->__shared_owners_;
      do
        v62 = __ldaxr(v61);
      while (__stlxr(v62 - 1, v61));
      if (!v62)
      {
        ((void (*)(std::__shared_weak_count *))v57->__on_zero_shared)(v57);
        std::__shared_weak_count::__release_weak(v57);
      }
    }
    v63 = v92;
    if (!v92)
      goto LABEL_56;
    v64 = (unint64_t *)&v92->__shared_owners_;
    do
      v65 = __ldaxr(v64);
    while (__stlxr(v65 - 1, v64));
    if (!v65)
    {
      ((void (*)(std::__shared_weak_count *))v63->__on_zero_shared)(v63);
      std::__shared_weak_count::__release_weak(v63);
      if ((v60 & 1) != 0)
        goto LABEL_57;
    }
    else
    {
LABEL_56:
      if (v60)
      {
LABEL_57:
        v66 = (uint64_t)v16->_importSession;
        v67 = (std::__shared_weak_count *)v106;
        v89[0] = v105;
        v89[1] = v106;
        if (v106)
        {
          v68 = (unint64_t *)(v106 + 8);
          do
            v69 = __ldxr(v68);
          while (__stxr(v69 + 1, v68));
        }
        v51 = ML3ImportSession::updateTrack(v66, v89, 1, 0);
        if (v67)
        {
          v70 = (unint64_t *)&v67->__shared_owners_;
          do
            v71 = __ldaxr(v70);
          while (__stlxr(v71 - 1, v70));
          if (!v71)
          {
            ((void (*)(std::__shared_weak_count *))v67->__on_zero_shared)(v67);
            std::__shared_weak_count::__release_weak(v67);
          }
        }
LABEL_67:
        v72 = v100;
        if (v100)
        {
          v73 = (unint64_t *)&v100->__shared_owners_;
          do
            v74 = __ldaxr(v73);
          while (__stlxr(v74 - 1, v73));
          if (!v74)
          {
            ((void (*)(std::__shared_weak_count *))v72->__on_zero_shared)(v72);
            std::__shared_weak_count::__release_weak(v72);
          }
        }
        v75 = v102;
        if (v102)
        {
          v76 = (unint64_t *)&v102->__shared_owners_;
          do
            v77 = __ldaxr(v76);
          while (__stlxr(v77 - 1, v76));
          if (!v77)
          {
            ((void (*)(std::__shared_weak_count *))v75->__on_zero_shared)(v75);
            std::__shared_weak_count::__release_weak(v75);
          }
        }
        v78 = v104;
        if (v104)
        {
          v79 = (unint64_t *)&v104->__shared_owners_;
          do
            v80 = __ldaxr(v79);
          while (__stlxr(v80 - 1, v79));
          if (!v80)
          {
            ((void (*)(std::__shared_weak_count *))v78->__on_zero_shared)(v78);
            v53 = v78;
            goto LABEL_82;
          }
        }
        goto LABEL_83;
      }
    }
LABEL_66:
    v51 = 0;
    goto LABEL_67;
  }
  v49 = self->_importSession;
  v88[0] = (uint64_t)v7;
  v88[1] = (uint64_t)v11;
  do
    v50 = __ldxr(p_shared_owners);
  while (__stxr(v50 + 1, p_shared_owners));
  v51 = ML3ImportSession::updateTrack((uint64_t)v49, v88, 0, 0);
  do
    v52 = __ldaxr(p_shared_owners);
  while (__stlxr(v52 - 1, p_shared_owners));
  if (!v52)
  {
    ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
    v53 = v11;
LABEL_82:
    std::__shared_weak_count::__release_weak(v53);
  }
LABEL_83:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(v105 + 8), v85);
  *a4 = (id)objc_claimAutoreleasedReturnValue();
  v81 = (std::__shared_weak_count *)v106;
  if (v106)
  {
    v82 = (unint64_t *)(v106 + 8);
    do
      v83 = __ldaxr(v82);
    while (__stlxr(v83 - 1, v82));
    if (!v83)
    {
      ((void (*)(std::__shared_weak_count *))v81->__on_zero_shared)(v81);
      std::__shared_weak_count::__release_weak(v81);
    }
  }

  return v51;
}

- (BOOL)removeTrack:(id)a3 persistentID:(id *)a4
{
  id v6;
  ML3ProtoSyncTrackImportItem *v7;
  ML3MusicLibrary *library;
  MIPMultiverseIdentifier *v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  void *importSession;
  unint64_t v13;
  char v14;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  ML3ProtoSyncTrackImportItem *v20;
  std::__shared_weak_count *v21;
  ML3ProtoSyncTrackImportItem *v22;
  std::__shared_weak_count *v23;

  v6 = a3;
  v7 = (ML3ProtoSyncTrackImportItem *)operator new();
  library = self->_library;
  objc_msgSend(v6, "multiverseIdentifier");
  v9 = (MIPMultiverseIdentifier *)objc_claimAutoreleasedReturnValue();
  ML3ProtoSyncTrackImportItem::ML3ProtoSyncTrackImportItem(v7, library, v9, 0, 0);
  *(_QWORD *)v7 = &off_1E5B4F080;
  v22 = v7;
  v10 = (std::__shared_weak_count *)operator new();
  v10->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v10->__shared_owners_;
  v10->__vftable = (std::__shared_weak_count_vtbl *)&off_1E5B51C70;
  v10->__shared_weak_owners_ = 0;
  v10[1].__vftable = (std::__shared_weak_count_vtbl *)v7;
  v23 = v10;

  importSession = self->_importSession;
  v20 = v7;
  v21 = v10;
  do
    v13 = __ldxr(p_shared_owners);
  while (__stxr(v13 + 1, p_shared_owners));
  v14 = ML3ImportSession::removeTrack((uint64_t)importSession, (uint64_t *)&v20);
  do
    v15 = __ldaxr(p_shared_owners);
  while (__stlxr(v15 - 1, p_shared_owners));
  if (!v15)
  {
    ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
    std::__shared_weak_count::__release_weak(v10);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *((_QWORD *)v22 + 1), v20, v21);
  *a4 = (id)objc_claimAutoreleasedReturnValue();
  v16 = v23;
  if (v23)
  {
    v17 = (unint64_t *)&v23->__shared_owners_;
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_databaseConnection, 0);
}

@end
