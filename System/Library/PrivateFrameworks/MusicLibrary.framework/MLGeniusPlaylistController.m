@implementation MLGeniusPlaylistController

- (MLGeniusPlaylistController)init
{
  MLGeniusPlaylistController *v2;
  unsigned int v3;
  uint64_t v4;
  unsigned __int8 *v5;
  unsigned __int8 *v6;
  int v7;
  int v8;
  _distance_constraint *v9;
  uint64_t v10;
  unint64_t v11;
  _distance_constraint **v12;
  _QWORD *v13;
  _distance_constraint **v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  _distance_constraint **v20;
  _distance_constraint *v21;
  uint64_t v22;
  void (*v23)(unsigned __int8 *);
  _distance_constraint ***v25;
  objc_super v26;
  unint64_t v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;

  v26.receiver = self;
  v26.super_class = (Class)MLGeniusPlaylistController;
  v2 = -[MLGeniusPlaylistController init](&v26, sel_init);
  if (v2)
  {
    v3 = time(0);
    srandom(v3);
    v4 = operator new();
    *(_QWORD *)(v4 + 64) = 0;
    v25 = (_distance_constraint ***)(v4 + 64);
    *(_QWORD *)(v4 + 72) = 0;
    *(_QWORD *)(v4 + 80) = 0;
    *(_QWORD *)v4 = &itdb_echo_library_callbacks;
    *(_QWORD *)(v4 + 8) = v2;
    *(_BYTE *)(v4 + 96) = 0;
    *(_OWORD *)(v4 + 16) = 0u;
    *(_OWORD *)(v4 + 32) = 0u;
    *(_OWORD *)(v4 + 48) = 0u;
    v29 = 0;
    v28 = 0;
    v5 = (unsigned __int8 *)itdb_echo_library_callbacks(v2, &v29, &v28);
    v6 = v5;
    if (v5)
    {
      if (v29)
      {
        LODWORD(v30) = *(_DWORD *)v5;
        v27 = 4;
        (*(void (**)(_QWORD, uint64_t *, uint64_t, uint64_t))(*(_QWORD *)v4 + 72))(*(_QWORD *)(v4 + 8), &v30, 4, 1);
        v7 = v30;
        if ((_DWORD)v30)
        {
          v8 = 0;
          while (2)
          {
            LODWORD(v30) = *(_DWORD *)&v6[v27];
            v27 += 4;
            (*(void (**)(_QWORD, uint64_t *, uint64_t, uint64_t))(*(_QWORD *)v4 + 72))(*(_QWORD *)(v4 + 8), &v30, 4, 1);
            switch((int)v30)
            {
              case 1:
                v9 = (_distance_constraint *)operator new();
                *(_QWORD *)v9 = &off_1E5B4E5C8;
                *((_QWORD *)v9 + 1) = v4;
                _already_added_constraint::parse_config((uint64_t)v9, v6, &v27, v28);
                goto LABEL_11;
              case 2:
                v9 = (_distance_constraint *)operator new();
                *(_QWORD *)v9 = &off_1E5B4F428;
                *((_QWORD *)v9 + 1) = v4;
                v10 = operator new();
                *(_OWORD *)v10 = 0u;
                *(_OWORD *)(v10 + 16) = 0u;
                *(_DWORD *)(v10 + 32) = 1065353216;
                *((_QWORD *)v9 + 3) = v10;
                (*(void (**)(_distance_constraint *, unsigned __int8 *, unint64_t *, _QWORD))(*(_QWORD *)v9 + 32))(v9, v6, &v27, v28);
                goto LABEL_14;
              case 3:
                v9 = (_distance_constraint *)operator new();
                *(_QWORD *)v9 = &off_1E5B4D638;
                *((_QWORD *)v9 + 1) = v4;
                _distance_constraint::parse_config(v9, v6, &v27);
                goto LABEL_11;
              case 4:
                v9 = (_distance_constraint *)operator new();
                *(_QWORD *)v9 = &off_1E5B4DB40;
                *((_QWORD *)v9 + 1) = v4;
                _skip_count_constraint::parse_config(v9, v6, &v27);
                goto LABEL_11;
              case 5:
                v9 = (_distance_constraint *)operator new();
                *(_QWORD *)v9 = &off_1E5B4E630;
                *((_QWORD *)v9 + 1) = v4;
                _random_jitter_constraint::parse_config(v9, v6, &v27);
LABEL_11:
                if (*(_BYTE *)(v4 + 96))
                {
                  (*(void (**)(_distance_constraint *))(*(_QWORD *)v9 + 8))(v9);
                }
                else
                {
LABEL_14:
                  v12 = *(_distance_constraint ***)(v4 + 72);
                  v11 = *(_QWORD *)(v4 + 80);
                  if ((unint64_t)v12 >= v11)
                  {
                    v14 = *v25;
                    v15 = v12 - *v25;
                    v16 = v15 + 1;
                    if ((unint64_t)(v15 + 1) >> 61)
                      std::vector<long long>::__throw_length_error[abi:ne180100]();
                    v17 = v11 - (_QWORD)v14;
                    if (v17 >> 2 > v16)
                      v16 = v17 >> 2;
                    if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFF8)
                      v18 = 0x1FFFFFFFFFFFFFFFLL;
                    else
                      v18 = v16;
                    if (v18)
                    {
                      if (v18 >> 61)
                        std::__throw_bad_array_new_length[abi:ne180100]();
                      v19 = (char *)operator new(8 * v18);
                    }
                    else
                    {
                      v19 = 0;
                    }
                    v20 = (_distance_constraint **)&v19[8 * v15];
                    *v20 = v9;
                    v13 = v20 + 1;
                    if (v12 != v14)
                    {
                      do
                      {
                        v21 = *--v12;
                        *--v20 = v21;
                      }
                      while (v12 != v14);
                      v12 = *v25;
                    }
                    *(_QWORD *)(v4 + 64) = v20;
                    *(_QWORD *)(v4 + 72) = v13;
                    *(_QWORD *)(v4 + 80) = &v19[8 * v18];
                    if (v12)
                      operator delete(v12);
                  }
                  else
                  {
                    *v12 = v9;
                    v13 = v12 + 1;
                  }
                  *(_QWORD *)(v4 + 72) = v13;
                }
                if (++v8 == v7)
                  goto LABEL_33;
                continue;
              default:
LABEL_33:
                *(_QWORD *)(v4 + 88) = 0;
                *(_QWORD *)(v4 + 100) = 0x1400000032;
                if (v27 <= v29 - 8)
                {
                  v30 = *(_QWORD *)&v6[v27];
                  v27 += 8;
                  (*(void (**)(_QWORD, uint64_t *, uint64_t, uint64_t))(*(_QWORD *)v4 + 72))(*(_QWORD *)(v4 + 8), &v30, 8, 1);
                  v22 = v29;
                  *(_QWORD *)(v4 + 88) = v30;
                  if (v27 <= v22 - 4)
                  {
                    LODWORD(v30) = *(_DWORD *)&v6[v27];
                    v27 += 4;
                    (*(void (**)(_QWORD, uint64_t *, uint64_t, uint64_t))(*(_QWORD *)v4 + 72))(*(_QWORD *)(v4 + 8), &v30, 4, 1);
                    *(_DWORD *)(v4 + 100) = v30;
                    if (v27 <= v29 - 4)
                    {
                      LODWORD(v30) = *(_DWORD *)&v6[v27];
                      v27 += 4;
                      (*(void (**)(_QWORD, uint64_t *, uint64_t, uint64_t))(*(_QWORD *)v4 + 72))(*(_QWORD *)(v4 + 8), &v30, 4, 1);
                      *(_DWORD *)(v4 + 104) = v30;
                    }
                  }
                }
                v23 = *(void (**)(unsigned __int8 *))(*(_QWORD *)v4 + 32);
                if (v23)
                  v23(v6);
                else
                  free(v6);
                break;
            }
            break;
          }
        }
      }
    }
    v2->_echo = (void *)v4;
  }
  return v2;
}

