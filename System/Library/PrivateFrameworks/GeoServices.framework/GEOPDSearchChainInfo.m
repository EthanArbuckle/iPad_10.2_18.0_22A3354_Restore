@implementation GEOPDSearchChainInfo

- (GEOPDSearchChainInfo)init
{
  GEOPDSearchChainInfo *v2;
  GEOPDSearchChainInfo *v3;
  GEOPDSearchChainInfo *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchChainInfo;
  v2 = -[GEOPDSearchChainInfo init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchChainInfo)initWithData:(id)a3
{
  GEOPDSearchChainInfo *v3;
  GEOPDSearchChainInfo *v4;
  GEOPDSearchChainInfo *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchChainInfo;
  v3 = -[GEOPDSearchChainInfo initWithData:](&v7, sel_initWithData_, a3);
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
  v3.receiver = self;
  v3.super_class = (Class)GEOPDSearchChainInfo;
  -[GEOPDSearchChainInfo dealloc](&v3, sel_dealloc);
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
  v8.super_class = (Class)GEOPDSearchChainInfo;
  -[GEOPDSearchChainInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchChainInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchChainInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  unint64_t v8;
  uint64_t v9;
  __CFString *v10;
  const __CFString *v11;
  void *v12;
  id v13;
  id v14;
  const __CFString *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  const __CFString *v21;

  if (a1)
  {
    -[GEOPDSearchChainInfo readAll:](a1, 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 56));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("muid"));

    if (*(_QWORD *)(a1 + 24))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (_QWORD *)(a1 + 16);
      if (*(_QWORD *)(a1 + 24))
      {
        v8 = 0;
        do
        {
          v9 = *(unsigned int *)(*v7 + 4 * v8);
          if ((v9 - 1) >= 9)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v9);
            v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v10 = off_1E1C0A5F8[(int)v9 - 1];
          }
          objc_msgSend(v6, "addObject:", v10);

          ++v8;
          v7 = (_QWORD *)(a1 + 16);
        }
        while (v8 < *(_QWORD *)(a1 + 24));
      }
      if (a2)
        v11 = CFSTR("relationshipType");
      else
        v11 = CFSTR("relationship_type");
      objc_msgSend(v4, "setObject:forKey:", v6, v11);

    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 4) == 0)
    {
      v12 = *(void **)(a1 + 8);
      if (v12)
      {
        v13 = v12;
        objc_sync_enter(v13);
        GEOPDSearchChainInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBrandDisplayName_tags);
        objc_sync_exit(v13);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    v14 = *(id *)(a1 + 48);
    if (v14)
    {
      if (a2)
        v15 = CFSTR("brandDisplayName");
      else
        v15 = CFSTR("brand_display_name");
      objc_msgSend(v4, "setObject:forKey:", v14, v15);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 2) == 0)
    {
      v16 = *(void **)(a1 + 8);
      if (v16)
      {
        v17 = v16;
        objc_sync_enter(v17);
        GEOPDSearchChainInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBrandDensity_tags);
        objc_sync_exit(v17);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    v18 = *(id *)(a1 + 40);
    v19 = v18;
    if (v18)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v18, "jsonRepresentation");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = CFSTR("brandDensity");
      }
      else
      {
        objc_msgSend(v18, "dictionaryRepresentation");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = CFSTR("brand_density");
      }
      objc_msgSend(v4, "setObject:forKey:", v20, v21);

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
  return -[GEOPDSearchChainInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_384;
      else
        v6 = (int *)&readAll__nonRecursiveTag_385;
      GEOPDSearchChainInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  const __CFString *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  void *v16;
  id v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  id v21;
  const __CFString *v22;
  void *v23;
  GEOPDSearchBrandDensity *v24;
  void *v25;
  id v26;
  void *v28;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = objc_msgSend(a1, "init");
  if (v5)
  {
    v30 = v4;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("muid"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = objc_msgSend(v6, "unsignedLongLongValue");
      *(_BYTE *)(v5 + 76) |= 8u;
      *(_QWORD *)(v5 + 56) = v7;
    }

    if (a3)
      v8 = CFSTR("relationshipType");
    else
      v8 = CFSTR("relationship_type");
    objc_msgSend(v30, "objectForKeyedSubscript:", v8);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v9 = v28;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v10 = v28;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (!v11)
        goto LABEL_33;
      v12 = *(_QWORD *)v32;
      while (1)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v32 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v15 = v14;
            if ((objc_msgSend(v15, "isEqualToString:", CFSTR("DIFFERENT_FROM")) & 1) == 0
              && (objc_msgSend(v15, "isEqualToString:", CFSTR("PARENT_OF")) & 1) == 0
              && (objc_msgSend(v15, "isEqualToString:", CFSTR("CHILD_OF")) & 1) == 0
              && (objc_msgSend(v15, "isEqualToString:", CFSTR("VARIANT_OF")) & 1) == 0
              && (objc_msgSend(v15, "isEqualToString:", CFSTR("BEFORE")) & 1) == 0
              && (objc_msgSend(v15, "isEqualToString:", CFSTR("AFTER")) & 1) == 0
              && (objc_msgSend(v15, "isEqualToString:", CFSTR("ABSTRACT_OF")) & 1) == 0
              && (objc_msgSend(v15, "isEqualToString:", CFSTR("SPECIFIC_OF")) & 1) == 0)
            {
              objc_msgSend(v15, "isEqualToString:", CFSTR("PARTNERSHIP_WITH"));
            }

          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              continue;
            objc_msgSend(v14, "intValue");
          }
          os_unfair_lock_lock((os_unfair_lock_t)(v5 + 72));
          if ((*(_BYTE *)(v5 + 76) & 1) == 0)
          {
            v16 = *(void **)(v5 + 8);
            if (v16)
            {
              v17 = v16;
              objc_sync_enter(v17);
              GEOPDSearchChainInfoReadSpecified(v5, *(_QWORD *)(v5 + 8), (int *)&_readRelationshipTypes_tags);
              objc_sync_exit(v17);

            }
          }
          os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 72));
          PBRepeatedInt32Add();
          os_unfair_lock_lock_with_options();
          *(_BYTE *)(v5 + 76) |= 1u;
          os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 72));
          *(_BYTE *)(v5 + 76) |= 8u;
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        if (!v11)
        {
LABEL_33:

          v9 = v28;
          break;
        }
      }
    }

    if (a3)
      v18 = CFSTR("brandDisplayName");
    else
      v18 = CFSTR("brand_display_name");
    objc_msgSend(v30, "objectForKeyedSubscript:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = (void *)objc_msgSend(v19, "copy");
      v21 = v20;
      *(_BYTE *)(v5 + 76) |= 4u;
      *(_BYTE *)(v5 + 76) |= 8u;
      objc_storeStrong((id *)(v5 + 48), v20);

    }
    if (a3)
      v22 = CFSTR("brandDensity");
    else
      v22 = CFSTR("brand_density");
    objc_msgSend(v30, "objectForKeyedSubscript:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = [GEOPDSearchBrandDensity alloc];
      if (v24)
        v25 = (void *)-[GEOPDSearchBrandDensity _initWithDictionary:isJSON:](v24, v23);
      else
        v25 = 0;
      v26 = v25;
      *(_BYTE *)(v5 + 76) |= 2u;
      *(_BYTE *)(v5 + 76) |= 8u;
      objc_storeStrong((id *)(v5 + 40), v25);

    }
    v4 = v30;
  }

  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchChainInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  unint64_t v5;
  void *v6;
  PBDataReader *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_BYTE *)&self->_flags & 0xF) == 0)
    {
      v7 = self->_reader;
      objc_sync_enter(v7);
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "writeData:", v8);
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v7);
      goto LABEL_11;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchChainInfo readAll:]((uint64_t)self, 0);
  PBDataWriterWriteUint64Field();
  if (self->_relationshipTypes.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v5;
    }
    while (v5 < self->_relationshipTypes.count);
  }
  if (self->_brandDisplayName)
    PBDataWriterWriteStringField();
  v6 = v9;
  if (self->_brandDensity)
  {
    PBDataWriterWriteSubmessage();
LABEL_11:
    v6 = v9;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  PBDataReader *reader;
  PBDataReader *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
    -[GEOPDSearchChainInfo readAll:]((uint64_t)self, 0);
    v5[7] = self->_muid;
    PBRepeatedInt32Copy();
    v8 = -[NSString copyWithZone:](self->_brandDisplayName, "copyWithZone:", a3);
    v9 = (void *)v5[6];
    v5[6] = v8;

    v10 = -[GEOPDSearchBrandDensity copyWithZone:](self->_brandDensity, "copyWithZone:", a3);
    v7 = (PBDataReader *)v5[5];
    v5[5] = v10;
    goto LABEL_6;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOPDSearchChainInfoReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *brandDisplayName;
  GEOPDSearchBrandDensity *brandDensity;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (-[GEOPDSearchChainInfo readAll:]((uint64_t)self, 1),
        -[GEOPDSearchChainInfo readAll:]((uint64_t)v4, 1),
        self->_muid == v4[7])
    && PBRepeatedInt32IsEqual()
    && ((brandDisplayName = self->_brandDisplayName, !((unint64_t)brandDisplayName | v4[6]))
     || -[NSString isEqual:](brandDisplayName, "isEqual:")))
  {
    brandDensity = self->_brandDensity;
    if ((unint64_t)brandDensity | v4[5])
      v7 = -[GEOPDSearchBrandDensity isEqual:](brandDensity, "isEqual:");
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
  uint64_t v4;
  NSUInteger v5;

  -[GEOPDSearchChainInfo readAll:]((uint64_t)self, 1);
  v3 = 2654435761u * self->_muid;
  v4 = PBRepeatedInt32Hash();
  v5 = v4 ^ -[NSString hash](self->_brandDisplayName, "hash");
  return v5 ^ -[GEOPDSearchBrandDensity hash](self->_brandDensity, "hash") ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brandDisplayName, 0);
  objc_storeStrong((id *)&self->_brandDensity, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
