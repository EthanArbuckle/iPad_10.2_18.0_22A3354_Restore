@implementation GEOPDSearchQueryNeuralRewriteMetadata

- (GEOPDSearchQueryNeuralRewriteMetadata)init
{
  GEOPDSearchQueryNeuralRewriteMetadata *v2;
  GEOPDSearchQueryNeuralRewriteMetadata *v3;
  GEOPDSearchQueryNeuralRewriteMetadata *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchQueryNeuralRewriteMetadata;
  v2 = -[GEOPDSearchQueryNeuralRewriteMetadata init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchQueryNeuralRewriteMetadata)initWithData:(id)a3
{
  GEOPDSearchQueryNeuralRewriteMetadata *v3;
  GEOPDSearchQueryNeuralRewriteMetadata *v4;
  GEOPDSearchQueryNeuralRewriteMetadata *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchQueryNeuralRewriteMetadata;
  v3 = -[GEOPDSearchQueryNeuralRewriteMetadata initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
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
  v8.super_class = (Class)GEOPDSearchQueryNeuralRewriteMetadata;
  -[GEOPDSearchQueryNeuralRewriteMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchQueryNeuralRewriteMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchQueryNeuralRewriteMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  const __CFString *v8;
  double v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  id v13;
  id v14;
  const __CFString *v15;
  void *v16;
  id v17;
  id v18;
  const __CFString *v19;

  if (a1)
  {
    -[GEOPDSearchQueryNeuralRewriteMetadata readAll:](a1, 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 56) & 4) == 0)
    {
      v5 = *(void **)(a1 + 8);
      if (v5)
      {
        v6 = v5;
        objc_sync_enter(v6);
        GEOPDSearchQueryNeuralRewriteMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readModelId_tags);
        objc_sync_exit(v6);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    v7 = *(id *)(a1 + 24);
    if (v7)
    {
      if (a2)
        v8 = CFSTR("modelId");
      else
        v8 = CFSTR("model_id");
      objc_msgSend(v4, "setObject:forKey:", v7, v8);
    }

    if ((*(_BYTE *)(a1 + 56) & 1) != 0)
    {
      LODWORD(v9) = *(_DWORD *)(a1 + 52);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v11 = CFSTR("modelScore");
      else
        v11 = CFSTR("model_score");
      objc_msgSend(v4, "setObject:forKey:", v10, v11);

    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 56) & 2) == 0)
    {
      v12 = *(void **)(a1 + 8);
      if (v12)
      {
        v13 = v12;
        objc_sync_enter(v13);
        GEOPDSearchQueryNeuralRewriteMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readInputQuery_tags);
        objc_sync_exit(v13);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    v14 = *(id *)(a1 + 16);
    if (v14)
    {
      if (a2)
        v15 = CFSTR("inputQuery");
      else
        v15 = CFSTR("input_query");
      objc_msgSend(v4, "setObject:forKey:", v14, v15);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 56) & 8) == 0)
    {
      v16 = *(void **)(a1 + 8);
      if (v16)
      {
        v17 = v16;
        objc_sync_enter(v17);
        GEOPDSearchQueryNeuralRewriteMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRewrittenQuery_tags_1380);
        objc_sync_exit(v17);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    v18 = *(id *)(a1 + 32);
    if (v18)
    {
      if (a2)
        v19 = CFSTR("rewrittenQuery");
      else
        v19 = CFSTR("rewritten_query");
      objc_msgSend(v4, "setObject:forKey:", v18, v19);
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
  return -[GEOPDSearchQueryNeuralRewriteMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_1393;
      else
        v6 = (int *)&readAll__nonRecursiveTag_1394;
      GEOPDSearchQueryNeuralRewriteMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchQueryNeuralRewriteMetadataReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x1E) == 0))
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
    -[GEOPDSearchQueryNeuralRewriteMetadata readAll:]((uint64_t)self, 0);
    if (self->_modelId)
      PBDataWriterWriteStringField();
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteFloatField();
    if (self->_inputQuery)
      PBDataWriterWriteStringField();
    if (self->_rewrittenQuery)
      PBDataWriterWriteStringField();
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
  uint64_t v13;

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
      GEOPDSearchQueryNeuralRewriteMetadataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchQueryNeuralRewriteMetadata readAll:]((uint64_t)self, 0);
  v9 = -[NSString copyWithZone:](self->_modelId, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(float *)(v5 + 52) = self->_modelScore;
    *(_BYTE *)(v5 + 56) |= 1u;
  }
  v11 = -[NSString copyWithZone:](self->_inputQuery, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v11;

  v13 = -[NSString copyWithZone:](self->_rewrittenQuery, "copyWithZone:", a3);
  v8 = *(id *)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v13;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *modelId;
  NSString *inputQuery;
  NSString *rewrittenQuery;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  -[GEOPDSearchQueryNeuralRewriteMetadata readAll:]((uint64_t)self, 1);
  -[GEOPDSearchQueryNeuralRewriteMetadata readAll:]((uint64_t)v4, 1);
  modelId = self->_modelId;
  if ((unint64_t)modelId | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](modelId, "isEqual:"))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_modelScore != *((float *)v4 + 13))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  inputQuery = self->_inputQuery;
  if ((unint64_t)inputQuery | *((_QWORD *)v4 + 2) && !-[NSString isEqual:](inputQuery, "isEqual:"))
    goto LABEL_13;
  rewrittenQuery = self->_rewrittenQuery;
  if ((unint64_t)rewrittenQuery | *((_QWORD *)v4 + 4))
    v8 = -[NSString isEqual:](rewrittenQuery, "isEqual:");
  else
    v8 = 1;
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  float modelScore;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  NSUInteger v10;

  -[GEOPDSearchQueryNeuralRewriteMetadata readAll:]((uint64_t)self, 1);
  v3 = -[NSString hash](self->_modelId, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    modelScore = self->_modelScore;
    v6 = modelScore;
    if (modelScore < 0.0)
      v6 = -modelScore;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  v9 = v4 ^ v3;
  v10 = -[NSString hash](self->_inputQuery, "hash");
  return v9 ^ v10 ^ -[NSString hash](self->_rewrittenQuery, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rewrittenQuery, 0);
  objc_storeStrong((id *)&self->_modelId, 0);
  objc_storeStrong((id *)&self->_inputQuery, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
