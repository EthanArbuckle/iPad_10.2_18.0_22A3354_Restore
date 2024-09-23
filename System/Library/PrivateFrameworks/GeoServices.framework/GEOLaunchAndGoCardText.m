@implementation GEOLaunchAndGoCardText

- (GEOLaunchAndGoCardText)init
{
  GEOLaunchAndGoCardText *v2;
  GEOLaunchAndGoCardText *v3;
  GEOLaunchAndGoCardText *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOLaunchAndGoCardText;
  v2 = -[GEOLaunchAndGoCardText init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLaunchAndGoCardText)initWithData:(id)a3
{
  GEOLaunchAndGoCardText *v3;
  GEOLaunchAndGoCardText *v4;
  GEOLaunchAndGoCardText *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOLaunchAndGoCardText;
  v3 = -[GEOLaunchAndGoCardText initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readCardTitle
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLaunchAndGoCardTextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCardTitle_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasCardTitle
{
  -[GEOLaunchAndGoCardText _readCardTitle]((uint64_t)self);
  return self->_cardTitle != 0;
}

- (GEOFormattedString)cardTitle
{
  -[GEOLaunchAndGoCardText _readCardTitle]((uint64_t)self);
  return self->_cardTitle;
}

- (void)setCardTitle:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x84u;
  objc_storeStrong((id *)&self->_cardTitle, a3);
}

- (void)_readRouteTitle
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLaunchAndGoCardTextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRouteTitle_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasRouteTitle
{
  -[GEOLaunchAndGoCardText _readRouteTitle]((uint64_t)self);
  return self->_routeTitle != 0;
}

- (GEOFormattedString)routeTitle
{
  -[GEOLaunchAndGoCardText _readRouteTitle]((uint64_t)self);
  return self->_routeTitle;
}

- (void)setRouteTitle:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_routeTitle, a3);
}

- (void)_readRouteDescription
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLaunchAndGoCardTextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRouteDescription_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasRouteDescription
{
  -[GEOLaunchAndGoCardText _readRouteDescription]((uint64_t)self);
  return self->_routeDescription != 0;
}

- (GEOFormattedString)routeDescription
{
  -[GEOLaunchAndGoCardText _readRouteDescription]((uint64_t)self);
  return self->_routeDescription;
}

- (void)setRouteDescription:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x90u;
  objc_storeStrong((id *)&self->_routeDescription, a3);
}

- (void)_readTitle
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLaunchAndGoCardTextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTitle_tags_3099);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasTitle
{
  -[GEOLaunchAndGoCardText _readTitle]((uint64_t)self);
  return self->_title != 0;
}

- (GEOPlaceFormattedString)title
{
  -[GEOLaunchAndGoCardText _readTitle]((uint64_t)self);
  return self->_title;
}

- (void)setTitle:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_title, a3);
}

- (void)_readCommuteTitle
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLaunchAndGoCardTextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCommuteTitle_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasCommuteTitle
{
  -[GEOLaunchAndGoCardText _readCommuteTitle]((uint64_t)self);
  return self->_commuteTitle != 0;
}

- (GEOPlaceFormattedString)commuteTitle
{
  -[GEOLaunchAndGoCardText _readCommuteTitle]((uint64_t)self);
  return self->_commuteTitle;
}

- (void)setCommuteTitle:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x88u;
  objc_storeStrong((id *)&self->_commuteTitle, a3);
}

- (void)_readBody
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLaunchAndGoCardTextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBody_tags_3100);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasBody
{
  -[GEOLaunchAndGoCardText _readBody]((uint64_t)self);
  return self->_body != 0;
}

- (GEOPlaceFormattedString)body
{
  -[GEOLaunchAndGoCardText _readBody]((uint64_t)self);
  return self->_body;
}

