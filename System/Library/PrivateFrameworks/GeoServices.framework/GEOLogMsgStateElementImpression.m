@implementation GEOLogMsgStateElementImpression

- (GEOLogMsgStateElementImpression)init
{
  GEOLogMsgStateElementImpression *v2;
  GEOLogMsgStateElementImpression *v3;
  GEOLogMsgStateElementImpression *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgStateElementImpression;
  v2 = -[GEOLogMsgStateElementImpression init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgStateElementImpression)initWithData:(id)a3
{
  GEOLogMsgStateElementImpression *v3;
  GEOLogMsgStateElementImpression *v4;
  GEOLogMsgStateElementImpression *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgStateElementImpression;
  v3 = -[GEOLogMsgStateElementImpression initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readElement
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 76) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateElementImpressionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readElement_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasElement
{
  -[GEOLogMsgStateElementImpression _readElement]((uint64_t)self);
  return self->_element != 0;
}

- (GEOElementDetails)element
{
  -[GEOLogMsgStateElementImpression _readElement]((uint64_t)self);
  return self->_element;
}

- (void)setElement:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x90u;
  objc_storeStrong((id *)&self->_element, a3);
}

- (void)_readImpressionObjectId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 76) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateElementImpressionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readImpressionObjectId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasImpressionObjectId
{
  -[GEOLogMsgStateElementImpression _readImpressionObjectId]((uint64_t)self);
  return self->_impressionObjectId != 0;
}

- (GEOImpressionObjectId)impressionObjectId
{
  -[GEOLogMsgStateElementImpression _readImpressionObjectId]((uint64_t)self);
  return self->_impressionObjectId;
}

- (void)setImpressionObjectId:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_impressionObjectId, a3);
}

- (void)_readQuery
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 76) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateElementImpressionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readQuery_tags_7);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasQuery
{
  -[GEOLogMsgStateElementImpression _readQuery]((uint64_t)self);
  return self->_query != 0;
}

- (NSString)query
{
  -[GEOLogMsgStateElementImpression _readQuery]((uint64_t)self);
  return self->_query;
}

- (void)setQuery:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_query, a3);
}

- (int)impressEvent
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 8) != 0)
    return self->_impressEvent;
  else
    return 0;
}

- (void)setImpressEvent:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x88u;
  self->_impressEvent = a3;
}

- (void)setHasImpressEvent:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = -120;
  else
    v3 = 0x80;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasImpressEvent
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (id)impressEventAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C22AA0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsImpressEvent:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ImpressionEventType_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ImpressionEventType_VISIBLE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ImpressionEventType_NONVISIBLE")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unint64_t)impressVisibleTsInMs
{
  return self->_impressVisibleTsInMs;
}

- (void)setImpressVisibleTsInMs:(unint64_t)a3
{
  *(_BYTE *)&self->_flags |= 0x82u;
  self->_impressVisibleTsInMs = a3;
}

- (void)setHasImpressVisibleTsInMs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = -126;
  else
    v3 = 0x80;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasImpressVisibleTsInMs
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (unint64_t)impressNonvisibleTsInMs
{
  return self->_impressNonvisibleTsInMs;
}

- (void)setImpressNonvisibleTsInMs:(unint64_t)a3
{
  *(_BYTE *)&self->_flags |= 0x81u;
  self->_impressNonvisibleTsInMs = a3;
}

- (void)setHasImpressNonvisibleTsInMs:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0x7E | a3 | 0x80;
}

- (BOOL)hasImpressNonvisibleTsInMs
{
  return *(_BYTE *)&self->_flags & 1;
}

- (int)elementSource
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 4) != 0)
    return self->_elementSource;
  else
    return 0;
}

- (void)setElementSource:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x84u;
  self->_elementSource = a3;
}

