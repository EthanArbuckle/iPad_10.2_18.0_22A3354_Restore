@implementation GEORouteLineStyleInfo

- (GEORouteLineStyleInfo)init
{
  GEORouteLineStyleInfo *v2;
  GEORouteLineStyleInfo *v3;
  GEORouteLineStyleInfo *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORouteLineStyleInfo;
  v2 = -[GEORouteLineStyleInfo init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORouteLineStyleInfo)initWithData:(id)a3
{
  GEORouteLineStyleInfo *v3;
  GEORouteLineStyleInfo *v4;
  GEORouteLineStyleInfo *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORouteLineStyleInfo;
  v3 = -[GEORouteLineStyleInfo initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)purpose
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0)
    return self->_purpose;
  else
    return 0;
}

- (void)setPurpose:(int)a3
{
  *(_WORD *)&self->_flags |= 0x102u;
  self->_purpose = a3;
}

- (void)setHasPurpose:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 258;
  else
    v3 = 256;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasPurpose
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (id)purposeAsString:(int)a3
{
  if (!a3)
    return CFSTR("STYLE_ONLY");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPurpose:(id)a3
{
  objc_msgSend(a3, "isEqualToString:", CFSTR("STYLE_ONLY"));
  return 0;
}

- (unsigned)startOffsetCm
{
  return self->_startOffsetCm;
}

- (void)setStartOffsetCm:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x104u;
  self->_startOffsetCm = a3;
}

- (void)setHasStartOffsetCm:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 260;
  else
    v3 = 256;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasStartOffsetCm
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (unsigned)endOffsetCm
{
  return self->_endOffsetCm;
}

- (void)setEndOffsetCm:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x101u;
  self->_endOffsetCm = a3;
}

- (void)setHasEndOffsetCm:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x100;
}

- (BOOL)hasEndOffsetCm
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)_readStyleAttributes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_WORD *)(a1 + 76) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteLineStyleInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readStyleAttributes_tags_2);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasStyleAttributes
{
  -[GEORouteLineStyleInfo _readStyleAttributes]((uint64_t)self);
  return self->_styleAttributes != 0;
}

- (GEOStyleAttributes)styleAttributes
{
  -[GEORouteLineStyleInfo _readStyleAttributes]((uint64_t)self);
  return self->_styleAttributes;
}

- (void)setStyleAttributes:(id)a3
{
  *(_WORD *)&self->_flags |= 0x180u;
  objc_storeStrong((id *)&self->_styleAttributes, a3);
}

- (void)_readLabelInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_WORD *)(a1 + 76) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteLineStyleInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLabelInfo_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasLabelInfo
{
  -[GEORouteLineStyleInfo _readLabelInfo]((uint64_t)self);
  return self->_labelInfo != 0;
}

- (GEOLabelInfo)labelInfo
{
  -[GEORouteLineStyleInfo _readLabelInfo]((uint64_t)self);
  return self->_labelInfo;
}

- (void)setLabelInfo:(id)a3
{
  *(_WORD *)&self->_flags |= 0x120u;
  objc_storeStrong((id *)&self->_labelInfo, a3);
}

- (BOOL)preserveStyleInUpdates
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (flags & 8) == 0 || self->_preserveStyleInUpdates;
}

- (void)setPreserveStyleInUpdates:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x108u;
  self->_preserveStyleInUpdates = a3;
}

- (void)setHasPreserveStyleInUpdates:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 264;
  else
    v3 = 256;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasPreserveStyleInUpdates
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (void)_readLaneChangeInfos
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_WORD *)(a1 + 76) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORouteLineStyleInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLaneChangeInfos_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)laneChangeInfos
{
  -[GEORouteLineStyleInfo _readLaneChangeInfos]((uint64_t)self);
  return self->_laneChangeInfos;
}

- (void)setLaneChangeInfos:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *laneChangeInfos;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  laneChangeInfos = self->_laneChangeInfos;
  self->_laneChangeInfos = v4;

}

- (void)clearLaneChangeInfos
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  -[NSMutableArray removeAllObjects](self->_laneChangeInfos, "removeAllObjects");
}