- (void)dealloc
{
  void *echo_cluster_playlist;
  _QWORD *echo;
  FILE *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSMutableData *sharedBlobMutableData;
  objc_super v17;

  echo_cluster_playlist = self->_echo_cluster_playlist;
  if (echo_cluster_playlist)
    echo_playlist_close((uint64_t)echo_cluster_playlist);
  echo = self->_echo;
  if (echo)
  {
    v5 = (FILE *)echo[2];
    if (v5)
      fprintf(v5, "sim fetches = %lu, successful sim fetches = %lu, metadata fetches = %lu, successful metadata fetches = %lu\n", echo[3], echo[4], echo[5], echo[6]);
    v6 = echo[9] - echo[8];
    if (v6)
    {
      v7 = 0;
      v8 = v6 >> 3;
      if (v8 <= 1)
        v9 = 1;
      else
        v9 = v8;
      do
      {
        v10 = *(_QWORD *)(echo[8] + 8 * v7);
        if (v10)
          (*(void (**)(uint64_t, SEL))(*(_QWORD *)v10 + 8))(v10, a2);
        ++v7;
      }
      while (v9 != v7);
    }
    v11 = echo[7];
    if (v11)
    {
      v12 = *(_QWORD **)(v11 + 16);
      if (!v12)
        goto LABEL_19;
      do
      {
        v13 = v12[3];
        if (v13)
          (*(void (**)(uint64_t, SEL))(*(_QWORD *)v13 + 8))(v13, a2);
        v12 = (_QWORD *)*v12;
      }
      while (v12);
      v11 = echo[7];
      if (v11)
      {
LABEL_19:
        v14 = std::__hash_table<unsigned long long,echo_hash_shift<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table(v11);
        MEMORY[0x1AF43C744](v14, 0x10A0C408EF24B1CLL);
      }
    }
    v15 = (void *)echo[8];
    if (v15)
    {
      echo[9] = v15;
      operator delete(v15);
    }
    MEMORY[0x1AF43C744](echo, 0x10A0C4091C5D4D3);
  }
  sharedBlobMutableData = self->_sharedBlobMutableData;
  self->_sharedBlobMutableData = 0;

  v17.receiver = self;
  v17.super_class = (Class)MLGeniusPlaylistController;
  -[MLGeniusPlaylistController dealloc](&v17, sel_dealloc);
}

