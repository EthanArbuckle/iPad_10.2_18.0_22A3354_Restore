@implementation GEOOriginalRouteLeg

- (GEOOriginalRouteLeg)init
{
  GEOOriginalRouteLeg *v2;
  GEOOriginalRouteLeg *v3;
  GEOOriginalRouteLeg *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOOriginalRouteLeg;
  v2 = -[GEOOriginalRouteLeg init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOOriginalRouteLeg)initWithData:(id)a3
{
  GEOOriginalRouteLeg *v3;
  GEOOriginalRouteLeg *v4;
  GEOOriginalRouteLeg *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOOriginalRouteLeg;
  v3 = -[GEOOriginalRouteLeg initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readZilchPoints
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
        GEOOriginalRouteLegReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readZilchPoints_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasZilchPoints
{
  -[GEOOriginalRouteLeg _readZilchPoints]((uint64_t)self);
  return self->_zilchPoints != 0;
}

- (NSData)zilchPoints
{
  -[GEOOriginalRouteLeg _readZilchPoints]((uint64_t)self);
  return self->_zilchPoints;
}

- (void)setZilchPoints:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_zilchPoints, a3);
}

- (void)_readPathLeg
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
        GEOOriginalRouteLegReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPathLeg_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasPathLeg
{
  -[GEOOriginalRouteLeg _readPathLeg]((uint64_t)self);
  return self->_pathLeg != 0;
}

- (NSData)pathLeg
{
  -[GEOOriginalRouteLeg _readPathLeg]((uint64_t)self);
  return self->_pathLeg;
}

- (void)setPathLeg:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_pathLeg, a3);
}

- (void)_readEvStateInfo
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
        GEOOriginalRouteLegReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEvStateInfo_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasEvStateInfo
{
  -[GEOOriginalRouteLeg _readEvStateInfo]((uint64_t)self);
  return self->_evStateInfo != 0;
}

- (GEOEVStateInfo)evStateInfo
{
  -[GEOOriginalRouteLeg _readEvStateInfo]((uint64_t)self);
  return self->_evStateInfo;
}

- (void)setEvStateInfo:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x88u;
  objc_storeStrong((id *)&self->_evStateInfo, a3);
}

- (void)_readOriginWaypointInfo
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
        GEOOriginalRouteLegReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOriginWaypointInfo_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasOriginWaypointInfo
{
  -[GEOOriginalRouteLeg _readOriginWaypointInfo]((uint64_t)self);
  return self->_originWaypointInfo != 0;
}

- (GEOWaypointInfo)originWaypointInfo
{
  -[GEOOriginalRouteLeg _readOriginWaypointInfo]((uint64_t)self);
  return self->_originWaypointInfo;
}

- (void)setOriginWaypointInfo:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x90u;
  objc_storeStrong((id *)&self->_originWaypointInfo, a3);
}

- (void)_readDestinationWaypointInfo
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
        GEOOriginalRouteLegReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDestinationWaypointInfo_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasDestinationWaypointInfo
{
  -[GEOOriginalRouteLeg _readDestinationWaypointInfo]((uint64_t)self);
  return self->_destinationWaypointInfo != 0;
}

- (GEOWaypointInfo)destinationWaypointInfo
{
  -[GEOOriginalRouteLeg _readDestinationWaypointInfo]((uint64_t)self);
  return self->_destinationWaypointInfo;
}

- (void)setDestinationWaypointInfo:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x84u;
  objc_storeStrong((id *)&self->_destinationWaypointInfo, a3);
}

- (unint64_t)encryptedTourMuid
{
  return self->_encryptedTourMuid;
}

- (void)setEncryptedTourMuid:(unint64_t)a3
{
  *(_BYTE *)&self->_flags |= 0x81u;
  self->_encryptedTourMuid = a3;
}

- (void)setHasEncryptedTourMuid:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0x7E | a3 | 0x80;
}

