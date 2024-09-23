@implementation GEOSubactionMetaData

- (GEOSubactionMetaData)init
{
  GEOSubactionMetaData *v2;
  GEOSubactionMetaData *v3;
  GEOSubactionMetaData *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOSubactionMetaData;
  v2 = -[GEOSubactionMetaData init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOSubactionMetaData)initWithData:(id)a3
{
  GEOSubactionMetaData *v3;
  GEOSubactionMetaData *v4;
  GEOSubactionMetaData *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOSubactionMetaData;
  v3 = -[GEOSubactionMetaData initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOSubactionMetaData;
  -[GEOSubactionMetaData dealloc](&v3, sel_dealloc);
}

- (int)selectedSubactionIndex
{
  return self->_selectedSubactionIndex;
}

- (void)setSelectedSubactionIndex:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x41u;
  self->_selectedSubactionIndex = a3;
}

- (void)setHasSelectedSubactionIndex:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x40;
}

- (BOOL)hasSelectedSubactionIndex
{
  return *(_BYTE *)&self->_flags & 1;
}

- (int)subactionType
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0)
    return self->_subactionType;
  else
    return 0;
}

- (void)setSubactionType:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x42u;
  self->_subactionType = a3;
}

- (void)setHasSubactionType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 66;
  else
    v3 = 64;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasSubactionType
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)subactionTypeAsString:(int)a3
{
  if (a3 < 4)
    return *((id *)&off_1E1C14AC0 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSubactionType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("USER_ACTION")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SUB_POI")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("TAP_PUBLISHER_COLLECTIONS")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readDisplayedString
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 84) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOSubactionMetaDataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDisplayedString_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasDisplayedString
{
  -[GEOSubactionMetaData _readDisplayedString]((uint64_t)self);
  return self->_displayedString != 0;
}

- (NSString)displayedString
{
  -[GEOSubactionMetaData _readDisplayedString]((uint64_t)self);
  return self->_displayedString;
}

- (void)setDisplayedString:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x50u;
  objc_storeStrong((id *)&self->_displayedString, a3);
}

- (void)_readSubactions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 84) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOSubactionMetaDataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSubactions_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (unint64_t)subactionsCount
{
  -[GEOSubactionMetaData _readSubactions]((uint64_t)self);
  return self->_subactions.count;
}

- (int)subactions
{
  -[GEOSubactionMetaData _readSubactions]((uint64_t)self);
  return self->_subactions.list;
}

- (void)clearSubactions
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  PBRepeatedInt32Clear();
}

- (void)addSubaction:(int)a3
{
  -[GEOSubactionMetaData _readSubactions]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
}

- (int)subactionAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_subactions;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOSubactionMetaData _readSubactions]((uint64_t)self);
  p_subactions = &self->_subactions;
  count = self->_subactions.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise");

  }
  return p_subactions->list[a3];
}

- (void)setSubactions:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  PBRepeatedInt32Set();
}

- (id)subactionsAsString:(int)a3
{
  if (a3 < 4)
    return *((id *)&off_1E1C14AC0 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSubactions:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("USER_ACTION")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SUB_POI")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("TAP_PUBLISHER_COLLECTIONS")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readDisplayedTexts
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 84) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOSubactionMetaDataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDisplayedTexts_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)displayedTexts
{
  -[GEOSubactionMetaData _readDisplayedTexts]((uint64_t)self);
  return self->_displayedTexts;
}

- (void)setDisplayedTexts:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *displayedTexts;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  displayedTexts = self->_displayedTexts;
  self->_displayedTexts = v4;

}

- (void)clearDisplayedTexts
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  -[NSMutableArray removeAllObjects](self->_displayedTexts, "removeAllObjects");
}

- (void)addDisplayedText:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOSubactionMetaData _readDisplayedTexts]((uint64_t)self);
  -[GEOSubactionMetaData _addNoFlagsDisplayedText:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
}

- (void)_addNoFlagsDisplayedText:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 56);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 56);
      *(_QWORD *)(a1 + 56) = v5;

      v4 = *(void **)(a1 + 56);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)displayedTextsCount
{
  -[GEOSubactionMetaData _readDisplayedTexts]((uint64_t)self);
  return -[NSMutableArray count](self->_displayedTexts, "count");
}

