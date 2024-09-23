@implementation GEOPDTrail

- (GEOPDTrail)init
{
  GEOPDTrail *v2;
  GEOPDTrail *v3;
  GEOPDTrail *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDTrail;
  v2 = -[GEOPDTrail init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDTrail)initWithData:(id)a3
{
  GEOPDTrail *v3;
  GEOPDTrail *v4;
  GEOPDTrail *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDTrail;
  v3 = -[GEOPDTrail initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readEntity
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDTrailReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEntity_tags_6807);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)entity
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDTrail _readEntity]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (void)_readFactoid
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDTrailReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFactoid_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)factoid
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDTrail _readFactoid]((uint64_t)a1);
    a1 = (id *)v1[5];
  }
  return a1;
}

- (void)_readMapsIds
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDTrailReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapsIds_tags_6808);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)mapsIds
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDTrail _readMapsIds]((uint64_t)a1);
    a1 = (id *)v1[7];
  }
  return a1;
}

- (void)addMapsId:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDTrail _readMapsIds](a1);
    -[GEOPDTrail _addNoFlagsMapsId:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 88) |= 0x40u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    *(_WORD *)(a1 + 88) |= 0x100u;
  }
}

- (void)_addNoFlagsMapsId:(uint64_t)a1
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

- (void)_readPhoto
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDTrailReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPhoto_tags_6809);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)photo
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDTrail _readPhoto]((uint64_t)a1);
    a1 = (id *)v1[8];
  }
  return a1;
}

- (void)addHoursOfOperation:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x20) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        v5 = v4;
        objc_sync_enter(v5);
        GEOPDTrailReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readHoursOfOperations_tags_6810);
        objc_sync_exit(v5);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    -[GEOPDTrail _addNoFlagsHoursOfOperation:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 88) |= 0x20u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    *(_WORD *)(a1 + 88) |= 0x100u;
  }
}

