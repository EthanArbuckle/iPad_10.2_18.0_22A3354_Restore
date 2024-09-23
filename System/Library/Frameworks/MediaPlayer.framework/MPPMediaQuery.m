@implementation MPPMediaQuery

- (void)clearFilterPredicates
{
  -[NSMutableArray removeAllObjects](self->_filterPredicates, "removeAllObjects");
}

- (void)addFilterPredicates:(id)a3
{
  id v4;
  NSMutableArray *filterPredicates;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  filterPredicates = self->_filterPredicates;
  v8 = v4;
  if (!filterPredicates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_filterPredicates;
    self->_filterPredicates = v6;

    v4 = v8;
    filterPredicates = self->_filterPredicates;
  }
  -[NSMutableArray addObject:](filterPredicates, "addObject:", v4);

}

- (unint64_t)filterPredicatesCount
{
  return -[NSMutableArray count](self->_filterPredicates, "count");
}

- (id)filterPredicatesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_filterPredicates, "objectAtIndex:", a3);
}

- (int)groupingType
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_groupingType;
  else
    return 1;
}

- (void)setGroupingType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_groupingType = a3;
}

- (void)setHasGroupingType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasGroupingType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)groupingTypeAsString:(int)a3
{
  __CFString *v3;
  id result;

  v3 = CFSTR("Title");
  switch(a3)
  {
    case 1:
      goto LABEL_3;
    case 2:
      v3 = CFSTR("Album");
LABEL_3:
      result = v3;
      break;
    case 3:
      result = CFSTR("Artist");
      break;
    case 4:
      result = CFSTR("AlbumArtist");
      break;
    case 5:
      result = CFSTR("Composer");
      break;
    case 6:
      result = CFSTR("Genre");
      break;
    case 7:
      result = CFSTR("Playlist");
      break;
    case 8:
      result = CFSTR("PodcastTitle");
      break;
    default:
      switch(a3)
      {
        case 'd':
          result = CFSTR("SeriesName");
          break;
        case 'e':
          result = CFSTR("SeasonName");
          break;
        case 'f':
          result = CFSTR("AudioBookTitle");
          break;
        case 'g':
          result = CFSTR("AlbumPersistentID");
          break;
        case 'h':
          result = CFSTR("AlbumByArtist");
          break;
        default:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
          v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_3;
      }
      break;
  }
  return result;
}

- (int)StringAsGroupingType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Title")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Album")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Artist")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AlbumArtist")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Composer")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Genre")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Playlist")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PodcastTitle")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SeriesName")) & 1) != 0)
  {
    v4 = 100;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SeasonName")) & 1) != 0)
  {
    v4 = 101;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AudioBookTitle")) & 1) != 0)
  {
    v4 = 102;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AlbumPersistentID")) & 1) != 0)
  {
    v4 = 103;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AlbumByArtist")))
  {
    v4 = 104;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setFilteringDisabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_filteringDisabled = a3;
}

- (void)setHasFilteringDisabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasFilteringDisabled
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (int)entityOrder
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_entityOrder;
  else
    return 1;
}

- (void)setEntityOrder:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_entityOrder = a3;
}

- (void)setHasEntityOrder:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEntityOrder
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)entityOrderAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return off_1E315ADE0[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsEntityOrder:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Physical")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Sorted")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)clearStaticEntityIdentifiers
{
  -[NSMutableArray removeAllObjects](self->_staticEntityIdentifiers, "removeAllObjects");
}

- (void)addStaticEntityIdentifiers:(id)a3
{
  id v4;
  NSMutableArray *staticEntityIdentifiers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  staticEntityIdentifiers = self->_staticEntityIdentifiers;
  v8 = v4;
  if (!staticEntityIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_staticEntityIdentifiers;
    self->_staticEntityIdentifiers = v6;

    v4 = v8;
    staticEntityIdentifiers = self->_staticEntityIdentifiers;
  }
  -[NSMutableArray addObject:](staticEntityIdentifiers, "addObject:", v4);

}

- (unint64_t)staticEntityIdentifiersCount
{
  return -[NSMutableArray count](self->_staticEntityIdentifiers, "count");
}

- (id)staticEntityIdentifiersAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_staticEntityIdentifiers, "objectAtIndex:", a3);
}

- (int)staticEntityType
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_staticEntityType;
  else
    return 1;
}

- (void)setStaticEntityType:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_staticEntityType = a3;
}

