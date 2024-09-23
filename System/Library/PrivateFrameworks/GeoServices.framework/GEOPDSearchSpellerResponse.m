@implementation GEOPDSearchSpellerResponse

- (GEOPDSearchSpellerResponse)init
{
  GEOPDSearchSpellerResponse *v2;
  GEOPDSearchSpellerResponse *v3;
  GEOPDSearchSpellerResponse *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchSpellerResponse;
  v2 = -[GEOPDSearchSpellerResponse init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchSpellerResponse)initWithData:(id)a3
{
  GEOPDSearchSpellerResponse *v3;
  GEOPDSearchSpellerResponse *v4;
  GEOPDSearchSpellerResponse *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchSpellerResponse;
  v3 = -[GEOPDSearchSpellerResponse initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readSpellSuggestions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 96) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchSpellerResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSpellSuggestions_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)spellSuggestions
{
  -[GEOPDSearchSpellerResponse _readSpellSuggestions]((uint64_t)self);
  return self->_spellSuggestions;
}

- (void)setSpellSuggestions:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *spellSuggestions;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
  spellSuggestions = self->_spellSuggestions;
  self->_spellSuggestions = v4;

}

- (void)clearSpellSuggestions
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
  -[NSMutableArray removeAllObjects](self->_spellSuggestions, "removeAllObjects");
}

- (void)addSpellSuggestion:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPDSearchSpellerResponse _readSpellSuggestions]((uint64_t)self);
  -[GEOPDSearchSpellerResponse _addNoFlagsSpellSuggestion:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
}

- (void)_addNoFlagsSpellSuggestion:(uint64_t)a1
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

- (unint64_t)spellSuggestionsCount
{
  -[GEOPDSearchSpellerResponse _readSpellSuggestions]((uint64_t)self);
  return -[NSMutableArray count](self->_spellSuggestions, "count");
}

- (id)spellSuggestionAtIndex:(unint64_t)a3
{
  -[GEOPDSearchSpellerResponse _readSpellSuggestions]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_spellSuggestions, "objectAtIndex:", a3);
}

+ (Class)spellSuggestionType
{
  return (Class)objc_opt_class();
}

- (int)resultStatus
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x40) != 0)
    return self->_resultStatus;
  else
    return 1;
}

- (void)setResultStatus:(int)a3
{
  *(_WORD *)&self->_flags |= 0x1040u;
  self->_resultStatus = a3;
}

- (void)setHasResultStatus:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4160;
  else
    v3 = 4096;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFBF | v3;
}

- (BOOL)hasResultStatus
{
  return (*(_WORD *)&self->_flags >> 6) & 1;
}

- (id)resultStatusAsString:(int)a3
{
  if ((a3 - 1) < 6)
    return off_1E1C12628[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsResultStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOT_IN_WHITE_LIST")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPELL_CORRECTION_NOT_ATTEMPTED")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NO_SUGGESTIONS")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPELL_CORRECTION_NOT_REQUIRED")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPELL_CORRECTED")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("NOT_PROCESSED")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (unint64_t)decileId
{
  return self->_decileId;
}

- (void)setDecileId:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x1001u;
  self->_decileId = a3;
}

- (void)setHasDecileId:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x1000;
}

- (BOOL)hasDecileId
{
  return *(_WORD *)&self->_flags & 1;
}

- (double)latencyMs
{
  return self->_latencyMs;
}

- (void)setLatencyMs:(double)a3
{
  *(_WORD *)&self->_flags |= 0x1002u;
  self->_latencyMs = a3;
}

- (void)setHasLatencyMs:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4098;
  else
    v3 = 4096;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasLatencyMs
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (void)_readTokenCandidates
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 96) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchSpellerResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTokenCandidates_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)tokenCandidates
{
  -[GEOPDSearchSpellerResponse _readTokenCandidates]((uint64_t)self);
  return self->_tokenCandidates;
}

- (void)setTokenCandidates:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *tokenCandidates;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
  tokenCandidates = self->_tokenCandidates;
  self->_tokenCandidates = v4;

}

- (void)clearTokenCandidates
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
  -[NSMutableArray removeAllObjects](self->_tokenCandidates, "removeAllObjects");
}

- (void)addTokenCandidates:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPDSearchSpellerResponse _readTokenCandidates]((uint64_t)self);
  -[GEOPDSearchSpellerResponse _addNoFlagsTokenCandidates:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
}

- (void)_addNoFlagsTokenCandidates:(uint64_t)a1
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

- (unint64_t)tokenCandidatesCount
{
  -[GEOPDSearchSpellerResponse _readTokenCandidates]((uint64_t)self);
  return -[NSMutableArray count](self->_tokenCandidates, "count");
}

- (id)tokenCandidatesAtIndex:(unint64_t)a3
{
  -[GEOPDSearchSpellerResponse _readTokenCandidates]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_tokenCandidates, "objectAtIndex:", a3);
}

+ (Class)tokenCandidatesType
{
  return (Class)objc_opt_class();
}

- (double)misspellScore
{
  return self->_misspellScore;
}

- (void)setMisspellScore:(double)a3
{
  *(_WORD *)&self->_flags |= 0x1004u;
  self->_misspellScore = a3;
}

- (void)setHasMisspellScore:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4100;
  else
    v3 = 4096;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasMisspellScore
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (void)_readDebugResponse
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 96) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchSpellerResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDebugResponse_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasDebugResponse
{
  -[GEOPDSearchSpellerResponse _readDebugResponse]((uint64_t)self);
  return self->_debugResponse != 0;
}

- (NSString)debugResponse
{
  -[GEOPDSearchSpellerResponse _readDebugResponse]((uint64_t)self);
  return self->_debugResponse;
}

