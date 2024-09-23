@implementation GEORPFeedbackTextField

- (GEORPFeedbackTextField)init
{
  GEORPFeedbackTextField *v2;
  GEORPFeedbackTextField *v3;
  GEORPFeedbackTextField *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPFeedbackTextField;
  v2 = -[GEORPFeedbackTextField init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPFeedbackTextField)initWithData:(id)a3
{
  GEORPFeedbackTextField *v3;
  GEORPFeedbackTextField *v4;
  GEORPFeedbackTextField *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPFeedbackTextField;
  v3 = -[GEORPFeedbackTextField initWithData:](&v7, sel_initWithData_, a3);
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
        GEORPFeedbackTextFieldReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOriginal_tags_783);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasOriginal
{
  -[GEORPFeedbackTextField _readOriginal]((uint64_t)self);
  return self->_original != 0;
}

- (NSString)original
{
  -[GEORPFeedbackTextField _readOriginal]((uint64_t)self);
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
        GEORPFeedbackTextFieldReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEdited_tags_784);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasEdited
{
  -[GEORPFeedbackTextField _readEdited]((uint64_t)self);
  return self->_edited != 0;
}

- (NSString)edited
{
  -[GEORPFeedbackTextField _readEdited]((uint64_t)self);
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
  v8.super_class = (Class)GEORPFeedbackTextField;
  -[GEORPFeedbackTextField description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPFeedbackTextField dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_dictionaryRepresentation:(void *)a1
{
  void *v2;
  void *v3;
  void *v4;

  if (a1)
  {
    objc_msgSend(a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "original");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("original"));

    objc_msgSend(a1, "edited");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("edited"));

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (GEORPFeedbackTextField)initWithDictionary:(id)a3
{
  return (GEORPFeedbackTextField *)-[GEORPFeedbackTextField _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("original"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = (void *)objc_msgSend(v4, "copy");
        objc_msgSend(a1, "setOriginal:", v5);

      }
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("edited"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = (void *)objc_msgSend(v6, "copy");
        objc_msgSend(a1, "setEdited:", v7);

      }
    }
  }

  return a1;
}

- (GEORPFeedbackTextField)initWithJSON:(id)a3
{
  return (GEORPFeedbackTextField *)-[GEORPFeedbackTextField _initWithDictionary:isJSON:](self, a3);
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
      v8 = (int *)&readAll__recursiveTag_785;
    else
      v8 = (int *)&readAll__nonRecursiveTag_786;
    GEORPFeedbackTextFieldReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackTextFieldIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackTextFieldReadAllFrom((uint64_t)self, a3, 0);
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
    -[GEORPFeedbackTextField readAll:](self, "readAll:", 0);
    if (self->_original)
      PBDataWriterWriteStringField();
    if (self->_edited)
      PBDataWriterWriteStringField();
  }

}

- (void)copyTo:(id)a3
{
  id *v4;

  v4 = (id *)a3;
  -[GEORPFeedbackTextField readAll:](self, "readAll:", 0);
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
    -[GEORPFeedbackTextField readAll:](self, "readAll:", 0);
    v8 = -[NSString copyWithZone:](self->_original, "copyWithZone:", a3);
    v9 = (void *)v5[3];
    v5[3] = v8;

    v10 = -[NSString copyWithZone:](self->_edited, "copyWithZone:", a3);
    v7 = (PBDataReader *)v5[2];
    v5[2] = v10;
    goto LABEL_6;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEORPFeedbackTextFieldReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *original;
  NSString *edited;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEORPFeedbackTextField readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         original = self->_original,
         !((unint64_t)original | v4[3]))
     || -[NSString isEqual:](original, "isEqual:")))
  {
    edited = self->_edited;
    if ((unint64_t)edited | v4[2])
      v7 = -[NSString isEqual:](edited, "isEqual:");
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

  -[GEORPFeedbackTextField readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_original, "hash");
  return -[NSString hash](self->_edited, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if (v4[3])
    -[GEORPFeedbackTextField setOriginal:](self, "setOriginal:");
  if (v4[2])
    -[GEORPFeedbackTextField setEdited:](self, "setEdited:");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_original, 0);
  objc_storeStrong((id *)&self->_edited, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
