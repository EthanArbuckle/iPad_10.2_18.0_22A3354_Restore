@implementation MPMediaQuery

- (MPMediaQuery)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  MPMediaQuery *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSArray *staticEntities;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPMediaLibrary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("MPFilterPredicates"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[MPMediaQuery initWithFilterPredicates:library:](self, "initWithFilterPredicates:library:", v9, v5);
  if (v10)
  {
    v10->_criteria->_groupingType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MPGroupingType"));
    v10->_criteria->_ignoreSystemFilterPredicates = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("MPIgnoreSystemFilterPredicates"));
    v10->_criteria->_ignoreRestrictionsPredicates = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("MPIgnoreRestrictionsPredicates"));
    v10->_criteria->_includeNonLibraryEntities = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("MPIncludeNonLibraryEntities"));
    v10->_criteria->_includeEntitiesWithBlankNames = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("MPIncludeEntitiesWithBlankNames"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("MPEntityOrder")))
    {
      v10->_criteria->_entityOrder = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MPEntityOrder"));
    }
    else
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MLEntityOrder"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("MLEntityOrderSorted"));
      v13 = 1;
      if (v12)
        v13 = 2;
      v10->_criteria->_entityOrder = v13;

    }
    v10->_isFilteringDisabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("MLIsFilteringDisabled"));
    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("MPStaticEntities"));
    v17 = objc_claimAutoreleasedReturnValue();
    staticEntities = v10->_staticEntities;
    v10->_staticEntities = (NSArray *)v17;

    v10->_staticEntityType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MPStaticEntityType"));
  }

  return v10;
}

- (MPMediaQuery)initWithFilterPredicates:(id)a3 library:(id)a4
{
  id v7;
  MPMediaQuery *v8;
  MPMediaQuery *v9;

  v7 = a4;
  v8 = -[MPMediaQuery initWithFilterPredicates:](self, "initWithFilterPredicates:", a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_mediaLibrary, a4);

  return v9;
}

uint64_t __35__MPMediaQuery_isFilteringDisabled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = __filteringDisabled;
  return result;
}

+ (id)tvShowsQuery
{
  MPMediaQuery *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  MPMediaQuery *v7;

  v2 = [MPMediaQuery alloc];
  v3 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 512);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", v4, CFSTR("mediaType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MPMediaQuery initWithFilterPredicates:](v2, "initWithFilterPredicates:", v6);

  return v7;
}

+ (id)homeVideosQuery
{
  MPMediaQuery *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  MPMediaQuery *v7;

  v2 = [MPMediaQuery alloc];
  v3 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0x2000);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", v4, CFSTR("mediaType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MPMediaQuery initWithFilterPredicates:](v2, "initWithFilterPredicates:", v6);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staticEntities, 0);
  objc_storeStrong((id *)&self->_criteria, 0);
  objc_storeStrong((id *)&self->_mediaLibrary, 0);
}

- (MPMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (id)predicateForProperty:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[MPMediaQuery filterPredicates](self, "filterPredicates", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v9, "property");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqualToString:", v4);

          if (v11)
          {
            v6 = v9;
            goto LABEL_12;
          }
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_12:

  return v6;
}

- (NSSet)filterPredicates
{
  return (NSSet *)(id)-[NSMutableSet copy](self->_criteria->_filterPredicates, "copy");
}

+ (BOOL)isFilteringDisabled
{
  char v2;
  _QWORD block[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  +[MPMediaQuery initFilteringDisabled](MPMediaQuery, "initFilteringDisabled");
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__MPMediaQuery_isFilteringDisabled__block_invoke;
  block[3] = &unk_1E31639A0;
  block[4] = &v5;
  dispatch_sync((dispatch_queue_t)__filteringDisabledQueue, block);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

+ (void)initFilteringDisabled
{
  if (initFilteringDisabled_onceToken != -1)
    dispatch_once(&initFilteringDisabled_onceToken, &__block_literal_global_11334);
}

- (id)copyWithZone:(_NSZone *)a3
{
  MPMediaQuery *v4;
  uint64_t v5;
  NSArray *staticEntities;

  v4 = -[MPMediaQuery initWithCriteria:library:](+[MPMediaQuery allocWithZone:](MPMediaQuery, "allocWithZone:", a3), "initWithCriteria:library:", self->_criteria, self->_mediaLibrary);
  v5 = -[NSArray copy](self->_staticEntities, "copy");
  staticEntities = v4->_staticEntities;
  v4->_staticEntities = (NSArray *)v5;

  v4->_staticEntityType = self->_staticEntityType;
  return v4;
}

- (void)setMediaLibrary:(id)a3
{
  MPMediaLibrary *v5;
  MPMediaLibrary **p_mediaLibrary;
  MPMediaLibrary *mediaLibrary;
  MPMediaLibrary *v8;

  v5 = (MPMediaLibrary *)a3;
  mediaLibrary = self->_mediaLibrary;
  p_mediaLibrary = &self->_mediaLibrary;
  if (mediaLibrary != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mediaLibrary, a3);
    v5 = v8;
  }

}

- (unint64_t)_countOfCollections
{
  if (self->_staticEntities && self->_staticEntityType == 1)
    return -[NSArray count](self->_staticEntities, "count");
  else
    return -[MPMediaLibrary _countOfCollectionsForQueryCriteria:](self->_mediaLibrary, "_countOfCollectionsForQueryCriteria:", self->_criteria);
}

- (unint64_t)_countOfItems
{
  NSArray *staticEntities;
  unint64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  staticEntities = self->_staticEntities;
  if (!staticEntities)
    return -[MPMediaLibrary _countOfItemsForQueryCriteria:](self->_mediaLibrary, "_countOfItemsForQueryCriteria:", self->_criteria);
  if (!self->_staticEntityType)
    return -[NSArray count](staticEntities, "count");
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __29__MPMediaQuery__countOfItems__block_invoke;
  v6[3] = &unk_1E3154F38;
  v6[4] = &v7;
  -[NSArray enumerateObjectsUsingBlock:](staticEntities, "enumerateObjectsUsingBlock:", v6);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

+ (id)movieRentalsQuery
{
  MPMediaQuery *v2;
  void *v3;
  void *v4;
  void *v5;
  MPMediaQuery *v6;
  void *v7;

  v2 = [MPMediaQuery alloc];
  v3 = (void *)MEMORY[0x1E0C99E60];
  +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", &unk_1E31E48A0, CFSTR("mediaType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MPMediaQuery initWithFilterPredicates:](v2, "initWithFilterPredicates:", v5);

  +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", MEMORY[0x1E0C9AAB0], CFSTR("isRental"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMediaQuery addFilterPredicate:](v6, "addFilterPredicate:", v7);

  return v6;
}

- (void)setIgnoreSystemFilterPredicates:(BOOL)a3
{
  self->_criteria->_ignoreSystemFilterPredicates = a3;
}

- (void)addFilterPredicate:(MPMediaPredicate *)predicate
{
  MPMediaPredicate *v4;
  MPMediaQueryCriteria *criteria;
  NSMutableSet *filterPredicates;
  MPMediaQueryCriteria *v7;
  MPMediaQueryCriteria *v8;
  NSObject *v9;
  uint64_t v10;
  MPMediaQueryCriteria *v11;
  NSMutableSet *v12;
  uint8_t buf[4];
  MPMediaQuery *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = predicate;
  if (v4)
  {
    criteria = self->_criteria;
    filterPredicates = criteria->_filterPredicates;
    v7 = (MPMediaQueryCriteria *)-[MPMediaQueryCriteria copy](criteria, "copy");
    v8 = self->_criteria;
    self->_criteria = v7;

    if (filterPredicates)
    {
      -[NSMutableSet addObject:](self->_criteria->_filterPredicates, "addObject:", v4);
    }
    else
    {
      v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:", v4, 0);
      v11 = self->_criteria;
      v12 = v11->_filterPredicates;
      v11->_filterPredicates = (NSMutableSet *)v10;

    }
  }
  else
  {
    v9 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = self;
      _os_log_impl(&dword_193B9B000, v9, OS_LOG_TYPE_ERROR, "attempt to *nil* filter predicate to query: %@", buf, 0xCu);
    }

  }
}

+ (MPMediaQuery)songsQuery
{
  MPMediaQuery *v2;
  void *v3;
  void *v4;
  void *v5;
  MPMediaQuery *v6;

  v2 = [MPMediaQuery alloc];
  v3 = (void *)MEMORY[0x1E0C99E60];
  +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", &unk_1E31E4870, CFSTR("mediaType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithObjects:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MPMediaQuery initWithFilterPredicates:](v2, "initWithFilterPredicates:", v5);

  -[MPMediaQuery setSortItems:](v6, "setSortItems:", 1);
  return v6;
}

- (void)setSortItems:(BOOL)a3
{
  unint64_t v4;
  MPMediaQueryCriteria *criteria;
  MPMediaQueryCriteria *v6;
  MPMediaQueryCriteria *v7;

  if (a3)
    v4 = 2;
  else
    v4 = 1;
  criteria = self->_criteria;
  if (criteria->_entityOrder != v4)
  {
    v6 = (MPMediaQueryCriteria *)-[MPMediaQueryCriteria copy](criteria, "copy");
    v7 = self->_criteria;
    self->_criteria = v6;

    self->_criteria->_entityOrder = v4;
  }
}

+ (id)albumArtistsQuery
{
  MPMediaQuery *v2;
  void *v3;
  void *v4;
  void *v5;
  MPMediaQuery *v6;

  v2 = [MPMediaQuery alloc];
  v3 = (void *)MEMORY[0x1E0C99E60];
  +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", &unk_1E31E4870, CFSTR("mediaType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MPMediaQuery initWithFilterPredicates:](v2, "initWithFilterPredicates:", v5);

  -[MPMediaQuery setGroupingType:](v6, "setGroupingType:", 3);
  return v6;
}

