@implementation GEOLabelInfo

- (GEOLabelInfo)init
{
  GEOLabelInfo *v2;
  GEOLabelInfo *v3;
  GEOLabelInfo *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOLabelInfo;
  v2 = -[GEOLabelInfo init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLabelInfo)initWithData:(id)a3
{
  GEOLabelInfo *v3;
  GEOLabelInfo *v4;
  GEOLabelInfo *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOLabelInfo;
  v3 = -[GEOLabelInfo initWithData:](&v7, sel_initWithData_, a3);
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
        GEOLabelInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTitle_tags_2937);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasTitle
{
  -[GEOLabelInfo _readTitle]((uint64_t)self);
  return self->_title != 0;
}

- (GEOFormattedString)title
{
  -[GEOLabelInfo _readTitle]((uint64_t)self);
  return self->_title;
}

- (void)setTitle:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_title, a3);
}

- (void)_readDetail
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
        GEOLabelInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDetail_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasDetail
{
  -[GEOLabelInfo _readDetail]((uint64_t)self);
  return self->_detail != 0;
}

- (GEOFormattedString)detail
{
  -[GEOLabelInfo _readDetail]((uint64_t)self);
  return self->_detail;
}

- (void)setDetail:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x22u;
  objc_storeStrong((id *)&self->_detail, a3);
}

- (void)_readIconArtwork
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
        GEOLabelInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIconArtwork_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasIconArtwork
{
  -[GEOLabelInfo _readIconArtwork]((uint64_t)self);
  return self->_iconArtwork != 0;
}

- (GEOPBTransitArtwork)iconArtwork
{
  -[GEOLabelInfo _readIconArtwork]((uint64_t)self);
  return self->_iconArtwork;
}

- (void)setIconArtwork:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x24u;
  objc_storeStrong((id *)&self->_iconArtwork, a3);
}

- (void)_readLabelStyleAttributes
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
        GEOLabelInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLabelStyleAttributes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasLabelStyleAttributes
{
  -[GEOLabelInfo _readLabelStyleAttributes]((uint64_t)self);
  return self->_labelStyleAttributes != 0;
}

- (GEOStyleAttributes)labelStyleAttributes
{
  -[GEOLabelInfo _readLabelStyleAttributes]((uint64_t)self);
  return self->_labelStyleAttributes;
}

- (void)setLabelStyleAttributes:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_labelStyleAttributes, a3);
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
  v8.super_class = (Class)GEOLabelInfo;
  -[GEOLabelInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLabelInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLabelInfo _dictionaryRepresentation:](self, 0);
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
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
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
  objc_msgSend(a1, "detail");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v8, "jsonRepresentation");
    else
      objc_msgSend(v8, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("detail"));

  }
  objc_msgSend(a1, "iconArtwork");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v11, "jsonRepresentation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("iconArtwork");
    }
    else
    {
      objc_msgSend(v11, "dictionaryRepresentation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("icon_artwork");
    }
    objc_msgSend(v4, "setObject:forKey:", v13, v14);

  }
  objc_msgSend(a1, "labelStyleAttributes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v15, "jsonRepresentation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = CFSTR("labelStyleAttributes");
    }
    else
    {
      objc_msgSend(v15, "dictionaryRepresentation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = CFSTR("label_style_attributes");
    }
    objc_msgSend(v4, "setObject:forKey:", v17, v18);

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
      v26[2] = __42__GEOLabelInfo__dictionaryRepresentation___block_invoke;
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
  return -[GEOLabelInfo _dictionaryRepresentation:](self, 1);
}

void __42__GEOLabelInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOLabelInfo)initWithDictionary:(id)a3
{
  return (GEOLabelInfo *)-[GEOLabelInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
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
  const __CFString *v14;
  void *v15;
  GEOPBTransitArtwork *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  GEOStyleAttributes *v21;
  uint64_t v22;
  void *v23;

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
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("detail"));
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
        objc_msgSend(a1, "setDetail:", v12);

      }
      if (a3)
        v14 = CFSTR("iconArtwork");
      else
        v14 = CFSTR("icon_artwork");
      objc_msgSend(v5, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = [GEOPBTransitArtwork alloc];
        if ((a3 & 1) != 0)
          v17 = -[GEOPBTransitArtwork initWithJSON:](v16, "initWithJSON:", v15);
        else
          v17 = -[GEOPBTransitArtwork initWithDictionary:](v16, "initWithDictionary:", v15);
        v18 = (void *)v17;
        objc_msgSend(a1, "setIconArtwork:", v17);

      }
      if (a3)
        v19 = CFSTR("labelStyleAttributes");
      else
        v19 = CFSTR("label_style_attributes");
      objc_msgSend(v5, "objectForKeyedSubscript:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v21 = [GEOStyleAttributes alloc];
        if ((a3 & 1) != 0)
          v22 = -[GEOStyleAttributes initWithJSON:](v21, "initWithJSON:", v20);
        else
          v22 = -[GEOStyleAttributes initWithDictionary:](v21, "initWithDictionary:", v20);
        v23 = (void *)v22;
        objc_msgSend(a1, "setLabelStyleAttributes:", v22);

      }
    }
  }

  return a1;
}

