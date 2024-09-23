@implementation GEOLPRInfo

- (GEOLPRInfo)init
{
  GEOLPRInfo *v2;
  GEOLPRInfo *v3;
  GEOLPRInfo *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOLPRInfo;
  v2 = -[GEOLPRInfo init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLPRInfo)initWithData:(id)a3
{
  GEOLPRInfo *v3;
  GEOLPRInfo *v4;
  GEOLPRInfo *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOLPRInfo;
  v3 = -[GEOLPRInfo initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readLicensePlate
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 80) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLPRInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLicensePlate_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasLicensePlate
{
  -[GEOLPRInfo _readLicensePlate]((uint64_t)self);
  return self->_licensePlate != 0;
}

- (NSString)licensePlate
{
  -[GEOLPRInfo _readLicensePlate]((uint64_t)self);
  return self->_licensePlate;
}

- (void)setLicensePlate:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x88u;
  objc_storeStrong((id *)&self->_licensePlate, a3);
}

- (void)_readVehicleTypeKey
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 80) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLPRInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readVehicleTypeKey_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasVehicleTypeKey
{
  -[GEOLPRInfo _readVehicleTypeKey]((uint64_t)self);
  return self->_vehicleTypeKey != 0;
}

- (NSString)vehicleTypeKey
{
  -[GEOLPRInfo _readVehicleTypeKey]((uint64_t)self);
  return self->_vehicleTypeKey;
}

- (void)setVehicleTypeKey:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_vehicleTypeKey, a3);
}

- (void)_readPowerTypeKey
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 80) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLPRInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPowerTypeKey_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasPowerTypeKey
{
  -[GEOLPRInfo _readPowerTypeKey]((uint64_t)self);
  return self->_powerTypeKey != 0;
}

- (NSString)powerTypeKey
{
  -[GEOLPRInfo _readPowerTypeKey]((uint64_t)self);
  return self->_powerTypeKey;
}

- (void)setPowerTypeKey:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x90u;
  objc_storeStrong((id *)&self->_powerTypeKey, a3);
}

- (void)_readVersionId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 80) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLPRInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readVersionId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasVersionId
{
  -[GEOLPRInfo _readVersionId]((uint64_t)self);
  return self->_versionId != 0;
}

- (NSData)versionId
{
  -[GEOLPRInfo _readVersionId]((uint64_t)self);
  return self->_versionId;
}

- (void)setVersionId:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_versionId, a3);
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_flags |= 0x81u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0x7E | a3 | 0x80;
}

- (BOOL)hasTimestamp
{
  return *(_BYTE *)&self->_flags & 1;
}

- (unsigned)maskedplateGeneratorValidatorVersion
{
  return self->_maskedplateGeneratorValidatorVersion;
}

- (void)setMaskedplateGeneratorValidatorVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 0x82u;
  self->_maskedplateGeneratorValidatorVersion = a3;
}

- (void)setHasMaskedplateGeneratorValidatorVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = -126;
  else
    v3 = 0x80;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasMaskedplateGeneratorValidatorVersion
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
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
  v8.super_class = (Class)GEOLPRInfo;
  -[GEOLPRInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLPRInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLPRInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  _QWORD v25[4];
  id v26;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "licensePlate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (a2)
      v6 = CFSTR("licensePlate");
    else
      v6 = CFSTR("license_plate");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);
  }

  objc_msgSend((id)a1, "vehicleTypeKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (a2)
      v8 = CFSTR("vehicleTypeKey");
    else
      v8 = CFSTR("vehicle_type_key");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);
  }

  objc_msgSend((id)a1, "powerTypeKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (a2)
      v10 = CFSTR("powerTypeKey");
    else
      v10 = CFSTR("power_type_key");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);
  }

  objc_msgSend((id)a1, "versionId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v11, "base64EncodedStringWithOptions:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("versionId"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("version_id"));
    }
  }

  v14 = *(_BYTE *)(a1 + 80);
  if ((v14 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 40));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("timestamp"));

    v14 = *(_BYTE *)(a1 + 80);
  }
  if ((v14 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 76));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v17 = CFSTR("maskedplateGeneratorValidatorVersion");
    else
      v17 = CFSTR("maskedplate_generator_validator_version");
    objc_msgSend(v4, "setObject:forKey:", v16, v17);

  }
  v18 = *(void **)(a1 + 16);
  if (v18)
  {
    objc_msgSend(v18, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v19, "count"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __40__GEOLPRInfo__dictionaryRepresentation___block_invoke;
      v25[3] = &unk_1E1C00600;
      v22 = v21;
      v26 = v22;
      objc_msgSend(v20, "enumerateKeysAndObjectsUsingBlock:", v25);
      v23 = v22;

      v20 = v23;
    }
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLPRInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __40__GEOLPRInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOLPRInfo)initWithDictionary:(id)a3
{
  return (GEOLPRInfo *)-[GEOLPRInfo _initWithDictionary:isJSON:](self, a3, 0);
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
  void *v18;
  const __CFString *v19;
  void *v20;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("licensePlate");
      else
        v6 = CFSTR("license_plate");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = (void *)objc_msgSend(v7, "copy");
        objc_msgSend(a1, "setLicensePlate:", v8);

      }
      if (a3)
        v9 = CFSTR("vehicleTypeKey");
      else
        v9 = CFSTR("vehicle_type_key");
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = (void *)objc_msgSend(v10, "copy");
        objc_msgSend(a1, "setVehicleTypeKey:", v11);

      }
      if (a3)
        v12 = CFSTR("powerTypeKey");
      else
        v12 = CFSTR("power_type_key");
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = (void *)objc_msgSend(v13, "copy");
        objc_msgSend(a1, "setPowerTypeKey:", v14);

      }
      if (a3)
        v15 = CFSTR("versionId");
      else
        v15 = CFSTR("version_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v16, 0);
        objc_msgSend(a1, "setVersionId:", v17);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("timestamp"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setTimestamp:", objc_msgSend(v18, "unsignedLongLongValue"));

      if (a3)
        v19 = CFSTR("maskedplateGeneratorValidatorVersion");
      else
        v19 = CFSTR("maskedplate_generator_validator_version");
      objc_msgSend(v5, "objectForKeyedSubscript:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setMaskedplateGeneratorValidatorVersion:", objc_msgSend(v20, "unsignedIntValue"));

    }
  }

  return a1;
}

