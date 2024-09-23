@implementation GEOModuleLayoutEntry

+ (id)moduleLayoutEntryFromArray:(id)a3
{
  id v3;
  GEOPDModuleLayoutEntry *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  GEOPDModule *v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  char isKindOfClass;
  id v16;
  uint64_t v17;
  void *v18;
  char v19;
  GEOPDModuleOptions *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  GEOModuleLayoutEntry *v24;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(GEOPDModuleLayoutEntry);
  -[GEOPDModuleLayoutEntry setDebugLayoutId:](v4, "setDebugLayoutId:", CFSTR("customLayout"));
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v28;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v28 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v8);
        v10 = objc_alloc_init(GEOPDModule);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = v9;
          if ((objc_msgSend(v11, "isEqualToString:", CFSTR("MODULE_TYPE_UNKNOWN")) & 1) != 0)
          {
            v12 = 0;
          }
          else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("MODULE_TYPE_TITLE")) & 1) != 0)
          {
            v12 = 1;
          }
          else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("MODULE_TYPE_BUTTONS")) & 1) != 0)
          {
            v12 = 2;
          }
          else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("MODULE_TYPE_INLINE_MAP")) & 1) != 0)
          {
            v12 = 3;
          }
          else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("MODULE_TYPE_PHOTOS")) & 1) != 0)
          {
            v12 = 4;
          }
          else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("MODULE_TYPE_INFOS")) & 1) != 0)
          {
            v12 = 5;
          }
          else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("MODULE_TYPE_TRANSIT_DEPARTURE")) & 1) != 0)
          {
            v12 = 6;
          }
          else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("MODULE_TYPE_TRANSIT_ATTRIBUTION")) & 1) != 0)
          {
            v12 = 7;
          }
          else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("MODULE_TYPE_ENCYCLOPEDIC")) & 1) != 0)
          {
            v12 = 8;
          }
          else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("MODULE_TYPE_HOURS")) & 1) != 0)
          {
            v12 = 9;
          }
          else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("MODULE_TYPE_BUSINESS_INFOS")) & 1) != 0)
          {
            v12 = 10;
          }
          else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("MODULE_TYPE_REVIEWS")) & 1) != 0)
          {
            v12 = 11;
          }
          else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("MODULE_TYPE_ACTIONS_ROW")) & 1) != 0)
          {
            v12 = 12;
          }
          else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("MODULE_TYPE_RESERVATIONS")) & 1) != 0)
          {
            v12 = 14;
          }
          else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("MODULE_TYPE_OFFICIAL_APPS")) & 1) != 0)
          {
            v12 = 15;
          }
          else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("MODULE_TYPE_VENUE_BROWSE")) & 1) != 0)
          {
            v12 = 16;
          }
          else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("MODULE_TYPE_VENUE_INFO")) & 1) != 0)
          {
            v12 = 17;
          }
          else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("MODULE_TYPE_INFO_PARENT")) & 1) != 0)
          {
            v12 = 18;
          }
          else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("MODULE_TYPE_ANNOTATED_LIST")) & 1) != 0)
          {
            v12 = 19;
          }
          else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("MODULE_TYPE_ANNOTATED_PICTURE")) & 1) != 0)
          {
            v12 = 20;
          }
          else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("MODULE_TYPE_MESSAGE")) & 1) != 0)
          {
            v12 = 21;
          }
          else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("MODULE_TYPE_MESSAGE_HOURS")) & 1) != 0)
          {
            v12 = 22;
          }
          else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("MODULE_TYPE_ACTION_FOOTER")) & 1) != 0)
          {
            v12 = 23;
          }
          else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("MODULE_TYPE_ATTRIBUTION")) & 1) != 0)
          {
            v12 = 24;
          }
          else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("MODULE_TYPE_WEB_CONTENT")) & 1) != 0)
          {
            v12 = 25;
          }
          else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("MODULE_TYPE_RELATED_PLACE_LIST")) & 1) != 0)
          {
            v12 = 26;
          }
          else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("MODULE_TYPE_SERVICE_HOURS")) & 1) != 0)
          {
            v12 = 27;
          }
          else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("MODULE_TYPE_QUICK_LINKS")) & 1) != 0)
          {
            v12 = 28;
          }
          else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("MODULE_TYPE_COLLECTIONS")) & 1) != 0)
          {
            v12 = 29;
          }
          else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("MODULE_TYPE_PLACE_BROWSE_CATEGORIES")) & 1) != 0)
          {
            v12 = 30;
          }
          else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("MODULE_TYPE_MINI_PLACE_BROWSE_CATEGORIES")) & 1) != 0)
          {
            v12 = 31;
          }
          else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("MODULE_TYPE_CURATED_COLLECTIONS")) & 1) != 0)
          {
            v12 = 32;
          }
          else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("MODULE_TYPE_PLACE_QUESTIONNAIRE")) & 1) != 0)
          {
            v12 = 33;
          }
          else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("MODULE_TYPE_APPLE_RATINGS")) & 1) != 0)
          {
            v12 = 34;
          }
          else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("MODULE_TYPE_PLACE_RIBBON")) & 1) != 0)
          {
            v12 = 35;
          }
          else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("MODULE_TYPE_REVIEW_AND_RATING")) & 1) != 0)
          {
            v12 = 36;
          }
          else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("MODULE_TYPE_ABOUT")) & 1) != 0)
          {
            v12 = 37;
          }
          else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("MODULE_TYPE_TEMPLATE_PLACE")) & 1) != 0)
          {
            v12 = 38;
          }
          else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("MODULE_TYPE_TRANSIT_LABELS")) & 1) != 0)
          {
            v12 = 39;
          }
          else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("MODULE_TYPE_PLACECARD_ENRICHMENT")) & 1) != 0)
          {
            v12 = 40;
          }
          else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("MODULE_TYPE_UNIFIED_ACTION_ROW")) & 1) != 0)
          {
            v12 = 41;
          }
          else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("MODULE_TYPE_QUESTIONNAIRE_SUGGESTION")) & 1) != 0)
          {
            v12 = 42;
          }
          else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("MODULE_TYPE_EV_CHARGER")) & 1) != 0)
          {
            v12 = 43;
          }
          else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("MODULE_TYPE_HIKING_ASSOCIATION")) & 1) != 0)
          {
            v12 = 44;
          }
          else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("MODULE_TYPE_NOTE")) & 1) != 0)
          {
            v12 = 45;
          }
          else if (objc_msgSend(v11, "isEqualToString:", CFSTR("MODULE_TYPE_HIKE_SUGGESTION")))
          {
            v12 = 46;
          }
          else
          {
            v12 = 0;
          }

          -[GEOPDModule setType:](v10, "setType:", v12);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_192;
          v13 = v9;
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("type"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("type"));
            v16 = (id)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v16, "isEqualToString:", CFSTR("MODULE_TYPE_UNKNOWN")) & 1) != 0)
            {
              v17 = 0;
            }
            else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("MODULE_TYPE_TITLE")) & 1) != 0)
            {
              v17 = 1;
            }
            else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("MODULE_TYPE_BUTTONS")) & 1) != 0)
            {
              v17 = 2;
            }
            else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("MODULE_TYPE_INLINE_MAP")) & 1) != 0)
            {
              v17 = 3;
            }
            else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("MODULE_TYPE_PHOTOS")) & 1) != 0)
            {
              v17 = 4;
            }
            else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("MODULE_TYPE_INFOS")) & 1) != 0)
            {
              v17 = 5;
            }
            else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("MODULE_TYPE_TRANSIT_DEPARTURE")) & 1) != 0)
            {
              v17 = 6;
            }
            else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("MODULE_TYPE_TRANSIT_ATTRIBUTION")) & 1) != 0)
            {
              v17 = 7;
            }
            else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("MODULE_TYPE_ENCYCLOPEDIC")) & 1) != 0)
            {
              v17 = 8;
            }
            else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("MODULE_TYPE_HOURS")) & 1) != 0)
            {
              v17 = 9;
            }
            else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("MODULE_TYPE_BUSINESS_INFOS")) & 1) != 0)
            {
              v17 = 10;
            }
            else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("MODULE_TYPE_REVIEWS")) & 1) != 0)
            {
              v17 = 11;
            }
            else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("MODULE_TYPE_ACTIONS_ROW")) & 1) != 0)
            {
              v17 = 12;
            }
            else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("MODULE_TYPE_RESERVATIONS")) & 1) != 0)
            {
              v17 = 14;
            }
            else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("MODULE_TYPE_OFFICIAL_APPS")) & 1) != 0)
            {
              v17 = 15;
            }
            else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("MODULE_TYPE_VENUE_BROWSE")) & 1) != 0)
            {
              v17 = 16;
            }
            else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("MODULE_TYPE_VENUE_INFO")) & 1) != 0)
            {
              v17 = 17;
            }
            else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("MODULE_TYPE_INFO_PARENT")) & 1) != 0)
            {
              v17 = 18;
            }
            else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("MODULE_TYPE_ANNOTATED_LIST")) & 1) != 0)
            {
              v17 = 19;
            }
            else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("MODULE_TYPE_ANNOTATED_PICTURE")) & 1) != 0)
            {
              v17 = 20;
            }
            else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("MODULE_TYPE_MESSAGE")) & 1) != 0)
            {
              v17 = 21;
            }
            else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("MODULE_TYPE_MESSAGE_HOURS")) & 1) != 0)
            {
              v17 = 22;
            }
            else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("MODULE_TYPE_ACTION_FOOTER")) & 1) != 0)
            {
              v17 = 23;
            }
            else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("MODULE_TYPE_ATTRIBUTION")) & 1) != 0)
            {
              v17 = 24;
            }
            else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("MODULE_TYPE_WEB_CONTENT")) & 1) != 0)
            {
              v17 = 25;
            }
            else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("MODULE_TYPE_RELATED_PLACE_LIST")) & 1) != 0)
            {
              v17 = 26;
            }
            else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("MODULE_TYPE_SERVICE_HOURS")) & 1) != 0)
            {
              v17 = 27;
            }
            else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("MODULE_TYPE_QUICK_LINKS")) & 1) != 0)
            {
              v17 = 28;
            }
            else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("MODULE_TYPE_COLLECTIONS")) & 1) != 0)
            {
              v17 = 29;
            }
            else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("MODULE_TYPE_PLACE_BROWSE_CATEGORIES")) & 1) != 0)
            {
              v17 = 30;
            }
            else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("MODULE_TYPE_MINI_PLACE_BROWSE_CATEGORIES")) & 1) != 0)
            {
              v17 = 31;
            }
            else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("MODULE_TYPE_CURATED_COLLECTIONS")) & 1) != 0)
            {
              v17 = 32;
            }
            else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("MODULE_TYPE_PLACE_QUESTIONNAIRE")) & 1) != 0)
            {
              v17 = 33;
            }
            else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("MODULE_TYPE_APPLE_RATINGS")) & 1) != 0)
            {
              v17 = 34;
            }
            else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("MODULE_TYPE_PLACE_RIBBON")) & 1) != 0)
            {
              v17 = 35;
            }
            else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("MODULE_TYPE_REVIEW_AND_RATING")) & 1) != 0)
            {
              v17 = 36;
            }
            else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("MODULE_TYPE_ABOUT")) & 1) != 0)
            {
              v17 = 37;
            }
            else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("MODULE_TYPE_TEMPLATE_PLACE")) & 1) != 0)
            {
              v17 = 38;
            }
            else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("MODULE_TYPE_TRANSIT_LABELS")) & 1) != 0)
            {
              v17 = 39;
            }
            else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("MODULE_TYPE_PLACECARD_ENRICHMENT")) & 1) != 0)
            {
              v17 = 40;
            }
            else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("MODULE_TYPE_UNIFIED_ACTION_ROW")) & 1) != 0)
            {
              v17 = 41;
            }
            else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("MODULE_TYPE_QUESTIONNAIRE_SUGGESTION")) & 1) != 0)
            {
              v17 = 42;
            }
            else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("MODULE_TYPE_EV_CHARGER")) & 1) != 0)
            {
              v17 = 43;
            }
            else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("MODULE_TYPE_HIKING_ASSOCIATION")) & 1) != 0)
            {
              v17 = 44;
            }
            else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("MODULE_TYPE_NOTE")) & 1) != 0)
            {
              v17 = 45;
            }
            else if (objc_msgSend(v16, "isEqualToString:", CFSTR("MODULE_TYPE_HIKE_SUGGESTION")))
            {
              v17 = 46;
            }
            else
            {
              v17 = 0;
            }

            -[GEOPDModule setType:](v10, "setType:", v17);
          }
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("web_content_url"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v19 = objc_opt_isKindOfClass();

          if ((v19 & 1) != 0)
          {
            v20 = objc_alloc_init(GEOPDModuleOptions);
            -[GEOPDModule setOptions:](v10, "setOptions:", v20);

            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("web_content_url"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[GEOPDModule options](v10, "options");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "setWebContentUrl:", v21);

          }
        }