- (void)setHasElementSource:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = -124;
  else
    v3 = 0x80;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasElementSource
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (id)elementSourceAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C22AB8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsElementSource:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ElementSource_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ElementSource_MAPS_SEARCH")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ElementSource_PLACECARD_TRAY")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
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
  v8.super_class = (Class)GEOLogMsgStateElementImpression;
  -[GEOLogMsgStateElementImpression description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgStateElementImpression dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateElementImpression _dictionaryRepresentation:]((uint64_t)self, 0);
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
  const __CFString *v11;
  void *v12;
  char v13;
  uint64_t v14;
  __CFString *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  uint64_t v21;
  __CFString *v22;
  const __CFString *v23;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "element");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v5, "jsonRepresentation");
    else
      objc_msgSend(v5, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("element"));

  }
  objc_msgSend((id)a1, "impressionObjectId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v8, "jsonRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("impressionObjectId");
    }
    else
    {
      objc_msgSend(v8, "dictionaryRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("impression_object_id");
    }
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

  }
  objc_msgSend((id)a1, "query");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("query"));

  v13 = *(_BYTE *)(a1 + 76);
  if ((v13 & 8) != 0)
  {
    v14 = *(int *)(a1 + 72);
    if (v14 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 72));
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = off_1E1C22AA0[v14];
    }
    if (a2)
      v16 = CFSTR("impressEvent");
    else
      v16 = CFSTR("impress_event");
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

    v13 = *(_BYTE *)(a1 + 76);
  }
  if ((v13 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 32));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v18 = CFSTR("impressVisibleTsInMs");
    else
      v18 = CFSTR("impress_visible_ts_in_ms");
    objc_msgSend(v4, "setObject:forKey:", v17, v18);

    v13 = *(_BYTE *)(a1 + 76);
    if ((v13 & 1) == 0)
    {
LABEL_24:
      if ((v13 & 4) == 0)
        return v4;
      goto LABEL_34;
    }
  }
  else if ((v13 & 1) == 0)
  {
    goto LABEL_24;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 24));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v20 = CFSTR("impressNonvisibleTsInMs");
  else
    v20 = CFSTR("impress_nonvisible_ts_in_ms");
  objc_msgSend(v4, "setObject:forKey:", v19, v20);

  if ((*(_BYTE *)(a1 + 76) & 4) != 0)
  {
LABEL_34:
    v21 = *(int *)(a1 + 68);
    if (v21 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 68));
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = off_1E1C22AB8[v21];
    }
    if (a2)
      v23 = CFSTR("elementSource");
    else
      v23 = CFSTR("element_source");
    objc_msgSend(v4, "setObject:forKey:", v22, v23);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgStateElementImpression _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgStateElementImpression)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateElementImpression *)-[GEOLogMsgStateElementImpression _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  GEOElementDetails *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  GEOImpressionObjectId *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
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

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("element"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = [GEOElementDetails alloc];
        if ((a3 & 1) != 0)
          v8 = -[GEOElementDetails initWithJSON:](v7, "initWithJSON:", v6);
        else
          v8 = -[GEOElementDetails initWithDictionary:](v7, "initWithDictionary:", v6);
        v9 = (void *)v8;
        objc_msgSend(a1, "setElement:", v8);

      }
      if (a3)
        v10 = CFSTR("impressionObjectId");
      else
        v10 = CFSTR("impression_object_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = [GEOImpressionObjectId alloc];
        if ((a3 & 1) != 0)
          v13 = -[GEOImpressionObjectId initWithJSON:](v12, "initWithJSON:", v11);
        else
          v13 = -[GEOImpressionObjectId initWithDictionary:](v12, "initWithDictionary:", v11);
        v14 = (void *)v13;
        objc_msgSend(a1, "setImpressionObjectId:", v13);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("query"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = (void *)objc_msgSend(v15, "copy");
        objc_msgSend(a1, "setQuery:", v16);

      }
      if (a3)
        v17 = CFSTR("impressEvent");
      else
        v17 = CFSTR("impress_event");
      objc_msgSend(v5, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v19 = v18;
        if ((objc_msgSend(v19, "isEqualToString:", CFSTR("ImpressionEventType_UNKNOWN")) & 1) != 0)
        {
          v20 = 0;
        }
        else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("ImpressionEventType_VISIBLE")) & 1) != 0)
        {
          v20 = 1;
        }
        else if (objc_msgSend(v19, "isEqualToString:", CFSTR("ImpressionEventType_NONVISIBLE")))
        {
          v20 = 2;
        }
        else
        {
          v20 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_33;
        v20 = objc_msgSend(v18, "intValue");
      }
      objc_msgSend(a1, "setImpressEvent:", v20);
