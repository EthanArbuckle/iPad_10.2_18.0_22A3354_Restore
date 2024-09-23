@implementation GEOPDTransitScheduleGroup

- (GEOPDTransitScheduleGroup)init
{
  GEOPDTransitScheduleGroup *v2;
  GEOPDTransitScheduleGroup *v3;
  GEOPDTransitScheduleGroup *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDTransitScheduleGroup;
  v2 = -[GEOPDTransitScheduleGroup init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDTransitScheduleGroup)initWithData:(id)a3
{
  GEOPDTransitScheduleGroup *v3;
  GEOPDTransitScheduleGroup *v4;
  GEOPDTransitScheduleGroup *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDTransitScheduleGroup;
  v3 = -[GEOPDTransitScheduleGroup initWithData:](&v7, sel_initWithData_, a3);
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
  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDTransitScheduleGroup;
  -[GEOPDTransitScheduleGroup dealloc](&v3, sel_dealloc);
}

- (void)_readDisplayName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 144) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDTransitScheduleGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDisplayName_tags_7153);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (id)displayName
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDTransitScheduleGroup _readDisplayName]((uint64_t)a1);
    a1 = (id *)v1[12];
  }
  return a1;
}

- (void)_readDepartureSequenceContainerIndexs
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 144) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDTransitScheduleGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDepartureSequenceContainerIndexs_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (uint64_t)departureSequenceContainerIndexAtIndex:(uint64_t)result
{
  uint64_t v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  if (result)
  {
    v3 = result;
    -[GEOPDTransitScheduleGroup _readDepartureSequenceContainerIndexs](result);
    v4 = *(_QWORD *)(v3 + 32);
    if (v4 <= a2)
    {
      v5 = (void *)MEMORY[0x1E0C99DA0];
      v6 = *MEMORY[0x1E0C99858];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a2, v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "raise");

    }
    return *(unsigned int *)(*(_QWORD *)(v3 + 24) + 4 * a2);
  }
  return result;
}

- (void)_readIncidentIds
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 144) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDTransitScheduleGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIncidentIds_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (uint64_t)incidentIdAtIndex:(uint64_t)result
{
  uint64_t v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  if (result)
  {
    v3 = result;
    -[GEOPDTransitScheduleGroup _readIncidentIds](result);
    v4 = *(_QWORD *)(v3 + 80);
    if (v4 <= a2)
    {
      v5 = (void *)MEMORY[0x1E0C99DA0];
      v6 = *MEMORY[0x1E0C99858];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a2, v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "raise");

    }
    return *(_QWORD *)(*(_QWORD *)(v3 + 72) + 8 * a2);
  }
  return result;
}

- (void)_readPinnedDisplayName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 144) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDTransitScheduleGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPinnedDisplayName_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (id)pinnedDisplayName
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDTransitScheduleGroup _readPinnedDisplayName]((uint64_t)a1);
    a1 = (id *)v1[13];
  }
  return a1;
}

- (uint64_t)groupType
{
  uint64_t v1;
  __int16 v2;

  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    v2 = *(_WORD *)(v1 + 144);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 120));
    if ((v2 & 1) != 0)
      return *(unsigned int *)(v1 + 124);
    else
      return 0;
  }
  return result;
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
  v8.super_class = (Class)GEOPDTransitScheduleGroup;
  -[GEOPDTransitScheduleGroup description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDTransitScheduleGroup dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDTransitScheduleGroup _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  __int16 v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  uint64_t v18;
  __CFString *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  const __CFString *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  _QWORD v34[4];
  id v35;

  if (!a1)
    return 0;
  -[GEOPDTransitScheduleGroup readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDTransitScheduleGroup displayName]((id *)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (a2)
      v6 = CFSTR("displayName");
    else
      v6 = CFSTR("display_name");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);
  }

  v7 = *(_WORD *)(a1 + 144);
  if ((v7 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 136));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v21 = CFSTR("minWalkingDistance");
    else
      v21 = CFSTR("min_walking_distance");
    objc_msgSend(v4, "setObject:forKey:", v20, v21);

    v7 = *(_WORD *)(a1 + 144);
    if ((v7 & 2) == 0)
    {
LABEL_9:
      if ((v7 & 0x10) == 0)
        goto LABEL_10;
LABEL_46:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 140));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v25 = CFSTR("minWalkingTime");
      else
        v25 = CFSTR("min_walking_time");
      objc_msgSend(v4, "setObject:forKey:", v24, v25);

      if ((*(_WORD *)(a1 + 144) & 4) == 0)
        goto LABEL_15;
      goto LABEL_11;
    }
  }
  else if ((v7 & 2) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 128));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v23 = CFSTR("maxWalkingDistance");
  else
    v23 = CFSTR("max_walking_distance");
  objc_msgSend(v4, "setObject:forKey:", v22, v23);

  v7 = *(_WORD *)(a1 + 144);
  if ((v7 & 0x10) != 0)
    goto LABEL_46;
