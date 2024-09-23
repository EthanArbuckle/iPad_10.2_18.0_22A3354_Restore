@implementation GEOLogMsgEventShowcaseSuppression

- (GEOLogMsgEventShowcaseSuppression)init
{
  GEOLogMsgEventShowcaseSuppression *v2;
  GEOLogMsgEventShowcaseSuppression *v3;
  GEOLogMsgEventShowcaseSuppression *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgEventShowcaseSuppression;
  v2 = -[GEOLogMsgEventShowcaseSuppression init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgEventShowcaseSuppression)initWithData:(id)a3
{
  GEOLogMsgEventShowcaseSuppression *v3;
  GEOLogMsgEventShowcaseSuppression *v4;
  GEOLogMsgEventShowcaseSuppression *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgEventShowcaseSuppression;
  v3 = -[GEOLogMsgEventShowcaseSuppression initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (unint64_t)businessId
{
  return self->_businessId;
}

- (void)setBusinessId:(unint64_t)a3
{
  *(_BYTE *)&self->_flags |= 0x21u;
  self->_businessId = a3;
}

- (void)setHasBusinessId:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasBusinessId
{
  return *(_BYTE *)&self->_flags & 1;
}

- (int)localSearchProviderID
{
  return self->_localSearchProviderID;
}

- (void)setLocalSearchProviderID:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x22u;
  self->_localSearchProviderID = a3;
}

- (void)setHasLocalSearchProviderID:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 34;
  else
    v3 = 32;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasLocalSearchProviderID
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (void)_readShowcaseId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 60) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventShowcaseSuppressionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readShowcaseId_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasShowcaseId
{
  -[GEOLogMsgEventShowcaseSuppression _readShowcaseId]((uint64_t)self);
  return self->_showcaseId != 0;
}

- (NSString)showcaseId
{
  -[GEOLogMsgEventShowcaseSuppression _readShowcaseId]((uint64_t)self);
  return self->_showcaseId;
}

- (void)setShowcaseId:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_showcaseId, a3);
}

- (int)suppressionReason
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 4) != 0)
    return self->_suppressionReason;
  else
    return 0;
}

- (void)setSuppressionReason:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x24u;
  self->_suppressionReason = a3;
}

