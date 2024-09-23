@implementation GEOSharedNavRouteInfo

- (GEOSharedNavRouteInfo)init
{
  GEOSharedNavRouteInfo *v2;
  GEOSharedNavRouteInfo *v3;
  GEOSharedNavRouteInfo *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOSharedNavRouteInfo;
  v2 = -[GEOSharedNavRouteInfo init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOSharedNavRouteInfo)initWithData:(id)a3
{
  GEOSharedNavRouteInfo *v3;
  GEOSharedNavRouteInfo *v4;
  GEOSharedNavRouteInfo *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOSharedNavRouteInfo;
  v3 = -[GEOSharedNavRouteInfo initWithData:](&v7, sel_initWithData_, a3);
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

  PBRepeatedDoubleClear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOSharedNavRouteInfo;
  -[GEOSharedNavRouteInfo dealloc](&v3, sel_dealloc);
}

- (void)_readCoordinates
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_BYTE *)(a1 + 124) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOSharedNavRouteInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCoordinates_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (unint64_t)coordinatesCount
{
  -[GEOSharedNavRouteInfo _readCoordinates]((uint64_t)self);
  return self->_coordinates.count;
}

- (double)coordinates
{
  -[GEOSharedNavRouteInfo _readCoordinates]((uint64_t)self);
  return self->_coordinates.list;
}

- (void)clearCoordinates
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  PBRepeatedDoubleClear();
}

- (void)addCoordinates:(double)a3
{
  -[GEOSharedNavRouteInfo _readCoordinates]((uint64_t)self);
  if (self)
    PBRepeatedDoubleAdd();
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
}

- (double)coordinatesAtIndex:(unint64_t)a3
{
  $A57E80F8F7F5C5FFA4899556F12E1D96 *p_coordinates;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOSharedNavRouteInfo _readCoordinates]((uint64_t)self);
  p_coordinates = &self->_coordinates;
  count = self->_coordinates.count;
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
  return p_coordinates->list[a3];
}

- (void)setCoordinates:(double *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  PBRepeatedDoubleSet();
}

- (void)_readTrafficColors
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_BYTE *)(a1 + 124) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOSharedNavRouteInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTrafficColors_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (unint64_t)trafficColorsCount
{
  -[GEOSharedNavRouteInfo _readTrafficColors]((uint64_t)self);
  return self->_trafficColors.count;
}

- (unsigned)trafficColors
{
  -[GEOSharedNavRouteInfo _readTrafficColors]((uint64_t)self);
  return self->_trafficColors.list;
}

- (void)clearTrafficColors
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  PBRepeatedUInt32Clear();
}

- (void)addTrafficColor:(unsigned int)a3
{
  -[GEOSharedNavRouteInfo _readTrafficColors]((uint64_t)self);
  if (self)
    PBRepeatedUInt32Add();
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
}

- (unsigned)trafficColorAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_trafficColors;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOSharedNavRouteInfo _readTrafficColors]((uint64_t)self);
  p_trafficColors = &self->_trafficColors;
  count = self->_trafficColors.count;
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
  return p_trafficColors->list[a3];
}

- (void)setTrafficColors:(unsigned int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  PBRepeatedUInt32Set();
}

- (void)_readTrafficColorOffsets
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_BYTE *)(a1 + 124) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOSharedNavRouteInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTrafficColorOffsets_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (unint64_t)trafficColorOffsetsCount
{
  -[GEOSharedNavRouteInfo _readTrafficColorOffsets]((uint64_t)self);
  return self->_trafficColorOffsets.count;
}

- (unsigned)trafficColorOffsets
{
  -[GEOSharedNavRouteInfo _readTrafficColorOffsets]((uint64_t)self);
  return self->_trafficColorOffsets.list;
}

- (void)clearTrafficColorOffsets
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  PBRepeatedUInt32Clear();
}

- (void)addTrafficColorOffset:(unsigned int)a3
{
  -[GEOSharedNavRouteInfo _readTrafficColorOffsets]((uint64_t)self);
  if (self)
    PBRepeatedUInt32Add();
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
}

- (unsigned)trafficColorOffsetAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_trafficColorOffsets;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOSharedNavRouteInfo _readTrafficColorOffsets]((uint64_t)self);
  p_trafficColorOffsets = &self->_trafficColorOffsets;
  count = self->_trafficColorOffsets.count;
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
  return p_trafficColorOffsets->list[a3];
}

