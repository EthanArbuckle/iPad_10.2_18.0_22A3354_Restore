@implementation MPMusicPlayerMediaItemQueueDescriptor

- (MPMusicPlayerMediaItemQueueDescriptor)initWithQuery:(MPMediaQuery *)query
{
  MPMediaQuery *v5;
  id *v6;
  MPMusicPlayerMediaItemQueueDescriptor *v7;
  id *v8;
  objc_super v10;

  v5 = query;
  v10.receiver = self;
  v10.super_class = (Class)MPMusicPlayerMediaItemQueueDescriptor;
  v6 = -[MPMusicPlayerQueueDescriptor _init](&v10, sel__init);
  v7 = (MPMusicPlayerMediaItemQueueDescriptor *)v6;
  if (v6)
  {
    v8 = v6 + 10;
    objc_storeStrong(v6 + 10, query);
    if (objc_msgSend(*v8, "groupingType") == 6)
      objc_msgSend(*v8, "setGroupingType:", 0);
  }

  return v7;
}

- (MPMusicPlayerMediaItemQueueDescriptor)initWithItemCollection:(MPMediaItemCollection *)itemCollection
{
  MPMediaItemCollection *v5;
  id *v6;
  MPMusicPlayerMediaItemQueueDescriptor *v7;
  objc_super v9;

  v5 = itemCollection;
  v9.receiver = self;
  v9.super_class = (Class)MPMusicPlayerMediaItemQueueDescriptor;
  v6 = -[MPMusicPlayerQueueDescriptor _init](&v9, sel__init);
  v7 = (MPMusicPlayerMediaItemQueueDescriptor *)v6;
  if (v6)
    objc_storeStrong(v6 + 11, itemCollection);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  MPMediaQuery *v6;
  MPMediaQuery *v7;
  MPMediaQuery *v8;
  char v9;
  char v10;
  MPMediaItemCollection *v11;
  MPMediaItemCollection *v12;
  MPMediaItemCollection *v13;
  char v14;
  MPMediaItem *v15;
  MPMediaItem *v16;
  MPMediaItem *v17;
  char v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MPMusicPlayerMediaItemQueueDescriptor;
  if (-[MPMusicPlayerQueueDescriptor isEqual:](&v20, sel_isEqual_, v4))
  {
    v5 = v4;
    v6 = (MPMediaQuery *)v5[10];
    v7 = self->_query;
    v8 = v7;
    if (v7 == v6)
      v9 = 1;
    else
      v9 = -[MPMediaQuery isEqual:](v7, "isEqual:", v6);

    v11 = (MPMediaItemCollection *)v5[11];
    v12 = self->_itemCollection;
    v13 = v12;
    if (v12 == v11)
      v14 = 1;
    else
      v14 = -[MPMediaItemCollection isEqual:](v12, "isEqual:", v11);

    v15 = (MPMediaItem *)v5[12];
    v16 = self->_startItem;
    v17 = v16;
    if (v16 == v15)
      v18 = 1;
    else
      v18 = -[MPMediaItem isEqual:](v16, "isEqual:", v15);

    v10 = v9 & v14 & v18;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (MPMusicPlayerMediaItemQueueDescriptor)initWithCoder:(id)a3
{
  id v4;
  MPMusicPlayerMediaItemQueueDescriptor *v5;
  uint64_t v6;
  MPMediaQuery *query;
  uint64_t v8;
  MPMediaItemCollection *itemCollection;
  uint64_t v10;
  MPMediaItem *startItem;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MPMusicPlayerMediaItemQueueDescriptor;
  v5 = -[MPMusicPlayerQueueDescriptor initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPMusicPlayerMediaItemQueueDescriptorQuery"));
    v6 = objc_claimAutoreleasedReturnValue();
    query = v5->_query;
    v5->_query = (MPMediaQuery *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPMusicPlayerMediaItemQueueDescriptorItemCollection"));
    v8 = objc_claimAutoreleasedReturnValue();
    itemCollection = v5->_itemCollection;
    v5->_itemCollection = (MPMediaItemCollection *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPMusicPlayerMediaItemQueueDescriptorStartItem"));
    v10 = objc_claimAutoreleasedReturnValue();
    startItem = v5->_startItem;
    v5->_startItem = (MPMediaItem *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MPMusicPlayerMediaItemQueueDescriptor;
  v4 = a3;
  -[MPMusicPlayerQueueDescriptor encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_query, CFSTR("MPMusicPlayerMediaItemQueueDescriptorQuery"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_itemCollection, CFSTR("MPMusicPlayerMediaItemQueueDescriptorItemCollection"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_startItem, CFSTR("MPMusicPlayerMediaItemQueueDescriptorStartItem"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MPMusicPlayerMediaItemQueueDescriptor;
  v4 = -[MPMusicPlayerQueueDescriptor copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 10, self->_query);
  objc_storeStrong(v4 + 11, self->_itemCollection);
  objc_storeStrong(v4 + 12, self->_startItem);
  return v4;
}

- (void)setStartTime:(NSTimeInterval)startTime forItem:(MPMediaItem *)mediaItem
{
  MPMediaItem *v6;
  MPIdentifierSet *v7;
  void *v8;
  MPMediaItem *v9;
  MPIdentifierSet *v10;
  objc_super v11;
  _QWORD v12[4];
  MPMediaItem *v13;

  v6 = mediaItem;
  v7 = [MPIdentifierSet alloc];
  +[MPModelSongKind identityKind](MPModelSongKind, "identityKind");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__MPMusicPlayerMediaItemQueueDescriptor_setStartTime_forItem___block_invoke;
  v12[3] = &unk_1E3163A58;
  v13 = v6;
  v9 = v6;
  v10 = -[MPIdentifierSet initWithSource:modelKind:block:](v7, "initWithSource:modelKind:block:", CFSTR("MPMusicPlayerQueueDescriptor"), v8, v12);
  v11.receiver = self;
  v11.super_class = (Class)MPMusicPlayerMediaItemQueueDescriptor;
  -[MPMusicPlayerQueueDescriptor _setStartTime:forIdentifiers:](&v11, sel__setStartTime_forIdentifiers_, v10, startTime);

}

- (void)setEndTime:(NSTimeInterval)endTime forItem:(MPMediaItem *)mediaItem
{
  MPMediaItem *v6;
  MPIdentifierSet *v7;
  void *v8;
  MPMediaItem *v9;
  MPIdentifierSet *v10;
  objc_super v11;
  _QWORD v12[4];
  MPMediaItem *v13;

  v6 = mediaItem;
  v7 = [MPIdentifierSet alloc];
  +[MPModelSongKind identityKind](MPModelSongKind, "identityKind");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __60__MPMusicPlayerMediaItemQueueDescriptor_setEndTime_forItem___block_invoke;
  v12[3] = &unk_1E3163A58;
  v13 = v6;
  v9 = v6;
  v10 = -[MPIdentifierSet initWithSource:modelKind:block:](v7, "initWithSource:modelKind:block:", CFSTR("MPMusicPlayerQueueDescriptor"), v8, v12);
  v11.receiver = self;
  v11.super_class = (Class)MPMusicPlayerMediaItemQueueDescriptor;
  -[MPMusicPlayerQueueDescriptor _setEndTime:forIdentifiers:](&v11, sel__setEndTime_forIdentifiers_, v10, endTime);

}

- (MPMediaQuery)query
{
  MPMediaQuery *v3;
  MPMediaQuery *v4;
  void *v5;
  void *v6;

  v3 = self->_query;
  if (!v3)
  {
    -[MPMediaItemCollection itemsQuery](self->_itemCollection, "itemsQuery");
    v3 = (MPMediaQuery *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [MPMediaQuery alloc];
      -[MPMediaItemCollection items](self->_itemCollection, "items");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = -[MPMediaQuery initWithEntities:entityType:](v4, "initWithEntities:entityType:", v5, 0);

    }
  }
  v6 = (void *)-[MPMediaQuery copy](v3, "copy");

  return (MPMediaQuery *)v6;
}

- (MPMediaItemCollection)itemCollection
{
  MPMediaItemCollection *v3;
  MPMediaItemCollection *v4;
  void *v5;

  v3 = self->_itemCollection;
  if (!v3)
  {
    v4 = [MPMediaItemCollection alloc];
    -[MPMediaQuery items](self->_query, "items");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = -[MPMediaItemCollection initWithItems:](v4, "initWithItems:", v5);

  }
  return v3;
}

- (BOOL)isEmpty
{
  _BOOL4 v2;
  MPMediaItemCollection *itemCollection;
  void *v4;

  if (self->_query)
  {
    return !-[MPMediaQuery _hasItems](self->_query, "_hasItems");
  }
  else
  {
    itemCollection = self->_itemCollection;
    if (itemCollection)
    {
      -[MPMediaItemCollection items](itemCollection, "items");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v2) = objc_msgSend(v4, "count") != 0;

    }
    else
    {
      LOBYTE(v2) = 1;
    }
  }
  return v2;
}

- (MPMediaItem)startItem
{
  return self->_startItem;
}

- (void)setStartItem:(MPMediaItem *)startItem
{
  objc_storeStrong((id *)&self->_startItem, startItem);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startItem, 0);
  objc_storeStrong((id *)&self->_itemCollection, 0);
  objc_storeStrong((id *)&self->_query, 0);
}

void __60__MPMusicPlayerMediaItemQueueDescriptor_setEndTime_forItem___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "mediaLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    +[MPMediaLibrary deviceMediaLibrary](MPMediaLibrary, "deviceMediaLibrary");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v7;

  objc_msgSend(v9, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__MPMusicPlayerMediaItemQueueDescriptor_setEndTime_forItem___block_invoke_2;
  v10[3] = &unk_1E3162B80;
  v11 = *(id *)(a1 + 32);
  objc_msgSend(v4, "setLibraryIdentifiersWithDatabaseID:block:", v8, v10);

}

void __60__MPMusicPlayerMediaItemQueueDescriptor_setEndTime_forItem___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setPersistentID:", objc_msgSend(v2, "persistentID"));

}

void __62__MPMusicPlayerMediaItemQueueDescriptor_setStartTime_forItem___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "mediaLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    +[MPMediaLibrary deviceMediaLibrary](MPMediaLibrary, "deviceMediaLibrary");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v7;

  objc_msgSend(v9, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__MPMusicPlayerMediaItemQueueDescriptor_setStartTime_forItem___block_invoke_2;
  v10[3] = &unk_1E3162B80;
  v11 = *(id *)(a1 + 32);
  objc_msgSend(v4, "setLibraryIdentifiersWithDatabaseID:block:", v8, v10);

}

void __62__MPMusicPlayerMediaItemQueueDescriptor_setStartTime_forItem___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setPersistentID:", objc_msgSend(v2, "persistentID"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
