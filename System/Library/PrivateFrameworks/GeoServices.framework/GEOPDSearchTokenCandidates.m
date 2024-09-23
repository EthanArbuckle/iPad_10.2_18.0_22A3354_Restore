@implementation GEOPDSearchTokenCandidates

- (GEOPDSearchTokenCandidates)init
{
  GEOPDSearchTokenCandidates *v2;
  GEOPDSearchTokenCandidates *v3;
  GEOPDSearchTokenCandidates *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchTokenCandidates;
  v2 = -[GEOPDSearchTokenCandidates init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchTokenCandidates)initWithData:(id)a3
{
  GEOPDSearchTokenCandidates *v3;
  GEOPDSearchTokenCandidates *v4;
  GEOPDSearchTokenCandidates *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchTokenCandidates;
  v3 = -[GEOPDSearchTokenCandidates initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)addCandidates:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(_BYTE *)(a1 + 48) & 4) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchTokenCandidatesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCandidates_tags_1);
        objc_sync_exit(v5);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    -[GEOPDSearchTokenCandidates _addNoFlagsCandidates:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 48) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    *(_BYTE *)(a1 + 48) |= 0x10u;
  }
}

- (void)_addNoFlagsCandidates:(uint64_t)a1
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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchTokenCandidates;
  -[GEOPDSearchTokenCandidates description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchTokenCandidates dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchTokenCandidates _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDSearchTokenCandidates readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
  if ((*(_BYTE *)(a1 + 48) & 8) == 0)
  {
    v5 = *(void **)(a1 + 8);
    if (v5)
    {
      v6 = v5;
      objc_sync_enter(v6);
      GEOPDSearchTokenCandidatesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readToken_tags_3);
      objc_sync_exit(v6);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  v7 = *(id *)(a1 + 24);
  v8 = v7;
  if (v7)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v7, "jsonRepresentation");
    else
      objc_msgSend(v7, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("token"));

  }
  v10 = *(_BYTE *)(a1 + 48);
  if ((v10 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 44));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v12 = CFSTR("isMerged");
    else
      v12 = CFSTR("is_merged");
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

    v10 = *(_BYTE *)(a1 + 48);
  }
  if ((v10 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 45));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v14 = CFSTR("isSplit");
    else
      v14 = CFSTR("is_split");
    objc_msgSend(v4, "setObject:forKey:", v13, v14);

  }
  if (objc_msgSend(*(id *)(a1 + 16), "count"))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v16 = *(id *)(a1 + 16);
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v24 != v18)
            objc_enumerationMutation(v16);
          v20 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v20, "jsonRepresentation");
          else
            objc_msgSend(v20, "dictionaryRepresentation", (_QWORD)v23);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v21, (_QWORD)v23);

        }
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v17);
    }

    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("candidates"));
  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchTokenCandidates _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_369;
      else
        v6 = (int *)&readAll__nonRecursiveTag_370;
      GEOPDSearchTokenCandidatesReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDSearchTokenCandidatesCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (_BYTE)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  _BYTE *v6;
  void *v7;
  unint64_t v8;
  GEOPDSearchTokenSet *v9;
  void *v10;
  id v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  char v15;
  const __CFString *v16;
  void *v17;
  char v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  __objc2_class_ro **p_info;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  id v33;
  unint64_t v34;
  __objc2_class_ro **v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v43;
  id v44;
  _BYTE *v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    v6 = (_BYTE *)objc_msgSend(a1, "init");
    if (v6)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("token"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 0x1E0C99000uLL;
      objc_opt_class();
      v45 = v6;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = [GEOPDSearchTokenSet alloc];
        if (v9)
          v10 = (void *)-[GEOPDSearchTokenSet _initWithDictionary:isJSON:](v9, v7, a3);
        else
          v10 = 0;
        v11 = v10;
        v45[48] |= 8u;
        v45[48] |= 0x10u;
        v12 = v10;
        v6 = v45;
        objc_storeStrong((id *)v45 + 3, v12);

      }
      if (a3)
        v13 = CFSTR("isMerged");
      else
        v13 = CFSTR("is_merged");
      objc_msgSend(v5, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = objc_msgSend(v14, "BOOLValue");
        v6[48] |= 0x10u;
        v6[48] |= 1u;
        v6[44] = v15;
      }

      if (a3)
        v16 = CFSTR("isSplit");
      else
        v16 = CFSTR("is_split");
      objc_msgSend(v5, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = objc_msgSend(v17, "BOOLValue");
        v6[48] |= 0x10u;
        v6[48] |= 2u;
        v6[45] = v18;
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("candidates"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v43 = v19;
        v44 = v5;
        v49 = 0u;
        v50 = 0u;
        v47 = 0u;
        v48 = 0u;
        v20 = v19;
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
        if (v21)
        {
          v22 = v21;
          p_info = GEOPDSearchCapabilitiesParameters.info;
          v24 = *(_QWORD *)v48;
          do
          {
            v25 = 0;
            v46 = v22;
            do
            {
              if (*(_QWORD *)v48 != v24)
                objc_enumerationMutation(v20);
              v26 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v25);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v27 = objc_alloc((Class)(p_info + 441));
                if (v27)
                {
                  v28 = v27;
                  v29 = v26;
                  v30 = objc_msgSend(v28, "init");
                  if (v30)
                  {
                    objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("candidate"));
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v32 = v24;
                      v33 = v20;
                      v34 = v8;
                      v35 = p_info;
                      v36 = (void *)objc_msgSend(v31, "copy");
                      v37 = v36;
                      v38 = v36;
                      p_info = v35;
                      v8 = v34;
                      v20 = v33;
                      v24 = v32;
                      objc_storeStrong((id *)(v30 + 8), v38);

                      v6 = v45;
                    }

                    objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("score"));
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      objc_msgSend(v39, "doubleValue");
                      *(_BYTE *)(v30 + 24) |= 1u;
                      *(_QWORD *)(v30 + 16) = v40;
                    }

                  }
                  v22 = v46;
                }
                else
                {
                  v30 = 0;
                }
                -[GEOPDSearchTokenCandidates addCandidates:]((uint64_t)v6, (void *)v30);

              }
              ++v25;
            }
            while (v22 != v25);
            v41 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
            v22 = v41;
          }
          while (v41);
        }

        v19 = v43;
        v5 = v44;
      }

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchTokenCandidatesReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  char flags;
  PBDataReader *v7;
  void *v8;
  char v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader)
    goto LABEL_8;
  os_unfair_lock_assert_owner(&self->_readerLock);
  flags = (char)self->_flags;
  if ((flags & 0x10) != 0)
    goto LABEL_8;
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if (GEOPDSearchTokenSetIsDirty((uint64_t)self->_token))
      goto LABEL_8;
    flags = (char)self->_flags;
  }
  if ((flags & 4) == 0)
  {
    v7 = self->_reader;
    objc_sync_enter(v7);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v8);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
    goto LABEL_22;
  }