- (void)setHasStaticEntityType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasStaticEntityType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)staticEntityTypeAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("Item");
  if (a3 == 2)
  {
    v3 = CFSTR("Collection");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsStaticEntityType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = 1;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Item")) & 1) == 0)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("Collection")))
      v4 = 2;
    else
      v4 = 1;
  }

  return v4;
}

- (void)setIncludeNonLibraryEntities:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_includeNonLibraryEntities = a3;
}

- (void)setHasIncludeNonLibraryEntities:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIncludeNonLibraryEntities
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
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
  v8.super_class = (Class)MPPMediaQuery;
  -[MPPMediaQuery description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPPMediaQuery dictionaryRepresentation](self, "dictionaryRepresentation");
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
  uint64_t i;
  void *v10;
  char has;
  int groupingType;
  __CFString *v13;
  void *v14;
  unsigned int v15;
  __CFString *v16;
  void *v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  char v24;
  int staticEntityType;
  __CFString *v26;
  void *v27;
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
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_filterPredicates, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_filterPredicates, "count"));
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v5 = self->_filterPredicates;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v34 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "dictionaryRepresentation");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("filterPredicates"));
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    groupingType = self->_groupingType;
    v13 = CFSTR("Title");
    switch(groupingType)
    {
      case 1:
        break;
      case 2:
        v13 = CFSTR("Album");
        break;
      case 3:
        v13 = CFSTR("Artist");
        break;
      case 4:
        v13 = CFSTR("AlbumArtist");
        break;
      case 5:
        v13 = CFSTR("Composer");
        break;
      case 6:
        v13 = CFSTR("Genre");
        break;
      case 7:
        v13 = CFSTR("Playlist");
        break;
      case 8:
        v13 = CFSTR("PodcastTitle");
        break;
      default:
        switch(groupingType)
        {
          case 'd':
            v13 = CFSTR("SeriesName");
            break;
          case 'e':
            v13 = CFSTR("SeasonName");
            break;
          case 'f':
            v13 = CFSTR("AudioBookTitle");
            break;
          case 'g':
            v13 = CFSTR("AlbumPersistentID");
            break;
          case 'h':
            v13 = CFSTR("AlbumByArtist");
            break;
          default:
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_groupingType);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
            break;
        }
        break;
    }
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("groupingType"));

    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_filteringDisabled);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("filteringDisabled"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v15 = self->_entityOrder - 1;
    if (v15 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_entityOrder);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = off_1E315ADE0[v15];
    }
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("entityOrder"));

  }
  if (-[NSMutableArray count](self->_staticEntityIdentifiers, "count"))
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_staticEntityIdentifiers, "count"));
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v18 = self->_staticEntityIdentifiers;
    v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v30;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v30 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * j), "dictionaryRepresentation");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v23);

        }
        v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v20);
    }

    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("staticEntityIdentifiers"));
  }
  v24 = (char)self->_has;
  if ((v24 & 4) != 0)
  {
    staticEntityType = self->_staticEntityType;
    if (staticEntityType == 1)
    {
      v26 = CFSTR("Item");
    }
    else if (staticEntityType == 2)
    {
      v26 = CFSTR("Collection");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_staticEntityType);
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("staticEntityType"));

    v24 = (char)self->_has;
  }
  if ((v24 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_includeNonLibraryEntities);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("includeNonLibraryEntities"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  int *v4;
  int *v5;
  int *v6;
  int *v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  MPPMediaPredicate *v18;
  int v19;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  char v37;
  unsigned int v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  char v42;
  unsigned int v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  char v47;
  uint64_t v48;
  BOOL v49;
  uint64_t v50;

  v4 = (int *)MEMORY[0x1E0D82BF0];
  v5 = (int *)MEMORY[0x1E0D82BD8];
  v6 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v8 = (int *)MEMORY[0x1E0D82BB8];
    while (!*((_BYTE *)a3 + *v6))
    {
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = *v4;
        v13 = *(_QWORD *)((char *)a3 + v12);
        if (v13 == -1 || v13 >= *(_QWORD *)((char *)a3 + *v5))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v13);
        *(_QWORD *)((char *)a3 + v12) = v13 + 1;
        v11 |= (unint64_t)(v14 & 0x7F) << v9;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v9 += 7;
        v15 = v10++ >= 9;
        if (v15)
        {
          v11 = 0;
          v16 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((_BYTE *)a3 + *v6) = 1;
LABEL_12:
      v16 = *((unsigned __int8 *)a3 + *v6);
      if (*((_BYTE *)a3 + *v6))
        v11 = 0;
LABEL_14:
      if (v16 || (v11 & 7) == 4)
        break;
      switch((v11 >> 3))
      {
        case 1u:
          v18 = objc_alloc_init(MPPMediaPredicate);
          -[MPPMediaQuery addFilterPredicates:](self, "addFilterPredicates:", v18);
          if (PBReaderPlaceMark() && MPPMediaPredicateReadFrom(v18, a3))
            goto LABEL_47;
          goto LABEL_86;
        case 2u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          *(_BYTE *)&self->_has |= 2u;
          while (2)
          {
            v23 = *v4;
            v24 = *(_QWORD *)((char *)a3 + v23);
            if (v24 == -1 || v24 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v25 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v24);
              *(_QWORD *)((char *)a3 + v23) = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if (v25 < 0)
              {
                v20 += 7;
                v15 = v21++ >= 9;
                if (v15)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_65;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v22) = 0;
LABEL_65:
          v48 = 24;
          goto LABEL_78;
        case 3u:
          v26 = 0;
          v27 = 0;
          v28 = 0;
          *(_BYTE *)&self->_has |= 8u;
          while (2)
          {
            v29 = *v4;
            v30 = *(_QWORD *)((char *)a3 + v29);
            if (v30 == -1 || v30 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v31 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v30);
              *(_QWORD *)((char *)a3 + v29) = v30 + 1;
              v28 |= (unint64_t)(v31 & 0x7F) << v26;
              if (v31 < 0)
              {
                v26 += 7;
                v15 = v27++ >= 9;
                if (v15)
                {
                  v28 = 0;
                  goto LABEL_69;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v28 = 0;
LABEL_69:
          v49 = v28 != 0;
          v50 = 44;
          goto LABEL_83;
        case 4u:
          v32 = 0;
          v33 = 0;
          v22 = 0;
          *(_BYTE *)&self->_has |= 1u;
          while (2)
          {
            v34 = *v4;
            v35 = *(_QWORD *)((char *)a3 + v34);
            if (v35 == -1 || v35 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v36 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v35);
              *(_QWORD *)((char *)a3 + v34) = v35 + 1;
              v22 |= (unint64_t)(v36 & 0x7F) << v32;
              if (v36 < 0)
              {
                v32 += 7;
                v15 = v33++ >= 9;
                if (v15)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_73;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v22) = 0;
LABEL_73:
          v48 = 8;
          goto LABEL_78;
        case 5u:
          v18 = (MPPMediaPredicate *)objc_alloc_init(MEMORY[0x1E0D511C0]);
          -[MPPMediaQuery addStaticEntityIdentifiers:](self, "addStaticEntityIdentifiers:", v18);
          if (!PBReaderPlaceMark() || (MIPMultiverseIdentifierReadFrom() & 1) == 0)
          {
LABEL_86:

            LOBYTE(v19) = 0;
            return v19;
          }
LABEL_47:
          PBReaderRecallMark();

LABEL_84:
          if (*(_QWORD *)((char *)a3 + *v4) >= *(_QWORD *)((char *)a3 + *v5))
            goto LABEL_85;
          break;
        case 6u:
          v37 = 0;
          v38 = 0;
          v22 = 0;
          *(_BYTE *)&self->_has |= 4u;
          while (2)
          {
            v39 = *v4;
            v40 = *(_QWORD *)((char *)a3 + v39);
            if (v40 == -1 || v40 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v41 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v40);
              *(_QWORD *)((char *)a3 + v39) = v40 + 1;
              v22 |= (unint64_t)(v41 & 0x7F) << v37;
              if (v41 < 0)
              {
                v37 += 7;
                v15 = v38++ >= 9;
                if (v15)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_77;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v22) = 0;
LABEL_77:
          v48 = 40;
LABEL_78:
          *(_DWORD *)((char *)&self->super.super.isa + v48) = v22;
          goto LABEL_84;
        case 7u:
          v42 = 0;
          v43 = 0;
          v44 = 0;
          *(_BYTE *)&self->_has |= 0x10u;
          while (2)
          {
            v45 = *v4;
            v46 = *(_QWORD *)((char *)a3 + v45);
            if (v46 == -1 || v46 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v47 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v46);
              *(_QWORD *)((char *)a3 + v45) = v46 + 1;
              v44 |= (unint64_t)(v47 & 0x7F) << v42;
              if (v47 < 0)
              {
                v42 += 7;
                v15 = v43++ >= 9;
                if (v15)
                {
                  v44 = 0;
                  goto LABEL_82;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v44 = 0;
LABEL_82:
          v49 = v44 != 0;
          v50 = 45;
LABEL_83:
          *((_BYTE *)&self->super.super.isa + v50) = v49;
          goto LABEL_84;
        default:
          v19 = PBReaderSkipValueWithTag();
          if (!v19)
            return v19;
          goto LABEL_84;
      }
    }
  }
LABEL_85:
  LOBYTE(v19) = *((_BYTE *)a3 + *v6) == 0;
  return v19;
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char has;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = self->_filterPredicates;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v7);
  }

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_10:
      if ((has & 1) == 0)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_10;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
LABEL_11:
    PBDataWriterWriteInt32Field();
LABEL_12:
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = self->_staticEntityIdentifiers;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteSubmessage();
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v13);
  }

  v16 = (char)self->_has;
  if ((v16 & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v16 = (char)self->_has;
  }
  if ((v16 & 0x10) != 0)
    PBDataWriterWriteBOOLField();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  char has;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  void *v12;
  char v13;
  id v14;

  v14 = a3;
  if (-[MPPMediaQuery filterPredicatesCount](self, "filterPredicatesCount"))
  {
    objc_msgSend(v14, "clearFilterPredicates");
    v4 = -[MPPMediaQuery filterPredicatesCount](self, "filterPredicatesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[MPPMediaQuery filterPredicatesAtIndex:](self, "filterPredicatesAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addFilterPredicates:", v7);

      }
    }
  }
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_7;
LABEL_19:
    *((_BYTE *)v14 + 44) = self->_filteringDisabled;
    *((_BYTE *)v14 + 48) |= 8u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  *((_DWORD *)v14 + 6) = self->_groupingType;
  *((_BYTE *)v14 + 48) |= 2u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_19;
LABEL_7:
  if ((has & 1) != 0)
  {
LABEL_8:
    *((_DWORD *)v14 + 2) = self->_entityOrder;
    *((_BYTE *)v14 + 48) |= 1u;
  }
LABEL_9:
  if (-[MPPMediaQuery staticEntityIdentifiersCount](self, "staticEntityIdentifiersCount"))
  {
    objc_msgSend(v14, "clearStaticEntityIdentifiers");
    v9 = -[MPPMediaQuery staticEntityIdentifiersCount](self, "staticEntityIdentifiersCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[MPPMediaQuery staticEntityIdentifiersAtIndex:](self, "staticEntityIdentifiersAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addStaticEntityIdentifiers:", v12);

      }
    }
  }
  v13 = (char)self->_has;
  if ((v13 & 4) != 0)
  {
    *((_DWORD *)v14 + 10) = self->_staticEntityType;
    *((_BYTE *)v14 + 48) |= 4u;
    v13 = (char)self->_has;
  }
  if ((v13 & 0x10) != 0)
  {
    *((_BYTE *)v14 + 45) = self->_includeNonLibraryEntities;
    *((_BYTE *)v14 + 48) |= 0x10u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  char has;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  char v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = self->_filterPredicates;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addFilterPredicates:", v11);

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v8);
  }

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_groupingType;
    *(_BYTE *)(v5 + 48) |= 2u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_10:
      if ((has & 1) == 0)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_10;
  }
  *(_BYTE *)(v5 + 44) = self->_filteringDisabled;
  *(_BYTE *)(v5 + 48) |= 8u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_11:
    *(_DWORD *)(v5 + 8) = self->_entityOrder;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
LABEL_12:
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v13 = self->_staticEntityIdentifiers;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v13);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v21);
        objc_msgSend((id)v5, "addStaticEntityIdentifiers:", v18);

      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v15);
  }

  v19 = (char)self->_has;
  if ((v19 & 4) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_staticEntityType;
    *(_BYTE *)(v5 + 48) |= 4u;
    v19 = (char)self->_has;
  }
  if ((v19 & 0x10) != 0)
  {
    *(_BYTE *)(v5 + 45) = self->_includeNonLibraryEntities;
    *(_BYTE *)(v5 + 48) |= 0x10u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *filterPredicates;
  char has;
  char v7;
  NSMutableArray *staticEntityIdentifiers;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_32;
  filterPredicates = self->_filterPredicates;
  if ((unint64_t)filterPredicates | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](filterPredicates, "isEqual:"))
      goto LABEL_32;
  }
  has = (char)self->_has;
  v7 = *((_BYTE *)v4 + 48);
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 2) == 0 || self->_groupingType != *((_DWORD *)v4 + 6))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)v4 + 48) & 2) != 0)
  {
    goto LABEL_32;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 8) == 0)
      goto LABEL_32;
    if (self->_filteringDisabled)
    {
      if (!*((_BYTE *)v4 + 44))
        goto LABEL_32;
    }
    else if (*((_BYTE *)v4 + 44))
    {
      goto LABEL_32;
    }
  }
  else if ((*((_BYTE *)v4 + 48) & 8) != 0)
  {
    goto LABEL_32;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_entityOrder != *((_DWORD *)v4 + 2))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    goto LABEL_32;
  }
  staticEntityIdentifiers = self->_staticEntityIdentifiers;
  if ((unint64_t)staticEntityIdentifiers | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](staticEntityIdentifiers, "isEqual:"))
      goto LABEL_32;
    has = (char)self->_has;
    v7 = *((_BYTE *)v4 + 48);
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_staticEntityType != *((_DWORD *)v4 + 10))
      goto LABEL_32;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_32;
  }
  v9 = (v7 & 0x10) == 0;
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) != 0)
    {
      if (self->_includeNonLibraryEntities)
      {
        if (!*((_BYTE *)v4 + 45))
          goto LABEL_32;
      }
      else if (*((_BYTE *)v4 + 45))
      {
        goto LABEL_32;
      }
      v9 = 1;
      goto LABEL_33;
    }
