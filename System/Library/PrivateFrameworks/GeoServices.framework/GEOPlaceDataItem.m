@implementation GEOPlaceDataItem

void __29___GEOPlaceDataItem_timezone__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id *v4;
  id *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 208);
  if (!v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0C99E80]);
    +[GEOPDPlaceInfo placeInfoForPlaceData:](GEOPDPlaceInfo, "placeInfoForPlaceData:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
    v4 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOPDPlaceInfo timezone](v4);
    v5 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOTimezone identifier](v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v3, "initWithName:", v6);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 208);
    *(_QWORD *)(v8 + 208) = v7;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 208);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
}

void __25___GEOPlaceDataItem_name__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v1 + 136))
  {
    objc_msgSend(*(id *)(v1 + 24), "bestName");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 136);
    *(_QWORD *)(v4 + 136) = v3;

  }
}

void __34___GEOPlaceDataItem_addressObject__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v1 + 128))
  {
    +[GEOAddressObject addressObjectForPlaceData:](GEOAddressObject, "addressObjectForPlaceData:", *(_QWORD *)(v1 + 24));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 128);
    *(_QWORD *)(v4 + 128) = v3;

  }
}

void __31___GEOPlaceDataItem__placeType__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_DWORD *)(v1 + 144))
  {
    +[GEOPDEntity entityForPlaceData:](GEOPDEntity, "entityForPlaceData:", *(_QWORD *)(v1 + 24));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 144) = _MapItemPlaceTypeForPDPlaceType(objc_msgSend(v3, "type"));

  }
}

void __48___GEOPlaceDataItem__relatedPlacesByComponentId__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  GEORelatedPlaceList *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  GEORelatedPlaceList *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 184))
  {
    v1 = a1;
    v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[GEOPDTemplatePlace templatedPlacesForPlaceData:](GEOPDTemplatePlace, "templatedPlacesForPlaceData:", *(_QWORD *)(*(_QWORD *)(v1 + 32) + 24));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "count"))
    {
      v27 = v2;
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      objc_msgSend(v3, "allKeys");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v34 != v7)
              objc_enumerationMutation(v4);
            v9 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
            objc_msgSend(v3, "objectForKeyedSubscript:", v9);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            if (v10)
            {
              v11 = v1;
              v12 = -[GEORelatedPlaceList initWithTemplatePlace:attributedMap:]([GEORelatedPlaceList alloc], "initWithTemplatePlace:attributedMap:", v10, *(_QWORD *)(*(_QWORD *)(v1 + 32) + 32));
              if (v12)
                objc_msgSend(v27, "setObject:forKeyedSubscript:", v12, v9);

              v1 = v11;
            }

          }
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
        }
        while (v6);
      }

      v2 = v27;
      v13 = objc_msgSend(v27, "copy");
      v14 = *(_QWORD *)(v1 + 32);
      v15 = *(void **)(v14 + 184);
      *(_QWORD *)(v14 + 184) = v13;
    }
    else
    {
      +[GEOPDRelatedPlace relatedPlacesForPlaceData:](GEOPDRelatedPlace, "relatedPlacesForPlaceData:", *(_QWORD *)(*(_QWORD *)(v1 + 32) + 24));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "count"))
      {
        v28 = v1;
        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        objc_msgSend(v15, "allKeys");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v30;
          do
          {
            for (j = 0; j != v18; ++j)
            {
              if (*(_QWORD *)v30 != v19)
                objc_enumerationMutation(v16);
              v21 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j);
              objc_msgSend(v15, "objectForKeyedSubscript:", v21);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              if (v22)
              {
                v23 = -[GEORelatedPlaceList initWithRelatedPlace:]([GEORelatedPlaceList alloc], "initWithRelatedPlace:", v22);
                if (v23)
                  objc_msgSend(v2, "setObject:forKeyedSubscript:", v23, v21);

              }
            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
          }
          while (v18);
        }

        v24 = objc_msgSend(v2, "copy");
        v25 = *(_QWORD *)(v28 + 32);
        v26 = *(void **)(v25 + 184);
        *(_QWORD *)(v25 + 184) = v24;

      }
    }

  }
}

void __46___GEOPlaceDataItem__placeDataStyleAttributes__block_invoke_2(uint64_t a1, id *a2, BOOL *a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  -[GEOPDComponentValue entity](a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "styleAttributes");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  *a3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) != 0;
}

