@implementation GEORPEditedAccessPoint

- (GEORPEditedAccessPoint)init
{
  GEORPEditedAccessPoint *v2;
  GEORPEditedAccessPoint *v3;
  GEORPEditedAccessPoint *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPEditedAccessPoint;
  v2 = -[GEORPEditedAccessPoint init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPEditedAccessPoint)initWithData:(id)a3
{
  GEORPEditedAccessPoint *v3;
  GEORPEditedAccessPoint *v4;
  GEORPEditedAccessPoint *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPEditedAccessPoint;
  v3 = -[GEORPEditedAccessPoint initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readOriginal
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
        GEORPEditedAccessPointReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOriginal_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasOriginal
{
  -[GEORPEditedAccessPoint _readOriginal]((uint64_t)self);
  return self->_original != 0;
}

- (GEORoadAccessPoint)original
{
  -[GEORPEditedAccessPoint _readOriginal]((uint64_t)self);
  return self->_original;
}

- (void)setOriginal:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_original, a3);
}

- (void)_readCorrected
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
        GEORPEditedAccessPointReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCorrected_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasCorrected
{
  -[GEORPEditedAccessPoint _readCorrected]((uint64_t)self);
  return self->_corrected != 0;
}

- (GEORoadAccessPoint)corrected
{
  -[GEORPEditedAccessPoint _readCorrected]((uint64_t)self);
  return self->_corrected;
}

- (void)setCorrected:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x12u;
  objc_storeStrong((id *)&self->_corrected, a3);
}

- (void)_readName
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
        GEORPEditedAccessPointReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readName_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasName
{
  -[GEORPEditedAccessPoint _readName]((uint64_t)self);
  return self->_name != 0;
}

- (GEORPCorrectedString)name
{
  -[GEORPEditedAccessPoint _readName]((uint64_t)self);
  return self->_name;
}

- (void)setName:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_name, a3);
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
  v8.super_class = (Class)GEORPEditedAccessPoint;
  -[GEORPEditedAccessPoint description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPEditedAccessPoint dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPEditedAccessPoint _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(_QWORD *)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v21[4];
  id v22;

  if (!a1)
    return 0;
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "original");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v5, "jsonRepresentation");
    else
      objc_msgSend(v5, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("original"));

  }
  objc_msgSend(a1, "corrected");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v8, "jsonRepresentation");
    else
      objc_msgSend(v8, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("corrected"));

  }
  objc_msgSend(a1, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v11, "jsonRepresentation");
    else
      objc_msgSend(v11, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("name"));

  }
  v14 = (void *)a1[2];
  if (v14)
  {
    objc_msgSend(v14, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __52__GEORPEditedAccessPoint__dictionaryRepresentation___block_invoke;
      v21[3] = &unk_1E1C00600;
      v18 = v17;
      v22 = v18;
      objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v21);
      v19 = v18;

      v16 = v19;
    }
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPEditedAccessPoint _dictionaryRepresentation:](self, 1);
}

