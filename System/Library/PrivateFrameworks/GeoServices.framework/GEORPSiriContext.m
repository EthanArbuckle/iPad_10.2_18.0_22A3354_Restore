@implementation GEORPSiriContext

- (GEORPSiriContext)init
{
  GEORPSiriContext *v2;
  GEORPSiriContext *v3;
  GEORPSiriContext *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPSiriContext;
  v2 = -[GEORPSiriContext init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPSiriContext)initWithData:(id)a3
{
  GEORPSiriContext *v3;
  GEORPSiriContext *v4;
  GEORPSiriContext *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPSiriContext;
  v3 = -[GEORPSiriContext initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readSiriIncidentType
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
        GEORPSiriContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSiriIncidentType_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasSiriIncidentType
{
  -[GEORPSiriContext _readSiriIncidentType]((uint64_t)self);
  return self->_siriIncidentType != 0;
}

- (NSString)siriIncidentType
{
  -[GEORPSiriContext _readSiriIncidentType]((uint64_t)self);
  return self->_siriIncidentType;
}

- (void)setSiriIncidentType:(id)a3
{
  *(_BYTE *)&self->_flags |= 6u;
  objc_storeStrong((id *)&self->_siriIncidentType, a3);
}

- (void)_readAdditionalDetails
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
        GEORPSiriContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAdditionalDetails_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasAdditionalDetails
{
  -[GEORPSiriContext _readAdditionalDetails]((uint64_t)self);
  return self->_additionalDetails != 0;
}

- (NSString)additionalDetails
{
  -[GEORPSiriContext _readAdditionalDetails]((uint64_t)self);
  return self->_additionalDetails;
}

- (void)setAdditionalDetails:(id)a3
{
  *(_BYTE *)&self->_flags |= 5u;
  objc_storeStrong((id *)&self->_additionalDetails, a3);
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
  v8.super_class = (Class)GEORPSiriContext;
  -[GEORPSiriContext description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPSiriContext dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPSiriContext _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;

  if (a1)
  {
    objc_msgSend(a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "siriIncidentType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      if (a2)
        v6 = CFSTR("siriIncidentType");
      else
        v6 = CFSTR("siri_incident_type");
      objc_msgSend(v4, "setObject:forKey:", v5, v6);
    }

    objc_msgSend(a1, "additionalDetails");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      if (a2)
        v8 = CFSTR("additionalDetails");
      else
        v8 = CFSTR("additional_details");
      objc_msgSend(v4, "setObject:forKey:", v7, v8);
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
  return -[GEORPSiriContext _dictionaryRepresentation:](self, 1);
}

- (GEORPSiriContext)initWithDictionary:(id)a3
{
  return (GEORPSiriContext *)-[GEORPSiriContext _initWithDictionary:isJSON:](self, a3, 0);
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

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("siriIncidentType");
      else
        v6 = CFSTR("siri_incident_type");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = (void *)objc_msgSend(v7, "copy");
        objc_msgSend(a1, "setSiriIncidentType:", v8);

      }
      if (a3)
        v9 = CFSTR("additionalDetails");
      else
        v9 = CFSTR("additional_details");
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = (void *)objc_msgSend(v10, "copy");
        objc_msgSend(a1, "setAdditionalDetails:", v11);

      }
    }
  }

  return a1;
}

- (GEORPSiriContext)initWithJSON:(id)a3
{
  return (GEORPSiriContext *)-[GEORPSiriContext _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_302;
    else
      v8 = (int *)&readAll__nonRecursiveTag_303;
    GEORPSiriContextReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPSiriContextIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPSiriContextReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 7) == 0))
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
    -[GEORPSiriContext readAll:](self, "readAll:", 0);
    if (self->_siriIncidentType)
      PBDataWriterWriteStringField();
    if (self->_additionalDetails)
      PBDataWriterWriteStringField();
  }

}

- (void)copyTo:(id)a3
{
  id *v4;

  v4 = (id *)a3;
  -[GEORPSiriContext readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 8) = self->_readerMarkPos;
  *((_DWORD *)v4 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_siriIncidentType)
    objc_msgSend(v4, "setSiriIncidentType:");
  if (self->_additionalDetails)
    objc_msgSend(v4, "setAdditionalDetails:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  PBDataReader *reader;
  PBDataReader *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

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
    -[GEORPSiriContext readAll:](self, "readAll:", 0);
    v8 = -[NSString copyWithZone:](self->_siriIncidentType, "copyWithZone:", a3);
    v9 = (void *)v5[3];
    v5[3] = v8;

    v10 = -[NSString copyWithZone:](self->_additionalDetails, "copyWithZone:", a3);
    v7 = (PBDataReader *)v5[2];
    v5[2] = v10;
    goto LABEL_6;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEORPSiriContextReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *siriIncidentType;
  NSString *additionalDetails;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEORPSiriContext readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         siriIncidentType = self->_siriIncidentType,
         !((unint64_t)siriIncidentType | v4[3]))
     || -[NSString isEqual:](siriIncidentType, "isEqual:")))
  {
    additionalDetails = self->_additionalDetails;
    if ((unint64_t)additionalDetails | v4[2])
      v7 = -[NSString isEqual:](additionalDetails, "isEqual:");
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

  -[GEORPSiriContext readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_siriIncidentType, "hash");
  return -[NSString hash](self->_additionalDetails, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if (v4[3])
    -[GEORPSiriContext setSiriIncidentType:](self, "setSiriIncidentType:");
  if (v4[2])
    -[GEORPSiriContext setAdditionalDetails:](self, "setAdditionalDetails:");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriIncidentType, 0);
  objc_storeStrong((id *)&self->_additionalDetails, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
