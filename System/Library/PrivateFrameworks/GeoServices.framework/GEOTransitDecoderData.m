@implementation GEOTransitDecoderData

- (GEOTransitDecoderData)init
{
  GEOTransitDecoderData *v2;
  GEOTransitDecoderData *v3;
  GEOTransitDecoderData *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOTransitDecoderData;
  v2 = -[GEOTransitDecoderData init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTransitDecoderData)initWithData:(id)a3
{
  GEOTransitDecoderData *v3;
  GEOTransitDecoderData *v4;
  GEOTransitDecoderData *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOTransitDecoderData;
  v3 = -[GEOTransitDecoderData initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readStations
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 140) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitDecoderDataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readStations_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (NSMutableArray)stations
{
  -[GEOTransitDecoderData _readStations]((uint64_t)self);
  return self->_stations;
}

- (void)setStations:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *stations;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
  stations = self->_stations;
  self->_stations = v4;

}

- (void)clearStations
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
  -[NSMutableArray removeAllObjects](self->_stations, "removeAllObjects");
}

- (void)addStation:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOTransitDecoderData _readStations]((uint64_t)self);
  -[GEOTransitDecoderData _addNoFlagsStation:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
}

- (void)_addNoFlagsStation:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 64);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 64);
      *(_QWORD *)(a1 + 64) = v5;

      v4 = *(void **)(a1 + 64);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)stationsCount
{
  -[GEOTransitDecoderData _readStations]((uint64_t)self);
  return -[NSMutableArray count](self->_stations, "count");
}

- (id)stationAtIndex:(unint64_t)a3
{
  -[GEOTransitDecoderData _readStations]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_stations, "objectAtIndex:", a3);
}

+ (Class)stationType
{
  return (Class)objc_opt_class();
}

- (void)_readLines
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 140) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitDecoderDataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLines_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (NSMutableArray)lines
{
  -[GEOTransitDecoderData _readLines]((uint64_t)self);
  return self->_lines;
}

- (void)setLines:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *lines;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
  lines = self->_lines;
  self->_lines = v4;

}

- (void)clearLines
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
  -[NSMutableArray removeAllObjects](self->_lines, "removeAllObjects");
}

- (void)addLine:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOTransitDecoderData _readLines]((uint64_t)self);
  -[GEOTransitDecoderData _addNoFlagsLine:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
}

- (void)_addNoFlagsLine:(uint64_t)a1
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

- (unint64_t)linesCount
{
  -[GEOTransitDecoderData _readLines]((uint64_t)self);
  return -[NSMutableArray count](self->_lines, "count");
}

- (id)lineAtIndex:(unint64_t)a3
{
  -[GEOTransitDecoderData _readLines]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_lines, "objectAtIndex:", a3);
}

+ (Class)lineType
{
  return (Class)objc_opt_class();
}

- (void)_readAccessPoints
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 140) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitDecoderDataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAccessPoints_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (NSMutableArray)accessPoints
{
  -[GEOTransitDecoderData _readAccessPoints]((uint64_t)self);
  return self->_accessPoints;
}

- (void)setAccessPoints:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *accessPoints;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
  accessPoints = self->_accessPoints;
  self->_accessPoints = v4;

}

- (void)clearAccessPoints
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
  -[NSMutableArray removeAllObjects](self->_accessPoints, "removeAllObjects");
}

- (void)addAccessPoint:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOTransitDecoderData _readAccessPoints]((uint64_t)self);
  -[GEOTransitDecoderData _addNoFlagsAccessPoint:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
}

- (void)_addNoFlagsAccessPoint:(uint64_t)a1
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

- (unint64_t)accessPointsCount
{
  -[GEOTransitDecoderData _readAccessPoints]((uint64_t)self);
  return -[NSMutableArray count](self->_accessPoints, "count");
}

- (id)accessPointAtIndex:(unint64_t)a3
{
  -[GEOTransitDecoderData _readAccessPoints]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_accessPoints, "objectAtIndex:", a3);
}

+ (Class)accessPointType
{
  return (Class)objc_opt_class();
}

- (void)_readWalkings
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 140) & 0x1000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitDecoderDataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readWalkings_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (NSMutableArray)walkings
{
  -[GEOTransitDecoderData _readWalkings]((uint64_t)self);
  return self->_walkings;
}

- (void)setWalkings:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *walkings;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
  walkings = self->_walkings;
  self->_walkings = v4;

}

- (void)clearWalkings
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
  -[NSMutableArray removeAllObjects](self->_walkings, "removeAllObjects");
}

- (void)addWalking:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOTransitDecoderData _readWalkings]((uint64_t)self);
  -[GEOTransitDecoderData _addNoFlagsWalking:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
}

- (void)_addNoFlagsWalking:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 112);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 112);
      *(_QWORD *)(a1 + 112) = v5;

      v4 = *(void **)(a1 + 112);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)walkingsCount
{
  -[GEOTransitDecoderData _readWalkings]((uint64_t)self);
  return -[NSMutableArray count](self->_walkings, "count");
}

- (id)walkingAtIndex:(unint64_t)a3
{
  -[GEOTransitDecoderData _readWalkings]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_walkings, "objectAtIndex:", a3);
}

+ (Class)walkingType
{
  return (Class)objc_opt_class();
}

- (void)_readStops
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 140) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitDecoderDataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readStops_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (NSMutableArray)stops
{
  -[GEOTransitDecoderData _readStops]((uint64_t)self);
  return self->_stops;
}

- (void)setStops:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *stops;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
  stops = self->_stops;
  self->_stops = v4;

}

- (void)clearStops
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
  -[NSMutableArray removeAllObjects](self->_stops, "removeAllObjects");
}

- (void)addStop:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOTransitDecoderData _readStops]((uint64_t)self);
  -[GEOTransitDecoderData _addNoFlagsStop:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
}

- (void)_addNoFlagsStop:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 80);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 80);
      *(_QWORD *)(a1 + 80) = v5;

      v4 = *(void **)(a1 + 80);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)stopsCount
{
  -[GEOTransitDecoderData _readStops]((uint64_t)self);
  return -[NSMutableArray count](self->_stops, "count");
}

- (id)stopAtIndex:(unint64_t)a3
{
  -[GEOTransitDecoderData _readStops]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_stops, "objectAtIndex:", a3);
}

+ (Class)stopType
{
  return (Class)objc_opt_class();
}

- (void)_readZilchPoints
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 140) & 0x2000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitDecoderDataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readZilchPoints_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (NSMutableArray)zilchPoints
{
  -[GEOTransitDecoderData _readZilchPoints]((uint64_t)self);
  return self->_zilchPoints;
}

- (void)setZilchPoints:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *zilchPoints;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
  zilchPoints = self->_zilchPoints;
  self->_zilchPoints = v4;

}

- (void)clearZilchPoints
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
  -[NSMutableArray removeAllObjects](self->_zilchPoints, "removeAllObjects");
}

- (void)addZilchPoints:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOTransitDecoderData _readZilchPoints]((uint64_t)self);
  -[GEOTransitDecoderData _addNoFlagsZilchPoints:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
}

- (void)_addNoFlagsZilchPoints:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 120);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 120);
      *(_QWORD *)(a1 + 120) = v5;

      v4 = *(void **)(a1 + 120);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)zilchPointsCount
{
  -[GEOTransitDecoderData _readZilchPoints]((uint64_t)self);
  return -[NSMutableArray count](self->_zilchPoints, "count");
}

- (id)zilchPointsAtIndex:(unint64_t)a3
{
  -[GEOTransitDecoderData _readZilchPoints]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_zilchPoints, "objectAtIndex:", a3);
}

+ (Class)zilchPointsType
{
  return (Class)objc_opt_class();
}

- (void)_readSystems
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 140) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitDecoderDataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSystems_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (NSMutableArray)systems
{
  -[GEOTransitDecoderData _readSystems]((uint64_t)self);
  return self->_systems;
}

- (void)setSystems:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *systems;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
  systems = self->_systems;
  self->_systems = v4;

}

- (void)clearSystems
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
  -[NSMutableArray removeAllObjects](self->_systems, "removeAllObjects");
}

- (void)addSystem:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOTransitDecoderData _readSystems]((uint64_t)self);
  -[GEOTransitDecoderData _addNoFlagsSystem:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
}

- (void)_addNoFlagsSystem:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 88);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 88);
      *(_QWORD *)(a1 + 88) = v5;

      v4 = *(void **)(a1 + 88);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)systemsCount
{
  -[GEOTransitDecoderData _readSystems]((uint64_t)self);
  return -[NSMutableArray count](self->_systems, "count");
}

- (id)systemAtIndex:(unint64_t)a3
{
  -[GEOTransitDecoderData _readSystems]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_systems, "objectAtIndex:", a3);
}

+ (Class)systemType
{
  return (Class)objc_opt_class();
}

- (void)_readTransitIncidents
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 140) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitDecoderDataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTransitIncidents_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (NSMutableArray)transitIncidents
{
  -[GEOTransitDecoderData _readTransitIncidents]((uint64_t)self);
  return self->_transitIncidents;
}

- (void)setTransitIncidents:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *transitIncidents;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
  transitIncidents = self->_transitIncidents;
  self->_transitIncidents = v4;

}

- (void)clearTransitIncidents
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
  -[NSMutableArray removeAllObjects](self->_transitIncidents, "removeAllObjects");
}

- (void)addTransitIncident:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOTransitDecoderData _readTransitIncidents]((uint64_t)self);
  -[GEOTransitDecoderData _addNoFlagsTransitIncident:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
}

- (void)_addNoFlagsTransitIncident:(uint64_t)a1
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

- (unint64_t)transitIncidentsCount
{
  -[GEOTransitDecoderData _readTransitIncidents]((uint64_t)self);
  return -[NSMutableArray count](self->_transitIncidents, "count");
}

- (id)transitIncidentAtIndex:(unint64_t)a3
{
  -[GEOTransitDecoderData _readTransitIncidents]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_transitIncidents, "objectAtIndex:", a3);
}

+ (Class)transitIncidentType
{
  return (Class)objc_opt_class();
}

- (void)_readHalls
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 140) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitDecoderDataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readHalls_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (NSMutableArray)halls
{
  -[GEOTransitDecoderData _readHalls]((uint64_t)self);
  return self->_halls;
}

- (void)setHalls:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *halls;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
  halls = self->_halls;
  self->_halls = v4;

}

- (void)clearHalls
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
  -[NSMutableArray removeAllObjects](self->_halls, "removeAllObjects");
}

- (void)addHall:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOTransitDecoderData _readHalls]((uint64_t)self);
  -[GEOTransitDecoderData _addNoFlagsHall:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
}

- (void)_addNoFlagsHall:(uint64_t)a1
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

- (unint64_t)hallsCount
{
  -[GEOTransitDecoderData _readHalls]((uint64_t)self);
  return -[NSMutableArray count](self->_halls, "count");
}

- (id)hallAtIndex:(unint64_t)a3
{
  -[GEOTransitDecoderData _readHalls]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_halls, "objectAtIndex:", a3);
}

+ (Class)hallType
{
  return (Class)objc_opt_class();
}

