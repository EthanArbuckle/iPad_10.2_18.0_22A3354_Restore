@implementation GEOPDPlaceInfo

void __57__GEOPDPlaceInfo_PlaceDataExtras__placeInfoForPlaceData___block_invoke(uint64_t a1, id *a2, BOOL *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  -[GEOPDComponentValue placeInfo](a2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  *a3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) != 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  __int16 flags;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  PBUnknownFields *v20;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x200) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDPlaceInfoReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_12;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDPlaceInfo readAll:]((uint64_t)self, 0);
  v9 = -[GEOLatLng copyWithZone:](self->_center, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v9;

  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *(double *)(v5 + 24) = self->_area;
    *(_WORD *)(v5 + 92) |= 1u;
  }
  v11 = -[GEOTimezone copyWithZone:](self->_timezone, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v11;

  flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    *(_BYTE *)(v5 + 88) = self->_isApproximateCenter;
    *(_WORD *)(v5 + 92) |= 4u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 84) = self->_knownAccuracy;
    *(_WORD *)(v5 + 92) |= 2u;
  }
  v14 = -[GEOPDBasemapRegionMetadata copyWithZone:](self->_basemapRegionMetadata, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v14;

  v16 = -[GEOLatLng copyWithZone:](self->_enhancedCenter, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v16;

  v18 = -[GEOLatLng copyWithZone:](self->_labelPoint, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v18;

  v20 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v20;
LABEL_12:

  return (id)v5;
}

- (id)timezone
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceInfo _readTimezone]((uint64_t)a1);
    a1 = (id *)v1[8];
  }
  return a1;
}

- (void)_readTimezone
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTimezone_tags_5703);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

+ (id)placeInfoForPlaceData:(id)a3
{
  id v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__36;
  v11 = __Block_byref_object_dispose__36;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__GEOPDPlaceInfo_PlaceDataExtras__placeInfoForPlaceData___block_invoke;
  v6[3] = &unk_1E1C09718;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateValidComponentValuesOfType:usingBlock:", 2, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)center
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceInfo _readCenter]((uint64_t)a1);
    a1 = (id *)v1[5];
  }
  return a1;
}

- (void)_readCenter
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCenter_tags_5702);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (void)_readEnhancedCenter
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEnhancedCenter_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timezone, 0);
  objc_storeStrong((id *)&self->_labelPoint, 0);
  objc_storeStrong((id *)&self->_enhancedCenter, 0);
  objc_storeStrong((id *)&self->_center, 0);
  objc_storeStrong((id *)&self->_basemapRegionMetadata, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOPDPlaceInfo)init
{
  GEOPDPlaceInfo *v2;
  GEOPDPlaceInfo *v3;
  GEOPDPlaceInfo *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDPlaceInfo;
  v2 = -[GEOPDPlaceInfo init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  __int16 flags;
  PBDataReader *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0x3F0) == 0))
  {
    v7 = self->_reader;
    objc_sync_enter(v7);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "writeData:", v8);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDPlaceInfo readAll:]((uint64_t)self, 0);
    if (self->_center)
      PBDataWriterWriteSubmessage();
    v5 = v9;
    if ((*(_WORD *)&self->_flags & 1) != 0)
    {
      PBDataWriterWriteDoubleField();
      v5 = v9;
    }
    if (self->_timezone)
    {
      PBDataWriterWriteSubmessage();
      v5 = v9;
    }
    flags = (__int16)self->_flags;
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteBOOLField();
      v5 = v9;
      flags = (__int16)self->_flags;
    }
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      v5 = v9;
    }
    if (self->_basemapRegionMetadata)
    {
      PBDataWriterWriteSubmessage();
      v5 = v9;
    }
    if (self->_enhancedCenter)
    {
      PBDataWriterWriteSubmessage();
      v5 = v9;
    }
    if (self->_labelPoint)
    {
      PBDataWriterWriteSubmessage();
      v5 = v9;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_5723;
      else
        v6 = (int *)&readAll__nonRecursiveTag_5724;
      GEOPDPlaceInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
    {
      objc_msgSend(*(id *)(a1 + 40), "readAll:", 1);
      objc_msgSend(*(id *)(a1 + 48), "readAll:", 1);
      objc_msgSend(*(id *)(a1 + 56), "readAll:", 1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)labelPoint
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceInfo _readLabelPoint]((uint64_t)a1);
    a1 = (id *)v1[7];
  }
  return a1;
}

