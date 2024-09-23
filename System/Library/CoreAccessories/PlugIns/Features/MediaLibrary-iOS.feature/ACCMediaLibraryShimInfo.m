@implementation ACCMediaLibraryShimInfo

+ (BOOL)isItemAd:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;

  v3 = a3;
  v4 = (void *)MEMORY[0x220749824]();
  objc_msgSend(v3, "valueForProperty:", *MEMORY[0x24BDDBC98]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "isEqualToString:", &stru_24DD265E0) ^ 1;
  else
    LOBYTE(v7) = 0;

  objc_autoreleasePoolPop(v4);
  return v7;
}

+ (id)getMediaItemForContentItem:(id)a3 propertyList:(id)a4 playlistContent:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  void *v21;
  uint64_t v22;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = 0;
  if (v7 && v8)
  {
    v11 = objc_alloc(MEMORY[0x24BE00BA0]);
    objc_msgSend(v9, "mediaLibraryUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v9;
    v10 = (void *)objc_msgSend(v11, "initWithMediaLibrary:persistentID:playlistPersistentID:", v12, objc_msgSend(v7, "persistentID"), objc_msgSend(v9, "persistentID"));

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v25 = v8;
    v13 = v8;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (!v14)
      goto LABEL_30;
    v15 = v14;
    v16 = *(_QWORD *)v31;
    v29 = *MEMORY[0x24BDDBB38];
    v28 = *MEMORY[0x24BDDBB78];
    v27 = *MEMORY[0x24BDDBAE0];
    v17 = *MEMORY[0x24BDDBB10];
    v26 = *MEMORY[0x24BDDBAF8];
    v18 = *MEMORY[0x24BDDBCD8];
    while (1)
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v31 != v16)
          objc_enumerationMutation(v13);
        v20 = objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v19), "unsignedIntValue");
        if (v20 <= 11)
        {
          if (v20)
          {
            if (v20 == 1)
            {
              objc_msgSend(v7, "valueForProperty:", v18);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if (v21)
                objc_msgSend(v10, "setTitle:", v21);
            }
            else
            {
              if (v20 != 6)
                goto LABEL_28;
              objc_msgSend(v7, "valueForProperty:", v26);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if (v21)
                objc_msgSend(v10, "setAlbumTitle:", v21);
            }
LABEL_27:

          }
          else
          {
            v22 = objc_msgSend(v7, "persistentID");
            if (v22)
              objc_msgSend(v10, "setPersistentID:", v22);
          }
        }
        else
        {
          switch(v20)
          {
            case 12:
              objc_msgSend(v7, "valueForProperty:", v17);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if (v21)
                objc_msgSend(v10, "setArtist:", v21);
              goto LABEL_27;
            case 14:
              objc_msgSend(v7, "valueForProperty:", v27);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if (v21)
                objc_msgSend(v10, "setAlbumArtist:", v21);
              goto LABEL_27;
            case 16:
              objc_msgSend(v7, "valueForProperty:", v28);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if (v21)
                objc_msgSend(v10, "setGenre:", v21);
              goto LABEL_27;
            case 18:
              objc_msgSend(v7, "valueForProperty:", v29);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if (v21)
                objc_msgSend(v10, "setComposer:", v21);
              goto LABEL_27;
            default:
              break;
          }
        }
LABEL_28:
        ++v19;
      }
      while (v15 != v19);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (!v15)
      {
LABEL_30:

        v9 = v24;
        v8 = v25;
        break;
      }
    }
  }

  return v10;
}

- (NSString)name
{
  void *mpMediaLibrary;

  mpMediaLibrary = self->_mpMediaLibrary;
  if (mpMediaLibrary)
  {
    objc_msgSend(mpMediaLibrary, "name");
    mpMediaLibrary = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)mpMediaLibrary;
}

- (id)_getUIDString
{
  int libraryType;
  __CFString *v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  int v8;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  libraryType = self->_libraryType;
  if (libraryType == 2)
  {
    ACCRadioLibraryUIDString();
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else if (libraryType)
  {
    if (gLogObjects)
      v5 = gNumLogObjects < 1;
    else
      v5 = 1;
    if (v5)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
      v7 = MEMORY[0x24BDACB70];
      v6 = MEMORY[0x24BDACB70];
    }
    else
    {
      v7 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = self->_libraryType;
      v10[0] = 67109120;
      v10[1] = v8;
      _os_log_impl(&dword_21A7E0000, v7, OS_LOG_TYPE_DEFAULT, "ACCMediaLibraryShimInfo _getUIDString ERROR: Invalid libraryType(%d)", (uint8_t *)v10, 8u);
    }

    v4 = &stru_24DD265E0;
  }
  else
  {
    ACCMediaLibraryShimUIDString(self->_mpMediaLibrary, -[ACCMediaLibraryShim subscribedToAppleMusic](self->_context, "subscribedToAppleMusic"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (BOOL)subscribedToAppleMusic
{
  return -[ACCMediaLibraryShim subscribedToAppleMusic](self->_context, "subscribedToAppleMusic");
}

- (id)getPlaylistItems:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = (void *)MEMORY[0x24BDDC7F0];
  v5 = a3;
  objc_msgSend(v4, "defaultMediaLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDC7F0], "setDefaultMediaLibrary:", self->_mpMediaLibrary);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 3319);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDC810], "predicateWithValue:forProperty:", v7, *MEMORY[0x24BDDBC30]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDD16E0];
  v10 = objc_msgSend(v5, "persistentID");

  objc_msgSend(v9, "numberWithUnsignedLongLong:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDC810], "predicateWithValue:forProperty:", v11, *MEMORY[0x24BDDBD50]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", v12, v8, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDC818]), "initWithFilterPredicates:", v13);
  objc_msgSend(v14, "setGroupingType:", 6);
  objc_msgSend(v14, "items");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDC7F0], "setDefaultMediaLibrary:", v6);

  return v16;
}

- (id)_handlePlaylistContentForEntify:(id)a3 style:(int)a4 revision:(id)a5
{
  id v8;
  id v9;
  BOOL v10;
  id v11;
  NSObject *v12;
  dispatch_semaphore_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  BOOL v20;
  int v21;
  NSObject *v22;
  NSObject *v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  int v31;
  BOOL v32;
  int v33;
  NSObject *v34;
  NSObject *v35;
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t k;
  void *v42;
  id v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t j;
  void *v49;
  id v50;
  void *v51;
  uint64_t v52;
  id v53;
  NSObject *v55;
  id v56;
  int v57;
  id v58;
  int v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  _BYTE v74[128];
  uint8_t v75[128];
  uint8_t buf[4];
  id v77;
  __int16 v78;
  int v79;
  __int16 v80;
  id v81;
  uint64_t v82;

  v82 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  if (gLogObjects)
    v10 = gNumLogObjects < 1;
  else
    v10 = 1;
  if (v10)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v12 = MEMORY[0x24BDACB70];
    v11 = MEMORY[0x24BDACB70];
  }
  else
  {
    v12 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v77 = v8;
    v78 = 1024;
    v79 = a4;
    v80 = 2112;
    v81 = v9;
    _os_log_impl(&dword_21A7E0000, v12, OS_LOG_TYPE_INFO, "_handlePlaylistContentForEntify: entify=%@ contentStyle=%d revision=%@", buf, 0x1Cu);
  }

  if (self->_enableLibraryUpdate)
  {
    v13 = dispatch_semaphore_create(0);
    v14 = v8;
    if (a4 == 1)
    {
      v57 = 1;
      objc_msgSend(0, "setContentStyle:", 1);
    }
    else
    {
      if (a4 != 3)
      {
        v15 = 0;
        if (a4 != 2)
        {
LABEL_113:

          goto LABEL_114;
        }
        v57 = 0;
        v59 = 1;
LABEL_20:
        v60 = v9;
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE00B98]), "initWithMediaLibrary:persistentID:revision:", self->_UIDString, objc_msgSend(v14, "persistentID"), v9);
        -[ACCMediaLibraryShimInfo getPlaylistItems:](self, "getPlaylistItems:", v14);
        v16 = objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = (void *)v16;
          -[NSMutableDictionary objectForKey:](self->_dbUpdateList, "objectForKey:", CFSTR("PlaylistContentItemProperty"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = v13;
          v56 = v8;
          v58 = v14;
          if (!v18)
          {
            if (gLogObjects && gNumLogObjects >= 1)
            {
              v19 = *(id *)gLogObjects;
            }
            else
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
              v19 = MEMORY[0x24BDACB70];
              v24 = MEMORY[0x24BDACB70];
            }
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412802;
              v77 = v58;
              v78 = 1024;
              v79 = a4;
              v80 = 2112;
              v81 = v60;
              _os_log_impl(&dword_21A7E0000, v19, OS_LOG_TYPE_INFO, "_handlePlaylistContentForEntify: entify=%@ contentStyle=%d revision=%@, cannot find ACC_ML_PLAYLIST_CONTENT_ITEM_PROPERTIES", buf, 0x1Cu);
            }

          }
          if (_sendOnlyInLibraryItemsForPlaylist())
          {
            v71 = 0u;
            v72 = 0u;
            v69 = 0u;
            v70 = 0u;
            v25 = v17;
            v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v69, v75, 16);
            if (v26)
            {
              v27 = v26;
              v28 = *(_QWORD *)v70;
              while (2)
              {
                for (i = 0; i != v27; ++i)
                {
                  if (*(_QWORD *)v70 != v28)
                    objc_enumerationMutation(v25);
                  v30 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
                  if (!objc_msgSend(v30, "persistentID", v55, v56)
                    || !objc_msgSend(v30, "existsInLibrary"))
                  {
                    v31 = 1;
                    goto LABEL_56;
                  }
                }
                v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v69, v75, 16);
                v31 = 0;
                if (v27)
                  continue;
                break;
              }
            }
            else
            {
              v31 = 0;
            }
LABEL_56:

          }
          else
          {
            v31 = 0;
          }
          if (gLogObjects)
            v32 = gNumLogObjects <= 0;
          else
            v32 = 1;
          v33 = !v32;
          if ((v57 | v31 ^ 1) == 1 && ((v59 ^ 1) & 1) != 0)
          {
            if (v33)
            {
              v34 = *(id *)gLogObjects;
            }
            else
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
              v34 = MEMORY[0x24BDACB70];
              v43 = MEMORY[0x24BDACB70];
            }
            if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412802;
              v77 = v58;
              v78 = 1024;
              v79 = a4;
              v80 = 2112;
              v81 = v60;
              _os_log_impl(&dword_21A7E0000, v34, OS_LOG_TYPE_INFO, "_handlePlaylistContentForEntify: entify=%@ contentStyle=%d revision=%@, PlaylistContentStylePersistentIDs", buf, 0x1Cu);
            }

            objc_msgSend(v15, "setContentStyle:", 1);
            v63 = 0u;
            v64 = 0u;
            v61 = 0u;
            v62 = 0u;
            v44 = v17;
            v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v61, v73, 16);
            if (v45)
            {
              v46 = v45;
              v47 = *(_QWORD *)v62;
              do
              {
                for (j = 0; j != v46; ++j)
                {
                  if (*(_QWORD *)v62 != v47)
                    objc_enumerationMutation(v44);
                  v49 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * j);
                  if (objc_msgSend(v49, "persistentID", v55, v56)
                    && ((objc_msgSend(v49, "existsInLibrary") & 1) != 0
                     || (_sendOnlyInLibraryItemsForPlaylist() & 1) == 0))
                  {
                    objc_msgSend(v15, "addContentPersistentID:", objc_msgSend(v49, "persistentID"));
                  }
                }
                v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v61, v73, 16);
              }
              while (v46);
            }
          }
          else
          {
            if (v33)
            {
              v35 = *(id *)gLogObjects;
            }
            else
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
              v35 = MEMORY[0x24BDACB70];
              v36 = MEMORY[0x24BDACB70];
            }
            if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412802;
              v77 = v58;
              v78 = 1024;
              v79 = a4;
              v80 = 2112;
              v81 = v60;
              _os_log_impl(&dword_21A7E0000, v35, OS_LOG_TYPE_INFO, "_handlePlaylistContentForEntify: entify=%@ contentStyle=%d revision=%@, PlaylistContentStyleRecords", buf, 0x1Cu);
            }

            objc_msgSend(v15, "setContentStyle:", 2);
            v67 = 0u;
            v68 = 0u;
            v65 = 0u;
            v66 = 0u;
            v37 = v17;
            v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
            if (v38)
            {
              v39 = v38;
              v40 = *(_QWORD *)v66;
              do
              {
                for (k = 0; k != v39; ++k)
                {
                  if (*(_QWORD *)v66 != v40)
                    objc_enumerationMutation(v37);
                  +[ACCMediaLibraryShimInfo getMediaItemForContentItem:propertyList:playlistContent:](ACCMediaLibraryShimInfo, "getMediaItemForContentItem:propertyList:playlistContent:", *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * k), v18, v15, v55, v56);
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "addContentItem:", v42);

                }
                v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
              }
              while (v39);
            }
          }

          v13 = v55;
          v8 = v56;
          v14 = v58;
        }
        else
        {
          if (gLogObjects)
            v20 = gNumLogObjects <= 0;
          else
            v20 = 1;
          v21 = !v20;
          if (v59)
          {
            if (v21)
            {
              v22 = *(id *)gLogObjects;
            }
            else
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
              v22 = MEMORY[0x24BDACB70];
              v50 = MEMORY[0x24BDACB70];
            }
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412802;
              v77 = v14;
              v78 = 1024;
              v79 = a4;
              v80 = 2112;
              v81 = v60;
              _os_log_impl(&dword_21A7E0000, v22, OS_LOG_TYPE_INFO, "_handlePlaylistContentForEntify: EMPTY! entify=%@ contentStyle=%d revision=%@, PlaylistContentStyleRecords", buf, 0x1Cu);
            }

            v51 = v15;
            v52 = 2;
          }
          else
          {
            if (v21)
            {
              v23 = *(id *)gLogObjects;
            }
            else
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
              v23 = MEMORY[0x24BDACB70];
              v53 = MEMORY[0x24BDACB70];
            }
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412802;
              v77 = v14;
              v78 = 1024;
              v79 = a4;
              v80 = 2112;
              v81 = v60;
              _os_log_impl(&dword_21A7E0000, v23, OS_LOG_TYPE_INFO, "_handlePlaylistContentForEntify: EMPTY! entify=%@ contentStyle=%d revision=%@, PlaylistContentStylePersistentIDs", buf, 0x1Cu);
            }

            v51 = v15;
            v52 = 1;
          }
          objc_msgSend(v51, "setContentStyle:", v52);
        }
        v9 = v60;
        goto LABEL_113;
      }
      v57 = 0;
    }
    v59 = 0;
    goto LABEL_20;
  }
  v15 = 0;
  v13 = 0;
LABEL_114:

  return v15;
}

- (id)_handleMediaLibraryPlaylistUpdate:(id)a3 forLibrary:(id)a4 forProperties:(id)a5 success:(BOOL *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  ACCMediaLibraryShimInfo *v29;
  NSString *UIDString;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  ACCMediaLibraryShimInfo *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  unint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  const char *v57;
  id v58;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint8_t buf[4];
  void *v75;
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!a6)
    ACCMediaLibraryShimUIDString_cold_1();
  v12 = v11;
  *a6 = 1;
  objc_msgSend(v9, "entity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v64 = *MEMORY[0x24BDDBD30];
    objc_msgSend(v13, "valueForProperty:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "BOOLValue"))
    {
      v15 = -[ACCMediaLibraryShim isGeniusMixesSupported](self->_context, "isGeniusMixesSupported");

      if (!v15)
      {
        if (gLogObjects && gNumLogObjects >= 1)
        {
          v16 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
          v16 = MEMORY[0x24BDACB70];
          v56 = MEMORY[0x24BDACB70];
        }
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          goto LABEL_76;
        *(_WORD *)buf = 0;
        v57 = "_handleMediaLibraryPlaylistUpdate: skip, GeniusMix but not supported";
LABEL_75:
        _os_log_impl(&dword_21A7E0000, v16, OS_LOG_TYPE_INFO, v57, buf, 2u);
LABEL_76:

        v20 = 0;
        v21 = 0;
        v25 = 0;
        v27 = 0;
        goto LABEL_77;
      }
    }
    else
    {

    }
    objc_msgSend(v13, "valueForProperty:", v64);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = v13;
    if (objc_msgSend(v18, "BOOLValue"))
    {

    }
    else
    {
      objc_msgSend(v13, "valueForProperty:", *MEMORY[0x24BDDBD38]);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "BOOLValue");

      if (v23)
      {
        if (gLogObjects && gNumLogObjects >= 1)
        {
          v16 = *(id *)gLogObjects;
          v13 = v63;
        }
        else
        {
          v13 = v63;
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
          v16 = MEMORY[0x24BDACB70];
          v58 = MEMORY[0x24BDACB70];
        }
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          goto LABEL_76;
        *(_WORD *)buf = 0;
        v57 = "_handleMediaLibraryPlaylistUpdates: skip, not GeniusMix && isHidden";
        goto LABEL_75;
      }
    }
    if (!objc_msgSend(v9, "deletionType"))
    {
      v28 = objc_alloc(MEMORY[0x24BE00B90]);
      v29 = self;
      UIDString = self->_UIDString;
      v31 = objc_msgSend(v63, "persistentID");
      objc_msgSend(v9, "anchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_msgSend(v28, "initWithMediaLibrary:persistentID:revision:", UIDString, v31, v32);

      if (self->_requestedTransferID)
        objc_msgSend(v25, "setContentStyle:", objc_msgSend(v25, "contentStyle") | 1);
      v33 = v64;
      if (self->_requestedMetaList && self->_requestedMetaProperties)
        objc_msgSend(v25, "setContentStyle:", objc_msgSend(v25, "contentStyle") | 2);
      v61 = v10;
      v62 = v9;
      v72 = 0u;
      v73 = 0u;
      v70 = 0u;
      v71 = 0u;
      v60 = v12;
      v34 = v12;
      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v70, v76, 16);
      v13 = v63;
      if (v35)
      {
        v36 = v35;
        v66 = 0;
        v37 = *(_QWORD *)v71;
        v38 = *MEMORY[0x24BDDBD28];
        v69 = *MEMORY[0x24BDDBD48];
        v67 = v34;
        v68 = *MEMORY[0x24BDDBD40];
LABEL_38:
        v39 = 0;
        while (2)
        {
          if (*(_QWORD *)v71 != v37)
            objc_enumerationMutation(v34);
          switch(objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * v39), "unsignedIntValue", v60, v61))
          {
            case 1u:
              objc_msgSend(v13, "valueForProperty:", v68);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              if (v40)
                objc_msgSend(v25, "setName:", v40);
              goto LABEL_61;
            case 2u:
              objc_msgSend(v13, "valueForProperty:", v69);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = v41;
              if (v41)
                objc_msgSend(v25, "setParentPersistentID:", objc_msgSend(v41, "unsignedLongLongValue"));
              goto LABEL_61;
            case 3u:
              objc_msgSend(v13, "valueForProperty:", v33);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = v42;
              if (v42)
                objc_msgSend(v25, "setGeniusMix:", objc_msgSend(v42, "intValue") != 0);
              goto LABEL_61;
            case 4u:
              objc_msgSend(v13, "valueForProperty:", v38);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = v43;
              if (v43)
                objc_msgSend(v25, "setFolder:", objc_msgSend(v43, "intValue") != 0);
              goto LABEL_61;
            case 5u:
              if (!objc_msgSend(v25, "contentStyle"))
                goto LABEL_62;
              v44 = v29;
              objc_msgSend(v13, "valueForProperty:", v33);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v45 = v38;
              objc_msgSend(v13, "valueForProperty:", v38);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v40, "BOOLValue") & 1) != 0 || (objc_msgSend(v46, "BOOLValue") & 1) != 0)
              {
                v47 = 0;
              }
              else
              {
                v50 = objc_msgSend(v25, "contentStyle");
                objc_msgSend(v62, "anchor");
                v51 = objc_claimAutoreleasedReturnValue();
                v52 = v13;
                v53 = (void *)v51;
                -[ACCMediaLibraryShimInfo _handlePlaylistContentForEntify:style:revision:](self, "_handlePlaylistContentForEntify:style:revision:", v52, v50, v51);
                v54 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v25, "setContent:", v54);
                objc_msgSend(v25, "content");
                v55 = (void *)objc_claimAutoreleasedReturnValue();

                if (v55)
                  v47 = objc_msgSend(v54, "contentStyle");
                else
                  v47 = 0;
                v66 = v54;
                v13 = v63;
                v33 = v64;
              }
              objc_msgSend(v25, "setContentStyle:", v47);

              v38 = v45;
              v29 = v44;
              v34 = v67;
LABEL_61:

LABEL_62:
              if (v36 != ++v39)
                continue;
              v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v70, v76, 16);
              if (!v36)
                goto LABEL_79;
              goto LABEL_38;
            case 8u:
              v48 = objc_msgSend(v13, "playlistAttributes");
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", (v48 >> 1) & 1);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = v49;
              if (v49)
                objc_msgSend(v25, "setSmartPlaylist:", objc_msgSend(v49, "intValue") != 0);
              goto LABEL_61;
            default:
              goto LABEL_62;
          }
        }
      }
      v66 = 0;
LABEL_79:

      v21 = 0;
      v10 = v61;
      v9 = v62;
      v12 = v60;
      v20 = v66;
      goto LABEL_27;
    }
    v13 = v63;
    v24 = objc_msgSend(v63, "persistentID");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v24);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v17 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
      v17 = MEMORY[0x24BDACB70];
      v19 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v75 = v13;
      _os_log_impl(&dword_21A7E0000, v17, OS_LOG_TYPE_DEFAULT, "_handleMediaLibraryPlaylistUpdate: NOT playlist entity=%@", buf, 0xCu);
    }

    v20 = 0;
    v21 = 0;
  }
  v25 = 0;
LABEL_27:
  if (v25)
    v26 = v25;
  else
    v26 = v21;
  v27 = v26;
LABEL_77:

  return v27;
}

