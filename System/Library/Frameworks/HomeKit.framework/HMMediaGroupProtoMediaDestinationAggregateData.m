@implementation HMMediaGroupProtoMediaDestinationAggregateData

- (void)clearDestinations
{
  -[NSMutableArray removeAllObjects](self->_destinations, "removeAllObjects");
}

- (void)addDestination:(id)a3
{
  id v4;
  NSMutableArray *destinations;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  destinations = self->_destinations;
  v8 = v4;
  if (!destinations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_destinations;
    self->_destinations = v6;

    v4 = v8;
    destinations = self->_destinations;
  }
  -[NSMutableArray addObject:](destinations, "addObject:", v4);

}

- (unint64_t)destinationsCount
{
  return -[NSMutableArray count](self->_destinations, "count");
}

- (id)destinationAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_destinations, "objectAtIndex:", a3);
}

- (void)clearDestinationControllerDatas
{
  -[NSMutableArray removeAllObjects](self->_destinationControllerDatas, "removeAllObjects");
}

- (void)addDestinationControllerData:(id)a3
{
  id v4;
  NSMutableArray *destinationControllerDatas;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  destinationControllerDatas = self->_destinationControllerDatas;
  v8 = v4;
  if (!destinationControllerDatas)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_destinationControllerDatas;
    self->_destinationControllerDatas = v6;

    v4 = v8;
    destinationControllerDatas = self->_destinationControllerDatas;
  }
  -[NSMutableArray addObject:](destinationControllerDatas, "addObject:", v4);

}

- (unint64_t)destinationControllerDatasCount
{
  return -[NSMutableArray count](self->_destinationControllerDatas, "count");
}

- (id)destinationControllerDataAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_destinationControllerDatas, "objectAtIndex:", a3);
}

- (void)clearGroups
{
  -[NSMutableArray removeAllObjects](self->_groups, "removeAllObjects");
}

- (void)addGroup:(id)a3
{
  id v4;
  NSMutableArray *groups;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  groups = self->_groups;
  v8 = v4;
  if (!groups)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_groups;
    self->_groups = v6;

    v4 = v8;
    groups = self->_groups;
  }
  -[NSMutableArray addObject:](groups, "addObject:", v4);

}

- (unint64_t)groupsCount
{
  return -[NSMutableArray count](self->_groups, "count");
}