- (void)setDebugResponse:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1200u;
  objc_storeStrong((id *)&self->_debugResponse, a3);
}

- (int)rankerModelType
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x20) != 0)
    return self->_rankerModelType;
  else
    return 0;
}

- (void)setRankerModelType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x1020u;
  self->_rankerModelType = a3;
}

- (void)setHasRankerModelType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4128;
  else
    v3 = 4096;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFDF | v3;
}

- (BOOL)hasRankerModelType
{
  return (*(_WORD *)&self->_flags >> 5) & 1;
}

- (id)rankerModelTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C12658[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRankerModelType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODEL_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODEL_TYPE_XGBOOST")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("MODEL_TYPE_DL_SEQ2SEQ")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)isFromDLCacheModel
{
  return self->_isFromDLCacheModel;
}

- (void)setIsFromDLCacheModel:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x1080u;
  self->_isFromDLCacheModel = a3;
}

- (void)setHasIsFromDLCacheModel:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4224;
  else
    v3 = 4096;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFF7F | v3;
}

- (BOOL)hasIsFromDLCacheModel
{
  return (*(_WORD *)&self->_flags >> 7) & 1;
}

- (BOOL)isFromDLRuntimeModel
{
  return self->_isFromDLRuntimeModel;
}

- (void)setIsFromDLRuntimeModel:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x1100u;
  self->_isFromDLRuntimeModel = a3;
}

- (void)setHasIsFromDLRuntimeModel:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4352;
  else
    v3 = 4096;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFEFF | v3;
}

- (BOOL)hasIsFromDLRuntimeModel
{
  return HIBYTE(*(_WORD *)&self->_flags) & 1;
}

- (unsigned)modelNumberMajor
{
  return self->_modelNumberMajor;
}

- (void)setModelNumberMajor:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x1008u;
  self->_modelNumberMajor = a3;
}

- (void)setHasModelNumberMajor:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4104;
  else
    v3 = 4096;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasModelNumberMajor
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (unsigned)modelNumberMinor
{
  return self->_modelNumberMinor;
}

- (void)setModelNumberMinor:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x1010u;
  self->_modelNumberMinor = a3;
}

- (void)setHasModelNumberMinor:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4112;
  else
    v3 = 4096;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasModelNumberMinor
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
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
  v8.super_class = (Class)GEOPDSearchSpellerResponse;
  -[GEOPDSearchSpellerResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchSpellerResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchSpellerResponse _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
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
  const __CFString *v13;
  __int16 v14;
  unsigned int v15;
  __CFString *v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  const __CFString *v34;
  __int16 v35;
  uint64_t v36;
  __CFString *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 48), "count"))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v6 = *(id *)(a1 + 48);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v48;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v48 != v9)
              objc_enumerationMutation(v6);
            v11 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
            if ((a2 & 1) != 0)
              objc_msgSend(v11, "jsonRepresentation");
            else
              objc_msgSend(v11, "dictionaryRepresentation");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v12);

          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
        }
        while (v8);
      }

      if (a2)
        v13 = CFSTR("spellSuggestion");
      else
        v13 = CFSTR("spell_suggestion");
      objc_msgSend(v4, "setObject:forKey:", v5, v13);

    }
    v14 = *(_WORD *)(a1 + 96);
    if ((v14 & 0x40) != 0)
    {
      v15 = *(_DWORD *)(a1 + 88) - 1;
      if (v15 >= 6)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 88));
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = off_1E1C12628[v15];
      }
      if (a2)
        v17 = CFSTR("resultStatus");
      else
        v17 = CFSTR("result_status");
      objc_msgSend(v4, "setObject:forKey:", v16, v17);

      v14 = *(_WORD *)(a1 + 96);
    }
    if ((v14 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 24));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v19 = CFSTR("decileId");
      else
        v19 = CFSTR("decile_id");
      objc_msgSend(v4, "setObject:forKey:", v18, v19);

      v14 = *(_WORD *)(a1 + 96);
    }
    if ((v14 & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v21 = CFSTR("latencyMs");
      else
        v21 = CFSTR("latency_ms");
      objc_msgSend(v4, "setObject:forKey:", v20, v21);

    }
    if (objc_msgSend(*(id *)(a1 + 56), "count"))
    {
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v23 = *(id *)(a1 + 56);
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v44;
        do
        {
          for (j = 0; j != v25; ++j)
          {
            if (*(_QWORD *)v44 != v26)
              objc_enumerationMutation(v23);
            v28 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * j);
            if ((a2 & 1) != 0)
              objc_msgSend(v28, "jsonRepresentation");
            else
              objc_msgSend(v28, "dictionaryRepresentation");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "addObject:", v29);

          }
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
        }
        while (v25);
      }

      if (a2)
        v30 = CFSTR("tokenCandidates");
      else
        v30 = CFSTR("token_candidates");
      objc_msgSend(v4, "setObject:forKey:", v22, v30);

    }
    if ((*(_WORD *)(a1 + 96) & 4) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v32 = CFSTR("misspellScore");
      else
        v32 = CFSTR("misspell_score");
      objc_msgSend(v4, "setObject:forKey:", v31, v32);

    }
    objc_msgSend((id)a1, "debugResponse");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      if (a2)
        v34 = CFSTR("debugResponse");
      else
        v34 = CFSTR("debug_response");
      objc_msgSend(v4, "setObject:forKey:", v33, v34);
    }

    v35 = *(_WORD *)(a1 + 96);
    if ((v35 & 0x20) != 0)
    {
      v36 = *(int *)(a1 + 84);
      if (v36 >= 3)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 84));
        v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v37 = off_1E1C12658[v36];
      }
      objc_msgSend(v4, "setObject:forKey:", v37, CFSTR("rankerModelType"));

      v35 = *(_WORD *)(a1 + 96);
      if ((v35 & 0x80) == 0)
      {
LABEL_62:
        if ((v35 & 0x100) == 0)
          goto LABEL_63;
        goto LABEL_71;
      }
    }
    else if ((v35 & 0x80) == 0)
    {
      goto LABEL_62;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 92));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v38, CFSTR("isFromDLCacheModel"));

    v35 = *(_WORD *)(a1 + 96);
    if ((v35 & 0x100) == 0)
    {
LABEL_63:
      if ((v35 & 8) == 0)
        goto LABEL_64;
      goto LABEL_72;
    }