- (id)enhancedCenter
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPlaceInfo _readEnhancedCenter]((uint64_t)a1);
    a1 = (id *)v1[6];
  }
  return a1;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPlaceInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (void)_readLabelPoint
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLabelPoint_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
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
  __int16 v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  __CFString *v16;
  const __CFString *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  _QWORD v39[4];
  id v40;

  if (!a1)
    return 0;
  -[GEOPDPlaceInfo readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPlaceInfo center]((id *)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v5, "jsonRepresentation");
    else
      objc_msgSend(v5, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("center"));

  }
  if ((*(_WORD *)(a1 + 92) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 24));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("area"));

  }
  -[GEOPDPlaceInfo timezone]((id *)a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v9, "jsonRepresentation");
    else
      objc_msgSend(v9, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("timezone"));

  }
  v12 = *(_WORD *)(a1 + 92);
  if ((v12 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 88));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v14 = CFSTR("isApproximateCenter");
    else
      v14 = CFSTR("is_approximate_center");
    objc_msgSend(v4, "setObject:forKey:", v13, v14);

    v12 = *(_WORD *)(a1 + 92);
  }
  if ((v12 & 2) != 0)
  {
    v15 = *(int *)(a1 + 84);
    if (v15 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 84));
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = off_1E1C0BF90[v15];
    }
    if (a2)
      v17 = CFSTR("knownAccuracy");
    else
      v17 = CFSTR("known_accuracy");
    objc_msgSend(v4, "setObject:forKey:", v16, v17);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
  if ((*(_WORD *)(a1 + 92) & 0x10) == 0)
  {
    v18 = *(void **)(a1 + 8);
    if (v18)
    {
      v19 = v18;
      objc_sync_enter(v19);
      GEOPDPlaceInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBasemapRegionMetadata_tags);
      objc_sync_exit(v19);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  v20 = *(id *)(a1 + 32);
  v21 = v20;
  if (v20)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v20, "jsonRepresentation");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = CFSTR("basemapRegionMetadata");
    }
    else
    {
      objc_msgSend(v20, "dictionaryRepresentation");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = CFSTR("basemap_region_metadata");
    }
    objc_msgSend(v4, "setObject:forKey:", v22, v23);

  }
  -[GEOPDPlaceInfo enhancedCenter]((id *)a1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v24)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v24, "jsonRepresentation");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = CFSTR("enhancedCenter");
    }
    else
    {
      objc_msgSend(v24, "dictionaryRepresentation");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = CFSTR("enhanced_center");
    }
    objc_msgSend(v4, "setObject:forKey:", v26, v27);

  }
  -[GEOPDPlaceInfo labelPoint]((id *)a1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v28)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v28, "jsonRepresentation");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = CFSTR("labelPoint");
    }
    else
    {
      objc_msgSend(v28, "dictionaryRepresentation");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = CFSTR("label_point");
    }
    objc_msgSend(v4, "setObject:forKey:", v30, v31);

  }
  v32 = *(void **)(a1 + 16);
  if (v32)
  {
    objc_msgSend(v32, "dictionaryRepresentation");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v33, "count"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __44__GEOPDPlaceInfo__dictionaryRepresentation___block_invoke;
      v39[3] = &unk_1E1C00600;
      v36 = v35;
      v40 = v36;
      objc_msgSend(v34, "enumerateKeysAndObjectsUsingBlock:", v39);
      v37 = v36;

      v34 = v37;
    }
    objc_msgSend(v4, "setObject:forKey:", v34, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  id *v3;

  if (result)
  {
    v3 = (id *)result;
    -[GEOPDPlaceInfo _readCenter](result);
    if ((objc_msgSend(v3[5], "hasGreenTeaWithValue:", a2) & 1) != 0)
      return 1;
    -[GEOPDPlaceInfo _readEnhancedCenter]((uint64_t)v3);
    if ((objc_msgSend(v3[6], "hasGreenTeaWithValue:", a2) & 1) != 0)
    {
      return 1;
    }
    else
    {
      -[GEOPDPlaceInfo _readLabelPoint]((uint64_t)v3);
      return objc_msgSend(v3[7], "hasGreenTeaWithValue:", a2);
    }
  }
  return result;
}

