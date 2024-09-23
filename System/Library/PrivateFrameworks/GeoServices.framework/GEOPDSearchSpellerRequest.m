@implementation GEOPDSearchSpellerRequest

- (GEOPDSearchSpellerRequest)init
{
  GEOPDSearchSpellerRequest *v2;
  GEOPDSearchSpellerRequest *v3;
  GEOPDSearchSpellerRequest *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchSpellerRequest;
  v2 = -[GEOPDSearchSpellerRequest init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchSpellerRequest)initWithData:(id)a3
{
  GEOPDSearchSpellerRequest *v3;
  GEOPDSearchSpellerRequest *v4;
  GEOPDSearchSpellerRequest *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchSpellerRequest;
  v3 = -[GEOPDSearchSpellerRequest initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readQuery
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 84) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchSpellerRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readQuery_tags_5);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasQuery
{
  -[GEOPDSearchSpellerRequest _readQuery]((uint64_t)self);
  return self->_query != 0;
}

- (NSString)query
{
  -[GEOPDSearchSpellerRequest _readQuery]((uint64_t)self);
  return self->_query;
}

- (void)setQuery:(id)a3
{
  *(_WORD *)&self->_flags |= 0x500u;
  objc_storeStrong((id *)&self->_query, a3);
}

- (void)_readLocationContext
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 84) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchSpellerRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLocationContext_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasLocationContext
{
  -[GEOPDSearchSpellerRequest _readLocationContext]((uint64_t)self);
  return self->_locationContext != 0;
}

- (GEOPDSearchLocationContext)locationContext
{
  -[GEOPDSearchSpellerRequest _readLocationContext]((uint64_t)self);
  return self->_locationContext;
}

- (void)setLocationContext:(id)a3
{
  *(_WORD *)&self->_flags |= 0x480u;
  objc_storeStrong((id *)&self->_locationContext, a3);
}

- (void)_readLanguageContext
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 84) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchSpellerRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLanguageContext_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasLanguageContext
{
  -[GEOPDSearchSpellerRequest _readLanguageContext]((uint64_t)self);
  return self->_languageContext != 0;
}

- (GEOPDSearchLanguageContext)languageContext
{
  -[GEOPDSearchSpellerRequest _readLanguageContext]((uint64_t)self);
  return self->_languageContext;
}

- (void)setLanguageContext:(id)a3
{
  *(_WORD *)&self->_flags |= 0x440u;
  objc_storeStrong((id *)&self->_languageContext, a3);
}

- (BOOL)performCompletion
{
  return self->_performCompletion;
}

- (void)setPerformCompletion:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x408u;
  self->_performCompletion = a3;
}

- (void)setHasPerformCompletion:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1032;
  else
    v3 = 1024;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasPerformCompletion
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (unsigned)maxSuggestions
{
  return self->_maxSuggestions;
}

- (void)setMaxSuggestions:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x402u;
  self->_maxSuggestions = a3;
}

- (void)setHasMaxSuggestions:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1026;
  else
    v3 = 1024;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasMaxSuggestions
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (void)_readAbConfigParams
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 84) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchSpellerRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAbConfigParams_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasAbConfigParams
{
  -[GEOPDSearchSpellerRequest _readAbConfigParams]((uint64_t)self);
  return self->_abConfigParams != 0;
}

- (GEOPDSearchKeyValuePairList)abConfigParams
{
  -[GEOPDSearchSpellerRequest _readAbConfigParams]((uint64_t)self);
  return self->_abConfigParams;
}

- (void)setAbConfigParams:(id)a3
{
  *(_WORD *)&self->_flags |= 0x420u;
  objc_storeStrong((id *)&self->_abConfigParams, a3);
}

- (int)queryType
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 4) != 0)
    return self->_queryType;
  else
    return 0;
}

- (void)setQueryType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x404u;
  self->_queryType = a3;
}

- (void)setHasQueryType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1028;
  else
    v3 = 1024;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasQueryType
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (id)queryTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C125F8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsQueryType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POI")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ADDRESS")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)useCache
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (flags & 0x10) == 0 || self->_useCache;
}

- (void)setUseCache:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x410u;
  self->_useCache = a3;
}

- (void)setHasUseCache:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1040;
  else
    v3 = 1024;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasUseCache
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (int)requestFlags
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_requestFlags;
  else
    return 0;
}

