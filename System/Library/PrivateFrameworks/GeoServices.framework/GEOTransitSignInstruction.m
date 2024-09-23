@implementation GEOTransitSignInstruction

- (GEOTransitSignInstruction)init
{
  GEOTransitSignInstruction *v2;
  GEOTransitSignInstruction *v3;
  GEOTransitSignInstruction *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOTransitSignInstruction;
  v2 = -[GEOTransitSignInstruction init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTransitSignInstruction)initWithData:(id)a3
{
  GEOTransitSignInstruction *v3;
  GEOTransitSignInstruction *v4;
  GEOTransitSignInstruction *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOTransitSignInstruction;
  v3 = -[GEOTransitSignInstruction initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readCommandFormatteds
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitSignInstructionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCommandFormatteds_tags_6993);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)commandFormatteds
{
  -[GEOTransitSignInstruction _readCommandFormatteds]((uint64_t)self);
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
  *(_BYTE *)&self->_flags |= 0x20u;
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
  *(_BYTE *)&self->_flags |= 0x20u;
  -[NSMutableArray removeAllObjects](self->_commandFormatteds, "removeAllObjects");
}

- (void)addCommandFormatted:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOTransitSignInstruction _readCommandFormatteds]((uint64_t)self);
  -[GEOTransitSignInstruction _addNoFlagsCommandFormatted:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
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
  -[GEOTransitSignInstruction _readCommandFormatteds]((uint64_t)self);
  return -[NSMutableArray count](self->_commandFormatteds, "count");
}

- (id)commandFormattedAtIndex:(unint64_t)a3
{
  -[GEOTransitSignInstruction _readCommandFormatteds]((uint64_t)self);
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitSignInstructionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDetailFormatteds_tags_6994);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)detailFormatteds
{
  -[GEOTransitSignInstruction _readDetailFormatteds]((uint64_t)self);
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
  *(_BYTE *)&self->_flags |= 0x20u;
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
  *(_BYTE *)&self->_flags |= 0x20u;
  -[NSMutableArray removeAllObjects](self->_detailFormatteds, "removeAllObjects");
}

- (void)addDetailFormatted:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOTransitSignInstruction _readDetailFormatteds]((uint64_t)self);
  -[GEOTransitSignInstruction _addNoFlagsDetailFormatted:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
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
  -[GEOTransitSignInstruction _readDetailFormatteds]((uint64_t)self);
  return -[NSMutableArray count](self->_detailFormatteds, "count");
}

- (id)detailFormattedAtIndex:(unint64_t)a3
{
  -[GEOTransitSignInstruction _readDetailFormatteds]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_detailFormatteds, "objectAtIndex:", a3);
}

+ (Class)detailFormattedType
{
  return (Class)objc_opt_class();
}

- (void)_readNoticeFormatteds
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitSignInstructionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readNoticeFormatteds_tags_6995);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)noticeFormatteds
{
  -[GEOTransitSignInstruction _readNoticeFormatteds]((uint64_t)self);
  return self->_noticeFormatteds;
}

- (void)setNoticeFormatteds:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *noticeFormatteds;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  noticeFormatteds = self->_noticeFormatteds;
  self->_noticeFormatteds = v4;

}

- (void)clearNoticeFormatteds
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  -[NSMutableArray removeAllObjects](self->_noticeFormatteds, "removeAllObjects");
}

- (void)addNoticeFormatted:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOTransitSignInstruction _readNoticeFormatteds]((uint64_t)self);
  -[GEOTransitSignInstruction _addNoFlagsNoticeFormatted:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
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

- (unint64_t)noticeFormattedsCount
{
  -[GEOTransitSignInstruction _readNoticeFormatteds]((uint64_t)self);
  return -[NSMutableArray count](self->_noticeFormatteds, "count");
}

- (id)noticeFormattedAtIndex:(unint64_t)a3
{
  -[GEOTransitSignInstruction _readNoticeFormatteds]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_noticeFormatteds, "objectAtIndex:", a3);
}

+ (Class)noticeFormattedType
{
  return (Class)objc_opt_class();
}

