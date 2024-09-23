@implementation GEOPDResultRefinementGroup

- (GEOPDResultRefinementGroup)init
{
  GEOPDResultRefinementGroup *v2;
  GEOPDResultRefinementGroup *v3;
  GEOPDResultRefinementGroup *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDResultRefinementGroup;
  v2 = -[GEOPDResultRefinementGroup init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDResultRefinementGroup)initWithData:(id)a3
{
  GEOPDResultRefinementGroup *v3;
  GEOPDResultRefinementGroup *v4;
  GEOPDResultRefinementGroup *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDResultRefinementGroup;
  v3 = -[GEOPDResultRefinementGroup initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readResultRefinementBar
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 60) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDResultRefinementGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readResultRefinementBar_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)resultRefinementBar
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDResultRefinementGroup _readResultRefinementBar]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (void)setResultRefinementBar:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_BYTE *)(a1 + 60) |= 4u;
    *(_BYTE *)(a1 + 60) |= 0x10u;
    objc_storeStrong((id *)(a1 + 32), a2);
  }

}

- (void)_readResultRefinementView
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 60) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDResultRefinementGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readResultRefinementView_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)resultRefinementView
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDResultRefinementGroup _readResultRefinementView]((uint64_t)a1);
    a1 = (id *)v1[5];
  }
  return a1;
}

- (void)setResultRefinementView:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_BYTE *)(a1 + 60) |= 8u;
    *(_BYTE *)(a1 + 60) |= 0x10u;
    objc_storeStrong((id *)(a1 + 40), a2);
  }

}

