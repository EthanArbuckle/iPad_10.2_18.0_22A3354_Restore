@implementation GEOTransitSection

- (GEOTransitSection)init
{
  GEOTransitSection *v2;
  GEOTransitSection *v3;
  GEOTransitSection *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOTransitSection;
  v2 = -[GEOTransitSection init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTransitSection)initWithData:(id)a3
{
  GEOTransitSection *v3;
  GEOTransitSection *v4;
  GEOTransitSection *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOTransitSection;
  v3 = -[GEOTransitSection initWithData:](&v7, sel_initWithData_, a3);
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

  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOTransitSection;
  -[GEOTransitSection dealloc](&v3, sel_dealloc);
}

- (void)_readStepIndexs
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 132) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitSectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readStepIndexs_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (unint64_t)stepIndexsCount
{
  -[GEOTransitSection _readStepIndexs]((uint64_t)self);
  return self->_stepIndexs.count;
}

- (unsigned)stepIndexs
{
  -[GEOTransitSection _readStepIndexs]((uint64_t)self);
  return self->_stepIndexs.list;
}

- (void)clearStepIndexs
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  PBRepeatedUInt32Clear();
}

- (void)addStepIndex:(unsigned int)a3
{
  -[GEOTransitSection _readStepIndexs]((uint64_t)self);
  if (self)
    PBRepeatedUInt32Add();
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
}

- (unsigned)stepIndexAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_stepIndexs;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOTransitSection _readStepIndexs]((uint64_t)self);
  p_stepIndexs = &self->_stepIndexs;
  count = self->_stepIndexs.count;
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
  return p_stepIndexs->list[a3];
}

- (void)setStepIndexs:(unsigned int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  PBRepeatedUInt32Set();
}

- (int)nextOptionsIndex
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_nextOptionsIndex;
  else
    return -1;
}

- (void)setNextOptionsIndex:(int)a3
{
  *(_WORD *)&self->_flags |= 0x101u;
  self->_nextOptionsIndex = a3;
}

- (void)setHasNextOptionsIndex:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x100;
}

- (BOOL)hasNextOptionsIndex
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)_readActionSheetName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 132) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitSectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readActionSheetName_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasActionSheetName
{
  -[GEOTransitSection _readActionSheetName]((uint64_t)self);
  return self->_actionSheetName != 0;
}

- (NSString)actionSheetName
{
  -[GEOTransitSection _readActionSheetName]((uint64_t)self);
  return self->_actionSheetName;
}

- (void)setActionSheetName:(id)a3
{
  *(_WORD *)&self->_flags |= 0x140u;
  objc_storeStrong((id *)&self->_actionSheetName, a3);
}

- (void)_readActionSheetArtworkIndexs
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 132) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitSectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readActionSheetArtworkIndexs_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (unint64_t)actionSheetArtworkIndexsCount
{
  -[GEOTransitSection _readActionSheetArtworkIndexs]((uint64_t)self);
  return self->_actionSheetArtworkIndexs.count;
}

- (unsigned)actionSheetArtworkIndexs
{
  -[GEOTransitSection _readActionSheetArtworkIndexs]((uint64_t)self);
  return self->_actionSheetArtworkIndexs.list;
}

- (void)clearActionSheetArtworkIndexs
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  PBRepeatedUInt32Clear();
}

- (void)addActionSheetArtworkIndex:(unsigned int)a3
{
  -[GEOTransitSection _readActionSheetArtworkIndexs]((uint64_t)self);
  if (self)
    PBRepeatedUInt32Add();
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
}

- (unsigned)actionSheetArtworkIndexAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_actionSheetArtworkIndexs;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOTransitSection _readActionSheetArtworkIndexs]((uint64_t)self);
  p_actionSheetArtworkIndexs = &self->_actionSheetArtworkIndexs;
  count = self->_actionSheetArtworkIndexs.count;
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
  return p_actionSheetArtworkIndexs->list[a3];
}

- (void)setActionSheetArtworkIndexs:(unsigned int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  PBRepeatedUInt32Set();
}

