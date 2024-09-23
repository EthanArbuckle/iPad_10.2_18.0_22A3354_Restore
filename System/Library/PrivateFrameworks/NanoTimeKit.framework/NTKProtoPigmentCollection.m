@implementation NTKProtoPigmentCollection

- (BOOL)hasConfig
{
  return self->_config != 0;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasDefaultOption
{
  return self->_defaultOption != 0;
}

- (void)clearItems
{
  -[NSMutableArray removeAllObjects](self->_items, "removeAllObjects");
}

- (void)addItems:(id)a3
{
  id v4;
  NSMutableArray *items;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  items = self->_items;
  v8 = v4;
  if (!items)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_items;
    self->_items = v6;

    v4 = v8;
    items = self->_items;
  }
  -[NSMutableArray addObject:](items, "addObject:", v4);

}

- (unint64_t)itemsCount
{
  return -[NSMutableArray count](self->_items, "count");
}

- (id)itemsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_items, "objectAtIndex:", a3);
}

+ (Class)itemsType
{
  return (Class)objc_opt_class();
}

- (void)clearDefaultGalleryColors
{
  -[NSMutableArray removeAllObjects](self->_defaultGalleryColors, "removeAllObjects");
}

- (void)addDefaultGalleryColors:(id)a3
{
  id v4;
  NSMutableArray *defaultGalleryColors;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  defaultGalleryColors = self->_defaultGalleryColors;
  v8 = v4;
  if (!defaultGalleryColors)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_defaultGalleryColors;
    self->_defaultGalleryColors = v6;

    v4 = v8;
    defaultGalleryColors = self->_defaultGalleryColors;
  }
  -[NSMutableArray addObject:](defaultGalleryColors, "addObject:", v4);

}

- (unint64_t)defaultGalleryColorsCount
{
  return -[NSMutableArray count](self->_defaultGalleryColors, "count");
}

- (id)defaultGalleryColorsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_defaultGalleryColors, "objectAtIndex:", a3);
}

+ (Class)defaultGalleryColorsType
{
  return (Class)objc_opt_class();
}

- (void)clearCollections
{
  -[NSMutableArray removeAllObjects](self->_collections, "removeAllObjects");
}

- (void)addCollections:(id)a3
{
  id v4;
  NSMutableArray *collections;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  collections = self->_collections;
  v8 = v4;
  if (!collections)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_collections;
    self->_collections = v6;

    v4 = v8;
    collections = self->_collections;
  }
  -[NSMutableArray addObject:](collections, "addObject:", v4);

}

- (unint64_t)collectionsCount
{
  return -[NSMutableArray count](self->_collections, "count");
}

- (id)collectionsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_collections, "objectAtIndex:", a3);
}

+ (Class)collectionsType
{
  return (Class)objc_opt_class();
}

- (void)setIsShared:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isShared = a3;
}

- (void)setHasIsShared:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsShared
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setIsStub:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isStub = a3;
}