- (id)displayedTextAtIndex:(unint64_t)a3
{
  -[GEOSubactionMetaData _readDisplayedTexts]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_displayedTexts, "objectAtIndex:", a3);
}

+ (Class)displayedTextType
{
  return (Class)objc_opt_class();
}

- (void)_readChildItemSubactionTypes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 84) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOSubactionMetaDataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readChildItemSubactionTypes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)childItemSubactionTypes
{
  -[GEOSubactionMetaData _readChildItemSubactionTypes]((uint64_t)self);
  return self->_childItemSubactionTypes;
}

- (void)setChildItemSubactionTypes:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *childItemSubactionTypes;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  childItemSubactionTypes = self->_childItemSubactionTypes;
  self->_childItemSubactionTypes = v4;

}

- (void)clearChildItemSubactionTypes
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  -[NSMutableArray removeAllObjects](self->_childItemSubactionTypes, "removeAllObjects");
}

- (void)addChildItemSubactionType:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOSubactionMetaData _readChildItemSubactionTypes]((uint64_t)self);
  -[GEOSubactionMetaData _addNoFlagsChildItemSubactionType:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
}

- (void)_addNoFlagsChildItemSubactionType:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 40);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 40);
      *(_QWORD *)(a1 + 40) = v5;

      v4 = *(void **)(a1 + 40);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)childItemSubactionTypesCount
{
  -[GEOSubactionMetaData _readChildItemSubactionTypes]((uint64_t)self);
  return -[NSMutableArray count](self->_childItemSubactionTypes, "count");
}

- (id)childItemSubactionTypeAtIndex:(unint64_t)a3
{
  -[GEOSubactionMetaData _readChildItemSubactionTypes]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_childItemSubactionTypes, "objectAtIndex:", a3);
}