- (void)_readRefinementSessionState
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 60) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDResultRefinementGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRefinementSessionState_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)refinementSessionState
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDResultRefinementGroup _readRefinementSessionState]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (void)setRefinementSessionState:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_BYTE *)(a1 + 60) |= 2u;
    *(_BYTE *)(a1 + 60) |= 0x10u;
    objc_storeStrong((id *)(a1 + 24), a2);
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
  v8.super_class = (Class)GEOPDResultRefinementGroup;
  -[GEOPDResultRefinementGroup description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDResultRefinementGroup dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDResultRefinementGroup _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v24[4];
  id v25;

  if (!a1)
    return 0;
  -[GEOPDResultRefinementGroup readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDResultRefinementGroup resultRefinementBar]((id *)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("resultRefinementBar");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("result_refinement_bar");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  -[GEOPDResultRefinementGroup resultRefinementView]((id *)a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v9, "jsonRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("resultRefinementView");
    }
    else
    {
      objc_msgSend(v9, "dictionaryRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("result_refinement_view");
    }
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

  }
  -[GEOPDResultRefinementGroup refinementSessionState]((id *)a1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v13, "jsonRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("refinementSessionState");
    }
    else
    {
      objc_msgSend(v13, "dictionaryRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("refinement_session_state");
    }
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

  }
  v17 = *(void **)(a1 + 16);
  if (v17)
  {
    objc_msgSend(v17, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v18, "count"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __56__GEOPDResultRefinementGroup__dictionaryRepresentation___block_invoke;
      v24[3] = &unk_1E1C00600;
      v21 = v20;
      v25 = v21;
      objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v24);
      v22 = v21;

      v19 = v22;
    }
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDResultRefinementGroup _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_384_1;
      else
        v6 = (int *)&readAll__nonRecursiveTag_385_1;
      GEOPDResultRefinementGroupReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      objc_msgSend(*(id *)(a1 + 24), "readAll:", 1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

void __56__GEOPDResultRefinementGroup__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  GEOPDResultRefinementBar *v8;
  id v9;
  const __CFString *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  GEOPDResultRefinement *v18;
  void *v19;
  uint64_t v20;
  const __CFString *v21;
  void *v22;
  GEOPDResultRefinementView *v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  GEOPDResultRefinementSection *v32;
  void *v33;
  uint64_t v34;
  const __CFString *v35;
  void *v36;
  GEOPDRefinementSessionState *v37;
  GEOPDRefinementSessionState *v38;
  GEOPDRefinementSessionState *v39;
  void *v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("resultRefinementBar");
      else
        v6 = CFSTR("result_refinement_bar");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = [GEOPDResultRefinementBar alloc];
        if (v8)
        {
          v9 = v7;
          v8 = -[GEOPDResultRefinementBar init](v8, "init");
          if (v8)
          {
            if (a3)
              v10 = CFSTR("resultRefinement");
            else
              v10 = CFSTR("result_refinement");
            objc_msgSend(v9, "objectForKeyedSubscript:", v10);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v43 = v9;
              v45 = a1;
              v47 = v5;
              v51 = 0u;
              v52 = 0u;
              v49 = 0u;
              v50 = 0u;
              v41 = v11;
              v12 = v11;
              v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
              if (v13)
              {
                v14 = v13;
                v15 = *(_QWORD *)v50;
                do
                {
                  v16 = 0;
                  do
                  {
                    if (*(_QWORD *)v50 != v15)
                      objc_enumerationMutation(v12);
                    v17 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v16);
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v18 = [GEOPDResultRefinement alloc];
                      if (v18)
                        v19 = (void *)-[GEOPDResultRefinement _initWithDictionary:isJSON:](v18, v17, a3);
                      else
                        v19 = 0;
                      -[GEOPDResultRefinementBar addResultRefinement:]((uint64_t)v8, v19);

                    }
                    ++v16;
                  }
                  while (v14 != v16);
                  v20 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
                  v14 = v20;
                }
                while (v20);
              }

              a1 = v45;
              v11 = v41;
              v9 = v43;
            }

          }
        }
        -[GEOPDResultRefinementGroup setResultRefinementBar:]((uint64_t)a1, v8);

      }
      if (a3)
        v21 = CFSTR("resultRefinementView");
      else
        v21 = CFSTR("result_refinement_view");
      objc_msgSend(v5, "objectForKeyedSubscript:", v21, v41, v43, v45, v47, (_QWORD)v49);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v23 = [GEOPDResultRefinementView alloc];
        if (v23)
        {
          v24 = v22;
          v23 = -[GEOPDResultRefinementView init](v23, "init");
          if (v23)
          {
            objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("section"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v44 = v24;
              v46 = a1;
              v48 = v5;
              v51 = 0u;
              v52 = 0u;
              v49 = 0u;
              v50 = 0u;
              v42 = v25;
              v26 = v25;
              v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
              if (v27)
              {
                v28 = v27;
                v29 = *(_QWORD *)v50;
                do
                {
                  v30 = 0;
                  do
                  {
                    if (*(_QWORD *)v50 != v29)
                      objc_enumerationMutation(v26);
                    v31 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v30);
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v32 = [GEOPDResultRefinementSection alloc];
                      if (v32)
                        v33 = (void *)-[GEOPDResultRefinementSection _initWithDictionary:isJSON:](v32, v31, a3);
                      else
                        v33 = 0;
                      -[GEOPDResultRefinementView addSection:]((uint64_t)v23, v33);

                    }
                    ++v30;
                  }
                  while (v28 != v30);
                  v34 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
                  v28 = v34;
                }
                while (v34);
              }

              a1 = v46;
              v25 = v42;
              v24 = v44;
            }

          }
        }
        -[GEOPDResultRefinementGroup setResultRefinementView:]((uint64_t)a1, v23);

      }
      if (a3)
        v35 = CFSTR("refinementSessionState");
      else
        v35 = CFSTR("refinement_session_state");
      objc_msgSend(v5, "objectForKeyedSubscript:", v35, v42, v44, v46, v48);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v37 = [GEOPDRefinementSessionState alloc];
        if ((a3 & 1) != 0)
          v38 = -[GEOPDRefinementSessionState initWithJSON:](v37, "initWithJSON:", v36);
        else
          v38 = -[GEOPDRefinementSessionState initWithDictionary:](v37, "initWithDictionary:", v36);
        v39 = v38;
        -[GEOPDResultRefinementGroup setRefinementSessionState:]((uint64_t)a1, v38);

      }
    }
  }

  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDResultRefinementGroupReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && !_GEOPDResultRefinementGroupIsDirty((uint64_t)self))
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
    -[GEOPDResultRefinementGroup readAll:]((uint64_t)self, 0);
    if (self->_resultRefinementBar)
      PBDataWriterWriteSubmessage();
    v5 = v8;
    if (self->_resultRefinementView)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_refinementSessionState)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  uint64_t v3;

  if (result)
  {
    v3 = result;
    -[GEOPDResultRefinementGroup _readRefinementSessionState](result);
    if ((objc_msgSend(*(id *)(v3 + 24), "hasGreenTeaWithValue:", a2) & 1) != 0)
      return 1;
    -[GEOPDResultRefinementGroup _readResultRefinementBar](v3);
    if ((-[GEOPDResultRefinementBar hasGreenTeaWithValue:](*(_QWORD *)(v3 + 32), a2) & 1) != 0)
    {
      return 1;
    }
    else
    {
      -[GEOPDResultRefinementGroup _readResultRefinementView](v3);
      return -[GEOPDResultRefinementView hasGreenTeaWithValue:](*(_QWORD *)(v3 + 40), a2);
    }
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
    goto LABEL_5;
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDResultRefinementGroup readAll:]((uint64_t)self, 0);
    v8 = -[GEOPDResultRefinementBar copyWithZone:](self->_resultRefinementBar, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v8;

    v10 = -[GEOPDResultRefinementView copyWithZone:](self->_resultRefinementView, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v10;

    v12 = -[GEOPDRefinementSessionState copyWithZone:](self->_refinementSessionState, "copyWithZone:", a3);
    v13 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v12;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOPDResultRefinementGroupReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEOPDResultRefinementBar *resultRefinementBar;
  GEOPDResultRefinementView *resultRefinementView;
  GEOPDRefinementSessionState *refinementSessionState;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOPDResultRefinementGroup readAll:]((uint64_t)self, 1),
         -[GEOPDResultRefinementGroup readAll:]((uint64_t)v4, 1),
         resultRefinementBar = self->_resultRefinementBar,
         !((unint64_t)resultRefinementBar | v4[4]))
     || -[GEOPDResultRefinementBar isEqual:](resultRefinementBar, "isEqual:"))
    && ((resultRefinementView = self->_resultRefinementView, !((unint64_t)resultRefinementView | v4[5]))
     || -[GEOPDResultRefinementView isEqual:](resultRefinementView, "isEqual:")))
  {
    refinementSessionState = self->_refinementSessionState;
    if ((unint64_t)refinementSessionState | v4[3])
      v8 = -[GEOPDRefinementSessionState isEqual:](refinementSessionState, "isEqual:");
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
  unint64_t v4;

  -[GEOPDResultRefinementGroup readAll:]((uint64_t)self, 1);
  v3 = -[GEOPDResultRefinementBar hash](self->_resultRefinementBar, "hash");
  v4 = -[GEOPDResultRefinementView hash](self->_resultRefinementView, "hash") ^ v3;
  return v4 ^ -[GEOPDRefinementSessionState hash](self->_refinementSessionState, "hash");
}

