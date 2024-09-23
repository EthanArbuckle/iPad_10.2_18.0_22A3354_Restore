@implementation GEOSortPriorityMapping

- (GEOSortPriorityMapping)init
{
  GEOSortPriorityMapping *result;

  result = (GEOSortPriorityMapping *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOSortPriorityMapping)initWithEntries:(id)a3
{
  id v4;
  GEOSortPriorityMapping *v5;
  uint64_t v6;
  NSArray *entries;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOSortPriorityMapping;
  v5 = -[GEOSortPriorityMapping init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    entries = v5->_entries;
    v5->_entries = (NSArray *)v6;

  }
  return v5;
}

- (GEOSortPriorityMapping)initWithAutocompleteResultSortPriorityMapping:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  GEOSortPriorityMappingEntry *v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  uint64_t v14;
  GEOSortPriorityMappingEntry *v15;
  uint64_t v16;
  GEOSortPriorityMapping *v17;
  GEOSortPriorityMapping *v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v19 = self;
  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v8);
        v10 = [GEOSortPriorityMappingEntry alloc];
        if (v9)
        {
          if ((*(_BYTE *)(v9 + 28) & 2) != 0)
            v11 = *(unsigned int *)(v9 + 20);
          else
            v11 = 0;
          v12 = *(int *)(v9 + 24);
          v13 = +[GEOSortPriorityMapping resultTypeForACResultType:](GEOSortPriorityMapping, "resultTypeForACResultType:", v11, v19);
          if ((*(_BYTE *)(v9 + 28) & 1) != 0)
            v14 = *(unsigned int *)(v9 + 16);
          else
            v14 = 0;
        }
        else
        {
          v13 = +[GEOSortPriorityMapping resultTypeForACResultType:](GEOSortPriorityMapping, "resultTypeForACResultType:", 0);
          v12 = 0;
          v14 = 0;
        }
        v15 = -[GEOSortPriorityMappingEntry initWithPriority:resultType:resultSubtype:](v10, "initWithPriority:resultType:resultSubtype:", v12, v13, +[GEOSortPriorityMapping resultSubtypeForACResultSubtype:](GEOSortPriorityMapping, "resultSubtypeForACResultSubtype:", v14, v19));
        objc_msgSend(v4, "addObject:", v15);

        ++v8;
      }
      while (v6 != v8);
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      v6 = v16;
    }
    while (v16);
  }

  v17 = -[GEOSortPriorityMapping initWithEntries:](v19, "initWithEntries:", v4);
  return v17;
}

