@implementation GEOPDMapsSearchHomeSection

- (GEOPDMapsSearchHomeSection)init
{
  GEOPDMapsSearchHomeSection *v2;
  GEOPDMapsSearchHomeSection *v3;
  GEOPDMapsSearchHomeSection *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDMapsSearchHomeSection;
  v2 = -[GEOPDMapsSearchHomeSection init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDMapsSearchHomeSection)initWithData:(id)a3
{
  GEOPDMapsSearchHomeSection *v3;
  GEOPDMapsSearchHomeSection *v4;
  GEOPDMapsSearchHomeSection *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDMapsSearchHomeSection;
  v3 = -[GEOPDMapsSearchHomeSection initWithData:](&v7, sel_initWithData_, a3);
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
  __int16 v2;

  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    v2 = *(_WORD *)(v1 + 88);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 80));
    if ((v2 & 1) != 0)
      return *(unsigned int *)(v1 + 84);
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDMapsSearchHomeSectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readName_tags_2902);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)name
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDMapsSearchHomeSection _readName]((uint64_t)a1);
    a1 = (id *)v1[5];
  }
  return a1;
}

- (void)_readSearchBrowseCategorySuggestionResult
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDMapsSearchHomeSectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSearchBrowseCategorySuggestionResult_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)searchBrowseCategorySuggestionResult
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDMapsSearchHomeSection _readSearchBrowseCategorySuggestionResult]((uint64_t)a1);
    a1 = (id *)v1[8];
  }
  return a1;
}

- (void)_readCollectionSuggestionResult
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDMapsSearchHomeSectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCollectionSuggestionResult_tags_2903);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)collectionSuggestionResult
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDMapsSearchHomeSection _readCollectionSuggestionResult]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (void)_readPublisherSuggestionResult
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDMapsSearchHomeSectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPublisherSuggestionResult_tags_2904);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)publisherSuggestionResult
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDMapsSearchHomeSection _readPublisherSuggestionResult]((uint64_t)a1);
    a1 = (id *)v1[7];
  }
  return a1;
}

- (void)_readPlaceSuggestionResult
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
  if ((*(_WORD *)(a1 + 88) & 0x20) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDMapsSearchHomeSectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlaceSuggestionResult_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
}

