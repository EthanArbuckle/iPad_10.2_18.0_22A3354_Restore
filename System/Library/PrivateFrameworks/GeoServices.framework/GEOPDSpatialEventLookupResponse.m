@implementation GEOPDSpatialEventLookupResponse

- (GEOPDSpatialEventLookupResponse)init
{
  GEOPDSpatialEventLookupResponse *v2;
  GEOPDSpatialEventLookupResponse *v3;
  GEOPDSpatialEventLookupResponse *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDSpatialEventLookupResponse;
  v2 = -[GEOPDSpatialEventLookupResponse init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSpatialEventLookupResponse)initWithData:(id)a3
{
  GEOPDSpatialEventLookupResponse *v3;
  GEOPDSpatialEventLookupResponse *v4;
  GEOPDSpatialEventLookupResponse *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDSpatialEventLookupResponse;
  v3 = -[GEOPDSpatialEventLookupResponse initWithData:](&v7, sel_initWithData_, a3);
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
  v3.super_class = (Class)GEOPDSpatialEventLookupResponse;
  -[GEOPDSpatialEventLookupResponse dealloc](&v3, sel_dealloc);
}

- (void)_readEventId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_BYTE *)(a1 + 100) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSpatialEventLookupResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEventId_tags_6433);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasEventId
{
  -[GEOPDSpatialEventLookupResponse _readEventId]((uint64_t)self);
  return self->_eventId != 0;
}

- (GEOPDMapsIdentifier)eventId
{
  -[GEOPDSpatialEventLookupResponse _readEventId]((uint64_t)self);
  return self->_eventId;
}

- (void)setEventId:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x90u;
  objc_storeStrong((id *)&self->_eventId, a3);
}

- (void)_readCenter
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_BYTE *)(a1 + 100) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSpatialEventLookupResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCenter_tags_6434);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasCenter
{
  -[GEOPDSpatialEventLookupResponse _readCenter]((uint64_t)self);
  return self->_center != 0;
}

- (GEOLatLng)center
{
  -[GEOPDSpatialEventLookupResponse _readCenter]((uint64_t)self);
  return self->_center;
}

- (void)setCenter:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x84u;
  objc_storeStrong((id *)&self->_center, a3);
}

- (void)_readCategorys
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_BYTE *)(a1 + 100) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSpatialEventLookupResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCategorys_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (unint64_t)categorysCount
{
  -[GEOPDSpatialEventLookupResponse _readCategorys]((uint64_t)self);
  return self->_categorys.count;
}

- (int)categorys
{
  -[GEOPDSpatialEventLookupResponse _readCategorys]((uint64_t)self);
  return self->_categorys.list;
}

- (void)clearCategorys
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  PBRepeatedInt32Clear();
}

- (void)addCategory:(int)a3
{
  -[GEOPDSpatialEventLookupResponse _readCategorys]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
}

- (int)categoryAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_categorys;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOPDSpatialEventLookupResponse _readCategorys]((uint64_t)self);
  p_categorys = &self->_categorys;
  count = self->_categorys.count;
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
  return p_categorys->list[a3];
}

- (void)setCategorys:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  PBRepeatedInt32Set();
}

- (id)categorysAsString:(int)a3
{
  if (a3 < 0xE)
    return off_1E1C0C180[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsCategorys:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_EVENT_LOOKUP_CATEGORY_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_EVENT_LOOKUP_CATEGORY_ARTSANDMUSEUMS")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_EVENT_LOOKUP_CATEGORY_BUSINESSANDTECHNOLOGY")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_EVENT_LOOKUP_CATEGORY_COMMUNITY")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_EVENT_LOOKUP_CATEGORY_DANCE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_EVENT_LOOKUP_CATEGORY_EDUCATIONAL")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_EVENT_LOOKUP_CATEGORY_FAMILYEVENTS")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_EVENT_LOOKUP_CATEGORY_FESTIVALSANDFAIRS")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_EVENT_LOOKUP_CATEGORY_MUSICCONCERTS")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_EVENT_LOOKUP_CATEGORY_NIGHTLIFE")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_EVENT_LOOKUP_CATEGORY_SPORTS")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_EVENT_LOOKUP_CATEGORY_THEATER")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_EVENT_LOOKUP_CATEGORY_TOURS")) & 1) != 0)
  {
    v4 = 12;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SPATIAL_EVENT_LOOKUP_CATEGORY_APPLEEVENT")))
  {
    v4 = 13;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readEventDateTimes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_BYTE *)(a1 + 100) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSpatialEventLookupResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEventDateTimes_tags_6435);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (NSMutableArray)eventDateTimes
{
  -[GEOPDSpatialEventLookupResponse _readEventDateTimes]((uint64_t)self);
  return self->_eventDateTimes;
}

