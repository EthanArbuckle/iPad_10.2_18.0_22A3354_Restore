@implementation GEOPBTransitPaymentMethodSuggestionDetails

- (GEOPBTransitPaymentMethodSuggestionDetails)init
{
  GEOPBTransitPaymentMethodSuggestionDetails *v2;
  GEOPBTransitPaymentMethodSuggestionDetails *v3;
  GEOPBTransitPaymentMethodSuggestionDetails *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPBTransitPaymentMethodSuggestionDetails;
  v2 = -[GEOPBTransitPaymentMethodSuggestionDetails init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPBTransitPaymentMethodSuggestionDetails)initWithData:(id)a3
{
  GEOPBTransitPaymentMethodSuggestionDetails *v3;
  GEOPBTransitPaymentMethodSuggestionDetails *v4;
  GEOPBTransitPaymentMethodSuggestionDetails *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPBTransitPaymentMethodSuggestionDetails;
  v3 = -[GEOPBTransitPaymentMethodSuggestionDetails initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (unint64_t)paymentMethodRegionMuid
{
  return self->_paymentMethodRegionMuid;
}

- (void)setPaymentMethodRegionMuid:(unint64_t)a3
{
  *(_BYTE *)&self->_flags |= 0x81u;
  self->_paymentMethodRegionMuid = a3;
}

- (void)setHasPaymentMethodRegionMuid:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0x7E | a3 | 0x80;
}

- (BOOL)hasPaymentMethodRegionMuid
{
  return *(_BYTE *)&self->_flags & 1;
}

- (void)_readEducationalScreenHeader
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitPaymentMethodSuggestionDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEducationalScreenHeader_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasEducationalScreenHeader
{
  -[GEOPBTransitPaymentMethodSuggestionDetails _readEducationalScreenHeader]((uint64_t)self);
  return self->_educationalScreenHeader != 0;
}

- (GEOFormattedString)educationalScreenHeader
{
  -[GEOPBTransitPaymentMethodSuggestionDetails _readEducationalScreenHeader]((uint64_t)self);
  return self->_educationalScreenHeader;
}

- (void)setEducationalScreenHeader:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x88u;
  objc_storeStrong((id *)&self->_educationalScreenHeader, a3);
}

- (void)_readEducationalScreenPaymentBodys
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitPaymentMethodSuggestionDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEducationalScreenPaymentBodys_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)educationalScreenPaymentBodys
{
  -[GEOPBTransitPaymentMethodSuggestionDetails _readEducationalScreenPaymentBodys]((uint64_t)self);
  return self->_educationalScreenPaymentBodys;
}

- (void)setEducationalScreenPaymentBodys:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *educationalScreenPaymentBodys;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  educationalScreenPaymentBodys = self->_educationalScreenPaymentBodys;
  self->_educationalScreenPaymentBodys = v4;

}

- (void)clearEducationalScreenPaymentBodys
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  -[NSMutableArray removeAllObjects](self->_educationalScreenPaymentBodys, "removeAllObjects");
}

- (void)addEducationalScreenPaymentBody:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPBTransitPaymentMethodSuggestionDetails _readEducationalScreenPaymentBodys]((uint64_t)self);
  -[GEOPBTransitPaymentMethodSuggestionDetails _addNoFlagsEducationalScreenPaymentBody:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsEducationalScreenPaymentBody:(uint64_t)a1
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

- (unint64_t)educationalScreenPaymentBodysCount
{
  -[GEOPBTransitPaymentMethodSuggestionDetails _readEducationalScreenPaymentBodys]((uint64_t)self);
  return -[NSMutableArray count](self->_educationalScreenPaymentBodys, "count");
}

- (id)educationalScreenPaymentBodyAtIndex:(unint64_t)a3
{
  -[GEOPBTransitPaymentMethodSuggestionDetails _readEducationalScreenPaymentBodys]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_educationalScreenPaymentBodys, "objectAtIndex:", a3);
}

+ (Class)educationalScreenPaymentBodyType
{
  return (Class)objc_opt_class();
}

