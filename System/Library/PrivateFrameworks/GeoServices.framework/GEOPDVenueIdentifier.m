@implementation GEOPDVenueIdentifier

- (GEOPDVenueIdentifier)initWithVenueID:(unint64_t)a3 featureID:(unint64_t)a4 businessID:(unint64_t)a5
{
  GEOPDVenueIdentifier *result;

  result = -[GEOPDVenueIdentifier init](self, "init");
  if (a3 && result)
  {
    *(_WORD *)&result->_flags |= 0x1000u;
    *(_WORD *)&result->_flags |= 0x80u;
    result->_venueId = a3;
    *(_WORD *)&result->_flags |= 0x1000u;
    *(_WORD *)&result->_flags |= 0x80u;
  }
  if (a4 && result)
  {
    *(_WORD *)&result->_flags |= 0x1000u;
    *(_WORD *)&result->_flags |= 2u;
    result->_featureId = a4;
    *(_WORD *)&result->_flags |= 0x1000u;
    *(_WORD *)&result->_flags |= 2u;
  }
  if (a5)
  {
    if (result)
    {
      *(_WORD *)&result->_flags |= 0x1000u;
      *(_WORD *)&result->_flags |= 8u;
      result->_geminiId = a5;
      *(_WORD *)&result->_flags |= 0x1000u;
      *(_WORD *)&result->_flags |= 8u;
    }
  }
  return result;
}

