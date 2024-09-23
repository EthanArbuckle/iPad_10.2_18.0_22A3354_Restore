@implementation MPMediaPlaylist

+ (BOOL)canFilterByProperty:(id)a3
{
  id v4;
  const __CFDictionary *v5;
  unsigned __int8 v6;
  objc_super v8;

  v4 = a3;
  v5 = (const __CFDictionary *)__filterableDictionary;
  if (!__filterableDictionary)
  {
    objc_msgSend(a1, "_createFilterableDictionary");
    v5 = (const __CFDictionary *)__filterableDictionary;
  }
  if ((CFDictionaryGetValue(v5, (const void *)objc_msgSend(v4, "hash")) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___MPMediaPlaylist;
    v6 = objc_msgSendSuper2(&v8, sel_canFilterByProperty_, v4);
  }

  return v6;
}

+ (void)_createFilterableDictionary
{
  const void *__dst[54];
  void *keys[44];
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!__filterableDictionary)
  {
    v8 = 0u;
    v7 = 0u;
    v6 = 0u;
    v5 = 0u;
    v4 = 0u;
    keys[0] = (void *)objc_msgSend(CFSTR("playlistPersistentID"), "hash");
    keys[1] = (void *)objc_msgSend(CFSTR("name"), "hash");
    keys[2] = (void *)objc_msgSend(CFSTR("playlistAttributes"), "hash");
    keys[3] = (void *)objc_msgSend(CFSTR("seedItems"), "hash");
    keys[4] = (void *)objc_msgSend(CFSTR("dateCreated"), "hash");
    keys[5] = (void *)objc_msgSend(CFSTR("dateModified"), "hash");
    keys[6] = (void *)objc_msgSend(CFSTR("datePlayed"), "hash");
    keys[7] = (void *)objc_msgSend(CFSTR("datePlayedLocal"), "hash");
    keys[8] = (void *)objc_msgSend(CFSTR("isWorkoutMix"), "hash");
    keys[9] = (void *)objc_msgSend(CFSTR("isGeniusMix"), "hash");
    keys[10] = (void *)objc_msgSend(CFSTR("isGeniusPlaylist"), "hash");
    keys[11] = (void *)objc_msgSend(CFSTR("geniusMixRepresentativeArtists"), "hash");
    keys[12] = (void *)objc_msgSend(CFSTR("isVoiceMemos"), "hash");
    keys[13] = (void *)objc_msgSend(CFSTR("isActivePlaylist"), "hash");
    keys[14] = (void *)objc_msgSend(CFSTR("isActiveGeniusPlaylist"), "hash");
    keys[15] = (void *)objc_msgSend(CFSTR("isActiveOnTheGoPlaylist"), "hash");
    keys[16] = (void *)objc_msgSend(CFSTR("isDeletable"), "hash");
    keys[17] = (void *)objc_msgSend(CFSTR("isUserEditable"), "hash");
    keys[18] = (void *)objc_msgSend(CFSTR("isHidden"), "hash");
    keys[19] = (void *)objc_msgSend(CFSTR("descriptionInfo"), "hash");
    keys[20] = (void *)objc_msgSend(CFSTR("iO"), "hash");
    keys[21] = (void *)objc_msgSend(CFSTR("isEditable"), "hash");
    keys[22] = (void *)objc_msgSend(CFSTR("playCount"), "hash");
    keys[23] = (void *)objc_msgSend(CFSTR("playCountSinceSync"), "hash");
    keys[24] = (void *)objc_msgSend(CFSTR("likedState"), "hash");
    keys[25] = (void *)objc_msgSend(CFSTR("parentPersistentID"), "hash");
    keys[26] = (void *)objc_msgSend(CFSTR("isFolder"), "hash");
    keys[27] = (void *)objc_msgSend(CFSTR("isPurchasesPlaylist"), "hash");
    keys[28] = (void *)objc_msgSend(CFSTR("isCurrentDevicePurchasesPlaylist"), "hash");
    keys[29] = (void *)objc_msgSend(CFSTR("isPlaybackHistoryPlaylist"), "hash");
    keys[30] = (void *)objc_msgSend(CFSTR("isIgnoredSyncing"), "hash");
    keys[31] = (void *)objc_msgSend(CFSTR("hasItems"), "hash");
    keys[32] = (void *)objc_msgSend(CFSTR("storeCloudID"), "hash");
    keys[33] = (void *)objc_msgSend(CFSTR("isLimitedDynamicSmartPlaylist"), "hash");
    keys[34] = (void *)objc_msgSend(CFSTR("mediaType"), "hash");
    keys[35] = (void *)objc_msgSend(CFSTR("entityRevision"), "hash");
    keys[36] = (void *)objc_msgSend(CFSTR("cloudGlobalID"), "hash");
    keys[37] = (void *)objc_msgSend(CFSTR("cloudVersionHash"), "hash");
    keys[38] = (void *)objc_msgSend(CFSTR("cloudShareURL"), "hash");
    keys[39] = (void *)objc_msgSend(CFSTR("cloudIsPublic"), "hash");
    keys[40] = (void *)objc_msgSend(CFSTR("cloudIsVisible"), "hash");
    keys[41] = (void *)objc_msgSend(CFSTR("cloudIsSubscribed"), "hash");
    keys[42] = (void *)objc_msgSend(CFSTR("cloudIsCuratorPlaylist"), "hash");
    keys[43] = (void *)objc_msgSend(CFSTR("cloudAuthorStoreID"), "hash");
    *(_QWORD *)&v4 = objc_msgSend(CFSTR("cloudAuthorDisplayName"), "hash");
    *((_QWORD *)&v4 + 1) = objc_msgSend(CFSTR("cloudAuthorStoreURL"), "hash");
    *(_QWORD *)&v5 = objc_msgSend(CFSTR("cloudUserCount"), "hash");
    *((_QWORD *)&v5 + 1) = objc_msgSend(CFSTR("cloudGlobalPlayCount"), "hash");
    *(_QWORD *)&v6 = objc_msgSend(CFSTR("cloudGlobalLikeCount"), "hash");
    *((_QWORD *)&v6 + 1) = objc_msgSend(CFSTR("distinguishedKind"), "hash");
    *(_QWORD *)&v7 = objc_msgSend(CFSTR("isITunesSynced"), "hash");
    *((_QWORD *)&v7 + 1) = objc_msgSend(CFSTR("externalVendorContainerTag"), "hash");
    *(_QWORD *)&v8 = objc_msgSend(CFSTR("isExternalVendorPlaylist"), "hash");
    *((_QWORD *)&v8 + 1) = objc_msgSend(CFSTR("cloudPlaylistUniversalLibraryID"), "hash");
    memcpy(__dst, &unk_193F09A70, sizeof(__dst));
    __filterableDictionary = (uint64_t)CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)keys, __dst, 54, 0, 0);
  }
}

