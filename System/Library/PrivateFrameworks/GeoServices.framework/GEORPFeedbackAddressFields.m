@implementation GEORPFeedbackAddressFields

- (GEORPFeedbackAddressFields)init
{
  GEORPFeedbackAddressFields *v2;
  GEORPFeedbackAddressFields *v3;
  GEORPFeedbackAddressFields *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPFeedbackAddressFields;
  v2 = -[GEORPFeedbackAddressFields init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPFeedbackAddressFields)initWithData:(id)a3
{
  GEORPFeedbackAddressFields *v3;
  GEORPFeedbackAddressFields *v4;
  GEORPFeedbackAddressFields *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPFeedbackAddressFields;
  v3 = -[GEORPFeedbackAddressFields initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readAddressBasic
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
        GEORPFeedbackAddressFieldsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAddressBasic_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasAddressBasic
{
  -[GEORPFeedbackAddressFields _readAddressBasic]((uint64_t)self);
  return self->_addressBasic != 0;
}

- (NSString)addressBasic
{
  -[GEORPFeedbackAddressFields _readAddressBasic]((uint64_t)self);
  return self->_addressBasic;
}

- (void)setAddressBasic:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x11u;
  objc_storeStrong((id *)&self->_addressBasic, a3);
}

- (void)_readAddressUnit
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
        GEORPFeedbackAddressFieldsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAddressUnit_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasAddressUnit
{
  -[GEORPFeedbackAddressFields _readAddressUnit]((uint64_t)self);
  return self->_addressUnit != 0;
}

- (NSString)addressUnit
{
  -[GEORPFeedbackAddressFields _readAddressUnit]((uint64_t)self);
  return self->_addressUnit;
}

- (void)setAddressUnit:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_addressUnit, a3);
}

- (void)_readAddressFloor
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
        GEORPFeedbackAddressFieldsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAddressFloor_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasAddressFloor
{
  -[GEORPFeedbackAddressFields _readAddressFloor]((uint64_t)self);
  return self->_addressFloor != 0;
}

- (NSString)addressFloor
{
  -[GEORPFeedbackAddressFields _readAddressFloor]((uint64_t)self);
  return self->_addressFloor;
}

- (void)setAddressFloor:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_addressFloor, a3);
}

- (void)_readAddressBuilding
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 60) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackAddressFieldsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAddressBuilding_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasAddressBuilding
{
  -[GEORPFeedbackAddressFields _readAddressBuilding]((uint64_t)self);
  return self->_addressBuilding != 0;
}

- (NSString)addressBuilding
{
  -[GEORPFeedbackAddressFields _readAddressBuilding]((uint64_t)self);
  return self->_addressBuilding;
}

- (void)setAddressBuilding:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x12u;
  objc_storeStrong((id *)&self->_addressBuilding, a3);
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
  v8.super_class = (Class)GEORPFeedbackAddressFields;
  -[GEORPFeedbackAddressFields description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPFeedbackAddressFields dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackAddressFields _dictionaryRepresentation:](self, 0);
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
  void *v11;
  const __CFString *v12;

  if (a1)
  {
    objc_msgSend(a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "addressBasic");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      if (a2)
        v6 = CFSTR("addressBasic");
      else
        v6 = CFSTR("address_basic");
      objc_msgSend(v4, "setObject:forKey:", v5, v6);
    }

    objc_msgSend(a1, "addressUnit");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      if (a2)
        v8 = CFSTR("addressUnit");
      else
        v8 = CFSTR("address_unit");
      objc_msgSend(v4, "setObject:forKey:", v7, v8);
    }

    objc_msgSend(a1, "addressFloor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if (a2)
        v10 = CFSTR("addressFloor");
      else
        v10 = CFSTR("address_floor");
      objc_msgSend(v4, "setObject:forKey:", v9, v10);
    }

    objc_msgSend(a1, "addressBuilding");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      if (a2)
        v12 = CFSTR("addressBuilding");
      else
        v12 = CFSTR("address_building");
      objc_msgSend(v4, "setObject:forKey:", v11, v12);
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
  return -[GEORPFeedbackAddressFields _dictionaryRepresentation:](self, 1);
}