- (id)tracksFromClusterForCount:(unint64_t)a3 error:(id *)a4
{
  dispatch_semaphore_t v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  _QWORD block[5];
  NSObject *v13;
  uint64_t *v14;
  uint64_t *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__10393;
  v27 = __Block_byref_object_dispose__10394;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__10393;
  v21 = __Block_byref_object_dispose__10394;
  v22 = 0;
  v7 = dispatch_semaphore_create(0);
  dispatch_get_global_queue(0, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__MLGeniusPlaylistController_tracksFromClusterForCount_error___block_invoke;
  block[3] = &unk_1E5B62D40;
  v14 = &v17;
  v15 = &v23;
  block[4] = self;
  v16 = a3;
  v9 = v7;
  v13 = v9;
  dispatch_async(v8, block);

  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  if (a4)
    *a4 = objc_retainAutorelease((id)v24[5]);
  v10 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v10;
}

- (id)_sharedBlobMutableData
{
  NSMutableData *sharedBlobMutableData;
  NSMutableData *v4;
  NSMutableData *v5;

  sharedBlobMutableData = self->_sharedBlobMutableData;
  if (!sharedBlobMutableData)
  {
    v4 = (NSMutableData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 0);
    v5 = self->_sharedBlobMutableData;
    self->_sharedBlobMutableData = v4;

    sharedBlobMutableData = self->_sharedBlobMutableData;
  }
  return sharedBlobMutableData;
}

- (BOOL)_canIncludeTrackInGeniusContainer:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "valueForProperty:", CFSTR("item_video.is_rental"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = 0;
  if (objc_msgSend(v4, "isEqual:", v5))
  {
    objc_msgSend(v3, "valueForProperty:", CFSTR("item_stats.hidden"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "BOOLValue") & 1) != 0)
    {
      LOBYTE(v6) = 0;
    }
    else
    {
      objc_msgSend(v3, "valueForProperty:", CFSTR("ML3IsCurrentlyRestrictedMedia(item.media_type, item_extra.content_rating, item_extra.content_rating_level, (SELECT value FROM _MLDatabaseProperties WHERE key='MPExplicitContentAllowedBoolean'))"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v8, "BOOLValue") ^ 1;

    }
  }

  return v6;
}

- (id)_debugGetTracksStartingAtTrackWithPersistentID:(unint64_t)a3 maxTracks:(unint64_t)a4 stride:(int)a5
{
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD *v25;
  unint64_t v26;
  unint64_t v27;
  _QWORD v28[3];
  int v29;
  _QWORD v30[3];
  char v31;
  _QWORD v32[3];
  int v33;

  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x2020000000;
    if (a5 <= 1)
      v9 = 1;
    else
      v9 = a5;
    v33 = v9;
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x2020000000;
    v31 = 0;
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x2020000000;
    v29 = 0;
    +[MLITDBGeniusDatabase sharedGeniusDatabase](MLITDBGeniusDatabase, "sharedGeniusDatabase");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "musicLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    +[ML3BitMaskPredicate predicateWithProperty:mask:value:](ML3BitMaskPredicate, "predicateWithProperty:mask:value:", CFSTR("media_type"), 8, 8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3Track defaultOrderingTerms](ML3Track, "defaultOrderingTerms");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[ML3Entity queryWithLibrary:predicate:orderingTerms:](ML3Track, "queryWithLibrary:predicate:orderingTerms:", v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __94__MLGeniusPlaylistController__debugGetTracksStartingAtTrackWithPersistentID_maxTracks_stride___block_invoke;
    v20[3] = &unk_1E5B62D70;
    v15 = v11;
    v21 = v15;
    v23 = v30;
    v24 = v28;
    v25 = v32;
    v26 = a3;
    v16 = v8;
    v22 = v16;
    v27 = a4;
    objc_msgSend(v14, "enumeratePersistentIDsUsingBlock:", v20);
    v17 = v22;
    v18 = v16;

    _Block_object_dispose(v28, 8);
    _Block_object_dispose(v30, 8);
    _Block_object_dispose(v32, 8);
    return v18;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array", a3, 0, *(_QWORD *)&a5);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (BOOL)_onBackgroundQueue_fakePopulateContainer:(id)a3 withSeedTrack:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  BOOL v22;
  char v23;
  void *v24;
  void *v26;
  _QWORD v28[4];
  id v29;
  id v30;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  +[MLITDBGeniusDatabase sharedGeniusDatabase](MLITDBGeniusDatabase, "sharedGeniusDatabase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "defaultMinTrackCount");

  +[MLITDBGeniusDatabase sharedGeniusDatabase](MLITDBGeniusDatabase, "sharedGeniusDatabase");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "defaultTrackCount");

  v14 = (_onBackgroundQueue_fakePopulateContainer_withSeedTrack_error__gStride & 1u) + 1;
  v15 = objc_msgSend(v9, "persistentID");
  v16 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AC149000, v16, OS_LOG_TYPE_DEFAULT, "NOTE: Fake echo data being used, ignoring genius database", buf, 2u);
  }

  objc_msgSend(v8, "library");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "library");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17 != v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MLGeniusPlaylistController.m"), 521, &stru_1E5B66908);

  }
  -[MLGeniusPlaylistController _debugGetTracksStartingAtTrackWithPersistentID:maxTracks:stride:](self, "_debugGetTracksStartingAtTrackWithPersistentID:maxTracks:stride:", v15, v13, v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "mutableCopy");

  v21 = objc_msgSend(v20, "count");
  if (v21)
    v22 = v21 >= v11;
  else
    v22 = 0;
  v23 = !v22;
  if (v22)
  {
    objc_msgSend(v9, "valueForProperty:", CFSTR("ROWID"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setValue:forProperty:", v24, CFSTR("container_seed.item_pid"));

    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __91__MLGeniusPlaylistController__onBackgroundQueue_fakePopulateContainer_withSeedTrack_error___block_invoke;
    v28[3] = &unk_1E5B62EB8;
    v29 = v8;
    v30 = v20;
    objc_msgSend(v17, "performDatabaseTransactionWithBlock:", v28);

  }
  else if (a5 && !*a5 && v21 < v11)
  {
    MLCreateError_TooFewItemsReason(v21);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  ++_onBackgroundQueue_fakePopulateContainer_withSeedTrack_error__gStride;

  return v23 ^ 1;
}

- (BOOL)_onBackgroundQueue_populateContainer:(id)a3 seedTrack:(id)a4 error:(id *)a5
{
  id v9;
  void *v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;
  unint64_t v22;
  BOOL v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  NSMutableData *sharedBlobMutableData;
  void *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  _QWORD v34[5];
  id v35;
  uint64_t *v36;
  uint8_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint8_t v40[8];
  uint8_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint8_t buf[4];
  unint64_t v51;
  __int16 v52;
  unint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v30 = a3;
  v9 = a4;
  +[MLITDBGeniusDatabase sharedGeniusDatabase](MLITDBGeniusDatabase, "sharedGeniusDatabase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "defaultMinTrackCount");

  +[MLITDBGeniusDatabase sharedGeniusDatabase](MLITDBGeniusDatabase, "sharedGeniusDatabase");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "defaultTrackCount");

  objc_msgSend(v9, "valueForProperty:", CFSTR("item_extra.genius_id"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "unsignedLongLongValue");

  if (v15)
  {
    objc_msgSend(v30, "library");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "library");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16 != v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MLGeniusPlaylistController.m"), 571, &stru_1E5B66908);

    }
    v46 = 0;
    v47 = &v46;
    v48 = 0x2020000000;
    v49 = 0;
    *(_QWORD *)v40 = 0;
    v41 = v40;
    v42 = 0x3032000000;
    v43 = __Block_byref_object_copy__10393;
    v44 = __Block_byref_object_dispose__10394;
    v45 = 0;
    v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    +[MLITDBGeniusDatabase sharedGeniusDatabase](MLITDBGeniusDatabase, "sharedGeniusDatabase");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = MEMORY[0x1E0C809B0];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __83__MLGeniusPlaylistController__onBackgroundQueue_populateContainer_seedTrack_error___block_invoke;
    v34[3] = &unk_1E5B62D98;
    v36 = &v46;
    v34[4] = self;
    v37 = v40;
    v38 = v15;
    v21 = v18;
    v35 = v21;
    v39 = v13;
    objc_msgSend(v19, "performGeniusDatabaseReadWithBlock:", v34);

    if (a5 && !*a5)
      *a5 = objc_retainAutorelease(*((id *)v41 + 5));
    if (v47[3])
    {
      v22 = objc_msgSend(v21, "count");
      if (v22 && (objc_msgSend(v21, "replaceObjectAtIndex:withObject:", 0, v9), v22 >= v11))
      {
        objc_msgSend(v9, "valueForProperty:", CFSTR("ROWID"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setValue:forProperty:", v26, CFSTR("container_seed.item_pid"));

        v31[0] = v20;
        v31[1] = 3221225472;
        v31[2] = __83__MLGeniusPlaylistController__onBackgroundQueue_populateContainer_seedTrack_error___block_invoke_89;
        v31[3] = &unk_1E5B62EB8;
        v32 = v30;
        v33 = v21;
        objc_msgSend(v16, "performDatabaseTransactionWithBlock:", v31);

        v23 = 1;
      }
      else
      {
        v23 = 0;
        if (a5 && !*a5 && v22 < v11)
        {
          v24 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218240;
            v51 = v11;
            v52 = 2048;
            v53 = v22;
            _os_log_impl(&dword_1AC149000, v24, OS_LOG_TYPE_DEFAULT, "NOTE: Could not create playlist, too few results (min=%ld, found=%ld)", buf, 0x16u);
          }

          MLCreateError_TooFewItemsReason(v22);
          v23 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      echo_playlist_close(v47[3]);
      v47[3] = 0;
      sharedBlobMutableData = self->_sharedBlobMutableData;
      self->_sharedBlobMutableData = 0;

    }
    else
    {
      v23 = 0;
    }

    _Block_object_dispose(v40, 8);
    _Block_object_dispose(&v46, 8);

  }
  else
  {
    v25 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v40 = 0;
      _os_log_impl(&dword_1AC149000, v25, OS_LOG_TYPE_DEFAULT, "NOTE: Could not create playlist, seedTrackGlobalID == 0.", v40, 2u);
    }

    if (a5 && !*a5)
    {
      MLCreateError_TooFewItemsReason(0);
      v23 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = 0;
    }
  }

  return v23;
}

- (BOOL)_createClusterPlaylistWithSeedTracks:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  NSMutableData *sharedBlobMutableData;
  BOOL v10;
  _QWORD v12[4];
  id v13;
  MLGeniusPlaylistController *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__10393;
  v20 = __Block_byref_object_dispose__10394;
  v21 = 0;
  +[MLITDBGeniusDatabase sharedGeniusDatabase](MLITDBGeniusDatabase, "sharedGeniusDatabase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73__MLGeniusPlaylistController__createClusterPlaylistWithSeedTracks_error___block_invoke;
  v12[3] = &unk_1E5B62DC0;
  v8 = v6;
  v13 = v8;
  v14 = self;
  v15 = &v16;
  objc_msgSend(v7, "performGeniusDatabaseReadWithBlock:", v12);

  if (a4 && !*a4)
    *a4 = objc_retainAutorelease((id)v17[5]);
  sharedBlobMutableData = self->_sharedBlobMutableData;
  self->_sharedBlobMutableData = 0;

  v10 = self->_echo_cluster_playlist != 0;
  _Block_object_dispose(&v16, 8);

  return v10;
}

- (id)_onBackgroundQueue_tracksFromClusterForPlaylistItemMax:(unint64_t)a3 error:(id *)a4
{
  id v6;
  __int128 v7;
  void *v8;
  uint64_t track;
  uint64_t v10;
  void *v11;
  int v12;
  NSObject *v13;
  NSObject *v15;
  NSMutableData **p_sharedBlobMutableData;
  NSMutableData *sharedBlobMutableData;
  NSMutableData *v18;
  __int128 v20;
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (self->_echo_cluster_playlist)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    *(_QWORD *)&v7 = 134217984;
    v20 = v7;
    while (1)
    {
      if (objc_msgSend(v6, "count", v20) >= a3)
        goto LABEL_22;
      v8 = (void *)MEMORY[0x1AF43CC0C]();
      track = echo_playlist_next_track((uint64_t)self->_echo_cluster_playlist);
      v10 = track;
      if (track)
        break;
      v12 = 4;
LABEL_14:
      objc_autoreleasePoolPop(v8);
      if (v12 == 4)
        goto LABEL_22;
    }
    trackWithGlobalID(track, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      if (-[MLGeniusPlaylistController _canIncludeTrackInGeniusContainer:](self, "_canIncludeTrackInGeniusContainer:", v11))
      {
        objc_msgSend(v6, "addObject:", v11);
        v12 = 0;
LABEL_13:

        goto LABEL_14;
      }
    }
    else
    {
      v13 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = v20;
        v22 = v10;
        _os_log_impl(&dword_1AC149000, v13, OS_LOG_TYPE_DEBUG, "Note: Could not locate track with globalID = %llu", buf, 0xCu);
      }

    }
    v12 = 3;
    goto LABEL_13;
  }
  v15 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AC149000, v15, OS_LOG_TYPE_DEFAULT, "ERROR: Could not generate playlist tracks, no active cluster playlist.", buf, 2u);
  }

  if (a4 && !*a4)
  {
    MLCreateError_TooFewItemsReason(0);
    v6 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
LABEL_22:
  sharedBlobMutableData = self->_sharedBlobMutableData;
  p_sharedBlobMutableData = &self->_sharedBlobMutableData;
  *p_sharedBlobMutableData = 0;

  v18 = *p_sharedBlobMutableData;
  *p_sharedBlobMutableData = 0;

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedBlobMutableData, 0);
}