void __52__GEORPEditedAccessPoint__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPEditedAccessPoint)initWithDictionary:(id)a3
{
  return (GEORPEditedAccessPoint *)-[GEORPEditedAccessPoint _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5;
  void *v6;
  GEORoadAccessPoint *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  GEORoadAccessPoint *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  GEORPCorrectedString *v15;
  uint64_t v16;
  void *v17;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("original"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = [GEORoadAccessPoint alloc];
        if ((a3 & 1) != 0)
          v8 = -[GEORoadAccessPoint initWithJSON:](v7, "initWithJSON:", v6);
        else
          v8 = -[GEORoadAccessPoint initWithDictionary:](v7, "initWithDictionary:", v6);
        v9 = (void *)v8;
        objc_msgSend(a1, "setOriginal:", v8);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("corrected"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = [GEORoadAccessPoint alloc];
        if ((a3 & 1) != 0)
          v12 = -[GEORoadAccessPoint initWithJSON:](v11, "initWithJSON:", v10);
        else
          v12 = -[GEORoadAccessPoint initWithDictionary:](v11, "initWithDictionary:", v10);
        v13 = (void *)v12;
        objc_msgSend(a1, "setCorrected:", v12);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("name"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = [GEORPCorrectedString alloc];
        if ((a3 & 1) != 0)
          v16 = -[GEORPCorrectedString initWithJSON:](v15, "initWithJSON:", v14);
        else
          v16 = -[GEORPCorrectedString initWithDictionary:](v15, "initWithDictionary:", v14);
        v17 = (void *)v16;
        objc_msgSend(a1, "setName:", v16);

      }
    }
  }

  return a1;
}

- (GEORPEditedAccessPoint)initWithJSON:(id)a3
{
  return (GEORPEditedAccessPoint *)-[GEORPEditedAccessPoint _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_767;
    else
      v8 = (int *)&readAll__nonRecursiveTag_768;
    GEORPEditedAccessPointReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEORoadAccessPoint readAll:](self->_original, "readAll:", 1);
    -[GEORoadAccessPoint readAll:](self->_corrected, "readAll:", 1);
    -[GEORPCorrectedString readAll:](self->_name, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPEditedAccessPointIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPEditedAccessPointReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  PBDataReader *v6;
  void *v7;
  id v8;

  v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && !_GEORPEditedAccessPointIsDirty((uint64_t)self))
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
    -[GEORPEditedAccessPoint readAll:](self, "readAll:", 0);
    if (self->_original)
      PBDataWriterWriteSubmessage();
    v5 = v8;
    if (self->_corrected)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_name)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEORPEditedAccessPoint _readCorrected]((uint64_t)self);
  if (-[GEORoadAccessPoint hasGreenTeaWithValue:](self->_corrected, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEORPEditedAccessPoint _readOriginal]((uint64_t)self);
  return -[GEORoadAccessPoint hasGreenTeaWithValue:](self->_original, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEORPEditedAccessPoint readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 12) = self->_readerMarkPos;
  *((_DWORD *)v5 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_original)
    objc_msgSend(v5, "setOriginal:");
  if (self->_corrected)
    objc_msgSend(v5, "setCorrected:");
  v4 = v5;
  if (self->_name)
  {
    objc_msgSend(v5, "setName:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
    -[GEORPEditedAccessPoint readAll:](self, "readAll:", 0);
    v8 = -[GEORoadAccessPoint copyWithZone:](self->_original, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v8;

    v10 = -[GEORoadAccessPoint copyWithZone:](self->_corrected, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v10;

    v12 = -[GEORPCorrectedString copyWithZone:](self->_name, "copyWithZone:", a3);
    v13 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v12;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEORPEditedAccessPointReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEORoadAccessPoint *original;
  GEORoadAccessPoint *corrected;
  GEORPCorrectedString *name;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEORPEditedAccessPoint readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         original = self->_original,
         !((unint64_t)original | v4[5]))
     || -[GEORoadAccessPoint isEqual:](original, "isEqual:"))
    && ((corrected = self->_corrected, !((unint64_t)corrected | v4[3]))
     || -[GEORoadAccessPoint isEqual:](corrected, "isEqual:")))
  {
    name = self->_name;
    if ((unint64_t)name | v4[4])
      v8 = -[GEORPCorrectedString isEqual:](name, "isEqual:");
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
  unint64_t v4;

  -[GEORPEditedAccessPoint readAll:](self, "readAll:", 1);
  v3 = -[GEORoadAccessPoint hash](self->_original, "hash");
  v4 = -[GEORoadAccessPoint hash](self->_corrected, "hash") ^ v3;
  return v4 ^ -[GEORPCorrectedString hash](self->_name, "hash");
}

- (void)mergeFrom:(id)a3
{
  GEORoadAccessPoint *original;
  uint64_t v5;
  GEORoadAccessPoint *corrected;
  uint64_t v7;
  GEORPCorrectedString *name;
  uint64_t v9;
  _QWORD *v10;

  v10 = a3;
  objc_msgSend(v10, "readAll:", 0);
  original = self->_original;
  v5 = v10[5];
  if (original)
  {
    if (v5)
      -[GEORoadAccessPoint mergeFrom:](original, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEORPEditedAccessPoint setOriginal:](self, "setOriginal:");
  }
  corrected = self->_corrected;
  v7 = v10[3];
  if (corrected)
  {
    if (v7)
      -[GEORoadAccessPoint mergeFrom:](corrected, "mergeFrom:");
  }
  else if (v7)
  {
    -[GEORPEditedAccessPoint setCorrected:](self, "setCorrected:");
  }
  name = self->_name;
  v9 = v10[4];
  if (name)
  {
    if (v9)
      -[GEORPCorrectedString mergeFrom:](name, "mergeFrom:");
  }
  else if (v9)
  {
    -[GEORPEditedAccessPoint setName:](self, "setName:");
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEORPEditedAccessPointReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_771);
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
  *(_BYTE *)&self->_flags |= 0x11u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEORPEditedAccessPoint readAll:](self, "readAll:", 0);
    -[GEORoadAccessPoint clearUnknownFields:](self->_original, "clearUnknownFields:", 1);
    -[GEORoadAccessPoint clearUnknownFields:](self->_corrected, "clearUnknownFields:", 1);
    -[GEORPCorrectedString clearUnknownFields:](self->_name, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_original, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_corrected, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
