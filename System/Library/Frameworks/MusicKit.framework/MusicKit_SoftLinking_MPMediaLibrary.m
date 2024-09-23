@implementation MusicKit_SoftLinking_MPMediaLibrary

+ (NSString)libraryDynamicPropertiesDidChangeNotificationName
{
  return (NSString *)CFSTR("MusicKit_SoftLinking_MPMediaLibraryDynamicPropertiesDidChangeNotification");
}

+ (NSString)libraryDidChangeNotificationName
{
  return (NSString *)CFSTR("MusicKit_SoftLinking_MPMediaLibraryDidChangeNotification");
}

+ (MusicKit_SoftLinking_MPMediaLibrary)deviceLibrary
{
  if (deviceLibrary_sOnceToken[0] != -1)
    dispatch_once(deviceLibrary_sOnceToken, &__block_literal_global_6);
  return (MusicKit_SoftLinking_MPMediaLibrary *)(id)deviceLibrary_sDeviceMediaLibrary;
}

- (void)beginGeneratingLibraryChangeNotifications
{
  -[MPMediaLibrary beginGeneratingLibraryChangeNotifications](self->_underlyingMediaLibrary, "beginGeneratingLibraryChangeNotifications");
}

- (id)_initWithUnderlyingMediaLibrary:(id)a3
{
  id v5;
  MusicKit_SoftLinking_MPMediaLibrary *v6;
  MusicKit_SoftLinking_MPMediaLibrary *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSOperationQueue *v13;
  NSOperationQueue *operationQueue;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MusicKit_SoftLinking_MPMediaLibrary;
  v6 = -[MusicKit_SoftLinking_MPMediaLibrary init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_underlyingMediaLibrary, a3);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    getMPMediaLibraryDidChangeNotification();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel__handleLibraryDidChangeNotification_, v9, v7->_underlyingMediaLibrary);

    getMPMediaLibraryDynamicPropertiesDidChangeNotification();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel__handleLibraryDynamicPropertiesDidChangeNotification_, v10, v7->_underlyingMediaLibrary);

    getMPMediaLibraryConnectionProgressDidChange();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel__handleLibraryConnectionProgressDidChangeNotification_, v11, v7->_underlyingMediaLibrary);

    getMPMediaLibraryStatusDidChangeNotification();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel__handleLibraryStatusDidChangeNotification_, v12, v7->_underlyingMediaLibrary);

    v13 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    operationQueue = v7->_operationQueue;
    v7->_operationQueue = v13;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v7->_operationQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setName:](v7->_operationQueue, "setName:", CFSTR("com.apple.MusicKit.Library.operationQueue"));
    -[NSOperationQueue setQualityOfService:](v7->_operationQueue, "setQualityOfService:", 25);

  }
  return v7;
}

- (MPMediaLibrary)_underlyingMediaLibrary
{
  return self->_underlyingMediaLibrary;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  getMPMediaLibraryDidChangeNotification();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, v4, self->_underlyingMediaLibrary);

  getMPMediaLibraryDynamicPropertiesDidChangeNotification();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, v5, self->_underlyingMediaLibrary);

  getMPMediaLibraryConnectionProgressDidChange();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, v6, self->_underlyingMediaLibrary);

  getMPMediaLibraryStatusDidChangeNotification();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, v7, self->_underlyingMediaLibrary);

  v8.receiver = self;
  v8.super_class = (Class)MusicKit_SoftLinking_MPMediaLibrary;
  -[MusicKit_SoftLinking_MPMediaLibrary dealloc](&v8, sel_dealloc);
}

- (NSString)uniqueIdentifier
{
  return (NSString *)-[MPMediaLibrary uniqueIdentifier](self->_underlyingMediaLibrary, "uniqueIdentifier");
}

- (NSString)name
{
  return (NSString *)-[MPMediaLibrary name](self->_underlyingMediaLibrary, "name");
}

