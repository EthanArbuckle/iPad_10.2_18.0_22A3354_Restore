@implementation MPConcreteMediaItem

- (BOOL)existsInLibrary
{
  return -[MPMediaLibrary itemExistsWithPersistentID:](self->_library, "itemExistsWithPersistentID:", self->_persistentID);
}

uint64_t __40__MPConcreteMediaItem_valueForProperty___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "objectForKey:", a1[4]);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return objc_msgSend(*(id *)(a1[5] + 40), "cacheValue:forProperty:persistValueInBackgroundBlock:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), a1[4], 0);
}

void __43__MPConcreteMediaItem_valuesForProperties___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "cachePropertyValues:forProperties:persistValueInBackgroundBlock:", v3, *(_QWORD *)(a1 + 40), 0);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = *(id *)(a1 + 40);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKey:", v9, (_QWORD)v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKey:", v10, v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

+ (id)concreteMediaItemWithPersistentID:(unint64_t)a3 library:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  unint64_t v13;

  v5 = a4;
  objc_msgSend(v5, "libraryDataProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "entityCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__MPConcreteMediaItem_concreteMediaItemWithPersistentID_library___block_invoke;
  v11[3] = &unk_1E3157580;
  v12 = v5;
  v13 = a3;
  v8 = v5;
  objc_msgSend(v7, "itemWithIdentifier:loadEntityBlock:", a3, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __65__MPConcreteMediaItem_concreteMediaItemWithPersistentID_library___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  v4 = -[MPConcreteMediaItem _initWithPersistentID:library:propertiesCache:]([MPConcreteMediaItem alloc], "_initWithPersistentID:library:propertiesCache:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), v3);

  return v4;
}

- (id)_initWithPersistentID:(unint64_t)a3 library:(id)a4 propertiesCache:(id)a5
{
  id v9;
  id v10;
  MPConcreteMediaItem *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *utilitySerialQueue;
  objc_super v16;

  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MPConcreteMediaItem;
  v11 = -[MPConcreteMediaItem init](&v16, sel_init);
  if (v11)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("com.apple.MediaPlayer.MPConcreteMediaItem.utilitySerialQueue", v12);
    utilitySerialQueue = v11->_utilitySerialQueue;
    v11->_utilitySerialQueue = (OS_dispatch_queue *)v13;

    v11->_persistentID = a3;
    objc_storeStrong((id *)&v11->_library, a4);
    objc_storeStrong((id *)&v11->_propertiesCache, a5);
    if (_initWithPersistentID_library_propertiesCache__onceToken != -1)
      dispatch_once(&_initWithPersistentID_library_propertiesCache__onceToken, &__block_literal_global_19591);
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

uint64_t __69__MPConcreteMediaItem__initWithPersistentID_library_propertiesCache___block_invoke()
{
  uint64_t result;

  __MPMediaItemPropertyArtworkHash = objc_msgSend(CFSTR("artwork"), "hash");
  result = objc_msgSend(CFSTR("playbackStoreID"), "hash");
  __MPMediaItemPropertyPlaybackStoreIDHash = result;
  return result;
}

- (id)valuesForProperties:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  id v15;
  _QWORD v17[5];
  id v18;
  uint64_t *v19;
  char v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__19541;
  v29 = __Block_byref_object_dispose__19542;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v30 = (id)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = v4;
  v6 = 0;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        v20 = 0;
        -[MPConcreteMediaItem _nonBatchableOrCachedValueForProperty:needsFetch:](self, "_nonBatchableOrCachedValueForProperty:needsFetch:", v10, &v20);
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v11;
        if (v20)
        {
          if (!v6)
          {
            objc_msgSend(MEMORY[0x1E0C99E20], "set");
            v6 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v6, "addObject:", v10);
        }
        else if (v11)
        {
          objc_msgSend((id)v26[5], "setObject:forKey:", v11, v10);
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v6, "count"))
  {
    -[MPMediaLibrary libraryDataProvider](self->_library, "libraryDataProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[MPConcreteMediaItem persistentID](self, "persistentID");
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __43__MPConcreteMediaItem_valuesForProperties___block_invoke;
    v17[3] = &unk_1E31575D0;
    v17[4] = self;
    v18 = v6;
    v19 = &v25;
    objc_msgSend(v13, "loadProperties:ofItemWithIdentifier:completionBlock:", v18, v14, v17);

  }
  v15 = (id)v26[5];
  _Block_object_dispose(&v25, 8);

  return v15;
}

- (id)valueForProperty:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  id v8;
  _QWORD v10[4];
  id v11;
  MPConcreteMediaItem *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  char v20;

  v4 = a3;
  v20 = 1;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__19541;
  v18 = __Block_byref_object_dispose__19542;
  -[MPConcreteMediaItem _nonBatchableOrCachedValueForProperty:needsFetch:](self, "_nonBatchableOrCachedValueForProperty:needsFetch:", v4, &v20);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    -[MPMediaLibrary libraryDataProvider](self->_library, "libraryDataProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[MPConcreteMediaItem persistentID](self, "persistentID");
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __40__MPConcreteMediaItem_valueForProperty___block_invoke;
    v10[3] = &unk_1E31575D0;
    v13 = &v14;
    v11 = v4;
    v12 = self;
    objc_msgSend(v5, "loadProperties:ofItemWithIdentifier:completionBlock:", v6, v7, v10);

    v8 = (id)v15[5];
  }
  else
  {
    v8 = (id)v15[5];
  }
  _Block_object_dispose(&v14, 8);

  return v8;
}

- (unint64_t)persistentID
{
  return self->_persistentID;
}

- (id)_nonBatchableOrCachedValueForProperty:(id)a3 needsFetch:(BOOL *)a4
{
  __CFString *v6;
  __CFString *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  MPConcreteMediaItemArtwork *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v18;

  v6 = (__CFString *)a3;
  v7 = v6;
  if (a4)
    *a4 = 0;
  if (!-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("persistentID")))
  {
    v18 = 0;
    -[MPConcreteMediaEntityPropertiesCache valueForProperty:isCached:](self->_propertiesCache, "valueForProperty:isCached:", v7, &v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v18)
    {
      v8 = v9;
LABEL_23:

      goto LABEL_24;
    }
    if (v7 == CFSTR("artwork")
      || (v11 = -[__CFString hash](v7, "hash"), v11 == __MPMediaItemPropertyArtworkHash)
      && -[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("artwork")))
    {
      -[MPMediaItem artworkCatalog](self, "artworkCatalog");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = -[MPConcreteMediaItemArtwork initWithArtworkCatalog:]([MPConcreteMediaItemArtwork alloc], "initWithArtworkCatalog:", v12);
LABEL_17:
        v8 = v13;
LABEL_19:

        goto LABEL_23;
      }
    }
    else
    {
      if (v7 != CFSTR("playbackStoreID"))
      {
        v14 = -[__CFString hash](v7, "hash");
        if (v14 != __MPMediaItemPropertyPlaybackStoreIDHash
          || !-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("playbackStoreID")))
        {
          if (a4)
          {
            -[MPMediaLibrary libraryDataProvider](self->_library, "libraryDataProvider");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *a4 = v16 != 0;

          }
          v8 = 0;
          goto LABEL_23;
        }
      }
      -[MPConcreteMediaItem valueForProperty:](self, "valueForProperty:", CFSTR("subscriptionStoreItemAdamID"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v15;
      if (v15)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), objc_msgSend(v15, "longLongValue"));
        v13 = (MPConcreteMediaItemArtwork *)objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      }
    }
    v8 = 0;
    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_persistentID);
  v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_24:

  return v8;
}