- (GEOLabelInfo)initWithJSON:(id)a3
{
  return (GEOLabelInfo *)-[GEOLabelInfo _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_2949;
    else
      v8 = (int *)&readAll__nonRecursiveTag_2950;
    GEOLabelInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOLabelInfoCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLabelInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLabelInfoReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEOLabelInfoIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOLabelInfo readAll:](self, "readAll:", 0);
    if (self->_title)
      PBDataWriterWriteSubmessage();
    v5 = v8;
    if (self->_detail)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_iconArtwork)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_labelStyleAttributes)
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
  -[GEOLabelInfo readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 14) = self->_readerMarkPos;
  *((_DWORD *)v5 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_title)
    objc_msgSend(v5, "setTitle:");
  if (self->_detail)
    objc_msgSend(v5, "setDetail:");
  v4 = v5;
  if (self->_iconArtwork)
  {
    objc_msgSend(v5, "setIconArtwork:");
    v4 = v5;
  }
  if (self->_labelStyleAttributes)
  {
    objc_msgSend(v5, "setLabelStyleAttributes:");
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
    -[GEOLabelInfo readAll:](self, "readAll:", 0);
    v8 = -[GEOFormattedString copyWithZone:](self->_title, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v8;

    v10 = -[GEOFormattedString copyWithZone:](self->_detail, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v10;

    v12 = -[GEOPBTransitArtwork copyWithZone:](self->_iconArtwork, "copyWithZone:", a3);
    v13 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v12;

    v14 = -[GEOStyleAttributes copyWithZone:](self->_labelStyleAttributes, "copyWithZone:", a3);
    v15 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v14;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOLabelInfoReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEOFormattedString *title;
  GEOFormattedString *detail;
  GEOPBTransitArtwork *iconArtwork;
  GEOStyleAttributes *labelStyleAttributes;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOLabelInfo readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         title = self->_title,
         !((unint64_t)title | v4[6]))
     || -[GEOFormattedString isEqual:](title, "isEqual:"))
    && ((detail = self->_detail, !((unint64_t)detail | v4[3]))
     || -[GEOFormattedString isEqual:](detail, "isEqual:"))
    && ((iconArtwork = self->_iconArtwork, !((unint64_t)iconArtwork | v4[4]))
     || -[GEOPBTransitArtwork isEqual:](iconArtwork, "isEqual:")))
  {
    labelStyleAttributes = self->_labelStyleAttributes;
    if ((unint64_t)labelStyleAttributes | v4[5])
      v9 = -[GEOStyleAttributes isEqual:](labelStyleAttributes, "isEqual:");
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

  -[GEOLabelInfo readAll:](self, "readAll:", 1);
  v3 = -[GEOFormattedString hash](self->_title, "hash");
  v4 = -[GEOFormattedString hash](self->_detail, "hash") ^ v3;
  v5 = -[GEOPBTransitArtwork hash](self->_iconArtwork, "hash");
  return v4 ^ v5 ^ -[GEOStyleAttributes hash](self->_labelStyleAttributes, "hash");
}

- (void)mergeFrom:(id)a3
{
  GEOFormattedString *title;
  uint64_t v5;
  GEOFormattedString *detail;
  uint64_t v7;
  GEOPBTransitArtwork *iconArtwork;
  uint64_t v9;
  GEOStyleAttributes *labelStyleAttributes;
  uint64_t v11;
  _QWORD *v12;

  v12 = a3;
  objc_msgSend(v12, "readAll:", 0);
  title = self->_title;
  v5 = v12[6];
  if (title)
  {
    if (v5)
      -[GEOFormattedString mergeFrom:](title, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEOLabelInfo setTitle:](self, "setTitle:");
  }
  detail = self->_detail;
  v7 = v12[3];
  if (detail)
  {
    if (v7)
      -[GEOFormattedString mergeFrom:](detail, "mergeFrom:");
  }
  else if (v7)
  {
    -[GEOLabelInfo setDetail:](self, "setDetail:");
  }
  iconArtwork = self->_iconArtwork;
  v9 = v12[4];
  if (iconArtwork)
  {
    if (v9)
      -[GEOPBTransitArtwork mergeFrom:](iconArtwork, "mergeFrom:");
  }
  else if (v9)
  {
    -[GEOLabelInfo setIconArtwork:](self, "setIconArtwork:");
  }
  labelStyleAttributes = self->_labelStyleAttributes;
  v11 = v12[5];
  if (labelStyleAttributes)
  {
    if (v11)
      -[GEOStyleAttributes mergeFrom:](labelStyleAttributes, "mergeFrom:");
  }
  else if (v11)
  {
    -[GEOLabelInfo setLabelStyleAttributes:](self, "setLabelStyleAttributes:");
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
      GEOLabelInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_2953);
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
    -[GEOLabelInfo readAll:](self, "readAll:", 0);
    -[GEOFormattedString clearUnknownFields:](self->_title, "clearUnknownFields:", 1);
    -[GEOFormattedString clearUnknownFields:](self->_detail, "clearUnknownFields:", 1);
    -[GEOPBTransitArtwork clearUnknownFields:](self->_iconArtwork, "clearUnknownFields:", 1);
    -[GEOStyleAttributes clearUnknownFields:](self->_labelStyleAttributes, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_labelStyleAttributes, 0);
  objc_storeStrong((id *)&self->_iconArtwork, 0);
  objc_storeStrong((id *)&self->_detail, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