void __73__MLGeniusPlaylistController__createClusterPlaylistWithSeedTracks_error___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t i;
  void *v5;
  void *v6;
  _echo_context *v7;
  unsigned int v8;
  BOOL v9;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  unsigned int v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  size_t v32;
  unint64_t v33;
  uint64_t *v34;
  _QWORD *v35;
  uint64_t *v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t *v47;
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  void *__p;
  char *v57;
  unint64_t v58;

  v1 = a1;
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v2 = objc_msgSend(*(id *)(v1 + 32), "count");
    v3 = malloc_type_malloc(8 * objc_msgSend(*(id *)(v1 + 32), "count"), 0x100004000313F17uLL);
    if (v2)
    {
      for (i = 0; i != v2; ++i)
      {
        objc_msgSend(*(id *)(v1 + 32), "objectAtIndex:", i);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "valueForProperty:", CFSTR("item_extra.genius_id"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v3[i] = objc_msgSend(v6, "unsignedLongLongValue");

      }
    }
    v7 = *(_echo_context **)(*(_QWORD *)(v1 + 40) + 8);
    v8 = objc_msgSend(*(id *)(v1 + 32), "count");
    if (v7)
      v9 = v3 == 0;
    else
      v9 = 1;
    if (v9 || v8 == 0)
    {
      free(v3);
    }
    else
    {
      if (v8 == 1)
      {
        v11 = _echo_context::initialize_playlist(v7, *v3);
      }
      else
      {
        v52 = v1;
        if (v8 >= 0x64)
          v12 = 100;
        else
          v12 = v8;
        v55 = v12;
        __p = 0;
        v57 = 0;
        v58 = 0;
        v13 = v8;
        std::vector<unsigned long long>::reserve(&__p, v8);
        v14 = 0;
        v16 = v57;
        v15 = v58;
        v17 = (char *)__p;
        do
        {
          if ((unint64_t)v16 >= v15)
          {
            v18 = (v16 - v17) >> 3;
            v19 = v18 + 1;
            if ((unint64_t)(v18 + 1) >> 61)
            {
              __p = v17;
              std::vector<long long>::__throw_length_error[abi:ne180100]();
            }
            if ((uint64_t)(v15 - (_QWORD)v17) >> 2 > v19)
              v19 = (uint64_t)(v15 - (_QWORD)v17) >> 2;
            if (v15 - (unint64_t)v17 >= 0x7FFFFFFFFFFFFFF8)
              v20 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v20 = v19;
            if (v20)
              v20 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<long long>>(v20);
            else
              v21 = 0;
            v22 = (char *)(v20 + 8 * v18);
            *(_QWORD *)v22 = v3[v14];
            v23 = v22 + 8;
            while (v16 != v17)
            {
              v24 = *((_QWORD *)v16 - 1);
              v16 -= 8;
              *((_QWORD *)v22 - 1) = v24;
              v22 -= 8;
            }
            v15 = v20 + 8 * v21;
            if (v17)
              operator delete(v17);
            v17 = v22;
            v16 = v23;
          }
          else
          {
            *(_QWORD *)v16 = v3[v14];
            v16 += 8;
          }
          ++v14;
        }
        while (v14 != v13);
        __p = v17;
        v25 = operator new();
        *(_QWORD *)v25 = 0;
        *(_QWORD *)(v25 + 8) = 0;
        *(_QWORD *)(v25 + 16) = 0;
        std::vector<unsigned long long>::reserve((void **)v25, (v55 - 1));
        v53 = 0;
        v54 = v25;
        v26 = 0;
        do
        {
          v27 = v16 - v17;
          if ((unint64_t)(v16 - v17) < 9)
          {
            v29 = 0;
          }
          else
          {
            v28 = (*(uint64_t (**)(_QWORD, unint64_t))(*(_QWORD *)v7 + 64))(*((_QWORD *)v7 + 1), (unint64_t)v27 >> 3);
            if (v28 >= ((unint64_t)v27 >> 3))
              v28 %= ((unint64_t)v27 >> 3);
            if (v27 >> 3 <= (unint64_t)v28)
              v29 = (v27 >> 3) - 1;
            else
              v29 = v28;
          }
          v30 = &v17[8 * v29];
          v31 = *(_QWORD *)v30;
          v32 = v16 - (v30 + 8);
          if (v32)
            memmove(&v17[8 * v29], v30 + 8, v32);
          if ((*(unsigned int (**)(_QWORD, uint64_t))(*(_QWORD *)v7 + 16))(*((_QWORD *)v7 + 1), v31) == 1)
          {
            if (v53)
            {
              v34 = *(uint64_t **)(v54 + 8);
              v33 = *(_QWORD *)(v54 + 16);
              if ((unint64_t)v34 >= v33)
              {
                v36 = *(uint64_t **)v54;
                v37 = ((uint64_t)v34 - *(_QWORD *)v54) >> 3;
                v38 = v37 + 1;
                if ((unint64_t)(v37 + 1) >> 61)
                  std::vector<long long>::__throw_length_error[abi:ne180100]();
                v39 = v33 - (_QWORD)v36;
                if (v39 >> 2 > v38)
                  v38 = v39 >> 2;
                if ((unint64_t)v39 >= 0x7FFFFFFFFFFFFFF8)
                  v40 = 0x1FFFFFFFFFFFFFFFLL;
                else
                  v40 = v38;
                if (v40)
                  v40 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<long long>>(v40);
                else
                  v41 = 0;
                v42 = (uint64_t *)(v40 + 8 * v37);
                *v42 = v31;
                v35 = v42 + 1;
                while (v34 != v36)
                {
                  v43 = *--v34;
                  *--v42 = v43;
                }
                *(_QWORD *)v54 = v42;
                *(_QWORD *)(v54 + 8) = v35;
                *(_QWORD *)(v54 + 16) = v40 + 8 * v41;
                if (v36)
                  operator delete(v36);
              }
              else
              {
                *v34 = v31;
                v35 = v34 + 1;
              }
              *(_QWORD *)(v54 + 8) = v35;
            }
            else
            {
              v53 = v31;
            }
          }
          v16 = &v30[v32];
          ++v26;
        }
        while (v26 != v55);
        v1 = v52;
        if (v53 && (v44 = _echo_context::initialize_playlist(v7, v53), (v11 = v44) != 0))
        {
          v45 = *(_QWORD *)(v44 + 32);
          if (v45)
          {
            v46 = *(void **)v45;
            if (*(_QWORD *)v45)
            {
              *(_QWORD *)(v45 + 8) = v46;
              operator delete(v46);
            }
            MEMORY[0x1AF43C744](v45, 0x10C402FEFCB83);
          }
          *(_QWORD *)(v11 + 32) = v54;
          *(_BYTE *)(v11 + 186) = 1;
        }
        else
        {
          v47 = *(uint64_t **)v54;
          if (*(_QWORD *)v54)
          {
            *(_QWORD *)(v54 + 8) = v47;
            operator delete(v47);
          }
          MEMORY[0x1AF43C744](v54, 0x10C402FEFCB83);
          v11 = 0;
        }
        if (__p)
          operator delete(__p);
      }
      free(v3);
      if (v11)
      {
        *(_QWORD *)(*(_QWORD *)(v1 + 40) + 24) = v11;
        return;
      }
    }
    v48 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(__p) = 0;
      _os_log_impl(&dword_1AC149000, v48, OS_LOG_TYPE_DEFAULT, "NOTE: Could not create cluster playlist", (uint8_t *)&__p, 2u);
    }

    MLCreateError_TooFewItemsReason(0);
    v49 = objc_claimAutoreleasedReturnValue();
    v50 = *(_QWORD *)(*(_QWORD *)(v1 + 48) + 8);
    v51 = *(void **)(v50 + 40);
    *(_QWORD *)(v50 + 40) = v49;

  }
}

