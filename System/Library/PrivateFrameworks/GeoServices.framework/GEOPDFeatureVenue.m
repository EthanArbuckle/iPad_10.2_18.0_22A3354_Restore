@implementation GEOPDFeatureVenue

- (GEOPDFeatureVenue)init
{
  GEOPDFeatureVenue *v2;
  GEOPDFeatureVenue *v3;
  GEOPDFeatureVenue *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDFeatureVenue;
  v2 = -[GEOPDFeatureVenue init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDFeatureVenue)initWithData:(id)a3
{
  GEOPDFeatureVenue *v3;
  GEOPDFeatureVenue *v4;
  GEOPDFeatureVenue *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDFeatureVenue;
  v3 = -[GEOPDFeatureVenue initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_addNoFlagsBuilding:(uint64_t)a1
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

- (void)_addNoFlagsLevel:(uint64_t)a1
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
  v8.super_class = (Class)GEOPDFeatureVenue;
  -[GEOPDFeatureVenue description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDFeatureVenue dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDFeatureVenue _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  _QWORD v32[4];
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDFeatureVenue readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
  if ((*(_BYTE *)(a1 + 60) & 8) == 0)
  {
    v5 = *(void **)(a1 + 8);
    if (v5)
    {
      v6 = v5;
      objc_sync_enter(v6);
      GEOPDFeatureVenueReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readVenueContainer_tags_80);
      objc_sync_exit(v6);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  v7 = *(id *)(a1 + 40);
  v8 = v7;
  if (v7)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v7, "jsonRepresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("venueContainer");
    }
    else
    {
      objc_msgSend(v7, "dictionaryRepresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("venue_container");
    }
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

  }
  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v12 = *(id *)(a1 + 24);
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v39 != v14)
            objc_enumerationMutation(v12);
          v16 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v16, "jsonRepresentation");
          else
            objc_msgSend(v16, "dictionaryRepresentation");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v17);

        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      }
      while (v13);
    }

    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("building"));
  }
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v19 = *(id *)(a1 + 32);
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v35;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v35 != v21)
            objc_enumerationMutation(v19);
          v23 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v23, "jsonRepresentation");
          else
            objc_msgSend(v23, "dictionaryRepresentation");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v24);

        }
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      }
      while (v20);
    }

    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("level"));
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
      v32[2] = __47__GEOPDFeatureVenue__dictionaryRepresentation___block_invoke;
      v32[3] = &unk_1E1C00600;
      v29 = v28;
      v33 = v29;
      objc_msgSend(v27, "enumerateKeysAndObjectsUsingBlock:", v32);
      v30 = v29;

    }
    else
    {
      v30 = v26;
    }
    objc_msgSend(v4, "setObject:forKey:", v30, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDFeatureVenue _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_82;
      else
        v6 = (int *)&readAll__nonRecursiveTag_83;
      GEOPDFeatureVenueReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDFeatureVenueCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

void __47__GEOPDFeatureVenue__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDFeatureVenueReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  PBDataReader *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDFeatureVenueIsDirty((uint64_t)self) & 1) == 0)
  {
    v14 = self->_reader;
    objc_sync_enter(v14);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v15);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v14);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDFeatureVenue readAll:]((uint64_t)self, 0);
    if (self->_venueContainer)
      PBDataWriterWriteSubmessage();
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = self->_buildings;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v7);
    }

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v10 = self->_levels;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v17;
      do
      {
        for (j = 0; j != v11; ++j)
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteSubmessage();
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      }
      while (v11);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v16);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  GEOPDFeatureVenue *v8;
  PBDataReader *v9;
  id v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  os_unfair_lock_s *v15;
  uint64_t i;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  os_unfair_lock_s *v22;
  uint64_t j;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v30;
  GEOPDFeatureVenue *v31;
  NSMutableArray *obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v30 = 56;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v8 = self;
    v9 = reader;
    objc_sync_enter(v9);
    if ((*(_BYTE *)&v8->_flags & 0x10) == 0)
    {
      *(_QWORD *)((char *)v8->_reader + (int)*MEMORY[0x1E0D82BD8]) = v8->_readerMarkLength;
      -[PBDataReader seekToOffset:](v8->_reader, "seekToOffset:", v8->_readerMarkPos);
      GEOPDFeatureVenueReadAllFrom(v5, v8->_reader, 0);
      os_unfair_lock_unlock(p_readerLock);
      objc_sync_exit(v9);

      return (id)v5;
    }
    objc_sync_exit(v9);

    self = v8;
  }
  os_unfair_lock_unlock(p_readerLock);
  -[GEOPDFeatureVenue readAll:]((uint64_t)self, 0);
  v10 = -[GEOPDVenueContainer copyWithZone:](self->_venueContainer, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v10;

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v31 = self;
  v12 = self->_buildings;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v38;
    v15 = (os_unfair_lock_s *)(v5 + 56);
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v38 != v14)
          objc_enumerationMutation(v12);
        v17 = (id)objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "copyWithZone:", a3, v30);
        os_unfair_lock_lock(v15);
        if ((*(_BYTE *)(v5 + 60) & 2) == 0)
        {
          v18 = *(void **)(v5 + 8);
          if (v18)
          {
            v19 = v18;
            objc_sync_enter(v19);
            GEOPDFeatureVenueReadSpecified(v5, *(_QWORD *)(v5 + 8), (int *)&_readBuildings_tags);
            objc_sync_exit(v19);

          }
        }
        os_unfair_lock_unlock(v15);
        -[GEOPDFeatureVenue _addNoFlagsBuilding:](v5, v17);

        os_unfair_lock_lock_with_options();
        *(_BYTE *)(v5 + 60) |= 2u;
        os_unfair_lock_unlock(v15);
        *(_BYTE *)(v5 + 60) |= 0x10u;

      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v13);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v31->_levels;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v34;
    v22 = (os_unfair_lock_s *)(v5 + v30);
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v34 != v21)
          objc_enumerationMutation(obj);
        v24 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * j), "copyWithZone:", a3);
        v25 = v24;
        if (v5)
        {
          v26 = v24;
          os_unfair_lock_lock(v22);
          if ((*(_BYTE *)(v5 + 60) & 4) == 0)
          {
            v27 = *(void **)(v5 + 8);
            if (v27)
            {
              v28 = v27;
              objc_sync_enter(v28);
              GEOPDFeatureVenueReadSpecified(v5, *(_QWORD *)(v5 + 8), (int *)&_readLevels_tags_81);
              objc_sync_exit(v28);

            }
          }
          os_unfair_lock_unlock(v22);
          -[GEOPDFeatureVenue _addNoFlagsLevel:](v5, v26);

          os_unfair_lock_lock_with_options();
          *(_BYTE *)(v5 + 60) |= 4u;
          os_unfair_lock_unlock(v22);
          *(_BYTE *)(v5 + 60) |= 0x10u;
        }

      }
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v20);
  }

  objc_storeStrong((id *)(v5 + 16), v31->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEOPDVenueContainer *venueContainer;
  NSMutableArray *buildings;
  NSMutableArray *levels;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOPDFeatureVenue readAll:]((uint64_t)self, 1),
         -[GEOPDFeatureVenue readAll:]((uint64_t)v4, 1),
         venueContainer = self->_venueContainer,
         !((unint64_t)venueContainer | v4[5]))
     || -[GEOPDVenueContainer isEqual:](venueContainer, "isEqual:"))
    && ((buildings = self->_buildings, !((unint64_t)buildings | v4[3]))
     || -[NSMutableArray isEqual:](buildings, "isEqual:")))
  {
    levels = self->_levels;
    if ((unint64_t)levels | v4[4])
      v8 = -[NSMutableArray isEqual:](levels, "isEqual:");
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
  unint64_t v3;
  uint64_t v4;

  -[GEOPDFeatureVenue readAll:]((uint64_t)self, 1);
  v3 = -[GEOPDVenueContainer hash](self->_venueContainer, "hash");
  v4 = -[NSMutableArray hash](self->_buildings, "hash") ^ v3;
  return v4 ^ -[NSMutableArray hash](self->_levels, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_venueContainer, 0);
  objc_storeStrong((id *)&self->_levels, 0);
  objc_storeStrong((id *)&self->_buildings, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