LABEL_10:
  if ((v7 & 4) != 0)
  {
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 132));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v9 = CFSTR("maxWalkingTime");
    else
      v9 = CFSTR("max_walking_time");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);

  }
LABEL_15:
  if (*(_QWORD *)(a1 + 56))
  {
    PBRepeatedUInt32NSArray();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v11 = CFSTR("departureSequenceIndex");
    else
      v11 = CFSTR("departure_sequence_index");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

  }
  if (*(_QWORD *)(a1 + 32))
  {
    PBRepeatedUInt32NSArray();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v13 = CFSTR("departureSequenceContainerIndex");
    else
      v13 = CFSTR("departure_sequence_container_index");
    objc_msgSend(v4, "setObject:forKey:", v12, v13);

  }
  if (*(_QWORD *)(a1 + 80))
  {
    PBRepeatedUInt64NSArray();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v15 = CFSTR("incidentId");
    else
      v15 = CFSTR("incident_id");
    objc_msgSend(v4, "setObject:forKey:", v14, v15);

  }
  -[GEOPDTransitScheduleGroup pinnedDisplayName]((id *)a1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    if (a2)
      v17 = CFSTR("pinnedDisplayName");
    else
      v17 = CFSTR("pinned_display_name");
    objc_msgSend(v4, "setObject:forKey:", v16, v17);
  }

  if ((*(_WORD *)(a1 + 144) & 1) != 0)
  {
    v18 = *(int *)(a1 + 124);
    if (v18 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 124));
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = off_1E1C0C400[v18];
    }
    if (a2)
      v26 = CFSTR("groupType");
    else
      v26 = CFSTR("group_type");
    objc_msgSend(v4, "setObject:forKey:", v19, v26);

  }
  v27 = *(void **)(a1 + 16);
  if (v27)
  {
    objc_msgSend(v27, "dictionaryRepresentation");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v28, "count"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __55__GEOPDTransitScheduleGroup__dictionaryRepresentation___block_invoke;
      v34[3] = &unk_1E1C00600;
      v31 = v30;
      v35 = v31;
      objc_msgSend(v29, "enumerateKeysAndObjectsUsingBlock:", v34);
      v32 = v31;

      v29 = v32;
    }
    objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDTransitScheduleGroup _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_7187;
      else
        v6 = (int *)&readAll__nonRecursiveTag_7188;
      GEOPDTransitScheduleGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

void __55__GEOPDTransitScheduleGroup__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)readFrom:(id)a3
{
  return GEOPDTransitScheduleGroupReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;
  id v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  PBDataReader *v10;
  void *v11;
  id v12;

  v12 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_WORD *)&self->_flags & 0xFC0) == 0)
    {
      v10 = self->_reader;
      objc_sync_enter(v10);
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "writeData:", v11);
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v10);
      goto LABEL_29;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDTransitScheduleGroup readAll:]((uint64_t)self, 0);
  if (self->_displayName)
    PBDataWriterWriteStringField();
  flags = (__int16)self->_flags;
  v6 = v12;
  if ((flags & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    v6 = v12;
    flags = (__int16)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_7:
      if ((flags & 0x10) == 0)
        goto LABEL_8;
LABEL_26:
      PBDataWriterWriteUint32Field();
      v6 = v12;
      if ((*(_WORD *)&self->_flags & 4) == 0)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  else if ((flags & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint32Field();
  v6 = v12;
  flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
    goto LABEL_26;
LABEL_8:
  if ((flags & 4) != 0)
  {
LABEL_9:
    PBDataWriterWriteUint32Field();
    v6 = v12;
  }
LABEL_10:
  if (self->_departureSequenceIndexs.count)
  {
    v7 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      v6 = v12;
      ++v7;
    }
    while (v7 < self->_departureSequenceIndexs.count);
  }
  if (self->_departureSequenceContainerIndexs.count)
  {
    v8 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      v6 = v12;
      ++v8;
    }
    while (v8 < self->_departureSequenceContainerIndexs.count);
  }
  if (self->_incidentIds.count)
  {
    v9 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      v6 = v12;
      ++v9;
    }
    while (v9 < self->_incidentIds.count);
  }
  if (self->_pinnedDisplayName)
  {
    PBDataWriterWriteStringField();
    v6 = v12;
  }
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v6 = v12;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v6);
LABEL_29:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int16 flags;
  uint64_t v12;
  void *v13;
  PBUnknownFields *v14;

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
      GEOPDTransitScheduleGroupReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_13;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDTransitScheduleGroup readAll:]((uint64_t)self, 0);
  v9 = -[NSString copyWithZone:](self->_displayName, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v9;

  flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 136) = self->_minWalkingDistance;
    *(_WORD *)(v5 + 144) |= 8u;
    flags = (__int16)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_7:
      if ((flags & 0x10) == 0)
        goto LABEL_8;