- (void)setHasIsStub:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsStub
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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
  v8.super_class = (Class)NTKProtoPigmentCollection;
  -[NTKProtoPigmentCollection description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKProtoPigmentCollection dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  NTKProtoPigmentCollectionConfig *config;
  void *v5;
  NSString *name;
  NTKProtoPigment *defaultOption;
  void *v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  void *v29;
  char has;
  void *v31;
  void *v32;
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
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  config = self->_config;
  if (config)
  {
    -[NTKProtoPigmentCollectionConfig dictionaryRepresentation](config, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("config"));

  }
  name = self->_name;
  if (name)
    objc_msgSend(v3, "setObject:forKey:", name, CFSTR("name"));
  defaultOption = self->_defaultOption;
  if (defaultOption)
  {
    -[NTKProtoPigment dictionaryRepresentation](defaultOption, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("defaultOption"));

  }
  if (-[NSMutableArray count](self->_items, "count"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_items, "count"));
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v10 = self->_items;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v43 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "dictionaryRepresentation");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v15);

        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
      }
      while (v12);
    }

    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("items"));
  }
  if (-[NSMutableArray count](self->_defaultGalleryColors, "count"))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_defaultGalleryColors, "count"));
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v17 = self->_defaultGalleryColors;
    v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v39;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v39 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * j), "dictionaryRepresentation");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v22);

        }
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
      }
      while (v19);
    }

    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("defaultGalleryColors"));
  }
  if (-[NSMutableArray count](self->_collections, "count"))
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_collections, "count"));
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v24 = self->_collections;
    v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v35;
      do
      {
        for (k = 0; k != v26; ++k)
        {
          if (*(_QWORD *)v35 != v27)
            objc_enumerationMutation(v24);
          objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * k), "dictionaryRepresentation", (_QWORD)v34);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addObject:", v29);

        }
        v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
      }
      while (v26);
    }

    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("collections"));
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isShared);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("isShared"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isStub);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("isStub"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTKProtoPigmentCollectionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  char has;
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
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_config)
    PBDataWriterWriteSubmessage();
  if (self->_name)
    PBDataWriterWriteStringField();
  if (self->_defaultOption)
    PBDataWriterWriteSubmessage();
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v5 = self->_items;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v30 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v7);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v10 = self->_defaultGalleryColors;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    }
    while (v12);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v15 = self->_collections;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v22;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v22 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteSubmessage();
      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
    }
    while (v17);
  }

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteBOOLField();

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
  char has;
  _BYTE *v17;

  v17 = a3;
  if (self->_config)
    objc_msgSend(v17, "setConfig:");
  if (self->_name)
    objc_msgSend(v17, "setName:");
  if (self->_defaultOption)
    objc_msgSend(v17, "setDefaultOption:");
  if (-[NTKProtoPigmentCollection itemsCount](self, "itemsCount"))
  {
    objc_msgSend(v17, "clearItems");
    v4 = -[NTKProtoPigmentCollection itemsCount](self, "itemsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[NTKProtoPigmentCollection itemsAtIndex:](self, "itemsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addItems:", v7);

      }
    }
  }
  if (-[NTKProtoPigmentCollection defaultGalleryColorsCount](self, "defaultGalleryColorsCount"))
  {
    objc_msgSend(v17, "clearDefaultGalleryColors");
    v8 = -[NTKProtoPigmentCollection defaultGalleryColorsCount](self, "defaultGalleryColorsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[NTKProtoPigmentCollection defaultGalleryColorsAtIndex:](self, "defaultGalleryColorsAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addDefaultGalleryColors:", v11);

      }
    }
  }
  if (-[NTKProtoPigmentCollection collectionsCount](self, "collectionsCount"))
  {
    objc_msgSend(v17, "clearCollections");
    v12 = -[NTKProtoPigmentCollection collectionsCount](self, "collectionsCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[NTKProtoPigmentCollection collectionsAtIndex:](self, "collectionsAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addCollections:", v15);

      }
    }
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v17[56] = self->_isShared;
    v17[60] |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v17[57] = self->_isStub;
    v17[60] |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  void *v29;
  char has;
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
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NTKProtoPigmentCollectionConfig copyWithZone:](self->_config, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v8;

  v10 = -[NTKProtoPigment copyWithZone:](self->_defaultOption, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v10;

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v12 = self->_items;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v41 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addItems:", v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    }
    while (v14);
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v18 = self->_defaultGalleryColors;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v37;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v37 != v21)
          objc_enumerationMutation(v18);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addDefaultGalleryColors:", v23);

      }
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    }
    while (v20);
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v24 = self->_collections;
  v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v33;
    do
    {
      for (k = 0; k != v26; ++k)
      {
        if (*(_QWORD *)v33 != v27)
          objc_enumerationMutation(v24);
        v29 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * k), "copyWithZone:", a3, (_QWORD)v32);
        objc_msgSend((id)v5, "addCollections:", v29);

      }
      v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
    }
    while (v26);
  }

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_BYTE *)(v5 + 56) = self->_isShared;
    *(_BYTE *)(v5 + 60) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_BYTE *)(v5 + 57) = self->_isStub;
    *(_BYTE *)(v5 + 60) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NTKProtoPigmentCollectionConfig *config;
  NSString *name;
  NTKProtoPigment *defaultOption;
  NSMutableArray *items;
  NSMutableArray *defaultGalleryColors;
  NSMutableArray *collections;
  BOOL v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_24;
  config = self->_config;
  if ((unint64_t)config | *((_QWORD *)v4 + 2))
  {
    if (!-[NTKProtoPigmentCollectionConfig isEqual:](config, "isEqual:"))
      goto LABEL_24;
  }
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](name, "isEqual:"))
      goto LABEL_24;
  }
  defaultOption = self->_defaultOption;
  if ((unint64_t)defaultOption | *((_QWORD *)v4 + 4))
  {
    if (!-[NTKProtoPigment isEqual:](defaultOption, "isEqual:"))
      goto LABEL_24;
  }
  items = self->_items;
  if ((unint64_t)items | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](items, "isEqual:"))
      goto LABEL_24;
  }
  defaultGalleryColors = self->_defaultGalleryColors;
  if ((unint64_t)defaultGalleryColors | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](defaultGalleryColors, "isEqual:"))
      goto LABEL_24;
  }
  collections = self->_collections;
  if ((unint64_t)collections | *((_QWORD *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](collections, "isEqual:"))
      goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) == 0)
      goto LABEL_24;
    if (self->_isShared)
    {
      if (!*((_BYTE *)v4 + 56))
        goto LABEL_24;
    }
    else if (*((_BYTE *)v4 + 56))
    {
      goto LABEL_24;
    }
  }
  else if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
    goto LABEL_24;
  }
  v11 = (*((_BYTE *)v4 + 60) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 2) != 0)
    {
      if (self->_isStub)
      {
        if (!*((_BYTE *)v4 + 57))
          goto LABEL_24;
      }
      else if (*((_BYTE *)v4 + 57))
      {
        goto LABEL_24;
      }
      v11 = 1;
      goto LABEL_25;
    }