- (id)_handleMediaLibraryItemUpdate:(id)a3 forLibrary:(id)a4 forProperties:(id)a5 success:(BOOL *)a6 forceDelete:(BOOL)a7
{
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v22;
  __int16 v23;
  id v24;
  NSString *UIDString;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  __int16 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint8_t buf[4];
  void *v73;
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a5;
  objc_msgSend(v11, "entity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  *a6 = 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v16 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
      v16 = MEMORY[0x24BDACB70];
      v17 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v73 = v13;
      _os_log_impl(&dword_21A7E0000, v16, OS_LOG_TYPE_DEFAULT, "_handleMediaLibraryItemUpdate: NOT mediaItem entity=%@", buf, 0xCu);
    }

    goto LABEL_14;
  }
  if (a7 || objc_msgSend(v11, "deletionType"))
  {
    v14 = objc_msgSend(v13, "persistentID");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:
    v18 = 0;
    goto LABEL_16;
  }
  objc_msgSend(v13, "valueForProperty:", *MEMORY[0x24BDDBC30]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "integerValue");

  v67 = v23;
  if ((v23 & 0xCF7) == 0)
  {
LABEL_14:
    v15 = 0;
    goto LABEL_15;
  }
  v24 = objc_alloc(MEMORY[0x24BE00B80]);
  UIDString = self->_UIDString;
  v26 = objc_msgSend(v13, "persistentID");
  objc_msgSend(v11, "anchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v24, "initWithMediaLibrary:persistentID:revision:", UIDString, v26, v27);

  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v48 = v12;
  v28 = v12;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v68, v74, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v69;
    v66 = *MEMORY[0x24BDDBBB0];
    v65 = *MEMORY[0x24BDDBBB8];
    v64 = *MEMORY[0x24BDDBB38];
    v63 = *MEMORY[0x24BDDBB40];
    v62 = *MEMORY[0x24BDDBB78];
    v61 = *MEMORY[0x24BDDBB80];
    v60 = *MEMORY[0x24BDDBAE0];
    v59 = *MEMORY[0x24BDDBAE8];
    v58 = *MEMORY[0x24BDDBB10];
    v57 = *MEMORY[0x24BDDBB18];
    v56 = *MEMORY[0x24BDDBB48];
    v55 = *MEMORY[0x24BDDBB50];
    v54 = *MEMORY[0x24BDDBB00];
    v53 = *MEMORY[0x24BDDBB08];
    v52 = *MEMORY[0x24BDDBAF8];
    v51 = *MEMORY[0x24BDDBAF0];
    v50 = *MEMORY[0x24BDDBC58];
    v49 = *MEMORY[0x24BDDBC78];
    v32 = *MEMORY[0x24BDDBCD8];
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v69 != v31)
          objc_enumerationMutation(v28);
        switch(objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * i), "unsignedIntValue", v48))
        {
          case 1u:
            objc_msgSend(v13, "valueForProperty:", v32);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            if (v34)
              objc_msgSend(v18, "setTitle:", v34);
            goto LABEL_71;
          case 2u:
            if ((v67 & 0x801) != 0)
              objc_msgSend(v18, "setType:", 0);
            if ((v67 & 0x402) != 0)
              objc_msgSend(v18, "setType:", 1);
            if ((v67 & 4) != 0)
              objc_msgSend(v18, "setType:", 2);
            continue;
          case 3u:
            objc_msgSend(v13, "valueForProperty:", v49);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v35;
            if (v35)
              objc_msgSend(v18, "setRating:", objc_msgSend(v35, "unsignedLongValue"));
            goto LABEL_71;
          case 4u:
            objc_msgSend(v13, "valueForProperty:", v50);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v36;
            if (v36)
            {
              objc_msgSend(v36, "doubleValue");
              objc_msgSend(v18, "setDuration:", (v37 * 1000.0));
            }
            goto LABEL_71;
          case 5u:
            objc_msgSend(v13, "valueForProperty:", v51);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v38;
            if (v38)
              objc_msgSend(v18, "setAlbumPersistentID:", objc_msgSend(v38, "unsignedLongLongValue"));
            goto LABEL_71;
          case 6u:
            objc_msgSend(v13, "valueForProperty:", v52);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            if (v34)
              objc_msgSend(v18, "setAlbumTitle:", v34);
            goto LABEL_71;
          case 7u:
            objc_msgSend(v13, "valueForProperty:", v53);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v39;
            if (v39)
              objc_msgSend(v18, "setAlbumTrackNumber:", (unsigned __int16)objc_msgSend(v39, "unsignedIntValue"));
            goto LABEL_71;
          case 8u:
            objc_msgSend(v13, "valueForProperty:", v54);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v40;
            if (v40)
              objc_msgSend(v18, "setAlbumTrackCount:", (unsigned __int16)objc_msgSend(v40, "unsignedIntValue"));
            goto LABEL_71;
          case 9u:
            objc_msgSend(v13, "valueForProperty:", v55);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v41;
            if (v41)
              objc_msgSend(v18, "setAlbumDiscNumber:", (unsigned __int16)objc_msgSend(v41, "unsignedIntValue"));
            goto LABEL_71;
          case 0xAu:
            objc_msgSend(v13, "valueForProperty:", v56);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v42;
            if (v42)
              objc_msgSend(v18, "setAlbumDiscCount:", (unsigned __int16)objc_msgSend(v42, "unsignedIntValue"));
            goto LABEL_71;
          case 0xBu:
            objc_msgSend(v13, "valueForProperty:", v57);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v43;
            if (v43)
              objc_msgSend(v18, "setArtistPersistentID:", objc_msgSend(v43, "unsignedLongLongValue"));
            goto LABEL_71;
          case 0xCu:
            objc_msgSend(v13, "valueForProperty:", v58);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            if (v34)
              objc_msgSend(v18, "setArtist:", v34);
            goto LABEL_71;
          case 0xDu:
            objc_msgSend(v13, "valueForProperty:", v59);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v44;
            if (v44)
              objc_msgSend(v18, "setAlbumArtistPersistentID:", objc_msgSend(v44, "unsignedLongLongValue"));
            goto LABEL_71;
          case 0xEu:
            objc_msgSend(v13, "valueForProperty:", v60);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            if (v34)
              objc_msgSend(v18, "setAlbumArtist:", v34);
            goto LABEL_71;
          case 0xFu:
            objc_msgSend(v13, "valueForProperty:", v61);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v45;
            if (v45)
              objc_msgSend(v18, "setGenrePersistentID:", objc_msgSend(v45, "unsignedLongLongValue"));
            goto LABEL_71;
          case 0x10u:
            objc_msgSend(v13, "valueForProperty:", v62);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            if (v34)
              objc_msgSend(v18, "setGenre:", v34);
            goto LABEL_71;
          case 0x11u:
            objc_msgSend(v13, "valueForProperty:", v63);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v46;
            if (v46)
              objc_msgSend(v18, "setComposerPersistentID:", objc_msgSend(v46, "unsignedLongLongValue"));
            goto LABEL_71;
          case 0x12u:
            objc_msgSend(v13, "valueForProperty:", v64);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            if (v34)
              objc_msgSend(v18, "setComposer:", v34);
            goto LABEL_71;
          case 0x13u:
            objc_msgSend(v13, "valueForProperty:", v65);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v47;
            if (v47)
              objc_msgSend(v18, "setPartOfCompilation:", objc_msgSend(v47, "intValue") != 0);
            goto LABEL_71;
          case 0x19u:
            objc_msgSend(v13, "valueForProperty:", v66);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setLocal:", objc_msgSend(v34, "BOOLValue"));
            goto LABEL_71;
          case 0x1Bu:
            objc_msgSend(v13, "chaptersOfType:", 1);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setChapterCount:", (unsigned __int16)objc_msgSend(v34, "count"));
LABEL_71:

            break;
          default:
            continue;
        }
      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v68, v74, 16);
    }
    while (v30);
  }

  v15 = 0;
  v12 = v48;
LABEL_16:
  if (v18)
    v19 = v18;
  else
    v19 = v15;
  v20 = v19;

  return v20;
}

- (BOOL)_isVisibleUpdate:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  __int16 v9;
  void *v10;
  char v11;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "deletionType"))
    {
      v5 = 1;
    }
    else
    {
      objc_msgSend(v4, "entity");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v6, "valueForProperty:", *MEMORY[0x24BDDBD30]);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "BOOLValue"))
        {

          v5 = 1;
        }
        else
        {
          objc_msgSend(v6, "valueForProperty:", *MEMORY[0x24BDDBD38]);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "BOOLValue");

          v5 = v11 ^ 1;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v6, "valueForProperty:", *MEMORY[0x24BDDBC30]);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "integerValue");

          v5 = (v9 & 0x1CFF) != 0;
        }
        else
        {
          v5 = 0;
        }
      }

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int64_t)_checkAndWaitForWindowOk:(int64_t)a3
{
  int64_t v3;
  NSObject *waitForWindowSem;
  dispatch_time_t v6;
  intptr_t v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  id v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x24BDAC8D0];
  if (a3 == 2)
  {
    waitForWindowSem = self->_waitForWindowSem;
    v6 = dispatch_time(0, 5000000000);
    v7 = dispatch_semaphore_wait(waitForWindowSem, v6);
    if (self->_isShuttingDown || !self->_enableLibraryUpdate)
    {
      if (gLogObjects)
        v8 = gNumLogObjects < 1;
      else
        v8 = 1;
      if (v8)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
        v10 = MEMORY[0x24BDACB70];
        v9 = MEMORY[0x24BDACB70];
      }
      else
      {
        v10 = *(id *)gLogObjects;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v13 = 134217984;
        v14 = 2;
        _os_log_impl(&dword_21A7E0000, v10, OS_LOG_TYPE_INFO, "_checkAndWaitForWindowOk: lastUpdateResult=%ld, not _enableLibraryUpdate after waiting on _waitForWindowSem", (uint8_t *)&v13, 0xCu);
      }
      v3 = 3;
    }
    else
    {
      if (!v7)
        return 2;
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v10 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
        v10 = MEMORY[0x24BDACB70];
        v12 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v13 = 134217984;
        v3 = 2;
        v14 = 2;
        _os_log_impl(&dword_21A7E0000, v10, OS_LOG_TYPE_INFO, "_checkAndWaitForWindowOk: lastUpdateResult=%ld, timeout waiting on _waitForWindowSem", (uint8_t *)&v13, 0xCu);
      }
      else
      {
        v3 = 2;
      }
    }

  }
  return v3;
}

- (int64_t)_attemptUpdate:(id)a3
{
  uint64_t (**v4)(_QWORD);
  int64_t v5;
  int64_t v7;

  v4 = (uint64_t (**)(_QWORD))a3;
  if (!self->_isShuttingDown)
  {
    while (self->_enableLibraryUpdate)
    {
      v7 = -[ACCMediaLibraryShimInfo _checkAndWaitForWindowOk:](self, "_checkAndWaitForWindowOk:", v4[2](v4));
      if (self->_isShuttingDown)
        break;
      v5 = v7;
      if (!self->_enableLibraryUpdate || v7 != 2)
      {
        if (self->_enableLibraryUpdate)
          goto LABEL_3;
        break;
      }
    }
  }
  v5 = 3;
LABEL_3:

  return v5;
}

- (id)_beginMediaLibraryUpdatesWithAnchor:(id)a3 validity:(id)a4
{
  uint64_t v4;
  void *v5;
  void *v8;
  int v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  id v15;
  __CFString *v16;
  id v17;
  const __CFString *v18;
  __CFString *v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  void *v25;
  BOOL v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  id v34;
  id mpMediaLibrary;
  id v36;
  __CFString *v37;
  NSObject *v38;
  id v39;
  uint64_t v40;
  int v41;
  ACCMediaLibraryShimInfo *v42;
  NSObject *v43;
  id v44;
  NSString *UIDString;
  void *v46;
  void *v47;
  ACCMediaLibraryShimInfo *v48;
  BOOL v49;
  int v50;
  NSObject *v51;
  NSObject *v52;
  id v53;
  int libraryType;
  NSString *v55;
  void *v56;
  id v57;
  int v58;
  NSString *v59;
  __int128 v60;
  int v61;
  int v62;
  id v63;
  id v64;
  id v65;
  uint64_t v66;
  int v67;
  uint64_t v68;
  unsigned int v69;
  void *v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  int v75;
  NSObject *v76;
  uint64_t v77;
  int v78;
  NSObject *v79;
  id v80;
  uint64_t v81;
  int v82;
  NSObject *v83;
  uint64_t v84;
  int v85;
  NSObject *v86;
  id v87;
  void *v88;
  uint64_t v89;
  int v90;
  NSObject *v91;
  uint64_t v92;
  int v93;
  NSObject *v94;
  NSObject *v95;
  NSObject *v96;
  uint64_t v97;
  uint64_t v98;
  int v99;
  NSObject *v100;
  NSObject *v101;
  uint64_t v102;
  int v103;
  NSObject *v104;
  id v105;
  void *v106;
  uint64_t v107;
  int v108;
  NSObject *v109;
  NSObject *v110;
  NSObject *v111;
  uint64_t v112;
  uint64_t v113;
  NSObject *v114;
  NSObject *v115;
  NSObject *v116;
  NSObject *v117;
  NSString *v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  NSObject *v122;
  NSObject *v123;
  uint64_t v124;
  uint64_t v125;
  int v126;
  NSObject *v127;
  NSObject *v128;
  void *v129;
  BOOL v130;
  uint64_t v131;
  int v132;
  NSObject *v133;
  uint64_t v134;
  int v135;
  NSObject *v136;
  NSObject *v137;
  NSObject *v138;
  NSString *v139;
  void *v140;
  int v141;
  uint64_t v142;
  uint64_t v143;
  void *v144;
  NSObject *v145;
  NSObject *v146;
  id v147;
  uint64_t v148;
  uint64_t v149;
  int v150;
  NSObject *v151;
  NSObject *v152;
  NSObject *v153;
  NSObject *v154;
  uint64_t v155;
  uint64_t v156;
  int v157;
  NSObject *v158;
  NSObject *v159;
  NSString *v160;
  void *v161;
  uint64_t v162;
  int v163;
  ACCMediaLibraryAccessory *v164;
  char isKindOfClass;
  char v166;
  id v167;
  int v168;
  id v169;
  NSString *v170;
  void *v171;
  uint64_t v172;
  int v173;
  ACCMediaLibraryAccessory *accessory;
  _BOOL4 requestedMetaProperties;
  id v176;
  id v177;
  id v178;
  uint64_t v179;
  NSString *v180;
  void *v181;
  int v182;
  ACCMediaLibraryAccessory *v183;
  int v184;
  _BOOL4 v185;
  uint64_t v186;
  NSObject *v187;
  void *v188;
  BOOL v189;
  void *v190;
  double v191;
  uint64_t v192;
  int v193;
  id v194;
  void *v195;
  uint64_t v196;
  void *v197;
  unint64_t v198;
  NSString *v199;
  void *v200;
  int v201;
  ACCMediaLibraryAccessory *v202;
  NSString *v203;
  void *v204;
  void *v205;
  int v206;
  ACCMediaLibraryAccessory *v207;
  BOOL v208;
  id v209;
  NSObject *v210;
  ACCMediaLibraryShimInfo *v211;
  void *v212;
  BOOL v213;
  __CFString *v214;
  __CFString *v215;
  NSObject *v216;
  id v217;
  uint64_t v218;
  id v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  void *v226;
  void *v227;
  BOOL v228;
  void *v229;
  NSObject *v230;
  id v231;
  uint64_t v232;
  uint64_t v233;
  int v234;
  int v235;
  uint64_t v236;
  void *v237;
  NSObject *v238;
  id v239;
  id v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t i;
  __int128 v245;
  uint64_t v246;
  uint64_t v247;
  void *v248;
  uint64_t v249;
  unint64_t v250;
  uint64_t v251;
  unint64_t v252;
  uint64_t v253;
  unint64_t v254;
  uint64_t v255;
  unint64_t v256;
  uint64_t v257;
  void *v258;
  void *v259;
  void *v260;
  void *v261;
  uint64_t v262;
  void *v263;
  _BOOL4 requestedMetaList;
  void *v265;
  _BOOL4 v266;
  void *v267;
  id v268;
  int v269;
  void *v270;
  NSString *v271;
  void *v272;
  _BOOL4 v273;
  void *v274;
  id v275;
  int v276;
  id obj;
  int v278;
  void *v279;
  int v280;
  id v281;
  void *v282;
  int v283;
  void *v284;
  void *v285;
  __CFString *v286;
  id v287;
  uint64_t v288;
  uint64_t v289;
  int v290;
  void *context;
  __CFString *v292;
  void *v293;
  ACCMediaLibraryShimInfo *v294;
  _QWORD v295[4];
  __CFString *v296;
  ACCMediaLibraryShimInfo *v297;
  uint64_t *v298;
  _QWORD v299[5];
  id v300;
  uint64_t *v301;
  uint64_t *v302;
  _QWORD v303[6];
  id v304;
  uint64_t *v305;
  uint64_t *v306;
  _QWORD v307[5];
  id v308;
  uint64_t *v309;
  _QWORD v310[5];
  id v311;
  uint64_t *v312;
  uint64_t *v313;
  _QWORD v314[6];
  id v315;
  uint64_t *v316;
  uint64_t *v317;
  __int128 v318;
  __int128 v319;
  __int128 v320;
  __int128 v321;
  _QWORD v322[5];
  id v323;
  uint64_t *v324;
  uint64_t *v325;
  uint64_t *v326;
  _QWORD v327[5];
  id v328;
  uint64_t *v329;
  uint64_t *v330;
  uint64_t *v331;
  uint64_t v332;
  uint64_t *v333;
  uint64_t v334;
  int v335;
  uint64_t v336;
  uint64_t *v337;
  uint64_t v338;
  char v339;
  uint64_t v340;
  uint64_t *v341;
  uint64_t v342;
  char v343;
  uint64_t v344;
  uint64_t *v345;
  uint64_t v346;
  uint64_t (*v347)(uint64_t, uint64_t);
  void (*v348)(uint64_t);
  id v349;
  uint64_t v350;
  int *v351;
  uint64_t v352;
  int v353;
  __int128 v354;
  __int128 v355;
  __int128 v356;
  __int128 v357;
  uint8_t buf[4];
  _BYTE v359[50];
  _BYTE v360[42];
  uint64_t v361;
  __int16 v362;
  double v363;
  __int16 v364;
  uint64_t v365;
  __int16 v366;
  double v367;
  __int16 v368;
  uint64_t v369;
  __int16 v370;
  double v371;
  _BYTE v372[128];
  uint64_t v373;

  v373 = *MEMORY[0x24BDAC8D0];
  v286 = (__CFString *)a3;
  v281 = a4;
  v294 = self;
  objc_msgSend(self->_mpMediaLibrary, "_syncValidity");
  obj = (id)objc_claimAutoreleasedReturnValue();
  -[ACCMediaLibraryShim measureMemoryUsage](self->_context, "measureMemoryUsage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v10 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v10 = MEMORY[0x24BDACB70];
    v11 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)v359 = v9 ^ 1;
    *(_WORD *)&v359[4] = 2112;
    *(_QWORD *)&v359[6] = v286;
    *(_WORD *)&v359[14] = 2112;
    *(_QWORD *)&v359[16] = v281;
    *(_WORD *)&v359[24] = 2112;
    *(_QWORD *)&v359[26] = v294;
    _os_log_impl(&dword_21A7E0000, v10, OS_LOG_TYPE_INFO, "_beginMediaLibraryUpdatesWithAnchor: bMeasureMemoryUsage=%d anchorTo=%@ validity=%@  %@", buf, 0x26u);
  }

  if (v294->_isShuttingDown)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v12 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
      v12 = MEMORY[0x24BDACB70];
      v15 = MEMORY[0x24BDACB70];
    }
    v282 = v12;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v359 = v286;
      *(_WORD *)&v359[8] = 2112;
      *(_QWORD *)&v359[10] = v281;
      _os_log_impl(&dword_21A7E0000, v12, OS_LOG_TYPE_INFO, "_beginMediaLibraryUpdatesWithAnchor: anchorTo=%@ validity=%@ ShuttingDown, ignore", buf, 0x16u);
    }
    v16 = 0;
    goto LABEL_372;
  }
  v294->_processingDiffUpdate = 1;
  GetMediaLibraryHelper();
  v282 = (void *)objc_claimAutoreleasedReturnValue();
  v276 = objc_msgSend(v282, "getFilteredMediaTypesMask:", 7423);
  v13 = v286 == 0;
  if (!v286)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v14 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
      v14 = MEMORY[0x24BDACB70];
      v17 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v359 = 0;
      *(_WORD *)&v359[8] = 2112;
      *(_QWORD *)&v359[10] = v281;
      _os_log_impl(&dword_21A7E0000, v14, OS_LOG_TYPE_INFO, "_beginMediaLibraryUpdatesWithAnchor: Begin Full Database Update. anchorTo=%@ validity=%@", buf, 0x16u);
    }

  }
  if ((objc_msgSend(obj, "isEqualToString:", v281) & 1) != 0)
  {
    v18 = v286;
  }
  else
  {
    v19 = v286;
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v20 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
        v19 = v286;
      }
      v20 = MEMORY[0x24BDACB70];
      v21 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)v359 = v19;
      *(_WORD *)&v359[8] = 2112;
      *(_QWORD *)&v359[10] = v281;
      *(_WORD *)&v359[18] = 2112;
      *(_QWORD *)&v359[20] = obj;
      _os_log_impl(&dword_21A7E0000, v20, OS_LOG_TYPE_INFO, "_beginMediaLibraryUpdatesWithAnchor: Begin Full Database Update. anchorTo=%@ validity=%@ libraryValidity=%@", buf, 0x20u);
    }

    objc_storeStrong((id *)&v294->_syncValidityPersistentID, obj);
    v18 = CFSTR("0");
    v13 = 1;
  }
  v286 = (__CFString *)v18;
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v22 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v22 = MEMORY[0x24BDACB70];
    v23 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v359 = v18;
    *(_WORD *)&v359[8] = 1024;
    *(_DWORD *)&v359[10] = v276;
    _os_log_impl(&dword_21A7E0000, v22, OS_LOG_TYPE_INFO, "_beginMediaLibraryUpdatesWithAnchor: anchorTo=%@ call enumerateEntityChangesAfterSyncAnchor:usingBlock, validMediaTypeMask=%xh", buf, 0x12u);
  }

  v350 = 0;
  v351 = (int *)&v350;
  v352 = 0x2020000000;
  v353 = 0;
  v344 = 0;
  v345 = &v344;
  v346 = 0x3032000000;
  v347 = __Block_byref_object_copy_;
  v348 = __Block_byref_object_dispose_;
  v349 = 0;
  v340 = 0;
  v341 = &v340;
  v342 = 0x2020000000;
  v343 = 0;
  v336 = 0;
  v337 = &v336;
  v338 = 0x2020000000;
  v339 = 0;
  v332 = 0;
  v333 = &v332;
  v334 = 0x2020000000;
  v335 = 0;
  -[ACCMediaLibraryShim measureMemoryUsage](v294->_context, "measureMemoryUsage");
  v24 = objc_claimAutoreleasedReturnValue();
  if (!-[NSObject BOOLValue](v24, "BOOLValue"))
  {
    v285 = 0;
LABEL_60:

    goto LABEL_61;
  }
  -[ACCMediaLibraryShim memUse](v294->_context, "memUse");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25 == 0;

  if (!v26)
  {
    -[ACCMediaLibraryShim memUse](v294->_context, "memUse");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "mark:", CFSTR("mlUpdateMark"));

    -[ACCMediaLibraryShim memUse](v294->_context, "memUse");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "getMark:", CFSTR("mlUpdateMark"));
    v285 = (void *)objc_claimAutoreleasedReturnValue();

    if (gLogObjects && gNumLogObjects >= 1)
    {
      v24 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
      v24 = MEMORY[0x24BDACB70];
      v29 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v285, "residentMem");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "start");
      objc_msgSend(v285, "virtualMem");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)objc_msgSend(v32, "start");
      objc_msgSend(v285, "physFootprintMem");
      v4 = objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend((id)v4, "start");
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)v359 = v286;
      *(_WORD *)&v359[8] = 2048;
      *(_QWORD *)&v359[10] = v31;
      *(_WORD *)&v359[18] = 2048;
      *(_QWORD *)&v359[20] = v5;
      *(_WORD *)&v359[28] = 2048;
      *(_QWORD *)&v359[30] = v33;
      _os_log_impl(&dword_21A7E0000, v24, OS_LOG_TYPE_INFO, "_beginMediaLibraryUpdatesWithAnchor: anchorTo=%@ memUse:[residentStart=%llu virtualStart=%llu physFootprintStart=%llu]", buf, 0x2Au);

    }
    goto LABEL_60;
  }
  v285 = 0;