- (MPMediaPlaylist)initWithPersistentID:(unint64_t)a3
{
  void *v5;
  MPMediaPlaylist *v6;

  +[MPMediaLibrary defaultMediaLibrary](MPMediaLibrary, "defaultMediaLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MPMediaPlaylist initWithPersistentID:mediaLibrary:](self, "initWithPersistentID:mediaLibrary:", a3, v5);

  return v6;
}

- (MPMediaPlaylist)initWithPersistentID:(unint64_t)a3 mediaLibrary:(id)a4
{
  MPMediaPlaylist *v5;

  objc_msgSend(a4, "playlistWithPersistentID:", a3);
  v5 = (MPMediaPlaylist *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (MPMediaPlaylist)initWithMultiverseIdentifier:(id)a3 library:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  _QWORD *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  char v24;
  void *v25;
  uint64_t v26;
  void *v27;
  char v28;
  void *v29;
  int v30;
  MPMediaPlaylist *v31;
  uint64_t v33;
  void *v34;
  id v35;
  MPMediaPlaylist *v36;
  id obj;
  id v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v7, "mediaObjectType");
  if ((_DWORD)v9 != 7)
  {
    v33 = v9;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPMediaPlaylist.m"), 129, CFSTR("Playlist was initialized with a multiverse identifier containing the wrong object type (%d)"), v33);

  }
  objc_msgSend(v7, "libraryIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = malloc_type_malloc(8 * objc_msgSend(v7, "libraryIdentifiersCount"), 0x100004000313F17uLL);
  v38 = v8;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (!v13)
  {

    v15 = 0;
    v39 = 0;
    goto LABEL_16;
  }
  v14 = v13;
  v35 = v7;
  v36 = self;
  LODWORD(v15) = 0;
  v16 = *(_QWORD *)v41;
  v17 = 1;
  obj = v12;
  do
  {
    for (i = 0; i != v14; ++i)
    {
      if (*(_QWORD *)v41 != v16)
        objc_enumerationMutation(obj);
      v19 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
      v11[(v15 + i)] = objc_msgSend(v19, "libraryId");
      objc_msgSend(v19, "libraryName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v20, "length"))
      {
        objc_msgSend(v19, "libraryName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "uniqueIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v21, "isEqualToString:", v22);

      }
      else
      {
        v23 = 0;
      }

      v17 &= v23;
    }
    v15 = (v15 + i);
    v12 = obj;
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  }
  while (v14);

  v39 = 0;
  v7 = v35;
  self = v36;
  if ((v17 & 1) != 0)
  {
LABEL_16:
    v24 = objc_msgSend(v38, "collectionExistsContainedWithinPersistentIDs:count:groupingType:existentPID:", v11, v15, 6, &v39);
    free(v11);
    if ((v24 & 1) != 0)
      goto LABEL_27;
    goto LABEL_17;
  }
  free(v11);
LABEL_17:
  if (!objc_msgSend(v7, "hasSagaId")
    || !objc_msgSend(v7, "sagaId")
    || (objc_msgSend(v38, "collectionExistsWithSagaID:groupingType:existentPID:", objc_msgSend(v7, "sagaId"), 6, &v39) & 1) == 0)
  {
    if (!objc_msgSend(v7, "hasCloudUniversalLibraryId"))
      goto LABEL_32;
    objc_msgSend(v7, "cloudUniversalLibraryId");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "length");

    if (!v26
      || (objc_msgSend(v7, "cloudUniversalLibraryId"),
          v27 = (void *)objc_claimAutoreleasedReturnValue(),
          v28 = objc_msgSend(v38, "collectionExistsWithCloudUniversalLibraryID:groupingType:existentPID:", v27, 6, &v39), v27, (v28 & 1) == 0))
    {
LABEL_32:
      if (!objc_msgSend(v7, "hasStoreId")
        || !objc_msgSend(v7, "storeId")
        || (objc_msgSend(v38, "collectionExistsWithStoreID:groupingType:existentPID:", objc_msgSend(v7, "storeId"), 6, &v39) & 1) == 0)
      {
        objc_msgSend(v7, "name");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v38, "collectionExistsWithName:groupingType:existentPID:", v29, 6, &v39);

        if (!v30)
        {
          v31 = 0;
          goto LABEL_28;
        }
      }
    }
  }
LABEL_27:
  self = -[MPMediaPlaylist initWithPersistentID:](self, "initWithPersistentID:", v39);
  v31 = self;
LABEL_28:

  return v31;
}

- (unint64_t)hash
{
  MPMediaEntityPersistentID v2;

  v2 = -[MPMediaPlaylist persistentID](self, "persistentID");
  return v2 ^ HIDWORD(v2);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  MPMediaEntityPersistentID v5;
  unsigned __int8 v6;
  objc_super v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = -[MPMediaPlaylist persistentID](self, "persistentID");
    v6 = v5 == objc_msgSend(v4, "persistentID");
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)MPMediaPlaylist;
    v6 = -[MPMediaItemCollection isEqual:](&v8, sel_isEqual_, v4);
  }

  return v6;
}