- (GEOPDVenueIdentifier)initWithVenueID:(unint64_t)a3 featureID:(unint64_t)a4 businessID:(unint64_t)a5 componentIdentifier:(id)a6
{
  id v10;
  GEOPDVenueIdentifier *v11;
  uint64_t v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  int v22;
  __int16 v23;
  uint64_t v24;
  int v25;
  __int16 v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v11 = -[GEOPDVenueIdentifier initWithVenueID:featureID:businessID:](self, "initWithVenueID:featureID:businessID:", a3, a4, a5);
  v12 = (uint64_t)v11;
  if (v10 && v11)
  {
    v13 = objc_msgSend(v10, "buildingID");
    *(_WORD *)(v12 + 152) |= 0x1000u;
    *(_WORD *)(v12 + 152) |= 1u;
    *(_QWORD *)(v12 + 72) = v13;
    v14 = objc_msgSend(v10, "_hasBuildingID");
    *(_WORD *)(v12 + 152) |= 0x1000u;
    *(_WORD *)(v12 + 152) = *(_WORD *)(v12 + 152) & 0xFFFE | v14;
    objc_msgSend(v10, "floorInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "levelID");
    *(_WORD *)(v12 + 152) |= 0x1000u;
    *(_WORD *)(v12 + 152) |= 0x10u;
    *(_QWORD *)(v12 + 104) = v16;

    objc_msgSend(v10, "floorInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_WORD *)(v12 + 152) |= 0x1000u;
    *(_WORD *)(v12 + 152) = *(_WORD *)(v12 + 152) & 0xFFEF | (16 * (v17 != 0));

    objc_msgSend(v10, "floorInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "ordinal");
    *(_WORD *)(v12 + 152) |= 0x1000u;
    *(_WORD *)(v12 + 152) |= 0x100u;
    *(_DWORD *)(v12 + 148) = v19;

    objc_msgSend(v10, "floorInfo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_WORD *)(v12 + 152) |= 0x1000u;
    *(_WORD *)(v12 + 152) = *(_WORD *)(v12 + 152) & 0xFEFF | ((v20 != 0) << 8);

    v21 = objc_msgSend(v10, "unitID");
    *(_WORD *)(v12 + 152) |= 0x1000u;
    *(_WORD *)(v12 + 152) |= 0x20u;
    *(_QWORD *)(v12 + 112) = v21;
    v22 = objc_msgSend(v10, "_hasUnitID");
    *(_WORD *)(v12 + 152) |= 0x1000u;
    if (v22)
      v23 = 32;
    else
      v23 = 0;
    *(_WORD *)(v12 + 152) = *(_WORD *)(v12 + 152) & 0xFFDF | v23;
    v24 = objc_msgSend(v10, "fixtureID");
    *(_WORD *)(v12 + 152) |= 0x1000u;
    *(_WORD *)(v12 + 152) |= 4u;
    *(_QWORD *)(v12 + 88) = v24;
    v25 = objc_msgSend(v10, "_hasFixtureID");
    *(_WORD *)(v12 + 152) |= 0x1000u;
    if (v25)
      v26 = 4;
    else
      v26 = 0;
    *(_WORD *)(v12 + 152) = *(_WORD *)(v12 + 152) & 0xFFFB | v26;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    objc_msgSend(v10, "sectionIDs", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v34 != v30)
            objc_enumerationMutation(v27);
          objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "unsignedLongLongValue");
          -[GEOPDVenueIdentifier addSectionId:](v12);
        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v29);
    }

  }
  return (GEOPDVenueIdentifier *)v12;
}

- (GEOPDVenueIdentifier)initWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  GEOPDVenueIdentifier *v12;

  v4 = a3;
  objc_msgSend(v4, "componentIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  v7 = objc_msgSend(v4, "venueID");
  v8 = objc_msgSend(v4, "featureID");
  v9 = objc_msgSend(v4, "businessID");
  if (v6)
  {
    objc_msgSend(v4, "componentIdentifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[GEOPDVenueIdentifier initWithVenueID:featureID:businessID:componentIdentifier:](self, "initWithVenueID:featureID:businessID:componentIdentifier:", v7, v8, v9, v11);

  }
  else
  {

    v12 = -[GEOPDVenueIdentifier initWithVenueID:featureID:businessID:](self, "initWithVenueID:featureID:businessID:", v7, v8, v9);
  }

  return v12;
}

- (GEOPDVenueIdentifier)init
{
  GEOPDVenueIdentifier *v2;
  GEOPDVenueIdentifier *v3;
  GEOPDVenueIdentifier *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDVenueIdentifier;
  v2 = -[GEOPDVenueIdentifier init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDVenueIdentifier)initWithData:(id)a3
{
  GEOPDVenueIdentifier *v3;
  GEOPDVenueIdentifier *v4;
  GEOPDVenueIdentifier *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDVenueIdentifier;
  v3 = -[GEOPDVenueIdentifier initWithData:](&v7, sel_initWithData_, a3);
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

  PBRepeatedUInt64Clear();
  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDVenueIdentifier;
  -[GEOPDVenueIdentifier dealloc](&v3, sel_dealloc);
}

- (void)_readSectionIds
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(_WORD *)(a1 + 152) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDVenueIdentifierReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSectionIds_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (void)addSectionId:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDVenueIdentifier _readSectionIds](a1);
    PBRepeatedUInt64Add();
    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 152) |= 0x800u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
    *(_WORD *)(a1 + 152) |= 0x1000u;
  }
}

- (uint64_t)sectionIdAtIndex:(uint64_t)result
{
  uint64_t v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  if (result)
  {
    v3 = result;
    -[GEOPDVenueIdentifier _readSectionIds](result);
    v4 = *(_QWORD *)(v3 + 56);
    if (v4 <= a2)
    {
      v5 = (void *)MEMORY[0x1E0C99DA0];
      v6 = *MEMORY[0x1E0C99858];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a2, v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "raise");

    }
    return *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * a2);
  }
  return result;
}