- (void)setTrafficColorOffsets:(unsigned int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  PBRepeatedUInt32Set();
}

- (void)_readChargingStations
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_BYTE *)(a1 + 124) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOSharedNavRouteInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readChargingStations_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (NSMutableArray)chargingStations
{
  -[GEOSharedNavRouteInfo _readChargingStations]((uint64_t)self);
  return self->_chargingStations;
}

- (void)setChargingStations:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *chargingStations;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  chargingStations = self->_chargingStations;
  self->_chargingStations = v4;

}

- (void)clearChargingStations
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  -[NSMutableArray removeAllObjects](self->_chargingStations, "removeAllObjects");
}

- (void)addChargingStations:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOSharedNavRouteInfo _readChargingStations]((uint64_t)self);
  -[GEOSharedNavRouteInfo _addNoFlagsChargingStations:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
}

- (void)_addNoFlagsChargingStations:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 96);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 96);
      *(_QWORD *)(a1 + 96) = v5;

      v4 = *(void **)(a1 + 96);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)chargingStationsCount
{
  -[GEOSharedNavRouteInfo _readChargingStations]((uint64_t)self);
  return -[NSMutableArray count](self->_chargingStations, "count");
}

- (id)chargingStationsAtIndex:(unint64_t)a3
{
  -[GEOSharedNavRouteInfo _readChargingStations]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_chargingStations, "objectAtIndex:", a3);
}

+ (Class)chargingStationsType
{
  return (Class)objc_opt_class();
}

- (void)_readRoutingPathLegs
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_BYTE *)(a1 + 124) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOSharedNavRouteInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRoutingPathLegs_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (NSMutableArray)routingPathLegs
{
  -[GEOSharedNavRouteInfo _readRoutingPathLegs]((uint64_t)self);
  return self->_routingPathLegs;
}

- (void)setRoutingPathLegs:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *routingPathLegs;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  routingPathLegs = self->_routingPathLegs;
  self->_routingPathLegs = v4;

}

- (void)clearRoutingPathLegs
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  -[NSMutableArray removeAllObjects](self->_routingPathLegs, "removeAllObjects");
}

- (void)addRoutingPathLeg:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOSharedNavRouteInfo _readRoutingPathLegs]((uint64_t)self);
  -[GEOSharedNavRouteInfo _addNoFlagsRoutingPathLeg:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
}

- (void)_addNoFlagsRoutingPathLeg:(uint64_t)a1
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

- (unint64_t)routingPathLegsCount
{
  -[GEOSharedNavRouteInfo _readRoutingPathLegs]((uint64_t)self);
  return -[NSMutableArray count](self->_routingPathLegs, "count");
}

- (id)routingPathLegAtIndex:(unint64_t)a3
{
  -[GEOSharedNavRouteInfo _readRoutingPathLegs]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_routingPathLegs, "objectAtIndex:", a3);
}

