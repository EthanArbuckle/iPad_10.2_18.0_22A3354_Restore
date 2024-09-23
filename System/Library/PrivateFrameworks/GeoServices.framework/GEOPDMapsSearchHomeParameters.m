@implementation GEOPDMapsSearchHomeParameters

- (GEOPDMapsSearchHomeParameters)init
{
  GEOPDMapsSearchHomeParameters *v2;
  GEOPDMapsSearchHomeParameters *v3;
  GEOPDMapsSearchHomeParameters *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDMapsSearchHomeParameters;
  v2 = -[GEOPDMapsSearchHomeParameters init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDMapsSearchHomeParameters)initWithData:(id)a3
{
  GEOPDMapsSearchHomeParameters *v3;
  GEOPDMapsSearchHomeParameters *v4;
  GEOPDMapsSearchHomeParameters *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDMapsSearchHomeParameters;
  v3 = -[GEOPDMapsSearchHomeParameters initWithData:](&v7, sel_initWithData_, a3);
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
  v3.super_class = (Class)GEOPDMapsSearchHomeParameters;
  -[GEOPDMapsSearchHomeParameters dealloc](&v3, sel_dealloc);
}

- (void)_readSupportedSectionTypes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 108) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDMapsSearchHomeParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSupportedSectionTypes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (void)addSupportedSectionType:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDMapsSearchHomeParameters _readSupportedSectionTypes](a1);
    PBRepeatedInt32Add();
    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 108) |= 2u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
    *(_WORD *)(a1 + 108) |= 0x100u;
  }
}

- (void)_readSearchBrowseCategorySuggestionParameters
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
  if ((*(_WORD *)(a1 + 108) & 0x40) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDMapsSearchHomeParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSearchBrowseCategorySuggestionParameters_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
}

- (void)setSearchBrowseCategorySuggestionParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 108) |= 0x40u;
    *(_WORD *)(a1 + 108) |= 0x100u;
    objc_storeStrong((id *)(a1 + 80), a2);
  }

}

- (void)_readCollectionSuggestionParameters
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
  if ((*(_WORD *)(a1 + 108) & 4) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDMapsSearchHomeParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCollectionSuggestionParameters_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
}

- (void)setCollectionSuggestionParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 108) |= 4u;
    *(_WORD *)(a1 + 108) |= 0x100u;
    objc_storeStrong((id *)(a1 + 48), a2);
  }

}

- (void)_readPublisherSuggestionParameters
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
  if ((*(_WORD *)(a1 + 108) & 0x20) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDMapsSearchHomeParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPublisherSuggestionParameters_tags_2856);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
}

- (void)setPublisherSuggestionParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 108) |= 0x20u;
    *(_WORD *)(a1 + 108) |= 0x100u;
    objc_storeStrong((id *)(a1 + 72), a2);
  }

}

- (void)_readPlaceSuggestionParameters
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
  if ((*(_WORD *)(a1 + 108) & 0x10) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDMapsSearchHomeParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlaceSuggestionParameters_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
}

- (void)setPlaceSuggestionParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_WORD *)(a1 + 108) |= 0x10u;
  *(_WORD *)(a1 + 108) |= 0x100u;
  objc_storeStrong((id *)(a1 + 64), a2);

}

- (void)_readGuidesLocationsSuggestionParameters
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
  if ((*(_WORD *)(a1 + 108) & 8) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDMapsSearchHomeParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readGuidesLocationsSuggestionParameters_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
}

- (void)setGuidesLocationsSuggestionParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 108) |= 8u;
    *(_WORD *)(a1 + 108) |= 0x100u;
    objc_storeStrong((id *)(a1 + 56), a2);
  }

}

- (void)_readSearchOriginationInfo
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
  if ((*(_WORD *)(a1 + 108) & 0x80) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDMapsSearchHomeParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSearchOriginationInfo_tags_2857);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
}

