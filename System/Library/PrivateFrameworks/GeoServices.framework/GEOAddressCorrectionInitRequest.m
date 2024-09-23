@implementation GEOAddressCorrectionInitRequest

- (GEOAddressCorrectionInitRequest)init
{
  GEOAddressCorrectionInitRequest *v2;
  GEOAddressCorrectionInitRequest *v3;
  GEOAddressCorrectionInitRequest *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOAddressCorrectionInitRequest;
  v2 = -[GEOAddressCorrectionInitRequest init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOAddressCorrectionInitRequest)initWithData:(id)a3
{
  GEOAddressCorrectionInitRequest *v3;
  GEOAddressCorrectionInitRequest *v4;
  GEOAddressCorrectionInitRequest *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOAddressCorrectionInitRequest;
  v3 = -[GEOAddressCorrectionInitRequest initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readToken
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(_BYTE *)(a1 + 48) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAddressCorrectionInitRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readToken_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasToken
{
  -[GEOAddressCorrectionInitRequest _readToken]((uint64_t)self);
  return self->_token != 0;
}

- (NSString)token
{
  -[GEOAddressCorrectionInitRequest _readToken]((uint64_t)self);
  return self->_token;
}

- (void)setToken:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_token, a3);
}

- (void)_readPersonID
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(_BYTE *)(a1 + 48) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAddressCorrectionInitRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPersonID_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasPersonID
{
  -[GEOAddressCorrectionInitRequest _readPersonID]((uint64_t)self);
  return self->_personID != 0;
}

- (NSString)personID
{
  -[GEOAddressCorrectionInitRequest _readPersonID]((uint64_t)self);
  return self->_personID;
}

- (void)setPersonID:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_personID, a3);
}

- (BOOL)supportsMultipleAddresses
{
  return self->_supportsMultipleAddresses;
}

- (void)setSupportsMultipleAddresses:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x12u;
  self->_supportsMultipleAddresses = a3;
}

- (void)setHasSupportsMultipleAddresses:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 18;
  else
    v3 = 16;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasSupportsMultipleAddresses
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (BOOL)supportsCollectionByRegion
{
  return self->_supportsCollectionByRegion;
}

- (void)setSupportsCollectionByRegion:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x11u;
  self->_supportsCollectionByRegion = a3;
}