- (void)_readRouteDetailsArtworkIndexs
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 132) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitSectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRouteDetailsArtworkIndexs_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (unint64_t)routeDetailsArtworkIndexsCount
{
  -[GEOTransitSection _readRouteDetailsArtworkIndexs]((uint64_t)self);
  return self->_routeDetailsArtworkIndexs.count;
}

- (unsigned)routeDetailsArtworkIndexs
{
  -[GEOTransitSection _readRouteDetailsArtworkIndexs]((uint64_t)self);
  return self->_routeDetailsArtworkIndexs.list;
}

- (void)clearRouteDetailsArtworkIndexs
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  PBRepeatedUInt32Clear();
}

- (void)addRouteDetailsArtworkIndex:(unsigned int)a3
{
  -[GEOTransitSection _readRouteDetailsArtworkIndexs]((uint64_t)self);
  if (self)
    PBRepeatedUInt32Add();
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
}

- (unsigned)routeDetailsArtworkIndexAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_routeDetailsArtworkIndexs;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOTransitSection _readRouteDetailsArtworkIndexs]((uint64_t)self);
  p_routeDetailsArtworkIndexs = &self->_routeDetailsArtworkIndexs;
  count = self->_routeDetailsArtworkIndexs.count;
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
  return p_routeDetailsArtworkIndexs->list[a3];
}

- (void)setRouteDetailsArtworkIndexs:(unsigned int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  PBRepeatedUInt32Set();
}

- (BOOL)disableAlightNotifications
{
  return self->_disableAlightNotifications;
}

- (void)setDisableAlightNotifications:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x102u;
  self->_disableAlightNotifications = a3;
}

- (void)setHasDisableAlightNotifications:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 258;
  else
    v3 = 256;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasDisableAlightNotifications
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (void)_readTicketingSegments
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 132) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitSectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTicketingSegments_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (NSMutableArray)ticketingSegments
{
  -[GEOTransitSection _readTicketingSegments]((uint64_t)self);
  return self->_ticketingSegments;
}

- (void)setTicketingSegments:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *ticketingSegments;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  ticketingSegments = self->_ticketingSegments;
  self->_ticketingSegments = v4;

}

- (void)clearTicketingSegments
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  -[NSMutableArray removeAllObjects](self->_ticketingSegments, "removeAllObjects");
}

- (void)addTicketingSegment:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOTransitSection _readTicketingSegments]((uint64_t)self);
  -[GEOTransitSection _addNoFlagsTicketingSegment:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
}

- (void)_addNoFlagsTicketingSegment:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 104);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 104);
      *(_QWORD *)(a1 + 104) = v5;

      v4 = *(void **)(a1 + 104);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)ticketingSegmentsCount
{
  -[GEOTransitSection _readTicketingSegments]((uint64_t)self);
  return -[NSMutableArray count](self->_ticketingSegments, "count");
}

- (id)ticketingSegmentAtIndex:(unint64_t)a3
{
  -[GEOTransitSection _readTicketingSegments]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_ticketingSegments, "objectAtIndex:", a3);
}

