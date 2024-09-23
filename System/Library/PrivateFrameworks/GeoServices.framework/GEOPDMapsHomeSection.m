@implementation GEOPDMapsHomeSection

- (GEOPDMapsHomeSection)init
{
  GEOPDMapsHomeSection *v2;
  GEOPDMapsHomeSection *v3;
  GEOPDMapsHomeSection *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDMapsHomeSection;
  v2 = -[GEOPDMapsHomeSection init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDMapsHomeSection)initWithData:(id)a3
{
  GEOPDMapsHomeSection *v3;
  GEOPDMapsHomeSection *v4;
  GEOPDMapsHomeSection *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDMapsHomeSection;
  v3 = -[GEOPDMapsHomeSection initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (uint64_t)sectionType
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

- (void)_readName
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
        GEOPDMapsHomeSectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readName_tags_2820);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)name
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDMapsHomeSection _readName]((uint64_t)a1);
    a1 = (id *)v1[6];
  }
  return a1;
}

- (void)_readCollectionSuggestionResult
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
        GEOPDMapsHomeSectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCollectionSuggestionResult_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)collectionSuggestionResult
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDMapsHomeSection _readCollectionSuggestionResult]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (void)_readExploreGuidesEntry
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  if ((*(_BYTE *)(a1 + 72) & 8) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDMapsHomeSectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readExploreGuidesEntry_tags_2821);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
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
  v8.super_class = (Class)GEOPDMapsHomeSection;
  -[GEOPDMapsHomeSection description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDMapsHomeSection dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDMapsHomeSection _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  int v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  id v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  id v18;
  id v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  _QWORD v28[4];
  id v29;

  if (!a1)
    return 0;
  -[GEOPDMapsHomeSection readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 72) & 1) != 0)
  {
    v5 = *(_DWORD *)(a1 + 68);
    if (v5)
    {
      if (v5 == 1)
      {
        v6 = CFSTR("CURATED_GUIDES");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 68));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v6 = CFSTR("UNKNOWN");
    }
    if (a2)
      v7 = CFSTR("sectionType");
    else
      v7 = CFSTR("section_type");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
  -[GEOPDMapsHomeSection name]((id *)a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("name"));

  -[GEOPDMapsHomeSection collectionSuggestionResult]((id *)a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v9, "jsonRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("collectionSuggestionResult");
    }
    else
    {
      objc_msgSend(v9, "dictionaryRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("collection_suggestion_result");
    }
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

  }
  -[GEOPDMapsHomeSection _readExploreGuidesEntry](a1);
  v13 = *(id *)(a1 + 32);
  v14 = v13;
  if (v13)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v13, "jsonRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("exploreGuidesEntry");
    }
    else
    {
      objc_msgSend(v13, "dictionaryRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("explore_guides_entry");
    }
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  if ((*(_BYTE *)(a1 + 72) & 0x10) == 0)
  {
    v17 = *(void **)(a1 + 8);
    if (v17)
    {
      v18 = v17;
      objc_sync_enter(v18);
      GEOPDMapsHomeSectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readExploreImageUrlTemplate_tags_2822);
      objc_sync_exit(v18);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  v19 = *(id *)(a1 + 40);
  if (v19)
  {
    if (a2)
      v20 = CFSTR("exploreImageUrlTemplate");
    else
      v20 = CFSTR("explore_image_url_template");
    objc_msgSend(v4, "setObject:forKey:", v19, v20);
  }

  v21 = *(void **)(a1 + 16);
  if (v21)
  {
    objc_msgSend(v21, "dictionaryRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v22, "count"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __50__GEOPDMapsHomeSection__dictionaryRepresentation___block_invoke;
      v28[3] = &unk_1E1C00600;
      v25 = v24;
      v29 = v25;
      objc_msgSend(v23, "enumerateKeysAndObjectsUsingBlock:", v28);
      v26 = v25;

      v23 = v26;
    }
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDMapsHomeSection _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_2828;
      else
        v6 = (int *)&readAll__nonRecursiveTag_2829;
      GEOPDMapsHomeSectionReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
    {
      -[GEOPDCollectionSuggestionResult readAll:](*(_QWORD *)(a1 + 24), 1);
      -[GEOPDGuidesLocationEntry readAll:](*(_QWORD *)(a1 + 32), 1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

void __50__GEOPDMapsHomeSection__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDMapsHomeSectionReadAllFrom((uint64_t)self, a3, 0);
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
  if (!self->_reader)
    goto LABEL_3;
  os_unfair_lock_assert_owner(&self->_readerLock);
  flags = (char)self->_flags;
  if ((flags & 0x60) != 0)
    goto LABEL_3;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((GEOPDCollectionSuggestionResultIsDirty((os_unfair_lock_s *)self->_collectionSuggestionResult) & 1) != 0)
      goto LABEL_3;
    flags = (char)self->_flags;
  }
  if ((flags & 8) != 0)
  {
    if ((GEOPDGuidesLocationEntryIsDirty((os_unfair_lock_s *)self->_exploreGuidesEntry) & 1) != 0)
      goto LABEL_3;
    flags = (char)self->_flags;
  }
  if ((flags & 0x10) == 0)
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
    goto LABEL_14;
  }
LABEL_3:
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDMapsHomeSection readAll:]((uint64_t)self, 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    PBDataWriterWriteInt32Field();
  v6 = v9;
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    v6 = v9;
  }
  if (self->_collectionSuggestionResult)
  {
    PBDataWriterWriteSubmessage();
    v6 = v9;
  }
  if (self->_exploreGuidesEntry)
  {
    PBDataWriterWriteSubmessage();
    v6 = v9;
  }
  if (self->_exploreImageUrlTemplate)
  {
    PBDataWriterWriteStringField();
    v6 = v9;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v6);
LABEL_14:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
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
      GEOPDMapsHomeSectionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDMapsHomeSection readAll:]((uint64_t)self, 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 68) = self->_sectionType;
    *(_BYTE *)(v5 + 72) |= 1u;
  }
  v9 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v9;

  v11 = -[GEOPDCollectionSuggestionResult copyWithZone:](self->_collectionSuggestionResult, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v11;

  v13 = -[GEOPDGuidesLocationEntry copyWithZone:](self->_exploreGuidesEntry, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v13;

  v15 = -[NSString copyWithZone:](self->_exploreImageUrlTemplate, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v15;

  v17 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v17;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *name;
  GEOPDCollectionSuggestionResult *collectionSuggestionResult;
  GEOPDGuidesLocationEntry *exploreGuidesEntry;
  NSString *exploreImageUrlTemplate;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  -[GEOPDMapsHomeSection readAll:]((uint64_t)self, 1);
  -[GEOPDMapsHomeSection readAll:]((uint64_t)v4, 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 1) == 0 || self->_sectionType != *((_DWORD *)v4 + 17))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 72) & 1) != 0)
  {
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 6) && !-[NSString isEqual:](name, "isEqual:"))
    goto LABEL_15;
  collectionSuggestionResult = self->_collectionSuggestionResult;
  if ((unint64_t)collectionSuggestionResult | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOPDCollectionSuggestionResult isEqual:](collectionSuggestionResult, "isEqual:"))
      goto LABEL_15;
  }
  exploreGuidesEntry = self->_exploreGuidesEntry;
  if ((unint64_t)exploreGuidesEntry | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOPDGuidesLocationEntry isEqual:](exploreGuidesEntry, "isEqual:"))
      goto LABEL_15;
  }
  exploreImageUrlTemplate = self->_exploreImageUrlTemplate;
  if ((unint64_t)exploreImageUrlTemplate | *((_QWORD *)v4 + 5))
    v9 = -[NSString isEqual:](exploreImageUrlTemplate, "isEqual:");
  else
    v9 = 1;
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  unint64_t v5;
  unint64_t v6;

  -[GEOPDMapsHomeSection readAll:]((uint64_t)self, 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_sectionType;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_name, "hash") ^ v3;
  v5 = v4 ^ -[GEOPDCollectionSuggestionResult hash](self->_collectionSuggestionResult, "hash");
  v6 = -[GEOPDGuidesLocationEntry hash](self->_exploreGuidesEntry, "hash");
  return v5 ^ v6 ^ -[NSString hash](self->_exploreImageUrlTemplate, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_exploreImageUrlTemplate, 0);
  objc_storeStrong((id *)&self->_exploreGuidesEntry, 0);
  objc_storeStrong((id *)&self->_collectionSuggestionResult, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
