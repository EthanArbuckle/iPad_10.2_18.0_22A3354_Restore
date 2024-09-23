@implementation GEOAlert

- (GEOAlert)init
{
  GEOAlert *v2;
  GEOAlert *v3;
  GEOAlert *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOAlert;
  v2 = -[GEOAlert init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOAlert)initWithData:(id)a3
{
  GEOAlert *v3;
  GEOAlert *v4;
  GEOAlert *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOAlert;
  v3 = -[GEOAlert initWithData:](&v7, sel_initWithData_, a3);
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAlertReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTitle_tags_468);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)title
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOAlert _readTitle]((uint64_t)a1);
    a1 = (id *)v1[6];
  }
  return a1;
}

- (void)setTitle:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_BYTE *)(a1 + 68) |= 0x10u;
    *(_BYTE *)(a1 + 68) |= 0x20u;
    objc_storeStrong((id *)(a1 + 48), a2);
  }

}

- (void)_readContent
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
        GEOAlertReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readContent_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)content
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOAlert _readContent]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (void)setContent:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_BYTE *)(a1 + 68) |= 2u;
    *(_BYTE *)(a1 + 68) |= 0x20u;
    objc_storeStrong((id *)(a1 + 24), a2);
  }

}

- (void)_readFormattedTitle
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
        GEOAlertReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFormattedTitle_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)formattedTitle
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOAlert _readFormattedTitle]((uint64_t)a1);
    a1 = (id *)v1[5];
  }
  return a1;
}

- (void)setFormattedTitle:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_BYTE *)(a1 + 68) |= 8u;
    *(_BYTE *)(a1 + 68) |= 0x20u;
    objc_storeStrong((id *)(a1 + 40), a2);
  }

}