LABEL_32:
    v9 = 0;
  }
LABEL_33:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = -[NSMutableArray hash](self->_filterPredicates, "hash");
  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_3;
LABEL_6:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v4 = 2654435761 * self->_groupingType;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_6;
LABEL_3:
  v5 = 2654435761 * self->_filteringDisabled;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    v6 = 2654435761 * self->_entityOrder;
    goto LABEL_8;
  }
LABEL_7:
  v6 = 0;
LABEL_8:
  v7 = -[NSMutableArray hash](self->_staticEntityIdentifiers, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v8 = 2654435761 * self->_staticEntityType;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_10;
LABEL_12:
    v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_12;
LABEL_10:
  v9 = 2654435761 * self->_includeNonLibraryEntities;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = *((id *)v4 + 2);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        -[MPPMediaQuery addFilterPredicates:](self, "addFilterPredicates:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v7);
  }

  v10 = *((_BYTE *)v4 + 48);
  if ((v10 & 2) != 0)
  {
    self->_groupingType = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 2u;
    v10 = *((_BYTE *)v4 + 48);
    if ((v10 & 8) == 0)
    {
LABEL_10:
      if ((v10 & 1) == 0)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else if ((*((_BYTE *)v4 + 48) & 8) == 0)
  {
    goto LABEL_10;
  }
  self->_filteringDisabled = *((_BYTE *)v4 + 44);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_11:
    self->_entityOrder = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_12:
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = *((id *)v4 + 4);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        -[MPPMediaQuery addStaticEntityIdentifiers:](self, "addStaticEntityIdentifiers:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * j), (_QWORD)v17);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v13);
  }

  v16 = *((_BYTE *)v4 + 48);
  if ((v16 & 4) != 0)
  {
    self->_staticEntityType = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 4u;
    v16 = *((_BYTE *)v4 + 48);
  }
  if ((v16 & 0x10) != 0)
  {
    self->_includeNonLibraryEntities = *((_BYTE *)v4 + 45);
    *(_BYTE *)&self->_has |= 0x10u;
  }

}

- (NSMutableArray)filterPredicates
{
  return self->_filterPredicates;
}

- (void)setFilterPredicates:(id)a3
{
  objc_storeStrong((id *)&self->_filterPredicates, a3);
}

- (BOOL)filteringDisabled
{
  return self->_filteringDisabled;
}

- (NSMutableArray)staticEntityIdentifiers
{
  return self->_staticEntityIdentifiers;
}

- (void)setStaticEntityIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_staticEntityIdentifiers, a3);
}

- (BOOL)includeNonLibraryEntities
{
  return self->_includeNonLibraryEntities;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staticEntityIdentifiers, 0);
  objc_storeStrong((id *)&self->_filterPredicates, 0);
}

+ (Class)filterPredicatesType
{
  return (Class)objc_opt_class();
}

+ (Class)staticEntityIdentifiersType
{
  return (Class)objc_opt_class();
}

@end
