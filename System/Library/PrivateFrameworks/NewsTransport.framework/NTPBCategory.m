@implementation NTPBCategory

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasEntityId
{
  return self->_entityId != 0;
}

- (void)clearRecommendedTopics
{
  -[NSMutableArray removeAllObjects](self->_recommendedTopics, "removeAllObjects");
}

- (void)addRecommendedTopics:(id)a3
{
  id v4;
  NSMutableArray *recommendedTopics;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  recommendedTopics = self->_recommendedTopics;
  v8 = v4;
  if (!recommendedTopics)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_recommendedTopics;
    self->_recommendedTopics = v6;

    v4 = v8;
    recommendedTopics = self->_recommendedTopics;
  }
  -[NSMutableArray addObject:](recommendedTopics, "addObject:", v4);

}

- (unint64_t)recommendedTopicsCount
{
  return -[NSMutableArray count](self->_recommendedTopics, "count");
}

- (id)recommendedTopicsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_recommendedTopics, "objectAtIndex:", a3);
}

+ (Class)recommendedTopicsType
{
  return (Class)objc_opt_class();
}

- (void)clearRecommendedChannels
{
  -[NSMutableArray removeAllObjects](self->_recommendedChannels, "removeAllObjects");
}

- (void)addRecommendedChannels:(id)a3
{
  id v4;
  NSMutableArray *recommendedChannels;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  recommendedChannels = self->_recommendedChannels;
  v8 = v4;
  if (!recommendedChannels)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_recommendedChannels;
    self->_recommendedChannels = v6;

    v4 = v8;
    recommendedChannels = self->_recommendedChannels;
  }
  -[NSMutableArray addObject:](recommendedChannels, "addObject:", v4);

}

- (unint64_t)recommendedChannelsCount
{
  return -[NSMutableArray count](self->_recommendedChannels, "count");
}

- (id)recommendedChannelsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_recommendedChannels, "objectAtIndex:", a3);
}

+ (Class)recommendedChannelsType
{
  return (Class)objc_opt_class();
}

- (void)clearCategoryHierarchys
{
  -[NSMutableArray removeAllObjects](self->_categoryHierarchys, "removeAllObjects");
}

- (void)addCategoryHierarchy:(id)a3
{
  id v4;
  NSMutableArray *categoryHierarchys;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  categoryHierarchys = self->_categoryHierarchys;
  v8 = v4;
  if (!categoryHierarchys)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_categoryHierarchys;
    self->_categoryHierarchys = v6;

    v4 = v8;
    categoryHierarchys = self->_categoryHierarchys;
  }
  -[NSMutableArray addObject:](categoryHierarchys, "addObject:", v4);

}

- (unint64_t)categoryHierarchysCount
{
  return -[NSMutableArray count](self->_categoryHierarchys, "count");
}

- (id)categoryHierarchyAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_categoryHierarchys, "objectAtIndex:", a3);
}

+ (Class)categoryHierarchyType
{
  return (Class)objc_opt_class();
}

- (void)clearCuratedTagIds
{
  -[NSMutableArray removeAllObjects](self->_curatedTagIds, "removeAllObjects");
}

- (void)addCuratedTagIds:(id)a3
{
  id v4;
  NSMutableArray *curatedTagIds;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  curatedTagIds = self->_curatedTagIds;
  v8 = v4;
  if (!curatedTagIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_curatedTagIds;
    self->_curatedTagIds = v6;

    v4 = v8;
    curatedTagIds = self->_curatedTagIds;
  }
  -[NSMutableArray addObject:](curatedTagIds, "addObject:", v4);

}

- (unint64_t)curatedTagIdsCount
{
  return -[NSMutableArray count](self->_curatedTagIds, "count");
}

- (id)curatedTagIdsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_curatedTagIds, "objectAtIndex:", a3);
}

