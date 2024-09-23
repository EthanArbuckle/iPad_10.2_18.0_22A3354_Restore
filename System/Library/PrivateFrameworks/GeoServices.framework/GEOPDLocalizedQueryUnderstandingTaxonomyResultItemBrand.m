@implementation GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand

- (GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand)init
{
  GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand *v2;
  GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand *v3;
  GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand;
  v2 = -[GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand)initWithData:(id)a3
{
  GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand *v3;
  GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand *v4;
  GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand;
  v3 = -[GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readCategorys
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
  if ((*(_BYTE *)(a1 + 169) & 2) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrandReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCategorys_tags_2654);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
}

- (void)addCategory:(os_unfair_lock_s *)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand _readCategorys]((uint64_t)a1);
    -[GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand _addNoFlagsCategory:]((uint64_t)a1, v3);

    os_unfair_lock_lock_with_options();
    a1[42]._os_unfair_lock_opaque |= 0x200u;
    os_unfair_lock_unlock(a1 + 40);
    a1[42]._os_unfair_lock_opaque |= 0x40000u;
  }
}

- (void)_addNoFlagsCategory:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 72);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 72);
      *(_QWORD *)(a1 + 72) = v5;

      v4 = *(void **)(a1 + 72);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)addPrefCategoryIcon:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 169) & 0x20) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        v5 = v4;
        objc_sync_enter(v5);
        GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrandReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPrefCategoryIcons_tags);
        objc_sync_exit(v5);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
    -[GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand _addNoFlagsPrefCategoryIcon:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_DWORD *)(a1 + 168) |= 0x2000u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
    *(_DWORD *)(a1 + 168) |= 0x40000u;
  }
}

- (void)_addNoFlagsPrefCategoryIcon:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 112);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 112);
      *(_QWORD *)(a1 + 112) = v5;

      v4 = *(void **)(a1 + 112);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)_readBusinessCardAltCategories
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
  if ((*(_BYTE *)(a1 + 168) & 0x10) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrandReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBusinessCardAltCategories_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
}

- (void)addBusinessCardAltCategories:(os_unfair_lock_s *)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand _readBusinessCardAltCategories]((uint64_t)a1);
    -[GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand _addNoFlagsBusinessCardAltCategories:]((uint64_t)a1, v3);

    os_unfair_lock_lock_with_options();
    a1[42]._os_unfair_lock_opaque |= 0x10u;
    os_unfair_lock_unlock(a1 + 40);
    a1[42]._os_unfair_lock_opaque |= 0x40000u;
  }
}

- (void)_addNoFlagsBusinessCardAltCategories:(uint64_t)a1
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

- (void)addModernPrimaryCategoryIcon:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_BYTE *)(a1 + 169) & 8) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        v5 = v4;
        objc_sync_enter(v5);
        GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrandReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readModernPrimaryCategoryIcons_tags);
        objc_sync_exit(v5);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
    -[GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand _addNoFlagsModernPrimaryCategoryIcon:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_DWORD *)(a1 + 168) |= 0x800u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
    *(_DWORD *)(a1 + 168) |= 0x40000u;
  }
}

- (void)_addNoFlagsModernPrimaryCategoryIcon:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 88);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 88);
      *(_QWORD *)(a1 + 88) = v5;

      v4 = *(void **)(a1 + 88);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)_readBusinessCardModernAlternateCategories
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
  if ((*(_BYTE *)(a1 + 168) & 0x20) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrandReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBusinessCardModernAlternateCategories_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
}

- (void)addBusinessCardModernAlternateCategories:(os_unfair_lock_s *)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand _readBusinessCardModernAlternateCategories]((uint64_t)a1);
    -[GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand _addNoFlagsBusinessCardModernAlternateCategories:]((uint64_t)a1, v3);

    os_unfair_lock_lock_with_options();
    a1[42]._os_unfair_lock_opaque |= 0x20u;
    os_unfair_lock_unlock(a1 + 40);
    a1[42]._os_unfair_lock_opaque |= 0x40000u;
  }
}