- (void)setRequestFlags:(int)a3
{
  *(_WORD *)&self->_flags |= 0x401u;
  self->_requestFlags = a3;
}

- (void)setHasRequestFlags:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x400;
}

- (BOOL)hasRequestFlags
{
  return *(_WORD *)&self->_flags & 1;
}

- (id)requestFlagsAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C12610[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRequestFlags:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NONE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DEBUG_REQUEST")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("DEBUG_EVAL_REQUEST")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readTokenTags
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 84) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchSpellerRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTokenTags_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasTokenTags
{
  -[GEOPDSearchSpellerRequest _readTokenTags]((uint64_t)self);
  return self->_tokenTags != 0;
}

- (GEOPDSearchKeyValuePairList)tokenTags
{
  -[GEOPDSearchSpellerRequest _readTokenTags]((uint64_t)self);
  return self->_tokenTags;
}

- (void)setTokenTags:(id)a3
{
  *(_WORD *)&self->_flags |= 0x600u;
  objc_storeStrong((id *)&self->_tokenTags, a3);
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
  v8.super_class = (Class)GEOPDSearchSpellerRequest;
  -[GEOPDSearchSpellerRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchSpellerRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchSpellerRequest _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  __int16 v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  __int16 v23;
  uint64_t v24;
  __CFString *v25;
  const __CFString *v26;
  void *v27;
  const __CFString *v28;
  uint64_t v29;
  __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  const __CFString *v34;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "query");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("query"));

  objc_msgSend((id)a1, "locationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v6, "jsonRepresentation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = CFSTR("locationContext");
    }
    else
    {
      objc_msgSend(v6, "dictionaryRepresentation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = CFSTR("location_context");
    }
    objc_msgSend(v4, "setObject:forKey:", v8, v9);

  }
  objc_msgSend((id)a1, "languageContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v10, "jsonRepresentation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = CFSTR("languageContext");
    }
    else
    {
      objc_msgSend(v10, "dictionaryRepresentation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = CFSTR("language_context");
    }
    objc_msgSend(v4, "setObject:forKey:", v12, v13);

  }
  v14 = *(_WORD *)(a1 + 84);
  if ((v14 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 80));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v16 = CFSTR("performCompletion");
    else
      v16 = CFSTR("perform_completion");
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

    v14 = *(_WORD *)(a1 + 84);
  }
  if ((v14 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 72));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v18 = CFSTR("maxSuggestions");
    else
      v18 = CFSTR("max_suggestions");
    objc_msgSend(v4, "setObject:forKey:", v17, v18);

  }
  objc_msgSend((id)a1, "abConfigParams");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v19, "jsonRepresentation");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = CFSTR("abConfigParams");
    }
    else
    {
      objc_msgSend(v19, "dictionaryRepresentation");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = CFSTR("ab_config_params");
    }
    objc_msgSend(v4, "setObject:forKey:", v21, v22);

  }
  v23 = *(_WORD *)(a1 + 84);
  if ((v23 & 4) == 0)
  {
    if ((v23 & 0x10) == 0)
      goto LABEL_31;
LABEL_40:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 81));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v28 = CFSTR("useCache");
    else
      v28 = CFSTR("use_cache");
    objc_msgSend(v4, "setObject:forKey:", v27, v28);

    if ((*(_WORD *)(a1 + 84) & 1) == 0)
      goto LABEL_48;
    goto LABEL_44;
  }
  v24 = *(int *)(a1 + 76);
  if (v24 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 76));
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = off_1E1C125F8[v24];
  }
  if (a2)
    v26 = CFSTR("queryType");
  else
    v26 = CFSTR("query_type");
  objc_msgSend(v4, "setObject:forKey:", v25, v26);

  v23 = *(_WORD *)(a1 + 84);
  if ((v23 & 0x10) != 0)
    goto LABEL_40;
LABEL_31:
  if ((v23 & 1) != 0)
  {
LABEL_44:
    v29 = *(int *)(a1 + 68);
    if (v29 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 68));
      v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v30 = off_1E1C12610[v29];
    }
    objc_msgSend(v4, "setObject:forKey:", v30, CFSTR("flags"));

  }
