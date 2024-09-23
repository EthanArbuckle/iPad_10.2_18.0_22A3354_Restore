@implementation GEOPDDataItem

- (id)categoryName
{
  id *v2;
  void *v3;
  void *v4;

  -[GEOPDDataItem categoryData]((id *)&self->super.super.isa);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDCategoryData categoryNames](v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOLocalizedString bestStringForCurrentLocale:fallbackToFirstAvailable:](GEOLocalizedString, "bestStringForCurrentLocale:fallbackToFirstAvailable:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)locationName
{
  id *v2;
  void *v3;
  void *v4;

  -[GEOPDDataItem locationData]((id *)&self->super.super.isa);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDLocationData locationNames](v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOLocalizedString bestStringForCurrentLocale:fallbackToFirstAvailable:](GEOLocalizedString, "bestStringForCurrentLocale:fallbackToFirstAvailable:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (GEOPDDataItem)init
{
  GEOPDDataItem *v2;
  GEOPDDataItem *v3;
  GEOPDDataItem *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDDataItem;
  v2 = -[GEOPDDataItem init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDDataItem)initWithData:(id)a3
{
  GEOPDDataItem *v3;
  GEOPDDataItem *v4;
  GEOPDDataItem *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDDataItem;
  v3 = -[GEOPDDataItem initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (uint64_t)type
{
  uint64_t v1;
  char v2;

  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    v2 = *(_BYTE *)(v1 + 80);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 72));
    if ((v2 & 1) != 0)
      return *(unsigned int *)(v1 + 76);
    else
      return 0;
  }
  return result;
}

- (void)_readRatingData
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 80) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDDataItemReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRatingData_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)ratingData
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDDataItem _readRatingData]((uint64_t)a1);
    a1 = (id *)v1[7];
  }
  return a1;
}

- (void)_readCategoryData
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 80) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDDataItemReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCategoryData_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)categoryData
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDDataItem _readCategoryData]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (void)_readFactoidData
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 80) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDDataItemReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFactoidData_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)factoidData
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDDataItem _readFactoidData]((uint64_t)a1);
    a1 = (id *)v1[5];
  }
  return a1;
}

