@implementation GEOSharedNavSenderInfo

- (GEOSharedNavSenderInfo)init
{
  GEOSharedNavSenderInfo *v2;
  GEOSharedNavSenderInfo *v3;
  GEOSharedNavSenderInfo *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOSharedNavSenderInfo;
  v2 = -[GEOSharedNavSenderInfo init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOSharedNavSenderInfo)initWithData:(id)a3
{
  GEOSharedNavSenderInfo *v3;
  GEOSharedNavSenderInfo *v4;
  GEOSharedNavSenderInfo *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOSharedNavSenderInfo;
  v3 = -[GEOSharedNavSenderInfo initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readLocalName
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
        GEOSharedNavSenderInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLocalName_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasLocalName
{
  -[GEOSharedNavSenderInfo _readLocalName]((uint64_t)self);
  return self->_localName != 0;
}

- (NSString)localName
{
  -[GEOSharedNavSenderInfo _readLocalName]((uint64_t)self);
  return self->_localName;
}

- (void)setLocalName:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_localName, a3);
}

- (void)_readLocalContactIdentifier
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
        GEOSharedNavSenderInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLocalContactIdentifier_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasLocalContactIdentifier
{
  -[GEOSharedNavSenderInfo _readLocalContactIdentifier]((uint64_t)self);
  return self->_localContactIdentifier != 0;
}

- (NSString)localContactIdentifier
{
  -[GEOSharedNavSenderInfo _readLocalContactIdentifier]((uint64_t)self);
  return self->_localContactIdentifier;
}

- (void)setLocalContactIdentifier:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_localContactIdentifier, a3);
}

- (void)_readFromIdentifier
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
        GEOSharedNavSenderInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFromIdentifier_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasFromIdentifier
{
  -[GEOSharedNavSenderInfo _readFromIdentifier]((uint64_t)self);
  return self->_fromIdentifier != 0;
}

- (NSString)fromIdentifier
{
  -[GEOSharedNavSenderInfo _readFromIdentifier]((uint64_t)self);
  return self->_fromIdentifier;
}

- (void)setFromIdentifier:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x24u;
  objc_storeStrong((id *)&self->_fromIdentifier, a3);
}

- (void)_readFromDisplayName
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
        GEOSharedNavSenderInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFromDisplayName_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasFromDisplayName
{
  -[GEOSharedNavSenderInfo _readFromDisplayName]((uint64_t)self);
  return self->_fromDisplayName != 0;
}

- (NSString)fromDisplayName
{
  -[GEOSharedNavSenderInfo _readFromDisplayName]((uint64_t)self);
  return self->_fromDisplayName;
}

- (void)setFromDisplayName:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x22u;
  objc_storeStrong((id *)&self->_fromDisplayName, a3);
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
  v8.super_class = (Class)GEOSharedNavSenderInfo;
  -[GEOSharedNavSenderInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOSharedNavSenderInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOSharedNavSenderInfo _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(_QWORD *)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v20[4];
  id v21;

  if (!a1)
    return 0;
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "localName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (a2)
      v6 = CFSTR("localName");
    else
      v6 = CFSTR("local_name");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);
  }

  objc_msgSend(a1, "localContactIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (a2)
      v8 = CFSTR("localContactIdentifier");
    else
      v8 = CFSTR("local_contact_identifier");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);
  }

  objc_msgSend(a1, "fromIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (a2)
      v10 = CFSTR("fromIdentifier");
    else
      v10 = CFSTR("from_identifier");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);
  }

  objc_msgSend(a1, "fromDisplayName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (a2)
      v12 = CFSTR("fromDisplayName");
    else
      v12 = CFSTR("from_display_name");
    objc_msgSend(v4, "setObject:forKey:", v11, v12);
  }

  v13 = (void *)a1[2];
  if (v13)
  {
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v14, "count"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __52__GEOSharedNavSenderInfo__dictionaryRepresentation___block_invoke;
      v20[3] = &unk_1E1C00600;
      v17 = v16;
      v21 = v17;
      objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v20);
      v18 = v17;

      v15 = v18;
    }
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOSharedNavSenderInfo _dictionaryRepresentation:](self, 1);
}