+ (Class)ticketingSegmentType
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
  v8.super_class = (Class)GEOTransitSection;
  -[GEOTransitSection description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOTransitSection dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTransitSection _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  _QWORD v33[4];
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 80))
  {
    PBRepeatedUInt32NSArray();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v6 = CFSTR("stepIndex");
    else
      v6 = CFSTR("step_index");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);

  }
  if ((*(_WORD *)(a1 + 132) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 124));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v8 = CFSTR("nextOptionsIndex");
    else
      v8 = CFSTR("next_options_index");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  objc_msgSend((id)a1, "actionSheetName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (a2)
      v10 = CFSTR("actionSheetName");
    else
      v10 = CFSTR("action_sheet_name");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);
  }

  if (*(_QWORD *)(a1 + 32))
  {
    PBRepeatedUInt32NSArray();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v12 = CFSTR("actionSheetArtworkIndex");
    else
      v12 = CFSTR("action_sheet_artwork_index");
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

  }
  if (*(_QWORD *)(a1 + 56))
  {
    PBRepeatedUInt32NSArray();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v14 = CFSTR("routeDetailsArtworkIndex");
    else
      v14 = CFSTR("route_details_artwork_index");
    objc_msgSend(v4, "setObject:forKey:", v13, v14);

  }
  if ((*(_WORD *)(a1 + 132) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 128));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v16 = CFSTR("disableAlightNotifications");
    else
      v16 = CFSTR("disable_alight_notifications");
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

  }
  if (objc_msgSend(*(id *)(a1 + 104), "count"))
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 104), "count"));
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v18 = *(id *)(a1 + 104);
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v36 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v23, "jsonRepresentation");
          else
            objc_msgSend(v23, "dictionaryRepresentation");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v24);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      }
      while (v20);
    }

    if (a2)
      v25 = CFSTR("ticketingSegment");
    else
      v25 = CFSTR("ticketing_segment");
    objc_msgSend(v4, "setObject:forKey:", v17, v25);

  }
  v26 = *(void **)(a1 + 16);
  if (v26)
  {
    objc_msgSend(v26, "dictionaryRepresentation");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v27, "count"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __47__GEOTransitSection__dictionaryRepresentation___block_invoke;
      v33[3] = &unk_1E1C00600;
      v30 = v29;
      v34 = v30;
      objc_msgSend(v28, "enumerateKeysAndObjectsUsingBlock:", v33);
      v31 = v30;

      v28 = v31;
    }
    objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOTransitSection _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __47__GEOTransitSection__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOTransitSection)initWithDictionary:(id)a3
{
  return (GEOTransitSection *)-[GEOTransitSection _initWithDictionary:isJSON:](self, a3, 0);
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
  void *v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  const __CFString *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  void *v34;
  const __CFString *v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t m;
  uint64_t v44;
  GEOTransitTicketingSegment *v45;
  uint64_t v46;
  void *v47;
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
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("stepIndex");
      else
        v6 = CFSTR("step_index");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v49 = v5;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v64 = 0u;
        v65 = 0u;
        v62 = 0u;
        v63 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v63;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v63 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(a1, "addStepIndex:", objc_msgSend(v13, "unsignedIntValue"));
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
          }
          while (v10);
        }

        v5 = v49;
      }

      if (a3)
        v14 = CFSTR("nextOptionsIndex");
      else
        v14 = CFSTR("next_options_index");
      objc_msgSend(v5, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setNextOptionsIndex:", objc_msgSend(v15, "intValue"));

      if (a3)
        v16 = CFSTR("actionSheetName");
      else
        v16 = CFSTR("action_sheet_name");
      objc_msgSend(v5, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = (void *)objc_msgSend(v17, "copy");
        objc_msgSend(a1, "setActionSheetName:", v18);

      }
      if (a3)
        v19 = CFSTR("actionSheetArtworkIndex");
      else
        v19 = CFSTR("action_sheet_artwork_index");
      objc_msgSend(v5, "objectForKeyedSubscript:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v60 = 0u;
        v61 = 0u;
        v58 = 0u;
        v59 = 0u;
        v21 = v20;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v59;
          do
          {
            for (j = 0; j != v23; ++j)
            {
              if (*(_QWORD *)v59 != v24)
                objc_enumerationMutation(v21);
              v26 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(a1, "addActionSheetArtworkIndex:", objc_msgSend(v26, "unsignedIntValue"));
            }
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
          }
          while (v23);
        }

        v5 = v49;
      }

      if (a3)
        v27 = CFSTR("routeDetailsArtworkIndex");
      else
        v27 = CFSTR("route_details_artwork_index");
      objc_msgSend(v5, "objectForKeyedSubscript:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v56 = 0u;
        v57 = 0u;
        v54 = 0u;
        v55 = 0u;
        v29 = v28;
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
        if (v30)
        {
          v31 = v30;
          v32 = *(_QWORD *)v55;
          do
          {
            for (k = 0; k != v31; ++k)
            {
              if (*(_QWORD *)v55 != v32)
                objc_enumerationMutation(v29);
              v34 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * k);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(a1, "addRouteDetailsArtworkIndex:", objc_msgSend(v34, "unsignedIntValue"));
            }
            v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
          }
          while (v31);
        }

        v5 = v49;
      }

      if (a3)
        v35 = CFSTR("disableAlightNotifications");
      else
        v35 = CFSTR("disable_alight_notifications");
      objc_msgSend(v5, "objectForKeyedSubscript:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setDisableAlightNotifications:", objc_msgSend(v36, "BOOLValue"));

      if (a3)
        v37 = CFSTR("ticketingSegment");
      else
        v37 = CFSTR("ticketing_segment");
      objc_msgSend(v5, "objectForKeyedSubscript:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        v39 = v38;
        v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v50, v66, 16);
        if (v40)
        {
          v41 = v40;
          v42 = *(_QWORD *)v51;
          do
          {
            for (m = 0; m != v41; ++m)
            {
              if (*(_QWORD *)v51 != v42)
                objc_enumerationMutation(v39);
              v44 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * m);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v45 = [GEOTransitTicketingSegment alloc];
                if ((a3 & 1) != 0)
                  v46 = -[GEOTransitTicketingSegment initWithJSON:](v45, "initWithJSON:", v44);
                else
                  v46 = -[GEOTransitTicketingSegment initWithDictionary:](v45, "initWithDictionary:", v44);
                v47 = (void *)v46;
                objc_msgSend(a1, "addTicketingSegment:", v46);

              }
            }
            v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v50, v66, 16);
          }
          while (v41);
        }

        v5 = v49;
      }

    }
  }

  return a1;
}