- (void)_readBusinessHoursData
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 80) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDDataItemReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBusinessHoursData_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)businessHoursData
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDDataItem _readBusinessHoursData]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (void)_readLocationData
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 80) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDDataItemReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLocationData_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)locationData
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDDataItem _readLocationData]((uint64_t)a1);
    a1 = (id *)v1[6];
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
  v8.super_class = (Class)GEOPDDataItem;
  -[GEOPDDataItem description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDDataItem dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDDataItem _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  _QWORD v34[4];
  id v35;

  if (!a1)
    return 0;
  -[GEOPDDataItem readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 80) & 1) != 0)
  {
    v5 = *(int *)(a1 + 76);
    if (v5 >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 76));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E1C0B888[v5];
    }
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("type"));

  }
  -[GEOPDDataItem ratingData]((id *)a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v7, "jsonRepresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("ratingData");
    }
    else
    {
      objc_msgSend(v7, "dictionaryRepresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("rating_data");
    }
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

  }
  -[GEOPDDataItem categoryData]((id *)a1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v11, "jsonRepresentation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("categoryData");
    }
    else
    {
      objc_msgSend(v11, "dictionaryRepresentation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("category_data");
    }
    objc_msgSend(v4, "setObject:forKey:", v13, v14);

  }
  -[GEOPDDataItem factoidData]((id *)a1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v15, "jsonRepresentation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = CFSTR("factoidData");
    }
    else
    {
      objc_msgSend(v15, "dictionaryRepresentation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = CFSTR("factoid_data");
    }
    objc_msgSend(v4, "setObject:forKey:", v17, v18);

  }
  -[GEOPDDataItem businessHoursData]((id *)a1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v19, "jsonRepresentation");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = CFSTR("businessHoursData");
    }
    else
    {
      objc_msgSend(v19, "dictionaryRepresentation");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = CFSTR("business_hours_data");
    }
    objc_msgSend(v4, "setObject:forKey:", v21, v22);

  }
  -[GEOPDDataItem locationData]((id *)a1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v23, "jsonRepresentation");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = CFSTR("locationData");
    }
    else
    {
      objc_msgSend(v23, "dictionaryRepresentation");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = CFSTR("location_data");
    }
    objc_msgSend(v4, "setObject:forKey:", v25, v26);

  }
  v27 = *(void **)(a1 + 16);
  if (v27)
  {
    objc_msgSend(v27, "dictionaryRepresentation");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v28, "count"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __43__GEOPDDataItem__dictionaryRepresentation___block_invoke;
      v34[3] = &unk_1E1C00600;
      v31 = v30;
      v35 = v31;
      objc_msgSend(v29, "enumerateKeysAndObjectsUsingBlock:", v34);
      v32 = v31;

      v29 = v32;
    }
    objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDDataItem _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_2733;
      else
        v6 = (int *)&readAll__nonRecursiveTag_2734;
      GEOPDDataItemReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      -[GEOPDRatingData readAll:](*(_QWORD *)(a1 + 56), 1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

void __43__GEOPDDataItem__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  uint64_t v6;
  void *v7;
  id v8;
  int v9;
  const __CFString *v10;
  void *v11;
  GEOPDRatingData *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  GEOPDRating *v21;
  void *v22;
  uint64_t v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  id v27;
  GEOPDRatingData *v28;
  const __CFString *v29;
  void *v30;
  GEOPDCategoryData *v31;
  id v32;
  const __CFString *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  uint64_t v40;
  GEOLocalizedString *v41;
  GEOLocalizedString *v42;
  GEOLocalizedString *v43;
  GEOPDCategoryData *v44;
  const __CFString *v45;
  void *v46;
  GEOPDFactoidData *v47;
  id v48;
  void *v49;
  GEOPDFactoid *v50;
  void *v51;
  id v52;
  GEOPDFactoidData *v53;
  const __CFString *v54;
  void *v55;
  GEOPDBusinessHoursData *v56;
  id v57;
  const __CFString *v58;
  void *v59;
  GEOPDBusinessHours *v60;
  void *v61;
  id v62;
  GEOPDBusinessHoursData *v63;
  const __CFString *v64;
  void *v65;
  GEOPDLocationData *v66;
  id v67;
  const __CFString *v68;
  void *v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t j;
  uint64_t v75;
  GEOLocalizedString *v76;
  GEOLocalizedString *v77;
  GEOLocalizedString *v78;
  GEOPDLocationData *v79;
  void *v81;
  void *v82;
  id v83;
  id v84;
  void *v85;
  void *v86;
  id v87;
  id v88;
  id v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _BYTE v94[128];
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = objc_msgSend(a1, "init");
  if (!v6)
    goto LABEL_133;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ITEM_TYPE_UNKNOWN")) & 1) != 0)
    {
      v9 = 0;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ITEM_TYPE_RATING")) & 1) != 0)
    {
      v9 = 1;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ITEM_TYPE_CATEGORY")) & 1) != 0)
    {
      v9 = 2;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ITEM_TYPE_FACTOID")) & 1) != 0)
    {
      v9 = 3;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ITEM_TYPE_BUSINESS_HOURS")) & 1) != 0)
    {
      v9 = 4;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ITEM_TYPE_LOCATION")) & 1) != 0)
    {
      v9 = 5;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("ITEM_TYPE_HIKES")))
    {
      v9 = 6;
    }
    else
    {
      v9 = 0;
    }

    goto LABEL_21;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_msgSend(v7, "intValue");
LABEL_21:
    *(_BYTE *)(v6 + 80) |= 0x80u;
    *(_BYTE *)(v6 + 80) |= 1u;
    *(_DWORD *)(v6 + 76) = v9;
  }

  if (a3)
    v10 = CFSTR("ratingData");
  else
    v10 = CFSTR("rating_data");
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = [GEOPDRatingData alloc];
    if (v12)
    {
      v13 = v11;
      v12 = -[GEOPDRatingData init](v12, "init");
      if (v12)
      {
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("rating"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v84 = v13;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v81 = v14;
          v83 = v11;
          v87 = v5;
          v92 = 0u;
          v93 = 0u;
          v90 = 0u;
          v91 = 0u;
          v15 = v14;
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v90, v94, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v91;
            do
            {
              v19 = 0;
              do
              {
                if (*(_QWORD *)v91 != v18)
                  objc_enumerationMutation(v15);
                v20 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * v19);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v21 = [GEOPDRating alloc];
                  if (v21)
                    v22 = (void *)-[GEOPDRating _initWithDictionary:isJSON:](v21, v20, a3);
                  else
                    v22 = 0;
                  -[GEOPDRatingData addRating:]((uint64_t)v12, v22);

                }
                ++v19;
              }
              while (v17 != v19);
              v23 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v90, v94, 16);
              v17 = v23;
            }
            while (v23);
          }

          v13 = v84;
          v5 = v87;
          v11 = v83;
        }

        if (a3)
          v24 = CFSTR("vendorId");
        else
          v24 = CFSTR("vendor_id");
        objc_msgSend(v13, "objectForKeyedSubscript:", v24, v81, v83);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v26 = (void *)objc_msgSend(v25, "copy");
          v27 = v26;
          *(_BYTE *)&v12->_flags |= 4u;
          *(_BYTE *)&v12->_flags |= 8u;
          v13 = v84;
          objc_storeStrong((id *)&v12->_vendorId, v26);

        }
      }

    }
    v28 = v12;
    *(_BYTE *)(v6 + 80) |= 0x40u;
    *(_BYTE *)(v6 + 80) |= 0x80u;
    objc_storeStrong((id *)(v6 + 56), v12);

  }
  if (a3)
    v29 = CFSTR("categoryData");
  else
    v29 = CFSTR("category_data");
  objc_msgSend(v5, "objectForKeyedSubscript:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v31 = [GEOPDCategoryData alloc];
    if (v31)
    {
      v32 = v30;
      v31 = -[GEOPDCategoryData init](v31, "init");
      if (v31)
      {
        if (a3)
          v33 = CFSTR("categoryName");
        else
          v33 = CFSTR("category_name");
        objc_msgSend(v32, "objectForKeyedSubscript:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v83 = v32;
          v85 = v30;
          v88 = v5;
          v92 = 0u;
          v93 = 0u;
          v90 = 0u;
          v91 = 0u;
          v81 = v34;
          v35 = v34;
          v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v90, v94, 16);
          if (v36)
          {
            v37 = v36;
            v38 = *(_QWORD *)v91;
            do
            {
              for (i = 0; i != v37; ++i)
              {
                if (*(_QWORD *)v91 != v38)
                  objc_enumerationMutation(v35);
                v40 = *(_QWORD *)(*((_QWORD *)&v90 + 1) + 8 * i);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v41 = [GEOLocalizedString alloc];
                  if ((a3 & 1) != 0)
                    v42 = -[GEOLocalizedString initWithJSON:](v41, "initWithJSON:", v40);
                  else
                    v42 = -[GEOLocalizedString initWithDictionary:](v41, "initWithDictionary:", v40);
                  v43 = v42;
                  -[GEOPDCategoryData addCategoryName:]((uint64_t)v31, v42);

                }
              }
              v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v90, v94, 16);
            }
            while (v37);
          }

          v30 = v85;
          v5 = v88;
          v34 = v81;
        }

      }
    }
    v44 = v31;
    *(_BYTE *)(v6 + 80) |= 8u;
    *(_BYTE *)(v6 + 80) |= 0x80u;
    objc_storeStrong((id *)(v6 + 32), v31);

  }
  if (a3)
    v45 = CFSTR("factoidData");
  else
    v45 = CFSTR("factoid_data");
  objc_msgSend(v5, "objectForKeyedSubscript:", v45, v81, v83);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v47 = [GEOPDFactoidData alloc];
    if (v47)
    {
      v48 = v46;
      v47 = -[GEOPDFactoidData init](v47, "init");
      if (v47)
      {
        objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("factoid"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v50 = [GEOPDFactoid alloc];
          if (v50)
            v51 = (void *)-[GEOPDFactoid _initWithDictionary:isJSON:](v50, v49, a3);
          else
            v51 = 0;
          v52 = v51;
          objc_storeStrong((id *)&v47->_factoid, v51);

        }
      }

    }
    v53 = v47;
    *(_BYTE *)(v6 + 80) |= 0x10u;
    *(_BYTE *)(v6 + 80) |= 0x80u;
    objc_storeStrong((id *)(v6 + 40), v47);

  }
  if (a3)
    v54 = CFSTR("businessHoursData");
  else
    v54 = CFSTR("business_hours_data");
  objc_msgSend(v5, "objectForKeyedSubscript:", v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v56 = [GEOPDBusinessHoursData alloc];
    if (v56)
    {
      v57 = v55;
      v56 = -[GEOPDBusinessHoursData init](v56, "init");
      if (v56)
      {
        if (a3)
          v58 = CFSTR("businessHours");
        else
          v58 = CFSTR("business_hours");
        objc_msgSend(v57, "objectForKeyedSubscript:", v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v60 = [GEOPDBusinessHours alloc];
          if (v60)
            v61 = (void *)-[GEOPDBusinessHours _initWithDictionary:isJSON:](v60, v59, a3);
          else
            v61 = 0;
          v62 = v61;
          objc_storeStrong((id *)&v56->_businessHours, v61);

        }
      }

    }
    v63 = v56;
    *(_BYTE *)(v6 + 80) |= 4u;
    *(_BYTE *)(v6 + 80) |= 0x80u;
    objc_storeStrong((id *)(v6 + 24), v56);

  }
  if (a3)
    v64 = CFSTR("locationData");
  else
    v64 = CFSTR("location_data");
  objc_msgSend(v5, "objectForKeyedSubscript:", v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v66 = [GEOPDLocationData alloc];
    if (v66)
    {
      v67 = v65;
      v66 = -[GEOPDLocationData init](v66, "init");
      if (v66)
      {
        if (a3)
          v68 = CFSTR("locationName");
        else
          v68 = CFSTR("location_name");
        objc_msgSend(v67, "objectForKeyedSubscript:", v68);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v86 = v65;
          v89 = v5;
          v92 = 0u;
          v93 = 0u;
          v90 = 0u;
          v91 = 0u;
          v82 = v69;
          v70 = v69;
          v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v90, v94, 16);
          if (v71)
          {
            v72 = v71;
            v73 = *(_QWORD *)v91;
            do
            {
              for (j = 0; j != v72; ++j)
              {
                if (*(_QWORD *)v91 != v73)
                  objc_enumerationMutation(v70);
                v75 = *(_QWORD *)(*((_QWORD *)&v90 + 1) + 8 * j);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v76 = [GEOLocalizedString alloc];
                  if ((a3 & 1) != 0)
                    v77 = -[GEOLocalizedString initWithJSON:](v76, "initWithJSON:", v75);
                  else
                    v77 = -[GEOLocalizedString initWithDictionary:](v76, "initWithDictionary:", v75);
                  v78 = v77;
                  -[GEOPDLocationData addLocationName:]((uint64_t)v66, v77);

                }
              }
              v72 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v90, v94, 16);
            }
            while (v72);
          }

          v65 = v86;
          v5 = v89;
          v69 = v82;
        }

      }
    }
    v79 = v66;
    *(_BYTE *)(v6 + 80) |= 0x20u;
    *(_BYTE *)(v6 + 80) |= 0x80u;
    objc_storeStrong((id *)(v6 + 48), v66);

  }