- (void)_addNoFlagsBusinessCardModernAlternateCategories:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 32);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = v5;

      v4 = *(void **)(a1 + 32);
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
  v8.super_class = (Class)GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand;
  -[GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  const __CFString *v9;
  void *v10;
  id v11;
  id v12;
  const __CFString *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  const __CFString *v24;
  int v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  id v31;
  id v32;
  const __CFString *v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  void *v46;
  const __CFString *v47;
  id v48;
  const __CFString *v49;
  void *v50;
  id v51;
  id v52;
  const __CFString *v53;
  void *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t j;
  void *v59;
  void *v60;
  const __CFString *v61;
  void *v62;
  id v63;
  id v64;
  void *v65;
  void *v66;
  const __CFString *v67;
  id v68;
  const __CFString *v69;
  void *v70;
  id v71;
  id v72;
  void *v73;
  void *v74;
  const __CFString *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  id v81;
  _QWORD v83[4];
  id v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _BYTE v93[128];
  _BYTE v94[128];
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 168) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 104));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("muid"));

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
  if ((*(_BYTE *)(a1 + 170) & 1) == 0)
  {
    v6 = *(void **)(a1 + 8);
    if (v6)
    {
      v7 = v6;
      objc_sync_enter(v7);
      GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrandReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPrefPhone_tags);
      objc_sync_exit(v7);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  v8 = *(id *)(a1 + 136);
  if (v8)
  {
    if (a2)
      v9 = CFSTR("prefPhone");
    else
      v9 = CFSTR("pref_phone");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
  if ((*(_BYTE *)(a1 + 170) & 2) == 0)
  {
    v10 = *(void **)(a1 + 8);
    if (v10)
    {
      v11 = v10;
      objc_sync_enter(v11);
      GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrandReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPrefUrl_tags);
      objc_sync_exit(v11);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  v12 = *(id *)(a1 + 144);
  if (v12)
  {
    if (a2)
      v13 = CFSTR("prefUrl");
    else
      v13 = CFSTR("pref_url");
    objc_msgSend(v4, "setObject:forKey:", v12, v13);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
  if ((*(_BYTE *)(a1 + 169) & 0x80) == 0)
  {
    v14 = *(void **)(a1 + 8);
    if (v14)
    {
      v15 = v14;
      objc_sync_enter(v15);
      GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrandReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPrefDisplayName_tags);
      objc_sync_exit(v15);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  v16 = *(id *)(a1 + 128);
  v17 = v16;
  if (v16)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v16, "jsonRepresentation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = CFSTR("prefDisplayName");
    }
    else
    {
      objc_msgSend(v16, "dictionaryRepresentation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = CFSTR("pref_display_name");
    }
    objc_msgSend(v4, "setObject:forKey:", v18, v19);

  }
  if (*(_QWORD *)(a1 + 72))
  {
    -[GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand _readCategorys](a1);
    v20 = *(id *)(a1 + 72);
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("category"));

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
  if ((*(_BYTE *)(a1 + 169) & 4) == 0)
  {
    v21 = *(void **)(a1 + 8);
    if (v21)
    {
      v22 = v21;
      objc_sync_enter(v22);
      GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrandReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCountryCode_tags_2655);
      objc_sync_exit(v22);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  v23 = *(id *)(a1 + 80);
  if (v23)
  {
    if (a2)
      v24 = CFSTR("countryCode");
    else
      v24 = CFSTR("country_code");
    objc_msgSend(v4, "setObject:forKey:", v23, v24);
  }

  v25 = *(_DWORD *)(a1 + 168);
  if ((v25 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 164));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v27 = CFSTR("isUnclaimable");
    else
      v27 = CFSTR("is_unclaimable");
    objc_msgSend(v4, "setObject:forKey:", v26, v27);

    v25 = *(_DWORD *)(a1 + 168);
  }
  if ((v25 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 48));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v29 = CFSTR("businessCardPoiIconType");
    else
      v29 = CFSTR("business_card_poi_icon_type");
    objc_msgSend(v4, "setObject:forKey:", v28, v29);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
  if ((*(_BYTE *)(a1 + 168) & 0x80) == 0)
  {
    v30 = *(void **)(a1 + 8);
    if (v30)
    {
      v31 = v30;
      objc_sync_enter(v31);
      GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrandReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBusinessCardPrefCategory_tags);
      objc_sync_exit(v31);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  v32 = *(id *)(a1 + 56);
  if (v32)
  {
    if (a2)
      v33 = CFSTR("businessCardPrefCategory");
    else
      v33 = CFSTR("business_card_pref_category");
    objc_msgSend(v4, "setObject:forKey:", v32, v33);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
  if ((*(_BYTE *)(a1 + 169) & 0x40) == 0)
  {
    v34 = *(void **)(a1 + 8);
    if (v34)
    {
      v35 = v34;
      objc_sync_enter(v35);
      GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrandReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPrefCategoryNames_tags);
      objc_sync_exit(v35);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  v36 = *(id *)(a1 + 120);
  v37 = v36;
  if (v36)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v36, "jsonRepresentation");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = CFSTR("prefCategoryNames");
    }
    else
    {
      objc_msgSend(v36, "dictionaryRepresentation");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = CFSTR("pref_category_names");
    }
    objc_msgSend(v4, "setObject:forKey:", v38, v39);

  }
  if (objc_msgSend(*(id *)(a1 + 112), "count"))
  {
    v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 112), "count"));
    v89 = 0u;
    v90 = 0u;
    v91 = 0u;
    v92 = 0u;
    v41 = *(id *)(a1 + 112);
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v89, v94, 16);
    if (v42)
    {
      v43 = *(_QWORD *)v90;
      do
      {
        for (i = 0; i != v42; ++i)
        {
          if (*(_QWORD *)v90 != v43)
            objc_enumerationMutation(v41);
          v45 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v45, "jsonRepresentation");
          else
            objc_msgSend(v45, "dictionaryRepresentation");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "addObject:", v46);

        }
        v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v89, v94, 16);
      }
      while (v42);
    }

    if (a2)
      v47 = CFSTR("prefCategoryIcon");
    else
      v47 = CFSTR("pref_category_icon");
    objc_msgSend(v4, "setObject:forKey:", v40, v47);

  }
  if (*(_QWORD *)(a1 + 24))
  {
    -[GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand _readBusinessCardAltCategories](a1);
    v48 = *(id *)(a1 + 24);
    if (a2)
      v49 = CFSTR("businessCardAltCategories");
    else
      v49 = CFSTR("business_card_alt_categories");
    objc_msgSend(v4, "setObject:forKey:", v48, v49);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
  if ((*(_BYTE *)(a1 + 168) & 0x40) == 0)
  {
    v50 = *(void **)(a1 + 8);
    if (v50)
    {
      v51 = v50;
      objc_sync_enter(v51);
      GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrandReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBusinessCardModernPrimaryCategory_tags);
      objc_sync_exit(v51);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  v52 = *(id *)(a1 + 40);
  if (v52)
  {
    if (a2)
      v53 = CFSTR("businessCardModernPrimaryCategory");
    else
      v53 = CFSTR("business_card_modern_primary_category");
    objc_msgSend(v4, "setObject:forKey:", v52, v53);
  }

  if (objc_msgSend(*(id *)(a1 + 88), "count"))
  {
    v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 88), "count"));
    v87 = 0u;
    v88 = 0u;
    v85 = 0u;
    v86 = 0u;
    v55 = *(id *)(a1 + 88);
    v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v85, v93, 16);
    if (v56)
    {
      v57 = *(_QWORD *)v86;
      do
      {
        for (j = 0; j != v56; ++j)
        {
          if (*(_QWORD *)v86 != v57)
            objc_enumerationMutation(v55);
          v59 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v59, "jsonRepresentation");
          else
            objc_msgSend(v59, "dictionaryRepresentation");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "addObject:", v60);

        }
        v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v85, v93, 16);
      }
      while (v56);
    }

    if (a2)
      v61 = CFSTR("modernPrimaryCategoryIcon");
    else
      v61 = CFSTR("modern_primary_category_icon");
    objc_msgSend(v4, "setObject:forKey:", v54, v61);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
  if ((*(_BYTE *)(a1 + 169) & 0x10) == 0)
  {
    v62 = *(void **)(a1 + 8);
    if (v62)
    {
      v63 = v62;
      objc_sync_enter(v63);
      GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrandReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readModernPrimaryCategoryNames_tags);
      objc_sync_exit(v63);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  v64 = *(id *)(a1 + 96);
  v65 = v64;
  if (v64)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v64, "jsonRepresentation");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = CFSTR("modernPrimaryCategoryNames");
    }
    else
    {
      objc_msgSend(v64, "dictionaryRepresentation");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = CFSTR("modern_primary_category_names");
    }
    objc_msgSend(v4, "setObject:forKey:", v66, v67);

  }
  if (*(_QWORD *)(a1 + 32))
  {
    -[GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand _readBusinessCardModernAlternateCategories](a1);
    v68 = *(id *)(a1 + 32);
    if (a2)
      v69 = CFSTR("businessCardModernAlternateCategories");
    else
      v69 = CFSTR("business_card_modern_alternate_categories");
    objc_msgSend(v4, "setObject:forKey:", v68, v69);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
  if ((*(_BYTE *)(a1 + 169) & 1) == 0)
  {
    v70 = *(void **)(a1 + 8);
    if (v70)
    {
      v71 = v70;
      objc_sync_enter(v71);
      GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrandReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBusinessConnectAttributes_tags);
      objc_sync_exit(v71);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  v72 = *(id *)(a1 + 64);
  v73 = v72;
  if (v72)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v72, "jsonRepresentation");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = CFSTR("businessConnectAttributes");
    }
    else
    {
      objc_msgSend(v72, "dictionaryRepresentation");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = CFSTR("business_connect_attributes");
    }
    objc_msgSend(v4, "setObject:forKey:", v74, v75);

  }
  v76 = *(void **)(a1 + 16);
  if (v76)
  {
    objc_msgSend(v76, "dictionaryRepresentation");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = v77;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v77, "count"));
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v83[0] = MEMORY[0x1E0C809B0];
      v83[1] = 3221225472;
      v83[2] = __85__GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand__dictionaryRepresentation___block_invoke;
      v83[3] = &unk_1E1C00600;
      v80 = v79;
      v84 = v80;
      objc_msgSend(v78, "enumerateKeysAndObjectsUsingBlock:", v83);
      v81 = v80;

    }
    else
    {
      v81 = v77;
    }
    objc_msgSend(v4, "setObject:forKey:", v81, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_2717;
      else
        v6 = (int *)&readAll__nonRecursiveTag_2718;
      GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrandReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrandCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

void __85__GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrandReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  $9225C5C446B130B62C0262B23D04059C flags;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  $9225C5C446B130B62C0262B23D04059C v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t m;
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t n;
  GEOPDBusinessConnectAttributes *businessConnectAttributes;
  int v29;
  NSMutableArray *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  PBDataReader *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader)
    goto LABEL_7;
  os_unfair_lock_assert_owner(&self->_readerLock);
  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x70000) != 0)
    goto LABEL_7;
  if ((*(_WORD *)&flags & 0x8000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&flags & 0x7EF0) != 0)
      goto LABEL_7;
    if ((*(_WORD *)&flags & 0x100) != 0)
    {
      businessConnectAttributes = self->_businessConnectAttributes;
      if (businessConnectAttributes)
      {
        os_unfair_lock_lock_with_options();
        os_unfair_lock_assert_owner(&businessConnectAttributes->_readerLock);
        v29 = *(_BYTE *)&businessConnectAttributes->_flags & 0xE;
        os_unfair_lock_unlock(&businessConnectAttributes->_readerLock);
        if (v29)
          goto LABEL_7;
      }
      flags = self->_flags;
    }
    if ((*(_WORD *)&flags & 0x2000) != 0)
    {
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      v30 = self->_prefCategoryIcons;
      v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
      if (v31)
      {
        v32 = *(_QWORD *)v64;
LABEL_75:
        v33 = 0;
        while (1)
        {
          if (*(_QWORD *)v64 != v32)
            objc_enumerationMutation(v30);
          if ((GEOPDIconMappingIsDirty(*(os_unfair_lock_s **)(*((_QWORD *)&v63 + 1) + 8 * v33)) & 1) != 0)
            goto LABEL_93;
          if (v31 == ++v33)
          {
            v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
            if (v31)
              goto LABEL_75;
            break;
          }
        }
      }

      flags = self->_flags;
    }
    if ((*(_WORD *)&flags & 0x800) != 0)
    {
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      v30 = self->_modernPrimaryCategoryIcons;
      v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
      if (v34)
      {
        v35 = *(_QWORD *)v60;
LABEL_85:
        v36 = 0;
        while (1)
        {
          if (*(_QWORD *)v60 != v35)
            objc_enumerationMutation(v30);
          if ((GEOPDIconMappingIsDirty(*(os_unfair_lock_s **)(*((_QWORD *)&v59 + 1) + 8 * v36)) & 1) != 0)
            break;
          if (v34 == ++v36)
          {
            v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
            if (v34)
              goto LABEL_85;
            goto LABEL_91;
          }
        }
LABEL_93:

        goto LABEL_7;
      }
LABEL_91:

    }
    v37 = self->_reader;
    objc_sync_enter(v37);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v38);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v37);
    goto LABEL_67;
  }
  if (!GEOLocalizedStringIsDirty((uint64_t)self->_prefDisplayName))
  {
    flags = self->_flags;
    goto LABEL_6;
  }