LABEL_8:
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchTokenCandidates readAll:]((uint64_t)self, 0);
  if (self->_token)
    PBDataWriterWriteSubmessage();
  v9 = (char)self->_flags;
  if ((v9 & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v9 = (char)self->_flags;
  }
  if ((v9 & 2) != 0)
    PBDataWriterWriteBOOLField();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v10 = self->_candidates;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

LABEL_22:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  NSMutableArray *v8;
  id v9;
  void *v10;
  char flags;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x10) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDSearchTokenCandidatesReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (NSMutableArray *)(id)v5;
      objc_sync_exit(v7);

      goto LABEL_16;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchTokenCandidates readAll:]((uint64_t)self, 0);
  v9 = -[GEOPDSearchTokenSet copyWithZone:](self->_token, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *(_BYTE *)(v5 + 44) = self->_isMerged;
    *(_BYTE *)(v5 + 48) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_BYTE *)(v5 + 45) = self->_isSplit;
    *(_BYTE *)(v5 + 48) |= 2u;
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = self->_candidates;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v8);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v17);
        -[GEOPDSearchTokenCandidates addCandidates:](v5, v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }
LABEL_16:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOPDSearchTokenSet *token;
  char v6;
  NSMutableArray *candidates;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  -[GEOPDSearchTokenCandidates readAll:]((uint64_t)self, 1);
  -[GEOPDSearchTokenCandidates readAll:]((uint64_t)v4, 1);
  token = self->_token;
  if ((unint64_t)token | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOPDSearchTokenSet isEqual:](token, "isEqual:"))
      goto LABEL_16;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0)
      goto LABEL_16;
    if (self->_isMerged)
    {
      if (!*((_BYTE *)v4 + 44))
        goto LABEL_16;
    }
    else if (*((_BYTE *)v4 + 44))
    {
      goto LABEL_16;
    }
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    goto LABEL_16;
  }
  if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    if ((*((_BYTE *)v4 + 48) & 2) == 0)
      goto LABEL_22;
LABEL_16:
    v6 = 0;
    goto LABEL_17;
  }
  if ((*((_BYTE *)v4 + 48) & 2) == 0)
    goto LABEL_16;
  if (!self->_isSplit)
  {
    if (!*((_BYTE *)v4 + 45))
      goto LABEL_22;
    goto LABEL_16;
  }
  if (!*((_BYTE *)v4 + 45))
    goto LABEL_16;
LABEL_22:
  candidates = self->_candidates;
  if ((unint64_t)candidates | *((_QWORD *)v4 + 2))
    v6 = -[NSMutableArray isEqual:](candidates, "isEqual:");
  else
    v6 = 1;
LABEL_17:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  -[GEOPDSearchTokenCandidates readAll:]((uint64_t)self, 1);
  v3 = -[GEOPDSearchTokenSet hash](self->_token, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v4 = 2654435761 * self->_isMerged;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    return v4 ^ v3 ^ v5 ^ -[NSMutableArray hash](self->_candidates, "hash");
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = 2654435761 * self->_isSplit;
  return v4 ^ v3 ^ v5 ^ -[NSMutableArray hash](self->_candidates, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_candidates, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