- (void)_readPriceFormatteds
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitSignInstructionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPriceFormatteds_tags_6996);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)priceFormatteds
{
  -[GEOTransitSignInstruction _readPriceFormatteds]((uint64_t)self);
  return self->_priceFormatteds;
}

- (void)setPriceFormatteds:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *priceFormatteds;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  priceFormatteds = self->_priceFormatteds;
  self->_priceFormatteds = v4;

}

- (void)clearPriceFormatteds
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  -[NSMutableArray removeAllObjects](self->_priceFormatteds, "removeAllObjects");
}

- (void)addPriceFormatted:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOTransitSignInstruction _readPriceFormatteds]((uint64_t)self);
  -[GEOTransitSignInstruction _addNoFlagsPriceFormatted:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
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

- (unint64_t)priceFormattedsCount
{
  -[GEOTransitSignInstruction _readPriceFormatteds]((uint64_t)self);
  return -[NSMutableArray count](self->_priceFormatteds, "count");
}

- (id)priceFormattedAtIndex:(unint64_t)a3
{
  -[GEOTransitSignInstruction _readPriceFormatteds]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_priceFormatteds, "objectAtIndex:", a3);
}

+ (Class)priceFormattedType
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)GEOTransitSignInstruction;
  -[GEOTransitSignInstruction description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOTransitSignInstruction dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTransitSignInstruction _dictionaryRepresentation:]((uint64_t)self, 0);
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
  void *v44;
  id v45;
  id v46;
  _QWORD v48[4];
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v6 = *(id *)(a1 + 24);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v63;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v63 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v11, "jsonRepresentation");
          else
            objc_msgSend(v11, "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
      }
      while (v8);
    }

    if (a2)
      v13 = CFSTR("commandFormatted");
    else
      v13 = CFSTR("command_formatted");
    objc_msgSend(v4, "setObject:forKey:", v5, v13);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v15 = *(id *)(a1 + 32);
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v59;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v59 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v20, "jsonRepresentation");
          else
            objc_msgSend(v20, "dictionaryRepresentation");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v21);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
      }
      while (v17);
    }

    if (a2)
      v22 = CFSTR("detailFormatted");
    else
      v22 = CFSTR("detail_formatted");
    objc_msgSend(v4, "setObject:forKey:", v14, v22);

  }
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v24 = *(id *)(a1 + 40);
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v55;
      do
      {
        for (k = 0; k != v26; ++k)
        {
          if (*(_QWORD *)v55 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * k);
          if ((a2 & 1) != 0)
            objc_msgSend(v29, "jsonRepresentation");
          else
            objc_msgSend(v29, "dictionaryRepresentation");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addObject:", v30);

        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
      }
      while (v26);
    }

    if (a2)
      v31 = CFSTR("noticeFormatted");
    else
      v31 = CFSTR("notice_formatted");
    objc_msgSend(v4, "setObject:forKey:", v23, v31);

  }
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v33 = *(id *)(a1 + 48);
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v50, v66, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v51;
      do
      {
        for (m = 0; m != v35; ++m)
        {
          if (*(_QWORD *)v51 != v36)
            objc_enumerationMutation(v33);
          v38 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * m);
          if ((a2 & 1) != 0)
            objc_msgSend(v38, "jsonRepresentation");
          else
            objc_msgSend(v38, "dictionaryRepresentation");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "addObject:", v39);

        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v50, v66, 16);
      }
      while (v35);
    }

    if (a2)
      v40 = CFSTR("priceFormatted");
    else
      v40 = CFSTR("price_formatted");
    objc_msgSend(v4, "setObject:forKey:", v32, v40);

  }
  v41 = *(void **)(a1 + 16);
  if (v41)
  {
    objc_msgSend(v41, "dictionaryRepresentation");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v42;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v42, "count"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __55__GEOTransitSignInstruction__dictionaryRepresentation___block_invoke;
      v48[3] = &unk_1E1C00600;
      v45 = v44;
      v49 = v45;
      objc_msgSend(v43, "enumerateKeysAndObjectsUsingBlock:", v48);
      v46 = v45;

      v43 = v46;
    }
    objc_msgSend(v4, "setObject:forKey:", v43, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOTransitSignInstruction _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __55__GEOTransitSignInstruction__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOTransitSignInstruction)initWithDictionary:(id)a3
{
  return (GEOTransitSignInstruction *)-[GEOTransitSignInstruction _initWithDictionary:isJSON:](self, a3, 0);
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
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
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
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("commandFormatted");
      else
        v6 = CFSTR("command_formatted");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v51 = v5;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v66 = 0u;
        v67 = 0u;
        v64 = 0u;
        v65 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v64, v71, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v65;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v65 != v11)
                objc_enumerationMutation(v8);
              v13 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v14 = [GEOFormattedString alloc];
                if ((a3 & 1) != 0)
                  v15 = -[GEOFormattedString initWithJSON:](v14, "initWithJSON:", v13);
                else
                  v15 = -[GEOFormattedString initWithDictionary:](v14, "initWithDictionary:", v13);
                v16 = (void *)v15;
                objc_msgSend(a1, "addCommandFormatted:", v15);

              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v64, v71, 16);
          }
          while (v10);
        }

        v5 = v51;
      }

      if (a3)
        v17 = CFSTR("detailFormatted");
      else
        v17 = CFSTR("detail_formatted");
      objc_msgSend(v5, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v62 = 0u;
        v63 = 0u;
        v60 = 0u;
        v61 = 0u;
        v19 = v18;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v61;
          do
          {
            for (j = 0; j != v21; ++j)
            {
              if (*(_QWORD *)v61 != v22)
                objc_enumerationMutation(v19);
              v24 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v25 = [GEOFormattedString alloc];
                if ((a3 & 1) != 0)
                  v26 = -[GEOFormattedString initWithJSON:](v25, "initWithJSON:", v24);
                else
                  v26 = -[GEOFormattedString initWithDictionary:](v25, "initWithDictionary:", v24);
                v27 = (void *)v26;
                objc_msgSend(a1, "addDetailFormatted:", v26);

              }
            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
          }
          while (v21);
        }

        v5 = v51;
      }

      if (a3)
        v28 = CFSTR("noticeFormatted");
      else
        v28 = CFSTR("notice_formatted");
      objc_msgSend(v5, "objectForKeyedSubscript:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v58 = 0u;
        v59 = 0u;
        v56 = 0u;
        v57 = 0u;
        v30 = v29;
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
        if (v31)
        {
          v32 = v31;
          v33 = *(_QWORD *)v57;
          do
          {
            for (k = 0; k != v32; ++k)
            {
              if (*(_QWORD *)v57 != v33)
                objc_enumerationMutation(v30);
              v35 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * k);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v36 = [GEOFormattedString alloc];
                if ((a3 & 1) != 0)
                  v37 = -[GEOFormattedString initWithJSON:](v36, "initWithJSON:", v35);
                else
                  v37 = -[GEOFormattedString initWithDictionary:](v36, "initWithDictionary:", v35);
                v38 = (void *)v37;
                objc_msgSend(a1, "addNoticeFormatted:", v37);

              }
            }
            v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
          }
          while (v32);
        }

        v5 = v51;
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
        v54 = 0u;
        v55 = 0u;
        v52 = 0u;
        v53 = 0u;
        v41 = v40;
        v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v52, v68, 16);
        if (v42)
        {
          v43 = v42;
          v44 = *(_QWORD *)v53;
          do
          {
            for (m = 0; m != v43; ++m)
            {
              if (*(_QWORD *)v53 != v44)
                objc_enumerationMutation(v41);
              v46 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * m);
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
            v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v52, v68, 16);
          }
          while (v43);
        }

        v5 = v51;
      }

    }
  }

  return a1;
}

