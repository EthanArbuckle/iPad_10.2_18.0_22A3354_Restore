@implementation HMDRemoteEventRouterProtoChangeRegistrationsMessage

- (void)clearTopicFilterAdditions
{
  -[NSMutableArray removeAllObjects](self->_topicFilterAdditions, "removeAllObjects");
}

- (void)addTopicFilterAdditions:(id)a3
{
  id v4;
  NSMutableArray *topicFilterAdditions;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  topicFilterAdditions = self->_topicFilterAdditions;
  v8 = v4;
  if (!topicFilterAdditions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_topicFilterAdditions;
    self->_topicFilterAdditions = v6;

    v4 = v8;
    topicFilterAdditions = self->_topicFilterAdditions;
  }
  -[NSMutableArray addObject:](topicFilterAdditions, "addObject:", v4);

}

- (unint64_t)topicFilterAdditionsCount
{
  return -[NSMutableArray count](self->_topicFilterAdditions, "count");
}

- (id)topicFilterAdditionsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_topicFilterAdditions, "objectAtIndex:", a3);
}

- (void)clearTopicFilterRemovals
{
  -[NSMutableArray removeAllObjects](self->_topicFilterRemovals, "removeAllObjects");
}

- (void)addTopicFilterRemovals:(id)a3
{
  id v4;
  NSMutableArray *topicFilterRemovals;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  topicFilterRemovals = self->_topicFilterRemovals;
  v8 = v4;
  if (!topicFilterRemovals)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_topicFilterRemovals;
    self->_topicFilterRemovals = v6;

    v4 = v8;
    topicFilterRemovals = self->_topicFilterRemovals;
  }
  -[NSMutableArray addObject:](topicFilterRemovals, "addObject:", v4);

}

- (unint64_t)topicFilterRemovalsCount
{
  return -[NSMutableArray count](self->_topicFilterRemovals, "count");
}

- (id)topicFilterRemovalsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_topicFilterRemovals, "objectAtIndex:", a3);
}

- (void)clearTopicAdditions
{
  -[NSMutableArray removeAllObjects](self->_topicAdditions, "removeAllObjects");
}

- (void)addTopicAdditions:(id)a3
{
  id v4;
  NSMutableArray *topicAdditions;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  topicAdditions = self->_topicAdditions;
  v8 = v4;
  if (!topicAdditions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_topicAdditions;
    self->_topicAdditions = v6;

    v4 = v8;
    topicAdditions = self->_topicAdditions;
  }
  -[NSMutableArray addObject:](topicAdditions, "addObject:", v4);

}

- (unint64_t)topicAdditionsCount
{
  return -[NSMutableArray count](self->_topicAdditions, "count");
}

- (id)topicAdditionsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_topicAdditions, "objectAtIndex:", a3);
}

- (void)clearTopicRemovals
{
  -[NSMutableArray removeAllObjects](self->_topicRemovals, "removeAllObjects");
}

- (void)addTopicRemovals:(id)a3
{
  id v4;
  NSMutableArray *topicRemovals;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  topicRemovals = self->_topicRemovals;
  v8 = v4;
  if (!topicRemovals)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_topicRemovals;
    self->_topicRemovals = v6;

    v4 = v8;
    topicRemovals = self->_topicRemovals;
  }
  -[NSMutableArray addObject:](topicRemovals, "addObject:", v4);

}

- (unint64_t)topicRemovalsCount
{
  return -[NSMutableArray count](self->_topicRemovals, "count");
}