- (void)endGeneratingLibraryChangeNotifications
{
  -[MPMediaLibrary endGeneratingLibraryChangeNotifications](self->_underlyingMediaLibrary, "endGeneratingLibraryChangeNotifications");
}

- (void)performOperation:(id)a3
{
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", a3);
}

- (void)sdk_addItemToLibraryWithStoreID:(id)a3 completionHandler:(id)a4
{
  id v6;
  MPMediaLibrary *underlyingMediaLibrary;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  underlyingMediaLibrary = self->_underlyingMediaLibrary;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __89__MusicKit_SoftLinking_MPMediaLibrary_sdk_addItemToLibraryWithStoreID_completionHandler___block_invoke;
  v9[3] = &unk_24CD1D520;
  v10 = v6;
  v8 = v6;
  -[MPMediaLibrary addItemWithProductID:completionHandler:](underlyingMediaLibrary, "addItemWithProductID:completionHandler:", a3, v9);

}

- (int64_t)downloadSizeForModelObject:(id)a3 includingNonLibraryContent:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  id MPMediaPropertyPredicateClass;
  void *v15;
  void *v16;
  void *v17;
  _QWORD *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_class *v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id *v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  id *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  uint64_t v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  int64_t v61;
  _BOOL4 v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t v72;
  _QWORD v73[3];

  v63 = a4;
  v73[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(v5, "_underlyingModelObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "modelKind");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identityKind");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = 0;
  v70 = &v69;
  v71 = 0x2050000000;
  v10 = (void *)getMPModelAlbumKindClass_softClass;
  v72 = getMPModelAlbumKindClass_softClass;
  if (!getMPModelAlbumKindClass_softClass)
  {
    v64 = MEMORY[0x24BDAC760];
    v65 = 3221225472;
    v66 = (uint64_t)__getMPModelAlbumKindClass_block_invoke;
    v67 = &unk_24CD1CC68;
    v68 = &v69;
    __getMPModelAlbumKindClass_block_invoke((uint64_t)&v64);
    v10 = (void *)v70[3];
  }
  v11 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v69, 8);
  objc_msgSend(v11, "identityKind");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v9, "isEqual:", v12);

  if (v13)
  {
    MPMediaPropertyPredicateClass = getMPMediaPropertyPredicateClass();
    v15 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v7, "library");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "numberWithLongLong:", objc_msgSend(v16, "persistentID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = 0;
    v65 = (uint64_t)&v64;
    v66 = 0x2020000000;
    v18 = (_QWORD *)getMPMediaItemPropertyAlbumPersistentIDSymbolLoc_ptr;
    v67 = (void *)getMPMediaItemPropertyAlbumPersistentIDSymbolLoc_ptr;
    if (!getMPMediaItemPropertyAlbumPersistentIDSymbolLoc_ptr)
    {
      v19 = (void *)MediaPlayerLibrary_7();
      v18 = dlsym(v19, "MPMediaItemPropertyAlbumPersistentID");
      *(_QWORD *)(v65 + 24) = v18;
      getMPMediaItemPropertyAlbumPersistentIDSymbolLoc_ptr = (uint64_t)v18;
    }
    _Block_object_dispose(&v64, 8);
    if (!v18)
    {
LABEL_32:
      +[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:].cold.1();
      __break(1u);
    }
    objc_msgSend(MPMediaPropertyPredicateClass, "predicateWithValue:forProperty:", v17, *v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v69 = 0;
    v70 = &v69;
    v71 = 0x2050000000;
    v21 = (void *)getMPMediaQueryClass_softClass;
    v72 = getMPMediaQueryClass_softClass;
    if (!getMPMediaQueryClass_softClass)
    {
      v64 = MEMORY[0x24BDAC760];
      v65 = 3221225472;
      v66 = (uint64_t)__getMPMediaQueryClass_block_invoke;
      v67 = &unk_24CD1CC68;
      v68 = &v69;
      __getMPMediaQueryClass_block_invoke((uint64_t)&v64);
      v21 = (void *)v70[3];
    }
    v22 = objc_retainAutorelease(v21);
    _Block_object_dispose(&v69, 8);
    v23 = [v22 alloc];
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v20);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v23, "initWithFilterPredicates:", v24);
  }
  else
  {
    objc_msgSend(v7, "modelKind");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "identityKind");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = 0;
    v70 = &v69;
    v71 = 0x2050000000;
    v28 = (void *)getMPModelPlaylistKindClass_softClass_0;
    v72 = getMPModelPlaylistKindClass_softClass_0;
    if (!getMPModelPlaylistKindClass_softClass_0)
    {
      v64 = MEMORY[0x24BDAC760];
      v65 = 3221225472;
      v66 = (uint64_t)__getMPModelPlaylistKindClass_block_invoke_0;
      v67 = &unk_24CD1CC68;
      v68 = &v69;
      __getMPModelPlaylistKindClass_block_invoke_0((uint64_t)&v64);
      v28 = (void *)v70[3];
    }
    v29 = objc_retainAutorelease(v28);
    _Block_object_dispose(&v69, 8);
    objc_msgSend(v29, "identityKind");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v27, "isEqual:", v30);

    if (!v31)
    {
      v61 = 0;
      goto LABEL_31;
    }
    objc_msgSend(getMPMediaLibraryClass(), "defaultMediaLibrary");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "library");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "playlistWithPersistentID:", objc_msgSend(v33, "persistentID"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "itemsQuery");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "copy");
  }
  v34 = (void *)v25;

  objc_msgSend(v34, "setMediaLibrary:", self->_underlyingMediaLibrary);
  v69 = 0;
  v70 = &v69;
  v71 = 0x2050000000;
  v35 = (void *)getMPMediaCompoundAllPredicateClass_softClass;
  v72 = getMPMediaCompoundAllPredicateClass_softClass;
  if (!getMPMediaCompoundAllPredicateClass_softClass)
  {
    v64 = MEMORY[0x24BDAC760];
    v65 = 3221225472;
    v66 = (uint64_t)__getMPMediaCompoundAllPredicateClass_block_invoke;
    v67 = &unk_24CD1CC68;
    v68 = &v69;
    __getMPMediaCompoundAllPredicateClass_block_invoke((uint64_t)&v64);
    v35 = (void *)v70[3];
  }
  v36 = objc_retainAutorelease(v35);
  _Block_object_dispose(&v69, 8);
  v37 = getMPMediaPropertyPredicateClass();
  v64 = 0;
  v65 = (uint64_t)&v64;
  v66 = 0x2020000000;
  v38 = (id *)getMPMediaEntityPropertyKeepLocalSymbolLoc_ptr;
  v67 = (void *)getMPMediaEntityPropertyKeepLocalSymbolLoc_ptr;
  if (!getMPMediaEntityPropertyKeepLocalSymbolLoc_ptr)
  {
    v39 = (void *)MediaPlayerLibrary_7();
    v38 = (id *)dlsym(v39, "MPMediaEntityPropertyKeepLocal");
    *(_QWORD *)(v65 + 24) = v38;
    getMPMediaEntityPropertyKeepLocalSymbolLoc_ptr = (uint64_t)v38;
  }
  _Block_object_dispose(&v64, 8);
  if (!v38)
    goto LABEL_32;
  v40 = *v38;
  objc_msgSend(v37, "predicateWithValue:forProperty:comparisonType:", &unk_24CD38288, v40, 100);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v73[0] = v41;
  v42 = getMPMediaPropertyPredicateClass();
  v64 = 0;
  v65 = (uint64_t)&v64;
  v66 = 0x2020000000;
  v43 = (id *)getMPMediaEntityPropertyKeepLocalStatusSymbolLoc_ptr;
  v67 = (void *)getMPMediaEntityPropertyKeepLocalStatusSymbolLoc_ptr;
  if (!getMPMediaEntityPropertyKeepLocalStatusSymbolLoc_ptr)
  {
    v44 = (void *)MediaPlayerLibrary_7();
    v43 = (id *)dlsym(v44, "MPMediaEntityPropertyKeepLocalStatus");
    *(_QWORD *)(v65 + 24) = v43;
    getMPMediaEntityPropertyKeepLocalStatusSymbolLoc_ptr = (uint64_t)v43;
  }
  _Block_object_dispose(&v64, 8);
  if (!v43)
    goto LABEL_32;
  v45 = *v43;
  objc_msgSend(v42, "predicateWithValue:forProperty:comparisonType:", &unk_24CD382A0, v45, 100);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v73[1] = v46;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v73, 2);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "predicateMatchingPredicates:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  v49 = (void *)objc_msgSend(v34, "copy");
  objc_msgSend(v49, "addFilterPredicate:", v48);
  if (v63)
    objc_msgSend(v49, "setShouldIncludeNonLibraryEntities:", 1);
  v64 = 0;
  v65 = (uint64_t)&v64;
  v66 = 0x2020000000;
  v50 = (id *)getMPMediaQueryAggregateFunctionTotalSymbolLoc_ptr;
  v67 = (void *)getMPMediaQueryAggregateFunctionTotalSymbolLoc_ptr;
  if (!getMPMediaQueryAggregateFunctionTotalSymbolLoc_ptr)
  {
    v51 = (void *)MediaPlayerLibrary_7();
    v50 = (id *)dlsym(v51, "MPMediaQueryAggregateFunctionTotal");
    *(_QWORD *)(v65 + 24) = v50;
    getMPMediaQueryAggregateFunctionTotalSymbolLoc_ptr = (uint64_t)v50;
  }
  _Block_object_dispose(&v64, 8);
  if (!v50)
    goto LABEL_32;
  v52 = *v50;
  getMPMediaItemPropertyFileSize();
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "valueForAggregateFunction:onItemsForProperty:", v52, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  v55 = objc_msgSend(v54, "longLongValue");
  v56 = getMPMediaPropertyPredicateClass();
  getMPMediaItemPropertyFileSize();
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "predicateWithValue:forProperty:", &unk_24CD382B8, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  v59 = (void *)objc_msgSend(v34, "copy");
  objc_msgSend(v59, "addFilterPredicate:", v58);
  if (v63)
    objc_msgSend(v59, "setShouldIncludeNonLibraryEntities:", 1);
  v60 = objc_msgSend(v59, "_countOfItems");

  v61 = v55 + 7000000 * v60;
