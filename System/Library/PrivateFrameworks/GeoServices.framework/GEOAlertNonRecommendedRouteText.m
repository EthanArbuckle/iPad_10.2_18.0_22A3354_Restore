@implementation GEOAlertNonRecommendedRouteText

- (GEOAlertNonRecommendedRouteText)init
{
  GEOAlertNonRecommendedRouteText *v2;
  GEOAlertNonRecommendedRouteText *v3;
  GEOAlertNonRecommendedRouteText *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOAlertNonRecommendedRouteText;
  v2 = -[GEOAlertNonRecommendedRouteText init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOAlertNonRecommendedRouteText)initWithData:(id)a3
{
  GEOAlertNonRecommendedRouteText *v3;
  GEOAlertNonRecommendedRouteText *v4;
  GEOAlertNonRecommendedRouteText *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOAlertNonRecommendedRouteText;
  v3 = -[GEOAlertNonRecommendedRouteText initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readResponseAlertPrimary
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAlertNonRecommendedRouteTextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readResponseAlertPrimary_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasResponseAlertPrimary
{
  -[GEOAlertNonRecommendedRouteText _readResponseAlertPrimary]((uint64_t)self);
  return self->_responseAlertPrimary != 0;
}

- (GEOFormattedString)responseAlertPrimary
{
  -[GEOAlertNonRecommendedRouteText _readResponseAlertPrimary]((uint64_t)self);
  return self->_responseAlertPrimary;
}

- (void)setResponseAlertPrimary:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x24u;
  objc_storeStrong((id *)&self->_responseAlertPrimary, a3);
}

- (void)_readResponseAlertSecondary
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAlertNonRecommendedRouteTextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readResponseAlertSecondary_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasResponseAlertSecondary
{
  -[GEOAlertNonRecommendedRouteText _readResponseAlertSecondary]((uint64_t)self);
  return self->_responseAlertSecondary != 0;
}

- (GEOFormattedString)responseAlertSecondary
{
  -[GEOAlertNonRecommendedRouteText _readResponseAlertSecondary]((uint64_t)self);
  return self->_responseAlertSecondary;
}

- (void)setResponseAlertSecondary:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_responseAlertSecondary, a3);
}

- (void)_readTitle
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAlertNonRecommendedRouteTextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTitle_tags_491);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasTitle
{
  -[GEOAlertNonRecommendedRouteText _readTitle]((uint64_t)self);
  return self->_title != 0;
}

- (GEOPlaceFormattedString)title
{
  -[GEOAlertNonRecommendedRouteText _readTitle]((uint64_t)self);
  return self->_title;
}

- (void)setTitle:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_title, a3);
}

- (void)_readBody
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAlertNonRecommendedRouteTextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBody_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasBody
{
  -[GEOAlertNonRecommendedRouteText _readBody]((uint64_t)self);
  return self->_body != 0;
}

- (GEOPlaceFormattedString)body
{
  -[GEOAlertNonRecommendedRouteText _readBody]((uint64_t)self);
  return self->_body;
}

- (void)setBody:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x22u;
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
  v8.super_class = (Class)GEOAlertNonRecommendedRouteText;
  -[GEOAlertNonRecommendedRouteText description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOAlertNonRecommendedRouteText dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOAlertNonRecommendedRouteText _dictionaryRepresentation:](self, 0);
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  _QWORD v26[4];
  id v27;

  if (!a1)
    return 0;
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "responseAlertPrimary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("responseAlertPrimary");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("response_alert_primary");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  objc_msgSend(a1, "responseAlertSecondary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v9, "jsonRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("responseAlertSecondary");
    }
    else
    {
      objc_msgSend(v9, "dictionaryRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("response_alert_secondary");
    }
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

  }
  objc_msgSend(a1, "title");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v13, "jsonRepresentation");
    else
      objc_msgSend(v13, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("title"));

  }
  objc_msgSend(a1, "body");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v16, "jsonRepresentation");
    else
      objc_msgSend(v16, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("body"));

  }
  v19 = (void *)a1[2];
  if (v19)
  {
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v20, "count"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __61__GEOAlertNonRecommendedRouteText__dictionaryRepresentation___block_invoke;
      v26[3] = &unk_1E1C00600;
      v23 = v22;
      v27 = v23;
      objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v26);
      v24 = v23;

      v21 = v24;
    }
    objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOAlertNonRecommendedRouteText _dictionaryRepresentation:](self, 1);
}

