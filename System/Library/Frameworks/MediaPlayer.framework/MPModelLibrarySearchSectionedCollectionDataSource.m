@implementation MPModelLibrarySearchSectionedCollectionDataSource

- (MPModelLibrarySearchSectionedCollectionDataSource)initWithEntitiesQueryResultContainers:(id)a3 libraryObjectDatabase:(id)a4
{
  id v6;
  id v7;
  MPModelLibrarySearchSectionedCollectionDataSource *v8;
  uint64_t v9;
  NSArray *resultContainers;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MPModelLibrarySearchSectionedCollectionDataSource;
  v8 = -[MPModelLibrarySearchSectionedCollectionDataSource init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    resultContainers = v8->_resultContainers;
    v8->_resultContainers = (NSArray *)v9;

    objc_storeStrong((id *)&v8->_lod, a4);
  }

  return v8;
}

- (unint64_t)numberOfSections
{
  return -[NSArray count](self->_resultContainers, "count");
}

- (id)sectionAtIndex:(unint64_t)a3
{
  void *v3;
  void *v4;

  -[NSArray objectAtIndex:](self->_resultContainers, "objectAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scope");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)numberOfItemsInSection:(unint64_t)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  mlcore::EntityQueryResult *v12;
  mlcore::EntityQueryResult *v13;
  std::__shared_weak_count *v14;

  -[NSArray objectAtIndex:](self->_resultContainers, "objectAtIndex:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "entityQueryResult");
  }
  else
  {
    v12 = 0;
    v14 = 0;
  }
  if (-[MPModelLibrarySearchRequest maximumResultsPerScope](self->_request, "maximumResultsPerScope", v12) < 1
    || (v6 = -[MPModelLibrarySearchRequest maximumResultsPerScope](self->_request, "maximumResultsPerScope"),
        v6 >= mlcore::EntityQueryResult::entityCount(v13)))
  {
    v7 = mlcore::EntityQueryResult::entityCount(v13);
  }
  else
  {
    v7 = -[MPModelLibrarySearchRequest maximumResultsPerScope](self->_request, "maximumResultsPerScope");
  }
  v8 = v7;
  if (v14)
  {
    p_shared_owners = (unint64_t *)&v14->__shared_owners_;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }

  return v8;
}

- (id)itemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  mlcore::EntityQueryResult *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  unint64_t *v19;
  unint64_t v20;
  mlcore::EntityQueryResult *v22;
  std::__shared_weak_count *v23;
  mlcore::Entity *v24;
  std::__shared_weak_count *v25;

  v4 = a3;
  -[NSArray objectAtIndex:](self->_resultContainers, "objectAtIndex:", objc_msgSend(v4, "section"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "entityQueryResult");
    v7 = v22;
  }
  else
  {
    v7 = 0;
    v22 = 0;
    v23 = 0;
  }
  objc_msgSend(v4, "item", v22);
  mlcore::EntityQueryResult::entityAtIndex(v7);
  +[MPMediaLibrary logDatabaseAccess](MPMediaLibrary, "logDatabaseAccess");
  if (v24)
  {
    objc_msgSend(v6, "scope");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "itemKind");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPMediaLibraryEntityTranslator translatorForMPModelClass:](MPMediaLibraryEntityTranslator, "translatorForMPModelClass:", objc_msgSend(v9, "modelClass"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "scope");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "itemProperties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (*(uint64_t (**)())(*(_QWORD *)v24 + 48))();
    v14 = mlcore::Entity::propertyCache(v24);
    objc_msgSend(v6, "entityTranslationContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForPropertySet:entityClass:propertyCache:context:", v12, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }
  if (v25)
  {
    p_shared_owners = (unint64_t *)&v25->__shared_owners_;
    do
      v18 = __ldaxr(p_shared_owners);
    while (__stlxr(v18 - 1, p_shared_owners));
    if (!v18)
    {
      ((void (*)())v25->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v25);
    }
  }
  if (v23)
  {
    v19 = (unint64_t *)&v23->__shared_owners_;
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
    }
  }

  return v16;
}

