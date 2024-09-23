@implementation MKPhotoLibraryAlbumMigrator

- (MKPhotoLibraryAlbumMigrator)init
{
  return -[MKPhotoLibraryAlbumMigrator initWithReuseDatabase:](self, "initWithReuseDatabase:", 0);
}

- (MKPhotoLibraryAlbumMigrator)initWithReuseDatabase:(BOOL)a3
{
  _BOOL8 v3;
  MKPhotoLibraryAlbumMigrator *v4;
  MKPhotoLibraryAssetDatabase *v5;
  MKPhotoLibraryAssetDatabase *db;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MKPhotoLibraryAlbumMigrator;
  v4 = -[MKMigrator init](&v8, sel_init);
  if (v4)
  {
    v5 = -[MKPhotoLibraryAssetDatabase initWithType:reuse:]([MKPhotoLibraryAssetDatabase alloc], "initWithType:reuse:", 2, v3);
    db = v4->_db;
    v4->_db = v5;

    -[MKMigrator setType:](v4, "setType:", 13);
  }
  return v4;
}

- (void)setIdentifier:(id)a3 forAsset:(id)a4
{
  id v6;
  MKPhotoLibraryAlbumMigrator *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  -[MKPhotoLibraryAssetDatabase setIdentifier:forAsset:](v7->_db, "setIdentifier:forAsset:", v8, v6);
  objc_sync_exit(v7);

}

- (BOOL)importAndWait
{
  -[MKPhotoLibraryAlbumMigrator setCollections](self, "setCollections");
  return 1;
}

- (void)setCollections
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id obj;
  MKPhotoLibrary *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  unint64_t v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v28 = -[MKPhotoLibrary initWithContentType:]([MKPhotoLibrary alloc], "initWithContentType:", 0);
  v3 = 80;
  -[MKPhotoLibraryAssetDatabase collections](self->_db, "collections");
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v31;
    v25 = *(_QWORD *)v31;
    do
    {
      v7 = 0;
      v26 = v5;
      do
      {
        if (*(_QWORD *)v31 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v7);
        v29 = 0;
        v9 = -[MKPhotoLibrary countForCollection:error:](v28, "countForCollection:error:", v8, &v29, v25);
        v10 = v29;
        v11 = v10;
        if (v9 >> 3 < 0x271)
        {
          if (v10)
          {
            -[MKMigrator migratorDidFailWithImportError:](self, "migratorDidFailWithImportError:", v10);
            objc_msgSend(*(id *)((char *)&self->super.super.isa + v3), "removeCollection:", v8);
          }
          else
          {
            v14 = objc_msgSend(*(id *)((char *)&self->super.super.isa + v3), "countForCollection:", v8);
            if (v14 >= 5000 - v9)
              v15 = 5000 - v9;
            else
              v15 = v14;
            if (v15 >= 0x64)
              v16 = 100;
            else
              v16 = v15;
            if (v14 <= 5000 - v9)
            {
              if (v15)
              {
                v18 = 0;
                do
                {
                  v19 = (void *)MEMORY[0x2207B99F4]();
                  v20 = v3;
                  objc_msgSend(*(id *)((char *)&self->super.super.isa + v3), "identifiersForCollection:offset:limit:", v8, v18, v16);
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  +[MKLog log](MKLog, "log");
                  v22 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412802;
                    v35 = v8;
                    v36 = 2048;
                    v37 = v18;
                    v38 = 2048;
                    v39 = v16;
                    _os_log_impl(&dword_21EC08000, v22, OS_LOG_TYPE_INFO, "will set collections. collection=%@, offset=%ld, limit=%ld", buf, 0x20u);
                  }

                  -[MKMigrator migratorWillMeasureImport](self, "migratorWillMeasureImport");
                  -[MKPhotoLibrary setCollection:forLocalIdentifiers:](v28, "setCollection:forLocalIdentifiers:", v8, v21);
                  -[MKMigrator migratorDidMeasureImport](self, "migratorDidMeasureImport");
                  +[MKLog log](MKLog, "log");
                  v23 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412802;
                    v35 = v8;
                    v36 = 2048;
                    v37 = v18;
                    v38 = 2048;
                    v39 = v16;
                    _os_log_impl(&dword_21EC08000, v23, OS_LOG_TYPE_INFO, "did set collections. collection=%@, offset=%ld, limit=%ld", buf, 0x20u);
                  }

                  v18 += v16;
                  v15 -= v16;
                  if (v15 >= 0x64)
                    v16 = 100;
                  else
                    v16 = v15;

                  objc_autoreleasePoolPop(v19);
                  v3 = v20;
                }
                while (v15);
              }
              -[MKMigrator migratorDidImport](self, "migratorDidImport");
              objc_msgSend(*(id *)((char *)&self->super.super.isa + v3), "removeCollection:", v8);
              v6 = v25;
              v11 = 0;
            }
            else
            {
              objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MKPhotoLibraryAlbumError"), 1, 0);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              -[MKMigrator migratorDidFailWithImportError:](self, "migratorDidFailWithImportError:", v17);
              objc_msgSend(*(id *)((char *)&self->super.super.isa + v3), "removeCollection:", v8);

            }
            v5 = v26;
          }
        }
        else
        {
          +[MKLog log](MKLog, "log");
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412802;
            v35 = v8;
            v36 = 2048;
            v37 = 5000;
            v38 = 2048;
            v39 = v9;
            _os_log_impl(&dword_21EC08000, v12, OS_LOG_TYPE_INFO, "will skip a collection. collection=%@, capacity=%ld, assets=%ld", buf, 0x20u);
          }

          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MKPhotoLibraryAlbumError"), 1, 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[MKMigrator migratorDidFailWithImportError:](self, "migratorDidFailWithImportError:", v13);
          objc_msgSend(*(id *)((char *)&self->super.super.isa + v3), "removeCollection:", v8);

        }
        ++v7;
      }
      while (v7 != v5);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
    }
    while (v5);
  }

  v24 = *(Class *)((char *)&self->super.super.isa + v3);
  *(Class *)((char *)&self->super.super.isa + v3) = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_db, 0);
}

@end