- (void)setEventDateTimes:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *eventDateTimes;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  eventDateTimes = self->_eventDateTimes;
  self->_eventDateTimes = v4;

}

- (void)clearEventDateTimes
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  -[NSMutableArray removeAllObjects](self->_eventDateTimes, "removeAllObjects");
}

- (void)addEventDateTime:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPDSpatialEventLookupResponse _readEventDateTimes]((uint64_t)self);
  -[GEOPDSpatialEventLookupResponse _addNoFlagsEventDateTime:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsEventDateTime:(uint64_t)a1
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

- (unint64_t)eventDateTimesCount
{
  -[GEOPDSpatialEventLookupResponse _readEventDateTimes]((uint64_t)self);
  return -[NSMutableArray count](self->_eventDateTimes, "count");
}

- (id)eventDateTimeAtIndex:(unint64_t)a3
{
  -[GEOPDSpatialEventLookupResponse _readEventDateTimes]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_eventDateTimes, "objectAtIndex:", a3);
}

+ (Class)eventDateTimeType
{
  return (Class)objc_opt_class();
}

- (void)_readTimezone
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_BYTE *)(a1 + 100) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSpatialEventLookupResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTimezone_tags_6436);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasTimezone
{
  -[GEOPDSpatialEventLookupResponse _readTimezone]((uint64_t)self);
  return self->_timezone != 0;
}

- (GEOTimezone)timezone
{
  -[GEOPDSpatialEventLookupResponse _readTimezone]((uint64_t)self);
  return self->_timezone;
}

- (void)setTimezone:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_timezone, a3);
}

- (void)_readPoiId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_BYTE *)(a1 + 100) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSpatialEventLookupResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPoiId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasPoiId
{
  -[GEOPDSpatialEventLookupResponse _readPoiId]((uint64_t)self);
  return self->_poiId != 0;
}

- (GEOPDMapsIdentifier)poiId
{
  -[GEOPDSpatialEventLookupResponse _readPoiId]((uint64_t)self);
  return self->_poiId;
}