void __83__MLGeniusPlaylistController__onBackgroundQueue_populateContainer_seedTrack_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _echo_context *v4;
  void *v5;
  uint64_t track;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_echo_context **)(*(_QWORD *)(a1 + 32) + 8);
  if (v4)
    v4 = (_echo_context *)_echo_context::initialize_playlist(v4, *(_QWORD *)(a1 + 64));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v4;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    if ((unint64_t)objc_msgSend(*(id *)(a1 + 40), "count") < *(_QWORD *)(a1 + 72))
    {
      while (1)
      {
        v5 = (void *)MEMORY[0x1AF43CC0C]();
        track = echo_playlist_next_track(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
        if (!track)
          break;
        v7 = track;
        trackWithGlobalID(track, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          if (objc_msgSend(*(id *)(a1 + 32), "_canIncludeTrackInGeniusContainer:", v8))
            objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
        }
        else
        {
          v9 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134217984;
            v15 = v7;
            _os_log_impl(&dword_1AC149000, v9, OS_LOG_TYPE_DEBUG, "Note: Could not locate track with globalID = %llu", buf, 0xCu);
          }

        }
        objc_autoreleasePoolPop(v5);
        if ((unint64_t)objc_msgSend(*(id *)(a1 + 40), "count") >= *(_QWORD *)(a1 + 72))
          goto LABEL_18;
      }
      objc_autoreleasePoolPop(v5);
    }
  }
  else
  {
    v10 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AC149000, v10, OS_LOG_TYPE_DEFAULT, "NOTE: Could not create playlist, seedTrackGlobalID == 0.", buf, 2u);
    }

    MLCreateError_TooFewItemsReason(0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

  }