LABEL_48:
  objc_msgSend((id)a1, "tokenTags");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (v31)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v31, "jsonRepresentation");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = CFSTR("tokenTags");
    }
    else
    {
      objc_msgSend(v31, "dictionaryRepresentation");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = CFSTR("token_tags");
    }
    objc_msgSend(v4, "setObject:forKey:", v33, v34);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchSpellerRequest _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOPDSearchSpellerRequest)initWithDictionary:(id)a3
{
  return (GEOPDSearchSpellerRequest *)-[GEOPDSearchSpellerRequest _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  GEOPDSearchLocationContext *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  GEOPDSearchLanguageContext *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  GEOPDSearchKeyValuePairList *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  id v26;
  uint64_t v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  const __CFString *v33;
  void *v34;
  GEOPDSearchKeyValuePairList *v35;
  void *v36;

  v5 = a2;
  if (!a1)
    goto LABEL_76;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_76;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("query"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(a1, "setQuery:", v7);

  }
  if (a3)
    v8 = CFSTR("locationContext");
  else
    v8 = CFSTR("location_context");
  objc_msgSend(v5, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = [GEOPDSearchLocationContext alloc];
    if (v10)
      v11 = -[GEOPDSearchLocationContext _initWithDictionary:isJSON:](v10, v9, a3);
    else
      v11 = 0;
    objc_msgSend(a1, "setLocationContext:", v11);

  }
  if (a3)
    v12 = CFSTR("languageContext");
  else
    v12 = CFSTR("language_context");
  objc_msgSend(v5, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = [GEOPDSearchLanguageContext alloc];
    if (v14)
      v15 = -[GEOPDSearchLanguageContext _initWithDictionary:isJSON:](v14, v13, a3);
    else
      v15 = 0;
    objc_msgSend(a1, "setLanguageContext:", v15);

  }
  if (a3)
    v16 = CFSTR("performCompletion");
  else
    v16 = CFSTR("perform_completion");
  objc_msgSend(v5, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setPerformCompletion:", objc_msgSend(v17, "BOOLValue"));

  if (a3)
    v18 = CFSTR("maxSuggestions");
  else
    v18 = CFSTR("max_suggestions");
  objc_msgSend(v5, "objectForKeyedSubscript:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setMaxSuggestions:", objc_msgSend(v19, "unsignedIntValue"));

  if (a3)
    v20 = CFSTR("abConfigParams");
  else
    v20 = CFSTR("ab_config_params");
  objc_msgSend(v5, "objectForKeyedSubscript:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22 = [GEOPDSearchKeyValuePairList alloc];
    if (v22)
      v23 = -[GEOPDSearchKeyValuePairList _initWithDictionary:isJSON:](v22, v21);
    else
      v23 = 0;
    objc_msgSend(a1, "setAbConfigParams:", v23);

  }
  if (a3)
    v24 = CFSTR("queryType");
  else
    v24 = CFSTR("query_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v26 = v25;
    if ((objc_msgSend(v26, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
    {
      v27 = 0;
    }
    else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("POI")) & 1) != 0)
    {
      v27 = 1;
    }
    else if (objc_msgSend(v26, "isEqualToString:", CFSTR("ADDRESS")))
    {
      v27 = 2;
    }
    else
    {
      v27 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_51;
    v27 = objc_msgSend(v25, "intValue");
  }
  objc_msgSend(a1, "setQueryType:", v27);
LABEL_51:

  if (a3)
    v28 = CFSTR("useCache");
  else
    v28 = CFSTR("use_cache");
  objc_msgSend(v5, "objectForKeyedSubscript:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setUseCache:", objc_msgSend(v29, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("flags"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v31 = v30;
    if ((objc_msgSend(v31, "isEqualToString:", CFSTR("NONE")) & 1) != 0)
    {
      v32 = 0;
    }
    else if ((objc_msgSend(v31, "isEqualToString:", CFSTR("DEBUG_REQUEST")) & 1) != 0)
    {
      v32 = 1;
    }
    else if (objc_msgSend(v31, "isEqualToString:", CFSTR("DEBUG_EVAL_REQUEST")))
    {
      v32 = 2;
    }
    else
    {
      v32 = 0;
    }

    goto LABEL_67;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v32 = objc_msgSend(v30, "intValue");
LABEL_67:
    objc_msgSend(a1, "setRequestFlags:", v32);
  }

  if (a3)
    v33 = CFSTR("tokenTags");
  else
    v33 = CFSTR("token_tags");
  objc_msgSend(v5, "objectForKeyedSubscript:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v35 = [GEOPDSearchKeyValuePairList alloc];
    if (v35)
      v36 = -[GEOPDSearchKeyValuePairList _initWithDictionary:isJSON:](v35, v34);
    else
      v36 = 0;
    objc_msgSend(a1, "setTokenTags:", v36);

  }
LABEL_76:

  return a1;
}

- (GEOPDSearchSpellerRequest)initWithJSON:(id)a3
{
  return (GEOPDSearchSpellerRequest *)-[GEOPDSearchSpellerRequest _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_63;
    else
      v8 = (int *)&readAll__nonRecursiveTag_63;
    GEOPDSearchSpellerRequestReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEOPDSearchLocationContext readAll:]((uint64_t)self->_locationContext, 1);
    -[GEOPDSearchLanguageContext readAll:]((uint64_t)self->_languageContext, 1);
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
  int v16;
  int v17;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  int v23;
  BOOL v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  int v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  int v34;
  unsigned int v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  int v39;
  unsigned int v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  int v44;
  BOOL v45;

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
          v16 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((_BYTE *)a3 + *v6) = 1;
LABEL_12:
      v16 = *((unsigned __int8 *)a3 + *v6);
      if (*((_BYTE *)a3 + *v6))
        v10 = 0;
LABEL_14:
      v17 = v10 & 7;
      if (v16 || v17 == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          if (v17 != 2)
            goto LABEL_78;
          goto LABEL_24;
        case 2u:
          if (v17 != 2 || !PBReaderPlaceMark() || !GEOPDSearchLocationContextIsValid((char *)a3))
            goto LABEL_78;
          goto LABEL_33;
        case 3u:
          if (v17 == 2 && PBReaderPlaceMark() && GEOPDSearchLanguageContextIsValid((char *)a3))
            goto LABEL_33;
          goto LABEL_78;
        case 4u:
          if ((v10 & 7) != 0)
            goto LABEL_78;
          v19 = 0;
          while (1)
          {
            v20 = *v4;
            v21 = *(_QWORD *)((char *)a3 + v20);
            v22 = v21 + 1;
            if (v21 == -1 || v22 > *(_QWORD *)((char *)a3 + *v5))
              goto LABEL_74;
            v23 = *(char *)(*(_QWORD *)((char *)a3 + *v7) + v21);
            *(_QWORD *)((char *)a3 + v20) = v22;
            if (v23 < 0)
            {
              v24 = v19++ > 8;
              if (!v24)
                continue;
            }
            goto LABEL_75;
          }
        case 5u:
          if ((v10 & 7) != 0)
            goto LABEL_78;
          v25 = 0;
          while (1)
          {
            v26 = *v4;
            v27 = *(_QWORD *)((char *)a3 + v26);
            v28 = v27 + 1;
            if (v27 == -1 || v28 > *(_QWORD *)((char *)a3 + *v5))
              goto LABEL_74;
            v29 = *(char *)(*(_QWORD *)((char *)a3 + *v7) + v27);
            *(_QWORD *)((char *)a3 + v26) = v28;
            if (v29 < 0)
            {
              v24 = v25++ > 8;
              if (!v24)
                continue;
            }
            goto LABEL_75;
          }
        case 6u:
        case 0xAu:
          if (v17 != 2 || !PBReaderPlaceMark() || !GEOPDSearchKeyValuePairListIsValid((char *)a3))
            goto LABEL_78;
LABEL_33:
          PBReaderRecallMark();
          continue;
        case 7u:
          if ((v10 & 7) != 0)
            goto LABEL_78;
          v30 = 0;
          while (1)
          {
            v31 = *v4;
            v32 = *(_QWORD *)((char *)a3 + v31);
            v33 = v32 + 1;
            if (v32 == -1 || v33 > *(_QWORD *)((char *)a3 + *v5))
              goto LABEL_74;
            v34 = *(char *)(*(_QWORD *)((char *)a3 + *v7) + v32);
            *(_QWORD *)((char *)a3 + v31) = v33;
            if (v34 < 0)
            {
              v24 = v30++ > 8;
              if (!v24)
                continue;
            }
            goto LABEL_75;
          }
        case 8u:
          if ((v10 & 7) != 0)
            goto LABEL_78;
          v35 = 0;
          while (1)
          {
            v36 = *v4;
            v37 = *(_QWORD *)((char *)a3 + v36);
            v38 = v37 + 1;
            if (v37 == -1 || v38 > *(_QWORD *)((char *)a3 + *v5))
              goto LABEL_74;
            v39 = *(char *)(*(_QWORD *)((char *)a3 + *v7) + v37);
            *(_QWORD *)((char *)a3 + v36) = v38;
            if (v39 < 0)
            {
              v24 = v35++ > 8;
              if (!v24)
                continue;
            }
            goto LABEL_75;
          }
        case 9u:
          if ((v10 & 7) != 0)
            goto LABEL_78;
          v40 = 0;
          break;
        default:
LABEL_24:
          if ((PBReaderSkipValueWithTag() & 1) != 0)
            continue;
LABEL_78:
          PBReaderRecallMark();
          return 0;
      }
      while (1)
      {
        v41 = *v4;
        v42 = *(_QWORD *)((char *)a3 + v41);
        v43 = v42 + 1;
        if (v42 == -1 || v43 > *(_QWORD *)((char *)a3 + *v5))
          break;
        v44 = *(char *)(*(_QWORD *)((char *)a3 + *v7) + v42);
        *(_QWORD *)((char *)a3 + v41) = v43;
        if (v44 < 0)
        {
          v24 = v40++ > 8;
          if (!v24)
            continue;
        }
        goto LABEL_75;
      }
LABEL_74:
      *((_BYTE *)a3 + *v6) = 1;
LABEL_75:
      ;
    }
    while (*(_QWORD *)((char *)a3 + *v4) < *(_QWORD *)((char *)a3 + *v5));
  }
  v45 = *((_BYTE *)a3 + *v6) == 0;
  PBReaderRecallMark();
  return v45;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchSpellerRequestReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;
  void *v6;
  __int16 v7;
  __int16 v8;
  PBDataReader *v9;
  void *v10;
  id v11;

  v11 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    flags = (__int16)self->_flags;
    if ((flags & 0x500) == 0)
    {
      if ((flags & 0x80) != 0)
      {
        if (GEOPDSearchLocationContextIsDirty((uint64_t)self->_locationContext))
          goto LABEL_3;
        flags = (__int16)self->_flags;
      }
      if ((flags & 0x40) != 0)
      {
        if (GEOPDSearchLanguageContextIsDirty((uint64_t)self->_languageContext))
          goto LABEL_3;
        flags = (__int16)self->_flags;
      }
      if ((flags & 0x220) == 0)
      {
        v9 = self->_reader;
        objc_sync_enter(v9);
        *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
        -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
        -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "writeData:", v10);
        os_unfair_lock_unlock(p_readerLock);

        objc_sync_exit(v9);
        goto LABEL_21;
      }
    }
  }
LABEL_3:
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchSpellerRequest readAll:](self, "readAll:", 0);
  if (self->_query)
    PBDataWriterWriteStringField();
  v6 = v11;
  if (self->_locationContext)
  {
    PBDataWriterWriteSubmessage();
    v6 = v11;
  }
  if (self->_languageContext)
  {
    PBDataWriterWriteSubmessage();
    v6 = v11;
  }
  v7 = (__int16)self->_flags;
  if ((v7 & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    v6 = v11;
    v7 = (__int16)self->_flags;
  }
  if ((v7 & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v6 = v11;
  }
  if (self->_abConfigParams)
  {
    PBDataWriterWriteSubmessage();
    v6 = v11;
  }
  v8 = (__int16)self->_flags;
  if ((v8 & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v6 = v11;
    v8 = (__int16)self->_flags;
    if ((v8 & 0x10) == 0)
    {
LABEL_17:
      if ((v8 & 1) == 0)
        goto LABEL_19;
      goto LABEL_18;
    }
  }
  else if ((v8 & 0x10) == 0)
  {
    goto LABEL_17;
  }
  PBDataWriterWriteBOOLField();
  v6 = v11;
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
LABEL_18:
    PBDataWriterWriteInt32Field();
    v6 = v11;
  }
LABEL_19:
  if (self->_tokenTags)
  {
    PBDataWriterWriteSubmessage();
LABEL_21:
    v6 = v11;
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEOPDSearchSpellerRequest _readLocationContext]((uint64_t)self);
  return -[GEOPDSearchLocationContext hasGreenTeaWithValue:]((uint64_t)self->_locationContext, v3);
}

- (void)copyTo:(id)a3
{
  id *v4;
  __int16 flags;
  __int16 v6;
  id *v7;

  v7 = (id *)a3;
  -[GEOPDSearchSpellerRequest readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v7 + 1, self->_reader);
  *((_DWORD *)v7 + 14) = self->_readerMarkPos;
  *((_DWORD *)v7 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_query)
    objc_msgSend(v7, "setQuery:");
  if (self->_locationContext)
    objc_msgSend(v7, "setLocationContext:");
  v4 = v7;
  if (self->_languageContext)
  {
    objc_msgSend(v7, "setLanguageContext:");
    v4 = v7;
  }
  flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
  {
    *((_BYTE *)v4 + 80) = self->_performCompletion;
    *((_WORD *)v4 + 42) |= 8u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v4 + 18) = self->_maxSuggestions;
    *((_WORD *)v4 + 42) |= 2u;
  }
  if (self->_abConfigParams)
  {
    objc_msgSend(v7, "setAbConfigParams:");
    v4 = v7;
  }
  v6 = (__int16)self->_flags;
  if ((v6 & 4) != 0)
  {
    *((_DWORD *)v4 + 19) = self->_queryType;
    *((_WORD *)v4 + 42) |= 4u;
    v6 = (__int16)self->_flags;
    if ((v6 & 0x10) == 0)
    {
LABEL_15:
      if ((v6 & 1) == 0)
        goto LABEL_17;
      goto LABEL_16;
    }
  }
  else if ((v6 & 0x10) == 0)
  {
    goto LABEL_15;
  }
  *((_BYTE *)v4 + 81) = self->_useCache;
  *((_WORD *)v4 + 42) |= 0x10u;
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
LABEL_16:
    *((_DWORD *)v4 + 17) = self->_requestFlags;
    *((_WORD *)v4 + 42) |= 1u;
  }
LABEL_17:
  if (self->_tokenTags)
  {
    objc_msgSend(v7, "setTokenTags:");
    v4 = v7;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  __int16 flags;
  id v16;
  void *v17;
  __int16 v18;
  id v19;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchSpellerRequest readAll:](self, "readAll:", 0);
    v9 = -[NSString copyWithZone:](self->_query, "copyWithZone:", a3);
    v10 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v9;

    v11 = -[GEOPDSearchLocationContext copyWithZone:](self->_locationContext, "copyWithZone:", a3);
    v12 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v11;

    v13 = -[GEOPDSearchLanguageContext copyWithZone:](self->_languageContext, "copyWithZone:", a3);
    v14 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v13;

    flags = (__int16)self->_flags;
    if ((flags & 8) != 0)
    {
      *(_BYTE *)(v5 + 80) = self->_performCompletion;
      *(_WORD *)(v5 + 84) |= 8u;
      flags = (__int16)self->_flags;
    }
    if ((flags & 2) != 0)
    {
      *(_DWORD *)(v5 + 72) = self->_maxSuggestions;
      *(_WORD *)(v5 + 84) |= 2u;
    }
    v16 = -[GEOPDSearchKeyValuePairList copyWithZone:](self->_abConfigParams, "copyWithZone:", a3);
    v17 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = v16;

    v18 = (__int16)self->_flags;
    if ((v18 & 4) != 0)
    {
      *(_DWORD *)(v5 + 76) = self->_queryType;
      *(_WORD *)(v5 + 84) |= 4u;
      v18 = (__int16)self->_flags;
      if ((v18 & 0x10) == 0)
      {
LABEL_11:
        if ((v18 & 1) == 0)
        {
LABEL_13:
          v19 = -[GEOPDSearchKeyValuePairList copyWithZone:](self->_tokenTags, "copyWithZone:", a3);
          v8 = *(id *)(v5 + 48);
          *(_QWORD *)(v5 + 48) = v19;
          goto LABEL_14;
        }
LABEL_12:
        *(_DWORD *)(v5 + 68) = self->_requestFlags;
        *(_WORD *)(v5 + 84) |= 1u;
        goto LABEL_13;
      }
    }
    else if ((v18 & 0x10) == 0)
    {
      goto LABEL_11;
    }
    *(_BYTE *)(v5 + 81) = self->_useCache;
    *(_WORD *)(v5 + 84) |= 0x10u;
    if ((*(_WORD *)&self->_flags & 1) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x400) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOPDSearchSpellerRequestReadAllFrom(v5, self->_reader);
  os_unfair_lock_unlock(&self->_readerLock);
  v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_14:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *query;
  GEOPDSearchLocationContext *locationContext;
  GEOPDSearchLanguageContext *languageContext;
  __int16 flags;
  __int16 v9;
  GEOPDSearchKeyValuePairList *abConfigParams;
  GEOPDSearchKeyValuePairList *tokenTags;
  char v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_44;
  -[GEOPDSearchSpellerRequest readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  query = self->_query;
  if ((unint64_t)query | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](query, "isEqual:"))
      goto LABEL_44;
  }
  locationContext = self->_locationContext;
  if ((unint64_t)locationContext | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOPDSearchLocationContext isEqual:](locationContext, "isEqual:"))
      goto LABEL_44;
  }
  languageContext = self->_languageContext;
  if ((unint64_t)languageContext | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOPDSearchLanguageContext isEqual:](languageContext, "isEqual:"))
      goto LABEL_44;
  }
  flags = (__int16)self->_flags;
  v9 = *((_WORD *)v4 + 42);
  if ((flags & 8) != 0)
  {
    if ((v9 & 8) == 0)
      goto LABEL_44;
    if (self->_performCompletion)
    {
      if (!*((_BYTE *)v4 + 80))
        goto LABEL_44;
    }
    else if (*((_BYTE *)v4 + 80))
    {
      goto LABEL_44;
    }
  }
  else if ((v9 & 8) != 0)
  {
    goto LABEL_44;
  }
  if ((flags & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_maxSuggestions != *((_DWORD *)v4 + 18))
      goto LABEL_44;
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_44;
  }
  abConfigParams = self->_abConfigParams;
  if ((unint64_t)abConfigParams | *((_QWORD *)v4 + 2))
  {
    if (!-[GEOPDSearchKeyValuePairList isEqual:](abConfigParams, "isEqual:"))
      goto LABEL_44;
    flags = (__int16)self->_flags;
    v9 = *((_WORD *)v4 + 42);
  }
  if ((flags & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_queryType != *((_DWORD *)v4 + 19))
      goto LABEL_44;
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_44;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v9 & 0x10) != 0)
    {
      if (self->_useCache)
      {
        if (!*((_BYTE *)v4 + 81))
          goto LABEL_44;
        goto LABEL_37;
      }
      if (!*((_BYTE *)v4 + 81))
        goto LABEL_37;
    }