- (GEOTransitSignInstruction)initWithJSON:(id)a3
{
  return (GEOTransitSignInstruction *)-[GEOTransitSignInstruction _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_6997;
    else
      v8 = (int *)&readAll__nonRecursiveTag_6998;
    GEOTransitSignInstructionReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOTransitSignInstructionCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTransitSignInstructionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTransitSignInstructionReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEOTransitSignInstructionIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOTransitSignInstruction readAll:](self, "readAll:", 0);
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v6 = self->_commandFormatteds;
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
    v10 = self->_detailFormatteds;
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
    v14 = self->_noticeFormatteds;
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

  v20 = (id *)a3;
  -[GEOTransitSignInstruction readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v20 + 1, self->_reader);
  *((_DWORD *)v20 + 14) = self->_readerMarkPos;
  *((_DWORD *)v20 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEOTransitSignInstruction commandFormattedsCount](self, "commandFormattedsCount"))
  {
    objc_msgSend(v20, "clearCommandFormatteds");
    v4 = -[GEOTransitSignInstruction commandFormattedsCount](self, "commandFormattedsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOTransitSignInstruction commandFormattedAtIndex:](self, "commandFormattedAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addCommandFormatted:", v7);

      }
    }
  }
  if (-[GEOTransitSignInstruction detailFormattedsCount](self, "detailFormattedsCount"))
  {
    objc_msgSend(v20, "clearDetailFormatteds");
    v8 = -[GEOTransitSignInstruction detailFormattedsCount](self, "detailFormattedsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[GEOTransitSignInstruction detailFormattedAtIndex:](self, "detailFormattedAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addDetailFormatted:", v11);

      }
    }
  }
  if (-[GEOTransitSignInstruction noticeFormattedsCount](self, "noticeFormattedsCount"))
  {
    objc_msgSend(v20, "clearNoticeFormatteds");
    v12 = -[GEOTransitSignInstruction noticeFormattedsCount](self, "noticeFormattedsCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[GEOTransitSignInstruction noticeFormattedAtIndex:](self, "noticeFormattedAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addNoticeFormatted:", v15);

      }
    }
  }
  if (-[GEOTransitSignInstruction priceFormattedsCount](self, "priceFormattedsCount"))
  {
    objc_msgSend(v20, "clearPriceFormatteds");
    v16 = -[GEOTransitSignInstruction priceFormattedsCount](self, "priceFormattedsCount");
    if (v16)
    {
      v17 = v16;
      for (m = 0; m != v17; ++m)
      {
        -[GEOTransitSignInstruction priceFormattedAtIndex:](self, "priceFormattedAtIndex:", m);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addPriceFormatted:", v19);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;
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
  v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x20) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOTransitSignInstructionReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOTransitSignInstruction readAll:](self, "readAll:", 0);
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v8 = self->_commandFormatteds;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v42 != v10)
          objc_enumerationMutation(v8);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend(v5, "addCommandFormatted:", v12);

      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
    }
    while (v9);
  }

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v13 = self->_detailFormatteds;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v38;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v38 != v15)
          objc_enumerationMutation(v13);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend(v5, "addDetailFormatted:", v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
    }
    while (v14);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v18 = self->_noticeFormatteds;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v34;
    do
    {
      for (k = 0; k != v19; ++k)
      {
        if (*(_QWORD *)v34 != v20)
          objc_enumerationMutation(v18);
        v22 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend(v5, "addNoticeFormatted:", v22);

      }
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
    }
    while (v19);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v23 = self->_priceFormatteds;
  v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v29, v45, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v30;
    do
    {
      for (m = 0; m != v24; ++m)
      {
        if (*(_QWORD *)v30 != v25)
          objc_enumerationMutation(v23);
        v27 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * m), "copyWithZone:", a3, (_QWORD)v29);
        objc_msgSend(v5, "addPriceFormatted:", v27);

      }
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v29, v45, 16);
    }
    while (v24);
  }

  objc_storeStrong(v5 + 2, self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *commandFormatteds;
  NSMutableArray *detailFormatteds;
  NSMutableArray *noticeFormatteds;
  NSMutableArray *priceFormatteds;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOTransitSignInstruction readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         commandFormatteds = self->_commandFormatteds,
         !((unint64_t)commandFormatteds | v4[3]))
     || -[NSMutableArray isEqual:](commandFormatteds, "isEqual:"))
    && ((detailFormatteds = self->_detailFormatteds, !((unint64_t)detailFormatteds | v4[4]))
     || -[NSMutableArray isEqual:](detailFormatteds, "isEqual:"))
    && ((noticeFormatteds = self->_noticeFormatteds, !((unint64_t)noticeFormatteds | v4[5]))
     || -[NSMutableArray isEqual:](noticeFormatteds, "isEqual:")))
  {
    priceFormatteds = self->_priceFormatteds;
    if ((unint64_t)priceFormatteds | v4[6])
      v9 = -[NSMutableArray isEqual:](priceFormatteds, "isEqual:");
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

  -[GEOTransitSignInstruction readAll:](self, "readAll:", 1);
  v3 = -[NSMutableArray hash](self->_commandFormatteds, "hash");
  v4 = -[NSMutableArray hash](self->_detailFormatteds, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_noticeFormatteds, "hash");
  return v4 ^ v5 ^ -[NSMutableArray hash](self->_priceFormatteds, "hash");
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

  v45 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  objc_msgSend(v4, "readAll:", 0);
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v5 = v4[3];
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
        -[GEOTransitSignInstruction addCommandFormatted:](self, "addCommandFormatted:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v9++));
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
  v10 = v4[4];
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
        -[GEOTransitSignInstruction addDetailFormatted:](self, "addDetailFormatted:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v14++));
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
  v15 = v4[5];
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
        -[GEOTransitSignInstruction addNoticeFormatted:](self, "addNoticeFormatted:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v19++));
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
  v20 = v4[6];
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
        -[GEOTransitSignInstruction addPriceFormatted:](self, "addPriceFormatted:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v24++), (_QWORD)v25);
      }
      while (v22 != v24);
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
    }
    while (v22);
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
      GEOTransitSignInstructionReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_7001);
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
  *(_BYTE *)&self->_flags |= 0x21u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOTransitSignInstruction readAll:](self, "readAll:", 0);
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v7 = self->_commandFormatteds;
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
    v12 = self->_detailFormatteds;
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
    v17 = self->_noticeFormatteds;
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

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_priceFormatteds, 0);
  objc_storeStrong((id *)&self->_noticeFormatteds, 0);
  objc_storeStrong((id *)&self->_detailFormatteds, 0);
  objc_storeStrong((id *)&self->_commandFormatteds, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (BOOL)_transit_hasAnyFieldSet
{
  return -[GEOTransitSignInstruction noticeFormattedsCount](self, "noticeFormattedsCount")
      || -[GEOTransitSignInstruction commandFormattedsCount](self, "commandFormattedsCount")
      || -[GEOTransitSignInstruction detailFormattedsCount](self, "detailFormattedsCount")
      || -[GEOTransitSignInstruction priceFormattedsCount](self, "priceFormattedsCount") != 0;
}

- (void)_transit_mergeFrom:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  char v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  char v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  char v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  char v40;
  id v41;
  void *v42;
  uint64_t v43;
  id v44;

  v44 = a3;
  -[GEOTransitSignInstruction noticeFormatteds](self, "noticeFormatteds");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "noticeFormatteds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v7 = v5;
  if (!v7)
  {
    v11 = v6;
    goto LABEL_19;
  }
  if (qword_1ECDBBD40 != -1)
    dispatch_once(&qword_1ECDBBD40, &__block_literal_global_63);
  v8 = (id)_MergedGlobals_219;
  v9 = v7;
  if (qword_1ECDBBD40 != -1)
    dispatch_once(&qword_1ECDBBD40, &__block_literal_global_63);
  if (objc_msgSend(v9, "conformsToProtocol:", _MergedGlobals_219))
  {
    v10 = objc_msgSend(v9, "_transit_hasAnyFieldSet");

    if ((v10 & 1) != 0)
    {
LABEL_14:
      if (objc_msgSend(v9, "conformsToProtocol:", v8)
        && objc_msgSend(v6, "conformsToProtocol:", v8))
      {
        objc_msgSend(v6, "_transit_mergeFrom:", v9);
        v9 = v6;
      }
      v11 = v9;
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
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13)
      goto LABEL_14;
  }
  v11 = 0;
LABEL_18:

LABEL_19:
  -[GEOTransitSignInstruction setNoticeFormatteds:](self, "setNoticeFormatteds:", v11);

  -[GEOTransitSignInstruction commandFormatteds](self, "commandFormatteds");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "commandFormatteds");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v14;
  v17 = v15;
  if (!v17)
  {
    v21 = v16;
    goto LABEL_37;
  }
  if (qword_1ECDBBD40 != -1)
    dispatch_once(&qword_1ECDBBD40, &__block_literal_global_63);
  v18 = (id)_MergedGlobals_219;
  v19 = v17;
  if (qword_1ECDBBD40 != -1)
    dispatch_once(&qword_1ECDBBD40, &__block_literal_global_63);
  if (objc_msgSend(v19, "conformsToProtocol:", _MergedGlobals_219))
  {
    v20 = objc_msgSend(v19, "_transit_hasAnyFieldSet");

    if ((v20 & 1) != 0)
    {
LABEL_32:
      if (objc_msgSend(v19, "conformsToProtocol:", v18)
        && objc_msgSend(v16, "conformsToProtocol:", v18))
      {
        objc_msgSend(v16, "_transit_mergeFrom:", v19);
        v19 = v16;
      }
      v21 = v19;
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
    objc_msgSend(v19, "dictionaryRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "count");

    if (v23)
      goto LABEL_32;
  }
  v21 = 0;
LABEL_36:

LABEL_37:
  -[GEOTransitSignInstruction setCommandFormatteds:](self, "setCommandFormatteds:", v21);

  -[GEOTransitSignInstruction detailFormatteds](self, "detailFormatteds");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "detailFormatteds");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v24;
  v27 = v25;
  if (!v27)
  {
    v31 = v26;
    goto LABEL_55;
  }
  if (qword_1ECDBBD40 != -1)
    dispatch_once(&qword_1ECDBBD40, &__block_literal_global_63);
  v28 = (id)_MergedGlobals_219;
  v29 = v27;
  if (qword_1ECDBBD40 != -1)
    dispatch_once(&qword_1ECDBBD40, &__block_literal_global_63);
  if (objc_msgSend(v29, "conformsToProtocol:", _MergedGlobals_219))
  {
    v30 = objc_msgSend(v29, "_transit_hasAnyFieldSet");

    if ((v30 & 1) != 0)
    {
LABEL_50:
      if (objc_msgSend(v29, "conformsToProtocol:", v28)
        && objc_msgSend(v26, "conformsToProtocol:", v28))
      {
        objc_msgSend(v26, "_transit_mergeFrom:", v29);
        v29 = v26;
      }
      v31 = v29;
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
    objc_msgSend(v29, "dictionaryRepresentation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "count");

    if (v33)
      goto LABEL_50;
  }
  v31 = 0;
LABEL_54:

LABEL_55:
  -[GEOTransitSignInstruction setDetailFormatteds:](self, "setDetailFormatteds:", v31);

  -[GEOTransitSignInstruction priceFormatteds](self, "priceFormatteds");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "priceFormatteds");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v34;
  v37 = v35;
  if (v37)
  {
    if (qword_1ECDBBD40 != -1)
      dispatch_once(&qword_1ECDBBD40, &__block_literal_global_63);
    v38 = (id)_MergedGlobals_219;
    v39 = v37;
    if (qword_1ECDBBD40 != -1)
      dispatch_once(&qword_1ECDBBD40, &__block_literal_global_63);
    if (objc_msgSend(v39, "conformsToProtocol:", _MergedGlobals_219))
    {
      v40 = objc_msgSend(v39, "_transit_hasAnyFieldSet");

      if ((v40 & 1) != 0)
      {
LABEL_68:
        if (objc_msgSend(v39, "conformsToProtocol:", v38)
          && objc_msgSend(v36, "conformsToProtocol:", v38))
        {
          objc_msgSend(v36, "_transit_mergeFrom:", v39);
          v39 = v36;
        }
        v41 = v39;
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
      objc_msgSend(v39, "dictionaryRepresentation");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "count");

      if (v43)
        goto LABEL_68;
    }
    v41 = 0;
LABEL_72:

    goto LABEL_73;
  }
  v41 = v36;
LABEL_73:

  -[GEOTransitSignInstruction setPriceFormatteds:](self, "setPriceFormatteds:", v41);
}

@end