void __46___GEOPlaceDataItem__placeDataStyleAttributes__block_invoke(uint64_t a1, id *a2, BOOL *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  -[GEOPDComponentValue styleAttributes](a2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  *a3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) != 0;
}

void __129___GEOPlaceDataItem_initWithPlaceData_attributionMap_disambiguationLabel_detourInfo_externalTransitStationCode_additionalPlaces___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;

  v3 = a2;
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v5 = v3;
  geo_isolate_sync();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("GEOMapItemDidResolveAttribution"), *(_QWORD *)(a1 + 32));

}

uint64_t __129___GEOPlaceDataItem_initWithPlaceData_attributionMap_disambiguationLabel_detourInfo_externalTransitStationCode_additionalPlaces___block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_refreshPhotoAttributions");
}

GEOMapItemAdditionalPlaceInfo *__71___GEOPlaceDataItem_initWithPlaceData_detourInfo_additionalPlaceDatas___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _GEOPlaceDataItem *v3;
  GEOMapItemAdditionalPlaceInfo *v4;

  v2 = a2;
  v3 = -[_GEOPlaceDataItem initWithPlaceData:]([_GEOPlaceDataItem alloc], "initWithPlaceData:", v2);

  v4 = -[GEOMapItemAdditionalPlaceInfo initWithMapItem:]([GEOMapItemAdditionalPlaceInfo alloc], "initWithMapItem:", v3);
  return v4;
}

void __35___GEOPlaceDataItem__businessHours__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  GEOBusinessHours *v11;
  void *v12;
  GEOBusinessHours *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 216);
  if (!v3)
  {
    if (*(_BYTE *)(v2 + 224))
    {
      v3 = 0;
    }
    else
    {
      *(_BYTE *)(v2 + 224) = 1;
      +[GEOPDBusinessHours businessHoursForPlaceData:](GEOPDBusinessHours, "businessHoursForPlaceData:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v5)
      {
        v6 = v5;
        v7 = 0;
        v8 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v21 != v8)
              objc_enumerationMutation(v4);
            v10 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
            v11 = [GEOBusinessHours alloc];
            objc_msgSend(*(id *)(a1 + 32), "timezone");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = -[GEOBusinessHours initWithGEOPDBusinessHours:timeZone:](v11, "initWithGEOPDBusinessHours:timeZone:", v10, v12);

            if (-[GEOBusinessHours hoursType](v13, "hoursType"))
            {
              if (!v7)
                v7 = (void *)objc_opt_new();
              objc_msgSend(v7, "addObject:", v13);
            }

          }
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v6);
      }
      else
      {
        v7 = 0;
      }
      v14 = (void *)objc_msgSend(v7, "copy");
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[GEOBusinessHours prioritizeBusinessHours:compareDate:](GEOBusinessHours, "prioritizeBusinessHours:compareDate:", v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = (id)objc_msgSend(v16, "count");
      v18 = *(_QWORD *)(a1 + 32);
      if (v17)
        v17 = v16;
      v19 = *(void **)(v18 + 216);
      *(_QWORD *)(v18 + 216) = v17;

      v3 = *(void **)(*(_QWORD *)(a1 + 32) + 216);
    }
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
}

void __42___GEOPlaceDataItem_offlineDownloadRegion__block_invoke(uint64_t a1, id *a2, BOOL *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  -[GEOPDComponentValue offlineArea](a2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  *a3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) != 0;
}

void __40___GEOPlaceDataItem_supportsOfflineMaps__block_invoke(uint64_t a1, id *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  -[GEOPDComponentValue supportsOfflineMaps](a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __27___GEOPlaceDataItem__place__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v1 + 80))
  {
    +[GEOPlace placeForPlaceData:](GEOPlace, "placeForPlaceData:", *(_QWORD *)(v1 + 24));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 80);
    *(_QWORD *)(v4 + 80) = v3;

  }
}

void __45___GEOPlaceDataItem_transitStationIdentifier__block_invoke(uint64_t a1, id *a2, BOOL *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  -[GEOPDComponentValue transitAssociatedInfo](a2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  *a3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) != 0;
}

void __51___GEOPlaceDataItem_supportedTransitPaymentMethods__block_invoke(uint64_t a1, id *a2, BOOL *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  -[GEOPDComponentValue transitPaymentMethodInfo](a2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  *a3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) != 0;
}