- (id)identifiersForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  mlcore::EntityQueryResult *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  MPIdentifierSet *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  MPIdentifierSet *v17;
  uint64_t v18;
  __CFString *v19;
  __CFString **v20;
  MPPropertySet *v21;
  void *v22;
  void *v23;
  MPPropertySet *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  unint64_t *p_shared_owners;
  unint64_t v30;
  unint64_t *v31;
  unint64_t v32;
  mlcore::EntityQueryResult *v34;
  mlcore::EntityQueryResult *v35;
  std::__shared_weak_count *v36;
  uint64_t v37;
  std::__shared_weak_count *v38;
  _QWORD v39[4];
  id v40;
  uint64_t v41;
  __CFString *v42;
  _QWORD v43[3];

  v43[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSArray objectAtIndex:](self->_resultContainers, "objectAtIndex:", objc_msgSend(v4, "section"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "entityQueryResult");
    v7 = v34;
  }
  else
  {
    v7 = 0;
    v34 = 0;
    v36 = 0;
  }
  objc_msgSend(v4, "item", v34);
  v8 = mlcore::EntityQueryResult::persistentIDAtIndex(v7);
  objc_msgSend(v6, "entityTranslationContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mediaLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = [MPIdentifierSet alloc];
  objc_msgSend(CFSTR("LibrarySearch-"), "stringByAppendingString:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scope");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "itemKind");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __83__MPModelLibrarySearchSectionedCollectionDataSource_identifiersForItemAtIndexPath___block_invoke;
  v39[3] = &unk_1E315F6D0;
  v16 = v11;
  v40 = v16;
  v41 = v8;
  v17 = -[MPIdentifierSet initWithSource:modelKind:block:](v12, "initWithSource:modelKind:block:", v13, v15, v39);

  objc_msgSend(v4, "item");
  mlcore::EntityQueryResult::idEntityAtIndex(v35);
  v18 = (*(uint64_t (**)())(*(_QWORD *)v37 + 48))();
  if (MEMORY[0x194039EC8]() == v18)
  {
    v20 = MPModelRelationshipGenericSong;
  }
  else if (MEMORY[0x194039F1C]() == v18)
  {
    v20 = MPModelRelationshipGenericAlbum;
  }
  else if (MEMORY[0x194039F64]() == v18)
  {
    v20 = MPModelRelationshipGenericArtist;
  }
  else if (MEMORY[0x194039FE8]() == v18)
  {
    v20 = MPModelRelationshipGenericPlaylist;
  }
  else if (MEMORY[0x194038ED8]() == v18)
  {
    v20 = MPModelRelationshipGenericPlaylistEntry;
  }
  else if (MEMORY[0x19403A00C]() == v18)
  {
    v20 = MPModelRelationshipGenericTVEpisode;
  }
  else if (MEMORY[0x19403A000]() == v18)
  {
    v20 = MPModelRelationshipGenericTVSeason;
  }
  else if (MEMORY[0x194039F94]() == v18)
  {
    v20 = MPModelRelationshipGenericTVShow;
  }
  else if (MEMORY[0x194039F40]() == v18)
  {
    v20 = MPModelRelationshipGenericMovie;
  }
  else if (MEMORY[0x194039FB8]() == v18)
  {
    v20 = MPModelRelationshipGenericPodcast;
  }
  else if (MEMORY[0x194038F20]() == v18)
  {
    v20 = MPModelRelationshipGenericPodcastEpisode;
  }
  else if (MEMORY[0x194039FD0]() == v18)
  {
    v20 = MPModelRelationshipGenericComposer;
  }
  else
  {
    if (MEMORY[0x194039F28]() != v18)
    {
      v19 = 0;
      goto LABEL_32;
    }
    v20 = &MPModelRelationshipGenericGenre;
  }
  v19 = *v20;
