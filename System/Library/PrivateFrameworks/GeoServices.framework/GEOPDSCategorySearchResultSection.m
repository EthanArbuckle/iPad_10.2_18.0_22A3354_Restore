@implementation GEOPDSCategorySearchResultSection

- (GEOPDSCategorySearchResultSection)init
{
  GEOPDSCategorySearchResultSection *v2;
  GEOPDSCategorySearchResultSection *v3;
  GEOPDSCategorySearchResultSection *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDSCategorySearchResultSection;
  v2 = -[GEOPDSCategorySearchResultSection init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSCategorySearchResultSection)initWithData:(id)a3
{
  GEOPDSCategorySearchResultSection *v3;
  GEOPDSCategorySearchResultSection *v4;
  GEOPDSCategorySearchResultSection *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDSCategorySearchResultSection;
  v3 = -[GEOPDSCategorySearchResultSection initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readSectionHeaderDisplayName
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
        GEOPDSCategorySearchResultSectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSectionHeaderDisplayName_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)sectionHeaderDisplayName
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDSCategorySearchResultSection _readSectionHeaderDisplayName]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (void)setSectionHeaderDisplayName:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_BYTE *)(a1 + 72) |= 4u;
    *(_BYTE *)(a1 + 72) |= 0x40u;
    objc_storeStrong((id *)(a1 + 24), a2);
  }

}

- (void)_readSectionSubHeaderDisplayName
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
        GEOPDSCategorySearchResultSectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSectionSubHeaderDisplayName_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)sectionSubHeaderDisplayName
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDSCategorySearchResultSection _readSectionSubHeaderDisplayName]((uint64_t)a1);
    a1 = (id *)v1[5];
  }
  return a1;
}

- (void)setSectionSubHeaderDisplayName:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_BYTE *)(a1 + 72) |= 0x10u;
    *(_BYTE *)(a1 + 72) |= 0x40u;
    objc_storeStrong((id *)(a1 + 40), a2);
  }

}

- (uint64_t)categorySearchResultSectionCellType
{
  uint64_t v1;
  char v2;

  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    v2 = *(_BYTE *)(v1 + 72);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 64));
    if ((v2 & 1) != 0)
      return *(unsigned int *)(v1 + 68);
    else
      return 0;
  }
  return result;
}

- (void)_readStyleAttributes
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
        GEOPDSCategorySearchResultSectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readStyleAttributes_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)styleAttributes
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDSCategorySearchResultSection _readStyleAttributes]((uint64_t)a1);
    a1 = (id *)v1[6];
  }
  return a1;
}

- (void)setStyleAttributes:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_BYTE *)(a1 + 72) |= 0x20u;
    *(_BYTE *)(a1 + 72) |= 0x40u;
    objc_storeStrong((id *)(a1 + 48), a2);
  }

}

