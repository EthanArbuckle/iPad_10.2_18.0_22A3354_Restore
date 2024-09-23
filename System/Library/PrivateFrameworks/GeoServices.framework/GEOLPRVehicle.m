@implementation GEOLPRVehicle

- (GEOLPRVehicle)init
{
  GEOLPRVehicle *v2;
  GEOLPRVehicle *v3;
  GEOLPRVehicle *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOLPRVehicle;
  v2 = -[GEOLPRVehicle init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLPRVehicle)initWithData:(id)a3
{
  GEOLPRVehicle *v3;
  GEOLPRVehicle *v4;
  GEOLPRVehicle *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOLPRVehicle;
  v3 = -[GEOLPRVehicle initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (NSString)name
{
  PBDataReader *reader;
  PBDataReader *v4;

  if (self)
  {
    os_unfair_lock_lock(&self->_readerLock);
    if ((*(_BYTE *)&self->_flags & 2) == 0)
    {
      reader = self->_reader;
      if (reader)
      {
        v4 = reader;
        objc_sync_enter(v4);
        GEOLPRVehicleReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&_readName_tags_18);
        objc_sync_exit(v4);

      }
    }
    os_unfair_lock_unlock(&self->_readerLock);
  }
  return self->_name;
}

- (void)setName:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x12u;
  objc_storeStrong((id *)&self->_name, a3);
}

- (void)_readPowerTypeKey
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 60) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLPRVehicleReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPowerTypeKey_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasPowerTypeKey
{
  -[GEOLPRVehicle _readPowerTypeKey]((uint64_t)self);
  return self->_powerTypeKey != 0;
}

- (NSString)powerTypeKey
{
  -[GEOLPRVehicle _readPowerTypeKey]((uint64_t)self);
  return self->_powerTypeKey;
}

- (void)setPowerTypeKey:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_powerTypeKey, a3);
}

- (void)_readVehicleTypeKey
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 60) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLPRVehicleReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readVehicleTypeKey_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasVehicleTypeKey
{
  -[GEOLPRVehicle _readVehicleTypeKey]((uint64_t)self);
  return self->_vehicleTypeKey != 0;
}

- (NSString)vehicleTypeKey
{
  -[GEOLPRVehicle _readVehicleTypeKey]((uint64_t)self);
  return self->_vehicleTypeKey;
}

- (void)setVehicleTypeKey:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_vehicleTypeKey, a3);
}

- (void)_readLicensePlate
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 60) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLPRVehicleReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLicensePlate_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasLicensePlate
{
  -[GEOLPRVehicle _readLicensePlate]((uint64_t)self);
  return self->_licensePlate != 0;
}

- (NSString)licensePlate
{
  -[GEOLPRVehicle _readLicensePlate]((uint64_t)self);
  return self->_licensePlate;
}

- (void)setLicensePlate:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x11u;
  objc_storeStrong((id *)&self->_licensePlate, a3);
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
  v8.super_class = (Class)GEOLPRVehicle;
  -[GEOLPRVehicle description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLPRVehicle dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLPRVehicle _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;

  if (a1)
  {
    objc_msgSend(a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("name"));

    objc_msgSend(a1, "powerTypeKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      if (a2)
        v7 = CFSTR("powerTypeKey");
      else
        v7 = CFSTR("power_type_key");
      objc_msgSend(v4, "setObject:forKey:", v6, v7);
    }

    objc_msgSend(a1, "vehicleTypeKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if (a2)
        v9 = CFSTR("vehicleTypeKey");
      else
        v9 = CFSTR("vehicle_type_key");
      objc_msgSend(v4, "setObject:forKey:", v8, v9);
    }

    objc_msgSend(a1, "licensePlate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      if (a2)
        v11 = CFSTR("licensePlate");
      else
        v11 = CFSTR("license_plate");
      objc_msgSend(v4, "setObject:forKey:", v10, v11);
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
  return -[GEOLPRVehicle _dictionaryRepresentation:](self, 1);
}

- (GEOLPRVehicle)initWithDictionary:(id)a3
{
  return (GEOLPRVehicle *)-[GEOLPRVehicle _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("name"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = (void *)objc_msgSend(v6, "copy");
        objc_msgSend(a1, "setName:", v7);

      }
      if (a3)
        v8 = CFSTR("powerTypeKey");
      else
        v8 = CFSTR("power_type_key");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = (void *)objc_msgSend(v9, "copy");
        objc_msgSend(a1, "setPowerTypeKey:", v10);

      }
      if (a3)
        v11 = CFSTR("vehicleTypeKey");
      else
        v11 = CFSTR("vehicle_type_key");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = (void *)objc_msgSend(v12, "copy");
        objc_msgSend(a1, "setVehicleTypeKey:", v13);

      }
      if (a3)
        v14 = CFSTR("licensePlate");
      else
        v14 = CFSTR("license_plate");
      objc_msgSend(v5, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = (void *)objc_msgSend(v15, "copy");
        objc_msgSend(a1, "setLicensePlate:", v16);

      }
    }
  }

  return a1;
}