- (void)_readSuggestionTitle
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitPaymentMethodSuggestionDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSuggestionTitle_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasSuggestionTitle
{
  -[GEOPBTransitPaymentMethodSuggestionDetails _readSuggestionTitle]((uint64_t)self);
  return self->_suggestionTitle != 0;
}

- (GEOFormattedString)suggestionTitle
{
  -[GEOPBTransitPaymentMethodSuggestionDetails _readSuggestionTitle]((uint64_t)self);
  return self->_suggestionTitle;
}

- (void)setSuggestionTitle:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_suggestionTitle, a3);
}

- (void)_readSuggestionBody
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitPaymentMethodSuggestionDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSuggestionBody_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasSuggestionBody
{
  -[GEOPBTransitPaymentMethodSuggestionDetails _readSuggestionBody]((uint64_t)self);
  return self->_suggestionBody != 0;
}

- (GEOFormattedString)suggestionBody
{
  -[GEOPBTransitPaymentMethodSuggestionDetails _readSuggestionBody]((uint64_t)self);
  return self->_suggestionBody;
}

- (void)setSuggestionBody:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_suggestionBody, a3);
}

- (void)_readEducationalScreenAssets
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitPaymentMethodSuggestionDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEducationalScreenAssets_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)educationalScreenAssets
{
  -[GEOPBTransitPaymentMethodSuggestionDetails _readEducationalScreenAssets]((uint64_t)self);
  return self->_educationalScreenAssets;
}

- (void)setEducationalScreenAssets:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *educationalScreenAssets;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  educationalScreenAssets = self->_educationalScreenAssets;
  self->_educationalScreenAssets = v4;

}

- (void)clearEducationalScreenAssets
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  -[NSMutableArray removeAllObjects](self->_educationalScreenAssets, "removeAllObjects");
}

- (void)addEducationalScreenAsset:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPBTransitPaymentMethodSuggestionDetails _readEducationalScreenAssets]((uint64_t)self);
  -[GEOPBTransitPaymentMethodSuggestionDetails _addNoFlagsEducationalScreenAsset:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsEducationalScreenAsset:(uint64_t)a1
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

- (unint64_t)educationalScreenAssetsCount
{
  -[GEOPBTransitPaymentMethodSuggestionDetails _readEducationalScreenAssets]((uint64_t)self);
  return -[NSMutableArray count](self->_educationalScreenAssets, "count");
}

- (id)educationalScreenAssetAtIndex:(unint64_t)a3
{
  -[GEOPBTransitPaymentMethodSuggestionDetails _readEducationalScreenAssets]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_educationalScreenAssets, "objectAtIndex:", a3);
}