- (void)_readContainedBys
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(_WORD *)(a1 + 152) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDVenueIdentifierReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readContainedBys_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (void)addContainedBy:(uint64_t)a1
{
  -[GEOPDVenueIdentifier _readContainedBys](a1);
  PBRepeatedUInt64Add();
  os_unfair_lock_lock_with_options();
  *(_WORD *)(a1 + 152) |= 0x400u;
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  *(_WORD *)(a1 + 152) |= 0x1000u;
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
  v8.super_class = (Class)GEOPDVenueIdentifier;
  -[GEOPDVenueIdentifier description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDVenueIdentifier dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDVenueIdentifier _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  __int16 v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  __int16 v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  __int16 v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v27;
  const __CFString *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  const __CFString *v36;
  _QWORD v37[4];
  id v38;

  if (!a1)
    return 0;
  -[GEOPDVenueIdentifier readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_WORD *)(a1 + 152);
  if ((v5 & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 128));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v28 = CFSTR("venueId");
    else
      v28 = CFSTR("venue_id");
    objc_msgSend(v4, "setObject:forKey:", v27, v28);

    v5 = *(_WORD *)(a1 + 152);
    if ((v5 & 1) == 0)
    {
LABEL_4:
      if ((v5 & 0x10) == 0)
        goto LABEL_9;
      goto LABEL_5;
    }
  }
  else if ((v5 & 1) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 72));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v30 = CFSTR("buildingId");
  else
    v30 = CFSTR("building_id");
  objc_msgSend(v4, "setObject:forKey:", v29, v30);

  if ((*(_WORD *)(a1 + 152) & 0x10) != 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 104));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("levelId");
    else
      v7 = CFSTR("level_id");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
LABEL_9:
  if (*(_QWORD *)(a1 + 56))
  {
    PBRepeatedUInt64NSArray();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v9 = CFSTR("sectionId");
    else
      v9 = CFSTR("section_id");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);

  }
  v10 = *(_WORD *)(a1 + 152);
  if ((v10 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 112));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v32 = CFSTR("unitId");
    else
      v32 = CFSTR("unit_id");
    objc_msgSend(v4, "setObject:forKey:", v31, v32);

    v10 = *(_WORD *)(a1 + 152);
    if ((v10 & 4) == 0)
    {
LABEL_16:
      if ((v10 & 0x100) == 0)
        goto LABEL_17;
LABEL_60:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 148));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v36 = CFSTR("levelOrdinal");
      else
        v36 = CFSTR("level_ordinal");
      objc_msgSend(v4, "setObject:forKey:", v35, v36);

      if ((*(_WORD *)(a1 + 152) & 2) == 0)
        goto LABEL_22;
      goto LABEL_18;
    }
  }
  else if ((v10 & 4) == 0)
  {
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 88));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v34 = CFSTR("fixtureId");
  else
    v34 = CFSTR("fixture_id");
  objc_msgSend(v4, "setObject:forKey:", v33, v34);

  v10 = *(_WORD *)(a1 + 152);
  if ((v10 & 0x100) != 0)
    goto LABEL_60;
LABEL_17:
  if ((v10 & 2) != 0)
  {
LABEL_18:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 80));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v12 = CFSTR("featureId");
    else
      v12 = CFSTR("feature_id");
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

  }
LABEL_22:
  if (*(_QWORD *)(a1 + 32))
  {
    PBRepeatedUInt64NSArray();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v14 = CFSTR("containedBy");
    else
      v14 = CFSTR("contained_by");
    objc_msgSend(v4, "setObject:forKey:", v13, v14);

  }
  v15 = *(_WORD *)(a1 + 152);
  if ((v15 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 96));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v17 = CFSTR("geminiId");
    else
      v17 = CFSTR("gemini_id");
    objc_msgSend(v4, "setObject:forKey:", v16, v17);

    v15 = *(_WORD *)(a1 + 152);
  }
  if ((v15 & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 120));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v19 = CFSTR("venueGeminiId");
    else
      v19 = CFSTR("venue_gemini_id");
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
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __50__GEOPDVenueIdentifier__dictionaryRepresentation___block_invoke;
      v37[3] = &unk_1E1C00600;
      v24 = v23;
      v38 = v24;
      objc_msgSend(v22, "enumerateKeysAndObjectsUsingBlock:", v37);
      v25 = v24;

      v22 = v25;
    }
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDVenueIdentifier _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_67;
      else
        v6 = (int *)&readAll__nonRecursiveTag_67;
      GEOPDVenueIdentifierReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

