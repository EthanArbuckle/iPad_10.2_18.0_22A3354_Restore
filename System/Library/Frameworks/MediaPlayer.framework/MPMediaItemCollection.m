@implementation MPMediaItemCollection

+ (id)representativePersistentIDPropertyForGroupingType:(int64_t)a3
{
  if (representativePersistentIDPropertyForGroupingType__once != -1)
    dispatch_once(&representativePersistentIDPropertyForGroupingType__once, &__block_literal_global_143);
  return (id)CFDictionaryGetValue((CFDictionaryRef)representativePersistentIDPropertyForGroupingType__groupingTypeToRepresentativePersistentIDProperty, (const void *)a3);
}

- (MPMediaItemCollection)initWithItems:(NSArray *)items
{
  NSArray *v4;
  MPMediaItemCollection *v5;
  uint64_t v6;
  NSArray *v7;
  uint64_t v8;
  MPMediaItem *representativeItem;
  objc_super v11;

  v4 = items;
  v11.receiver = self;
  v11.super_class = (Class)MPMediaItemCollection;
  v5 = -[MPMediaItemCollection init](&v11, sel_init);
  if (v5)
  {
    v5->_itemsCount = -[NSArray count](v4, "count");
    v6 = -[NSArray copy](v4, "copy");
    v7 = v5->_items;
    v5->_items = (NSArray *)v6;

    -[NSArray firstObject](v5->_items, "firstObject");
    v8 = objc_claimAutoreleasedReturnValue();
    representativeItem = v5->_representativeItem;
    v5->_representativeItem = (MPMediaItem *)v8;

  }
  return v5;
}

CFDictionaryRef __75__MPMediaItemCollection_representativePersistentIDPropertyForGroupingType___block_invoke()
{
  CFDictionaryRef result;
  const void *v1[22];
  void *keys[2];
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v10 = xmmword_193F0A510;
  v11 = unk_193F0A520;
  v12 = xmmword_193F0A530;
  v6 = xmmword_193F0A4D0;
  v7 = unk_193F0A4E0;
  v8 = xmmword_193F0A4F0;
  v9 = unk_193F0A500;
  *(_OWORD *)keys = xmmword_193F0A490;
  v3 = unk_193F0A4A0;
  v4 = xmmword_193F0A4B0;
  v5 = unk_193F0A4C0;
  v1[0] = CFSTR("persistentID");
  v1[1] = CFSTR("persistentID");
  v1[2] = CFSTR("albumRepresentativeItemPersistentID");
  v1[3] = CFSTR("albumRepresentativeItemPersistentID");
  v1[4] = CFSTR("albumRepresentativeItemPersistentID");
  v1[5] = CFSTR("albumRepresentativeItemPersistentID");
  v1[6] = CFSTR("artistRepresentativeItemPersistentID");
  v1[7] = CFSTR("albumArtistRepresentativeItemPersistentID");
  v1[8] = CFSTR("albumArtistRepresentativeItemPersistentID");
  v1[9] = CFSTR("albumArtistRepresentativeItemPersistentID");
  v1[10] = CFSTR("composerRepresentativeItemPersistentID");
  v1[11] = CFSTR("composerRepresentativeItemPersistentID");
  v1[12] = CFSTR("composerRepresentativeItemPersistentID");
  v1[13] = CFSTR("genreRepresentativeItemPersistentID");
  v1[14] = CFSTR("genreRepresentativeItemPersistentID");
  v1[15] = CFSTR("genreRepresentativeItemPersistentID");
  v1[16] = CFSTR("albumRepresentativeItemPersistentID");
  v1[17] = CFSTR("artistRepresentativeItemPersistentID");
  v1[18] = CFSTR("albumRepresentativeItemPersistentID");
  v1[19] = CFSTR("albumRepresentativeItemPersistentID");
  v1[20] = CFSTR("albumRepresentativeItemPersistentID");
  v1[21] = CFSTR("albumRepresentativeItemPersistentID");
  result = CFDictionaryCreate(0, (const void **)keys, v1, 22, 0, 0);
  representativePersistentIDPropertyForGroupingType__groupingTypeToRepresentativePersistentIDProperty = (uint64_t)result;
  return result;
}