LABEL_71:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 93));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v39, CFSTR("isFromDLRuntimeModel"));

    v35 = *(_WORD *)(a1 + 96);
    if ((v35 & 8) == 0)
    {
LABEL_64:
      if ((v35 & 0x10) == 0)
        return v4;
      goto LABEL_73;
    }
LABEL_72:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 76));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v40, CFSTR("modelNumberMajor"));

    if ((*(_WORD *)(a1 + 96) & 0x10) == 0)
      return v4;
LABEL_73:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 80));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v41, CFSTR("modelNumberMinor"));

    return v4;
  }
  return 0;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchSpellerResponse _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOPDSearchSpellerResponse)initWithDictionary:(id)a3
{
  return (GEOPDSearchSpellerResponse *)-[GEOPDSearchSpellerResponse _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  GEOPDSearchSpellSuggestion *v14;
  void *v15;
  uint64_t v16;
  const __CFString *v17;
  void *v18;
  id v19;
  uint64_t v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  GEOPDSearchTokenCandidates *v33;
  _BYTE *v34;
  uint64_t v35;
  const __CFString *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_101;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_101;
  if (a3)
    v6 = CFSTR("spellSuggestion");
  else
    v6 = CFSTR("spell_suggestion");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v49 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v55;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v55 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v12);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v14 = [GEOPDSearchSpellSuggestion alloc];
            if (v14)
              v15 = (void *)-[GEOPDSearchSpellSuggestion _initWithDictionary:isJSON:]((uint64_t)v14, v13, a3);
            else
              v15 = 0;
            objc_msgSend(a1, "addSpellSuggestion:", v15);

          }
          ++v12;
        }
        while (v10 != v12);
        v16 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
        v10 = v16;
      }
      while (v16);
    }

    v5 = v49;
  }

  if (a3)
    v17 = CFSTR("resultStatus");
  else
    v17 = CFSTR("result_status");
  objc_msgSend(v5, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = v18;
    if ((objc_msgSend(v19, "isEqualToString:", CFSTR("NOT_IN_WHITE_LIST")) & 1) != 0)
    {
      v20 = 1;
    }
    else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("SPELL_CORRECTION_NOT_ATTEMPTED")) & 1) != 0)
    {
      v20 = 2;
    }
    else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("NO_SUGGESTIONS")) & 1) != 0)
    {
      v20 = 3;
    }
    else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("SPELL_CORRECTION_NOT_REQUIRED")) & 1) != 0)
    {
      v20 = 4;
    }
    else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("SPELL_CORRECTED")) & 1) != 0)
    {
      v20 = 5;
    }
    else if (objc_msgSend(v19, "isEqualToString:", CFSTR("NOT_PROCESSED")))
    {
      v20 = 6;
    }
    else
    {
      v20 = 1;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_42;
    v20 = objc_msgSend(v18, "intValue");
  }
  objc_msgSend(a1, "setResultStatus:", v20);