void __50__GEOPDVenueIdentifier__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  uint64_t v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;
  const __CFString *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  uint64_t v25;
  const __CFString *v26;
  void *v27;
  uint64_t v28;
  const __CFString *v29;
  void *v30;
  int v31;
  const __CFString *v32;
  void *v33;
  uint64_t v34;
  const __CFString *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const __CFString *v43;
  void *v44;
  uint64_t v45;
  const __CFString *v46;
  void *v47;
  uint64_t v48;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = objc_msgSend((id)a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("venueId");
      else
        v6 = CFSTR("venue_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = objc_msgSend(v7, "unsignedLongLongValue");
        *(_WORD *)(a1 + 152) |= 0x1000u;
        *(_WORD *)(a1 + 152) |= 0x80u;
        *(_QWORD *)(a1 + 128) = v8;
      }

      if (a3)
        v9 = CFSTR("buildingId");
      else
        v9 = CFSTR("building_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = objc_msgSend(v10, "unsignedLongLongValue");
        *(_WORD *)(a1 + 152) |= 0x1000u;
        *(_WORD *)(a1 + 152) |= 1u;
        *(_QWORD *)(a1 + 72) = v11;
      }

      if (a3)
        v12 = CFSTR("levelId");
      else
        v12 = CFSTR("level_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = objc_msgSend(v13, "unsignedLongLongValue");
        *(_WORD *)(a1 + 152) |= 0x1000u;
        *(_WORD *)(a1 + 152) |= 0x10u;
        *(_QWORD *)(a1 + 104) = v14;
      }

      if (a3)
        v15 = CFSTR("sectionId");
      else
        v15 = CFSTR("section_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v56 = 0u;
        v57 = 0u;
        v54 = 0u;
        v55 = 0u;
        v17 = v16;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v55;
          do
          {
            v21 = 0;
            do
            {
              if (*(_QWORD *)v55 != v20)
                objc_enumerationMutation(v17);
              v22 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v21);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v22, "unsignedLongLongValue");
                -[GEOPDVenueIdentifier addSectionId:](a1);
              }
              ++v21;
            }
            while (v19 != v21);
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
          }
          while (v19);
        }

      }
      if (a3)
        v23 = CFSTR("unitId");
      else
        v23 = CFSTR("unit_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v25 = objc_msgSend(v24, "unsignedLongLongValue");
        *(_WORD *)(a1 + 152) |= 0x1000u;
        *(_WORD *)(a1 + 152) |= 0x20u;
        *(_QWORD *)(a1 + 112) = v25;
      }

      if (a3)
        v26 = CFSTR("fixtureId");
      else
        v26 = CFSTR("fixture_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v28 = objc_msgSend(v27, "unsignedLongLongValue");
        *(_WORD *)(a1 + 152) |= 0x1000u;
        *(_WORD *)(a1 + 152) |= 4u;
        *(_QWORD *)(a1 + 88) = v28;
      }

      if (a3)
        v29 = CFSTR("levelOrdinal");
      else
        v29 = CFSTR("level_ordinal");
      objc_msgSend(v5, "objectForKeyedSubscript:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v31 = objc_msgSend(v30, "intValue");
        *(_WORD *)(a1 + 152) |= 0x1000u;
        *(_WORD *)(a1 + 152) |= 0x100u;
        *(_DWORD *)(a1 + 148) = v31;
      }

      if (a3)
        v32 = CFSTR("featureId");
      else
        v32 = CFSTR("feature_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v34 = objc_msgSend(v33, "unsignedLongLongValue");
        *(_WORD *)(a1 + 152) |= 0x1000u;
        *(_WORD *)(a1 + 152) |= 2u;
        *(_QWORD *)(a1 + 80) = v34;
      }

      if (a3)
        v35 = CFSTR("containedBy");
      else
        v35 = CFSTR("contained_by");
      objc_msgSend(v5, "objectForKeyedSubscript:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        v37 = v36;
        v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
        if (v38)
        {
          v39 = v38;
          v40 = *(_QWORD *)v51;
          do
          {
            v41 = 0;
            do
            {
              if (*(_QWORD *)v51 != v40)
                objc_enumerationMutation(v37);
              v42 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v41);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v42, "unsignedLongLongValue", (_QWORD)v50);
                -[GEOPDVenueIdentifier addContainedBy:](a1);
              }
              ++v41;
            }
            while (v39 != v41);
            v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
          }
          while (v39);
        }

      }
      if (a3)
        v43 = CFSTR("geminiId");
      else
        v43 = CFSTR("gemini_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v43, (_QWORD)v50);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v45 = objc_msgSend(v44, "unsignedLongLongValue");
        *(_WORD *)(a1 + 152) |= 0x1000u;
        *(_WORD *)(a1 + 152) |= 8u;
        *(_QWORD *)(a1 + 96) = v45;
      }

      if (a3)
        v46 = CFSTR("venueGeminiId");
      else
        v46 = CFSTR("venue_gemini_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v48 = objc_msgSend(v47, "unsignedLongLongValue");
        *(_WORD *)(a1 + 152) |= 0x1000u;
        *(_WORD *)(a1 + 152) |= 0x40u;
        *(_QWORD *)(a1 + 120) = v48;
      }

    }
  }

  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDVenueIdentifierReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;
  id v6;
  unint64_t v7;
  __int16 v8;
  unint64_t v9;
  __int16 v10;
  PBDataReader *v11;
  void *v12;
  id v13;

  v13 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_WORD *)&self->_flags & 0x1C00) == 0)
    {
      v11 = self->_reader;
      objc_sync_enter(v11);
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "writeData:", v12);
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v11);
      goto LABEL_30;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDVenueIdentifier readAll:]((uint64_t)self, 0);
  flags = (__int16)self->_flags;
  if ((flags & 0x80) != 0)
  {
    PBDataWriterWriteUint64Field();
    flags = (__int16)self->_flags;
  }
  v6 = v13;
  if ((flags & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v6 = v13;
    flags = (__int16)self->_flags;
  }
  if ((flags & 0x10) != 0)
  {
    PBDataWriterWriteUint64Field();
    v6 = v13;
  }
  if (self->_sectionIds.count)
  {
    v7 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      v6 = v13;
      ++v7;
    }
    while (v7 < self->_sectionIds.count);
  }
  v8 = (__int16)self->_flags;
  if ((v8 & 0x20) != 0)
  {
    PBDataWriterWriteUint64Field();
    v6 = v13;
    v8 = (__int16)self->_flags;
    if ((v8 & 4) == 0)
    {
LABEL_14:
      if ((v8 & 0x100) == 0)
        goto LABEL_15;
LABEL_27:
      PBDataWriterWriteInt32Field();
      v6 = v13;
      if ((*(_WORD *)&self->_flags & 2) == 0)
        goto LABEL_17;
      goto LABEL_16;
    }
  }
  else if ((v8 & 4) == 0)
  {
    goto LABEL_14;
  }
  PBDataWriterWriteUint64Field();
  v6 = v13;
  v8 = (__int16)self->_flags;
  if ((v8 & 0x100) != 0)
    goto LABEL_27;