LABEL_61:
  v34 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  *((_BYTE *)v341 + 24) = 1;
  mpMediaLibrary = v294->_mpMediaLibrary;
  v327[0] = MEMORY[0x24BDAC760];
  v327[1] = 3221225472;
  v327[2] = __72__ACCMediaLibraryShimInfo__beginMediaLibraryUpdatesWithAnchor_validity___block_invoke;
  v327[3] = &unk_24DD25DE8;
  v327[4] = v294;
  v36 = v34;
  v328 = v36;
  v329 = &v350;
  v330 = &v344;
  v331 = &v340;
  objc_msgSend(mpMediaLibrary, "enumerateEntityChangesAfterSyncAnchor:maximumRevisionType:usingBlock:", v286, 1, v327);
  v37 = CFSTR("0");
  if (v286)
    v37 = v286;
  v292 = v37;
  v278 = objc_msgSend(v36, "count");
  v275 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v38 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v38 = MEMORY[0x24BDACB70];
    v39 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    v40 = objc_msgSend(v36, "count");
    v41 = *((unsigned __int8 *)v341 + 24);
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)v359 = v292;
    *(_WORD *)&v359[8] = 1024;
    *(_DWORD *)&v359[10] = v278;
    *(_WORD *)&v359[14] = 2048;
    *(_QWORD *)&v359[16] = v40;
    *(_WORD *)&v359[24] = 1024;
    *(_DWORD *)&v359[26] = v41;
    _os_log_impl(&dword_21A7E0000, v38, OS_LOG_TYPE_INFO, "_beginMediaLibraryUpdatesWithAnchor: initial diffs, nextAnchor=%@ total=%d allChanges.count=%lu endOfDiffsReached=%d\n", buf, 0x22u);
  }

  if (v13)
  {
    v42 = v294;
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v43 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
        v42 = v294;
      }
      v43 = MEMORY[0x24BDACB70];
      v44 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      UIDString = v42->_UIDString;
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v359 = UIDString;
      _os_log_impl(&dword_21A7E0000, v43, OS_LOG_TYPE_INFO, "Full Updates! resetUpdate: %@", buf, 0xCu);
    }

    -[ACCMediaLibraryShim delegate](v294->_context, "delegate");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "provider");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "resetUpdate:accessory:", v294->_UIDString, v294->_accessory);

  }
  v48 = v294;
  if (v294->_sendPlayAllSongsCapable)
  {
    if (gLogObjects)
      v49 = gNumLogObjects <= 0;
    else
      v49 = 1;
    v50 = !v49;
    if (v294->_libraryType)
    {
      if (v50)
      {
        v51 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
          v48 = v294;
        }
        v51 = MEMORY[0x24BDACB70];
        v53 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        libraryType = v48->_libraryType;
        v55 = v48->_UIDString;
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v359 = libraryType;
        *(_WORD *)&v359[4] = 2112;
        *(_QWORD *)&v359[6] = v55;
        _os_log_impl(&dword_21A7E0000, v51, OS_LOG_TYPE_INFO, "send type=%d PlayAllSongsCapable:NO UIDString=%@", buf, 0x12u);
      }

      -[ACCMediaLibraryShim delegate](v294->_context, "delegate");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "notify:stateChange:enabled:", v294->_UIDString, 1, 0);
    }
    else
    {
      if (v50)
      {
        v52 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
          v48 = v294;
        }
        v52 = MEMORY[0x24BDACB70];
        v57 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
      {
        v58 = v48->_libraryType;
        v59 = v48->_UIDString;
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v359 = v58;
        *(_WORD *)&v359[4] = 2112;
        *(_QWORD *)&v359[6] = v59;
        _os_log_impl(&dword_21A7E0000, v52, OS_LOG_TYPE_INFO, "send type=%d PlayAllSongsCapable:YES UIDString=%@", buf, 0x12u);
      }

      -[ACCMediaLibraryShim delegate](v294->_context, "delegate");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "notify:stateChange:enabled:", v294->_UIDString, 1, 1);
    }

    v48 = v294;
    v294->_sendPlayAllSongsCapable = 0;
  }
  -[NSMutableDictionary objectForKey:](v48->_dbUpdateList, "objectForKey:", CFSTR("PlaylistProperty"));
  v284 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](v48->_dbUpdateList, "objectForKey:", CFSTR("ItemProperty"));
  v279 = (void *)objc_claimAutoreleasedReturnValue();
  if (*((unsigned __int8 *)v337 + 24) > 0x63u)
  {
    v61 = 0;
    goto LABEL_304;
  }
  v61 = 0;
  v62 = 10000;
  v246 = *MEMORY[0x24BDDBD40];
  v247 = *MEMORY[0x24BDDBCD8];
  *(_QWORD *)&v60 = 67111682;
  v245 = v60;
  v63 = v36;
  do
  {
    if (v351[6] < 1 || !v48->_enableLibraryUpdate || v48->_isShuttingDown)
    {
      v36 = v63;
      break;
    }
    if (!v63)
    {
      v351[6] = 0;
      v64 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      *((_BYTE *)v341 + 24) = 1;
      v65 = v48->_mpMediaLibrary;
      v322[0] = MEMORY[0x24BDAC760];
      v322[1] = 3221225472;
      v322[2] = __72__ACCMediaLibraryShimInfo__beginMediaLibraryUpdatesWithAnchor_validity___block_invoke_66;
      v322[3] = &unk_24DD25DE8;
      v322[4] = v48;
      v63 = v64;
      v323 = v63;
      v324 = &v350;
      v325 = &v344;
      v326 = &v340;
      objc_msgSend(v65, "enumerateEntityChangesAfterSyncAnchor:maximumRevisionType:usingBlock:", v292, 1, v322);
      LODWORD(v65) = objc_msgSend(v63, "count");

      v278 += (int)v65;
    }
    v320 = 0u;
    v321 = 0u;
    v318 = 0u;
    v319 = 0u;
    v287 = v63;
    v66 = objc_msgSend(v287, "countByEnumeratingWithState:objects:count:", &v318, v372, 16);
    if (!v66)
      goto LABEL_300;
    v289 = *(_QWORD *)v319;
    v67 = 1 - v278;
    while (2)
    {
      v288 = v66;
      v68 = 0;
      v290 = v62;
      v283 = v61;
      v280 = v67 + v61;
      v69 = 100 * v61 + 100;
      do
      {
        if (*(_QWORD *)v319 != v289)
          objc_enumerationMutation(v287);
        if (!v294->_enableLibraryUpdate || v294->_isShuttingDown)
        {
          v62 = v290 + v68;
          v61 = v283 + v68;
          goto LABEL_300;
        }
        v70 = *(void **)(*((_QWORD *)&v318 + 1) + 8 * v68);
        v71 = v337;
        *((_BYTE *)v337 + 24) = v69 / (v290 + (int)v68 + 1);
        if (((v69 / (v290 + (int)v68 + 1)) & 0xFC) >= 0x64 && !*((_BYTE *)v341 + 24))
          *((_BYTE *)v71 + 24) = 99;
        context = (void *)MEMORY[0x220749824]();
        v72 = objc_msgSend(v70, "deletionType");
        v73 = v72;
        if (v13 && (v72 || !-[ACCMediaLibraryShimInfo _isVisibleUpdate:](v294, "_isVisibleUpdate:", v70)))
        {
          objc_msgSend(v70, "anchor", v245);
          LOBYTE(v13) = 1;
          v5 = v292;
          v292 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_296;
        }
        objc_msgSend(v70, "entity", v245);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v74 = gLogObjects;
          v75 = gNumLogObjects;
          if (gLogObjects && gNumLogObjects >= 1)
          {
            v76 = *(id *)gLogObjects;
          }
          else
          {
            v4 = MEMORY[0x24BDACB70];
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              *(_QWORD *)v359 = v74;
              *(_WORD *)&v359[8] = 1024;
              *(_DWORD *)&v359[10] = v75;
              _os_log_error_impl(&dword_21A7E0000, (os_log_t)v4, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            v80 = (id)v4;
            v76 = v4;
          }
          if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
          {
            v118 = v294->_UIDString;
            objc_msgSend(v70, "anchor");
            v4 = objc_claimAutoreleasedReturnValue();
            v119 = objc_msgSend(v70, "deletionType");
            v120 = objc_msgSend(v5, "persistentID");
            objc_msgSend(v5, "name");
            v121 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413314;
            *(_QWORD *)v359 = v118;
            *(_WORD *)&v359[8] = 2112;
            *(_QWORD *)&v359[10] = v4;
            *(_WORD *)&v359[18] = 2048;
            *(_QWORD *)&v359[20] = v119;
            *(_WORD *)&v359[28] = 2048;
            *(_QWORD *)&v359[30] = v120;
            *(_WORD *)&v359[38] = 2112;
            *(_QWORD *)&v359[40] = v121;
            _os_log_debug_impl(&dword_21A7E0000, v76, OS_LOG_TYPE_DEBUG, "_beginMediaLibraryUpdatesWithAnchor: %@ revision=%@ deletionType=%ld playlist: %llu '%@'", buf, 0x34u);

          }
          if (objc_msgSend(v284, "count"))
          {
            LOBYTE(v354) = 1;
            if (objc_msgSend(v282, "showMusic"))
            {
              if (objc_msgSend(v70, "deletionType"))
              {
                v81 = gLogObjects;
                v82 = gNumLogObjects;
                if (gLogObjects && gNumLogObjects >= 1)
                {
                  v83 = *(id *)gLogObjects;
                }
                else
                {
                  v110 = MEMORY[0x24BDACB70];
                  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 134218240;
                    *(_QWORD *)v359 = v81;
                    *(_WORD *)&v359[8] = 1024;
                    *(_DWORD *)&v359[10] = v82;
                    _os_log_error_impl(&dword_21A7E0000, v110, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                  }
                  v111 = v110;
                  v83 = v110;
                }
                if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
                {
                  v170 = v294->_UIDString;
                  objc_msgSend(v70, "anchor");
                  v171 = (void *)objc_claimAutoreleasedReturnValue();
                  v172 = objc_msgSend(v5, "persistentID");
                  v173 = *((unsigned __int8 *)v337 + 24);
                  accessory = v294->_accessory;
                  *(_DWORD *)buf = 138413314;
                  *(_QWORD *)v359 = v170;
                  *(_WORD *)&v359[8] = 2112;
                  *(_QWORD *)&v359[10] = v171;
                  *(_WORD *)&v359[18] = 2048;
                  *(_QWORD *)&v359[20] = v172;
                  *(_WORD *)&v359[28] = 1024;
                  *(_DWORD *)&v359[30] = v173;
                  *(_WORD *)&v359[34] = 2112;
                  *(_QWORD *)&v359[36] = accessory;
                  _os_log_debug_impl(&dword_21A7E0000, v83, OS_LOG_TYPE_DEBUG, "attempt update:%@ revision:%@ deletePlaylist:%llu progress:%u accessory:%@", buf, 0x30u);

                }
                v314[0] = MEMORY[0x24BDAC760];
                v314[1] = 3221225472;
                v314[2] = __72__ACCMediaLibraryShimInfo__beginMediaLibraryUpdatesWithAnchor_validity___block_invoke_67;
                v314[3] = &unk_24DD25E10;
                v314[4] = v294;
                v314[5] = v70;
                v315 = v5;
                v316 = &v336;
                v317 = &v332;
                v112 = -[ACCMediaLibraryShimInfo _attemptUpdate:](v294, "_attemptUpdate:", v314);
                v113 = gLogObjects;
                v4 = gNumLogObjects;
                if (gLogObjects && gNumLogObjects >= 1)
                {
                  v114 = *(id *)gLogObjects;
                }
                else
                {
                  v114 = MEMORY[0x24BDACB70];
                  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 134218240;
                    *(_QWORD *)v359 = v113;
                    *(_WORD *)&v359[8] = 1024;
                    *(_DWORD *)&v359[10] = v4;
                    _os_log_error_impl(&dword_21A7E0000, v114, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                  }
                  v115 = v114;
                }
                if (os_log_type_enabled(v114, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 134217984;
                  *(_QWORD *)v359 = v112;
                  _os_log_debug_impl(&dword_21A7E0000, v114, OS_LOG_TYPE_DEBUG, "_attemptUpdate result %ld", buf, 0xCu);
                }

              }
              else
              {
                -[ACCMediaLibraryShimInfo _handleMediaLibraryPlaylistUpdate:forLibrary:forProperties:success:](v294, "_handleMediaLibraryPlaylistUpdate:forLibrary:forProperties:success:", v70, v281, v284, &v354);
                v106 = (void *)objc_claimAutoreleasedReturnValue();
                v107 = gLogObjects;
                v108 = gNumLogObjects;
                if (gLogObjects && gNumLogObjects >= 1)
                {
                  v109 = *(id *)gLogObjects;
                }
                else
                {
                  v122 = MEMORY[0x24BDACB70];
                  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 134218240;
                    *(_QWORD *)v359 = v107;
                    *(_WORD *)&v359[8] = 1024;
                    *(_DWORD *)&v359[10] = v108;
                    _os_log_error_impl(&dword_21A7E0000, v122, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                  }
                  v123 = v122;
                  v109 = v122;
                }
                if (os_log_type_enabled(v109, OS_LOG_TYPE_DEBUG))
                {
                  v180 = v294->_UIDString;
                  objc_msgSend(v106, "revision");
                  v181 = (void *)objc_claimAutoreleasedReturnValue();
                  v182 = *((unsigned __int8 *)v337 + 24);
                  v183 = v294->_accessory;
                  *(_DWORD *)buf = 138413314;
                  *(_QWORD *)v359 = v180;
                  *(_WORD *)&v359[8] = 2112;
                  *(_QWORD *)&v359[10] = v181;
                  *(_WORD *)&v359[18] = 2112;
                  *(_QWORD *)&v359[20] = v106;
                  *(_WORD *)&v359[28] = 1024;
                  *(_DWORD *)&v359[30] = v182;
                  *(_WORD *)&v359[34] = 2112;
                  *(_QWORD *)&v359[36] = v183;
                  _os_log_debug_impl(&dword_21A7E0000, v109, OS_LOG_TYPE_DEBUG, "attempt update:%@ revision:%@ playlist:%@ progress:%u accessory:%@", buf, 0x30u);

                }
                v310[0] = MEMORY[0x24BDAC760];
                v310[1] = 3221225472;
                v310[2] = __72__ACCMediaLibraryShimInfo__beginMediaLibraryUpdatesWithAnchor_validity___block_invoke_69;
                v310[3] = &unk_24DD25E38;
                v310[4] = v294;
                v4 = v106;
                v311 = (id)v4;
                v312 = &v336;
                v313 = &v332;
                v124 = -[ACCMediaLibraryShimInfo _attemptUpdate:](v294, "_attemptUpdate:", v310);
                v125 = gLogObjects;
                v126 = gNumLogObjects;
                if (gLogObjects && gNumLogObjects >= 1)
                {
                  v127 = *(id *)gLogObjects;
                }
                else
                {
                  v127 = MEMORY[0x24BDACB70];
                  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 134218240;
                    *(_QWORD *)v359 = v125;
                    *(_WORD *)&v359[8] = 1024;
                    *(_DWORD *)&v359[10] = v126;
                    _os_log_error_impl(&dword_21A7E0000, v127, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                  }
                  v128 = v127;
                }
                if (os_log_type_enabled(v127, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 134217984;
                  *(_QWORD *)v359 = v124;
                  _os_log_debug_impl(&dword_21A7E0000, v127, OS_LOG_TYPE_DEBUG, "_attemptUpdate result %ld", buf, 0xCu);
                }

                if (!objc_msgSend((id)v4, "contentStyle")
                  || (objc_msgSend((id)v4, "content"),
                      v129 = (void *)objc_claimAutoreleasedReturnValue(),
                      v130 = v129 == 0,
                      v129,
                      v130))
                {
                  v134 = gLogObjects;
                  v135 = gNumLogObjects;
                  if (gLogObjects && gNumLogObjects >= 1)
                  {
                    v136 = *(id *)gLogObjects;
                  }
                  else
                  {
                    v137 = MEMORY[0x24BDACB70];
                    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 134218240;
                      *(_QWORD *)v359 = v134;
                      *(_WORD *)&v359[8] = 1024;
                      *(_DWORD *)&v359[10] = v135;
                      _os_log_error_impl(&dword_21A7E0000, v137, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                    }
                    v138 = v137;
                    v136 = v137;
                  }
                  if (os_log_type_enabled(v136, OS_LOG_TYPE_INFO))
                  {
                    v139 = v294->_UIDString;
                    objc_msgSend((id)v4, "revision");
                    v140 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v294->_requestedTransferID)
                      v141 = 1;
                    else
                      v141 = v294->_requestedMetaList && v294->_requestedMetaProperties;
                    v184 = objc_msgSend((id)v4, "contentStyle");
                    if (v184)
                    {
                      objc_msgSend((id)v4, "content");
                      v248 = (void *)objc_claimAutoreleasedReturnValue();
                      v185 = v248 != 0;
                    }
                    else
                    {
                      v185 = 0;
                    }
                    *(_DWORD *)buf = 138413058;
                    *(_QWORD *)v359 = v139;
                    *(_WORD *)&v359[8] = 2112;
                    *(_QWORD *)&v359[10] = v140;
                    *(_WORD *)&v359[18] = 1024;
                    *(_DWORD *)&v359[20] = v141;
                    *(_WORD *)&v359[24] = 1024;
                    *(_DWORD *)&v359[26] = v185;
                    _os_log_impl(&dword_21A7E0000, v136, OS_LOG_TYPE_INFO, "update:%@ revision:%@ playlist content not requested(%d) or not available(%d)", buf, 0x22u);
                    if (v184)

                  }
                }
                else
                {
                  v131 = gLogObjects;
                  v132 = gNumLogObjects;
                  if (gLogObjects && gNumLogObjects >= 1)
                  {
                    v133 = *(id *)gLogObjects;
                  }
                  else
                  {
                    v153 = MEMORY[0x24BDACB70];
                    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 134218240;
                      *(_QWORD *)v359 = v131;
                      *(_WORD *)&v359[8] = 1024;
                      *(_DWORD *)&v359[10] = v132;
                      _os_log_error_impl(&dword_21A7E0000, v153, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                    }
                    v154 = v153;
                    v133 = v153;
                  }
                  if (os_log_type_enabled(v133, OS_LOG_TYPE_DEBUG))
                  {
                    v203 = v294->_UIDString;
                    objc_msgSend((id)v4, "revision");
                    v204 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend((id)v4, "content");
                    v205 = (void *)objc_claimAutoreleasedReturnValue();
                    v206 = *((unsigned __int8 *)v337 + 24);
                    v207 = v294->_accessory;
                    *(_DWORD *)buf = 138413314;
                    *(_QWORD *)v359 = v203;
                    *(_WORD *)&v359[8] = 2112;
                    *(_QWORD *)&v359[10] = v204;
                    *(_WORD *)&v359[18] = 2112;
                    *(_QWORD *)&v359[20] = v205;
                    *(_WORD *)&v359[28] = 1024;
                    *(_DWORD *)&v359[30] = v206;
                    *(_WORD *)&v359[34] = 2112;
                    *(_QWORD *)&v359[36] = v207;
                    _os_log_debug_impl(&dword_21A7E0000, v133, OS_LOG_TYPE_DEBUG, "attempt update:%@ revision:%@ content:%@ progress:%u accessory:%@", buf, 0x30u);

                  }
                  v307[0] = MEMORY[0x24BDAC760];
                  v307[1] = 3221225472;
                  v307[2] = __72__ACCMediaLibraryShimInfo__beginMediaLibraryUpdatesWithAnchor_validity___block_invoke_70;
                  v307[3] = &unk_24DD25E60;
                  v307[4] = v294;
                  v308 = (id)v4;
                  v309 = &v336;
                  v155 = -[ACCMediaLibraryShimInfo _attemptUpdate:](v294, "_attemptUpdate:", v307);
                  v156 = gLogObjects;
                  v157 = gNumLogObjects;
                  if (gLogObjects && gNumLogObjects >= 1)
                  {
                    v158 = *(id *)gLogObjects;
                  }
                  else
                  {
                    v158 = MEMORY[0x24BDACB70];
                    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 134218240;
                      *(_QWORD *)v359 = v156;
                      *(_WORD *)&v359[8] = 1024;
                      *(_DWORD *)&v359[10] = v157;
                      _os_log_error_impl(&dword_21A7E0000, v158, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                    }
                    v159 = v158;
                  }
                  if (os_log_type_enabled(v158, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 134217984;
                    *(_QWORD *)v359 = v155;
                    _os_log_debug_impl(&dword_21A7E0000, v158, OS_LOG_TYPE_DEBUG, "_attemptUpdate result %ld", buf, 0xCu);
                  }

                }
              }
            }
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v77 = gLogObjects;
            v78 = gNumLogObjects;
            if (gLogObjects && gNumLogObjects >= 1)
            {
              v79 = *(id *)gLogObjects;
            }
            else
            {
              v4 = MEMORY[0x24BDACB70];
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218240;
                *(_QWORD *)v359 = v77;
                *(_WORD *)&v359[8] = 1024;
                *(_DWORD *)&v359[10] = v78;
                _os_log_error_impl(&dword_21A7E0000, (os_log_t)v4, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              v87 = (id)v4;
              v79 = v4;
            }
            if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
            {
              v271 = v294->_UIDString;
              objc_msgSend(v70, "anchor");
              v4 = objc_claimAutoreleasedReturnValue();
              v142 = objc_msgSend(v70, "deletionType");
              v143 = objc_msgSend(v5, "persistentID");
              objc_msgSend(v5, "title");
              v144 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413314;
              *(_QWORD *)v359 = v271;
              *(_WORD *)&v359[8] = 2112;
              *(_QWORD *)&v359[10] = v4;
              *(_WORD *)&v359[18] = 2048;
              *(_QWORD *)&v359[20] = v142;
              *(_WORD *)&v359[28] = 2048;
              *(_QWORD *)&v359[30] = v143;
              *(_WORD *)&v359[38] = 2112;
              *(_QWORD *)&v359[40] = v144;
              _os_log_debug_impl(&dword_21A7E0000, v79, OS_LOG_TYPE_DEBUG, "_beginMediaLibraryUpdatesWithAnchor: %@ revision=%@ deletionType=%ld item: %llu '%@'", buf, 0x34u);

            }
            if (objc_msgSend(v279, "count"))
            {
              LOBYTE(v354) = 1;
              v4 = v5;
              if (objc_msgSend(v70, "deletionType") || (objc_msgSend((id)v4, "existsInLibrary") & 1) == 0)
              {
                v92 = gLogObjects;
                v93 = gNumLogObjects;
                if (gLogObjects && gNumLogObjects >= 1)
                {
                  v94 = *(id *)gLogObjects;
                }
                else
                {
                  v95 = MEMORY[0x24BDACB70];
                  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 134218240;
                    *(_QWORD *)v359 = v92;
                    *(_WORD *)&v359[8] = 1024;
                    *(_DWORD *)&v359[10] = v93;
                    _os_log_error_impl(&dword_21A7E0000, v95, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                  }
                  v96 = v95;
                  v94 = v95;
                }
                if (os_log_type_enabled(v94, OS_LOG_TYPE_DEBUG))
                {
                  v160 = v294->_UIDString;
                  objc_msgSend(v70, "anchor");
                  v161 = (void *)objc_claimAutoreleasedReturnValue();
                  v162 = objc_msgSend((id)v4, "persistentID");
                  v163 = *((unsigned __int8 *)v337 + 24);
                  v164 = v294->_accessory;
                  *(_DWORD *)buf = 138413314;
                  *(_QWORD *)v359 = v160;
                  *(_WORD *)&v359[8] = 2112;
                  *(_QWORD *)&v359[10] = v161;
                  *(_WORD *)&v359[18] = 2048;
                  *(_QWORD *)&v359[20] = v162;
                  *(_WORD *)&v359[28] = 1024;
                  *(_DWORD *)&v359[30] = v163;
                  *(_WORD *)&v359[34] = 2112;
                  *(_QWORD *)&v359[36] = v164;
                  _os_log_debug_impl(&dword_21A7E0000, v94, OS_LOG_TYPE_DEBUG, "attempt update:%@ revision:%@ deleteItem:%llu progress:%u accessory:%@", buf, 0x30u);

                }
                v303[0] = MEMORY[0x24BDAC760];
                v303[1] = 3221225472;
                v303[2] = __72__ACCMediaLibraryShimInfo__beginMediaLibraryUpdatesWithAnchor_validity___block_invoke_71;
                v303[3] = &unk_24DD25E10;
                v303[4] = v294;
                v303[5] = v70;
                v304 = (id)v4;
                v305 = &v336;
                v306 = &v332;
                v97 = -[ACCMediaLibraryShimInfo _attemptUpdate:](v294, "_attemptUpdate:", v303);
                v98 = gLogObjects;
                v99 = gNumLogObjects;
                if (gLogObjects && gNumLogObjects >= 1)
                {
                  v100 = *(id *)gLogObjects;
                }
                else
                {
                  v100 = MEMORY[0x24BDACB70];
                  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 134218240;
                    *(_QWORD *)v359 = v98;
                    *(_WORD *)&v359[8] = 1024;
                    *(_DWORD *)&v359[10] = v99;
                    _os_log_error_impl(&dword_21A7E0000, v100, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                  }
                  v101 = v100;
                }
                if (os_log_type_enabled(v100, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 134217984;
                  *(_QWORD *)v359 = v97;
                  _os_log_debug_impl(&dword_21A7E0000, v100, OS_LOG_TYPE_DEBUG, "_attemptUpdate result %ld", buf, 0xCu);
                }

              }
              else
              {
                -[ACCMediaLibraryShimInfo _handleMediaLibraryItemUpdate:forLibrary:forProperties:success:forceDelete:](v294, "_handleMediaLibraryItemUpdate:forLibrary:forProperties:success:forceDelete:", v70, v281, v279, &v354, v73 != 0);
                v88 = (void *)objc_claimAutoreleasedReturnValue();
                v89 = gLogObjects;
                v90 = gNumLogObjects;
                if (gLogObjects && gNumLogObjects >= 1)
                {
                  v91 = *(id *)gLogObjects;
                }
                else
                {
                  v145 = MEMORY[0x24BDACB70];
                  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 134218240;
                    *(_QWORD *)v359 = v89;
                    *(_WORD *)&v359[8] = 1024;
                    *(_DWORD *)&v359[10] = v90;
                    _os_log_error_impl(&dword_21A7E0000, v145, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                  }
                  v146 = v145;
                  v91 = v145;
                }
                if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
                {
                  v199 = v294->_UIDString;
                  objc_msgSend(v88, "revision");
                  v200 = (void *)objc_claimAutoreleasedReturnValue();
                  v201 = *((unsigned __int8 *)v337 + 24);
                  v202 = v294->_accessory;
                  *(_DWORD *)buf = 138413314;
                  *(_QWORD *)v359 = v199;
                  *(_WORD *)&v359[8] = 2112;
                  *(_QWORD *)&v359[10] = v200;
                  *(_WORD *)&v359[18] = 2112;
                  *(_QWORD *)&v359[20] = v88;
                  *(_WORD *)&v359[28] = 1024;
                  *(_DWORD *)&v359[30] = v201;
                  *(_WORD *)&v359[34] = 2112;
                  *(_QWORD *)&v359[36] = v202;
                  _os_log_debug_impl(&dword_21A7E0000, v91, OS_LOG_TYPE_DEBUG, "attempt update:%@ revision:%@ item:[%@] progress:%u accessory:%@", buf, 0x30u);

                }
                v299[0] = MEMORY[0x24BDAC760];
                v299[1] = 3221225472;
                v299[2] = __72__ACCMediaLibraryShimInfo__beginMediaLibraryUpdatesWithAnchor_validity___block_invoke_72;
                v299[3] = &unk_24DD25E38;
                v299[4] = v294;
                v147 = v88;
                v300 = v147;
                v301 = &v336;
                v302 = &v332;
                v148 = -[ACCMediaLibraryShimInfo _attemptUpdate:](v294, "_attemptUpdate:", v299);
                v149 = gLogObjects;
                v150 = gNumLogObjects;
                if (gLogObjects && gNumLogObjects >= 1)
                {
                  v151 = *(id *)gLogObjects;
                }
                else
                {
                  v151 = MEMORY[0x24BDACB70];
                  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 134218240;
                    *(_QWORD *)v359 = v149;
                    *(_WORD *)&v359[8] = 1024;
                    *(_DWORD *)&v359[10] = v150;
                    _os_log_error_impl(&dword_21A7E0000, v151, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                  }
                  v152 = v151;
                }
                if (os_log_type_enabled(v151, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 134217984;
                  *(_QWORD *)v359 = v148;
                  _os_log_debug_impl(&dword_21A7E0000, v151, OS_LOG_TYPE_DEBUG, "_attemptUpdate result %ld", buf, 0xCu);
                }

              }
              if (objc_msgSend((id)v4, "mediaType")
                && ((objc_msgSend((id)v4, "mediaType") & v276) == 0 || (objc_msgSend((id)v4, "mediaType") & 6) != 0))
              {
                v102 = gLogObjects;
                v103 = gNumLogObjects;
                if (gLogObjects && gNumLogObjects >= 1)
                {
                  v104 = *(id *)gLogObjects;
                }
                else
                {
                  v116 = MEMORY[0x24BDACB70];
                  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 134218240;
                    *(_QWORD *)v359 = v102;
                    *(_WORD *)&v359[8] = 1024;
                    *(_DWORD *)&v359[10] = v103;
                    _os_log_error_impl(&dword_21A7E0000, v116, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                  }
                  v117 = v116;
                  v104 = v116;
                }
                if (os_log_type_enabled(v104, OS_LOG_TYPE_DEBUG))
                {
                  v273 = +[ACCMediaLibraryShimInfo isItemAd:](ACCMediaLibraryShimInfo, "isItemAd:", v4);
                  v269 = objc_msgSend((id)v4, "existsInLibrary");
                  v266 = -[ACCMediaLibraryShim subscribedToAppleMusic](v294->_context, "subscribedToAppleMusic");
                  requestedMetaProperties = v294->_requestedMetaProperties;
                  requestedMetaList = v294->_requestedMetaList;
                  v262 = objc_msgSend((id)v4, "persistentID");
                  objc_msgSend((id)v4, "title");
                  v176 = (id)objc_claimAutoreleasedReturnValue();
                  objc_msgSend((id)v4, "artist");
                  v177 = (id)objc_claimAutoreleasedReturnValue();
                  objc_msgSend((id)v4, "albumTitle");
                  v178 = (id)objc_claimAutoreleasedReturnValue();
                  v179 = objc_msgSend((id)v4, "mediaType");
                  *(_DWORD *)buf = v245;
                  *(_DWORD *)v359 = v273;
                  *(_WORD *)&v359[4] = 1024;
                  *(_DWORD *)&v359[6] = v269;
                  *(_WORD *)&v359[10] = 1024;
                  *(_DWORD *)&v359[12] = v266;
                  *(_WORD *)&v359[16] = 1024;
                  *(_DWORD *)&v359[18] = requestedMetaProperties;
                  *(_WORD *)&v359[22] = 1024;
                  *(_DWORD *)&v359[24] = requestedMetaList;
                  *(_WORD *)&v359[28] = 2048;
                  *(_QWORD *)&v359[30] = v262;
                  *(_WORD *)&v359[38] = 2112;
                  *(_QWORD *)&v359[40] = v176;
                  *(_WORD *)&v359[48] = 2112;
                  *(_QWORD *)v360 = v177;
                  *(_WORD *)&v360[8] = 2112;
                  *(_QWORD *)&v360[10] = v178;
                  *(_WORD *)&v360[18] = 2048;
                  *(_QWORD *)&v360[20] = v179;
                  *(_WORD *)&v360[28] = 1024;
                  *(_DWORD *)&v360[30] = v276;
                  _os_log_debug_impl(&dword_21A7E0000, v104, OS_LOG_TYPE_DEBUG, "_beginMediaLibraryUpdatesWithAnchor: skip item update: isItemAd=%d existsInLibrary=%d subscribedToAppleMusic=%d _requestedMetaProperties=%d _requestedMetaList=%d mpItem=(persistentID=%llu title='%@' artist='%@' album='%@' type=%lxh) validMediaTypeMask=%xh", buf, 0x58u);

                }
              }

            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v84 = gLogObjects;
              v85 = gNumLogObjects;
              if (gLogObjects && gNumLogObjects >= 1)
              {
                v86 = *(id *)gLogObjects;
              }
              else
              {
                v4 = MEMORY[0x24BDACB70];
                if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 134218240;
                  *(_QWORD *)v359 = v84;
                  *(_WORD *)&v359[8] = 1024;
                  *(_DWORD *)&v359[10] = v85;
                  _os_log_error_impl(&dword_21A7E0000, (os_log_t)v4, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                }
                v105 = (id)v4;
                v86 = v4;
              }
              if (os_log_type_enabled(v86, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v70, "anchor");
                v272 = (void *)objc_claimAutoreleasedReturnValue();
                v268 = (id)objc_opt_class();
                objc_opt_class();
                isKindOfClass = objc_opt_isKindOfClass();
                objc_opt_class();
                v166 = objc_opt_isKindOfClass();
                v4 = objc_msgSend(v5, "persistentID");
                objc_msgSend(v5, "valueForProperty:", v247);
                v167 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "valueForProperty:", v246);
                v168 = isKindOfClass & 1;
                v169 = (id)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138414082;
                *(_QWORD *)v359 = v272;
                *(_WORD *)&v359[8] = 2112;
                *(_QWORD *)&v359[10] = v5;
                *(_WORD *)&v359[18] = 2112;
                *(_QWORD *)&v359[20] = v268;
                *(_WORD *)&v359[28] = 1024;
                *(_DWORD *)&v359[30] = v168;
                *(_WORD *)&v359[34] = 1024;
                *(_DWORD *)&v359[36] = v166 & 1;
                *(_WORD *)&v359[40] = 2048;
                *(_QWORD *)&v359[42] = v4;
                *(_WORD *)v360 = 2112;
                *(_QWORD *)&v360[2] = v167;
                *(_WORD *)&v360[10] = 2112;
                *(_QWORD *)&v360[12] = v169;
                _os_log_debug_impl(&dword_21A7E0000, v86, OS_LOG_TYPE_DEBUG, "_beginMediaLibraryUpdatesWithAnchor: skip unknown update: revision=%@ entity=%@ (class=%@ (isMPItem=%d isMPPlaylist=%d) persistentID=%llu itemTitle='%@' playlistName='%@')", buf, 0x4Au);

              }
            }
          }
        }
        objc_msgSend(v70, "anchor");
        v186 = objc_claimAutoreleasedReturnValue();

        -[ACCMediaLibraryShim measureMemoryUsage](v294->_context, "measureMemoryUsage");
        v187 = objc_claimAutoreleasedReturnValue();
        if (-[NSObject BOOLValue](v187, "BOOLValue"))
        {
          -[ACCMediaLibraryShim memUse](v294->_context, "memUse");
          v188 = (void *)objc_claimAutoreleasedReturnValue();
          v189 = v188 == 0;

          if (v189 || ((v283 + (_DWORD)v68 + 1) & 0x7F) != 0 && v280 + (_DWORD)v68)
            goto LABEL_295;
          -[ACCMediaLibraryShim memUse](v294->_context, "memUse");
          v190 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v190, "update");

          if (!v285)
            goto LABEL_295;
          objc_msgSend(v285, "timeIntervalSinceLastUpdate");
          if (v191 < 1.0)
            goto LABEL_295;
          v192 = gLogObjects;
          v193 = gNumLogObjects;
          if (gLogObjects && gNumLogObjects >= 1)
          {
            v187 = *(id *)gLogObjects;
          }
          else
          {
            v4 = MEMORY[0x24BDACB70];
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              *(_QWORD *)v359 = v192;
              *(_WORD *)&v359[8] = 1024;
              *(_DWORD *)&v359[10] = v193;
              _os_log_error_impl(&dword_21A7E0000, (os_log_t)v4, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            v194 = (id)v4;
            v187 = v4;
          }
          if (os_log_type_enabled(v187, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v285, "residentMem");
            v293 = (void *)objc_claimAutoreleasedReturnValue();
            v257 = objc_msgSend(v293, "last");
            objc_msgSend(v285, "residentMem");
            v274 = (void *)objc_claimAutoreleasedReturnValue();
            v256 = objc_msgSend(v274, "last");
            objc_msgSend(v285, "residentMem");
            v270 = (void *)objc_claimAutoreleasedReturnValue();
            v255 = objc_msgSend(v270, "max");
            objc_msgSend(v285, "residentMem");
            v267 = (void *)objc_claimAutoreleasedReturnValue();
            v254 = objc_msgSend(v267, "max");
            objc_msgSend(v285, "virtualMem");
            v265 = (void *)objc_claimAutoreleasedReturnValue();
            v253 = objc_msgSend(v265, "last");
            objc_msgSend(v285, "virtualMem");
            v263 = (void *)objc_claimAutoreleasedReturnValue();
            v252 = objc_msgSend(v263, "last");
            objc_msgSend(v285, "virtualMem");
            v261 = (void *)objc_claimAutoreleasedReturnValue();
            v251 = objc_msgSend(v261, "max");
            objc_msgSend(v285, "virtualMem");
            v260 = (void *)objc_claimAutoreleasedReturnValue();
            v250 = objc_msgSend(v260, "max");
            objc_msgSend(v285, "physFootprintMem");
            v259 = (void *)objc_claimAutoreleasedReturnValue();
            v249 = objc_msgSend(v259, "last");
            objc_msgSend(v285, "physFootprintMem");
            v258 = (void *)objc_claimAutoreleasedReturnValue();
            v4 = objc_msgSend(v258, "last");
            objc_msgSend(v285, "physFootprintMem");
            v195 = (void *)objc_claimAutoreleasedReturnValue();
            v196 = objc_msgSend(v195, "max");
            objc_msgSend(v285, "physFootprintMem");
            v197 = (void *)objc_claimAutoreleasedReturnValue();
            v198 = objc_msgSend(v197, "max");
            *(_DWORD *)buf = 67112962;
            *(_DWORD *)v359 = v283 + v68 + 1;
            *(_WORD *)&v359[4] = 1024;
            *(_DWORD *)&v359[6] = v278;
            *(_WORD *)&v359[10] = 2112;
            *(_QWORD *)&v359[12] = v286;
            *(_WORD *)&v359[20] = 2112;
            *(_QWORD *)&v359[22] = v186;
            *(_WORD *)&v359[30] = 2048;
            *(_QWORD *)&v359[32] = v257;
            *(_WORD *)&v359[40] = 2048;
            *(double *)&v359[42] = (double)v256 / 1000000.0;
            *(_WORD *)v360 = 2048;
            *(_QWORD *)&v360[2] = v255;
            *(_WORD *)&v360[10] = 2048;
            *(double *)&v360[12] = (double)v254 / 1000000.0;
            *(_WORD *)&v360[20] = 2048;
            *(_QWORD *)&v360[22] = v253;
            *(_WORD *)&v360[30] = 2048;
            *(double *)&v360[32] = (double)v252 / 1000000.0;
            *(_WORD *)&v360[40] = 2048;
            v361 = v251;
            v362 = 2048;
            v363 = (double)v250 / 1000000.0;
            v364 = 2048;
            v365 = v249;
            v366 = 2048;
            v367 = (double)(unint64_t)v4 / 1000000.0;
            v368 = 2048;
            v369 = v196;
            v370 = 2048;
            v371 = (double)v198 / 1000000.0;
            _os_log_impl(&dword_21A7E0000, v187, OS_LOG_TYPE_INFO, "_beginMediaLibraryUpdatesWithAnchor: %d / %d, anchorTo=%@ nextAnchor=%@ memUse:[resident=%llu(%.3fM)/%llu(%.3fM) virtual=%llu(%.3fM)/%llu(%.3fM) physFootprint=%llu(%.3fM)/%llu(%.3fM)]", buf, 0x9Au);

          }
        }

LABEL_295:
        LOBYTE(v13) = 0;
        v292 = (__CFString *)v186;
LABEL_296:

        objc_autoreleasePoolPop(context);
        ++v68;
        v69 += 100;
      }
      while (v288 != v68);
      v66 = objc_msgSend(v287, "countByEnumeratingWithState:objects:count:", &v318, v372, 16);
      v61 = v283 + v68;
      v62 = v290 + v68;
      v67 = 1 - v278;
      if (v66)
        continue;
      break;
    }
    v62 = v290 + v68;
    v61 = v283 + v68;
LABEL_300:

    v63 = 0;
    v36 = 0;
    v48 = v294;
  }
  while (*((unsigned __int8 *)v337 + 24) < 0x64u);
LABEL_304:
  if (gLogObjects)
    v208 = gNumLogObjects < 1;
  else
    v208 = 1;
  if (v208)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v210 = MEMORY[0x24BDACB70];
    v209 = MEMORY[0x24BDACB70];
  }
  else
  {
    v210 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v210, OS_LOG_TYPE_DEBUG))
  {
    v234 = *((_DWORD *)v333 + 6);
    *(_DWORD *)buf = 138413314;
    *(_QWORD *)v359 = 0;
    *(_WORD *)&v359[8] = 2112;
    *(_QWORD *)&v359[10] = v292;
    *(_WORD *)&v359[18] = 1024;
    *(_DWORD *)&v359[20] = v61;
    *(_WORD *)&v359[24] = 1024;
    *(_DWORD *)&v359[26] = v234;
    *(_WORD *)&v359[30] = 1024;
    *(_DWORD *)&v359[32] = v278;
    _os_log_debug_impl(&dword_21A7E0000, v210, OS_LOG_TYPE_DEBUG, "_beginMediaLibraryUpdatesWithAnchor: lastAnchor=%@ nextAnchor=%@ count=%d lastSentProgress=%d total=%d", buf, 0x28u);
  }

  v211 = v294;
  -[NSMutableDictionary objectForKey:](v294->_dbUpdateList, "objectForKey:", CFSTR("Progress"));
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  if (v212)
  {
    if (v61)
    {
      v213 = *((_DWORD *)v333 + 6) < 0x64u;

      if (!v213)
      {
        v214 = 0;
        goto LABEL_337;
      }
    }
    else
    {

    }
    v215 = v292;
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v216 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
      v216 = MEMORY[0x24BDACB70];
      v217 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v216, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v359 = v215;
      _os_log_impl(&dword_21A7E0000, v216, OS_LOG_TYPE_INFO, "_beginMediaLibraryUpdatesWithAnchor: attempt need final 100 progress update!!! lastAnchor=%@", buf, 0xCu);
    }

    v295[0] = MEMORY[0x24BDAC760];
    v295[1] = 3221225472;
    v295[2] = __72__ACCMediaLibraryShimInfo__beginMediaLibraryUpdatesWithAnchor_validity___block_invoke_74;
    v295[3] = &unk_24DD25E60;
    v214 = v215;
    v296 = v214;
    v297 = v294;
    v298 = &v332;
    v218 = -[ACCMediaLibraryShimInfo _attemptUpdate:](v294, "_attemptUpdate:", v295);
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v4 = (uint64_t)*(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
      v4 = MEMORY[0x24BDACB70];
      v219 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_DEBUG))
      -[ACCMediaLibraryShimInfo _beginMediaLibraryUpdatesWithAnchor:validity:].cold.3(v218, v4, v220, v221, v222, v223, v224, v225);

LABEL_337:
    v211 = v294;
  }
  else
  {
    v214 = 0;
  }
  -[ACCMediaLibraryShim measureMemoryUsage](v211->_context, "measureMemoryUsage", v245);
  v226 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v226, "BOOLValue"))
  {
    -[ACCMediaLibraryShim memUse](v211->_context, "memUse");
    v227 = (void *)objc_claimAutoreleasedReturnValue();
    v228 = v227 == 0;

    if (!v228)
    {
      -[ACCMediaLibraryShim memUse](v294->_context, "memUse");
      v229 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v229, "update");

      if (gLogObjects && gNumLogObjects >= 1)
      {
        v230 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
        v230 = MEMORY[0x24BDACB70];
        v231 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v230, OS_LOG_TYPE_DEFAULT))
      {
        if (v285)
        {
          objc_msgSend(MEMORY[0x24BDBCE60], "date");
          v4 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v285, "startTime");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v4, "timeIntervalSinceDate:", v5);
          v233 = v232;
        }
        else
        {
          v233 = 0;
        }
        v235 = v351[6];
        v236 = v345[5];
        -[ACCMediaLibraryShim memUse](v294->_context, "memUse");
        v237 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134220546;
        *(_QWORD *)v359 = v233;
        *(_WORD *)&v359[8] = 2112;
        *(_QWORD *)&v359[10] = v286;
        *(_WORD *)&v359[18] = 2112;
        *(_QWORD *)&v359[20] = v292;
        *(_WORD *)&v359[28] = 2112;
        *(_QWORD *)&v359[30] = v281;
        *(_WORD *)&v359[38] = 1024;
        *(_DWORD *)&v359[40] = v61;
        *(_WORD *)&v359[44] = 1024;
        *(_DWORD *)&v359[46] = v278;
        *(_WORD *)v360 = 1024;
        *(_DWORD *)&v360[2] = v235;
        *(_WORD *)&v360[6] = 1024;
        *(_DWORD *)&v360[8] = 500;
        *(_WORD *)&v360[12] = 2112;
        *(_QWORD *)&v360[14] = v236;
        *(_WORD *)&v360[22] = 2112;
        *(_QWORD *)&v360[24] = v292;
        *(_WORD *)&v360[32] = 2112;
        *(_QWORD *)&v360[34] = v237;
        _os_log_impl(&dword_21A7E0000, v230, OS_LOG_TYPE_DEFAULT, "_beginMediaLibraryUpdatesWithAnchor: Finished in %f sec, anchorTo=%@ nextAnchor=%@, validity=%@, count=%d / %d, numChanges=%d, kMaxChangesPerIteration=%d, lastAccumulatedRevision=%@, nextAnchor=%@, memUse: \n%@ \n", buf, 0x60u);

        if (v285)
        {

        }
      }

      if (gLogObjects && gNumLogObjects >= 1)
      {
        v238 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
        v238 = MEMORY[0x24BDACB70];
        v239 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v238, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v359 = v285;
        _os_log_impl(&dword_21A7E0000, v238, OS_LOG_TYPE_DEFAULT, "_beginMediaLibraryUpdatesWithAnchor: statMark: \nmark: \n%@ ", buf, 0xCu);
      }

      -[ACCMediaLibraryShim memUse](v294->_context, "memUse");
      v226 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v226, "removeMark:", CFSTR("mlUpdateMark"));
      v285 = 0;
      goto LABEL_361;
    }
  }
  else
  {
LABEL_361:

  }
  if (v275)
  {
    v240 = v275;
    v354 = 0u;
    v355 = 0u;
    v356 = 0u;
    v357 = 0u;
    v241 = objc_msgSend(v240, "countByEnumeratingWithState:objects:count:", &v354, buf, 16);
    if (v241)
    {
      v242 = *(_QWORD *)v355;
      do
      {
        for (i = 0; i != v241; ++i)
        {
          if (*(_QWORD *)v355 != v242)
            objc_enumerationMutation(v240);
          dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*((_QWORD *)&v354 + 1) + 8 * i));
        }
        v241 = objc_msgSend(v240, "countByEnumeratingWithState:objects:count:", &v354, buf, 16);
      }
      while (v241);
    }
    objc_msgSend(v240, "removeAllObjects");

  }
  v294->_processingDiffUpdate = 0;
  v16 = v292;

  _Block_object_dispose(&v332, 8);
  _Block_object_dispose(&v336, 8);
  _Block_object_dispose(&v340, 8);
  _Block_object_dispose(&v344, 8);

  _Block_object_dispose(&v350, 8);