- (id)topicRemovalsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_topicRemovals, "objectAtIndex:", a3);
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
  v8.super_class = (Class)HMDRemoteEventRouterProtoChangeRegistrationsMessage;
  -[HMDRemoteEventRouterProtoChangeRegistrationsMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteEventRouterProtoChangeRegistrationsMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *topicFilterAdditions;
  NSMutableArray *topicFilterRemovals;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  topicFilterAdditions = self->_topicFilterAdditions;
  if (topicFilterAdditions)
    objc_msgSend(v3, "setObject:forKey:", topicFilterAdditions, CFSTR("topicFilterAdditions"));
  topicFilterRemovals = self->_topicFilterRemovals;
  if (topicFilterRemovals)
    objc_msgSend(v4, "setObject:forKey:", topicFilterRemovals, CFSTR("topicFilterRemovals"));
  if (-[NSMutableArray count](self->_topicAdditions, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_topicAdditions, "count"));
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v8 = self->_topicAdditions;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v27 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "dictionaryRepresentation");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v10);
    }

    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("topicAdditions"));
  }
  if (-[NSMutableArray count](self->_topicRemovals, "count"))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_topicRemovals, "count"));
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v15 = self->_topicRemovals;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v23;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v23 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * j), "dictionaryRepresentation", (_QWORD)v22);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v20);

        }
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      }
      while (v17);
    }

    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("topicRemovals"));
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HMDRemoteEventRouterProtoChangeRegistrationsMessageReadFrom(self, (uint64_t)a3);
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
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v5 = self->_topicFilterAdditions;
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
  v10 = self->_topicFilterRemovals;
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
  v15 = self->_topicAdditions;
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
  v20 = self->_topicRemovals;
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
        PBDataWriterWriteSubmessage();
        ++v24;
      }
      while (v22 != v24);
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
    }
    while (v22);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t k;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t m;
  void *v19;
  id v20;

  v20 = a3;
  if (-[HMDRemoteEventRouterProtoChangeRegistrationsMessage topicFilterAdditionsCount](self, "topicFilterAdditionsCount"))
  {
    objc_msgSend(v20, "clearTopicFilterAdditions");
    v4 = -[HMDRemoteEventRouterProtoChangeRegistrationsMessage topicFilterAdditionsCount](self, "topicFilterAdditionsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[HMDRemoteEventRouterProtoChangeRegistrationsMessage topicFilterAdditionsAtIndex:](self, "topicFilterAdditionsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addTopicFilterAdditions:", v7);

      }
    }
  }
  if (-[HMDRemoteEventRouterProtoChangeRegistrationsMessage topicFilterRemovalsCount](self, "topicFilterRemovalsCount"))
  {
    objc_msgSend(v20, "clearTopicFilterRemovals");
    v8 = -[HMDRemoteEventRouterProtoChangeRegistrationsMessage topicFilterRemovalsCount](self, "topicFilterRemovalsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[HMDRemoteEventRouterProtoChangeRegistrationsMessage topicFilterRemovalsAtIndex:](self, "topicFilterRemovalsAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addTopicFilterRemovals:", v11);

      }
    }
  }
  if (-[HMDRemoteEventRouterProtoChangeRegistrationsMessage topicAdditionsCount](self, "topicAdditionsCount"))
  {
    objc_msgSend(v20, "clearTopicAdditions");
    v12 = -[HMDRemoteEventRouterProtoChangeRegistrationsMessage topicAdditionsCount](self, "topicAdditionsCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[HMDRemoteEventRouterProtoChangeRegistrationsMessage topicAdditionsAtIndex:](self, "topicAdditionsAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addTopicAdditions:", v15);

      }
    }
  }
  if (-[HMDRemoteEventRouterProtoChangeRegistrationsMessage topicRemovalsCount](self, "topicRemovalsCount"))
  {
    objc_msgSend(v20, "clearTopicRemovals");
    v16 = -[HMDRemoteEventRouterProtoChangeRegistrationsMessage topicRemovalsCount](self, "topicRemovalsCount");
    if (v16)
    {
      v17 = v16;
      for (m = 0; m != v17; ++m)
      {
        -[HMDRemoteEventRouterProtoChangeRegistrationsMessage topicRemovalsAtIndex:](self, "topicRemovalsAtIndex:", m);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addTopicRemovals:", v19);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
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
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v6 = self->_topicFilterAdditions;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v44;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v44 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v10), "copyWithZone:", a3);
        objc_msgSend(v5, "addTopicFilterAdditions:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
    }
    while (v8);
  }

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v12 = self->_topicFilterRemovals;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v40;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v40 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * v16), "copyWithZone:", a3);
        objc_msgSend(v5, "addTopicFilterRemovals:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
    }
    while (v14);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v18 = self->_topicAdditions;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v35, v48, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v36;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v36 != v21)
          objc_enumerationMutation(v18);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v22), "copyWithZone:", a3);
        objc_msgSend(v5, "addTopicAdditions:", v23);

        ++v22;
      }
      while (v20 != v22);
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v35, v48, 16);
    }
    while (v20);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v24 = self->_topicRemovals;
  v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v31, v47, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v32;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v32 != v27)
          objc_enumerationMutation(v24);
        v29 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v28), "copyWithZone:", a3, (_QWORD)v31);
        objc_msgSend(v5, "addTopicRemovals:", v29);

        ++v28;
      }
      while (v26 != v28);
      v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v31, v47, 16);
    }
    while (v26);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *topicFilterAdditions;
  NSMutableArray *topicFilterRemovals;
  NSMutableArray *topicAdditions;
  NSMutableArray *topicRemovals;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((topicFilterAdditions = self->_topicFilterAdditions, !((unint64_t)topicFilterAdditions | v4[2]))
     || -[NSMutableArray isEqual:](topicFilterAdditions, "isEqual:"))
    && ((topicFilterRemovals = self->_topicFilterRemovals, !((unint64_t)topicFilterRemovals | v4[3]))
     || -[NSMutableArray isEqual:](topicFilterRemovals, "isEqual:"))
    && ((topicAdditions = self->_topicAdditions, !((unint64_t)topicAdditions | v4[1]))
     || -[NSMutableArray isEqual:](topicAdditions, "isEqual:")))
  {
    topicRemovals = self->_topicRemovals;
    if ((unint64_t)topicRemovals | v4[4])
      v9 = -[NSMutableArray isEqual:](topicRemovals, "isEqual:");
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
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[NSMutableArray hash](self->_topicFilterAdditions, "hash");
  v4 = -[NSMutableArray hash](self->_topicFilterRemovals, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_topicAdditions, "hash");
  return v4 ^ v5 ^ -[NSMutableArray hash](self->_topicRemovals, "hash");
}