LABEL_16:
      *(_DWORD *)(v5 + 140) = self->_minWalkingTime;
      *(_WORD *)(v5 + 144) |= 0x10u;
      if ((*(_WORD *)&self->_flags & 4) == 0)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  else if ((flags & 2) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v5 + 128) = self->_maxWalkingDistance;
  *(_WORD *)(v5 + 144) |= 2u;
  flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
    goto LABEL_16;
LABEL_8:
  if ((flags & 4) != 0)
  {
LABEL_9:
    *(_DWORD *)(v5 + 132) = self->_maxWalkingTime;
    *(_WORD *)(v5 + 144) |= 4u;
  }
LABEL_10:
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt64Copy();
  v12 = -[NSString copyWithZone:](self->_pinnedDisplayName, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v12;

  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 124) = self->_groupType;
    *(_WORD *)(v5 + 144) |= 1u;
  }
  v14 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v14;
LABEL_13:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *displayName;
  __int16 flags;
  __int16 v7;
  NSString *pinnedDisplayName;
  __int16 v9;
  BOOL v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_33;
  -[GEOPDTransitScheduleGroup readAll:]((uint64_t)self, 1);
  -[GEOPDTransitScheduleGroup readAll:]((uint64_t)v4, 1);
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](displayName, "isEqual:"))
      goto LABEL_33;
  }
  flags = (__int16)self->_flags;
  v7 = *((_WORD *)v4 + 72);
  if ((flags & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_minWalkingDistance != *((_DWORD *)v4 + 34))
      goto LABEL_33;
  }
  else if ((v7 & 8) != 0)
  {
LABEL_33:
    v10 = 0;
    goto LABEL_34;
  }
  if ((flags & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_maxWalkingDistance != *((_DWORD *)v4 + 32))
      goto LABEL_33;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_33;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_minWalkingTime != *((_DWORD *)v4 + 35))
      goto LABEL_33;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_33;
  }
  if ((flags & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_maxWalkingTime != *((_DWORD *)v4 + 33))
      goto LABEL_33;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_33;
  }
  if (!PBRepeatedUInt32IsEqual())
    goto LABEL_33;
  if (!PBRepeatedUInt32IsEqual())
    goto LABEL_33;
  if (!PBRepeatedUInt64IsEqual())
    goto LABEL_33;
  pinnedDisplayName = self->_pinnedDisplayName;
  if ((unint64_t)pinnedDisplayName | *((_QWORD *)v4 + 13))
  {
    if (!-[NSString isEqual:](pinnedDisplayName, "isEqual:"))
      goto LABEL_33;
  }
  v9 = *((_WORD *)v4 + 72);
  v10 = (v9 & 1) == 0;
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    if ((v9 & 1) == 0 || self->_groupType != *((_DWORD *)v4 + 31))
      goto LABEL_33;
    v10 = 1;
  }
LABEL_34:

  return v10;
}

- (unint64_t)hash
{
  __int16 flags;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSUInteger v11;
  uint64_t v12;
  NSUInteger v14;

  -[GEOPDTransitScheduleGroup readAll:]((uint64_t)self, 1);
  v14 = -[NSString hash](self->_displayName, "hash");
  flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
  {
    v4 = 2654435761 * self->_minWalkingDistance;
    if ((flags & 2) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_maxWalkingDistance;
      if ((flags & 0x10) != 0)
        goto LABEL_4;
LABEL_8:
      v6 = 0;
      if ((flags & 4) != 0)
        goto LABEL_5;
      goto LABEL_9;
    }
  }
  else
  {
    v4 = 0;
    if ((flags & 2) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((flags & 0x10) == 0)
    goto LABEL_8;
LABEL_4:
  v6 = 2654435761 * self->_minWalkingTime;
  if ((flags & 4) != 0)
  {
LABEL_5:
    v7 = 2654435761 * self->_maxWalkingTime;
    goto LABEL_10;
  }
LABEL_9:
  v7 = 0;
LABEL_10:
  v8 = PBRepeatedUInt32Hash();
  v9 = PBRepeatedUInt32Hash();
  v10 = PBRepeatedUInt64Hash();
  v11 = -[NSString hash](self->_pinnedDisplayName, "hash");
  if ((*(_WORD *)&self->_flags & 1) != 0)
    v12 = 2654435761 * self->_groupType;
  else
    v12 = 0;
  return v4 ^ v14 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinnedDisplayName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