- (uint64_t)clearUnknownFields:(uint64_t)result
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    *(_WORD *)(v1 + 92) |= 8u;
    *(_WORD *)(v1 + 92) |= 0x200u;
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 80));
    v2 = *(void **)(v1 + 16);
    *(_QWORD *)(v1 + 16) = 0;

    -[GEOPDPlaceInfo readAll:](v1, 0);
    objc_msgSend(*(id *)(v1 + 40), "clearUnknownFields:", 1);
    v3 = *(_QWORD *)(v1 + 64);
    if (v3)
    {
      v4 = *(void **)(v3 + 8);
      *(_QWORD *)(v3 + 8) = 0;

    }
    v5 = *(_QWORD *)(v1 + 32);
    if (v5)
    {
      v6 = *(void **)(v5 + 8);
      *(_QWORD *)(v5 + 8) = 0;

    }
    objc_msgSend(*(id *)(v1 + 48), "clearUnknownFields:", 1);
    return objc_msgSend(*(id *)(v1 + 56), "clearUnknownFields:", 1);
  }
  return result;
}

- (GEOPDPlaceInfo)initWithData:(id)a3
{
  GEOPDPlaceInfo *v3;
  GEOPDPlaceInfo *v4;
  GEOPDPlaceInfo *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDPlaceInfo;
  v3 = -[GEOPDPlaceInfo initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (uint64_t)knownAccuracy
{
  uint64_t v1;
  __int16 v2;

  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    v2 = *(_WORD *)(v1 + 92);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 80));
    if ((v2 & 2) != 0)
      return *(unsigned int *)(v1 + 84);
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
  v8.super_class = (Class)GEOPDPlaceInfo;
  -[GEOPDPlaceInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPlaceInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)jsonRepresentation
{
  return -[GEOPDPlaceInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __44__GEOPDPlaceInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  uint64_t v6;
  void *v7;
  GEOLatLng *v8;
  GEOLatLng *v9;
  GEOLatLng *v10;
  GEOLatLng *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  GEOTimezone *v15;
  void *v16;
  id v17;
  const __CFString *v18;
  void *v19;
  char v20;
  const __CFString *v21;
  void *v22;
  id v23;
  int v24;
  const __CFString *v25;
  void *v26;
  GEOPDBasemapRegionMetadata *v27;
  id v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  id v32;
  GEOPDBasemapRegionMetadata *v33;
  const __CFString *v34;
  void *v35;
  GEOLatLng *v36;
  GEOLatLng *v37;
  GEOLatLng *v38;
  GEOLatLng *v39;
  const __CFString *v40;
  void *v41;
  GEOLatLng *v42;
  GEOLatLng *v43;
  GEOLatLng *v44;
  GEOLatLng *v45;

  v5 = a2;
  v6 = objc_msgSend(a1, "init");
  if (!v6)
    goto LABEL_70;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("center"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = [GEOLatLng alloc];
    if ((a3 & 1) != 0)
      v9 = -[GEOLatLng initWithJSON:](v8, "initWithJSON:", v7);
    else
      v9 = -[GEOLatLng initWithDictionary:](v8, "initWithDictionary:", v7);
    v10 = v9;
    v11 = v9;
    *(_WORD *)(v6 + 92) |= 0x20u;
    *(_WORD *)(v6 + 92) |= 0x200u;
    objc_storeStrong((id *)(v6 + 40), v10);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("area"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v12, "doubleValue");
    *(_WORD *)(v6 + 92) |= 0x200u;
    *(_WORD *)(v6 + 92) |= 1u;
    *(_QWORD *)(v6 + 24) = v13;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("timezone"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = [GEOTimezone alloc];
    if (v15)
      v16 = -[GEOTimezone _initWithDictionary:isJSON:](v15, v14);
    else
      v16 = 0;
    v17 = v16;
    *(_WORD *)(v6 + 92) |= 0x100u;
    *(_WORD *)(v6 + 92) |= 0x200u;
    objc_storeStrong((id *)(v6 + 64), v16);

  }
  if (a3)
    v18 = CFSTR("isApproximateCenter");
  else
    v18 = CFSTR("is_approximate_center");
  objc_msgSend(v5, "objectForKeyedSubscript:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = objc_msgSend(v19, "BOOLValue");
    *(_WORD *)(v6 + 92) |= 0x200u;
    *(_WORD *)(v6 + 92) |= 4u;
    *(_BYTE *)(v6 + 88) = v20;
  }

  if (a3)
    v21 = CFSTR("knownAccuracy");
  else
    v21 = CFSTR("known_accuracy");
  objc_msgSend(v5, "objectForKeyedSubscript:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v23 = v22;
    if ((objc_msgSend(v23, "isEqualToString:", CFSTR("POINT")) & 1) != 0)
    {
      v24 = 0;
    }
    else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("INTERPOLATION")) & 1) != 0)
    {
      v24 = 1;
    }
    else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("APPROXIMATE")) & 1) != 0)
    {
      v24 = 2;
    }
    else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("POSTAL_ZIP")) & 1) != 0)
    {
      v24 = 3;
    }
    else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("PARCEL")) & 1) != 0)
    {
      v24 = 4;
    }
    else if (objc_msgSend(v23, "isEqualToString:", CFSTR("SUBPREMISE")))
    {
      v24 = 5;
    }
    else
    {
      v24 = 0;
    }

    goto LABEL_38;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v24 = objc_msgSend(v22, "intValue");