LABEL_372:

  return v16;
}

void __72__ACCMediaLibraryShimInfo__beginMediaLibraryUpdatesWithAnchor_validity___block_invoke(uint64_t a1, void *a2, char *a3)
{
  id v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char v11;
  id v12;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v6 + 33) && !*(_BYTE *)(v6 + 32))
  {
    v12 = v5;
    if ((unint64_t)objc_msgSend(*(id *)(a1 + 40), "count") > 0x1F3)
    {
      v11 = 0;
      v7 = 1;
    }
    else
    {
      ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v12);
      objc_msgSend(v12, "anchor");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

      v7 = 0;
      v11 = 1;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v11;
    v5 = v12;
  }
  else
  {
    v7 = 1;
  }
  *a3 = v7;

}

void __72__ACCMediaLibraryShimInfo__beginMediaLibraryUpdatesWithAnchor_validity___block_invoke_66(uint64_t a1, void *a2, char *a3)
{
  id v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char v11;
  id v12;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v6 + 33) && !*(_BYTE *)(v6 + 32))
  {
    v12 = v5;
    if ((unint64_t)objc_msgSend(*(id *)(a1 + 40), "count") > 0x1F3)
    {
      v11 = 0;
      v7 = 1;
    }
    else
    {
      ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v12);
      objc_msgSend(v12, "anchor");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

      v7 = 0;
      v11 = 1;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v11;
    v5 = v12;
  }
  else
  {
    v7 = 1;
  }
  *a3 = v7;

}

