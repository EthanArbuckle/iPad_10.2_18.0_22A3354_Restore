@implementation GEOLogMsgEventEVRoutingVehicleDetails

- (GEOLogMsgEventEVRoutingVehicleDetails)init
{
  GEOLogMsgEventEVRoutingVehicleDetails *v2;
  GEOLogMsgEventEVRoutingVehicleDetails *v3;
  GEOLogMsgEventEVRoutingVehicleDetails *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgEventEVRoutingVehicleDetails;
  v2 = -[GEOLogMsgEventEVRoutingVehicleDetails init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgEventEVRoutingVehicleDetails)initWithData:(id)a3
{
  GEOLogMsgEventEVRoutingVehicleDetails *v3;
  GEOLogMsgEventEVRoutingVehicleDetails *v4;
  GEOLogMsgEventEVRoutingVehicleDetails *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgEventEVRoutingVehicleDetails;
  v3 = -[GEOLogMsgEventEVRoutingVehicleDetails initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readMake
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(_BYTE *)(a1 + 52) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventEVRoutingVehicleDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMake_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasMake
{
  -[GEOLogMsgEventEVRoutingVehicleDetails _readMake]((uint64_t)self);
  return self->_make != 0;
}

- (NSString)make
{
  -[GEOLogMsgEventEVRoutingVehicleDetails _readMake]((uint64_t)self);
  return self->_make;
}

- (void)setMake:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_make, a3);
}

- (void)_readModel
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(_BYTE *)(a1 + 52) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventEVRoutingVehicleDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readModel_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasModel
{
  -[GEOLogMsgEventEVRoutingVehicleDetails _readModel]((uint64_t)self);
  return self->_model != 0;
}

- (NSString)model
{
  -[GEOLogMsgEventEVRoutingVehicleDetails _readModel]((uint64_t)self);
  return self->_model;
}

- (void)setModel:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_model, a3);
}

- (unsigned)batteryCapacity
{
  return self->_batteryCapacity;
}

- (void)setBatteryCapacity:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 0x11u;
  self->_batteryCapacity = a3;
}

- (void)setHasBatteryCapacity:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasBatteryCapacity
{
  return *(_BYTE *)&self->_flags & 1;
}

- (BOOL)towingNotSupported
{
  return self->_towingNotSupported;
}

- (void)setTowingNotSupported:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x12u;
  self->_towingNotSupported = a3;
}

- (void)setHasTowingNotSupported:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 18;
  else
    v3 = 16;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasTowingNotSupported
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
  v8.super_class = (Class)GEOLogMsgEventEVRoutingVehicleDetails;
  -[GEOLogMsgEventEVRoutingVehicleDetails description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgEventEVRoutingVehicleDetails dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventEVRoutingVehicleDetails _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "make");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("make"));

    objc_msgSend((id)a1, "model");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("model"));

    v7 = *(_BYTE *)(a1 + 52);
    if ((v7 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 44));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v9 = CFSTR("batteryCapacity");
      else
        v9 = CFSTR("battery_capacity");
      objc_msgSend(v4, "setObject:forKey:", v8, v9);

      v7 = *(_BYTE *)(a1 + 52);
    }
    if ((v7 & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v11 = CFSTR("towingNotSupported");
      else
        v11 = CFSTR("towing_not_supported");
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
  return -[GEOLogMsgEventEVRoutingVehicleDetails _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventEVRoutingVehicleDetails)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventEVRoutingVehicleDetails *)-[GEOLogMsgEventEVRoutingVehicleDetails _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("make"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = (void *)objc_msgSend(v6, "copy");
        objc_msgSend(a1, "setMake:", v7);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("model"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = (void *)objc_msgSend(v8, "copy");
        objc_msgSend(a1, "setModel:", v9);

      }
      if (a3)
        v10 = CFSTR("batteryCapacity");
      else
        v10 = CFSTR("battery_capacity");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setBatteryCapacity:", objc_msgSend(v11, "unsignedIntValue"));

      if (a3)
        v12 = CFSTR("towingNotSupported");
      else
        v12 = CFSTR("towing_not_supported");
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setTowingNotSupported:", objc_msgSend(v13, "BOOLValue"));

    }
  }

  return a1;
}