- (void)_readGuidesLocationsSuggestionResult
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDMapsSearchHomeSectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readGuidesLocationsSuggestionResult_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)guidesLocationsSuggestionResult
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDMapsSearchHomeSection _readGuidesLocationsSuggestionResult]((uint64_t)a1);
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
  v8.super_class = (Class)GEOPDMapsSearchHomeSection;
  -[GEOPDMapsSearchHomeSection description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDMapsSearchHomeSection dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDMapsSearchHomeSection _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  id v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  _QWORD v36[4];
  id v37;

  if (!a1)
    return 0;
  -[GEOPDMapsSearchHomeSection readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_WORD *)(a1 + 88) & 1) != 0)
  {
    v5 = *(int *)(a1 + 84);
    if (v5 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 84));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E1C04BA0[v5];
    }
    if (a2)
      v7 = CFSTR("sectionType");
    else
      v7 = CFSTR("section_type");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
  -[GEOPDMapsSearchHomeSection name]((id *)a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("name"));

  -[GEOPDMapsSearchHomeSection searchBrowseCategorySuggestionResult]((id *)a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v9, "jsonRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("searchBrowseCategorySuggestionResult");
    }
    else
    {
      objc_msgSend(v9, "dictionaryRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("search_browse_category_suggestion_result");
    }
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

  }
  -[GEOPDMapsSearchHomeSection collectionSuggestionResult]((id *)a1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v13, "jsonRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("collectionSuggestionResult");
    }
    else
    {
      objc_msgSend(v13, "dictionaryRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("collection_suggestion_result");
    }
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

  }
  -[GEOPDMapsSearchHomeSection publisherSuggestionResult]((id *)a1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v17, "jsonRepresentation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = CFSTR("publisherSuggestionResult");
    }
    else
    {
      objc_msgSend(v17, "dictionaryRepresentation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = CFSTR("publisher_suggestion_result");
    }
    objc_msgSend(v4, "setObject:forKey:", v19, v20);

  }
  -[GEOPDMapsSearchHomeSection _readPlaceSuggestionResult](a1);
  v21 = *(id *)(a1 + 48);
  v22 = v21;
  if (v21)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v21, "jsonRepresentation");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = CFSTR("placeSuggestionResult");
    }
    else
    {
      objc_msgSend(v21, "dictionaryRepresentation");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = CFSTR("place_suggestion_result");
    }
    objc_msgSend(v4, "setObject:forKey:", v23, v24);

  }
  -[GEOPDMapsSearchHomeSection guidesLocationsSuggestionResult]((id *)a1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v25)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v25, "jsonRepresentation");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = CFSTR("guidesLocationsSuggestionResult");
    }
    else
    {
      objc_msgSend(v25, "dictionaryRepresentation");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = CFSTR("guides_locations_suggestion_result");
    }
    objc_msgSend(v4, "setObject:forKey:", v27, v28);

  }
  v29 = *(void **)(a1 + 16);
  if (v29)
  {
    objc_msgSend(v29, "dictionaryRepresentation");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v30, "count"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __56__GEOPDMapsSearchHomeSection__dictionaryRepresentation___block_invoke;
      v36[3] = &unk_1E1C00600;
      v33 = v32;
      v37 = v33;
      objc_msgSend(v31, "enumerateKeysAndObjectsUsingBlock:", v36);
      v34 = v33;

      v31 = v34;
    }
    objc_msgSend(v4, "setObject:forKey:", v31, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDMapsSearchHomeSection _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_2920;
      else
        v6 = (int *)&readAll__nonRecursiveTag_2921;
      GEOPDMapsSearchHomeSectionReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
    {
      -[GEOPDCollectionSuggestionResult readAll:](*(_QWORD *)(a1 + 24), 1);
      -[GEOPDGuidesLocationsSuggestionResult readAll:](*(_QWORD *)(a1 + 32), 1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

void __56__GEOPDMapsSearchHomeSection__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDMapsSearchHomeSectionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;
  id v6;
  GEOPDGuidesLocationsSuggestionResult *guidesLocationsSuggestionResult;
  char IsDirty;
  PBDataReader *v9;
  void *v10;
  id v11;

  v11 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader)
    goto LABEL_7;
  os_unfair_lock_assert_owner(&self->_readerLock);
  flags = (__int16)self->_flags;
  if ((flags & 0x190) != 0)
    goto LABEL_7;
  if ((flags & 4) != 0)
  {
    if ((GEOPDCollectionSuggestionResultIsDirty((os_unfair_lock_s *)self->_collectionSuggestionResult) & 1) != 0)
      goto LABEL_7;
    flags = (__int16)self->_flags;
  }
  if ((flags & 0x60) == 0)
  {
    if ((flags & 8) == 0
      || (guidesLocationsSuggestionResult = self->_guidesLocationsSuggestionResult) == 0
      || (os_unfair_lock_lock_with_options(),
          IsDirty = _GEOPDGuidesLocationsSuggestionResultIsDirty((uint64_t)guidesLocationsSuggestionResult),
          os_unfair_lock_unlock(&guidesLocationsSuggestionResult->_readerLock),
          (IsDirty & 1) == 0))
    {
      v9 = self->_reader;
      objc_sync_enter(v9);
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "writeData:", v10);
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v9);
      goto LABEL_22;
    }
  }
LABEL_7:
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDMapsSearchHomeSection readAll:]((uint64_t)self, 0);
  if ((*(_WORD *)&self->_flags & 1) != 0)
    PBDataWriterWriteInt32Field();
  v6 = v11;
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    v6 = v11;
  }
  if (self->_searchBrowseCategorySuggestionResult)
  {
    PBDataWriterWriteSubmessage();
    v6 = v11;
  }
  if (self->_collectionSuggestionResult)
  {
    PBDataWriterWriteSubmessage();
    v6 = v11;
  }
  if (self->_publisherSuggestionResult)
  {
    PBDataWriterWriteSubmessage();
    v6 = v11;
  }
  if (self->_placeSuggestionResult)
  {
    PBDataWriterWriteSubmessage();
    v6 = v11;
  }
  if (self->_guidesLocationsSuggestionResult)
  {
    PBDataWriterWriteSubmessage();
    v6 = v11;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v6);
