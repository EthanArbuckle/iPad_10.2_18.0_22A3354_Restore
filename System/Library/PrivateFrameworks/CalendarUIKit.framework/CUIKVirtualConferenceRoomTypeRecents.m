@implementation CUIKVirtualConferenceRoomTypeRecents

+ (id)roomTypesOrderedByMRU:(id)a3 forSource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v23[4];
  id v24;
  id v25;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "sourceIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(a1, "_updateSavedMRUDictWithRoomTypes:source:", v6, v7);
    objc_msgSend(MEMORY[0x1E0CAA0F0], "shared");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "conferenceRoomTypeIdentifiersByMRU");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "sourceIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __72__CUIKVirtualConferenceRoomTypeRecents_roomTypesOrderedByMRU_forSource___block_invoke;
    v23[3] = &unk_1E6EB7678;
    v24 = v12;
    v25 = a1;
    v13 = v12;
    objc_msgSend(v6, "sortedArrayUsingComparator:", v23);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      +[CUIKVirtualConferenceRoomTypeRecents roomTypesOrderedByMRU:forSource:].cold.1((uint64_t)v7, v15, v16, v17, v18, v19, v20, v21);

    v14 = 0;
  }

  return v14;
}

uint64_t __72__CUIKVirtualConferenceRoomTypeRecents_roomTypesOrderedByMRU_forSource___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;

  v5 = *(void **)(a1 + 40);
  v6 = a3;
  objc_msgSend(v5, "_identifierFromRoomType:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_identifierFromRoomType:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", v7);
  v10 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", v8);
  if (v9 < v10)
    v11 = -1;
  else
    v11 = v9 > v10;

  return v11;
}

+ (void)selectRoomType:(id)a3 forSource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "sourceIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v23[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_updateSavedMRUDictWithRoomTypes:source:", v9, v7);

    objc_msgSend(a1, "_identifierFromRoomType:", v6);
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CAA0F0], "shared");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "conferenceRoomTypeIdentifiersByMRU");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "objectForKey:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "mutableCopy");
    objc_msgSend(v14, "removeObject:", v10);
    objc_msgSend(v14, "insertObject:atIndex:", v10, 0);
    v15 = (void *)objc_msgSend(v12, "mutableCopy");
    objc_msgSend(v15, "setObject:forKey:", v14, v8);
    objc_msgSend(MEMORY[0x1E0CAA0F0], "shared");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setConferenceRoomTypeIdentifiersByMRU:", v15);

  }
  else
  {
    +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[CUIKVirtualConferenceRoomTypeRecents selectRoomType:forSource:].cold.1((uint64_t)v7, v10, v17, v18, v19, v20, v21, v22);
  }

}

+ (void)_updateSavedMRUDictWithRoomTypes:(id)a3 source:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "sourceIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v30 = v7;
    objc_msgSend(MEMORY[0x1E0CAA0F0], "shared");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "conferenceRoomTypeIdentifiersByMRU");
    v10 = objc_claimAutoreleasedReturnValue();

    v29 = v10;
    v11 = -[NSObject mutableCopy](v10, "mutableCopy");
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "objectForKey:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");

    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "setObject:forKey:", v13, v8);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v31 = v6;
    v15 = v6;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v33 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(a1, "_identifierFromRoomType:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v13, "containsObject:", v20) & 1) == 0)
            objc_msgSend(v14, "addObject:", v20);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v17);
    }

    objc_msgSend(v13, "addObjectsFromArray:", v14);
    objc_msgSend(MEMORY[0x1E0CAA0F0], "shared");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setConferenceRoomTypeIdentifiersByMRU:", v11);

    v7 = v30;
    v6 = v31;
    v22 = v29;
  }
  else
  {
    +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      +[CUIKVirtualConferenceRoomTypeRecents _updateSavedMRUDictWithRoomTypes:source:].cold.1((uint64_t)v7, v22, v23, v24, v25, v26, v27, v28);
  }

}

