@implementation GEOPDSearchQueryCompletionMetadata

- (GEOPDSearchQueryCompletionMetadata)init
{
  GEOPDSearchQueryCompletionMetadata *v2;
  GEOPDSearchQueryCompletionMetadata *v3;
  GEOPDSearchQueryCompletionMetadata *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchQueryCompletionMetadata;
  v2 = -[GEOPDSearchQueryCompletionMetadata init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchQueryCompletionMetadata)initWithData:(id)a3
{
  GEOPDSearchQueryCompletionMetadata *v3;
  GEOPDSearchQueryCompletionMetadata *v4;
  GEOPDSearchQueryCompletionMetadata *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchQueryCompletionMetadata;
  v3 = -[GEOPDSearchQueryCompletionMetadata initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDSearchQueryCompletionMetadata;
  -[GEOPDSearchQueryCompletionMetadata dealloc](&v3, sel_dealloc);
}

- (void)_readTokens
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
  if ((*(_WORD *)(a1 + 112) & 0x80) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDSearchQueryCompletionMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTokens_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
}

- (void)addTokens:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDSearchQueryCompletionMetadata _readTokens](a1);
    -[GEOPDSearchQueryCompletionMetadata _addNoFlagsTokens:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 112) |= 0x80u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    *(_WORD *)(a1 + 112) |= 0x100u;
  }
}

- (void)_addNoFlagsTokens:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 80);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 80);
      *(_QWORD *)(a1 + 80) = v5;

      v4 = *(void **)(a1 + 80);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

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
  v8.super_class = (Class)GEOPDSearchQueryCompletionMetadata;
  -[GEOPDSearchQueryCompletionMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchQueryCompletionMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchQueryCompletionMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  double v8;
  __int16 v9;
  void *v10;
  void *v11;
  void *v12;
  __int16 v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  id v18;
  void *v19;
  _QWORD *v20;
  unint64_t v21;
  uint64_t v22;
  __CFString *v23;
  const __CFString *v24;

  if (a1)
  {
    -[GEOPDSearchQueryCompletionMetadata readAll:](a1, 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 112) & 0x40) == 0)
    {
      v5 = *(void **)(a1 + 8);
      if (v5)
      {
        v6 = v5;
        objc_sync_enter(v6);
        GEOPDSearchQueryCompletionMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCompletion_tags_0);
        objc_sync_exit(v6);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    v7 = *(id *)(a1 + 64);
    if (v7)
      objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("completion"));

    v9 = *(_WORD *)(a1 + 112);
    if ((v9 & 2) != 0)
    {
      LODWORD(v8) = *(_DWORD *)(a1 + 100);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("score"));

      v9 = *(_WORD *)(a1 + 112);
    }
    if ((v9 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 72));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("popularity"));

    }
    if (*(_QWORD *)(a1 + 48))
    {
      PBRepeatedInt32NSArray();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("tags"));

    }
    v13 = *(_WORD *)(a1 + 112);
    if ((v13 & 4) != 0)
    {
      LODWORD(v8) = *(_DWORD *)(a1 + 104);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v15 = CFSTR("tagConfidence");
      else
        v15 = CFSTR("tag_confidence");
      objc_msgSend(v4, "setObject:forKey:", v14, v15);

      v13 = *(_WORD *)(a1 + 112);
    }
    if ((v13 & 8) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 108));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v17 = CFSTR("isCompletematch");
      else
        v17 = CFSTR("is_completeMatch");
      objc_msgSend(v4, "setObject:forKey:", v16, v17);

    }
    if (*(_QWORD *)(a1 + 80))
    {
      -[GEOPDSearchQueryCompletionMetadata _readTokens](a1);
      v18 = *(id *)(a1 + 80);
      objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("tokens"));

    }
    if (*(_QWORD *)(a1 + 24))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (_QWORD *)(a1 + 16);
      if (*(_QWORD *)(a1 + 24))
      {
        v21 = 0;
        do
        {
          v22 = *(int *)(*v20 + 4 * v21);
          if (v22 >= 0xF)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v22);
            v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v23 = off_1E1C0AB10[v22];
          }
          objc_msgSend(v19, "addObject:", v23);

          ++v21;
          v20 = (_QWORD *)(a1 + 16);
        }
        while (v21 < *(_QWORD *)(a1 + 24));
      }
      if (a2)
        v24 = CFSTR("completionSourceTypes");
      else
        v24 = CFSTR("completion_source_types");
      objc_msgSend(v4, "setObject:forKey:", v19, v24);

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
  return -[GEOPDSearchQueryCompletionMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_906;
      else
        v6 = (int *)&readAll__nonRecursiveTag_907;
      GEOPDSearchQueryCompletionMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchQueryCompletionMetadataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  __int16 flags;
  unint64_t v7;
  __int16 v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_completionSourceTypes;
  unint64_t v14;
  PBDataReader *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0x1F0) == 0))
  {
    v15 = self->_reader;
    objc_sync_enter(v15);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v16);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v15);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchQueryCompletionMetadata readAll:]((uint64_t)self, 0);
    if (self->_completion)
      PBDataWriterWriteStringField();
    flags = (__int16)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteFloatField();
      flags = (__int16)self->_flags;
    }
    if ((flags & 1) != 0)
      PBDataWriterWriteInt64Field();
    if (self->_tags.count)
    {
      v7 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v7;
      }
      while (v7 < self->_tags.count);
    }
    v8 = (__int16)self->_flags;
    if ((v8 & 4) != 0)
    {
      PBDataWriterWriteFloatField();
      v8 = (__int16)self->_flags;
    }
    if ((v8 & 8) != 0)
      PBDataWriterWriteBOOLField();
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = self->_tokens;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v9);
          PBDataWriterWriteStringField();
        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v10);
    }

    p_completionSourceTypes = &self->_completionSourceTypes;
    if (p_completionSourceTypes->count)
    {
      v14 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v14;
      }
      while (v14 < p_completionSourceTypes->count);
    }
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
  __int16 flags;
  __int16 v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x100) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDSearchQueryCompletionMetadataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchQueryCompletionMetadata readAll:]((uint64_t)self, 0);
  v9 = -[NSString copyWithZone:](self->_completion, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v9;

  flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    *(float *)(v5 + 100) = self->_score;
    *(_WORD *)(v5 + 112) |= 2u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 72) = self->_popularity;
    *(_WORD *)(v5 + 112) |= 1u;
  }
  PBRepeatedInt32Copy();
  v12 = (__int16)self->_flags;
  if ((v12 & 4) != 0)
  {
    *(float *)(v5 + 104) = self->_tagConfidence;
    *(_WORD *)(v5 + 112) |= 4u;
    v12 = (__int16)self->_flags;
  }
  if ((v12 & 8) != 0)
  {
    *(_BYTE *)(v5 + 108) = self->_isCompletematch;
    *(_WORD *)(v5 + 112) |= 8u;
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v13 = self->_tokens;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v13);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v19);
        -[GEOPDSearchQueryCompletionMetadata addTokens:](v5, v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v14);
  }

  PBRepeatedInt32Copy();
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *completion;
  __int16 flags;
  __int16 v7;
  __int16 v8;
  __int16 v9;
  NSMutableArray *tokens;
  char IsEqual;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_31;
  -[GEOPDSearchQueryCompletionMetadata readAll:]((uint64_t)self, 1);
  -[GEOPDSearchQueryCompletionMetadata readAll:]((uint64_t)v4, 1);
  completion = self->_completion;
  if ((unint64_t)completion | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](completion, "isEqual:"))
      goto LABEL_31;
  }
  flags = (__int16)self->_flags;
  v7 = *((_WORD *)v4 + 56);
  if ((flags & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_score != *((float *)v4 + 25))
      goto LABEL_31;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_31;
  }
  if ((flags & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_popularity != *((_QWORD *)v4 + 9))
      goto LABEL_31;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_31;
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_31;
  v8 = (__int16)self->_flags;
  v9 = *((_WORD *)v4 + 56);
  if ((v8 & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_tagConfidence != *((float *)v4 + 26))
      goto LABEL_31;
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_31;
  }
  if ((v8 & 8) != 0)
  {
    if ((v9 & 8) != 0)
    {
      if (self->_isCompletematch)
      {
        if (!*((_BYTE *)v4 + 108))
          goto LABEL_31;
        goto LABEL_28;
      }
      if (!*((_BYTE *)v4 + 108))
        goto LABEL_28;
    }
LABEL_31:
    IsEqual = 0;
    goto LABEL_32;
  }
  if ((v9 & 8) != 0)
    goto LABEL_31;
LABEL_28:
  tokens = self->_tokens;
  if ((unint64_t)tokens | *((_QWORD *)v4 + 10) && !-[NSMutableArray isEqual:](tokens, "isEqual:"))
    goto LABEL_31;
  IsEqual = PBRepeatedInt32IsEqual();
LABEL_32:

  return IsEqual;
}

