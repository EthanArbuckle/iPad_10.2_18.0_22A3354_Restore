@implementation GEORPPlaceContainmentCorrections

- (GEORPPlaceContainmentCorrections)init
{
  GEORPPlaceContainmentCorrections *v2;
  GEORPPlaceContainmentCorrections *v3;
  GEORPPlaceContainmentCorrections *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPPlaceContainmentCorrections;
  v2 = -[GEORPPlaceContainmentCorrections init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPPlaceContainmentCorrections)initWithData:(id)a3
{
  GEORPPlaceContainmentCorrections *v3;
  GEORPPlaceContainmentCorrections *v4;
  GEORPPlaceContainmentCorrections *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPPlaceContainmentCorrections;
  v3 = -[GEORPPlaceContainmentCorrections initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readParentContainment
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
        GEORPPlaceContainmentCorrectionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readParentContainment_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasParentContainment
{
  -[GEORPPlaceContainmentCorrections _readParentContainment]((uint64_t)self);
  return self->_parentContainment != 0;
}

- (GEORPContainmentCorrection)parentContainment
{
  -[GEORPPlaceContainmentCorrections _readParentContainment]((uint64_t)self);
  return self->_parentContainment;
}

- (void)setParentContainment:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_parentContainment, a3);
}

- (void)_readChildContainment
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
        GEORPPlaceContainmentCorrectionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readChildContainment_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasChildContainment
{
  -[GEORPPlaceContainmentCorrections _readChildContainment]((uint64_t)self);
  return self->_childContainment != 0;
}

- (GEORPContainmentCorrection)childContainment
{
  -[GEORPPlaceContainmentCorrections _readChildContainment]((uint64_t)self);
  return self->_childContainment;
}

- (void)setChildContainment:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xAu;
  objc_storeStrong((id *)&self->_childContainment, a3);
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
  v8.super_class = (Class)GEORPPlaceContainmentCorrections;
  -[GEORPPlaceContainmentCorrections description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPPlaceContainmentCorrections dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPPlaceContainmentCorrections _dictionaryRepresentation:](self, 0);
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
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;

  if (!a1)
    return 0;
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "parentContainment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v5, "jsonRepresentation");
    else
      objc_msgSend(v5, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("parentContainment"));

  }
  objc_msgSend(a1, "childContainment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v8, "jsonRepresentation");
    else
      objc_msgSend(v8, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("childContainment"));

  }
  v11 = (void *)a1[2];
  if (v11)
  {
    objc_msgSend(v11, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __62__GEORPPlaceContainmentCorrections__dictionaryRepresentation___block_invoke;
      v18[3] = &unk_1E1C00600;
      v15 = v14;
      v19 = v15;
      objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v18);
      v16 = v15;

      v13 = v16;
    }
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPPlaceContainmentCorrections _dictionaryRepresentation:](self, 1);
}

void __62__GEORPPlaceContainmentCorrections__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPPlaceContainmentCorrections)initWithDictionary:(id)a3
{
  return (GEORPPlaceContainmentCorrections *)-[GEORPPlaceContainmentCorrections _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5;
  void *v6;
  GEORPContainmentCorrection *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  GEORPContainmentCorrection *v11;
  uint64_t v12;
  void *v13;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("parentContainment"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = [GEORPContainmentCorrection alloc];
        if ((a3 & 1) != 0)
          v8 = -[GEORPContainmentCorrection initWithJSON:](v7, "initWithJSON:", v6);
        else
          v8 = -[GEORPContainmentCorrection initWithDictionary:](v7, "initWithDictionary:", v6);
        v9 = (void *)v8;
        objc_msgSend(a1, "setParentContainment:", v8);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("childContainment"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = [GEORPContainmentCorrection alloc];
        if ((a3 & 1) != 0)
          v12 = -[GEORPContainmentCorrection initWithJSON:](v11, "initWithJSON:", v10);
        else
          v12 = -[GEORPContainmentCorrection initWithDictionary:](v11, "initWithDictionary:", v10);
        v13 = (void *)v12;
        objc_msgSend(a1, "setChildContainment:", v12);

      }
    }
  }

  return a1;
}

