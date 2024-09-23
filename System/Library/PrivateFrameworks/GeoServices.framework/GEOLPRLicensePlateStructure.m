@implementation GEOLPRLicensePlateStructure

- (GEOLPRLicensePlateStructure)init
{
  GEOLPRLicensePlateStructure *v2;
  GEOLPRLicensePlateStructure *v3;
  GEOLPRLicensePlateStructure *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOLPRLicensePlateStructure;
  v2 = -[GEOLPRLicensePlateStructure init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLPRLicensePlateStructure)initWithData:(id)a3
{
  GEOLPRLicensePlateStructure *v3;
  GEOLPRLicensePlateStructure *v4;
  GEOLPRLicensePlateStructure *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOLPRLicensePlateStructure;
  v3 = -[GEOLPRLicensePlateStructure initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readSupportedPlateAlphabetLetters
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
        GEOLPRLicensePlateStructureReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSupportedPlateAlphabetLetters_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasSupportedPlateAlphabetLetters
{
  -[GEOLPRLicensePlateStructure _readSupportedPlateAlphabetLetters]((uint64_t)self);
  return self->_supportedPlateAlphabetLetters != 0;
}

- (NSString)supportedPlateAlphabetLetters
{
  -[GEOLPRLicensePlateStructure _readSupportedPlateAlphabetLetters]((uint64_t)self);
  return self->_supportedPlateAlphabetLetters;
}

- (void)setSupportedPlateAlphabetLetters:(id)a3
{
  *(_BYTE *)&self->_flags |= 5u;
  objc_storeStrong((id *)&self->_supportedPlateAlphabetLetters, a3);
}

- (void)_readSupportedPlateNumerics
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
        GEOLPRLicensePlateStructureReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSupportedPlateNumerics_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasSupportedPlateNumerics
{
  -[GEOLPRLicensePlateStructure _readSupportedPlateNumerics]((uint64_t)self);
  return self->_supportedPlateNumerics != 0;
}

- (NSString)supportedPlateNumerics
{
  -[GEOLPRLicensePlateStructure _readSupportedPlateNumerics]((uint64_t)self);
  return self->_supportedPlateNumerics;
}

- (void)setSupportedPlateNumerics:(id)a3
{
  *(_BYTE *)&self->_flags |= 6u;
  objc_storeStrong((id *)&self->_supportedPlateNumerics, a3);
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
  v8.super_class = (Class)GEOLPRLicensePlateStructure;
  -[GEOLPRLicensePlateStructure description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLPRLicensePlateStructure dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLPRLicensePlateStructure _dictionaryRepresentation:](self, 0);
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
    objc_msgSend(a1, "supportedPlateAlphabetLetters");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      if (a2)
        v6 = CFSTR("supportedPlateAlphabetLetters");
      else
        v6 = CFSTR("supported_plate_alphabet_letters");
      objc_msgSend(v4, "setObject:forKey:", v5, v6);
    }

    objc_msgSend(a1, "supportedPlateNumerics");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      if (a2)
        v8 = CFSTR("supportedPlateNumerics");
      else
        v8 = CFSTR("supported_plate_numerics");
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
  return -[GEOLPRLicensePlateStructure _dictionaryRepresentation:](self, 1);
}

- (GEOLPRLicensePlateStructure)initWithDictionary:(id)a3
{
  return (GEOLPRLicensePlateStructure *)-[GEOLPRLicensePlateStructure _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = CFSTR("supportedPlateAlphabetLetters");
      else
        v6 = CFSTR("supported_plate_alphabet_letters");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = (void *)objc_msgSend(v7, "copy");
        objc_msgSend(a1, "setSupportedPlateAlphabetLetters:", v8);

      }
      if (a3)
        v9 = CFSTR("supportedPlateNumerics");
      else
        v9 = CFSTR("supported_plate_numerics");
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = (void *)objc_msgSend(v10, "copy");
        objc_msgSend(a1, "setSupportedPlateNumerics:", v11);

      }
    }
  }

  return a1;
}

- (GEOLPRLicensePlateStructure)initWithJSON:(id)a3
{
  return (GEOLPRLicensePlateStructure *)-[GEOLPRLicensePlateStructure _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_495;
    else
      v8 = (int *)&readAll__nonRecursiveTag_496;
    GEOLPRLicensePlateStructureReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLPRLicensePlateStructureIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLPRLicensePlateStructureReadAllFrom((uint64_t)self, a3, 0);
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
    -[GEOLPRLicensePlateStructure readAll:](self, "readAll:", 0);
    if (self->_supportedPlateAlphabetLetters)
      PBDataWriterWriteStringField();
    if (self->_supportedPlateNumerics)
      PBDataWriterWriteStringField();
  }

}

- (void)copyTo:(id)a3
{
  id *v4;

  v4 = (id *)a3;
  -[GEOLPRLicensePlateStructure readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 8) = self->_readerMarkPos;
  *((_DWORD *)v4 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_supportedPlateAlphabetLetters)
    objc_msgSend(v4, "setSupportedPlateAlphabetLetters:");
  if (self->_supportedPlateNumerics)
    objc_msgSend(v4, "setSupportedPlateNumerics:");

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
    -[GEOLPRLicensePlateStructure readAll:](self, "readAll:", 0);
    v8 = -[NSString copyWithZone:](self->_supportedPlateAlphabetLetters, "copyWithZone:", a3);
    v9 = (void *)v5[2];
    v5[2] = v8;

    v10 = -[NSString copyWithZone:](self->_supportedPlateNumerics, "copyWithZone:", a3);
    v7 = (PBDataReader *)v5[3];
    v5[3] = v10;
    goto LABEL_6;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOLPRLicensePlateStructureReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *supportedPlateAlphabetLetters;
  NSString *supportedPlateNumerics;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOLPRLicensePlateStructure readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         supportedPlateAlphabetLetters = self->_supportedPlateAlphabetLetters,
         !((unint64_t)supportedPlateAlphabetLetters | v4[2]))
     || -[NSString isEqual:](supportedPlateAlphabetLetters, "isEqual:")))
  {
    supportedPlateNumerics = self->_supportedPlateNumerics;
    if ((unint64_t)supportedPlateNumerics | v4[3])
      v7 = -[NSString isEqual:](supportedPlateNumerics, "isEqual:");
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

  -[GEOLPRLicensePlateStructure readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_supportedPlateAlphabetLetters, "hash");
  return -[NSString hash](self->_supportedPlateNumerics, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if (v4[2])
    -[GEOLPRLicensePlateStructure setSupportedPlateAlphabetLetters:](self, "setSupportedPlateAlphabetLetters:");
  if (v4[3])
    -[GEOLPRLicensePlateStructure setSupportedPlateNumerics:](self, "setSupportedPlateNumerics:");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedPlateNumerics, 0);
  objc_storeStrong((id *)&self->_supportedPlateAlphabetLetters, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