LABEL_18:

}

uint64_t __83__MLGeniusPlaylistController__onBackgroundQueue_populateContainer_seedTrack_error___block_invoke_89(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "removeAllTracks");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = *(id *)(a1 + 40);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "persistentID", (_QWORD)v10));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  objc_msgSend(*(id *)(a1 + 32), "appendTracksWithPersistentIDs:notify:", v2, 1);
  return 1;
}

uint64_t __91__MLGeniusPlaylistController__onBackgroundQueue_fakePopulateContainer_withSeedTrack_error___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "removeAllTracks");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = *(id *)(a1 + 40);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "persistentID", (_QWORD)v10));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  objc_msgSend(*(id *)(a1 + 32), "appendTracksWithPersistentIDs:notify:", v2, 1);
  return 1;
}

void __94__MLGeniusPlaylistController__debugGetTracksStartingAtTrackWithPersistentID_maxTracks_stride___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  ML3Track *v7;

  v7 = -[ML3Entity initWithPersistentID:inLibrary:]([ML3Track alloc], "initWithPersistentID:inLibrary:", a2, *(_QWORD *)(a1 + 32));
  if (-[ML3Entity persistentID](v7, "persistentID") == *(_QWORD *)(a1 + 72))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
  --*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    if (*(int *)(v6 + 24) <= 0)
    {
      *(_DWORD *)(v6 + 24) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
      if ((unint64_t)objc_msgSend(*(id *)(a1 + 40), "count") >= *(_QWORD *)(a1 + 80))
        *a4 = 1;
    }
  }

}