GEOTransitPaymentMethod *__51___GEOPlaceDataItem_supportedTransitPaymentMethods__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  GEOTransitPaymentMethod *v3;

  v2 = a2;
  v3 = -[GEOTransitPaymentMethod initWithPaymentMethod:]([GEOTransitPaymentMethod alloc], "initWithPaymentMethod:", v2);

  return v3;
}

void __52___GEOPlaceDataItem_transitPaymentMethodSuggestions__block_invoke(uint64_t a1, id *a2, BOOL *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  -[GEOPDComponentValue transitPaymentMethodInfo](a2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  *a3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) != 0;
}

GEOTransitPaymentMethodSuggestion *__52___GEOPlaceDataItem_transitPaymentMethodSuggestions__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  GEOTransitPaymentMethodSuggestion *v3;

  v2 = a2;
  v3 = -[GEOTransitPaymentMethodSuggestion initWithSuggestionData:]([GEOTransitPaymentMethodSuggestion alloc], "initWithSuggestionData:", v2);

  return v3;
}

void __40___GEOPlaceDataItem_cachingRadiusMeters__block_invoke(uint64_t a1, id *a2, BOOL *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  -[GEOPDComponentValue transitPaymentMethodInfo](a2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  *a3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) != 0;
}

void __36___GEOPlaceDataItem__storefrontInfo__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  GEOStorefrontInfo *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v1 + 96))
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__53;
    v13 = __Block_byref_object_dispose__53;
    v14 = 0;
    v3 = *(void **)(v1 + 24);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __36___GEOPlaceDataItem__storefrontInfo__block_invoke_2;
    v8[3] = &unk_1E1C09718;
    v8[4] = &v9;
    objc_msgSend(v3, "enumerateValidComponentValuesOfType:usingBlock:", 55, v8);
    if (v10[5])
    {
      v4 = [GEOStorefrontInfo alloc];
      v5 = -[GEOStorefrontInfo initWithStorefront:](v4, "initWithStorefront:", v10[5]);
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(void **)(v6 + 96);
      *(_QWORD *)(v6 + 96) = v5;

    }
    _Block_object_dispose(&v9, 8);

  }
}

void __36___GEOPlaceDataItem__storefrontInfo__block_invoke_2(uint64_t a1, id *a2, BOOL *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  -[GEOPDComponentValue storefront](a2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  *a3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) != 0;
}

void __48___GEOPlaceDataItem__storefrontPresentationInfo__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  GEOStorefrontPresentationInfo *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v1 + 104))
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__53;
    v13 = __Block_byref_object_dispose__53;
    v14 = 0;
    v3 = *(void **)(v1 + 24);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __48___GEOPlaceDataItem__storefrontPresentationInfo__block_invoke_2;
    v8[3] = &unk_1E1C09718;
    v8[4] = &v9;
    objc_msgSend(v3, "enumerateValidComponentValuesOfType:usingBlock:", 59, v8);
    if (v10[5])
    {
      v4 = [GEOStorefrontPresentationInfo alloc];
      v5 = -[GEOStorefrontPresentationInfo initWithStorefrontPresentation:](v4, "initWithStorefrontPresentation:", v10[5]);
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(void **)(v6 + 104);
      *(_QWORD *)(v6 + 104) = v5;

    }
    _Block_object_dispose(&v9, 8);

  }
}

void __48___GEOPlaceDataItem__storefrontPresentationInfo__block_invoke_2(uint64_t a1, id *a2, BOOL *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  -[GEOPDComponentValue storefrontPresentation](a2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  *a3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) != 0;
}

void __42___GEOPlaceDataItem__alternateIdentifiers__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (v2)
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = v2;
    v5 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v4;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __42___GEOPlaceDataItem__alternateIdentifiers__block_invoke_2;
    v12[3] = &unk_1E1C09968;
    v11 = v6;
    v13 = v11;
    objc_msgSend(v7, "enumerateValidComponentValuesOfType:usingBlock:", 103, v12);
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
      objc_msgSend(v11, "removeObject:");
    v8 = objc_msgSend(v11, "copy");
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 16);
    *(_QWORD *)(v9 + 16) = v8;

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 16));
  }
}