- (GEOTransitSection)initWithJSON:(id)a3
{
  return (GEOTransitSection *)-[GEOTransitSection _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_1059;
    else
      v8 = (int *)&readAll__nonRecursiveTag_1060;
    GEOTransitSectionReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOTransitSectionCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTransitSectionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTransitSectionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  PBDataReader *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOTransitSectionIsDirty((uint64_t)self) & 1) == 0)
  {
    v13 = self->_reader;
    objc_sync_enter(v13);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v14);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v13);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOTransitSection readAll:](self, "readAll:", 0);
    if (self->_stepIndexs.count)
    {
      v19 = 0;
      PBDataWriterPlaceMark();
      if (self->_stepIndexs.count)
      {
        v6 = 0;
        do
        {
          PBDataWriterWriteUint32Field();
          ++v6;
        }
        while (v6 < self->_stepIndexs.count);
      }
      PBDataWriterRecallMark();
    }
    if ((*(_WORD *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_actionSheetName)
      PBDataWriterWriteStringField();
    if (self->_actionSheetArtworkIndexs.count)
    {
      v19 = 0;
      PBDataWriterPlaceMark();
      if (self->_actionSheetArtworkIndexs.count)
      {
        v7 = 0;
        do
        {
          PBDataWriterWriteUint32Field();
          ++v7;
        }
        while (v7 < self->_actionSheetArtworkIndexs.count);
      }
      PBDataWriterRecallMark();
    }
    if (self->_routeDetailsArtworkIndexs.count)
    {
      v19 = 0;
      PBDataWriterPlaceMark();
      if (self->_routeDetailsArtworkIndexs.count)
      {
        v8 = 0;
        do
        {
          PBDataWriterWriteUint32Field();
          ++v8;
        }
        while (v8 < self->_routeDetailsArtworkIndexs.count);
      }
      PBDataWriterRecallMark();
    }
    if ((*(_WORD *)&self->_flags & 2) != 0)
      PBDataWriterWriteBOOLField();
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = self->_ticketingSegments;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v9);
          PBDataWriterWriteSubmessage();
        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v10);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v15);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  unint64_t v7;
  unint64_t v8;
  uint64_t j;
  unint64_t v10;
  unint64_t v11;
  uint64_t k;
  unint64_t v13;
  unint64_t v14;
  uint64_t m;
  void *v16;
  id *v17;

  v17 = (id *)a3;
  -[GEOTransitSection readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v17 + 1, self->_reader);
  *((_DWORD *)v17 + 28) = self->_readerMarkPos;
  *((_DWORD *)v17 + 29) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEOTransitSection stepIndexsCount](self, "stepIndexsCount"))
  {
    objc_msgSend(v17, "clearStepIndexs");
    v4 = -[GEOTransitSection stepIndexsCount](self, "stepIndexsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v17, "addStepIndex:", -[GEOTransitSection stepIndexAtIndex:](self, "stepIndexAtIndex:", i));
    }
  }
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v17 + 31) = self->_nextOptionsIndex;
    *((_WORD *)v17 + 66) |= 1u;
  }
  if (self->_actionSheetName)
    objc_msgSend(v17, "setActionSheetName:");
  if (-[GEOTransitSection actionSheetArtworkIndexsCount](self, "actionSheetArtworkIndexsCount"))
  {
    objc_msgSend(v17, "clearActionSheetArtworkIndexs");
    v7 = -[GEOTransitSection actionSheetArtworkIndexsCount](self, "actionSheetArtworkIndexsCount");
    if (v7)
    {
      v8 = v7;
      for (j = 0; j != v8; ++j)
        objc_msgSend(v17, "addActionSheetArtworkIndex:", -[GEOTransitSection actionSheetArtworkIndexAtIndex:](self, "actionSheetArtworkIndexAtIndex:", j));
    }
  }
  if (-[GEOTransitSection routeDetailsArtworkIndexsCount](self, "routeDetailsArtworkIndexsCount"))
  {
    objc_msgSend(v17, "clearRouteDetailsArtworkIndexs");
    v10 = -[GEOTransitSection routeDetailsArtworkIndexsCount](self, "routeDetailsArtworkIndexsCount");
    if (v10)
    {
      v11 = v10;
      for (k = 0; k != v11; ++k)
        objc_msgSend(v17, "addRouteDetailsArtworkIndex:", -[GEOTransitSection routeDetailsArtworkIndexAtIndex:](self, "routeDetailsArtworkIndexAtIndex:", k));
    }
  }
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *((_BYTE *)v17 + 128) = self->_disableAlightNotifications;
    *((_WORD *)v17 + 66) |= 2u;
  }
  if (-[GEOTransitSection ticketingSegmentsCount](self, "ticketingSegmentsCount"))
  {
    objc_msgSend(v17, "clearTicketingSegments");
    v13 = -[GEOTransitSection ticketingSegmentsCount](self, "ticketingSegmentsCount");
    if (v13)
    {
      v14 = v13;
      for (m = 0; m != v14; ++m)
      {
        -[GEOTransitSection ticketingSegmentAtIndex:](self, "ticketingSegmentAtIndex:", m);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addTicketingSegment:", v16);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  PBUnknownFields *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x100) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOTransitSectionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_17;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOTransitSection readAll:](self, "readAll:", 0);
  PBRepeatedUInt32Copy();
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 124) = self->_nextOptionsIndex;
    *(_WORD *)(v5 + 132) |= 1u;
  }
  v9 = -[NSString copyWithZone:](self->_actionSheetName, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v9;

  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(_BYTE *)(v5 + 128) = self->_disableAlightNotifications;
    *(_WORD *)(v5 + 132) |= 2u;
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = self->_ticketingSegments;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v11);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v18);
        objc_msgSend((id)v5, "addTicketingSegment:", v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }

  v16 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v16;
