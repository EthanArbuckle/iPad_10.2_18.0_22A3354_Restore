@implementation GEORPCorrectedCoordinate

- (GEORPCorrectedCoordinate)init
{
  GEORPCorrectedCoordinate *v2;
  GEORPCorrectedCoordinate *v3;
  GEORPCorrectedCoordinate *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPCorrectedCoordinate;
  v2 = -[GEORPCorrectedCoordinate init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPCorrectedCoordinate)initWithData:(id)a3
{
  GEORPCorrectedCoordinate *v3;
  GEORPCorrectedCoordinate *v4;
  GEORPCorrectedCoordinate *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPCorrectedCoordinate;
  v3 = -[GEORPCorrectedCoordinate initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readOriginalCoordinate
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
        GEORPCorrectedCoordinateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOriginalCoordinate_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasOriginalCoordinate
{
  -[GEORPCorrectedCoordinate _readOriginalCoordinate]((uint64_t)self);
  return self->_originalCoordinate != 0;
}

- (GEOLatLng)originalCoordinate
{
  -[GEORPCorrectedCoordinate _readOriginalCoordinate]((uint64_t)self);
  return self->_originalCoordinate;
}

- (void)setOriginalCoordinate:(id)a3
{
  *(_BYTE *)&self->_flags |= 6u;
  objc_storeStrong((id *)&self->_originalCoordinate, a3);
}

- (void)_readCorrectedCoordinate
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
        GEORPCorrectedCoordinateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCorrectedCoordinate_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasCorrectedCoordinate
{
  -[GEORPCorrectedCoordinate _readCorrectedCoordinate]((uint64_t)self);
  return self->_correctedCoordinate != 0;
}

- (GEOLatLng)correctedCoordinate
{
  -[GEORPCorrectedCoordinate _readCorrectedCoordinate]((uint64_t)self);
  return self->_correctedCoordinate;
}

- (void)setCorrectedCoordinate:(id)a3
{
  *(_BYTE *)&self->_flags |= 5u;
  objc_storeStrong((id *)&self->_correctedCoordinate, a3);
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
  v8.super_class = (Class)GEORPCorrectedCoordinate;
  -[GEORPCorrectedCoordinate description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPCorrectedCoordinate dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPCorrectedCoordinate _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;

  if (a1)
  {
    objc_msgSend(a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "originalCoordinate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v5, "jsonRepresentation");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = CFSTR("originalCoordinate");
      }
      else
      {
        objc_msgSend(v5, "dictionaryRepresentation");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = CFSTR("original_coordinate");
      }
      objc_msgSend(v4, "setObject:forKey:", v7, v8);

    }
    objc_msgSend(a1, "correctedCoordinate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v9, "jsonRepresentation");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = CFSTR("correctedCoordinate");
      }
      else
      {
        objc_msgSend(v9, "dictionaryRepresentation");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = CFSTR("corrected_coordinate");
      }
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
  return -[GEORPCorrectedCoordinate _dictionaryRepresentation:](self, 1);
}

- (GEORPCorrectedCoordinate)initWithDictionary:(id)a3
{
  return (GEORPCorrectedCoordinate *)-[GEORPCorrectedCoordinate _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  GEOLatLng *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  GEOLatLng *v13;
  uint64_t v14;
  void *v15;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("originalCoordinate");
      else
        v6 = CFSTR("original_coordinate");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = [GEOLatLng alloc];
        if ((a3 & 1) != 0)
          v9 = -[GEOLatLng initWithJSON:](v8, "initWithJSON:", v7);
        else
          v9 = -[GEOLatLng initWithDictionary:](v8, "initWithDictionary:", v7);
        v10 = (void *)v9;
        objc_msgSend(a1, "setOriginalCoordinate:", v9);

      }
      if (a3)
        v11 = CFSTR("correctedCoordinate");
      else
        v11 = CFSTR("corrected_coordinate");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = [GEOLatLng alloc];
        if ((a3 & 1) != 0)
          v14 = -[GEOLatLng initWithJSON:](v13, "initWithJSON:", v12);
        else
          v14 = -[GEOLatLng initWithDictionary:](v13, "initWithDictionary:", v12);
        v15 = (void *)v14;
        objc_msgSend(a1, "setCorrectedCoordinate:", v14);

      }
    }
  }

  return a1;
}

- (GEORPCorrectedCoordinate)initWithJSON:(id)a3
{
  return (GEORPCorrectedCoordinate *)-[GEORPCorrectedCoordinate _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_233;
    else
      v8 = (int *)&readAll__nonRecursiveTag_234;
    GEORPCorrectedCoordinateReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEOLatLng readAll:](self->_originalCoordinate, "readAll:", 1);
    -[GEOLatLng readAll:](self->_correctedCoordinate, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPCorrectedCoordinateIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPCorrectedCoordinateReadAllFrom((uint64_t)self, a3, 0);
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
    -[GEORPCorrectedCoordinate readAll:](self, "readAll:", 0);
    if (self->_originalCoordinate)
      PBDataWriterWriteSubmessage();
    if (self->_correctedCoordinate)
      PBDataWriterWriteSubmessage();
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEORPCorrectedCoordinate _readCorrectedCoordinate]((uint64_t)self);
  if (-[GEOLatLng hasGreenTeaWithValue:](self->_correctedCoordinate, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEORPCorrectedCoordinate _readOriginalCoordinate]((uint64_t)self);
  return -[GEOLatLng hasGreenTeaWithValue:](self->_originalCoordinate, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;

  v4 = (id *)a3;
  -[GEORPCorrectedCoordinate readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 8) = self->_readerMarkPos;
  *((_DWORD *)v4 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_originalCoordinate)
    objc_msgSend(v4, "setOriginalCoordinate:");
  if (self->_correctedCoordinate)
    objc_msgSend(v4, "setCorrectedCoordinate:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
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
    -[GEORPCorrectedCoordinate readAll:](self, "readAll:", 0);
    v8 = -[GEOLatLng copyWithZone:](self->_originalCoordinate, "copyWithZone:", a3);
    v9 = (void *)v5[3];
    v5[3] = v8;

    v10 = -[GEOLatLng copyWithZone:](self->_correctedCoordinate, "copyWithZone:", a3);
    v7 = (PBDataReader *)v5[2];
    v5[2] = v10;
    goto LABEL_6;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEORPCorrectedCoordinateReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEOLatLng *originalCoordinate;
  GEOLatLng *correctedCoordinate;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEORPCorrectedCoordinate readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         originalCoordinate = self->_originalCoordinate,
         !((unint64_t)originalCoordinate | v4[3]))
     || -[GEOLatLng isEqual:](originalCoordinate, "isEqual:")))
  {
    correctedCoordinate = self->_correctedCoordinate;
    if ((unint64_t)correctedCoordinate | v4[2])
      v7 = -[GEOLatLng isEqual:](correctedCoordinate, "isEqual:");
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
  unint64_t v3;

  -[GEORPCorrectedCoordinate readAll:](self, "readAll:", 1);
  v3 = -[GEOLatLng hash](self->_originalCoordinate, "hash");
  return -[GEOLatLng hash](self->_correctedCoordinate, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  GEOLatLng *originalCoordinate;
  uint64_t v5;
  GEOLatLng *correctedCoordinate;
  uint64_t v7;
  _QWORD *v8;

  v8 = a3;
  objc_msgSend(v8, "readAll:", 0);
  originalCoordinate = self->_originalCoordinate;
  v5 = v8[3];
  if (originalCoordinate)
  {
    if (v5)
      -[GEOLatLng mergeFrom:](originalCoordinate, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEORPCorrectedCoordinate setOriginalCoordinate:](self, "setOriginalCoordinate:");
  }
  correctedCoordinate = self->_correctedCoordinate;
  v7 = v8[2];
  if (correctedCoordinate)
  {
    if (v7)
      -[GEOLatLng mergeFrom:](correctedCoordinate, "mergeFrom:");
  }
  else if (v7)
  {
    -[GEORPCorrectedCoordinate setCorrectedCoordinate:](self, "setCorrectedCoordinate:");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalCoordinate, 0);
  objc_storeStrong((id *)&self->_correctedCoordinate, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