- (void)_readArtworks
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 140) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitDecoderDataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readArtworks_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (NSMutableArray)artworks
{
  -[GEOTransitDecoderData _readArtworks]((uint64_t)self);
  return self->_artworks;
}

- (void)setArtworks:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *artworks;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
  artworks = self->_artworks;
  self->_artworks = v4;

}

- (void)clearArtworks
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
  -[NSMutableArray removeAllObjects](self->_artworks, "removeAllObjects");
}

- (void)addArtwork:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOTransitDecoderData _readArtworks]((uint64_t)self);
  -[GEOTransitDecoderData _addNoFlagsArtwork:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
}

- (void)_addNoFlagsArtwork:(uint64_t)a1
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

- (unint64_t)artworksCount
{
  -[GEOTransitDecoderData _readArtworks]((uint64_t)self);
  return -[NSMutableArray count](self->_artworks, "count");
}

- (id)artworkAtIndex:(unint64_t)a3
{
  -[GEOTransitDecoderData _readArtworks]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_artworks, "objectAtIndex:", a3);
}

+ (Class)artworkType
{
  return (Class)objc_opt_class();
}

- (void)_readTransitIncidentMessages
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 140) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitDecoderDataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTransitIncidentMessages_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (NSMutableArray)transitIncidentMessages
{
  -[GEOTransitDecoderData _readTransitIncidentMessages]((uint64_t)self);
  return self->_transitIncidentMessages;
}

- (void)setTransitIncidentMessages:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *transitIncidentMessages;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
  transitIncidentMessages = self->_transitIncidentMessages;
  self->_transitIncidentMessages = v4;

}

- (void)clearTransitIncidentMessages
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
  -[NSMutableArray removeAllObjects](self->_transitIncidentMessages, "removeAllObjects");
}

- (void)addTransitIncidentMessage:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOTransitDecoderData _readTransitIncidentMessages]((uint64_t)self);
  -[GEOTransitDecoderData _addNoFlagsTransitIncidentMessage:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
}

- (void)_addNoFlagsTransitIncidentMessage:(uint64_t)a1
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

- (unint64_t)transitIncidentMessagesCount
{
  -[GEOTransitDecoderData _readTransitIncidentMessages]((uint64_t)self);
  return -[NSMutableArray count](self->_transitIncidentMessages, "count");
}

- (id)transitIncidentMessageAtIndex:(unint64_t)a3
{
  -[GEOTransitDecoderData _readTransitIncidentMessages]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_transitIncidentMessages, "objectAtIndex:", a3);
}

+ (Class)transitIncidentMessageType
{
  return (Class)objc_opt_class();
}

- (void)_readSteps
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 140) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitDecoderDataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSteps_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (NSMutableArray)steps
{
  -[GEOTransitDecoderData _readSteps]((uint64_t)self);
  return self->_steps;
}

- (void)setSteps:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *steps;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
  steps = self->_steps;
  self->_steps = v4;

}

- (void)clearSteps
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
  -[NSMutableArray removeAllObjects](self->_steps, "removeAllObjects");
}

- (void)addStep:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOTransitDecoderData _readSteps]((uint64_t)self);
  -[GEOTransitDecoderData _addNoFlagsStep:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
}

- (void)_addNoFlagsStep:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 72);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 72);
      *(_QWORD *)(a1 + 72) = v5;

      v4 = *(void **)(a1 + 72);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)stepsCount
{
  -[GEOTransitDecoderData _readSteps]((uint64_t)self);
  return -[NSMutableArray count](self->_steps, "count");
}

- (id)stepAtIndex:(unint64_t)a3
{
  -[GEOTransitDecoderData _readSteps]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_steps, "objectAtIndex:", a3);
}

+ (Class)stepType
{
  return (Class)objc_opt_class();
}

- (void)_readPaymentMethods
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 140) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitDecoderDataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPaymentMethods_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (NSMutableArray)paymentMethods
{
  -[GEOTransitDecoderData _readPaymentMethods]((uint64_t)self);
  return self->_paymentMethods;
}

- (void)setPaymentMethods:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *paymentMethods;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
  paymentMethods = self->_paymentMethods;
  self->_paymentMethods = v4;

}

- (void)clearPaymentMethods
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
  -[NSMutableArray removeAllObjects](self->_paymentMethods, "removeAllObjects");
}

- (void)addPaymentMethod:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOTransitDecoderData _readPaymentMethods]((uint64_t)self);
  -[GEOTransitDecoderData _addNoFlagsPaymentMethod:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
}

- (void)_addNoFlagsPaymentMethod:(uint64_t)a1
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

- (unint64_t)paymentMethodsCount
{
  -[GEOTransitDecoderData _readPaymentMethods]((uint64_t)self);
  return -[NSMutableArray count](self->_paymentMethods, "count");
}

- (id)paymentMethodAtIndex:(unint64_t)a3
{
  -[GEOTransitDecoderData _readPaymentMethods]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_paymentMethods, "objectAtIndex:", a3);
}