- (BOOL)hasEncryptedTourMuid
{
  return *(_BYTE *)&self->_flags & 1;
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
  v8.super_class = (Class)GEOOriginalRouteLeg;
  -[GEOOriginalRouteLeg description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOOriginalRouteLeg dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOOriginalRouteLeg _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  _QWORD v32[4];
  id v33;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "zilchPoints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("zilchPoints"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("zilch_points"));
    }
  }

  objc_msgSend((id)a1, "pathLeg");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v8, "base64EncodedStringWithOptions:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("pathLeg"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("path_leg"));
    }
  }

  objc_msgSend((id)a1, "evStateInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v11, "jsonRepresentation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("evStateInfo");
    }
    else
    {
      objc_msgSend(v11, "dictionaryRepresentation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("ev_state_info");
    }
    objc_msgSend(v4, "setObject:forKey:", v13, v14);

  }
  objc_msgSend((id)a1, "originWaypointInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v15, "jsonRepresentation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = CFSTR("originWaypointInfo");
    }
    else
    {
      objc_msgSend(v15, "dictionaryRepresentation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = CFSTR("origin_waypoint_info");
    }
    objc_msgSend(v4, "setObject:forKey:", v17, v18);

  }
  objc_msgSend((id)a1, "destinationWaypointInfo");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v19, "jsonRepresentation");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = CFSTR("destinationWaypointInfo");
    }
    else
    {
      objc_msgSend(v19, "dictionaryRepresentation");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = CFSTR("destination_waypoint_info");
    }
    objc_msgSend(v4, "setObject:forKey:", v21, v22);

  }
  if ((*(_BYTE *)(a1 + 84) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 32));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v24 = CFSTR("encryptedTourMuid");
    else
      v24 = CFSTR("encrypted_tour_muid");
    objc_msgSend(v4, "setObject:forKey:", v23, v24);

  }
  v25 = *(void **)(a1 + 16);
  if (v25)
  {
    objc_msgSend(v25, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v26, "count"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __49__GEOOriginalRouteLeg__dictionaryRepresentation___block_invoke;
      v32[3] = &unk_1E1C00600;
      v29 = v28;
      v33 = v29;
      objc_msgSend(v27, "enumerateKeysAndObjectsUsingBlock:", v32);
      v30 = v29;

      v27 = v30;
    }
    objc_msgSend(v4, "setObject:forKey:", v27, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOOriginalRouteLeg _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __49__GEOOriginalRouteLeg__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOOriginalRouteLeg)initWithDictionary:(id)a3
{
  return (GEOOriginalRouteLeg *)-[GEOOriginalRouteLeg _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  GEOEVStateInfo *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  GEOWaypointInfo *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  GEOWaypointInfo *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  void *v28;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("zilchPoints");
      else
        v6 = CFSTR("zilch_points");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v7, 0);
        objc_msgSend(a1, "setZilchPoints:", v8);

      }
      if (a3)
        v9 = CFSTR("pathLeg");
      else
        v9 = CFSTR("path_leg");
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v10, 0);
        objc_msgSend(a1, "setPathLeg:", v11);

      }
      if (a3)
        v12 = CFSTR("evStateInfo");
      else
        v12 = CFSTR("ev_state_info");
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = [GEOEVStateInfo alloc];
        if ((a3 & 1) != 0)
          v15 = -[GEOEVStateInfo initWithJSON:](v14, "initWithJSON:", v13);
        else
          v15 = -[GEOEVStateInfo initWithDictionary:](v14, "initWithDictionary:", v13);
        v16 = (void *)v15;
        objc_msgSend(a1, "setEvStateInfo:", v15);

      }
      if (a3)
        v17 = CFSTR("originWaypointInfo");
      else
        v17 = CFSTR("origin_waypoint_info");
      objc_msgSend(v5, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v19 = [GEOWaypointInfo alloc];
        if ((a3 & 1) != 0)
          v20 = -[GEOWaypointInfo initWithJSON:](v19, "initWithJSON:", v18);
        else
          v20 = -[GEOWaypointInfo initWithDictionary:](v19, "initWithDictionary:", v18);
        v21 = (void *)v20;
        objc_msgSend(a1, "setOriginWaypointInfo:", v20);

      }
      if (a3)
        v22 = CFSTR("destinationWaypointInfo");
      else
        v22 = CFSTR("destination_waypoint_info");
      objc_msgSend(v5, "objectForKeyedSubscript:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v24 = [GEOWaypointInfo alloc];
        if ((a3 & 1) != 0)
          v25 = -[GEOWaypointInfo initWithJSON:](v24, "initWithJSON:", v23);
        else
          v25 = -[GEOWaypointInfo initWithDictionary:](v24, "initWithDictionary:", v23);
        v26 = (void *)v25;
        objc_msgSend(a1, "setDestinationWaypointInfo:", v25);

      }
      if (a3)
        v27 = CFSTR("encryptedTourMuid");
      else
        v27 = CFSTR("encrypted_tour_muid");
      objc_msgSend(v5, "objectForKeyedSubscript:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setEncryptedTourMuid:", objc_msgSend(v28, "unsignedLongLongValue"));

    }
  }

  return a1;
}