+ (MPMediaQuery)albumsQuery
{
  MPMediaQuery *v2;
  void *v3;
  void *v4;
  void *v5;
  MPMediaQuery *v6;

  v2 = [MPMediaQuery alloc];
  v3 = (void *)MEMORY[0x1E0C99E60];
  +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", &unk_1E31E4870, CFSTR("mediaType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithObjects:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MPMediaQuery initWithFilterPredicates:](v2, "initWithFilterPredicates:", v5);

  -[MPMediaQuery setGroupingType:](v6, "setGroupingType:", 1);
  return v6;
}

+ (MPMediaQuery)playlistsQuery
{
  MPMediaQuery *v2;

  v2 = objc_alloc_init(MPMediaQuery);
  -[MPMediaQuery setGroupingType:](v2, "setGroupingType:", 6);
  return v2;
}

+ (MPMediaQuery)audiobooksQuery
{
  MPMediaQuery *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  MPMediaQuery *v7;

  v2 = [MPMediaQuery alloc];
  v3 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", v4, CFSTR("mediaType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MPMediaQuery initWithFilterPredicates:](v2, "initWithFilterPredicates:", v6);

  -[MPMediaQuery setGroupingType:](v7, "setGroupingType:", 1);
  -[MPMediaQuery setShouldIncludeNonLibraryEntities:](v7, "setShouldIncludeNonLibraryEntities:", 1);
  return v7;
}

- (void)setGroupingType:(MPMediaGrouping)groupingType
{
  MPMediaQueryCriteria *criteria;
  MPMediaQueryCriteria *v6;
  MPMediaQueryCriteria *v7;
  unint64_t v8;

  criteria = self->_criteria;
  if (criteria->_groupingType != groupingType)
  {
    v6 = (MPMediaQueryCriteria *)-[MPMediaQueryCriteria copy](criteria, "copy");
    v7 = self->_criteria;
    self->_criteria = v6;

    self->_criteria->_groupingType = groupingType;
    v8 = 1;
    if (groupingType != MPMediaGroupingPlaylist)
      v8 = 2;
    self->_criteria->_entityOrder = v8;
  }
}

- (void)setShouldIncludeNonLibraryEntities:(BOOL)a3
{
  self->_criteria->_includeNonLibraryEntities = a3;
}

- (MPMediaQuery)init
{
  return -[MPMediaQuery initWithFilterPredicates:](self, "initWithFilterPredicates:", 0);
}

- (BOOL)_hasItems
{
  NSArray *staticEntities;
  BOOL v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  staticEntities = self->_staticEntities;
  if (!staticEntities)
    return -[MPMediaLibrary _hasItemsForQueryCriteria:](self->_mediaLibrary, "_hasItemsForQueryCriteria:", self->_criteria);
  if (!self->_staticEntityType)
    return -[NSArray count](staticEntities, "count") != 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __25__MPMediaQuery__hasItems__block_invoke;
  v6[3] = &unk_1E3154F38;
  v6[4] = &v7;
  -[NSArray enumerateObjectsUsingBlock:](staticEntities, "enumerateObjectsUsingBlock:", v6);
  v4 = *((_BYTE *)v8 + 24) != 0;
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)_hasCollections
{
  NSArray *staticEntities;

  staticEntities = self->_staticEntities;
  if (staticEntities && self->_staticEntityType == 1)
    return -[NSArray count](staticEntities, "count") != 0;
  else
    return -[MPMediaLibrary _hasCollectionsForQueryCriteria:](self->_mediaLibrary, "_hasCollectionsForQueryCriteria:", self->_criteria);
}

- (MPMediaQuery)initWithCriteria:(id)a3 library:(id)a4
{
  id v6;
  id v7;
  MPMediaQuery *v8;
  MPMediaQuery *v9;
  uint64_t v10;
  MPMediaQueryCriteria *criteria;

  v6 = a3;
  v7 = a4;
  v8 = -[MPMediaQuery initWithFilterPredicates:](self, "initWithFilterPredicates:", 0);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_mediaLibrary, a4);
    v10 = objc_msgSend(v6, "copy");
    criteria = v9->_criteria;
    v9->_criteria = (MPMediaQueryCriteria *)v10;

  }
  return v9;
}

- (MPMediaQuery)initWithFilterPredicates:(NSSet *)filterPredicates
{
  NSSet *v4;
  MPMediaQuery *v5;
  uint64_t v6;
  MPMediaLibrary *mediaLibrary;
  MPMediaQueryCriteria *v8;
  MPMediaQueryCriteria *v9;
  MPMediaQueryCriteria *criteria;
  objc_super v12;

  v4 = filterPredicates;
  v12.receiver = self;
  v12.super_class = (Class)MPMediaQuery;
  v5 = -[MPMediaQuery init](&v12, sel_init);
  if (v5)
  {
    +[MPMediaLibrary defaultMediaLibrary](MPMediaLibrary, "defaultMediaLibrary");
    v6 = objc_claimAutoreleasedReturnValue();
    mediaLibrary = v5->_mediaLibrary;
    v5->_mediaLibrary = (MPMediaLibrary *)v6;

    v5->_isFilteringDisabled = -1;
    v8 = objc_alloc_init(MPMediaQueryCriteria);
    v9 = v8;
    if (v4)
      -[MPMediaQueryCriteria setFilterPredicates:](v8, "setFilterPredicates:", v4);
    criteria = v5->_criteria;
    v5->_criteria = v9;

  }
  return v5;
}

+ (void)initialize
{
  objc_opt_class();
}

- (BOOL)_hasStaticEntities
{
  return self->_staticEntities != 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

uint64_t __62__MPMediaQuery__enumerateItemPersistentIDsInOrder_usingBlock___block_invoke()
{
  return 0;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  unint64_t groupingType;
  __CFString *v6;
  MPMediaLibrary *mediaLibrary;
  __CFString *v8;
  __CFString *v9;
  MPMediaQueryCriteria *criteria;
  NSArray *filterPredicates;
  const __CFString *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  groupingType = self->_criteria->_groupingType;
  if (groupingType > 0x16)
    v6 = CFSTR("(unknown grouping type)");
  else
    v6 = off_1E3155020[groupingType];
  mediaLibrary = self->_mediaLibrary;
  v8 = v6;
  v9 = v8;
  criteria = self->_criteria;
  filterPredicates = (NSArray *)criteria->_filterPredicates;
  if (!filterPredicates)
    filterPredicates = self->_staticEntities;
  if (criteria->_ignoreSystemFilterPredicates)
    v12 = CFSTR("DISABLED");
  else
    v12 = CFSTR("enabled");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p [%@] %@, %@, SystemFilters=%@>"), v4, self, mediaLibrary, v8, filterPredicates, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[NSArray count](self->_criteria->_orderingProperties, "count"))
  {
    -[NSArray componentsJoinedByString:](self->_criteria->_orderingProperties, "componentsJoinedByString:", CFSTR(", "));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringByAppendingFormat:", CFSTR(" ordered by %@"), v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v15;
  }
  return (NSString *)v13;
}

uint64_t __62__MPMediaQuery__enumerateItemPersistentIDsInOrder_usingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __37__MPMediaQuery_initFilteringDisabled__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("filtering_disabled", 0);
  v1 = (void *)__filteringDisabledQueue;
  __filteringDisabledQueue = (uint64_t)v0;

}

uint64_t __37__MPMediaQuery_setFilteringDisabled___block_invoke(uint64_t result)
{
  if (*(unsigned __int8 *)(result + 40) != __filteringDisabled)
  {
    __filteringDisabled = *(_BYTE *)(result + 40);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  }
  return result;
}

+ (id)moviesQuery
{
  MPMediaQuery *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  MPMediaQuery *v9;

  v2 = [MPMediaQuery alloc];
  v3 = (void *)MEMORY[0x1E0C99E60];
  +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", &unk_1E31E48A0, CFSTR("mediaType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C9AAA0];
  +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", MEMORY[0x1E0C9AAA0], CFSTR("isRental"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", v5, CFSTR("isITunesU"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithObjects:", v4, v6, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MPMediaQuery initWithFilterPredicates:](v2, "initWithFilterPredicates:", v8);

  return v9;
}