+ (Class)childItemSubactionTypeType
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOSubactionMetaData;
  -[GEOSubactionMetaData description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOSubactionMetaData dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOSubactionMetaData _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  _QWORD *v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_BYTE *)(a1 + 84);
    if ((v5 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 76));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v7 = CFSTR("selectedSubactionIndex");
      else
        v7 = CFSTR("selected_subaction_index");
      objc_msgSend(v4, "setObject:forKey:", v6, v7);

      v5 = *(_BYTE *)(a1 + 84);
    }
    if ((v5 & 2) != 0)
    {
      v8 = *(int *)(a1 + 80);
      if (v8 >= 4)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 80));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = (void *)*((_QWORD *)&off_1E1C14AC0 + v8);
      }
      if (a2)
        v10 = CFSTR("subactionType");
      else
        v10 = CFSTR("subaction_type");
      objc_msgSend(v4, "setObject:forKey:", v9, v10);

    }
    objc_msgSend((id)a1, "displayedString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      if (a2)
        v12 = CFSTR("displayedString");
      else
        v12 = CFSTR("displayed_string");
      objc_msgSend(v4, "setObject:forKey:", v11, v12);
    }

    if (*(_QWORD *)(a1 + 24))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (_QWORD *)(a1 + 16);
      if (*(_QWORD *)(a1 + 24))
      {
        v15 = 0;
        do
        {
          v16 = *(int *)(*v14 + 4 * v15);
          if (v16 >= 4)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v17 = (void *)*((_QWORD *)&off_1E1C14AC0 + v16);
          }
          objc_msgSend(v13, "addObject:", v17);

          ++v15;
          v14 = (_QWORD *)(a1 + 16);
        }
        while (v15 < *(_QWORD *)(a1 + 24));
      }
      objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("subaction"));

    }
    if (*(_QWORD *)(a1 + 56))
    {
      objc_msgSend((id)a1, "displayedTexts");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v19 = CFSTR("displayedText");
      else
        v19 = CFSTR("displayed_text");
      objc_msgSend(v4, "setObject:forKey:", v18, v19);

    }
    if (*(_QWORD *)(a1 + 40))
    {
      objc_msgSend((id)a1, "childItemSubactionTypes");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v21 = CFSTR("childItemSubactionType");
      else
        v21 = CFSTR("child_item_subaction_type");
      objc_msgSend(v4, "setObject:forKey:", v20, v21);

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOSubactionMetaData _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOSubactionMetaData)initWithDictionary:(id)a3
{
  return (GEOSubactionMetaData *)-[GEOSubactionMetaData _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  id v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  const __CFString *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v44;
  int v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
  {
    v6 = 0;
    goto LABEL_82;
  }
  v6 = (void *)objc_msgSend(a1, "init");
  if (v6)
  {
    if (a3)
      v7 = CFSTR("selectedSubactionIndex");
    else
      v7 = CFSTR("selected_subaction_index");
    objc_msgSend(v5, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v6, "setSelectedSubactionIndex:", objc_msgSend(v8, "intValue"));

    if (a3)
      v9 = CFSTR("subactionType");
    else
      v9 = CFSTR("subaction_type");
    objc_msgSend(v5, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = v10;
      if ((objc_msgSend(v11, "isEqualToString:", CFSTR("USER_ACTION")) & 1) != 0)
      {
        v12 = 0;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("SEARCH")) & 1) != 0)
      {
        v12 = 1;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("SUB_POI")) & 1) != 0)
      {
        v12 = 2;
      }
      else if (objc_msgSend(v11, "isEqualToString:", CFSTR("TAP_PUBLISHER_COLLECTIONS")))
      {
        v12 = 3;
      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_25:

        if (a3)
          v13 = CFSTR("displayedString");
        else
          v13 = CFSTR("displayed_string");
        objc_msgSend(v5, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v15 = (void *)objc_msgSend(v14, "copy");
          objc_msgSend(v6, "setDisplayedString:", v15);

        }
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("subaction"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v45 = a3;
          v46 = v5;
          v57 = 0u;
          v58 = 0u;
          v55 = 0u;
          v56 = 0u;
          v44 = v16;
          v17 = v16;
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
          if (!v18)
            goto LABEL_52;
          v19 = v18;
          v20 = *(_QWORD *)v56;
          while (1)
          {
            v21 = 0;
            do
            {
              if (*(_QWORD *)v56 != v20)
                objc_enumerationMutation(v17);
              v22 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v21);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v23 = v22;
                if ((objc_msgSend(v23, "isEqualToString:", CFSTR("USER_ACTION")) & 1) != 0)
                {
                  v24 = 0;
                }
                else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("SEARCH")) & 1) != 0)
                {
                  v24 = 1;
                }
                else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("SUB_POI")) & 1) != 0)
                {
                  v24 = 2;
                }
                else if (objc_msgSend(v23, "isEqualToString:", CFSTR("TAP_PUBLISHER_COLLECTIONS")))
                {
                  v24 = 3;
                }
                else
                {
                  v24 = 0;
                }

              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                  goto LABEL_50;
                v24 = objc_msgSend(v22, "intValue");
              }
              objc_msgSend(v6, "addSubaction:", v24);
LABEL_50:
              ++v21;
            }
            while (v19 != v21);
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
            if (!v19)
            {
LABEL_52:

              v5 = v46;
              a3 = v45;
              v16 = v44;
              break;
            }
          }
        }

        if (a3)
          v25 = CFSTR("displayedText");
        else
          v25 = CFSTR("displayed_text");
        objc_msgSend(v5, "objectForKeyedSubscript:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v53 = 0u;
          v54 = 0u;
          v51 = 0u;
          v52 = 0u;
          v27 = v26;
          v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
          if (v28)
          {
            v29 = v28;
            v30 = *(_QWORD *)v52;
            do
            {
              v31 = 0;
              do
              {
                if (*(_QWORD *)v52 != v30)
                  objc_enumerationMutation(v27);
                v32 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v31);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v33 = (void *)objc_msgSend(v32, "copy");
                  objc_msgSend(v6, "addDisplayedText:", v33);

                }
                ++v31;
              }
              while (v29 != v31);
              v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
            }
            while (v29);
          }

        }
        if (a3)
          v34 = CFSTR("childItemSubactionType");
        else
          v34 = CFSTR("child_item_subaction_type");
        objc_msgSend(v5, "objectForKeyedSubscript:", v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v49 = 0u;
          v50 = 0u;
          v47 = 0u;
          v48 = 0u;
          v36 = v35;
          v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
          if (v37)
          {
            v38 = v37;
            v39 = *(_QWORD *)v48;
            do
            {
              v40 = 0;
              do
              {
                if (*(_QWORD *)v48 != v39)
                  objc_enumerationMutation(v36);
                v41 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v40);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v42 = (void *)objc_msgSend(v41, "copy");
                  objc_msgSend(v6, "addChildItemSubactionType:", v42);

                }
                ++v40;
              }
              while (v38 != v40);
              v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
            }
            while (v38);
          }

        }
        goto LABEL_82;
      }
      v12 = objc_msgSend(v10, "intValue");
    }
    objc_msgSend(v6, "setSubactionType:", v12);
    goto LABEL_25;
  }
