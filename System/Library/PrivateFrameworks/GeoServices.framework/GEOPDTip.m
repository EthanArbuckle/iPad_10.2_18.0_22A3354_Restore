@implementation GEOPDTip

+ (id)tipsForPlaceData:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  objc_msgSend(v3, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __46__GEOPDTip_PlaceDataExtras__tipsForPlaceData___block_invoke;
  v10[3] = &unk_1E1C09968;
  v11 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateValidComponentValuesOfType:usingBlock:", 36, v10);

  if (objc_msgSend(v6, "count"))
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  return v8;
}

void __46__GEOPDTip_PlaceDataExtras__tipsForPlaceData___block_invoke(uint64_t a1, id *a2)
{
  void *v3;
  void *v4;

  -[GEOPDComponentValue tip](a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = v4;
  }

}

- (GEOPDTip)init
{
  GEOPDTip *v2;
  GEOPDTip *v3;
  GEOPDTip *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDTip;
  v2 = -[GEOPDTip init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDTip)initWithData:(id)a3
{
  GEOPDTip *v3;
  GEOPDTip *v4;
  GEOPDTip *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDTip;
  v3 = -[GEOPDTip initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readSnippets
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
        GEOPDTipReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSnippets_tags_6742);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)snippets
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDTip _readSnippets]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (void)addSnippet:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDTip _readSnippets](a1);
    -[GEOPDTip _addNoFlagsSnippet:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 68) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(_BYTE *)(a1 + 68) |= 0x20u;
  }
}

- (void)_addNoFlagsSnippet:(uint64_t)a1
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

- (void)_readTipster
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
        GEOPDTipReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTipster_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)tipster
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDTip _readTipster]((uint64_t)a1);
    a1 = (id *)v1[6];
  }
  return a1;
}

- (void)_readTipId
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
        GEOPDTipReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTipId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)tipId
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDTip _readTipId]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
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
  v8.super_class = (Class)GEOPDTip;
  -[GEOPDTip description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDTip dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDTip _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v20[4];
  id v21;

  if (!a1)
    return 0;
  -[GEOPDTip readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 24))
  {
    -[GEOPDTip snippets]((id *)a1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("snippet"));

  }
  if ((*(_BYTE *)(a1 + 68) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("tipTime");
    else
      v7 = CFSTR("tip_time");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
  -[GEOPDTip tipster]((id *)a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v8, "jsonRepresentation");
    else
      objc_msgSend(v8, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("tipster"));

  }
  -[GEOPDTip tipId]((id *)a1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (a2)
      v12 = CFSTR("tipId");
    else
      v12 = CFSTR("tip_id");
    objc_msgSend(v4, "setObject:forKey:", v11, v12);
  }

  v13 = *(void **)(a1 + 16);
  if (v13)
  {
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v14, "count"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __38__GEOPDTip__dictionaryRepresentation___block_invoke;
      v20[3] = &unk_1E1C00600;
      v17 = v16;
      v21 = v17;
      objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v20);
      v18 = v17;

      v15 = v18;
    }
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDTip _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_6754;
      else
        v6 = (int *)&readAll__nonRecursiveTag_6755;
      GEOPDTipReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      -[GEOPDTipUser readAll:](*(_QWORD *)(a1 + 48), 1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

void __38__GEOPDTip__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDTipReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  char flags;
  GEOPDTipUser *tipster;
  BOOL IsDirty;
  PBDataReader *v9;
  void *v10;
  NSMutableArray *v11;
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
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader)
    goto LABEL_9;
  os_unfair_lock_assert_owner(&self->_readerLock);
  flags = (char)self->_flags;
  if ((flags & 0x24) != 0)
    goto LABEL_9;
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    tipster = self->_tipster;
    if (tipster)
    {
      os_unfair_lock_lock_with_options();
      IsDirty = _GEOPDTipUserIsDirty((uint64_t)tipster);
      os_unfair_lock_unlock(&tipster->_readerLock);
      if (IsDirty)
        goto LABEL_9;
      flags = (char)self->_flags;
    }
  }
  if ((flags & 8) == 0)
  {
    v9 = self->_reader;
    objc_sync_enter(v9);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v10);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v9);
    goto LABEL_23;
  }
LABEL_9:
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDTip readAll:]((uint64_t)self, 0);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v11 = self->_snippets;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v11);
        PBDataWriterWriteStringField();
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

  if ((*(_BYTE *)&self->_flags & 1) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_tipster)
    PBDataWriterWriteSubmessage();
  if (self->_tipId)
    PBDataWriterWriteStringField();
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v15);
LABEL_23:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  PBUnknownFields *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
      GEOPDTipReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_15;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDTip readAll:]((uint64_t)self, 0);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = self->_snippets;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v9);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v20);
        -[GEOPDTip addSnippet:](v5, v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(double *)(v5 + 40) = self->_tipTime;
    *(_BYTE *)(v5 + 68) |= 1u;
  }
  v14 = -[GEOPDTipUser copyWithZone:](self->_tipster, "copyWithZone:", a3, (_QWORD)v20);
  v15 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v14;

  v16 = -[NSString copyWithZone:](self->_tipId, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v16;

  v18 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v18;
LABEL_15:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *snippets;
  GEOPDTipUser *tipster;
  NSString *tipId;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  -[GEOPDTip readAll:]((uint64_t)self, 1);
  -[GEOPDTip readAll:]((uint64_t)v4, 1);
  snippets = self->_snippets;
  if ((unint64_t)snippets | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](snippets, "isEqual:"))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 1) == 0 || self->_tipTime != *((double *)v4 + 5))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 68) & 1) != 0)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  tipster = self->_tipster;
  if ((unint64_t)tipster | *((_QWORD *)v4 + 6) && !-[GEOPDTipUser isEqual:](tipster, "isEqual:"))
    goto LABEL_13;
  tipId = self->_tipId;
  if ((unint64_t)tipId | *((_QWORD *)v4 + 4))
    v8 = -[NSString isEqual:](tipId, "isEqual:");
  else
    v8 = 1;
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  double tipTime;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  unint64_t v10;

  -[GEOPDTip readAll:]((uint64_t)self, 1);
  v3 = -[NSMutableArray hash](self->_snippets, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    tipTime = self->_tipTime;
    v6 = -tipTime;
    if (tipTime >= 0.0)
      v6 = self->_tipTime;
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
  v9 = v4 ^ v3;
  v10 = -[GEOPDTipUser hash](self->_tipster, "hash");
  return v9 ^ v10 ^ -[NSString hash](self->_tipId, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tipster, 0);
  objc_storeStrong((id *)&self->_tipId, 0);
  objc_storeStrong((id *)&self->_snippets, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