LABEL_33:

      if (a3)
        v21 = CFSTR("impressVisibleTsInMs");
      else
        v21 = CFSTR("impress_visible_ts_in_ms");
      objc_msgSend(v5, "objectForKeyedSubscript:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setImpressVisibleTsInMs:", objc_msgSend(v22, "unsignedLongLongValue"));

      if (a3)
        v23 = CFSTR("impressNonvisibleTsInMs");
      else
        v23 = CFSTR("impress_nonvisible_ts_in_ms");
      objc_msgSend(v5, "objectForKeyedSubscript:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setImpressNonvisibleTsInMs:", objc_msgSend(v24, "unsignedLongLongValue"));

      if (a3)
        v25 = CFSTR("elementSource");
      else
        v25 = CFSTR("element_source");
      objc_msgSend(v5, "objectForKeyedSubscript:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v27 = v26;
        if ((objc_msgSend(v27, "isEqualToString:", CFSTR("ElementSource_UNKNOWN")) & 1) != 0)
        {
          v28 = 0;
        }
        else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("ElementSource_MAPS_SEARCH")) & 1) != 0)
        {
          v28 = 1;
        }
        else if (objc_msgSend(v27, "isEqualToString:", CFSTR("ElementSource_PLACECARD_TRAY")))
        {
          v28 = 2;
        }
        else
        {
          v28 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_58:

          goto LABEL_59;
        }
        v28 = objc_msgSend(v26, "intValue");
      }
      objc_msgSend(a1, "setElementSource:", v28);
      goto LABEL_58;
    }
  }
LABEL_59:

  return a1;
}

- (GEOLogMsgStateElementImpression)initWithJSON:(id)a3
{
  return (GEOLogMsgStateElementImpression *)-[GEOLogMsgStateElementImpression _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_6079;
    else
      v8 = (int *)&readAll__nonRecursiveTag_6080;
    GEOLogMsgStateElementImpressionReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEOElementDetails readAll:](self->_element, "readAll:", 1);
    -[GEOImpressionObjectId readAll:](self->_impressionObjectId, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateElementImpressionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateElementImpressionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  char flags;
  PBDataReader *v6;
  void *v7;
  id v8;

  v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if (*(_BYTE *)&self->_flags <= 0xFu)
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
      goto LABEL_19;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOLogMsgStateElementImpression readAll:](self, "readAll:", 0);
  if (self->_element)
    PBDataWriterWriteSubmessage();
  if (self->_impressionObjectId)
    PBDataWriterWriteSubmessage();
  if (self->_query)
    PBDataWriterWriteStringField();
  flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_11:
      if ((flags & 1) == 0)
        goto LABEL_12;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteUint64Field();
  flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_12:
    if ((flags & 4) == 0)
      goto LABEL_19;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint64Field();
  if ((*(_BYTE *)&self->_flags & 4) != 0)
LABEL_17:
    PBDataWriterWriteInt32Field();
LABEL_19:

}

