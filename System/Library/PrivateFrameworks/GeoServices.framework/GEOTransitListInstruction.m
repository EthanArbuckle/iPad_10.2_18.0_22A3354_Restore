@implementation GEOTransitListInstruction

- (GEOTransitListInstruction)init
{
  GEOTransitListInstruction *v2;
  GEOTransitListInstruction *v3;
  GEOTransitListInstruction *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOTransitListInstruction;
  v2 = -[GEOTransitListInstruction init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTransitListInstruction)initWithData:(id)a3
{
  GEOTransitListInstruction *v3;
  GEOTransitListInstruction *v4;
  GEOTransitListInstruction *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOTransitListInstruction;
  v3 = -[GEOTransitListInstruction initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readNoticeFormatteds
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitListInstructionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readNoticeFormatteds_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)noticeFormatteds
{
  -[GEOTransitListInstruction _readNoticeFormatteds]((uint64_t)self);
  return self->_noticeFormatteds;
}

- (void)setNoticeFormatteds:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *noticeFormatteds;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  noticeFormatteds = self->_noticeFormatteds;
  self->_noticeFormatteds = v4;

}

- (void)clearNoticeFormatteds
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  -[NSMutableArray removeAllObjects](self->_noticeFormatteds, "removeAllObjects");
}

- (void)addNoticeFormatted:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOTransitListInstruction _readNoticeFormatteds]((uint64_t)self);
  -[GEOTransitListInstruction _addNoFlagsNoticeFormatted:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsNoticeFormatted:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 48);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = v5;

      v4 = *(void **)(a1 + 48);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)noticeFormattedsCount
{
  -[GEOTransitListInstruction _readNoticeFormatteds]((uint64_t)self);
  return -[NSMutableArray count](self->_noticeFormatteds, "count");
}

- (id)noticeFormattedAtIndex:(unint64_t)a3
{
  -[GEOTransitListInstruction _readNoticeFormatteds]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_noticeFormatteds, "objectAtIndex:", a3);
}

+ (Class)noticeFormattedType
{
  return (Class)objc_opt_class();
}

- (void)_readCommandFormatteds
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitListInstructionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCommandFormatteds_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)commandFormatteds
{
  -[GEOTransitListInstruction _readCommandFormatteds]((uint64_t)self);
  return self->_commandFormatteds;
}

- (void)setCommandFormatteds:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *commandFormatteds;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  commandFormatteds = self->_commandFormatteds;
  self->_commandFormatteds = v4;

}

- (void)clearCommandFormatteds
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  -[NSMutableArray removeAllObjects](self->_commandFormatteds, "removeAllObjects");
}

- (void)addCommandFormatted:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOTransitListInstruction _readCommandFormatteds]((uint64_t)self);
  -[GEOTransitListInstruction _addNoFlagsCommandFormatted:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsCommandFormatted:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 24);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = v5;

      v4 = *(void **)(a1 + 24);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)commandFormattedsCount
{
  -[GEOTransitListInstruction _readCommandFormatteds]((uint64_t)self);
  return -[NSMutableArray count](self->_commandFormatteds, "count");
}

- (id)commandFormattedAtIndex:(unint64_t)a3
{
  -[GEOTransitListInstruction _readCommandFormatteds]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_commandFormatteds, "objectAtIndex:", a3);
}

+ (Class)commandFormattedType
{
  return (Class)objc_opt_class();
}

- (void)_readDetailFormatteds
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitListInstructionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDetailFormatteds_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)detailFormatteds
{
  -[GEOTransitListInstruction _readDetailFormatteds]((uint64_t)self);
  return self->_detailFormatteds;
}

- (void)setDetailFormatteds:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *detailFormatteds;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  detailFormatteds = self->_detailFormatteds;
  self->_detailFormatteds = v4;

}

- (void)clearDetailFormatteds
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  -[NSMutableArray removeAllObjects](self->_detailFormatteds, "removeAllObjects");
}

- (void)addDetailFormatted:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOTransitListInstruction _readDetailFormatteds]((uint64_t)self);
  -[GEOTransitListInstruction _addNoFlagsDetailFormatted:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsDetailFormatted:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 32);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = v5;

      v4 = *(void **)(a1 + 32);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)detailFormattedsCount
{
  -[GEOTransitListInstruction _readDetailFormatteds]((uint64_t)self);
  return -[NSMutableArray count](self->_detailFormatteds, "count");
}

- (id)detailFormattedAtIndex:(unint64_t)a3
{
  -[GEOTransitListInstruction _readDetailFormatteds]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_detailFormatteds, "objectAtIndex:", a3);
}

+ (Class)detailFormattedType
{
  return (Class)objc_opt_class();
}

- (void)_readPriceFormatteds
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitListInstructionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPriceFormatteds_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)priceFormatteds
{
  -[GEOTransitListInstruction _readPriceFormatteds]((uint64_t)self);
  return self->_priceFormatteds;
}

