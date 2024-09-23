@implementation GEOLPRWorld

- (GEOLPRWorld)init
{
  GEOLPRWorld *v2;
  GEOLPRWorld *v3;
  GEOLPRWorld *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOLPRWorld;
  v2 = -[GEOLPRWorld init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLPRWorld)initWithData:(id)a3
{
  GEOLPRWorld *v3;
  GEOLPRWorld *v4;
  GEOLPRWorld *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOLPRWorld;
  v3 = -[GEOLPRWorld initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_addNoFlagsRegions:(uint64_t)a1
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

- (void)_addNoFlagsPowerTypes:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 16);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = v5;

      v4 = *(void **)(a1 + 16);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)_addNoFlagsVehicleTypes:(uint64_t)a1
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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOLPRWorld;
  -[GEOLPRWorld description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLPRWorld dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLPRWorld _dictionaryRepresentation:]((id *)&self->super.super.isa, 0);
}

- (id)_dictionaryRepresentation:(id *)a1
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
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
  const __CFString *v30;
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
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOLPRWorld readAll:]((uint64_t)a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1[3], "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a1[3], "count"));
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v6 = a1[3];
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v41 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v11, "jsonRepresentation");
          else
            objc_msgSend(v11, "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      }
      while (v8);
    }

    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("regions"));
  }
  if (objc_msgSend(a1[2], "count"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a1[2], "count"));
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v14 = a1[2];
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v37;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v37 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v19, "jsonRepresentation");
          else
            objc_msgSend(v19, "dictionaryRepresentation");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v20);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
      }
      while (v16);
    }

    if (a2)
      v21 = CFSTR("powerTypes");
    else
      v21 = CFSTR("power_types");
    objc_msgSend(v4, "setObject:forKey:", v13, v21);

  }
  if (objc_msgSend(a1[4], "count"))
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a1[4], "count"));
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v23 = a1[4];
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v33;
      do
      {
        for (k = 0; k != v25; ++k)
        {
          if (*(_QWORD *)v33 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * k);
          if ((a2 & 1) != 0)
            objc_msgSend(v28, "jsonRepresentation");
          else
            objc_msgSend(v28, "dictionaryRepresentation", (_QWORD)v32);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObject:", v29, (_QWORD)v32);

        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
      }
      while (v25);
    }

    if (a2)
      v30 = CFSTR("vehicleTypes");
    else
      v30 = CFSTR("vehicle_types");
    objc_msgSend(v4, "setObject:forKey:", v22, v30, (_QWORD)v32);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLPRWorld _dictionaryRepresentation:]((id *)&self->super.super.isa, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t k;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_453;
      else
        v6 = (int *)&readAll__nonRecursiveTag_454;
      GEOLPRWorldReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
    {
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v7 = *(id *)(a1 + 24);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v28 != v9)
              objc_enumerationMutation(v7);
            objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "readAll:", 1);
          }
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
        }
        while (v8);
      }

      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v11 = *(id *)(a1 + 16);
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v24;
        do
        {
          for (j = 0; j != v12; ++j)
          {
            if (*(_QWORD *)v24 != v13)
              objc_enumerationMutation(v11);
            -[GEOLPRPowerTypeMap readAll:](*(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j), 1);
          }
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
        }
        while (v12);
      }

      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v15 = *(id *)(a1 + 32);
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v19, v31, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v20;
        do
        {
          for (k = 0; k != v16; ++k)
          {
            if (*(_QWORD *)v20 != v17)
              objc_enumerationMutation(v15);
            -[GEOLPRVehicleTypeMap readAll:](*(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * k), 1);
          }
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v19, v31, 16);
        }
        while (v16);
      }

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOLPRWorldReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  char flags;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  os_unfair_lock_s *v11;
  unsigned __int8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  os_unfair_lock_s *v16;
  unsigned __int8 v17;
  PBDataReader *v18;
  void *v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  NSMutableArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
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
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader)
    goto LABEL_27;
  os_unfair_lock_assert_owner(&self->_readerLock);
  flags = (char)self->_flags;
  if ((flags & 0xF) != 0)
    goto LABEL_27;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v7 = self->_powerTypes;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v49;