- (void)addLaneChangeInfo:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORouteLineStyleInfo _readLaneChangeInfos]((uint64_t)self);
  -[GEORouteLineStyleInfo _addNoFlagsLaneChangeInfo:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
}

- (void)_addNoFlagsLaneChangeInfo:(uint64_t)a1
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

- (unint64_t)laneChangeInfosCount
{
  -[GEORouteLineStyleInfo _readLaneChangeInfos]((uint64_t)self);
  return -[NSMutableArray count](self->_laneChangeInfos, "count");
}

- (id)laneChangeInfoAtIndex:(unint64_t)a3
{
  -[GEORouteLineStyleInfo _readLaneChangeInfos]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_laneChangeInfos, "objectAtIndex:", a3);
}

+ (Class)laneChangeInfoType
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
  v8.super_class = (Class)GEORouteLineStyleInfo;
  -[GEORouteLineStyleInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORouteLineStyleInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORouteLineStyleInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  __int16 v5;
  __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  _QWORD v37[4];
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_WORD *)(a1 + 76);
  if ((v5 & 2) != 0)
  {
    if (*(_DWORD *)(a1 + 64))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 64));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = CFSTR("STYLE_ONLY");
    }
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("purpose"));

    v5 = *(_WORD *)(a1 + 76);
  }
  if ((v5 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 68));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v8 = CFSTR("startOffsetCm");
    else
      v8 = CFSTR("start_offset_cm");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

    v5 = *(_WORD *)(a1 + 76);
  }
  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 60));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v10 = CFSTR("endOffsetCm");
    else
      v10 = CFSTR("end_offset_cm");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

  }
  objc_msgSend((id)a1, "styleAttributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v11, "jsonRepresentation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("styleAttributes");
    }
    else
    {
      objc_msgSend(v11, "dictionaryRepresentation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("style_attributes");
    }
    objc_msgSend(v4, "setObject:forKey:", v13, v14);

  }
  objc_msgSend((id)a1, "labelInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v15, "jsonRepresentation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = CFSTR("labelInfo");
    }
    else
    {
      objc_msgSend(v15, "dictionaryRepresentation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = CFSTR("label_info");
    }
    objc_msgSend(v4, "setObject:forKey:", v17, v18);

  }
  if ((*(_WORD *)(a1 + 76) & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 72));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v20 = CFSTR("preserveStyleInUpdates");
    else
      v20 = CFSTR("preserve_style_in_updates");
    objc_msgSend(v4, "setObject:forKey:", v19, v20);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v22 = *(id *)(a1 + 32);
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v40 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v27, "jsonRepresentation");
          else
            objc_msgSend(v27, "dictionaryRepresentation");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v28);

        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      }
      while (v24);
    }

    if (a2)
      v29 = CFSTR("laneChangeInfo");
    else
      v29 = CFSTR("lane_change_info");
    objc_msgSend(v4, "setObject:forKey:", v21, v29);

  }
  v30 = *(void **)(a1 + 16);
  if (v30)
  {
    objc_msgSend(v30, "dictionaryRepresentation");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v31, "count"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __51__GEORouteLineStyleInfo__dictionaryRepresentation___block_invoke;
      v37[3] = &unk_1E1C00600;
      v34 = v33;
      v38 = v34;
      objc_msgSend(v32, "enumerateKeysAndObjectsUsingBlock:", v37);
      v35 = v34;

      v32 = v35;
    }
    objc_msgSend(v4, "setObject:forKey:", v32, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORouteLineStyleInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __51__GEORouteLineStyleInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORouteLineStyleInfo)initWithDictionary:(id)a3
{
  return (GEORouteLineStyleInfo *)-[GEORouteLineStyleInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  uint64_t v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  GEOStyleAttributes *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  GEOLabelInfo *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  uint64_t v31;
  GEOLaneChangeInfo *v32;
  uint64_t v33;
  void *v34;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_57;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_57;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("purpose"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "isEqualToString:", CFSTR("STYLE_ONLY"));
    v7 = 0;
LABEL_7:
    objc_msgSend(a1, "setPurpose:", v7);
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = objc_msgSend(v6, "intValue");
    goto LABEL_7;
  }
LABEL_8:

  if (a3)
    v8 = CFSTR("startOffsetCm");
  else
    v8 = CFSTR("start_offset_cm");
  objc_msgSend(v5, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setStartOffsetCm:", objc_msgSend(v9, "unsignedIntValue"));

  if (a3)
    v10 = CFSTR("endOffsetCm");
  else
    v10 = CFSTR("end_offset_cm");
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setEndOffsetCm:", objc_msgSend(v11, "unsignedIntValue"));

  if (a3)
    v12 = CFSTR("styleAttributes");
  else
    v12 = CFSTR("style_attributes");
  objc_msgSend(v5, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = [GEOStyleAttributes alloc];
    if ((a3 & 1) != 0)
      v15 = -[GEOStyleAttributes initWithJSON:](v14, "initWithJSON:", v13);
    else
      v15 = -[GEOStyleAttributes initWithDictionary:](v14, "initWithDictionary:", v13);
    v16 = (void *)v15;
    objc_msgSend(a1, "setStyleAttributes:", v15);

  }
  if (a3)
    v17 = CFSTR("labelInfo");
  else
    v17 = CFSTR("label_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = [GEOLabelInfo alloc];
    if ((a3 & 1) != 0)
      v20 = -[GEOLabelInfo initWithJSON:](v19, "initWithJSON:", v18);
    else
      v20 = -[GEOLabelInfo initWithDictionary:](v19, "initWithDictionary:", v18);
    v21 = (void *)v20;
    objc_msgSend(a1, "setLabelInfo:", v20);

  }
  if (a3)
    v22 = CFSTR("preserveStyleInUpdates");
  else
    v22 = CFSTR("preserve_style_in_updates");
  objc_msgSend(v5, "objectForKeyedSubscript:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setPreserveStyleInUpdates:", objc_msgSend(v23, "BOOLValue"));

  if (a3)
    v24 = CFSTR("laneChangeInfo");
  else
    v24 = CFSTR("lane_change_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v36 = v5;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v26 = v25;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v38 != v29)
            objc_enumerationMutation(v26);
          v31 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v32 = [GEOLaneChangeInfo alloc];
            if ((a3 & 1) != 0)
              v33 = -[GEOLaneChangeInfo initWithJSON:](v32, "initWithJSON:", v31);
            else
              v33 = -[GEOLaneChangeInfo initWithDictionary:](v32, "initWithDictionary:", v31);
            v34 = (void *)v33;
            objc_msgSend(a1, "addLaneChangeInfo:", v33);

          }
        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      }
      while (v28);
    }

    v5 = v36;
  }