LABEL_42:

  if (a3)
    v21 = CFSTR("decileId");
  else
    v21 = CFSTR("decile_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setDecileId:", objc_msgSend(v22, "unsignedLongLongValue"));

  if (a3)
    v23 = CFSTR("latencyMs");
  else
    v23 = CFSTR("latency_ms");
  objc_msgSend(v5, "objectForKeyedSubscript:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v24, "doubleValue");
    objc_msgSend(a1, "setLatencyMs:");
  }

  if (a3)
    v25 = CFSTR("tokenCandidates");
  else
    v25 = CFSTR("token_candidates");
  objc_msgSend(v5, "objectForKeyedSubscript:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v27 = v26;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v51;
      do
      {
        v31 = 0;
        do
        {
          if (*(_QWORD *)v51 != v30)
            objc_enumerationMutation(v27);
          v32 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v31);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v33 = [GEOPDSearchTokenCandidates alloc];
            if (v33)
              v34 = -[GEOPDSearchTokenCandidates _initWithDictionary:isJSON:](v33, v32, a3);
            else
              v34 = 0;
            objc_msgSend(a1, "addTokenCandidates:", v34);

          }
          ++v31;
        }
        while (v29 != v31);
        v35 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
        v29 = v35;
      }
      while (v35);
    }

    v5 = v49;
  }

  if (a3)
    v36 = CFSTR("misspellScore");
  else
    v36 = CFSTR("misspell_score");
  objc_msgSend(v5, "objectForKeyedSubscript:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v37, "doubleValue");
    objc_msgSend(a1, "setMisspellScore:");
  }

  if (a3)
    v38 = CFSTR("debugResponse");
  else
    v38 = CFSTR("debug_response");
  objc_msgSend(v5, "objectForKeyedSubscript:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v40 = (void *)objc_msgSend(v39, "copy");
    objc_msgSend(a1, "setDebugResponse:", v40);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("rankerModelType"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v42 = v41;
    if ((objc_msgSend(v42, "isEqualToString:", CFSTR("MODEL_TYPE_UNKNOWN")) & 1) != 0)
    {
      v43 = 0;
    }
    else if ((objc_msgSend(v42, "isEqualToString:", CFSTR("MODEL_TYPE_XGBOOST")) & 1) != 0)
    {
      v43 = 1;
    }
    else if (objc_msgSend(v42, "isEqualToString:", CFSTR("MODEL_TYPE_DL_SEQ2SEQ")))
    {
      v43 = 2;
    }
    else
    {
      v43 = 0;
    }

    goto LABEL_91;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v43 = objc_msgSend(v41, "intValue");
LABEL_91:
    objc_msgSend(a1, "setRankerModelType:", v43);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isFromDLCacheModel"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIsFromDLCacheModel:", objc_msgSend(v44, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isFromDLRuntimeModel"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIsFromDLRuntimeModel:", objc_msgSend(v45, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("modelNumberMajor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setModelNumberMajor:", objc_msgSend(v46, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("modelNumberMinor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setModelNumberMinor:", objc_msgSend(v47, "unsignedIntValue"));

LABEL_101:
  return a1;
}

- (GEOPDSearchSpellerResponse)initWithJSON:(id)a3
{
  return (GEOPDSearchSpellerResponse *)-[GEOPDSearchSpellerResponse _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v7;
  int *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
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

  v3 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3)
      v8 = (int *)&readAll__recursiveTag_240;
    else
      v8 = (int *)&readAll__nonRecursiveTag_241;
    GEOPDSearchSpellerResponseReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v9 = self->_spellSuggestions;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v21;
      while (1)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v9);
        if (!--v10)
        {
          v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
          if (!v10)
            break;
        }
      }
    }

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v12 = self->_tokenCandidates;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v17 != v14)
            objc_enumerationMutation(v12);
          -[GEOPDSearchTokenCandidates readAll:](*(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i), 1);
        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      }
      while (v13);
    }

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  int *v4;
  int *v5;
  int *v6;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  int v27;
  BOOL v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  int v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  int v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  int v43;
  unsigned int v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  int v48;
  unsigned int v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  int v53;
  unsigned int v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  int v58;
  BOOL v59;

  objc_msgSend(a3, "position");
  objc_msgSend(a3, "length");
  v4 = (int *)MEMORY[0x1E0D82BF0];
  v5 = (int *)MEMORY[0x1E0D82BD8];
  v6 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*((_BYTE *)a3 + *v6))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v4;
        v12 = *(_QWORD *)((char *)a3 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)((char *)a3 + *v5))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v7) + v12);
        *(_QWORD *)((char *)a3 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v16 = *v6;
          v17 = *((unsigned __int8 *)a3 + v16);
          goto LABEL_14;
        }
      }
      *((_BYTE *)a3 + *v6) = 1;
LABEL_12:
      v16 = *v6;
      v17 = *((unsigned __int8 *)a3 + v16);
      if (*((_BYTE *)a3 + v16))
        v10 = 0;
LABEL_14:
      v18 = v10 & 7;
      if (v17 || v18 == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          if (v18 == 2 && PBReaderPlaceMark() && GEOPDSearchSpellSuggestionIsValid((char *)a3))
            goto LABEL_46;
          goto LABEL_95;
        case 2u:
          if ((v10 & 7) != 0)
            goto LABEL_95;
          v23 = 0;
          while (1)
          {
            v24 = *v4;
            v25 = *(_QWORD *)((char *)a3 + v24);
            v26 = v25 + 1;
            if (v25 == -1 || v26 > *(_QWORD *)((char *)a3 + *v5))
              goto LABEL_90;
            v27 = *(char *)(*(_QWORD *)((char *)a3 + *v7) + v25);
            *(_QWORD *)((char *)a3 + v24) = v26;
            if (v27 < 0)
            {
              v28 = v23++ > 8;
              if (!v28)
                continue;
            }
            goto LABEL_92;
          }
        case 3u:
          if ((v10 & 7) != 0)
            goto LABEL_95;
          v29 = 0;
          while (1)
          {
            v30 = *v4;
            v31 = *(_QWORD *)((char *)a3 + v30);
            v32 = v31 + 1;
            if (v31 == -1 || v32 > *(_QWORD *)((char *)a3 + *v5))
              goto LABEL_90;
            v33 = *(char *)(*(_QWORD *)((char *)a3 + *v7) + v31);
            *(_QWORD *)((char *)a3 + v30) = v32;
            if (v33 < 0)
            {
              v28 = v29++ > 8;
              if (!v28)
                continue;
            }
            goto LABEL_92;
          }
        case 4u:
        case 6u:
          if (v18 != 1)
            goto LABEL_95;
          v20 = *v4;
          v21 = *(_QWORD *)((char *)a3 + v20);
          if (v21 > 0xFFFFFFFFFFFFFFF7)
            goto LABEL_91;
          v22 = v21 + 8;
          if (v22 > *(_QWORD *)((char *)a3 + *v5))
            goto LABEL_91;
          *(_QWORD *)((char *)a3 + v20) = v22;
          continue;
        case 5u:
          if (v18 != 2 || !PBReaderPlaceMark() || !GEOPDSearchTokenCandidatesIsValid((char *)a3))
            goto LABEL_95;
LABEL_46:
          PBReaderRecallMark();
          continue;
        case 7u:
          if (v18 == 2)
            goto LABEL_48;
          goto LABEL_95;
        case 8u:
          if ((v10 & 7) != 0)
            goto LABEL_95;
          v34 = 0;
          while (1)
          {
            v35 = *v4;
            v36 = *(_QWORD *)((char *)a3 + v35);
            v37 = v36 + 1;
            if (v36 == -1 || v37 > *(_QWORD *)((char *)a3 + *v5))
              goto LABEL_90;
            v38 = *(char *)(*(_QWORD *)((char *)a3 + *v7) + v36);
            *(_QWORD *)((char *)a3 + v35) = v37;
            if (v38 < 0)
            {
              v28 = v34++ > 8;
              if (!v28)
                continue;
            }
            goto LABEL_92;
          }
        case 9u:
          if ((v10 & 7) != 0)
            goto LABEL_95;
          v39 = 0;
          while (1)
          {
            v40 = *v4;
            v41 = *(_QWORD *)((char *)a3 + v40);
            v42 = v41 + 1;
            if (v41 == -1 || v42 > *(_QWORD *)((char *)a3 + *v5))
              goto LABEL_90;
            v43 = *(char *)(*(_QWORD *)((char *)a3 + *v7) + v41);
            *(_QWORD *)((char *)a3 + v40) = v42;
            if (v43 < 0)
            {
              v28 = v39++ > 8;
              if (!v28)
                continue;
            }
            goto LABEL_92;
          }
        case 0xAu:
          if ((v10 & 7) != 0)
            goto LABEL_95;
          v44 = 0;
          while (1)
          {
            v45 = *v4;
            v46 = *(_QWORD *)((char *)a3 + v45);
            v47 = v46 + 1;
            if (v46 == -1 || v47 > *(_QWORD *)((char *)a3 + *v5))
              goto LABEL_90;
            v48 = *(char *)(*(_QWORD *)((char *)a3 + *v7) + v46);
            *(_QWORD *)((char *)a3 + v45) = v47;
            if (v48 < 0)
            {
              v28 = v44++ > 8;
              if (!v28)
                continue;
            }
            goto LABEL_92;
          }
        case 0xBu:
          if ((v10 & 7) != 0)
            goto LABEL_95;
          v49 = 0;
          while (1)
          {
            v50 = *v4;
            v51 = *(_QWORD *)((char *)a3 + v50);
            v52 = v51 + 1;
            if (v51 == -1 || v52 > *(_QWORD *)((char *)a3 + *v5))
              goto LABEL_90;
            v53 = *(char *)(*(_QWORD *)((char *)a3 + *v7) + v51);
            *(_QWORD *)((char *)a3 + v50) = v52;
            if (v53 < 0)
            {
              v28 = v49++ > 8;
              if (!v28)
                continue;
            }
            goto LABEL_92;
          }
        case 0xCu:
          if ((v10 & 7) != 0)
            goto LABEL_95;
          v54 = 0;
          break;
        default:
LABEL_48:
          if ((PBReaderSkipValueWithTag() & 1) != 0)
            continue;
LABEL_95:
          PBReaderRecallMark();
          return 0;
      }
      while (1)
      {
        v55 = *v4;
        v56 = *(_QWORD *)((char *)a3 + v55);
        v57 = v56 + 1;
        if (v56 == -1 || v57 > *(_QWORD *)((char *)a3 + *v5))
          break;
        v58 = *(char *)(*(_QWORD *)((char *)a3 + *v7) + v56);
        *(_QWORD *)((char *)a3 + v55) = v57;
        if (v58 < 0)
        {
          v28 = v54++ > 8;
          if (!v28)
            continue;
        }
        goto LABEL_92;
      }