- (MPMediaItemCollection)_representativeCollection
{
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  MPConcreteMediaItemCollection *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  MPConcreteMediaItemCollection *v35;
  id v36;
  uint64_t v37;

  -[MPMediaQuery predicateForProperty:](self, "predicateForProperty:", CFSTR("persistentID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return (MPMediaItemCollection *)0;
  -[MPMediaQuery predicateForProperty:](self, "predicateForProperty:", CFSTR("playlistPersistentID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[MPMediaQuery predicateForProperty:](self, "predicateForProperty:", CFSTR("cloudPlaylistUniversalLibraryID"));
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v6 = (void *)v11;
      v12 = (void *)MEMORY[0x1E0D51230];
      -[MPMediaQuery mediaLibrary](self, "mediaLibrary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "ml3Library");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0D51218];
      v16 = (uint64_t *)MEMORY[0x1E0D50918];
    }
    else
    {
      -[MPMediaQuery predicateForProperty:](self, "predicateForProperty:", CFSTR("cloudGlobalID"));
      v17 = objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v6 = (void *)v17;
        v12 = (void *)MEMORY[0x1E0D51230];
        -[MPMediaQuery mediaLibrary](self, "mediaLibrary");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "ml3Library");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)MEMORY[0x1E0D51218];
        v16 = (uint64_t *)MEMORY[0x1E0D508D8];
      }
      else
      {
        -[MPMediaQuery predicateForProperty:](self, "predicateForProperty:", CFSTR("name"));
        v18 = objc_claimAutoreleasedReturnValue();
        if (!v18)
        {
          -[MPMediaQuery predicateForProperty:](self, "predicateForProperty:", CFSTR("storeCloudAlbumID"));
          v24 = objc_claimAutoreleasedReturnValue();
          if (!v24)
          {
            v36 = 0;
            v37 = 0;
            -[MPMediaQuery _getRepresentativeCollectionGrouping:propertyPredicate:](self, "_getRepresentativeCollectionGrouping:propertyPredicate:", &v37, &v36);
            v32 = v36;
            v6 = v32;
            if (v32
              && (objc_msgSend(v32, "value"),
                  v33 = (void *)objc_claimAutoreleasedReturnValue(),
                  v34 = objc_msgSend(v33, "longLongValue"),
                  v33,
                  v34))
            {
              v35 = [MPConcreteMediaItemCollection alloc];
              v10 = -[MPConcreteMediaItemCollection initWithIdentifier:itemsQuery:grouping:](v35, "initWithIdentifier:itemsQuery:grouping:", v34, self, v37);
            }
            else
            {
              v10 = 0;
            }
            goto LABEL_14;
          }
          v6 = (void *)v24;
          v25 = (void *)MEMORY[0x1E0D511C8];
          -[MPMediaQuery mediaLibrary](self, "mediaLibrary");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "ml3Library");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = (void *)MEMORY[0x1E0D51218];
          v29 = *MEMORY[0x1E0D507C0];
          objc_msgSend(v6, "value");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "predicateWithProperty:equalToValue:", v29, v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "anyInLibrary:predicate:", v27, v31);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          -[MPMediaQuery mediaLibrary](self, "mediaLibrary");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "collectionWithPersistentID:groupingType:", objc_msgSend(v9, "persistentID"), 1);
          v23 = objc_claimAutoreleasedReturnValue();
          goto LABEL_12;
        }
        v6 = (void *)v18;
        v12 = (void *)MEMORY[0x1E0D51230];
        -[MPMediaQuery mediaLibrary](self, "mediaLibrary");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "ml3Library");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)MEMORY[0x1E0D51218];
        v16 = (uint64_t *)MEMORY[0x1E0D50A58];
      }
    }
    v19 = *v16;
    objc_msgSend(v6, "value");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "predicateWithProperty:equalToValue:", v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "anyInLibrary:predicate:", v14, v21);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[MPMediaQuery mediaLibrary](self, "mediaLibrary");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "newPlaylistWithPersistentID:", objc_msgSend(v9, "persistentID"));
