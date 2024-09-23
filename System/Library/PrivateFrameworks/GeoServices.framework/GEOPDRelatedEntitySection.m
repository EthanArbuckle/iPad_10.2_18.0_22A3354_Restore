@implementation GEOPDRelatedEntitySection

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  uint64_t v3;

  if (result)
  {
    v3 = result;
    -[GEOPDRelatedEntitySection _readRelatedCollectionSection](result);
    return -[GEOPDRelatedCollectionSection hasGreenTeaWithValue:](*(_QWORD *)(v3 + 32), a2);
  }
  return result;
}

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v4;

  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 60) |= 4u;
    *(_BYTE *)(a1 + 60) |= 0x20u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    v4 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDRelatedEntitySection readAll:](a1, 0);
      -[GEOPDRelatedCollectionSection clearUnknownFields:](*(_QWORD *)(a1 + 32), 1);
    }
  }
}

- (GEOPDRelatedEntitySection)init
{
  GEOPDRelatedEntitySection *v2;
  GEOPDRelatedEntitySection *v3;
  GEOPDRelatedEntitySection *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDRelatedEntitySection;
  v2 = -[GEOPDRelatedEntitySection init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDRelatedEntitySection)initWithData:(id)a3
{
  GEOPDRelatedEntitySection *v3;
  GEOPDRelatedEntitySection *v4;
  GEOPDRelatedEntitySection *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDRelatedEntitySection;
  v3 = -[GEOPDRelatedEntitySection initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readName
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
        GEOPDRelatedEntitySectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readName_tags_11);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)name
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDRelatedEntitySection _readName]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (uint64_t)sectionType
{
  uint64_t v1;
  char v2;

  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    v2 = *(_BYTE *)(v1 + 60);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 48));
    if ((v2 & 2) != 0)
      return *(unsigned int *)(v1 + 56);
    else
      return 0;
  }
  return result;
}

- (void)_readRelatedCollectionSection
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
        GEOPDRelatedEntitySectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRelatedCollectionSection_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)relatedCollectionSection
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDRelatedEntitySection _readRelatedCollectionSection]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
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
  v8.super_class = (Class)GEOPDRelatedEntitySection;
  -[GEOPDRelatedEntitySection description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDRelatedEntitySection dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDRelatedEntitySection _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  int v8;
  __CFString *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v22[4];
  id v23;

  if (!a1)
    return 0;
  -[GEOPDRelatedEntitySection readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDRelatedEntitySection name]((id *)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("name"));

  v6 = *(_BYTE *)(a1 + 60);
  if ((v6 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 52));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("index"));

    v6 = *(_BYTE *)(a1 + 60);
  }
  if ((v6 & 2) != 0)
  {
    v8 = *(_DWORD *)(a1 + 56);
    if (v8)
    {
      if (v8 == 1)
      {
        v9 = CFSTR("RELATED_ENTITY_SECTION_TYPE_COLLECTION");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 56));
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v9 = CFSTR("RELATED_ENTITY_SECTION_TYPE_UNKNOWN");
    }
    if (a2)
      v10 = CFSTR("sectionType");
    else
      v10 = CFSTR("section_type");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

  }
  -[GEOPDRelatedEntitySection relatedCollectionSection]((id *)a1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v11, "jsonRepresentation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("relatedCollectionSection");
    }
    else
    {
      objc_msgSend(v11, "dictionaryRepresentation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("related_collection_section");
    }
    objc_msgSend(v4, "setObject:forKey:", v13, v14);

  }
  v15 = *(void **)(a1 + 16);
  if (v15)
  {
    objc_msgSend(v15, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v16, "count"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __55__GEOPDRelatedEntitySection__dictionaryRepresentation___block_invoke;
      v22[3] = &unk_1E1C00600;
      v19 = v18;
      v23 = v19;
      objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v22);
      v20 = v19;

      v17 = v20;
    }
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDRelatedEntitySection _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_280;
      else
        v6 = (int *)&readAll__nonRecursiveTag_281;
      GEOPDRelatedEntitySectionReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

void __55__GEOPDRelatedEntitySection__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  const __CFString *v11;
  void *v12;
  id v13;
  int v14;
  const __CFString *v15;
  void *v16;
  GEOPDRelatedCollectionSection *v17;
  id v18;
  const __CFString *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  GEOPDMapsIdentifier *v27;
  GEOPDMapsIdentifier *v28;
  GEOPDMapsIdentifier *v29;
  GEOPDRelatedCollectionSection *v30;
  void *v32;
  void *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_45;
  a1 = objc_msgSend((id)a1, "init");
  if (!a1)
    goto LABEL_45;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (void *)objc_msgSend(v6, "copy");
    v8 = v7;
    *(_BYTE *)(a1 + 60) |= 8u;
    *(_BYTE *)(a1 + 60) |= 0x20u;
    objc_storeStrong((id *)(a1 + 24), v7);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("index"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = objc_msgSend(v9, "unsignedIntValue");
    *(_BYTE *)(a1 + 60) |= 0x20u;
    *(_BYTE *)(a1 + 60) |= 1u;
    *(_DWORD *)(a1 + 52) = v10;
  }

  if (a3)
    v11 = CFSTR("sectionType");
  else
    v11 = CFSTR("section_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = v12;
    if ((objc_msgSend(v13, "isEqualToString:", CFSTR("RELATED_ENTITY_SECTION_TYPE_UNKNOWN")) & 1) != 0)
      v14 = 0;
    else
      v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("RELATED_ENTITY_SECTION_TYPE_COLLECTION"));

    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = objc_msgSend(v12, "intValue");