+ (Class)educationalScreenAssetType
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)GEOPBTransitPaymentMethodSuggestionDetails;
  -[GEOPBTransitPaymentMethodSuggestionDetails description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPBTransitPaymentMethodSuggestionDetails dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPBTransitPaymentMethodSuggestionDetails _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  _QWORD v44[4];
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 84) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v6 = CFSTR("paymentMethodRegionMuid");
    else
      v6 = CFSTR("payment_method_region_muid");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);

  }
  objc_msgSend((id)a1, "educationalScreenHeader");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v7, "jsonRepresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("educationalScreenHeader");
    }
    else
    {
      objc_msgSend(v7, "dictionaryRepresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("educational_screen_header");
    }
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

  }
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v12 = *(id *)(a1 + 40);
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v51 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v17, "jsonRepresentation");
          else
            objc_msgSend(v17, "dictionaryRepresentation");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v18);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
      }
      while (v14);
    }

    if (a2)
      v19 = CFSTR("educationalScreenPaymentBody");
    else
      v19 = CFSTR("educational_screen_payment_body");
    objc_msgSend(v4, "setObject:forKey:", v11, v19);

  }
  objc_msgSend((id)a1, "suggestionTitle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v20, "jsonRepresentation");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = CFSTR("suggestionTitle");
    }
    else
    {
      objc_msgSend(v20, "dictionaryRepresentation");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = CFSTR("suggestion_title");
    }
    objc_msgSend(v4, "setObject:forKey:", v22, v23);

  }
  objc_msgSend((id)a1, "suggestionBody");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v24)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v24, "jsonRepresentation");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = CFSTR("suggestionBody");
    }
    else
    {
      objc_msgSend(v24, "dictionaryRepresentation");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = CFSTR("suggestion_body");
    }
    objc_msgSend(v4, "setObject:forKey:", v26, v27);

  }
  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v29 = *(id *)(a1 + 24);
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v47;
      do
      {
        for (j = 0; j != v31; ++j)
        {
          if (*(_QWORD *)v47 != v32)
            objc_enumerationMutation(v29);
          v34 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v34, "jsonRepresentation");
          else
            objc_msgSend(v34, "dictionaryRepresentation");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "addObject:", v35);

        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
      }
      while (v31);
    }

    if (a2)
      v36 = CFSTR("educationalScreenAsset");
    else
      v36 = CFSTR("educational_screen_asset");
    objc_msgSend(v4, "setObject:forKey:", v28, v36);

  }
  v37 = *(void **)(a1 + 16);
  if (v37)
  {
    objc_msgSend(v37, "dictionaryRepresentation");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v38;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v38, "count"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __72__GEOPBTransitPaymentMethodSuggestionDetails__dictionaryRepresentation___block_invoke;
      v44[3] = &unk_1E1C00600;
      v41 = v40;
      v45 = v41;
      objc_msgSend(v39, "enumerateKeysAndObjectsUsingBlock:", v44);
      v42 = v41;

      v39 = v42;
    }
    objc_msgSend(v4, "setObject:forKey:", v39, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPBTransitPaymentMethodSuggestionDetails _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __72__GEOPBTransitPaymentMethodSuggestionDetails__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPBTransitPaymentMethodSuggestionDetails)initWithDictionary:(id)a3
{
  return (GEOPBTransitPaymentMethodSuggestionDetails *)-[GEOPBTransitPaymentMethodSuggestionDetails _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  GEOFormattedString *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  GEOFormattedString *v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  GEOFormattedString *v26;
  uint64_t v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  GEOFormattedString *v31;
  uint64_t v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  uint64_t v41;
  GEOAsset *v42;
  uint64_t v43;
  void *v44;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("paymentMethodRegionMuid");
      else
        v6 = CFSTR("payment_method_region_muid");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setPaymentMethodRegionMuid:", objc_msgSend(v7, "unsignedLongLongValue"));

      if (a3)
        v8 = CFSTR("educationalScreenHeader");
      else
        v8 = CFSTR("educational_screen_header");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = [GEOFormattedString alloc];
        if ((a3 & 1) != 0)
          v11 = -[GEOFormattedString initWithJSON:](v10, "initWithJSON:", v9);
        else
          v11 = -[GEOFormattedString initWithDictionary:](v10, "initWithDictionary:", v9);
        v12 = (void *)v11;
        objc_msgSend(a1, "setEducationalScreenHeader:", v11);

      }
      if (a3)
        v13 = CFSTR("educationalScreenPaymentBody");
      else
        v13 = CFSTR("educational_screen_payment_body");
      objc_msgSend(v5, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v46 = v5;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v53 = 0u;
        v54 = 0u;
        v51 = 0u;
        v52 = 0u;
        v15 = v14;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v52;
          do
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v52 != v18)
                objc_enumerationMutation(v15);
              v20 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v21 = [GEOFormattedString alloc];
                if ((a3 & 1) != 0)
                  v22 = -[GEOFormattedString initWithJSON:](v21, "initWithJSON:", v20);
                else
                  v22 = -[GEOFormattedString initWithDictionary:](v21, "initWithDictionary:", v20);
                v23 = (void *)v22;
                objc_msgSend(a1, "addEducationalScreenPaymentBody:", v22);

              }
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
          }
          while (v17);
        }

        v5 = v46;
      }

      if (a3)
        v24 = CFSTR("suggestionTitle");
      else
        v24 = CFSTR("suggestion_title");
      objc_msgSend(v5, "objectForKeyedSubscript:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v26 = [GEOFormattedString alloc];
        if ((a3 & 1) != 0)
          v27 = -[GEOFormattedString initWithJSON:](v26, "initWithJSON:", v25);
        else
          v27 = -[GEOFormattedString initWithDictionary:](v26, "initWithDictionary:", v25);
        v28 = (void *)v27;
        objc_msgSend(a1, "setSuggestionTitle:", v27);

      }
      if (a3)
        v29 = CFSTR("suggestionBody");
      else
        v29 = CFSTR("suggestion_body");
      objc_msgSend(v5, "objectForKeyedSubscript:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v31 = [GEOFormattedString alloc];
        if ((a3 & 1) != 0)
          v32 = -[GEOFormattedString initWithJSON:](v31, "initWithJSON:", v30);
        else
          v32 = -[GEOFormattedString initWithDictionary:](v31, "initWithDictionary:", v30);
        v33 = (void *)v32;
        objc_msgSend(a1, "setSuggestionBody:", v32);

      }
      if (a3)
        v34 = CFSTR("educationalScreenAsset");
      else
        v34 = CFSTR("educational_screen_asset");
      objc_msgSend(v5, "objectForKeyedSubscript:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v49 = 0u;
        v50 = 0u;
        v47 = 0u;
        v48 = 0u;
        v36 = v35;
        v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
        if (v37)
        {
          v38 = v37;
          v39 = *(_QWORD *)v48;
          do
          {
            for (j = 0; j != v38; ++j)
            {
              if (*(_QWORD *)v48 != v39)
                objc_enumerationMutation(v36);
              v41 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v42 = [GEOAsset alloc];
                if ((a3 & 1) != 0)
                  v43 = -[GEOAsset initWithJSON:](v42, "initWithJSON:", v41);
                else
                  v43 = -[GEOAsset initWithDictionary:](v42, "initWithDictionary:", v41);
                v44 = (void *)v43;
                objc_msgSend(a1, "addEducationalScreenAsset:", v43);

              }
            }
            v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
          }
          while (v38);
        }

        v5 = v46;
      }

    }
  }

  return a1;
}