LABEL_133:

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDDataItemReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEOPDDataItemIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOPDDataItem readAll:]((uint64_t)self, 0);
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    v5 = v8;
    if (self->_ratingData)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_categoryData)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_factoidData)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_businessHoursData)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_locationData)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (result)
  {
    v3 = result;
    -[GEOPDDataItem _readFactoidData](result);
    v4 = *(_QWORD *)(v3 + 40);
    result = 0;
    if (v4)
    {
      v5 = *(_QWORD *)(v4 + 16);
      if (v5)
      {
        -[GEOPDFactoid _readPlaceId](*(_QWORD *)(v4 + 16));
        if ((objc_msgSend(*(id *)(v5 + 48), "hasGreenTeaWithValue:", a2) & 1) != 0)
          return 1;
      }
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
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  PBUnknownFields *v19;

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
      GEOPDDataItemReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDDataItem readAll:]((uint64_t)self, 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 76) = self->_type;
    *(_BYTE *)(v5 + 80) |= 1u;
  }
  v9 = -[GEOPDRatingData copyWithZone:](self->_ratingData, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v9;

  v11 = -[GEOPDCategoryData copyWithZone:](self->_categoryData, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v11;

  v13 = -[GEOPDFactoidData copyWithZone:](self->_factoidData, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v13;

  v15 = -[GEOPDBusinessHoursData copyWithZone:](self->_businessHoursData, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v15;

  v17 = -[GEOPDLocationData copyWithZone:](self->_locationData, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v17;

  v19 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v19;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOPDRatingData *ratingData;
  GEOPDCategoryData *categoryData;
  GEOPDFactoidData *factoidData;
  GEOPDBusinessHoursData *businessHoursData;
  GEOPDLocationData *locationData;
  char v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[GEOPDDataItem readAll:]((uint64_t)self, 1);
  -[GEOPDDataItem readAll:]((uint64_t)v4, 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 1) == 0 || self->_type != *((_DWORD *)v4 + 19))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 80) & 1) != 0)
  {
LABEL_17:
    v10 = 0;
    goto LABEL_18;
  }
  ratingData = self->_ratingData;
  if ((unint64_t)ratingData | *((_QWORD *)v4 + 7) && !-[GEOPDRatingData isEqual:](ratingData, "isEqual:"))
    goto LABEL_17;
  categoryData = self->_categoryData;
  if ((unint64_t)categoryData | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOPDCategoryData isEqual:](categoryData, "isEqual:"))
      goto LABEL_17;
  }
  factoidData = self->_factoidData;
  if ((unint64_t)factoidData | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOPDFactoidData isEqual:](factoidData, "isEqual:"))
      goto LABEL_17;
  }
  businessHoursData = self->_businessHoursData;
  if ((unint64_t)businessHoursData | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOPDBusinessHoursData isEqual:](businessHoursData, "isEqual:"))
      goto LABEL_17;
  }
  locationData = self->_locationData;
  if ((unint64_t)locationData | *((_QWORD *)v4 + 6))
    v10 = -[GEOPDLocationData isEqual:](locationData, "isEqual:");
  else
    v10 = 1;
