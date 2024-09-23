@implementation GEOPDSearchRichBrandMetadata

- (GEOPDSearchRichBrandMetadata)init
{
  GEOPDSearchRichBrandMetadata *v2;
  GEOPDSearchRichBrandMetadata *v3;
  GEOPDSearchRichBrandMetadata *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchRichBrandMetadata;
  v2 = -[GEOPDSearchRichBrandMetadata init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchRichBrandMetadata)initWithData:(id)a3
{
  GEOPDSearchRichBrandMetadata *v3;
  GEOPDSearchRichBrandMetadata *v4;
  GEOPDSearchRichBrandMetadata *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchRichBrandMetadata;
  v3 = -[GEOPDSearchRichBrandMetadata initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)addBrandRelationshipInfo:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 60) & 4) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchRichBrandMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBrandRelationshipInfos_tags_1694);
        objc_sync_exit(v5);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    -[GEOPDSearchRichBrandMetadata _addNoFlagsBrandRelationshipInfo:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 60) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    *(_BYTE *)(a1 + 60) |= 0x10u;
  }
}

- (void)_addNoFlagsBrandRelationshipInfo:(uint64_t)a1
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

- (void)addPreferredCategory:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 60) & 8) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchRichBrandMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPreferredCategorys_tags);
        objc_sync_exit(v5);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    -[GEOPDSearchRichBrandMetadata _addNoFlagsPreferredCategory:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 60) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    *(_BYTE *)(a1 + 60) |= 0x10u;
  }
}

- (void)_addNoFlagsPreferredCategory:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 40);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 40);
      *(_QWORD *)(a1 + 40) = v5;

      v4 = *(void **)(a1 + 40);
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
  v8.super_class = (Class)GEOPDSearchRichBrandMetadata;
  -[GEOPDSearchRichBrandMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchRichBrandMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchRichBrandMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  const __CFString *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDSearchRichBrandMetadata readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 60) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("muid"));

  }
  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v7 = *(id *)(a1 + 24);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v34 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v11, "jsonRepresentation");
          else
            objc_msgSend(v11, "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v8);
    }

    if (a2)
      v13 = CFSTR("brandRelationshipInfo");
    else
      v13 = CFSTR("brand_relationship_info");
    objc_msgSend(v4, "setObject:forKey:", v6, v13);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
  if ((*(_BYTE *)(a1 + 60) & 2) == 0)
  {
    v14 = *(void **)(a1 + 8);
    if (v14)
    {
      v15 = v14;
      objc_sync_enter(v15);
      GEOPDSearchRichBrandMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBrandDensity_tags_1695);
      objc_sync_exit(v15);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  v16 = *(id *)(a1 + 16);
  v17 = v16;
  if (v16)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v16, "jsonRepresentation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = CFSTR("brandDensity");
    }
    else
    {
      objc_msgSend(v16, "dictionaryRepresentation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = CFSTR("brand_density");
    }
    objc_msgSend(v4, "setObject:forKey:", v18, v19);

  }
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v21 = *(id *)(a1 + 40);
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v30;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v30 != v23)
            objc_enumerationMutation(v21);
          v25 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v25, "jsonRepresentation");
          else
            objc_msgSend(v25, "dictionaryRepresentation", (_QWORD)v29);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v26, (_QWORD)v29);

        }
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v22);
    }

    if (a2)
      v27 = CFSTR("preferredCategory");
    else
      v27 = CFSTR("preferred_category");
    objc_msgSend(v4, "setObject:forKey:", v20, v27, (_QWORD)v29);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchRichBrandMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_1701;
      else
        v6 = (int *)&readAll__nonRecursiveTag_1702;
      GEOPDSearchRichBrandMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDSearchRichBrandMetadataCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchRichBrandMetadataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  PBDataReader *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x1E) == 0))
  {
    v14 = self->_reader;
    objc_sync_enter(v14);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v15);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v14);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchRichBrandMetadata readAll:]((uint64_t)self, 0);
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteUint64Field();
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = self->_brandRelationshipInfos;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v7);
    }

    if (self->_brandDensity)
      PBDataWriterWriteSubmessage();
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v10 = self->_preferredCategorys;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v17;
      do
      {
        for (j = 0; j != v11; ++j)
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteSubmessage();
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      }
      while (v11);
    }

  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  NSMutableArray *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
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
      GEOPDSearchRichBrandMetadataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (NSMutableArray *)(id)v5;
      objc_sync_exit(v7);

      goto LABEL_21;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchRichBrandMetadata readAll:]((uint64_t)self, 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 32) = self->_muid;
    *(_BYTE *)(v5 + 60) |= 1u;
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = self->_brandRelationshipInfos;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v9);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "copyWithZone:", a3);
        -[GEOPDSearchRichBrandMetadata addBrandRelationshipInfo:](v5, v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v10);
  }

  v14 = -[GEOPDSearchBrandDensity copyWithZone:](self->_brandDensity, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v14;

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = self->_preferredCategorys;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v8);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v21);
        -[GEOPDSearchRichBrandMetadata addPreferredCategory:](v5, v19);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v16);
  }
LABEL_21:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *brandRelationshipInfos;
  GEOPDSearchBrandDensity *brandDensity;
  NSMutableArray *preferredCategorys;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  -[GEOPDSearchRichBrandMetadata readAll:]((uint64_t)self, 1);
  -[GEOPDSearchRichBrandMetadata readAll:]((uint64_t)v4, 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) == 0 || self->_muid != *((_QWORD *)v4 + 4))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  brandRelationshipInfos = self->_brandRelationshipInfos;
  if ((unint64_t)brandRelationshipInfos | *((_QWORD *)v4 + 3)
    && !-[NSMutableArray isEqual:](brandRelationshipInfos, "isEqual:"))
  {
    goto LABEL_13;
  }
  brandDensity = self->_brandDensity;
  if ((unint64_t)brandDensity | *((_QWORD *)v4 + 2))
  {
    if (!-[GEOPDSearchBrandDensity isEqual:](brandDensity, "isEqual:"))
      goto LABEL_13;
  }
  preferredCategorys = self->_preferredCategorys;
  if ((unint64_t)preferredCategorys | *((_QWORD *)v4 + 5))
    v8 = -[NSMutableArray isEqual:](preferredCategorys, "isEqual:");
  else
    v8 = 1;
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;

  -[GEOPDSearchRichBrandMetadata readAll:]((uint64_t)self, 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761u * self->_muid;
  else
    v3 = 0;
  v4 = -[NSMutableArray hash](self->_brandRelationshipInfos, "hash") ^ v3;
  v5 = -[GEOPDSearchBrandDensity hash](self->_brandDensity, "hash");
  return v4 ^ v5 ^ -[NSMutableArray hash](self->_preferredCategorys, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredCategorys, 0);
  objc_storeStrong((id *)&self->_brandRelationshipInfos, 0);
  objc_storeStrong((id *)&self->_brandDensity, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