+ (void)cleanup
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  id obj;
  uint64_t v43;
  uint64_t v44;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  id v50;
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
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CAA0F0], "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "conferenceRoomTypeIdentifiersByMRU");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  v5 = objc_alloc_init(MEMORY[0x1E0CAA078]);
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v60 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * i);
        objc_msgSend(v5, "sourceWithIdentifier:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12)
          objc_msgSend(v4, "removeObjectForKey:", v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
    }
    while (v8);
  }
  v38 = v5;

  v13 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  obj = v13;
  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
  if (v41)
  {
    v39 = *(_QWORD *)v56;
    v40 = v4;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v56 != v39)
          objc_enumerationMutation(obj);
        v44 = v15;
        v16 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * v15);
        objc_msgSend(obj, "objectForKeyedSubscript:", v16, v38);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)objc_msgSend(v17, "mutableCopy");

        v53 = 0u;
        v54 = 0u;
        v51 = 0u;
        v52 = 0u;
        v43 = v16;
        objc_msgSend(obj, "objectForKeyedSubscript:", v16);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v52;
          do
          {
            for (j = 0; j != v21; ++j)
            {
              if (*(_QWORD *)v52 != v22)
                objc_enumerationMutation(v19);
              v24 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * j);
              objc_msgSend(a1, "_extensionBundleIdentifierFromIdentifier:", v24);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v14, "containsObject:", v25))
              {
                objc_msgSend(v18, "removeObject:", v24);
              }
              else
              {
                v26 = objc_alloc(MEMORY[0x1E0CA5848]);
                v50 = 0;
                v27 = (void *)objc_msgSend(v26, "initWithBundleIdentifier:error:", v25, &v50);
                v28 = v50;
                if (!v27)
                {
                  objc_msgSend(v14, "addObject:", v25);
                  objc_msgSend(v18, "removeObject:", v24);
                }

              }
            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
          }
          while (v21);
        }

        v4 = v40;
        objc_msgSend(v40, "setObject:forKeyedSubscript:", v18, v43);

        v15 = v44 + 1;
      }
      while (v44 + 1 != v41);
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
    }
    while (v41);
  }

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v29 = obj;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v46, v63, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v47;
    do
    {
      for (k = 0; k != v31; ++k)
      {
        if (*(_QWORD *)v47 != v32)
          objc_enumerationMutation(v29);
        v34 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * k);
        objc_msgSend(v4, "objectForKeyedSubscript:", v34, v38);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = (void *)objc_msgSend(v35, "mutableCopy");

        if ((unint64_t)objc_msgSend(v36, "count") >= 0xB)
        {
          do
            objc_msgSend(v36, "removeLastObject");
          while ((unint64_t)objc_msgSend(v36, "count") > 0xA);
        }
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v36, v34);

      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v46, v63, 16);
    }
    while (v31);
  }

  objc_msgSend(MEMORY[0x1E0CAA0F0], "shared");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setConferenceRoomTypeIdentifiersByMRU:", v4);

}

+ (id)_identifierFromRoomType:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  objc_msgSend(v4, "extensionBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@%@%@"), v5, CFSTR("/"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_extensionBundleIdentifierFromIdentifier:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  v4 = objc_msgSend(v3, "rangeOfString:", CFSTR("/"));
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "substringWithRange:", 0, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

+ (void)roomTypesOrderedByMRU:(uint64_t)a3 forSource:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B8A6A000, a2, a3, "roomTypesOrderedByMRU: unexpected nil identifier for source: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

+ (void)selectRoomType:(uint64_t)a3 forSource:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B8A6A000, a2, a3, "selectRoomType: unexpected nil identifier for source: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

+ (void)_updateSavedMRUDictWithRoomTypes:(uint64_t)a3 source:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B8A6A000, a2, a3, "_updateSavedMRUDictWithRoomTypes: unexpected nil identifier for source: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