- (void)setBody:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x82u;
  objc_storeStrong((id *)&self->_body, a3);
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
  v8.super_class = (Class)GEOLaunchAndGoCardText;
  -[GEOLaunchAndGoCardText description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLaunchAndGoCardText dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLaunchAndGoCardText _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(_QWORD *)a1
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
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  _QWORD v34[4];
  id v35;

  if (!a1)
    return 0;
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "cardTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("cardTitle");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("card_title");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  objc_msgSend(a1, "routeTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v9, "jsonRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("routeTitle");
    }
    else
    {
      objc_msgSend(v9, "dictionaryRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("route_title");
    }
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

  }
  objc_msgSend(a1, "routeDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v13, "jsonRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("routeDescription");
    }
    else
    {
      objc_msgSend(v13, "dictionaryRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("route_description");
    }
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

  }
  objc_msgSend(a1, "title");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v17, "jsonRepresentation");
    else
      objc_msgSend(v17, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("title"));

  }
  objc_msgSend(a1, "commuteTitle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v20, "jsonRepresentation");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = CFSTR("commuteTitle");
    }
    else
    {
      objc_msgSend(v20, "dictionaryRepresentation");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = CFSTR("commute_title");
    }
    objc_msgSend(v4, "setObject:forKey:", v22, v23);

  }
  objc_msgSend(a1, "body");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v24)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v24, "jsonRepresentation");
    else
      objc_msgSend(v24, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("body"));

  }
  v27 = (void *)a1[2];
  if (v27)
  {
    objc_msgSend(v27, "dictionaryRepresentation");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v28, "count"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __52__GEOLaunchAndGoCardText__dictionaryRepresentation___block_invoke;
      v34[3] = &unk_1E1C00600;
      v31 = v30;
      v35 = v31;
      objc_msgSend(v29, "enumerateKeysAndObjectsUsingBlock:", v34);
      v32 = v31;

      v29 = v32;
    }
    objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLaunchAndGoCardText _dictionaryRepresentation:](self, 1);
}

void __52__GEOLaunchAndGoCardText__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOLaunchAndGoCardText)initWithDictionary:(id)a3
{
  return (GEOLaunchAndGoCardText *)-[GEOLaunchAndGoCardText _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  GEOFormattedString *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  GEOFormattedString *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  GEOFormattedString *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  GEOPlaceFormattedString *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  GEOPlaceFormattedString *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  GEOPlaceFormattedString *v31;
  uint64_t v32;
  void *v33;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("cardTitle");
      else
        v6 = CFSTR("card_title");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = [GEOFormattedString alloc];
        if ((a3 & 1) != 0)
          v9 = -[GEOFormattedString initWithJSON:](v8, "initWithJSON:", v7);
        else
          v9 = -[GEOFormattedString initWithDictionary:](v8, "initWithDictionary:", v7);
        v10 = (void *)v9;
        objc_msgSend(a1, "setCardTitle:", v9);

      }
      if (a3)
        v11 = CFSTR("routeTitle");
      else
        v11 = CFSTR("route_title");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = [GEOFormattedString alloc];
        if ((a3 & 1) != 0)
          v14 = -[GEOFormattedString initWithJSON:](v13, "initWithJSON:", v12);
        else
          v14 = -[GEOFormattedString initWithDictionary:](v13, "initWithDictionary:", v12);
        v15 = (void *)v14;
        objc_msgSend(a1, "setRouteTitle:", v14);

      }
      if (a3)
        v16 = CFSTR("routeDescription");
      else
        v16 = CFSTR("route_description");
      objc_msgSend(v5, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = [GEOFormattedString alloc];
        if ((a3 & 1) != 0)
          v19 = -[GEOFormattedString initWithJSON:](v18, "initWithJSON:", v17);
        else
          v19 = -[GEOFormattedString initWithDictionary:](v18, "initWithDictionary:", v17);
        v20 = (void *)v19;
        objc_msgSend(a1, "setRouteDescription:", v19);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("title"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v22 = [GEOPlaceFormattedString alloc];
        if ((a3 & 1) != 0)
          v23 = -[GEOPlaceFormattedString initWithJSON:](v22, "initWithJSON:", v21);
        else
          v23 = -[GEOPlaceFormattedString initWithDictionary:](v22, "initWithDictionary:", v21);
        v24 = (void *)v23;
        objc_msgSend(a1, "setTitle:", v23);

      }
      if (a3)
        v25 = CFSTR("commuteTitle");
      else
        v25 = CFSTR("commute_title");
      objc_msgSend(v5, "objectForKeyedSubscript:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v27 = [GEOPlaceFormattedString alloc];
        if ((a3 & 1) != 0)
          v28 = -[GEOPlaceFormattedString initWithJSON:](v27, "initWithJSON:", v26);
        else
          v28 = -[GEOPlaceFormattedString initWithDictionary:](v27, "initWithDictionary:", v26);
        v29 = (void *)v28;
        objc_msgSend(a1, "setCommuteTitle:", v28);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("body"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v31 = [GEOPlaceFormattedString alloc];
        if ((a3 & 1) != 0)
          v32 = -[GEOPlaceFormattedString initWithJSON:](v31, "initWithJSON:", v30);
        else
          v32 = -[GEOPlaceFormattedString initWithDictionary:](v31, "initWithDictionary:", v30);
        v33 = (void *)v32;
        objc_msgSend(a1, "setBody:", v32);

      }
    }
  }

  return a1;
}