LABEL_90:
      v16 = *v6;
LABEL_91:
      *((_BYTE *)a3 + v16) = 1;
LABEL_92:
      ;
    }
    while (*(_QWORD *)((char *)a3 + *v4) < *(_QWORD *)((char *)a3 + *v5));
  }
  v59 = *((_BYTE *)a3 + *v6) == 0;
  PBReaderRecallMark();
  return v59;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchSpellerResponseReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int16 flags;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  __int16 v15;
  PBDataReader *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0x1E00) == 0))
  {
    v16 = self->_reader;
    objc_sync_enter(v16);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v17);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v16);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchSpellerResponse readAll:](self, "readAll:", 0);
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v6 = self->_spellSuggestions;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v23 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v7);
    }

    flags = (__int16)self->_flags;
    if ((flags & 0x40) != 0)
    {
      PBDataWriterWriteInt32Field();
      flags = (__int16)self->_flags;
    }
    if ((flags & 1) != 0)
    {
      PBDataWriterWriteUint64Field();
      flags = (__int16)self->_flags;
    }
    if ((flags & 2) != 0)
      PBDataWriterWriteDoubleField();
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v11 = self->_tokenCandidates;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v19;
      do
      {
        for (j = 0; j != v12; ++j)
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v11);
          PBDataWriterWriteSubmessage();
        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      }
      while (v12);
    }

    if ((*(_WORD *)&self->_flags & 4) != 0)
      PBDataWriterWriteDoubleField();
    if (self->_debugResponse)
      PBDataWriterWriteStringField();
    v15 = (__int16)self->_flags;
    if ((v15 & 0x20) != 0)
    {
      PBDataWriterWriteInt32Field();
      v15 = (__int16)self->_flags;
    }
    if ((v15 & 0x80) != 0)
    {
      PBDataWriterWriteBOOLField();
      v15 = (__int16)self->_flags;
    }
    if ((v15 & 0x100) != 0)
    {
      PBDataWriterWriteBOOLField();
      v15 = (__int16)self->_flags;
    }
    if ((v15 & 8) != 0)
    {
      PBDataWriterWriteUint32Field();
      v15 = (__int16)self->_flags;
    }
    if ((v15 & 0x10) != 0)
      PBDataWriterWriteUint32Field();
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  __int16 flags;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  void *v12;
  id *v13;
  __int16 v14;
  id *v15;

  v15 = (id *)a3;
  -[GEOPDSearchSpellerResponse readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v15 + 1, self->_reader);
  *((_DWORD *)v15 + 16) = self->_readerMarkPos;
  *((_DWORD *)v15 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEOPDSearchSpellerResponse spellSuggestionsCount](self, "spellSuggestionsCount"))
  {
    objc_msgSend(v15, "clearSpellSuggestions");
    v4 = -[GEOPDSearchSpellerResponse spellSuggestionsCount](self, "spellSuggestionsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOPDSearchSpellerResponse spellSuggestionAtIndex:](self, "spellSuggestionAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addSpellSuggestion:", v7);

      }
    }
  }
  flags = (__int16)self->_flags;
  if ((flags & 0x40) == 0)
  {
    if ((flags & 1) == 0)
      goto LABEL_7;
LABEL_25:
    v15[3] = (id)self->_decileId;
    *((_WORD *)v15 + 48) |= 1u;
    if ((*(_WORD *)&self->_flags & 2) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  *((_DWORD *)v15 + 22) = self->_resultStatus;
  *((_WORD *)v15 + 48) |= 0x40u;
  flags = (__int16)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_25;
LABEL_7:
  if ((flags & 2) != 0)
  {
LABEL_8:
    v15[4] = *(id *)&self->_latencyMs;
    *((_WORD *)v15 + 48) |= 2u;
  }
LABEL_9:
  if (-[GEOPDSearchSpellerResponse tokenCandidatesCount](self, "tokenCandidatesCount"))
  {
    objc_msgSend(v15, "clearTokenCandidates");
    v9 = -[GEOPDSearchSpellerResponse tokenCandidatesCount](self, "tokenCandidatesCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[GEOPDSearchSpellerResponse tokenCandidatesAtIndex:](self, "tokenCandidatesAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addTokenCandidates:", v12);

      }
    }
  }
  v13 = v15;
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    v15[5] = *(id *)&self->_misspellScore;
    *((_WORD *)v15 + 48) |= 4u;
  }
  if (self->_debugResponse)
  {
    objc_msgSend(v15, "setDebugResponse:");
    v13 = v15;
  }
  v14 = (__int16)self->_flags;
  if ((v14 & 0x20) != 0)
  {
    *((_DWORD *)v13 + 21) = self->_rankerModelType;
    *((_WORD *)v13 + 48) |= 0x20u;
    v14 = (__int16)self->_flags;
    if ((v14 & 0x80) == 0)
    {
LABEL_19:
      if ((v14 & 0x100) == 0)
        goto LABEL_20;
      goto LABEL_29;
    }
  }
  else if ((v14 & 0x80) == 0)
  {
    goto LABEL_19;
  }
  *((_BYTE *)v13 + 92) = self->_isFromDLCacheModel;
  *((_WORD *)v13 + 48) |= 0x80u;
  v14 = (__int16)self->_flags;
  if ((v14 & 0x100) == 0)
  {
LABEL_20:
    if ((v14 & 8) == 0)
      goto LABEL_21;
LABEL_30:
    *((_DWORD *)v13 + 19) = self->_modelNumberMajor;
    *((_WORD *)v13 + 48) |= 8u;
    if ((*(_WORD *)&self->_flags & 0x10) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
LABEL_29:
  *((_BYTE *)v13 + 93) = self->_isFromDLRuntimeModel;
  *((_WORD *)v13 + 48) |= 0x100u;
  v14 = (__int16)self->_flags;
  if ((v14 & 8) != 0)
    goto LABEL_30;
LABEL_21:
  if ((v14 & 0x10) != 0)
  {
LABEL_22:
    *((_DWORD *)v13 + 20) = self->_modelNumberMinor;
    *((_WORD *)v13 + 48) |= 0x10u;
  }
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
  __int16 flags;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  uint64_t v20;
  void *v21;
  __int16 v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchSpellerResponse readAll:](self, "readAll:", 0);
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v9 = self->_spellSuggestions;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v29 != v11)
            objc_enumerationMutation(v9);
          v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "copyWithZone:", a3);
          objc_msgSend((id)v5, "addSpellSuggestion:", v13);

        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v10);
    }

    flags = (__int16)self->_flags;
    if ((flags & 0x40) != 0)
    {
      *(_DWORD *)(v5 + 88) = self->_resultStatus;
      *(_WORD *)(v5 + 96) |= 0x40u;
      flags = (__int16)self->_flags;
      if ((flags & 1) == 0)
      {
LABEL_14:
        if ((flags & 2) == 0)
          goto LABEL_16;
        goto LABEL_15;
      }
    }
    else if ((flags & 1) == 0)
    {
      goto LABEL_14;
    }
    *(_QWORD *)(v5 + 24) = self->_decileId;
    *(_WORD *)(v5 + 96) |= 1u;
    if ((*(_WORD *)&self->_flags & 2) == 0)
    {
LABEL_16:
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v15 = self->_tokenCandidates;
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v25;
        do
        {
          for (j = 0; j != v16; ++j)
          {
            if (*(_QWORD *)v25 != v17)
              objc_enumerationMutation(v15);
            v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v24);
            objc_msgSend((id)v5, "addTokenCandidates:", v19);

          }
          v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        }
        while (v16);
      }

      if ((*(_WORD *)&self->_flags & 4) != 0)
      {
        *(double *)(v5 + 40) = self->_misspellScore;
        *(_WORD *)(v5 + 96) |= 4u;
      }
      v20 = -[NSString copyWithZone:](self->_debugResponse, "copyWithZone:", a3, (_QWORD)v24);
      v21 = *(void **)(v5 + 16);
      *(_QWORD *)(v5 + 16) = v20;

      v22 = (__int16)self->_flags;
      if ((v22 & 0x20) != 0)
      {
        *(_DWORD *)(v5 + 84) = self->_rankerModelType;
        *(_WORD *)(v5 + 96) |= 0x20u;
        v22 = (__int16)self->_flags;
        if ((v22 & 0x80) == 0)
        {
LABEL_27:
          if ((v22 & 0x100) == 0)
            goto LABEL_28;
          goto LABEL_37;
        }
      }
      else if ((v22 & 0x80) == 0)
      {
        goto LABEL_27;
      }
      *(_BYTE *)(v5 + 92) = self->_isFromDLCacheModel;
      *(_WORD *)(v5 + 96) |= 0x80u;
      v22 = (__int16)self->_flags;
      if ((v22 & 0x100) == 0)
      {
LABEL_28:
        if ((v22 & 8) == 0)
          goto LABEL_29;
        goto LABEL_38;
      }
