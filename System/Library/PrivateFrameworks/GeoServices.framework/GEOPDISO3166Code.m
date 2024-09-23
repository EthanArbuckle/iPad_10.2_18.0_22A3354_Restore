@implementation GEOPDISO3166Code

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subdivisonCode, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOPDISO3166Code)init
{
  GEOPDISO3166Code *v2;
  GEOPDISO3166Code *v3;
  GEOPDISO3166Code *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDISO3166Code;
  v2 = -[GEOPDISO3166Code init](&v6, sel_init);
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
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x3C) == 0))
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
    -[GEOPDISO3166Code readAll:]((uint64_t)self, 0);
    if (self->_location)
      PBDataWriterWriteSubmessage();
    v5 = v8;
    if (self->_countryCode)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if (self->_subdivisonCode)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if ((*(_BYTE *)&self->_flags & 1) != 0)
    {
      PBDataWriterWriteBOOLField();
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
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  PBUnknownFields *v15;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x20) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDISO3166CodeReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDISO3166Code readAll:]((uint64_t)self, 0);
  v9 = -[GEOLatLngE7 copyWithZone:](self->_location, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v9;

  v11 = -[NSString copyWithZone:](self->_countryCode, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v11;

  v13 = -[NSString copyWithZone:](self->_subdivisonCode, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v13;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_BYTE *)(v5 + 60) = self->_isDisputed;
    *(_BYTE *)(v5 + 64) |= 1u;
  }
  v15 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v15;
LABEL_8:

  return (id)v5;
}

- (id)subdivisonCode
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDISO3166Code _readSubdivisonCode]((uint64_t)a1);
    a1 = (id *)v1[5];
  }
  return a1;
}

- (id)countryCode
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDISO3166Code _readCountryCode]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_4452;
      else
        v6 = (int *)&readAll__nonRecursiveTag_4453;
      GEOPDISO3166CodeReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      objc_msgSend(*(id *)(a1 + 32), "readAll:", 1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)location
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDISO3166Code _readLocation]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDISO3166Code _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (void)_readSubdivisonCode
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 64) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDISO3166CodeReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSubdivisonCode_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (void)_readLocation
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 64) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDISO3166CodeReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLocation_tags_6);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (void)_readCountryCode
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 64) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDISO3166CodeReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCountryCode_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
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
  -[GEOPDISO3166Code readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDISO3166Code location]((id *)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v5, "jsonRepresentation");
    else
      objc_msgSend(v5, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("location"));

  }
  -[GEOPDISO3166Code countryCode]((id *)a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (a2)
      v9 = CFSTR("countryCode");
    else
      v9 = CFSTR("country_code");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);
  }

  -[GEOPDISO3166Code subdivisonCode]((id *)a1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (a2)
      v11 = CFSTR("subdivisonCode");
    else
      v11 = CFSTR("subdivison_code");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);
  }

  if ((*(_BYTE *)(a1 + 64) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 60));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v13 = CFSTR("isDisputed");
    else
      v13 = CFSTR("is_disputed");
    objc_msgSend(v4, "setObject:forKey:", v12, v13);

  }
  v14 = *(void **)(a1 + 16);
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
      v21[2] = __46__GEOPDISO3166Code__dictionaryRepresentation___block_invoke;
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

- (GEOPDISO3166Code)initWithData:(id)a3
{
  GEOPDISO3166Code *v3;
  GEOPDISO3166Code *v4;
  GEOPDISO3166Code *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDISO3166Code;
  v3 = -[GEOPDISO3166Code initWithData:](&v7, sel_initWithData_, a3);
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
  v8.super_class = (Class)GEOPDISO3166Code;
  -[GEOPDISO3166Code description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDISO3166Code dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)jsonRepresentation
{
  return -[GEOPDISO3166Code _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __46__GEOPDISO3166Code__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDISO3166CodeReadAllFrom((uint64_t)self, a3, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOLatLngE7 *location;
  NSString *countryCode;
  NSString *subdivisonCode;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  -[GEOPDISO3166Code readAll:]((uint64_t)self, 1);
  -[GEOPDISO3166Code readAll:]((uint64_t)v4, 1);
  location = self->_location;
  if ((unint64_t)location | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOLatLngE7 isEqual:](location, "isEqual:"))
      goto LABEL_10;
  }
  countryCode = self->_countryCode;
  if ((unint64_t)countryCode | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](countryCode, "isEqual:"))
      goto LABEL_10;
  }
  subdivisonCode = self->_subdivisonCode;
  if ((unint64_t)subdivisonCode | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](subdivisonCode, "isEqual:"))
      goto LABEL_10;
  }
  v8 = (*((_BYTE *)v4 + 64) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0)
    {
LABEL_10:
      v8 = 0;
      goto LABEL_11;
    }
    if (self->_isDisputed)
    {
      if (!*((_BYTE *)v4 + 60))
        goto LABEL_10;
    }
    else if (*((_BYTE *)v4 + 60))
    {
      goto LABEL_10;
    }
    v8 = 1;
  }
LABEL_11:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;

  -[GEOPDISO3166Code readAll:]((uint64_t)self, 1);
  v3 = -[GEOLatLngE7 hash](self->_location, "hash");
  v4 = -[NSString hash](self->_countryCode, "hash");
  v5 = -[NSString hash](self->_subdivisonCode, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v6 = 2654435761 * self->_isDisputed;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6;
}

@end