LABEL_7:
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand readAll:]((uint64_t)self, 0);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_prefPhone)
    PBDataWriterWriteStringField();
  if (self->_prefUrl)
    PBDataWriterWriteStringField();
  if (self->_prefDisplayName)
    PBDataWriterWriteSubmessage();
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v7 = self->_categorys;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v55, v71, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v56 != v9)
          objc_enumerationMutation(v7);
        PBDataWriterWriteStringField();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v55, v71, 16);
    }
    while (v8);
  }

  if (self->_countryCode)
    PBDataWriterWriteStringField();
  v11 = self->_flags;
  if ((*(_BYTE *)&v11 & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    v11 = self->_flags;
  }
  if ((*(_BYTE *)&v11 & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_businessCardPrefCategory)
    PBDataWriterWriteStringField();
  if (self->_prefCategoryNames)
    PBDataWriterWriteSubmessage();
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v12 = self->_prefCategoryIcons;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v51, v70, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v52;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v52 != v14)
          objc_enumerationMutation(v12);
        PBDataWriterWriteSubmessage();
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v51, v70, 16);
    }
    while (v13);
  }

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v16 = self->_businessCardAltCategories;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v47, v69, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v48;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v48 != v18)
          objc_enumerationMutation(v16);
        PBDataWriterWriteStringField();
      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v47, v69, 16);
    }
    while (v17);
  }

  if (self->_businessCardModernPrimaryCategory)
    PBDataWriterWriteStringField();
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v20 = self->_modernPrimaryCategoryIcons;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v43, v68, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v44;
    do
    {
      for (m = 0; m != v21; ++m)
      {
        if (*(_QWORD *)v44 != v22)
          objc_enumerationMutation(v20);
        PBDataWriterWriteSubmessage();
      }
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v43, v68, 16);
    }
    while (v21);
  }

  if (self->_modernPrimaryCategoryNames)
    PBDataWriterWriteSubmessage();
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v24 = self->_businessCardModernAlternateCategories;
  v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v39, v67, 16);
  if (v25)
  {
    v26 = *(_QWORD *)v40;
    do
    {
      for (n = 0; n != v25; ++n)
      {
        if (*(_QWORD *)v40 != v26)
          objc_enumerationMutation(v24);
        PBDataWriterWriteStringField();
      }
      v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v39, v67, 16);
    }
    while (v25);
  }

  if (self->_businessConnectAttributes)
    PBDataWriterWriteSubmessage();
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v39);
LABEL_67:

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
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  void *v21;
  $9225C5C446B130B62C0262B23D04059C flags;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  NSMutableArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  NSMutableArray *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  void *v36;
  uint64_t v37;
  void *v38;
  NSMutableArray *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t m;
  void *v43;
  id v44;
  void *v45;
  NSMutableArray *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t n;
  void *v50;
  id v51;
  void *v52;
  PBUnknownFields *v53;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*((_BYTE *)&self->_flags + 2) & 4) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrandReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_47;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand readAll:]((uint64_t)self, 0);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(_QWORD *)(v5 + 104) = self->_muid;
    *(_DWORD *)(v5 + 168) |= 2u;
  }
  v9 = -[NSString copyWithZone:](self->_prefPhone, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v9;

  v11 = -[NSString copyWithZone:](self->_prefUrl, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v11;

  v13 = -[GEOLocalizedString copyWithZone:](self->_prefDisplayName, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v13;

  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v15 = self->_categorys;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v72;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v72 != v17)
          objc_enumerationMutation(v15);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * i), "copyWithZone:", a3);
        -[GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand addCategory:]((os_unfair_lock_s *)v5, v19);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
    }
    while (v16);
  }

  v20 = -[NSString copyWithZone:](self->_countryCode, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v20;

  flags = self->_flags;
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    *(_BYTE *)(v5 + 164) = self->_isUnclaimable;
    *(_DWORD *)(v5 + 168) |= 4u;
    flags = self->_flags;
  }
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 48) = self->_businessCardPoiIconType;
    *(_DWORD *)(v5 + 168) |= 1u;
  }
  v23 = -[NSString copyWithZone:](self->_businessCardPrefCategory, "copyWithZone:", a3);
  v24 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v23;

  v25 = -[GEOPDMultiLocalizedString copyWithZone:](self->_prefCategoryNames, "copyWithZone:", a3);
  v26 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v25;

  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v27 = self->_prefCategoryIcons;
  v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v67, v78, 16);
  if (v28)
  {
    v29 = *(_QWORD *)v68;
    do
    {
      for (j = 0; j != v28; ++j)
      {
        if (*(_QWORD *)v68 != v29)
          objc_enumerationMutation(v27);
        v31 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * j), "copyWithZone:", a3);
        -[GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand addPrefCategoryIcon:](v5, v31);

      }
      v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v67, v78, 16);
    }
    while (v28);
  }

  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v32 = self->_businessCardAltCategories;
  v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v63, v77, 16);
  if (v33)
  {
    v34 = *(_QWORD *)v64;
    do
    {
      for (k = 0; k != v33; ++k)
      {
        if (*(_QWORD *)v64 != v34)
          objc_enumerationMutation(v32);
        v36 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * k), "copyWithZone:", a3);
        -[GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand addBusinessCardAltCategories:]((os_unfair_lock_s *)v5, v36);

      }
      v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v63, v77, 16);
    }
    while (v33);
  }

  v37 = -[NSString copyWithZone:](self->_businessCardModernPrimaryCategory, "copyWithZone:", a3);
  v38 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v37;

  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v39 = self->_modernPrimaryCategoryIcons;
  v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v59, v76, 16);
  if (v40)
  {
    v41 = *(_QWORD *)v60;
    do
    {
      for (m = 0; m != v40; ++m)
      {
        if (*(_QWORD *)v60 != v41)
          objc_enumerationMutation(v39);
        v43 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * m), "copyWithZone:", a3);
        -[GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand addModernPrimaryCategoryIcon:](v5, v43);

      }
      v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v59, v76, 16);
    }
    while (v40);
  }

  v44 = -[GEOPDMultiLocalizedString copyWithZone:](self->_modernPrimaryCategoryNames, "copyWithZone:", a3);
  v45 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v44;

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v46 = self->_businessCardModernAlternateCategories;
  v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v55, v75, 16);
  if (v47)
  {
    v48 = *(_QWORD *)v56;
    do
    {
      for (n = 0; n != v47; ++n)
      {
        if (*(_QWORD *)v56 != v48)
          objc_enumerationMutation(v46);
        v50 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * n), "copyWithZone:", a3, (_QWORD)v55);
        -[GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand addBusinessCardModernAlternateCategories:]((os_unfair_lock_s *)v5, v50);

      }
      v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v55, v75, 16);
    }
    while (v47);
  }

  v51 = -[GEOPDBusinessConnectAttributes copyWithZone:](self->_businessConnectAttributes, "copyWithZone:", a3);
  v52 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v51;

  v53 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v53;
