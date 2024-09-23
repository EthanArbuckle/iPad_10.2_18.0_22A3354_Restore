@implementation GEOBusinessResolutionRequest

- (GEOBusinessResolutionRequest)init
{
  GEOBusinessResolutionRequest *v2;
  GEOBusinessResolutionRequest *v3;
  GEOBusinessResolutionRequest *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOBusinessResolutionRequest;
  v2 = -[GEOBusinessResolutionRequest init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOBusinessResolutionRequest)initWithData:(id)a3
{
  GEOBusinessResolutionRequest *v3;
  GEOBusinessResolutionRequest *v4;
  GEOBusinessResolutionRequest *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOBusinessResolutionRequest;
  v3 = -[GEOBusinessResolutionRequest initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readShortBusinessName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(_BYTE *)(a1 + 44) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOBusinessResolutionRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readShortBusinessName_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasShortBusinessName
{
  -[GEOBusinessResolutionRequest _readShortBusinessName]((uint64_t)self);
  return self->_shortBusinessName != 0;
}

- (NSString)shortBusinessName
{
  -[GEOBusinessResolutionRequest _readShortBusinessName]((uint64_t)self);
  return self->_shortBusinessName;
}

- (void)setShortBusinessName:(id)a3
{
  *(_BYTE *)&self->_flags |= 6u;
  objc_storeStrong((id *)&self->_shortBusinessName, a3);
}

- (void)_readDeviceLocation
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(_BYTE *)(a1 + 44) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOBusinessResolutionRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDeviceLocation_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasDeviceLocation
{
  -[GEOBusinessResolutionRequest _readDeviceLocation]((uint64_t)self);
  return self->_deviceLocation != 0;
}

- (GEOLocation)deviceLocation
{
  -[GEOBusinessResolutionRequest _readDeviceLocation]((uint64_t)self);
  return self->_deviceLocation;
}

- (void)setDeviceLocation:(id)a3
{
  *(_BYTE *)&self->_flags |= 5u;
  objc_storeStrong((id *)&self->_deviceLocation, a3);
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
  v8.super_class = (Class)GEOBusinessResolutionRequest;
  -[GEOBusinessResolutionRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOBusinessResolutionRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOBusinessResolutionRequest _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a1)
  {
    objc_msgSend(a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "shortBusinessName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("shortBusinessName"));

    objc_msgSend(a1, "deviceLocation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v6, "jsonRepresentation");
      else
        objc_msgSend(v6, "dictionaryRepresentation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("deviceLocation"));

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
  return -[GEOBusinessResolutionRequest _dictionaryRepresentation:](self, 1);
}

- (GEOBusinessResolutionRequest)initWithDictionary:(id)a3
{
  return (GEOBusinessResolutionRequest *)-[GEOBusinessResolutionRequest _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  GEOLocation *v9;
  uint64_t v10;
  void *v11;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("shortBusinessName"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = (void *)objc_msgSend(v6, "copy");
        objc_msgSend(a1, "setShortBusinessName:", v7);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("deviceLocation"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = [GEOLocation alloc];
        if ((a3 & 1) != 0)
          v10 = -[GEOLocation initWithJSON:](v9, "initWithJSON:", v8);
        else
          v10 = -[GEOLocation initWithDictionary:](v9, "initWithDictionary:", v8);
        v11 = (void *)v10;
        objc_msgSend(a1, "setDeviceLocation:", v10);

      }
    }
  }

  return a1;
}

- (GEOBusinessResolutionRequest)initWithJSON:(id)a3
{
  return (GEOBusinessResolutionRequest *)-[GEOBusinessResolutionRequest _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_44;
    else
      v8 = (int *)&readAll__nonRecursiveTag_44;
    GEOBusinessResolutionRequestReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    -[GEOLocation readAll:](self->_deviceLocation, "readAll:", 1);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  int *v4;
  int *v5;
  int *v6;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  int v16;
  BOOL v18;

  objc_msgSend(a3, "position");
  objc_msgSend(a3, "length");
  v4 = (int *)MEMORY[0x1E0D82BF0];
  v5 = (int *)MEMORY[0x1E0D82BD8];
  v6 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*((_BYTE *)a3 + *v6))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v4;
        v12 = *(_QWORD *)((char *)a3 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)((char *)a3 + *v5))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v7) + v12);
        *(_QWORD *)((char *)a3 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((_BYTE *)a3 + *v6) = 1;
LABEL_12:
      v15 = *((unsigned __int8 *)a3 + *v6);
      if (*((_BYTE *)a3 + *v6))
        v10 = 0;
LABEL_14:
      v16 = v10 & 7;
      if (v15 || v16 == 4)
        break;
      if ((v10 >> 3) == 2)
      {
        if (v16 != 2 || !PBReaderPlaceMark() || !GEOLocationIsValid((char *)a3))
          goto LABEL_29;
        PBReaderRecallMark();
      }
      else if ((v10 >> 3) == 1 && v16 != 2 || (PBReaderSkipValueWithTag() & 1) == 0)
      {
LABEL_29:
        PBReaderRecallMark();
        return 0;
      }
    }
    while (*(_QWORD *)((char *)a3 + *v4) < *(_QWORD *)((char *)a3 + *v5));
  }
  v18 = *((_BYTE *)a3 + *v6) == 0;
  PBReaderRecallMark();
  return v18;
}

- (BOOL)readFrom:(id)a3
{
  return GEOBusinessResolutionRequestReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  void *v5;
  PBDataReader *v6;
  void *v7;
  id v8;

  v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_BYTE *)&self->_flags & 6) == 0
      && ((*(_BYTE *)&self->_flags & 1) == 0 || !GEOLocationIsDirty((os_unfair_lock_s *)self->_deviceLocation)))
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
      goto LABEL_10;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOBusinessResolutionRequest readAll:](self, "readAll:", 0);
  if (self->_shortBusinessName)
    PBDataWriterWriteStringField();
  v5 = v8;
  if (self->_deviceLocation)
  {
    PBDataWriterWriteSubmessage();
LABEL_10:
    v5 = v8;
  }

}

