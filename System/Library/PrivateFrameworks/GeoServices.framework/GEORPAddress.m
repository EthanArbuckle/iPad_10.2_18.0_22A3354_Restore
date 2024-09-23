@implementation GEORPAddress

- (GEORPAddress)init
{
  GEORPAddress *v2;
  GEORPAddress *v3;
  GEORPAddress *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPAddress;
  v2 = -[GEORPAddress init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPAddress)initWithData:(id)a3
{
  GEORPAddress *v3;
  GEORPAddress *v4;
  GEORPAddress *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPAddress;
  v3 = -[GEORPAddress initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readGeoAddress
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
        GEORPAddressReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readGeoAddress_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasGeoAddress
{
  -[GEORPAddress _readGeoAddress]((uint64_t)self);
  return self->_geoAddress != 0;
}

- (GEOAddress)geoAddress
{
  -[GEORPAddress _readGeoAddress]((uint64_t)self);
  return self->_geoAddress;
}

- (void)setGeoAddress:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_geoAddress, a3);
}

- (void)_readAddressString
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
        GEORPAddressReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAddressString_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasAddressString
{
  -[GEORPAddress _readAddressString]((uint64_t)self);
  return self->_addressString != 0;
}

- (NSString)addressString
{
  -[GEORPAddress _readAddressString]((uint64_t)self);
  return self->_addressString;
}

- (void)setAddressString:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xAu;
  objc_storeStrong((id *)&self->_addressString, a3);
}

- (void)_readAddressObject
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 52) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPAddressReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAddressObject_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasAddressObject
{
  -[GEORPAddress _readAddressObject]((uint64_t)self);
  return self->_addressObject != 0;
}

- (GEOPDAddressObject)addressObject
{
  -[GEORPAddress _readAddressObject]((uint64_t)self);
  return self->_addressObject;
}

- (void)setAddressObject:(id)a3
{
  *(_BYTE *)&self->_flags |= 9u;
  objc_storeStrong((id *)&self->_addressObject, a3);
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
  v8.super_class = (Class)GEORPAddress;
  -[GEORPAddress description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPAddress dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPAddress _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;

  if (a1)
  {
    objc_msgSend(a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "geoAddress");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v5, "jsonRepresentation");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = CFSTR("geoAddress");
      }
      else
      {
        objc_msgSend(v5, "dictionaryRepresentation");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = CFSTR("geo_address");
      }
      objc_msgSend(v4, "setObject:forKey:", v7, v8);

    }
    objc_msgSend(a1, "addressString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if (a2)
        v10 = CFSTR("addressString");
      else
        v10 = CFSTR("address_string");
      objc_msgSend(v4, "setObject:forKey:", v9, v10);
    }

    objc_msgSend(a1, "addressObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v11, "jsonRepresentation");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = CFSTR("addressObject");
      }
      else
      {
        objc_msgSend(v11, "dictionaryRepresentation");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = CFSTR("address_object");
      }
      objc_msgSend(v4, "setObject:forKey:", v13, v14);

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPAddress _dictionaryRepresentation:](self, 1);
}

- (GEORPAddress)initWithDictionary:(id)a3
{
  return (GEORPAddress *)-[GEORPAddress _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  GEOAddress *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  GEOPDAddressObject *v16;
  void *v17;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("geoAddress");
      else
        v6 = CFSTR("geo_address");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = [GEOAddress alloc];
        if ((a3 & 1) != 0)
          v9 = -[GEOAddress initWithJSON:](v8, "initWithJSON:", v7);
        else
          v9 = -[GEOAddress initWithDictionary:](v8, "initWithDictionary:", v7);
        v10 = (void *)v9;
        objc_msgSend(a1, "setGeoAddress:", v9);

      }
      if (a3)
        v11 = CFSTR("addressString");
      else
        v11 = CFSTR("address_string");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = (void *)objc_msgSend(v12, "copy");
        objc_msgSend(a1, "setAddressString:", v13);

      }
      if (a3)
        v14 = CFSTR("addressObject");
      else
        v14 = CFSTR("address_object");
      objc_msgSend(v5, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = [GEOPDAddressObject alloc];
        if (v16)
          v17 = -[GEOPDAddressObject _initWithDictionary:isJSON:](v16, v15, a3);
        else
          v17 = 0;
        objc_msgSend(a1, "setAddressObject:", v17);

      }
    }
  }

  return a1;
}