- (void)setPoiId:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_poiId, a3);
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
  v8.super_class = (Class)GEOPDSpatialEventLookupResponse;
  -[GEOPDSpatialEventLookupResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSpatialEventLookupResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSpatialEventLookupResponse _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  unint64_t v14;
  uint64_t v15;
  __CFString *v16;
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
  void *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  _QWORD v40[4];
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "eventId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("eventId");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("event_id");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  objc_msgSend((id)a1, "center");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v9, "jsonRepresentation");
    else
      objc_msgSend(v9, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("center"));

  }
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (_QWORD *)(a1 + 24);
    if (*(_QWORD *)(a1 + 32))
    {
      v14 = 0;
      do
      {
        v15 = *(int *)(*v13 + 4 * v14);
        if (v15 >= 0xE)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v15);
          v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v16 = off_1E1C0C180[v15];
        }
        objc_msgSend(v12, "addObject:", v16);

        ++v14;
        v13 = (_QWORD *)(a1 + 24);
      }
      while (v14 < *(_QWORD *)(a1 + 32));
    }
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("category"));

  }
  if (objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v18 = *(id *)(a1 + 56);
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v43 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v23, "jsonRepresentation");
          else
            objc_msgSend(v23, "dictionaryRepresentation");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v24);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      }
      while (v20);
    }

    if (a2)
      v25 = CFSTR("eventDateTime");
    else
      v25 = CFSTR("event_date_time");
    objc_msgSend(v4, "setObject:forKey:", v17, v25);

  }
  objc_msgSend((id)a1, "timezone");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v26)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v26, "jsonRepresentation");
    else
      objc_msgSend(v26, "dictionaryRepresentation");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("timezone"));

  }
  objc_msgSend((id)a1, "poiId");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (v29)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v29, "jsonRepresentation");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = CFSTR("poiId");
    }
    else
    {
      objc_msgSend(v29, "dictionaryRepresentation");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = CFSTR("poi_id");
    }
    objc_msgSend(v4, "setObject:forKey:", v31, v32);

  }
  v33 = *(void **)(a1 + 16);
  if (v33)
  {
    objc_msgSend(v33, "dictionaryRepresentation");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v34;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v34, "count"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __61__GEOPDSpatialEventLookupResponse__dictionaryRepresentation___block_invoke;
      v40[3] = &unk_1E1C00600;
      v37 = v36;
      v41 = v37;
      objc_msgSend(v35, "enumerateKeysAndObjectsUsingBlock:", v40);
      v38 = v37;

      v35 = v38;
    }
    objc_msgSend(v4, "setObject:forKey:", v35, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSpatialEventLookupResponse _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __61__GEOPDSpatialEventLookupResponse__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDSpatialEventLookupResponse)initWithDictionary:(id)a3
{
  return (GEOPDSpatialEventLookupResponse *)-[GEOPDSpatialEventLookupResponse _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  GEOPDMapsIdentifier *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  GEOLatLng *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
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
  GEOPDDateTimeRange *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  GEOTimezone *v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  GEOPDMapsIdentifier *v41;
  uint64_t v42;
  void *v43;
  void *v45;
  int v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    v6 = (void *)objc_msgSend(a1, "init");
    if (v6)
    {
      if (a3)
        v7 = CFSTR("eventId");
      else
        v7 = CFSTR("event_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = [GEOPDMapsIdentifier alloc];
        if ((a3 & 1) != 0)
          v10 = -[GEOPDMapsIdentifier initWithJSON:](v9, "initWithJSON:", v8);
        else
          v10 = -[GEOPDMapsIdentifier initWithDictionary:](v9, "initWithDictionary:", v8);
        v11 = (void *)v10;
        objc_msgSend(v6, "setEventId:", v10);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("center"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = [GEOLatLng alloc];
        if ((a3 & 1) != 0)
          v14 = -[GEOLatLng initWithJSON:](v13, "initWithJSON:", v12);
        else
          v14 = -[GEOLatLng initWithDictionary:](v13, "initWithDictionary:", v12);
        v15 = (void *)v14;
        objc_msgSend(v6, "setCenter:", v14);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("category"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v46 = a3;
        v53 = 0u;
        v54 = 0u;
        v51 = 0u;
        v52 = 0u;
        v45 = v16;
        v17 = v16;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
        if (!v18)
          goto LABEL_58;
        v19 = v18;
        v20 = *(_QWORD *)v52;
        while (1)
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v52 != v20)
              objc_enumerationMutation(v17);
            v22 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v23 = v22;
              if ((objc_msgSend(v23, "isEqualToString:", CFSTR("SPATIAL_EVENT_LOOKUP_CATEGORY_UNKNOWN")) & 1) != 0)
              {
                v24 = 0;
              }
              else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("SPATIAL_EVENT_LOOKUP_CATEGORY_ARTSANDMUSEUMS")) & 1) != 0)
              {
                v24 = 1;
              }
              else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("SPATIAL_EVENT_LOOKUP_CATEGORY_BUSINESSANDTECHNOLOGY")) & 1) != 0)
              {
                v24 = 2;
              }
              else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("SPATIAL_EVENT_LOOKUP_CATEGORY_COMMUNITY")) & 1) != 0)
              {
                v24 = 3;
              }
              else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("SPATIAL_EVENT_LOOKUP_CATEGORY_DANCE")) & 1) != 0)
              {
                v24 = 4;
              }
              else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("SPATIAL_EVENT_LOOKUP_CATEGORY_EDUCATIONAL")) & 1) != 0)
              {
                v24 = 5;
              }
              else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("SPATIAL_EVENT_LOOKUP_CATEGORY_FAMILYEVENTS")) & 1) != 0)
              {
                v24 = 6;
              }
              else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("SPATIAL_EVENT_LOOKUP_CATEGORY_FESTIVALSANDFAIRS")) & 1) != 0)
              {
                v24 = 7;
              }
              else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("SPATIAL_EVENT_LOOKUP_CATEGORY_MUSICCONCERTS")) & 1) != 0)
              {
                v24 = 8;
              }
              else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("SPATIAL_EVENT_LOOKUP_CATEGORY_NIGHTLIFE")) & 1) != 0)
              {
                v24 = 9;
              }
              else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("SPATIAL_EVENT_LOOKUP_CATEGORY_SPORTS")) & 1) != 0)
              {
                v24 = 10;
              }
              else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("SPATIAL_EVENT_LOOKUP_CATEGORY_THEATER")) & 1) != 0)
              {
                v24 = 11;
              }
              else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("SPATIAL_EVENT_LOOKUP_CATEGORY_TOURS")) & 1) != 0)
              {
                v24 = 12;
              }
              else if (objc_msgSend(v23, "isEqualToString:", CFSTR("SPATIAL_EVENT_LOOKUP_CATEGORY_APPLEEVENT")))
              {
                v24 = 13;
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
                continue;
              v24 = objc_msgSend(v22, "intValue");
            }
            objc_msgSend(v6, "addCategory:", v24);
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
          if (!v19)
          {
LABEL_58:

            a3 = v46;
            v16 = v45;
            break;
          }
        }
      }

      if (a3)
        v25 = CFSTR("eventDateTime");
      else
        v25 = CFSTR("event_date_time");
      objc_msgSend(v5, "objectForKeyedSubscript:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v49 = 0u;
        v50 = 0u;
        v47 = 0u;
        v48 = 0u;
        v27 = v26;
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
        if (v28)
        {
          v29 = v28;
          v30 = *(_QWORD *)v48;
          do
          {
            v31 = 0;
            do
            {
              if (*(_QWORD *)v48 != v30)
                objc_enumerationMutation(v27);
              v32 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v31);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v33 = [GEOPDDateTimeRange alloc];
                if (v33)
                  v34 = (void *)-[GEOPDDateTimeRange _initWithDictionary:isJSON:](v33, v32, a3);
                else
                  v34 = 0;
                objc_msgSend(v6, "addEventDateTime:", v34);

              }
              ++v31;
            }
            while (v29 != v31);
            v35 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
            v29 = v35;
          }
          while (v35);
        }

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("timezone"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v37 = [GEOTimezone alloc];
        if (v37)
          v38 = -[GEOTimezone _initWithDictionary:isJSON:](v37, v36);
        else
          v38 = 0;
        objc_msgSend(v6, "setTimezone:", v38);

      }
      if (a3)
        v39 = CFSTR("poiId");
      else
        v39 = CFSTR("poi_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v41 = [GEOPDMapsIdentifier alloc];
        if ((a3 & 1) != 0)
          v42 = -[GEOPDMapsIdentifier initWithJSON:](v41, "initWithJSON:", v40);
        else
          v42 = -[GEOPDMapsIdentifier initWithDictionary:](v41, "initWithDictionary:", v40);
        v43 = (void *)v42;
        objc_msgSend(v6, "setPoiId:", v42);

      }
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (GEOPDSpatialEventLookupResponse)initWithJSON:(id)a3
{
  return (GEOPDSpatialEventLookupResponse *)-[GEOPDSpatialEventLookupResponse _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_6437;
    else
      v8 = (int *)&readAll__nonRecursiveTag_6438;
    GEOPDSpatialEventLookupResponseReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOPDSpatialEventLookupResponseCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDSpatialEventLookupResponseIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSpatialEventLookupResponseReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  unint64_t v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  PBDataReader *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), *(_BYTE *)&self->_flags <= 1u))
  {
    v11 = self->_reader;
    objc_sync_enter(v11);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v12);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v11);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSpatialEventLookupResponse readAll:](self, "readAll:", 0);
    if (self->_eventId)
      PBDataWriterWriteSubmessage();
    if (self->_center)
      PBDataWriterWriteSubmessage();
    if (self->_categorys.count)
    {
      v6 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v6;
      }
      while (v6 < self->_categorys.count);
    }
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = self->_eventDateTimes;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v7);
          PBDataWriterWriteSubmessage();
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

    if (self->_timezone)
      PBDataWriterWriteSubmessage();
    if (self->_poiId)
      PBDataWriterWriteSubmessage();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v13);
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEOPDSpatialEventLookupResponse _readCenter]((uint64_t)self);
  if (-[GEOLatLng hasGreenTeaWithValue:](self->_center, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOPDSpatialEventLookupResponse _readEventId]((uint64_t)self);
  if (-[GEOPDMapsIdentifier hasGreenTeaWithValue:](self->_eventId, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOPDSpatialEventLookupResponse _readPoiId]((uint64_t)self);
  return -[GEOPDMapsIdentifier hasGreenTeaWithValue:](self->_poiId, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  unint64_t v7;
  unint64_t v8;
  uint64_t j;
  void *v10;
  id *v11;
  id *v12;

  v12 = (id *)a3;
  -[GEOPDSpatialEventLookupResponse readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v12 + 1, self->_reader);
  *((_DWORD *)v12 + 22) = self->_readerMarkPos;
  *((_DWORD *)v12 + 23) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_eventId)
    objc_msgSend(v12, "setEventId:");
  if (self->_center)
    objc_msgSend(v12, "setCenter:");
  if (-[GEOPDSpatialEventLookupResponse categorysCount](self, "categorysCount"))
  {
    objc_msgSend(v12, "clearCategorys");
    v4 = -[GEOPDSpatialEventLookupResponse categorysCount](self, "categorysCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v12, "addCategory:", -[GEOPDSpatialEventLookupResponse categoryAtIndex:](self, "categoryAtIndex:", i));
    }
  }
  if (-[GEOPDSpatialEventLookupResponse eventDateTimesCount](self, "eventDateTimesCount"))
  {
    objc_msgSend(v12, "clearEventDateTimes");
    v7 = -[GEOPDSpatialEventLookupResponse eventDateTimesCount](self, "eventDateTimesCount");
    if (v7)
    {
      v8 = v7;
      for (j = 0; j != v8; ++j)
      {
        -[GEOPDSpatialEventLookupResponse eventDateTimeAtIndex:](self, "eventDateTimeAtIndex:", j);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addEventDateTime:", v10);

      }
    }
  }
  if (self->_timezone)
    objc_msgSend(v12, "setTimezone:");
  v11 = v12;
  if (self->_poiId)
  {
    objc_msgSend(v12, "setPoiId:");
    v11 = v12;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
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
      GEOPDSpatialEventLookupResponseReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSpatialEventLookupResponse readAll:](self, "readAll:", 0);
  v8 = -[GEOPDMapsIdentifier copyWithZone:](self->_eventId, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v8;

  v10 = -[GEOLatLng copyWithZone:](self->_center, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v10;

  PBRepeatedInt32Copy();
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = self->_eventDateTimes;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v12);
        v16 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v22);
        objc_msgSend((id)v5, "addEventDateTime:", v16);

      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v13);
  }

  v17 = -[GEOTimezone copyWithZone:](self->_timezone, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v17;

  v19 = -[GEOPDMapsIdentifier copyWithZone:](self->_poiId, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v19;

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEOPDMapsIdentifier *eventId;
  GEOLatLng *center;
  NSMutableArray *eventDateTimes;
  GEOTimezone *timezone;
  GEOPDMapsIdentifier *poiId;
  char v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOPDSpatialEventLookupResponse readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         eventId = self->_eventId,
         !((unint64_t)eventId | v4[8]))
     || -[GEOPDMapsIdentifier isEqual:](eventId, "isEqual:"))
    && ((center = self->_center, !((unint64_t)center | v4[6])) || -[GEOLatLng isEqual:](center, "isEqual:"))
    && PBRepeatedInt32IsEqual()
    && ((eventDateTimes = self->_eventDateTimes, !((unint64_t)eventDateTimes | v4[7]))
     || -[NSMutableArray isEqual:](eventDateTimes, "isEqual:"))
    && ((timezone = self->_timezone, !((unint64_t)timezone | v4[10]))
     || -[GEOTimezone isEqual:](timezone, "isEqual:")))
  {
    poiId = self->_poiId;
    if ((unint64_t)poiId | v4[9])
      v10 = -[GEOPDMapsIdentifier isEqual:](poiId, "isEqual:");
    else
      v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  -[GEOPDSpatialEventLookupResponse readAll:](self, "readAll:", 1);
  v3 = -[GEOPDMapsIdentifier hash](self->_eventId, "hash");
  v4 = -[GEOLatLng hash](self->_center, "hash") ^ v3;
  v5 = PBRepeatedInt32Hash();
  v6 = v4 ^ v5 ^ -[NSMutableArray hash](self->_eventDateTimes, "hash");
  v7 = -[GEOTimezone hash](self->_timezone, "hash");
  return v6 ^ v7 ^ -[GEOPDMapsIdentifier hash](self->_poiId, "hash");
}