intptr_t __62__MLGeniusPlaylistController_tracksFromClusterForCount_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id obj;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 64);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "_onBackgroundQueue_tracksFromClusterForPlaylistItemMax:error:", v3, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count")
    && !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    MLCreateError_UnknownReason();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

+ (void)ignoreUnusedWarnings
{
  char __str[16];
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v6 = 0u;
  v7 = 0u;
  v4 = 0u;
  v5 = 0u;
  *(_OWORD *)__str = 0u;
  v3 = 0u;
  __sprintf_chk(__str, 0, 0x80uLL, "%.16llX", 0);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", __str);

  v8 = 0u;
  v9 = 0u;
  v6 = 0u;
  v7 = 0u;
  v4 = 0u;
  v5 = 0u;
  *(_OWORD *)__str = 0u;
  v3 = 0u;
  objc_msgSend(0, "getCString:maxLength:encoding:", __str, 127, 1);
  strtoull(__str, 0, 16);
  v8 = 0u;
  v9 = 0u;
  v6 = 0u;
  v7 = 0u;
  v4 = 0u;
  v5 = 0u;
  *(_OWORD *)__str = 0u;
  v3 = 0u;
  __sprintf_chk(__str, 0, 0x80uLL, "%llu", 0);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", __str);

  v8 = 0u;
  v9 = 0u;
  v6 = 0u;
  v7 = 0u;
  v4 = 0u;
  v5 = 0u;
  *(_OWORD *)__str = 0u;
  v3 = 0u;
  objc_msgSend(0, "getCString:maxLength:encoding:", __str, 127, 1);
  strtoull(__str, 0, 10);
}

+ (BOOL)useFakeGeniusData
{
  return 0;
}

+ (BOOL)hasGeniusFeatureEnabled
{
  void *v3;
  char v4;

  +[MLITDBGeniusDatabase sharedGeniusDatabase](MLITDBGeniusDatabase, "sharedGeniusDatabase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "hasGeniusFeatureEnabled") & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(a1, "useFakeGeniusData");

  return v4;
}

+ (BOOL)hasGeniusDataAvailable
{
  void *v3;
  char v4;

  +[MLITDBGeniusDatabase sharedGeniusDatabase](MLITDBGeniusDatabase, "sharedGeniusDatabase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "hasGeniusDataAvailable") & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(a1, "useFakeGeniusData");

  return v4;
}

+ (unint64_t)defaultTrackCount
{
  void *v2;
  unint64_t v3;

  +[MLITDBGeniusDatabase sharedGeniusDatabase](MLITDBGeniusDatabase, "sharedGeniusDatabase");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "defaultTrackCount");

  return v3;
}

+ (unint64_t)defaultMinTrackCount
{
  void *v2;
  unint64_t v3;

  +[MLITDBGeniusDatabase sharedGeniusDatabase](MLITDBGeniusDatabase, "sharedGeniusDatabase");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "defaultMinTrackCount");

  return v3;
}