- (GEORPAddress)initWithJSON:(id)a3
{
  return (GEORPAddress *)-[GEORPAddress _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_51;
    else
      v8 = (int *)&readAll__nonRecursiveTag_51;
    GEORPAddressReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    -[GEOAddress readAll:](self->_geoAddress, "readAll:", 1);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPAddressIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPAddressReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *v5;
  void *v6;
  id v7;

  v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPAddressIsDirty((uint64_t)self) & 1) == 0)
  {
    v5 = self->_reader;
    objc_sync_enter(v5);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "writeData:", v6);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v5);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEORPAddress readAll:](self, "readAll:", 0);
    if (self->_geoAddress)
      PBDataWriterWriteSubmessage();
    if (self->_addressString)
      PBDataWriterWriteStringField();
    if (self->_addressObject)
      PBDataWriterWriteSubmessage();
  }

}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEORPAddress readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 10) = self->_readerMarkPos;
  *((_DWORD *)v5 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_geoAddress)
    objc_msgSend(v5, "setGeoAddress:");
  if (self->_addressString)
    objc_msgSend(v5, "setAddressString:");
  v4 = v5;
  if (self->_addressObject)
  {
    objc_msgSend(v5, "setAddressObject:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
    -[GEORPAddress readAll:](self, "readAll:", 0);
    v8 = -[GEOAddress copyWithZone:](self->_geoAddress, "copyWithZone:", a3);
    v9 = (void *)v5[4];
    v5[4] = v8;

    v10 = -[NSString copyWithZone:](self->_addressString, "copyWithZone:", a3);
    v11 = (void *)v5[3];
    v5[3] = v10;

    v12 = -[GEOPDAddressObject copyWithZone:](self->_addressObject, "copyWithZone:", a3);
    v7 = (PBDataReader *)v5[2];
    v5[2] = v12;
    goto LABEL_6;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEORPAddressReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEOAddress *geoAddress;
  NSString *addressString;
  GEOPDAddressObject *addressObject;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEORPAddress readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         geoAddress = self->_geoAddress,
         !((unint64_t)geoAddress | v4[4]))
     || -[GEOAddress isEqual:](geoAddress, "isEqual:"))
    && ((addressString = self->_addressString, !((unint64_t)addressString | v4[3]))
     || -[NSString isEqual:](addressString, "isEqual:")))
  {
    addressObject = self->_addressObject;
    if ((unint64_t)addressObject | v4[2])
      v8 = -[GEOPDAddressObject isEqual:](addressObject, "isEqual:");
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
  NSUInteger v4;

  -[GEORPAddress readAll:](self, "readAll:", 1);
  v3 = -[GEOAddress hash](self->_geoAddress, "hash");
  v4 = -[NSString hash](self->_addressString, "hash") ^ v3;
  return v4 ^ -[GEOPDAddressObject hash](self->_addressObject, "hash");
}

- (void)mergeFrom:(id)a3
{
  GEOAddress *geoAddress;
  uint64_t v5;
  GEOPDAddressObject *addressObject;
  uint64_t v7;
  void *v8;
  _QWORD *v9;

  v9 = a3;
  objc_msgSend(v9, "readAll:", 0);
  geoAddress = self->_geoAddress;
  v5 = v9[4];
  if (geoAddress)
  {
    if (v5)
      -[GEOAddress mergeFrom:](geoAddress, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEORPAddress setGeoAddress:](self, "setGeoAddress:");
  }
  if (v9[3])
    -[GEORPAddress setAddressString:](self, "setAddressString:");
  addressObject = self->_addressObject;
  v7 = v9[2];
  if (addressObject)
  {
    if (v7)
    {
      v8 = *(void **)(v7 + 16);
      if (v8)
        -[GEOPDAddressObject setAddressObject:]((uint64_t)addressObject, v8);
    }
  }
  else if (v7)
  {
    -[GEORPAddress setAddressObject:](self, "setAddressObject:");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geoAddress, 0);
  objc_storeStrong((id *)&self->_addressString, 0);
  objc_storeStrong((id *)&self->_addressObject, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