LABEL_22:

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
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  PBUnknownFields *v21;

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
      GEOPDMapsSearchHomeSectionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDMapsSearchHomeSection readAll:]((uint64_t)self, 0);
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 84) = self->_sectionType;
    *(_WORD *)(v5 + 88) |= 1u;
  }
  v9 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v9;

  v11 = -[GEOPDSearchBrowseCategorySuggestionResult copyWithZone:](self->_searchBrowseCategorySuggestionResult, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v11;

  v13 = -[GEOPDCollectionSuggestionResult copyWithZone:](self->_collectionSuggestionResult, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v13;

  v15 = -[GEOPDPublisherSuggestionResult copyWithZone:](self->_publisherSuggestionResult, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v15;

  v17 = -[GEOPDPlaceSuggestionResult copyWithZone:](self->_placeSuggestionResult, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v17;

  v19 = -[GEOPDGuidesLocationsSuggestionResult copyWithZone:](self->_guidesLocationsSuggestionResult, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v19;

  v21 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v21;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 v5;
  NSString *name;
  GEOPDSearchBrowseCategorySuggestionResult *searchBrowseCategorySuggestionResult;
  GEOPDCollectionSuggestionResult *collectionSuggestionResult;
  GEOPDPublisherSuggestionResult *publisherSuggestionResult;
  GEOPDPlaceSuggestionResult *placeSuggestionResult;
  GEOPDGuidesLocationsSuggestionResult *guidesLocationsSuggestionResult;
  char v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  -[GEOPDMapsSearchHomeSection readAll:]((uint64_t)self, 1);
  -[GEOPDMapsSearchHomeSection readAll:]((uint64_t)v4, 1);
  v5 = *((_WORD *)v4 + 44);
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    if ((v5 & 1) == 0 || self->_sectionType != *((_DWORD *)v4 + 21))
      goto LABEL_19;
  }
  else if ((v5 & 1) != 0)
  {
LABEL_19:
    v12 = 0;
    goto LABEL_20;
  }
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 5) && !-[NSString isEqual:](name, "isEqual:"))
    goto LABEL_19;
  searchBrowseCategorySuggestionResult = self->_searchBrowseCategorySuggestionResult;
  if ((unint64_t)searchBrowseCategorySuggestionResult | *((_QWORD *)v4 + 8))
  {
    if (!-[GEOPDSearchBrowseCategorySuggestionResult isEqual:](searchBrowseCategorySuggestionResult, "isEqual:"))
      goto LABEL_19;
  }
  collectionSuggestionResult = self->_collectionSuggestionResult;
  if ((unint64_t)collectionSuggestionResult | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOPDCollectionSuggestionResult isEqual:](collectionSuggestionResult, "isEqual:"))
      goto LABEL_19;
  }
  publisherSuggestionResult = self->_publisherSuggestionResult;
  if ((unint64_t)publisherSuggestionResult | *((_QWORD *)v4 + 7))
  {
    if (!-[GEOPDPublisherSuggestionResult isEqual:](publisherSuggestionResult, "isEqual:"))
      goto LABEL_19;
  }
  placeSuggestionResult = self->_placeSuggestionResult;
  if ((unint64_t)placeSuggestionResult | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOPDPlaceSuggestionResult isEqual:](placeSuggestionResult, "isEqual:"))
      goto LABEL_19;
  }
  guidesLocationsSuggestionResult = self->_guidesLocationsSuggestionResult;
  if ((unint64_t)guidesLocationsSuggestionResult | *((_QWORD *)v4 + 4))
    v12 = -[GEOPDGuidesLocationsSuggestionResult isEqual:](guidesLocationsSuggestionResult, "isEqual:");
  else
    v12 = 1;
LABEL_20:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  -[GEOPDMapsSearchHomeSection readAll:]((uint64_t)self, 1);
  if ((*(_WORD *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_sectionType;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_name, "hash") ^ v3;
  v5 = -[GEOPDSearchBrowseCategorySuggestionResult hash](self->_searchBrowseCategorySuggestionResult, "hash");
  v6 = v4 ^ v5 ^ -[GEOPDCollectionSuggestionResult hash](self->_collectionSuggestionResult, "hash");
  v7 = -[GEOPDPublisherSuggestionResult hash](self->_publisherSuggestionResult, "hash");
  v8 = v7 ^ -[GEOPDPlaceSuggestionResult hash](self->_placeSuggestionResult, "hash");
  return v6 ^ v8 ^ -[GEOPDGuidesLocationsSuggestionResult hash](self->_guidesLocationsSuggestionResult, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchBrowseCategorySuggestionResult, 0);
  objc_storeStrong((id *)&self->_publisherSuggestionResult, 0);
  objc_storeStrong((id *)&self->_placeSuggestionResult, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_guidesLocationsSuggestionResult, 0);
  objc_storeStrong((id *)&self->_collectionSuggestionResult, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