- (void)setHasSupportsCollectionByRegion:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasSupportsCollectionByRegion
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
  v8.super_class = (Class)GEOAddressCorrectionInitRequest;
  -[GEOAddressCorrectionInitRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOAddressCorrectionInitRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_dictionaryRepresentation:(unsigned __int8 *)a1
{
  void *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;

  if (a1)
  {
    objc_msgSend(a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "token");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("token"));

    objc_msgSend(a1, "personID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("personID"));

    v5 = a1[48];
    if ((v5 & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a1[45]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKey:", v6, CFSTR("supportsMultipleAddresses"));

      v5 = a1[48];
    }
    if ((v5 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a1[44]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKey:", v7, CFSTR("supportsCollectionByRegion"));

    }
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (GEOAddressCorrectionInitRequest)initWithDictionary:(id)a3
{
  return (GEOAddressCorrectionInitRequest *)-[GEOAddressCorrectionInitRequest _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("token"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = (void *)objc_msgSend(v4, "copy");
        objc_msgSend(a1, "setToken:", v5);

      }
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("personID"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = (void *)objc_msgSend(v6, "copy");
        objc_msgSend(a1, "setPersonID:", v7);

      }
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("supportsMultipleAddresses"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setSupportsMultipleAddresses:", objc_msgSend(v8, "BOOLValue"));

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("supportsCollectionByRegion"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setSupportsCollectionByRegion:", objc_msgSend(v9, "BOOLValue"));

    }
  }

  return a1;
}

- (GEOAddressCorrectionInitRequest)initWithJSON:(id)a3
{
  return (GEOAddressCorrectionInitRequest *)-[GEOAddressCorrectionInitRequest _initWithDictionary:isJSON:](self, a3);
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
      v8 = (int *)&readAll__recursiveTag_92;
    else
      v8 = (int *)&readAll__nonRecursiveTag_93;
    GEOAddressCorrectionInitRequestReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOAddressCorrectionInitRequestIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOAddressCorrectionInitRequestReadAllFrom((uint64_t)self, a3, 0);
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
    -[GEOAddressCorrectionInitRequest readAll:](self, "readAll:", 0);
    if (self->_token)
      PBDataWriterWriteStringField();
    if (self->_personID)
      PBDataWriterWriteStringField();
    flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteBOOLField();
      flags = (char)self->_flags;
    }
    if ((flags & 1) != 0)
      PBDataWriterWriteBOOLField();
  }

}

- (unsigned)requestTypeCode
{
  return 53;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  char flags;
  id *v5;

  v5 = (id *)a3;
  -[GEOAddressCorrectionInitRequest readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 8) = self->_readerMarkPos;
  *((_DWORD *)v5 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_token)
    objc_msgSend(v5, "setToken:");
  if (self->_personID)
    objc_msgSend(v5, "setPersonID:");
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_BYTE *)v5 + 45) = self->_supportsMultipleAddresses;
    *((_BYTE *)v5 + 48) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *((_BYTE *)v5 + 44) = self->_supportsCollectionByRegion;
    *((_BYTE *)v5 + 48) |= 1u;
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
  uint64_t v11;
  void *v12;
  char flags;

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
      GEOAddressCorrectionInitRequestReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOAddressCorrectionInitRequest readAll:](self, "readAll:", 0);
  v9 = -[NSString copyWithZone:](self->_token, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  v11 = -[NSString copyWithZone:](self->_personID, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v11;

  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_BYTE *)(v5 + 45) = self->_supportsMultipleAddresses;
    *(_BYTE *)(v5 + 48) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *(_BYTE *)(v5 + 44) = self->_supportsCollectionByRegion;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *token;
  NSString *personID;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  -[GEOAddressCorrectionInitRequest readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  token = self->_token;
  if ((unint64_t)token | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](token, "isEqual:"))
      goto LABEL_16;
  }
  personID = self->_personID;
  if ((unint64_t)personID | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](personID, "isEqual:"))
      goto LABEL_16;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 2) == 0)
      goto LABEL_16;
    if (self->_supportsMultipleAddresses)
    {
      if (!*((_BYTE *)v4 + 45))
        goto LABEL_16;
    }
    else if (*((_BYTE *)v4 + 45))
    {
      goto LABEL_16;
    }
  }
  else if ((*((_BYTE *)v4 + 48) & 2) != 0)
  {
    goto LABEL_16;
  }
  v7 = (*((_BYTE *)v4 + 48) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) != 0)
    {
      if (self->_supportsCollectionByRegion)
      {
        if (!*((_BYTE *)v4 + 44))
          goto LABEL_16;
      }
      else if (*((_BYTE *)v4 + 44))
      {
        goto LABEL_16;
      }
      v7 = 1;
      goto LABEL_17;
    }
LABEL_16:
    v7 = 0;
  }
LABEL_17:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;

  -[GEOAddressCorrectionInitRequest readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_token, "hash");
  v4 = -[NSString hash](self->_personID, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v5 = 2654435761 * self->_supportsMultipleAddresses;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v6 = 2654435761 * self->_supportsCollectionByRegion;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  char v5;
  _QWORD *v6;

  v6 = a3;
  objc_msgSend(v6, "readAll:", 0);
  v4 = v6;
  if (v6[3])
  {
    -[GEOAddressCorrectionInitRequest setToken:](self, "setToken:");
    v4 = v6;
  }
  if (v4[2])
  {
    -[GEOAddressCorrectionInitRequest setPersonID:](self, "setPersonID:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 48);
  if ((v5 & 2) != 0)
  {
    self->_supportsMultipleAddresses = *((_BYTE *)v4 + 45);
    *(_BYTE *)&self->_flags |= 2u;
    v5 = *((_BYTE *)v4 + 48);
  }
  if ((v5 & 1) != 0)
  {
    self->_supportsCollectionByRegion = *((_BYTE *)v4 + 44);
    *(_BYTE *)&self->_flags |= 1u;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_personID, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