- (void)setSearchOriginationInfo:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 108) |= 0x80u;
    *(_WORD *)(a1 + 108) |= 0x100u;
    objc_storeStrong((id *)(a1 + 88), a2);
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
  v8.super_class = (Class)GEOPDMapsSearchHomeParameters;
  -[GEOPDMapsSearchHomeParameters description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDMapsSearchHomeParameters dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDMapsSearchHomeParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  __CFString *v9;
  const __CFString *v10;
  id v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  id v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  id v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  id v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  id v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  id v31;
  void *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  _QWORD v42[4];
  id v43;

  if (!a1)
    return 0;
  -[GEOPDMapsSearchHomeParameters readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (_QWORD *)(a1 + 24);
    if (*(_QWORD *)(a1 + 32))
    {
      v7 = 0;
      do
      {
        v8 = *(int *)(*v6 + 4 * v7);
        if (v8 >= 6)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
          v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v9 = off_1E1C04BA0[v8];
        }
        objc_msgSend(v5, "addObject:", v9);

        ++v7;
        v6 = (_QWORD *)(a1 + 24);
      }
      while (v7 < *(_QWORD *)(a1 + 32));
    }
    if (a2)
      v10 = CFSTR("supportedSectionType");
    else
      v10 = CFSTR("supported_section_type");
    objc_msgSend(v4, "setObject:forKey:", v5, v10);

  }
  -[GEOPDMapsSearchHomeParameters _readSearchBrowseCategorySuggestionParameters](a1);
  v11 = *(id *)(a1 + 80);
  v12 = v11;
  if (v11)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v11, "jsonRepresentation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("searchBrowseCategorySuggestionParameters");
    }
    else
    {
      objc_msgSend(v11, "dictionaryRepresentation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("search_browse_category_suggestion_parameters");
    }
    objc_msgSend(v4, "setObject:forKey:", v13, v14);

  }
  -[GEOPDMapsSearchHomeParameters _readCollectionSuggestionParameters](a1);
  v15 = *(id *)(a1 + 48);
  v16 = v15;
  if (v15)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v15, "jsonRepresentation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = CFSTR("collectionSuggestionParameters");
    }
    else
    {
      objc_msgSend(v15, "dictionaryRepresentation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = CFSTR("collection_suggestion_parameters");
    }
    objc_msgSend(v4, "setObject:forKey:", v17, v18);

  }
  -[GEOPDMapsSearchHomeParameters _readPublisherSuggestionParameters](a1);
  v19 = *(id *)(a1 + 72);
  v20 = v19;
  if (v19)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v19, "jsonRepresentation");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = CFSTR("publisherSuggestionParameters");
    }
    else
    {
      objc_msgSend(v19, "dictionaryRepresentation");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = CFSTR("publisher_suggestion_parameters");
    }
    objc_msgSend(v4, "setObject:forKey:", v21, v22);

  }
  -[GEOPDMapsSearchHomeParameters _readPlaceSuggestionParameters](a1);
  v23 = *(id *)(a1 + 64);
  v24 = v23;
  if (v23)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v23, "jsonRepresentation");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = CFSTR("placeSuggestionParameters");
    }
    else
    {
      objc_msgSend(v23, "dictionaryRepresentation");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = CFSTR("place_suggestion_parameters");
    }
    objc_msgSend(v4, "setObject:forKey:", v25, v26);

  }
  -[GEOPDMapsSearchHomeParameters _readGuidesLocationsSuggestionParameters](a1);
  v27 = *(id *)(a1 + 56);
  v28 = v27;
  if (v27)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v27, "jsonRepresentation");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = CFSTR("guidesLocationsSuggestionParameters");
    }
    else
    {
      objc_msgSend(v27, "dictionaryRepresentation");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = CFSTR("guides_locations_suggestion_parameters");
    }
    objc_msgSend(v4, "setObject:forKey:", v29, v30);

  }
  -[GEOPDMapsSearchHomeParameters _readSearchOriginationInfo](a1);
  v31 = *(id *)(a1 + 88);
  v32 = v31;
  if (v31)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v31, "jsonRepresentation");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = CFSTR("searchOriginationInfo");
    }
    else
    {
      objc_msgSend(v31, "dictionaryRepresentation");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = CFSTR("search_origination_info");
    }
    objc_msgSend(v4, "setObject:forKey:", v33, v34);

  }
  v35 = *(void **)(a1 + 16);
  if (v35)
  {
    objc_msgSend(v35, "dictionaryRepresentation");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v36;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v36, "count"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __59__GEOPDMapsSearchHomeParameters__dictionaryRepresentation___block_invoke;
      v42[3] = &unk_1E1C00600;
      v39 = v38;
      v43 = v39;
      objc_msgSend(v37, "enumerateKeysAndObjectsUsingBlock:", v42);
      v40 = v39;

      v37 = v40;
    }
    objc_msgSend(v4, "setObject:forKey:", v37, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDMapsSearchHomeParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_2877;
      else
        v6 = (int *)&readAll__nonRecursiveTag_2878;
      GEOPDMapsSearchHomeParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDMapsSearchHomeParametersCallReadAllRecursiveWithoutSynchronized((uint64_t *)a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

void __59__GEOPDMapsSearchHomeParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDMapsSearchHomeParametersReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  unint64_t v6;
  PBDataReader *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && !_GEOPDMapsSearchHomeParametersIsDirty((uint64_t)self))
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
    -[GEOPDMapsSearchHomeParameters readAll:]((uint64_t)self, 0);
    v5 = v9;
    if (self->_supportedSectionTypes.count)
    {
      v6 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        v5 = v9;
        ++v6;
      }
      while (v6 < self->_supportedSectionTypes.count);
    }
    if (self->_searchBrowseCategorySuggestionParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v9;
    }
    if (self->_collectionSuggestionParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v9;
    }
    if (self->_publisherSuggestionParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v9;
    }
    if (self->_placeSuggestionParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v9;
    }
    if (self->_guidesLocationsSuggestionParameters)
    {
      PBDataWriterWriteSubmessage();
      v5 = v9;
    }
    if (self->_searchOriginationInfo)
    {
      PBDataWriterWriteSubmessage();
      v5 = v9;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (BOOL)hasGreenTeaWithValue:(_BOOL8)result
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = (_QWORD *)result;
    -[GEOPDMapsSearchHomeParameters _readCollectionSuggestionParameters](result);
    if ((-[GEOPDCollectionSuggestionParameters hasGreenTeaWithValue:](v3[6], a2) & 1) != 0)
      return 1;
    -[GEOPDMapsSearchHomeParameters _readGuidesLocationsSuggestionParameters]((uint64_t)v3);
    v4 = v3[7];
    if (v4)
    {
      if ((objc_msgSend(*(id *)(v4 + 16), "hasGreenTeaWithValue:", a2) & 1) != 0)
        return 1;
    }
    -[GEOPDMapsSearchHomeParameters _readPlaceSuggestionParameters]((uint64_t)v3);
    v5 = v3[8];
    if (v5)
    {
      -[GEOPDPlaceSuggestionParameters _readSuggestedPlaceIds](v3[8]);
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      v6 = *(id *)(v5 + 32);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v13;
        while (2)
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v13 != v9)
              objc_enumerationMutation(v6);
            if ((objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10), "hasGreenTeaWithValue:", a2, (_QWORD)v12) & 1) != 0)
            {

              return 1;
            }
            ++v10;
          }
          while (v8 != v10);
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
          if (v8)
            continue;
          break;
        }
      }

      -[GEOPDPlaceSuggestionParameters _readViewportInfo](v5);
      if ((objc_msgSend(*(id *)(v5 + 40), "hasGreenTeaWithValue:", a2) & 1) != 0)
        return 1;
    }
    -[GEOPDMapsSearchHomeParameters _readPublisherSuggestionParameters]((uint64_t)v3);
    v11 = v3[9];
    if (v11)
    {
      if ((objc_msgSend(*(id *)(v11 + 24), "hasGreenTeaWithValue:", a2) & 1) != 0)
        return 1;
    }
    -[GEOPDMapsSearchHomeParameters _readSearchBrowseCategorySuggestionParameters]((uint64_t)v3);
    if ((-[GEOPDSearchBrowseCategorySuggestionParameters hasGreenTeaWithValue:](v3[10], a2) & 1) != 0)
    {
      return 1;
    }
    else
    {
      -[GEOPDMapsSearchHomeParameters _readSearchOriginationInfo]((uint64_t)v3);
      return -[GEOPDSearchOriginationInfo hasGreenTeaWithValue:](v3[11], a2);
    }
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
    goto LABEL_5;
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDMapsSearchHomeParameters readAll:]((uint64_t)self, 0);
    PBRepeatedInt32Copy();
    v8 = -[GEOPDSearchBrowseCategorySuggestionParameters copyWithZone:](self->_searchBrowseCategorySuggestionParameters, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 80);
    *(_QWORD *)(v5 + 80) = v8;

    v10 = -[GEOPDCollectionSuggestionParameters copyWithZone:](self->_collectionSuggestionParameters, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v10;

    v12 = -[GEOPDPublisherSuggestionParameters copyWithZone:](self->_publisherSuggestionParameters, "copyWithZone:", a3);
    v13 = *(void **)(v5 + 72);
    *(_QWORD *)(v5 + 72) = v12;

    v14 = -[GEOPDPlaceSuggestionParameters copyWithZone:](self->_placeSuggestionParameters, "copyWithZone:", a3);
    v15 = *(void **)(v5 + 64);
    *(_QWORD *)(v5 + 64) = v14;

    v16 = -[GEOPDGuidesLocationsSuggestionParameters copyWithZone:](self->_guidesLocationsSuggestionParameters, "copyWithZone:", a3);
    v17 = *(void **)(v5 + 56);
    *(_QWORD *)(v5 + 56) = v16;

    v18 = -[GEOPDSearchOriginationInfo copyWithZone:](self->_searchOriginationInfo, "copyWithZone:", a3);
    v19 = *(void **)(v5 + 88);
    *(_QWORD *)(v5 + 88) = v18;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOPDMapsSearchHomeParametersReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEOPDSearchBrowseCategorySuggestionParameters *searchBrowseCategorySuggestionParameters;
  GEOPDCollectionSuggestionParameters *collectionSuggestionParameters;
  GEOPDPublisherSuggestionParameters *publisherSuggestionParameters;
  GEOPDPlaceSuggestionParameters *placeSuggestionParameters;
  GEOPDGuidesLocationsSuggestionParameters *guidesLocationsSuggestionParameters;
  GEOPDSearchOriginationInfo *searchOriginationInfo;
  char v11;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (-[GEOPDMapsSearchHomeParameters readAll:]((uint64_t)self, 1),
        -[GEOPDMapsSearchHomeParameters readAll:]((uint64_t)v4, 1),
        PBRepeatedInt32IsEqual())
    && ((searchBrowseCategorySuggestionParameters = self->_searchBrowseCategorySuggestionParameters,
         !((unint64_t)searchBrowseCategorySuggestionParameters | v4[10]))
     || -[GEOPDSearchBrowseCategorySuggestionParameters isEqual:](searchBrowseCategorySuggestionParameters, "isEqual:"))
    && ((collectionSuggestionParameters = self->_collectionSuggestionParameters,
         !((unint64_t)collectionSuggestionParameters | v4[6]))
     || -[GEOPDCollectionSuggestionParameters isEqual:](collectionSuggestionParameters, "isEqual:"))
    && ((publisherSuggestionParameters = self->_publisherSuggestionParameters,
         !((unint64_t)publisherSuggestionParameters | v4[9]))
     || -[GEOPDPublisherSuggestionParameters isEqual:](publisherSuggestionParameters, "isEqual:"))
    && ((placeSuggestionParameters = self->_placeSuggestionParameters,
         !((unint64_t)placeSuggestionParameters | v4[8]))
     || -[GEOPDPlaceSuggestionParameters isEqual:](placeSuggestionParameters, "isEqual:"))
    && ((guidesLocationsSuggestionParameters = self->_guidesLocationsSuggestionParameters,
         !((unint64_t)guidesLocationsSuggestionParameters | v4[7]))
     || -[GEOPDGuidesLocationsSuggestionParameters isEqual:](guidesLocationsSuggestionParameters, "isEqual:")))
  {
    searchOriginationInfo = self->_searchOriginationInfo;
    if ((unint64_t)searchOriginationInfo | v4[11])
      v11 = -[GEOPDSearchOriginationInfo isEqual:](searchOriginationInfo, "isEqual:");
    else
      v11 = 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  -[GEOPDMapsSearchHomeParameters readAll:]((uint64_t)self, 1);
  v3 = PBRepeatedInt32Hash();
  v4 = -[GEOPDSearchBrowseCategorySuggestionParameters hash](self->_searchBrowseCategorySuggestionParameters, "hash") ^ v3;
  v5 = -[GEOPDCollectionSuggestionParameters hash](self->_collectionSuggestionParameters, "hash");
  v6 = v4 ^ v5 ^ -[GEOPDPublisherSuggestionParameters hash](self->_publisherSuggestionParameters, "hash");
  v7 = -[GEOPDPlaceSuggestionParameters hash](self->_placeSuggestionParameters, "hash");
  v8 = v7 ^ -[GEOPDGuidesLocationsSuggestionParameters hash](self->_guidesLocationsSuggestionParameters, "hash");
  return v6 ^ v8 ^ -[GEOPDSearchOriginationInfo hash](self->_searchOriginationInfo, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchOriginationInfo, 0);
  objc_storeStrong((id *)&self->_searchBrowseCategorySuggestionParameters, 0);
  objc_storeStrong((id *)&self->_publisherSuggestionParameters, 0);
  objc_storeStrong((id *)&self->_placeSuggestionParameters, 0);
  objc_storeStrong((id *)&self->_guidesLocationsSuggestionParameters, 0);
  objc_storeStrong((id *)&self->_collectionSuggestionParameters, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