- (void)setPriceFormatteds:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *priceFormatteds;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  priceFormatteds = self->_priceFormatteds;
  self->_priceFormatteds = v4;

}

- (void)clearPriceFormatteds
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  -[NSMutableArray removeAllObjects](self->_priceFormatteds, "removeAllObjects");
}

- (void)addPriceFormatted:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOTransitListInstruction _readPriceFormatteds]((uint64_t)self);
  -[GEOTransitListInstruction _addNoFlagsPriceFormatted:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsPriceFormatted:(uint64_t)a1
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

- (unint64_t)priceFormattedsCount
{
  -[GEOTransitListInstruction _readPriceFormatteds]((uint64_t)self);
  return -[NSMutableArray count](self->_priceFormatteds, "count");
}

- (id)priceFormattedAtIndex:(unint64_t)a3
{
  -[GEOTransitListInstruction _readPriceFormatteds]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_priceFormatteds, "objectAtIndex:", a3);
}

+ (Class)priceFormattedType
{
  return (Class)objc_opt_class();
}

- (void)_readExpandableListFormatted
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitListInstructionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readExpandableListFormatted_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasExpandableListFormatted
{
  -[GEOTransitListInstruction _readExpandableListFormatted]((uint64_t)self);
  return self->_expandableListFormatted != 0;
}

- (GEOFormattedString)expandableListFormatted
{
  -[GEOTransitListInstruction _readExpandableListFormatted]((uint64_t)self);
  return self->_expandableListFormatted;
}

- (void)setExpandableListFormatted:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x88u;
  objc_storeStrong((id *)&self->_expandableListFormatted, a3);
}

- (void)_readTimeInstructions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitListInstructionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTimeInstructions_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasTimeInstructions
{
  -[GEOTransitListInstruction _readTimeInstructions]((uint64_t)self);
  return self->_timeInstructions != 0;
}

- (GEOTransitListTimeInstruction)timeInstructions
{
  -[GEOTransitListInstruction _readTimeInstructions]((uint64_t)self);
  return self->_timeInstructions;
}

- (void)setTimeInstructions:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_timeInstructions, a3);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOTransitListInstruction;
  -[GEOTransitListInstruction description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOTransitListInstruction dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTransitListInstruction _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  void *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t m;
  void *v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  void *v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  void *v46;
  void *v47;
  const __CFString *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  _QWORD v56[4];
  id v57;
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
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v6 = *(id *)(a1 + 48);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v70, v77, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v71;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v71 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v11, "jsonRepresentation");
          else
            objc_msgSend(v11, "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v70, v77, 16);
      }
      while (v8);
    }

    if (a2)
      v13 = CFSTR("noticeFormatted");
    else
      v13 = CFSTR("notice_formatted");
    objc_msgSend(v4, "setObject:forKey:", v5, v13);

  }
  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v15 = *(id *)(a1 + 24);
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v66, v76, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v67;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v67 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v20, "jsonRepresentation");
          else
            objc_msgSend(v20, "dictionaryRepresentation");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v21);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v66, v76, 16);
      }
      while (v17);
    }

    if (a2)
      v22 = CFSTR("commandFormatted");
    else
      v22 = CFSTR("command_formatted");
    objc_msgSend(v4, "setObject:forKey:", v14, v22);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v24 = *(id *)(a1 + 32);
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v62, v75, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v63;
      do
      {
        for (k = 0; k != v26; ++k)
        {
          if (*(_QWORD *)v63 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * k);
          if ((a2 & 1) != 0)
            objc_msgSend(v29, "jsonRepresentation");
          else
            objc_msgSend(v29, "dictionaryRepresentation");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addObject:", v30);

        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v62, v75, 16);
      }
      while (v26);
    }

    if (a2)
      v31 = CFSTR("detailFormatted");
    else
      v31 = CFSTR("detail_formatted");
    objc_msgSend(v4, "setObject:forKey:", v23, v31);

  }
  if (objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v33 = *(id *)(a1 + 56);
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v58, v74, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v59;
      do
      {
        for (m = 0; m != v35; ++m)
        {
          if (*(_QWORD *)v59 != v36)
            objc_enumerationMutation(v33);
          v38 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * m);
          if ((a2 & 1) != 0)
            objc_msgSend(v38, "jsonRepresentation");
          else
            objc_msgSend(v38, "dictionaryRepresentation");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "addObject:", v39);

        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v58, v74, 16);
      }
      while (v35);
    }

    if (a2)
      v40 = CFSTR("priceFormatted");
    else
      v40 = CFSTR("price_formatted");
    objc_msgSend(v4, "setObject:forKey:", v32, v40);

  }
  objc_msgSend((id)a1, "expandableListFormatted");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v41;
  if (v41)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v41, "jsonRepresentation");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = CFSTR("expandableListFormatted");
    }
    else
    {
      objc_msgSend(v41, "dictionaryRepresentation");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = CFSTR("expandable_list_formatted");
    }
    objc_msgSend(v4, "setObject:forKey:", v43, v44);

  }
  objc_msgSend((id)a1, "timeInstructions");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v45;
  if (v45)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v45, "jsonRepresentation");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = CFSTR("timeInstructions");
    }
    else
    {
      objc_msgSend(v45, "dictionaryRepresentation");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = CFSTR("time_instructions");
    }
    objc_msgSend(v4, "setObject:forKey:", v47, v48);

  }
  v49 = *(void **)(a1 + 16);
  if (v49)
  {
    objc_msgSend(v49, "dictionaryRepresentation");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v50;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v50, "count"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v56[0] = MEMORY[0x1E0C809B0];
      v56[1] = 3221225472;
      v56[2] = __55__GEOTransitListInstruction__dictionaryRepresentation___block_invoke;
      v56[3] = &unk_1E1C00600;
      v53 = v52;
      v57 = v53;
      objc_msgSend(v51, "enumerateKeysAndObjectsUsingBlock:", v56);
      v54 = v53;

      v51 = v54;
    }
    objc_msgSend(v4, "setObject:forKey:", v51, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOTransitListInstruction _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __55__GEOTransitListInstruction__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, v9);

  }
  else
  {
    objc_msgSend(v10, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v5, v8);
  }

}