- (MPMediaItemCollection)initWithItemsQuery:(id)a3
{
  id v4;
  void *v5;
  MPMediaItemCollection *v6;
  uint64_t v7;
  MPMediaQuery *itemsQuery;

  v4 = a3;
  objc_msgSend(v4, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MPMediaItemCollection initWithItems:](self, "initWithItems:", v5);
  if (v6)
  {
    v7 = objc_msgSend(v4, "copy");
    itemsQuery = v6->_itemsQuery;
    v6->_itemsQuery = (MPMediaQuery *)v7;

  }
  return v6;
}

- (MPMediaItemCollection)initWithMultiverseIdentifier:(id)a3 library:(id)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPMediaItemCollection.m"), 136, CFSTR("subclass must implement"));

  return -[MPMediaItemCollection initWithItemsQuery:](self, "initWithItemsQuery:", 0);
}

- (MPMediaItemCollection)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("MPMediaItemCollectionInitException"), CFSTR("-init is not supported, use -initWithItems:"));
  return -[MPMediaItemCollection initWithItemsQuery:](self, "initWithItemsQuery:", 0);
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MPMediaItemCollection;
  v3 = -[MPMediaEntity hash](&v5, sel_hash);
  return -[NSArray hash](self->_items, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  MPMediaItemCollection *v4;
  id *v5;
  unsigned __int8 v6;
  BOOL v7;
  objc_super v9;

  v4 = (MPMediaItemCollection *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (-[NSArray count](self->_items, "count") || objc_msgSend(v5[5], "count"))
      {
        v6 = -[NSArray isEqual:](self->_items, "isEqual:", v5[5]);
      }
      else
      {
        v9.receiver = self;
        v9.super_class = (Class)MPMediaItemCollection;
        v6 = -[MPMediaEntity isEqual:](&v9, sel_isEqual_, v5);
      }
      v7 = v6;

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (MPMediaItemCollection)initWithCoder:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  MPMediaItemCollection *v9;
  uint64_t v10;
  MPMediaItem *representativeItem;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSArray *items;
  uint64_t v18;
  MPMediaQuery *itemsQuery;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((objc_msgSend(v5, "allowsKeyedCoding") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPMediaItemCollection.m"), 162, CFSTR("only keyed coding is supported"));

  }
  MSVPropertyListDataClasses();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setByAddingObject:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("MPItems"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[MPMediaItemCollection initWithItems:](self, "initWithItems:", v8);
  if (v9)
  {
    v9->_itemsCount = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("MPItemsCount"));
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPRepresentativeItem"));
    v10 = objc_claimAutoreleasedReturnValue();
    representativeItem = v9->_representativeItem;
    v9->_representativeItem = (MPMediaItem *)v10;

    v9->_containedMediaTypes = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("MPContainedMediaTypes"));
    v9->_initializedContainedMediaTypes = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("MPInitializedContainedMediaTypes"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v12 = v9->_items;
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v23;
        while (2)
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v23 != v15)
              objc_enumerationMutation(v12);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              goto LABEL_15;
            }
            ++v16;
          }
          while (v14 != v16);
          v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
          if (v14)
            continue;
          break;
        }
      }

    }
    else
    {
LABEL_15:
      items = v9->_items;
      v9->_items = 0;

    }
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPMediaItemsQuery"));
    v18 = objc_claimAutoreleasedReturnValue();
    itemsQuery = v9->_itemsQuery;
    v9->_itemsQuery = (MPMediaQuery *)v18;

  }
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "allowsKeyedCoding") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPMediaItemCollection.m"), 193, CFSTR("only keyed coding is supported"));

  }
  objc_msgSend(v6, "encodeInteger:forKey:", self->_itemsCount, CFSTR("MPItemsCount"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_representativeItem, CFSTR("MPRepresentativeItem"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_containedMediaTypes, CFSTR("MPContainedMediaTypes"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_initializedContainedMediaTypes, CFSTR("MPInitializedContainedMediaTypes"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_items, CFSTR("MPItems"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_itemsQuery, CFSTR("MPMediaItemsQuery"));

}

- (id)itemsQuery
{
  return self->_itemsQuery;
}

- (NSArray)items
{
  return self->_items;
}

- (MPMediaItem)representativeItem
{
  return self->_representativeItem;
}

- (NSUInteger)count
{
  return self->_itemsCount;
}

- (MPMediaType)mediaTypes
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  MPMediaType containedMediaTypes;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[MPMediaItemCollection items](self, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!self->_initializedContainedMediaTypes && objc_msgSend(v3, "count"))
  {
    self->_containedMediaTypes = 0;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "valueForProperty:", CFSTR("mediaType"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          self->_containedMediaTypes |= objc_msgSend(v10, "unsignedIntegerValue");

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

    self->_initializedContainedMediaTypes = 1;
  }
  containedMediaTypes = self->_containedMediaTypes;

  return containedMediaTypes;
}

- (int64_t)groupingType
{
  return 0;
}

- (id)multiverseIdentifier
{
  void *v3;
  void *v4;

  -[MPMediaEntity mediaLibrary](self, "mediaLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "multiverseIdentifierForCollectionWithPersistentID:groupingType:", -[MPMediaEntity persistentID](self, "persistentID"), -[MPMediaItemCollection groupingType](self, "groupingType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)setValue:(id)a3 forProperty:(id)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPMediaItemCollection.m"), 396, CFSTR("subclass must implement"));

  return 0;
}

- (void)setValue:(id)a3 forProperty:(id)a4 withCompletionBlock:(id)a5
{
  void *v7;
  void *v8;
  id v9;

  v9 = a5;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPMediaItemCollection.m"), 401, CFSTR("subclass must implement"));

  v8 = v9;
  if (v9)
  {
    (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, 0, 0);
    v8 = v9;
  }

}

- (void)setValuesForProperties:(id)a3 trackList:(id)a4 withCompletionBlock:(id)a5
{
  void *v7;
  void *v8;
  id v9;

  v9 = a5;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPMediaItemCollection.m"), 406, CFSTR("subclass must implement"));

  v8 = v9;
  if (v9)
  {
    (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, 0, 0);
    v8 = v9;
  }

}

- (void)_enumerateItemPersistentIDsUsingBlock:(id)a3
{
  void (**v4)(id, uint64_t, _BYTE *);
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  char v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, _BYTE *))a3;
  v15 = 0;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_items;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v8)
        objc_enumerationMutation(v5);
      v10 = objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "persistentID", (_QWORD)v11);
      if (v10)
        v4[2](v4, v10, &v15);
      if (v15)
        break;
      if (v7 == ++v9)
      {
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_representativeItem, 0);
  objc_storeStrong((id *)&self->_itemsQuery, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

+ (MPMediaItemCollection)collectionWithItems:(NSArray *)items
{
  NSArray *v3;
  MPMediaItemCollection *v4;

  v3 = items;
  v4 = -[MPMediaItemCollection initWithItems:]([MPMediaItemCollection alloc], "initWithItems:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)titlePropertyForGroupingType:(int64_t)a3
{
  if (titlePropertyForGroupingType__once != -1)
    dispatch_once(&titlePropertyForGroupingType__once, &__block_literal_global_15452);
  return (id)CFDictionaryGetValue((CFDictionaryRef)titlePropertyForGroupingType__groupingTypeToTitleProperty, (const void *)a3);
}

+ (id)sortTitlePropertyForGroupingType:(int64_t)a3
{
  if (sortTitlePropertyForGroupingType__once != -1)
    dispatch_once(&sortTitlePropertyForGroupingType__once, &__block_literal_global_141);
  return (id)CFDictionaryGetValue((CFDictionaryRef)sortTitlePropertyForGroupingType__groupingTypeToSortTitleProperty, (const void *)a3);
}

CFDictionaryRef __58__MPMediaItemCollection_sortTitlePropertyForGroupingType___block_invoke()
{
  CFDictionaryRef result;
  _OWORD v1[6];
  void *keys[2];
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = xmmword_193F0A450;
  v5 = unk_193F0A460;
  v6 = xmmword_193F0A470;
  v7 = unk_193F0A480;
  *(_OWORD *)keys = xmmword_193F0A430;
  v3 = unk_193F0A440;
  v1[2] = xmmword_1E3156B40;
  v1[3] = *(_OWORD *)&off_1E3156B50;
  v1[4] = xmmword_1E3156B60;
  v1[5] = *(_OWORD *)off_1E3156B70;
  v1[0] = xmmword_1E3156B20;
  v1[1] = *(_OWORD *)&off_1E3156B30;
  result = CFDictionaryCreate(0, (const void **)keys, (const void **)v1, 12, 0, 0);
  sortTitlePropertyForGroupingType__groupingTypeToSortTitleProperty = (uint64_t)result;
  return result;
}

CFDictionaryRef __54__MPMediaItemCollection_titlePropertyForGroupingType___block_invoke()
{
  CFDictionaryRef result;
  void *values[17];
  _OWORD keys[8];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  keys[4] = xmmword_193F0A3E8;
  keys[5] = unk_193F0A3F8;
  keys[6] = xmmword_193F0A408;
  keys[7] = unk_193F0A418;
  keys[0] = xmmword_193F0A3A8;
  keys[1] = unk_193F0A3B8;
  keys[2] = xmmword_193F0A3C8;
  keys[3] = unk_193F0A3D8;
  v3 = 10;
  values[0] = CFSTR("albumName");
  values[1] = CFSTR("albumArtistName");
  values[2] = CFSTR("albumArtistName");
  values[3] = CFSTR("albumArtistName");
  values[4] = CFSTR("albumName");
  values[5] = CFSTR("albumName");
  values[6] = CFSTR("albumName");
  values[7] = CFSTR("artistName");
  values[8] = CFSTR("composerName");
  values[9] = CFSTR("composerName");
  values[10] = CFSTR("composerName");
  values[11] = CFSTR("genreName");
  values[12] = CFSTR("genreName");
  values[13] = CFSTR("genreName");
  values[14] = CFSTR("name");
  values[15] = CFSTR("albumName");
  values[16] = CFSTR("albumName");
  result = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 17, 0, 0);
  titlePropertyForGroupingType__groupingTypeToTitleProperty = (uint64_t)result;
  return result;
}

- (id)artworkCatalog
{
  int64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = -[MPMediaItemCollection groupingType](self, "groupingType");
  if (v3 == 2)
  {
    -[MPMediaItemCollection artistArtworkCatalog](self, "artistArtworkCatalog");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v3 != 3)
    {
LABEL_6:
      -[MPMediaItemCollection _artworkCatalogRepresentativeItem](self, "_artworkCatalogRepresentativeItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "artworkCatalogCacheProperties");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (id)objc_msgSend(v6, "valuesForProperties:", v7);

      objc_msgSend(v6, "artworkCatalog");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      return v5;
    }
    -[MPMediaItemCollection albumArtistArtworkCatalog](self, "albumArtistArtworkCatalog");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;
  if (!v4)
    goto LABEL_6;
  return v5;
}

- (id)albumArtistArtworkCatalog
{
  void *v3;
  MPMediaLibraryArtworkRequest *v4;
  void *v5;
  MPMediaLibraryArtworkRequest *v6;
  MPArtworkCatalog *v7;
  void *v8;
  void *v9;
  MPArtworkCatalog *v10;
  void *v11;
  void *v12;
  MPArtworkCatalog *v13;

  if (-[MPMediaItemCollection groupingType](self, "groupingType") == 3)
  {
    -[MPMediaItemCollection _artworkCatalogRepresentativeItem](self, "_artworkCatalogRepresentativeItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = [MPMediaLibraryArtworkRequest alloc];
    -[MPMediaEntity mediaLibrary](self, "mediaLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[MPMediaLibraryArtworkRequest initWithLibrary:identifier:entityType:artworkType:](v4, "initWithLibrary:identifier:entityType:artworkType:", v5, objc_msgSend(v3, "albumArtistPersistentID"), 7, 4);

    v7 = [MPArtworkCatalog alloc];
    -[MPMediaEntity mediaLibrary](self, "mediaLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "artworkDataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[MPArtworkCatalog initWithToken:dataSource:](v7, "initWithToken:dataSource:", v6, v9);

    -[MPMediaEntity mediaLibrary](self, "mediaLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "artworkDataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = objc_msgSend(v12, "areRepresentationsAvailableForCatalog:", v10);

    if ((_DWORD)v9)
      v13 = v10;
    else
      v13 = 0;

  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (id)artistArtworkCatalog
{
  void *v3;
  MPMediaLibraryArtworkRequest *v4;
  void *v5;
  MPMediaLibraryArtworkRequest *v6;
  MPArtworkCatalog *v7;
  void *v8;
  void *v9;
  MPArtworkCatalog *v10;
  void *v11;
  void *v12;
  MPArtworkCatalog *v13;

  if (-[MPMediaItemCollection groupingType](self, "groupingType") == 2)
  {
    -[MPMediaItemCollection _artworkCatalogRepresentativeItem](self, "_artworkCatalogRepresentativeItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = [MPMediaLibraryArtworkRequest alloc];
    -[MPMediaEntity mediaLibrary](self, "mediaLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[MPMediaLibraryArtworkRequest initWithLibrary:identifier:entityType:artworkType:](v4, "initWithLibrary:identifier:entityType:artworkType:", v5, objc_msgSend(v3, "artistPersistentID"), 2, 4);

    v7 = [MPArtworkCatalog alloc];
    -[MPMediaEntity mediaLibrary](self, "mediaLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "artworkDataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[MPArtworkCatalog initWithToken:dataSource:](v7, "initWithToken:dataSource:", v6, v9);

    -[MPMediaEntity mediaLibrary](self, "mediaLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "artworkDataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = objc_msgSend(v12, "areRepresentationsAvailableForCatalog:", v10);

    if ((_DWORD)v9)
      v13 = v10;
    else
      v13 = 0;

  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (id)_artworkCatalogRepresentativeItem
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  +[MPMediaItemCollection representativePersistentIDPropertyForGroupingType:](MPMediaItemCollection, "representativePersistentIDPropertyForGroupingType:", -[MPMediaItemCollection groupingType](self, "groupingType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[MPMediaEntity valueForProperty:](self, "valueForProperty:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = objc_msgSend(v4, "longLongValue");
  if (!v5
    || (v6 = v5,
        -[MPMediaEntity mediaLibrary](self, "mediaLibrary"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "itemWithPersistentID:verifyExistence:", v6, 0),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        !v8))
  {
    -[MPMediaItemCollection representativeItem](self, "representativeItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

+ (id)artworkCatalogCachePropertiesForGroupingType:(int64_t)a3
{
  id v4;
  void *v5;

  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  +[MPMediaItemCollection representativePersistentIDPropertyForGroupingType:](MPMediaItemCollection, "representativePersistentIDPropertyForGroupingType:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "addObject:", v5);

  return v4;
}

- (BOOL)MPSD_hasDownloadingItem
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[MPMediaItemCollection itemsQuery](self, "itemsQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "MPSD_hasDownloadingEntities");
  }
  else
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[MPMediaItemCollection items](self, "items", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "MPSD_isDownloadInProgress") & 1) != 0)
          {

            v5 = 1;
            goto LABEL_13;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v8)
          continue;
        break;
      }
    }

    v5 = 0;
  }
LABEL_13:

  return v5;
}

@end