LABEL_15:
  if ((v8 & 2) != 0)
  {
LABEL_16:
    PBDataWriterWriteUint64Field();
    v6 = v13;
  }
LABEL_17:
  if (self->_containedBys.count)
  {
    v9 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      v6 = v13;
      ++v9;
    }
    while (v9 < self->_containedBys.count);
  }
  v10 = (__int16)self->_flags;
  if ((v10 & 8) != 0)
  {
    PBDataWriterWriteUint64Field();
    v6 = v13;
    v10 = (__int16)self->_flags;
  }
  if ((v10 & 0x40) != 0)
  {
    PBDataWriterWriteUint64Field();
    v6 = v13;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v6);
LABEL_30:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  PBDataReader *reader;
  PBDataReader *v6;
  id v7;
  __int16 flags;
  __int16 v9;
  __int16 v10;
  PBUnknownFields *v11;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v6 = reader;
    objc_sync_enter(v6);
    if ((*(_WORD *)&self->_flags & 0x1000) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDVenueIdentifierReadAllFrom(v4, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v7 = (id)v4;
      objc_sync_exit(v6);

      goto LABEL_19;
    }
    objc_sync_exit(v6);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDVenueIdentifier readAll:]((uint64_t)self, 0);
  flags = (__int16)self->_flags;
  if ((flags & 0x80) != 0)
  {
    *(_QWORD *)(v4 + 128) = self->_venueId;
    *(_WORD *)(v4 + 152) |= 0x80u;
    flags = (__int16)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_7:
      if ((flags & 0x10) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((flags & 1) == 0)
  {
    goto LABEL_7;
  }
  *(_QWORD *)(v4 + 72) = self->_buildingId;
  *(_WORD *)(v4 + 152) |= 1u;
  if ((*(_WORD *)&self->_flags & 0x10) != 0)
  {
LABEL_8:
    *(_QWORD *)(v4 + 104) = self->_levelId;
    *(_WORD *)(v4 + 152) |= 0x10u;
  }
LABEL_9:
  PBRepeatedUInt64Copy();
  v9 = (__int16)self->_flags;
  if ((v9 & 0x20) != 0)
  {
    *(_QWORD *)(v4 + 112) = self->_unitId;
    *(_WORD *)(v4 + 152) |= 0x20u;
    v9 = (__int16)self->_flags;
    if ((v9 & 4) == 0)
    {
LABEL_11:
      if ((v9 & 0x100) == 0)
        goto LABEL_12;
LABEL_25:
      *(_DWORD *)(v4 + 148) = self->_levelOrdinal;
      *(_WORD *)(v4 + 152) |= 0x100u;
      if ((*(_WORD *)&self->_flags & 2) == 0)
        goto LABEL_14;
      goto LABEL_13;
    }
  }
  else if ((v9 & 4) == 0)
  {
    goto LABEL_11;
  }
  *(_QWORD *)(v4 + 88) = self->_fixtureId;
  *(_WORD *)(v4 + 152) |= 4u;
  v9 = (__int16)self->_flags;
  if ((v9 & 0x100) != 0)
    goto LABEL_25;
LABEL_12:
  if ((v9 & 2) != 0)
  {
LABEL_13:
    *(_QWORD *)(v4 + 80) = self->_featureId;
    *(_WORD *)(v4 + 152) |= 2u;
  }
LABEL_14:
  PBRepeatedUInt64Copy();
  v10 = (__int16)self->_flags;
  if ((v10 & 8) != 0)
  {
    *(_QWORD *)(v4 + 96) = self->_geminiId;
    *(_WORD *)(v4 + 152) |= 8u;
    v10 = (__int16)self->_flags;
  }
  if ((v10 & 0x40) != 0)
  {
    *(_QWORD *)(v4 + 120) = self->_venueGeminiId;
    *(_WORD *)(v4 + 152) |= 0x40u;
  }
  v11 = self->_unknownFields;
  v7 = *(id *)(v4 + 16);
  *(_QWORD *)(v4 + 16) = v11;
LABEL_19:

  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 flags;
  __int16 v6;
  __int16 v7;
  __int16 v8;
  __int16 v9;
  __int16 v10;
  BOOL v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_49;
  -[GEOPDVenueIdentifier readAll:]((uint64_t)self, 1);
  -[GEOPDVenueIdentifier readAll:]((uint64_t)v4, 1);
  flags = (__int16)self->_flags;
  v6 = *((_WORD *)v4 + 76);
  if ((flags & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_venueId != *((_QWORD *)v4 + 16))
      goto LABEL_49;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_49;
  }
  if ((flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_buildingId != *((_QWORD *)v4 + 9))
      goto LABEL_49;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_49;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_levelId != *((_QWORD *)v4 + 13))
      goto LABEL_49;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_49;
  }
  if (!PBRepeatedUInt64IsEqual())
    goto LABEL_49;
  v7 = (__int16)self->_flags;
  v8 = *((_WORD *)v4 + 76);
  if ((v7 & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0 || self->_unitId != *((_QWORD *)v4 + 14))
      goto LABEL_49;
  }
  else if ((v8 & 0x20) != 0)
  {
    goto LABEL_49;
  }
  if ((v7 & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_fixtureId != *((_QWORD *)v4 + 11))
      goto LABEL_49;
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_49;
  }
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 76) & 0x100) == 0 || self->_levelOrdinal != *((_DWORD *)v4 + 37))
      goto LABEL_49;
  }
  else if ((*((_WORD *)v4 + 76) & 0x100) != 0)
  {
    goto LABEL_49;
  }
  if ((v7 & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_featureId != *((_QWORD *)v4 + 10))
      goto LABEL_49;
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_49;
  }
  if (!PBRepeatedUInt64IsEqual())
  {
LABEL_49:
    v11 = 0;
    goto LABEL_50;
  }
  v9 = (__int16)self->_flags;
  v10 = *((_WORD *)v4 + 76);
  if ((v9 & 8) != 0)
  {
    if ((v10 & 8) == 0 || self->_geminiId != *((_QWORD *)v4 + 12))
      goto LABEL_49;
  }
  else if ((v10 & 8) != 0)
  {
    goto LABEL_49;
  }
  if ((v9 & 0x40) != 0)
  {
    if ((v10 & 0x40) == 0 || self->_venueGeminiId != *((_QWORD *)v4 + 15))
      goto LABEL_49;
    v11 = 1;
  }
  else
  {
    v11 = (v10 & 0x40) == 0;
  }