LABEL_17:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 v5;
  NSString *actionSheetName;
  __int16 v7;
  char v8;
  NSMutableArray *ticketingSegments;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  -[GEOTransitSection readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if (!PBRepeatedUInt32IsEqual())
    goto LABEL_16;
  v5 = *((_WORD *)v4 + 66);
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    if ((v5 & 1) == 0 || self->_nextOptionsIndex != *((_DWORD *)v4 + 31))
      goto LABEL_16;
  }
  else if ((v5 & 1) != 0)
  {
    goto LABEL_16;
  }
  actionSheetName = self->_actionSheetName;
  if ((unint64_t)actionSheetName | *((_QWORD *)v4 + 12)
    && !-[NSString isEqual:](actionSheetName, "isEqual:")
    || !PBRepeatedUInt32IsEqual()
    || !PBRepeatedUInt32IsEqual())
  {
    goto LABEL_16;
  }
  v7 = *((_WORD *)v4 + 66);
  if ((*(_WORD *)&self->_flags & 2) == 0)
  {
    if ((v7 & 2) == 0)
      goto LABEL_22;
LABEL_16:
    v8 = 0;
    goto LABEL_17;
  }
  if ((v7 & 2) == 0)
    goto LABEL_16;
  if (!self->_disableAlightNotifications)
  {
    if (!*((_BYTE *)v4 + 128))
      goto LABEL_22;
    goto LABEL_16;
  }
  if (!*((_BYTE *)v4 + 128))
    goto LABEL_16;