- (GEOOriginalRouteLeg)initWithJSON:(id)a3
{
  return (GEOOriginalRouteLeg *)-[GEOOriginalRouteLeg _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_3373;
    else
      v8 = (int *)&readAll__nonRecursiveTag_3374;
    GEOOriginalRouteLegReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEOEVStateInfo readAll:](self->_evStateInfo, "readAll:", 1);
    -[GEOWaypointInfo readAll:](self->_originWaypointInfo, "readAll:", 1);
    -[GEOWaypointInfo readAll:](self->_destinationWaypointInfo, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOOriginalRouteLegIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOOriginalRouteLegReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  PBDataReader *v6;
  void *v7;
  id v8;

  v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOOriginalRouteLegIsDirty((uint64_t)self) & 1) == 0)
  {
    v6 = self->_reader;
    objc_sync_enter(v6);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "writeData:", v7);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOOriginalRouteLeg readAll:](self, "readAll:", 0);
    if (self->_zilchPoints)
      PBDataWriterWriteDataField();
    v5 = v8;
    if (self->_pathLeg)
    {
      PBDataWriterWriteDataField();
      v5 = v8;
    }
    if (self->_evStateInfo)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_originWaypointInfo)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_destinationWaypointInfo)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if ((*(_BYTE *)&self->_flags & 1) != 0)
    {
      PBDataWriterWriteUint64Field();
      v5 = v8;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEOOriginalRouteLeg _readDestinationWaypointInfo]((uint64_t)self);
  if (-[GEOWaypointInfo hasGreenTeaWithValue:](self->_destinationWaypointInfo, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOOriginalRouteLeg _readOriginWaypointInfo]((uint64_t)self);
  return -[GEOWaypointInfo hasGreenTeaWithValue:](self->_originWaypointInfo, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEOOriginalRouteLeg readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 18) = self->_readerMarkPos;
  *((_DWORD *)v5 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_zilchPoints)
    objc_msgSend(v5, "setZilchPoints:");
  if (self->_pathLeg)
    objc_msgSend(v5, "setPathLeg:");
  v4 = v5;
  if (self->_evStateInfo)
  {
    objc_msgSend(v5, "setEvStateInfo:");
    v4 = v5;
  }
  if (self->_originWaypointInfo)
  {
    objc_msgSend(v5, "setOriginWaypointInfo:");
    v4 = v5;
  }
  if (self->_destinationWaypointInfo)
  {
    objc_msgSend(v5, "setDestinationWaypointInfo:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v4[4] = (id)self->_encryptedTourMuid;
    *((_BYTE *)v4 + 84) |= 1u;
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
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  PBUnknownFields *v19;

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
      GEOOriginalRouteLegReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOOriginalRouteLeg readAll:](self, "readAll:", 0);
  v9 = -[NSData copyWithZone:](self->_zilchPoints, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v9;

  v11 = -[NSData copyWithZone:](self->_pathLeg, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v11;

  v13 = -[GEOEVStateInfo copyWithZone:](self->_evStateInfo, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v13;

  v15 = -[GEOWaypointInfo copyWithZone:](self->_originWaypointInfo, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v15;

  v17 = -[GEOWaypointInfo copyWithZone:](self->_destinationWaypointInfo, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v17;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 32) = self->_encryptedTourMuid;
    *(_BYTE *)(v5 + 84) |= 1u;
  }
  v19 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v19;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *zilchPoints;
  NSData *pathLeg;
  GEOEVStateInfo *evStateInfo;
  GEOWaypointInfo *originWaypointInfo;
  GEOWaypointInfo *destinationWaypointInfo;
  BOOL v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  -[GEOOriginalRouteLeg readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  zilchPoints = self->_zilchPoints;
  if ((unint64_t)zilchPoints | *((_QWORD *)v4 + 8))
  {
    if (!-[NSData isEqual:](zilchPoints, "isEqual:"))
      goto LABEL_16;
  }
  pathLeg = self->_pathLeg;
  if ((unint64_t)pathLeg | *((_QWORD *)v4 + 7))
  {
    if (!-[NSData isEqual:](pathLeg, "isEqual:"))
      goto LABEL_16;
  }
  evStateInfo = self->_evStateInfo;
  if ((unint64_t)evStateInfo | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOEVStateInfo isEqual:](evStateInfo, "isEqual:"))
      goto LABEL_16;
  }
  originWaypointInfo = self->_originWaypointInfo;
  if ((unint64_t)originWaypointInfo | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOWaypointInfo isEqual:](originWaypointInfo, "isEqual:"))
      goto LABEL_16;
  }
  destinationWaypointInfo = self->_destinationWaypointInfo;
  if ((unint64_t)destinationWaypointInfo | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOWaypointInfo isEqual:](destinationWaypointInfo, "isEqual:"))
      goto LABEL_16;
  }
  v10 = (*((_BYTE *)v4 + 84) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 84) & 1) != 0 && self->_encryptedTourMuid == *((_QWORD *)v4 + 4))
    {
      v10 = 1;
      goto LABEL_17;
    }
