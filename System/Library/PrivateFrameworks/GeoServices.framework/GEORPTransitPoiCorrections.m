@implementation GEORPTransitPoiCorrections

- (GEORPTransitPoiCorrections)init
{
  GEORPTransitPoiCorrections *v2;
  GEORPTransitPoiCorrections *v3;
  GEORPTransitPoiCorrections *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPTransitPoiCorrections;
  v2 = -[GEORPTransitPoiCorrections init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPTransitPoiCorrections)initWithData:(id)a3
{
  GEORPTransitPoiCorrections *v3;
  GEORPTransitPoiCorrections *v4;
  GEORPTransitPoiCorrections *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPTransitPoiCorrections;
  v3 = -[GEORPTransitPoiCorrections initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPTransitPoiCorrectionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readName_tags_3128);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasName
{
  -[GEORPTransitPoiCorrections _readName]((uint64_t)self);
  return self->_name != 0;
}

- (NSString)name
{
  -[GEORPTransitPoiCorrections _readName]((uint64_t)self);
  return self->_name;
}

- (void)setName:(id)a3
{
  *(_WORD *)&self->_flags |= 0xA00u;
  objc_storeStrong((id *)&self->_name, a3);
}

- (void)_readAmenity
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPTransitPoiCorrectionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAmenity_tags_3129);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasAmenity
{
  -[GEORPTransitPoiCorrections _readAmenity]((uint64_t)self);
  return self->_amenity != 0;
}

- (GEORPAmenityCorrections)amenity
{
  -[GEORPTransitPoiCorrections _readAmenity]((uint64_t)self);
  return self->_amenity;
}

- (void)setAmenity:(id)a3
{
  *(_WORD *)&self->_flags |= 0x810u;
  objc_storeStrong((id *)&self->_amenity, a3);
}

- (void)_readBusinessHours
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPTransitPoiCorrectionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBusinessHours_tags_3130);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (NSMutableArray)businessHours
{
  -[GEORPTransitPoiCorrections _readBusinessHours]((uint64_t)self);
  return self->_businessHours;
}

- (void)setBusinessHours:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *businessHours;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  businessHours = self->_businessHours;
  self->_businessHours = v4;

}

- (void)clearBusinessHours
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  -[NSMutableArray removeAllObjects](self->_businessHours, "removeAllObjects");
}

- (void)addBusinessHours:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPTransitPoiCorrections _readBusinessHours]((uint64_t)self);
  -[GEORPTransitPoiCorrections _addNoFlagsBusinessHours:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
}

- (void)_addNoFlagsBusinessHours:(uint64_t)a1
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

- (unint64_t)businessHoursCount
{
  -[GEORPTransitPoiCorrections _readBusinessHours]((uint64_t)self);
  return -[NSMutableArray count](self->_businessHours, "count");
}

- (id)businessHoursAtIndex:(unint64_t)a3
{
  -[GEORPTransitPoiCorrections _readBusinessHours]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_businessHours, "objectAtIndex:", a3);
}

+ (Class)businessHoursType
{
  return (Class)objc_opt_class();
}

- (void)_readCoordinate
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPTransitPoiCorrectionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCoordinate_tags_3131);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasCoordinate
{
  -[GEORPTransitPoiCorrections _readCoordinate]((uint64_t)self);
  return self->_coordinate != 0;
}

- (GEORPCorrectedCoordinate)coordinate
{
  -[GEORPTransitPoiCorrections _readCoordinate]((uint64_t)self);
  return self->_coordinate;
}

- (void)setCoordinate:(id)a3
{
  *(_WORD *)&self->_flags |= 0x880u;
  objc_storeStrong((id *)&self->_coordinate, a3);
}

- (void)_readMapLocation
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPTransitPoiCorrectionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapLocation_tags_3132);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasMapLocation
{
  -[GEORPTransitPoiCorrections _readMapLocation]((uint64_t)self);
  return self->_mapLocation != 0;
}

- (GEORPMapLocation)mapLocation
{
  -[GEORPTransitPoiCorrections _readMapLocation]((uint64_t)self);
  return self->_mapLocation;
}