- (void)copyTo:(id)a3
{
  id *v4;
  char flags;
  id *v6;

  v6 = (id *)a3;
  -[GEOLogMsgStateElementImpression readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 14) = self->_readerMarkPos;
  *((_DWORD *)v6 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_element)
    objc_msgSend(v6, "setElement:");
  if (self->_impressionObjectId)
    objc_msgSend(v6, "setImpressionObjectId:");
  v4 = v6;
  if (self->_query)
  {
    objc_msgSend(v6, "setQuery:");
    v4 = v6;
  }
  flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    *((_DWORD *)v4 + 18) = self->_impressEvent;
    *((_BYTE *)v4 + 76) |= 8u;
    flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_9:
      if ((flags & 1) == 0)
        goto LABEL_10;
LABEL_15:
      v4[3] = (id)self->_impressNonvisibleTsInMs;
      *((_BYTE *)v4 + 76) |= 1u;
      if ((*(_BYTE *)&self->_flags & 4) == 0)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    goto LABEL_9;
  }
  v4[4] = (id)self->_impressVisibleTsInMs;
  *((_BYTE *)v4 + 76) |= 2u;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_15;
LABEL_10:
  if ((flags & 4) != 0)
  {
LABEL_11:
    *((_DWORD *)v4 + 17) = self->_elementSource;
    *((_BYTE *)v4 + 76) |= 4u;
  }
LABEL_12:

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
  uint64_t v13;
  void *v14;
  char flags;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOLogMsgStateElementImpression readAll:](self, "readAll:", 0);
    v9 = -[GEOElementDetails copyWithZone:](self->_element, "copyWithZone:", a3);
    v10 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = v9;

    v11 = -[GEOImpressionObjectId copyWithZone:](self->_impressionObjectId, "copyWithZone:", a3);
    v12 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v11;

    v13 = -[NSString copyWithZone:](self->_query, "copyWithZone:", a3);
    v14 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v13;

    flags = (char)self->_flags;
    if ((flags & 8) != 0)
    {
      *(_DWORD *)(v5 + 72) = self->_impressEvent;
      *(_BYTE *)(v5 + 76) |= 8u;
      flags = (char)self->_flags;
      if ((flags & 2) == 0)
      {
LABEL_7:
        if ((flags & 1) == 0)
          goto LABEL_8;
        goto LABEL_13;
      }
    }
    else if ((*(_BYTE *)&self->_flags & 2) == 0)
    {
      goto LABEL_7;
    }
    *(_QWORD *)(v5 + 32) = self->_impressVisibleTsInMs;
    *(_BYTE *)(v5 + 76) |= 2u;
    flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_8:
      if ((flags & 4) == 0)
        return (id)v5;
LABEL_9:
      *(_DWORD *)(v5 + 68) = self->_elementSource;
      *(_BYTE *)(v5 + 76) |= 4u;
      return (id)v5;
    }
LABEL_13:
    *(_QWORD *)(v5 + 24) = self->_impressNonvisibleTsInMs;
    *(_BYTE *)(v5 + 76) |= 1u;
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      return (id)v5;
    goto LABEL_9;
  }
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_BYTE *)&self->_flags & 0x80000000) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOLogMsgStateElementImpressionReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  v8 = (id)v5;
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOElementDetails *element;
  GEOImpressionObjectId *impressionObjectId;
  NSString *query;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  -[GEOLogMsgStateElementImpression readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  element = self->_element;
  if ((unint64_t)element | *((_QWORD *)v4 + 2))
  {
    if (!-[GEOElementDetails isEqual:](element, "isEqual:"))
      goto LABEL_27;
  }
  impressionObjectId = self->_impressionObjectId;
  if ((unint64_t)impressionObjectId | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOImpressionObjectId isEqual:](impressionObjectId, "isEqual:"))
      goto LABEL_27;
  }
  query = self->_query;
  if ((unint64_t)query | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](query, "isEqual:"))
      goto LABEL_27;
  }
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 8) == 0 || self->_impressEvent != *((_DWORD *)v4 + 18))
      goto LABEL_27;
  }
  else if ((*((_BYTE *)v4 + 76) & 8) != 0)
  {
LABEL_27:
    v8 = 0;
    goto LABEL_28;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 2) == 0 || self->_impressVisibleTsInMs != *((_QWORD *)v4 + 4))
      goto LABEL_27;
  }
  else if ((*((_BYTE *)v4 + 76) & 2) != 0)
  {
    goto LABEL_27;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 1) == 0 || self->_impressNonvisibleTsInMs != *((_QWORD *)v4 + 3))
      goto LABEL_27;
  }
  else if ((*((_BYTE *)v4 + 76) & 1) != 0)
  {
    goto LABEL_27;
  }
  v8 = (*((_BYTE *)v4 + 76) & 4) == 0;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 4) == 0 || self->_elementSource != *((_DWORD *)v4 + 17))
      goto LABEL_27;
    v8 = 1;
  }
