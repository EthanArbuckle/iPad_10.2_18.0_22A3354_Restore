@implementation GEOReview

- (GEOReview)init
{
  GEOReview *v2;
  GEOReview *v3;
  GEOReview *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOReview;
  v2 = -[GEOReview init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOReview)initWithData:(id)a3
{
  GEOReview *v3;
  GEOReview *v4;
  GEOReview *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOReview;
  v3 = -[GEOReview initWithData:](&v7, sel_initWithData_, a3);
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
  v8.super_class = (Class)GEOReview;
  -[GEOReview description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOReview dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOReview _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  __int16 v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  _QWORD v31[4];
  id v32;

  if (!a1)
    return 0;
  -[GEOReview readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
  if ((*(_WORD *)(a1 + 88) & 0x40) == 0)
  {
    v5 = *(void **)(a1 + 8);
    if (v5)
    {
      v6 = v5;
      objc_sync_enter(v6);
      GEOReviewReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSnippet_tags);
      objc_sync_exit(v6);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  v7 = *(id *)(a1 + 56);
  if (v7)
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("snippet"));

  v8 = *(_WORD *)(a1 + 88);
  if ((v8 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("score"));

    v8 = *(_WORD *)(a1 + 88);
  }
  if ((v8 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("reviewTime"));

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
  if ((*(_WORD *)(a1 + 88) & 0x20) == 0)
  {
    v11 = *(void **)(a1 + 8);
    if (v11)
    {
      v12 = v11;
      objc_sync_enter(v12);
      GEOReviewReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readReviewer_tags_0);
      objc_sync_exit(v12);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  v13 = *(id *)(a1 + 40);
  v14 = v13;
  if (v13)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v13, "jsonRepresentation");
    else
      objc_msgSend(v13, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("reviewer"));

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
  if ((*(_WORD *)(a1 + 88) & 0x80) == 0)
  {
    v16 = *(void **)(a1 + 8);
    if (v16)
    {
      v17 = v16;
      objc_sync_enter(v17);
      GEOReviewReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUid_tags_2646);
      objc_sync_exit(v17);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  v18 = *(id *)(a1 + 64);
  if (v18)
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("uid"));

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
  if ((*(_WORD *)(a1 + 88) & 0x10) == 0)
  {
    v19 = *(void **)(a1 + 8);
    if (v19)
    {
      v20 = v19;
      objc_sync_enter(v20);
      GEOReviewReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLanguageCode_tags_2647);
      objc_sync_exit(v20);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  v21 = *(id *)(a1 + 24);
  if (v21)
    objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("languageCode"));

  if ((*(_WORD *)(a1 + 88) & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 84));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v23 = CFSTR("isChinaSuppressed");
    else
      v23 = CFSTR("is_china_suppressed");
    objc_msgSend(v4, "setObject:forKey:", v22, v23);

  }
  v24 = *(void **)(a1 + 16);
  if (v24)
  {
    objc_msgSend(v24, "dictionaryRepresentation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v25, "count"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __39__GEOReview__dictionaryRepresentation___block_invoke;
      v31[3] = &unk_1E1C00600;
      v28 = v27;
      v32 = v28;
      objc_msgSend(v26, "enumerateKeysAndObjectsUsingBlock:", v31);
      v29 = v28;

      v26 = v29;
    }
    objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOReview _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_2659_0;
      else
        v6 = (int *)&readAll__nonRecursiveTag_2660_0;
      GEOReviewReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      -[GEOUser readAll:](*(_QWORD *)(a1 + 40), 1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

void __39__GEOReview__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)readFrom:(id)a3
{
  return GEOReviewReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;
  GEOUser *reviewer;
  BOOL IsDirty;
  __int16 v8;
  id v9;
  PBDataReader *v10;
  void *v11;
  id v12;

  v12 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader)
    goto LABEL_8;
  os_unfair_lock_assert_owner(&self->_readerLock);
  flags = (__int16)self->_flags;
  if ((flags & 0x140) != 0)
    goto LABEL_8;
  if ((flags & 0x20) != 0)
  {
    reviewer = self->_reviewer;
    if (reviewer)
    {
      os_unfair_lock_lock_with_options();
      IsDirty = _GEOUserIsDirty((uint64_t)reviewer);
      os_unfair_lock_unlock(&reviewer->_readerLock);
      if (IsDirty)
        goto LABEL_8;
      flags = (__int16)self->_flags;
    }
  }
  if ((flags & 0x90) == 0)
  {
    v10 = self->_reader;
    objc_sync_enter(v10);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "writeData:", v11);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
    goto LABEL_23;
  }
LABEL_8:
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOReview readAll:]((uint64_t)self, 0);
  if (self->_snippet)
    PBDataWriterWriteStringField();
  v8 = (__int16)self->_flags;
  v9 = v12;
  if ((v8 & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    v9 = v12;
    v8 = (__int16)self->_flags;
  }
  if ((v8 & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v9 = v12;
  }
  if (self->_reviewer)
  {
    PBDataWriterWriteSubmessage();
    v9 = v12;
  }
  if (self->_uid)
  {
    PBDataWriterWriteStringField();
    v9 = v12;
  }
  if (self->_languageCode)
  {
    PBDataWriterWriteStringField();
    v9 = v12;
  }
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    v9 = v12;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v9);
LABEL_23:

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
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  PBUnknownFields *v18;

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
      GEOReviewReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_12;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOReview readAll:]((uint64_t)self, 0);
  v9 = -[NSString copyWithZone:](self->_snippet, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v9;

  flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    *(double *)(v5 + 48) = self->_score;
    *(_WORD *)(v5 + 88) |= 2u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *(double *)(v5 + 32) = self->_reviewTime;
    *(_WORD *)(v5 + 88) |= 1u;
  }
  v12 = -[GEOUser copyWithZone:](self->_reviewer, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v12;

  v14 = -[NSString copyWithZone:](self->_uid, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v14;

  v16 = -[NSString copyWithZone:](self->_languageCode, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v16;

  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    *(_BYTE *)(v5 + 84) = self->_isChinaSuppressed;
    *(_WORD *)(v5 + 88) |= 4u;
  }
  v18 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v18;
LABEL_12:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *snippet;
  __int16 flags;
  __int16 v7;
  GEOUser *reviewer;
  NSString *uid;
  NSString *languageCode;
  __int16 v11;
  BOOL v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  -[GEOReview readAll:]((uint64_t)self, 1);
  -[GEOReview readAll:]((uint64_t)v4, 1);
  snippet = self->_snippet;
  if ((unint64_t)snippet | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](snippet, "isEqual:"))
      goto LABEL_22;
  }
  flags = (__int16)self->_flags;
  v7 = *((_WORD *)v4 + 44);
  if ((flags & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_score != *((double *)v4 + 6))
      goto LABEL_22;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_22;
  }
  if ((flags & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_reviewTime != *((double *)v4 + 4))
      goto LABEL_22;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_22;
  }
  reviewer = self->_reviewer;
  if ((unint64_t)reviewer | *((_QWORD *)v4 + 5) && !-[GEOUser isEqual:](reviewer, "isEqual:"))
    goto LABEL_22;
  uid = self->_uid;
  if ((unint64_t)uid | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](uid, "isEqual:"))
      goto LABEL_22;
  }
  languageCode = self->_languageCode;
  if ((unint64_t)languageCode | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](languageCode, "isEqual:"))
      goto LABEL_22;
  }
  v11 = *((_WORD *)v4 + 44);
  v12 = (v11 & 4) == 0;
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    if ((v11 & 4) == 0)
    {
LABEL_22:
      v12 = 0;
      goto LABEL_23;
    }
    if (self->_isChinaSuppressed)
    {
      if (!*((_BYTE *)v4 + 84))
        goto LABEL_22;
    }
    else if (*((_BYTE *)v4 + 84))
    {
      goto LABEL_22;
    }
    v12 = 1;
  }