- (void)mergeFrom:(id)a3
{
  id *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
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
  v4 = (id *)a3;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v5 = v4[2];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
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
        -[HMDRemoteEventRouterProtoChangeRegistrationsMessage addTopicFilterAdditions:](self, "addTopicFilterAdditions:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
    }
    while (v7);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v10 = v4[3];
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
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
        -[HMDRemoteEventRouterProtoChangeRegistrationsMessage addTopicFilterRemovals:](self, "addTopicFilterRemovals:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v14++));
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    }
    while (v12);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v15 = v4[1];
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
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
        -[HMDRemoteEventRouterProtoChangeRegistrationsMessage addTopicAdditions:](self, "addTopicAdditions:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v19++));
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
    }
    while (v17);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v20 = v4[4];
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
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
        -[HMDRemoteEventRouterProtoChangeRegistrationsMessage addTopicRemovals:](self, "addTopicRemovals:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v24++), (_QWORD)v25);
      }
      while (v22 != v24);
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
    }
    while (v22);
  }

}

- (NSMutableArray)topicFilterAdditions
{
  return self->_topicFilterAdditions;
}

- (void)setTopicFilterAdditions:(id)a3
{
  objc_storeStrong((id *)&self->_topicFilterAdditions, a3);
}

- (NSMutableArray)topicFilterRemovals
{
  return self->_topicFilterRemovals;
}

- (void)setTopicFilterRemovals:(id)a3
{
  objc_storeStrong((id *)&self->_topicFilterRemovals, a3);
}

- (NSMutableArray)topicAdditions
{
  return self->_topicAdditions;
}

- (void)setTopicAdditions:(id)a3
{
  objc_storeStrong((id *)&self->_topicAdditions, a3);
}

- (NSMutableArray)topicRemovals
{
  return self->_topicRemovals;
}

- (void)setTopicRemovals:(id)a3
{
  objc_storeStrong((id *)&self->_topicRemovals, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicRemovals, 0);
  objc_storeStrong((id *)&self->_topicFilterRemovals, 0);
  objc_storeStrong((id *)&self->_topicFilterAdditions, 0);
  objc_storeStrong((id *)&self->_topicAdditions, 0);
}

+ (Class)topicFilterAdditionsType
{
  return (Class)objc_opt_class();
}

+ (Class)topicFilterRemovalsType
{
  return (Class)objc_opt_class();
}

+ (Class)topicAdditionsType
{
  return (Class)objc_opt_class();
}

+ (Class)topicRemovalsType
{
  return (Class)objc_opt_class();
}

@end
