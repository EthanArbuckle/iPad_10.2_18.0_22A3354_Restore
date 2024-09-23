@implementation GEORPFeedbackCoordinateField

- (GEORPFeedbackCoordinateField)init
{
  GEORPFeedbackCoordinateField *v2;
  GEORPFeedbackCoordinateField *v3;
  GEORPFeedbackCoordinateField *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPFeedbackCoordinateField;
  v2 = -[GEORPFeedbackCoordinateField init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPFeedbackCoordinateField)initWithData:(id)a3
{
  GEORPFeedbackCoordinateField *v3;
  GEORPFeedbackCoordinateField *v4;
  GEORPFeedbackCoordinateField *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPFeedbackCoordinateField;
  v3 = -[GEORPFeedbackCoordinateField initWithData:](&v7, sel_initWithData_, a3);
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
        GEORPFeedbackCoordinateFieldReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOriginal_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasOriginal
{
  -[GEORPFeedbackCoordinateField _readOriginal]((uint64_t)self);
  return self->_original != 0;
}

- (GEOLatLng)original
{
  -[GEORPFeedbackCoordinateField _readOriginal]((uint64_t)self);
  return self->_original;
}

- (void)setOriginal:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_original, a3);
}

- (void)_readEdited
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
        GEORPFeedbackCoordinateFieldReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEdited_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasEdited
{
  -[GEORPFeedbackCoordinateField _readEdited]((uint64_t)self);
  return self->_edited != 0;
}

- (GEOLatLng)edited
{
  -[GEORPFeedbackCoordinateField _readEdited]((uint64_t)self);
  return self->_edited;
}

- (void)setEdited:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x12u;
  objc_storeStrong((id *)&self->_edited, a3);
}

- (void)_readEditedTile
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
        GEORPFeedbackCoordinateFieldReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEditedTile_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasEditedTile
{
  -[GEORPFeedbackCoordinateField _readEditedTile]((uint64_t)self);
  return self->_editedTile != 0;
}

- (GEORPFeedbackTileFeatureInfo)editedTile
{
  -[GEORPFeedbackCoordinateField _readEditedTile]((uint64_t)self);
  return self->_editedTile;
}

- (void)setEditedTile:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x11u;
  objc_storeStrong((id *)&self->_editedTile, a3);
}

- (void)_readOriginalTile
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
        GEORPFeedbackCoordinateFieldReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOriginalTile_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasOriginalTile
{
  -[GEORPFeedbackCoordinateField _readOriginalTile]((uint64_t)self);
  return self->_originalTile != 0;
}

- (GEORPFeedbackTileFeatureInfo)originalTile
{
  -[GEORPFeedbackCoordinateField _readOriginalTile]((uint64_t)self);
  return self->_originalTile;
}

- (void)setOriginalTile:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_originalTile, a3);
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
  v8.super_class = (Class)GEORPFeedbackCoordinateField;
  -[GEORPFeedbackCoordinateField description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPFeedbackCoordinateField dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackCoordinateField _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
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
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;

  if (a1)
  {
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
    objc_msgSend(a1, "edited");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v8, "jsonRepresentation");
      else
        objc_msgSend(v8, "dictionaryRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("edited"));

    }
    objc_msgSend(a1, "editedTile");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v11, "jsonRepresentation");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = CFSTR("editedTile");
      }
      else
      {
        objc_msgSend(v11, "dictionaryRepresentation");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = CFSTR("edited_tile");
      }
      objc_msgSend(v4, "setObject:forKey:", v13, v14);

    }
    objc_msgSend(a1, "originalTile");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v15, "jsonRepresentation");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = CFSTR("originalTile");
      }
      else
      {
        objc_msgSend(v15, "dictionaryRepresentation");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = CFSTR("original_tile");
      }
      objc_msgSend(v4, "setObject:forKey:", v17, v18);

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
  return -[GEORPFeedbackCoordinateField _dictionaryRepresentation:](self, 1);
}