- (void)setHasSuppressionReason:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 36;
  else
    v3 = 32;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasSuppressionReason
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (id)suppressionReasonAsString:(int)a3
{
  if (a3 < 0xA)
    return off_1E1C22860[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSuppressionReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHOWCASE_OTHER_SUPPRESSION_REASON")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHOWCASE_DIRECTIONS_UNAVAILABLE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHOWCASE_APP_EXTENSION_UNAVAILABLE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHOWCASE_APP_CLIP_UNAVAILABLE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHOWCASE_APP_QUICK_LINK_UNAVAILABLE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHOWCASE_PHONE_NUMBER_UNAVAILABLE")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHOWCASE_MESSAGE_URL_UNAVAILABLE")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHOWCASE_WEBSITE_URL_UNAVAILABLE")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHOWCASE_ARP_RATING_UNSUPPORTED")) & 1) != 0)
  {
    v4 = 8;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SHOWCASE_ARP_PHOTOS_UNSUPPORTED")))
  {
    v4 = 9;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readAdamId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 60) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventShowcaseSuppressionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAdamId_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasAdamId
{
  -[GEOLogMsgEventShowcaseSuppression _readAdamId]((uint64_t)self);
  return self->_adamId != 0;
}

- (NSString)adamId
{
  -[GEOLogMsgEventShowcaseSuppression _readAdamId]((uint64_t)self);
  return self->_adamId;
}

- (void)setAdamId:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_adamId, a3);
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
  v8.super_class = (Class)GEOLogMsgEventShowcaseSuppression;
  -[GEOLogMsgEventShowcaseSuppression description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgEventShowcaseSuppression dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventShowcaseSuppression _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  __CFString *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_BYTE *)(a1 + 60);
    if ((v5 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 24));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v7 = CFSTR("businessId");
      else
        v7 = CFSTR("business_id");
      objc_msgSend(v4, "setObject:forKey:", v6, v7);

      v5 = *(_BYTE *)(a1 + 60);
    }
    if ((v5 & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 52));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("localSearchProviderID"));

    }
    objc_msgSend((id)a1, "showcaseId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if (a2)
        v10 = CFSTR("showcaseId");
      else
        v10 = CFSTR("showcase_id");
      objc_msgSend(v4, "setObject:forKey:", v9, v10);
    }

    if ((*(_BYTE *)(a1 + 60) & 4) != 0)
    {
      v11 = *(int *)(a1 + 56);
      if (v11 >= 0xA)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 56));
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = off_1E1C22860[v11];
      }
      if (a2)
        v13 = CFSTR("suppressionReason");
      else
        v13 = CFSTR("suppression_reason");
      objc_msgSend(v4, "setObject:forKey:", v12, v13);

    }
    objc_msgSend((id)a1, "adamId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      if (a2)
        v15 = CFSTR("adamId");
      else
        v15 = CFSTR("adam_id");
      objc_msgSend(v4, "setObject:forKey:", v14, v15);
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
  return -[GEOLogMsgEventShowcaseSuppression _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventShowcaseSuppression)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventShowcaseSuppression *)-[GEOLogMsgEventShowcaseSuppression _initWithDictionary:isJSON:](self, a3, 0);
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
  const __CFString *v12;
  void *v13;
  id v14;
  uint64_t v15;
  const __CFString *v16;
  void *v17;
  void *v18;

  v5 = a2;
  if (!a1)
    goto LABEL_50;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_50;
  if (a3)
    v6 = CFSTR("businessId");
  else
    v6 = CFSTR("business_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setBusinessId:", objc_msgSend(v7, "unsignedLongLongValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("localSearchProviderID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setLocalSearchProviderID:", objc_msgSend(v8, "intValue"));

  if (a3)
    v9 = CFSTR("showcaseId");
  else
    v9 = CFSTR("showcase_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(a1, "setShowcaseId:", v11);

  }
  if (a3)
    v12 = CFSTR("suppressionReason");
  else
    v12 = CFSTR("suppression_reason");
  objc_msgSend(v5, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = v13;
    if ((objc_msgSend(v14, "isEqualToString:", CFSTR("SHOWCASE_OTHER_SUPPRESSION_REASON")) & 1) != 0)
    {
      v15 = 0;
    }
    else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("SHOWCASE_DIRECTIONS_UNAVAILABLE")) & 1) != 0)
    {
      v15 = 1;
    }
    else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("SHOWCASE_APP_EXTENSION_UNAVAILABLE")) & 1) != 0)
    {
      v15 = 2;
    }
    else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("SHOWCASE_APP_CLIP_UNAVAILABLE")) & 1) != 0)
    {
      v15 = 3;
    }
    else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("SHOWCASE_APP_QUICK_LINK_UNAVAILABLE")) & 1) != 0)
    {
      v15 = 4;
    }
    else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("SHOWCASE_PHONE_NUMBER_UNAVAILABLE")) & 1) != 0)
    {
      v15 = 5;
    }
    else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("SHOWCASE_MESSAGE_URL_UNAVAILABLE")) & 1) != 0)
    {
      v15 = 6;
    }
    else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("SHOWCASE_WEBSITE_URL_UNAVAILABLE")) & 1) != 0)
    {
      v15 = 7;
    }
    else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("SHOWCASE_ARP_RATING_UNSUPPORTED")) & 1) != 0)
    {
      v15 = 8;
    }
    else if (objc_msgSend(v14, "isEqualToString:", CFSTR("SHOWCASE_ARP_PHOTOS_UNSUPPORTED")))
    {
      v15 = 9;
    }
    else
    {
      v15 = 0;
    }

    goto LABEL_43;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = objc_msgSend(v13, "intValue");
LABEL_43:
    objc_msgSend(a1, "setSuppressionReason:", v15);
  }

  if (a3)
    v16 = CFSTR("adamId");
  else
    v16 = CFSTR("adam_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = (void *)objc_msgSend(v17, "copy");
    objc_msgSend(a1, "setAdamId:", v18);

  }
LABEL_50:

  return a1;
}

- (GEOLogMsgEventShowcaseSuppression)initWithJSON:(id)a3
{
  return (GEOLogMsgEventShowcaseSuppression *)-[GEOLogMsgEventShowcaseSuppression _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_4045;
    else
      v8 = (int *)&readAll__nonRecursiveTag_4046;
    GEOLogMsgEventShowcaseSuppressionReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventShowcaseSuppressionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventShowcaseSuppressionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  char flags;
  PBDataReader *v6;
  void *v7;
  id v8;

  v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x38) == 0))
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
    -[GEOLogMsgEventShowcaseSuppression readAll:](self, "readAll:", 0);
    flags = (char)self->_flags;
    if ((flags & 1) != 0)
    {
      PBDataWriterWriteUint64Field();
      flags = (char)self->_flags;
    }
    if ((flags & 2) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_showcaseId)
      PBDataWriterWriteStringField();
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_adamId)
      PBDataWriterWriteStringField();
  }

}