- (void)setMapLocation:(id)a3
{
  *(_WORD *)&self->_flags |= 0x900u;
  objc_storeStrong((id *)&self->_mapLocation, a3);
}

- (BOOL)lineShapeIncorrect
{
  return self->_lineShapeIncorrect;
}

- (void)setLineShapeIncorrect:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x802u;
  self->_lineShapeIncorrect = a3;
}

- (void)setHasLineShapeIncorrect:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2050;
  else
    v3 = 2048;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasLineShapeIncorrect
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (BOOL)lineScheduleDelay
{
  return self->_lineScheduleDelay;
}

- (void)setLineScheduleDelay:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x801u;
  self->_lineScheduleDelay = a3;
}

- (void)setHasLineScheduleDelay:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x800;
}

- (BOOL)hasLineScheduleDelay
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)_readAccessPoint
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPTransitPoiCorrectionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAccessPoint_tags_3133);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasAccessPoint
{
  -[GEORPTransitPoiCorrections _readAccessPoint]((uint64_t)self);
  return self->_accessPoint != 0;
}

- (GEORPAccessPointCorrections)accessPoint
{
  -[GEORPTransitPoiCorrections _readAccessPoint]((uint64_t)self);
  return self->_accessPoint;
}

- (void)setAccessPoint:(id)a3
{
  *(_WORD *)&self->_flags |= 0x808u;
  objc_storeStrong((id *)&self->_accessPoint, a3);
}

- (void)_readOriginalName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPTransitPoiCorrectionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOriginalName_tags_3134);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasOriginalName
{
  -[GEORPTransitPoiCorrections _readOriginalName]((uint64_t)self);
  return self->_originalName != 0;
}

- (NSString)originalName
{
  -[GEORPTransitPoiCorrections _readOriginalName]((uint64_t)self);
  return self->_originalName;
}

- (void)setOriginalName:(id)a3
{
  *(_WORD *)&self->_flags |= 0xC00u;
  objc_storeStrong((id *)&self->_originalName, a3);
}

- (void)_readContainmentCorrections
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPTransitPoiCorrectionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readContainmentCorrections_tags_3135);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasContainmentCorrections
{
  -[GEORPTransitPoiCorrections _readContainmentCorrections]((uint64_t)self);
  return self->_containmentCorrections != 0;
}

- (GEORPPlaceContainmentCorrections)containmentCorrections
{
  -[GEORPTransitPoiCorrections _readContainmentCorrections]((uint64_t)self);
  return self->_containmentCorrections;
}