LABEL_24:
    v11 = 0;
  }
LABEL_25:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = -[NTKProtoPigmentCollectionConfig hash](self->_config, "hash");
  v4 = -[NSString hash](self->_name, "hash");
  v5 = -[NTKProtoPigment hash](self->_defaultOption, "hash");
  v6 = -[NSMutableArray hash](self->_items, "hash");
  v7 = -[NSMutableArray hash](self->_defaultGalleryColors, "hash");
  v8 = -[NSMutableArray hash](self->_collections, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v9 = 2654435761 * self->_isShared;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  }
  v9 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v10 = 2654435761 * self->_isStub;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  NTKProtoPigmentCollectionConfig *config;
  uint64_t v6;
  NTKProtoPigment *defaultOption;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  char v24;
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
  v4 = a3;
  config = self->_config;
  v6 = *((_QWORD *)v4 + 2);
  if (config)
  {
    if (v6)
      -[NTKProtoPigmentCollectionConfig mergeFrom:](config, "mergeFrom:");
  }
  else if (v6)
  {
    -[NTKProtoPigmentCollection setConfig:](self, "setConfig:");
  }
  if (*((_QWORD *)v4 + 6))
    -[NTKProtoPigmentCollection setName:](self, "setName:");
  defaultOption = self->_defaultOption;
  v8 = *((_QWORD *)v4 + 4);
  if (defaultOption)
  {
    if (v8)
      -[NTKProtoPigment mergeFrom:](defaultOption, "mergeFrom:");
  }
  else if (v8)
  {
    -[NTKProtoPigmentCollection setDefaultOption:](self, "setDefaultOption:");
  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v9 = *((id *)v4 + 5);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v34 != v12)
          objc_enumerationMutation(v9);
        -[NTKProtoPigmentCollection addItems:](self, "addItems:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i));
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v11);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v14 = *((id *)v4 + 3);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v30 != v17)
          objc_enumerationMutation(v14);
        -[NTKProtoPigmentCollection addDefaultGalleryColors:](self, "addDefaultGalleryColors:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j));
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    }
    while (v16);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v19 = *((id *)v4 + 1);
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v26;
    do
    {
      for (k = 0; k != v21; ++k)
      {
        if (*(_QWORD *)v26 != v22)
          objc_enumerationMutation(v19);
        -[NTKProtoPigmentCollection addCollections:](self, "addCollections:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * k), (_QWORD)v25);
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
    }
    while (v21);
  }

  v24 = *((_BYTE *)v4 + 60);
  if ((v24 & 1) != 0)
  {
    self->_isShared = *((_BYTE *)v4 + 56);
    *(_BYTE *)&self->_has |= 1u;
    v24 = *((_BYTE *)v4 + 60);
  }
  if ((v24 & 2) != 0)
  {
    self->_isStub = *((_BYTE *)v4 + 57);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (NTKProtoPigmentCollectionConfig)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
  objc_storeStrong((id *)&self->_config, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NTKProtoPigment)defaultOption
{
  return self->_defaultOption;
}

- (void)setDefaultOption:(id)a3
{
  objc_storeStrong((id *)&self->_defaultOption, a3);
}

- (NSMutableArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (NSMutableArray)defaultGalleryColors
{
  return self->_defaultGalleryColors;
}

- (void)setDefaultGalleryColors:(id)a3
{
  objc_storeStrong((id *)&self->_defaultGalleryColors, a3);
}

- (NSMutableArray)collections
{
  return self->_collections;
}

- (void)setCollections:(id)a3
{
  objc_storeStrong((id *)&self->_collections, a3);
}

- (BOOL)isShared
{
  return self->_isShared;
}

- (BOOL)isStub
{
  return self->_isStub;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_defaultOption, 0);
  objc_storeStrong((id *)&self->_defaultGalleryColors, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_collections, 0);
}

@end
