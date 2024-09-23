@implementation GEOTransitRouteUpdateAlert

- (GEOTransitRouteUpdateAlert)init
{
  GEOTransitRouteUpdateAlert *v2;
  GEOTransitRouteUpdateAlert *v3;
  GEOTransitRouteUpdateAlert *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOTransitRouteUpdateAlert;
  v2 = -[GEOTransitRouteUpdateAlert init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTransitRouteUpdateAlert)initWithData:(id)a3
{
  GEOTransitRouteUpdateAlert *v3;
  GEOTransitRouteUpdateAlert *v4;
  GEOTransitRouteUpdateAlert *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOTransitRouteUpdateAlert;
  v3 = -[GEOTransitRouteUpdateAlert initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readTitle
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
        GEOTransitRouteUpdateAlertReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTitle_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasTitle
{
  -[GEOTransitRouteUpdateAlert _readTitle]((uint64_t)self);
  return self->_title != 0;
}

- (GEOFormattedString)title
{
  -[GEOTransitRouteUpdateAlert _readTitle]((uint64_t)self);
  return self->_title;
}

- (void)setTitle:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_title, a3);
}

- (void)_readContent
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
        GEOTransitRouteUpdateAlertReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readContent_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasContent
{
  -[GEOTransitRouteUpdateAlert _readContent]((uint64_t)self);
  return self->_content != 0;
}

- (GEOFormattedString)content
{
  -[GEOTransitRouteUpdateAlert _readContent]((uint64_t)self);
  return self->_content;
}

- (void)setContent:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x12u;
  objc_storeStrong((id *)&self->_content, a3);
}

- (void)_readIdentifier
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
        GEOTransitRouteUpdateAlertReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIdentifier_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasIdentifier
{
  -[GEOTransitRouteUpdateAlert _readIdentifier]((uint64_t)self);
  return self->_identifier != 0;
}

- (NSData)identifier
{
  -[GEOTransitRouteUpdateAlert _readIdentifier]((uint64_t)self);
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_identifier, a3);
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
  v8.super_class = (Class)GEOTransitRouteUpdateAlert;
  -[GEOTransitRouteUpdateAlert description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOTransitRouteUpdateAlert dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTransitRouteUpdateAlert _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(_QWORD *)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v21[4];
  id v22;

  if (!a1)
    return 0;
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v5, "jsonRepresentation");
    else
      objc_msgSend(v5, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("title"));

  }
  objc_msgSend(a1, "content");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v8, "jsonRepresentation");
    else
      objc_msgSend(v8, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("content"));

  }
  objc_msgSend(a1, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v11, "base64EncodedStringWithOptions:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("identifier"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("identifier"));
    }
  }

  v14 = (void *)a1[2];
  if (v14)
  {
    objc_msgSend(v14, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __56__GEOTransitRouteUpdateAlert__dictionaryRepresentation___block_invoke;
      v21[3] = &unk_1E1C00600;
      v18 = v17;
      v22 = v18;
      objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v21);
      v19 = v18;

      v16 = v19;
    }
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOTransitRouteUpdateAlert _dictionaryRepresentation:](self, 1);
}

void __56__GEOTransitRouteUpdateAlert__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOTransitRouteUpdateAlert)initWithDictionary:(id)a3
{
  return (GEOTransitRouteUpdateAlert *)-[GEOTransitRouteUpdateAlert _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5;
  void *v6;
  GEOFormattedString *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  GEOFormattedString *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("title"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = [GEOFormattedString alloc];
        if ((a3 & 1) != 0)
          v8 = -[GEOFormattedString initWithJSON:](v7, "initWithJSON:", v6);
        else
          v8 = -[GEOFormattedString initWithDictionary:](v7, "initWithDictionary:", v6);
        v9 = (void *)v8;
        objc_msgSend(a1, "setTitle:", v8);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("content"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = [GEOFormattedString alloc];
        if ((a3 & 1) != 0)
          v12 = -[GEOFormattedString initWithJSON:](v11, "initWithJSON:", v10);
        else
          v12 = -[GEOFormattedString initWithDictionary:](v11, "initWithDictionary:", v10);
        v13 = (void *)v12;
        objc_msgSend(a1, "setContent:", v12);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v14, 0);
        objc_msgSend(a1, "setIdentifier:", v15);

      }
    }
  }

  return a1;
}