LABEL_6:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v49 != v9)
          objc_enumerationMutation(v7);
        v11 = *(os_unfair_lock_s **)(*((_QWORD *)&v48 + 1) + 8 * v10);
        if (v11)
        {
          os_unfair_lock_lock_with_options();
          v12 = _GEOLPRPowerTypeMapIsDirty((uint64_t)v11);
          os_unfair_lock_unlock(v11 + 10);
          if ((v12 & 1) != 0)
            goto LABEL_26;
        }
        if (v8 == ++v10)
        {
          v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
          if (v8)
            goto LABEL_6;
          break;
        }
      }
    }

    flags = (char)self->_flags;
  }
  if ((flags & 4) == 0)
  {
LABEL_25:
    v18 = self->_reader;
    objc_sync_enter(v18);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v19);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v18);
    goto LABEL_49;
  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v7 = self->_vehicleTypes;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
  if (!v13)
  {
LABEL_24:

    goto LABEL_25;
  }
  v14 = *(_QWORD *)v45;
LABEL_17:
  v15 = 0;
  while (1)
  {
    if (*(_QWORD *)v45 != v14)
      objc_enumerationMutation(v7);
    v16 = *(os_unfair_lock_s **)(*((_QWORD *)&v44 + 1) + 8 * v15);
    if (v16)
    {
      os_unfair_lock_lock_with_options();
      v17 = _GEOLPRVehicleTypeMapIsDirty((uint64_t)v16);
      os_unfair_lock_unlock(v16 + 10);
      if ((v17 & 1) != 0)
        break;
    }
    if (v13 == ++v15)
    {
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
      if (v13)
        goto LABEL_17;
      goto LABEL_24;
    }
  }
LABEL_26:

LABEL_27:
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOLPRWorld readAll:]((uint64_t)self, 0);
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v20 = self->_regions;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v41 != v22)
          objc_enumerationMutation(v20);
        PBDataWriterWriteSubmessage();
      }
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
    }
    while (v21);
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v24 = self->_powerTypes;
  v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v36, v53, 16);
  if (v25)
  {
    v26 = *(_QWORD *)v37;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v37 != v26)
          objc_enumerationMutation(v24);
        PBDataWriterWriteSubmessage();
      }
      v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v36, v53, 16);
    }
    while (v25);
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v28 = self->_vehicleTypes;
  v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v32, v52, 16);
  if (v29)
  {
    v30 = *(_QWORD *)v33;
    do
    {
      for (k = 0; k != v29; ++k)
      {
        if (*(_QWORD *)v33 != v30)
          objc_enumerationMutation(v28);
        PBDataWriterWriteSubmessage();
      }
      v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v32, v52, 16);
    }
    while (v29);
  }