- (void)_addNoFlagsHoursOfOperation:(uint64_t)a1
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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOPDTrail;
  -[GEOPDTrail description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDTrail dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDTrail _dictionaryRepresentation:]((uint64_t)self, 0);
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
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  _QWORD v45[4];
  id v46;
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
  if (!a1)
    return 0;
  -[GEOPDTrail readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDTrail entity]((id *)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v5, "jsonRepresentation");
    else
      objc_msgSend(v5, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("entity"));

  }
  -[GEOPDTrail factoid]((id *)a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v8, "jsonRepresentation");
    else
      objc_msgSend(v8, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("factoid"));

  }
  if (objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v12 = *(id *)(a1 + 56);
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v52 != v14)
            objc_enumerationMutation(v12);
          v16 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v16, "jsonRepresentation");
          else
            objc_msgSend(v16, "dictionaryRepresentation");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v17);

        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
      }
      while (v13);
    }

    if (a2)
      v18 = CFSTR("mapsId");
    else
      v18 = CFSTR("maps_id");
    objc_msgSend(v4, "setObject:forKey:", v11, v18);

  }
  -[GEOPDTrail photo]((id *)a1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v19, "jsonRepresentation");
    else
      objc_msgSend(v19, "dictionaryRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("photo"));

  }
  if ((*(_WORD *)(a1 + 88) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 84));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v23 = CFSTR("shouldHighlight");
    else
      v23 = CFSTR("should_highlight");
    objc_msgSend(v4, "setObject:forKey:", v22, v23);

  }
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v25 = *(id *)(a1 + 48);
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    if (v26)
    {
      v27 = *(_QWORD *)v48;
      do
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v48 != v27)
            objc_enumerationMutation(v25);
          v29 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v29, "jsonRepresentation");
          else
            objc_msgSend(v29, "dictionaryRepresentation");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addObject:", v30);

        }
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
      }
      while (v26);
    }

    if (a2)
      v31 = CFSTR("hoursOfOperation");
    else
      v31 = CFSTR("hours_of_operation");
    objc_msgSend(v4, "setObject:forKey:", v24, v31);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
  if ((*(_WORD *)(a1 + 88) & 4) == 0)
  {
    v32 = *(void **)(a1 + 8);
    if (v32)
    {
      v33 = v32;
      objc_sync_enter(v33);
      GEOPDTrailReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBusinessHours_tags_0);
      objc_sync_exit(v33);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  v34 = *(id *)(a1 + 24);
  v35 = v34;
  if (v34)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v34, "jsonRepresentation");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = CFSTR("businessHours");
    }
    else
    {
      objc_msgSend(v34, "dictionaryRepresentation");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = CFSTR("business_hours");
    }
    objc_msgSend(v4, "setObject:forKey:", v36, v37);

  }
  v38 = *(void **)(a1 + 16);
  if (v38)
  {
    objc_msgSend(v38, "dictionaryRepresentation");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v39;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v39, "count"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __40__GEOPDTrail__dictionaryRepresentation___block_invoke;
      v45[3] = &unk_1E1C00600;
      v42 = v41;
      v46 = v42;
      objc_msgSend(v40, "enumerateKeysAndObjectsUsingBlock:", v45);
      v43 = v42;

    }
    else
    {
      v43 = v39;
    }
    objc_msgSend(v4, "setObject:forKey:", v43, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDTrail _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_6816;
      else
        v6 = (int *)&readAll__nonRecursiveTag_6817;
      GEOPDTrailReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDTrailCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

void __40__GEOPDTrail__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDTrailReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  __int16 flags;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t k;
  GEOPDBusinessHours *businessHours;
  char IsDirty;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  PBDataReader *v20;
  void *v21;
  NSMutableArray *obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader)
    goto LABEL_7;
  os_unfair_lock_assert_owner(&self->_readerLock);
  flags = (__int16)self->_flags;
  if ((flags & 0x100) != 0)
    goto LABEL_7;
  if ((flags & 8) != 0)
  {
    if ((GEOPDEntityIsDirty((os_unfair_lock_s *)self->_entity) & 1) != 0)
      goto LABEL_7;
    flags = (__int16)self->_flags;
  }
  if ((flags & 0x50) == 0)
  {
    if ((flags & 0x80) != 0)
    {
      if (GEOPDPhotoIsDirty((uint64_t)self->_photo))
        goto LABEL_7;
      flags = (__int16)self->_flags;
    }
    if ((flags & 0x20) == 0)
    {
      if ((flags & 4) != 0)
      {
        businessHours = self->_businessHours;
        if (businessHours)
        {
          os_unfair_lock_lock_with_options();
          IsDirty = _GEOPDBusinessHoursIsDirty((uint64_t)businessHours);
          os_unfair_lock_unlock(&businessHours->_readerLock);
          if ((IsDirty & 1) != 0)
            goto LABEL_7;
        }
        if ((*(_WORD *)&self->_flags & 0x20) != 0)
        {
          v33 = 0u;
          v34 = 0u;
          v31 = 0u;
          v32 = 0u;
          obj = self->_hoursOfOperations;
          v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
          if (v17)
          {
            v18 = *(_QWORD *)v32;
            while (2)
            {
              for (i = 0; i != v17; ++i)
              {
                if (*(_QWORD *)v32 != v18)
                  objc_enumerationMutation(obj);
                if (GEOPDHoursIsDirty(*(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i)))
                {

                  goto LABEL_7;
                }
              }
              v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
              if (v17)
                continue;
              break;
            }
          }

        }
      }
      v20 = self->_reader;
      objc_sync_enter(v20);
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "writeData:", v21);
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v20);
      goto LABEL_32;
    }
  }
LABEL_7:
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDTrail readAll:]((uint64_t)self, 0);
  if (self->_entity)
    PBDataWriterWriteSubmessage();
  if (self->_factoid)
    PBDataWriterWriteSubmessage();
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v7 = self->_mapsIds;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v8; ++j)
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    }
    while (v8);
  }

  if (self->_photo)
    PBDataWriterWriteSubmessage();
  if ((*(_WORD *)&self->_flags & 1) != 0)
    PBDataWriterWriteBOOLField();
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v11 = self->_hoursOfOperations;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v24;
    do
    {
      for (k = 0; k != v12; ++k)
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(v11);
        PBDataWriterWriteSubmessage();
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
    }
    while (v12);
  }

  if (self->_businessHours)
    PBDataWriterWriteSubmessage();
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);
LABEL_32:

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
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  void *v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  id v25;
  void *v26;
  PBUnknownFields *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
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
      GEOPDTrailReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_22;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDTrail readAll:]((uint64_t)self, 0);
  v9 = -[GEOPDEntity copyWithZone:](self->_entity, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v9;

  v11 = -[GEOPDTrailHeadTrailFactoidData copyWithZone:](self->_factoid, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v11;

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v13 = self->_mapsIds;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v34 != v15)
          objc_enumerationMutation(v13);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "copyWithZone:", a3);
        -[GEOPDTrail addMapsId:](v5, v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v14);
  }

  v18 = -[GEOPDPhoto copyWithZone:](self->_photo, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v18;

  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *(_BYTE *)(v5 + 84) = self->_shouldHighlight;
    *(_WORD *)(v5 + 88) |= 1u;
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v20 = self->_hoursOfOperations;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v30 != v22)
          objc_enumerationMutation(v20);
        v24 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v29);
        -[GEOPDTrail addHoursOfOperation:](v5, v24);

      }
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v21);
  }

  v25 = -[GEOPDBusinessHours copyWithZone:](self->_businessHours, "copyWithZone:", a3);
  v26 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v25;

  v27 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v27;