- (GEOTransitRouteUpdateAlert)initWithJSON:(id)a3
{
  return (GEOTransitRouteUpdateAlert *)-[GEOTransitRouteUpdateAlert _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_169;
    else
      v8 = (int *)&readAll__nonRecursiveTag_170;
    GEOTransitRouteUpdateAlertReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEOFormattedString readAll:](self->_title, "readAll:", 1);
    -[GEOFormattedString readAll:](self->_content, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTransitRouteUpdateAlertIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTransitRouteUpdateAlertReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEOTransitRouteUpdateAlertIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOTransitRouteUpdateAlert readAll:](self, "readAll:", 0);
    if (self->_title)
      PBDataWriterWriteSubmessage();
    v5 = v8;
    if (self->_content)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_identifier)
    {
      PBDataWriterWriteDataField();
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
  -[GEOTransitRouteUpdateAlert readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 12) = self->_readerMarkPos;
  *((_DWORD *)v5 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_title)
    objc_msgSend(v5, "setTitle:");
  if (self->_content)
    objc_msgSend(v5, "setContent:");
  v4 = v5;
  if (self->_identifier)
  {
    objc_msgSend(v5, "setIdentifier:");
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
  uint64_t v12;
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
    -[GEOTransitRouteUpdateAlert readAll:](self, "readAll:", 0);
    v8 = -[GEOFormattedString copyWithZone:](self->_title, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v8;

    v10 = -[GEOFormattedString copyWithZone:](self->_content, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v10;

    v12 = -[NSData copyWithZone:](self->_identifier, "copyWithZone:", a3);
    v13 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v12;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOTransitRouteUpdateAlertReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEOFormattedString *title;
  GEOFormattedString *content;
  NSData *identifier;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOTransitRouteUpdateAlert readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         title = self->_title,
         !((unint64_t)title | v4[5]))
     || -[GEOFormattedString isEqual:](title, "isEqual:"))
    && ((content = self->_content, !((unint64_t)content | v4[3]))
     || -[GEOFormattedString isEqual:](content, "isEqual:")))
  {
    identifier = self->_identifier;
    if ((unint64_t)identifier | v4[4])
      v8 = -[NSData isEqual:](identifier, "isEqual:");
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

  -[GEOTransitRouteUpdateAlert readAll:](self, "readAll:", 1);
  v3 = -[GEOFormattedString hash](self->_title, "hash");
  v4 = -[GEOFormattedString hash](self->_content, "hash") ^ v3;
  return v4 ^ -[NSData hash](self->_identifier, "hash");
}

- (void)mergeFrom:(id)a3
{
  GEOFormattedString *title;
  uint64_t v5;
  GEOFormattedString *content;
  uint64_t v7;
  _QWORD *v8;

  v8 = a3;
  objc_msgSend(v8, "readAll:", 0);
  title = self->_title;
  v5 = v8[5];
  if (title)
  {
    if (v5)
      -[GEOFormattedString mergeFrom:](title, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEOTransitRouteUpdateAlert setTitle:](self, "setTitle:");
  }
  content = self->_content;
  v7 = v8[3];
  if (content)
  {
    if (v7)
      -[GEOFormattedString mergeFrom:](content, "mergeFrom:");
  }
  else if (v7)
  {
    -[GEOTransitRouteUpdateAlert setContent:](self, "setContent:");
  }
  if (v8[4])
    -[GEOTransitRouteUpdateAlert setIdentifier:](self, "setIdentifier:");

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
      GEOTransitRouteUpdateAlertReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_173);
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
  *(_BYTE *)&self->_flags |= 0x11u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOTransitRouteUpdateAlert readAll:](self, "readAll:", 0);
    -[GEOFormattedString clearUnknownFields:](self->_title, "clearUnknownFields:", 1);
    -[GEOFormattedString clearUnknownFields:](self->_content, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
