@implementation AVTStickerRecentsMigrator

- (AVTStickerRecentsMigrator)initWithStore:(id)a3 stickerConfigurationProvider:(id)a4 environment:(id)a5
{
  id v9;
  id v10;
  id v11;
  AVTStickerRecentsMigrator *v12;
  AVTStickerRecentsMigrator *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AVTStickerRecentsMigrator;
  v12 = -[AVTStickerRecentsMigrator init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_store, a3);
    objc_storeStrong((id *)&v13->_stickerConfigurationProvider, a4);
    v13->_logger = (AVTUILogger *)(id)objc_msgSend(v11, "logger");
  }

  return v13;
}

- (void)performMigrationIfNeeded
{
  uint64_t v3;
  AVTAvatarStoreInternal *store;
  void *v5;
  id v6;
  id v7;
  AVTUILogger *logger;
  void *v9;
  uint64_t v10;
  AVTAvatarStoreInternal *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  id v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t k;
  void *v40;
  AVTAvatarStoreInternal *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  AVTStickerRecentsMigrator *v49;
  id obj;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  id v64;
  uint64_t v65;
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  if (!self->_migrationHasBeenPerformed && AVTUIStickerRecentsMigrationVersion() <= 1)
  {
    objc_msgSend(MEMORY[0x1E0D00880], "requestForAllRecentStickers");
    v3 = objc_claimAutoreleasedReturnValue();
    store = self->_store;
    v65 = 0;
    v48 = (void *)v3;
    -[AVTAvatarStoreInternal recentStickersForFetchRequest:error:](store, "recentStickersForFetchRequest:error:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
    v7 = v6;
    if (v6)
    {
      logger = self->_logger;
      objc_msgSend(v6, "localizedDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTUILogger logErrorFetchingRecentStickers:](logger, "logErrorFetchingRecentStickers:", v9);

    }
    v47 = v7;
    objc_msgSend(MEMORY[0x1E0D00840], "requestForAllAvatars");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = self->_store;
    v64 = 0;
    v46 = (void *)v10;
    -[AVTAvatarStoreInternal avatarsForFetchRequest:error:](v11, "avatarsForFetchRequest:error:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v64;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v14 = v12;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v61;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v61 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
          objc_msgSend(v19, "identifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v19, v20);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
      }
      while (v16);
    }
    v49 = self;
    v44 = v14;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    obj = v5;
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v67, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v57;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v57 != v24)
            objc_enumerationMutation(obj);
          v26 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * j);
          objc_msgSend(v26, "avatarRecordIdentifier", v44);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (v28)
          {
            objc_msgSend(v26, "avatarRecordIdentifier");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "objectForKeyedSubscript:", v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v30)
            {
              -[AVTStickerConfigurationProvider availableStickerNamesForAvatarRecord:](v49->_stickerConfigurationProvider, "availableStickerNamesForAvatarRecord:", v28);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "avatarRecordIdentifier");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v51, "setObject:forKeyedSubscript:", v30, v31);

            }
            objc_msgSend(v26, "stickerConfigurationIdentifier");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v30, "containsObject:", v32);

            if ((v33 & 1) == 0)
              objc_msgSend(v21, "addObject:", v26);

          }
          else
          {
            objc_msgSend(v21, "addObject:", v26);
          }

        }
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v67, 16);
      }
      while (v23);
    }

    -[AVTUILogger logPerformedRecentStickersMigration:](v49->_logger, "logPerformedRecentStickersMigration:", objc_msgSend(v21, "count") != 0);
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v34 = v21;
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v52, v66, 16);
    v36 = v44;
    if (v35)
    {
      v37 = v35;
      v38 = *(_QWORD *)v53;
      do
      {
        for (k = 0; k != v37; ++k)
        {
          if (*(_QWORD *)v53 != v38)
            objc_enumerationMutation(v34);
          v40 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * k);
          v41 = v49->_store;
          objc_msgSend(v40, "avatarRecordIdentifier", v44);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "stickerConfigurationIdentifier");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          -[AVTAvatarStoreInternal deleteRecentStickersWithAvatarIdentifier:stickerIdentifier:completionHandler:](v41, "deleteRecentStickersWithAvatarIdentifier:stickerIdentifier:completionHandler:", v42, v43, 0);

        }
        v37 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v52, v66, 16);
      }
      while (v37);
    }

    AVTUISetStickerRecentsMigrationVersion();
    v49->_migrationHasBeenPerformed = 1;

  }
}

- (void)setNeedsMigrationOnNextLaunch
{
  self->_migrationHasBeenPerformed = 0;
  AVTUISetStickerRecentsMigrationVersion();
}

- (AVTAvatarStoreInternal)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
  objc_storeStrong((id *)&self->_store, a3);
}

- (AVTStickerConfigurationProvider)stickerConfigurationProvider
{
  return self->_stickerConfigurationProvider;
}

- (void)setStickerConfigurationProvider:(id)a3
{
  objc_storeStrong((id *)&self->_stickerConfigurationProvider, a3);
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (void)setLogger:(id)a3
{
  self->_logger = (AVTUILogger *)a3;
}

- (BOOL)migrationHasBeenPerformed
{
  return self->_migrationHasBeenPerformed;
}

- (void)setMigrationHasBeenPerformed:(BOOL)a3
{
  self->_migrationHasBeenPerformed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stickerConfigurationProvider, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

@end