void __42___GEOPlaceDataItem__alternateIdentifiers__block_invoke_2(uint64_t a1, id *a2)
{
  uint64_t v3;
  uint64_t v4;
  GEOMapItemIdentifier *v5;
  void *v6;
  GEOMapItemIdentifier *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  GEOMapItemIdentifier *v14;
  GEOMapItemIdentifier *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[GEOPDComponentValue forwardInfo](a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    -[GEOPDForwardInfo _readCurrentId](v3);
    if (*(_QWORD *)(v4 + 24))
    {
      v5 = [GEOMapItemIdentifier alloc];
      -[GEOPDForwardInfo currentId]((id *)v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[GEOMapItemIdentifier initWithMapsIdentifier:](v5, "initWithMapsIdentifier:", v6);

      if (v7)
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);

    }
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[GEOPDForwardInfo previousIds]((id *)v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12);
          v14 = [GEOMapItemIdentifier alloc];
          v15 = -[GEOMapItemIdentifier initWithMapsIdentifier:](v14, "initWithMapsIdentifier:", v13, (_QWORD)v16);
          if (v15)
            objc_msgSend(*(id *)(a1 + 32), "addObject:", v15);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

  }
}

void __32___GEOPlaceDataItem__childItems__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  GEOMapItemChildItem *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  uint64_t v15;
  GEOMapItemChildItem *v16;
  GEOMapItemChildItem *v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 160))
    return;
  +[GEOPDResultSnippet resultSnippetForPlaceData:](GEOPDResultSnippet, "resultSnippetForPlaceData:", *(_QWORD *)(v1 + 24));
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[GEOPDResultSnippet _readChildItems]((uint64_t)v3);
    if (objc_msgSend(v3[4], "count"))
    {
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      -[GEOPDResultSnippet childItems](v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v25 != v8)
              objc_enumerationMutation(v5);
            v10 = -[GEOMapItemChildItem initWithChildItem:]([GEOMapItemChildItem alloc], "initWithChildItem:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
            if (v10)
              objc_msgSend(v4, "addObject:", v10);

          }
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        }
        while (v7);
      }
LABEL_22:

      goto LABEL_23;
    }
    -[GEOPDResultSnippet _readChildPlaces]((uint64_t)v3);
    if (objc_msgSend(v3[5], "count"))
    {
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      -[GEOPDResultSnippet childPlaces](v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v21;
        do
        {
          for (j = 0; j != v12; ++j)
          {
            if (*(_QWORD *)v21 != v13)
              objc_enumerationMutation(v5);
            v15 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * j);
            v16 = [GEOMapItemChildItem alloc];
            v17 = -[GEOMapItemChildItem initWithChildPlace:](v16, "initWithChildPlace:", v15, (_QWORD)v20);
            objc_msgSend(v4, "addObject:", v17);

          }
          v12 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        }
        while (v12);
      }
      goto LABEL_22;
    }
  }
LABEL_23:
  v18 = objc_msgSend(v4, "count", (_QWORD)v20);
  if (v18)
    v19 = (void *)objc_msgSend(v4, "copy");
  else
    v19 = (void *)MEMORY[0x1E0C9AA60];
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 160), v19);
  if (v18)

}

void __41___GEOPlaceDataItem__openingHoursOptions__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[19])
  {
    objc_msgSend(v2, "_businessHours");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 152);
    *(_QWORD *)(v4 + 152) = v3;

  }
}

void __38___GEOPlaceDataItem__encyclopedicInfo__block_invoke(uint64_t a1)
{
  _GEOEncyclopedicInfo *v2;
  uint64_t v3;
  void *v4;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 88))
  {
    v2 = -[_GEOEncyclopedicInfo initWithPlaceData:attributionMap:]([_GEOEncyclopedicInfo alloc], "initWithPlaceData:attributionMap:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 88);
    *(_QWORD *)(v3 + 88) = v2;

  }
}

void __42___GEOPlaceDataItem__allPhotoAttributions__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[24];
  if (!v3)
  {
    objc_msgSend(v2, "_refreshPhotoAttributions");
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 192);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
}

