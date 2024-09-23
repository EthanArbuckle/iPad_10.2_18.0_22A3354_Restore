@implementation GEOTriggerPointRange

- (GEOTriggerPointRange)init
{
  GEOTriggerPointRange *v2;
  GEOTriggerPointRange *v3;
  GEOTriggerPointRange *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOTriggerPointRange;
  v2 = -[GEOTriggerPointRange init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTriggerPointRange)initWithData:(id)a3
{
  GEOTriggerPointRange *v3;
  GEOTriggerPointRange *v4;
  GEOTriggerPointRange *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOTriggerPointRange;
  v3 = -[GEOTriggerPointRange initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readShowAtPoint
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 56) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTriggerPointRangeReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readShowAtPoint_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasShowAtPoint
{
  -[GEOTriggerPointRange _readShowAtPoint]((uint64_t)self);
  return self->_showAtPoint != 0;
}

- (GEOTriggerPoint)showAtPoint
{
  -[GEOTriggerPointRange _readShowAtPoint]((uint64_t)self);
  return self->_showAtPoint;
}

- (void)setShowAtPoint:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_showAtPoint, a3);
}

- (void)_readHideAtPoint
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 56) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTriggerPointRangeReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readHideAtPoint_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasHideAtPoint
{
  -[GEOTriggerPointRange _readHideAtPoint]((uint64_t)self);
  return self->_hideAtPoint != 0;
}

- (GEOTriggerPoint)hideAtPoint
{
  -[GEOTriggerPointRange _readHideAtPoint]((uint64_t)self);
  return self->_hideAtPoint;
}

- (void)setHideAtPoint:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_hideAtPoint, a3);
}

- (unsigned)displayTime
{
  return self->_displayTime;
}

- (void)setDisplayTime:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 0x11u;
  self->_displayTime = a3;
}

- (void)setHasDisplayTime:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasDisplayTime
{
  return *(_BYTE *)&self->_flags & 1;
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
  v8.super_class = (Class)GEOTriggerPointRange;
  -[GEOTriggerPointRange description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOTriggerPointRange dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTriggerPointRange _dictionaryRepresentation:]((uint64_t)self, 0);
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
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "showAtPoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("showAtPoint");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("show_at_point");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  objc_msgSend((id)a1, "hideAtPoint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v9, "jsonRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("hideAtPoint");
    }
    else
    {
      objc_msgSend(v9, "dictionaryRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("hide_at_point");
    }
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

  }
  if ((*(_BYTE *)(a1 + 56) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 52));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v14 = CFSTR("displayTime");
    else
      v14 = CFSTR("display_time");
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
      v22[2] = __50__GEOTriggerPointRange__dictionaryRepresentation___block_invoke;
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
  return -[GEOTriggerPointRange _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __50__GEOTriggerPointRange__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOTriggerPointRange)initWithDictionary:(id)a3
{
  return (GEOTriggerPointRange *)-[GEOTriggerPointRange _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  GEOTriggerPoint *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  GEOTriggerPoint *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("showAtPoint");
      else
        v6 = CFSTR("show_at_point");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = [GEOTriggerPoint alloc];
        if ((a3 & 1) != 0)
          v9 = -[GEOTriggerPoint initWithJSON:](v8, "initWithJSON:", v7);
        else
          v9 = -[GEOTriggerPoint initWithDictionary:](v8, "initWithDictionary:", v7);
        v10 = (void *)v9;
        objc_msgSend(a1, "setShowAtPoint:", v9);

      }
      if (a3)
        v11 = CFSTR("hideAtPoint");
      else
        v11 = CFSTR("hide_at_point");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = [GEOTriggerPoint alloc];
        if ((a3 & 1) != 0)
          v14 = -[GEOTriggerPoint initWithJSON:](v13, "initWithJSON:", v12);
        else
          v14 = -[GEOTriggerPoint initWithDictionary:](v13, "initWithDictionary:", v12);
        v15 = (void *)v14;
        objc_msgSend(a1, "setHideAtPoint:", v14);

      }
      if (a3)
        v16 = CFSTR("displayTime");
      else
        v16 = CFSTR("display_time");
      objc_msgSend(v5, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setDisplayTime:", objc_msgSend(v17, "unsignedIntValue"));

    }
  }

  return a1;
}