- (GEOLaunchAndGoCardText)initWithJSON:(id)a3
{
  return (GEOLaunchAndGoCardText *)-[GEOLaunchAndGoCardText _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_3117;
    else
      v8 = (int *)&readAll__nonRecursiveTag_3118;
    GEOLaunchAndGoCardTextReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOLaunchAndGoCardTextCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLaunchAndGoCardTextIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLaunchAndGoCardTextReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEOLaunchAndGoCardTextIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOLaunchAndGoCardText readAll:](self, "readAll:", 0);
    if (self->_cardTitle)
      PBDataWriterWriteSubmessage();
    v5 = v8;
    if (self->_routeTitle)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_routeDescription)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_title)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_commuteTitle)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_body)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEOLaunchAndGoCardText readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 18) = self->_readerMarkPos;
  *((_DWORD *)v5 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_cardTitle)
    objc_msgSend(v5, "setCardTitle:");
  if (self->_routeTitle)
    objc_msgSend(v5, "setRouteTitle:");
  v4 = v5;
  if (self->_routeDescription)
  {
    objc_msgSend(v5, "setRouteDescription:");
    v4 = v5;
  }
  if (self->_title)
  {
    objc_msgSend(v5, "setTitle:");
    v4 = v5;
  }
  if (self->_commuteTitle)
  {
    objc_msgSend(v5, "setCommuteTitle:");
    v4 = v5;
  }
  if (self->_body)
  {
    objc_msgSend(v5, "setBody:");
    v4 = v5;
  }

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
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
    goto LABEL_5;
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_BYTE *)&self->_flags & 0x80000000) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOLaunchAndGoCardText readAll:](self, "readAll:", 0);
    v8 = -[GEOFormattedString copyWithZone:](self->_cardTitle, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v8;

    v10 = -[GEOFormattedString copyWithZone:](self->_routeTitle, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 56);
    *(_QWORD *)(v5 + 56) = v10;

    v12 = -[GEOFormattedString copyWithZone:](self->_routeDescription, "copyWithZone:", a3);
    v13 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v12;

    v14 = -[GEOPlaceFormattedString copyWithZone:](self->_title, "copyWithZone:", a3);
    v15 = *(void **)(v5 + 64);
    *(_QWORD *)(v5 + 64) = v14;

    v16 = -[GEOPlaceFormattedString copyWithZone:](self->_commuteTitle, "copyWithZone:", a3);
    v17 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v16;

    v18 = -[GEOPlaceFormattedString copyWithZone:](self->_body, "copyWithZone:", a3);
    v19 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v18;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOLaunchAndGoCardTextReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEOFormattedString *cardTitle;
  GEOFormattedString *routeTitle;
  GEOFormattedString *routeDescription;
  GEOPlaceFormattedString *title;
  GEOPlaceFormattedString *commuteTitle;
  GEOPlaceFormattedString *body;
  char v11;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOLaunchAndGoCardText readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         cardTitle = self->_cardTitle,
         !((unint64_t)cardTitle | v4[4]))
     || -[GEOFormattedString isEqual:](cardTitle, "isEqual:"))
    && ((routeTitle = self->_routeTitle, !((unint64_t)routeTitle | v4[7]))
     || -[GEOFormattedString isEqual:](routeTitle, "isEqual:"))
    && ((routeDescription = self->_routeDescription, !((unint64_t)routeDescription | v4[6]))
     || -[GEOFormattedString isEqual:](routeDescription, "isEqual:"))
    && ((title = self->_title, !((unint64_t)title | v4[8]))
     || -[GEOPlaceFormattedString isEqual:](title, "isEqual:"))
    && ((commuteTitle = self->_commuteTitle, !((unint64_t)commuteTitle | v4[5]))
     || -[GEOPlaceFormattedString isEqual:](commuteTitle, "isEqual:")))
  {
    body = self->_body;
    if ((unint64_t)body | v4[3])
      v11 = -[GEOPlaceFormattedString isEqual:](body, "isEqual:");
    else
      v11 = 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  -[GEOLaunchAndGoCardText readAll:](self, "readAll:", 1);
  v3 = -[GEOFormattedString hash](self->_cardTitle, "hash");
  v4 = -[GEOFormattedString hash](self->_routeTitle, "hash") ^ v3;
  v5 = -[GEOFormattedString hash](self->_routeDescription, "hash");
  v6 = v4 ^ v5 ^ -[GEOPlaceFormattedString hash](self->_title, "hash");
  v7 = -[GEOPlaceFormattedString hash](self->_commuteTitle, "hash");
  return v6 ^ v7 ^ -[GEOPlaceFormattedString hash](self->_body, "hash");
}