LABEL_37:
      *(_BYTE *)(v5 + 93) = self->_isFromDLRuntimeModel;
      *(_WORD *)(v5 + 96) |= 0x100u;
      v22 = (__int16)self->_flags;
      if ((v22 & 8) == 0)
      {
LABEL_29:
        if ((v22 & 0x10) == 0)
          return (id)v5;
LABEL_30:
        *(_DWORD *)(v5 + 80) = self->_modelNumberMinor;
        *(_WORD *)(v5 + 96) |= 0x10u;
        return (id)v5;
      }
LABEL_38:
      *(_DWORD *)(v5 + 76) = self->_modelNumberMajor;
      *(_WORD *)(v5 + 96) |= 8u;
      if ((*(_WORD *)&self->_flags & 0x10) == 0)
        return (id)v5;
      goto LABEL_30;
    }
LABEL_15:
    *(double *)(v5 + 32) = self->_latencyMs;
    *(_WORD *)(v5 + 96) |= 2u;
    goto LABEL_16;
  }
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x1000) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOPDSearchSpellerResponseReadAllFrom(v5, self->_reader);
  os_unfair_lock_unlock(&self->_readerLock);
  v8 = (id)v5;
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *spellSuggestions;
  __int16 flags;
  __int16 v7;
  NSMutableArray *tokenCandidates;
  NSString *debugResponse;
  BOOL v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_61;
  -[GEOPDSearchSpellerResponse readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  spellSuggestions = self->_spellSuggestions;
  if ((unint64_t)spellSuggestions | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](spellSuggestions, "isEqual:"))
      goto LABEL_61;
  }
  flags = (__int16)self->_flags;
  v7 = *((_WORD *)v4 + 48);
  if ((flags & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_resultStatus != *((_DWORD *)v4 + 22))
      goto LABEL_61;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_61;
  }
  if ((flags & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_decileId != *((_QWORD *)v4 + 3))
      goto LABEL_61;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_61;
  }
  if ((flags & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_latencyMs != *((double *)v4 + 4))
      goto LABEL_61;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_61;
  }
  tokenCandidates = self->_tokenCandidates;
  if ((unint64_t)tokenCandidates | *((_QWORD *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](tokenCandidates, "isEqual:"))
      goto LABEL_61;
    flags = (__int16)self->_flags;
    v7 = *((_WORD *)v4 + 48);
  }
  if ((flags & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_misspellScore != *((double *)v4 + 5))
      goto LABEL_61;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_61;
  }
  debugResponse = self->_debugResponse;
  if ((unint64_t)debugResponse | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](debugResponse, "isEqual:"))
      goto LABEL_61;
    flags = (__int16)self->_flags;
    v7 = *((_WORD *)v4 + 48);
  }
  if ((flags & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_rankerModelType != *((_DWORD *)v4 + 21))
      goto LABEL_61;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_61;
  }
  if ((flags & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0)
      goto LABEL_61;
    if (self->_isFromDLCacheModel)
    {
      if (!*((_BYTE *)v4 + 92))
        goto LABEL_61;
    }
    else if (*((_BYTE *)v4 + 92))
    {
      goto LABEL_61;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_61;
  }
  if ((flags & 0x100) != 0)
  {
    if ((v7 & 0x100) != 0)
    {
      if (self->_isFromDLRuntimeModel)
      {
        if (!*((_BYTE *)v4 + 93))
          goto LABEL_61;
        goto LABEL_51;
      }
      if (!*((_BYTE *)v4 + 93))
        goto LABEL_51;
    }
LABEL_61:
    v10 = 0;
    goto LABEL_62;
  }
  if ((v7 & 0x100) != 0)
    goto LABEL_61;
LABEL_51:
  if ((flags & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_modelNumberMajor != *((_DWORD *)v4 + 19))
      goto LABEL_61;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_61;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_modelNumberMinor != *((_DWORD *)v4 + 20))
      goto LABEL_61;
    v10 = 1;
  }
  else
  {
    v10 = (v7 & 0x10) == 0;
  }