- (GEOPBTransitPaymentMethodSuggestionDetails)initWithJSON:(id)a3
{
  return (GEOPBTransitPaymentMethodSuggestionDetails *)-[GEOPBTransitPaymentMethodSuggestionDetails _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_679_0;
    else
      v8 = (int *)&readAll__nonRecursiveTag_680_0;
    GEOPBTransitPaymentMethodSuggestionDetailsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOPBTransitPaymentMethodSuggestionDetailsCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPBTransitPaymentMethodSuggestionDetailsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPBTransitPaymentMethodSuggestionDetailsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
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
  if (self->_reader && (_GEOPBTransitPaymentMethodSuggestionDetailsIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOPBTransitPaymentMethodSuggestionDetails readAll:](self, "readAll:", 0);
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteUint64Field();
    if (self->_educationalScreenHeader)
      PBDataWriterWriteSubmessage();
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = self->_educationalScreenPaymentBodys;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v21;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v7);
    }

    if (self->_suggestionTitle)
      PBDataWriterWriteSubmessage();
    if (self->_suggestionBody)
      PBDataWriterWriteSubmessage();
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v10 = self->_educationalScreenAssets;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v17;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteSubmessage();
          ++v13;
        }
        while (v11 != v13);
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      }
      while (v11);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v16);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  id *v12;

  v12 = (id *)a3;
  -[GEOPBTransitPaymentMethodSuggestionDetails readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v12 + 1, self->_reader);
  *((_DWORD *)v12 + 18) = self->_readerMarkPos;
  *((_DWORD *)v12 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v12[6] = (id)self->_paymentMethodRegionMuid;
    *((_BYTE *)v12 + 84) |= 1u;
  }
  if (self->_educationalScreenHeader)
    objc_msgSend(v12, "setEducationalScreenHeader:");
  if (-[GEOPBTransitPaymentMethodSuggestionDetails educationalScreenPaymentBodysCount](self, "educationalScreenPaymentBodysCount"))
  {
    objc_msgSend(v12, "clearEducationalScreenPaymentBodys");
    v4 = -[GEOPBTransitPaymentMethodSuggestionDetails educationalScreenPaymentBodysCount](self, "educationalScreenPaymentBodysCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOPBTransitPaymentMethodSuggestionDetails educationalScreenPaymentBodyAtIndex:](self, "educationalScreenPaymentBodyAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addEducationalScreenPaymentBody:", v7);

      }
    }
  }
  if (self->_suggestionTitle)
    objc_msgSend(v12, "setSuggestionTitle:");
  if (self->_suggestionBody)
    objc_msgSend(v12, "setSuggestionBody:");
  if (-[GEOPBTransitPaymentMethodSuggestionDetails educationalScreenAssetsCount](self, "educationalScreenAssetsCount"))
  {
    objc_msgSend(v12, "clearEducationalScreenAssets");
    v8 = -[GEOPBTransitPaymentMethodSuggestionDetails educationalScreenAssetsCount](self, "educationalScreenAssetsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[GEOPBTransitPaymentMethodSuggestionDetails educationalScreenAssetAtIndex:](self, "educationalScreenAssetAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addEducationalScreenAsset:", v11);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  id v9;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  PBUnknownFields *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x80000000) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPBTransitPaymentMethodSuggestionDetailsReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_22;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPBTransitPaymentMethodSuggestionDetails readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 48) = self->_paymentMethodRegionMuid;
    *(_BYTE *)(v5 + 84) |= 1u;
  }
  v9 = -[GEOFormattedString copyWithZone:](self->_educationalScreenHeader, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v9;

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v11 = self->_educationalScreenPaymentBodys;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v32 != v13)
          objc_enumerationMutation(v11);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addEducationalScreenPaymentBody:", v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v12);
  }

  v16 = -[GEOFormattedString copyWithZone:](self->_suggestionTitle, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v16;

  v18 = -[GEOFormattedString copyWithZone:](self->_suggestionBody, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v18;

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v20 = self->_educationalScreenAssets;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v28 != v22)
          objc_enumerationMutation(v20);
        v24 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v27);
        objc_msgSend((id)v5, "addEducationalScreenAsset:", v24);

      }
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v21);
  }

  v25 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v25;