- (MPMediaPlaylist)initWithCoder:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPMediaPlaylist.m"), 216, CFSTR("subclass must implement"));

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPMediaPlaylist.m"), 221, CFSTR("subclass must implement"));

}

- (id)valueForProperty:(id)a3
{
  id v5;
  int v6;
  void *v7;

  v5 = a3;
  v6 = objc_msgSend((id)objc_opt_class(), "_isValidPlaylistProperty:", v5);

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPMediaPlaylist.m"), 245, CFSTR("subclass must implement"));

  }
  return 0;
}

- (void)addItemWithProductID:(NSString *)productID completionHandler:(void *)completionHandler
{
  id v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", productID, completionHandler);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPMediaPlaylist.m"), 250, CFSTR("subclass must implement"));

}

- (void)addMediaItems:(NSArray *)mediaItems completionHandler:(void *)completionHandler
{
  id v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", mediaItems, completionHandler);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPMediaPlaylist.m"), 253, CFSTR("subclass must implement"));

}

- (BOOL)existsInLibrary
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPMediaPlaylist.m"), 259, CFSTR("subclass must implement"));

  return 1;
}

- (MPMediaEntityPersistentID)persistentID
{
  void *v2;
  MPMediaEntityPersistentID v3;

  -[MPMediaPlaylist valueForProperty:](self, "valueForProperty:", CFSTR("playlistPersistentID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedLongLongValue");

  return v3;
}

- (NSString)name
{
  return (NSString *)-[MPMediaPlaylist valueForProperty:](self, "valueForProperty:", CFSTR("name"));
}

- (MPMediaPlaylistAttribute)playlistAttributes
{
  void *v2;
  MPMediaPlaylistAttribute v3;

  -[MPMediaPlaylist valueForProperty:](self, "valueForProperty:", CFSTR("playlistAttributes"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (NSArray)seedItems
{
  return (NSArray *)-[MPMediaPlaylist valueForProperty:](self, "valueForProperty:", CFSTR("seedItems"));
}

- (NSString)descriptionText
{
  return (NSString *)-[MPMediaPlaylist valueForProperty:](self, "valueForProperty:", CFSTR("descriptionInfo"));
}

- (NSString)authorDisplayName
{
  return (NSString *)-[MPMediaPlaylist valueForProperty:](self, "valueForProperty:", CFSTR("externalVendorDisplayName"));
}

- (BOOL)isFavoriteSongsPlaylist
{
  void *v2;
  BOOL v3;

  -[MPMediaPlaylist valueForProperty:](self, "valueForProperty:", CFSTR("distinguishedKind"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue") == 71;

  return v3;
}

- (void)removeFirstItem
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPMediaPlaylist.m"), 296, CFSTR("subclass must implement"));

}

- (id)items
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPMediaPlaylist.m"), 431, CFSTR("subclass must implement"));

  return 0;
}

- (unint64_t)count
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPMediaPlaylist.m"), 436, CFSTR("subclass must implement"));

  return 0;
}

- (unint64_t)mediaTypes
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPMediaPlaylist.m"), 441, CFSTR("subclass must implement"));

  return -1;
}

- (id)representativeItem
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPMediaPlaylist.m"), 446, CFSTR("subclass must implement"));

  return 0;
}

- (id)multiverseIdentifier
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPMediaPlaylist.m"), 451, CFSTR("subclass must implement"));

  return 0;
}