LABEL_44:
    v12 = 0;
    goto LABEL_45;
  }
  if ((v9 & 0x10) != 0)
    goto LABEL_44;
LABEL_37:
  if ((flags & 1) != 0)
  {
    if ((v9 & 1) == 0 || self->_requestFlags != *((_DWORD *)v4 + 17))
      goto LABEL_44;
  }
  else if ((v9 & 1) != 0)
  {
    goto LABEL_44;
  }
  tokenTags = self->_tokenTags;
  if ((unint64_t)tokenTags | *((_QWORD *)v4 + 6))
    v12 = -[GEOPDSearchKeyValuePairList isEqual:](tokenTags, "isEqual:");
  else
    v12 = 1;
LABEL_45:

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  unint64_t v5;
  __int16 flags;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  -[GEOPDSearchSpellerRequest readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_query, "hash");
  v4 = -[GEOPDSearchLocationContext hash](self->_locationContext, "hash");
  v5 = -[GEOPDSearchLanguageContext hash](self->_languageContext, "hash");
  flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
  {
    v7 = 2654435761 * self->_performCompletion;
    if ((flags & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v7 = 0;
    if ((flags & 2) != 0)
    {
LABEL_3:
      v8 = 2654435761 * self->_maxSuggestions;
      goto LABEL_6;
    }
  }
  v8 = 0;
LABEL_6:
  v9 = -[GEOPDSearchKeyValuePairList hash](self->_abConfigParams, "hash");
  v10 = (__int16)self->_flags;
  if ((v10 & 4) == 0)
  {
    v11 = 0;
    if ((v10 & 0x10) != 0)
      goto LABEL_8;
LABEL_11:
    v12 = 0;
    if ((v10 & 1) != 0)
      goto LABEL_9;
LABEL_12:
    v13 = 0;
    return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v9 ^ v11 ^ v12 ^ v13 ^ -[GEOPDSearchKeyValuePairList hash](self->_tokenTags, "hash");
  }
  v11 = 2654435761 * self->_queryType;
  if ((v10 & 0x10) == 0)
    goto LABEL_11;
LABEL_8:
  v12 = 2654435761 * self->_useCache;
  if ((v10 & 1) == 0)
    goto LABEL_12;
LABEL_9:
  v13 = 2654435761 * self->_requestFlags;
  return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v9 ^ v11 ^ v12 ^ v13 ^ -[GEOPDSearchKeyValuePairList hash](self->_tokenTags, "hash");
}

- (void)mergeFrom:(id)a3
{
  GEOPDSearchLocationContext *locationContext;
  _QWORD *v5;
  void *v6;
  GEOPDSearchLanguageContext *languageContext;
  void *v8;
  __int16 v9;
  GEOPDSearchKeyValuePairList *abConfigParams;
  uint64_t v11;
  __int16 v12;
  GEOPDSearchKeyValuePairList *tokenTags;
  uint64_t v14;
  _QWORD *v15;

  v15 = a3;
  objc_msgSend(v15, "readAll:", 0);
  if (v15[5])
    -[GEOPDSearchSpellerRequest setQuery:](self, "setQuery:");
  locationContext = self->_locationContext;
  v5 = v15;
  v6 = (void *)v15[4];
  if (locationContext)
  {
    if (!v6)
      goto LABEL_9;
    -[GEOPDSearchLocationContext mergeFrom:]((uint64_t)locationContext, v6);
  }
  else
  {
    if (!v6)
      goto LABEL_9;
    -[GEOPDSearchSpellerRequest setLocationContext:](self, "setLocationContext:", v15[4]);
  }
  v5 = v15;
LABEL_9:
  languageContext = self->_languageContext;
  v8 = (void *)v5[3];
  if (languageContext)
  {
    if (!v8)
      goto LABEL_15;
    -[GEOPDSearchLanguageContext mergeFrom:]((uint64_t)languageContext, v8);
  }
  else
  {
    if (!v8)
      goto LABEL_15;
    -[GEOPDSearchSpellerRequest setLanguageContext:](self, "setLanguageContext:", v5[3]);
  }
  v5 = v15;
LABEL_15:
  v9 = *((_WORD *)v5 + 42);
  if ((v9 & 8) != 0)
  {
    self->_performCompletion = *((_BYTE *)v5 + 80);
    *(_WORD *)&self->_flags |= 8u;
    v9 = *((_WORD *)v5 + 42);
  }
  if ((v9 & 2) != 0)
  {
    self->_maxSuggestions = *((_DWORD *)v5 + 18);
    *(_WORD *)&self->_flags |= 2u;
  }
  abConfigParams = self->_abConfigParams;
  v11 = v5[2];
  if (abConfigParams)
  {
    if (!v11)
      goto LABEL_25;
    -[GEOPDSearchKeyValuePairList mergeFrom:]((uint64_t)abConfigParams, v11);
  }
  else
  {
    if (!v11)
      goto LABEL_25;
    -[GEOPDSearchSpellerRequest setAbConfigParams:](self, "setAbConfigParams:", v5[2]);
  }
  v5 = v15;
LABEL_25:
  v12 = *((_WORD *)v5 + 42);
  if ((v12 & 4) != 0)
  {
    self->_queryType = *((_DWORD *)v5 + 19);
    *(_WORD *)&self->_flags |= 4u;
    v12 = *((_WORD *)v5 + 42);
    if ((v12 & 0x10) == 0)
    {
LABEL_27:
      if ((v12 & 1) == 0)
        goto LABEL_29;
      goto LABEL_28;
    }
  }
  else if ((v12 & 0x10) == 0)
  {
    goto LABEL_27;
  }
  self->_useCache = *((_BYTE *)v5 + 81);
  *(_WORD *)&self->_flags |= 0x10u;
  if ((*((_WORD *)v5 + 42) & 1) != 0)
  {
LABEL_28:
    self->_requestFlags = *((_DWORD *)v5 + 17);
    *(_WORD *)&self->_flags |= 1u;
  }
LABEL_29:
  tokenTags = self->_tokenTags;
  v14 = v5[6];
  if (tokenTags)
  {
    if (v14)
    {
      -[GEOPDSearchKeyValuePairList mergeFrom:]((uint64_t)tokenTags, v14);
LABEL_37:
      v5 = v15;
    }
  }
  else if (v14)
  {
    -[GEOPDSearchSpellerRequest setTokenTags:](self, "setTokenTags:", v5[6]);
    goto LABEL_37;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenTags, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_locationContext, 0);
  objc_storeStrong((id *)&self->_languageContext, 0);
  objc_storeStrong((id *)&self->_abConfigParams, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