LABEL_47:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  NSString *prefPhone;
  NSString *prefUrl;
  GEOLocalizedString *prefDisplayName;
  NSMutableArray *categorys;
  NSString *countryCode;
  $9225C5C446B130B62C0262B23D04059C flags;
  int v12;
  NSString *businessCardPrefCategory;
  GEOPDMultiLocalizedString *prefCategoryNames;
  NSMutableArray *prefCategoryIcons;
  NSMutableArray *businessCardAltCategories;
  NSString *businessCardModernPrimaryCategory;
  NSMutableArray *modernPrimaryCategoryIcons;
  GEOPDMultiLocalizedString *modernPrimaryCategoryNames;
  NSMutableArray *businessCardModernAlternateCategories;
  GEOPDBusinessConnectAttributes *businessConnectAttributes;
  char v22;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_48;
  -[GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand readAll:]((uint64_t)self, 1);
  -[GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand readAll:]((uint64_t)v4, 1);
  v5 = *((_DWORD *)v4 + 42);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((v5 & 2) == 0 || self->_muid != *((_QWORD *)v4 + 13))
      goto LABEL_48;
  }
  else if ((v5 & 2) != 0)
  {
    goto LABEL_48;
  }
  prefPhone = self->_prefPhone;
  if ((unint64_t)prefPhone | *((_QWORD *)v4 + 17) && !-[NSString isEqual:](prefPhone, "isEqual:"))
    goto LABEL_48;
  prefUrl = self->_prefUrl;
  if ((unint64_t)prefUrl | *((_QWORD *)v4 + 18))
  {
    if (!-[NSString isEqual:](prefUrl, "isEqual:"))
      goto LABEL_48;
  }
  prefDisplayName = self->_prefDisplayName;
  if ((unint64_t)prefDisplayName | *((_QWORD *)v4 + 16))
  {
    if (!-[GEOLocalizedString isEqual:](prefDisplayName, "isEqual:"))
      goto LABEL_48;
  }
  categorys = self->_categorys;
  if ((unint64_t)categorys | *((_QWORD *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](categorys, "isEqual:"))
      goto LABEL_48;
  }
  countryCode = self->_countryCode;
  if ((unint64_t)countryCode | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](countryCode, "isEqual:"))
      goto LABEL_48;
  }
  flags = self->_flags;
  v12 = *((_DWORD *)v4 + 42);
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    if ((v12 & 4) != 0)
    {
      if (self->_isUnclaimable)
      {
        if (!*((_BYTE *)v4 + 164))
          goto LABEL_48;
        goto LABEL_25;
      }
      if (!*((_BYTE *)v4 + 164))
        goto LABEL_25;
    }