LABEL_22:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOFormattedString *educationalScreenHeader;
  NSMutableArray *educationalScreenPaymentBodys;
  GEOFormattedString *suggestionTitle;
  GEOFormattedString *suggestionBody;
  NSMutableArray *educationalScreenAssets;
  char v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[GEOPBTransitPaymentMethodSuggestionDetails readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 84) & 1) == 0 || self->_paymentMethodRegionMuid != *((_QWORD *)v4 + 6))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 84) & 1) != 0)
  {
LABEL_17:
    v10 = 0;
    goto LABEL_18;
  }
  educationalScreenHeader = self->_educationalScreenHeader;
  if ((unint64_t)educationalScreenHeader | *((_QWORD *)v4 + 4)
    && !-[GEOFormattedString isEqual:](educationalScreenHeader, "isEqual:"))
  {
    goto LABEL_17;
  }
  educationalScreenPaymentBodys = self->_educationalScreenPaymentBodys;
  if ((unint64_t)educationalScreenPaymentBodys | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](educationalScreenPaymentBodys, "isEqual:"))
      goto LABEL_17;
  }
  suggestionTitle = self->_suggestionTitle;
  if ((unint64_t)suggestionTitle | *((_QWORD *)v4 + 8))
  {
    if (!-[GEOFormattedString isEqual:](suggestionTitle, "isEqual:"))
      goto LABEL_17;
  }
  suggestionBody = self->_suggestionBody;
  if ((unint64_t)suggestionBody | *((_QWORD *)v4 + 7))
  {
    if (!-[GEOFormattedString isEqual:](suggestionBody, "isEqual:"))
      goto LABEL_17;
  }
  educationalScreenAssets = self->_educationalScreenAssets;
  if ((unint64_t)educationalScreenAssets | *((_QWORD *)v4 + 3))
    v10 = -[NSMutableArray isEqual:](educationalScreenAssets, "isEqual:");
  else
    v10 = 1;