LABEL_12:
    v10 = (MPConcreteMediaItemCollection *)v23;

    goto LABEL_13;
  }
  v6 = v5;
  objc_msgSend(v5, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedLongLongValue");

  -[MPMediaQuery mediaLibrary](self, "mediaLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (MPConcreteMediaItemCollection *)objc_msgSend(v9, "newPlaylistWithPersistentID:", v8);
LABEL_13:

LABEL_14:
  return (MPMediaItemCollection *)v10;
}

- (void)_getRepresentativeCollectionGrouping:(int64_t *)a3 propertyPredicate:(id *)a4
{
  void *v7;
  int64_t v8;
  id v9;

  -[MPMediaQuery predicateForProperty:](self, "predicateForProperty:", CFSTR("albumPID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = 1;
  }
  else
  {
    -[MPMediaQuery predicateForProperty:](self, "predicateForProperty:", CFSTR("artistPID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = 2;
    }
    else
    {
      -[MPMediaQuery predicateForProperty:](self, "predicateForProperty:", CFSTR("albumArtistPID"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = 3;
      }
      else
      {
        -[MPMediaQuery predicateForProperty:](self, "predicateForProperty:", CFSTR("composerPID"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v8 = 4;
        }
        else
        {
          -[MPMediaQuery predicateForProperty:](self, "predicateForProperty:", CFSTR("genrePID"));
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = 5;
          if (!v7)
            v8 = 0;
        }
      }
    }
  }
  if (a3)
    *a3 = v8;
  if (a4)
  {
    v9 = v7;
    *a4 = objc_retainAutorelease(v7);
    v7 = v9;
  }

}

- (NSArray)items
{
  NSArray *staticEntities;
  void *v4;
  NSArray *v5;
  id v6;
  NSArray *v8;
  _QWORD v9[4];
  id v10;

  staticEntities = self->_staticEntities;
  if (staticEntities)
  {
    if (self->_staticEntityType)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = self->_staticEntities;
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __21__MPMediaQuery_items__block_invoke;
      v9[3] = &unk_1E3154EC8;
      v6 = v4;
      v10 = v6;
      -[NSArray enumerateObjectsUsingBlock:](v5, "enumerateObjectsUsingBlock:", v9);

      return (NSArray *)v6;
    }
    v8 = staticEntities;
  }
  else
  {
    -[MPMediaLibrary _itemsForQueryCriteria:](self->_mediaLibrary, "_itemsForQueryCriteria:", self->_criteria);
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (NSArray)collections
{
  NSArray *staticEntities;

  staticEntities = self->_staticEntities;
  if (staticEntities && self->_staticEntityType == 1)
    return staticEntities;
  -[MPMediaLibrary _collectionsForQueryCriteria:](self->_mediaLibrary, "_collectionsForQueryCriteria:", self->_criteria);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)_enumerateItemPersistentIDsUsingBlock:(id)a3
{
  -[MPMediaQuery _enumerateItemPersistentIDsInOrder:usingBlock:](self, "_enumerateItemPersistentIDsInOrder:usingBlock:", 1, a3);
}

- (void)_enumerateItemPersistentIDsInOrder:(BOOL)a3 usingBlock:(id)a4
{
  _BOOL8 v4;
  id v6;
  MPMediaLibrary *v7;
  void *v8;
  MPMediaQueryCriteria *criteria;
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v6 = a4;
  v7 = self->_mediaLibrary;
  -[MPMediaLibrary libraryDataProvider](v7, "libraryDataProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  criteria = self->_criteria;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__MPMediaQuery__enumerateItemPersistentIDsInOrder_usingBlock___block_invoke_2;
  v11[3] = &unk_1E3154FB0;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v8, "enumerateItemIdentifiersForQueryCriteria:ordered:cancelBlock:usingBlock:", criteria, v4, &__block_literal_global_79, v11);

}

+ (id)favoriteSongsPlaylist
{
  void *v2;
  void *v3;

  +[MPMediaLibrary deviceMediaLibrary](MPMediaLibrary, "deviceMediaLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "favoriteSongsPlaylist");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)setFilteringDisabled:(BOOL)a3
{
  void *v4;
  _QWORD v5[5];
  BOOL v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  +[MPMediaQuery initFilteringDisabled](MPMediaQuery, "initFilteringDisabled");
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__MPMediaQuery_setFilteringDisabled___block_invoke;
  v5[3] = &unk_1E3154F10;
  v6 = a3;
  v5[4] = &v7;
  dispatch_sync((dispatch_queue_t)__filteringDisabledQueue, v5);
  if (*((_BYTE *)v8 + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("MPMediaLibraryFilteringDidChangeNotification"), 0);

  }
  _Block_object_dispose(&v7, 8);
}

- (void)setItemPropertiesToFetch:(id)a3
{
  MPMediaQueryCriteria *criteria;
  id v5;
  MPMediaQueryCriteria *v6;
  MPMediaQueryCriteria *v7;
  uint64_t v8;
  MPMediaQueryCriteria *v9;
  NSSet *itemPropertiesToFetch;

  criteria = self->_criteria;
  if (criteria->_itemPropertiesToFetch != a3)
  {
    v5 = a3;
    v6 = (MPMediaQueryCriteria *)-[MPMediaQueryCriteria copy](criteria, "copy");
    v7 = self->_criteria;
    self->_criteria = v6;

    v8 = objc_msgSend(v5, "copy");
    v9 = self->_criteria;
    itemPropertiesToFetch = v9->_itemPropertiesToFetch;
    v9->_itemPropertiesToFetch = (NSSet *)v8;

  }
}

- (NSArray)itemSections
{
  void *v2;
  void *v3;

  -[MPMediaQuery itemSectionInfo](self, "itemSectionInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (MPMediaQuerySectionInfo)itemSectionInfo
{
  void *v2;
  void *v3;

  -[MPMediaQuery items](self, "items");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPMediaQuerySectionInfo *)v3;
}

- (NSArray)collectionSections
{
  void *v2;
  void *v3;

  -[MPMediaQuery collectionSectionInfo](self, "collectionSectionInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (MPMediaQuerySectionInfo)collectionSectionInfo
{
  void *v2;
  void *v3;

  -[MPMediaQuery collections](self, "collections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPMediaQuerySectionInfo *)v3;
}

- (void)_setOrderingProperties:(id)a3
{
  MPMediaQueryCriteria *criteria;
  id v5;
  MPMediaQueryCriteria *v6;
  MPMediaQueryCriteria *v7;
  uint64_t v8;
  MPMediaQueryCriteria *v9;
  NSArray *orderingProperties;

  criteria = self->_criteria;
  if (criteria->_orderingProperties != a3)
  {
    v5 = a3;
    v6 = (MPMediaQueryCriteria *)-[MPMediaQueryCriteria copy](criteria, "copy");
    v7 = self->_criteria;
    self->_criteria = v6;

    v8 = objc_msgSend(v5, "copy");
    v9 = self->_criteria;
    orderingProperties = v9->_orderingProperties;
    v9->_orderingProperties = (NSArray *)v8;

  }
}

- (void)_setOrderingDirectionMappings:(id)a3
{
  MPMediaQueryCriteria *criteria;
  id v5;
  MPMediaQueryCriteria *v6;
  MPMediaQueryCriteria *v7;
  uint64_t v8;
  MPMediaQueryCriteria *v9;
  NSDictionary *orderingDirectionMappings;

  criteria = self->_criteria;
  if (criteria->_orderingDirectionMappings != a3)
  {
    v5 = a3;
    v6 = (MPMediaQueryCriteria *)-[MPMediaQueryCriteria copy](criteria, "copy");
    v7 = self->_criteria;
    self->_criteria = v6;

    v8 = objc_msgSend(v5, "copy");
    v9 = self->_criteria;
    orderingDirectionMappings = v9->_orderingDirectionMappings;
    v9->_orderingDirectionMappings = (NSDictionary *)v8;

  }
}

- (MPMediaQuery)initWithEntities:(id)a3 entityType:(int64_t)a4
{
  id v6;
  MPMediaQuery *v7;
  uint64_t v8;
  NSArray *staticEntities;

  v6 = a3;
  v7 = -[MPMediaQuery initWithFilterPredicates:](self, "initWithFilterPredicates:", 0);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    staticEntities = v7->_staticEntities;
    v7->_staticEntities = (NSArray *)v8;

    v7->_staticEntityType = a4;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  BOOL v6;
  NSArray *staticEntities;
  MPMediaQueryCriteria *criteria;
  MPMediaLibrary *mediaLibrary;

  v4 = a3;
  v5 = objc_opt_class();
  v6 = 0;
  if (v5 == objc_opt_class())
  {
    staticEntities = self->_staticEntities;
    if (staticEntities == (NSArray *)v4[4] || -[NSArray isEqualToArray:](staticEntities, "isEqualToArray:"))
    {
      criteria = self->_criteria;
      if (criteria == (MPMediaQueryCriteria *)v4[2] || -[MPMediaQueryCriteria isEqual:](criteria, "isEqual:"))
      {
        mediaLibrary = self->_mediaLibrary;
        if (mediaLibrary == (MPMediaLibrary *)v4[1] || -[MPMediaLibrary isEqual:](mediaLibrary, "isEqual:"))
          v6 = 1;
      }
    }
  }

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[MPMediaQueryCriteria hash](self->_criteria, "hash");
  return -[MPMediaLibrary hash](self->_mediaLibrary, "hash") ^ v3;
}

- (void)encodeWithCoder:(id)a3
{
  MPMediaLibrary *mediaLibrary;
  id v5;

  mediaLibrary = self->_mediaLibrary;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", mediaLibrary, CFSTR("MPMediaLibrary"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_criteria->_filterPredicates, CFSTR("MPFilterPredicates"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_criteria->_groupingType, CFSTR("MPGroupingType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_criteria->_entityOrder, CFSTR("MPEntityOrder"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_criteria->_ignoreSystemFilterPredicates, CFSTR("MPIgnoreSystemFilterPredicates"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_criteria->_ignoreRestrictionsPredicates, CFSTR("MPIgnoreRestrictionsPredicates"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_criteria->_includeNonLibraryEntities, CFSTR("MPIncludeNonLibraryEntities"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_criteria->_includeEntitiesWithBlankNames, CFSTR("MPIncludeEntitiesWithBlankNames"));
  objc_msgSend(v5, "encodeBool:forKey:", -[MPMediaQuery _isFilteringDisabled](self, "_isFilteringDisabled"), CFSTR("MLIsFilteringDisabled"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_staticEntities, CFSTR("MPStaticEntities"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_staticEntityType, CFSTR("MPStaticEntityType"));

}

- (id)copyByRemovingStaticEntities
{
  void *v2;

  if (!self->_staticEntities)
    return self;
  v2 = (void *)-[MPMediaQuery copy](self, "copy");
  objc_msgSend(v2, "setStaticEntities:entityType:", 0, self->_staticEntityType);
  return v2;
}

- (id)copyBySanitizingStaticEntities
{
  void *v2;
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int64_t staticEntityType;
  void *v10;
  uint64_t v11;
  int v12;
  char v13;
  uint64_t v14;
  void *v15;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (self->_staticEntities)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v3 = self->_staticEntities;
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (!v4)
      goto LABEL_15;
    v5 = v4;
    v6 = *(_QWORD *)v19;
    while (1)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v7);
        staticEntityType = self->_staticEntityType;
        objc_msgSend(v8, "mediaLibrary");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v8, "persistentID");
        if (staticEntityType)
        {
          v12 = objc_msgSend(v10, "collectionExistsWithPersistentID:groupingType:", v11, objc_msgSend(v8, "groupingType"));

          if (!v12)
            goto LABEL_10;
LABEL_9:
          objc_msgSend(v2, "addObject:", v8);
          goto LABEL_10;
        }
        v13 = objc_msgSend(v10, "itemExistsWithPersistentID:", v11);

        if ((v13 & 1) != 0)
          goto LABEL_9;
LABEL_10:
        ++v7;
      }
      while (v5 != v7);
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      v5 = v14;
      if (!v14)
      {
LABEL_15:

        v15 = (void *)-[MPMediaQuery copy](self, "copy");
        objc_msgSend(v15, "setStaticEntities:entityType:", v2, self->_staticEntityType);

        return v15;
      }
    }
  }
  return self;
}

- (MPMediaQuery)initWithProtobufferDecodableObject:(id)a3
{
  return -[MPMediaQuery initWithProtobufferDecodableObject:library:](self, "initWithProtobufferDecodableObject:library:", a3, 0);
}

- (MPMediaQuery)initWithProtobufferDecodableObject:(id)a3 library:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  MPMediaQuery *v17;
  void *v18;
  int v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  id v40;
  void *v41;
  uint64_t v42;
  void *v43;
  NSObject *v44;
  NSObject *v45;
  NSArray *staticEntities;
  void *v48;
  MPMediaQuery *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  NSArray *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint8_t v69[128];
  uint8_t buf[4];
  id v71;
  __int16 v72;
  void *v73;
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPMediaQuery.m"), 262, CFSTR("Cannot decode protobuf object of type %@"), objc_opt_class());

  }
  v9 = v7;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v9, "filterPredicatesCount"));
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v50 = v9;
  objc_msgSend(v9, "filterPredicates");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v66;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v66 != v14)
          objc_enumerationMutation(v11);
        MPPCreateMediaPredicateFromProtocolPredicateAndLibrary(*(void **)(*((_QWORD *)&v65 + 1) + 8 * i), v8);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v16);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
    }
    while (v13);
  }

  v17 = -[MPMediaQuery initWithFilterPredicates:](self, "initWithFilterPredicates:", v10);
  v18 = v50;
  if (v17)
  {
    v19 = objc_msgSend(v50, "groupingType");
    switch(v19)
    {
      case 2:
        v20 = 1;
        break;
      case 3:
        v20 = 2;
        break;
      case 4:
        v20 = 3;
        break;
      case 5:
        v20 = 4;
        break;
      case 6:
        v20 = 5;
        break;
      case 7:
        v20 = 6;
        break;
      case 8:
        v20 = 7;
        break;
      default:
        switch(v19)
        {
          case 'd':
            v20 = 8;
            break;
          case 'e':
            v20 = 9;
            break;
          case 'f':
            v20 = 10;
            break;
          case 'g':
            v20 = 11;
            break;
          case 'h':
            v20 = 12;
            break;
          default:
            v20 = 0;
            break;
        }
        break;
    }
    v17->_criteria->_groupingType = v20;
    v21 = objc_msgSend(v50, "entityOrder");
    v22 = 2 * (v21 == 3);
    if (v21 == 2)
      v22 = 1;
    v17->_criteria->_entityOrder = v22;
    v17->_criteria->_includeNonLibraryEntities = objc_msgSend(v50, "includeNonLibraryEntities");
    v17->_isFilteringDisabled = objc_msgSend(v50, "filteringDisabled");
    v23 = objc_msgSend(v50, "staticEntityIdentifiersCount");
    if (v23)
    {
      v49 = v17;
      v56 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v23);
      v61 = 0u;
      v62 = 0u;
      v63 = 0u;
      v64 = 0u;
      objc_msgSend(v50, "staticEntityIdentifiers");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v61, v74, 16);
      if (!v25)
        goto LABEL_67;
      v26 = v25;
      v27 = *(_QWORD *)v62;
      v52 = v24;
      v53 = v10;
      v51 = *(_QWORD *)v62;
      while (1)
      {
        v28 = 0;
        v54 = v26;
        do
        {
          if (*(_QWORD *)v62 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v28);
          if (v8)
          {
            objc_msgSend(v8, "entityWithMultiverseIdentifier:", *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * v28));
            v30 = objc_claimAutoreleasedReturnValue();
            if (v30)
            {
              v31 = v30;
              -[NSArray addObject:](v56, "addObject:", v30);
              goto LABEL_64;
            }
            v32 = os_log_create("com.apple.amp.mediaplayer", "Library");
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v71 = v8;
              v72 = 2114;
              v73 = v29;
              _os_log_impl(&dword_193B9B000, v32, OS_LOG_TYPE_ERROR, "No static entity found for provided library: %{public}@ multiverseID: %{public}@", buf, 0x16u);
            }

          }
          if (!objc_msgSend(v29, "libraryIdentifiersCount"))
            goto LABEL_62;
          v55 = v28;
          v59 = 0u;
          v60 = 0u;
          v57 = 0u;
          v58 = 0u;
          objc_msgSend(v29, "libraryIdentifiers");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
          if (!v34)
          {

            v26 = v54;
            v28 = v55;
LABEL_62:
            v31 = os_log_create("com.apple.amp.mediaplayer", "Library");
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v71 = v29;
              _os_log_impl(&dword_193B9B000, v31, OS_LOG_TYPE_ERROR, "Unable to find static entity in any library: %{public}@", buf, 0xCu);
            }
LABEL_64:

            goto LABEL_65;
          }
          v35 = v34;
          v36 = 0;
          v37 = *(_QWORD *)v58;
          do
          {
            for (j = 0; j != v35; ++j)
            {
              if (*(_QWORD *)v58 != v37)
                objc_enumerationMutation(v33);
              v39 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * j);
              v40 = v8;
              if (objc_msgSend(v39, "hasLibraryName"))
              {
                objc_msgSend(v39, "libraryName");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                +[MPMediaLibrary mediaLibraryWithUniqueIdentifier:](MPMediaLibrary, "mediaLibraryWithUniqueIdentifier:", v41);
                v42 = objc_claimAutoreleasedReturnValue();

                v40 = (id)v42;
              }
              objc_msgSend(v40, "entityWithMultiverseIdentifier:", v29);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              if (v43)
              {
                if (v8)
                {
                  v44 = os_log_create("com.apple.amp.mediaplayer", "Library");
                  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138543618;
                    v71 = v40;
                    v72 = 2114;
                    v73 = v29;
                    _os_log_impl(&dword_193B9B000, v44, OS_LOG_TYPE_DEFAULT, "Static entity recovered from included library: %{public}@ multiverseID: %{public}@", buf, 0x16u);
                  }

                }
                -[NSArray addObject:](v56, "addObject:", v43);
                v36 = 1;
              }
              else
              {
                v45 = os_log_create("com.apple.amp.mediaplayer", "Library");
                if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543618;
                  v71 = v40;
                  v72 = 2114;
                  v73 = v29;
                  _os_log_impl(&dword_193B9B000, v45, OS_LOG_TYPE_ERROR, "No static entity found in library: %{public}@ multiverseID: %{public}@", buf, 0x16u);
                }

              }
            }
            v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
          }
          while (v35);

          v24 = v52;
          v10 = v53;
          v27 = v51;
          v26 = v54;
          v28 = v55;
          if ((v36 & 1) == 0)
            goto LABEL_62;
LABEL_65:
          ++v28;
        }
        while (v28 != v26);
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v61, v74, 16);
        if (!v26)
        {
LABEL_67:

          v17 = v49;
          staticEntities = v49->_staticEntities;
          v49->_staticEntities = v56;

          v18 = v50;
          v49->_staticEntityType = objc_msgSend(v50, "staticEntityType") == 2;
          break;
        }
      }
    }
  }

  return v17;
}

