@implementation GEOPDContainmentPlace

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containmentLine, 0);
  objc_storeStrong((id *)&self->_containerId, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOPDContainmentPlace)init
{
  GEOPDContainmentPlace *v2;
  GEOPDContainmentPlace *v3;
  GEOPDContainmentPlace *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDContainmentPlace;
  v2 = -[GEOPDContainmentPlace init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
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
  if (!self->_reader
    || (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0xA) != 0)
    || (*(_BYTE *)&self->_flags & 4) != 0
    && (GEOFormattedStringIsDirty((os_unfair_lock_s *)self->_containmentLine) & 1) != 0)
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDContainmentPlace readAll:]((uint64_t)self, 0);
    if (self->_containerId)
      PBDataWriterWriteSubmessage();
    v5 = v8;
    if (self->_containmentLine)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }
  else
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

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
    goto LABEL_5;
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDContainmentPlace readAll:]((uint64_t)self, 0);
    v8 = -[GEOPDMapsIdentifier copyWithZone:](self->_containerId, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v8;

    v10 = -[GEOFormattedString copyWithZone:](self->_containmentLine, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v10;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOPDContainmentPlaceReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (id)containerId
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDContainmentPlace _readContainerId]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (void)_readContainerId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 52) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDContainmentPlaceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readContainerId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_2659;
      else
        v6 = (int *)&readAll__nonRecursiveTag_2660;
      GEOPDContainmentPlaceReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
    {
      objc_msgSend(*(id *)(a1 + 24), "readAll:", 1);
      objc_msgSend(*(id *)(a1 + 32), "readAll:", 1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)dictionaryRepresentation
{
  return -[GEOPDContainmentPlace _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)containmentLine
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDContainmentPlace _readContainmentLine]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (void)_readContainmentLine
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 52) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDContainmentPlaceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readContainmentLine_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
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
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v20[4];
  id v21;

  if (!a1)
    return 0;
  -[GEOPDContainmentPlace readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDContainmentPlace containerId]((id *)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("containerId");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("container_id");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  -[GEOPDContainmentPlace containmentLine]((id *)a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v9, "jsonRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("containmentLine");
    }
    else
    {
      objc_msgSend(v9, "dictionaryRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("containment_line");
    }
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

  }
  v13 = *(void **)(a1 + 16);
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
      v20[2] = __51__GEOPDContainmentPlace__dictionaryRepresentation___block_invoke;
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

- (GEOPDContainmentPlace)initWithData:(id)a3
{
  GEOPDContainmentPlace *v3;
  GEOPDContainmentPlace *v4;
  GEOPDContainmentPlace *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDContainmentPlace;
  v3 = -[GEOPDContainmentPlace initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
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
  v8.super_class = (Class)GEOPDContainmentPlace;
  -[GEOPDContainmentPlace description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDContainmentPlace dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)jsonRepresentation
{
  return -[GEOPDContainmentPlace _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __51__GEOPDContainmentPlace__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)readFrom:(id)a3
{
  return GEOPDContainmentPlaceReadAllFrom((uint64_t)self, a3, 0);
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEOPDMapsIdentifier *containerId;
  GEOFormattedString *containmentLine;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOPDContainmentPlace readAll:]((uint64_t)self, 1),
         -[GEOPDContainmentPlace readAll:]((uint64_t)v4, 1),
         containerId = self->_containerId,
         !((unint64_t)containerId | v4[3]))
     || -[GEOPDMapsIdentifier isEqual:](containerId, "isEqual:")))
  {
    containmentLine = self->_containmentLine;
    if ((unint64_t)containmentLine | v4[4])
      v7 = -[GEOFormattedString isEqual:](containmentLine, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;

  -[GEOPDContainmentPlace readAll:]((uint64_t)self, 1);
  v3 = -[GEOPDMapsIdentifier hash](self->_containerId, "hash");
  return -[GEOFormattedString hash](self->_containmentLine, "hash") ^ v3;
}

@end