- (void)mergeFrom:(id)a3
{
  GEOFormattedString *cardTitle;
  uint64_t v5;
  GEOFormattedString *routeTitle;
  uint64_t v7;
  GEOFormattedString *routeDescription;
  uint64_t v9;
  GEOPlaceFormattedString *title;
  uint64_t v11;
  GEOPlaceFormattedString *commuteTitle;
  uint64_t v13;
  GEOPlaceFormattedString *body;
  uint64_t v15;
  _QWORD *v16;

  v16 = a3;
  objc_msgSend(v16, "readAll:", 0);
  cardTitle = self->_cardTitle;
  v5 = v16[4];
  if (cardTitle)
  {
    if (v5)
      -[GEOFormattedString mergeFrom:](cardTitle, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEOLaunchAndGoCardText setCardTitle:](self, "setCardTitle:");
  }
  routeTitle = self->_routeTitle;
  v7 = v16[7];
  if (routeTitle)
  {
    if (v7)
      -[GEOFormattedString mergeFrom:](routeTitle, "mergeFrom:");
  }
  else if (v7)
  {
    -[GEOLaunchAndGoCardText setRouteTitle:](self, "setRouteTitle:");
  }
  routeDescription = self->_routeDescription;
  v9 = v16[6];
  if (routeDescription)
  {
    if (v9)
      -[GEOFormattedString mergeFrom:](routeDescription, "mergeFrom:");
  }
  else if (v9)
  {
    -[GEOLaunchAndGoCardText setRouteDescription:](self, "setRouteDescription:");
  }
  title = self->_title;
  v11 = v16[8];
  if (title)
  {
    if (v11)
      -[GEOPlaceFormattedString mergeFrom:](title, "mergeFrom:");
  }
  else if (v11)
  {
    -[GEOLaunchAndGoCardText setTitle:](self, "setTitle:");
  }
  commuteTitle = self->_commuteTitle;
  v13 = v16[5];
  if (commuteTitle)
  {
    if (v13)
      -[GEOPlaceFormattedString mergeFrom:](commuteTitle, "mergeFrom:");
  }
  else if (v13)
  {
    -[GEOLaunchAndGoCardText setCommuteTitle:](self, "setCommuteTitle:");
  }
  body = self->_body;
  v15 = v16[3];
  if (body)
  {
    if (v15)
      -[GEOPlaceFormattedString mergeFrom:](body, "mergeFrom:");
  }
  else if (v15)
  {
    -[GEOLaunchAndGoCardText setBody:](self, "setBody:");
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOLaunchAndGoCardTextReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_3121);
      objc_sync_exit(v5);

    }
  }
  os_unfair_lock_unlock(p_readerLock);
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBUnknownFields *unknownFields;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x81u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOLaunchAndGoCardText readAll:](self, "readAll:", 0);
    -[GEOFormattedString clearUnknownFields:](self->_cardTitle, "clearUnknownFields:", 1);
    -[GEOFormattedString clearUnknownFields:](self->_routeTitle, "clearUnknownFields:", 1);
    -[GEOFormattedString clearUnknownFields:](self->_routeDescription, "clearUnknownFields:", 1);
    -[GEOPlaceFormattedString clearUnknownFields:](self->_title, "clearUnknownFields:", 1);
    -[GEOPlaceFormattedString clearUnknownFields:](self->_commuteTitle, "clearUnknownFields:", 1);
    -[GEOPlaceFormattedString clearUnknownFields:](self->_body, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_routeTitle, 0);
  objc_storeStrong((id *)&self->_routeDescription, 0);
  objc_storeStrong((id *)&self->_commuteTitle, 0);
  objc_storeStrong((id *)&self->_cardTitle, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