+ (Class)routingPathLegType
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
  v8.super_class = (Class)GEOSharedNavRouteInfo;
  -[GEOSharedNavRouteInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOSharedNavRouteInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOSharedNavRouteInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  _QWORD v35[4];
  id v36;
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
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 32))
  {
    PBRepeatedDoubleNSArray();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("coordinates"));

  }
  if (*(_QWORD *)(a1 + 80))
  {
    PBRepeatedUInt32NSArray();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("trafficColor");
    else
      v7 = CFSTR("traffic_color");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
  if (*(_QWORD *)(a1 + 56))
  {
    PBRepeatedUInt32NSArray();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v9 = CFSTR("trafficColorOffset");
    else
      v9 = CFSTR("traffic_color_offset");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);

  }
  if (objc_msgSend(*(id *)(a1 + 96), "count"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 96), "count"));
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v11 = *(id *)(a1 + 96);
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v42 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v16, "jsonRepresentation");
          else
            objc_msgSend(v16, "dictionaryRepresentation");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v17);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      }
      while (v13);
    }

    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("chargingStations"));
  }
  if (*(_QWORD *)(a1 + 104))
  {
    if (a2)
    {
      v18 = (void *)MEMORY[0x1E0C99DE8];
      objc_msgSend((id)a1, "routingPathLegs");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "arrayWithCapacity:", objc_msgSend(v19, "count"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      objc_msgSend((id)a1, "routingPathLegs");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v38;
        do
        {
          for (j = 0; j != v23; ++j)
          {
            if (*(_QWORD *)v38 != v24)
              objc_enumerationMutation(v21);
            objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * j), "base64EncodedStringWithOptions:", 0);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "addObject:", v26);

          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
        }
        while (v23);
      }

      v27 = CFSTR("routingPathLeg");
    }
    else
    {
      objc_msgSend((id)a1, "routingPathLegs");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = CFSTR("routing_path_leg");
    }
    objc_msgSend(v4, "setObject:forKey:", v20, v27);

  }
  v28 = *(void **)(a1 + 16);
  if (v28)
  {
    objc_msgSend(v28, "dictionaryRepresentation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v29, "count"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __51__GEOSharedNavRouteInfo__dictionaryRepresentation___block_invoke;
      v35[3] = &unk_1E1C00600;
      v32 = v31;
      v36 = v32;
      objc_msgSend(v30, "enumerateKeysAndObjectsUsingBlock:", v35);
      v33 = v32;

      v30 = v33;
    }
    objc_msgSend(v4, "setObject:forKey:", v30, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOSharedNavRouteInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __51__GEOSharedNavRouteInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOSharedNavRouteInfo)initWithDictionary:(id)a3
{
  return (GEOSharedNavRouteInfo *)-[GEOSharedNavRouteInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  const __CFString *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  const __CFString *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t m;
  uint64_t v35;
  GEOSharedNavChargingStationInfo *v36;
  uint64_t v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t n;
  uint64_t v46;
  void *v47;
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
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("coordinates"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v67 = 0u;
        v68 = 0u;
        v65 = 0u;
        v66 = 0u;
        v7 = v6;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v66;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v66 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v12, "doubleValue");
                objc_msgSend(a1, "addCoordinates:");
              }
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
          }
          while (v9);
        }

      }
      if (a3)
        v13 = CFSTR("trafficColor");
      else
        v13 = CFSTR("traffic_color");
      objc_msgSend(v5, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v63 = 0u;
        v64 = 0u;
        v61 = 0u;
        v62 = 0u;
        v15 = v14;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v61, v72, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v62;
          do
          {
            for (j = 0; j != v17; ++j)
            {
              if (*(_QWORD *)v62 != v18)
                objc_enumerationMutation(v15);
              v20 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(a1, "addTrafficColor:", objc_msgSend(v20, "unsignedIntValue"));
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v61, v72, 16);
          }
          while (v17);
        }

      }
      if (a3)
        v21 = CFSTR("trafficColorOffset");
      else
        v21 = CFSTR("traffic_color_offset");
      objc_msgSend(v5, "objectForKeyedSubscript:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v59 = 0u;
        v60 = 0u;
        v57 = 0u;
        v58 = 0u;
        v23 = v22;
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v57, v71, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v58;
          do
          {
            for (k = 0; k != v25; ++k)
            {
              if (*(_QWORD *)v58 != v26)
                objc_enumerationMutation(v23);
              v28 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * k);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(a1, "addTrafficColorOffset:", objc_msgSend(v28, "unsignedIntValue"));
            }
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v57, v71, 16);
          }
          while (v25);
        }

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("chargingStations"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v55 = 0u;
        v56 = 0u;
        v53 = 0u;
        v54 = 0u;
        v30 = v29;
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v53, v70, 16);
        if (v31)
        {
          v32 = v31;
          v33 = *(_QWORD *)v54;
          do
          {
            for (m = 0; m != v32; ++m)
            {
              if (*(_QWORD *)v54 != v33)
                objc_enumerationMutation(v30);
              v35 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * m);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v36 = [GEOSharedNavChargingStationInfo alloc];
                if ((a3 & 1) != 0)
                  v37 = -[GEOSharedNavChargingStationInfo initWithJSON:](v36, "initWithJSON:", v35);
                else
                  v37 = -[GEOSharedNavChargingStationInfo initWithDictionary:](v36, "initWithDictionary:", v35);
                v38 = (void *)v37;
                objc_msgSend(a1, "addChargingStations:", v37);

              }
            }
            v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v53, v70, 16);
          }
          while (v32);
        }

      }
      if (a3)
        v39 = CFSTR("routingPathLeg");
      else
        v39 = CFSTR("routing_path_leg");
      objc_msgSend(v5, "objectForKeyedSubscript:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v51 = 0u;
        v52 = 0u;
        v49 = 0u;
        v50 = 0u;
        v41 = v40;
        v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v49, v69, 16);
        if (v42)
        {
          v43 = v42;
          v44 = *(_QWORD *)v50;
          do
          {
            for (n = 0; n != v43; ++n)
            {
              if (*(_QWORD *)v50 != v44)
                objc_enumerationMutation(v41);
              v46 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * n);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v46, 0);
                objc_msgSend(a1, "addRoutingPathLeg:", v47);

              }
            }
            v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v49, v69, 16);
          }
          while (v43);
        }

      }
    }
  }

  return a1;
}