+ (Class)paymentMethodType
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
  v8.super_class = (Class)GEOTransitDecoderData;
  -[GEOTransitDecoderData description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOTransitDecoderData dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTransitDecoderData _dictionaryRepresentation:]((uint64_t)self, 0);
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
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  void *v27;
  id v28;
  const __CFString *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t m;
  void *v36;
  id v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t n;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t ii;
  void *v54;
  const __CFString *v55;
  void *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t jj;
  void *v62;
  id v63;
  void *v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t kk;
  void *v70;
  id v71;
  const __CFString *v72;
  void *v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t mm;
  void *v79;
  id v80;
  void *v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t nn;
  void *v87;
  id v88;
  void *v89;
  id v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t i1;
  void *v95;
  id v96;
  const __CFString *v97;
  void *v98;
  id v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t i2;
  void *v104;
  id v105;
  void *v106;
  id v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t i3;
  void *v112;
  id v113;
  const __CFString *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  id v119;
  id v120;
  id v121;
  _QWORD v123[4];
  id v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  _BYTE v177[128];
  _BYTE v178[128];
  _BYTE v179[128];
  _BYTE v180[128];
  _BYTE v181[128];
  _BYTE v182[128];
  _BYTE v183[128];
  _BYTE v184[128];
  _BYTE v185[128];
  _BYTE v186[128];
  _BYTE v187[128];
  _BYTE v188[128];
  _BYTE v189[128];
  uint64_t v190;

  v190 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 64), "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 64), "count"));
    v173 = 0u;
    v174 = 0u;
    v175 = 0u;
    v176 = 0u;
    v6 = *(id *)(a1 + 64);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v173, v189, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v174;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v174 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v173 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v11, "jsonRepresentation");
          else
            objc_msgSend(v11, "dictionaryRepresentation");
          v12 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "addObject:", v12);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v173, v189, 16);
      }
      while (v8);
    }

    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("station"));
  }
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v169 = 0u;
    v170 = 0u;
    v171 = 0u;
    v172 = 0u;
    v14 = *(id *)(a1 + 48);
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v169, v188, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v170;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v170 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v169 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v19, "jsonRepresentation");
          else
            objc_msgSend(v19, "dictionaryRepresentation");
          v20 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "addObject:", v20);
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v169, v188, 16);
      }
      while (v16);
    }

    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("line"));
  }
  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v165 = 0u;
    v166 = 0u;
    v167 = 0u;
    v168 = 0u;
    v22 = *(id *)(a1 + 24);
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v165, v187, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v166;
      do
      {
        for (k = 0; k != v24; ++k)
        {
          if (*(_QWORD *)v166 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v165 + 1) + 8 * k);
          if ((a2 & 1) != 0)
            objc_msgSend(v27, "jsonRepresentation");
          else
            objc_msgSend(v27, "dictionaryRepresentation");
          v28 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v21, "addObject:", v28);
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v165, v187, 16);
      }
      while (v24);
    }

    if (a2)
      v29 = CFSTR("accessPoint");
    else
      v29 = CFSTR("access_point");
    objc_msgSend(v4, "setObject:forKey:", v21, v29);

  }
  if (objc_msgSend(*(id *)(a1 + 112), "count"))
  {
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 112), "count"));
    v161 = 0u;
    v162 = 0u;
    v163 = 0u;
    v164 = 0u;
    v31 = *(id *)(a1 + 112);
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v161, v186, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v162;
      do
      {
        for (m = 0; m != v33; ++m)
        {
          if (*(_QWORD *)v162 != v34)
            objc_enumerationMutation(v31);
          v36 = *(void **)(*((_QWORD *)&v161 + 1) + 8 * m);
          if ((a2 & 1) != 0)
            objc_msgSend(v36, "jsonRepresentation");
          else
            objc_msgSend(v36, "dictionaryRepresentation");
          v37 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v30, "addObject:", v37);
        }
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v161, v186, 16);
      }
      while (v33);
    }

    objc_msgSend(v4, "setObject:forKey:", v30, CFSTR("walking"));
  }
  if (objc_msgSend(*(id *)(a1 + 80), "count"))
  {
    v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 80), "count"));
    v157 = 0u;
    v158 = 0u;
    v159 = 0u;
    v160 = 0u;
    v39 = *(id *)(a1 + 80);
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v157, v185, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v158;
      do
      {
        for (n = 0; n != v41; ++n)
        {
          if (*(_QWORD *)v158 != v42)
            objc_enumerationMutation(v39);
          v44 = *(void **)(*((_QWORD *)&v157 + 1) + 8 * n);
          if ((a2 & 1) != 0)
            objc_msgSend(v44, "jsonRepresentation");
          else
            objc_msgSend(v44, "dictionaryRepresentation");
          v45 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v38, "addObject:", v45);
        }
        v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v157, v185, 16);
      }
      while (v41);
    }

    objc_msgSend(v4, "setObject:forKey:", v38, CFSTR("stop"));
  }
  if (*(_QWORD *)(a1 + 120))
  {
    if (a2)
    {
      v46 = (void *)MEMORY[0x1E0C99DE8];
      objc_msgSend((id)a1, "zilchPoints");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "arrayWithCapacity:", objc_msgSend(v47, "count"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      v155 = 0u;
      v156 = 0u;
      v153 = 0u;
      v154 = 0u;
      objc_msgSend((id)a1, "zilchPoints");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v153, v184, 16);
      if (v50)
      {
        v51 = v50;
        v52 = *(_QWORD *)v154;
        do
        {
          for (ii = 0; ii != v51; ++ii)
          {
            if (*(_QWORD *)v154 != v52)
              objc_enumerationMutation(v49);
            objc_msgSend(*(id *)(*((_QWORD *)&v153 + 1) + 8 * ii), "base64EncodedStringWithOptions:", 0);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "addObject:", v54);

          }
          v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v153, v184, 16);
        }
        while (v51);
      }

      v55 = CFSTR("zilchPoints");
    }
    else
    {
      objc_msgSend((id)a1, "zilchPoints");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = CFSTR("zilch_points");
    }
    objc_msgSend(v4, "setObject:forKey:", v48, v55);

  }
  if (objc_msgSend(*(id *)(a1 + 88), "count"))
  {
    v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 88), "count"));
    v149 = 0u;
    v150 = 0u;
    v151 = 0u;
    v152 = 0u;
    v57 = *(id *)(a1 + 88);
    v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v149, v183, 16);
    if (v58)
    {
      v59 = v58;
      v60 = *(_QWORD *)v150;
      do
      {
        for (jj = 0; jj != v59; ++jj)
        {
          if (*(_QWORD *)v150 != v60)
            objc_enumerationMutation(v57);
          v62 = *(void **)(*((_QWORD *)&v149 + 1) + 8 * jj);
          if ((a2 & 1) != 0)
            objc_msgSend(v62, "jsonRepresentation");
          else
            objc_msgSend(v62, "dictionaryRepresentation");
          v63 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v56, "addObject:", v63);
        }
        v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v149, v183, 16);
      }
      while (v59);
    }

    objc_msgSend(v4, "setObject:forKey:", v56, CFSTR("system"));
  }
  if (objc_msgSend(*(id *)(a1 + 104), "count"))
  {
    v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 104), "count"));
    v145 = 0u;
    v146 = 0u;
    v147 = 0u;
    v148 = 0u;
    v65 = *(id *)(a1 + 104);
    v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v145, v182, 16);
    if (v66)
    {
      v67 = v66;
      v68 = *(_QWORD *)v146;
      do
      {
        for (kk = 0; kk != v67; ++kk)
        {
          if (*(_QWORD *)v146 != v68)
            objc_enumerationMutation(v65);
          v70 = *(void **)(*((_QWORD *)&v145 + 1) + 8 * kk);
          if ((a2 & 1) != 0)
            objc_msgSend(v70, "jsonRepresentation");
          else
            objc_msgSend(v70, "dictionaryRepresentation");
          v71 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v64, "addObject:", v71);
        }
        v67 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v145, v182, 16);
      }
      while (v67);
    }

    if (a2)
      v72 = CFSTR("transitIncident");
    else
      v72 = CFSTR("transit_incident");
    objc_msgSend(v4, "setObject:forKey:", v64, v72);

  }
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v73 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v141 = 0u;
    v142 = 0u;
    v143 = 0u;
    v144 = 0u;
    v74 = *(id *)(a1 + 40);
    v75 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v141, v181, 16);
    if (v75)
    {
      v76 = v75;
      v77 = *(_QWORD *)v142;
      do
      {
        for (mm = 0; mm != v76; ++mm)
        {
          if (*(_QWORD *)v142 != v77)
            objc_enumerationMutation(v74);
          v79 = *(void **)(*((_QWORD *)&v141 + 1) + 8 * mm);
          if ((a2 & 1) != 0)
            objc_msgSend(v79, "jsonRepresentation");
          else
            objc_msgSend(v79, "dictionaryRepresentation");
          v80 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v73, "addObject:", v80);
        }
        v76 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v141, v181, 16);
      }
      while (v76);
    }

    objc_msgSend(v4, "setObject:forKey:", v73, CFSTR("hall"));
  }
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v81 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v137 = 0u;
    v138 = 0u;
    v139 = 0u;
    v140 = 0u;
    v82 = *(id *)(a1 + 32);
    v83 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v137, v180, 16);
    if (v83)
    {
      v84 = v83;
      v85 = *(_QWORD *)v138;
      do
      {
        for (nn = 0; nn != v84; ++nn)
        {
          if (*(_QWORD *)v138 != v85)
            objc_enumerationMutation(v82);
          v87 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * nn);
          if ((a2 & 1) != 0)
            objc_msgSend(v87, "jsonRepresentation");
          else
            objc_msgSend(v87, "dictionaryRepresentation");
          v88 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v81, "addObject:", v88);
        }
        v84 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v137, v180, 16);
      }
      while (v84);
    }

    objc_msgSend(v4, "setObject:forKey:", v81, CFSTR("artwork"));
  }
  if (objc_msgSend(*(id *)(a1 + 96), "count"))
  {
    v89 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 96), "count"));
    v133 = 0u;
    v134 = 0u;
    v135 = 0u;
    v136 = 0u;
    v90 = *(id *)(a1 + 96);
    v91 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v133, v179, 16);
    if (v91)
    {
      v92 = v91;
      v93 = *(_QWORD *)v134;
      do
      {
        for (i1 = 0; i1 != v92; ++i1)
        {
          if (*(_QWORD *)v134 != v93)
            objc_enumerationMutation(v90);
          v95 = *(void **)(*((_QWORD *)&v133 + 1) + 8 * i1);
          if ((a2 & 1) != 0)
            objc_msgSend(v95, "jsonRepresentation");
          else
            objc_msgSend(v95, "dictionaryRepresentation");
          v96 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v89, "addObject:", v96);
        }
        v92 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v133, v179, 16);
      }
      while (v92);
    }

    if (a2)
      v97 = CFSTR("transitIncidentMessage");
    else
      v97 = CFSTR("transit_incident_message");
    objc_msgSend(v4, "setObject:forKey:", v89, v97);

  }
  if (objc_msgSend(*(id *)(a1 + 72), "count"))
  {
    v98 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 72), "count"));
    v129 = 0u;
    v130 = 0u;
    v131 = 0u;
    v132 = 0u;
    v99 = *(id *)(a1 + 72);
    v100 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v129, v178, 16);
    if (v100)
    {
      v101 = v100;
      v102 = *(_QWORD *)v130;
      do
      {
        for (i2 = 0; i2 != v101; ++i2)
        {
          if (*(_QWORD *)v130 != v102)
            objc_enumerationMutation(v99);
          v104 = *(void **)(*((_QWORD *)&v129 + 1) + 8 * i2);
          if ((a2 & 1) != 0)
            objc_msgSend(v104, "jsonRepresentation");
          else
            objc_msgSend(v104, "dictionaryRepresentation");
          v105 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v98, "addObject:", v105);
        }
        v101 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v129, v178, 16);
      }
      while (v101);
    }

    objc_msgSend(v4, "setObject:forKey:", v98, CFSTR("step"));
  }
  if (objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    v106 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
    v125 = 0u;
    v126 = 0u;
    v127 = 0u;
    v128 = 0u;
    v107 = *(id *)(a1 + 56);
    v108 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v125, v177, 16);
    if (v108)
    {
      v109 = v108;
      v110 = *(_QWORD *)v126;
      do
      {
        for (i3 = 0; i3 != v109; ++i3)
        {
          if (*(_QWORD *)v126 != v110)
            objc_enumerationMutation(v107);
          v112 = *(void **)(*((_QWORD *)&v125 + 1) + 8 * i3);
          if ((a2 & 1) != 0)
            objc_msgSend(v112, "jsonRepresentation");
          else
            objc_msgSend(v112, "dictionaryRepresentation");
          v113 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v106, "addObject:", v113);
        }
        v109 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v125, v177, 16);
      }
      while (v109);
    }

    if (a2)
      v114 = CFSTR("paymentMethod");
    else
      v114 = CFSTR("payment_method");
    objc_msgSend(v4, "setObject:forKey:", v106, v114);

  }
  v115 = *(void **)(a1 + 16);
  if (v115)
  {
    objc_msgSend(v115, "dictionaryRepresentation");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    v117 = v116;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v116, "count"));
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      v123[0] = MEMORY[0x1E0C809B0];
      v123[1] = 3221225472;
      v123[2] = __51__GEOTransitDecoderData__dictionaryRepresentation___block_invoke;
      v123[3] = &unk_1E1C00600;
      v119 = v118;
      v124 = v119;
      objc_msgSend(v117, "enumerateKeysAndObjectsUsingBlock:", v123);
      v120 = v119;

      v117 = v120;
    }
    objc_msgSend(v4, "setObject:forKey:", v117, CFSTR("Unknown Fields"));

  }
  v121 = v4;

  return v121;
}

