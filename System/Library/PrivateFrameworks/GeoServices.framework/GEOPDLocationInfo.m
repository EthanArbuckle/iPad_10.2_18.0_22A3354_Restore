@implementation GEOPDLocationInfo

- (GEOPDLocationInfo)init
{
  GEOPDLocationInfo *v2;
  GEOPDLocationInfo *v3;
  GEOPDLocationInfo *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDLocationInfo;
  v2 = -[GEOPDLocationInfo init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDLocationInfo)initWithData:(id)a3
{
  GEOPDLocationInfo *v3;
  GEOPDLocationInfo *v4;
  GEOPDLocationInfo *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDLocationInfo;
  v3 = -[GEOPDLocationInfo initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readLocationName
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
        GEOPDLocationInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLocationName_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasLocationName
{
  -[GEOPDLocationInfo _readLocationName]((uint64_t)self);
  return self->_locationName != 0;
}

- (NSString)locationName
{
  -[GEOPDLocationInfo _readLocationName]((uint64_t)self);
  return self->_locationName;
}

- (void)setLocationName:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xAu;
  objc_storeStrong((id *)&self->_locationName, a3);
}

- (void)_readSecondaryLocationName
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
        GEOPDLocationInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSecondaryLocationName_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasSecondaryLocationName
{
  -[GEOPDLocationInfo _readSecondaryLocationName]((uint64_t)self);
  return self->_secondaryLocationName != 0;
}

- (NSString)secondaryLocationName
{
  -[GEOPDLocationInfo _readSecondaryLocationName]((uint64_t)self);
  return self->_secondaryLocationName;
}

- (void)setSecondaryLocationName:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_secondaryLocationName, a3);
}

- (void)_readLocalityName
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
        GEOPDLocationInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLocalityName_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasLocalityName
{
  -[GEOPDLocationInfo _readLocalityName]((uint64_t)self);
  return self->_localityName != 0;
}

- (NSString)localityName
{
  -[GEOPDLocationInfo _readLocalityName]((uint64_t)self);
  return self->_localityName;
}

- (void)setLocalityName:(id)a3
{
  *(_BYTE *)&self->_flags |= 9u;
  objc_storeStrong((id *)&self->_localityName, a3);
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
  v8.super_class = (Class)GEOPDLocationInfo;
  -[GEOPDLocationInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDLocationInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDLocationInfo _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;

  if (a1)
  {
    objc_msgSend(a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "locationName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      if (a2)
        v6 = CFSTR("locationName");
      else
        v6 = CFSTR("location_name");
      objc_msgSend(v4, "setObject:forKey:", v5, v6);
    }

    objc_msgSend(a1, "secondaryLocationName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      if (a2)
        v8 = CFSTR("secondaryLocationName");
      else
        v8 = CFSTR("secondary_location_name");
      objc_msgSend(v4, "setObject:forKey:", v7, v8);
    }

    objc_msgSend(a1, "localityName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if (a2)
        v10 = CFSTR("localityName");
      else
        v10 = CFSTR("locality_name");
      objc_msgSend(v4, "setObject:forKey:", v9, v10);
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
  return -[GEOPDLocationInfo _dictionaryRepresentation:](self, 1);
}

- (GEOPDLocationInfo)initWithDictionary:(id)a3
{
  return (GEOPDLocationInfo *)-[GEOLocationInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (GEOPDLocationInfo)initWithJSON:(id)a3
{
  return (GEOPDLocationInfo *)-[GEOLocationInfo _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_249_0;
    else
      v8 = (int *)&readAll__nonRecursiveTag_250_0;
    GEOPDLocationInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDLocationInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDLocationInfoReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0xF) == 0))
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
    -[GEOPDLocationInfo readAll:](self, "readAll:", 0);
    if (self->_locationName)
      PBDataWriterWriteStringField();
    if (self->_secondaryLocationName)
      PBDataWriterWriteStringField();
    if (self->_localityName)
      PBDataWriterWriteStringField();
  }

}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEOPDLocationInfo readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 10) = self->_readerMarkPos;
  *((_DWORD *)v5 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_locationName)
    objc_msgSend(v5, "setLocationName:");
  if (self->_secondaryLocationName)
    objc_msgSend(v5, "setSecondaryLocationName:");
  v4 = v5;
  if (self->_localityName)
  {
    objc_msgSend(v5, "setLocalityName:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  PBDataReader *reader;
  PBDataReader *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

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
    -[GEOPDLocationInfo readAll:](self, "readAll:", 0);
    v8 = -[NSString copyWithZone:](self->_locationName, "copyWithZone:", a3);
    v9 = (void *)v5[3];
    v5[3] = v8;

    v10 = -[NSString copyWithZone:](self->_secondaryLocationName, "copyWithZone:", a3);
    v11 = (void *)v5[4];
    v5[4] = v10;

    v12 = -[NSString copyWithZone:](self->_localityName, "copyWithZone:", a3);
    v7 = (PBDataReader *)v5[2];
    v5[2] = v12;
    goto LABEL_6;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOPDLocationInfoReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *locationName;
  NSString *secondaryLocationName;
  NSString *localityName;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOPDLocationInfo readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         locationName = self->_locationName,
         !((unint64_t)locationName | v4[3]))
     || -[NSString isEqual:](locationName, "isEqual:"))
    && ((secondaryLocationName = self->_secondaryLocationName, !((unint64_t)secondaryLocationName | v4[4]))
     || -[NSString isEqual:](secondaryLocationName, "isEqual:")))
  {
    localityName = self->_localityName;
    if ((unint64_t)localityName | v4[2])
      v8 = -[NSString isEqual:](localityName, "isEqual:");
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
  NSUInteger v3;
  NSUInteger v4;

  -[GEOPDLocationInfo readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_locationName, "hash");
  v4 = -[NSString hash](self->_secondaryLocationName, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_localityName, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if (v4[3])
    -[GEOPDLocationInfo setLocationName:](self, "setLocationName:");
  if (v4[4])
    -[GEOPDLocationInfo setSecondaryLocationName:](self, "setSecondaryLocationName:");
  if (v4[2])
    -[GEOPDLocationInfo setLocalityName:](self, "setLocalityName:");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryLocationName, 0);
  objc_storeStrong((id *)&self->_locationName, 0);
  objc_storeStrong((id *)&self->_localityName, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