uint64_t __72__ACCMediaLibraryShimInfo__beginMediaLibraryUpdatesWithAnchor_validity___block_invoke_67(uint64_t a1)
{
  BOOL v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  if (gLogObjects)
    v2 = gNumLogObjects < 1;
  else
    v2 = 1;
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v4 = MEMORY[0x24BDACB70];
    v3 = MEMORY[0x24BDACB70];
  }
  else
  {
    v4 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __72__ACCMediaLibraryShimInfo__beginMediaLibraryUpdatesWithAnchor_validity___block_invoke_67_cold_1(a1);

  v5 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v5 + 32) || !*(_BYTE *)(v5 + 33))
    return 3;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56)
                                                                                               + 8)
                                                                                   + 24);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "provider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
  objc_msgSend(*(id *)(a1 + 40), "anchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v8, "update:revision:deletePlaylist:progress:accessory:", v9, v10, objc_msgSend(*(id *)(a1 + 48), "persistentID"), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));

  return v6;
}

uint64_t __72__ACCMediaLibraryShimInfo__beginMediaLibraryUpdatesWithAnchor_validity___block_invoke_69(uint64_t a1)
{
  BOOL v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  if (gLogObjects)
    v2 = gNumLogObjects < 1;
  else
    v2 = 1;
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v4 = MEMORY[0x24BDACB70];
    v3 = MEMORY[0x24BDACB70];
  }
  else
  {
    v4 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __72__ACCMediaLibraryShimInfo__beginMediaLibraryUpdatesWithAnchor_validity___block_invoke_69_cold_1(a1);

  v5 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v5 + 32) || !*(_BYTE *)(v5 + 33))
    return 3;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48)
                                                                                               + 8)
                                                                                   + 24);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "provider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
  objc_msgSend(*(id *)(a1 + 40), "revision");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v8, "update:revision:playlist:progress:accessory:", v9, v10, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));

  return v6;
}

uint64_t __72__ACCMediaLibraryShimInfo__beginMediaLibraryUpdatesWithAnchor_validity___block_invoke_70(uint64_t a1)
{
  BOOL v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  if (gLogObjects)
    v2 = gNumLogObjects < 1;
  else
    v2 = 1;
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v4 = MEMORY[0x24BDACB70];
    v3 = MEMORY[0x24BDACB70];
  }
  else
  {
    v4 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __72__ACCMediaLibraryShimInfo__beginMediaLibraryUpdatesWithAnchor_validity___block_invoke_70_cold_1(a1, v4);

  v5 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v5 + 32) || !*(_BYTE *)(v5 + 33))
    return 3;
  objc_msgSend(*(id *)(v5 + 40), "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "provider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
  objc_msgSend(*(id *)(a1 + 40), "revision");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "content");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v8, "update:revision:content:accessory:", v9, v10, v11, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));

  return v6;
}

uint64_t __72__ACCMediaLibraryShimInfo__beginMediaLibraryUpdatesWithAnchor_validity___block_invoke_71(uint64_t a1)
{
  BOOL v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  if (gLogObjects)
    v2 = gNumLogObjects < 1;
  else
    v2 = 1;
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v4 = MEMORY[0x24BDACB70];
    v3 = MEMORY[0x24BDACB70];
  }
  else
  {
    v4 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __72__ACCMediaLibraryShimInfo__beginMediaLibraryUpdatesWithAnchor_validity___block_invoke_71_cold_1(a1);

  v5 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v5 + 32) || !*(_BYTE *)(v5 + 33))
    return 3;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56)
                                                                                               + 8)
                                                                                   + 24);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "provider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
  objc_msgSend(*(id *)(a1 + 40), "anchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v8, "update:revision:deleteItem:progress:accessory:", v9, v10, objc_msgSend(*(id *)(a1 + 48), "persistentID"), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));

  return v6;
}

uint64_t __72__ACCMediaLibraryShimInfo__beginMediaLibraryUpdatesWithAnchor_validity___block_invoke_72(uint64_t a1)
{
  BOOL v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  if (gLogObjects)
    v2 = gNumLogObjects < 1;
  else
    v2 = 1;
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v4 = MEMORY[0x24BDACB70];
    v3 = MEMORY[0x24BDACB70];
  }
  else
  {
    v4 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __72__ACCMediaLibraryShimInfo__beginMediaLibraryUpdatesWithAnchor_validity___block_invoke_72_cold_1(a1);

  v5 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v5 + 32) || !*(_BYTE *)(v5 + 33))
    return 3;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48)
                                                                                               + 8)
                                                                                   + 24);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "provider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
  objc_msgSend(*(id *)(a1 + 40), "revision");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v8, "update:revision:item:progress:accessory:", v9, v10, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));

  return v6;
}

uint64_t __72__ACCMediaLibraryShimInfo__beginMediaLibraryUpdatesWithAnchor_validity___block_invoke_74(_QWORD *a1)
{
  BOOL v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v13;
  uint64_t v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v2 = gNumLogObjects < 1;
  else
    v2 = 1;
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v4 = MEMORY[0x24BDACB70];
    v3 = MEMORY[0x24BDACB70];
  }
  else
  {
    v4 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = a1[4];
    v6 = a1[5];
    v7 = *(unsigned __int8 *)(v6 + 32);
    LODWORD(v6) = *(unsigned __int8 *)(v6 + 33);
    v13 = 138412802;
    v14 = v5;
    v15 = 1024;
    v16 = v7;
    v17 = 1024;
    v18 = v6;
    _os_log_impl(&dword_21A7E0000, v4, OS_LOG_TYPE_INFO, "_beginMediaLibraryUpdatesWithAnchor: need final 100 progress update!!! lastAnchor=%@, _isShuttingDown=%d _enableLibraryUpdate=%d", (uint8_t *)&v13, 0x18u);
  }

  v8 = a1[5];
  if (*(_BYTE *)(v8 + 32) || !*(_BYTE *)(v8 + 33))
    return 3;
  *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = 100;
  objc_msgSend(*(id *)(a1[5] + 40), "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "provider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v11, "update:revision:progress:accessory:", *(_QWORD *)(a1[5] + 80), a1[4], *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24), *(_QWORD *)(a1[5] + 48));

  return v9;
}

- (void)_sendRadioLibraryUpdates
{
  ACCMediaLibraryShimInfo *v2;
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  int v10;
  NSObject *v11;
  id v12;
  NSArray *stationsGroupList;
  void *v14;
  void *v15;
  void *v16;
  NSArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  int v30;
  NSObject *v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  NSString *UIDString;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  void *v45;
  int v46;
  void *v47;
  uint64_t v48;
  void *v49;
  const __CFString *v50;
  void *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  NSObject *v56;
  NSObject *v57;
  uint64_t v58;
  NSObject *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  ACCMediaLibraryShimInfo *v70;
  int v71;
  id obj;
  NSArray *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  _QWORD v83[5];
  _QWORD v84[5];
  id v85;
  int v86;
  int v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  uint8_t v104[128];
  uint8_t buf[4];
  _BYTE v106[24];
  __int16 v107;
  uint64_t v108;
  __int16 v109;
  uint64_t v110;
  __int16 v111;
  uint64_t v112;
  _BYTE v113[128];
  _BYTE v114[128];
  _BYTE v115[128];
  uint64_t v116;

  v2 = self;
  v116 = *MEMORY[0x24BDAC8D0];
  v100 = 0u;
  v101 = 0u;
  v102 = 0u;
  v103 = 0u;
  v3 = self->_stationsGroupList;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v100, v115, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v101;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v101 != v7)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v100 + 1) + 8 * i), "stations");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v6 += objc_msgSend(v9, "count");

      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v100, v115, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  v10 = __MaxTiltStations;
  if (v6 < __MaxTiltStations)
    v10 = v6;
  v71 = v10;
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v11 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v11 = MEMORY[0x24BDACB70];
    v12 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    stationsGroupList = v2->_stationsGroupList;
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v106 = v71;
    *(_WORD *)&v106[4] = 1024;
    *(_DWORD *)&v106[6] = -1;
    *(_WORD *)&v106[10] = 2112;
    *(_QWORD *)&v106[12] = stationsGroupList;
    _os_log_impl(&dword_21A7E0000, v11, OS_LOG_TYPE_INFO, "_sendRadioLibraryUpdates total=%d maxPckSize=%d _stationsGroupList=%@", buf, 0x18u);
  }

  -[ACCMediaLibraryShim delegate](v2->_context, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "provider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "resetUpdate:accessory:", v2->_UIDString, v2->_accessory);

  if (v2->_sendPlayAllSongsCapable)
  {
    -[ACCMediaLibraryShim delegate](v2->_context, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "notify:stateChange:enabled:", v2->_UIDString, 1, 0);

    v2->_sendPlayAllSongsCapable = 0;
  }
  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  v17 = v2->_stationsGroupList;
  v68 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v96, v114, 16);
  if (!v68)
  {

LABEL_77:
    v83[0] = MEMORY[0x24BDAC760];
    v83[1] = 3221225472;
    v83[2] = __51__ACCMediaLibraryShimInfo__sendRadioLibraryUpdates__block_invoke_83;
    v83[3] = &unk_24DD25EB0;
    v83[4] = v2;
    v58 = -[ACCMediaLibraryShimInfo _attemptUpdate:](v2, "_attemptUpdate:", v83);
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v59 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
      v59 = MEMORY[0x24BDACB70];
      v60 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
      -[ACCMediaLibraryShimInfo _beginMediaLibraryUpdatesWithAnchor:validity:].cold.3(v58, v59, v61, v62, v63, v64, v65, v66);

    return;
  }
  LODWORD(v82) = 0;
  v18 = 0;
  v67 = *(_QWORD *)v97;
  v70 = v2;
  v73 = v17;
LABEL_24:
  v19 = 0;
  while (1)
  {
    if (*(_QWORD *)v97 != v67)
    {
      v20 = v19;
      objc_enumerationMutation(v17);
      v19 = v20;
    }
    if ((int)v82 >= __MaxTiltStations)
      break;
    v69 = v19;
    ++v18;
    v81 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * v19);
    objc_msgSend(v81, "stations");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = 0u;
    v93 = 0u;
    v94 = 0u;
    v95 = 0u;
    obj = v21;
    v76 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v92, v113, 16);
    if (v76)
    {
      v80 = 0;
      v77 = *(_QWORD *)v93;
      v74 = v18;
      v75 = v18 << 32;
LABEL_30:
      v22 = 0;
      while (1)
      {
        if (*(_QWORD *)v93 != v77)
          objc_enumerationMutation(obj);
        if ((int)v82 >= __MaxTiltStations)
          break;
        v79 = v22;
        v23 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * v22);
        v24 = objc_msgSend(v23, "uniqueIdentifier");
        objc_msgSend(v23, "localizedName");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v81, "localizedTitle");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "stringWithFormat:", CFSTR("%@ - %@"), v25, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        v29 = gLogObjects;
        v30 = gNumLogObjects;
        if (gLogObjects && gNumLogObjects >= 1)
        {
          v31 = *(id *)gLogObjects;
        }
        else
        {
          v31 = MEMORY[0x24BDACB70];
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            *(_QWORD *)v106 = v29;
            *(_WORD *)&v106[8] = 1024;
            *(_DWORD *)&v106[10] = v30;
            _os_log_error_impl(&dword_21A7E0000, v31, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          v32 = v31;
        }
        v82 = (v82 + 1);
        v33 = v80 + 1 + v75;
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67110402;
          *(_DWORD *)v106 = v82;
          *(_WORD *)&v106[4] = 2112;
          *(_QWORD *)&v106[6] = v23;
          *(_WORD *)&v106[14] = 2112;
          *(_QWORD *)&v106[16] = v28;
          v107 = 2048;
          v108 = v24;
          v109 = 2048;
          v110 = v80 + 1 + v75;
          v111 = 2048;
          v112 = v110;
          _os_log_impl(&dword_21A7E0000, v31, OS_LOG_TYPE_INFO, "_sendRadioLibraryUpdates: count=%d station=%@ name=%@ uniqueIdentifier=%lld uid=%lld (%llxh)", buf, 0x3Au);
        }

        if (!v2->_enableLibraryUpdate || v2->_isShuttingDown)
        {
          v17 = v73;
          v18 = v74;
          break;
        }
        ++v80;
        -[NSMutableDictionary objectForKey:](v2->_dbUpdateList, "objectForKey:", CFSTR("PlaylistProperty"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v34, "count"))
        {
          v78 = v34;
          -[NSMutableDictionary objectForKey:](v2->_dbUpdateList, "objectForKey:", CFSTR("PlaylistProperty"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_alloc(MEMORY[0x24BE00B90]);
          UIDString = v2->_UIDString;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), v82);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = (void *)objc_msgSend(v36, "initWithMediaLibrary:persistentID:revision:", UIDString, v33, v38);

          objc_msgSend(v39, "setRadioStation:", 1);
          v90 = 0u;
          v91 = 0u;
          v88 = 0u;
          v89 = 0u;
          v40 = v35;
          v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v88, v104, 16);
          if (v41)
          {
            v42 = v41;
            v43 = *(_QWORD *)v89;
            do
            {
              for (j = 0; j != v42; ++j)
              {
                if (*(_QWORD *)v89 != v43)
                  objc_enumerationMutation(v40);
                if (objc_msgSend(*(id *)(*((_QWORD *)&v88 + 1) + 8 * j), "unsignedIntValue") == 1)
                {
                  objc_msgSend(v23, "localizedName");
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  v46 = __MaxTiltStations;
                  v47 = (void *)MEMORY[0x24BDD17C8];
                  objc_msgSend(v81, "localizedTitle");
                  v48 = objc_claimAutoreleasedReturnValue();
                  v49 = (void *)v48;
                  if (v46 >= 100)
                    v50 = CFSTR("%03u %@ - %@");
                  else
                    v50 = CFSTR("%02u %@ - %@");
                  objc_msgSend(v47, "stringWithFormat:", v50, v82, v45, v48);
                  v51 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v51)
                    objc_msgSend(v39, "setName:", v51);

                }
              }
              v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v88, v104, 16);
            }
            while (v42);
          }

          v84[0] = MEMORY[0x24BDAC760];
          v84[1] = 3221225472;
          v84[2] = __51__ACCMediaLibraryShimInfo__sendRadioLibraryUpdates__block_invoke;
          v84[3] = &unk_24DD25E88;
          v2 = v70;
          v84[4] = v70;
          v86 = v82;
          v87 = v71;
          v52 = v39;
          v85 = v52;
          v53 = -[ACCMediaLibraryShimInfo _attemptUpdate:](v70, "_attemptUpdate:", v84);
          v54 = gLogObjects;
          v55 = gNumLogObjects;
          if (gLogObjects && gNumLogObjects >= 1)
          {
            v56 = *(id *)gLogObjects;
          }
          else
          {
            v56 = MEMORY[0x24BDACB70];
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              *(_QWORD *)v106 = v54;
              *(_WORD *)&v106[8] = 1024;
              *(_DWORD *)&v106[10] = v55;
              _os_log_error_impl(&dword_21A7E0000, v56, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            v57 = v56;
          }
          v34 = v78;
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134217984;
            *(_QWORD *)v106 = v53;
            _os_log_debug_impl(&dword_21A7E0000, v56, OS_LOG_TYPE_DEBUG, "_attemptUpdate result %ld", buf, 0xCu);
          }

        }
        v22 = v79 + 1;
        v17 = v73;
        v18 = v74;
        if (v79 + 1 == v76)
        {
          v76 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v92, v113, 16);
          if (v76)
            goto LABEL_30;
          break;
        }
      }
    }

    v19 = v69 + 1;
    if (v69 + 1 == v68)
    {
      v68 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v96, v114, 16);
      if (v68)
        goto LABEL_24;
      break;
    }
  }

  if (!(_DWORD)v82)
    goto LABEL_77;
}

uint64_t __51__ACCMediaLibraryShimInfo__sendRadioLibraryUpdates__block_invoke(uint64_t a1)
{
  uint64_t v1;
  unsigned int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 32) || !*(_BYTE *)(v1 + 33))
    return 3;
  v4 = (100 * *(_DWORD *)(a1 + 48)) / *(_DWORD *)(a1 + 52);
  objc_msgSend(*(id *)(v1 + 40), "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "provider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
  objc_msgSend(*(id *)(a1 + 40), "revision");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "update:revision:playlist:progress:accessory:", v7, v8, *(_QWORD *)(a1 + 40), v4, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));

  return v9;
}

uint64_t __51__ACCMediaLibraryShimInfo__sendRadioLibraryUpdates__block_invoke_83(uint64_t a1)
{
  uint64_t v1;
  void *v4;
  void *v5;
  uint64_t v6;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 32) || !*(_BYTE *)(v1 + 33))
    return 3;
  objc_msgSend(*(id *)(v1 + 40), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "update:revision:progress:accessory:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80), CFSTR("0"), 100, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));

  return v6;
}

- (void)_beginRadioLibraryUpdates
{
  BOOL v3;
  id v4;
  NSObject *v5;
  dispatch_semaphore_t v6;
  NSObject *v7;
  uint64_t v8;
  dispatch_time_t v9;
  NSObject *v10;
  id v11;
  NSObject *libraryUpdateQ;
  _QWORD v13[5];
  _QWORD block[5];
  NSObject *v15;
  uint8_t buf[4];
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (self->_libraryType != 2)
    ACCMediaLibraryShimUIDString_cold_1();
  if (-[ACCMediaLibraryShim radioIsEnabled](self->_context, "radioIsEnabled") && !self->_isShuttingDown)
  {
    v6 = dispatch_semaphore_create(0);
    dispatch_get_global_queue(0, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __52__ACCMediaLibraryShimInfo__beginRadioLibraryUpdates__block_invoke;
    block[3] = &unk_24DD25ED8;
    block[4] = self;
    v5 = v6;
    v15 = v5;
    dispatch_async(v7, block);

    v9 = dispatch_time(0, 2000000000);
    if (dispatch_semaphore_wait(v5, v9))
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v10 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
        v10 = MEMORY[0x24BDACB70];
        v11 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v17 = 2;
        _os_log_impl(&dword_21A7E0000, v10, OS_LOG_TYPE_DEFAULT, "_beginRadioLibraryUpdates:  WARNING: timed out(%d) waiting for recent stations list, give up for now", buf, 8u);
      }

      if (self->_enableLibraryUpdate && !self->_isShuttingDown)
      {
        libraryUpdateQ = self->_libraryUpdateQ;
        v13[0] = v8;
        v13[1] = 3221225472;
        v13[2] = __52__ACCMediaLibraryShimInfo__beginRadioLibraryUpdates__block_invoke_87;
        v13[3] = &unk_24DD25F28;
        v13[4] = self;
        dispatch_async(libraryUpdateQ, v13);
      }
    }

  }
  else
  {
    if (gLogObjects)
      v3 = gNumLogObjects < 1;
    else
      v3 = 1;
    if (v3)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
      v5 = MEMORY[0x24BDACB70];
      v4 = MEMORY[0x24BDACB70];
    }
    else
    {
      v5 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21A7E0000, v5, OS_LOG_TYPE_INFO, "_beginRadioLibraryUpdates: Don't send RadioLibraryUpdates, not enabled or shuttingDown", buf, 2u);
    }
  }

}

void __52__ACCMediaLibraryShimInfo__beginRadioLibraryUpdates__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(v1 + 56);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __52__ACCMediaLibraryShimInfo__beginRadioLibraryUpdates__block_invoke_2;
  v4[3] = &unk_24DD25F00;
  v4[4] = v1;
  v5 = v2;
  objc_msgSend(v3, "getRecentStationGroupsWithCompletionHandler:", v4);

}

void __52__ACCMediaLibraryShimInfo__beginRadioLibraryUpdates__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (gLogObjects)
    v7 = gNumLogObjects < 1;
  else
    v7 = 1;
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v9 = MEMORY[0x24BDACB70];
    v8 = MEMORY[0x24BDACB70];
  }
  else
  {
    v9 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v15 = v5;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_21A7E0000, v9, OS_LOG_TYPE_INFO, "_beginRadioLibraryUpdates: recentStationsGroups=%@ error=%@", buf, 0x16u);
  }

  v10 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v10 + 32) && *(_BYTE *)(v10 + 33))
  {
    v11 = *(NSObject **)(v10 + 72);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __52__ACCMediaLibraryShimInfo__beginRadioLibraryUpdates__block_invoke_84;
    v12[3] = &unk_24DD25ED8;
    v12[4] = v10;
    v13 = v5;
    dispatch_async(v11, v12);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

uint64_t __52__ACCMediaLibraryShimInfo__beginRadioLibraryUpdates__block_invoke_84(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v1 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v1 + 33))
  {
    if (!*(_BYTE *)(v1 + 32))
    {
      v2 = result;
      v3 = *(void **)(v1 + 112);
      *(_QWORD *)(v1 + 112) = 0;

      objc_storeStrong((id *)(*(_QWORD *)(v2 + 32) + 112), *(id *)(v2 + 40));
      return objc_msgSend(*(id *)(v2 + 32), "_sendRadioLibraryUpdates");
    }
  }
  return result;
}

_BYTE *__52__ACCMediaLibraryShimInfo__beginRadioLibraryUpdates__block_invoke_87(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (result[33])
  {
    if (!result[32])
      return (_BYTE *)objc_msgSend(result, "_sendRadioLibraryUpdates");
  }
  return result;
}

- (void)_radioLibraryChanged:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  NSObject *libraryUpdateQ;
  _QWORD block[5];
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl(&dword_21A7E0000, v7, OS_LOG_TYPE_DEFAULT, "_radioLibraryChanged: notification=%@", buf, 0xCu);
  }

  if (self->_enableLibraryUpdate && !self->_isShuttingDown)
  {
    libraryUpdateQ = self->_libraryUpdateQ;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __48__ACCMediaLibraryShimInfo__radioLibraryChanged___block_invoke;
    block[3] = &unk_24DD25F28;
    block[4] = self;
    dispatch_async(libraryUpdateQ, block);
  }

}