void __61__GEOAlertNonRecommendedRouteText__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOAlertNonRecommendedRouteText)initWithDictionary:(id)a3
{
  return (GEOAlertNonRecommendedRouteText *)-[GEOAlertNonRecommendedRouteText _initWithDictionary:isJSON:](self, a3, 0);
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
  void *v16;
  GEOPlaceFormattedString *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  GEOPlaceFormattedString *v21;
  uint64_t v22;
  void *v23;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("responseAlertPrimary");
      else
        v6 = CFSTR("response_alert_primary");
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
        objc_msgSend(a1, "setResponseAlertPrimary:", v9);

      }
      if (a3)
        v11 = CFSTR("responseAlertSecondary");
      else
        v11 = CFSTR("response_alert_secondary");
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
        objc_msgSend(a1, "setResponseAlertSecondary:", v14);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("title"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = [GEOPlaceFormattedString alloc];
        if ((a3 & 1) != 0)
          v18 = -[GEOPlaceFormattedString initWithJSON:](v17, "initWithJSON:", v16);
        else
          v18 = -[GEOPlaceFormattedString initWithDictionary:](v17, "initWithDictionary:", v16);
        v19 = (void *)v18;
        objc_msgSend(a1, "setTitle:", v18);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("body"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v21 = [GEOPlaceFormattedString alloc];
        if ((a3 & 1) != 0)
          v22 = -[GEOPlaceFormattedString initWithJSON:](v21, "initWithJSON:", v20);
        else
          v22 = -[GEOPlaceFormattedString initWithDictionary:](v21, "initWithDictionary:", v20);
        v23 = (void *)v22;
        objc_msgSend(a1, "setBody:", v22);

      }
    }
  }

  return a1;
}

- (GEOAlertNonRecommendedRouteText)initWithJSON:(id)a3
{
  return (GEOAlertNonRecommendedRouteText *)-[GEOAlertNonRecommendedRouteText _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_503;
    else
      v8 = (int *)&readAll__nonRecursiveTag_504;
    GEOAlertNonRecommendedRouteTextReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOAlertNonRecommendedRouteTextCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOAlertNonRecommendedRouteTextIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOAlertNonRecommendedRouteTextReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEOAlertNonRecommendedRouteTextIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOAlertNonRecommendedRouteText readAll:](self, "readAll:", 0);
    if (self->_responseAlertPrimary)
      PBDataWriterWriteSubmessage();
    v5 = v8;
    if (self->_responseAlertSecondary)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_title)
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
  -[GEOAlertNonRecommendedRouteText readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 14) = self->_readerMarkPos;
  *((_DWORD *)v5 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_responseAlertPrimary)
    objc_msgSend(v5, "setResponseAlertPrimary:");
  if (self->_responseAlertSecondary)
    objc_msgSend(v5, "setResponseAlertSecondary:");
  v4 = v5;
  if (self->_title)
  {
    objc_msgSend(v5, "setTitle:");
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

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
    goto LABEL_5;
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOAlertNonRecommendedRouteText readAll:](self, "readAll:", 0);
    v8 = -[GEOFormattedString copyWithZone:](self->_responseAlertPrimary, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v8;

    v10 = -[GEOFormattedString copyWithZone:](self->_responseAlertSecondary, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v10;

    v12 = -[GEOPlaceFormattedString copyWithZone:](self->_title, "copyWithZone:", a3);
    v13 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v12;

    v14 = -[GEOPlaceFormattedString copyWithZone:](self->_body, "copyWithZone:", a3);
    v15 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v14;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOAlertNonRecommendedRouteTextReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEOFormattedString *responseAlertPrimary;
  GEOFormattedString *responseAlertSecondary;
  GEOPlaceFormattedString *title;
  GEOPlaceFormattedString *body;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOAlertNonRecommendedRouteText readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         responseAlertPrimary = self->_responseAlertPrimary,
         !((unint64_t)responseAlertPrimary | v4[4]))
     || -[GEOFormattedString isEqual:](responseAlertPrimary, "isEqual:"))
    && ((responseAlertSecondary = self->_responseAlertSecondary, !((unint64_t)responseAlertSecondary | v4[5]))
     || -[GEOFormattedString isEqual:](responseAlertSecondary, "isEqual:"))
    && ((title = self->_title, !((unint64_t)title | v4[6]))
     || -[GEOPlaceFormattedString isEqual:](title, "isEqual:")))
  {
    body = self->_body;
    if ((unint64_t)body | v4[3])
      v9 = -[GEOPlaceFormattedString isEqual:](body, "isEqual:");
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  -[GEOAlertNonRecommendedRouteText readAll:](self, "readAll:", 1);
  v3 = -[GEOFormattedString hash](self->_responseAlertPrimary, "hash");
  v4 = -[GEOFormattedString hash](self->_responseAlertSecondary, "hash") ^ v3;
  v5 = -[GEOPlaceFormattedString hash](self->_title, "hash");
  return v4 ^ v5 ^ -[GEOPlaceFormattedString hash](self->_body, "hash");
}