LABEL_28:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;

  -[GEOLogMsgStateElementImpression readAll:](self, "readAll:", 1);
  v3 = -[GEOElementDetails hash](self->_element, "hash");
  v4 = -[GEOImpressionObjectId hash](self->_impressionObjectId, "hash");
  v5 = -[NSString hash](self->_query, "hash");
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    v6 = 2654435761 * self->_impressEvent;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
    {
LABEL_3:
      v7 = 2654435761u * self->_impressVisibleTsInMs;
      if ((*(_BYTE *)&self->_flags & 1) != 0)
        goto LABEL_4;
LABEL_8:
      v8 = 0;
      if ((*(_BYTE *)&self->_flags & 4) != 0)
        goto LABEL_5;
LABEL_9:
      v9 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
    }
  }
  else
  {
    v6 = 0;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
  }
  v7 = 0;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_8;
LABEL_4:
  v8 = 2654435761u * self->_impressNonvisibleTsInMs;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    goto LABEL_9;
LABEL_5:
  v9 = 2654435761 * self->_elementSource;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  GEOElementDetails *element;
  uint64_t v6;
  GEOImpressionObjectId *impressionObjectId;
  uint64_t v8;
  char v9;
  _QWORD *v10;

  v10 = a3;
  objc_msgSend(v10, "readAll:", 0);
  v4 = v10;
  element = self->_element;
  v6 = v10[2];
  if (element)
  {
    if (!v6)
      goto LABEL_7;
    -[GEOElementDetails mergeFrom:](element, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[GEOLogMsgStateElementImpression setElement:](self, "setElement:");
  }
  v4 = v10;
LABEL_7:
  impressionObjectId = self->_impressionObjectId;
  v8 = v4[5];
  if (impressionObjectId)
  {
    if (!v8)
      goto LABEL_13;
    -[GEOImpressionObjectId mergeFrom:](impressionObjectId, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[GEOLogMsgStateElementImpression setImpressionObjectId:](self, "setImpressionObjectId:");
  }
  v4 = v10;
LABEL_13:
  if (v4[6])
  {
    -[GEOLogMsgStateElementImpression setQuery:](self, "setQuery:");
    v4 = v10;
  }
  v9 = *((_BYTE *)v4 + 76);
  if ((v9 & 8) != 0)
  {
    self->_impressEvent = *((_DWORD *)v4 + 18);
    *(_BYTE *)&self->_flags |= 8u;
    v9 = *((_BYTE *)v4 + 76);
    if ((v9 & 2) == 0)
    {
LABEL_17:
      if ((v9 & 1) == 0)
        goto LABEL_18;
LABEL_23:
      self->_impressNonvisibleTsInMs = v4[3];
      *(_BYTE *)&self->_flags |= 1u;
      if ((*((_BYTE *)v4 + 76) & 4) == 0)
        goto LABEL_20;
      goto LABEL_19;
    }
  }
  else if ((*((_BYTE *)v4 + 76) & 2) == 0)
  {
    goto LABEL_17;
  }
  self->_impressVisibleTsInMs = v4[4];
  *(_BYTE *)&self->_flags |= 2u;
  v9 = *((_BYTE *)v4 + 76);
  if ((v9 & 1) != 0)
    goto LABEL_23;
LABEL_18:
  if ((v9 & 4) != 0)
  {
LABEL_19:
    self->_elementSource = *((_DWORD *)v4 + 17);
    *(_BYTE *)&self->_flags |= 4u;
  }
LABEL_20:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_impressionObjectId, 0);
  objc_storeStrong((id *)&self->_element, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