LABEL_82:

  return v6;
}

- (GEOSubactionMetaData)initWithJSON:(id)a3
{
  return (GEOSubactionMetaData *)-[GEOSubactionMetaData _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v7;
  int *v8;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3)
      v8 = (int *)&readAll__recursiveTag_818;
    else
      v8 = (int *)&readAll__nonRecursiveTag_819;
    GEOSubactionMetaDataReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOSubactionMetaDataIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOSubactionMetaDataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  char flags;
  unint64_t v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  PBDataReader *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x7C) == 0))
  {
    v16 = self->_reader;
    objc_sync_enter(v16);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v17);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v16);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOSubactionMetaData readAll:](self, "readAll:", 0);
    flags = (char)self->_flags;
    if ((flags & 1) != 0)
    {
      PBDataWriterWriteInt32Field();
      flags = (char)self->_flags;
    }
    if ((flags & 2) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_displayedString)
      PBDataWriterWriteStringField();
    if (self->_subactions.count)
    {
      v7 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v7;
      }
      while (v7 < self->_subactions.count);
    }
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v8 = self->_displayedTexts;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(v8);
          PBDataWriterWriteStringField();
        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v9);
    }

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v12 = self->_childItemSubactionTypes;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v19;
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(v12);
          PBDataWriterWriteStringField();
        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      }
      while (v13);
    }

  }
}

- (void)copyTo:(id)a3
{
  char flags;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t k;
  void *v15;
  id *v16;

  v16 = (id *)a3;
  -[GEOSubactionMetaData readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v16 + 1, self->_reader);
  *((_DWORD *)v16 + 16) = self->_readerMarkPos;
  *((_DWORD *)v16 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *((_DWORD *)v16 + 19) = self->_selectedSubactionIndex;
    *((_BYTE *)v16 + 84) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v16 + 20) = self->_subactionType;
    *((_BYTE *)v16 + 84) |= 2u;
  }
  if (self->_displayedString)
    objc_msgSend(v16, "setDisplayedString:");
  if (-[GEOSubactionMetaData subactionsCount](self, "subactionsCount"))
  {
    objc_msgSend(v16, "clearSubactions");
    v5 = -[GEOSubactionMetaData subactionsCount](self, "subactionsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(v16, "addSubaction:", -[GEOSubactionMetaData subactionAtIndex:](self, "subactionAtIndex:", i));
    }
  }
  if (-[GEOSubactionMetaData displayedTextsCount](self, "displayedTextsCount"))
  {
    objc_msgSend(v16, "clearDisplayedTexts");
    v8 = -[GEOSubactionMetaData displayedTextsCount](self, "displayedTextsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[GEOSubactionMetaData displayedTextAtIndex:](self, "displayedTextAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addDisplayedText:", v11);

      }
    }
  }
  if (-[GEOSubactionMetaData childItemSubactionTypesCount](self, "childItemSubactionTypesCount"))
  {
    objc_msgSend(v16, "clearChildItemSubactionTypes");
    v12 = -[GEOSubactionMetaData childItemSubactionTypesCount](self, "childItemSubactionTypesCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[GEOSubactionMetaData childItemSubactionTypeAtIndex:](self, "childItemSubactionTypeAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addChildItemSubactionType:", v15);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  NSMutableArray *v8;
  char flags;
  uint64_t v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
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

  v32 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x40) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOSubactionMetaDataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (NSMutableArray *)(id)v5;
      objc_sync_exit(v7);

      goto LABEL_23;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOSubactionMetaData readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 76) = self->_selectedSubactionIndex;
    *(_BYTE *)(v5 + 84) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 80) = self->_subactionType;
    *(_BYTE *)(v5 + 84) |= 2u;
  }
  v10 = -[NSString copyWithZone:](self->_displayedString, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v10;

  PBRepeatedInt32Copy();
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v12 = self->_displayedTexts;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v27 != v14)
          objc_enumerationMutation(v12);
        v16 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addDisplayedText:", v16);

      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v13);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = self->_childItemSubactionTypes;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v23 != v18)
          objc_enumerationMutation(v8);
        v20 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v22);
        objc_msgSend((id)v5, "addChildItemSubactionType:", v20);

      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v17);
  }