- (id)representativeArtists
{
  NSArray *representativeArtists;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  NSArray *v16;
  NSArray *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  representativeArtists = self->_representativeArtists;
  if (!representativeArtists)
  {
    -[MPMediaPlaylist valueForProperty:](self, "valueForProperty:", CFSTR("descriptionInfo"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentsSeparatedByString:", CFSTR(",,,"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 3);
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      -[MPMediaPlaylist seedTracksQuery](self, "seedTracksQuery", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "items");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v20;
        while (2)
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v20 != v11)
              objc_enumerationMutation(v8);
            objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "valueForProperty:", CFSTR("albumArtist"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v13, "length"))
            {
              objc_msgSend(v6, "addObject:", v13);
              if ((unint64_t)objc_msgSend(v6, "count") >= 3)
              {

                goto LABEL_14;
              }
            }

          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          if (v10)
            continue;
          break;
        }
      }
LABEL_14:

      if (objc_msgSend(v6, "count"))
      {
        objc_msgSend(v6, "allObjects");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "componentsJoinedByString:", CFSTR(",,,"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPMediaItemCollection setValue:forProperty:withCompletionBlock:](self, "setValue:forProperty:withCompletionBlock:", v15, CFSTR("descriptionInfo"), 0);

        objc_msgSend(v6, "allObjects");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v5 = 0;
      }

    }
    if ((unint64_t)objc_msgSend(v5, "count") < 4)
    {
      v16 = v5;
    }
    else
    {
      objc_msgSend(v5, "subarrayWithRange:", 0, 3);
      v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    v17 = self->_representativeArtists;
    self->_representativeArtists = v16;

    representativeArtists = self->_representativeArtists;
  }
  return representativeArtists;
}