- (GEORPPlaceContainmentCorrections)initWithJSON:(id)a3
{
  return (GEORPPlaceContainmentCorrections *)-[GEORPPlaceContainmentCorrections _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_2390;
    else
      v8 = (int *)&readAll__nonRecursiveTag_2391;
    GEORPPlaceContainmentCorrectionsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEORPContainmentCorrection readAll:](self->_parentContainment, "readAll:", 1);
    -[GEORPContainmentCorrection readAll:](self->_childContainment, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPPlaceContainmentCorrectionsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPPlaceContainmentCorrectionsReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && !_GEORPPlaceContainmentCorrectionsIsDirty((uint64_t)self))
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
    -[GEORPPlaceContainmentCorrections readAll:](self, "readAll:", 0);
    if (self->_parentContainment)
      PBDataWriterWriteSubmessage();
    v5 = v8;
    if (self->_childContainment)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (void)copyTo:(id)a3
{
  id *v4;

  v4 = (id *)a3;
  -[GEORPPlaceContainmentCorrections readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 10) = self->_readerMarkPos;
  *((_DWORD *)v4 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_parentContainment)
    objc_msgSend(v4, "setParentContainment:");
  if (self->_childContainment)
    objc_msgSend(v4, "setChildContainment:");

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

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
    -[GEORPPlaceContainmentCorrections readAll:](self, "readAll:", 0);
    v8 = -[GEORPContainmentCorrection copyWithZone:](self->_parentContainment, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v8;

    v10 = -[GEORPContainmentCorrection copyWithZone:](self->_childContainment, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v10;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEORPPlaceContainmentCorrectionsReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEORPContainmentCorrection *parentContainment;
  GEORPContainmentCorrection *childContainment;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEORPPlaceContainmentCorrections readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         parentContainment = self->_parentContainment,
         !((unint64_t)parentContainment | v4[4]))
     || -[GEORPContainmentCorrection isEqual:](parentContainment, "isEqual:")))
  {
    childContainment = self->_childContainment;
    if ((unint64_t)childContainment | v4[3])
      v7 = -[GEORPContainmentCorrection isEqual:](childContainment, "isEqual:");
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

  -[GEORPPlaceContainmentCorrections readAll:](self, "readAll:", 1);
  v3 = -[GEORPContainmentCorrection hash](self->_parentContainment, "hash");
  return -[GEORPContainmentCorrection hash](self->_childContainment, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  GEORPContainmentCorrection *parentContainment;
  uint64_t v5;
  GEORPContainmentCorrection *childContainment;
  uint64_t v7;
  _QWORD *v8;

  v8 = a3;
  objc_msgSend(v8, "readAll:", 0);
  parentContainment = self->_parentContainment;
  v5 = v8[4];
  if (parentContainment)
  {
    if (v5)
      -[GEORPContainmentCorrection mergeFrom:](parentContainment, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEORPPlaceContainmentCorrections setParentContainment:](self, "setParentContainment:");
  }
  childContainment = self->_childContainment;
  v7 = v8[3];
  if (childContainment)
  {
    if (v7)
      -[GEORPContainmentCorrection mergeFrom:](childContainment, "mergeFrom:");
  }
  else if (v7)
  {
    -[GEORPPlaceContainmentCorrections setChildContainment:](self, "setChildContainment:");
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
      GEORPPlaceContainmentCorrectionsReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_2394);
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
  *(_BYTE *)&self->_flags |= 9u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEORPPlaceContainmentCorrections readAll:](self, "readAll:", 0);
    -[GEORPContainmentCorrection clearUnknownFields:](self->_parentContainment, "clearUnknownFields:", 1);
    -[GEORPContainmentCorrection clearUnknownFields:](self->_childContainment, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentContainment, 0);
  objc_storeStrong((id *)&self->_childContainment, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