- (id)mediaLibrary
{
  return self->_library;
}

- (id)cachedValueForProperty:(id)a3 isCached:(BOOL *)a4
{
  return -[MPConcreteMediaEntityPropertiesCache valueForProperty:isCached:](self->_propertiesCache, "valueForProperty:isCached:", a3, a4);
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  unint64_t v5;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) != 0)
  {
    objc_msgSend(v4, "encodeInt64:forKey:", -[MPConcreteMediaItem persistentID](self, "persistentID"), CFSTR("MPPersistentID"));
    objc_msgSend(v4, "encodeObject:forKey:", self->_library, CFSTR("MPLibrary"));

  }
  else
  {
    v5 = -[MPConcreteMediaItem persistentID](self, "persistentID");
    objc_msgSend(v4, "encodeValueOfObjCType:at:", "Q", &v5);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utilitySerialQueue, 0);
  objc_storeStrong((id *)&self->_propertiesCache, 0);
  objc_storeStrong((id *)&self->_library, 0);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[MPMediaLibrary libraryDataProvider](self->_library, "libraryDataProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "entityCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeEntityWithIdentifier:dataProviderEntityClass:", self->_persistentID, -[MPConcreteMediaEntityPropertiesCache dataProviderEntityClass](self->_propertiesCache, "dataProviderEntityClass"));

  v5.receiver = self;
  v5.super_class = (Class)MPConcreteMediaItem;
  -[MPConcreteMediaItem dealloc](&v5, sel_dealloc);
}