LABEL_57:
  return a1;
}

- (GEORouteLineStyleInfo)initWithJSON:(id)a3
{
  return (GEORouteLineStyleInfo *)-[GEORouteLineStyleInfo _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_5355;
    else
      v8 = (int *)&readAll__nonRecursiveTag_5356;
    GEORouteLineStyleInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEORouteLineStyleInfoCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORouteLineStyleInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORouteLineStyleInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  __int16 flags;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
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
  if (self->_reader && (_GEORouteLineStyleInfoIsDirty((uint64_t)self) & 1) == 0)
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
    goto LABEL_25;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORouteLineStyleInfo readAll:](self, "readAll:", 0);
  flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((flags & 4) == 0)
      goto LABEL_5;
LABEL_22:
    PBDataWriterWriteUint32Field();
    if ((*(_WORD *)&self->_flags & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  PBDataWriterWriteInt32Field();
  flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_22;
LABEL_5:
  if ((flags & 1) != 0)
LABEL_6:
    PBDataWriterWriteUint32Field();
LABEL_7:
  if (self->_styleAttributes)
    PBDataWriterWriteSubmessage();
  if (self->_labelInfo)
    PBDataWriterWriteSubmessage();
  if ((*(_WORD *)&self->_flags & 8) != 0)
    PBDataWriterWriteBOOLField();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = self->_laneChangeInfos;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v13);
LABEL_25:

}

- (void)copyTo:(id)a3
{
  id *v4;
  __int16 flags;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  id *v10;

  v10 = (id *)a3;
  -[GEORouteLineStyleInfo readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v10 + 1, self->_reader);
  *((_DWORD *)v10 + 12) = self->_readerMarkPos;
  *((_DWORD *)v10 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v10;
  flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v10 + 16) = self->_purpose;
    *((_WORD *)v10 + 38) |= 2u;
    flags = (__int16)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v10 + 17) = self->_startOffsetCm;
  *((_WORD *)v10 + 38) |= 4u;
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
LABEL_4:
    *((_DWORD *)v10 + 15) = self->_endOffsetCm;
    *((_WORD *)v10 + 38) |= 1u;
  }