LABEL_38:
    *(_WORD *)(v6 + 92) |= 0x200u;
    *(_WORD *)(v6 + 92) |= 2u;
    *(_DWORD *)(v6 + 84) = v24;
  }

  if (a3)
    v25 = CFSTR("basemapRegionMetadata");
  else
    v25 = CFSTR("basemap_region_metadata");
  objc_msgSend(v5, "objectForKeyedSubscript:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v27 = [GEOPDBasemapRegionMetadata alloc];
    if (v27)
    {
      v28 = v26;
      v27 = -[GEOPDBasemapRegionMetadata init](v27, "init");
      if (v27)
      {
        if (a3)
          v29 = CFSTR("buildUnitAreaId");
        else
          v29 = CFSTR("build_unit_area_id");
        objc_msgSend(v28, "objectForKeyedSubscript:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v31 = (void *)objc_msgSend(v30, "copy");
          v32 = v31;
          objc_storeStrong((id *)&v27->_buildUnitAreaId, v31);

        }
      }

    }
    v33 = v27;
    *(_WORD *)(v6 + 92) |= 0x10u;
    *(_WORD *)(v6 + 92) |= 0x200u;
    objc_storeStrong((id *)(v6 + 32), v27);

  }
  if (a3)
    v34 = CFSTR("enhancedCenter");
  else
    v34 = CFSTR("enhanced_center");
  objc_msgSend(v5, "objectForKeyedSubscript:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v36 = [GEOLatLng alloc];
    if ((a3 & 1) != 0)
      v37 = -[GEOLatLng initWithJSON:](v36, "initWithJSON:", v35);
    else
      v37 = -[GEOLatLng initWithDictionary:](v36, "initWithDictionary:", v35);
    v38 = v37;
    v39 = v37;
    *(_WORD *)(v6 + 92) |= 0x40u;
    *(_WORD *)(v6 + 92) |= 0x200u;
    objc_storeStrong((id *)(v6 + 48), v38);

  }
  if (a3)
    v40 = CFSTR("labelPoint");
  else
    v40 = CFSTR("label_point");
  objc_msgSend(v5, "objectForKeyedSubscript:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v42 = [GEOLatLng alloc];
    if ((a3 & 1) != 0)
      v43 = -[GEOLatLng initWithJSON:](v42, "initWithJSON:", v41);
    else
      v43 = -[GEOLatLng initWithDictionary:](v42, "initWithDictionary:", v41);
    v44 = v43;
    v45 = v43;
    *(_WORD *)(v6 + 92) |= 0x80u;
    *(_WORD *)(v6 + 92) |= 0x200u;
    objc_storeStrong((id *)(v6 + 56), v44);

  }