LABEL_48:
    v22 = 0;
    goto LABEL_49;
  }
  if ((v12 & 4) != 0)
    goto LABEL_48;
LABEL_25:
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    if ((v12 & 1) == 0 || self->_businessCardPoiIconType != *((_QWORD *)v4 + 6))
      goto LABEL_48;
  }
  else if ((v12 & 1) != 0)
  {
    goto LABEL_48;
  }
  businessCardPrefCategory = self->_businessCardPrefCategory;
  if ((unint64_t)businessCardPrefCategory | *((_QWORD *)v4 + 7)
    && !-[NSString isEqual:](businessCardPrefCategory, "isEqual:"))
  {
    goto LABEL_48;
  }
  prefCategoryNames = self->_prefCategoryNames;
  if ((unint64_t)prefCategoryNames | *((_QWORD *)v4 + 15))
  {
    if (!-[GEOPDMultiLocalizedString isEqual:](prefCategoryNames, "isEqual:"))
      goto LABEL_48;
  }
  prefCategoryIcons = self->_prefCategoryIcons;
  if ((unint64_t)prefCategoryIcons | *((_QWORD *)v4 + 14))
  {
    if (!-[NSMutableArray isEqual:](prefCategoryIcons, "isEqual:"))
      goto LABEL_48;
  }
  businessCardAltCategories = self->_businessCardAltCategories;
  if ((unint64_t)businessCardAltCategories | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](businessCardAltCategories, "isEqual:"))
      goto LABEL_48;
  }
  businessCardModernPrimaryCategory = self->_businessCardModernPrimaryCategory;
  if ((unint64_t)businessCardModernPrimaryCategory | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](businessCardModernPrimaryCategory, "isEqual:"))
      goto LABEL_48;
  }
  modernPrimaryCategoryIcons = self->_modernPrimaryCategoryIcons;
  if ((unint64_t)modernPrimaryCategoryIcons | *((_QWORD *)v4 + 11))
  {
    if (!-[NSMutableArray isEqual:](modernPrimaryCategoryIcons, "isEqual:"))
      goto LABEL_48;
  }
  modernPrimaryCategoryNames = self->_modernPrimaryCategoryNames;
  if ((unint64_t)modernPrimaryCategoryNames | *((_QWORD *)v4 + 12))
  {
    if (!-[GEOPDMultiLocalizedString isEqual:](modernPrimaryCategoryNames, "isEqual:"))
      goto LABEL_48;
  }
  businessCardModernAlternateCategories = self->_businessCardModernAlternateCategories;
  if ((unint64_t)businessCardModernAlternateCategories | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](businessCardModernAlternateCategories, "isEqual:"))
      goto LABEL_48;
  }
  businessConnectAttributes = self->_businessConnectAttributes;
  if ((unint64_t)businessConnectAttributes | *((_QWORD *)v4 + 8))
    v22 = -[GEOPDBusinessConnectAttributes isEqual:](businessConnectAttributes, "isEqual:");
  else
    v22 = 1;