LABEL_22:
  ticketingSegments = self->_ticketingSegments;
  if ((unint64_t)ticketingSegments | *((_QWORD *)v4 + 13))
    v8 = -[NSMutableArray isEqual:](ticketingSegments, "isEqual:");
  else
    v8 = 1;
LABEL_17:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  -[GEOTransitSection readAll:](self, "readAll:", 1);
  v3 = PBRepeatedUInt32Hash();
  if ((*(_WORD *)&self->_flags & 1) != 0)
    v4 = 2654435761 * self->_nextOptionsIndex;
  else
    v4 = 0;
  v5 = -[NSString hash](self->_actionSheetName, "hash");
  v6 = PBRepeatedUInt32Hash();
  v7 = PBRepeatedUInt32Hash();
  if ((*(_WORD *)&self->_flags & 2) != 0)
    v8 = 2654435761 * self->_disableAlightNotifications;
  else
    v8 = 0;
  return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v5 ^ -[NSMutableArray hash](self->_ticketingSegments, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  uint64_t v11;
  uint64_t v12;
  uint64_t k;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t m;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  v5 = objc_msgSend(v4, "stepIndexsCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
      -[GEOTransitSection addStepIndex:](self, "addStepIndex:", objc_msgSend(v4, "stepIndexAtIndex:", i));
  }
  if ((*((_WORD *)v4 + 66) & 1) != 0)
  {
    self->_nextOptionsIndex = *((_DWORD *)v4 + 31);
    *(_WORD *)&self->_flags |= 1u;
  }
  if (*((_QWORD *)v4 + 12))
    -[GEOTransitSection setActionSheetName:](self, "setActionSheetName:");
  v8 = objc_msgSend(v4, "actionSheetArtworkIndexsCount");
  if (v8)
  {
    v9 = v8;
    for (j = 0; j != v9; ++j)
      -[GEOTransitSection addActionSheetArtworkIndex:](self, "addActionSheetArtworkIndex:", objc_msgSend(v4, "actionSheetArtworkIndexAtIndex:", j));
  }
  v11 = objc_msgSend(v4, "routeDetailsArtworkIndexsCount");
  if (v11)
  {
    v12 = v11;
    for (k = 0; k != v12; ++k)
      -[GEOTransitSection addRouteDetailsArtworkIndex:](self, "addRouteDetailsArtworkIndex:", objc_msgSend(v4, "routeDetailsArtworkIndexAtIndex:", k));
  }
  if ((*((_WORD *)v4 + 66) & 2) != 0)
  {
    self->_disableAlightNotifications = *((_BYTE *)v4 + 128);
    *(_WORD *)&self->_flags |= 2u;
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v14 = *((id *)v4 + 13);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v20;
    do
    {
      for (m = 0; m != v16; ++m)
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v14);
        -[GEOTransitSection addTicketingSegment:](self, "addTicketingSegment:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * m), (_QWORD)v19);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v16);
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 4) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOTransitSectionReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1063);
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
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x104u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOTransitSection readAll:](self, "readAll:", 0);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = self->_ticketingSegments;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "clearUnknownFields:", 1, (_QWORD)v12);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ticketingSegments, 0);
  objc_storeStrong((id *)&self->_actionSheetName, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