void __48__ACCMediaLibraryShimInfo__radioLibraryChanged___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  int v7;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 33) && !*(_BYTE *)(v1 + 32))
  {
    if (*(_DWORD *)(v1 + 36) == 2)
    {
      v3 = (void *)MEMORY[0x220749824]();
      objc_msgSend(*(id *)(a1 + 32), "_beginRadioLibraryUpdates");
      objc_autoreleasePoolPop(v3);
    }
    else
    {
      if (gLogObjects)
        v4 = gNumLogObjects < 1;
      else
        v4 = 1;
      if (v4)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
        v6 = MEMORY[0x24BDACB70];
        v5 = MEMORY[0x24BDACB70];
      }
      else
      {
        v6 = *(id *)gLogObjects;
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 36);
        v8[0] = 67109120;
        v8[1] = v7;
        _os_log_impl(&dword_21A7E0000, v6, OS_LOG_TYPE_DEFAULT, "_radioLibraryChanged: ERROR: Invalid libraryType(%d)", (uint8_t *)v8, 8u);
      }

    }
  }
}

- (void)_mediaLibraryChanged:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  NSObject *libraryUpdateQ;
  _QWORD block[5];
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl(&dword_21A7E0000, v7, OS_LOG_TYPE_DEFAULT, "_mediaLibraryChanged: notification=%@", buf, 0xCu);
  }

  if (self->_enableLibraryUpdate && !self->_isShuttingDown)
  {
    libraryUpdateQ = self->_libraryUpdateQ;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __48__ACCMediaLibraryShimInfo__mediaLibraryChanged___block_invoke;
    block[3] = &unk_24DD25F28;
    block[4] = self;
    dispatch_async(libraryUpdateQ, block);
  }

}

void __48__ACCMediaLibraryShimInfo__mediaLibraryChanged___block_invoke(uint64_t a1)
{
  uint64_t v1;
  BOOL v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  int v10;
  _DWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 33) && !*(_BYTE *)(v1 + 32))
  {
    if (*(_DWORD *)(v1 + 36))
    {
      if (gLogObjects)
        v3 = gNumLogObjects < 1;
      else
        v3 = 1;
      if (v3)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
        v9 = MEMORY[0x24BDACB70];
        v4 = MEMORY[0x24BDACB70];
      }
      else
      {
        v9 = *(id *)gLogObjects;
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 36);
        v11[0] = 67109120;
        v11[1] = v10;
        _os_log_impl(&dword_21A7E0000, v9, OS_LOG_TYPE_DEFAULT, "_mediaLibraryChanged: ERROR: Invalid libraryType(%d)", (uint8_t *)v11, 8u);
      }

    }
    else
    {
      v5 = (void *)MEMORY[0x220749824]();
      objc_msgSend(*(id *)(a1 + 32), "_beginMediaLibraryUpdatesWithAnchor:validity:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(void **)(v7 + 64);
      *(_QWORD *)(v7 + 64) = v6;

      objc_autoreleasePoolPop(v5);
    }
  }
}

- (void)_canShowCloudTracksDidChangeNotification:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  BOOL v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  NSObject *v23;
  id v24;
  void *v25;
  int v26;
  void *v27;
  int v28;
  void *v29;
  int v30;
  NSObject *v31;
  id v32;
  _BOOL4 showCloudTracks;
  void *v34;
  int v35;
  void *v36;
  NSObject *libraryUpdateQ;
  int v38;
  void *v39;
  _QWORD block[5];
  uint8_t buf[4];
  _BYTE v42[10];
  __int16 v43;
  int v44;
  __int16 v45;
  int v46;
  __int16 v47;
  int v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v42 = v4;
    _os_log_impl(&dword_21A7E0000, v7, OS_LOG_TYPE_DEFAULT, "_canShowCloudTracksDidChangeNotification: notification=%@", buf, 0xCu);
  }

  if (gLogObjects)
    v8 = gNumLogObjects <= 0;
  else
    v8 = 1;
  v9 = !v8;
  if (self->_isShuttingDown)
  {
    if (v9)
    {
      v10 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
      v10 = MEMORY[0x24BDACB70];
      v12 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21A7E0000, v10, OS_LOG_TYPE_INFO, "_canShowCloudTracksDidChangeNotification: not enabled or shuttingDown, ignore", buf, 2u);
    }

  }
  else
  {
    if (v9)
    {
      v11 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
      v11 = MEMORY[0x24BDACB70];
      v13 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDDC708], "sharedCloudController");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v39, "canShowCloudMusic");
      objc_msgSend(MEMORY[0x24BDDC708], "sharedCloudController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v4;
      v16 = objc_msgSend(v14, "hasProperNetworkConditionsToPlayMedia");
      objc_msgSend(MEMORY[0x24BDDC708], "sharedCloudController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isCloudEnabled");
      objc_msgSend(MEMORY[0x24BDDC708], "sharedCloudController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "canShowCloudMusic");
      objc_msgSend(MEMORY[0x24BDDC708], "sharedCloudController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "canShowCloudVideo");
      *(_DWORD *)buf = 67110144;
      *(_DWORD *)v42 = v38;
      *(_WORD *)&v42[4] = 1024;
      *(_DWORD *)&v42[6] = v16;
      v4 = v15;
      v43 = 1024;
      v44 = v18;
      v45 = 1024;
      v46 = v20;
      v47 = 1024;
      v48 = v22;
      _os_log_impl(&dword_21A7E0000, v11, OS_LOG_TYPE_DEFAULT, "_canShowCloudTracksDidChangeNotification: canShowCloudMusic=%d hasProperNetworkConditionsToPlayMedia=%d isCloudEnabled=%d canShowCloudMusic=%d canShowCloudVideo=%d", buf, 0x20u);

    }
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v23 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
      v23 = MEMORY[0x24BDACB70];
      v24 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDDC708], "sharedCloudController");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "hasCloudLockerAccount");
      objc_msgSend(MEMORY[0x24BDDC708], "sharedCloudController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "isUpdateInProgress");
      objc_msgSend(MEMORY[0x24BDDC708], "sharedCloudController");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "isInitialImport");
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)v42 = v26;
      *(_WORD *)&v42[4] = 1024;
      *(_DWORD *)&v42[6] = v28;
      v43 = 1024;
      v44 = v30;
      _os_log_impl(&dword_21A7E0000, v23, OS_LOG_TYPE_DEFAULT, "_canShowCloudTracksDidChangeNotification: hasCloudLockerAccount=%d isUpdateInProgress=%d isInitialImport=%d", buf, 0x14u);

    }
    if (!self->_libraryType)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v31 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
        v31 = MEMORY[0x24BDACB70];
        v32 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        showCloudTracks = self->_showCloudTracks;
        objc_msgSend(MEMORY[0x24BDDC708], "sharedCloudController");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "canShowCloudMusic");
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v42 = showCloudTracks;
        *(_WORD *)&v42[4] = 1024;
        *(_DWORD *)&v42[6] = v35;
        _os_log_impl(&dword_21A7E0000, v31, OS_LOG_TYPE_DEFAULT, "_canShowCloudTracksDidChangeNotification: _showCloudTracks=%d->%d", buf, 0xEu);

      }
      objc_msgSend(MEMORY[0x24BDDC708], "sharedCloudController");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      self->_showCloudTracks = objc_msgSend(v36, "canShowCloudMusic");

    }
    if (self->_enableLibraryUpdate
      && !self->_isShuttingDown
      && self->_showCloudTracksLastSent != self->_showCloudTracks)
    {
      libraryUpdateQ = self->_libraryUpdateQ;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __68__ACCMediaLibraryShimInfo__canShowCloudTracksDidChangeNotification___block_invoke;
      block[3] = &unk_24DD25F28;
      block[4] = self;
      dispatch_async(libraryUpdateQ, block);
    }
  }

}

void __68__ACCMediaLibraryShimInfo__canShowCloudTracksDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 33) && !*(_BYTE *)(v1 + 32) && *(unsigned __int8 *)(v1 + 26) != *(unsigned __int8 *)(v1 + 25))
  {
    objc_msgSend(*(id *)(v1 + 40), "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "provider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "notify:stateChange:enabled:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80), 0, *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 25) == 0);

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 26) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 25);
  }
}

- (id)dbUpdateListDesc
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  ACCMediaLibraryShimInfo *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  -[NSMutableDictionary objectForKey:](self->_dbUpdateList, "objectForKey:", CFSTR("ItemProperty"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_dbUpdateList, "objectForKey:", CFSTR("PlaylistProperty"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = self;
  -[NSMutableDictionary objectForKey:](self->_dbUpdateList, "objectForKey:", CFSTR("PlaylistContentItemProperty"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v41 != v10)
          objc_enumerationMutation(v6);
        v9 |= 1 << objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "intValue");
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v12 = v4;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = *(_QWORD *)v37;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v37 != v16)
          objc_enumerationMutation(v12);
        v15 |= 1 << objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * j), "intValue");
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    }
    while (v14);
  }
  else
  {
    v15 = 0;
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v18 = v5;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
  if (v19)
  {
    v20 = v19;
    v21 = 0;
    v22 = *(_QWORD *)v33;
    do
    {
      for (k = 0; k != v20; ++k)
      {
        if (*(_QWORD *)v33 != v22)
          objc_enumerationMutation(v18);
        v21 |= 1 << objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * k), "intValue");
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
    }
    while (v20);
  }
  else
  {
    v21 = 0;
  }

  v30 = (void *)MEMORY[0x24BDD17C8];
  -[NSMutableDictionary objectForKey:](v31->_dbUpdateList, "objectForKey:", CFSTR("LibUID"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](v31->_dbUpdateList, "objectForKey:", CFSTR("Progress"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](v31->_dbUpdateList, "objectForKey:", CFSTR("HideNonLocal"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](v31->_dbUpdateList, "objectForKey:", CFSTR("PlayAllSongsCapable"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "stringWithFormat:", CFSTR("libUID=%@ properties(item=%llxh playlist=%llxh content=%llxh) progress=%@ hideNonLocal=%@ playAllSongsCapable=%@"), v24, v9, v15, v21, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (id)description
{
  void *v3;
  void *v4;
  NSString *UIDString;
  OS_dispatch_queue *libraryUpdateQ;
  _BOOL8 isShuttingDown;
  _BOOL8 enableLibraryUpdate;
  void *v9;
  void *v10;
  __int128 v12;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[ACCMediaLibraryShim accessory](self->_context, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(_OWORD *)&self->_mpMediaLibrary;
  libraryUpdateQ = self->_libraryUpdateQ;
  UIDString = self->_UIDString;
  isShuttingDown = self->_isShuttingDown;
  enableLibraryUpdate = self->_enableLibraryUpdate;
  -[ACCMediaLibraryShimInfo dbUpdateListDesc](self, "dbUpdateListDesc");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<ACCMediaLibraryShimInfo>[\n    _context.accessory=%@\n    _mpMediaLibrary=%@\n    _anchor=%@\n    _UIDString=%@\n    _libraryUpdateQ=%@\n    _isShuttingDown=%d\n    _enableLibraryUpdate=%d\n    _dbUpdateList=[%@]\n    _showCloudTracks=%d\n    _showCloudTracksLastSent=%d\n    _waitForWindowSem=%@]"), v4, v12, UIDString, libraryUpdateQ, isShuttingDown, enableLibraryUpdate, v9, self->_showCloudTracks, self->_showCloudTracksLastSent, self->_waitForWindowSem);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)_registerForMPNotifications
{
  void *v3;
  void *v4;
  int libraryType;
  BOOL v6;
  id v7;
  NSObject *v8;
  _BOOL4 showCloudTracks;
  _DWORD v10[2];
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  libraryType = self->_libraryType;
  if (libraryType == 2)
  {
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__radioLibraryChanged_, *MEMORY[0x24BDDC560], 0);
    if (gLogObjects)
      v6 = gNumLogObjects < 1;
    else
      v6 = 1;
    if (v6)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
      v8 = MEMORY[0x24BDACB70];
      v7 = MEMORY[0x24BDACB70];
    }
    else
    {
      v8 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      showCloudTracks = self->_showCloudTracks;
      v10[0] = 67109376;
      v10[1] = showCloudTracks;
      v11 = 1024;
      v12 = 1;
      _os_log_impl(&dword_21A7E0000, v8, OS_LOG_TYPE_DEFAULT, "_registerForMPNotifications: Radio Library, _showCloudTracks=%d->%d", (uint8_t *)v10, 0xEu);
    }

    *(_WORD *)&self->_showCloudTracks = 1;
  }
  else if (!libraryType)
  {
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__mediaLibraryChanged_, *MEMORY[0x24BDDBCF0], 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__mediaLibraryChanged_, *MEMORY[0x24BDDBD00], 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__canShowCloudTracksDidChangeNotification_, *MEMORY[0x24BDDBA60], 0);
  }

}

- (ACCMediaLibraryShimInfo)initWithMediaLibrary:(id)a3 accessory:(id)a4 Context:(id)a5 LibraryType:(int)a6
{
  id v11;
  id v12;
  id v13;
  BOOL v14;
  id v15;
  NSObject *v16;
  char *v17;
  int AppIntegerValue;
  int v19;
  dispatch_queue_t v20;
  void *v21;
  dispatch_semaphore_t v22;
  void *v23;
  void *v24;
  void *v25;
  dispatch_queue_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  int v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  id v37;
  int v38;
  objc_super v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;
  __int16 v47;
  int v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (gLogObjects)
    v14 = gNumLogObjects < 1;
  else
    v14 = 1;
  if (v14)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v16 = MEMORY[0x24BDACB70];
    v15 = MEMORY[0x24BDACB70];
  }
  else
  {
    v16 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v42 = v11;
    v43 = 2112;
    v44 = v12;
    v45 = 2112;
    v46 = v13;
    v47 = 1024;
    v48 = a6;
    _os_log_impl(&dword_21A7E0000, v16, OS_LOG_TYPE_DEFAULT, "initWithMediaLibrary: %@ accessory: %@ Context: %@ LibraryType: %d", buf, 0x26u);
  }

  v40.receiver = self;
  v40.super_class = (Class)ACCMediaLibraryShimInfo;
  v17 = -[ACCMediaLibraryShimInfo init](&v40, sel_init);
  if (v17)
  {
    if (__podcastPlaybackInMusicApp == -1)
      __podcastPlaybackInMusicApp = CFPreferencesGetAppBooleanValue(CFSTR("PodcastPlaybackInMusicApp"), CFSTR("com.apple.iapd"), 0) != 0;
    if (__MaxTiltStations == -1)
    {
      AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("MaxTiltStations"), CFSTR("com.apple.iapd"), 0);
      if (AppIntegerValue >= 1)
        v19 = AppIntegerValue;
      else
        v19 = 25;
      __MaxTiltStations = v19;
    }
    *((_DWORD *)v17 + 9) = a6;
    objc_storeStrong((id *)v17 + 6, a4);
    v20 = dispatch_queue_create("com.apple.accml.mediaLibraryUpdateQ", 0);
    v21 = (void *)*((_QWORD *)v17 + 9);
    *((_QWORD *)v17 + 9) = v20;

    v22 = dispatch_semaphore_create(0);
    v23 = (void *)*((_QWORD *)v17 + 11);
    *((_QWORD *)v17 + 11) = v22;

    *((_WORD *)v17 + 16) = 0;
    v24 = (void *)*((_QWORD *)v17 + 1);
    *((_QWORD *)v17 + 1) = 0;

    v25 = (void *)*((_QWORD *)v17 + 8);
    *((_QWORD *)v17 + 8) = 0;

    *((_WORD *)v17 + 12) = 0;
    *(_DWORD *)(v17 + 27) = 0;
    v17[31] = 0;
    objc_storeStrong((id *)v17 + 5, a5);
    objc_storeStrong((id *)v17 + 7, a3);
    v26 = dispatch_queue_create("com.apple.accessoryd.MediaLibraryMPQ", 0);
    v27 = (void *)*((_QWORD *)v17 + 12);
    *((_QWORD *)v17 + 12) = v26;

    v28 = objc_msgSend(objc_alloc(MEMORY[0x24BDDCA60]), "initWithClientIdentifier:queue:", CFSTR("com.apple.accessoryd.medialibrary"), *((_QWORD *)v17 + 12));
    v29 = (void *)*((_QWORD *)v17 + 13);
    *((_QWORD *)v17 + 13) = v28;

    v30 = (void *)*((_QWORD *)v17 + 14);
    *((_QWORD *)v17 + 14) = 0;

    objc_msgSend(v17, "_getUIDString");
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = (void *)*((_QWORD *)v17 + 10);
    *((_QWORD *)v17 + 10) = v31;

    objc_msgSend(v17, "_canShowCloudTracksDidChangeNotification:", 0);
    v17[26] = v17[25] ^ 1;
    v33 = *((_DWORD *)v17 + 9);
    if (v33 == 2)
    {
      objc_msgSend(v17, "_registerForMPNotifications");
    }
    else if (v33)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v36 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
        v36 = MEMORY[0x24BDACB70];
        v37 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        v38 = *((_DWORD *)v17 + 9);
        *(_DWORD *)buf = 67109120;
        LODWORD(v42) = v38;
        _os_log_impl(&dword_21A7E0000, v36, OS_LOG_TYPE_DEFAULT, "initWithMediaLibrary:accessory:Context:LibraryType: ERROR: Invalid libraryType(%d)", buf, 8u);
      }

    }
    else
    {
      objc_msgSend(*((id *)v17 + 7), "_syncValidity");
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = (void *)*((_QWORD *)v17 + 2);
      *((_QWORD *)v17 + 2) = v34;

      objc_msgSend(v17, "_registerForMPNotifications");
      objc_msgSend(*((id *)v17 + 7), "beginGeneratingLibraryChangeNotifications");
    }
  }

  return (ACCMediaLibraryShimInfo *)v17;
}

- (void)dealloc
{
  BOOL v3;
  id v4;
  NSObject *v5;
  _BOOL4 enableLibraryUpdate;
  _BOOL4 isShuttingDown;
  void *v8;
  int libraryType;
  NSObject *v10;
  id v11;
  int v12;
  OS_dispatch_queue *libraryUpdateQ;
  NSObject *v14;
  MPMusicPlayerController *mpMusicPlayerControllerHandler;
  OS_dispatch_semaphore *waitForWindowSem;
  NSString *syncValidityPersistentID;
  id mpMediaLibrary;
  NSString *UIDString;
  NSString *anchor;
  ACCMediaLibraryAccessory *accessory;
  ACCMediaLibraryShim *context;
  objc_super v23;
  _QWORD block[5];
  uint8_t buf[4];
  int v26;
  __int16 v27;
  int v28;
  __int16 v29;
  _BOOL4 v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    enableLibraryUpdate = self->_enableLibraryUpdate;
    isShuttingDown = self->_isShuttingDown;
    *(_DWORD *)buf = 67109888;
    v26 = enableLibraryUpdate;
    v27 = 1024;
    v28 = 0;
    v29 = 1024;
    v30 = isShuttingDown;
    v31 = 1024;
    v32 = 1;
    _os_log_impl(&dword_21A7E0000, v5, OS_LOG_TYPE_DEFAULT, "dealloc: _enableLibraryUpdate=%d-%d _isShuttingDown=%d->%d", buf, 0x1Au);
  }

  *(_WORD *)&self->_isShuttingDown = 1;
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:", self);
  libraryType = self->_libraryType;
  if (libraryType != 2)
  {
    if (libraryType)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v10 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
        v10 = MEMORY[0x24BDACB70];
        v11 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v12 = self->_libraryType;
        *(_DWORD *)buf = 67109120;
        v26 = v12;
        _os_log_impl(&dword_21A7E0000, v10, OS_LOG_TYPE_DEFAULT, "dealloc: ERROR: Invalid libraryType(%d)", buf, 8u);
      }

    }
    else
    {
      objc_msgSend(self->_mpMediaLibrary, "endGeneratingLibraryChangeNotifications");
    }
  }
  libraryUpdateQ = self->_libraryUpdateQ;
  self->_libraryUpdateQ = 0;
  v14 = libraryUpdateQ;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__ACCMediaLibraryShimInfo_dealloc__block_invoke;
  block[3] = &unk_24DD25F28;
  block[4] = self;
  dispatch_sync(v14, block);

  mpMusicPlayerControllerHandler = self->_mpMusicPlayerControllerHandler;
  self->_mpMusicPlayerControllerHandler = 0;

  waitForWindowSem = self->_waitForWindowSem;
  self->_waitForWindowSem = 0;

  syncValidityPersistentID = self->_syncValidityPersistentID;
  self->_syncValidityPersistentID = 0;

  mpMediaLibrary = self->_mpMediaLibrary;
  self->_mpMediaLibrary = 0;

  UIDString = self->_UIDString;
  self->_UIDString = 0;

  anchor = self->_anchor;
  self->_anchor = 0;

  accessory = self->_accessory;
  self->_accessory = 0;

  context = self->_context;
  self->_context = 0;

  v23.receiver = self;
  v23.super_class = (Class)ACCMediaLibraryShimInfo;
  -[ACCMediaLibraryShimInfo dealloc](&v23, sel_dealloc);
}

void __34__ACCMediaLibraryShimInfo_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  if (v2)
  {
    *(_QWORD *)(v1 + 8) = 0;

    v1 = *(_QWORD *)(a1 + 32);
  }
  v4 = *(void **)(v1 + 112);
  if (v4)
  {
    *(_QWORD *)(v1 + 112) = 0;

  }
}

- (void)startSendingMediaLibraryUpdates:(id)a3 lastRevision:(id)a4 requestedTransferID:(BOOL)a5 requestedMetaList:(BOOL)a6 requestedMetaProperties:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  id v12;
  id v13;
  BOOL v14;
  id v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  NSObject *libraryUpdateQ;
  id v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  BOOL v25;
  BOOL v26;
  BOOL v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  _BOOL4 v33;
  __int16 v34;
  _BOOL4 v35;
  __int16 v36;
  _BOOL4 v37;
  uint64_t v38;

  v7 = a7;
  v8 = a6;
  v9 = a5;
  v38 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  if (gLogObjects)
    v14 = gNumLogObjects < 1;
  else
    v14 = 1;
  if (v14)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v16 = MEMORY[0x24BDACB70];
    v15 = MEMORY[0x24BDACB70];
  }
  else
  {
    v16 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    -[ACCMediaLibraryShimInfo UIDString](self, "UIDString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v29 = v17;
    v30 = 2112;
    v31 = v13;
    v32 = 1024;
    v33 = v9;
    v34 = 1024;
    v35 = v8;
    v36 = 1024;
    v37 = v7;
    _os_log_impl(&dword_21A7E0000, v16, OS_LOG_TYPE_DEFAULT, "startSendingMediaLibraryUpdates: %@ lastRevision=%@ requestedTransferID=%d requestedMetaList=%d requestedMetaProperties=%d\n", buf, 0x28u);

  }
  if (self->_enableLibraryUpdate)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v18 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
      v18 = MEMORY[0x24BDACB70];
      v20 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      -[ACCMediaLibraryShimInfo UIDString](self, "UIDString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v29 = v21;
      _os_log_impl(&dword_21A7E0000, v18, OS_LOG_TYPE_INFO, "WARNING: MediaLibraryUpdate already running for library %@\n", buf, 0xCu);

    }
  }
  else
  {
    self->_enableLibraryUpdate = 1;
    libraryUpdateQ = self->_libraryUpdateQ;
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __134__ACCMediaLibraryShimInfo_startSendingMediaLibraryUpdates_lastRevision_requestedTransferID_requestedMetaList_requestedMetaProperties___block_invoke;
    v22[3] = &unk_24DD25F50;
    v22[4] = self;
    v23 = v12;
    v25 = v9;
    v26 = v8;
    v27 = v7;
    v24 = v13;
    dispatch_async(libraryUpdateQ, v22);

  }
}

