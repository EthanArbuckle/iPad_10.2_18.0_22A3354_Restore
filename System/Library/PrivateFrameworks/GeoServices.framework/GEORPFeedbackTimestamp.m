@implementation GEORPFeedbackTimestamp

- (GEORPFeedbackTimestamp)init
{
  GEORPFeedbackTimestamp *v2;
  GEORPFeedbackTimestamp *v3;
  GEORPFeedbackTimestamp *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPFeedbackTimestamp;
  v2 = -[GEORPFeedbackTimestamp init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPFeedbackTimestamp)initWithData:(id)a3
{
  GEORPFeedbackTimestamp *v3;
  GEORPFeedbackTimestamp *v4;
  GEORPFeedbackTimestamp *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPFeedbackTimestamp;
  v3 = -[GEORPFeedbackTimestamp initWithData:](&v7, sel_initWithData_, a3);
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(_BYTE *)(a1 + 44) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackTimestampReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOriginal_tags_864);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasOriginal
{
  -[GEORPFeedbackTimestamp _readOriginal]((uint64_t)self);
  return self->_original != 0;
}

- (GEORPTimestamp)original
{
  -[GEORPFeedbackTimestamp _readOriginal]((uint64_t)self);
  return self->_original;
}

- (void)setOriginal:(id)a3
{
  *(_BYTE *)&self->_flags |= 6u;
  objc_storeStrong((id *)&self->_original, a3);
}

- (void)_readEdited
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
        GEORPFeedbackTimestampReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEdited_tags_865);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasEdited
{
  -[GEORPFeedbackTimestamp _readEdited]((uint64_t)self);
  return self->_edited != 0;
}

- (GEORPTimestamp)edited
{
  -[GEORPFeedbackTimestamp _readEdited]((uint64_t)self);
  return self->_edited;
}

- (void)setEdited:(id)a3
{
  *(_BYTE *)&self->_flags |= 5u;
  objc_storeStrong((id *)&self->_edited, a3);
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
  v8.super_class = (Class)GEORPFeedbackTimestamp;
  -[GEORPFeedbackTimestamp description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPFeedbackTimestamp dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackTimestamp _dictionaryRepresentation:](self, 0);
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
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPFeedbackTimestamp _dictionaryRepresentation:](self, 1);
}

- (GEORPFeedbackTimestamp)initWithDictionary:(id)a3
{
  return (GEORPFeedbackTimestamp *)-[GEORPFeedbackTimestamp _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5;
  void *v6;
  GEORPTimestamp *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  GEORPTimestamp *v11;
  uint64_t v12;
  void *v13;

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
        v7 = [GEORPTimestamp alloc];
        if ((a3 & 1) != 0)
          v8 = -[GEORPTimestamp initWithJSON:](v7, "initWithJSON:", v6);
        else
          v8 = -[GEORPTimestamp initWithDictionary:](v7, "initWithDictionary:", v6);
        v9 = (void *)v8;
        objc_msgSend(a1, "setOriginal:", v8);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("edited"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = [GEORPTimestamp alloc];
        if ((a3 & 1) != 0)
          v12 = -[GEORPTimestamp initWithJSON:](v11, "initWithJSON:", v10);
        else
          v12 = -[GEORPTimestamp initWithDictionary:](v11, "initWithDictionary:", v10);
        v13 = (void *)v12;
        objc_msgSend(a1, "setEdited:", v12);

      }
    }
  }

  return a1;
}

- (GEORPFeedbackTimestamp)initWithJSON:(id)a3
{
  return (GEORPFeedbackTimestamp *)-[GEORPFeedbackTimestamp _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_867;
    else
      v8 = (int *)&readAll__nonRecursiveTag_868;
    GEORPFeedbackTimestampReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEORPTimestamp readAll:](self->_original, "readAll:", 1);
    -[GEORPTimestamp readAll:](self->_edited, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackTimestampIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackTimestampReadAllFrom((uint64_t)self, a3, 0);
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
    -[GEORPFeedbackTimestamp readAll:](self, "readAll:", 0);
    if (self->_original)
      PBDataWriterWriteSubmessage();
    if (self->_edited)
      PBDataWriterWriteSubmessage();
  }

}

- (void)copyTo:(id)a3
{
  id *v4;

  v4 = (id *)a3;
  -[GEORPFeedbackTimestamp readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 8) = self->_readerMarkPos;
  *((_DWORD *)v4 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_original)
    objc_msgSend(v4, "setOriginal:");
  if (self->_edited)
    objc_msgSend(v4, "setEdited:");

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
    -[GEORPFeedbackTimestamp readAll:](self, "readAll:", 0);
    v8 = -[GEORPTimestamp copyWithZone:](self->_original, "copyWithZone:", a3);
    v9 = (void *)v5[3];
    v5[3] = v8;

    v10 = -[GEORPTimestamp copyWithZone:](self->_edited, "copyWithZone:", a3);
    v7 = (PBDataReader *)v5[2];
    v5[2] = v10;
    goto LABEL_6;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEORPFeedbackTimestampReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEORPTimestamp *original;
  GEORPTimestamp *edited;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEORPFeedbackTimestamp readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         original = self->_original,
         !((unint64_t)original | v4[3]))
     || -[GEORPTimestamp isEqual:](original, "isEqual:")))
  {
    edited = self->_edited;
    if ((unint64_t)edited | v4[2])
      v7 = -[GEORPTimestamp isEqual:](edited, "isEqual:");
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

  -[GEORPFeedbackTimestamp readAll:](self, "readAll:", 1);
  v3 = -[GEORPTimestamp hash](self->_original, "hash");
  return -[GEORPTimestamp hash](self->_edited, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  GEORPTimestamp *original;
  uint64_t v5;
  GEORPTimestamp *edited;
  uint64_t v7;
  _QWORD *v8;

  v8 = a3;
  objc_msgSend(v8, "readAll:", 0);
  original = self->_original;
  v5 = v8[3];
  if (original)
  {
    if (v5)
      -[GEORPTimestamp mergeFrom:](original, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEORPFeedbackTimestamp setOriginal:](self, "setOriginal:");
  }
  edited = self->_edited;
  v7 = v8[2];
  if (edited)
  {
    if (v7)
      -[GEORPTimestamp mergeFrom:](edited, "mergeFrom:");
  }
  else if (v7)
  {
    -[GEORPFeedbackTimestamp setEdited:](self, "setEdited:");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_original, 0);
  objc_storeStrong((id *)&self->_edited, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