- (GEOTriggerPointRange)initWithJSON:(id)a3
{
  return (GEOTriggerPointRange *)-[GEOTriggerPointRange _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_7124;
    else
      v8 = (int *)&readAll__nonRecursiveTag_7125;
    GEOTriggerPointRangeReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEOTriggerPoint readAll:](self->_showAtPoint, "readAll:", 1);
    -[GEOTriggerPoint readAll:](self->_hideAtPoint, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTriggerPointRangeIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTriggerPointRangeReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x1C) == 0))
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
    -[GEOTriggerPointRange readAll:](self, "readAll:", 0);
    if (self->_showAtPoint)
      PBDataWriterWriteSubmessage();
    v5 = v8;
    if (self->_hideAtPoint)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if ((*(_BYTE *)&self->_flags & 1) != 0)
    {
      PBDataWriterWriteUint32Field();
      v5 = v8;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (void)copyTo:(id)a3
{
  id *v4;

  v4 = (id *)a3;
  -[GEOTriggerPointRange readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 10) = self->_readerMarkPos;
  *((_DWORD *)v4 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_showAtPoint)
    objc_msgSend(v4, "setShowAtPoint:");
  if (self->_hideAtPoint)
    objc_msgSend(v4, "setHideAtPoint:");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v4 + 13) = self->_displayTime;
    *((_BYTE *)v4 + 56) |= 1u;
  }

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
  PBUnknownFields *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x10) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOTriggerPointRangeReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOTriggerPointRange readAll:](self, "readAll:", 0);
  v9 = -[GEOTriggerPoint copyWithZone:](self->_showAtPoint, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v9;

  v11 = -[GEOTriggerPoint copyWithZone:](self->_hideAtPoint, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v11;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 52) = self->_displayTime;
    *(_BYTE *)(v5 + 56) |= 1u;
  }
  v13 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v13;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOTriggerPoint *showAtPoint;
  GEOTriggerPoint *hideAtPoint;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  -[GEOTriggerPointRange readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  showAtPoint = self->_showAtPoint;
  if ((unint64_t)showAtPoint | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOTriggerPoint isEqual:](showAtPoint, "isEqual:"))
      goto LABEL_10;
  }
  hideAtPoint = self->_hideAtPoint;
  if ((unint64_t)hideAtPoint | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOTriggerPoint isEqual:](hideAtPoint, "isEqual:"))
      goto LABEL_10;
  }
  v7 = (*((_BYTE *)v4 + 56) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) != 0 && self->_displayTime == *((_DWORD *)v4 + 13))
    {
      v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;

  -[GEOTriggerPointRange readAll:](self, "readAll:", 1);
  v3 = -[GEOTriggerPoint hash](self->_showAtPoint, "hash");
  v4 = -[GEOTriggerPoint hash](self->_hideAtPoint, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v5 = 2654435761 * self->_displayTime;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  GEOTriggerPoint *showAtPoint;
  uint64_t v6;
  GEOTriggerPoint *hideAtPoint;
  uint64_t v8;
  _QWORD *v9;

  v9 = a3;
  objc_msgSend(v9, "readAll:", 0);
  v4 = v9;
  showAtPoint = self->_showAtPoint;
  v6 = v9[4];
  if (showAtPoint)
  {
    if (!v6)
      goto LABEL_7;
    -[GEOTriggerPoint mergeFrom:](showAtPoint, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[GEOTriggerPointRange setShowAtPoint:](self, "setShowAtPoint:");
  }
  v4 = v9;
LABEL_7:
  hideAtPoint = self->_hideAtPoint;
  v8 = v4[3];
  if (hideAtPoint)
  {
    if (!v8)
      goto LABEL_13;
    -[GEOTriggerPoint mergeFrom:](hideAtPoint, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[GEOTriggerPointRange setHideAtPoint:](self, "setHideAtPoint:");
  }
  v4 = v9;
LABEL_13:
  if ((v4[7] & 1) != 0)
  {
    self->_displayTime = *((_DWORD *)v4 + 13);
    *(_BYTE *)&self->_flags |= 1u;
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOTriggerPointRangeReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_7128);
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
  *(_BYTE *)&self->_flags |= 0x12u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOTriggerPointRange readAll:](self, "readAll:", 0);
    -[GEOTriggerPoint clearUnknownFields:](self->_showAtPoint, "clearUnknownFields:", 1);
    -[GEOTriggerPoint clearUnknownFields:](self->_hideAtPoint, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_showAtPoint, 0);
  objc_storeStrong((id *)&self->_hideAtPoint, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