- (void)mergeFrom:(id)a3
{
  GEOFormattedString *responseAlertPrimary;
  uint64_t v5;
  GEOFormattedString *responseAlertSecondary;
  uint64_t v7;
  GEOPlaceFormattedString *title;
  uint64_t v9;
  GEOPlaceFormattedString *body;
  uint64_t v11;
  _QWORD *v12;

  v12 = a3;
  objc_msgSend(v12, "readAll:", 0);
  responseAlertPrimary = self->_responseAlertPrimary;
  v5 = v12[4];
  if (responseAlertPrimary)
  {
    if (v5)
      -[GEOFormattedString mergeFrom:](responseAlertPrimary, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEOAlertNonRecommendedRouteText setResponseAlertPrimary:](self, "setResponseAlertPrimary:");
  }
  responseAlertSecondary = self->_responseAlertSecondary;
  v7 = v12[5];
  if (responseAlertSecondary)
  {
    if (v7)
      -[GEOFormattedString mergeFrom:](responseAlertSecondary, "mergeFrom:");
  }
  else if (v7)
  {
    -[GEOAlertNonRecommendedRouteText setResponseAlertSecondary:](self, "setResponseAlertSecondary:");
  }
  title = self->_title;
  v9 = v12[6];
  if (title)
  {
    if (v9)
      -[GEOPlaceFormattedString mergeFrom:](title, "mergeFrom:");
  }
  else if (v9)
  {
    -[GEOAlertNonRecommendedRouteText setTitle:](self, "setTitle:");
  }
  body = self->_body;
  v11 = v12[3];
  if (body)
  {
    if (v11)
      -[GEOPlaceFormattedString mergeFrom:](body, "mergeFrom:");
  }
  else if (v11)
  {
    -[GEOAlertNonRecommendedRouteText setBody:](self, "setBody:");
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
      GEOAlertNonRecommendedRouteTextReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_507);
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
  *(_BYTE *)&self->_flags |= 0x21u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOAlertNonRecommendedRouteText readAll:](self, "readAll:", 0);
    -[GEOFormattedString clearUnknownFields:](self->_responseAlertPrimary, "clearUnknownFields:", 1);
    -[GEOFormattedString clearUnknownFields:](self->_responseAlertSecondary, "clearUnknownFields:", 1);
    -[GEOPlaceFormattedString clearUnknownFields:](self->_title, "clearUnknownFields:", 1);
    -[GEOPlaceFormattedString clearUnknownFields:](self->_body, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_responseAlertSecondary, 0);
  objc_storeStrong((id *)&self->_responseAlertPrimary, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