LABEL_23:

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3;
  __int16 flags;
  unint64_t v5;
  double score;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  double reviewTime;
  double v12;
  long double v13;
  double v14;
  unint64_t v15;
  NSUInteger v16;
  NSUInteger v17;
  uint64_t v18;

  -[GEOReview readAll:]((uint64_t)self, 1);
  v3 = -[NSString hash](self->_snippet, "hash");
  flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    score = self->_score;
    v7 = -score;
    if (score >= 0.0)
      v7 = self->_score;
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
  {
    reviewTime = self->_reviewTime;
    v12 = -reviewTime;
    if (reviewTime >= 0.0)
      v12 = self->_reviewTime;
    v13 = floor(v12 + 0.5);
    v14 = (v12 - v13) * 1.84467441e19;
    v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0)
        v10 += (unint64_t)v14;
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    v10 = 0;
  }
  v15 = -[GEOUser hash](self->_reviewer, "hash");
  v16 = -[NSString hash](self->_uid, "hash");
  v17 = -[NSString hash](self->_languageCode, "hash");
  if ((*(_WORD *)&self->_flags & 4) != 0)
    v18 = 2654435761 * self->_isChinaSuppressed;
  else
    v18 = 0;
  return v5 ^ v3 ^ v10 ^ v15 ^ v16 ^ v17 ^ v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uid, 0);
  objc_storeStrong((id *)&self->_snippet, 0);
  objc_storeStrong((id *)&self->_reviewer, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