- (void)mergeFrom:(_QWORD *)a1
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  if (a1)
  {
    -[GEOPDResultRefinementGroup readAll:]((uint64_t)v9, 0);
    v3 = a1[4];
    v4 = (void *)*((_QWORD *)v9 + 4);
    if (v3)
    {
      if (v4)
        -[GEOPDResultRefinementBar mergeFrom:](v3, (uint64_t)v4);
    }
    else if (v4)
    {
      -[GEOPDResultRefinementGroup setResultRefinementBar:]((uint64_t)a1, v4);
    }
    v5 = a1[5];
    v6 = (void *)*((_QWORD *)v9 + 5);
    if (v5)
    {
      if (v6)
        -[GEOPDResultRefinementView mergeFrom:](v5, (uint64_t)v6);
    }
    else if (v6)
    {
      -[GEOPDResultRefinementGroup setResultRefinementView:]((uint64_t)a1, v6);
    }
    v7 = (void *)a1[3];
    v8 = *((_QWORD *)v9 + 3);
    if (v7)
    {
      if (v8)
        objc_msgSend(v7, "mergeFrom:");
    }
    else if (v8)
    {
      -[GEOPDResultRefinementGroup setRefinementSessionState:]((uint64_t)a1, *((void **)v9 + 3));
    }
  }

}

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v4;

  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 60) |= 1u;
    *(_BYTE *)(a1 + 60) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    v4 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDResultRefinementGroup readAll:](a1, 0);
      -[GEOPDResultRefinementBar clearUnknownFields:](*(_QWORD *)(a1 + 32), 1);
      -[GEOPDResultRefinementView clearUnknownFields:](*(_QWORD *)(a1 + 40), 1);
      objc_msgSend(*(id *)(a1 + 24), "clearUnknownFields:", 1);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultRefinementView, 0);
  objc_storeStrong((id *)&self->_resultRefinementBar, 0);
  objc_storeStrong((id *)&self->_refinementSessionState, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