- (GEORPFeedbackCoordinateField)initWithDictionary:(id)a3
{
  return (GEORPFeedbackCoordinateField *)-[GEORPFeedbackCoordinateField _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  GEOLatLng *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  GEOLatLng *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  GEORPFeedbackTileFeatureInfo *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  GEORPFeedbackTileFeatureInfo *v21;
  uint64_t v22;
  void *v23;

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
        v7 = [GEOLatLng alloc];
        if ((a3 & 1) != 0)
          v8 = -[GEOLatLng initWithJSON:](v7, "initWithJSON:", v6);
        else
          v8 = -[GEOLatLng initWithDictionary:](v7, "initWithDictionary:", v6);
        v9 = (void *)v8;
        objc_msgSend(a1, "setOriginal:", v8);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("edited"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = [GEOLatLng alloc];
        if ((a3 & 1) != 0)
          v12 = -[GEOLatLng initWithJSON:](v11, "initWithJSON:", v10);
        else
          v12 = -[GEOLatLng initWithDictionary:](v11, "initWithDictionary:", v10);
        v13 = (void *)v12;
        objc_msgSend(a1, "setEdited:", v12);

      }
      if (a3)
        v14 = CFSTR("editedTile");
      else
        v14 = CFSTR("edited_tile");
      objc_msgSend(v5, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = [GEORPFeedbackTileFeatureInfo alloc];
        if ((a3 & 1) != 0)
          v17 = -[GEORPFeedbackTileFeatureInfo initWithJSON:](v16, "initWithJSON:", v15);
        else
          v17 = -[GEORPFeedbackTileFeatureInfo initWithDictionary:](v16, "initWithDictionary:", v15);
        v18 = (void *)v17;
        objc_msgSend(a1, "setEditedTile:", v17);

      }
      if (a3)
        v19 = CFSTR("originalTile");
      else
        v19 = CFSTR("original_tile");
      objc_msgSend(v5, "objectForKeyedSubscript:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v21 = [GEORPFeedbackTileFeatureInfo alloc];
        if ((a3 & 1) != 0)
          v22 = -[GEORPFeedbackTileFeatureInfo initWithJSON:](v21, "initWithJSON:", v20);
        else
          v22 = -[GEORPFeedbackTileFeatureInfo initWithDictionary:](v21, "initWithDictionary:", v20);
        v23 = (void *)v22;
        objc_msgSend(a1, "setOriginalTile:", v22);

      }
    }
  }

  return a1;
}