- (GEOTransitListInstruction)initWithDictionary:(id)a3
{
  return (GEOTransitListInstruction *)-[GEOTransitListInstruction _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  GEOFormattedString *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  GEOFormattedString *v25;
  uint64_t v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  uint64_t v35;
  GEOFormattedString *v36;
  uint64_t v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t m;
  uint64_t v46;
  GEOFormattedString *v47;
  uint64_t v48;
  void *v49;
  const __CFString *v50;
  void *v51;
  GEOFormattedString *v52;
  uint64_t v53;
  void *v54;
  const __CFString *v55;
  void *v56;
  GEOTransitListTimeInstruction *v57;
  uint64_t v58;
  void *v59;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("noticeFormatted");
      else
        v6 = CFSTR("notice_formatted");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v61 = v5;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v76 = 0u;
        v77 = 0u;
        v74 = 0u;
        v75 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v74, v81, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v75;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v75 != v11)
                objc_enumerationMutation(v8);
              v13 = *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v14 = [GEOFormattedString alloc];
                if ((a3 & 1) != 0)
                  v15 = -[GEOFormattedString initWithJSON:](v14, "initWithJSON:", v13);
                else
                  v15 = -[GEOFormattedString initWithDictionary:](v14, "initWithDictionary:", v13);
                v16 = (void *)v15;
                objc_msgSend(a1, "addNoticeFormatted:", v15);

              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v74, v81, 16);
          }
          while (v10);
        }

        v5 = v61;
      }

      if (a3)
        v17 = CFSTR("commandFormatted");
      else
        v17 = CFSTR("command_formatted");
      objc_msgSend(v5, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v72 = 0u;
        v73 = 0u;
        v70 = 0u;
        v71 = 0u;
        v19 = v18;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v71;
          do
          {
            for (j = 0; j != v21; ++j)
            {
              if (*(_QWORD *)v71 != v22)
                objc_enumerationMutation(v19);
              v24 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v25 = [GEOFormattedString alloc];
                if ((a3 & 1) != 0)
                  v26 = -[GEOFormattedString initWithJSON:](v25, "initWithJSON:", v24);
                else
                  v26 = -[GEOFormattedString initWithDictionary:](v25, "initWithDictionary:", v24);
                v27 = (void *)v26;
                objc_msgSend(a1, "addCommandFormatted:", v26);

              }
            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
          }
          while (v21);
        }

        v5 = v61;
      }

      if (a3)
        v28 = CFSTR("detailFormatted");
      else
        v28 = CFSTR("detail_formatted");
      objc_msgSend(v5, "objectForKeyedSubscript:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v68 = 0u;
        v69 = 0u;
        v66 = 0u;
        v67 = 0u;
        v30 = v29;
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v66, v79, 16);
        if (v31)
        {
          v32 = v31;
          v33 = *(_QWORD *)v67;
          do
          {
            for (k = 0; k != v32; ++k)
            {
              if (*(_QWORD *)v67 != v33)
                objc_enumerationMutation(v30);
              v35 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * k);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v36 = [GEOFormattedString alloc];
                if ((a3 & 1) != 0)
                  v37 = -[GEOFormattedString initWithJSON:](v36, "initWithJSON:", v35);
                else
                  v37 = -[GEOFormattedString initWithDictionary:](v36, "initWithDictionary:", v35);
                v38 = (void *)v37;
                objc_msgSend(a1, "addDetailFormatted:", v37);

              }
            }
            v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v66, v79, 16);
          }
          while (v32);
        }

        v5 = v61;
      }

      if (a3)
        v39 = CFSTR("priceFormatted");
      else
        v39 = CFSTR("price_formatted");
      objc_msgSend(v5, "objectForKeyedSubscript:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v64 = 0u;
        v65 = 0u;
        v62 = 0u;
        v63 = 0u;
        v41 = v40;
        v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v62, v78, 16);
        if (v42)
        {
          v43 = v42;
          v44 = *(_QWORD *)v63;
          do
          {
            for (m = 0; m != v43; ++m)
            {
              if (*(_QWORD *)v63 != v44)
                objc_enumerationMutation(v41);
              v46 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * m);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v47 = [GEOFormattedString alloc];
                if ((a3 & 1) != 0)
                  v48 = -[GEOFormattedString initWithJSON:](v47, "initWithJSON:", v46);
                else
                  v48 = -[GEOFormattedString initWithDictionary:](v47, "initWithDictionary:", v46);
                v49 = (void *)v48;
                objc_msgSend(a1, "addPriceFormatted:", v48);

              }
            }
            v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v62, v78, 16);
          }
          while (v43);
        }

        v5 = v61;
      }

      if (a3)
        v50 = CFSTR("expandableListFormatted");
      else
        v50 = CFSTR("expandable_list_formatted");
      objc_msgSend(v5, "objectForKeyedSubscript:", v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v52 = [GEOFormattedString alloc];
        if ((a3 & 1) != 0)
          v53 = -[GEOFormattedString initWithJSON:](v52, "initWithJSON:", v51);
        else
          v53 = -[GEOFormattedString initWithDictionary:](v52, "initWithDictionary:", v51);
        v54 = (void *)v53;
        objc_msgSend(a1, "setExpandableListFormatted:", v53);

      }
      if (a3)
        v55 = CFSTR("timeInstructions");
      else
        v55 = CFSTR("time_instructions");
      objc_msgSend(v5, "objectForKeyedSubscript:", v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v57 = [GEOTransitListTimeInstruction alloc];
        if ((a3 & 1) != 0)
          v58 = -[GEOTransitListTimeInstruction initWithJSON:](v57, "initWithJSON:", v56);
        else
          v58 = -[GEOTransitListTimeInstruction initWithDictionary:](v57, "initWithDictionary:", v56);
        v59 = (void *)v58;
        objc_msgSend(a1, "setTimeInstructions:", v58);

      }
    }
  }

  return a1;
}