- (id)protobufferEncodableObject
{
  return -[MPMediaQuery protobufferEncodableObjectFromLibrary:](self, "protobufferEncodableObjectFromLibrary:", 0);
}

- (id)protobufferEncodableObjectFromLibrary:(id)a3
{
  MPMediaLibrary *v4;
  MPPMediaQuery *v5;
  NSMutableSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  MPMediaLibrary *mediaLibrary;
  void *v12;
  unint64_t groupingType;
  uint64_t v14;
  unint64_t entityOrder;
  unsigned int v16;
  uint64_t v17;
  int64_t staticEntityType;
  uint64_t v19;
  NSArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = (MPMediaLibrary *)a3;
  v5 = objc_alloc_init(MPPMediaQuery);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v6 = self->_criteria->_filterPredicates;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v32 != v9)
          objc_enumerationMutation(v6);
        mediaLibrary = v4;
        if (!v4)
          mediaLibrary = self->_mediaLibrary;
        objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "protobufferEncodableObjectFromLibrary:", mediaLibrary);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPPMediaQuery addFilterPredicates:](v5, "addFilterPredicates:", v12);

      }
      v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v8);
  }

  groupingType = self->_criteria->_groupingType;
  if (groupingType > 0xC)
    v14 = 0;
  else
    v14 = dword_193F09A0C[groupingType];
  -[MPPMediaQuery setGroupingType:](v5, "setGroupingType:", v14);
  -[MPPMediaQuery setFilteringDisabled:](v5, "setFilteringDisabled:", self->_isFilteringDisabled != 0);
  -[MPPMediaQuery setIncludeNonLibraryEntities:](v5, "setIncludeNonLibraryEntities:", self->_criteria->_includeNonLibraryEntities);
  entityOrder = self->_criteria->_entityOrder;
  if (entityOrder == 2)
    v16 = 3;
  else
    v16 = 1;
  if (entityOrder == 1)
    v17 = 2;
  else
    v17 = v16;
  -[MPPMediaQuery setEntityOrder:](v5, "setEntityOrder:", v17);
  if (self->_staticEntities)
  {
    staticEntityType = self->_staticEntityType;
    if (staticEntityType)
      v19 = 2 * (staticEntityType == 1);
    else
      v19 = 1;
    -[MPPMediaQuery setStaticEntityType:](v5, "setStaticEntityType:", v19);
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v20 = self->_staticEntities;
    v21 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v28;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v28 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * j), "multiverseIdentifier", (_QWORD)v27);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPPMediaQuery addStaticEntityIdentifiers:](v5, "addStaticEntityIdentifiers:", v25);

        }
        v22 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      }
      while (v22);
    }

  }
  return v5;
}

- (void)setFilterPredicates:(NSSet *)filterPredicates
{
  MPMediaQueryCriteria *criteria;
  NSSet *v5;
  MPMediaQueryCriteria *v6;
  MPMediaQueryCriteria *v7;
  uint64_t v8;
  MPMediaQueryCriteria *v9;
  NSMutableSet *v10;

  criteria = self->_criteria;
  if ((NSSet *)criteria->_filterPredicates != filterPredicates)
  {
    v5 = filterPredicates;
    v6 = (MPMediaQueryCriteria *)-[MPMediaQueryCriteria copy](criteria, "copy");
    v7 = self->_criteria;
    self->_criteria = v6;

    v8 = -[NSSet mutableCopy](v5, "mutableCopy");
    v9 = self->_criteria;
    v10 = v9->_filterPredicates;
    v9->_filterPredicates = (NSMutableSet *)v8;

  }
}

- (void)removeFilterPredicate:(MPMediaPredicate *)predicate
{
  MPMediaQueryCriteria *v4;
  MPMediaQueryCriteria *criteria;
  uint64_t v6;
  MPMediaQueryCriteria *v7;
  NSMutableSet *filterPredicates;
  MPMediaPredicate *v9;

  v9 = predicate;
  if (-[NSMutableSet containsObject:](self->_criteria->_filterPredicates, "containsObject:"))
  {
    v4 = (MPMediaQueryCriteria *)-[MPMediaQueryCriteria copy](self->_criteria, "copy");
    criteria = self->_criteria;
    self->_criteria = v4;

    v6 = -[NSMutableSet count](self->_criteria->_filterPredicates, "count");
    v7 = self->_criteria;
    filterPredicates = v7->_filterPredicates;
    if (v6 == 1)
    {
      v7->_filterPredicates = 0;

    }
    else
    {
      -[NSMutableSet removeObject:](filterPredicates, "removeObject:", v9);
    }
  }

}

- (MPMediaGrouping)groupingType
{
  return self->_criteria->_groupingType;
}

- (unint64_t)entityLimit
{
  return self->_criteria->_entityLimit;
}

- (void)setEntityLimit:(unint64_t)a3
{
  self->_criteria->_entityLimit = a3;
}

- (BOOL)shouldIncludeNonLibraryEntities
{
  return self->_criteria->_includeNonLibraryEntities;
}

- (BOOL)includeEntitiesWithBlankNames
{
  return self->_criteria->_includeEntitiesWithBlankNames;
}

- (void)setIncludeEntitiesWithBlankNames:(BOOL)a3
{
  self->_criteria->_includeEntitiesWithBlankNames = a3;
}

- (BOOL)ignoreSystemFilterPredicates
{
  return self->_criteria->_ignoreSystemFilterPredicates;
}

- (BOOL)ignoreRestrictionsPredicates
{
  return self->_criteria->_ignoreRestrictionsPredicates;
}

- (void)setIgnoreRestrictionsPredicates:(BOOL)a3
{
  self->_criteria->_ignoreRestrictionsPredicates = a3;
}

- (NSSet)itemPropertiesToFetch
{
  return self->_criteria->_itemPropertiesToFetch;
}

- (NSSet)collectionPropertiesToFetch
{
  return self->_criteria->_collectionPropertiesToFetch;
}

- (void)setCollectionPropertiesToFetch:(id)a3
{
  MPMediaQueryCriteria *criteria;
  id v5;
  MPMediaQueryCriteria *v6;
  MPMediaQueryCriteria *v7;
  uint64_t v8;
  MPMediaQueryCriteria *v9;
  NSSet *collectionPropertiesToFetch;

  criteria = self->_criteria;
  if (criteria->_collectionPropertiesToFetch != a3)
  {
    v5 = a3;
    v6 = (MPMediaQueryCriteria *)-[MPMediaQueryCriteria copy](criteria, "copy");
    v7 = self->_criteria;
    self->_criteria = v6;

    v8 = objc_msgSend(v5, "copy");
    v9 = self->_criteria;
    collectionPropertiesToFetch = v9->_collectionPropertiesToFetch;
    v9->_collectionPropertiesToFetch = (NSSet *)v8;

  }
}

- (NSArray)itemPersistentIdentifiers
{
  return (NSArray *)-[MPMediaLibrary _itemPersistentIdentifiersForQueryCriteria:](self->_mediaLibrary, "_itemPersistentIdentifiersForQueryCriteria:", self->_criteria);
}

- (NSArray)collectionPersistentIdentifiers
{
  return (NSArray *)-[MPMediaLibrary _collectionPersistentIdentifiersForQueryCriteria:](self->_mediaLibrary, "_collectionPersistentIdentifiersForQueryCriteria:", self->_criteria);
}

- (NSArray)_orderingProperties
{
  return self->_criteria->_orderingProperties;
}

- (NSDictionary)_orderingDirectionMappings
{
  return self->_criteria->_orderingDirectionMappings;
}

- (int64_t)_representativeCollectionGroupingType
{
  int64_t v3;

  v3 = 0;
  -[MPMediaQuery _getRepresentativeCollectionGrouping:propertyPredicate:](self, "_getRepresentativeCollectionGrouping:propertyPredicate:", &v3, 0);
  return v3;
}

- (BOOL)sortItems
{
  return self->_criteria->_entityOrder == 2;
}

- (void)setUseSections:(BOOL)a3
{
  MPMediaQueryCriteria *criteria;
  MPMediaQueryCriteria *v6;
  MPMediaQueryCriteria *v7;

  criteria = self->_criteria;
  if (criteria->_useSections != a3)
  {
    v6 = (MPMediaQueryCriteria *)-[MPMediaQueryCriteria copy](criteria, "copy");
    v7 = self->_criteria;
    self->_criteria = v6;

    self->_criteria->_useSections = a3;
  }
}

- (BOOL)useSections
{
  return self->_criteria->_useSections;
}