LABEL_70:

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPlaceInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOLatLng *center;
  __int16 flags;
  __int16 v7;
  GEOTimezone *timezone;
  GEOPDBasemapRegionMetadata *basemapRegionMetadata;
  GEOLatLng *enhancedCenter;
  GEOLatLng *labelPoint;
  char v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_31;
  -[GEOPDPlaceInfo readAll:]((uint64_t)self, 1);
  -[GEOPDPlaceInfo readAll:]((uint64_t)v4, 1);
  center = self->_center;
  if ((unint64_t)center | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOLatLng isEqual:](center, "isEqual:"))
      goto LABEL_31;
  }
  flags = (__int16)self->_flags;
  v7 = *((_WORD *)v4 + 46);
  if ((flags & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_area != *((double *)v4 + 3))
      goto LABEL_31;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_31;
  }
  timezone = self->_timezone;
  if ((unint64_t)timezone | *((_QWORD *)v4 + 8))
  {
    if (!-[GEOTimezone isEqual:](timezone, "isEqual:"))
      goto LABEL_31;
    flags = (__int16)self->_flags;
    v7 = *((_WORD *)v4 + 46);
  }
  if ((flags & 4) != 0)
  {
    if ((v7 & 4) != 0)
    {
      if (self->_isApproximateCenter)
      {
        if (!*((_BYTE *)v4 + 88))
          goto LABEL_31;
        goto LABEL_20;
      }
      if (!*((_BYTE *)v4 + 88))
        goto LABEL_20;
    }
LABEL_31:
    v12 = 0;
    goto LABEL_32;
  }
  if ((v7 & 4) != 0)
    goto LABEL_31;
LABEL_20:
  if ((flags & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_knownAccuracy != *((_DWORD *)v4 + 21))
      goto LABEL_31;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_31;
  }
  basemapRegionMetadata = self->_basemapRegionMetadata;
  if ((unint64_t)basemapRegionMetadata | *((_QWORD *)v4 + 4)
    && !-[GEOPDBasemapRegionMetadata isEqual:](basemapRegionMetadata, "isEqual:"))
  {
    goto LABEL_31;
  }
  enhancedCenter = self->_enhancedCenter;
  if ((unint64_t)enhancedCenter | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOLatLng isEqual:](enhancedCenter, "isEqual:"))
      goto LABEL_31;
  }
  labelPoint = self->_labelPoint;
  if ((unint64_t)labelPoint | *((_QWORD *)v4 + 7))
    v12 = -[GEOLatLng isEqual:](labelPoint, "isEqual:");
  else
    v12 = 1;
LABEL_32:

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  double area;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  __int16 flags;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;

  -[GEOPDPlaceInfo readAll:]((uint64_t)self, 1);
  v3 = -[GEOLatLng hash](self->_center, "hash");
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    area = self->_area;
    v6 = -area;
    if (area >= 0.0)
      v6 = self->_area;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  v9 = -[GEOTimezone hash](self->_timezone, "hash");
  flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    v11 = 2654435761 * self->_isApproximateCenter;
    if ((flags & 2) != 0)
      goto LABEL_11;
LABEL_13:
    v12 = 0;
    goto LABEL_14;
  }
  v11 = 0;
  if ((flags & 2) == 0)
    goto LABEL_13;
LABEL_11:
  v12 = 2654435761 * self->_knownAccuracy;
LABEL_14:
  v13 = v4 ^ v3 ^ v9 ^ v11;
  v14 = v12 ^ -[GEOPDBasemapRegionMetadata hash](self->_basemapRegionMetadata, "hash");
  v15 = v13 ^ v14 ^ -[GEOLatLng hash](self->_enhancedCenter, "hash");
  return v15 ^ -[GEOLatLng hash](self->_labelPoint, "hash");
}

@end