- (GEOTransitListInstruction)initWithJSON:(id)a3
{
  return (GEOTransitListInstruction *)-[GEOTransitListInstruction _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_6822;
    else
      v8 = (int *)&readAll__nonRecursiveTag_6823;
    GEOTransitListInstructionReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOTransitListInstructionCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTransitListInstructionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTransitListInstructionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t k;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t m;
  PBDataReader *v22;
  void *v23;
  __int128 v24;
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
  _BYTE v40[128];
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOTransitListInstructionIsDirty((uint64_t)self) & 1) == 0)
  {
    v22 = self->_reader;
    objc_sync_enter(v22);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v23);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v22);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOTransitListInstruction readAll:](self, "readAll:", 0);
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v6 = self->_noticeFormatteds;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v37 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
      }
      while (v7);
    }

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v10 = self->_commandFormatteds;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v33;
      do
      {
        for (j = 0; j != v11; ++j)
        {
          if (*(_QWORD *)v33 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteSubmessage();
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
      }
      while (v11);
    }

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v14 = self->_detailFormatteds;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v29;
      do
      {
        for (k = 0; k != v15; ++k)
        {
          if (*(_QWORD *)v29 != v16)
            objc_enumerationMutation(v14);
          PBDataWriterWriteSubmessage();
        }
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
      }
      while (v15);
    }

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v18 = self->_priceFormatteds;
    v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v24, v40, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v25;
      do
      {
        for (m = 0; m != v19; ++m)
        {
          if (*(_QWORD *)v25 != v20)
            objc_enumerationMutation(v18);
          PBDataWriterWriteSubmessage();
        }
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v24, v40, 16);
      }
      while (v19);
    }

    if (self->_expandableListFormatted)
      PBDataWriterWriteSubmessage();
    if (self->_timeInstructions)
      PBDataWriterWriteSubmessage();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v24);
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
  id *v20;
  id *v21;

  v21 = (id *)a3;
  -[GEOTransitListInstruction readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v21 + 1, self->_reader);
  *((_DWORD *)v21 + 18) = self->_readerMarkPos;
  *((_DWORD *)v21 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEOTransitListInstruction noticeFormattedsCount](self, "noticeFormattedsCount"))
  {
    objc_msgSend(v21, "clearNoticeFormatteds");
    v4 = -[GEOTransitListInstruction noticeFormattedsCount](self, "noticeFormattedsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOTransitListInstruction noticeFormattedAtIndex:](self, "noticeFormattedAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addNoticeFormatted:", v7);

      }
    }
  }
  if (-[GEOTransitListInstruction commandFormattedsCount](self, "commandFormattedsCount"))
  {
    objc_msgSend(v21, "clearCommandFormatteds");
    v8 = -[GEOTransitListInstruction commandFormattedsCount](self, "commandFormattedsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[GEOTransitListInstruction commandFormattedAtIndex:](self, "commandFormattedAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addCommandFormatted:", v11);

      }
    }
  }
  if (-[GEOTransitListInstruction detailFormattedsCount](self, "detailFormattedsCount"))
  {
    objc_msgSend(v21, "clearDetailFormatteds");
    v12 = -[GEOTransitListInstruction detailFormattedsCount](self, "detailFormattedsCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[GEOTransitListInstruction detailFormattedAtIndex:](self, "detailFormattedAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addDetailFormatted:", v15);

      }
    }
  }
  if (-[GEOTransitListInstruction priceFormattedsCount](self, "priceFormattedsCount"))
  {
    objc_msgSend(v21, "clearPriceFormatteds");
    v16 = -[GEOTransitListInstruction priceFormattedsCount](self, "priceFormattedsCount");
    if (v16)
    {
      v17 = v16;
      for (m = 0; m != v17; ++m)
      {
        -[GEOTransitListInstruction priceFormattedAtIndex:](self, "priceFormattedAtIndex:", m);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addPriceFormatted:", v19);

      }
    }
  }
  if (self->_expandableListFormatted)
    objc_msgSend(v21, "setExpandableListFormatted:");
  v20 = v21;
  if (self->_timeInstructions)
  {
    objc_msgSend(v21, "setTimeInstructions:");
    v20 = v21;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  void *v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t m;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
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
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x80000000) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOTransitListInstructionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOTransitListInstruction readAll:](self, "readAll:", 0);
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v8 = self->_noticeFormatteds;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v46 != v10)
          objc_enumerationMutation(v8);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addNoticeFormatted:", v12);

      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
    }
    while (v9);
  }

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v13 = self->_commandFormatteds;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v42;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v42 != v15)
          objc_enumerationMutation(v13);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addCommandFormatted:", v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
    }
    while (v14);
  }

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v18 = self->_detailFormatteds;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v38;
    do
    {
      for (k = 0; k != v19; ++k)
      {
        if (*(_QWORD *)v38 != v20)
          objc_enumerationMutation(v18);
        v22 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addDetailFormatted:", v22);

      }
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
    }
    while (v19);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v23 = self->_priceFormatteds;
  v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v33, v49, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v34;
    do
    {
      for (m = 0; m != v24; ++m)
      {
        if (*(_QWORD *)v34 != v25)
          objc_enumerationMutation(v23);
        v27 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * m), "copyWithZone:", a3, (_QWORD)v33);
        objc_msgSend((id)v5, "addPriceFormatted:", v27);

      }
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v33, v49, 16);
    }
    while (v24);
  }

  v28 = -[GEOFormattedString copyWithZone:](self->_expandableListFormatted, "copyWithZone:", a3);
  v29 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v28;

  v30 = -[GEOTransitListTimeInstruction copyWithZone:](self->_timeInstructions, "copyWithZone:", a3);
  v31 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v30;

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *noticeFormatteds;
  NSMutableArray *commandFormatteds;
  NSMutableArray *detailFormatteds;
  NSMutableArray *priceFormatteds;
  GEOFormattedString *expandableListFormatted;
  GEOTransitListTimeInstruction *timeInstructions;
  char v11;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOTransitListInstruction readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         noticeFormatteds = self->_noticeFormatteds,
         !((unint64_t)noticeFormatteds | v4[6]))
     || -[NSMutableArray isEqual:](noticeFormatteds, "isEqual:"))
    && ((commandFormatteds = self->_commandFormatteds, !((unint64_t)commandFormatteds | v4[3]))
     || -[NSMutableArray isEqual:](commandFormatteds, "isEqual:"))
    && ((detailFormatteds = self->_detailFormatteds, !((unint64_t)detailFormatteds | v4[4]))
     || -[NSMutableArray isEqual:](detailFormatteds, "isEqual:"))
    && ((priceFormatteds = self->_priceFormatteds, !((unint64_t)priceFormatteds | v4[7]))
     || -[NSMutableArray isEqual:](priceFormatteds, "isEqual:"))
    && ((expandableListFormatted = self->_expandableListFormatted, !((unint64_t)expandableListFormatted | v4[5]))
     || -[GEOFormattedString isEqual:](expandableListFormatted, "isEqual:")))
  {
    timeInstructions = self->_timeInstructions;
    if ((unint64_t)timeInstructions | v4[8])
      v11 = -[GEOTransitListTimeInstruction isEqual:](timeInstructions, "isEqual:");
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
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  -[GEOTransitListInstruction readAll:](self, "readAll:", 1);
  v3 = -[NSMutableArray hash](self->_noticeFormatteds, "hash");
  v4 = -[NSMutableArray hash](self->_commandFormatteds, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_detailFormatteds, "hash");
  v6 = v4 ^ v5 ^ -[NSMutableArray hash](self->_priceFormatteds, "hash");
  v7 = -[GEOFormattedString hash](self->_expandableListFormatted, "hash");
  return v6 ^ v7 ^ -[GEOTransitListTimeInstruction hash](self->_timeInstructions, "hash");
}