LABEL_5:
  if (self->_styleAttributes)
  {
    objc_msgSend(v10, "setStyleAttributes:");
    v4 = v10;
  }
  if (self->_labelInfo)
  {
    objc_msgSend(v10, "setLabelInfo:");
    v4 = v10;
  }
  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
    *((_BYTE *)v4 + 72) = self->_preserveStyleInUpdates;
    *((_WORD *)v4 + 38) |= 8u;
  }
  if (-[GEORouteLineStyleInfo laneChangeInfosCount](self, "laneChangeInfosCount"))
  {
    objc_msgSend(v10, "clearLaneChangeInfos");
    v6 = -[GEORouteLineStyleInfo laneChangeInfosCount](self, "laneChangeInfosCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[GEORouteLineStyleInfo laneChangeInfoAtIndex:](self, "laneChangeInfoAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addLaneChangeInfo:", v9);

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
  __int16 flags;
  id v10;
  void *v11;
  id v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  PBUnknownFields *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
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
      GEORouteLineStyleInfoReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_19;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORouteLineStyleInfo readAll:](self, "readAll:", 0);
  flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((flags & 4) == 0)
      goto LABEL_7;
LABEL_21:
    *(_DWORD *)(v5 + 68) = self->_startOffsetCm;
    *(_WORD *)(v5 + 76) |= 4u;
    if ((*(_WORD *)&self->_flags & 1) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  *(_DWORD *)(v5 + 64) = self->_purpose;
  *(_WORD *)(v5 + 76) |= 2u;
  flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_21;
LABEL_7:
  if ((flags & 1) != 0)
  {
LABEL_8:
    *(_DWORD *)(v5 + 60) = self->_endOffsetCm;
    *(_WORD *)(v5 + 76) |= 1u;
  }
LABEL_9:
  v10 = -[GEOStyleAttributes copyWithZone:](self->_styleAttributes, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v10;

  v12 = -[GEOLabelInfo copyWithZone:](self->_labelInfo, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v12;

  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
    *(_BYTE *)(v5 + 72) = self->_preserveStyleInUpdates;
    *(_WORD *)(v5 + 76) |= 8u;
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v14 = self->_laneChangeInfos;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v14);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v21);
        objc_msgSend((id)v5, "addLaneChangeInfo:", v18);

      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v15);
  }

  v19 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v19;
LABEL_19:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 flags;
  __int16 v6;
  GEOStyleAttributes *styleAttributes;
  GEOLabelInfo *labelInfo;
  __int16 v9;
  char v10;
  NSMutableArray *laneChangeInfos;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_25;
  -[GEORouteLineStyleInfo readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = (__int16)self->_flags;
  v6 = *((_WORD *)v4 + 38);
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_purpose != *((_DWORD *)v4 + 16))
      goto LABEL_25;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_25;
  }
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_startOffsetCm != *((_DWORD *)v4 + 17))
      goto LABEL_25;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_25;
  }
  if ((flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_endOffsetCm != *((_DWORD *)v4 + 15))
      goto LABEL_25;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_25;
  }
  styleAttributes = self->_styleAttributes;
  if ((unint64_t)styleAttributes | *((_QWORD *)v4 + 5)
    && !-[GEOStyleAttributes isEqual:](styleAttributes, "isEqual:"))
  {
    goto LABEL_25;
  }
  labelInfo = self->_labelInfo;
  if ((unint64_t)labelInfo | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOLabelInfo isEqual:](labelInfo, "isEqual:"))
      goto LABEL_25;
  }
  v9 = *((_WORD *)v4 + 38);
  if ((*(_WORD *)&self->_flags & 8) == 0)
  {
    if ((v9 & 8) == 0)
      goto LABEL_31;
LABEL_25:
    v10 = 0;
    goto LABEL_26;
  }
  if ((v9 & 8) == 0)
    goto LABEL_25;
  if (!self->_preserveStyleInUpdates)
  {
    if (!*((_BYTE *)v4 + 72))
      goto LABEL_31;
    goto LABEL_25;
  }
  if (!*((_BYTE *)v4 + 72))
    goto LABEL_25;