- (id)groupAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_groups, "objectAtIndex:", a3);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)HMMediaGroupProtoMediaDestinationAggregateData;
  -[HMMediaGroupProtoMediaDestinationAggregateData description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMediaGroupProtoMediaDestinationAggregateData dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
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
  _BYTE v38[128];
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_destinations, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_destinations, "count"));
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v5 = self->_destinations;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v35;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v35 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v9), "dictionaryRepresentation");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("destination"));
  }
  if (-[NSMutableArray count](self->_destinationControllerDatas, "count"))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_destinationControllerDatas, "count"));
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v12 = self->_destinationControllerDatas;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v31;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v31 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v16), "dictionaryRepresentation");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
      }
      while (v14);
    }

    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("destinationControllerData"));
  }
  if (-[NSMutableArray count](self->_groups, "count"))
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_groups, "count"));
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v19 = self->_groups;
    v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v27;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v27 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v23), "dictionaryRepresentation", (_QWORD)v26);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v24);

          ++v23;
        }
        while (v21 != v23);
        v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
      }
      while (v21);
    }

    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("group"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HMMediaGroupProtoMediaDestinationAggregateDataReadFrom(self, (uint64_t)a3);
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

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v5 = self->_destinations;
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
  v10 = self->_destinationControllerDatas;
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
  v15 = self->_groups;
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
  id v16;

  v16 = a3;
  if (-[HMMediaGroupProtoMediaDestinationAggregateData destinationsCount](self, "destinationsCount"))
  {
    objc_msgSend(v16, "clearDestinations");
    v4 = -[HMMediaGroupProtoMediaDestinationAggregateData destinationsCount](self, "destinationsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[HMMediaGroupProtoMediaDestinationAggregateData destinationAtIndex:](self, "destinationAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addDestination:", v7);

      }
    }
  }
  if (-[HMMediaGroupProtoMediaDestinationAggregateData destinationControllerDatasCount](self, "destinationControllerDatasCount"))
  {
    objc_msgSend(v16, "clearDestinationControllerDatas");
    v8 = -[HMMediaGroupProtoMediaDestinationAggregateData destinationControllerDatasCount](self, "destinationControllerDatasCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[HMMediaGroupProtoMediaDestinationAggregateData destinationControllerDataAtIndex:](self, "destinationControllerDataAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addDestinationControllerData:", v11);

      }
    }
  }
  if (-[HMMediaGroupProtoMediaDestinationAggregateData groupsCount](self, "groupsCount"))
  {
    objc_msgSend(v16, "clearGroups");
    v12 = -[HMMediaGroupProtoMediaDestinationAggregateData groupsCount](self, "groupsCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[HMMediaGroupProtoMediaDestinationAggregateData groupAtIndex:](self, "groupAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addGroup:", v15);

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
  _BYTE v37[128];
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v6 = self->_destinations;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v34;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v34 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v10), "copyWithZone:", a3);
        objc_msgSend(v5, "addDestination:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v8);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v12 = self->_destinationControllerDatas;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v30;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v30 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v16), "copyWithZone:", a3);
        objc_msgSend(v5, "addDestinationControllerData:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    }
    while (v14);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v18 = self->_groups;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v26;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v26 != v21)
          objc_enumerationMutation(v18);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v22), "copyWithZone:", a3, (_QWORD)v25);
        objc_msgSend(v5, "addGroup:", v23);

        ++v22;
      }
      while (v20 != v22);
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
    }
    while (v20);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *destinations;
  NSMutableArray *destinationControllerDatas;
  NSMutableArray *groups;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((destinations = self->_destinations, !((unint64_t)destinations | v4[2]))
     || -[NSMutableArray isEqual:](destinations, "isEqual:"))
    && ((destinationControllerDatas = self->_destinationControllerDatas,
         !((unint64_t)destinationControllerDatas | v4[1]))
     || -[NSMutableArray isEqual:](destinationControllerDatas, "isEqual:")))
  {
    groups = self->_groups;
    if ((unint64_t)groups | v4[3])
      v8 = -[NSMutableArray isEqual:](groups, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSMutableArray hash](self->_destinations, "hash");
  v4 = -[NSMutableArray hash](self->_destinationControllerDatas, "hash") ^ v3;
  return v4 ^ -[NSMutableArray hash](self->_groups, "hash");
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

  v35 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v5 = v4[2];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
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
        -[HMMediaGroupProtoMediaDestinationAggregateData addDestination:](self, "addDestination:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v7);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = v4[1];
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
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
        -[HMMediaGroupProtoMediaDestinationAggregateData addDestinationControllerData:](self, "addDestinationControllerData:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v14++));
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    }
    while (v12);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = v4[3];
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
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
        -[HMMediaGroupProtoMediaDestinationAggregateData addGroup:](self, "addGroup:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v19++), (_QWORD)v20);
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    }
    while (v17);
  }

}

- (NSMutableArray)destinations
{
  return self->_destinations;
}

- (void)setDestinations:(id)a3
{
  objc_storeStrong((id *)&self->_destinations, a3);
}

- (NSMutableArray)destinationControllerDatas
{
  return self->_destinationControllerDatas;
}

- (void)setDestinationControllerDatas:(id)a3
{
  objc_storeStrong((id *)&self->_destinationControllerDatas, a3);
}

- (NSMutableArray)groups
{
  return self->_groups;
}

- (void)setGroups:(id)a3
{
  objc_storeStrong((id *)&self->_groups, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groups, 0);
  objc_storeStrong((id *)&self->_destinations, 0);
  objc_storeStrong((id *)&self->_destinationControllerDatas, 0);
}

+ (Class)destinationType
{
  return (Class)objc_opt_class();
}

+ (Class)destinationControllerDataType
{
  return (Class)objc_opt_class();
}

+ (Class)groupType
{
  return (Class)objc_opt_class();
}

@end