LABEL_31:

  return v61;
}

- (void)setUserRating:(double)a3 forItemWithPersistentID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  _Unwind_Exception *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v6 = a4;
  -[MPMediaLibrary itemWithPersistentID:](self->_underlyingMediaLibrary, "itemWithPersistentID:", objc_msgSend(v6, "integerValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3 * 5.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v9 = (_QWORD *)getMPMediaItemPropertyRatingSymbolLoc_ptr;
  v15 = getMPMediaItemPropertyRatingSymbolLoc_ptr;
  if (!getMPMediaItemPropertyRatingSymbolLoc_ptr)
  {
    v10 = (void *)MediaPlayerLibrary_7();
    v9 = dlsym(v10, "MPMediaItemPropertyRating");
    v13[3] = (uint64_t)v9;
    getMPMediaItemPropertyRatingSymbolLoc_ptr = (uint64_t)v9;
  }
  _Block_object_dispose(&v12, 8);
  if (!v9)
  {
    v11 = (_Unwind_Exception *)+[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:].cold.1();
    _Block_object_dispose(&v12, 8);
    _Unwind_Resume(v11);
  }
  objc_msgSend(v7, "setValue:forProperty:", v8, *v9, v12);

}

+ (void)beginDiscoveringMediaLibraries
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  getMPMediaLibraryAvailableMediaLibrariesDidChangeNotification();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", a1, sel__handleAvailableLibrariesDidChangeNotification_, v3, 0);

  objc_msgSend(getMPMediaLibraryClass(), "beginDiscoveringMediaLibraries");
}