- (void)mergeFrom:(id)a3
{
  id *v4;
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
  GEOFormattedString *expandableListFormatted;
  id v26;
  GEOTransitListTimeInstruction *timeInstructions;
  id v28;
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
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  objc_msgSend(v4, "readAll:", 0);
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v5 = v4[6];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v42 != v8)
          objc_enumerationMutation(v5);
        -[GEOTransitListInstruction addNoticeFormatted:](self, "addNoticeFormatted:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
    }
    while (v7);
  }

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v10 = v4[3];
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v38;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v38 != v13)
          objc_enumerationMutation(v10);
        -[GEOTransitListInstruction addCommandFormatted:](self, "addCommandFormatted:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
    }
    while (v12);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v15 = v4[4];
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v34;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v34 != v18)
          objc_enumerationMutation(v15);
        -[GEOTransitListInstruction addDetailFormatted:](self, "addDetailFormatted:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * k));
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
    }
    while (v17);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v20 = v4[7];
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v45, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v30;
    do
    {
      for (m = 0; m != v22; ++m)
      {
        if (*(_QWORD *)v30 != v23)
          objc_enumerationMutation(v20);
        -[GEOTransitListInstruction addPriceFormatted:](self, "addPriceFormatted:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * m), (_QWORD)v29);
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v45, 16);
    }
    while (v22);
  }

  expandableListFormatted = self->_expandableListFormatted;
  v26 = v4[5];
  if (expandableListFormatted)
  {
    if (v26)
      -[GEOFormattedString mergeFrom:](expandableListFormatted, "mergeFrom:");
  }
  else if (v26)
  {
    -[GEOTransitListInstruction setExpandableListFormatted:](self, "setExpandableListFormatted:");
  }
  timeInstructions = self->_timeInstructions;
  v28 = v4[8];
  if (timeInstructions)
  {
    if (v28)
      -[GEOTransitListTimeInstruction mergeFrom:](timeInstructions, "mergeFrom:");
  }
  else if (v28)
  {
    -[GEOTransitListInstruction setTimeInstructions:](self, "setTimeInstructions:");
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOTransitListInstructionReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_6826);
      objc_sync_exit(v5);

    }
  }
  os_unfair_lock_unlock(p_readerLock);
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBUnknownFields *unknownFields;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
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
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v3 = a3;
  v47 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x81u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOTransitListInstruction readAll:](self, "readAll:", 0);
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v7 = self->_noticeFormatteds;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v40;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v40 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * v11++), "clearUnknownFields:", 1);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
      }
      while (v9);
    }

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v12 = self->_commandFormatteds;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v36;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v36 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v16++), "clearUnknownFields:", 1);
        }
        while (v14 != v16);
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
      }
      while (v14);
    }

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v17 = self->_detailFormatteds;
    v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v32;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v32 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v21++), "clearUnknownFields:", 1);
        }
        while (v19 != v21);
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
      }
      while (v19);
    }

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v22 = self->_priceFormatteds;
    v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v28;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v28 != v25)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v26++), "clearUnknownFields:", 1, (_QWORD)v27);
        }
        while (v24 != v26);
        v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
      }
      while (v24);
    }

    -[GEOFormattedString clearUnknownFields:](self->_expandableListFormatted, "clearUnknownFields:", 1);
    -[GEOTransitListTimeInstruction clearUnknownFields:](self->_timeInstructions, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeInstructions, 0);
  objc_storeStrong((id *)&self->_priceFormatteds, 0);
  objc_storeStrong((id *)&self->_noticeFormatteds, 0);
  objc_storeStrong((id *)&self->_expandableListFormatted, 0);
  objc_storeStrong((id *)&self->_detailFormatteds, 0);
  objc_storeStrong((id *)&self->_commandFormatteds, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (BOOL)_transit_hasAnyFieldSet
{
  return -[GEOTransitListInstruction noticeFormattedsCount](self, "noticeFormattedsCount")
      || -[GEOTransitListInstruction commandFormattedsCount](self, "commandFormattedsCount")
      || -[GEOTransitListInstruction detailFormattedsCount](self, "detailFormattedsCount")
      || -[GEOTransitListInstruction priceFormattedsCount](self, "priceFormattedsCount")
      || -[GEOTransitListInstruction hasExpandableListFormatted](self, "hasExpandableListFormatted")
      || -[GEOTransitListInstruction hasTimeInstructions](self, "hasTimeInstructions");
}

- (void)_transit_mergeFrom:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  char v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  char v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  char v33;
  id v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  char v44;
  id v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  char v55;
  id v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  char v66;
  id v67;
  void *v68;
  uint64_t v69;
  id v70;

  v70 = a3;
  -[GEOTransitListInstruction noticeFormatteds](self, "noticeFormatteds");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "noticeFormatteds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v7 = v5;
  if (!v7)
  {
    v12 = v6;
    goto LABEL_19;
  }
  if (qword_1ECDBBD40 != -1)
    dispatch_once(&qword_1ECDBBD40, &__block_literal_global_63);
  v8 = (id)_MergedGlobals_219;
  v9 = v7;
  if (qword_1ECDBBD40 != -1)
    dispatch_once(&qword_1ECDBBD40, &__block_literal_global_63);
  v10 = (id)_MergedGlobals_219;
  if (objc_msgSend(v9, "conformsToProtocol:", v10))
  {
    v11 = objc_msgSend(v9, "_transit_hasAnyFieldSet");

    if ((v11 & 1) != 0)
    {
LABEL_14:
      if (objc_msgSend(v9, "conformsToProtocol:", v8)
        && objc_msgSend(v6, "conformsToProtocol:", v8))
      {
        objc_msgSend(v6, "_transit_mergeFrom:", v9);
        v9 = v6;
      }
      v12 = v9;
      goto LABEL_18;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      goto LABEL_14;
    }
    objc_msgSend(v9, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v14)
      goto LABEL_14;
  }
  v12 = 0;
LABEL_18:

LABEL_19:
  -[GEOTransitListInstruction setNoticeFormatteds:](self, "setNoticeFormatteds:", v12);

  -[GEOTransitListInstruction commandFormatteds](self, "commandFormatteds");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "commandFormatteds");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v15;
  v18 = v16;
  if (!v18)
  {
    v23 = v17;
    goto LABEL_37;
  }
  if (qword_1ECDBBD40 != -1)
    dispatch_once(&qword_1ECDBBD40, &__block_literal_global_63);
  v19 = (id)_MergedGlobals_219;
  v20 = v18;
  if (qword_1ECDBBD40 != -1)
    dispatch_once(&qword_1ECDBBD40, &__block_literal_global_63);
  v21 = (id)_MergedGlobals_219;
  if (objc_msgSend(v20, "conformsToProtocol:", v21))
  {
    v22 = objc_msgSend(v20, "_transit_hasAnyFieldSet");

    if ((v22 & 1) != 0)
    {
LABEL_32:
      if (objc_msgSend(v20, "conformsToProtocol:", v19)
        && objc_msgSend(v17, "conformsToProtocol:", v19))
      {
        objc_msgSend(v17, "_transit_mergeFrom:", v20);
        v20 = v17;
      }
      v23 = v20;
      goto LABEL_36;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      goto LABEL_32;
    }
    objc_msgSend(v20, "dictionaryRepresentation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "count");

    if (v25)
      goto LABEL_32;
  }
  v23 = 0;
LABEL_36:

LABEL_37:
  -[GEOTransitListInstruction setCommandFormatteds:](self, "setCommandFormatteds:", v23);

  -[GEOTransitListInstruction detailFormatteds](self, "detailFormatteds");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "detailFormatteds");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v26;
  v29 = v27;
  if (!v29)
  {
    v34 = v28;
    goto LABEL_55;
  }
  if (qword_1ECDBBD40 != -1)
    dispatch_once(&qword_1ECDBBD40, &__block_literal_global_63);
  v30 = (id)_MergedGlobals_219;
  v31 = v29;
  if (qword_1ECDBBD40 != -1)
    dispatch_once(&qword_1ECDBBD40, &__block_literal_global_63);
  v32 = (id)_MergedGlobals_219;
  if (objc_msgSend(v31, "conformsToProtocol:", v32))
  {
    v33 = objc_msgSend(v31, "_transit_hasAnyFieldSet");

    if ((v33 & 1) != 0)
    {
LABEL_50:
      if (objc_msgSend(v31, "conformsToProtocol:", v30)
        && objc_msgSend(v28, "conformsToProtocol:", v30))
      {
        objc_msgSend(v28, "_transit_mergeFrom:", v31);
        v31 = v28;
      }
      v34 = v31;
      goto LABEL_54;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      goto LABEL_50;
    }
    objc_msgSend(v31, "dictionaryRepresentation");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "count");

    if (v36)
      goto LABEL_50;
  }
  v34 = 0;