LABEL_22:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOPDEntity *entity;
  GEOPDTrailHeadTrailFactoidData *factoid;
  NSMutableArray *mapsIds;
  GEOPDPhoto *photo;
  __int16 v9;
  NSMutableArray *hoursOfOperations;
  GEOPDBusinessHours *businessHours;
  char v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  -[GEOPDTrail readAll:]((uint64_t)self, 1);
  -[GEOPDTrail readAll:]((uint64_t)v4, 1);
  entity = self->_entity;
  if ((unint64_t)entity | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOPDEntity isEqual:](entity, "isEqual:"))
      goto LABEL_22;
  }
  factoid = self->_factoid;
  if ((unint64_t)factoid | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOPDTrailHeadTrailFactoidData isEqual:](factoid, "isEqual:"))
      goto LABEL_22;
  }
  mapsIds = self->_mapsIds;
  if ((unint64_t)mapsIds | *((_QWORD *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](mapsIds, "isEqual:"))
      goto LABEL_22;
  }
  photo = self->_photo;
  if ((unint64_t)photo | *((_QWORD *)v4 + 8))
  {
    if (!-[GEOPDPhoto isEqual:](photo, "isEqual:"))
      goto LABEL_22;
  }
  v9 = *((_WORD *)v4 + 44);
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    if ((v9 & 1) != 0)
    {
      if (self->_shouldHighlight)
      {
        if (!*((_BYTE *)v4 + 84))
          goto LABEL_22;
        goto LABEL_18;
      }
      if (!*((_BYTE *)v4 + 84))
        goto LABEL_18;
    }
LABEL_22:
    v12 = 0;
    goto LABEL_23;
  }
  if ((v9 & 1) != 0)
    goto LABEL_22;
LABEL_18:
  hoursOfOperations = self->_hoursOfOperations;
  if ((unint64_t)hoursOfOperations | *((_QWORD *)v4 + 6)
    && !-[NSMutableArray isEqual:](hoursOfOperations, "isEqual:"))
  {
    goto LABEL_22;
  }
  businessHours = self->_businessHours;
  if ((unint64_t)businessHours | *((_QWORD *)v4 + 3))
    v12 = -[GEOPDBusinessHours isEqual:](businessHours, "isEqual:");
  else
    v12 = 1;
LABEL_23:

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  -[GEOPDTrail readAll:]((uint64_t)self, 1);
  v3 = -[GEOPDEntity hash](self->_entity, "hash");
  v4 = -[GEOPDTrailHeadTrailFactoidData hash](self->_factoid, "hash");
  v5 = -[NSMutableArray hash](self->_mapsIds, "hash");
  v6 = -[GEOPDPhoto hash](self->_photo, "hash");
  if ((*(_WORD *)&self->_flags & 1) != 0)
    v7 = 2654435761 * self->_shouldHighlight;
  else
    v7 = 0;
  v8 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ -[NSMutableArray hash](self->_hoursOfOperations, "hash");
  return v8 ^ -[GEOPDBusinessHours hash](self->_businessHours, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photo, 0);
  objc_storeStrong((id *)&self->_mapsIds, 0);
  objc_storeStrong((id *)&self->_hoursOfOperations, 0);
  objc_storeStrong((id *)&self->_factoid, 0);
  objc_storeStrong((id *)&self->_entity, 0);
  objc_storeStrong((id *)&self->_businessHours, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