- (id)jsonRepresentation
{
  return -[GEOTransitDecoderData _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __51__GEOTransitDecoderData__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOTransitDecoderData)initWithDictionary:(id)a3
{
  return (GEOTransitDecoderData *)-[GEOTransitDecoderData _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  GEOPBTransitStation *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  GEOPBTransitLine *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  uint64_t v34;
  GEOPBTransitAccessPoint *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t m;
  uint64_t v44;
  GEORoute *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t n;
  uint64_t v54;
  GEOPBTransitStop *v55;
  uint64_t v56;
  void *v57;
  const __CFString *v58;
  void *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t ii;
  uint64_t v65;
  void *v66;
  void *v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t jj;
  uint64_t v73;
  GEOPBTransitSystem *v74;
  uint64_t v75;
  void *v76;
  const __CFString *v77;
  void *v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  GEOPBTransitIncident *v85;
  void *v86;
  uint64_t v87;
  void *v88;
  id v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t kk;
  uint64_t v94;
  GEOPBTransitHall *v95;
  uint64_t v96;
  void *v97;
  void *v98;
  id v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t mm;
  uint64_t v104;
  GEOPBTransitArtwork *v105;
  uint64_t v106;
  void *v107;
  const __CFString *v108;
  void *v109;
  id v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  GEOPBTransitRoutingIncidentMessage *v116;
  void *v117;
  uint64_t v118;
  void *v119;
  id v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t nn;
  uint64_t v125;
  GEOTransitStep *v126;
  uint64_t v127;
  void *v128;
  const __CFString *v129;
  void *v130;
  id v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t i1;
  uint64_t v136;
  GEOPBTransitPaymentMethod *v137;
  uint64_t v138;
  void *v139;
  id v140;
  id v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  _BYTE v195[128];
  _BYTE v196[128];
  _BYTE v197[128];
  _BYTE v198[128];
  _BYTE v199[128];
  _BYTE v200[128];
  _BYTE v201[128];
  _BYTE v202[128];
  _BYTE v203[128];
  _BYTE v204[128];
  _BYTE v205[128];
  _BYTE v206[128];
  _BYTE v207[128];
  uint64_t v208;

  v208 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1 && (v6 = (id)objc_msgSend(a1, "init"), v6, v6))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("station"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v142 = v5;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v193 = 0u;
      v194 = 0u;
      v191 = 0u;
      v192 = 0u;
      v8 = v7;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v191, v207, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v192;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v192 != v11)
              objc_enumerationMutation(v8);
            v13 = *(_QWORD *)(*((_QWORD *)&v191 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v14 = [GEOPBTransitStation alloc];
              if ((a3 & 1) != 0)
                v15 = -[GEOPBTransitStation initWithJSON:](v14, "initWithJSON:", v13);
              else
                v15 = -[GEOPBTransitStation initWithDictionary:](v14, "initWithDictionary:", v13);
              v16 = (void *)v15;
              objc_msgSend(v6, "addStation:", v15);

            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v191, v207, 16);
        }
        while (v10);
      }

      v5 = v142;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("line"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v189 = 0u;
      v190 = 0u;
      v187 = 0u;
      v188 = 0u;
      v18 = v17;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v187, v206, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v188;
        do
        {
          for (j = 0; j != v20; ++j)
          {
            if (*(_QWORD *)v188 != v21)
              objc_enumerationMutation(v18);
            v23 = *(_QWORD *)(*((_QWORD *)&v187 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v24 = [GEOPBTransitLine alloc];
              if ((a3 & 1) != 0)
                v25 = -[GEOPBTransitLine initWithJSON:](v24, "initWithJSON:", v23);
              else
                v25 = -[GEOPBTransitLine initWithDictionary:](v24, "initWithDictionary:", v23);
              v26 = (void *)v25;
              objc_msgSend(v6, "addLine:", v25);

            }
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v187, v206, 16);
        }
        while (v20);
      }

      v5 = v142;
    }

    if (a3)
      v27 = CFSTR("accessPoint");
    else
      v27 = CFSTR("access_point");
    objc_msgSend(v5, "objectForKeyedSubscript:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v185 = 0u;
      v186 = 0u;
      v183 = 0u;
      v184 = 0u;
      v29 = v28;
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v183, v205, 16);
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v184;
        do
        {
          for (k = 0; k != v31; ++k)
          {
            if (*(_QWORD *)v184 != v32)
              objc_enumerationMutation(v29);
            v34 = *(_QWORD *)(*((_QWORD *)&v183 + 1) + 8 * k);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v35 = [GEOPBTransitAccessPoint alloc];
              if ((a3 & 1) != 0)
                v36 = -[GEOPBTransitAccessPoint initWithJSON:](v35, "initWithJSON:", v34);
              else
                v36 = -[GEOPBTransitAccessPoint initWithDictionary:](v35, "initWithDictionary:", v34);
              v37 = (void *)v36;
              objc_msgSend(v6, "addAccessPoint:", v36);

            }
          }
          v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v183, v205, 16);
        }
        while (v31);
      }

      v5 = v142;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("walking"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v181 = 0u;
      v182 = 0u;
      v179 = 0u;
      v180 = 0u;
      v39 = v38;
      v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v179, v204, 16);
      if (v40)
      {
        v41 = v40;
        v42 = *(_QWORD *)v180;
        do
        {
          for (m = 0; m != v41; ++m)
          {
            if (*(_QWORD *)v180 != v42)
              objc_enumerationMutation(v39);
            v44 = *(_QWORD *)(*((_QWORD *)&v179 + 1) + 8 * m);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v45 = [GEORoute alloc];
              if ((a3 & 1) != 0)
                v46 = -[GEORoute initWithJSON:](v45, "initWithJSON:", v44);
              else
                v46 = -[GEORoute initWithDictionary:](v45, "initWithDictionary:", v44);
              v47 = (void *)v46;
              objc_msgSend(v6, "addWalking:", v46);

            }
          }
          v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v179, v204, 16);
        }
        while (v41);
      }

      v5 = v142;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("stop"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v177 = 0u;
      v178 = 0u;
      v175 = 0u;
      v176 = 0u;
      v49 = v48;
      v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v175, v203, 16);
      if (v50)
      {
        v51 = v50;
        v52 = *(_QWORD *)v176;
        do
        {
          for (n = 0; n != v51; ++n)
          {
            if (*(_QWORD *)v176 != v52)
              objc_enumerationMutation(v49);
            v54 = *(_QWORD *)(*((_QWORD *)&v175 + 1) + 8 * n);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v55 = [GEOPBTransitStop alloc];
              if ((a3 & 1) != 0)
                v56 = -[GEOPBTransitStop initWithJSON:](v55, "initWithJSON:", v54);
              else
                v56 = -[GEOPBTransitStop initWithDictionary:](v55, "initWithDictionary:", v54);
              v57 = (void *)v56;
              objc_msgSend(v6, "addStop:", v56);

            }
          }
          v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v175, v203, 16);
        }
        while (v51);
      }

      v5 = v142;
    }

    if (a3)
      v58 = CFSTR("zilchPoints");
    else
      v58 = CFSTR("zilch_points");
    objc_msgSend(v5, "objectForKeyedSubscript:", v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v173 = 0u;
      v174 = 0u;
      v171 = 0u;
      v172 = 0u;
      v60 = v59;
      v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v171, v202, 16);
      if (v61)
      {
        v62 = v61;
        v63 = *(_QWORD *)v172;
        do
        {
          for (ii = 0; ii != v62; ++ii)
          {
            if (*(_QWORD *)v172 != v63)
              objc_enumerationMutation(v60);
            v65 = *(_QWORD *)(*((_QWORD *)&v171 + 1) + 8 * ii);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v66 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v65, 0);
              objc_msgSend(v6, "addZilchPoints:", v66);

            }
          }
          v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v171, v202, 16);
        }
        while (v62);
      }

      v5 = v142;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("system"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v169 = 0u;
      v170 = 0u;
      v167 = 0u;
      v168 = 0u;
      v68 = v67;
      v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v167, v201, 16);
      if (v69)
      {
        v70 = v69;
        v71 = *(_QWORD *)v168;
        do
        {
          for (jj = 0; jj != v70; ++jj)
          {
            if (*(_QWORD *)v168 != v71)
              objc_enumerationMutation(v68);
            v73 = *(_QWORD *)(*((_QWORD *)&v167 + 1) + 8 * jj);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v74 = [GEOPBTransitSystem alloc];
              if ((a3 & 1) != 0)
                v75 = -[GEOPBTransitSystem initWithJSON:](v74, "initWithJSON:", v73);
              else
                v75 = -[GEOPBTransitSystem initWithDictionary:](v74, "initWithDictionary:", v73);
              v76 = (void *)v75;
              objc_msgSend(v6, "addSystem:", v75);

            }
          }
          v70 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v167, v201, 16);
        }
        while (v70);
      }

      v5 = v142;
    }

    if (a3)
      v77 = CFSTR("transitIncident");
    else
      v77 = CFSTR("transit_incident");
    objc_msgSend(v5, "objectForKeyedSubscript:", v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v165 = 0u;
      v166 = 0u;
      v163 = 0u;
      v164 = 0u;
      v79 = v78;
      v80 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v163, v200, 16);
      if (v80)
      {
        v81 = v80;
        v82 = *(_QWORD *)v164;
        do
        {
          v83 = 0;
          do
          {
            if (*(_QWORD *)v164 != v82)
              objc_enumerationMutation(v79);
            v84 = *(void **)(*((_QWORD *)&v163 + 1) + 8 * v83);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v85 = [GEOPBTransitIncident alloc];
              if (v85)
                v86 = (void *)-[GEOPBTransitIncident _initWithDictionary:isJSON:](v85, v84, a3);
              else
                v86 = 0;
              objc_msgSend(v6, "addTransitIncident:", v86);

            }
            ++v83;
          }
          while (v81 != v83);
          v87 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v163, v200, 16);
          v81 = v87;
        }
        while (v87);
      }

      v5 = v142;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("hall"));
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v161 = 0u;
      v162 = 0u;
      v159 = 0u;
      v160 = 0u;
      v89 = v88;
      v90 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v159, v199, 16);
      if (v90)
      {
        v91 = v90;
        v92 = *(_QWORD *)v160;
        do
        {
          for (kk = 0; kk != v91; ++kk)
          {
            if (*(_QWORD *)v160 != v92)
              objc_enumerationMutation(v89);
            v94 = *(_QWORD *)(*((_QWORD *)&v159 + 1) + 8 * kk);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v95 = [GEOPBTransitHall alloc];
              if ((a3 & 1) != 0)
                v96 = -[GEOPBTransitHall initWithJSON:](v95, "initWithJSON:", v94);
              else
                v96 = -[GEOPBTransitHall initWithDictionary:](v95, "initWithDictionary:", v94);
              v97 = (void *)v96;
              objc_msgSend(v6, "addHall:", v96);

            }
          }
          v91 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v159, v199, 16);
        }
        while (v91);
      }

      v5 = v142;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("artwork"));
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v157 = 0u;
      v158 = 0u;
      v155 = 0u;
      v156 = 0u;
      v99 = v98;
      v100 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v155, v198, 16);
      if (v100)
      {
        v101 = v100;
        v102 = *(_QWORD *)v156;
        do
        {
          for (mm = 0; mm != v101; ++mm)
          {
            if (*(_QWORD *)v156 != v102)
              objc_enumerationMutation(v99);
            v104 = *(_QWORD *)(*((_QWORD *)&v155 + 1) + 8 * mm);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v105 = [GEOPBTransitArtwork alloc];
              if ((a3 & 1) != 0)
                v106 = -[GEOPBTransitArtwork initWithJSON:](v105, "initWithJSON:", v104);
              else
                v106 = -[GEOPBTransitArtwork initWithDictionary:](v105, "initWithDictionary:", v104);
              v107 = (void *)v106;
              objc_msgSend(v6, "addArtwork:", v106);

            }
          }
          v101 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v155, v198, 16);
        }
        while (v101);
      }

      v5 = v142;
    }

    if (a3)
      v108 = CFSTR("transitIncidentMessage");
    else
      v108 = CFSTR("transit_incident_message");
    objc_msgSend(v5, "objectForKeyedSubscript:", v108);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v153 = 0u;
      v154 = 0u;
      v151 = 0u;
      v152 = 0u;
      v110 = v109;
      v111 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v151, v197, 16);
      if (v111)
      {
        v112 = v111;
        v113 = *(_QWORD *)v152;
        do
        {
          v114 = 0;
          do
          {
            if (*(_QWORD *)v152 != v113)
              objc_enumerationMutation(v110);
            v115 = *(void **)(*((_QWORD *)&v151 + 1) + 8 * v114);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v116 = [GEOPBTransitRoutingIncidentMessage alloc];
              if (v116)
                v117 = (void *)-[GEOPBTransitRoutingIncidentMessage _initWithDictionary:isJSON:]((uint64_t)v116, v115, a3);
              else
                v117 = 0;
              objc_msgSend(v6, "addTransitIncidentMessage:", v117);

            }
            ++v114;
          }
          while (v112 != v114);
          v118 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v151, v197, 16);
          v112 = v118;
        }
        while (v118);
      }

      v5 = v142;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("step"));
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v149 = 0u;
      v150 = 0u;
      v147 = 0u;
      v148 = 0u;
      v120 = v119;
      v121 = objc_msgSend(v120, "countByEnumeratingWithState:objects:count:", &v147, v196, 16);
      if (v121)
      {
        v122 = v121;
        v123 = *(_QWORD *)v148;
        do
        {
          for (nn = 0; nn != v122; ++nn)
          {
            if (*(_QWORD *)v148 != v123)
              objc_enumerationMutation(v120);
            v125 = *(_QWORD *)(*((_QWORD *)&v147 + 1) + 8 * nn);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v126 = [GEOTransitStep alloc];
              if ((a3 & 1) != 0)
                v127 = -[GEOTransitStep initWithJSON:](v126, "initWithJSON:", v125);
              else
                v127 = -[GEOTransitStep initWithDictionary:](v126, "initWithDictionary:", v125);
              v128 = (void *)v127;
              objc_msgSend(v6, "addStep:", v127);

            }
          }
          v122 = objc_msgSend(v120, "countByEnumeratingWithState:objects:count:", &v147, v196, 16);
        }
        while (v122);
      }

      v5 = v142;
    }

    if (a3)
      v129 = CFSTR("paymentMethod");
    else
      v129 = CFSTR("payment_method");
    objc_msgSend(v5, "objectForKeyedSubscript:", v129);
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v145 = 0u;
      v146 = 0u;
      v143 = 0u;
      v144 = 0u;
      v131 = v130;
      v132 = objc_msgSend(v131, "countByEnumeratingWithState:objects:count:", &v143, v195, 16);
      if (v132)
      {
        v133 = v132;
        v134 = *(_QWORD *)v144;
        do
        {
          for (i1 = 0; i1 != v133; ++i1)
          {
            if (*(_QWORD *)v144 != v134)
              objc_enumerationMutation(v131);
            v136 = *(_QWORD *)(*((_QWORD *)&v143 + 1) + 8 * i1);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v137 = [GEOPBTransitPaymentMethod alloc];
              if ((a3 & 1) != 0)
                v138 = -[GEOPBTransitPaymentMethod initWithJSON:](v137, "initWithJSON:", v136);
              else
                v138 = -[GEOPBTransitPaymentMethod initWithDictionary:](v137, "initWithDictionary:", v136);
              v139 = (void *)v138;
              objc_msgSend(v6, "addPaymentMethod:", v138);

            }
          }
          v133 = objc_msgSend(v131, "countByEnumeratingWithState:objects:count:", &v143, v195, 16);
        }
        while (v133);
      }

      v5 = v142;
    }

    v140 = v6;
  }
  else
  {
    v140 = 0;
  }

  return v140;
}

