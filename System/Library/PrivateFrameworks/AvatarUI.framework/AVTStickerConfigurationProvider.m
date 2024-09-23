@implementation AVTStickerConfigurationProvider

- (AVTStickerConfigurationProvider)initWithEnvironment:(id)a3 forStickerPacks:(id)a4 stickerConfigurationNames:(id)a5
{
  id v9;
  id v10;
  id v11;
  AVTStickerConfigurationProvider *v12;
  AVTStickerConfigurationProvider *v13;
  NSCache *v14;
  NSCache *stickerConfigurationCache;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)AVTStickerConfigurationProvider;
  v12 = -[AVTStickerConfigurationProvider init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_environment, a3);
    objc_storeStrong((id *)&v13->_stickerPacks, a4);
    v14 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    stickerConfigurationCache = v13->_stickerConfigurationCache;
    v13->_stickerConfigurationCache = v14;

    -[NSCache setCountLimit:](v13->_stickerConfigurationCache, "setCountLimit:", 3);
    objc_storeStrong((id *)&v13->_stickerConfigurationNames, a5);
  }

  return v13;
}

- (id)stickerConfigurationsForAvatarRecord:(id)a3
{
  id v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  __CFString *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "isEditable") & 1) != 0)
  {
    v5 = CFSTR("memoji");
  }
  else
  {
    objc_msgSend(v4, "identifier");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v18 = 0;
      goto LABEL_17;
    }
  }
  -[NSCache objectForKey:](self->_stickerConfigurationCache, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v20 = v5;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    -[AVTStickerConfigurationProvider stickerPacks](self, "stickerPacks");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v22 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
          v14 = objc_msgSend(v4, "isEditable");
          v15 = (void *)MEMORY[0x1E0D00690];
          if (v14)
          {
            objc_msgSend(MEMORY[0x1E0D00690], "stickerConfigurationsForMemojiInStickerPack:", v13);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObjectsFromArray:", v16);
          }
          else
          {
            objc_msgSend(v4, "identifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "stickerConfigurationsForAnimojiNamed:inStickerPack:", v16, v13);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObjectsFromArray:", v17);

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v10);
    }

    -[AVTStickerConfigurationProvider filteredStickerConfigurations:](self, "filteredStickerConfigurations:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v20;
    -[NSCache setObject:forKey:](self->_stickerConfigurationCache, "setObject:forKey:", v6, v20);
  }
  v18 = v6;

LABEL_17:
  return v18;
}

- (id)stickerConfigurationForAvatarRecord:(id)a3 stickerName:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (v6)
  {
    -[AVTStickerConfigurationProvider stickerConfigurationsForAvatarRecord:](self, "stickerConfigurationsForAvatarRecord:", a3);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v11, "name", (_QWORD)v15);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v6, "isEqualToString:", v12);

          if ((v13 & 1) != 0)
          {
            v8 = v11;
            goto LABEL_12;
          }
        }
        v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)availableStickerNamesForAvatarRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[AVTStickerConfigurationProvider stickerPacks](self, "stickerPacks", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        v12 = objc_msgSend(v4, "isEditable");
        v13 = (void *)MEMORY[0x1E0D00690];
        if (v12)
        {
          objc_msgSend(MEMORY[0x1E0D00690], "availableStickerNamesForMemojiInStickerPack:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObjectsFromArray:", v14);
        }
        else
        {
          objc_msgSend(v4, "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "availableStickerNamesForAnimojiNamed:inStickerPack:", v14, v11);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObjectsFromArray:", v15);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)filteredStickerConfigurations:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v20;
  AVTStickerConfigurationProvider *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AVTStickerConfigurationProvider stickerConfigurationNames](self, "stickerConfigurationNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = self;
  if (v5)
  {
    -[AVTStickerConfigurationProvider stickerConfigurationNames](self, "stickerConfigurationNames");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count") != 0;

  }
  else
  {
    v7 = 0;
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = v4;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v14, "name", v20);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "lowercaseString");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v7
          || (-[AVTStickerConfigurationProvider stickerConfigurationNames](v21, "stickerConfigurationNames"),
              v17 = (void *)objc_claimAutoreleasedReturnValue(),
              v18 = objc_msgSend(v17, "containsObject:", v16),
              v17,
              v18))
        {
          if ((objc_msgSend(v8, "containsObject:", v16) & 1) == 0)
          {
            objc_msgSend(v20, "addObject:", v14);
            objc_msgSend(v8, "addObject:", v16);
          }
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v11);
  }

  return v20;
}

- (NSCache)stickerConfigurationCache
{
  return self->_stickerConfigurationCache;
}

- (void)setStickerConfigurationCache:(id)a3
{
  objc_storeStrong((id *)&self->_stickerConfigurationCache, a3);
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_environment, a3);
}

- (AVTStickerPack)stickerPacks
{
  return self->_stickerPacks;
}

- (void)setStickerPacks:(id)a3
{
  objc_storeStrong((id *)&self->_stickerPacks, a3);
}

- (NSArray)stickerConfigurationNames
{
  return self->_stickerConfigurationNames;
}

- (void)setStickerConfigurationNames:(id)a3
{
  objc_storeStrong((id *)&self->_stickerConfigurationNames, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stickerConfigurationNames, 0);
  objc_storeStrong((id *)&self->_stickerPacks, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_stickerConfigurationCache, 0);
}

@end