LABEL_17:
    *(_BYTE *)(a1 + 60) |= 0x20u;
    *(_BYTE *)(a1 + 60) |= 2u;
    *(_DWORD *)(a1 + 56) = v14;
  }

  if (a3)
    v15 = CFSTR("relatedCollectionSection");
  else
    v15 = CFSTR("related_collection_section");
  objc_msgSend(v5, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = [GEOPDRelatedCollectionSection alloc];
    if (v17)
    {
      v18 = v16;
      v17 = -[GEOPDRelatedCollectionSection init](v17, "init");
      if (v17)
      {
        if (a3)
          v19 = CFSTR("collectionId");
        else
          v19 = CFSTR("collection_id");
        objc_msgSend(v18, "objectForKeyedSubscript:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v33 = v16;
          v34 = v5;
          v37 = 0u;
          v38 = 0u;
          v35 = 0u;
          v36 = 0u;
          v32 = v20;
          v21 = v20;
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
          if (v22)
          {
            v23 = v22;
            v24 = *(_QWORD *)v36;
            do
            {
              for (i = 0; i != v23; ++i)
              {
                if (*(_QWORD *)v36 != v24)
                  objc_enumerationMutation(v21);
                v26 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v27 = [GEOPDMapsIdentifier alloc];
                  if ((a3 & 1) != 0)
                    v28 = -[GEOPDMapsIdentifier initWithJSON:](v27, "initWithJSON:", v26);
                  else
                    v28 = -[GEOPDMapsIdentifier initWithDictionary:](v27, "initWithDictionary:", v26);
                  v29 = v28;
                  -[GEOPDRelatedCollectionSection addCollectionId:]((uint64_t)v17, v28);

                }
              }
              v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
            }
            while (v23);
          }

          v16 = v33;
          v5 = v34;
          v20 = v32;
        }

      }
    }
    v30 = v17;
    *(_BYTE *)(a1 + 60) |= 0x10u;
    *(_BYTE *)(a1 + 60) |= 0x20u;
    objc_storeStrong((id *)(a1 + 32), v17);

  }
LABEL_45:

  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDRelatedEntitySectionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  char flags;
  id v6;
  PBDataReader *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x38) == 0))
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
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDRelatedEntitySection readAll:]((uint64_t)self, 0);
    if (self->_name)
      PBDataWriterWriteStringField();
    flags = (char)self->_flags;
    v6 = v9;
    if ((flags & 1) != 0)
    {
      PBDataWriterWriteUint32Field();
      v6 = v9;
      flags = (char)self->_flags;
    }
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      v6 = v9;
    }
    if (self->_relatedCollectionSection)
    {
      PBDataWriterWriteSubmessage();
      v6 = v9;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v6);
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
  char flags;
  id v12;
  void *v13;
  PBUnknownFields *v14;

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
      GEOPDRelatedEntitySectionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDRelatedEntitySection readAll:]((uint64_t)self, 0);
  v9 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 52) = self->_index;
    *(_BYTE *)(v5 + 60) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_sectionType;
    *(_BYTE *)(v5 + 60) |= 2u;
  }
  v12 = -[GEOPDRelatedCollectionSection copyWithZone:](self->_relatedCollectionSection, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v12;

  v14 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v14;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *name;
  GEOPDRelatedCollectionSection *relatedCollectionSection;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  -[GEOPDRelatedEntitySection readAll:]((uint64_t)self, 1);
  -[GEOPDRelatedEntitySection readAll:]((uint64_t)v4, 1);
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](name, "isEqual:"))
      goto LABEL_16;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) == 0 || self->_index != *((_DWORD *)v4 + 13))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
LABEL_16:
    v7 = 0;
    goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 2) == 0 || self->_sectionType != *((_DWORD *)v4 + 14))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 60) & 2) != 0)
  {
    goto LABEL_16;
  }
  relatedCollectionSection = self->_relatedCollectionSection;
  if ((unint64_t)relatedCollectionSection | *((_QWORD *)v4 + 4))
    v7 = -[GEOPDRelatedCollectionSection isEqual:](relatedCollectionSection, "isEqual:");
  else
    v7 = 1;
LABEL_17:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;

  -[GEOPDRelatedEntitySection readAll:]((uint64_t)self, 1);
  v3 = -[NSString hash](self->_name, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v4 = 2654435761 * self->_index;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    return v4 ^ v3 ^ v5 ^ -[GEOPDRelatedCollectionSection hash](self->_relatedCollectionSection, "hash");
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = 2654435761 * self->_sectionType;
  return v4 ^ v3 ^ v5 ^ -[GEOPDRelatedCollectionSection hash](self->_relatedCollectionSection, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relatedCollectionSection, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