- (id)seedTracksQuery
{
  MPMediaQuery *seedTracksQuery;
  MPMediaQuery *v4;
  MPMediaQuery *v5;
  void *v6;
  void *v7;

  seedTracksQuery = self->_seedTracksQuery;
  if (!seedTracksQuery)
  {
    v4 = objc_alloc_init(MPMediaQuery);
    v5 = self->_seedTracksQuery;
    self->_seedTracksQuery = v4;

    -[MPMediaPlaylist valueForProperty:](self, "valueForProperty:", CFSTR("playlistPersistentID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", v6, CFSTR("playlistPersistentID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPMediaQuery addFilterPredicate:](self->_seedTracksQuery, "addFilterPredicate:", v7);

    seedTracksQuery = self->_seedTracksQuery;
  }
  return seedTracksQuery;
}

- (BOOL)isCloudMix
{
  void *v2;
  BOOL v3;

  -[MPMediaPlaylist valueForProperty:](self, "valueForProperty:", CFSTR("storeCloudID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "longLongValue") != 0;

  return v3;
}

- (NSString)cloudGlobalID
{
  return (NSString *)-[MPMediaPlaylist valueForProperty:](self, "valueForProperty:", CFSTR("cloudGlobalID"));
}

- (void)setUserSelectedArtworkImage:(id)a3
{
  UIImage *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  _QWORD *v11;
  ldiv_t v12;
  uint64_t v13;
  char *v14;
  const UInt8 *v15;
  unsigned __int8 *v16;
  char *v17;
  char *v18;
  uint64_t m;
  unsigned int v20;
  char *v21;
  id v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  _BYTE *v27;
  unint64_t v28;
  unsigned __int8 *v29;
  char *v30;
  char *v31;
  uint64_t j;
  unsigned int v33;
  char *v34;
  uint64_t v35;
  char *v36;
  uint64_t quot;
  lldiv_t v38;
  uint64_t v39;
  CFStringRef v40;
  unsigned __int8 *v41;
  char *v42;
  char *v43;
  uint64_t k;
  unsigned int v45;
  char *v46;
  char *v47;
  uint64_t v48;
  _BYTE *v49;
  unint64_t v50;
  unsigned __int8 *v51;
  char *v52;
  char *v53;
  uint64_t i;
  unsigned int v55;
  char *v56;
  __CFString *v57;
  void *v58;
  void *v59;
  int v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  MPMediaEntityPersistentID v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  UIImage *v73;
  CC_SHA256_CTX v74[2];
  const __CFString *v75;
  const __CFString *v76;
  const __CFString *v77;
  const __CFString *v78;
  _BYTE v79[72];
  _OWORD v80[4];
  uint64_t v81;
  _QWORD v82[3];
  _QWORD v83[3];

  v83[0] = *MEMORY[0x1E0C80C00];
  v4 = (UIImage *)a3;
  if (!v4)
    goto LABEL_63;
  -[MPMediaEntity mediaLibrary](self, "mediaLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isHomeSharingLibrary");

  if ((v6 & 1) != 0)
    goto LABEL_63;
  -[MPMediaEntity mediaLibrary](self, "mediaLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  UIImageJPEGRepresentation(v4, *MEMORY[0x1E0D4CF38]);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  memset(v74, 0, sizeof(v74));
  CC_SHA256_Init(v74);
  v9 = objc_retainAutorelease(v8);
  CC_SHA256_Update(v74, (const void *)objc_msgSend(v9, "bytes"), objc_msgSend(v9, "length"));

  memset(&v79[8], 0, 64);
  *(_QWORD *)v79 = 4256;
  CC_SHA256_Final(&v79[8], v74);
  v80[0] = *(_OWORD *)v79;
  v80[1] = *(_OWORD *)&v79[16];
  v80[2] = *(_OWORD *)&v79[32];
  v80[3] = *(_OWORD *)&v79[48];
  v81 = *(_QWORD *)&v79[64];
  if (*(uint64_t *)v79 > 3999)
  {
    if (*(uint64_t *)v79 > 4255)
    {
      if (*(_QWORD *)v79 == 4256)
      {
        v51 = (unsigned __int8 *)v80 + 8;
        v52 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
        v53 = v52;
        for (i = 0; i != 64; i += 2)
        {
          v55 = *v51++;
          v56 = &v52[i];
          *v56 = MSVFastHexStringFromBytes_hexCharacters_47995[(unint64_t)v55 >> 4];
          v56[1] = MSVFastHexStringFromBytes_hexCharacters_47995[v55 & 0xF];
        }
        v22 = objc_alloc(MEMORY[0x1E0CB3940]);
        v23 = v53;
        v24 = 64;
      }
      else
      {
        if (*(_QWORD *)v79 != 4512)
          goto LABEL_58;
        v29 = (unsigned __int8 *)v80 + 8;
        v30 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
        v31 = v30;
        for (j = 0; j != 128; j += 2)
        {
          v33 = *v29++;
          v34 = &v30[j];
          *v34 = MSVFastHexStringFromBytes_hexCharacters_47995[(unint64_t)v33 >> 4];
          v34[1] = MSVFastHexStringFromBytes_hexCharacters_47995[v33 & 0xF];
        }
        v22 = objc_alloc(MEMORY[0x1E0CB3940]);
        v23 = v31;
        v24 = 128;
      }
    }
    else if (*(_QWORD *)v79 == 4000)
    {
      v41 = (unsigned __int8 *)v80 + 8;
      v42 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
      v43 = v42;
      for (k = 0; k != 32; k += 2)
      {
        v45 = *v41++;
        v46 = &v42[k];
        *v46 = MSVFastHexStringFromBytes_hexCharacters_47995[(unint64_t)v45 >> 4];
        v46[1] = MSVFastHexStringFromBytes_hexCharacters_47995[v45 & 0xF];
      }
      v22 = objc_alloc(MEMORY[0x1E0CB3940]);
      v23 = v43;
      v24 = 32;
    }
    else
    {
      if (*(_QWORD *)v79 != 4001)
        goto LABEL_58;
      v16 = (unsigned __int8 *)v80 + 8;
      v17 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
      v18 = v17;
      for (m = 0; m != 40; m += 2)
      {
        v20 = *v16++;
        v21 = &v17[m];
        *v21 = MSVFastHexStringFromBytes_hexCharacters_47995[(unint64_t)v20 >> 4];
        v21[1] = MSVFastHexStringFromBytes_hexCharacters_47995[v20 & 0xF];
      }
      v22 = objc_alloc(MEMORY[0x1E0CB3940]);
      v23 = v18;
      v24 = 40;
    }
LABEL_47:
    v40 = (CFStringRef)objc_msgSend(v22, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v23, v24, 4, 1);
    goto LABEL_48;
  }
  if (*(uint64_t *)v79 > 2999)
  {
    if (*(_QWORD *)v79 == 3000)
    {
      LODWORD(v82[0]) = bswap32(DWORD2(v80[0]));
      v47 = (char *)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
      v48 = 0;
      v49 = v47 + 1;
      do
      {
        v50 = *((unsigned __int8 *)v82 + v48);
        *(v49 - 1) = MSVFastHexStringFromBytes_hexCharacters_47995[v50 >> 4];
        *v49 = MSVFastHexStringFromBytes_hexCharacters_47995[v50 & 0xF];
        v49 += 2;
        ++v48;
      }
      while (v48 != 4);
      v22 = objc_alloc(MEMORY[0x1E0CB3940]);
      v23 = v47;
      v24 = 8;
    }
    else
    {
      if (*(_QWORD *)v79 != 3001)
        goto LABEL_58;
      v82[0] = bswap64(*((unint64_t *)&v80[0] + 1));
      v25 = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x100004077774924uLL);
      v26 = 0;
      v27 = v25 + 1;
      do
      {
        v28 = *((unsigned __int8 *)v82 + v26);
        *(v27 - 1) = MSVFastHexStringFromBytes_hexCharacters_47995[v28 >> 4];
        *v27 = MSVFastHexStringFromBytes_hexCharacters_47995[v28 & 0xF];
        v27 += 2;
        ++v26;
      }
      while (v26 != 8);
      v22 = objc_alloc(MEMORY[0x1E0CB3940]);
      v23 = v25;
      v24 = 16;
    }
    goto LABEL_47;
  }
  if (*(_QWORD *)v79 == 1000)
  {
    v35 = *((_QWORD *)&v80[0] + 1);
    v36 = (char *)v83 + 1;
    quot = *((_QWORD *)&v80[0] + 1);
    do
    {
      v38 = lldiv(quot, 10);
      quot = v38.quot;
      if (v38.rem >= 0)
        LOBYTE(v39) = v38.rem;
      else
        v39 = -v38.rem;
      *(v36 - 2) = v39 + 48;
      v15 = (const UInt8 *)(v36 - 2);
      --v36;
    }
    while (v38.quot);
    if (v35 < 0)
    {
      *(v36 - 2) = 45;
      v15 = (const UInt8 *)(v36 - 2);
    }
    v14 = (char *)((char *)v83 - (char *)v15);
    goto LABEL_37;
  }
  if (*(_QWORD *)v79 != 2000)
  {
LABEL_58:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull _MSVHashGetDigest(MSVHash)");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "handleFailureInFunction:file:lineNumber:description:", v71, CFSTR("MSVHasher+Algorithms.h"), 356, CFSTR("Cannot obtain digest from unknown hasher algorithm"));

    v57 = &stru_1E3163D10;
    goto LABEL_49;
  }
  v10 = DWORD2(v80[0]);
  v11 = v83;
  do
  {
    v12 = ldiv(v10, 10);
    v10 = v12.quot;
    if (v12.rem >= 0)
      LOBYTE(v13) = v12.rem;
    else
      v13 = -v12.rem;
    *((_BYTE *)v11 - 1) = v13 + 48;
    v11 = (_QWORD *)((char *)v11 - 1);
  }
  while (v12.quot);
  v14 = (char *)((char *)v83 - (char *)v11);
  v15 = (const UInt8 *)v11;
LABEL_37:
  v40 = CFStringCreateWithBytes(0, v15, (CFIndex)v14, 0x8000100u, 0);
LABEL_48:
  v57 = (__CFString *)v40;
LABEL_49:

  objc_msgSend(v7, "importArtworkTokenForEntityPersistentID:entityType:artworkToken:artworkType:sourceType:", -[MPMediaPlaylist persistentID](self, "persistentID"), 1, v57, 5, 100);
  -[MPMediaEntity mediaLibrary](self, "mediaLibrary");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMediaPlaylist representativeItem](self, "representativeItem");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend(v58, "importOriginalArtworkFromImageData:withArtworkToken:artworkType:sourceType:mediaType:", v9, v57, 5, 100, objc_msgSend(v59, "mediaType"));

  if (v60)
  {
    v73 = v4;
    objc_msgSend(v7, "libraryDataProvider");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v62 = v9;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v61, "library");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v63 = 0;
    }
    objc_msgSend(v63, "notifyDisplayValuesPropertyDidChange");
    objc_msgSend(v7, "userIdentity");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPCloudController controllerWithUserIdentity:](MPCloudController, "controllerWithUserIdentity:", v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v65, "isCloudEnabled"))
      objc_msgSend(v65, "uploadArtworkForPlaylist:completionHandler:", self, 0);
    -[MPMediaPlaylist valueForProperty:](self, "valueForProperty:", CFSTR("coverArtworkRecipe"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(CFSTR("{\"version\":\"0.0\"}"), "isEqualToString:", v66) & 1) == 0)
    {
      v72 = v7;
      -[MPMediaItemCollection setValue:forProperty:](self, "setValue:forProperty:", CFSTR("{\"version\":\"0.0\"}"), CFSTR("coverArtworkRecipe"));
      -[MPMediaPlaylist valueForProperty:](self, "valueForProperty:", CFSTR("isCollaborative"));
      v67 = (void *)objc_claimAutoreleasedReturnValue();

      if (v67)
      {
        v68 = -[MPMediaPlaylist persistentID](self, "persistentID");
        v77 = CFSTR("coverArtworkRecipe");
        v78 = CFSTR("{\"version\":\"0.0\"}");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "editCollaborationWithPersistentID:properties:trackEdits:completion:", v68, v69, MEMORY[0x1E0C9AA60], &__block_literal_global_10432);
      }
      else
      {
        v75 = CFSTR("coverArtworkRecipe");
        v76 = CFSTR("{\"version\":\"0.0\"}");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "setPlaylistProperties:trackList:forPlaylistWithPersistentID:completionHandler:", v69, 0, -[MPMediaPlaylist persistentID](self, "persistentID"), &__block_literal_global_142);
      }

      v7 = v72;
    }

    v9 = v62;
    v4 = v73;
  }