LABEL_31:
  laneChangeInfos = self->_laneChangeInfos;
  if ((unint64_t)laneChangeInfos | *((_QWORD *)v4 + 4))
    v10 = -[NSMutableArray isEqual:](laneChangeInfos, "isEqual:");
  else
    v10 = 1;
LABEL_26:

  return v10;
}

- (unint64_t)hash
{
  __int16 flags;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;

  -[GEORouteLineStyleInfo readAll:](self, "readAll:", 1);
  flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
    v4 = 0;
    if ((flags & 4) != 0)
      goto LABEL_3;
LABEL_6:
    v5 = 0;
    if ((flags & 1) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v4 = 2654435761 * self->_purpose;
  if ((flags & 4) == 0)
    goto LABEL_6;
LABEL_3:
  v5 = 2654435761 * self->_startOffsetCm;
  if ((flags & 1) != 0)
  {
LABEL_4:
    v6 = 2654435761 * self->_endOffsetCm;
    goto LABEL_8;
  }
LABEL_7:
  v6 = 0;
LABEL_8:
  v7 = -[GEOStyleAttributes hash](self->_styleAttributes, "hash");
  v8 = -[GEOLabelInfo hash](self->_labelInfo, "hash");
  if ((*(_WORD *)&self->_flags & 8) != 0)
    v9 = 2654435761 * self->_preserveStyleInUpdates;
  else
    v9 = 0;
  return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ -[NSMutableArray hash](self->_laneChangeInfos, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  GEOStyleAttributes *styleAttributes;
  uint64_t v7;
  GEOLabelInfo *labelInfo;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  v5 = *((_WORD *)v4 + 38);
  if ((v5 & 2) != 0)
  {
    self->_purpose = *((_DWORD *)v4 + 16);
    *(_WORD *)&self->_flags |= 2u;
    v5 = *((_WORD *)v4 + 38);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_startOffsetCm = *((_DWORD *)v4 + 17);
  *(_WORD *)&self->_flags |= 4u;
  if ((*((_WORD *)v4 + 38) & 1) != 0)
  {
LABEL_4:
    self->_endOffsetCm = *((_DWORD *)v4 + 15);
    *(_WORD *)&self->_flags |= 1u;
  }
LABEL_5:
  styleAttributes = self->_styleAttributes;
  v7 = *((_QWORD *)v4 + 5);
  if (styleAttributes)
  {
    if (v7)
      -[GEOStyleAttributes mergeFrom:](styleAttributes, "mergeFrom:");
  }
  else if (v7)
  {
    -[GEORouteLineStyleInfo setStyleAttributes:](self, "setStyleAttributes:");
  }
  labelInfo = self->_labelInfo;
  v9 = *((_QWORD *)v4 + 3);
  if (labelInfo)
  {
    if (v9)
      -[GEOLabelInfo mergeFrom:](labelInfo, "mergeFrom:");
  }
  else if (v9)
  {
    -[GEORouteLineStyleInfo setLabelInfo:](self, "setLabelInfo:");
  }
  if ((*((_WORD *)v4 + 38) & 8) != 0)
  {
    self->_preserveStyleInUpdates = *((_BYTE *)v4 + 72);
    *(_WORD *)&self->_flags |= 8u;
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = *((id *)v4 + 4);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        -[GEORouteLineStyleInfo addLaneChangeInfo:](self, "addLaneChangeInfo:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), (_QWORD)v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 0x10) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEORouteLineStyleInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_5359);
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
  *(_WORD *)&self->_flags |= 0x110u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEORouteLineStyleInfo readAll:](self, "readAll:", 0);
    -[GEOStyleAttributes clearUnknownFields:](self->_styleAttributes, "clearUnknownFields:", 1);
    -[GEOLabelInfo clearUnknownFields:](self->_labelInfo, "clearUnknownFields:", 1);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = self->_laneChangeInfos;
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
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_laneChangeInfos, 0);
  objc_storeStrong((id *)&self->_labelInfo, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
