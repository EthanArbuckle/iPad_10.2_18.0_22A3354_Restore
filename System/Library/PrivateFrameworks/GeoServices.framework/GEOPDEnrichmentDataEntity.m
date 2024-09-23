@implementation GEOPDEnrichmentDataEntity

- (GEOPDEnrichmentDataEntity)init
{
  GEOPDEnrichmentDataEntity *v2;
  GEOPDEnrichmentDataEntity *v3;
  GEOPDEnrichmentDataEntity *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDEnrichmentDataEntity;
  v2 = -[GEOPDEnrichmentDataEntity init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDEnrichmentDataEntity)initWithData:(id)a3
{
  GEOPDEnrichmentDataEntity *v3;
  GEOPDEnrichmentDataEntity *v4;
  GEOPDEnrichmentDataEntity *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDEnrichmentDataEntity;
  v3 = -[GEOPDEnrichmentDataEntity initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readEnrichmentInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 72) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDEnrichmentDataEntityReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEnrichmentInfo_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)enrichmentInfo
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDEnrichmentDataEntity _readEnrichmentInfo]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (void)_readHtml
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 72) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDEnrichmentDataEntityReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readHtml_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)html
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDEnrichmentDataEntity _readHtml]((uint64_t)a1);
    a1 = (id *)v1[6];
  }
  return a1;
}

- (void)_readEnrichmentMetadata
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 72) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDEnrichmentDataEntityReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEnrichmentMetadata_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)enrichmentMetadata
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDEnrichmentDataEntity _readEnrichmentMetadata]((uint64_t)a1);
    a1 = (id *)v1[5];
  }
  return a1;
}

- (void)_readAdamIds
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 72) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDEnrichmentDataEntityReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAdamIds_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)adamIds
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDEnrichmentDataEntity _readAdamIds]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (void)addAdamId:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDEnrichmentDataEntity _readAdamIds](a1);
    -[GEOPDEnrichmentDataEntity _addNoFlagsAdamId:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 72) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(_BYTE *)(a1 + 72) |= 0x40u;
  }
}

- (void)_addNoFlagsAdamId:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 24);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = v5;

      v4 = *(void **)(a1 + 24);
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
  v8.super_class = (Class)GEOPDEnrichmentDataEntity;
  -[GEOPDEnrichmentDataEntity description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDEnrichmentDataEntity dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDEnrichmentDataEntity _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __CFString *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  _QWORD v25[4];
  id v26;

  if (!a1)
    return 0;
  -[GEOPDEnrichmentDataEntity readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDEnrichmentDataEntity enrichmentInfo]((id *)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("enrichmentInfo");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("enrichment_info");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  -[GEOPDEnrichmentDataEntity html]((id *)a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("html"));

  -[GEOPDEnrichmentDataEntity enrichmentMetadata]((id *)a1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v10, "base64EncodedStringWithOptions:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("enrichmentMetadata"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("enrichment_metadata"));
    }
  }

  if ((*(_BYTE *)(a1 + 72) & 1) != 0)
  {
    v13 = *(int *)(a1 + 68);
    if (v13 >= 0xA)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 68));
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = off_1E1C0B958[v13];
    }
    if (a2)
      v15 = CFSTR("suppressionReason");
    else
      v15 = CFSTR("suppression_reason");
    objc_msgSend(v4, "setObject:forKey:", v14, v15);

  }
  if (*(_QWORD *)(a1 + 24))
  {
    -[GEOPDEnrichmentDataEntity adamIds]((id *)a1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v17 = CFSTR("adamId");
    else
      v17 = CFSTR("adam_id");
    objc_msgSend(v4, "setObject:forKey:", v16, v17);

  }
  v18 = *(void **)(a1 + 16);
  if (v18)
  {
    objc_msgSend(v18, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v19, "count"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __55__GEOPDEnrichmentDataEntity__dictionaryRepresentation___block_invoke;
      v25[3] = &unk_1E1C00600;
      v22 = v21;
      v26 = v22;
      objc_msgSend(v20, "enumerateKeysAndObjectsUsingBlock:", v25);
      v23 = v22;

      v20 = v23;
    }
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDEnrichmentDataEntity _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_3265;
      else
        v6 = (int *)&readAll__nonRecursiveTag_3266;
      GEOPDEnrichmentDataEntityReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      -[GEOPDEnrichmentInfo readAll:](*(_QWORD *)(a1 + 32), 1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

void __55__GEOPDEnrichmentDataEntity__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDEnrichmentDataEntityReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  char flags;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  PBDataReader *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader)
    goto LABEL_7;
  os_unfair_lock_assert_owner(&self->_readerLock);
  flags = (char)self->_flags;
  if ((flags & 0x40) != 0)
    goto LABEL_7;
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if (GEOPDEnrichmentInfoIsDirty((uint64_t)self->_enrichmentInfo))
      goto LABEL_7;
    flags = (char)self->_flags;
  }
  if ((flags & 0x34) == 0)
  {
    v11 = self->_reader;
    objc_sync_enter(v11);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v12);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v11);
    goto LABEL_23;
  }
