@implementation ML3MigrationFunction1240020to1240030

void __ML3MigrationFunction1240020to1240030_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  ML3MigrationMisgroupedAlbum *v8;

  v3 = a2;
  v4 = objc_msgSend(v3, "int64ForColumnIndex:", 0);
  v5 = objc_msgSend(v3, "int64ForColumnIndex:", 1);

  v8 = -[ML3MigrationMisgroupedAlbum initWithAlbumPID:albumArtistPID:]([ML3MigrationMisgroupedAlbum alloc], "initWithAlbumPID:albumArtistPID:", v4, v5);
  v6 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, v7);

}

void __ML3MigrationFunction1240020to1240030_block_invoke_966(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  ML3MigrationMisgroupedTrack *v7;
  id v8;

  v3 = a2;
  v4 = objc_msgSend(v3, "int64ForColumnIndex:", 0);
  v5 = objc_msgSend(v3, "int64ForColumnIndex:", 1);
  objc_msgSend(v3, "numberForColumnIndex:", 2);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ML3MigrationMisgroupedTrack initWithPersistentID:albumArtistPID:]([ML3MigrationMisgroupedTrack alloc], "initWithPersistentID:albumArtistPID:", v4, v5);
  objc_msgSend(v6, "addMisgroupedTrack:", v7);

}

void __ML3MigrationFunction1240020to1240030_block_invoke_968(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  id obj;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = objc_msgSend(a2, "longLongValue");
  if (v8 != objc_msgSend(*(id *)(a1 + 32), "albumArtistPID"))
  {
    v9 = *(void **)(a1 + 40);
    v10 = objc_msgSend(*(id *)(a1 + 32), "albumPID");
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    obj = *(id *)(v11 + 40);
    LOBYTE(v9) = ML3MigrationCreateNewAlbumForMisgroupedTracks(v9, v10, v7, &obj);
    objc_storeStrong((id *)(v11 + 40), obj);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (_BYTE)v9;
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      v12 = os_log_create("com.apple.amp.medialibrary", "Migration");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
        *(_DWORD *)buf = 138543362;
        v16 = v13;
        _os_log_impl(&dword_1AC149000, v12, OS_LOG_TYPE_ERROR, "Error while splitting misgrouped track into new album. %{public}@", buf, 0xCu);
      }

      *a4 = 1;
    }
  }

}

@end