LABEL_63:
}

- (void)removeArtworkWithSourceType:(int64_t)a3
{
  id v5;

  -[MPMediaEntity mediaLibrary](self, "mediaLibrary");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeArtworkForEntityPersistentID:entityType:artworkType:sourceType:", -[MPMediaPlaylist persistentID](self, "persistentID"), 1, 5, a3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seedTracksQuery, 0);
  objc_storeStrong((id *)&self->_representativeArtists, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)_isValidPlaylistProperty:(id)a3
{
  id v4;
  const __CFDictionary *v5;
  BOOL v6;

  v4 = a3;
  v5 = (const __CFDictionary *)__filterableDictionary;
  if (!__filterableDictionary)
  {
    objc_msgSend(a1, "_createFilterableDictionary");
    v5 = (const __CFDictionary *)__filterableDictionary;
  }
  v6 = CFDictionaryContainsKey(v5, (const void *)objc_msgSend(v4, "hash")) != 0;

  return v6;
}

- (id)artworkCatalog
{
  MPMediaLibraryArtworkRequest *v3;
  void *v4;
  MPMediaLibraryArtworkRequest *v5;
  MPArtworkCatalog *v6;
  void *v7;
  void *v8;
  MPArtworkCatalog *v9;
  void *v10;
  void *v11;
  MPArtworkCatalog *v12;

  v3 = [MPMediaLibraryArtworkRequest alloc];
  -[MPMediaEntity mediaLibrary](self, "mediaLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MPMediaLibraryArtworkRequest initWithLibrary:identifier:entityType:artworkType:](v3, "initWithLibrary:identifier:entityType:artworkType:", v4, -[MPMediaPlaylist persistentID](self, "persistentID"), 1, 5);

  v6 = [MPArtworkCatalog alloc];
  -[MPMediaEntity mediaLibrary](self, "mediaLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "artworkDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MPArtworkCatalog initWithToken:dataSource:](v6, "initWithToken:dataSource:", v5, v8);

  -[MPMediaEntity mediaLibrary](self, "mediaLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "artworkDataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v11, "areRepresentationsAvailableForCatalog:", v9);

  if ((_DWORD)v8)
    v12 = v9;
  else
    v12 = 0;

  return v12;
}

- (id)tiledArtworkCatalogWithRows:(unint64_t)a3 columns:(unint64_t)a4
{
  MPTiledArtworkRequest *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  MPArtworkCatalog *v12;
  void *v13;
  MPArtworkCatalog *v14;
  _QWORD v16[5];

  v7 = objc_alloc_init(MPTiledArtworkRequest);
  -[MPTiledArtworkRequest setNumberOfColumns:](v7, "setNumberOfColumns:", a3);
  -[MPTiledArtworkRequest setNumberOfRows:](v7, "setNumberOfRows:", a4);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __73__MPMediaPlaylist_MPArtworkCatalog__tiledArtworkCatalogWithRows_columns___block_invoke;
  v16[3] = &unk_1E315D988;
  v16[4] = self;
  -[MPTiledArtworkRequest setArtworkCatalogsBlock:](v7, "setArtworkCatalogsBlock:", v16);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MPMediaPlaylist persistentID](self, "persistentID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPTiledArtworkRequest setEntityIdentifier:](v7, "setEntityIdentifier:", v8);

  -[MPTiledArtworkRequest setNamespaceIdentifier:](v7, "setNamespaceIdentifier:", CFSTR("MPMediaPlaylist"));
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[MPMediaEntity mediaLibrary](self, "mediaLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "numberWithUnsignedLongLong:", objc_msgSend(v10, "currentEntityRevision"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPTiledArtworkRequest setRevisionIdentifier:](v7, "setRevisionIdentifier:", v11);

  v12 = [MPArtworkCatalog alloc];
  +[MPTiledArtworkDataSource sharedDataSource](MPTiledArtworkDataSource, "sharedDataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[MPArtworkCatalog initWithToken:dataSource:](v12, "initWithToken:dataSource:", v7, v13);

  return v14;
}

- (id)artworkCatalogsWithMaximumCount:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  unint64_t v18;

  if (!a3)
    return MEMORY[0x1E0C9AA60];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMediaItemCollection itemsQuery](self, "itemsQuery");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  +[MPMediaItem artworkCatalogCacheProperties](MPMediaItem, "artworkCatalogCacheProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setItemPropertiesToFetch:", v9);

  objc_msgSend(v8, "setShouldIncludeNonLibraryEntities:", 1);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __69__MPMediaPlaylist_MPArtworkCatalog__artworkCatalogsWithMaximumCount___block_invoke;
  v15[3] = &unk_1E315D9B0;
  v16 = v6;
  v10 = v5;
  v17 = v10;
  v18 = a3;
  v11 = v6;
  objc_msgSend(v8, "_enumerateItemsUsingBlock:", v15);
  v12 = v17;
  v13 = v10;

  return v13;
}

void __69__MPMediaPlaylist_MPArtworkCatalog__artworkCatalogsWithMaximumCount___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "artworkCatalog");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v7, "valueForProperty:", CFSTR("albumPID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v6) & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
    }

  }
  if (objc_msgSend(*(id *)(a1 + 40), "count") == *(_QWORD *)(a1 + 48))
    *a3 = 1;

}

uint64_t __73__MPMediaPlaylist_MPArtworkCatalog__tiledArtworkCatalogWithRows_columns___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "artworkCatalogsWithMaximumCount:", a2);
}

@end