- (void)copyTo:(id)a3
{
  id *v4;
  char flags;
  id *v6;

  v6 = (id *)a3;
  -[GEOLogMsgEventShowcaseSuppression readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 10) = self->_readerMarkPos;
  *((_DWORD *)v6 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    v6[3] = (id)self->_businessId;
    *((_BYTE *)v6 + 60) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v6 + 13) = self->_localSearchProviderID;
    *((_BYTE *)v6 + 60) |= 2u;
  }
  if (self->_showcaseId)
  {
    objc_msgSend(v6, "setShowcaseId:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    *((_DWORD *)v4 + 14) = self->_suppressionReason;
    *((_BYTE *)v4 + 60) |= 4u;
  }
  if (self->_adamId)
  {
    objc_msgSend(v6, "setAdamId:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  char flags;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x20) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOLogMsgEventShowcaseSuppressionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_12;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOLogMsgEventShowcaseSuppression readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_businessId;
    *(_BYTE *)(v5 + 60) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 52) = self->_localSearchProviderID;
    *(_BYTE *)(v5 + 60) |= 2u;
  }
  v10 = -[NSString copyWithZone:](self->_showcaseId, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v10;

  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_suppressionReason;
    *(_BYTE *)(v5 + 60) |= 4u;
  }
  v12 = -[NSString copyWithZone:](self->_adamId, "copyWithZone:", a3);
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v12;
LABEL_12:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char flags;
  char v6;
  NSString *showcaseId;
  NSString *adamId;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  -[GEOLogMsgEventShowcaseSuppression readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = (char)self->_flags;
  v6 = *((_BYTE *)v4 + 60);
  if ((flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) == 0 || self->_businessId != *((_QWORD *)v4 + 3))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
    goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 2) == 0 || self->_localSearchProviderID != *((_DWORD *)v4 + 13))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)v4 + 60) & 2) != 0)
  {
    goto LABEL_22;
  }
  showcaseId = self->_showcaseId;
  if ((unint64_t)showcaseId | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](showcaseId, "isEqual:"))
    {
LABEL_22:
      v9 = 0;
      goto LABEL_23;
    }
    flags = (char)self->_flags;
    v6 = *((_BYTE *)v4 + 60);
  }
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_suppressionReason != *((_DWORD *)v4 + 14))
      goto LABEL_22;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_22;
  }
  adamId = self->_adamId;
  if ((unint64_t)adamId | *((_QWORD *)v4 + 2))
    v9 = -[NSString isEqual:](adamId, "isEqual:");
  else
    v9 = 1;
LABEL_23:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;

  -[GEOLogMsgEventShowcaseSuppression readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v3 = 2654435761u * self->_businessId;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_localSearchProviderID;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NSString hash](self->_showcaseId, "hash");
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    v6 = 2654435761 * self->_suppressionReason;
  else
    v6 = 0;
  return v4 ^ v3 ^ v6 ^ v5 ^ -[NSString hash](self->_adamId, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  char v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "readAll:", 0);
  v4 = v6;
  v5 = *((_BYTE *)v6 + 60);
  if ((v5 & 1) != 0)
  {
    self->_businessId = *((_QWORD *)v6 + 3);
    *(_BYTE *)&self->_flags |= 1u;
    v5 = *((_BYTE *)v6 + 60);
  }
  if ((v5 & 2) != 0)
  {
    self->_localSearchProviderID = *((_DWORD *)v6 + 13);
    *(_BYTE *)&self->_flags |= 2u;
  }
  if (*((_QWORD *)v6 + 4))
  {
    -[GEOLogMsgEventShowcaseSuppression setShowcaseId:](self, "setShowcaseId:");
    v4 = v6;
  }
  if ((v4[15] & 4) != 0)
  {
    self->_suppressionReason = v4[14];
    *(_BYTE *)&self->_flags |= 4u;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[GEOLogMsgEventShowcaseSuppression setAdamId:](self, "setAdamId:");
    v4 = v6;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_showcaseId, 0);
  objc_storeStrong((id *)&self->_adamId, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