- (GEOLPRInfo)initWithJSON:(id)a3
{
  return (GEOLPRInfo *)-[GEOLPRInfo _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_2856;
    else
      v8 = (int *)&readAll__nonRecursiveTag_2857;
    GEOLPRInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLPRInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLPRInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  char flags;
  PBDataReader *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), *(_BYTE *)&self->_flags <= 7u))
  {
    v7 = self->_reader;
    objc_sync_enter(v7);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "writeData:", v8);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOLPRInfo readAll:](self, "readAll:", 0);
    if (self->_licensePlate)
      PBDataWriterWriteStringField();
    v5 = v9;
    if (self->_vehicleTypeKey)
    {
      PBDataWriterWriteStringField();
      v5 = v9;
    }
    if (self->_powerTypeKey)
    {
      PBDataWriterWriteStringField();
      v5 = v9;
    }
    if (self->_versionId)
    {
      PBDataWriterWriteDataField();
      v5 = v9;
    }
    flags = (char)self->_flags;
    if ((flags & 1) != 0)
    {
      PBDataWriterWriteUint64Field();
      v5 = v9;
      flags = (char)self->_flags;
    }
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteUint32Field();
      v5 = v9;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (void)copyTo:(id)a3
{
  id *v4;
  char flags;
  id *v6;

  v6 = (id *)a3;
  -[GEOLPRInfo readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 16) = self->_readerMarkPos;
  *((_DWORD *)v6 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_licensePlate)
    objc_msgSend(v6, "setLicensePlate:");
  if (self->_vehicleTypeKey)
    objc_msgSend(v6, "setVehicleTypeKey:");
  v4 = v6;
  if (self->_powerTypeKey)
  {
    objc_msgSend(v6, "setPowerTypeKey:");
    v4 = v6;
  }
  if (self->_versionId)
  {
    objc_msgSend(v6, "setVersionId:");
    v4 = v6;
  }
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    v4[5] = (id)self->_timestamp;
    *((_BYTE *)v4 + 80) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v4 + 19) = self->_maskedplateGeneratorValidatorVersion;
    *((_BYTE *)v4 + 80) |= 2u;
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
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  char flags;
  PBUnknownFields *v18;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x80000000) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOLPRInfoReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOLPRInfo readAll:](self, "readAll:", 0);
  v9 = -[NSString copyWithZone:](self->_licensePlate, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  v11 = -[NSString copyWithZone:](self->_vehicleTypeKey, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v11;

  v13 = -[NSString copyWithZone:](self->_powerTypeKey, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v13;

  v15 = -[NSData copyWithZone:](self->_versionId, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v15;

  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 40) = self->_timestamp;
    *(_BYTE *)(v5 + 80) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 76) = self->_maskedplateGeneratorValidatorVersion;
    *(_BYTE *)(v5 + 80) |= 2u;
  }
  v18 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v18;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *licensePlate;
  NSString *vehicleTypeKey;
  NSString *powerTypeKey;
  NSData *versionId;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  -[GEOLPRInfo readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  licensePlate = self->_licensePlate;
  if ((unint64_t)licensePlate | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](licensePlate, "isEqual:"))
      goto LABEL_19;
  }
  vehicleTypeKey = self->_vehicleTypeKey;
  if ((unint64_t)vehicleTypeKey | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](vehicleTypeKey, "isEqual:"))
      goto LABEL_19;
  }
  powerTypeKey = self->_powerTypeKey;
  if ((unint64_t)powerTypeKey | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](powerTypeKey, "isEqual:"))
      goto LABEL_19;
  }
  versionId = self->_versionId;
  if ((unint64_t)versionId | *((_QWORD *)v4 + 7))
  {
    if (!-[NSData isEqual:](versionId, "isEqual:"))
      goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 5))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 80) & 1) != 0)
  {
LABEL_19:
    v9 = 0;
    goto LABEL_20;
  }
  v9 = (*((_BYTE *)v4 + 80) & 2) == 0;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 2) == 0 || self->_maskedplateGeneratorValidatorVersion != *((_DWORD *)v4 + 19))
      goto LABEL_19;
    v9 = 1;
  }
LABEL_20:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  -[GEOLPRInfo readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_licensePlate, "hash");
  v4 = -[NSString hash](self->_vehicleTypeKey, "hash");
  v5 = -[NSString hash](self->_powerTypeKey, "hash");
  v6 = -[NSData hash](self->_versionId, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v7 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
  v7 = 0;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v8 = 2654435761 * self->_maskedplateGeneratorValidatorVersion;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
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
    -[GEOLPRInfo setLicensePlate:](self, "setLicensePlate:");
    v4 = v6;
  }
  if (v4[6])
  {
    -[GEOLPRInfo setVehicleTypeKey:](self, "setVehicleTypeKey:");
    v4 = v6;
  }
  if (v4[4])
  {
    -[GEOLPRInfo setPowerTypeKey:](self, "setPowerTypeKey:");
    v4 = v6;
  }
  if (v4[7])
  {
    -[GEOLPRInfo setVersionId:](self, "setVersionId:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 80);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = v4[5];
    *(_BYTE *)&self->_flags |= 1u;
    v5 = *((_BYTE *)v4 + 80);
  }
  if ((v5 & 2) != 0)
  {
    self->_maskedplateGeneratorValidatorVersion = *((_DWORD *)v4 + 19);
    *(_BYTE *)&self->_flags |= 2u;
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOLPRInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_2860);
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
  *(_BYTE *)&self->_flags |= 0x84u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
    -[GEOLPRInfo readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versionId, 0);
  objc_storeStrong((id *)&self->_vehicleTypeKey, 0);
  objc_storeStrong((id *)&self->_powerTypeKey, 0);
  objc_storeStrong((id *)&self->_licensePlate, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