LABEL_192:
        if (-[GEOPDModule type](v10, "type"))
          -[GEOPDModuleLayoutEntry addModules:](v4, "addModules:", v10);

        ++v8;
      }
      while (v6 != v8);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      v6 = v23;
    }
    while (v23);
  }

  v24 = -[GEOModuleLayoutEntry initWithModuleLayoutEntry:moduleConfigProvider:]([GEOModuleLayoutEntry alloc], "initWithModuleLayoutEntry:moduleConfigProvider:", v4, 0);
  return v24;
}

- (GEOModuleLayoutEntry)initWithModuleLayoutEntry:(id)a3 moduleConfigProvider:(id)a4
{
  id v7;
  id v8;
  GEOModuleLayoutEntry *v9;
  GEOModuleLayoutEntry *v10;
  GEOModuleLayoutEntry *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)GEOModuleLayoutEntry;
  v9 = -[GEOModuleLayoutEntry init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_moduleLayoutEntry, a3);
    objc_storeStrong((id *)&v10->_moduleConfigProvider, a4);
    v11 = v10;
  }

  return v10;
}

- (NSString)debugName
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;

  -[GEOPDModuleLayoutEntry debugLayoutId](self->_moduleLayoutEntry, "debugLayoutId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[GEOPDModuleLayoutEntry debugLayoutId](self->_moduleLayoutEntry, "debugLayoutId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = -[GEOPDModuleLayoutEntry platformType](self->_moduleLayoutEntry, "platformType");
    if (v6 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E1C09D20[(int)v6];
    }
    -[GEOPDModuleLayoutEntry applicationIds](self->_moduleLayoutEntry, "applicationIds");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = CFSTR("no app Id");
    if (v8)
      v10 = (const __CFString *)v8;
    objc_msgSend(v5, "stringWithFormat:", CFSTR("Layout %@ - %@"), v7, v10);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v4;
}

