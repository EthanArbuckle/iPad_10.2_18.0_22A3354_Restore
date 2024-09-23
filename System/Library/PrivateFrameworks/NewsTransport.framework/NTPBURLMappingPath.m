@implementation NTPBURLMappingPath

- (NSString)path
{
  return self->_path;
}

- (NSMutableArray)topicTags
{
  return self->_topicTags;
}

- (NSMutableArray)sectionTags
{
  return self->_sectionTags;
}

- (NSMutableArray)channelTags
{
  return self->_channelTags;
}

- (void)addTopicTags:(id)a3
{
  id v4;
  NSMutableArray *topicTags;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  topicTags = self->_topicTags;
  v8 = v4;
  if (!topicTags)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_topicTags;
    self->_topicTags = v6;

    v4 = v8;
    topicTags = self->_topicTags;
  }
  -[NSMutableArray addObject:](topicTags, "addObject:", v4);

}

- (void)addChannelTags:(id)a3
{
  id v4;
  NSMutableArray *channelTags;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  channelTags = self->_channelTags;
  v8 = v4;
  if (!channelTags)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_channelTags;
    self->_channelTags = v6;

    v4 = v8;
    channelTags = self->_channelTags;
  }
  -[NSMutableArray addObject:](channelTags, "addObject:", v4);

}

- (void)clearTopicTags
{
  -[NSMutableArray removeAllObjects](self->_topicTags, "removeAllObjects");
}

- (unint64_t)topicTagsCount
{
  return -[NSMutableArray count](self->_topicTags, "count");
}

- (id)topicTagsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_topicTags, "objectAtIndex:", a3);
}

+ (Class)topicTagsType
{
  return (Class)objc_opt_class();
}

- (void)clearChannelTags
{
  -[NSMutableArray removeAllObjects](self->_channelTags, "removeAllObjects");
}

- (unint64_t)channelTagsCount
{
  return -[NSMutableArray count](self->_channelTags, "count");
}

- (id)channelTagsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_channelTags, "objectAtIndex:", a3);
}

+ (Class)channelTagsType
{
  return (Class)objc_opt_class();
}

- (void)clearSectionTags
{
  -[NSMutableArray removeAllObjects](self->_sectionTags, "removeAllObjects");
}

- (void)addSectionTags:(id)a3
{
  id v4;
  NSMutableArray *sectionTags;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  sectionTags = self->_sectionTags;
  v8 = v4;
  if (!sectionTags)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_sectionTags;
    self->_sectionTags = v6;

    v4 = v8;
    sectionTags = self->_sectionTags;
  }
  -[NSMutableArray addObject:](sectionTags, "addObject:", v4);

}

- (unint64_t)sectionTagsCount
{
  return -[NSMutableArray count](self->_sectionTags, "count");
}

- (id)sectionTagsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_sectionTags, "objectAtIndex:", a3);
}

+ (Class)sectionTagsType
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
  v8.super_class = (Class)NTPBURLMappingPath;
  -[NTPBURLMappingPath description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBURLMappingPath dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *path;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
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
  _BYTE v40[128];
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  path = self->_path;
  if (path)
    objc_msgSend(v3, "setObject:forKey:", path, CFSTR("path"));
  if (-[NSMutableArray count](self->_topicTags, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_topicTags, "count"));
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v7 = self->_topicTags;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v37 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
      }
      while (v9);
    }

    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("topic_tags"));
  }
  if (-[NSMutableArray count](self->_channelTags, "count"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_channelTags, "count"));
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v14 = self->_channelTags;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v33;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v33 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * j), "dictionaryRepresentation");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v19);

        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
      }
      while (v16);
    }

    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("channel_tags"));
  }
  if (-[NSMutableArray count](self->_sectionTags, "count"))
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_sectionTags, "count"));
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v21 = self->_sectionTags;
    v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v29;
      do
      {
        for (k = 0; k != v23; ++k)
        {
          if (*(_QWORD *)v29 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * k), "dictionaryRepresentation", (_QWORD)v28);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v26);

        }
        v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
      }
      while (v23);
    }

    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("section_tags"));
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBURLMappingPathReadFrom(self, (uint64_t)a3);
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
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  PBDataWriterWriteStringField();
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = self->_topicTags;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v7);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = self->_channelTags;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    }
    while (v12);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = self->_sectionTags;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    }
    while (v17);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
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
  _BYTE v39[128];
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_path, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v8 = self->_topicTags;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v36;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v36 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v12), "copyWithZone:", a3);
        objc_msgSend(v5, "addTopicTags:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    }
    while (v10);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v14 = self->_channelTags;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v32;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v32 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v18), "copyWithZone:", a3);
        objc_msgSend(v5, "addChannelTags:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
    }
    while (v16);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v20 = self->_sectionTags;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v28;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v28 != v23)
          objc_enumerationMutation(v20);
        v25 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v24), "copyWithZone:", a3, (_QWORD)v27);
        objc_msgSend(v5, "addSectionTags:", v25);

        ++v24;
      }
      while (v22 != v24);
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
    }
    while (v22);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *path;
  NSMutableArray *topicTags;
  NSMutableArray *channelTags;
  NSMutableArray *sectionTags;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((path = self->_path, !((unint64_t)path | v4[2])) || -[NSString isEqual:](path, "isEqual:"))
    && ((topicTags = self->_topicTags, !((unint64_t)topicTags | v4[4]))
     || -[NSMutableArray isEqual:](topicTags, "isEqual:"))
    && ((channelTags = self->_channelTags, !((unint64_t)channelTags | v4[1]))
     || -[NSMutableArray isEqual:](channelTags, "isEqual:")))
  {
    sectionTags = self->_sectionTags;
    if ((unint64_t)sectionTags | v4[3])
      v9 = -[NSMutableArray isEqual:](sectionTags, "isEqual:");
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_path, "hash");
  v4 = -[NSMutableArray hash](self->_topicTags, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_channelTags, "hash");
  return v4 ^ v5 ^ -[NSMutableArray hash](self->_sectionTags, "hash");
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
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (*((_QWORD *)v4 + 2))
    -[NTPBURLMappingPath setPath:](self, "setPath:");
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = *((id *)v4 + 4);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v5);
        -[NTPBURLMappingPath addTopicTags:](self, "addTopicTags:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v7);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = *((id *)v4 + 1);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        -[NTPBURLMappingPath addChannelTags:](self, "addChannelTags:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    }
    while (v12);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = *((id *)v4 + 3);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        -[NTPBURLMappingPath addSectionTags:](self, "addSectionTags:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * k), (_QWORD)v20);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    }
    while (v17);
  }

}

- (void)setPath:(id)a3
{
  objc_storeStrong((id *)&self->_path, a3);
}

- (void)setTopicTags:(id)a3
{
  objc_storeStrong((id *)&self->_topicTags, a3);
}

- (void)setChannelTags:(id)a3
{
  objc_storeStrong((id *)&self->_channelTags, a3);
}

- (void)setSectionTags:(id)a3
{
  objc_storeStrong((id *)&self->_sectionTags, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicTags, 0);
  objc_storeStrong((id *)&self->_sectionTags, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_channelTags, 0);
}

@end