- (void)_readFormattedContent
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
        GEOAlertReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFormattedContent_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)formattedContent
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOAlert _readFormattedContent]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (void)setFormattedContent:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_BYTE *)(a1 + 68) |= 4u;
    *(_BYTE *)(a1 + 68) |= 0x20u;
    objc_storeStrong((id *)(a1 + 32), a2);
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
  v8.super_class = (Class)GEOAlert;
  -[GEOAlert description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOAlert dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOAlert _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v22[4];
  id v23;

  if (!a1)
    return 0;
  -[GEOAlert readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOAlert title]((id *)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("title"));

  -[GEOAlert content]((id *)a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("content"));

  -[GEOAlert formattedTitle]((id *)a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v7, "jsonRepresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("formattedTitle");
    }
    else
    {
      objc_msgSend(v7, "dictionaryRepresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("formatted_title");
    }
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

  }
  -[GEOAlert formattedContent]((id *)a1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v11, "jsonRepresentation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("formattedContent");
    }
    else
    {
      objc_msgSend(v11, "dictionaryRepresentation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("formatted_content");
    }
    objc_msgSend(v4, "setObject:forKey:", v13, v14);

  }
  v15 = *(void **)(a1 + 16);
  if (v15)
  {
    objc_msgSend(v15, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v16, "count"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __38__GEOAlert__dictionaryRepresentation___block_invoke;
      v22[3] = &unk_1E1C00600;
      v19 = v18;
      v23 = v19;
      objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v22);
      v20 = v19;

      v17 = v20;
    }
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOAlert _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_479;
      else
        v6 = (int *)&readAll__nonRecursiveTag_480;
      GEOAlertReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
    {
      objc_msgSend(*(id *)(a1 + 40), "readAll:", 1);
      objc_msgSend(*(id *)(a1 + 32), "readAll:", 1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

void __38__GEOAlert__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  GEOFormattedString *v12;
  GEOFormattedString *v13;
  GEOFormattedString *v14;
  const __CFString *v15;
  void *v16;
  GEOFormattedString *v17;
  GEOFormattedString *v18;
  GEOFormattedString *v19;

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
        v7 = (void *)objc_msgSend(v6, "copy");
        -[GEOAlert setTitle:]((uint64_t)a1, v7);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("content"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = (void *)objc_msgSend(v8, "copy");
        -[GEOAlert setContent:]((uint64_t)a1, v9);

      }
      if (a3)
        v10 = CFSTR("formattedTitle");
      else
        v10 = CFSTR("formatted_title");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = [GEOFormattedString alloc];
        if ((a3 & 1) != 0)
          v13 = -[GEOFormattedString initWithJSON:](v12, "initWithJSON:", v11);
        else
          v13 = -[GEOFormattedString initWithDictionary:](v12, "initWithDictionary:", v11);
        v14 = v13;
        -[GEOAlert setFormattedTitle:]((uint64_t)a1, v13);

      }
      if (a3)
        v15 = CFSTR("formattedContent");
      else
        v15 = CFSTR("formatted_content");
      objc_msgSend(v5, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = [GEOFormattedString alloc];
        if ((a3 & 1) != 0)
          v18 = -[GEOFormattedString initWithJSON:](v17, "initWithJSON:", v16);
        else
          v18 = -[GEOFormattedString initWithDictionary:](v17, "initWithDictionary:", v16);
        v19 = v18;
        -[GEOAlert setFormattedContent:]((uint64_t)a1, v18);

      }
    }
  }

  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOAlertReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEOAlertIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOAlert readAll:]((uint64_t)self, 0);
    if (self->_title)
      PBDataWriterWriteStringField();
    v5 = v8;
    if (self->_content)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_formattedTitle)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_formattedContent)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
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
    -[GEOAlert readAll:]((uint64_t)self, 0);
    v8 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v8;

    v10 = -[NSString copyWithZone:](self->_content, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v10;

    v12 = -[GEOFormattedString copyWithZone:](self->_formattedTitle, "copyWithZone:", a3);
    v13 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v12;

    v14 = -[GEOFormattedString copyWithZone:](self->_formattedContent, "copyWithZone:", a3);
    v15 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v14;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOAlertReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *title;
  NSString *content;
  GEOFormattedString *formattedTitle;
  GEOFormattedString *formattedContent;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOAlert readAll:]((uint64_t)self, 1),
         -[GEOAlert readAll:]((uint64_t)v4, 1),
         title = self->_title,
         !((unint64_t)title | v4[6]))
     || -[NSString isEqual:](title, "isEqual:"))
    && ((content = self->_content, !((unint64_t)content | v4[3]))
     || -[NSString isEqual:](content, "isEqual:"))
    && ((formattedTitle = self->_formattedTitle, !((unint64_t)formattedTitle | v4[5]))
     || -[GEOFormattedString isEqual:](formattedTitle, "isEqual:")))
  {
    formattedContent = self->_formattedContent;
    if ((unint64_t)formattedContent | v4[4])
      v9 = -[GEOFormattedString isEqual:](formattedContent, "isEqual:");
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
  NSUInteger v3;
  NSUInteger v4;
  unint64_t v5;

  -[GEOAlert readAll:]((uint64_t)self, 1);
  v3 = -[NSString hash](self->_title, "hash");
  v4 = -[NSString hash](self->_content, "hash") ^ v3;
  v5 = -[GEOFormattedString hash](self->_formattedTitle, "hash");
  return v4 ^ v5 ^ -[GEOFormattedString hash](self->_formattedContent, "hash");
}

- (void)mergeFrom:(uint64_t)a1
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  if (a1)
  {
    -[GEOAlert readAll:]((uint64_t)v9, 0);
    v3 = (void *)*((_QWORD *)v9 + 6);
    if (v3)
      -[GEOAlert setTitle:](a1, v3);
    v4 = (void *)*((_QWORD *)v9 + 3);
    if (v4)
      -[GEOAlert setContent:](a1, v4);
    v5 = *(void **)(a1 + 40);
    v6 = *((_QWORD *)v9 + 5);
    if (v5)
    {
      if (v6)
        objc_msgSend(v5, "mergeFrom:");
    }
    else if (v6)
    {
      -[GEOAlert setFormattedTitle:](a1, *((void **)v9 + 5));
    }
    v7 = *(void **)(a1 + 32);
    v8 = *((_QWORD *)v9 + 4);
    if (v7)
    {
      if (v8)
        objc_msgSend(v7, "mergeFrom:");
    }
    else if (v8)
    {
      -[GEOAlert setFormattedContent:](a1, *((void **)v9 + 4));
    }
  }

}

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v4;

  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 68) |= 1u;
    *(_BYTE *)(a1 + 68) |= 0x20u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    v4 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOAlert readAll:](a1, 0);
      objc_msgSend(*(id *)(a1 + 40), "clearUnknownFields:", 1);
      objc_msgSend(*(id *)(a1 + 32), "clearUnknownFields:", 1);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_formattedTitle, 0);
  objc_storeStrong((id *)&self->_formattedContent, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