- (GEOSharedNavRouteInfo)initWithJSON:(id)a3
{
  return (GEOSharedNavRouteInfo *)-[GEOSharedNavRouteInfo _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_2847;
    else
      v8 = (int *)&readAll__nonRecursiveTag_2848;
    GEOSharedNavRouteInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOSharedNavRouteInfoCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOSharedNavRouteInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOSharedNavRouteInfoReadAllFrom((uint64_t)self, a3, 0);
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
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  PBDataReader *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x7E) == 0))
  {
    v17 = self->_reader;
    objc_sync_enter(v17);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v18);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v17);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOSharedNavRouteInfo readAll:](self, "readAll:", 0);
    if (self->_coordinates.count)
    {
      v27 = 0;
      PBDataWriterPlaceMark();
      if (self->_coordinates.count)
      {
        v6 = 0;
        do
        {
          PBDataWriterWriteDoubleField();
          ++v6;
        }
        while (v6 < self->_coordinates.count);
      }
      PBDataWriterRecallMark();
    }
    if (self->_trafficColors.count)
    {
      v7 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v7;
      }
      while (v7 < self->_trafficColors.count);
    }
    if (self->_trafficColorOffsets.count)
    {
      v8 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v8;
      }
      while (v8 < self->_trafficColorOffsets.count);
    }
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v9 = self->_chargingStations;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v24 != v11)
            objc_enumerationMutation(v9);
          PBDataWriterWriteSubmessage();
        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
      }
      while (v10);
    }

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v13 = self->_routingPathLegs;
    v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v20;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v20 != v15)
            objc_enumerationMutation(v13);
          PBDataWriterWriteDataField();
        }
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
      }
      while (v14);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v19);
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
  unint64_t v17;
  unint64_t v18;
  uint64_t n;
  void *v20;
  id *v21;

  v21 = (id *)a3;
  -[GEOSharedNavRouteInfo readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v21 + 1, self->_reader);
  *((_DWORD *)v21 + 28) = self->_readerMarkPos;
  *((_DWORD *)v21 + 29) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEOSharedNavRouteInfo coordinatesCount](self, "coordinatesCount"))
  {
    objc_msgSend(v21, "clearCoordinates");
    v4 = -[GEOSharedNavRouteInfo coordinatesCount](self, "coordinatesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOSharedNavRouteInfo coordinatesAtIndex:](self, "coordinatesAtIndex:", i);
        objc_msgSend(v21, "addCoordinates:");
      }
    }
  }
  if (-[GEOSharedNavRouteInfo trafficColorsCount](self, "trafficColorsCount"))
  {
    objc_msgSend(v21, "clearTrafficColors");
    v7 = -[GEOSharedNavRouteInfo trafficColorsCount](self, "trafficColorsCount");
    if (v7)
    {
      v8 = v7;
      for (j = 0; j != v8; ++j)
        objc_msgSend(v21, "addTrafficColor:", -[GEOSharedNavRouteInfo trafficColorAtIndex:](self, "trafficColorAtIndex:", j));
    }
  }
  if (-[GEOSharedNavRouteInfo trafficColorOffsetsCount](self, "trafficColorOffsetsCount"))
  {
    objc_msgSend(v21, "clearTrafficColorOffsets");
    v10 = -[GEOSharedNavRouteInfo trafficColorOffsetsCount](self, "trafficColorOffsetsCount");
    if (v10)
    {
      v11 = v10;
      for (k = 0; k != v11; ++k)
        objc_msgSend(v21, "addTrafficColorOffset:", -[GEOSharedNavRouteInfo trafficColorOffsetAtIndex:](self, "trafficColorOffsetAtIndex:", k));
    }
  }
  if (-[GEOSharedNavRouteInfo chargingStationsCount](self, "chargingStationsCount"))
  {
    objc_msgSend(v21, "clearChargingStations");
    v13 = -[GEOSharedNavRouteInfo chargingStationsCount](self, "chargingStationsCount");
    if (v13)
    {
      v14 = v13;
      for (m = 0; m != v14; ++m)
      {
        -[GEOSharedNavRouteInfo chargingStationsAtIndex:](self, "chargingStationsAtIndex:", m);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addChargingStations:", v16);

      }
    }
  }
  if (-[GEOSharedNavRouteInfo routingPathLegsCount](self, "routingPathLegsCount"))
  {
    objc_msgSend(v21, "clearRoutingPathLegs");
    v17 = -[GEOSharedNavRouteInfo routingPathLegsCount](self, "routingPathLegsCount");
    if (v17)
    {
      v18 = v17;
      for (n = 0; n != v18; ++n)
      {
        -[GEOSharedNavRouteInfo routingPathLegAtIndex:](self, "routingPathLegAtIndex:", n);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addRoutingPathLeg:", v20);

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
  v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
      GEOSharedNavRouteInfoReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOSharedNavRouteInfo readAll:](self, "readAll:", 0);
  PBRepeatedDoubleCopy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = self->_chargingStations;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v8);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend(v5, "addChargingStations:", v12);

      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v9);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v13 = self->_routingPathLegs;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v13);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v19);
        objc_msgSend(v5, "addRoutingPathLeg:", v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v14);
  }

  objc_storeStrong(v5 + 2, self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *chargingStations;
  NSMutableArray *routingPathLegs;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (-[GEOSharedNavRouteInfo readAll:](self, "readAll:", 1),
        objc_msgSend(v4, "readAll:", 1),
        PBRepeatedDoubleIsEqual())
    && PBRepeatedUInt32IsEqual()
    && PBRepeatedUInt32IsEqual()
    && ((chargingStations = self->_chargingStations, !((unint64_t)chargingStations | v4[12]))
     || -[NSMutableArray isEqual:](chargingStations, "isEqual:")))
  {
    routingPathLegs = self->_routingPathLegs;
    if ((unint64_t)routingPathLegs | v4[13])
      v7 = -[NSMutableArray isEqual:](routingPathLegs, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  -[GEOSharedNavRouteInfo readAll:](self, "readAll:", 1);
  v3 = PBRepeatedDoubleHash();
  v4 = PBRepeatedUInt32Hash() ^ v3;
  v5 = v4 ^ PBRepeatedUInt32Hash();
  v6 = v5 ^ -[NSMutableArray hash](self->_chargingStations, "hash");
  return v6 ^ -[NSMutableArray hash](self->_routingPathLegs, "hash");
}

- (void)mergeFrom:(id)a3
{
  id *v4;
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
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
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
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  objc_msgSend(v4, "readAll:", 0);
  v5 = objc_msgSend(v4, "coordinatesCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
    {
      objc_msgSend(v4, "coordinatesAtIndex:", i);
      -[GEOSharedNavRouteInfo addCoordinates:](self, "addCoordinates:");
    }
  }
  v8 = objc_msgSend(v4, "trafficColorsCount");
  if (v8)
  {
    v9 = v8;
    for (j = 0; j != v9; ++j)
      -[GEOSharedNavRouteInfo addTrafficColor:](self, "addTrafficColor:", objc_msgSend(v4, "trafficColorAtIndex:", j));
  }
  v11 = objc_msgSend(v4, "trafficColorOffsetsCount");
  if (v11)
  {
    v12 = v11;
    for (k = 0; k != v12; ++k)
      -[GEOSharedNavRouteInfo addTrafficColorOffset:](self, "addTrafficColorOffset:", objc_msgSend(v4, "trafficColorOffsetAtIndex:", k));
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v14 = v4[12];
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v29;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v29 != v17)
          objc_enumerationMutation(v14);
        -[GEOSharedNavRouteInfo addChargingStations:](self, "addChargingStations:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v18++));
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v16);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v19 = v4[13];
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v25;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v25 != v22)
          objc_enumerationMutation(v19);
        -[GEOSharedNavRouteInfo addRoutingPathLeg:](self, "addRoutingPathLeg:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v23++), (_QWORD)v24);
      }
      while (v21 != v23);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v21);
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
      GEOSharedNavRouteInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_2851);
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
  *(_BYTE *)&self->_flags |= 0x41u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOSharedNavRouteInfo readAll:](self, "readAll:", 0);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = self->_chargingStations;
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
  objc_storeStrong((id *)&self->_routingPathLegs, 0);
  objc_storeStrong((id *)&self->_chargingStations, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