LABEL_32:
  v21 = [MPPropertySet alloc];
  v42 = v19;
  +[MPPropertySet emptyPropertySet](MPPropertySet, "emptyPropertySet");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, &v42, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[MPPropertySet initWithProperties:relationships:](v21, "initWithProperties:relationships:", MEMORY[0x1E0C9AA60], v23);

  -[MPLibraryObjectDatabase identifiersMatchingIdentifierSet:propertySet:options:error:](self->_lod, "identifiersMatchingIdentifierSet:propertySet:options:error:", v17, v24, 0, 0);
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)v25;
  if (v25)
    v27 = (void *)v25;
  else
    v27 = v17;
  v28 = v27;

  if (v38)
  {
    p_shared_owners = (unint64_t *)&v38->__shared_owners_;
    do
      v30 = __ldaxr(p_shared_owners);
    while (__stlxr(v30 - 1, p_shared_owners));
    if (!v30)
    {
      ((void (*)())v38->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v38);
    }
  }

  if (v36)
  {
    v31 = (unint64_t *)&v36->__shared_owners_;
    do
      v32 = __ldaxr(v31);
    while (__stlxr(v32 - 1, v31));
    if (!v32)
    {
      ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
      std::__shared_weak_count::__release_weak(v36);
    }
  }

  return v28;
}

- (BOOL)hasMoreResultsForSectionAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  mlcore::EntityQueryResult *v12;
  mlcore::EntityQueryResult *v13;
  std::__shared_weak_count *v14;

  -[NSArray objectAtIndex:](self->_resultContainers, "objectAtIndex:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "entityQueryResult");
  }
  else
  {
    v12 = 0;
    v14 = 0;
  }
  v7 = -[MPModelLibrarySearchSectionedCollectionDataSource numberOfItemsInSection:](self, "numberOfItemsInSection:", a3, v12);
  v8 = mlcore::EntityQueryResult::entityCount(v13);
  if (v14)
  {
    p_shared_owners = (unint64_t *)&v14->__shared_owners_;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }

  return v7 < v8;
}

- (int64_t)searchWeightForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  mlcore::EntityQueryResult *v7;
  ModelPropertyBase *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  int8x8_t *v11;
  void *v12;
  int64_t v13;
  unint64_t *v14;
  unint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  unint64_t *v18;
  unint64_t v19;
  mlcore::Entity *v21;
  std::__shared_weak_count *v22;
  mlcore::EntityQueryResult *v23;
  std::__shared_weak_count *v24;

  v4 = a3;
  -[NSArray objectAtIndex:](self->_resultContainers, "objectAtIndex:", objc_msgSend(v4, "section"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "entityQueryResult");
    v7 = v23;
  }
  else
  {
    v7 = 0;
    v24 = 0;
  }
  objc_msgSend(v4, "item");
  mlcore::EntityQueryResult::entityAtIndex(v7);
  v8 = (ModelPropertyBase *)mlcore::LocalizedSearchPropertyWeight((mlcore *)+[MPMediaLibrary logDatabaseAccess](MPMediaLibrary, "logDatabaseAccess"));
  if (v22)
  {
    p_shared_owners = (unint64_t *)&v22->__shared_owners_;
    do
      v10 = __ldxr(p_shared_owners);
    while (__stxr(v10 + 1, p_shared_owners));
  }
  v11 = (int8x8_t *)mlcore::Entity::propertyCache(v21);
  MPMediaLibraryPropertyCacheValueForProperty(v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "integerValue", v21, v22);

  if (v22)
  {
    v14 = (unint64_t *)&v22->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)())v22->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v22);
    }
  }
  if (v22)
  {
    v16 = (unint64_t *)&v22->__shared_owners_;
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)())v22->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v22);
    }
  }
  if (v24)
  {
    v18 = (unint64_t *)&v24->__shared_owners_;
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }

  return v13;
}

- (NSArray)resultContainers
{
  return self->_resultContainers;
}

- (MPModelLibrarySearchRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_resultContainers, 0);
  objc_storeStrong((id *)&self->_lod, 0);
}

uint64_t __83__MPModelLibrarySearchSectionedCollectionDataSource_identifiersForItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __83__MPModelLibrarySearchSectionedCollectionDataSource_identifiersForItemAtIndexPath___block_invoke_2;
  v4[3] = &__block_descriptor_40_e44_v16__0___MPMutableLocalLibraryIdentifiers__8l;
  v2 = *(_QWORD *)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(a2, "setLibraryIdentifiersWithDatabaseID:block:", v2, v4);
}

uint64_t __83__MPModelLibrarySearchSectionedCollectionDataSource_identifiersForItemAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPersistentID:", *(_QWORD *)(a1 + 32));
}

@end