- (GEOTransitDecoderData)initWithJSON:(id)a3
{
  return (GEOTransitDecoderData *)-[GEOTransitDecoderData _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_478;
    else
      v8 = (int *)&readAll__nonRecursiveTag_479;
    GEOTransitDecoderDataReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOTransitDecoderDataCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTransitDecoderDataIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTransitDecoderDataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSMutableArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSMutableArray *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSMutableArray *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSMutableArray *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSMutableArray *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSMutableArray *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSMutableArray *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSMutableArray *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  PBDataReader *v58;
  void *v59;
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
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  _BYTE v112[128];
  _BYTE v113[128];
  _BYTE v114[128];
  _BYTE v115[128];
  _BYTE v116[128];
  _BYTE v117[128];
  _BYTE v118[128];
  _BYTE v119[128];
  _BYTE v120[128];
  _BYTE v121[128];
  _BYTE v122[128];
  _BYTE v123[128];
  _BYTE v124[128];
  uint64_t v125;

  v125 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOTransitDecoderDataIsDirty((uint64_t)self) & 1) == 0)
  {
    v58 = self->_reader;
    objc_sync_enter(v58);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v59);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v58);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOTransitDecoderData readAll:](self, "readAll:", 0);
    v110 = 0u;
    v111 = 0u;
    v108 = 0u;
    v109 = 0u;
    v6 = self->_stations;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v108, v124, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v109;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v109 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v108, v124, 16);
      }
      while (v7);
    }

    v106 = 0u;
    v107 = 0u;
    v104 = 0u;
    v105 = 0u;
    v10 = self->_lines;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v104, v123, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v105;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v105 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteSubmessage();
          ++v13;
        }
        while (v11 != v13);
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v104, v123, 16);
      }
      while (v11);
    }

    v102 = 0u;
    v103 = 0u;
    v100 = 0u;
    v101 = 0u;
    v14 = self->_accessPoints;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v100, v122, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v101;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v101 != v16)
            objc_enumerationMutation(v14);
          PBDataWriterWriteSubmessage();
          ++v17;
        }
        while (v15 != v17);
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v100, v122, 16);
      }
      while (v15);
    }

    v98 = 0u;
    v99 = 0u;
    v96 = 0u;
    v97 = 0u;
    v18 = self->_walkings;
    v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v96, v121, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v97;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v97 != v20)
            objc_enumerationMutation(v18);
          PBDataWriterWriteSubmessage();
          ++v21;
        }
        while (v19 != v21);
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v96, v121, 16);
      }
      while (v19);
    }

    v94 = 0u;
    v95 = 0u;
    v92 = 0u;
    v93 = 0u;
    v22 = self->_stops;
    v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v92, v120, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v93;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v93 != v24)
            objc_enumerationMutation(v22);
          PBDataWriterWriteSubmessage();
          ++v25;
        }
        while (v23 != v25);
        v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v92, v120, 16);
      }
      while (v23);
    }

    v90 = 0u;
    v91 = 0u;
    v88 = 0u;
    v89 = 0u;
    v26 = self->_zilchPoints;
    v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v88, v119, 16);
    if (v27)
    {
      v28 = *(_QWORD *)v89;
      do
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v89 != v28)
            objc_enumerationMutation(v26);
          PBDataWriterWriteDataField();
          ++v29;
        }
        while (v27 != v29);
        v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v88, v119, 16);
      }
      while (v27);
    }

    v86 = 0u;
    v87 = 0u;
    v84 = 0u;
    v85 = 0u;
    v30 = self->_systems;
    v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v84, v118, 16);
    if (v31)
    {
      v32 = *(_QWORD *)v85;
      do
      {
        v33 = 0;
        do
        {
          if (*(_QWORD *)v85 != v32)
            objc_enumerationMutation(v30);
          PBDataWriterWriteSubmessage();
          ++v33;
        }
        while (v31 != v33);
        v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v84, v118, 16);
      }
      while (v31);
    }

    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    v34 = self->_transitIncidents;
    v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v80, v117, 16);
    if (v35)
    {
      v36 = *(_QWORD *)v81;
      do
      {
        v37 = 0;
        do
        {
          if (*(_QWORD *)v81 != v36)
            objc_enumerationMutation(v34);
          PBDataWriterWriteSubmessage();
          ++v37;
        }
        while (v35 != v37);
        v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v80, v117, 16);
      }
      while (v35);
    }

    v78 = 0u;
    v79 = 0u;
    v76 = 0u;
    v77 = 0u;
    v38 = self->_halls;
    v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v76, v116, 16);
    if (v39)
    {
      v40 = *(_QWORD *)v77;
      do
      {
        v41 = 0;
        do
        {
          if (*(_QWORD *)v77 != v40)
            objc_enumerationMutation(v38);
          PBDataWriterWriteSubmessage();
          ++v41;
        }
        while (v39 != v41);
        v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v76, v116, 16);
      }
      while (v39);
    }

    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v42 = self->_artworks;
    v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v72, v115, 16);
    if (v43)
    {
      v44 = *(_QWORD *)v73;
      do
      {
        v45 = 0;
        do
        {
          if (*(_QWORD *)v73 != v44)
            objc_enumerationMutation(v42);
          PBDataWriterWriteSubmessage();
          ++v45;
        }
        while (v43 != v45);
        v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v72, v115, 16);
      }
      while (v43);
    }

    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v46 = self->_transitIncidentMessages;
    v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v68, v114, 16);
    if (v47)
    {
      v48 = *(_QWORD *)v69;
      do
      {
        v49 = 0;
        do
        {
          if (*(_QWORD *)v69 != v48)
            objc_enumerationMutation(v46);
          PBDataWriterWriteSubmessage();
          ++v49;
        }
        while (v47 != v49);
        v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v68, v114, 16);
      }
      while (v47);
    }

    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v50 = self->_steps;
    v51 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v50, "countByEnumeratingWithState:objects:count:", &v64, v113, 16);
    if (v51)
    {
      v52 = *(_QWORD *)v65;
      do
      {
        v53 = 0;
        do
        {
          if (*(_QWORD *)v65 != v52)
            objc_enumerationMutation(v50);
          PBDataWriterWriteSubmessage();
          ++v53;
        }
        while (v51 != v53);
        v51 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v50, "countByEnumeratingWithState:objects:count:", &v64, v113, 16);
      }
      while (v51);
    }

    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v54 = self->_paymentMethods;
    v55 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v54, "countByEnumeratingWithState:objects:count:", &v60, v112, 16);
    if (v55)
    {
      v56 = *(_QWORD *)v61;
      do
      {
        v57 = 0;
        do
        {
          if (*(_QWORD *)v61 != v56)
            objc_enumerationMutation(v54);
          PBDataWriterWriteSubmessage();
          ++v57;
        }
        while (v55 != v57);
        v55 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v54, "countByEnumeratingWithState:objects:count:", &v60, v112, 16);
      }
      while (v55);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v60);
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  BOOL v30;
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
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v3 = a3;
  v62 = *MEMORY[0x1E0C80C00];
  -[GEOTransitDecoderData _readAccessPoints]((uint64_t)self);
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v5 = self->_accessPoints;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v53;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v53 != v8)
        objc_enumerationMutation(v5);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * v9), "hasGreenTeaWithValue:", v3) & 1) != 0)
        goto LABEL_50;
      if (v7 == ++v9)
      {
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

  -[GEOTransitDecoderData _readHalls]((uint64_t)self);
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v5 = self->_halls;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v49;
LABEL_11:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v49 != v12)
        objc_enumerationMutation(v5);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * v13), "hasGreenTeaWithValue:", v3) & 1) != 0)
        goto LABEL_50;
      if (v11 == ++v13)
      {
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
        if (v11)
          goto LABEL_11;
        break;
      }
    }
  }

  -[GEOTransitDecoderData _readStations]((uint64_t)self);
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v5 = self->_stations;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v44, v59, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v45;
LABEL_19:
    v17 = 0;
    while (1)
    {
      if (*(_QWORD *)v45 != v16)
        objc_enumerationMutation(v5);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * v17), "hasGreenTeaWithValue:", v3) & 1) != 0)
        goto LABEL_50;
      if (v15 == ++v17)
      {
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v44, v59, 16);
        if (v15)
          goto LABEL_19;
        break;
      }
    }
  }

  -[GEOTransitDecoderData _readSteps]((uint64_t)self);
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v5 = self->_steps;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v40, v58, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v41;
LABEL_27:
    v21 = 0;
    while (1)
    {
      if (*(_QWORD *)v41 != v20)
        objc_enumerationMutation(v5);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * v21), "hasGreenTeaWithValue:", v3) & 1) != 0)
        goto LABEL_50;
      if (v19 == ++v21)
      {
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v40, v58, 16);
        if (v19)
          goto LABEL_27;
        break;
      }
    }
  }

  -[GEOTransitDecoderData _readStops]((uint64_t)self);
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v5 = self->_stops;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v36, v57, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v37;
LABEL_35:
    v25 = 0;
    while (1)
    {
      if (*(_QWORD *)v37 != v24)
        objc_enumerationMutation(v5);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v25), "hasGreenTeaWithValue:", v3) & 1) != 0)
        goto LABEL_50;
      if (v23 == ++v25)
      {
        v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v36, v57, 16);
        if (v23)
          goto LABEL_35;
        break;
      }
    }
  }

  -[GEOTransitDecoderData _readWalkings]((uint64_t)self);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v5 = self->_walkings;
  v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v32, v56, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v33;
LABEL_43:
    v29 = 0;
    while (1)
    {
      if (*(_QWORD *)v33 != v28)
        objc_enumerationMutation(v5);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v29), "hasGreenTeaWithValue:", v3, (_QWORD)v32) & 1) != 0)
        break;
      if (v27 == ++v29)
      {
        v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v32, v56, 16);
        if (v27)
          goto LABEL_43;
        goto LABEL_49;
      }
    }
LABEL_50:
    v30 = 1;
    goto LABEL_51;
  }
LABEL_49:
  v30 = 0;