- (void)clearSensitiveFields:(unint64_t)a3
{
  void *v5;
  int HasSensitiveFields;
  void *v7;
  _DWORD *v8;

  if (-[GEOBusinessResolutionRequest hasDeviceLocation](self, "hasDeviceLocation")
    && (-[GEOBusinessResolutionRequest deviceLocation](self, "deviceLocation"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        HasSensitiveFields = GEOLocationHasSensitiveFields((uint64_t)v5),
        v5,
        HasSensitiveFields))
  {
    -[GEOBusinessResolutionRequest deviceLocation](self, "deviceLocation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (_DWORD *)objc_msgSend(v7, "copy");

    GEOLocationClearSensitiveFields(v8);
    -[GEOBusinessResolutionRequest setDeviceLocation:](self, "setDeviceLocation:", v8);
  }
  else
  {
    -[GEOBusinessResolutionRequest deviceLocation](self, "deviceLocation");
    v8 = (_DWORD *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "clearSensitiveFields:", a3);
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEOBusinessResolutionRequest _readDeviceLocation]((uint64_t)self);
  return -[GEOLocation hasGreenTeaWithValue:](self->_deviceLocation, "hasGreenTeaWithValue:", v3);
}

- (unsigned)requestTypeCode
{
  return 58;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  id *v4;

  v4 = (id *)a3;
  -[GEOBusinessResolutionRequest readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 8) = self->_readerMarkPos;
  *((_DWORD *)v4 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_shortBusinessName)
    objc_msgSend(v4, "setShortBusinessName:");
  if (self->_deviceLocation)
    objc_msgSend(v4, "setDeviceLocation:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  PBDataReader *reader;
  PBDataReader *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
    goto LABEL_5;
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOBusinessResolutionRequest readAll:](self, "readAll:", 0);
    v8 = -[NSString copyWithZone:](self->_shortBusinessName, "copyWithZone:", a3);
    v9 = (void *)v5[3];
    v5[3] = v8;

    v10 = -[GEOLocation copyWithZone:](self->_deviceLocation, "copyWithZone:", a3);
    v7 = (PBDataReader *)v5[2];
    v5[2] = v10;
    goto LABEL_6;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOBusinessResolutionRequestReadAllFrom((uint64_t)v5, self->_reader);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *shortBusinessName;
  GEOLocation *deviceLocation;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOBusinessResolutionRequest readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         shortBusinessName = self->_shortBusinessName,
         !((unint64_t)shortBusinessName | v4[3]))
     || -[NSString isEqual:](shortBusinessName, "isEqual:")))
  {
    deviceLocation = self->_deviceLocation;
    if ((unint64_t)deviceLocation | v4[2])
      v7 = -[GEOLocation isEqual:](deviceLocation, "isEqual:");
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
  NSUInteger v3;

  -[GEOBusinessResolutionRequest readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_shortBusinessName, "hash");
  return -[GEOLocation hash](self->_deviceLocation, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  GEOLocation *deviceLocation;
  uint64_t v5;
  _QWORD *v6;

  v6 = a3;
  objc_msgSend(v6, "readAll:", 0);
  if (v6[3])
    -[GEOBusinessResolutionRequest setShortBusinessName:](self, "setShortBusinessName:");
  deviceLocation = self->_deviceLocation;
  v5 = v6[2];
  if (deviceLocation)
  {
    if (v5)
      -[GEOLocation mergeFrom:](deviceLocation, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEOBusinessResolutionRequest setDeviceLocation:](self, "setDeviceLocation:");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortBusinessName, 0);
  objc_storeStrong((id *)&self->_deviceLocation, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