void __41___GEOPlaceDataItem__placecardLayoutData__block_invoke(uint64_t a1)
{
  uint64_t v1;
  GEOPlacecardLayoutData *v3;
  uint64_t v4;
  uint64_t v5;
  GEOPDPlacecardLayoutData *v6;
  void *v7;
  GEOPlacecardLayoutData *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v1 + 176))
  {
    if (objc_msgSend(*(id *)(v1 + 24), "hasPlaceLayoutData"))
    {
      v3 = [GEOPlacecardLayoutData alloc];
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "placeLayoutData");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v4 = -[GEOPlacecardLayoutData initWithPlacecardLayoutData:](v3, "initWithPlacecardLayoutData:");
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(GEOPDPlacecardLayoutData **)(v5 + 176);
      *(_QWORD *)(v5 + 176) = v4;
    }
    else
    {
      +[GEOPDPlacecardLayoutConfiguration placecardLayoutConfigurationPlaceData:](GEOPDPlacecardLayoutConfiguration, "placecardLayoutConfigurationPlaceData:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
LABEL_7:

        return;
      }
      v11 = v7;
      v6 = objc_alloc_init(GEOPDPlacecardLayoutData);
      -[GEOPDPlacecardLayoutData setLayoutConfiguration:]((uint64_t)v6, v11);
      v8 = -[GEOPlacecardLayoutData initWithPlacecardLayoutData:]([GEOPlacecardLayoutData alloc], "initWithPlacecardLayoutData:", v6);
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(v9 + 176);
      *(_QWORD *)(v9 + 176) = v8;

    }
    v7 = v11;
    goto LABEL_7;
  }
}

void __31___GEOPlaceDataItem__venueInfo__block_invoke(uint64_t a1)
{
  uint64_t v1;
  GEOMapItemVenueInfo *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v1 + 112))
  {
    +[GEOPDVenueInfo venueInfoForPlaceData:](GEOPDVenueInfo, "venueInfoForPlaceData:", *(_QWORD *)(v1 + 24));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v3 = -[GEOMapItemVenueInfo initWithVenueInfo:]([GEOMapItemVenueInfo alloc], "initWithVenueInfo:", v6);
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(void **)(v4 + 112);
      *(_QWORD *)(v4 + 112) = v3;

    }
  }
}

void __38___GEOPlaceDataItem__browseCategories__block_invoke(uint64_t a1, id *a2, _BYTE *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  -[GEOPDComponentValue browseCategories](a2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  *a3 = 1;
}

void __38___GEOPlaceDataItem__browseCategories__block_invoke_2(uint64_t a1, id *a2, _BYTE *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  -[GEOPDComponentValue browseCategories](a2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  *a3 = 1;
}

void __42___GEOPlaceDataItem__miniBrowseCategories__block_invoke(uint64_t a1, id *a2, _BYTE *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  -[GEOPDComponentValue miniPlaceBrowseCategories](a2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  *a3 = 1;
}

void __40___GEOPlaceDataItem__walletPlaceStyling__block_invoke(uint64_t a1, id *a2, BOOL *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  -[GEOPDComponentValue styleAttributes](a2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  *a3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) != 0;
}

void __40___GEOPlaceDataItem__walletPlaceStyling__block_invoke_2(uint64_t a1, id *a2, BOOL *a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  -[GEOPDComponentValue entity](a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "styleAttributes");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  *a3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) != 0;
}

void __42___GEOPlaceDataItem__captionedPhotoAlbums__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id *v10;
  GEOCaptionedPhotoAlbum *v11;
  void *v12;
  GEOCaptionedPhotoAlbum *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v1 + 168))
  {
    objc_msgSend(*(id *)(v1 + 24), "componentOfType:options:", 84, 3);
    v3 = (id *)objc_claimAutoreleasedReturnValue();
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v17 = v3;
    -[GEOPDComponent values](v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v19;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(v5);
          v10 = *(id **)(*((_QWORD *)&v18 + 1) + 8 * v9);
          v11 = [GEOCaptionedPhotoAlbum alloc];
          -[GEOPDComponentValue categorizedPhotos](v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = -[GEOCaptionedPhotoAlbum initWithCaptionedPhotoCategory:attributionMap:](v11, "initWithCaptionedPhotoCategory:attributionMap:", v12, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));

          if (v13)
            objc_msgSend(v4, "addObject:", v13);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v7);
    }

    v14 = objc_msgSend(v4, "copy");
    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(void **)(v15 + 168);
    *(_QWORD *)(v15 + 168) = v14;

  }
}

@end