LABEL_49:

  return v22;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  unint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  $9225C5C446B130B62C0262B23D04059C flags;
  uint64_t v10;
  unint64_t v11;
  NSUInteger v12;
  NSUInteger v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSUInteger v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;

  -[GEOPDLocalizedQueryUnderstandingTaxonomyResultItemBrand readAll:]((uint64_t)self, 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v3 = 2654435761u * self->_muid;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_prefPhone, "hash");
  v5 = -[NSString hash](self->_prefUrl, "hash");
  v6 = -[GEOLocalizedString hash](self->_prefDisplayName, "hash");
  v7 = -[NSMutableArray hash](self->_categorys, "hash");
  v8 = -[NSString hash](self->_countryCode, "hash");
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    v10 = 2654435761 * self->_isUnclaimable;
    if ((*(_BYTE *)&flags & 1) != 0)
      goto LABEL_6;
LABEL_8:
    v11 = 0;
    goto LABEL_9;
  }
  v10 = 0;
  if ((*(_BYTE *)&flags & 1) == 0)
    goto LABEL_8;
LABEL_6:
  v11 = 2654435761u * self->_businessCardPoiIconType;
LABEL_9:
  v12 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v10;
  v13 = v11 ^ -[NSString hash](self->_businessCardPrefCategory, "hash");
  v14 = v13 ^ -[GEOPDMultiLocalizedString hash](self->_prefCategoryNames, "hash");
  v15 = v12 ^ v14 ^ -[NSMutableArray hash](self->_prefCategoryIcons, "hash");
  v16 = -[NSMutableArray hash](self->_businessCardAltCategories, "hash");
  v17 = v16 ^ -[NSString hash](self->_businessCardModernPrimaryCategory, "hash");
  v18 = v17 ^ -[NSMutableArray hash](self->_modernPrimaryCategoryIcons, "hash");
  v19 = v18 ^ -[GEOPDMultiLocalizedString hash](self->_modernPrimaryCategoryNames, "hash");
  v20 = v15 ^ v19 ^ -[NSMutableArray hash](self->_businessCardModernAlternateCategories, "hash");
  return v20 ^ -[GEOPDBusinessConnectAttributes hash](self->_businessConnectAttributes, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefUrl, 0);
  objc_storeStrong((id *)&self->_prefPhone, 0);
  objc_storeStrong((id *)&self->_prefDisplayName, 0);
  objc_storeStrong((id *)&self->_prefCategoryNames, 0);
  objc_storeStrong((id *)&self->_prefCategoryIcons, 0);
  objc_storeStrong((id *)&self->_modernPrimaryCategoryNames, 0);
  objc_storeStrong((id *)&self->_modernPrimaryCategoryIcons, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_categorys, 0);
  objc_storeStrong((id *)&self->_businessConnectAttributes, 0);
  objc_storeStrong((id *)&self->_businessCardPrefCategory, 0);
  objc_storeStrong((id *)&self->_businessCardModernPrimaryCategory, 0);
  objc_storeStrong((id *)&self->_businessCardModernAlternateCategories, 0);
  objc_storeStrong((id *)&self->_businessCardAltCategories, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