LABEL_50:

  return v11;
}

- (unint64_t)hash
{
  __int16 flags;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  __int16 v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  __int16 v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v17;

  -[GEOPDVenueIdentifier readAll:]((uint64_t)self, 1);
  flags = (__int16)self->_flags;
  if ((flags & 0x80) == 0)
  {
    v17 = 0;
    if ((flags & 1) != 0)
      goto LABEL_3;
LABEL_6:
    v4 = 0;
    if ((flags & 0x10) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v17 = 2654435761u * self->_venueId;
  if ((flags & 1) == 0)
    goto LABEL_6;
LABEL_3:
  v4 = 2654435761u * self->_buildingId;
  if ((flags & 0x10) != 0)
  {
LABEL_4:
    v5 = 2654435761u * self->_levelId;
    goto LABEL_8;
  }
LABEL_7:
  v5 = 0;
LABEL_8:
  v6 = PBRepeatedUInt64Hash();
  v7 = (__int16)self->_flags;
  if ((v7 & 0x20) != 0)
  {
    v8 = 2654435761u * self->_unitId;
    if ((v7 & 4) != 0)
    {
LABEL_10:
      v9 = 2654435761u * self->_fixtureId;
      if ((*(_WORD *)&self->_flags & 0x100) != 0)
        goto LABEL_11;
LABEL_15:
      v10 = 0;
      if ((v7 & 2) != 0)
        goto LABEL_12;
      goto LABEL_16;
    }
  }
  else
  {
    v8 = 0;
    if ((v7 & 4) != 0)
      goto LABEL_10;
  }
  v9 = 0;
  if ((*(_WORD *)&self->_flags & 0x100) == 0)
    goto LABEL_15;
LABEL_11:
  v10 = 2654435761 * self->_levelOrdinal;
  if ((v7 & 2) != 0)
  {
LABEL_12:
    v11 = 2654435761u * self->_featureId;
    goto LABEL_17;
  }
LABEL_16:
  v11 = 0;
LABEL_17:
  v12 = PBRepeatedUInt64Hash();
  v13 = (__int16)self->_flags;
  if ((v13 & 8) != 0)
  {
    v14 = 2654435761u * self->_geminiId;
    if ((v13 & 0x40) != 0)
      goto LABEL_19;
LABEL_21:
    v15 = 0;
    return v4 ^ v17 ^ v5 ^ v8 ^ v9 ^ v10 ^ v11 ^ v6 ^ v12 ^ v14 ^ v15;
  }
  v14 = 0;
  if ((v13 & 0x40) == 0)
    goto LABEL_21;
LABEL_19:
  v15 = 2654435761u * self->_venueGeminiId;
  return v4 ^ v17 ^ v5 ^ v8 ^ v9 ^ v10 ^ v11 ^ v6 ^ v12 ^ v14 ^ v15;
}

- (void)mergeFrom:(uint64_t)a1
{
  _WORD *v3;
  __int16 v4;
  _WORD *v5;
  uint64_t v6;
  unint64_t i;
  __int16 v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int16 v16;
  _WORD *v17;

  v3 = a2;
  if (!a1)
    goto LABEL_23;
  v17 = v3;
  -[GEOPDVenueIdentifier readAll:]((uint64_t)v3, 0);
  v4 = v17[76];
  if ((v4 & 0x80) != 0)
  {
    *(_QWORD *)(a1 + 128) = *((_QWORD *)v17 + 16);
    *(_WORD *)(a1 + 152) |= 0x80u;
    v4 = v17[76];
    if ((v4 & 1) == 0)
    {
LABEL_4:
      if ((v4 & 0x10) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((v4 & 1) == 0)
  {
    goto LABEL_4;
  }
  *(_QWORD *)(a1 + 72) = *((_QWORD *)v17 + 9);
  *(_WORD *)(a1 + 152) |= 1u;
  if ((v17[76] & 0x10) != 0)
  {
LABEL_5:
    *(_QWORD *)(a1 + 104) = *((_QWORD *)v17 + 13);
    *(_WORD *)(a1 + 152) |= 0x10u;
  }
LABEL_6:
  -[GEOPDVenueIdentifier _readSectionIds]((uint64_t)v17);
  v5 = v17;
  v6 = *((_QWORD *)v17 + 7);
  if (v6)
  {
    for (i = 0; i != v6; ++i)
    {
      -[GEOPDVenueIdentifier sectionIdAtIndex:]((uint64_t)v17, i);
      -[GEOPDVenueIdentifier addSectionId:](a1);
      v5 = v17;
    }
  }
  v8 = v5[76];
  if ((v8 & 0x20) != 0)
  {
    *(_QWORD *)(a1 + 112) = *((_QWORD *)v5 + 14);
    *(_WORD *)(a1 + 152) |= 0x20u;
    v8 = v5[76];
    if ((v8 & 4) == 0)
    {
LABEL_11:
      if ((v8 & 0x100) == 0)
        goto LABEL_12;
LABEL_29:
      *(_DWORD *)(a1 + 148) = *((_DWORD *)v5 + 37);
      *(_WORD *)(a1 + 152) |= 0x100u;
      if ((v5[76] & 2) == 0)
        goto LABEL_14;
      goto LABEL_13;
    }
  }
  else if ((v8 & 4) == 0)
  {
    goto LABEL_11;
  }
  *(_QWORD *)(a1 + 88) = *((_QWORD *)v5 + 11);
  *(_WORD *)(a1 + 152) |= 4u;
  v8 = v5[76];
  if ((v8 & 0x100) != 0)
    goto LABEL_29;
LABEL_12:
  if ((v8 & 2) != 0)
  {
LABEL_13:
    *(_QWORD *)(a1 + 80) = *((_QWORD *)v5 + 10);
    *(_WORD *)(a1 + 152) |= 2u;
  }
LABEL_14:
  -[GEOPDVenueIdentifier _readContainedBys]((uint64_t)v17);
  v3 = v17;
  v9 = *((_QWORD *)v17 + 4);
  if (v9)
  {
    v10 = 0;
    v11 = *MEMORY[0x1E0C99858];
    do
    {
      -[GEOPDVenueIdentifier _readContainedBys]((uint64_t)v3);
      v12 = *((_QWORD *)v17 + 4);
      if (v12 <= v10)
      {
        v13 = (void *)MEMORY[0x1E0C99DA0];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), v10, v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "exceptionWithName:reason:userInfo:", v11, v14, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "raise");

      }
      -[GEOPDVenueIdentifier addContainedBy:](a1);
      ++v10;
      v3 = v17;
    }
    while (v9 != v10);
  }
  v16 = v3[76];
  if ((v16 & 8) != 0)
  {
    *(_QWORD *)(a1 + 96) = *((_QWORD *)v3 + 12);
    *(_WORD *)(a1 + 152) |= 8u;
    v16 = v3[76];
  }
  if ((v16 & 0x40) != 0)
  {
    *(_QWORD *)(a1 + 120) = *((_QWORD *)v3 + 15);
    *(_WORD *)(a1 + 152) |= 0x40u;
  }
LABEL_23:

}

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v4;

  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 152) |= 0x200u;
    *(_WORD *)(a1 + 152) |= 0x1000u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
    v4 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    if (a2)
      -[GEOPDVenueIdentifier readAll:](a1, 0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