- (unint64_t)hash
{
  NSUInteger v3;
  __int16 flags;
  unint64_t v5;
  float score;
  double v7;
  long double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  __int16 v12;
  unint64_t v13;
  float tagConfidence;
  double v15;
  long double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;

  -[GEOPDSearchQueryCompletionMetadata readAll:]((uint64_t)self, 1);
  v3 = -[NSString hash](self->_completion, "hash");
  flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    score = self->_score;
    v7 = score;
    if (score < 0.0)
      v7 = -score;
    v8 = floor(v7 + 0.5);
    v9 = (v7 - v8) * 1.84467441e19;
    v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    v5 = 0;
  }
  if ((flags & 1) != 0)
    v10 = 2654435761 * self->_popularity;
  else
    v10 = 0;
  v11 = PBRepeatedInt32Hash();
  v12 = (__int16)self->_flags;
  if ((v12 & 4) != 0)
  {
    tagConfidence = self->_tagConfidence;
    v15 = tagConfidence;
    if (tagConfidence < 0.0)
      v15 = -tagConfidence;
    v16 = floor(v15 + 0.5);
    v17 = (v15 - v16) * 1.84467441e19;
    v13 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
    if (v17 >= 0.0)
    {
      if (v17 > 0.0)
        v13 += (unint64_t)v17;
    }
    else
    {
      v13 -= (unint64_t)fabs(v17);
    }
  }
  else
  {
    v13 = 0;
  }
  if ((v12 & 8) != 0)
    v18 = 2654435761 * self->_isCompletematch;
  else
    v18 = 0;
  v19 = v5 ^ v3 ^ v10 ^ v11 ^ v13 ^ v18 ^ -[NSMutableArray hash](self->_tokens, "hash");
  return v19 ^ PBRepeatedInt32Hash();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_completion, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