void __134__ACCMediaLibraryShimInfo_startSendingMediaLibraryUpdates_lastRevision_requestedTransferID_requestedMetaList_requestedMetaProperties___block_invoke(uint64_t a1)
{
  uint64_t v2;
  BOOL v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  id *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  unsigned __int8 *v19;
  int v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  int v34;
  int v35;
  int v36;
  __int16 v37;
  int v38;
  __int16 v39;
  int v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 33) || *(_BYTE *)(v2 + 32))
  {
    if (gLogObjects)
      v3 = gNumLogObjects < 1;
    else
      v3 = 1;
    if (v3)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
      v5 = MEMORY[0x24BDACB70];
      v4 = MEMORY[0x24BDACB70];
    }
    else
    {
      v5 = *(id *)gLogObjects;
    }
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(unsigned __int8 *)(v6 + 33);
    LODWORD(v6) = *(unsigned __int8 *)(v6 + 32);
    v35 = 67109376;
    v36 = v7;
    v37 = 1024;
    v38 = v6;
    v8 = "startSendingMediaLibraryUpdates: ERROR: MediaLibraryUpdates not started, _enableLibraryUpdate: %d, mediaLibrary"
         "Info instance isShuttingDown: %d";
    v9 = v5;
    v10 = 14;
LABEL_13:
    _os_log_impl(&dword_21A7E0000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v35, v10);
LABEL_14:

    return;
  }
  v13 = *(void **)(v2 + 8);
  v11 = (id *)(v2 + 8);
  v12 = v13;
  v14 = *(void **)(a1 + 40);
  if (v13 != v14)
  {
    objc_storeStrong(v11, v14);
    v12 = *(void **)(a1 + 40);
  }
  if (objc_msgSend(v12, "count"))
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 28) = *(_BYTE *)(a1 + 56);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 29) = *(_BYTE *)(a1 + 57);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 30) = *(_BYTE *)(a1 + 58);
    objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("HideNonLocal"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = objc_msgSend(v15, "BOOLValue");

    objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("PlayAllSongsCapable"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 27) = objc_msgSend(v16, "BOOLValue");

    if (gLogObjects && gNumLogObjects >= 1)
    {
      v17 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
      v17 = MEMORY[0x24BDACB70];
      v18 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v19 = *(unsigned __int8 **)(a1 + 32);
      v20 = v19[24];
      v21 = v19[25];
      LODWORD(v19) = v19[26];
      v35 = 67109632;
      v36 = v20;
      v37 = 1024;
      v38 = v21;
      v39 = 1024;
      v40 = (int)v19;
      _os_log_impl(&dword_21A7E0000, v17, OS_LOG_TYPE_INFO, "startSendingMediaLibraryUpdates: _sendHideNonLocal %d, _showCloudTracks %d, _showCloudTracksLastSent %d", (uint8_t *)&v35, 0x14u);
    }

    v22 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v22 + 24))
    {
      objc_msgSend(*(id *)(v22 + 40), "delegate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "provider");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "notify:stateChange:enabled:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80), 0, *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 25) == 0);

      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 26) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 25);
      v22 = *(_QWORD *)(a1 + 32);
    }
    v25 = *(_DWORD *)(v22 + 36);
    if (v25 == 2)
    {
      objc_msgSend((id)v22, "_beginRadioLibraryUpdates");
      return;
    }
    if (!v25)
    {
      v26 = (void *)MEMORY[0x220749824]();
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), *(id *)(a1 + 48));
      v27 = *(_QWORD *)(a1 + 32);
      v28 = *(_QWORD *)(v27 + 64);
      objc_msgSend(*(id *)(v27 + 56), "_syncValidity");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v27, "_beginMediaLibraryUpdatesWithAnchor:validity:", v28, v29);
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = *(_QWORD *)(a1 + 32);
      v32 = *(void **)(v31 + 64);
      *(_QWORD *)(v31 + 64) = v30;

      objc_autoreleasePoolPop(v26);
      return;
    }
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v5 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
      v5 = MEMORY[0x24BDACB70];
      v33 = MEMORY[0x24BDACB70];
    }
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    v34 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 36);
    v35 = 67109120;
    v36 = v34;
    v8 = "startSendingMediaLibraryUpdates: ERROR: Invalid libraryType(%d)";
    v9 = v5;
    v10 = 8;
    goto LABEL_13;
  }
}

- (void)stopSendingMediaLibraryUpdates
{
  BOOL v3;
  id v4;
  NSObject *v5;
  _BOOL4 enableLibraryUpdate;
  NSObject *libraryUpdateQ;
  _QWORD block[5];
  uint8_t buf[4];
  _BOOL4 v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    enableLibraryUpdate = self->_enableLibraryUpdate;
    *(_DWORD *)buf = 67109376;
    v10 = enableLibraryUpdate;
    v11 = 1024;
    v12 = 0;
    _os_log_impl(&dword_21A7E0000, v5, OS_LOG_TYPE_DEFAULT, "stopSendingMediaLibraryUpdates: _enableLibraryUpdate=%d -> %d", buf, 0xEu);
  }

  self->_enableLibraryUpdate = 0;
  libraryUpdateQ = self->_libraryUpdateQ;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__ACCMediaLibraryShimInfo_stopSendingMediaLibraryUpdates__block_invoke;
  block[3] = &unk_24DD25F28;
  block[4] = self;
  dispatch_sync(libraryUpdateQ, block);
  *(_DWORD *)&self->_sendHideNonLocal = 0x10000;
}

void __57__ACCMediaLibraryShimInfo_stopSendingMediaLibraryUpdates__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  *(_QWORD *)(v1 + 8) = 0;

}

- (void)shuttingDown
{
  BOOL v3;
  id v4;
  NSObject *v5;
  int libraryType;
  void *v7;
  int v8;
  NSObject *v9;
  id v10;
  int v11;
  ACCMediaLibraryAccessory *accessory;
  ACCMediaLibraryShim *context;
  int v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    libraryType = self->_libraryType;
    v14 = 67109120;
    v15 = libraryType;
    _os_log_impl(&dword_21A7E0000, v5, OS_LOG_TYPE_DEFAULT, "stopSendingMediaLibraryUpdates: _libraryType=%d", (uint8_t *)&v14, 8u);
  }

  *(_WORD *)&self->_isShuttingDown = 1;
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:", self);
  v8 = self->_libraryType;
  if (v8 != 2)
  {
    if (v8)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v9 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
        v9 = MEMORY[0x24BDACB70];
        v10 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v11 = self->_libraryType;
        v14 = 67109120;
        v15 = v11;
        _os_log_impl(&dword_21A7E0000, v9, OS_LOG_TYPE_DEFAULT, "stopSendingMediaLibraryUpdates: ERROR: Invalid libraryType(%d)", (uint8_t *)&v14, 8u);
      }

    }
    else
    {
      objc_msgSend(self->_mpMediaLibrary, "endGeneratingLibraryChangeNotifications");
    }
  }
  while (dispatch_semaphore_signal((dispatch_semaphore_t)self->_waitForWindowSem))
    ;
  dispatch_sync((dispatch_queue_t)self->_libraryUpdateQ, &__block_literal_global);
  accessory = self->_accessory;
  self->_accessory = 0;

  context = self->_context;
  self->_context = 0;

}

- (void)_startPlaybackOfRadioStation:(unint64_t)a3
{
  char *v5;
  void *v6;
  char *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  uint8_t buf[4];
  unint64_t v23;
  __int16 v24;
  unint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = (char *)HIDWORD(a3);
  if (!HIDWORD(a3))
  {
LABEL_2:
    v6 = 0;
    goto LABEL_9;
  }
  if ((unint64_t)v5 <= -[NSArray count](self->_stationsGroupList, "count"))
  {
    -[NSArray objectAtIndex:](self->_stationsGroupList, "objectAtIndex:", v5 - 1);
    v7 = (char *)objc_claimAutoreleasedReturnValue();
    v5 = v7;
    v6 = 0;
    if (!(_DWORD)a3 || !v7)
      goto LABEL_9;
    objc_msgSend(v7, "stations");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (a3 > v9)
      goto LABEL_2;
    objc_msgSend(v5, "stations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndex:", a3 - 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
LABEL_9:
  if (gLogObjects)
    v11 = gNumLogObjects < 1;
  else
    v11 = 1;
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v13 = MEMORY[0x24BDACB70];
    v12 = MEMORY[0x24BDACB70];
  }
  else
  {
    v13 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    v23 = a3;
    v24 = 2048;
    v25 = a3;
    v26 = 2112;
    v27 = v6;
    _os_log_impl(&dword_21A7E0000, v13, OS_LOG_TYPE_INFO, "_startPlaybackOfRadioStation: collectionPersistentID=%llu(%llxh) station=%@", buf, 0x20u);
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v14 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v14 = MEMORY[0x24BDACB70];
    v15 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "localizedName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v23 = (unint64_t)v16;
    v24 = 2112;
    v25 = (unint64_t)v17;
    _os_log_impl(&dword_21A7E0000, v14, OS_LOG_TYPE_INFO, "_startPlaybackOfRadioStation: station name='%@'; desc='%@'",
      buf,
      0x16u);

  }
  if (v6)
  {
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __56__ACCMediaLibraryShimInfo__startPlaybackOfRadioStation___block_invoke;
    v20[3] = &unk_24DD25ED8;
    v20[4] = self;
    v21 = v6;
    dispatch_async(MEMORY[0x24BDAC9B8], v20);

  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v18 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
      v18 = MEMORY[0x24BDACB70];
      v19 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v23 = a3;
      v24 = 2048;
      v25 = a3;
      _os_log_impl(&dword_21A7E0000, v18, OS_LOG_TYPE_DEFAULT, "_startPlaybackOfRadioStation: Couldn't find station for persistentID=0x%llx(%llu)", buf, 0x16u);
    }

  }
}

void __56__ACCMediaLibraryShimInfo__startPlaybackOfRadioStation___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  BOOL v6;
  id v7;
  NSObject *v8;
  uint8_t v9[16];
  _QWORD block[5];
  id v11;

  GetMediaLibraryHelper();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "showMusic"))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(a1 + 40);
    v5 = *(NSObject **)(v3 + 96);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __56__ACCMediaLibraryShimInfo__startPlaybackOfRadioStation___block_invoke_2;
    block[3] = &unk_24DD25ED8;
    block[4] = v3;
    v11 = v4;
    dispatch_sync(v5, block);

  }
  else
  {
    if (gLogObjects)
      v6 = gNumLogObjects < 1;
    else
      v6 = 1;
    if (v6)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
      v8 = MEMORY[0x24BDACB70];
      v7 = MEMORY[0x24BDACB70];
    }
    else
    {
      v8 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_21A7E0000, v8, OS_LOG_TYPE_DEFAULT, "_startPlaybackOfRadioStation: no systemMusicPlayer!", v9, 2u);
    }

  }
}

void __56__ACCMediaLibraryShimInfo__startPlaybackOfRadioStation___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 104);
  objc_msgSend(v2, "queueAsRadioStation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (gLogObjects)
    v4 = gNumLogObjects < 1;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v6 = MEMORY[0x24BDACB70];
    v5 = MEMORY[0x24BDACB70];
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v3, "localizedName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412802;
    v10 = v3;
    v11 = 2112;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_21A7E0000, v6, OS_LOG_TYPE_INFO, "_startPlaybackOfRadioStation: curStation=%@ name='%@'; desc='%@'",
      (uint8_t *)&v9,
      0x20u);

  }
  objc_msgSend(v2, "setQueueWithRadioStation:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v2, "play");

}

- (void)playWithQuery:(id)a3 andFirstItem:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  char v19;
  uint64_t i;
  void *v21;
  id v22;
  unint64_t v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  id v27;
  void *v28;
  NSObject *mpMusicPlayerControllerQueue;
  NSObject *v30;
  id v31;
  id v32;
  ACCMediaLibraryShimInfo *v33;
  _QWORD block[5];
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t v41[128];
  uint8_t buf[4];
  id v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (gLogObjects)
    v8 = gNumLogObjects < 1;
  else
    v8 = 1;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v10 = MEMORY[0x24BDACB70];
    v9 = MEMORY[0x24BDACB70];
  }
  else
  {
    v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "title");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v43 = v7;
    v44 = 2112;
    v45 = v11;
    v46 = 2112;
    v47 = v6;
    _os_log_impl(&dword_21A7E0000, v10, OS_LOG_TYPE_DEFAULT, "playWithQuery:andFirstItem=%@[%@] query=%@", buf, 0x20u);

  }
  if (__podcastPlaybackInMusicApp)
  {
    v12 = 0;
    goto LABEL_13;
  }
  objc_msgSend(v6, "items");
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v15)
  {
    v16 = v15;
    v33 = self;
    v17 = *(_QWORD *)v38;
    LOBYTE(v18) = 1;
    v19 = 1;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v38 != v17)
          objc_enumerationMutation(v14);
        v21 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        if (objc_msgSend(v21, "mediaType", v33) != 2)
          v19 &= objc_msgSend(v21, "mediaType") == 1024;
        v18 = (objc_msgSend(v21, "mediaType") == 4) & v18;
        if ((v19 & 1) == 0 && !v18)
        {
          v19 = 0;
          goto LABEL_39;
        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      if (v16)
        continue;
      break;
    }
LABEL_39:

    if ((v19 & 1) != 0)
    {
      self = v33;
    }
    else
    {
      self = v33;
      if (!v18)
      {

        v12 = 0;
        v23 = 0x253E63000;
        goto LABEL_49;
      }
    }
  }
  else
  {

    v19 = 1;
    v18 = 1;
  }
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:", v6);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MRSystemAppPlaybackQueueCreate();
  MRSystemAppPlaybackQueueSetLocalQueryData();

  if ((v19 & 1) == 0)
  {
    v23 = 0x253E63000uLL;
    if (v18)
    {
LABEL_13:
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v13 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
        v13 = MEMORY[0x24BDACB70];
        v22 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21A7E0000, v13, OS_LOG_TYPE_DEFAULT, "playWithQuery: allAudioBooks!", buf, 2u);
      }

      MRSystemAppPlaybackQueueInternalPrepareBundleIDForPlayback();
      if (v7)
      {
        objc_msgSend(v7, "persistentID");
        MRSystemAppPlaybackQueueSetLocalQueryFirstItemPID();
      }
      goto LABEL_35;
    }
LABEL_49:
    if (gLogObjects && *(int *)(v23 + 3120) >= 1)
    {
      v26 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
      v26 = MEMORY[0x24BDACB70];
      v27 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21A7E0000, v26, OS_LOG_TYPE_DEFAULT, "playWithQuery: Music!", buf, 2u);
    }

    MRSystemAppPlaybackQueueInternalPrepareBundleIDForPlayback();
    GetMediaLibraryHelper();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v28, "showMusic"))
    {
      mpMusicPlayerControllerQueue = self->_mpMusicPlayerControllerQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __54__ACCMediaLibraryShimInfo_playWithQuery_andFirstItem___block_invoke;
      block[3] = &unk_24DD25FB8;
      block[4] = self;
      v35 = v7;
      v36 = v6;
      dispatch_sync(mpMusicPlayerControllerQueue, block);

    }
    else
    {
      if (gLogObjects && *(int *)(v23 + 3120) >= 1)
      {
        v30 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
        v30 = MEMORY[0x24BDACB70];
        v32 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21A7E0000, v30, OS_LOG_TYPE_DEFAULT, "playWithQuery: no systemMusicPlayer!", buf, 2u);
      }

    }
    if (v12)
      goto LABEL_36;
    goto LABEL_37;
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v25 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v25 = MEMORY[0x24BDACB70];
    v31 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21A7E0000, v25, OS_LOG_TYPE_DEFAULT, "playWithQuery: allPodcasts!", buf, 2u);
  }

  MRSystemAppPlaybackQueueInternalPrepareBundleIDForPlayback();
  if (v7)
  {
    objc_msgSend(v7, "persistentID");
    MRSystemAppPlaybackQueueSetLocalQueryFirstItemPID();
  }
LABEL_35:
  MRMediaRemoteSetAppPlaybackQueue();
  usleep(0x493E0u);
  MRMediaRemoteSendCommandToApp();
  if (v12)
LABEL_36:
    MRSystemAppPlaybackQueueDestroy();
LABEL_37:

}

void __54__ACCMediaLibraryShimInfo_playWithQuery_andFirstItem___block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  NSObject *v4;
  id v5;
  uint8_t v6[16];

  v2 = *(id *)(a1[4] + 104);
  if (objc_msgSend(v2, "playbackState"))
    objc_msgSend(v2, "stop");
  v3 = a1[6];
  if (a1[5])
    objc_msgSend(v2, "setQueueWithQuery:firstItem:", v3);
  else
    objc_msgSend(v2, "setQueueWithQuery:", v3);
  objc_msgSend(v2, "prepareQueueForPlayback");
  if (!objc_msgSend(v2, "numberOfItems"))
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v4 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
      v4 = MEMORY[0x24BDACB70];
      v5 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_21A7E0000, v4, OS_LOG_TYPE_DEFAULT, "playWithQuery: Playback queue is empty", v6, 2u);
    }

  }
  objc_msgSend(v2, "play");

}

- (id)_getMediaItemForPersistentID:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  BOOL v11;
  int v12;
  NSObject *v13;
  id v14;
  id v15;
  const char *v16;
  id v17;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDC810], "predicateWithValue:forProperty:", v3, *MEMORY[0x24BDDBC40]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDC818]), "initWithFilterPredicates:", v5);
  objc_msgSend(v6, "setShouldIncludeNonLibraryEntities:", 1);
  if (!v6)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v7 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
      v7 = MEMORY[0x24BDACB70];
      v14 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138412290;
      v20 = v3;
      _os_log_impl(&dword_21A7E0000, v7, OS_LOG_TYPE_DEFAULT, "_getMediaItemForPersistentID: Failed to create query for persistentIDObj=%@", (uint8_t *)&v19, 0xCu);
    }
    goto LABEL_35;
  }
  objc_msgSend(v6, "items");
  v7 = objc_claimAutoreleasedReturnValue();
  if (-[NSObject count](v7, "count") != 1)
  {
    v10 = -[NSObject count](v7, "count");
    if (gLogObjects)
      v11 = gNumLogObjects <= 0;
    else
      v11 = 1;
    v12 = !v11;
    if (v10 < 2)
    {
      if (v12)
      {
        v13 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
        v13 = MEMORY[0x24BDACB70];
        v17 = MEMORY[0x24BDACB70];
      }
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        goto LABEL_34;
      v19 = 138412290;
      v20 = v3;
      v16 = "_getMediaItemForPersistentID: No item match for persistentIDObj=%@";
    }
    else
    {
      if (v12)
      {
        v13 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
        v13 = MEMORY[0x24BDACB70];
        v15 = MEMORY[0x24BDACB70];
      }
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        goto LABEL_34;
      v19 = 138412290;
      v20 = v3;
      v16 = "_getMediaItemForPersistentID: Too many items returned!!! for persistentID=%@";
    }
    _os_log_impl(&dword_21A7E0000, v13, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v19, 0xCu);
LABEL_34:

LABEL_35:
    v9 = 0;
    goto LABEL_36;
  }
  objc_msgSend(v6, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_36:
  return v9;
}

- (void)startPlaybackOfItems:(id)a3 withFirst:(unsigned int)a4
{
  id v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  unint64_t v23;
  id v24;
  int libraryType;
  id v26;
  unsigned int v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  unsigned int v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (gLogObjects)
    v7 = gNumLogObjects < 1;
  else
    v7 = 1;
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v9 = MEMORY[0x24BDACB70];
    v8 = MEMORY[0x24BDACB70];
  }
  else
  {
    v9 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v34 = a4;
    v35 = 2112;
    v36 = v6;
    _os_log_impl(&dword_21A7E0000, v9, OS_LOG_TYPE_DEFAULT, "startPlaybackOfItems:withFirst: firstItemIndex=%d items=%@", buf, 0x12u);
  }

  if (self->_libraryType)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v10 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
      v10 = MEMORY[0x24BDACB70];
      v24 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      libraryType = self->_libraryType;
      *(_DWORD *)buf = 67109120;
      v34 = libraryType;
      _os_log_impl(&dword_21A7E0000, v10, OS_LOG_TYPE_DEFAULT, "WARNING: PlaybackOfItems: Not supported for type=%u!", buf, 8u);
    }
  }
  else
  {
    v27 = a4;
    objc_msgSend(MEMORY[0x24BDDC7F0], "defaultMediaLibrary");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDDC7F0], "setDefaultMediaLibrary:", self->_mpMediaLibrary);
    v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v12 = v6;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v29 != v15)
            objc_enumerationMutation(v12);
          v17 = objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "unsignedLongLongValue");
          v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDC7B8]), "initWithPersistentID:", v17);
          if (v18)
          {
            objc_msgSend(v11, "addObject:", v18);
          }
          else
          {
            -[ACCMediaLibraryShimInfo _getMediaItemForPersistentID:](self, "_getMediaItemForPersistentID:", v17);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (v19)
              objc_msgSend(v11, "addObject:", v19);

          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v14);
    }

    if (objc_msgSend(v11, "count"))
    {
      if (objc_msgSend(v11, "count") <= (unint64_t)v27)
        v20 = 0;
      else
        v20 = v27;
      objc_msgSend(v11, "objectAtIndex:", v20);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDC818]), "initWithEntities:entityType:", v11, 0);
      objc_msgSend(v22, "setShouldIncludeNonLibraryEntities:", 1);
      objc_msgSend(v22, "setIgnoreSystemFilterPredicates:", 1);
      -[ACCMediaLibraryShimInfo playWithQuery:andFirstItem:](self, "playWithQuery:andFirstItem:", v22, v21);

      v23 = 0x24BDDC000;
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v21 = *(id *)gLogObjects;
        v23 = 0x24BDDC000;
      }
      else
      {
        v23 = 0x24BDDC000uLL;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
        v21 = MEMORY[0x24BDACB70];
        v26 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21A7E0000, v21, OS_LOG_TYPE_DEFAULT, "WARNING: PlaybackOfItems: No valid tracks to playback!", buf, 2u);
      }
    }

    objc_msgSend(*(id *)(v23 + 2032), "setDefaultMediaLibrary:", v10);
  }

}