- (GEORPFeedbackCoordinateField)initWithJSON:(id)a3
{
  return (GEORPFeedbackCoordinateField *)-[GEORPFeedbackCoordinateField _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_50;
    else
      v8 = (int *)&readAll__nonRecursiveTag_50;
    GEORPFeedbackCoordinateFieldReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEORPFeedbackCoordinateFieldCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackCoordinateFieldIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackCoordinateFieldReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && !_GEORPFeedbackCoordinateFieldIsDirty((uint64_t)self))
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
    -[GEORPFeedbackCoordinateField readAll:](self, "readAll:", 0);
    if (self->_original)
      PBDataWriterWriteSubmessage();
    if (self->_edited)
      PBDataWriterWriteSubmessage();
    if (self->_editedTile)
      PBDataWriterWriteSubmessage();
    if (self->_originalTile)
      PBDataWriterWriteSubmessage();
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEORPFeedbackCoordinateField _readEdited]((uint64_t)self);
  if (-[GEOLatLng hasGreenTeaWithValue:](self->_edited, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEORPFeedbackCoordinateField _readOriginal]((uint64_t)self);
  return -[GEOLatLng hasGreenTeaWithValue:](self->_original, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEORPFeedbackCoordinateField readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 12) = self->_readerMarkPos;
  *((_DWORD *)v5 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_original)
    objc_msgSend(v5, "setOriginal:");
  if (self->_edited)
    objc_msgSend(v5, "setEdited:");
  v4 = v5;
  if (self->_editedTile)
  {
    objc_msgSend(v5, "setEditedTile:");
    v4 = v5;
  }
  if (self->_originalTile)
  {
    objc_msgSend(v5, "setOriginalTile:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

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
    -[GEORPFeedbackCoordinateField readAll:](self, "readAll:", 0);
    v8 = -[GEOLatLng copyWithZone:](self->_original, "copyWithZone:", a3);
    v9 = (void *)v5[5];
    v5[5] = v8;

    v10 = -[GEOLatLng copyWithZone:](self->_edited, "copyWithZone:", a3);
    v11 = (void *)v5[3];
    v5[3] = v10;

    v12 = -[GEORPFeedbackTileFeatureInfo copyWithZone:](self->_editedTile, "copyWithZone:", a3);
    v13 = (void *)v5[2];
    v5[2] = v12;

    v14 = -[GEORPFeedbackTileFeatureInfo copyWithZone:](self->_originalTile, "copyWithZone:", a3);
    v7 = (PBDataReader *)v5[4];
    v5[4] = v14;
    goto LABEL_6;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEORPFeedbackCoordinateFieldReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEOLatLng *original;
  GEOLatLng *edited;
  GEORPFeedbackTileFeatureInfo *editedTile;
  GEORPFeedbackTileFeatureInfo *originalTile;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEORPFeedbackCoordinateField readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         original = self->_original,
         !((unint64_t)original | v4[5]))
     || -[GEOLatLng isEqual:](original, "isEqual:"))
    && ((edited = self->_edited, !((unint64_t)edited | v4[3])) || -[GEOLatLng isEqual:](edited, "isEqual:"))
    && ((editedTile = self->_editedTile, !((unint64_t)editedTile | v4[2]))
     || -[GEORPFeedbackTileFeatureInfo isEqual:](editedTile, "isEqual:")))
  {
    originalTile = self->_originalTile;
    if ((unint64_t)originalTile | v4[4])
      v9 = -[GEORPFeedbackTileFeatureInfo isEqual:](originalTile, "isEqual:");
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
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  -[GEORPFeedbackCoordinateField readAll:](self, "readAll:", 1);
  v3 = -[GEOLatLng hash](self->_original, "hash");
  v4 = -[GEOLatLng hash](self->_edited, "hash") ^ v3;
  v5 = -[GEORPFeedbackTileFeatureInfo hash](self->_editedTile, "hash");
  return v4 ^ v5 ^ -[GEORPFeedbackTileFeatureInfo hash](self->_originalTile, "hash");
}

- (void)mergeFrom:(id)a3
{
  GEOLatLng *original;
  uint64_t v5;
  GEOLatLng *edited;
  uint64_t v7;
  GEORPFeedbackTileFeatureInfo *editedTile;
  uint64_t v9;
  GEORPFeedbackTileFeatureInfo *originalTile;
  uint64_t v11;
  _QWORD *v12;

  v12 = a3;
  objc_msgSend(v12, "readAll:", 0);
  original = self->_original;
  v5 = v12[5];
  if (original)
  {
    if (v5)
      -[GEOLatLng mergeFrom:](original, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEORPFeedbackCoordinateField setOriginal:](self, "setOriginal:");
  }
  edited = self->_edited;
  v7 = v12[3];
  if (edited)
  {
    if (v7)
      -[GEOLatLng mergeFrom:](edited, "mergeFrom:");
  }
  else if (v7)
  {
    -[GEORPFeedbackCoordinateField setEdited:](self, "setEdited:");
  }
  editedTile = self->_editedTile;
  v9 = v12[2];
  if (editedTile)
  {
    if (v9)
      -[GEORPFeedbackTileFeatureInfo mergeFrom:](editedTile, "mergeFrom:");
  }
  else if (v9)
  {
    -[GEORPFeedbackCoordinateField setEditedTile:](self, "setEditedTile:");
  }
  originalTile = self->_originalTile;
  v11 = v12[4];
  if (originalTile)
  {
    if (v11)
      -[GEORPFeedbackTileFeatureInfo mergeFrom:](originalTile, "mergeFrom:");
  }
  else if (v11)
  {
    -[GEORPFeedbackCoordinateField setOriginalTile:](self, "setOriginalTile:");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_original, 0);
  objc_storeStrong((id *)&self->_originalTile, 0);
  objc_storeStrong((id *)&self->_edited, 0);
  objc_storeStrong((id *)&self->_editedTile, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