LABEL_23:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *displayedString;
  NSMutableArray *displayedTexts;
  NSMutableArray *childItemSubactionTypes;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  -[GEOSubactionMetaData readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 84) & 1) == 0 || self->_selectedSubactionIndex != *((_DWORD *)v4 + 19))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 84) & 1) != 0)
  {
LABEL_19:
    v8 = 0;
    goto LABEL_20;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 84) & 2) == 0 || self->_subactionType != *((_DWORD *)v4 + 20))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 84) & 2) != 0)
  {
    goto LABEL_19;
  }
  displayedString = self->_displayedString;
  if ((unint64_t)displayedString | *((_QWORD *)v4 + 6)
    && !-[NSString isEqual:](displayedString, "isEqual:"))
  {
    goto LABEL_19;
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_19;
  displayedTexts = self->_displayedTexts;
  if ((unint64_t)displayedTexts | *((_QWORD *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](displayedTexts, "isEqual:"))
      goto LABEL_19;
  }
  childItemSubactionTypes = self->_childItemSubactionTypes;
  if ((unint64_t)childItemSubactionTypes | *((_QWORD *)v4 + 5))
    v8 = -[NSMutableArray isEqual:](childItemSubactionTypes, "isEqual:");
  else
    v8 = 1;
LABEL_20:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  uint64_t v7;
  uint64_t v8;

  -[GEOSubactionMetaData readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v3 = 2654435761 * self->_selectedSubactionIndex;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v4 = 0;
    goto LABEL_6;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v4 = 2654435761 * self->_subactionType;
LABEL_6:
  v5 = v4 ^ v3;
  v6 = -[NSString hash](self->_displayedString, "hash");
  v7 = v5 ^ PBRepeatedInt32Hash() ^ v6;
  v8 = -[NSMutableArray hash](self->_displayedTexts, "hash");
  return v7 ^ v8 ^ -[NSMutableArray hash](self->_childItemSubactionTypes, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t k;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  v5 = *((_BYTE *)v4 + 84);
  if ((v5 & 1) != 0)
  {
    self->_selectedSubactionIndex = *((_DWORD *)v4 + 19);
    *(_BYTE *)&self->_flags |= 1u;
    v5 = *((_BYTE *)v4 + 84);
  }
  if ((v5 & 2) != 0)
  {
    self->_subactionType = *((_DWORD *)v4 + 20);
    *(_BYTE *)&self->_flags |= 2u;
  }
  if (*((_QWORD *)v4 + 6))
    -[GEOSubactionMetaData setDisplayedString:](self, "setDisplayedString:");
  v6 = objc_msgSend(v4, "subactionsCount");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
      -[GEOSubactionMetaData addSubaction:](self, "addSubaction:", objc_msgSend(v4, "subactionAtIndex:", i));
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = *((id *)v4 + 7);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v9);
        -[GEOSubactionMetaData addDisplayedText:](self, "addDisplayedText:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j));
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v11);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v14 = *((id *)v4 + 5);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v20;
    do
    {
      for (k = 0; k != v16; ++k)
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v14);
        -[GEOSubactionMetaData addChildItemSubactionType:](self, "addChildItemSubactionType:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * k), (_QWORD)v19);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v16);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayedTexts, 0);
  objc_storeStrong((id *)&self->_displayedString, 0);
  objc_storeStrong((id *)&self->_childItemSubactionTypes, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