- (void)setContainmentCorrections:(id)a3
{
  *(_WORD *)&self->_flags |= 0x840u;
  objc_storeStrong((id *)&self->_containmentCorrections, a3);
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
  v8.super_class = (Class)GEORPTransitPoiCorrections;
  -[GEORPTransitPoiCorrections description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPTransitPoiCorrections dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPTransitPoiCorrections _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  __int16 v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  _QWORD v47[4];
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("name"));

  objc_msgSend((id)a1, "amenity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v6, "jsonRepresentation");
    else
      objc_msgSend(v6, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("amenity"));

  }
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v10 = *(id *)(a1 + 40);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v50 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v15, "jsonRepresentation");
          else
            objc_msgSend(v15, "dictionaryRepresentation");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v16);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
      }
      while (v12);
    }

    if (a2)
      v17 = CFSTR("businessHours");
    else
      v17 = CFSTR("business_hours");
    objc_msgSend(v4, "setObject:forKey:", v9, v17);

  }
  objc_msgSend((id)a1, "coordinate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v18, "jsonRepresentation");
    else
      objc_msgSend(v18, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("coordinate"));

  }
  objc_msgSend((id)a1, "mapLocation");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v21, "jsonRepresentation");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = CFSTR("mapLocation");
    }
    else
    {
      objc_msgSend(v21, "dictionaryRepresentation");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = CFSTR("map_location");
    }
    objc_msgSend(v4, "setObject:forKey:", v23, v24);

  }
  v25 = *(_WORD *)(a1 + 104);
  if ((v25 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 101));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v27 = CFSTR("lineShapeIncorrect");
    else
      v27 = CFSTR("line_shape_incorrect");
    objc_msgSend(v4, "setObject:forKey:", v26, v27);

    v25 = *(_WORD *)(a1 + 104);
  }
  if ((v25 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 100));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v29 = CFSTR("lineScheduleDelay");
    else
      v29 = CFSTR("line_schedule_delay");
    objc_msgSend(v4, "setObject:forKey:", v28, v29);

  }
  objc_msgSend((id)a1, "accessPoint");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (v30)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v30, "jsonRepresentation");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = CFSTR("accessPoint");
    }
    else
    {
      objc_msgSend(v30, "dictionaryRepresentation");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = CFSTR("access_point");
    }
    objc_msgSend(v4, "setObject:forKey:", v32, v33);

  }
  objc_msgSend((id)a1, "originalName");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    if (a2)
      v35 = CFSTR("originalName");
    else
      v35 = CFSTR("original_name");
    objc_msgSend(v4, "setObject:forKey:", v34, v35);
  }

  objc_msgSend((id)a1, "containmentCorrections");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v36;
  if (v36)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v36, "jsonRepresentation");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = CFSTR("containmentCorrections");
    }
    else
    {
      objc_msgSend(v36, "dictionaryRepresentation");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = CFSTR("containment_corrections");
    }
    objc_msgSend(v4, "setObject:forKey:", v38, v39);

  }
  v40 = *(void **)(a1 + 16);
  if (v40)
  {
    objc_msgSend(v40, "dictionaryRepresentation");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v41;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v41, "count"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __56__GEORPTransitPoiCorrections__dictionaryRepresentation___block_invoke;
      v47[3] = &unk_1E1C00600;
      v44 = v43;
      v48 = v44;
      objc_msgSend(v42, "enumerateKeysAndObjectsUsingBlock:", v47);
      v45 = v44;

      v42 = v45;
    }
    objc_msgSend(v4, "setObject:forKey:", v42, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPTransitPoiCorrections _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __56__GEORPTransitPoiCorrections__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPTransitPoiCorrections)initWithDictionary:(id)a3
{
  return (GEORPTransitPoiCorrections *)-[GEORPTransitPoiCorrections _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  GEORPAmenityCorrections *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  GEORPFeedbackBusinessHours *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  GEORPCorrectedCoordinate *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  GEORPMapLocation *v29;
  uint64_t v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  GEORPAccessPointCorrections *v38;
  uint64_t v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  GEORPPlaceContainmentCorrections *v46;
  uint64_t v47;
  void *v48;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("name"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = (void *)objc_msgSend(v6, "copy");
        objc_msgSend(a1, "setName:", v7);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("amenity"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = [GEORPAmenityCorrections alloc];
        if ((a3 & 1) != 0)
          v10 = -[GEORPAmenityCorrections initWithJSON:](v9, "initWithJSON:", v8);
        else
          v10 = -[GEORPAmenityCorrections initWithDictionary:](v9, "initWithDictionary:", v8);
        v11 = (void *)v10;
        objc_msgSend(a1, "setAmenity:", v10);

      }
      if (a3)
        v12 = CFSTR("businessHours");
      else
        v12 = CFSTR("business_hours");
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v50 = v5;
        v53 = 0u;
        v54 = 0u;
        v51 = 0u;
        v52 = 0u;
        v14 = v13;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v52;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v52 != v17)
                objc_enumerationMutation(v14);
              v19 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v20 = [GEORPFeedbackBusinessHours alloc];
                if ((a3 & 1) != 0)
                  v21 = -[GEORPFeedbackBusinessHours initWithJSON:](v20, "initWithJSON:", v19);
                else
                  v21 = -[GEORPFeedbackBusinessHours initWithDictionary:](v20, "initWithDictionary:", v19);
                v22 = (void *)v21;
                objc_msgSend(a1, "addBusinessHours:", v21);

              }
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
          }
          while (v16);
        }

        v5 = v50;
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("coordinate"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v24 = [GEORPCorrectedCoordinate alloc];
        if ((a3 & 1) != 0)
          v25 = -[GEORPCorrectedCoordinate initWithJSON:](v24, "initWithJSON:", v23);
        else
          v25 = -[GEORPCorrectedCoordinate initWithDictionary:](v24, "initWithDictionary:", v23);
        v26 = (void *)v25;
        objc_msgSend(a1, "setCoordinate:", v25);

      }
      if (a3)
        v27 = CFSTR("mapLocation");
      else
        v27 = CFSTR("map_location");
      objc_msgSend(v5, "objectForKeyedSubscript:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v29 = [GEORPMapLocation alloc];
        if ((a3 & 1) != 0)
          v30 = -[GEORPMapLocation initWithJSON:](v29, "initWithJSON:", v28);
        else
          v30 = -[GEORPMapLocation initWithDictionary:](v29, "initWithDictionary:", v28);
        v31 = (void *)v30;
        objc_msgSend(a1, "setMapLocation:", v30);

      }
      if (a3)
        v32 = CFSTR("lineShapeIncorrect");
      else
        v32 = CFSTR("line_shape_incorrect");
      objc_msgSend(v5, "objectForKeyedSubscript:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setLineShapeIncorrect:", objc_msgSend(v33, "BOOLValue"));

      if (a3)
        v34 = CFSTR("lineScheduleDelay");
      else
        v34 = CFSTR("line_schedule_delay");
      objc_msgSend(v5, "objectForKeyedSubscript:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setLineScheduleDelay:", objc_msgSend(v35, "BOOLValue"));

      if (a3)
        v36 = CFSTR("accessPoint");
      else
        v36 = CFSTR("access_point");
      objc_msgSend(v5, "objectForKeyedSubscript:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v38 = [GEORPAccessPointCorrections alloc];
        if ((a3 & 1) != 0)
          v39 = -[GEORPAccessPointCorrections initWithJSON:](v38, "initWithJSON:", v37);
        else
          v39 = -[GEORPAccessPointCorrections initWithDictionary:](v38, "initWithDictionary:", v37);
        v40 = (void *)v39;
        objc_msgSend(a1, "setAccessPoint:", v39);

      }
      if (a3)
        v41 = CFSTR("originalName");
      else
        v41 = CFSTR("original_name");
      objc_msgSend(v5, "objectForKeyedSubscript:", v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v43 = (void *)objc_msgSend(v42, "copy");
        objc_msgSend(a1, "setOriginalName:", v43);

      }
      if (a3)
        v44 = CFSTR("containmentCorrections");
      else
        v44 = CFSTR("containment_corrections");
      objc_msgSend(v5, "objectForKeyedSubscript:", v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v46 = [GEORPPlaceContainmentCorrections alloc];
        if ((a3 & 1) != 0)
          v47 = -[GEORPPlaceContainmentCorrections initWithJSON:](v46, "initWithJSON:", v45);
        else
          v47 = -[GEORPPlaceContainmentCorrections initWithDictionary:](v46, "initWithDictionary:", v45);
        v48 = (void *)v47;
        objc_msgSend(a1, "setContainmentCorrections:", v47);

      }
    }
  }

  return a1;
}