- (GEOLogMsgEventEVRoutingVehicleDetails)initWithJSON:(id)a3
{
  return (GEOLogMsgEventEVRoutingVehicleDetails *)-[GEOLogMsgEventEVRoutingVehicleDetails _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_2500;
    else
      v8 = (int *)&readAll__nonRecursiveTag_2501;
    GEOLogMsgEventEVRoutingVehicleDetailsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventEVRoutingVehicleDetailsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventEVRoutingVehicleDetailsReadAllFrom((uint64_t)self, a3, 0);
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
    -[GEOLogMsgEventEVRoutingVehicleDetails readAll:](self, "readAll:", 0);
    if (self->_make)
      PBDataWriterWriteStringField();
    if (self->_model)
      PBDataWriterWriteStringField();
    flags = (char)self->_flags;
    if ((flags & 1) != 0)
    {
      PBDataWriterWriteUint32Field();
      flags = (char)self->_flags;
    }
    if ((flags & 2) != 0)
      PBDataWriterWriteBOOLField();
  }

}

- (void)copyTo:(id)a3
{
  char flags;
  id *v5;

  v5 = (id *)a3;
  -[GEOLogMsgEventEVRoutingVehicleDetails readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 8) = self->_readerMarkPos;
  *((_DWORD *)v5 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_make)
    objc_msgSend(v5, "setMake:");
  if (self->_model)
    objc_msgSend(v5, "setModel:");
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *((_DWORD *)v5 + 11) = self->_batteryCapacity;
    *((_BYTE *)v5 + 52) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_BYTE *)v5 + 48) = self->_towingNotSupported;
    *((_BYTE *)v5 + 52) |= 2u;
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
      GEOLogMsgEventEVRoutingVehicleDetailsReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOLogMsgEventEVRoutingVehicleDetails readAll:](self, "readAll:", 0);
  v9 = -[NSString copyWithZone:](self->_make, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v9;

  v11 = -[NSString copyWithZone:](self->_model, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v11;

  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 44) = self->_batteryCapacity;
    *(_BYTE *)(v5 + 52) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_BYTE *)(v5 + 48) = self->_towingNotSupported;
    *(_BYTE *)(v5 + 52) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *make;
  NSString *model;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  -[GEOLogMsgEventEVRoutingVehicleDetails readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  make = self->_make;
  if ((unint64_t)make | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](make, "isEqual:"))
      goto LABEL_13;
  }
  model = self->_model;
  if ((unint64_t)model | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](model, "isEqual:"))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) == 0 || self->_batteryCapacity != *((_DWORD *)v4 + 11))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
    goto LABEL_13;
  }
  v7 = (*((_BYTE *)v4 + 52) & 2) == 0;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 2) == 0)
    {
LABEL_13:
      v7 = 0;
      goto LABEL_14;
    }
    if (self->_towingNotSupported)
    {
      if (!*((_BYTE *)v4 + 48))
        goto LABEL_13;
    }
    else if (*((_BYTE *)v4 + 48))
    {
      goto LABEL_13;
    }
    v7 = 1;
  }
LABEL_14:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;

  -[GEOLogMsgEventEVRoutingVehicleDetails readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_make, "hash");
  v4 = -[NSString hash](self->_model, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v5 = 2654435761 * self->_batteryCapacity;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v6 = 2654435761 * self->_towingNotSupported;
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
  if (v6[2])
  {
    -[GEOLogMsgEventEVRoutingVehicleDetails setMake:](self, "setMake:");
    v4 = v6;
  }
  if (v4[3])
  {
    -[GEOLogMsgEventEVRoutingVehicleDetails setModel:](self, "setModel:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 52);
  if ((v5 & 1) != 0)
  {
    self->_batteryCapacity = *((_DWORD *)v4 + 11);
    *(_BYTE *)&self->_flags |= 1u;
    v5 = *((_BYTE *)v4 + 52);
  }
  if ((v5 & 2) != 0)
  {
    self->_towingNotSupported = *((_BYTE *)v4 + 48);
    *(_BYTE *)&self->_flags |= 2u;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_make, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