- (MPConcreteMediaItem)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("MPConcreteMediaItemInitException"), CFSTR("-init is not supported, use -initWithPersistentID:library:"));

  return 0;
}

- (MPConcreteMediaItem)initWithPersistentID:(unint64_t)a3
{
  MPConcreteMediaItem *v4;

  +[MPConcreteMediaItem concreteMediaItemWithPersistentID:](MPConcreteMediaItem, "concreteMediaItemWithPersistentID:", a3);
  v4 = (MPConcreteMediaItem *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (MPConcreteMediaItem)initWithPersistentID:(unint64_t)a3 library:(id)a4
{
  MPConcreteMediaItem *v5;

  +[MPConcreteMediaItem concreteMediaItemWithPersistentID:library:](MPConcreteMediaItem, "concreteMediaItemWithPersistentID:library:", a3, a4);
  v5 = (MPConcreteMediaItem *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (MPConcreteMediaEntityPropertiesCache)cachedPropertyValues
{
  return self->_propertiesCache;
}

- (void)invalidateCachedProperties
{
  -[MPConcreteMediaEntityPropertiesCache invalidate](self->_propertiesCache, "invalidate");
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MPConcreteMediaItem;
  -[MPConcreteMediaItem description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" %llu"), self->_persistentID);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (MPConcreteMediaItem)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  MPConcreteMediaItem *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPLibrary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    +[MPConcreteMediaItem concreteMediaItemWithPersistentID:library:](MPConcreteMediaItem, "concreteMediaItemWithPersistentID:library:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("MPPersistentID")), v5);
    v6 = (MPConcreteMediaItem *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_tokenBinaryIdentifierAsString
{
  void *v2;
  unint64_t persistentID;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0D512C8];
  persistentID = self->_persistentID;
  -[MPMediaLibrary ml3Library](self->_library, "ml3Library");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "libraryUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForEntityWithPersistentID:libraryUID:", persistentID, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)setValue:(id)a3 forProperty:(id)a4
{
  id v6;
  id v7;
  dispatch_semaphore_t v8;
  NSObject *v9;
  _QWORD v11[4];
  NSObject *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v6 = a3;
  v7 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v8 = dispatch_semaphore_create(0);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __44__MPConcreteMediaItem_setValue_forProperty___block_invoke;
  v11[3] = &unk_1E3157760;
  v9 = v8;
  v12 = v9;
  v13 = &v14;
  -[MPConcreteMediaItem setValue:forProperty:withCompletionBlock:](self, "setValue:forProperty:withCompletionBlock:", v6, v7, v11);
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(self) = *((_BYTE *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return (char)self;
}

- (void)setValue:(id)a3 forProperty:(id)a4 withCompletionBlock:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, _QWORD);
  void *v11;
  char v12;
  void *v13;
  char v14;
  unint64_t v15;
  void *v16;
  id v17;
  void (**v18)(id, uint64_t, _QWORD);
  void (**v19)(_QWORD, _QWORD, _QWORD);
  MPConcreteMediaEntityPropertiesCache *propertiesCache;
  MPConcreteMediaEntityPropertiesCache *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  unint64_t v25;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, _QWORD))a5;
  -[MPMediaLibrary libraryDataProvider](self->_library, "libraryDataProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    if (-[MPMediaLibrary isDeviceLibrary](self->_library, "isDeviceLibrary"))
    {
      -[MPConcreteMediaItem valueForProperty:](self, "valueForProperty:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqual:", v8);

      if ((v14 & 1) != 0)
      {
        if (v10)
          v10[2](v10, 1, 0);
        goto LABEL_17;
      }
    }
    v15 = -[MPConcreteMediaItem persistentID](self, "persistentID");
    -[MPMediaLibrary libraryDataProvider](self->_library, "libraryDataProvider");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __64__MPConcreteMediaItem_setValue_forProperty_withCompletionBlock___block_invoke;
    v22[3] = &unk_1E31575F8;
    v17 = v16;
    v23 = v17;
    v25 = v15;
    v18 = v10;
    v24 = v18;
    v19 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x19403A810](v22);
    if (v18 && -[MPMediaLibrary isCurrentThreadInTransaction](self->_library, "isCurrentThreadInTransaction"))
    {
      propertiesCache = self->_propertiesCache;
      if (propertiesCache)
        -[MPConcreteMediaEntityPropertiesCache cacheValue:forProperty:persistValueInBackgroundBlock:](propertiesCache, "cacheValue:forProperty:persistValueInBackgroundBlock:", v8, v9, 0);
    }
    else
    {
      v21 = self->_propertiesCache;
      if (v21)
      {
        -[MPConcreteMediaEntityPropertiesCache cacheValue:forProperty:persistValueInBackgroundBlock:](v21, "cacheValue:forProperty:persistValueInBackgroundBlock:", v8, v9, v19);
LABEL_16:

        goto LABEL_17;
      }
    }
    ((void (**)(_QWORD, id, id))v19)[2](v19, v8, v9);
    goto LABEL_16;
  }
  if (v10)
    v10[2](v10, 0, 0);
LABEL_17:

}

- (void)enumerateValuesForProperties:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  unint64_t v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v9 = MEMORY[0x1E0C809B0];
  v36 = 0;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __63__MPConcreteMediaItem_enumerateValuesForProperties_usingBlock___block_invoke;
  v29[3] = &unk_1E3157620;
  v29[4] = self;
  v10 = v8;
  v30 = v10;
  v11 = v7;
  v31 = v11;
  v32 = &v33;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v29);
  if (!*((_BYTE *)v34 + 24) && objc_msgSend(v10, "count"))
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__19541;
    v27 = __Block_byref_object_dispose__19542;
    v28 = 0;
    -[MPMediaLibrary libraryDataProvider](self->_library, "libraryDataProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[MPConcreteMediaItem persistentID](self, "persistentID");
    v20[0] = v9;
    v20[1] = 3221225472;
    v20[2] = __63__MPConcreteMediaItem_enumerateValuesForProperties_usingBlock___block_invoke_2;
    v20[3] = &unk_1E31575D0;
    v20[4] = self;
    v14 = v10;
    v21 = v14;
    v22 = &v23;
    objc_msgSend(v12, "loadProperties:ofItemWithIdentifier:completionBlock:", v14, v13, v20);

    v15 = (id)v24[5];
    v17[0] = v9;
    v17[1] = 3221225472;
    v17[2] = __63__MPConcreteMediaItem_enumerateValuesForProperties_usingBlock___block_invoke_3;
    v17[3] = &unk_1E3157648;
    v19 = v11;
    v16 = v15;
    v18 = v16;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v17);

    _Block_object_dispose(&v23, 8);
  }

  _Block_object_dispose(&v33, 8);
}