- (GEORPTransitPoiCorrections)initWithJSON:(id)a3
{
  return (GEORPTransitPoiCorrections *)-[GEORPTransitPoiCorrections _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_3144;
    else
      v8 = (int *)&readAll__nonRecursiveTag_3145;
    GEORPTransitPoiCorrectionsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEORPTransitPoiCorrectionsCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPTransitPoiCorrectionsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPTransitPoiCorrectionsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int16 flags;
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
  if (self->_reader && (_GEORPTransitPoiCorrectionsIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEORPTransitPoiCorrections readAll:](self, "readAll:", 0);
    if (self->_name)
      PBDataWriterWriteStringField();
    if (self->_amenity)
      PBDataWriterWriteSubmessage();
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = self->_businessHours;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

    if (self->_coordinate)
      PBDataWriterWriteSubmessage();
    if (self->_mapLocation)
      PBDataWriterWriteSubmessage();
    flags = (__int16)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteBOOLField();
      flags = (__int16)self->_flags;
    }
    if ((flags & 1) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_accessPoint)
      PBDataWriterWriteSubmessage();
    if (self->_originalName)
      PBDataWriterWriteStringField();
    if (self->_containmentCorrections)
      PBDataWriterWriteSubmessage();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v13);
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEORPTransitPoiCorrections _readAccessPoint]((uint64_t)self);
  if (-[GEORPAccessPointCorrections hasGreenTeaWithValue:](self->_accessPoint, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEORPTransitPoiCorrections _readCoordinate]((uint64_t)self);
  if (-[GEORPCorrectedCoordinate hasGreenTeaWithValue:](self->_coordinate, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEORPTransitPoiCorrections _readMapLocation]((uint64_t)self);
  return -[GEORPMapLocation hasGreenTeaWithValue:](self->_mapLocation, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id *v8;
  __int16 flags;
  id *v10;

  v10 = (id *)a3;
  -[GEORPTransitPoiCorrections readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v10 + 1, self->_reader);
  *((_DWORD *)v10 + 22) = self->_readerMarkPos;
  *((_DWORD *)v10 + 23) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_name)
    objc_msgSend(v10, "setName:");
  if (self->_amenity)
    objc_msgSend(v10, "setAmenity:");
  if (-[GEORPTransitPoiCorrections businessHoursCount](self, "businessHoursCount"))
  {
    objc_msgSend(v10, "clearBusinessHours");
    v4 = -[GEORPTransitPoiCorrections businessHoursCount](self, "businessHoursCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEORPTransitPoiCorrections businessHoursAtIndex:](self, "businessHoursAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addBusinessHours:", v7);

      }
    }
  }
  if (self->_coordinate)
    objc_msgSend(v10, "setCoordinate:");
  v8 = v10;
  if (self->_mapLocation)
  {
    objc_msgSend(v10, "setMapLocation:");
    v8 = v10;
  }
  flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_BYTE *)v8 + 101) = self->_lineShapeIncorrect;
    *((_WORD *)v8 + 52) |= 2u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *((_BYTE *)v8 + 100) = self->_lineScheduleDelay;
    *((_WORD *)v8 + 52) |= 1u;
  }
  if (self->_accessPoint)
  {
    objc_msgSend(v10, "setAccessPoint:");
    v8 = v10;
  }
  if (self->_originalName)
  {
    objc_msgSend(v10, "setOriginalName:");
    v8 = v10;
  }
  if (self->_containmentCorrections)
  {
    objc_msgSend(v10, "setContainmentCorrections:");
    v8 = v10;
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
  id v11;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  __int16 flags;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  PBUnknownFields *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x800) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEORPTransitPoiCorrectionsReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_17;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPTransitPoiCorrections readAll:](self, "readAll:", 0);
  v9 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v9;

  v11 = -[GEORPAmenityCorrections copyWithZone:](self->_amenity, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v11;

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v13 = self->_businessHours;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v32 != v15)
          objc_enumerationMutation(v13);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v31);
        objc_msgSend((id)v5, "addBusinessHours:", v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v14);
  }

  v18 = -[GEORPCorrectedCoordinate copyWithZone:](self->_coordinate, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v18;

  v20 = -[GEORPMapLocation copyWithZone:](self->_mapLocation, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v20;

  flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_BYTE *)(v5 + 101) = self->_lineShapeIncorrect;
    *(_WORD *)(v5 + 104) |= 2u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *(_BYTE *)(v5 + 100) = self->_lineScheduleDelay;
    *(_WORD *)(v5 + 104) |= 1u;
  }
  v23 = -[GEORPAccessPointCorrections copyWithZone:](self->_accessPoint, "copyWithZone:", a3, (_QWORD)v31);
  v24 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v23;

  v25 = -[NSString copyWithZone:](self->_originalName, "copyWithZone:", a3);
  v26 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v25;

  v27 = -[GEORPPlaceContainmentCorrections copyWithZone:](self->_containmentCorrections, "copyWithZone:", a3);
  v28 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v27;

  v29 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v29;