LABEL_7:
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDEnrichmentDataEntity readAll:]((uint64_t)self, 0);
  if (self->_enrichmentInfo)
    PBDataWriterWriteSubmessage();
  if (self->_html)
    PBDataWriterWriteStringField();
  if (self->_enrichmentMetadata)
    PBDataWriterWriteDataField();
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    PBDataWriterWriteInt32Field();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = self->_adamIds;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v7);
        PBDataWriterWriteStringField();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v13);
LABEL_23:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  PBUnknownFields *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x40) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDEnrichmentDataEntityReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_15;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDEnrichmentDataEntity readAll:]((uint64_t)self, 0);
  v9 = -[GEOPDEnrichmentInfo copyWithZone:](self->_enrichmentInfo, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v9;

  v11 = -[NSString copyWithZone:](self->_html, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v11;

  v13 = -[NSData copyWithZone:](self->_enrichmentMetadata, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v13;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 68) = self->_suppressionReason;
    *(_BYTE *)(v5 + 72) |= 1u;
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v15 = self->_adamIds;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v15);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v22);
        -[GEOPDEnrichmentDataEntity addAdamId:](v5, v19);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v16);
  }

  v20 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v20;
LABEL_15:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOPDEnrichmentInfo *enrichmentInfo;
  NSString *html;
  NSData *enrichmentMetadata;
  NSMutableArray *adamIds;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  -[GEOPDEnrichmentDataEntity readAll:]((uint64_t)self, 1);
  -[GEOPDEnrichmentDataEntity readAll:]((uint64_t)v4, 1);
  enrichmentInfo = self->_enrichmentInfo;
  if ((unint64_t)enrichmentInfo | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOPDEnrichmentInfo isEqual:](enrichmentInfo, "isEqual:"))
      goto LABEL_15;
  }
  html = self->_html;
  if ((unint64_t)html | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](html, "isEqual:"))
      goto LABEL_15;
  }
  enrichmentMetadata = self->_enrichmentMetadata;
  if ((unint64_t)enrichmentMetadata | *((_QWORD *)v4 + 5))
  {
    if (!-[NSData isEqual:](enrichmentMetadata, "isEqual:"))
      goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 1) == 0 || self->_suppressionReason != *((_DWORD *)v4 + 17))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 72) & 1) != 0)
  {
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
  adamIds = self->_adamIds;
  if ((unint64_t)adamIds | *((_QWORD *)v4 + 3))
    v9 = -[NSMutableArray isEqual:](adamIds, "isEqual:");
  else
    v9 = 1;
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;

  -[GEOPDEnrichmentDataEntity readAll:]((uint64_t)self, 1);
  v3 = -[GEOPDEnrichmentInfo hash](self->_enrichmentInfo, "hash");
  v4 = -[NSString hash](self->_html, "hash");
  v5 = -[NSData hash](self->_enrichmentMetadata, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v6 = 2654435761 * self->_suppressionReason;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ -[NSMutableArray hash](self->_adamIds, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_html, 0);
  objc_storeStrong((id *)&self->_enrichmentMetadata, 0);
  objc_storeStrong((id *)&self->_enrichmentInfo, 0);
  objc_storeStrong((id *)&self->_adamIds, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