+ (void)endDiscoveringMediaLibraries
{
  void *v3;
  id v4;

  objc_msgSend(getMPMediaLibraryClass(), "endDiscoveringMediaLibraries");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  getMPMediaLibraryAvailableMediaLibrariesDidChangeNotification();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", a1, v3, 0);

}

+ (NSArray)sharedLibraries
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(getMPMediaLibraryClass(), "sharedMediaLibraries", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithUnderlyingMediaLibrary:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8));
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v10;
}

- (int64_t)status
{
  int64_t result;

  result = -[MPMediaLibrary status](self->_underlyingMediaLibrary, "status");
  if ((unint64_t)(result - 1) >= 3)
    return 0;
  return result;
}

- (float)connectionProgress
{
  float result;

  -[MPMediaLibrary connectionProgress](self->_underlyingMediaLibrary, "connectionProgress");
  return result;
}

- (BOOL)isHomeSharingLibrary
{
  return -[MPMediaLibrary isHomeSharingLibrary](self->_underlyingMediaLibrary, "isHomeSharingLibrary");
}

- (void)connectWithCompletionHandler:(id)a3
{
  -[MPMediaLibrary connectWithCompletionHandler:](self->_underlyingMediaLibrary, "connectWithCompletionHandler:", a3);
}

- (void)disconnect
{
  -[MPMediaLibrary disconnect](self->_underlyingMediaLibrary, "disconnect");
}