LABEL_17:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *name;
  GEORPAmenityCorrections *amenity;
  NSMutableArray *businessHours;
  GEORPCorrectedCoordinate *coordinate;
  GEORPMapLocation *mapLocation;
  __int16 flags;
  __int16 v11;
  GEORPAccessPointCorrections *accessPoint;
  NSString *originalName;
  GEORPPlaceContainmentCorrections *containmentCorrections;
  char v15;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_34;
  -[GEORPTransitPoiCorrections readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](name, "isEqual:"))
      goto LABEL_34;
  }
  amenity = self->_amenity;
  if ((unint64_t)amenity | *((_QWORD *)v4 + 4))
  {
    if (!-[GEORPAmenityCorrections isEqual:](amenity, "isEqual:"))
      goto LABEL_34;
  }
  businessHours = self->_businessHours;
  if ((unint64_t)businessHours | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](businessHours, "isEqual:"))
      goto LABEL_34;
  }
  coordinate = self->_coordinate;
  if ((unint64_t)coordinate | *((_QWORD *)v4 + 7))
  {
    if (!-[GEORPCorrectedCoordinate isEqual:](coordinate, "isEqual:"))
      goto LABEL_34;
  }
  mapLocation = self->_mapLocation;
  if ((unint64_t)mapLocation | *((_QWORD *)v4 + 8))
  {
    if (!-[GEORPMapLocation isEqual:](mapLocation, "isEqual:"))
      goto LABEL_34;
  }
  flags = (__int16)self->_flags;
  v11 = *((_WORD *)v4 + 52);
  if ((flags & 2) != 0)
  {
    if ((v11 & 2) == 0)
      goto LABEL_34;
    if (self->_lineShapeIncorrect)
    {
      if (!*((_BYTE *)v4 + 101))
        goto LABEL_34;
    }
    else if (*((_BYTE *)v4 + 101))
    {
      goto LABEL_34;
    }
  }
  else if ((v11 & 2) != 0)
  {
    goto LABEL_34;
  }
  if ((flags & 1) != 0)
  {
    if ((v11 & 1) != 0)
    {
      if (self->_lineScheduleDelay)
      {
        if (!*((_BYTE *)v4 + 100))
          goto LABEL_34;
        goto LABEL_28;
      }
      if (!*((_BYTE *)v4 + 100))
        goto LABEL_28;
    }
LABEL_34:
    v15 = 0;
    goto LABEL_35;
  }
  if ((v11 & 1) != 0)
    goto LABEL_34;