LABEL_49:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  GEOLPRWorld *v8;
  PBDataReader *v9;
  uint64_t v10;
  uint64_t v11;
  os_unfair_lock_s *v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  os_unfair_lock_s *v21;
  uint64_t j;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  os_unfair_lock_s *v30;
  uint64_t k;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  GEOLPRWorld *v38;
  NSMutableArray *obj;
  NSMutableArray *obja;
  NSMutableArray *objb;
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
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v8 = self;
    v9 = reader;
    objc_sync_enter(v9);
    if ((*(_BYTE *)&v8->_flags & 8) == 0)
    {
      *(_QWORD *)((char *)v8->_reader + (int)*MEMORY[0x1E0D82BD8]) = v8->_readerMarkLength;
      -[PBDataReader seekToOffset:](v8->_reader, "seekToOffset:", v8->_readerMarkPos);
      GEOLPRWorldReadAllFrom(v5, v8->_reader);
      os_unfair_lock_unlock(p_readerLock);
      objc_sync_exit(v9);

      return (id)v5;
    }
    objc_sync_exit(v9);

    self = v8;
  }
  os_unfair_lock_unlock(p_readerLock);
  -[GEOLPRWorld readAll:]((uint64_t)self, 0);
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v38 = self;
  obj = self->_regions;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v51;
    v12 = (os_unfair_lock_s *)(v5 + 48);
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v51 != v11)
          objc_enumerationMutation(obj);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i), "copyWithZone:", a3, v38);
        v15 = v14;
        if (v5)
        {
          v16 = v14;
          os_unfair_lock_lock(v12);
          if ((*(_BYTE *)(v5 + 52) & 2) == 0)
          {
            v17 = *(void **)(v5 + 8);
            if (v17)
            {
              v18 = v17;
              objc_sync_enter(v18);
              GEOLPRWorldReadSpecified(v5, *(_QWORD *)(v5 + 8), (int *)&_readRegions_tags_4);
              objc_sync_exit(v18);

            }
          }
          os_unfair_lock_unlock(v12);
          -[GEOLPRWorld _addNoFlagsRegions:](v5, v16);

          os_unfair_lock_lock_with_options();
          *(_BYTE *)(v5 + 52) |= 2u;
          os_unfair_lock_unlock(v12);
          *(_BYTE *)(v5 + 52) |= 8u;
        }

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
    }
    while (v10);
  }

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  obja = v38->_powerTypes;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v47;
    v21 = (os_unfair_lock_s *)(v5 + 48);
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v47 != v20)
          objc_enumerationMutation(obja);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * j), "copyWithZone:", a3);
        v24 = v23;
        if (v5)
        {
          v25 = v23;
          os_unfair_lock_lock(v21);
          if ((*(_BYTE *)(v5 + 52) & 1) == 0)
          {
            v26 = *(void **)(v5 + 8);
            if (v26)
            {
              v27 = v26;
              objc_sync_enter(v27);
              GEOLPRWorldReadSpecified(v5, *(_QWORD *)(v5 + 8), (int *)&_readPowerTypes_tags_0);
              objc_sync_exit(v27);

            }
          }
          os_unfair_lock_unlock(v21);
          -[GEOLPRWorld _addNoFlagsPowerTypes:](v5, v25);

          os_unfair_lock_lock_with_options();
          *(_BYTE *)(v5 + 52) |= 1u;
          os_unfair_lock_unlock(v21);
          *(_BYTE *)(v5 + 52) |= 8u;
        }

      }
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
    }
    while (v19);
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  objb = v38->_vehicleTypes;
  v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](objb, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
  if (v28)
  {
    v29 = *(_QWORD *)v43;
    v30 = (os_unfair_lock_s *)(v5 + 48);
    do
    {
      for (k = 0; k != v28; ++k)
      {
        if (*(_QWORD *)v43 != v29)
          objc_enumerationMutation(objb);
        v32 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * k), "copyWithZone:", a3);
        v33 = v32;
        if (v5)
        {
          v34 = v32;
          os_unfair_lock_lock(v30);
          if ((*(_BYTE *)(v5 + 52) & 4) == 0)
          {
            v35 = *(void **)(v5 + 8);
            if (v35)
            {
              v36 = v35;
              objc_sync_enter(v36);
              GEOLPRWorldReadSpecified(v5, *(_QWORD *)(v5 + 8), (int *)&_readVehicleTypes_tags_0);
              objc_sync_exit(v36);

            }
          }
          os_unfair_lock_unlock(v30);
          -[GEOLPRWorld _addNoFlagsVehicleTypes:](v5, v34);

          os_unfair_lock_lock_with_options();
          *(_BYTE *)(v5 + 52) |= 4u;
          os_unfair_lock_unlock(v30);
          *(_BYTE *)(v5 + 52) |= 8u;
        }

      }
      v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](objb, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
    }
    while (v28);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *regions;
  NSMutableArray *powerTypes;
  NSMutableArray *vehicleTypes;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOLPRWorld readAll:]((uint64_t)self, 1),
         -[GEOLPRWorld readAll:]((uint64_t)v4, 1),
         regions = self->_regions,
         !((unint64_t)regions | v4[3]))
     || -[NSMutableArray isEqual:](regions, "isEqual:"))
    && ((powerTypes = self->_powerTypes, !((unint64_t)powerTypes | v4[2]))
     || -[NSMutableArray isEqual:](powerTypes, "isEqual:")))
  {
    vehicleTypes = self->_vehicleTypes;
    if ((unint64_t)vehicleTypes | v4[4])
      v8 = -[NSMutableArray isEqual:](vehicleTypes, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  -[GEOLPRWorld readAll:]((uint64_t)self, 1);
  v3 = -[NSMutableArray hash](self->_regions, "hash");
  v4 = -[NSMutableArray hash](self->_powerTypes, "hash") ^ v3;
  return v4 ^ -[NSMutableArray hash](self->_vehicleTypes, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleTypes, 0);
  objc_storeStrong((id *)&self->_regions, 0);
  objc_storeStrong((id *)&self->_powerTypes, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