- (BOOL)excludesEntitiesWithBlankNames
{
  return -[MPMediaQueryCriteria excludesEntitiesWithBlankNames](self->_criteria, "excludesEntitiesWithBlankNames");
}

- (BOOL)specifiesPlaylistItems
{
  return -[MPMediaQueryCriteria specifiesPlaylistItems](self->_criteria, "specifiesPlaylistItems");
}

- (unint64_t)groupingThreshold
{
  return 0;
}

- (BOOL)willGroupEntities
{
  BOOL v3;
  void *v4;
  unint64_t v5;

  if (-[MPMediaQuery groupingType](self, "groupingType"))
    return 1;
  if (!-[MPMediaQuery groupingThreshold](self, "groupingThreshold"))
    return 0;
  -[MPMediaQuery items](self, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  v3 = v5 >= -[MPMediaQuery groupingThreshold](self, "groupingThreshold");

  return v3;
}

- (id)_valueForAggregateFunction:(id)a3 onProperty:(id)a4 entityType:(int64_t)a5
{
  id v8;
  id v9;
  NSArray *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  dispatch_semaphore_t v20;
  void *v21;
  void *v22;
  void *v23;
  MPMediaQueryCriteria *criteria;
  id v25;
  NSArray *v27;
  _QWORD v28[4];
  NSObject *v29;
  uint64_t *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (_valueForAggregateFunction_onProperty_entityType__onceToken != -1)
    dispatch_once(&_valueForAggregateFunction_onProperty_entityType__onceToken, &__block_literal_global_71);
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__11247;
  v39 = __Block_byref_object_dispose__11248;
  v40 = 0;
  if (objc_msgSend((id)__supportedAggregateFunctions, "containsObject:", v8))
  {
    v10 = self->_staticEntities;
    v27 = v10;
    if (v10)
    {
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v11 = v10;
      v12 = 0;
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v32;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v32 != v14)
              objc_enumerationMutation(v11);
            objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "valueForProperty:", v9);
            v16 = objc_claimAutoreleasedReturnValue();
            v17 = (void *)v36[5];
            v36[5] = v16;

            if ((objc_opt_respondsToSelector() & 1) != 0)
              v12 += (int)objc_msgSend((id)v36[5], "intValue");
          }
          v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
        }
        while (v13);
      }

      v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", v12);
      v19 = v36[5];
      v36[5] = v18;
    }
    else
    {
      v20 = dispatch_semaphore_create(0);
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __65__MPMediaQuery__valueForAggregateFunction_onProperty_entityType___block_invoke_74;
      v28[3] = &unk_1E3154F60;
      v30 = &v35;
      v19 = v20;
      v29 = v19;
      v21 = (void *)MEMORY[0x19403A810](v28);
      -[MPMediaLibrary libraryDataProvider](self->_mediaLibrary, "libraryDataProvider");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      criteria = self->_criteria;
      if (a5 == 1)
        objc_msgSend(v22, "loadValueForAggregateFunction:onCollectionsForProperty:queryCriteria:completionBlock:", v8, v9, criteria, v21);
      else
        objc_msgSend(v22, "loadValueForAggregateFunction:onItemsForProperty:queryCriteria:completionBlock:", v8, v9, criteria, v21);
      dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);

    }
  }
  v25 = (id)v36[5];
  _Block_object_dispose(&v35, 8);

  return v25;
}

- (id)valueForAggregateFunction:(id)a3 onItemsForProperty:(id)a4
{
  return -[MPMediaQuery _valueForAggregateFunction:onProperty:entityType:](self, "_valueForAggregateFunction:onProperty:entityType:", a3, a4, 0);
}

- (id)valueForAggregateFunction:(id)a3 onCollectionsForProperty:(id)a4
{
  return -[MPMediaQuery _valueForAggregateFunction:onProperty:entityType:](self, "_valueForAggregateFunction:onProperty:entityType:", a3, a4, 1);
}

- (BOOL)_isFilteringDisabled
{
  int isFilteringDisabled;

  isFilteringDisabled = self->_isFilteringDisabled;
  if (isFilteringDisabled == -1)
    return +[MPMediaQuery isFilteringDisabled](MPMediaQuery, "isFilteringDisabled");
  else
    return isFilteringDisabled != 0;
}

- (void)_enumerateItemsUsingBlock:(id)a3
{
  -[MPMediaQuery _enumerateItemsInOrder:usingBlock:](self, "_enumerateItemsInOrder:usingBlock:", 1, a3);
}

- (void)_enumerateUnorderedItemsUsingBlock:(id)a3
{
  -[MPMediaQuery _enumerateItemsInOrder:usingBlock:](self, "_enumerateItemsInOrder:usingBlock:", 0, a3);
}

- (void)_enumerateUnorderedItemPersistentIDsUsingBlock:(id)a3
{
  -[MPMediaQuery _enumerateItemPersistentIDsInOrder:usingBlock:](self, "_enumerateItemPersistentIDsInOrder:usingBlock:", 0, a3);
}

- (void)_enumerateItemsInOrder:(BOOL)a3 usingBlock:(id)a4
{
  _BOOL8 v4;
  id v6;
  MPMediaLibrary *v7;
  void *v8;
  MPMediaQueryCriteria *criteria;
  uint64_t v10;
  id v11;
  MPMediaLibrary *v12;
  _QWORD v13[4];
  MPMediaLibrary *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v4 = a3;
  v6 = a4;
  v7 = self->_mediaLibrary;
  -[MPMediaLibrary libraryDataProvider](v7, "libraryDataProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  criteria = self->_criteria;
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __50__MPMediaQuery__enumerateItemsInOrder_usingBlock___block_invoke;
  v16[3] = &unk_1E3157BA8;
  v17 = v6;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __50__MPMediaQuery__enumerateItemsInOrder_usingBlock___block_invoke_2;
  v13[3] = &unk_1E3154F88;
  v14 = v7;
  v15 = v17;
  v11 = v17;
  v12 = v7;
  objc_msgSend(v8, "enumerateItemIdentifiersForQueryCriteria:ordered:cancelBlock:usingBlock:", criteria, v4, v16, v13);

}

- (void)_enumerateCollectionsUsingBlock:(id)a3
{
  -[MPMediaQuery _enumerateCollectionsInOrder:usingBlock:](self, "_enumerateCollectionsInOrder:usingBlock:", 1, a3);
}

- (void)_enumerateUnorderedCollectionsUsingBlock:(id)a3
{
  -[MPMediaQuery _enumerateCollectionsInOrder:usingBlock:](self, "_enumerateCollectionsInOrder:usingBlock:", 0, a3);
}

- (void)_enumerateCollectionPersistentIDsUsingBlock:(id)a3
{
  -[MPMediaQuery _enumerateCollectionPersistentIDsInOrder:usingBlock:](self, "_enumerateCollectionPersistentIDsInOrder:usingBlock:", 1, a3);
}

- (void)_enumerateUnorderedCollectionPersistentIDsUsingBlock:(id)a3
{
  -[MPMediaQuery _enumerateCollectionPersistentIDsInOrder:usingBlock:](self, "_enumerateCollectionPersistentIDsInOrder:usingBlock:", 0, a3);
}

- (void)_enumerateCollectionPersistentIDsInOrder:(BOOL)a3 usingBlock:(id)a4
{
  _BOOL8 v4;
  id v6;
  MPMediaLibrary *v7;
  void *v8;
  MPMediaQueryCriteria *criteria;
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v6 = a4;
  v7 = self->_mediaLibrary;
  -[MPMediaLibrary libraryDataProvider](v7, "libraryDataProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  criteria = self->_criteria;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__MPMediaQuery__enumerateCollectionPersistentIDsInOrder_usingBlock___block_invoke_2;
  v11[3] = &unk_1E3154FD8;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v8, "enumerateCollectionIdentifiersForQueryCriteria:ordered:cancelBlock:usingBlock:", criteria, v4, &__block_literal_global_80, v11);

}

- (void)_enumerateCollectionsInOrder:(BOOL)a3 usingBlock:(id)a4
{
  _BOOL8 v4;
  id v6;
  MPMediaLibrary *v7;
  void *v8;
  MPMediaQueryCriteria *criteria;
  BOOL v10;
  uint64_t v11;
  id v12;
  MPMediaLibrary *v13;
  _QWORD v14[4];
  MPMediaLibrary *v15;
  MPMediaQuery *v16;
  id v17;
  BOOL v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  v6 = a4;
  v7 = self->_mediaLibrary;
  -[MPMediaLibrary libraryDataProvider](v7, "libraryDataProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  criteria = self->_criteria;
  v10 = criteria->_groupingType == 6;
  v11 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __56__MPMediaQuery__enumerateCollectionsInOrder_usingBlock___block_invoke;
  v19[3] = &unk_1E3157BA8;
  v20 = v6;
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __56__MPMediaQuery__enumerateCollectionsInOrder_usingBlock___block_invoke_2;
  v14[3] = &unk_1E3155000;
  v18 = v10;
  v16 = self;
  v17 = v20;
  v15 = v7;
  v12 = v20;
  v13 = v7;
  objc_msgSend(v8, "enumerateCollectionIdentifiersForQueryCriteria:ordered:cancelBlock:usingBlock:", criteria, v4, v19, v14);

}

- (void)setStaticEntities:(id)a3 entityType:(int64_t)a4
{
  NSArray *v6;
  NSArray *staticEntities;

  if (self->_staticEntities != a3)
  {
    v6 = (NSArray *)objc_msgSend(a3, "copy");
    staticEntities = self->_staticEntities;
    self->_staticEntities = v6;

    self->_staticEntityType = a4;
  }
}

- (BOOL)isPlaylistItemsQuery
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[MPMediaQuery groupingType](self, "groupingType"))
    return 0;
  -[MPMediaQuery predicateForProperty:](self, "predicateForProperty:", CFSTR("playlistPersistentID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v3 = 1;
  }
  else
  {
    -[MPMediaQuery predicateForProperty:](self, "predicateForProperty:", CFSTR("name"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v3 = 1;
    }
    else
    {
      -[MPMediaQuery predicateForProperty:](self, "predicateForProperty:", CFSTR("cloudPlaylistUniversalLibraryID"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v6 != 0;

    }
  }

  return v3;
}

- (unint64_t)_playlistItemPersistentIDForItemPersistentID:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v5 = (void *)-[MPMediaQuery copy](self, "copy");
  objc_msgSend(v5, "setGroupingType:", 6);
  objc_msgSend(v5, "collections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if ((objc_msgSend(v7, "playlistAttributes") & 2) != 0)
    {
      v17 = a3 | 0x8000000000000000;
    }
    else
    {
      -[MPMediaQuery mediaLibrary](self, "mediaLibrary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "ml3Library");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = (void *)MEMORY[0x1E0D51238];
      v11 = (void *)MEMORY[0x1E0D511D8];
      objc_msgSend(MEMORY[0x1E0D51218], "predicateWithProperty:equalToInt64:", *MEMORY[0x1E0D508A0], objc_msgSend(v7, "persistentID"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v12;
      objc_msgSend(MEMORY[0x1E0D51218], "predicateWithProperty:equalToInt64:", *MEMORY[0x1E0D508A8], a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19[1] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "predicateMatchingPredicates:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "anyInLibrary:predicate:", v9, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = objc_msgSend(v16, "persistentID");
    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)criteria
{
  return self->_criteria;
}

- (void)setCriteria:(id)a3
{
  MPMediaQueryCriteria *v4;
  MPMediaQueryCriteria *criteria;

  if (self->_criteria != a3)
  {
    v4 = (MPMediaQueryCriteria *)objc_msgSend(a3, "copy");
    criteria = self->_criteria;
    self->_criteria = v4;

  }
}

uint64_t __56__MPMediaQuery__enumerateCollectionsInOrder_usingBlock___block_invoke(uint64_t a1)
{
  unsigned __int8 v2;

  v2 = 0;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return v2;
}

void __56__MPMediaQuery__enumerateCollectionsInOrder_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  MPMediaQuery *v9;
  MPConcreteMediaItemCollection *v10;
  id v11;

  v11 = a3;
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "playlistWithPersistentID:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    +[MPMediaItem persistentIDPropertyForGroupingType:](MPMediaItem, "persistentIDPropertyForGroupingType:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) + 24));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", v6, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "copy");
    objc_msgSend(v8, "addFilterPredicate:", v7);
    objc_msgSend(v8, "setGroupingType:", 0);
    objc_msgSend(v8, "setEntityLimit:", 0);
    v9 = -[MPMediaQuery initWithCriteria:library:]([MPMediaQuery alloc], "initWithCriteria:library:", v8, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8));
    v10 = -[MPConcreteMediaItemCollection initWithIdentifier:valuesForProperties:itemsQuery:grouping:representativeItemIdentifier:]([MPConcreteMediaItemCollection alloc], "initWithIdentifier:valuesForProperties:itemsQuery:grouping:representativeItemIdentifier:", a2, v11, v9, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) + 24), 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

uint64_t __68__MPMediaQuery__enumerateCollectionPersistentIDsInOrder_usingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __68__MPMediaQuery__enumerateCollectionPersistentIDsInOrder_usingBlock___block_invoke()
{
  return 0;
}

uint64_t __50__MPMediaQuery__enumerateItemsInOrder_usingBlock___block_invoke(uint64_t a1)
{
  unsigned __int8 v2;

  v2 = 0;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return v2;
}

void __50__MPMediaQuery__enumerateItemsInOrder_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3;

  +[MPConcreteMediaItem concreteMediaItemWithPersistentID:library:](MPConcreteMediaItem, "concreteMediaItemWithPersistentID:library:", a2, *(_QWORD *)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __65__MPMediaQuery__valueForAggregateFunction_onProperty_entityType___block_invoke_74(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __65__MPMediaQuery__valueForAggregateFunction_onProperty_entityType___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("MAX"), CFSTR("MIN"), CFSTR("TOTAL"), 0);
  v1 = (void *)__supportedAggregateFunctions;
  __supportedAggregateFunctions = v0;

}

uint64_t __29__MPMediaQuery__countOfItems__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t __25__MPMediaQuery__hasItems__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "count");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result != 0;
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __21__MPMediaQuery_items__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v3);
    v3 = v4;
  }

}