- (GEOLPRVehicle)initWithJSON:(id)a3
{
  return (GEOLPRVehicle *)-[GEOLPRVehicle _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_84;
    else
      v8 = (int *)&readAll__nonRecursiveTag_84;
    GEOLPRVehicleReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLPRVehicleIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLPRVehicleReadAllFrom((uint64_t)self, a3, 0);
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
    if ((*(_BYTE *)&self->_flags & 0x1F) == 0)
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
  -[GEOLPRVehicle readAll:](self, "readAll:", 0);
  PBDataWriterWriteStringField();
  if (self->_powerTypeKey)
    PBDataWriterWriteStringField();
  if (self->_vehicleTypeKey)
    PBDataWriterWriteStringField();
  v5 = v8;
  if (self->_licensePlate)
  {
    PBDataWriterWriteStringField();
LABEL_10:
    v5 = v8;
  }

}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEOLPRVehicle readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 12) = self->_readerMarkPos;
  *((_DWORD *)v5 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  objc_msgSend(v5, "setName:", self->_name);
  if (self->_powerTypeKey)
    objc_msgSend(v5, "setPowerTypeKey:");
  if (self->_vehicleTypeKey)
    objc_msgSend(v5, "setVehicleTypeKey:");
  v4 = v5;
  if (self->_licensePlate)
  {
    objc_msgSend(v5, "setLicensePlate:");
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
  void *v13;
  uint64_t v14;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
    goto LABEL_5;
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOLPRVehicle readAll:](self, "readAll:", 0);
    v8 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
    v9 = (void *)v5[3];
    v5[3] = v8;

    v10 = -[NSString copyWithZone:](self->_powerTypeKey, "copyWithZone:", a3);
    v11 = (void *)v5[4];
    v5[4] = v10;

    v12 = -[NSString copyWithZone:](self->_vehicleTypeKey, "copyWithZone:", a3);
    v13 = (void *)v5[5];
    v5[5] = v12;

    v14 = -[NSString copyWithZone:](self->_licensePlate, "copyWithZone:", a3);
    v7 = (PBDataReader *)v5[2];
    v5[2] = v14;
    goto LABEL_6;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOLPRVehicleReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *name;
  NSString *powerTypeKey;
  NSString *vehicleTypeKey;
  NSString *licensePlate;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOLPRVehicle readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         name = self->_name,
         !((unint64_t)name | v4[3]))
     || -[NSString isEqual:](name, "isEqual:"))
    && ((powerTypeKey = self->_powerTypeKey, !((unint64_t)powerTypeKey | v4[4]))
     || -[NSString isEqual:](powerTypeKey, "isEqual:"))
    && ((vehicleTypeKey = self->_vehicleTypeKey, !((unint64_t)vehicleTypeKey | v4[5]))
     || -[NSString isEqual:](vehicleTypeKey, "isEqual:")))
  {
    licensePlate = self->_licensePlate;
    if ((unint64_t)licensePlate | v4[2])
      v9 = -[NSString isEqual:](licensePlate, "isEqual:");
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

  -[GEOLPRVehicle readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_name, "hash");
  v4 = -[NSString hash](self->_powerTypeKey, "hash") ^ v3;
  v5 = -[NSString hash](self->_vehicleTypeKey, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_licensePlate, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if (v4[3])
    -[GEOLPRVehicle setName:](self, "setName:");
  if (v4[4])
    -[GEOLPRVehicle setPowerTypeKey:](self, "setPowerTypeKey:");
  if (v4[5])
    -[GEOLPRVehicle setVehicleTypeKey:](self, "setVehicleTypeKey:");
  if (v4[2])
    -[GEOLPRVehicle setLicensePlate:](self, "setLicensePlate:");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleTypeKey, 0);
  objc_storeStrong((id *)&self->_powerTypeKey, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_licensePlate, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