LABEL_18:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  -[GEOPDDataItem readAll:]((uint64_t)self, 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_type;
  else
    v3 = 0;
  v4 = -[GEOPDRatingData hash](self->_ratingData, "hash") ^ v3;
  v5 = -[GEOPDCategoryData hash](self->_categoryData, "hash");
  v6 = v4 ^ v5 ^ -[GEOPDFactoidData hash](self->_factoidData, "hash");
  v7 = -[GEOPDBusinessHoursData hash](self->_businessHoursData, "hash");
  return v6 ^ v7 ^ -[GEOPDLocationData hash](self->_locationData, "hash");
}

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 80) |= 2u;
    *(_BYTE *)(a1 + 80) |= 0x80u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    v2 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    -[GEOPDDataItem readAll:](a1, 0);
    v3 = *(_QWORD *)(a1 + 56);
    if (v3)
    {
      os_unfair_lock_lock_with_options();
      *(_BYTE *)(v3 + 52) |= 1u;
      *(_BYTE *)(v3 + 52) |= 8u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 48));
      v4 = *(void **)(v3 + 16);
      *(_QWORD *)(v3 + 16) = 0;

      -[GEOPDRatingData readAll:](v3, 0);
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v5 = *(id *)(v3 + 24);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v29;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v29 != v8)
              objc_enumerationMutation(v5);
            -[GEOPDRating clearUnknownFields:](*(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v9++));
          }
          while (v7 != v9);
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        }
        while (v7);
      }

    }
    v10 = *(_QWORD *)(a1 + 32);
    if (v10)
    {
      v11 = *(void **)(v10 + 8);
      *(_QWORD *)(v10 + 8) = 0;

      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v12 = *(id *)(v10 + 16);
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v29;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v29 != v15)
              objc_enumerationMutation(v12);
            objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v16++), "clearUnknownFields:", 1);
          }
          while (v14 != v16);
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        }
        while (v14);
      }

    }
    v17 = *(_QWORD *)(a1 + 40);
    if (v17)
    {
      v18 = *(void **)(v17 + 8);
      *(_QWORD *)(v17 + 8) = 0;

      -[GEOPDFactoid clearUnknownFields:](*(_QWORD *)(v17 + 16));
    }
    v19 = *(_QWORD *)(a1 + 24);
    if (v19)
    {
      v20 = *(void **)(v19 + 8);
      *(_QWORD *)(v19 + 8) = 0;

      -[GEOPDBusinessHours clearUnknownFields:](*(_QWORD *)(v19 + 16));
    }
    v21 = *(_QWORD *)(a1 + 48);
    if (v21)
    {
      v22 = *(void **)(v21 + 8);
      *(_QWORD *)(v21 + 8) = 0;

      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v23 = *(id *)(v21 + 16);
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v29;
        do
        {
          v27 = 0;
          do
          {
            if (*(_QWORD *)v29 != v26)
              objc_enumerationMutation(v23);
            objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v27++), "clearUnknownFields:", 1);
          }
          while (v25 != v27);
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        }
        while (v25);
      }

    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ratingData, 0);
  objc_storeStrong((id *)&self->_locationData, 0);
  objc_storeStrong((id *)&self->_factoidData, 0);
  objc_storeStrong((id *)&self->_categoryData, 0);
  objc_storeStrong((id *)&self->_businessHoursData, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