LABEL_54:

LABEL_55:
  -[GEOTransitListInstruction setDetailFormatteds:](self, "setDetailFormatteds:", v34);

  -[GEOTransitListInstruction priceFormatteds](self, "priceFormatteds");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "priceFormatteds");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v37;
  v40 = v38;
  if (!v40)
  {
    v45 = v39;
    goto LABEL_73;
  }
  if (qword_1ECDBBD40 != -1)
    dispatch_once(&qword_1ECDBBD40, &__block_literal_global_63);
  v41 = (id)_MergedGlobals_219;
  v42 = v40;
  if (qword_1ECDBBD40 != -1)
    dispatch_once(&qword_1ECDBBD40, &__block_literal_global_63);
  v43 = (id)_MergedGlobals_219;
  if (objc_msgSend(v42, "conformsToProtocol:", v43))
  {
    v44 = objc_msgSend(v42, "_transit_hasAnyFieldSet");

    if ((v44 & 1) != 0)
    {
LABEL_68:
      if (objc_msgSend(v42, "conformsToProtocol:", v41)
        && objc_msgSend(v39, "conformsToProtocol:", v41))
      {
        objc_msgSend(v39, "_transit_mergeFrom:", v42);
        v42 = v39;
      }
      v45 = v42;
      goto LABEL_72;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      goto LABEL_68;
    }
    objc_msgSend(v42, "dictionaryRepresentation");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "count");

    if (v47)
      goto LABEL_68;
  }
  v45 = 0;