+ (MPMediaQuery)artistsQuery
{
  MPMediaQuery *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  MPMediaQuery *v7;

  v2 = [MPMediaQuery alloc];
  v3 = (void *)MEMORY[0x1E0C99E60];
  +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", &unk_1E31E4870, CFSTR("mediaType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPMediaPropertyPredicate predicateWithValue:forProperty:comparisonType:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:comparisonType:", MEMORY[0x1E0C9AAA0], CFSTR("isCompilation"), 109);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithObjects:", v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MPMediaQuery initWithFilterPredicates:](v2, "initWithFilterPredicates:", v6);

  -[MPMediaQuery setGroupingType:](v7, "setGroupingType:", 2);
  return v7;
}

+ (MPMediaQuery)podcastsQuery
{
  MPMediaQuery *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  MPMediaQuery *v7;

  v2 = [MPMediaQuery alloc];
  v3 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1026);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", v4, CFSTR("mediaType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MPMediaQuery initWithFilterPredicates:](v2, "initWithFilterPredicates:", v6);

  -[MPMediaQuery setGroupingType:](v7, "setGroupingType:", 7);
  return v7;
}

+ (id)ITunesUQuery
{
  MPMediaQuery *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  MPMediaQuery *v7;

  v2 = [MPMediaQuery alloc];
  v3 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", v4, CFSTR("isITunesU"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MPMediaQuery initWithFilterPredicates:](v2, "initWithFilterPredicates:", v6);

  -[MPMediaQuery setGroupingType:](v7, "setGroupingType:", 1);
  return v7;
}

+ (id)ITunesUAudioQuery
{
  MPMediaQuery *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  MPMediaQuery *v7;
  void *v8;
  void *v9;

  v2 = [MPMediaQuery alloc];
  v3 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", v4, CFSTR("mediaType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MPMediaQuery initWithFilterPredicates:](v2, "initWithFilterPredicates:", v6);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", v8, CFSTR("isITunesU"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMediaQuery addFilterPredicate:](v7, "addFilterPredicate:", v9);

  -[MPMediaQuery setGroupingType:](v7, "setGroupingType:", 1);
  return v7;
}

+ (id)videoITunesUQuery
{
  MPMediaQuery *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  MPMediaQuery *v7;

  v2 = [MPMediaQuery alloc];
  v3 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 4096);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", v4, CFSTR("mediaType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MPMediaQuery initWithFilterPredicates:](v2, "initWithFilterPredicates:", v6);

  -[MPMediaQuery setGroupingType:](v7, "setGroupingType:", 1);
  return v7;
}

+ (id)audibleAudiobooksQuery
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "audiobooksQuery");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", v3, CFSTR("isAudible"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addFilterPredicate:", v4);

  return v2;
}

+ (MPMediaQuery)compilationsQuery
{
  MPMediaQuery *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  MPMediaQuery *v7;

  v2 = [MPMediaQuery alloc];
  v3 = (void *)MEMORY[0x1E0C99E60];
  +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", &unk_1E31E4870, CFSTR("mediaType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPMediaPropertyPredicate predicateWithValue:forProperty:comparisonType:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:comparisonType:", MEMORY[0x1E0C9AAB0], CFSTR("isCompilation"), 109);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithObjects:", v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MPMediaQuery initWithFilterPredicates:](v2, "initWithFilterPredicates:", v6);

  -[MPMediaQuery setGroupingType:](v7, "setGroupingType:", 1);
  return v7;
}

+ (MPMediaQuery)composersQuery
{
  MPMediaQuery *v2;
  void *v3;
  void *v4;
  void *v5;
  MPMediaQuery *v6;

  v2 = [MPMediaQuery alloc];
  v3 = (void *)MEMORY[0x1E0C99E60];
  +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", &unk_1E31E4870, CFSTR("mediaType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithObjects:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MPMediaQuery initWithFilterPredicates:](v2, "initWithFilterPredicates:", v5);

  -[MPMediaQuery setGroupingType:](v6, "setGroupingType:", 4);
  return v6;
}

+ (MPMediaQuery)genresQuery
{
  MPMediaQuery *v2;
  void *v3;
  void *v4;
  void *v5;
  MPMediaQuery *v6;

  v2 = [MPMediaQuery alloc];
  v3 = (void *)MEMORY[0x1E0C99E60];
  +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", &unk_1E31E4870, CFSTR("mediaType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithObjects:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MPMediaQuery initWithFilterPredicates:](v2, "initWithFilterPredicates:", v5);

  -[MPMediaQuery setGroupingType:](v6, "setGroupingType:", 5);
  return v6;
}

+ (id)videosQuery
{
  MPMediaQuery *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  MPMediaQuery *v7;

  v2 = [MPMediaQuery alloc];
  v3 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 65280);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", v4, CFSTR("mediaType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MPMediaQuery initWithFilterPredicates:](v2, "initWithFilterPredicates:", v6);

  return v7;
}

+ (id)musicVideosQuery
{
  MPMediaQuery *v2;
  void *v3;
  void *v4;
  void *v5;
  MPMediaQuery *v6;

  v2 = [MPMediaQuery alloc];
  v3 = (void *)MEMORY[0x1E0C99E60];
  +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", &unk_1E31E4888, CFSTR("mediaType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MPMediaQuery initWithFilterPredicates:](v2, "initWithFilterPredicates:", v5);

  return v6;
}

+ (id)audioPodcastsQuery
{
  MPMediaQuery *v2;
  void *v3;
  void *v4;
  void *v5;
  MPMediaQuery *v6;

  v2 = [MPMediaQuery alloc];
  v3 = (void *)MEMORY[0x1E0C99E60];
  +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", &unk_1E31E48B8, CFSTR("mediaType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MPMediaQuery initWithFilterPredicates:](v2, "initWithFilterPredicates:", v5);

  return v6;
}