- (GEORPFeedbackAddressFields)initWithDictionary:(id)a3
{
  return (GEORPFeedbackAddressFields *)-[GEORPFeedbackAddressFields _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = CFSTR("addressBasic");
      else
        v6 = CFSTR("address_basic");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = (void *)objc_msgSend(v7, "copy");
        objc_msgSend(a1, "setAddressBasic:", v8);

      }
      if (a3)
        v9 = CFSTR("addressUnit");
      else
        v9 = CFSTR("address_unit");
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = (void *)objc_msgSend(v10, "copy");
        objc_msgSend(a1, "setAddressUnit:", v11);

      }
      if (a3)
        v12 = CFSTR("addressFloor");
      else
        v12 = CFSTR("address_floor");
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = (void *)objc_msgSend(v13, "copy");
        objc_msgSend(a1, "setAddressFloor:", v14);

      }
      if (a3)
        v15 = CFSTR("addressBuilding");
      else
        v15 = CFSTR("address_building");
      objc_msgSend(v5, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = (void *)objc_msgSend(v16, "copy");
        objc_msgSend(a1, "setAddressBuilding:", v17);

      }
    }
  }

  return a1;
}

- (GEORPFeedbackAddressFields)initWithJSON:(id)a3
{
  return (GEORPFeedbackAddressFields *)-[GEORPFeedbackAddressFields _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_138;
    else
      v8 = (int *)&readAll__nonRecursiveTag_139;
    GEORPFeedbackAddressFieldsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackAddressFieldsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackAddressFieldsReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x1F) == 0))
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
    -[GEORPFeedbackAddressFields readAll:](self, "readAll:", 0);
    if (self->_addressBasic)
      PBDataWriterWriteStringField();
    if (self->_addressUnit)
      PBDataWriterWriteStringField();
    if (self->_addressFloor)
      PBDataWriterWriteStringField();
    if (self->_addressBuilding)
      PBDataWriterWriteStringField();
  }

}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEORPFeedbackAddressFields readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 12) = self->_readerMarkPos;
  *((_DWORD *)v5 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_addressBasic)
    objc_msgSend(v5, "setAddressBasic:");
  if (self->_addressUnit)
    objc_msgSend(v5, "setAddressUnit:");
  v4 = v5;
  if (self->_addressFloor)
  {
    objc_msgSend(v5, "setAddressFloor:");
    v4 = v5;
  }
  if (self->_addressBuilding)
  {
    objc_msgSend(v5, "setAddressBuilding:");
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
    -[GEORPFeedbackAddressFields readAll:](self, "readAll:", 0);
    v8 = -[NSString copyWithZone:](self->_addressBasic, "copyWithZone:", a3);
    v9 = (void *)v5[2];
    v5[2] = v8;

    v10 = -[NSString copyWithZone:](self->_addressUnit, "copyWithZone:", a3);
    v11 = (void *)v5[5];
    v5[5] = v10;

    v12 = -[NSString copyWithZone:](self->_addressFloor, "copyWithZone:", a3);
    v13 = (void *)v5[4];
    v5[4] = v12;

    v14 = -[NSString copyWithZone:](self->_addressBuilding, "copyWithZone:", a3);
    v7 = (PBDataReader *)v5[3];
    v5[3] = v14;
    goto LABEL_6;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEORPFeedbackAddressFieldsReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *addressBasic;
  NSString *addressUnit;
  NSString *addressFloor;
  NSString *addressBuilding;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEORPFeedbackAddressFields readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         addressBasic = self->_addressBasic,
         !((unint64_t)addressBasic | v4[2]))
     || -[NSString isEqual:](addressBasic, "isEqual:"))
    && ((addressUnit = self->_addressUnit, !((unint64_t)addressUnit | v4[5]))
     || -[NSString isEqual:](addressUnit, "isEqual:"))
    && ((addressFloor = self->_addressFloor, !((unint64_t)addressFloor | v4[4]))
     || -[NSString isEqual:](addressFloor, "isEqual:")))
  {
    addressBuilding = self->_addressBuilding;
    if ((unint64_t)addressBuilding | v4[3])
      v9 = -[NSString isEqual:](addressBuilding, "isEqual:");
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

  -[GEORPFeedbackAddressFields readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_addressBasic, "hash");
  v4 = -[NSString hash](self->_addressUnit, "hash") ^ v3;
  v5 = -[NSString hash](self->_addressFloor, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_addressBuilding, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if (v4[2])
    -[GEORPFeedbackAddressFields setAddressBasic:](self, "setAddressBasic:");
  if (v4[5])
    -[GEORPFeedbackAddressFields setAddressUnit:](self, "setAddressUnit:");
  if (v4[4])
    -[GEORPFeedbackAddressFields setAddressFloor:](self, "setAddressFloor:");
  if (v4[3])
    -[GEORPFeedbackAddressFields setAddressBuilding:](self, "setAddressBuilding:");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addressUnit, 0);
  objc_storeStrong((id *)&self->_addressFloor, 0);
  objc_storeStrong((id *)&self->_addressBuilding, 0);
  objc_storeStrong((id *)&self->_addressBasic, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