void __52__GEOSharedNavSenderInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOSharedNavSenderInfo)initWithDictionary:(id)a3
{
  return (GEOSharedNavSenderInfo *)-[GEOSharedNavSenderInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("localName");
      else
        v6 = CFSTR("local_name");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = (void *)objc_msgSend(v7, "copy");
        objc_msgSend(a1, "setLocalName:", v8);

      }
      if (a3)
        v9 = CFSTR("localContactIdentifier");
      else
        v9 = CFSTR("local_contact_identifier");
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = (void *)objc_msgSend(v10, "copy");
        objc_msgSend(a1, "setLocalContactIdentifier:", v11);

      }
      if (a3)
        v12 = CFSTR("fromIdentifier");
      else
        v12 = CFSTR("from_identifier");
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = (void *)objc_msgSend(v13, "copy");
        objc_msgSend(a1, "setFromIdentifier:", v14);

      }
      if (a3)
        v15 = CFSTR("fromDisplayName");
      else
        v15 = CFSTR("from_display_name");
      objc_msgSend(v5, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = (void *)objc_msgSend(v16, "copy");
        objc_msgSend(a1, "setFromDisplayName:", v17);

      }
    }
  }

  return a1;
}

- (GEOSharedNavSenderInfo)initWithJSON:(id)a3
{
  return (GEOSharedNavSenderInfo *)-[GEOSharedNavSenderInfo _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_2927;
    else
      v8 = (int *)&readAll__nonRecursiveTag_2928;
    GEOSharedNavSenderInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOSharedNavSenderInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOSharedNavSenderInfoReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x3E) == 0))
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
    -[GEOSharedNavSenderInfo readAll:](self, "readAll:", 0);
    if (self->_localName)
      PBDataWriterWriteStringField();
    v5 = v8;
    if (self->_localContactIdentifier)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_fromIdentifier)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_fromDisplayName)
    {
      PBDataWriterWriteStringField();
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
  -[GEOSharedNavSenderInfo readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 14) = self->_readerMarkPos;
  *((_DWORD *)v5 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_localName)
    objc_msgSend(v5, "setLocalName:");
  if (self->_localContactIdentifier)
    objc_msgSend(v5, "setLocalContactIdentifier:");
  v4 = v5;
  if (self->_fromIdentifier)
  {
    objc_msgSend(v5, "setFromIdentifier:");
    v4 = v5;
  }
  if (self->_fromDisplayName)
  {
    objc_msgSend(v5, "setFromDisplayName:");
    v4 = v5;
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
  uint64_t v12;
  void *v13;
  uint64_t v14;
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
    -[GEOSharedNavSenderInfo readAll:](self, "readAll:", 0);
    v8 = -[NSString copyWithZone:](self->_localName, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v8;

    v10 = -[NSString copyWithZone:](self->_localContactIdentifier, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v10;

    v12 = -[NSString copyWithZone:](self->_fromIdentifier, "copyWithZone:", a3);
    v13 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v12;

    v14 = -[NSString copyWithZone:](self->_fromDisplayName, "copyWithZone:", a3);
    v15 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v14;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOSharedNavSenderInfoReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *localName;
  NSString *localContactIdentifier;
  NSString *fromIdentifier;
  NSString *fromDisplayName;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOSharedNavSenderInfo readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         localName = self->_localName,
         !((unint64_t)localName | v4[6]))
     || -[NSString isEqual:](localName, "isEqual:"))
    && ((localContactIdentifier = self->_localContactIdentifier, !((unint64_t)localContactIdentifier | v4[5]))
     || -[NSString isEqual:](localContactIdentifier, "isEqual:"))
    && ((fromIdentifier = self->_fromIdentifier, !((unint64_t)fromIdentifier | v4[4]))
     || -[NSString isEqual:](fromIdentifier, "isEqual:")))
  {
    fromDisplayName = self->_fromDisplayName;
    if ((unint64_t)fromDisplayName | v4[3])
      v9 = -[NSString isEqual:](fromDisplayName, "isEqual:");
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
  NSUInteger v5;

  -[GEOSharedNavSenderInfo readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_localName, "hash");
  v4 = -[NSString hash](self->_localContactIdentifier, "hash") ^ v3;
  v5 = -[NSString hash](self->_fromIdentifier, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_fromDisplayName, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if (v4[6])
    -[GEOSharedNavSenderInfo setLocalName:](self, "setLocalName:");
  if (v4[5])
    -[GEOSharedNavSenderInfo setLocalContactIdentifier:](self, "setLocalContactIdentifier:");
  if (v4[4])
    -[GEOSharedNavSenderInfo setFromIdentifier:](self, "setFromIdentifier:");
  if (v4[3])
    -[GEOSharedNavSenderInfo setFromDisplayName:](self, "setFromDisplayName:");

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
      GEOSharedNavSenderInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_2931);
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
    -[GEOSharedNavSenderInfo readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localName, 0);
  objc_storeStrong((id *)&self->_localContactIdentifier, 0);
  objc_storeStrong((id *)&self->_fromIdentifier, 0);
  objc_storeStrong((id *)&self->_fromDisplayName, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
