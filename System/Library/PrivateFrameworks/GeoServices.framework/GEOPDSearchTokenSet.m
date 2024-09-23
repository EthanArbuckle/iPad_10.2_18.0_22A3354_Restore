@implementation GEOPDSearchTokenSet

- (GEOPDSearchTokenSet)init
{
  GEOPDSearchTokenSet *v2;
  GEOPDSearchTokenSet *v3;
  GEOPDSearchTokenSet *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchTokenSet;
  v2 = -[GEOPDSearchTokenSet init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchTokenSet)initWithData:(id)a3
{
  GEOPDSearchTokenSet *v3;
  GEOPDSearchTokenSet *v4;
  GEOPDSearchTokenSet *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchTokenSet;
  v3 = -[GEOPDSearchTokenSet initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readTokens
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(_BYTE *)(a1 + 44) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchTokenSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTokens_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (void)addToken:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDSearchTokenSet _readTokens](a1);
    -[GEOPDSearchTokenSet _addNoFlagsToken:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 44) |= 2u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    *(_BYTE *)(a1 + 44) |= 4u;
  }
}

- (void)_addNoFlagsToken:(uint64_t)a1
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

- (void)setLanguageCode:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_BYTE *)(a1 + 44) |= 1u;
    *(_BYTE *)(a1 + 44) |= 4u;
    objc_storeStrong((id *)(a1 + 16), a2);
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
  v8.super_class = (Class)GEOPDSearchTokenSet;
  -[GEOPDSearchTokenSet description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchTokenSet dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchTokenSet _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  const __CFString *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDSearchTokenSet readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v6 = *(id *)(a1 + 24);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v10, "jsonRepresentation");
          else
            objc_msgSend(v10, "dictionaryRepresentation", (_QWORD)v17);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11, (_QWORD)v17);

        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v7);
    }

    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("token"));
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
  if ((*(_BYTE *)(a1 + 44) & 1) == 0)
  {
    v12 = *(void **)(a1 + 8);
    if (v12)
    {
      v13 = v12;
      objc_sync_enter(v13);
      GEOPDSearchTokenSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLanguageCode_tags_2);
      objc_sync_exit(v13);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  v14 = *(id *)(a1 + 16);
  if (v14)
  {
    if (a2)
      v15 = CFSTR("languageCode");
    else
      v15 = CFSTR("language_code");
    objc_msgSend(v4, "setObject:forKey:", v14, v15, (_QWORD)v17);
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchTokenSet _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_84;
      else
        v6 = (int *)&readAll__nonRecursiveTag_85;
      GEOPDSearchTokenSetReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDSearchTokenSetCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  uint64_t v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  uint64_t v17;
  void *v18;
  GEOPDSearchToken *v19;
  GEOPDSearchToken *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  int v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  GEOPDSearchTokenForm *v37;
  GEOPDSearchTokenForm *v38;
  id v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  int v46;
  uint64_t v47;
  void *v48;
  GEOPDSearchTokenSpan *v49;
  GEOPDSearchTokenSpan *v50;
  id v51;
  GEOPDSearchTokenSpan *v52;
  void *v53;
  void *v54;
  GEOPDSearchTokenSpan *v55;
  uint64_t v56;
  const __CFString *v57;
  void *v58;
  id v59;
  void *v60;
  id v62;
  const __CFString *v64;
  const __CFString *v65;
  id v66;
  void *v67;
  uint64_t v68;
  const __CFString *v69;
  const __CFString *v70;
  const __CFString *v71;
  const __CFString *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (a1)
  {
    v5 = objc_msgSend(a1, "init");
    if (v5)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("token"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v62 = v4;
        v80 = 0u;
        v81 = 0u;
        v78 = 0u;
        v79 = 0u;
        v7 = v6;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v78, v86, 16);
        if (v8)
        {
          v9 = v8;
          v10 = CFSTR("processed_value");
          v11 = *(_QWORD *)v79;
          if (a3)
            v10 = CFSTR("processedValue");
          v72 = v10;
          if (a3)
            v12 = CFSTR("rawValue");
          else
            v12 = CFSTR("raw_value");
          v13 = CFSTR("alternate_form");
          if (a3)
            v13 = CFSTR("alternateForm");
          v70 = v13;
          v71 = v12;
          v14 = CFSTR("token_span");
          if (a3)
            v14 = CFSTR("tokenSpan");
          v68 = v5;
          v69 = v14;
          if (a3)
            v15 = CFSTR("beginIndex");
          else
            v15 = CFSTR("begin_index");
          v16 = CFSTR("endIndex");
          if (!a3)
            v16 = CFSTR("end_index");
          v64 = v16;
          v65 = v15;
          v73 = *(_QWORD *)v79;
          v66 = v7;
          v67 = v6;
          do
          {
            v17 = 0;
            v74 = v9;
            do
            {
              if (*(_QWORD *)v79 != v11)
                objc_enumerationMutation(v7);
              v18 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * v17);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v75 = v17;
                v19 = [GEOPDSearchToken alloc];
                if (v19)
                {
                  v20 = v19;
                  v21 = v18;
                  v77 = -[GEOPDSearchToken init](v20, "init");
                  if (v77)
                  {
                    v76 = v21;
                    objc_msgSend(v21, "objectForKeyedSubscript:", v72);
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v23 = (void *)objc_msgSend(v22, "copy");
                      v24 = v23;
                      *(_BYTE *)(v77 + 64) |= 4u;
                      *(_BYTE *)(v77 + 64) |= 0x20u;
                      objc_storeStrong((id *)(v77 + 24), v23);

                    }
                    objc_msgSend(v76, "objectForKeyedSubscript:", v71);
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v26 = (void *)objc_msgSend(v25, "copy");
                      v27 = v26;
                      *(_BYTE *)(v77 + 64) |= 8u;
                      *(_BYTE *)(v77 + 64) |= 0x20u;
                      objc_storeStrong((id *)(v77 + 32), v26);

                    }
                    objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("position"));
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v29 = objc_msgSend(v28, "intValue");
                      *(_BYTE *)(v77 + 64) |= 0x20u;
                      *(_BYTE *)(v77 + 64) |= 1u;
                      *(_DWORD *)(v77 + 60) = v29;
                    }

                    v21 = v76;
                    objc_msgSend(v76, "objectForKeyedSubscript:", v70);
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v84 = 0u;
                      v85 = 0u;
                      v82 = 0u;
                      v83 = 0u;
                      v31 = v30;
                      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v82, v87, 16);
                      if (!v32)
                        goto LABEL_64;
                      v33 = v32;
                      v34 = *(_QWORD *)v83;
                      while (1)
                      {
                        v35 = 0;
                        do
                        {
                          if (*(_QWORD *)v83 != v34)
                            objc_enumerationMutation(v31);
                          v36 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * v35);
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v37 = [GEOPDSearchTokenForm alloc];
                            if (v37)
                            {
                              v38 = v37;
                              v39 = v36;
                              v40 = -[GEOPDSearchTokenForm init](v38, "init");
                              if (v40)
                              {
                                objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("value"));
                                v41 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                {
                                  v42 = (void *)objc_msgSend(v41, "copy");
                                  v43 = v42;
                                  objc_storeStrong((id *)(v40 + 8), v42);

                                }
                                objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("type"));
                                v44 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                {
                                  v45 = v44;
                                  if ((objc_msgSend(v45, "isEqualToString:", CFSTR("READING")) & 1) != 0)
                                  {
                                    v46 = 0;
                                  }
                                  else if ((objc_msgSend(v45, "isEqualToString:", CFSTR("PRONUNCIATION")) & 1) != 0)
                                  {
                                    v46 = 1;
                                  }
                                  else if ((objc_msgSend(v45, "isEqualToString:", CFSTR("CHAR_TO_NUMERIC")) & 1) != 0)
                                  {
                                    v46 = 2;
                                  }
                                  else if (objc_msgSend(v45, "isEqualToString:", CFSTR("NUMERIC_TO_CHAR")))
                                  {
                                    v46 = 3;
                                  }
                                  else
                                  {
                                    v46 = 0;
                                  }

LABEL_56:
                                  *(_DWORD *)(v40 + 16) = v46;
                                }
                                else
                                {
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                  {
                                    v46 = objc_msgSend(v44, "intValue");
                                    goto LABEL_56;
                                  }
                                }

                              }
                            }
                            else
                            {
                              v40 = 0;
                            }
                            -[GEOPDSearchToken addAlternateForm:](v77, (void *)v40);

                          }
                          ++v35;
                        }
                        while (v33 != v35);
                        v47 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v82, v87, 16);
                        v33 = v47;
                        if (!v47)
                        {
LABEL_64:

                          v6 = v67;
                          v5 = v68;
                          v7 = v66;
                          v11 = v73;
                          v21 = v76;
                          break;
                        }
                      }
                    }

                    objc_msgSend(v21, "objectForKeyedSubscript:", v69);
                    v48 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v49 = [GEOPDSearchTokenSpan alloc];
                      if (v49)
                      {
                        v50 = v49;
                        v51 = v48;
                        v52 = -[GEOPDSearchTokenSpan init](v50, "init");
                        if (v52)
                        {
                          objc_msgSend(v51, "objectForKeyedSubscript:", v65);
                          v53 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                            v52->_beginIndex = objc_msgSend(v53, "intValue");

                          objc_msgSend(v51, "objectForKeyedSubscript:", v64);
                          v54 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                            v52->_endIndex = objc_msgSend(v54, "intValue");

                        }
                      }
                      else
                      {
                        v52 = 0;
                      }
                      v55 = v52;
                      *(_BYTE *)(v77 + 64) |= 0x10u;
                      *(_BYTE *)(v77 + 64) |= 0x20u;
                      objc_storeStrong((id *)(v77 + 40), v52);

                      v11 = v73;
                      v21 = v76;
                    }

                  }
                }
                else
                {
                  v77 = 0;
                }
                -[GEOPDSearchTokenSet addToken:](v5, (void *)v77);

                v9 = v74;
                v17 = v75;
              }
              ++v17;
            }
            while (v17 != v9);
            v56 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v78, v86, 16);
            v9 = v56;
          }
          while (v56);
        }

        v4 = v62;
      }

      if (a3)
        v57 = CFSTR("languageCode");
      else
        v57 = CFSTR("language_code");
      objc_msgSend(v4, "objectForKeyedSubscript:", v57, v62);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v59 = v4;
        v60 = (void *)objc_msgSend(v58, "copy");
        -[GEOPDSearchTokenSet setLanguageCode:](v5, v60);

        v4 = v59;
      }

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchTokenSetReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  PBDataReader *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 7) == 0))
  {
    v10 = self->_reader;
    objc_sync_enter(v10);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v11);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchTokenSet readAll:]((uint64_t)self, 0);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = self->_tokens;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

    if (self->_languageCode)
      PBDataWriterWriteStringField();
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  PBDataReader *reader;
  PBDataReader *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 4) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDSearchTokenSetReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchTokenSet readAll:]((uint64_t)self, 0);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = self->_tokens;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v8);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v11), "copyWithZone:", a3, (_QWORD)v16);
        -[GEOPDSearchTokenSet addToken:]((uint64_t)v5, v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  v13 = -[NSString copyWithZone:](self->_languageCode, "copyWithZone:", a3);
  v14 = (void *)v5[2];
  v5[2] = v13;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *tokens;
  NSString *languageCode;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOPDSearchTokenSet readAll:]((uint64_t)self, 1),
         -[GEOPDSearchTokenSet readAll:]((uint64_t)v4, 1),
         tokens = self->_tokens,
         !((unint64_t)tokens | v4[3]))
     || -[NSMutableArray isEqual:](tokens, "isEqual:")))
  {
    languageCode = self->_languageCode;
    if ((unint64_t)languageCode | v4[2])
      v7 = -[NSString isEqual:](languageCode, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;

  -[GEOPDSearchTokenSet readAll:]((uint64_t)self, 1);
  v3 = -[NSMutableArray hash](self->_tokens, "hash");
  return -[NSString hash](self->_languageCode, "hash") ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