LABEL_16:
    v10 = 0;
  }
LABEL_17:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  -[GEOOriginalRouteLeg readAll:](self, "readAll:", 1);
  v3 = -[NSData hash](self->_zilchPoints, "hash");
  v4 = -[NSData hash](self->_pathLeg, "hash");
  v5 = -[GEOEVStateInfo hash](self->_evStateInfo, "hash");
  v6 = -[GEOWaypointInfo hash](self->_originWaypointInfo, "hash");
  v7 = -[GEOWaypointInfo hash](self->_destinationWaypointInfo, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v8 = 2654435761u * self->_encryptedTourMuid;
  else
    v8 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  GEOEVStateInfo *evStateInfo;
  uint64_t v6;
  GEOWaypointInfo *originWaypointInfo;
  uint64_t v8;
  GEOWaypointInfo *destinationWaypointInfo;
  uint64_t v10;
  _QWORD *v11;

  v11 = a3;
  objc_msgSend(v11, "readAll:", 0);
  v4 = v11;
  if (v11[8])
  {
    -[GEOOriginalRouteLeg setZilchPoints:](self, "setZilchPoints:");
    v4 = v11;
  }
  if (v4[7])
  {
    -[GEOOriginalRouteLeg setPathLeg:](self, "setPathLeg:");
    v4 = v11;
  }
  evStateInfo = self->_evStateInfo;
  v6 = v4[5];
  if (evStateInfo)
  {
    if (!v6)
      goto LABEL_11;
    -[GEOEVStateInfo mergeFrom:](evStateInfo, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_11;
    -[GEOOriginalRouteLeg setEvStateInfo:](self, "setEvStateInfo:");
  }
  v4 = v11;
LABEL_11:
  originWaypointInfo = self->_originWaypointInfo;
  v8 = v4[6];
  if (originWaypointInfo)
  {
    if (!v8)
      goto LABEL_17;
    -[GEOWaypointInfo mergeFrom:](originWaypointInfo, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_17;
    -[GEOOriginalRouteLeg setOriginWaypointInfo:](self, "setOriginWaypointInfo:");
  }
  v4 = v11;
LABEL_17:
  destinationWaypointInfo = self->_destinationWaypointInfo;
  v10 = v4[3];
  if (destinationWaypointInfo)
  {
    if (!v10)
      goto LABEL_23;
    -[GEOWaypointInfo mergeFrom:](destinationWaypointInfo, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_23;
    -[GEOOriginalRouteLeg setDestinationWaypointInfo:](self, "setDestinationWaypointInfo:");
  }
  v4 = v11;
LABEL_23:
  if ((*((_BYTE *)v4 + 84) & 1) != 0)
  {
    self->_encryptedTourMuid = v4[4];
    *(_BYTE *)&self->_flags |= 1u;
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOOriginalRouteLegReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_3377);
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
  *(_BYTE *)&self->_flags |= 0x82u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOOriginalRouteLeg readAll:](self, "readAll:", 0);
    -[GEOEVStateInfo clearUnknownFields:](self->_evStateInfo, "clearUnknownFields:", 1);
    -[GEOWaypointInfo clearUnknownFields:](self->_originWaypointInfo, "clearUnknownFields:", 1);
    -[GEOWaypointInfo clearUnknownFields:](self->_destinationWaypointInfo, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zilchPoints, 0);
  objc_storeStrong((id *)&self->_pathLeg, 0);
  objc_storeStrong((id *)&self->_originWaypointInfo, 0);
  objc_storeStrong((id *)&self->_evStateInfo, 0);
  objc_storeStrong((id *)&self->_destinationWaypointInfo, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