+ (NSString)availableMediaLibrariesDidChangeNotificationName
{
  return (NSString *)CFSTR("MusicKit_SoftLinking_MPMediaLibraryAvailableMediaLibrariesDidChangeNotification");
}

+ (NSString)libraryConnectionProgressDidChangeNotificationName
{
  return (NSString *)CFSTR("MusicKit_SoftLinking_MPMediaLibraryConnectionProgressDidChangeNotification");
}

+ (NSString)libraryStatusDidChangeNotificationName
{
  return (NSString *)CFSTR("MusicKit_SoftLinking_MPMediaLibraryStatusDidChangeNotification");
}

- (void)_handleLibraryDidChangeNotification:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDD16D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("MusicKit_SoftLinking_MPMediaLibraryDidChangeNotification"), self, v6);
}

- (void)_handleLibraryDynamicPropertiesDidChangeNotification:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDD16D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("MusicKit_SoftLinking_MPMediaLibraryDynamicPropertiesDidChangeNotification"), self, v6);
}

+ (void)_handleAvailableLibrariesDidChangeNotification:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x24BDD16D0];
  v4 = a3;
  objc_msgSend(v3, "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("MusicKit_SoftLinking_MPMediaLibraryAvailableMediaLibrariesDidChangeNotification"), 0, v5);
}

- (void)_handleLibraryConnectionProgressDidChangeNotification:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDD16D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("MusicKit_SoftLinking_MPMediaLibraryConnectionProgressDidChangeNotification"), self, v6);
}

- (void)_handleLibraryStatusDidChangeNotification:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDD16D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("MusicKit_SoftLinking_MPMediaLibraryStatusDidChangeNotification"), self, v6);
}

- (unint64_t)hash
{
  return -[MPMediaLibrary hash](self->_underlyingMediaLibrary, "hash");
}

- (BOOL)isEqual:(id)a3
{
  MusicKit_SoftLinking_MPMediaLibrary *v4;
  MPMediaLibrary *underlyingMediaLibrary;
  void *v6;
  char v7;

  v4 = (MusicKit_SoftLinking_MPMediaLibrary *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      underlyingMediaLibrary = self->_underlyingMediaLibrary;
      -[MusicKit_SoftLinking_MPMediaLibrary _underlyingMediaLibrary](v4, "_underlyingMediaLibrary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[MPMediaLibrary isEqual:](underlyingMediaLibrary, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_underlyingMediaLibrary, 0);
}

@end