+ (id)videoPodcastsQuery
{
  MPMediaQuery *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  MPMediaQuery *v7;

  v2 = [MPMediaQuery alloc];
  v3 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1024);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", v4, CFSTR("mediaType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MPMediaQuery initWithFilterPredicates:](v2, "initWithFilterPredicates:", v6);

  return v7;
}

+ (id)geniusMixesQuery
{
  MPMediaQuery *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc_init(MPMediaQuery);
  -[MPMediaQuery setGroupingType:](v2, "setGroupingType:", 6);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", v3, CFSTR("isHidden"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMediaQuery addFilterPredicate:](v2, "addFilterPredicate:", v4);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", v5, CFSTR("isGeniusMix"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMediaQuery addFilterPredicate:](v2, "addFilterPredicate:", v6);

  return v2;
}

+ (id)playlistsRecentlyAddedQuery
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  void *v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  +[MPMediaQuery playlistsQuery](MPMediaQuery, "playlistsQuery");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C9AAA0];
  +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", MEMORY[0x1E0C9AAA0], CFSTR("isHidden"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addFilterPredicate:", v4);

  +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", v3, CFSTR("isGeniusMix"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addFilterPredicate:", v5);

  +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", v3, CFSTR("isFolder"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addFilterPredicate:", v6);

  v12[0] = CFSTR("dateCreated");
  v12[1] = CFSTR("name");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setOrderingProperties:", v7);

  v10 = CFSTR("dateCreated");
  v11 = &unk_1E31E48B8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setOrderingDirectionMappings:", v8);

  return v2;
}

- (MPMediaPlaylist)containingPlaylist
{
  void *v2;
  void *v3;
  MPMediaPlaylist *v4;

  -[MPMediaQuery predicateForProperty:](self, "predicateForProperty:", CFSTR("playlistPersistentID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = -[MPMediaPlaylist initWithPersistentID:]([MPMediaPlaylist alloc], "initWithPersistentID:", objc_msgSend(v3, "unsignedLongLongValue"));
  else
    v4 = 0;

  return v4;
}

- (void)removePredicatesForProperty:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[MPMediaQuery filterPredicates](self, "filterPredicates", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v10, "property");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqualToString:", v4);

          if (v12)
            -[MPMediaQuery removeFilterPredicate:](self, "removeFilterPredicate:", v10);
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

- (void)setFilterPredicate:(id)a3 forProperty:(id)a4
{
  void *v6;
  id v7;

  v7 = a3;
  -[MPMediaQuery removePredicatesForProperty:](self, "removePredicatesForProperty:", a4);
  v6 = v7;
  if (v7)
  {
    -[MPMediaQuery addFilterPredicate:](self, "addFilterPredicate:", v7);
    v6 = v7;
  }

}

- (void)setFilterPropertyPredicate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "property");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MPMediaQuery setFilterPredicate:forProperty:](self, "setFilterPredicate:forProperty:", v4, v5);

}

- (BOOL)_updatePredicateForProperty:(id)a3 withPropertyPredicate:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  BOOL v10;

  v6 = a3;
  v7 = a4;
  -[MPMediaQuery predicateForProperty:](self, "predicateForProperty:", v6);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (!v7)
  {
    if (v8)
    {
      -[MPMediaQuery removePredicatesForProperty:](self, "removePredicatesForProperty:", v6);
      goto LABEL_6;
    }
LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  if ((objc_msgSend(v7, "isEqual:", v8) & 1) != 0)
    goto LABEL_7;
  -[MPMediaQuery removePredicatesForProperty:](self, "removePredicatesForProperty:", v6);
  -[MPMediaQuery addFilterPredicate:](self, "addFilterPredicate:", v7);
LABEL_6:
  v10 = 1;
LABEL_8:

  return v10;
}

- (MPMediaItemCollection)collectionByJoiningCollections
{
  void *v2;
  MPMediaItemCollection *v3;

  v2 = (void *)-[MPMediaQuery copy](self, "copy");
  objc_msgSend(v2, "setGroupingType:", 0);
  v3 = -[MPMediaItemCollection initWithItemsQuery:]([MPMediaItemCollection alloc], "initWithItemsQuery:", v2);

  return v3;
}

+ (id)activeGeniusPlaylist
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;

  +[MPMediaLibrary defaultMediaLibrary](MPMediaLibrary, "defaultMediaLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHomeSharingLibrary");

  if ((v3 & 1) == 0)
  {
    +[MPMediaQuery playlistsQuery](MPMediaQuery, "playlistsQuery");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", v6, CFSTR("isActiveGeniusPlaylist"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addFilterPredicate:", v7);

    objc_msgSend(v5, "collections");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
    {
      objc_msgSend(v5, "collections");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndex:", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[MPMediaLibrary defaultMediaLibrary](MPMediaLibrary, "defaultMediaLibrary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "writable");

      if (!v12)
      {
        v4 = 0;
        goto LABEL_9;
      }
      +[MPMediaLibrary defaultMediaLibrary](MPMediaLibrary, "defaultMediaLibrary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("DEFAULT_GENIUS_PLAYLIST_NAME"), &stru_1E3163D10, CFSTR("MediaPlayer"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addPlaylistWithName:activeGeniusPlaylist:", v14, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
LABEL_9:

    return v4;
  }
  v4 = 0;
  return v4;
}

+ (id)currentDevicePurchasesPlaylist
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  +[MPMediaQuery playlistsQuery](MPMediaQuery, "playlistsQuery");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", MEMORY[0x1E0C9AAB0], CFSTR("isCurrentDevicePurchasesPlaylist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addFilterPredicate:", v3);

  objc_msgSend(v2, "collections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "objectAtIndex:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)playbackHistoryPlaylist
{
  void *v2;
  void *v3;

  +[MPMediaLibrary deviceMediaLibrary](MPMediaLibrary, "deviceMediaLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playbackHistoryPlaylist");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)MPSD_hasDownloadableEntities
{
  void *v2;
  char v3;

  -[MPMediaQuery MPSD_mediaQueryForDownloadableEntities](self, "MPSD_mediaQueryForDownloadableEntities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_hasItems");

  return v3;
}

- (BOOL)MPSD_hasDownloadingEntities
{
  void *v2;
  char v3;

  -[MPMediaQuery MPSD_mediaQueryForDownloadingEntities](self, "MPSD_mediaQueryForDownloadingEntities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_hasItems");

  return v3;
}

- (id)MPSD_mediaQueryForDownloadableEntities
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _QWORD *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[2];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v2 = (void *)-[MPMediaQuery copy](self, "copy");
  +[MPStoreDownloadManager sharedManager](MPStoreDownloadManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userDownloads");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v39 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        if ((objc_msgSend(v11, "isFinished") & 1) == 0)
        {
          if (!v8)
            v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v12 = objc_msgSend(v11, "libraryItemIdentifier");
          if (v12)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v13);

          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  v14 = objc_msgSend(v8, "count");
  if (v14)
  {
    v32 = v14;
    v33 = v2;
    v15 = malloc_type_malloc(8 * v14, 0x100004000313F17uLL);
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v16 = v8;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    if (v17)
    {
      v18 = v17;
      v19 = 0;
      v20 = *(_QWORD *)v35;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v35 != v20)
            objc_enumerationMutation(v16);
          v15[v19 + j] = objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * j), "longLongValue", v32);
        }
        v19 += j;
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
      }
      while (v18);
    }

    +[MPMediaPersistentIDsPredicate predicateWithPersistentIDs:count:shouldContain:](MPMediaPersistentIDsPredicate, "predicateWithPersistentIDs:count:shouldContain:", v15, v32, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    free(v15);
    v2 = v33;
  }
  else
  {
    v22 = 0;
  }
  +[MPMediaPropertyPredicate predicateWithValue:forProperty:comparisonType:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:comparisonType:", MEMORY[0x1E0C9AAA0], CFSTR("isLocal"), 0, v32);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPMediaPropertyPredicate predicateWithValue:forProperty:comparisonType:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:comparisonType:", v24, CFSTR("isTemporaryCloudDownload"), 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v42[0] = v23;
  v42[1] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPMediaCompoundPredicate predicateMatchingPredicates:](MPMediaCompoundAnyPredicate, "predicateMatchingPredicates:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addFilterPredicate:", v27);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPMediaPropertyPredicate predicateWithValue:forProperty:comparisonType:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:comparisonType:", v28, CFSTR("isStoreRedownloadable"), 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addFilterPredicate:", v29);

  if (v22)
    objc_msgSend(v2, "addFilterPredicate:", v22);
  v30 = v2;

  return v30;
}

- (id)MPSD_mediaQueryForDownloadingEntities
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  +[MPStoreDownloadManager sharedManager](MPStoreDownloadManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userDownloads");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        if ((objc_msgSend(v11, "isFinished") & 1) == 0)
        {
          if (!v8)
            v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v12 = objc_msgSend(v11, "libraryItemIdentifier");
          if (v12)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v13);

          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  v14 = objc_msgSend(v8, "count");
  if (v14)
  {
    v15 = v14;
    v16 = malloc_type_malloc(8 * v14, 0x100004000313F17uLL);
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v17 = v8;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v18)
    {
      v19 = v18;
      v20 = 0;
      v21 = *(_QWORD *)v27;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v27 != v21)
            objc_enumerationMutation(v17);
          v16[v20 + j] = objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * j), "longLongValue");
        }
        v20 += j;
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v19);
    }

    +[MPMediaPersistentIDsPredicate predicateWithPersistentIDs:count:shouldContain:](MPMediaPersistentIDsPredicate, "predicateWithPersistentIDs:count:shouldContain:", v16, v15, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    free(v16);
    v24 = (void *)-[MPMediaQuery copy](self, "copy");
    objc_msgSend(v24, "addFilterPredicate:", v23);

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

@end