- (void)mergeFrom:(id)a3
{
  id *v4;
  GEOPDMapsIdentifier *eventId;
  id v6;
  GEOLatLng *center;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  GEOTimezone *timezone;
  _QWORD *v18;
  void *v19;
  GEOPDMapsIdentifier *poiId;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  objc_msgSend(v4, "readAll:", 0);
  eventId = self->_eventId;
  v6 = v4[8];
  if (eventId)
  {
    if (v6)
      -[GEOPDMapsIdentifier mergeFrom:](eventId, "mergeFrom:");
  }
  else if (v6)
  {
    -[GEOPDSpatialEventLookupResponse setEventId:](self, "setEventId:");
  }
  center = self->_center;
  v8 = v4[6];
  if (center)
  {
    if (v8)
      -[GEOLatLng mergeFrom:](center, "mergeFrom:");
  }
  else if (v8)
  {
    -[GEOPDSpatialEventLookupResponse setCenter:](self, "setCenter:");
  }
  v9 = objc_msgSend(v4, "categorysCount");
  if (v9)
  {
    v10 = v9;
    for (i = 0; i != v10; ++i)
      -[GEOPDSpatialEventLookupResponse addCategory:](self, "addCategory:", objc_msgSend(v4, "categoryAtIndex:", i));
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = v4[7];
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v12);
        -[GEOPDSpatialEventLookupResponse addEventDateTime:](self, "addEventDateTime:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j), (_QWORD)v22);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v14);
  }

  timezone = self->_timezone;
  v18 = v4[10];
  if (timezone)
  {
    if (v18)
    {
      v19 = (void *)v18[2];
      if (v19)
        -[GEOTimezone setIdentifier:]((uint64_t)timezone, v19);
    }
  }
  else if (v18)
  {
    -[GEOPDSpatialEventLookupResponse setTimezone:](self, "setTimezone:");
  }
  poiId = self->_poiId;
  v21 = v4[9];
  if (poiId)
  {
    if (v21)
      -[GEOPDMapsIdentifier mergeFrom:](poiId, "mergeFrom:");
  }
  else if (v21)
  {
    -[GEOPDSpatialEventLookupResponse setPoiId:](self, "setPoiId:");
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
      GEOPDSpatialEventLookupResponseReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_6441);
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
  uint64_t v12;
  void *v13;
  GEOTimezone *timezone;
  PBUnknownFields *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v3 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x81u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOPDSpatialEventLookupResponse readAll:](self, "readAll:", 0);
    -[GEOPDMapsIdentifier clearUnknownFields:](self->_eventId, "clearUnknownFields:", 1);
    -[GEOLatLng clearUnknownFields:](self->_center, "clearUnknownFields:", 1);
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = self->_eventDateTimes;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v11);
          if (v12)
          {
            v13 = *(void **)(v12 + 8);
            *(_QWORD *)(v12 + 8) = 0;

          }
          ++v11;
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

    timezone = self->_timezone;
    if (timezone)
    {
      v15 = timezone->_unknownFields;
      timezone->_unknownFields = 0;

    }
    -[GEOPDMapsIdentifier clearUnknownFields:](self->_poiId, "clearUnknownFields:", 1, (_QWORD)v16);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timezone, 0);
  objc_storeStrong((id *)&self->_poiId, 0);
  objc_storeStrong((id *)&self->_eventId, 0);
  objc_storeStrong((id *)&self->_eventDateTimes, 0);
  objc_storeStrong((id *)&self->_center, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