+ (void)populateContainer:(id)a3 withSeedTrack:(id)a4 completionBlock:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  uint64_t v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  void (**v19)(_QWORD, _QWORD, _QWORD);
  _QWORD v20[4];
  id v21;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __78__MLGeniusPlaylistController_populateContainer_withSeedTrack_completionBlock___block_invoke;
  v20[3] = &unk_1E5B62D18;
  v11 = v9;
  v21 = v11;
  v12 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1AF43CDE0](v20);
  if (v8 && (v13 = objc_msgSend(v8, "persistentID"), v7) && v13)
  {
    dispatch_get_global_queue(0, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    v16[0] = v10;
    v16[1] = 3221225472;
    v16[2] = __78__MLGeniusPlaylistController_populateContainer_withSeedTrack_completionBlock___block_invoke_2;
    v16[3] = &unk_1E5B656C0;
    v17 = v7;
    v18 = v8;
    v19 = v12;
    dispatch_async(v14, v16);

    v15 = v17;
  }
  else
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("MLMusicLibraryErrorDomain"), 1, 0);
    ((void (**)(_QWORD, _QWORD, void *))v12)[2](v12, 0, v15);
  }

}

+ (id)playlistControllerWithSeedTracks:(id)a3 error:(id *)a4
{
  id v5;
  MLGeniusPlaylistController *v6;

  v5 = a3;
  v6 = objc_alloc_init(MLGeniusPlaylistController);
  LOBYTE(a4) = -[MLGeniusPlaylistController _createClusterPlaylistWithSeedTracks:error:](v6, "_createClusterPlaylistWithSeedTracks:error:", v5, a4);

  if ((a4 & 1) == 0)
  {

    v6 = 0;
  }
  return v6;
}

+ (id)geniusTracksForSeedTrack:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _QWORD v26[4];

  v5 = a3;
  +[MLITDBGeniusDatabase sharedGeniusDatabase](MLITDBGeniusDatabase, "sharedGeniusDatabase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "defaultTrackCount");

  objc_msgSend(v5, "valueForProperty:", CFSTR("item_extra.genius_id"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedLongLongValue");

  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v26[3] = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__10393;
  v24 = __Block_byref_object_dispose__10394;
  v25 = 0;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  +[MLITDBGeniusDatabase sharedGeniusDatabase](MLITDBGeniusDatabase, "sharedGeniusDatabase");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __61__MLGeniusPlaylistController_geniusTracksForSeedTrack_error___block_invoke;
  v14[3] = &unk_1E5B62DE8;
  v16 = v26;
  v17 = &v20;
  v18 = v9;
  v12 = v10;
  v15 = v12;
  v19 = v7;
  objc_msgSend(v11, "performGeniusDatabaseReadWithBlock:", v14);

  if (a4 && !*a4)
    *a4 = objc_retainAutorelease((id)v21[5]);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(v26, 8);

  return v12;
}

void __61__MLGeniusPlaylistController_geniusTracksForSeedTrack_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  MLGeniusPlaylistController *v4;
  _echo_context *echo;
  void *v6;
  uint64_t track;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc_init(MLGeniusPlaylistController);
  echo = (_echo_context *)v4->_echo;
  if (echo)
    echo = (_echo_context *)_echo_context::initialize_playlist(echo, *(_QWORD *)(a1 + 56));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = echo;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") < *(_QWORD *)(a1 + 64))
    {
      while (1)
      {
        v6 = (void *)MEMORY[0x1AF43CC0C]();
        track = echo_playlist_next_track(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
        if (!track)
          break;
        v8 = track;
        trackWithGlobalID(track, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          if (-[MLGeniusPlaylistController _canIncludeTrackInGeniusContainer:](v4, "_canIncludeTrackInGeniusContainer:", v9))
          {
            objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);
          }
        }
        else
        {
          v10 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134217984;
            v16 = v8;
            _os_log_impl(&dword_1AC149000, v10, OS_LOG_TYPE_DEBUG, "Note: Could not locate track with globalID = %llu", buf, 0xCu);
          }

        }
        objc_autoreleasePoolPop(v6);
        if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") >= *(_QWORD *)(a1 + 64))
          goto LABEL_18;
      }
      objc_autoreleasePoolPop(v6);
    }
  }
  else
  {
    v11 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AC149000, v11, OS_LOG_TYPE_DEFAULT, "NOTE: Could not create playlist, seedTrackGlobalID == 0.", buf, 2u);
    }

    MLCreateError_TooFewItemsReason(0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

  }
LABEL_18:

}

uint64_t __78__MLGeniusPlaylistController_populateContainer_withSeedTrack_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __78__MLGeniusPlaylistController_populateContainer_withSeedTrack_completionBlock___block_invoke_2(_QWORD *a1)
{
  MLGeniusPlaylistController *v2;
  _BOOL4 v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v2 = objc_alloc_init(MLGeniusPlaylistController);
  v3 = +[MLGeniusPlaylistController useFakeGeniusData](MLGeniusPlaylistController, "useFakeGeniusData");
  v4 = a1[4];
  v5 = a1[5];
  if (v3)
  {
    v11 = 0;
    v6 = -[MLGeniusPlaylistController _onBackgroundQueue_fakePopulateContainer:withSeedTrack:error:](v2, "_onBackgroundQueue_fakePopulateContainer:withSeedTrack:error:", v4, v5, &v11);
    v7 = v11;
  }
  else
  {
    v10 = 0;
    v6 = -[MLGeniusPlaylistController _onBackgroundQueue_populateContainer:seedTrack:error:](v2, "_onBackgroundQueue_populateContainer:seedTrack:error:", v4, v5, &v10);
    v7 = v10;
  }
  v8 = v7;
  v9 = v8;
  if (!v6 && !v8)
  {
    MLCreateError_UnknownReason();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(a1[6] + 16))();

}

@end