+ (id)sortPriorityMappingFromDefaultsValue:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  GEOSortPriorityMappingEntry *v11;
  void *v12;
  void *v13;
  char isKindOfClass;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v23 = 0;
    goto LABEL_104;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v25 = v3;
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (!v5)
    goto LABEL_102;
  v6 = v5;
  v7 = *(_QWORD *)v29;
  do
  {
    v8 = 0;
    do
    {
      if (*(_QWORD *)v29 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v8);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = v9;
        if (objc_msgSend(v10, "count") == 3)
        {
          objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
          v11 = (GEOSortPriorityMappingEntry *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_98;
          objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            goto LABEL_98;
          }
          objc_msgSend(v10, "objectAtIndexedSubscript:", 2);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
            v15 = (id)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v15, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_TYPE_UNKNOWN")) & 1) != 0)
            {
              v16 = 0;
            }
            else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_TYPE_ANY")) & 1) != 0)
            {
              v16 = 1;
            }
            else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_TYPE_SERVER")) & 1) != 0)
            {
              v16 = 2;
            }
            else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_TYPE_CALENDAR")) & 1) != 0)
            {
              v16 = 3;
            }
            else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_TYPE_COLLECTION")) & 1) != 0)
            {
              v16 = 4;
            }
            else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_TYPE_CONTACTS")) & 1) != 0)
            {
              v16 = 5;
            }
            else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_TYPE_CORE_RECENTS")) & 1) != 0)
            {
              v16 = 6;
            }
            else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_TYPE_CORE_ROUTINE")) & 1) != 0)
            {
              v16 = 7;
            }
            else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_TYPE_HISTORY")) & 1) != 0)
            {
              v16 = 8;
            }
            else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_TYPE_SIRI_SUGGESTIONS")) & 1) != 0)
            {
              v16 = 9;
            }
            else if (objc_msgSend(v15, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_TYPE_SUGGESTIONS")))
            {
              v16 = 10;
            }
            else
            {
              v16 = 0;
            }

            v17 = objc_msgSend(a1, "resultTypeForACResultType:", v16);
            objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
            v18 = (id)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v18, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_SUBTYPE_UNKNOWN")) & 1) != 0)
            {
              v19 = 0;
            }
            else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_SUBTYPE_ANY")) & 1) != 0)
            {
              v19 = 1;
            }
            else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_SUBTYPE_COLLECTION_FAVORITES")) & 1) != 0)
            {
              v19 = 2;
            }
            else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_SUBTYPE_COLLECTION_MARKED_LOCATION")) & 1) != 0)
            {
              v19 = 3;
            }
            else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_SUBTYPE_CONTACTS_ME_CARD")) & 1) != 0)
            {
              v19 = 4;
            }
            else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_SUBTYPE_CORERECENTS_MAIL")) & 1) != 0)
            {
              v19 = 5;
            }
            else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_SUBTYPE_CORERECENTS_MESSAGES")) & 1) != 0)
            {
              v19 = 6;
            }
            else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_SUBTYPE_COREROUTINE_HOME")) & 1) != 0)
            {
              v19 = 7;
            }
            else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_SUBTYPE_COREROUTINE_PARKED_CAR")) & 1) != 0)
            {
              v19 = 8;
            }
            else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_SUBTYPE_COREROUTINE_WORK")) & 1) != 0)
            {
              v19 = 9;
            }
            else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_SUBTYPE_HISTORY_DIRECTIONS")) & 1) != 0)
            {
              v19 = 10;
            }
            else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_SUBTYPE_HISTORY_PLACE")) & 1) != 0)
            {
              v19 = 11;
            }
            else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_SUBTYPE_HISTORY_QUERY")) & 1) != 0)
            {
              v19 = 12;
            }
            else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_SUBTYPE_HISTORY_TRANSIT_LINE")) & 1) != 0)
            {
              v19 = 13;
            }
            else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_SUBTYPE_SUGGESTIONS_HOME")) & 1) != 0)
            {
              v19 = 14;
            }
            else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_SUBTYPE_SUGGESTIONS_WORK")) & 1) != 0)
            {
              v19 = 15;
            }
            else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_SUBTYPE_SUGGESTIONS_CALENDAR_EVENT")) & 1) != 0)
            {
              v19 = 16;
            }
            else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_SUBTYPE_SUGGESTIONS_FREQUENT_LOCATION")) & 1) != 0)
            {
              v19 = 17;
            }
            else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_SUBTYPE_SUGGESTIONS_RECENT_HISTORY")) & 1) != 0)
            {
              v19 = 18;
            }
            else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_SUBTYPE_SUGGESTIONS_FAVORITE_PLACE")) & 1) != 0)
            {
              v19 = 19;
            }
            else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_SUBTYPE_SUGGESTIONS_PARKED_CAR")) & 1) != 0)
            {
              v19 = 20;
            }
            else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_SUBTYPE_SUGGESTIONS_RESTAURANT_RESERVATION")) & 1) != 0)
            {
              v19 = 21;
            }
            else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_SUBTYPE_SUGGESTIONS_RIDESHARING")) & 1) != 0)
            {
              v19 = 22;
            }
            else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_SUBTYPE_SUGGESTIONS_CARPLAY_LOW_ENERGY")) & 1) != 0)
            {
              v19 = 23;
            }
            else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_SUBTYPE_SUGGESTIONS_RESUME_ROUTE")) & 1) != 0)
            {
              v19 = 24;
            }
            else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_SUBTYPE_SUGGESTIONS_APP_CONNECTION")) & 1) != 0)
            {
              v19 = 25;
            }
            else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_SUBTYPE_SUGGESTIONS_HOTEL")) & 1) != 0)
            {
              v19 = 26;
            }
            else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_SUBTYPE_SUGGESTIONS_CAR_RENTAL")) & 1) != 0)
            {
              v19 = 27;
            }
            else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_SUBTYPE_SUGGESTIONS_TRAVEL_FLIGHT")) & 1) != 0)
            {
              v19 = 28;
            }
            else if (objc_msgSend(v18, "isEqualToString:", CFSTR("AUTOCOMPLETE_RESULT_SUBTYPE_SUGGESTIONS_TICKETED_EVENT")))
            {
              v19 = 29;
            }
            else
            {
              v19 = 0;
            }

            v20 = objc_msgSend(a1, "resultSubtypeForACResultSubtype:", v19);
            objc_msgSend(v10, "objectAtIndexedSubscript:", 2);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "integerValue");

            v11 = -[GEOSortPriorityMappingEntry initWithPriority:resultType:resultSubtype:]([GEOSortPriorityMappingEntry alloc], "initWithPriority:resultType:resultSubtype:", v22, v17, v20);
            objc_msgSend(v26, "addObject:", v11);
LABEL_98:

          }
        }

      }
      ++v8;
    }
    while (v6 != v8);
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  }
  while (v6);
LABEL_102:

  v23 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithEntries:", v26);
  v3 = v25;
LABEL_104:

  return v23;
}

+ (int64_t)resultTypeForACResultType:(int)a3
{
  if (a3 >= 0xB)
    return 1;
  else
    return a3;
}

+ (int64_t)resultSubtypeForACResultSubtype:(int)a3
{
  if (a3 >= 0x1E)
    return 1;
  else
    return a3;
}

- (NSArray)entries
{
  return self->_entries;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entries, 0);
}

@end