- (void)incrementPlayCount
{
  MPMediaLibrary *library;
  _QWORD v3[5];

  library = self->_library;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__MPConcreteMediaItem_incrementPlayCount__block_invoke;
  v3[3] = &unk_1E3157FA8;
  v3[4] = self;
  -[MPMediaLibrary performTransactionWithBlock:](library, "performTransactionWithBlock:", v3);
}

uint64_t __41__MPConcreteMediaItem_incrementPlayCount__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "setPlayCount:", objc_msgSend(*(id *)(a1 + 32), "playCount") + 1);
  objc_msgSend(*(id *)(a1 + 32), "setPlayCountSinceSync:", objc_msgSend(*(id *)(a1 + 32), "playCountSinceSync") + 1);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setLastPlayedDate:", v2);

  return 1;
}

void __63__MPConcreteMediaItem_enumerateValuesForProperties_usingBlock___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  id v6;
  void *v7;
  char v8;

  v8 = 1;
  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "_nonBatchableOrCachedValueForProperty:needsFetch:", v6, &v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *a3;
}

void __63__MPConcreteMediaItem_enumerateValuesForProperties_usingBlock___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  objc_msgSend(*(id *)(a1[4] + 40), "cachePropertyValues:forProperties:persistValueInBackgroundBlock:", v3, a1[5], 0);
  v4 = *(_QWORD *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __63__MPConcreteMediaItem_enumerateValuesForProperties_usingBlock___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = a2;
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id, uint64_t))(v4 + 16))(v4, v6, v7, a3);

}

uint64_t __64__MPConcreteMediaItem_setValue_forProperty_withCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forProperty:ofItemWithIdentifier:completionBlock:", a2, a3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

intptr_t __44__MPConcreteMediaItem_setValue_forProperty___block_invoke(uint64_t a1, char a2)
{
  intptr_t result;

  result = dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return result;
}

+ (id)concreteMediaItemWithPersistentID:(unint64_t)a3
{
  void *v4;
  void *v5;

  +[MPMediaLibrary defaultMediaLibrary](MPMediaLibrary, "defaultMediaLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPConcreteMediaItem concreteMediaItemWithPersistentID:library:](MPConcreteMediaItem, "concreteMediaItemWithPersistentID:library:", a3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)createUncachedConcreteMediaItemWithPersistentID:(unint64_t)a3 library:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = -[MPConcreteMediaItem _initWithPersistentID:library:propertiesCache:]([MPConcreteMediaItem alloc], "_initWithPersistentID:library:propertiesCache:", a3, v5, 0);

  return v6;
}

@end