LABEL_62:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  __int16 flags;
  uint64_t v5;
  unint64_t v6;
  double latencyMs;
  double v8;
  long double v9;
  double v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  double misspellScore;
  double v15;
  long double v16;
  double v17;
  NSUInteger v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  -[GEOPDSearchSpellerResponse readAll:](self, "readAll:", 1);
  v3 = -[NSMutableArray hash](self->_spellSuggestions, "hash");
  flags = (__int16)self->_flags;
  if ((flags & 0x40) == 0)
  {
    v5 = 0;
    if ((flags & 1) != 0)
      goto LABEL_3;
LABEL_9:
    v6 = 0;
    if ((flags & 2) != 0)
      goto LABEL_4;
LABEL_10:
    v11 = 0;
    goto LABEL_13;
  }
  v5 = 2654435761 * self->_resultStatus;
  if ((flags & 1) == 0)
    goto LABEL_9;
LABEL_3:
  v6 = 2654435761u * self->_decileId;
  if ((flags & 2) == 0)
    goto LABEL_10;
LABEL_4:
  latencyMs = self->_latencyMs;
  v8 = -latencyMs;
  if (latencyMs >= 0.0)
    v8 = self->_latencyMs;
  v9 = floor(v8 + 0.5);
  v10 = (v8 - v9) * 1.84467441e19;
  v11 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
  if (v10 >= 0.0)
  {
    if (v10 > 0.0)
      v11 += (unint64_t)v10;
  }
  else
  {
    v11 -= (unint64_t)fabs(v10);
  }