LABEL_28:
  accessPoint = self->_accessPoint;
  if ((unint64_t)accessPoint | *((_QWORD *)v4 + 3)
    && !-[GEORPAccessPointCorrections isEqual:](accessPoint, "isEqual:"))
  {
    goto LABEL_34;
  }
  originalName = self->_originalName;
  if ((unint64_t)originalName | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](originalName, "isEqual:"))
      goto LABEL_34;
  }
  containmentCorrections = self->_containmentCorrections;
  if ((unint64_t)containmentCorrections | *((_QWORD *)v4 + 6))
    v15 = -[GEORPPlaceContainmentCorrections isEqual:](containmentCorrections, "isEqual:");
  else
    v15 = 1;
LABEL_35:

  return v15;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  __int16 flags;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  NSUInteger v13;

  -[GEORPTransitPoiCorrections readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_name, "hash");
  v4 = -[GEORPAmenityCorrections hash](self->_amenity, "hash");
  v5 = -[NSMutableArray hash](self->_businessHours, "hash");
  v6 = -[GEORPCorrectedCoordinate hash](self->_coordinate, "hash");
  v7 = -[GEORPMapLocation hash](self->_mapLocation, "hash");
  flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    v9 = 2654435761 * self->_lineShapeIncorrect;
    if ((flags & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v10 = 0;
    goto LABEL_6;
  }
  v9 = 0;
  if ((flags & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v10 = 2654435761 * self->_lineScheduleDelay;
LABEL_6:
  v11 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v9 ^ v10;
  v12 = -[GEORPAccessPointCorrections hash](self->_accessPoint, "hash");
  v13 = v12 ^ -[NSString hash](self->_originalName, "hash");
  return v11 ^ v13 ^ -[GEORPPlaceContainmentCorrections hash](self->_containmentCorrections, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  GEORPAmenityCorrections *amenity;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  GEORPCorrectedCoordinate *coordinate;
  uint64_t v13;
  GEORPMapLocation *mapLocation;
  uint64_t v15;
  __int16 v16;
  GEORPAccessPointCorrections *accessPoint;
  uint64_t v18;
  GEORPPlaceContainmentCorrections *containmentCorrections;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if (*((_QWORD *)v4 + 9))
    -[GEORPTransitPoiCorrections setName:](self, "setName:");
  amenity = self->_amenity;
  v6 = *((_QWORD *)v4 + 4);
  if (amenity)
  {
    if (v6)
      -[GEORPAmenityCorrections mergeFrom:](amenity, "mergeFrom:");
  }
  else if (v6)
  {
    -[GEORPTransitPoiCorrections setAmenity:](self, "setAmenity:");
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = *((id *)v4 + 5);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        -[GEORPTransitPoiCorrections addBusinessHours:](self, "addBusinessHours:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i), (_QWORD)v21);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v9);
  }

  coordinate = self->_coordinate;
  v13 = *((_QWORD *)v4 + 7);
  if (coordinate)
  {
    if (v13)
      -[GEORPCorrectedCoordinate mergeFrom:](coordinate, "mergeFrom:");
  }
  else if (v13)
  {
    -[GEORPTransitPoiCorrections setCoordinate:](self, "setCoordinate:");
  }
  mapLocation = self->_mapLocation;
  v15 = *((_QWORD *)v4 + 8);
  if (mapLocation)
  {
    if (v15)
      -[GEORPMapLocation mergeFrom:](mapLocation, "mergeFrom:");
  }
  else if (v15)
  {
    -[GEORPTransitPoiCorrections setMapLocation:](self, "setMapLocation:");
  }
  v16 = *((_WORD *)v4 + 52);
  if ((v16 & 2) != 0)
  {
    self->_lineShapeIncorrect = *((_BYTE *)v4 + 101);
    *(_WORD *)&self->_flags |= 2u;
    v16 = *((_WORD *)v4 + 52);
  }
  if ((v16 & 1) != 0)
  {
    self->_lineScheduleDelay = *((_BYTE *)v4 + 100);
    *(_WORD *)&self->_flags |= 1u;
  }
  accessPoint = self->_accessPoint;
  v18 = *((_QWORD *)v4 + 3);
  if (accessPoint)
  {
    if (v18)
      -[GEORPAccessPointCorrections mergeFrom:](accessPoint, "mergeFrom:");
  }
  else if (v18)
  {
    -[GEORPTransitPoiCorrections setAccessPoint:](self, "setAccessPoint:");
  }
  if (*((_QWORD *)v4 + 10))
    -[GEORPTransitPoiCorrections setOriginalName:](self, "setOriginalName:");
  containmentCorrections = self->_containmentCorrections;
  v20 = *((_QWORD *)v4 + 6);
  if (containmentCorrections)
  {
    if (v20)
      -[GEORPPlaceContainmentCorrections mergeFrom:](containmentCorrections, "mergeFrom:");
  }
  else if (v20)
  {
    -[GEORPTransitPoiCorrections setContainmentCorrections:](self, "setContainmentCorrections:");
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
      GEORPTransitPoiCorrectionsReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_3148);
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

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x804u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEORPTransitPoiCorrections readAll:](self, "readAll:", 0);
    -[GEORPAccessPointCorrections clearUnknownFields:](self->_accessPoint, "clearUnknownFields:", 1);
    -[GEORPPlaceContainmentCorrections clearUnknownFields:](self->_containmentCorrections, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_mapLocation, 0);
  objc_storeStrong((id *)&self->_coordinate, 0);
  objc_storeStrong((id *)&self->_containmentCorrections, 0);
  objc_storeStrong((id *)&self->_businessHours, 0);
  objc_storeStrong((id *)&self->_amenity, 0);
  objc_storeStrong((id *)&self->_accessPoint, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