- (void)setSectionSubHeaderDisplayNameWithEnrichment:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_BYTE *)(a1 + 72) |= 8u;
    *(_BYTE *)(a1 + 72) |= 0x40u;
    objc_storeStrong((id *)(a1 + 32), a2);
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
  v8.super_class = (Class)GEOPDSCategorySearchResultSection;
  -[GEOPDSCategorySearchResultSection description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSCategorySearchResultSection dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSCategorySearchResultSection _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  int v9;
  __CFString *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  id v17;
  id v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  _QWORD v27[4];
  id v28;

  if (!a1)
    return 0;
  -[GEOPDSCategorySearchResultSection readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSCategorySearchResultSection sectionHeaderDisplayName]((id *)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (a2)
      v6 = CFSTR("sectionHeaderDisplayName");
    else
      v6 = CFSTR("section_header_display_name");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);
  }

  -[GEOPDSCategorySearchResultSection sectionSubHeaderDisplayName]((id *)a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (a2)
      v8 = CFSTR("sectionSubHeaderDisplayName");
    else
      v8 = CFSTR("section_sub_header_display_name");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);
  }

  if ((*(_BYTE *)(a1 + 72) & 1) != 0)
  {
    v9 = *(_DWORD *)(a1 + 68);
    if (v9)
    {
      if (v9 == 1)
      {
        v10 = CFSTR("CATEGORY_SEARCH_RESULT_SECTION_CELL_TYPE_TWO_LINE_NAME");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 68));
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v10 = CFSTR("CATEGORY_SEARCH_RESULT_SECTION_CELL_TYPE_DEFAULT");
    }
    if (a2)
      v11 = CFSTR("categorySearchResultSectionCellType");
    else
      v11 = CFSTR("category_search_result_section_cell_type");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

  }
  -[GEOPDSCategorySearchResultSection styleAttributes]((id *)a1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v12, "jsonRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("styleAttributes");
    }
    else
    {
      objc_msgSend(v12, "dictionaryRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("style_attributes");
    }
    objc_msgSend(v4, "setObject:forKey:", v14, v15);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  if ((*(_BYTE *)(a1 + 72) & 8) == 0)
  {
    v16 = *(void **)(a1 + 8);
    if (v16)
    {
      v17 = v16;
      objc_sync_enter(v17);
      GEOPDSCategorySearchResultSectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSectionSubHeaderDisplayNameWithEnrichment_tags);
      objc_sync_exit(v17);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  v18 = *(id *)(a1 + 32);
  if (v18)
  {
    if (a2)
      v19 = CFSTR("sectionSubHeaderDisplayNameWithEnrichment");
    else
      v19 = CFSTR("section_sub_header_display_name_with_enrichment");
    objc_msgSend(v4, "setObject:forKey:", v18, v19);
  }

  v20 = *(void **)(a1 + 16);
  if (v20)
  {
    objc_msgSend(v20, "dictionaryRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v21, "count"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __63__GEOPDSCategorySearchResultSection__dictionaryRepresentation___block_invoke;
      v27[3] = &unk_1E1C00600;
      v24 = v23;
      v28 = v24;
      objc_msgSend(v22, "enumerateKeysAndObjectsUsingBlock:", v27);
      v25 = v24;

      v22 = v25;
    }
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSCategorySearchResultSection _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_13;
      else
        v6 = (int *)&readAll__nonRecursiveTag_13;
      GEOPDSCategorySearchResultSectionReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      objc_msgSend(*(id *)(a1 + 48), "readAll:", 1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

void __63__GEOPDSCategorySearchResultSection__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  const __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  id v14;
  int v15;
  const __CFString *v16;
  void *v17;
  GEOStyleAttributes *v18;
  GEOStyleAttributes *v19;
  GEOStyleAttributes *v20;
  const __CFString *v21;
  void *v22;
  void *v23;

  v5 = a2;
  if (!a1)
    goto LABEL_38;
  a1 = objc_msgSend((id)a1, "init");
  if (!a1)
    goto LABEL_38;
  if (a3)
    v6 = CFSTR("sectionHeaderDisplayName");
  else
    v6 = CFSTR("section_header_display_name");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (void *)objc_msgSend(v7, "copy");
    -[GEOPDSCategorySearchResultSection setSectionHeaderDisplayName:](a1, v8);

  }
  if (a3)
    v9 = CFSTR("sectionSubHeaderDisplayName");
  else
    v9 = CFSTR("section_sub_header_display_name");
  objc_msgSend(v5, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = (void *)objc_msgSend(v10, "copy");
    -[GEOPDSCategorySearchResultSection setSectionSubHeaderDisplayName:](a1, v11);

  }
  if (a3)
    v12 = CFSTR("categorySearchResultSectionCellType");
  else
    v12 = CFSTR("category_search_result_section_cell_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = v13;
    if ((objc_msgSend(v14, "isEqualToString:", CFSTR("CATEGORY_SEARCH_RESULT_SECTION_CELL_TYPE_DEFAULT")) & 1) != 0)
      v15 = 0;
    else
      v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("CATEGORY_SEARCH_RESULT_SECTION_CELL_TYPE_TWO_LINE_NAME"));

    goto LABEL_23;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = objc_msgSend(v13, "intValue");
LABEL_23:
    *(_BYTE *)(a1 + 72) |= 0x40u;
    *(_BYTE *)(a1 + 72) |= 1u;
    *(_DWORD *)(a1 + 68) = v15;
  }

  if (a3)
    v16 = CFSTR("styleAttributes");
  else
    v16 = CFSTR("style_attributes");
  objc_msgSend(v5, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = [GEOStyleAttributes alloc];
    if ((a3 & 1) != 0)
      v19 = -[GEOStyleAttributes initWithJSON:](v18, "initWithJSON:", v17);
    else
      v19 = -[GEOStyleAttributes initWithDictionary:](v18, "initWithDictionary:", v17);
    v20 = v19;
    -[GEOPDSCategorySearchResultSection setStyleAttributes:](a1, v19);

  }
  if (a3)
    v21 = CFSTR("sectionSubHeaderDisplayNameWithEnrichment");
  else
    v21 = CFSTR("section_sub_header_display_name_with_enrichment");
  objc_msgSend(v5, "objectForKeyedSubscript:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v23 = (void *)objc_msgSend(v22, "copy");
    -[GEOPDSCategorySearchResultSection setSectionSubHeaderDisplayNameWithEnrichment:](a1, v23);

  }
LABEL_38:

  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSCategorySearchResultSectionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  PBDataReader *v6;
  void *v7;
  id v8;

  v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x7C) == 0))
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
    -[GEOPDSCategorySearchResultSection readAll:]((uint64_t)self, 0);
    if (self->_sectionHeaderDisplayName)
      PBDataWriterWriteStringField();
    v5 = v8;
    if (self->_sectionSubHeaderDisplayName)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if ((*(_BYTE *)&self->_flags & 1) != 0)
    {
      PBDataWriterWriteInt32Field();
      v5 = v8;
    }
    if (self->_styleAttributes)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_sectionSubHeaderDisplayNameWithEnrichment)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
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
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  PBUnknownFields *v17;

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
      GEOPDSCategorySearchResultSectionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSCategorySearchResultSection readAll:]((uint64_t)self, 0);
  v9 = -[NSString copyWithZone:](self->_sectionHeaderDisplayName, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  v11 = -[NSString copyWithZone:](self->_sectionSubHeaderDisplayName, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v11;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 68) = self->_categorySearchResultSectionCellType;
    *(_BYTE *)(v5 + 72) |= 1u;
  }
  v13 = -[GEOStyleAttributes copyWithZone:](self->_styleAttributes, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v13;

  v15 = -[NSString copyWithZone:](self->_sectionSubHeaderDisplayNameWithEnrichment, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v15;

  v17 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v17;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *sectionHeaderDisplayName;
  NSString *sectionSubHeaderDisplayName;
  GEOStyleAttributes *styleAttributes;
  NSString *sectionSubHeaderDisplayNameWithEnrichment;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  -[GEOPDSCategorySearchResultSection readAll:]((uint64_t)self, 1);
  -[GEOPDSCategorySearchResultSection readAll:]((uint64_t)v4, 1);
  sectionHeaderDisplayName = self->_sectionHeaderDisplayName;
  if ((unint64_t)sectionHeaderDisplayName | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](sectionHeaderDisplayName, "isEqual:"))
      goto LABEL_15;
  }
  sectionSubHeaderDisplayName = self->_sectionSubHeaderDisplayName;
  if ((unint64_t)sectionSubHeaderDisplayName | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](sectionSubHeaderDisplayName, "isEqual:"))
      goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 1) == 0 || self->_categorySearchResultSectionCellType != *((_DWORD *)v4 + 17))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 72) & 1) != 0)
  {
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
  styleAttributes = self->_styleAttributes;
  if ((unint64_t)styleAttributes | *((_QWORD *)v4 + 6)
    && !-[GEOStyleAttributes isEqual:](styleAttributes, "isEqual:"))
  {
    goto LABEL_15;
  }
  sectionSubHeaderDisplayNameWithEnrichment = self->_sectionSubHeaderDisplayNameWithEnrichment;
  if ((unint64_t)sectionSubHeaderDisplayNameWithEnrichment | *((_QWORD *)v4 + 4))
    v9 = -[NSString isEqual:](sectionSubHeaderDisplayNameWithEnrichment, "isEqual:");
  else
    v9 = 1;
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  unint64_t v6;

  -[GEOPDSCategorySearchResultSection readAll:]((uint64_t)self, 1);
  v3 = -[NSString hash](self->_sectionHeaderDisplayName, "hash");
  v4 = -[NSString hash](self->_sectionSubHeaderDisplayName, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v5 = 2654435761 * self->_categorySearchResultSectionCellType;
  else
    v5 = 0;
  v6 = v4 ^ v3 ^ v5 ^ -[GEOStyleAttributes hash](self->_styleAttributes, "hash");
  return v6 ^ -[NSString hash](self->_sectionSubHeaderDisplayNameWithEnrichment, "hash");
}

- (void)mergeFrom:(uint64_t)a1
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v3 = a2;
  v4 = v3;
  if (!a1)
    goto LABEL_16;
  v10 = v3;
  -[GEOPDSCategorySearchResultSection readAll:]((uint64_t)v3, 0);
  v4 = v10;
  v5 = (void *)*((_QWORD *)v10 + 3);
  if (v5)
  {
    -[GEOPDSCategorySearchResultSection setSectionHeaderDisplayName:](a1, v5);
    v4 = v10;
  }
  v6 = (void *)*((_QWORD *)v4 + 5);
  if (v6)
  {
    -[GEOPDSCategorySearchResultSection setSectionSubHeaderDisplayName:](a1, v6);
    v4 = v10;
  }
  if ((*((_BYTE *)v4 + 72) & 1) != 0)
  {
    *(_DWORD *)(a1 + 68) = *((_DWORD *)v4 + 17);
    *(_BYTE *)(a1 + 72) |= 1u;
  }
  v7 = *(void **)(a1 + 48);
  v8 = *((_QWORD *)v4 + 6);
  if (v7)
  {
    if (!v8)
      goto LABEL_14;
    objc_msgSend(v7, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_14;
    -[GEOPDSCategorySearchResultSection setStyleAttributes:](a1, *((void **)v4 + 6));
  }
  v4 = v10;
LABEL_14:
  v9 = (void *)*((_QWORD *)v4 + 4);
  if (v9)
  {
    -[GEOPDSCategorySearchResultSection setSectionSubHeaderDisplayNameWithEnrichment:](a1, v9);
    v4 = v10;
  }
LABEL_16:

}

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v4;

  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 72) |= 2u;
    *(_BYTE *)(a1 + 72) |= 0x40u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    v4 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDSCategorySearchResultSection readAll:](a1, 0);
      objc_msgSend(*(id *)(a1 + 48), "clearUnknownFields:", 1);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_sectionSubHeaderDisplayName, 0);
  objc_storeStrong((id *)&self->_sectionSubHeaderDisplayNameWithEnrichment, 0);
  objc_storeStrong((id *)&self->_sectionHeaderDisplayName, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