LABEL_18:

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  -[GEOPBTransitPaymentMethodSuggestionDetails readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761u * self->_paymentMethodRegionMuid;
  else
    v3 = 0;
  v4 = -[GEOFormattedString hash](self->_educationalScreenHeader, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_educationalScreenPaymentBodys, "hash");
  v6 = v4 ^ v5 ^ -[GEOFormattedString hash](self->_suggestionTitle, "hash");
  v7 = -[GEOFormattedString hash](self->_suggestionBody, "hash");
  return v6 ^ v7 ^ -[NSMutableArray hash](self->_educationalScreenAssets, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  GEOFormattedString *educationalScreenHeader;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  GEOFormattedString *suggestionTitle;
  uint64_t v13;
  GEOFormattedString *suggestionBody;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
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
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if ((*((_BYTE *)v4 + 84) & 1) != 0)
  {
    self->_paymentMethodRegionMuid = *((_QWORD *)v4 + 6);
    *(_BYTE *)&self->_flags |= 1u;
  }
  educationalScreenHeader = self->_educationalScreenHeader;
  v6 = *((_QWORD *)v4 + 4);
  if (educationalScreenHeader)
  {
    if (v6)
      -[GEOFormattedString mergeFrom:](educationalScreenHeader, "mergeFrom:");
  }
  else if (v6)
  {
    -[GEOPBTransitPaymentMethodSuggestionDetails setEducationalScreenHeader:](self, "setEducationalScreenHeader:");
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v7 = *((id *)v4 + 5);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(v7);
        -[GEOPBTransitPaymentMethodSuggestionDetails addEducationalScreenPaymentBody:](self, "addEducationalScreenPaymentBody:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v9);
  }

  suggestionTitle = self->_suggestionTitle;
  v13 = *((_QWORD *)v4 + 8);
  if (suggestionTitle)
  {
    if (v13)
      -[GEOFormattedString mergeFrom:](suggestionTitle, "mergeFrom:");
  }
  else if (v13)
  {
    -[GEOPBTransitPaymentMethodSuggestionDetails setSuggestionTitle:](self, "setSuggestionTitle:");
  }
  suggestionBody = self->_suggestionBody;
  v15 = *((_QWORD *)v4 + 7);
  if (suggestionBody)
  {
    if (v15)
      -[GEOFormattedString mergeFrom:](suggestionBody, "mergeFrom:");
  }
  else if (v15)
  {
    -[GEOPBTransitPaymentMethodSuggestionDetails setSuggestionBody:](self, "setSuggestionBody:");
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v16 = *((id *)v4 + 3);
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(v16);
        -[GEOPBTransitPaymentMethodSuggestionDetails addEducationalScreenAsset:](self, "addEducationalScreenAsset:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j), (_QWORD)v21);
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v18);
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOPBTransitPaymentMethodSuggestionDetailsReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_683_0);
      objc_sync_exit(v5);

    }
  }
  os_unfair_lock_unlock(p_readerLock);
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBUnknownFields *unknownFields;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v3 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x82u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOPBTransitPaymentMethodSuggestionDetails readAll:](self, "readAll:", 0);
    -[GEOFormattedString clearUnknownFields:](self->_educationalScreenHeader, "clearUnknownFields:", 1);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = self->_educationalScreenPaymentBodys;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v11++), "clearUnknownFields:", 1);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v9);
    }

    -[GEOFormattedString clearUnknownFields:](self->_suggestionTitle, "clearUnknownFields:", 1);
    -[GEOFormattedString clearUnknownFields:](self->_suggestionBody, "clearUnknownFields:", 1);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v12 = self->_educationalScreenAssets;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v18;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v18 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v16++), "clearUnknownFields:", 1, (_QWORD)v17);
        }
        while (v14 != v16);
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v14);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionTitle, 0);
  objc_storeStrong((id *)&self->_suggestionBody, 0);
  objc_storeStrong((id *)&self->_educationalScreenPaymentBodys, 0);
  objc_storeStrong((id *)&self->_educationalScreenHeader, 0);
  objc_storeStrong((id *)&self->_educationalScreenAssets, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