LABEL_51:

  return v30;
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
  unint64_t v20;
  unint64_t v21;
  uint64_t n;
  void *v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t ii;
  void *v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t jj;
  void *v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t kk;
  void *v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t mm;
  void *v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t nn;
  void *v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t i1;
  void *v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t i2;
  void *v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t i3;
  void *v55;
  id *v56;

  v56 = (id *)a3;
  -[GEOTransitDecoderData readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v56 + 1, self->_reader);
  *((_DWORD *)v56 + 32) = self->_readerMarkPos;
  *((_DWORD *)v56 + 33) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEOTransitDecoderData stationsCount](self, "stationsCount"))
  {
    objc_msgSend(v56, "clearStations");
    v4 = -[GEOTransitDecoderData stationsCount](self, "stationsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOTransitDecoderData stationAtIndex:](self, "stationAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "addStation:", v7);

      }
    }
  }
  if (-[GEOTransitDecoderData linesCount](self, "linesCount"))
  {
    objc_msgSend(v56, "clearLines");
    v8 = -[GEOTransitDecoderData linesCount](self, "linesCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[GEOTransitDecoderData lineAtIndex:](self, "lineAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "addLine:", v11);

      }
    }
  }
  if (-[GEOTransitDecoderData accessPointsCount](self, "accessPointsCount"))
  {
    objc_msgSend(v56, "clearAccessPoints");
    v12 = -[GEOTransitDecoderData accessPointsCount](self, "accessPointsCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[GEOTransitDecoderData accessPointAtIndex:](self, "accessPointAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "addAccessPoint:", v15);

      }
    }
  }
  if (-[GEOTransitDecoderData walkingsCount](self, "walkingsCount"))
  {
    objc_msgSend(v56, "clearWalkings");
    v16 = -[GEOTransitDecoderData walkingsCount](self, "walkingsCount");
    if (v16)
    {
      v17 = v16;
      for (m = 0; m != v17; ++m)
      {
        -[GEOTransitDecoderData walkingAtIndex:](self, "walkingAtIndex:", m);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "addWalking:", v19);

      }
    }
  }
  if (-[GEOTransitDecoderData stopsCount](self, "stopsCount"))
  {
    objc_msgSend(v56, "clearStops");
    v20 = -[GEOTransitDecoderData stopsCount](self, "stopsCount");
    if (v20)
    {
      v21 = v20;
      for (n = 0; n != v21; ++n)
      {
        -[GEOTransitDecoderData stopAtIndex:](self, "stopAtIndex:", n);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "addStop:", v23);

      }
    }
  }
  if (-[GEOTransitDecoderData zilchPointsCount](self, "zilchPointsCount"))
  {
    objc_msgSend(v56, "clearZilchPoints");
    v24 = -[GEOTransitDecoderData zilchPointsCount](self, "zilchPointsCount");
    if (v24)
    {
      v25 = v24;
      for (ii = 0; ii != v25; ++ii)
      {
        -[GEOTransitDecoderData zilchPointsAtIndex:](self, "zilchPointsAtIndex:", ii);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "addZilchPoints:", v27);

      }
    }
  }
  if (-[GEOTransitDecoderData systemsCount](self, "systemsCount"))
  {
    objc_msgSend(v56, "clearSystems");
    v28 = -[GEOTransitDecoderData systemsCount](self, "systemsCount");
    if (v28)
    {
      v29 = v28;
      for (jj = 0; jj != v29; ++jj)
      {
        -[GEOTransitDecoderData systemAtIndex:](self, "systemAtIndex:", jj);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "addSystem:", v31);

      }
    }
  }
  if (-[GEOTransitDecoderData transitIncidentsCount](self, "transitIncidentsCount"))
  {
    objc_msgSend(v56, "clearTransitIncidents");
    v32 = -[GEOTransitDecoderData transitIncidentsCount](self, "transitIncidentsCount");
    if (v32)
    {
      v33 = v32;
      for (kk = 0; kk != v33; ++kk)
      {
        -[GEOTransitDecoderData transitIncidentAtIndex:](self, "transitIncidentAtIndex:", kk);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "addTransitIncident:", v35);

      }
    }
  }
  if (-[GEOTransitDecoderData hallsCount](self, "hallsCount"))
  {
    objc_msgSend(v56, "clearHalls");
    v36 = -[GEOTransitDecoderData hallsCount](self, "hallsCount");
    if (v36)
    {
      v37 = v36;
      for (mm = 0; mm != v37; ++mm)
      {
        -[GEOTransitDecoderData hallAtIndex:](self, "hallAtIndex:", mm);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "addHall:", v39);

      }
    }
  }
  if (-[GEOTransitDecoderData artworksCount](self, "artworksCount"))
  {
    objc_msgSend(v56, "clearArtworks");
    v40 = -[GEOTransitDecoderData artworksCount](self, "artworksCount");
    if (v40)
    {
      v41 = v40;
      for (nn = 0; nn != v41; ++nn)
      {
        -[GEOTransitDecoderData artworkAtIndex:](self, "artworkAtIndex:", nn);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "addArtwork:", v43);

      }
    }
  }
  if (-[GEOTransitDecoderData transitIncidentMessagesCount](self, "transitIncidentMessagesCount"))
  {
    objc_msgSend(v56, "clearTransitIncidentMessages");
    v44 = -[GEOTransitDecoderData transitIncidentMessagesCount](self, "transitIncidentMessagesCount");
    if (v44)
    {
      v45 = v44;
      for (i1 = 0; i1 != v45; ++i1)
      {
        -[GEOTransitDecoderData transitIncidentMessageAtIndex:](self, "transitIncidentMessageAtIndex:", i1);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "addTransitIncidentMessage:", v47);

      }
    }
  }
  if (-[GEOTransitDecoderData stepsCount](self, "stepsCount"))
  {
    objc_msgSend(v56, "clearSteps");
    v48 = -[GEOTransitDecoderData stepsCount](self, "stepsCount");
    if (v48)
    {
      v49 = v48;
      for (i2 = 0; i2 != v49; ++i2)
      {
        -[GEOTransitDecoderData stepAtIndex:](self, "stepAtIndex:", i2);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "addStep:", v51);

      }
    }
  }
  if (-[GEOTransitDecoderData paymentMethodsCount](self, "paymentMethodsCount"))
  {
    objc_msgSend(v56, "clearPaymentMethods");
    v52 = -[GEOTransitDecoderData paymentMethodsCount](self, "paymentMethodsCount");
    if (v52)
    {
      v53 = v52;
      for (i3 = 0; i3 != v53; ++i3)
      {
        -[GEOTransitDecoderData paymentMethodAtIndex:](self, "paymentMethodAtIndex:", i3);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "addPaymentMethod:", v55);

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
  uint64_t v11;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  NSMutableArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  NSMutableArray *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  NSMutableArray *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  NSMutableArray *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  NSMutableArray *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  NSMutableArray *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  NSMutableArray *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  NSMutableArray *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  NSMutableArray *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  _BYTE v126[128];
  _BYTE v127[128];
  _BYTE v128[128];
  _BYTE v129[128];
  _BYTE v130[128];
  _BYTE v131[128];
  _BYTE v132[128];
  _BYTE v133[128];
  _BYTE v134[128];
  _BYTE v135[128];
  _BYTE v136[128];
  _BYTE v137[128];
  _BYTE v138[128];
  uint64_t v139;

  v139 = *MEMORY[0x1E0C80C00];
  v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x4000) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOTransitDecoderDataReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOTransitDecoderData readAll:](self, "readAll:", 0);
  v124 = 0u;
  v125 = 0u;
  v122 = 0u;
  v123 = 0u;
  v8 = self->_stations;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v122, v138, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v123;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v123 != v10)
          objc_enumerationMutation(v8);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v122 + 1) + 8 * v11), "copyWithZone:", a3);
        objc_msgSend(v5, "addStation:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v122, v138, 16);
    }
    while (v9);
  }

  v120 = 0u;
  v121 = 0u;
  v118 = 0u;
  v119 = 0u;
  v13 = self->_lines;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v118, v137, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v119;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v119 != v15)
          objc_enumerationMutation(v13);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v118 + 1) + 8 * v16), "copyWithZone:", a3);
        objc_msgSend(v5, "addLine:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v118, v137, 16);
    }
    while (v14);
  }

  v116 = 0u;
  v117 = 0u;
  v114 = 0u;
  v115 = 0u;
  v18 = self->_accessPoints;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v114, v136, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v115;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v115 != v20)
          objc_enumerationMutation(v18);
        v22 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v114 + 1) + 8 * v21), "copyWithZone:", a3);
        objc_msgSend(v5, "addAccessPoint:", v22);

        ++v21;
      }
      while (v19 != v21);
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v114, v136, 16);
    }
    while (v19);
  }

  v112 = 0u;
  v113 = 0u;
  v110 = 0u;
  v111 = 0u;
  v23 = self->_walkings;
  v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v110, v135, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v111;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v111 != v25)
          objc_enumerationMutation(v23);
        v27 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v110 + 1) + 8 * v26), "copyWithZone:", a3);
        objc_msgSend(v5, "addWalking:", v27);

        ++v26;
      }
      while (v24 != v26);
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v110, v135, 16);
    }
    while (v24);
  }

  v108 = 0u;
  v109 = 0u;
  v106 = 0u;
  v107 = 0u;
  v28 = self->_stops;
  v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v106, v134, 16);
  if (v29)
  {
    v30 = *(_QWORD *)v107;
    do
    {
      v31 = 0;
      do
      {
        if (*(_QWORD *)v107 != v30)
          objc_enumerationMutation(v28);
        v32 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v106 + 1) + 8 * v31), "copyWithZone:", a3);
        objc_msgSend(v5, "addStop:", v32);

        ++v31;
      }
      while (v29 != v31);
      v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v106, v134, 16);
    }
    while (v29);
  }

  v104 = 0u;
  v105 = 0u;
  v102 = 0u;
  v103 = 0u;
  v33 = self->_zilchPoints;
  v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v102, v133, 16);
  if (v34)
  {
    v35 = *(_QWORD *)v103;
    do
    {
      v36 = 0;
      do
      {
        if (*(_QWORD *)v103 != v35)
          objc_enumerationMutation(v33);
        v37 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v102 + 1) + 8 * v36), "copyWithZone:", a3);
        objc_msgSend(v5, "addZilchPoints:", v37);

        ++v36;
      }
      while (v34 != v36);
      v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v102, v133, 16);
    }
    while (v34);
  }

  v100 = 0u;
  v101 = 0u;
  v98 = 0u;
  v99 = 0u;
  v38 = self->_systems;
  v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v98, v132, 16);
  if (v39)
  {
    v40 = *(_QWORD *)v99;
    do
    {
      v41 = 0;
      do
      {
        if (*(_QWORD *)v99 != v40)
          objc_enumerationMutation(v38);
        v42 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v98 + 1) + 8 * v41), "copyWithZone:", a3);
        objc_msgSend(v5, "addSystem:", v42);

        ++v41;
      }
      while (v39 != v41);
      v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v98, v132, 16);
    }
    while (v39);
  }

  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  v43 = self->_transitIncidents;
  v44 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v94, v131, 16);
  if (v44)
  {
    v45 = *(_QWORD *)v95;
    do
    {
      v46 = 0;
      do
      {
        if (*(_QWORD *)v95 != v45)
          objc_enumerationMutation(v43);
        v47 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v94 + 1) + 8 * v46), "copyWithZone:", a3);
        objc_msgSend(v5, "addTransitIncident:", v47);

        ++v46;
      }
      while (v44 != v46);
      v44 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v94, v131, 16);
    }
    while (v44);
  }

  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  v48 = self->_halls;
  v49 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v48, "countByEnumeratingWithState:objects:count:", &v90, v130, 16);
  if (v49)
  {
    v50 = *(_QWORD *)v91;
    do
    {
      v51 = 0;
      do
      {
        if (*(_QWORD *)v91 != v50)
          objc_enumerationMutation(v48);
        v52 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v90 + 1) + 8 * v51), "copyWithZone:", a3);
        objc_msgSend(v5, "addHall:", v52);

        ++v51;
      }
      while (v49 != v51);
      v49 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v48, "countByEnumeratingWithState:objects:count:", &v90, v130, 16);
    }
    while (v49);
  }

  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  v53 = self->_artworks;
  v54 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v53, "countByEnumeratingWithState:objects:count:", &v86, v129, 16);
  if (v54)
  {
    v55 = *(_QWORD *)v87;
    do
    {
      v56 = 0;
      do
      {
        if (*(_QWORD *)v87 != v55)
          objc_enumerationMutation(v53);
        v57 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v86 + 1) + 8 * v56), "copyWithZone:", a3);
        objc_msgSend(v5, "addArtwork:", v57);

        ++v56;
      }
      while (v54 != v56);
      v54 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v53, "countByEnumeratingWithState:objects:count:", &v86, v129, 16);
    }
    while (v54);
  }

  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  v58 = self->_transitIncidentMessages;
  v59 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v82, v128, 16);
  if (v59)
  {
    v60 = *(_QWORD *)v83;
    do
    {
      v61 = 0;
      do
      {
        if (*(_QWORD *)v83 != v60)
          objc_enumerationMutation(v58);
        v62 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v82 + 1) + 8 * v61), "copyWithZone:", a3);
        objc_msgSend(v5, "addTransitIncidentMessage:", v62);

        ++v61;
      }
      while (v59 != v61);
      v59 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v82, v128, 16);
    }
    while (v59);
  }

  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  v63 = self->_steps;
  v64 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v63, "countByEnumeratingWithState:objects:count:", &v78, v127, 16);
  if (v64)
  {
    v65 = *(_QWORD *)v79;
    do
    {
      v66 = 0;
      do
      {
        if (*(_QWORD *)v79 != v65)
          objc_enumerationMutation(v63);
        v67 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v78 + 1) + 8 * v66), "copyWithZone:", a3);
        objc_msgSend(v5, "addStep:", v67);

        ++v66;
      }
      while (v64 != v66);
      v64 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v63, "countByEnumeratingWithState:objects:count:", &v78, v127, 16);
    }
    while (v64);
  }

  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  v68 = self->_paymentMethods;
  v69 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v68, "countByEnumeratingWithState:objects:count:", &v74, v126, 16);
  if (v69)
  {
    v70 = *(_QWORD *)v75;
    do
    {
      v71 = 0;
      do
      {
        if (*(_QWORD *)v75 != v70)
          objc_enumerationMutation(v68);
        v72 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * v71), "copyWithZone:", a3, (_QWORD)v74);
        objc_msgSend(v5, "addPaymentMethod:", v72);

        ++v71;
      }
      while (v69 != v71);
      v69 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v68, "countByEnumeratingWithState:objects:count:", &v74, v126, 16);
    }
    while (v69);
  }

  objc_storeStrong(v5 + 2, self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *stations;
  NSMutableArray *lines;
  NSMutableArray *accessPoints;
  NSMutableArray *walkings;
  NSMutableArray *stops;
  NSMutableArray *zilchPoints;
  NSMutableArray *systems;
  NSMutableArray *transitIncidents;
  NSMutableArray *halls;
  NSMutableArray *artworks;
  NSMutableArray *transitIncidentMessages;
  NSMutableArray *steps;
  NSMutableArray *paymentMethods;
  char v18;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_28;
  -[GEOTransitDecoderData readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  stations = self->_stations;
  if ((unint64_t)stations | v4[8])
  {
    if (!-[NSMutableArray isEqual:](stations, "isEqual:"))
      goto LABEL_28;
  }
  lines = self->_lines;
  if ((unint64_t)lines | v4[6] && !-[NSMutableArray isEqual:](lines, "isEqual:"))
    goto LABEL_28;
  accessPoints = self->_accessPoints;
  if ((unint64_t)accessPoints | v4[3] && !-[NSMutableArray isEqual:](accessPoints, "isEqual:"))
    goto LABEL_28;
  walkings = self->_walkings;
  if ((unint64_t)walkings | v4[14] && !-[NSMutableArray isEqual:](walkings, "isEqual:"))
    goto LABEL_28;
  stops = self->_stops;
  if ((unint64_t)stops | v4[10] && !-[NSMutableArray isEqual:](stops, "isEqual:"))
    goto LABEL_28;
  if (((zilchPoints = self->_zilchPoints, !((unint64_t)zilchPoints | v4[15]))
     || -[NSMutableArray isEqual:](zilchPoints, "isEqual:"))
    && ((systems = self->_systems, !((unint64_t)systems | v4[11]))
     || -[NSMutableArray isEqual:](systems, "isEqual:"))
    && ((transitIncidents = self->_transitIncidents, !((unint64_t)transitIncidents | v4[13]))
     || -[NSMutableArray isEqual:](transitIncidents, "isEqual:"))
    && ((halls = self->_halls, !((unint64_t)halls | v4[5]))
     || -[NSMutableArray isEqual:](halls, "isEqual:"))
    && ((artworks = self->_artworks, !((unint64_t)artworks | v4[4]))
     || -[NSMutableArray isEqual:](artworks, "isEqual:"))
    && ((transitIncidentMessages = self->_transitIncidentMessages, !((unint64_t)transitIncidentMessages | v4[12]))
     || -[NSMutableArray isEqual:](transitIncidentMessages, "isEqual:"))
    && ((steps = self->_steps, !((unint64_t)steps | v4[9]))
     || -[NSMutableArray isEqual:](steps, "isEqual:")))
  {
    paymentMethods = self->_paymentMethods;
    if ((unint64_t)paymentMethods | v4[7])
      v18 = -[NSMutableArray isEqual:](paymentMethods, "isEqual:");
    else
      v18 = 1;
  }
  else
  {
LABEL_28:
    v18 = 0;
  }

  return v18;
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
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  -[GEOTransitDecoderData readAll:](self, "readAll:", 1);
  v3 = -[NSMutableArray hash](self->_stations, "hash");
  v4 = -[NSMutableArray hash](self->_lines, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_accessPoints, "hash");
  v6 = v4 ^ v5 ^ -[NSMutableArray hash](self->_walkings, "hash");
  v7 = -[NSMutableArray hash](self->_stops, "hash");
  v8 = v7 ^ -[NSMutableArray hash](self->_zilchPoints, "hash");
  v9 = v6 ^ v8 ^ -[NSMutableArray hash](self->_systems, "hash");
  v10 = -[NSMutableArray hash](self->_transitIncidents, "hash");
  v11 = v10 ^ -[NSMutableArray hash](self->_halls, "hash");
  v12 = v11 ^ -[NSMutableArray hash](self->_artworks, "hash");
  v13 = v9 ^ v12 ^ -[NSMutableArray hash](self->_transitIncidentMessages, "hash");
  v14 = -[NSMutableArray hash](self->_steps, "hash");
  return v13 ^ v14 ^ -[NSMutableArray hash](self->_paymentMethods, "hash");
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
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  _BYTE v122[128];
  _BYTE v123[128];
  _BYTE v124[128];
  _BYTE v125[128];
  _BYTE v126[128];
  _BYTE v127[128];
  _BYTE v128[128];
  _BYTE v129[128];
  _BYTE v130[128];
  _BYTE v131[128];
  _BYTE v132[128];
  _BYTE v133[128];
  _BYTE v134[128];
  uint64_t v135;

  v135 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  objc_msgSend(v4, "readAll:", 0);
  v120 = 0u;
  v121 = 0u;
  v118 = 0u;
  v119 = 0u;
  v5 = v4[8];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v118, v134, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v119;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v119 != v8)
          objc_enumerationMutation(v5);
        -[GEOTransitDecoderData addStation:](self, "addStation:", *(_QWORD *)(*((_QWORD *)&v118 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v118, v134, 16);
    }
    while (v7);
  }

  v116 = 0u;
  v117 = 0u;
  v114 = 0u;
  v115 = 0u;
  v10 = v4[6];
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v114, v133, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v115;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v115 != v13)
          objc_enumerationMutation(v10);
        -[GEOTransitDecoderData addLine:](self, "addLine:", *(_QWORD *)(*((_QWORD *)&v114 + 1) + 8 * v14++));
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v114, v133, 16);
    }
    while (v12);
  }

  v112 = 0u;
  v113 = 0u;
  v110 = 0u;
  v111 = 0u;
  v15 = v4[3];
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v110, v132, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v111;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v111 != v18)
          objc_enumerationMutation(v15);
        -[GEOTransitDecoderData addAccessPoint:](self, "addAccessPoint:", *(_QWORD *)(*((_QWORD *)&v110 + 1) + 8 * v19++));
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v110, v132, 16);
    }
    while (v17);
  }

  v108 = 0u;
  v109 = 0u;
  v106 = 0u;
  v107 = 0u;
  v20 = v4[14];
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v106, v131, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v107;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v107 != v23)
          objc_enumerationMutation(v20);
        -[GEOTransitDecoderData addWalking:](self, "addWalking:", *(_QWORD *)(*((_QWORD *)&v106 + 1) + 8 * v24++));
      }
      while (v22 != v24);
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v106, v131, 16);
    }
    while (v22);
  }

  v104 = 0u;
  v105 = 0u;
  v102 = 0u;
  v103 = 0u;
  v25 = v4[10];
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v102, v130, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v103;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v103 != v28)
          objc_enumerationMutation(v25);
        -[GEOTransitDecoderData addStop:](self, "addStop:", *(_QWORD *)(*((_QWORD *)&v102 + 1) + 8 * v29++));
      }
      while (v27 != v29);
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v102, v130, 16);
    }
    while (v27);
  }

  v100 = 0u;
  v101 = 0u;
  v98 = 0u;
  v99 = 0u;
  v30 = v4[15];
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v98, v129, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v99;
    do
    {
      v34 = 0;
      do
      {
        if (*(_QWORD *)v99 != v33)
          objc_enumerationMutation(v30);
        -[GEOTransitDecoderData addZilchPoints:](self, "addZilchPoints:", *(_QWORD *)(*((_QWORD *)&v98 + 1) + 8 * v34++));
      }
      while (v32 != v34);
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v98, v129, 16);
    }
    while (v32);
  }

  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  v35 = v4[11];
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v94, v128, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v95;
    do
    {
      v39 = 0;
      do
      {
        if (*(_QWORD *)v95 != v38)
          objc_enumerationMutation(v35);
        -[GEOTransitDecoderData addSystem:](self, "addSystem:", *(_QWORD *)(*((_QWORD *)&v94 + 1) + 8 * v39++));
      }
      while (v37 != v39);
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v94, v128, 16);
    }
    while (v37);
  }

  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  v40 = v4[13];
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v90, v127, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v91;
    do
    {
      v44 = 0;
      do
      {
        if (*(_QWORD *)v91 != v43)
          objc_enumerationMutation(v40);
        -[GEOTransitDecoderData addTransitIncident:](self, "addTransitIncident:", *(_QWORD *)(*((_QWORD *)&v90 + 1) + 8 * v44++));
      }
      while (v42 != v44);
      v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v90, v127, 16);
    }
    while (v42);
  }

  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  v45 = v4[5];
  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v86, v126, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v87;
    do
    {
      v49 = 0;
      do
      {
        if (*(_QWORD *)v87 != v48)
          objc_enumerationMutation(v45);
        -[GEOTransitDecoderData addHall:](self, "addHall:", *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * v49++));
      }
      while (v47 != v49);
      v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v86, v126, 16);
    }
    while (v47);
  }

  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  v50 = v4[4];
  v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v82, v125, 16);
  if (v51)
  {
    v52 = v51;
    v53 = *(_QWORD *)v83;
    do
    {
      v54 = 0;
      do
      {
        if (*(_QWORD *)v83 != v53)
          objc_enumerationMutation(v50);
        -[GEOTransitDecoderData addArtwork:](self, "addArtwork:", *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * v54++));
      }
      while (v52 != v54);
      v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v82, v125, 16);
    }
    while (v52);
  }

  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  v55 = v4[12];
  v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v78, v124, 16);
  if (v56)
  {
    v57 = v56;
    v58 = *(_QWORD *)v79;
    do
    {
      v59 = 0;
      do
      {
        if (*(_QWORD *)v79 != v58)
          objc_enumerationMutation(v55);
        -[GEOTransitDecoderData addTransitIncidentMessage:](self, "addTransitIncidentMessage:", *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * v59++));
      }
      while (v57 != v59);
      v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v78, v124, 16);
    }
    while (v57);
  }

  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  v60 = v4[9];
  v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v74, v123, 16);
  if (v61)
  {
    v62 = v61;
    v63 = *(_QWORD *)v75;
    do
    {
      v64 = 0;
      do
      {
        if (*(_QWORD *)v75 != v63)
          objc_enumerationMutation(v60);
        -[GEOTransitDecoderData addStep:](self, "addStep:", *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * v64++));
      }
      while (v62 != v64);
      v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v74, v123, 16);
    }
    while (v62);
  }

  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v65 = v4[7];
  v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v70, v122, 16);
  if (v66)
  {
    v67 = v66;
    v68 = *(_QWORD *)v71;
    do
    {
      v69 = 0;
      do
      {
        if (*(_QWORD *)v71 != v68)
          objc_enumerationMutation(v65);
        -[GEOTransitDecoderData addPaymentMethod:](self, "addPaymentMethod:", *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * v69++), (_QWORD)v70);
      }
      while (v67 != v69);
      v67 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v70, v122, 16);
    }
    while (v67);
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOTransitDecoderDataReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_482);
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
  NSMutableArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSMutableArray *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSMutableArray *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSMutableArray *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSMutableArray *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSMutableArray *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  NSMutableArray *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  NSMutableArray *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
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
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  _BYTE v115[128];
  _BYTE v116[128];
  _BYTE v117[128];
  _BYTE v118[128];
  _BYTE v119[128];
  _BYTE v120[128];
  _BYTE v121[128];
  _BYTE v122[128];
  _BYTE v123[128];
  _BYTE v124[128];
  _BYTE v125[128];
  _BYTE v126[128];
  uint64_t v127;

  v3 = a3;
  v127 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x4001u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOTransitDecoderData readAll:](self, "readAll:", 0);
    v113 = 0u;
    v114 = 0u;
    v111 = 0u;
    v112 = 0u;
    v7 = self->_stations;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v111, v126, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v112;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v112 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v111 + 1) + 8 * v11++), "clearUnknownFields:", 1);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v111, v126, 16);
      }
      while (v9);
    }

    v109 = 0u;
    v110 = 0u;
    v107 = 0u;
    v108 = 0u;
    v12 = self->_lines;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v107, v125, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v108;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v108 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v107 + 1) + 8 * v16++), "clearUnknownFields:", 1);
        }
        while (v14 != v16);
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v107, v125, 16);
      }
      while (v14);
    }

    v105 = 0u;
    v106 = 0u;
    v103 = 0u;
    v104 = 0u;
    v17 = self->_accessPoints;
    v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v103, v124, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v104;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v104 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v103 + 1) + 8 * v21++), "clearUnknownFields:", 1);
        }
        while (v19 != v21);
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v103, v124, 16);
      }
      while (v19);
    }

    v101 = 0u;
    v102 = 0u;
    v99 = 0u;
    v100 = 0u;
    v22 = self->_walkings;
    v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v99, v123, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v100;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v100 != v25)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v99 + 1) + 8 * v26++), "clearUnknownFields:", 1);
        }
        while (v24 != v26);
        v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v99, v123, 16);
      }
      while (v24);
    }

    v97 = 0u;
    v98 = 0u;
    v95 = 0u;
    v96 = 0u;
    v27 = self->_stops;
    v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v95, v122, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v96;
      do
      {
        v31 = 0;
        do
        {
          if (*(_QWORD *)v96 != v30)
            objc_enumerationMutation(v27);
          objc_msgSend(*(id *)(*((_QWORD *)&v95 + 1) + 8 * v31++), "clearUnknownFields:", 1);
        }
        while (v29 != v31);
        v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v95, v122, 16);
      }
      while (v29);
    }

    v93 = 0u;
    v94 = 0u;
    v91 = 0u;
    v92 = 0u;
    v32 = self->_systems;
    v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v91, v121, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v92;
      do
      {
        v36 = 0;
        do
        {
          if (*(_QWORD *)v92 != v35)
            objc_enumerationMutation(v32);
          objc_msgSend(*(id *)(*((_QWORD *)&v91 + 1) + 8 * v36++), "clearUnknownFields:", 1);
        }
        while (v34 != v36);
        v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v91, v121, 16);
      }
      while (v34);
    }

    v89 = 0u;
    v90 = 0u;
    v87 = 0u;
    v88 = 0u;
    v37 = self->_transitIncidents;
    v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v87, v120, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v88;
      do
      {
        v41 = 0;
        do
        {
          if (*(_QWORD *)v88 != v40)
            objc_enumerationMutation(v37);
          -[GEOPBTransitIncident clearUnknownFields:](*(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * v41++), 1);
        }
        while (v39 != v41);
        v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v87, v120, 16);
      }
      while (v39);
    }

    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    v42 = self->_halls;
    v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v83, v119, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v84;
      do
      {
        v46 = 0;
        do
        {
          if (*(_QWORD *)v84 != v45)
            objc_enumerationMutation(v42);
          objc_msgSend(*(id *)(*((_QWORD *)&v83 + 1) + 8 * v46++), "clearUnknownFields:", 1);
        }
        while (v44 != v46);
        v44 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v83, v119, 16);
      }
      while (v44);
    }

    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    v47 = self->_artworks;
    v48 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v47, "countByEnumeratingWithState:objects:count:", &v79, v118, 16);
    if (v48)
    {
      v49 = v48;
      v50 = *(_QWORD *)v80;
      do
      {
        v51 = 0;
        do
        {
          if (*(_QWORD *)v80 != v50)
            objc_enumerationMutation(v47);
          objc_msgSend(*(id *)(*((_QWORD *)&v79 + 1) + 8 * v51++), "clearUnknownFields:", 1);
        }
        while (v49 != v51);
        v49 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v47, "countByEnumeratingWithState:objects:count:", &v79, v118, 16);
      }
      while (v49);
    }

    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    v52 = self->_transitIncidentMessages;
    v53 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v52, "countByEnumeratingWithState:objects:count:", &v75, v117, 16);
    if (v53)
    {
      v54 = v53;
      v55 = *(_QWORD *)v76;
      do
      {
        v56 = 0;
        do
        {
          if (*(_QWORD *)v76 != v55)
            objc_enumerationMutation(v52);
          -[GEOPBTransitRoutingIncidentMessage clearUnknownFields:](*(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * v56++), 1);
        }
        while (v54 != v56);
        v54 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v52, "countByEnumeratingWithState:objects:count:", &v75, v117, 16);
      }
      while (v54);
    }

    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v57 = self->_steps;
    v58 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v57, "countByEnumeratingWithState:objects:count:", &v71, v116, 16);
    if (v58)
    {
      v59 = v58;
      v60 = *(_QWORD *)v72;
      do
      {
        v61 = 0;
        do
        {
          if (*(_QWORD *)v72 != v60)
            objc_enumerationMutation(v57);
          objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * v61++), "clearUnknownFields:", 1);
        }
        while (v59 != v61);
        v59 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v57, "countByEnumeratingWithState:objects:count:", &v71, v116, 16);
      }
      while (v59);
    }

    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v62 = self->_paymentMethods;
    v63 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v62, "countByEnumeratingWithState:objects:count:", &v67, v115, 16);
    if (v63)
    {
      v64 = v63;
      v65 = *(_QWORD *)v68;
      do
      {
        v66 = 0;
        do
        {
          if (*(_QWORD *)v68 != v65)
            objc_enumerationMutation(v62);
          objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * v66++), "clearUnknownFields:", 1, (_QWORD)v67);
        }
        while (v64 != v66);
        v64 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v62, "countByEnumeratingWithState:objects:count:", &v67, v115, 16);
      }
      while (v64);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zilchPoints, 0);
  objc_storeStrong((id *)&self->_walkings, 0);
  objc_storeStrong((id *)&self->_transitIncidents, 0);
  objc_storeStrong((id *)&self->_transitIncidentMessages, 0);
  objc_storeStrong((id *)&self->_systems, 0);
  objc_storeStrong((id *)&self->_stops, 0);
  objc_storeStrong((id *)&self->_steps, 0);
  objc_storeStrong((id *)&self->_stations, 0);
  objc_storeStrong((id *)&self->_paymentMethods, 0);
  objc_storeStrong((id *)&self->_lines, 0);
  objc_storeStrong((id *)&self->_halls, 0);
  objc_storeStrong((id *)&self->_artworks, 0);
  objc_storeStrong((id *)&self->_accessPoints, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (id)artworkFromIndices:(unsigned int *)a3 count:(unint64_t)a4
{
  unint64_t v4;
  void *i;
  uint64_t v8;
  unsigned int v9;
  void *v10;

  v4 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a4);
  for (i = (void *)objc_claimAutoreleasedReturnValue(); v4; --v4)
  {
    v9 = *a3++;
    v8 = v9;
    if (-[GEOTransitDecoderData artworksCount](self, "artworksCount") > v9)
    {
      -[GEOTransitDecoderData artworkAtIndex:](self, "artworkAtIndex:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(i, "addObject:", v10);

    }
  }
  return i;
}

@end