LABEL_13:
  v12 = -[NSMutableArray hash](self->_tokenCandidates, "hash");
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    misspellScore = self->_misspellScore;
    v15 = -misspellScore;
    if (misspellScore >= 0.0)
      v15 = self->_misspellScore;
    v16 = floor(v15 + 0.5);
    v17 = (v15 - v16) * 1.84467441e19;
    v13 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
    if (v17 >= 0.0)
    {
      if (v17 > 0.0)
        v13 += (unint64_t)v17;
    }
    else
    {
      v13 -= (unint64_t)fabs(v17);
    }
  }
  else
  {
    v13 = 0;
  }
  v18 = -[NSString hash](self->_debugResponse, "hash");
  v19 = (__int16)self->_flags;
  if ((v19 & 0x20) != 0)
  {
    v20 = 2654435761 * self->_rankerModelType;
    if ((v19 & 0x80) != 0)
    {
LABEL_23:
      v21 = 2654435761 * self->_isFromDLCacheModel;
      if ((*(_WORD *)&self->_flags & 0x100) != 0)
        goto LABEL_24;
      goto LABEL_29;
    }
  }
  else
  {
    v20 = 0;
    if ((v19 & 0x80) != 0)
      goto LABEL_23;
  }
  v21 = 0;
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
LABEL_24:
    v22 = 2654435761 * self->_isFromDLRuntimeModel;
    if ((v19 & 8) != 0)
      goto LABEL_25;
LABEL_30:
    v23 = 0;
    if ((v19 & 0x10) != 0)
      goto LABEL_26;
LABEL_31:
    v24 = 0;
    return v5 ^ v3 ^ v6 ^ v11 ^ v12 ^ v13 ^ v18 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24;
  }
LABEL_29:
  v22 = 0;
  if ((v19 & 8) == 0)
    goto LABEL_30;
LABEL_25:
  v23 = 2654435761 * self->_modelNumberMajor;
  if ((v19 & 0x10) == 0)
    goto LABEL_31;
LABEL_26:
  v24 = 2654435761 * self->_modelNumberMinor;
  return v5 ^ v3 ^ v6 ^ v11 ^ v12 ^ v13 ^ v18 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int16 v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  __int16 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = *((id *)v4 + 6);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        -[GEOPDSearchSpellerResponse addSpellSuggestion:](self, "addSpellSuggestion:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v7);
  }

  v10 = *((_WORD *)v4 + 48);
  if ((v10 & 0x40) != 0)
  {
    self->_resultStatus = *((_DWORD *)v4 + 22);
    *(_WORD *)&self->_flags |= 0x40u;
    v10 = *((_WORD *)v4 + 48);
    if ((v10 & 1) == 0)
    {
LABEL_10:
      if ((v10 & 2) == 0)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else if ((v10 & 1) == 0)
  {
    goto LABEL_10;
  }
  self->_decileId = *((_QWORD *)v4 + 3);
  *(_WORD *)&self->_flags |= 1u;
  if ((*((_WORD *)v4 + 48) & 2) != 0)
  {
LABEL_11:
    self->_latencyMs = *((double *)v4 + 4);
    *(_WORD *)&self->_flags |= 2u;
  }
LABEL_12:
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = *((id *)v4 + 7);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        -[GEOPDSearchSpellerResponse addTokenCandidates:](self, "addTokenCandidates:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * j), (_QWORD)v17);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v13);
  }

  if ((*((_WORD *)v4 + 48) & 4) != 0)
  {
    self->_misspellScore = *((double *)v4 + 5);
    *(_WORD *)&self->_flags |= 4u;
  }
  if (*((_QWORD *)v4 + 2))
    -[GEOPDSearchSpellerResponse setDebugResponse:](self, "setDebugResponse:");
  v16 = *((_WORD *)v4 + 48);
  if ((v16 & 0x20) != 0)
  {
    self->_rankerModelType = *((_DWORD *)v4 + 21);
    *(_WORD *)&self->_flags |= 0x20u;
    v16 = *((_WORD *)v4 + 48);
    if ((v16 & 0x80) == 0)
    {
LABEL_25:
      if ((v16 & 0x100) == 0)
        goto LABEL_26;
      goto LABEL_35;
    }
  }
  else if ((v16 & 0x80) == 0)
  {
    goto LABEL_25;
  }
  self->_isFromDLCacheModel = *((_BYTE *)v4 + 92);
  *(_WORD *)&self->_flags |= 0x80u;
  v16 = *((_WORD *)v4 + 48);
  if ((v16 & 0x100) == 0)
  {
LABEL_26:
    if ((v16 & 8) == 0)
      goto LABEL_27;
LABEL_36:
    self->_modelNumberMajor = *((_DWORD *)v4 + 19);
    *(_WORD *)&self->_flags |= 8u;
    if ((*((_WORD *)v4 + 48) & 0x10) == 0)
      goto LABEL_29;
    goto LABEL_28;
  }
LABEL_35:
  self->_isFromDLRuntimeModel = *((_BYTE *)v4 + 93);
  *(_WORD *)&self->_flags |= 0x100u;
  v16 = *((_WORD *)v4 + 48);
  if ((v16 & 8) != 0)
    goto LABEL_36;
LABEL_27:
  if ((v16 & 0x10) != 0)
  {
LABEL_28:
    self->_modelNumberMinor = *((_DWORD *)v4 + 20);
    *(_WORD *)&self->_flags |= 0x10u;
  }
LABEL_29:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenCandidates, 0);
  objc_storeStrong((id *)&self->_spellSuggestions, 0);
  objc_storeStrong((id *)&self->_debugResponse, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