+ (Class)curatedTagIdsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NTPBCategory;
  -[NTPBCategory description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBCategory dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *name;
  NSString *entityId;
  NSMutableArray *recommendedTopics;
  NSMutableArray *recommendedChannels;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSMutableArray *curatedTagIds;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  name = self->_name;
  if (name)
    objc_msgSend(v3, "setObject:forKey:", name, CFSTR("name"));
  entityId = self->_entityId;
  if (entityId)
    objc_msgSend(v4, "setObject:forKey:", entityId, CFSTR("entity_id"));
  recommendedTopics = self->_recommendedTopics;
  if (recommendedTopics)
    objc_msgSend(v4, "setObject:forKey:", recommendedTopics, CFSTR("recommended_topics"));
  recommendedChannels = self->_recommendedChannels;
  if (recommendedChannels)
    objc_msgSend(v4, "setObject:forKey:", recommendedChannels, CFSTR("recommended_channels"));
  if (-[NSMutableArray count](self->_categoryHierarchys, "count"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_categoryHierarchys, "count"));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v10 = self->_categoryHierarchys;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v18);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v15);

        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v12);
    }

    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("category_hierarchy"));
  }
  curatedTagIds = self->_curatedTagIds;
  if (curatedTagIds)
    objc_msgSend(v4, "setObject:forKey:", curatedTagIds, CFSTR("curated_tag_ids"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBCategoryReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_name)
    PBDataWriterWriteStringField();
  if (self->_entityId)
    PBDataWriterWriteStringField();
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v5 = self->_recommendedTopics;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v38;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v38 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
    }
    while (v7);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v10 = self->_recommendedChannels;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v34;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v34 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    }
    while (v12);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v15 = self->_categoryHierarchys;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v30;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v30 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
    }
    while (v17);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v20 = self->_curatedTagIds;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v26;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v26 != v23)
          objc_enumerationMutation(v20);
        PBDataWriterWriteStringField();
        ++v24;
      }
      while (v22 != v24);
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
    }
    while (v22);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  NSMutableArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  v8 = -[NSString copyWithZone:](self->_entityId, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v10 = self->_recommendedTopics;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v48;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v48 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * v14), "copyWithZone:", a3);
        objc_msgSend(v5, "addRecommendedTopics:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
    }
    while (v12);
  }

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v16 = self->_recommendedChannels;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v44;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v44 != v19)
          objc_enumerationMutation(v16);
        v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v20), "copyWithZone:", a3);
        objc_msgSend(v5, "addRecommendedChannels:", v21);

        ++v20;
      }
      while (v18 != v20);
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
    }
    while (v18);
  }

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v22 = self->_categoryHierarchys;
  v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v40;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v40 != v25)
          objc_enumerationMutation(v22);
        v27 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * v26), "copyWithZone:", a3);
        objc_msgSend(v5, "addCategoryHierarchy:", v27);

        ++v26;
      }
      while (v24 != v26);
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
    }
    while (v24);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v28 = self->_curatedTagIds;
  v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v35, v51, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v36;
    do
    {
      v32 = 0;
      do
      {
        if (*(_QWORD *)v36 != v31)
          objc_enumerationMutation(v28);
        v33 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v32), "copyWithZone:", a3, (_QWORD)v35);
        objc_msgSend(v5, "addCuratedTagIds:", v33);

        ++v32;
      }
      while (v30 != v32);
      v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v35, v51, 16);
    }
    while (v30);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *name;
  NSString *entityId;
  NSMutableArray *recommendedTopics;
  NSMutableArray *recommendedChannels;
  NSMutableArray *categoryHierarchys;
  NSMutableArray *curatedTagIds;
  char v11;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((name = self->_name, !((unint64_t)name | v4[4])) || -[NSString isEqual:](name, "isEqual:"))
    && ((entityId = self->_entityId, !((unint64_t)entityId | v4[3]))
     || -[NSString isEqual:](entityId, "isEqual:"))
    && ((recommendedTopics = self->_recommendedTopics, !((unint64_t)recommendedTopics | v4[6]))
     || -[NSMutableArray isEqual:](recommendedTopics, "isEqual:"))
    && ((recommendedChannels = self->_recommendedChannels, !((unint64_t)recommendedChannels | v4[5]))
     || -[NSMutableArray isEqual:](recommendedChannels, "isEqual:"))
    && ((categoryHierarchys = self->_categoryHierarchys, !((unint64_t)categoryHierarchys | v4[1]))
     || -[NSMutableArray isEqual:](categoryHierarchys, "isEqual:")))
  {
    curatedTagIds = self->_curatedTagIds;
    if ((unint64_t)curatedTagIds | v4[2])
      v11 = -[NSMutableArray isEqual:](curatedTagIds, "isEqual:");
    else
      v11 = 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = -[NSString hash](self->_name, "hash");
  v4 = -[NSString hash](self->_entityId, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_recommendedTopics, "hash");
  v6 = v4 ^ v5 ^ -[NSMutableArray hash](self->_recommendedChannels, "hash");
  v7 = -[NSMutableArray hash](self->_categoryHierarchys, "hash");
  return v6 ^ v7 ^ -[NSMutableArray hash](self->_curatedTagIds, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t m;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (*((_QWORD *)v4 + 4))
    -[NTPBCategory setName:](self, "setName:");
  if (*((_QWORD *)v4 + 3))
    -[NTPBCategory setEntityId:](self, "setEntityId:");
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v5 = *((id *)v4 + 6);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v38 != v8)
          objc_enumerationMutation(v5);
        -[NTPBCategory addRecommendedTopics:](self, "addRecommendedTopics:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
    }
    while (v7);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v10 = *((id *)v4 + 5);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v34 != v13)
          objc_enumerationMutation(v10);
        -[NTPBCategory addRecommendedChannels:](self, "addRecommendedChannels:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    }
    while (v12);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v15 = *((id *)v4 + 1);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v30;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v30 != v18)
          objc_enumerationMutation(v15);
        -[NTPBCategory addCategoryHierarchy:](self, "addCategoryHierarchy:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * k));
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
    }
    while (v17);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v20 = *((id *)v4 + 2);
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v26;
    do
    {
      for (m = 0; m != v22; ++m)
      {
        if (*(_QWORD *)v26 != v23)
          objc_enumerationMutation(v20);
        -[NTPBCategory addCuratedTagIds:](self, "addCuratedTagIds:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * m), (_QWORD)v25);
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
    }
    while (v22);
  }

}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)entityId
{
  return self->_entityId;
}

- (void)setEntityId:(id)a3
{
  objc_storeStrong((id *)&self->_entityId, a3);
}

- (NSMutableArray)recommendedTopics
{
  return self->_recommendedTopics;
}

- (void)setRecommendedTopics:(id)a3
{
  objc_storeStrong((id *)&self->_recommendedTopics, a3);
}

- (NSMutableArray)recommendedChannels
{
  return self->_recommendedChannels;
}

- (void)setRecommendedChannels:(id)a3
{
  objc_storeStrong((id *)&self->_recommendedChannels, a3);
}

- (NSMutableArray)categoryHierarchys
{
  return self->_categoryHierarchys;
}

- (void)setCategoryHierarchys:(id)a3
{
  objc_storeStrong((id *)&self->_categoryHierarchys, a3);
}

- (NSMutableArray)curatedTagIds
{
  return self->_curatedTagIds;
}

- (void)setCuratedTagIds:(id)a3
{
  objc_storeStrong((id *)&self->_curatedTagIds, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recommendedTopics, 0);
  objc_storeStrong((id *)&self->_recommendedChannels, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_entityId, 0);
  objc_storeStrong((id *)&self->_curatedTagIds, 0);
  objc_storeStrong((id *)&self->_categoryHierarchys, 0);
}

@end