- (NSArray)modules
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  GEOModule *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[GEOPDModuleLayoutEntry modules](self->_moduleLayoutEntry, "modules");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[GEOPDModuleLayoutEntry modules](self->_moduleLayoutEntry, "modules", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = -[GEOModule initWithModule:moduleConfigProvider:]([GEOModule alloc], "initWithModule:moduleConfigProvider:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), self->_moduleConfigProvider);
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  -[GEOModuleLayoutEntry _performPostCheckForModules:](self, "_performPostCheckForModules:", v5);
  v12 = (void *)objc_msgSend(v5, "copy");

  return (NSArray *)v12;
}

- (void)_performPostCheckForModules:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v27 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        if (objc_msgSend(v8, "type", (_QWORD)v26) == 39)
        {
          v9 = v8;

          if (v9)
          {
            v10 = v3;
            v26 = 0u;
            v27 = 0u;
            v28 = 0u;
            v29 = 0u;
            v11 = v10;
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
            if (v12)
            {
              v13 = v12;
              v14 = *(_QWORD *)v27;
              while (2)
              {
                for (j = 0; j != v13; ++j)
                {
                  if (*(_QWORD *)v27 != v14)
                    objc_enumerationMutation(v11);
                  v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
                  if (objc_msgSend(v16, "type") == 2)
                  {
                    v17 = v16;

                    if (v17)
                      objc_msgSend(v11, "removeObject:", v17);
                    goto LABEL_22;
                  }
                }
                v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
                if (v13)
                  continue;
                break;
              }
            }

            v17 = 0;
LABEL_22:
            v18 = v11;
            v26 = 0u;
            v27 = 0u;
            v28 = 0u;
            v29 = 0u;
            v19 = v18;
            v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
            if (v20)
            {
              v21 = v20;
              v22 = *(_QWORD *)v27;
              while (2)
              {
                for (k = 0; k != v21; ++k)
                {
                  if (*(_QWORD *)v27 != v22)
                    objc_enumerationMutation(v19);
                  v24 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * k);
                  if (objc_msgSend(v24, "type") == 12)
                  {
                    v25 = v24;

                    if (v25)
                    {
                      objc_msgSend(v19, "removeObject:", v25);

                    }
                    goto LABEL_33;
                  }
                }
                v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
                if (v21)
                  continue;
                break;
              }
            }

LABEL_33:
          }
          goto LABEL_34;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v5)
        continue;
      break;
    }
  }

LABEL_34:
}

- (id)description
{
  void *v2;
  void *v3;

  -[GEOModuleLayoutEntry modules](self, "modules");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moduleConfigProvider, 0);
  objc_storeStrong((id *)&self->_moduleLayoutEntry, 0);
}

@end