LABEL_72:

LABEL_73:
  -[GEOTransitListInstruction setPriceFormatteds:](self, "setPriceFormatteds:", v45);

  -[GEOTransitListInstruction expandableListFormatted](self, "expandableListFormatted");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "expandableListFormatted");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v48;
  v51 = v49;
  if (!v51)
  {
    v56 = v50;
    goto LABEL_91;
  }
  if (qword_1ECDBBD40 != -1)
    dispatch_once(&qword_1ECDBBD40, &__block_literal_global_63);
  v52 = (id)_MergedGlobals_219;
  v53 = v51;
  if (qword_1ECDBBD40 != -1)
    dispatch_once(&qword_1ECDBBD40, &__block_literal_global_63);
  v54 = (id)_MergedGlobals_219;
  if (objc_msgSend(v53, "conformsToProtocol:", v54))
  {
    v55 = objc_msgSend(v53, "_transit_hasAnyFieldSet");

    if ((v55 & 1) != 0)
    {
LABEL_86:
      if (objc_msgSend(v53, "conformsToProtocol:", v52)
        && objc_msgSend(v50, "conformsToProtocol:", v52))
      {
        objc_msgSend(v50, "_transit_mergeFrom:", v53);
        v53 = v50;
      }
      v56 = v53;
      goto LABEL_90;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      goto LABEL_86;
    }
    objc_msgSend(v53, "dictionaryRepresentation");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v57, "count");

    if (v58)
      goto LABEL_86;
  }
  v56 = 0;