- (void)_startPlaybackOfCollection:(unint64_t)a3 ofType:(int)a4 withFirst:(id)a5 orIndex:(unsigned int)a6
{
  id v10;
  uint64_t v11;
  BOOL v12;
  id v13;
  NSObject *v14;
  void *v15;
  int libraryType;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *mpMusicPlayerControllerQueue;
  void *v28;
  void *v29;
  unint64_t v30;
  NSObject *v31;
  NSObject *v32;
  id v33;
  id v34;
  id v35;
  NSObject *v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  ACCMediaLibraryShimInfo *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  id v47;
  void *v48;
  id v49;
  char v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  _QWORD block[5];
  id v59;
  uint8_t buf[4];
  _BYTE v61[18];
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  id v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  unsigned int v69;
  __int16 v70;
  int v71;
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  if (a4 > 7)
    v11 = -1;
  else
    v11 = qword_21A7F9728[a4];
  if (gLogObjects)
    v12 = gNumLogObjects < 1;
  else
    v12 = 1;
  if (v12)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v14 = MEMORY[0x24BDACB70];
    v13 = MEMORY[0x24BDACB70];
  }
  else
  {
    v14 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v10, "title");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    libraryType = self->_libraryType;
    *(_DWORD *)buf = 134219522;
    *(_QWORD *)v61 = a3;
    *(_WORD *)&v61[8] = 2048;
    *(_QWORD *)&v61[10] = a4;
    v62 = 2048;
    v63 = v11;
    v64 = 2112;
    v65 = v10;
    v66 = 2112;
    v67 = v15;
    v68 = 1024;
    v69 = a6;
    v70 = 1024;
    v71 = libraryType;
    _os_log_impl(&dword_21A7E0000, v14, OS_LOG_TYPE_INFO, "_startPlaybackOfCollection: collectionPersistentID=%llu connectionType=%lld(mp:%lld) firstItem=%@(%@) firstItemIndex=%u _libraryType=%d", buf, 0x40u);

  }
  if (self->_libraryType != 2)
  {
    v55 = MEMORY[0x220749824]();
    objc_msgSend(MEMORY[0x24BDDC7F0], "defaultMediaLibrary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDDC7F0], "setDefaultMediaLibrary:", self->_mpMediaLibrary);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
    v18 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 7423);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDDC810], "predicateWithValue:forProperty:", v19, *MEMORY[0x24BDDBC30]);
    v56 = (void *)v18;
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)(v11 - 1) >= 6)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v31 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
        v31 = MEMORY[0x24BDACB70];
        v33 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)v61 = v11;
        _os_log_impl(&dword_21A7E0000, v31, OS_LOG_TYPE_INFO, "_startPlaybackOfCollection: Unsupported MPMediaGrouping mp collection type %ld", buf, 0xCu);
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDDC810], "predicateWithValue:forProperty:", v18, **((_QWORD **)&unk_24DD260C0 + v11 - 1));
      v20 = objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        v21 = (void *)v20;
        objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", v20, v57, 0);
        v22 = objc_claimAutoreleasedReturnValue();
        GetMediaLibraryHelper();
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v54, "showMusic"))
        {
          if (gLogObjects && gNumLogObjects >= 1)
          {
            v36 = *(id *)gLogObjects;
            v29 = v54;
            v28 = (void *)v55;
            v30 = 0x24BDDC000;
          }
          else
          {
            v30 = 0x24BDDC000;
            v29 = v54;
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
            v36 = MEMORY[0x24BDACB70];
            v37 = MEMORY[0x24BDACB70];
            v28 = (void *)v55;
          }
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21A7E0000, v36, OS_LOG_TYPE_DEFAULT, "_startPlaybackOfCollection: no systemMusicPlayer!", buf, 2u);
          }

          goto LABEL_80;
        }
        if (a4 == 6)
          goto LABEL_25;
        v23 = 0x24BDDC000uLL;
        if (!a4)
        {
          v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDC818]), "initWithFilterPredicates:", v22);
          objc_msgSend(v24, "setGroupingType:", 6);
          objc_msgSend(v24, "collections");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v52, "count"))
          {
            objc_msgSend(v52, "objectAtIndex:", 0);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "valueForProperty:", *MEMORY[0x24BDDBD30]);
            v48 = v24;
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = objc_msgSend(v26, "BOOLValue");

            v23 = 0x24BDDC000;
            if ((v50 & 1) != 0)
            {
LABEL_25:
              mpMusicPlayerControllerQueue = self->_mpMusicPlayerControllerQueue;
              block[0] = MEMORY[0x24BDAC760];
              block[1] = 3221225472;
              block[2] = __79__ACCMediaLibraryShimInfo__startPlaybackOfCollection_ofType_withFirst_orIndex___block_invoke;
              block[3] = &unk_24DD25ED8;
              block[4] = self;
              v59 = v21;
              dispatch_sync(mpMusicPlayerControllerQueue, block);

              v29 = v54;
              v28 = (void *)v55;
              v30 = 0x24BDDC000;
LABEL_80:

LABEL_81:
              objc_msgSend(*(id *)(v30 + 2032), "setDefaultMediaLibrary:", v17);

              objc_autoreleasePoolPop(v28);
              goto LABEL_82;
            }
          }
          else
          {

          }
        }
        v38 = (void *)objc_msgSend(objc_alloc(*(Class *)(v23 + 2072)), "initWithFilterPredicates:", v22);
        objc_msgSend(v38, "setGroupingType:", 0);
        v51 = v38;
        objc_msgSend(v38, "items");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v10;
        v53 = v39;
        if (objc_msgSend(v39, "count"))
        {
          if (!v40)
          {
            if (objc_msgSend(v39, "count") <= (unint64_t)a6)
              v41 = 0;
            else
              v41 = a6;
            objc_msgSend(v39, "objectAtIndex:", v41);
            v40 = (id)objc_claimAutoreleasedReturnValue();
          }
          v42 = self;
          v43 = v51;
          v44 = v40;
          -[ACCMediaLibraryShimInfo playWithQuery:andFirstItem:](v42, "playWithQuery:andFirstItem:", v51, v40);
          v45 = v54;
          v28 = (void *)v55;
          v30 = 0x24BDDC000;
        }
        else
        {
          v49 = v40;
          if (gLogObjects && gNumLogObjects >= 1)
          {
            v46 = *(id *)gLogObjects;
            v45 = v54;
            v28 = (void *)v55;
          }
          else
          {
            v45 = v54;
            v28 = (void *)v55;
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
            v46 = MEMORY[0x24BDACB70];
            v47 = MEMORY[0x24BDACB70];
          }
          v30 = 0x24BDDC000uLL;
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21A7E0000, v46, OS_LOG_TYPE_DEFAULT, "WARNING: PlaybackOfCollection: No valid tracks to playback!", buf, 2u);
          }

          v44 = v49;
          v43 = v51;
        }

        v29 = v45;
        goto LABEL_80;
      }
    }
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v22 = *(id *)gLogObjects;
      v30 = 0x24BDDC000;
    }
    else
    {
      v30 = 0x24BDDC000;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
      v22 = MEMORY[0x24BDACB70];
      v34 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v61 = v11;
      _os_log_impl(&dword_21A7E0000, v22, OS_LOG_TYPE_DEFAULT, "WARNING: PlaybackOfCollection: No query found for mp collection type %ld!", buf, 0xCu);
    }
    v21 = 0;
    v28 = (void *)v55;
    goto LABEL_81;
  }
  if (a4 != 7 && a4)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v32 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
      v32 = MEMORY[0x24BDACB70];
      v35 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v61 = a4;
      *(_WORD *)&v61[4] = 2048;
      *(_QWORD *)&v61[6] = a3;
      _os_log_impl(&dword_21A7E0000, v32, OS_LOG_TYPE_DEFAULT, "WARNINGL: PlaybackOfCollection: Invalid type(%d) for collectionPersistentID=%lld", buf, 0x12u);
    }

  }
  else
  {
    -[ACCMediaLibraryShimInfo _startPlaybackOfRadioStation:](self, "_startPlaybackOfRadioStation:", a3);
  }
LABEL_82:

}

void __79__ACCMediaLibraryShimInfo__startPlaybackOfCollection_ofType_withFirst_orIndex___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint8_t v7[16];

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 104);
  objc_msgSend(MEMORY[0x24BDDC818], "geniusMixesQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addFilterPredicate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "collections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "objectAtIndex:", 0);
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setQueueWithGeniusMixPlaylist:", v5);
    objc_msgSend(v2, "play");
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v5 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
      v5 = MEMORY[0x24BDACB70];
      v6 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_21A7E0000, v5, OS_LOG_TYPE_DEFAULT, "WARNING: PlaybackOfCollection: Could not get playlist(geniusMix) to playback!", v7, 2u);
    }
  }

}

- (void)startPlaybackOfCollection:(unint64_t)a3 ofType:(int)a4 withFirst:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  BOOL v9;
  id v10;
  NSObject *v11;
  int v12;
  unint64_t v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v18 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v9 = gNumLogObjects < 1;
  else
    v9 = 1;
  if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v11 = MEMORY[0x24BDACB70];
    v10 = MEMORY[0x24BDACB70];
  }
  else
  {
    v11 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 134218496;
    v13 = a3;
    v14 = 1024;
    v15 = v6;
    v16 = 1024;
    v17 = v5;
    _os_log_impl(&dword_21A7E0000, v11, OS_LOG_TYPE_DEFAULT, "startPlaybackOfCollection:ofType:withFirst collectionPersistentID=%llu collectionType=%u firstItemIndex=%u", (uint8_t *)&v12, 0x18u);
  }

  -[ACCMediaLibraryShimInfo _startPlaybackOfCollection:ofType:withFirst:orIndex:](self, "_startPlaybackOfCollection:ofType:withFirst:orIndex:", a3, v6, 0, v5);
}

- (void)startPlaybackOfCollection:(unint64_t)a3 ofType:(int)a4 withFirstPersistentID:(unint64_t)a5
{
  uint64_t v6;
  void *v9;
  BOOL v10;
  id v11;
  NSObject *v12;
  int v13;
  unint64_t v14;
  __int16 v15;
  int v16;
  __int16 v17;
  unint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v6 = *(_QWORD *)&a4;
  v21 = *MEMORY[0x24BDAC8D0];
  -[ACCMediaLibraryShimInfo _getMediaItemForPersistentID:](self, "_getMediaItemForPersistentID:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (gLogObjects)
    v10 = gNumLogObjects < 1;
  else
    v10 = 1;
  if (v10)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v12 = MEMORY[0x24BDACB70];
    v11 = MEMORY[0x24BDACB70];
  }
  else
  {
    v12 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 134218754;
    v14 = a3;
    v15 = 1024;
    v16 = v6;
    v17 = 2048;
    v18 = a5;
    v19 = 2112;
    v20 = v9;
    _os_log_impl(&dword_21A7E0000, v12, OS_LOG_TYPE_DEFAULT, "startPlaybackOfCollection:ofType:withFirstPersistentID: collectionPersistentID=%llu collectionType=%u firstItemPersistentID=%llu firstItem=%@", (uint8_t *)&v13, 0x26u);
  }

  -[ACCMediaLibraryShimInfo _startPlaybackOfCollection:ofType:withFirst:orIndex:](self, "_startPlaybackOfCollection:ofType:withFirst:orIndex:", a3, v6, v9, 0);
}

- (void)startMLPlaybackWithResume:(BOOL)a3
{
  _BOOL4 v3;
  BOOL v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *mpMusicPlayerControllerQueue;
  NSObject *v10;
  id v11;
  int libraryType;
  id v13;
  _QWORD block[5];
  uint8_t buf[4];
  int v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v16 = v3;
    _os_log_impl(&dword_21A7E0000, v7, OS_LOG_TYPE_DEFAULT, "startMLPlaybackWithResume: resume=%d", buf, 8u);
  }

  if ((self->_libraryType | 2) == 2)
  {
    if (!v3)
      return;
    GetMediaLibraryHelper();
    v8 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject showMusic](v8, "showMusic"))
    {
      mpMusicPlayerControllerQueue = self->_mpMusicPlayerControllerQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __53__ACCMediaLibraryShimInfo_startMLPlaybackWithResume___block_invoke;
      block[3] = &unk_24DD25F28;
      block[4] = self;
      dispatch_sync(mpMusicPlayerControllerQueue, block);
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v10 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
        v10 = MEMORY[0x24BDACB70];
        v13 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21A7E0000, v10, OS_LOG_TYPE_INFO, "no systemMusicPlayer!", buf, 2u);
      }

    }
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v8 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
      v8 = MEMORY[0x24BDACB70];
      v11 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      libraryType = self->_libraryType;
      *(_DWORD *)buf = 67109120;
      v16 = libraryType;
      _os_log_impl(&dword_21A7E0000, v8, OS_LOG_TYPE_DEFAULT, "ERROR: Invalid libraryType(%d)", buf, 8u);
    }
  }

}

void __53__ACCMediaLibraryShimInfo_startMLPlaybackWithResume___block_invoke(uint64_t a1)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  id v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 104);
  if (!objc_msgSend(v2, "playbackState"))
  {
    if (gLogObjects)
      v3 = gNumLogObjects < 1;
    else
      v3 = 1;
    if (v3)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
      v5 = MEMORY[0x24BDACB70];
      v4 = MEMORY[0x24BDACB70];
    }
    else
    {
      v5 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "UIDString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412290;
      v17 = v6;
      _os_log_impl(&dword_21A7E0000, v5, OS_LOG_TYPE_INFO, "startMLPlaybackWithResume stopped! prepare all tracks, libraryUID=%@", (uint8_t *)&v16, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDDC7F0], "defaultMediaLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    if (*(_DWORD *)(v8 + 36) == 2)
    {
      objc_msgSend(MEMORY[0x24BDDCB48], "defaultRadioLibrary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stations");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "count"))
      {
        objc_msgSend(v10, "objectAtIndex:", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setQueueWithRadioStation:", v11);

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDDC7F0], "setDefaultMediaLibrary:", *(_QWORD *)(v8 + 56));
      objc_msgSend(MEMORY[0x24BDDC818], "songsQuery");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setQueueWithQuery:", v9);
    }

    objc_msgSend(MEMORY[0x24BDDC7F0], "setDefaultMediaLibrary:", v7);
  }
  if (gLogObjects)
    v12 = gNumLogObjects < 1;
  else
    v12 = 1;
  if (v12)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v14 = MEMORY[0x24BDACB70];
    v13 = MEMORY[0x24BDACB70];
  }
  else
  {
    v14 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "UIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412290;
    v17 = v15;
    _os_log_impl(&dword_21A7E0000, v14, OS_LOG_TYPE_INFO, "startMLPlaybackWithResume call [musicPlayer play], libraryUID=%@", (uint8_t *)&v16, 0xCu);

  }
  objc_msgSend(v2, "play");

}

- (void)_startMLPlaybackOfAllSongsStartItem:(id)a3
{
  id v4;
  BOOL v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  void *v10;
  int libraryType;
  id v12;
  void *v13;
  NSObject *mpMusicPlayerControllerQueue;
  NSObject *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects <= 0;
  else
    v5 = 1;
  v6 = !v5;
  if (self->_libraryType)
  {
    if (v6)
    {
      v7 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
      v7 = MEMORY[0x24BDACB70];
      v9 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[ACCMediaLibraryShimInfo UIDString](self, "UIDString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      libraryType = self->_libraryType;
      *(_DWORD *)buf = 138412546;
      v20 = v10;
      v21 = 1024;
      v22 = libraryType;
      _os_log_impl(&dword_21A7E0000, v7, OS_LOG_TYPE_DEFAULT, "startMLPlaybackOfAllSongs Not supported for, libraryUID=%@ _libraryType=%u", buf, 0x12u);

    }
  }
  else
  {
    if (v6)
    {
      v8 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
      v8 = MEMORY[0x24BDACB70];
      v12 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      -[ACCMediaLibraryShimInfo UIDString](self, "UIDString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v20 = v13;
      _os_log_impl(&dword_21A7E0000, v8, OS_LOG_TYPE_INFO, "startMLPlaybackOfAllSongs prepare and play all songs, libraryUID=%@", buf, 0xCu);

    }
    GetMediaLibraryHelper();
    v7 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject showMusic](v7, "showMusic"))
    {
      mpMusicPlayerControllerQueue = self->_mpMusicPlayerControllerQueue;
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __63__ACCMediaLibraryShimInfo__startMLPlaybackOfAllSongsStartItem___block_invoke;
      v17[3] = &unk_24DD25ED8;
      v17[4] = self;
      v18 = v4;
      dispatch_sync(mpMusicPlayerControllerQueue, v17);

    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v15 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
        v15 = MEMORY[0x24BDACB70];
        v16 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21A7E0000, v15, OS_LOG_TYPE_INFO, "no systemMusicPlayer!", buf, 2u);
      }

    }
  }

}

void __63__ACCMediaLibraryShimInfo__startMLPlaybackOfAllSongsStartItem___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 104);
  objc_msgSend(MEMORY[0x24BDDC7F0], "defaultMediaLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDC7F0], "setDefaultMediaLibrary:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
  objc_msgSend(MEMORY[0x24BDDC818], "songsQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 40))
    objc_msgSend(v4, "setQueueWithQuery:firstItem:", v3);
  else
    objc_msgSend(v4, "setQueueWithQuery:", v3);
  objc_msgSend(MEMORY[0x24BDDC7F0], "setDefaultMediaLibrary:", v2);
  objc_msgSend(v4, "play");

}

- (void)startMLPlaybackOfAllSongs
{
  -[ACCMediaLibraryShimInfo _startMLPlaybackOfAllSongsStartItem:](self, "_startMLPlaybackOfAllSongsStartItem:", 0);
}

- (void)startMLPlaybackOfAllSongsStartPersistentID:(unint64_t)a3
{
  BOOL v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  void *v10;
  int libraryType;
  int v12;
  unint64_t v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 134217984;
    v13 = a3;
    _os_log_impl(&dword_21A7E0000, v7, OS_LOG_TYPE_DEFAULT, "startMLPlaybackOfAllSongsStartPersistentID: startingPersistentID=%llu", (uint8_t *)&v12, 0xCu);
  }

  if (self->_libraryType)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v8 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
      v8 = MEMORY[0x24BDACB70];
      v9 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[ACCMediaLibraryShimInfo UIDString](self, "UIDString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      libraryType = self->_libraryType;
      v12 = 138412546;
      v13 = (unint64_t)v10;
      v14 = 1024;
      v15 = libraryType;
      _os_log_impl(&dword_21A7E0000, v8, OS_LOG_TYPE_DEFAULT, "startMLPlaybackOfAllSongs Not supported for, libraryUID=%@ _libraryType=%u", (uint8_t *)&v12, 0x12u);

    }
  }
  else
  {
    -[ACCMediaLibraryShimInfo _getMediaItemForPersistentID:](self, "_getMediaItemForPersistentID:", a3);
    v8 = objc_claimAutoreleasedReturnValue();
    -[ACCMediaLibraryShimInfo _startMLPlaybackOfAllSongsStartItem:](self, "_startMLPlaybackOfAllSongsStartItem:", v8);
  }

}

- (void)confirmMediaLibraryUpdateLastRevision:(id)a3 updateCount:(unsigned int)a4
{
  id v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  unsigned int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (gLogObjects)
    v7 = gNumLogObjects < 1;
  else
    v7 = 1;
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v9 = MEMORY[0x24BDACB70];
    v8 = MEMORY[0x24BDACB70];
  }
  else
  {
    v9 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = 138412546;
    v11 = v6;
    v12 = 1024;
    v13 = a4;
    _os_log_impl(&dword_21A7E0000, v9, OS_LOG_TYPE_INFO, "confirmMediaLibraryUpdateLastRevision: lastRevision=%@ count=%u", (uint8_t *)&v10, 0x12u);
  }

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_waitForWindowSem);
}

- (ACCMediaLibraryShim)context
{
  return self->_context;
}

- (ACCMediaLibraryAccessory)accessory
{
  return self->_accessory;
}

- (BOOL)isShuttingDown
{
  return self->_isShuttingDown;
}

- (id)mpMediaLibrary
{
  return self->_mpMediaLibrary;
}

- (NSString)anchor
{
  return self->_anchor;
}

- (void)setAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_anchor, a3);
}

- (OS_dispatch_queue)libraryUpdateQ
{
  return self->_libraryUpdateQ;
}

- (int)libraryType
{
  return self->_libraryType;
}

- (NSString)UIDString
{
  return self->_UIDString;
}

- (OS_dispatch_semaphore)waitForWindowSem
{
  return self->_waitForWindowSem;
}

- (OS_dispatch_queue)mpMusicPlayerControllerQueue
{
  return self->_mpMusicPlayerControllerQueue;
}

- (void)setMpMusicPlayerControllerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_mpMusicPlayerControllerQueue, a3);
}

- (MPMusicPlayerController)mpMusicPlayerControllerHandler
{
  return self->_mpMusicPlayerControllerHandler;
}

- (void)setMpMusicPlayerControllerHandler:(id)a3
{
  objc_storeStrong((id *)&self->_mpMusicPlayerControllerHandler, a3);
}

- (BOOL)enableLibraryUpdate
{
  return self->_enableLibraryUpdate;
}

- (NSArray)stationsGroupList
{
  return self->_stationsGroupList;
}

- (void)setStationsGroupList:(id)a3
{
  objc_storeStrong((id *)&self->_stationsGroupList, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stationsGroupList, 0);
  objc_storeStrong((id *)&self->_mpMusicPlayerControllerHandler, 0);
  objc_storeStrong((id *)&self->_mpMusicPlayerControllerQueue, 0);
  objc_storeStrong((id *)&self->_waitForWindowSem, 0);
  objc_storeStrong((id *)&self->_UIDString, 0);
  objc_storeStrong((id *)&self->_libraryUpdateQ, 0);
  objc_storeStrong((id *)&self->_anchor, 0);
  objc_storeStrong(&self->_mpMediaLibrary, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_syncValidityPersistentID, 0);
  objc_storeStrong((id *)&self->_dbUpdateList, 0);
}

- (void)_getUIDString
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21A7E0000, MEMORY[0x24BDACB70], v0, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)_beginMediaLibraryUpdatesWithAnchor:(uint64_t)a3 validity:(uint64_t)a4 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_11(&dword_21A7E0000, a2, a3, "_attemptUpdate result %ld", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void __72__ACCMediaLibraryShimInfo__beginMediaLibraryUpdatesWithAnchor_validity___block_invoke_67_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_9(a1, *MEMORY[0x24BDAC8D0]), "anchor");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_21A7E0000, v2, v3, "update:%@ revision:%@ deletePlaylist:%llu progress:%u accessory:%@, _isShuttingDown=%d _enableLibraryUpdate=%d", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_6();
}

void __72__ACCMediaLibraryShimInfo__beginMediaLibraryUpdatesWithAnchor_validity___block_invoke_69_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_9(a1, *MEMORY[0x24BDAC8D0]), "revision");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_21A7E0000, v2, v3, "update:%@ revision:%@ playlist:%@ progress:%u accessory:%@, _isShuttingDown=%d _enableLibraryUpdate=%d", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6();
}

void __72__ACCMediaLibraryShimInfo__beginMediaLibraryUpdatesWithAnchor_validity___block_invoke_70_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
  objc_msgSend(*(id *)(a1 + 40), "revision");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "content");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  v7 = 138413826;
  v8 = v4;
  v9 = 2112;
  v10 = v5;
  v11 = 2112;
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_21A7E0000, a2, OS_LOG_TYPE_DEBUG, "update:%@ revision:%@ content:%@ progress:%u accessory:%@, _isShuttingDown=%d _enableLibraryUpdate=%d", (uint8_t *)&v7, 0x3Cu);

}

void __72__ACCMediaLibraryShimInfo__beginMediaLibraryUpdatesWithAnchor_validity___block_invoke_71_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_9(a1, *MEMORY[0x24BDAC8D0]), "anchor");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_21A7E0000, v2, v3, "update:%@ revision:%@ deleteItem:%llu progress:%u accessory:%@, _isShuttingDown=%d _enableLibraryUpdate=%d", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_6();
}

void __72__ACCMediaLibraryShimInfo__beginMediaLibraryUpdatesWithAnchor_validity___block_invoke_72_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_9(a1, *MEMORY[0x24BDAC8D0]), "revision");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_21A7E0000, v2, v3, "update:%@ revision:%@ item:[%@] progress:%u accessory:%@, _isShuttingDown=%d _enableLibraryUpdate=%d", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6();
}

@end