LABEL_90:

LABEL_91:
  -[GEOTransitListInstruction setExpandableListFormatted:](self, "setExpandableListFormatted:", v56);

  -[GEOTransitListInstruction timeInstructions](self, "timeInstructions");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "timeInstructions");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v59;
  v62 = v60;
  if (v62)
  {
    if (qword_1ECDBBD40 != -1)
      dispatch_once(&qword_1ECDBBD40, &__block_literal_global_63);
    v63 = (id)_MergedGlobals_219;
    v64 = v62;
    if (qword_1ECDBBD40 != -1)
      dispatch_once(&qword_1ECDBBD40, &__block_literal_global_63);
    v65 = (id)_MergedGlobals_219;
    if (objc_msgSend(v64, "conformsToProtocol:", v65))
    {
      v66 = objc_msgSend(v64, "_transit_hasAnyFieldSet");

      if ((v66 & 1) != 0)
      {
LABEL_104:
        if (objc_msgSend(v64, "conformsToProtocol:", v63)
          && objc_msgSend(v61, "conformsToProtocol:", v63))
        {
          objc_msgSend(v61, "_transit_mergeFrom:", v64);
          v64 = v61;
        }
        v67 = v64;
        goto LABEL_108;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        goto LABEL_104;
      }
      objc_msgSend(v64, "dictionaryRepresentation");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = objc_msgSend(v68, "count");

      if (v69)
        goto LABEL_104;
    }
    v67 = 0;
LABEL_108:

    goto LABEL_109;
  }
  v67 = v61;
LABEL_109:

  -[GEOTransitListInstruction setTimeInstructions:](self, "setTimeInstructions:", v67);
}

@end
