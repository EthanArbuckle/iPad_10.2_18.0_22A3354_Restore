@implementation NSMutableAttributedString(UserAttributedQueryString)

- (void)tagRangeWithFilter:()UserAttributedQueryString withCSAttributedEntityKey:
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;

  v8 = a5;
  objc_msgSend(a1, "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "substringWithRange:", a3, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@=\"%@\"cd"), v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "addAttribute:value:range:", v8, v11, a3, a4);

  }
  else
  {
    logForCSLogCategoryDefault();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[NSMutableAttributedString(UserAttributedQueryString) tagRangeWithFilter:withCSAttributedEntityKey:].cold.1();

  }
}

- (uint64_t)tagRangeWithFilter:()UserAttributedQueryString withCSAttributedEntityKey:stringValues:
{
  return objc_msgSend(a1, "tagRangeWithFilter:withCSAttributedEntityKey:stringValues:filterOperator:", a3, a4, a5, a6, 0);
}

- (uint64_t)tagRangeWithFilter:()UserAttributedQueryString withCSAttributedEntityKey:numberValues:
{
  return objc_msgSend(a1, "tagRangeWithFilter:withCSAttributedEntityKey:numberValues:filterOperator:", a3, a4, a5, a6, 0);
}

- (uint64_t)tagRangeWithFilter:()UserAttributedQueryString withCSAttributedEntityKey:dateISOValues:
{
  return objc_msgSend(a1, "tagRangeWithFilter:withCSAttributedEntityKey:dateISOValues:filterOperator:", a3, a4, a5, a6, 0);
}

- (void)tagRangeWithFilter:()UserAttributedQueryString withCSAttributedEntityKey:startDate:endDate:
{
  objc_class *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[2];
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v12 = (objc_class *)MEMORY[0x1E0CB36A8];
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = objc_alloc_init(v12);
  objc_msgSend(v16, "stringFromDate:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "stringFromDate:", v13, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v21[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "tagRangeWithFilter:withCSAttributedEntityKey:dateISOValues:", a3, a4, v15, v20);

}

- (void)tagRangeWithFilter:()UserAttributedQueryString withCSAttributedEntityKey:startDates:endDates:filterOperator:
{
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  unsigned int v30;
  id v31;
  void *v32;
  _QWORD v33[3];

  v33[2] = *MEMORY[0x1E0C80C00];
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = objc_msgSend(v15, "count");
  if (v17 == objc_msgSend(v16, "count"))
  {
    v27 = a1;
    v28 = a3;
    v29 = a4;
    v30 = a8;
    v31 = v14;
    v18 = objc_msgSend(v15, "count");
    v19 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
    v32 = (void *)objc_opt_new();
    if (v18)
    {
      for (i = 0; i != v18; ++i)
      {
        objc_msgSend(v15, "objectAtIndexedSubscript:", i);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject stringFromDate:](v19, "stringFromDate:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v33[0] = v22;
        objc_msgSend(v16, "objectAtIndexedSubscript:", i);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject stringFromDate:](v19, "stringFromDate:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v33[1] = v24;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
        v25 = v15;
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "addObject:", v26);

        v15 = v25;
      }
    }
    v14 = v31;
    objc_msgSend(v27, "tagRangeWithFilter:withCSAttributedEntityKey:dateISOValues:filterOperator:", v28, v29, v31, v32, v30);

  }
  else
  {
    logForCSLogCategoryDefault();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[NSMutableAttributedString(UserAttributedQueryString) tagRangeWithFilter:withCSAttributedEntityKey:startDates:endDates:filterOperator:].cold.1();
  }

}

- (void)tagRangeWithFilter:()UserAttributedQueryString withCSAttributedEntityKey:stringValues:filterOperator:
{
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v12 = a5;
  v13 = a6;
  if (objc_msgSend(v13, "count"))
  {
    v21 = a3;
    v22 = a4;
    v23 = a7;
    v14 = objc_opt_new();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v15 = v13;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v25 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@=\"%@\"cd"), v12, *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject addObject:](v14, "addObject:", v20);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v17);
    }

    objc_msgSend(a1, "_tagRangeWithFilters:key:filters:filterOp:", v21, v22, v12, v14, v23);
  }
  else
  {
    logForCSLogCategoryDefault();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[NSMutableAttributedString(UserAttributedQueryString) tagRangeWithFilter:withCSAttributedEntityKey:stringValues:filterOperator:].cold.1();
  }

}

- (void)tagRangeWithFilter:()UserAttributedQueryString withCSAttributedEntityKey:numberValues:filterOperator:
{
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v12 = a5;
  v13 = a6;
  if (objc_msgSend(v13, "count"))
  {
    v21 = a3;
    v22 = a4;
    v23 = a7;
    v14 = objc_opt_new();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v15 = v13;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v25 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@=%@"), v12, *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject addObject:](v14, "addObject:", v20);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v17);
    }

    objc_msgSend(a1, "_tagRangeWithFilters:key:filters:filterOp:", v21, v22, v12, v14, v23);
  }
  else
  {
    logForCSLogCategoryDefault();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[NSMutableAttributedString(UserAttributedQueryString) tagRangeWithFilter:withCSAttributedEntityKey:numberValues:filterOperator:].cold.1();
  }

}

- (id)_expandedDateFilter:()UserAttributedQueryString
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(" "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "count");
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = v5 - 1;
    do
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "length"))
      {
        if (v8 == v7)
          v10 = CFSTR("(kMDItemPhotosSeasons=\"%@\"cd || kMDItemPhotosHolidays=\"%@*\"cdw || kMDItemPhotosContentCreationDateMonth=\"%@\"cd || kMDItemPhotosContentCreationDateMonths=\"%@\"cd || kMDItemPhotosContentCreationDateYear=\"%@\"cd || kMDItemPhotosContentCreationDateYears=\"%@\"cd || _kMDItemContentCreationDateDay=\"%@\"cd)");
        else
          v10 = CFSTR("(kMDItemPhotosSeasons=\"%@\"cd || kMDItemPhotosHolidays=\"%@\"cdw || kMDItemPhotosContentCreationDateMonth=\"%@\"cd || kMDItemPhotosContentCreationDateMonths=\"%@\"cd || kMDItemPhotosContentCreationDateYear=\"%@\"cd || kMDItemPhotosContentCreationDateYears=\"%@\"cd || _kMDItemContentCreationDateDay=\"%@\"cd)");
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v10, v9, v9, v9, v9, v9, v9, v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v11);

      }
      ++v7;
    }
    while (v6 != v7);
  }
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(" && "));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)tagRangeWithFilter:()UserAttributedQueryString withCSAttributedEntityKey:dateISOValues:filterOperator:
{
  __CFString *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  const __CFString *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[16];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v12 = a5;
  v13 = a6;
  if (objc_msgSend(v13, "count"))
  {
    v14 = objc_opt_new();
    v33 = a7;
    v31 = a3;
    v32 = a4;
    v30 = a1;
    if (-[__CFString isEqualToString:](v12, "isEqualToString:", CFSTR("_kMDItemPhotosMemoriesExpandedDate")))
    {
      logForCSLogCategoryDefault();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18C42F000, v15, OS_LOG_TYPE_INFO, "Received expanded date key, will be adding expanded date search logic", buf, 2u);
      }

      objc_msgSend(a1, "string");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "substringWithRange:", a3, a4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "_expandedDateFilter:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "length"))
        -[NSObject addObject:](v14, "addObject:", v18);
      v19 = v14;

      v20 = CFSTR("kMDItemContentCreationDate");
    }
    else
    {
      v19 = v14;
      v20 = v12;
    }
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    obj = v13;
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v36 != v23)
            objc_enumerationMutation(obj);
          v25 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          v26 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "objectAtIndexedSubscript:", 1);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "stringWithFormat:", CFSTR("InRange(%@,$time.iso(%@),$time.iso(%@)"), v20, v27, v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject addObject:](v19, "addObject:", v29);

        }
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v22);
    }

    v12 = (__CFString *)v20;
    objc_msgSend(v30, "_tagRangeWithFilters:key:filters:filterOp:", v31, v32, v20, v19, v33);
  }
  else
  {
    logForCSLogCategoryDefault();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[NSMutableAttributedString(UserAttributedQueryString) tagRangeWithFilter:withCSAttributedEntityKey:dateISOValues:filterOperator:].cold.1();
  }

}

- (void)tagRangeWithSceneFilter:()UserAttributedQueryString withCSSceneType:sceneID:
{
  uint64_t v10;
  const __CFString *v11;
  const __CFString *v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(kMDItemPhotosSceneClassificationTypedIdentifiers=%ld-%@)"), a5, a6);
  v10 = objc_claimAutoreleasedReturnValue();
  v13 = (id)v10;
  v11 = CFSTR("kMDItemPhotosSceneClassificationLabels");
  if (a5 == 7)
    v11 = CFSTR("kMDItemPhotosBusinessNames");
  if (a5 == 6)
    v12 = CFSTR("kMDItemPhotosLocationKeywords");
  else
    v12 = v11;
  objc_msgSend(a1, "addAttribute:value:range:", v12, v10, a3, a4);

}

- (void)tagRangeWithSceneFilters:()UserAttributedQueryString withCSSceneTypes:sceneIDs:
{
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  const __CFString *v15;
  unint64_t v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;

  v10 = a5;
  v11 = a6;
  if (objc_msgSend(v10, "count") && (v12 = objc_msgSend(v10, "count"), v12 == objc_msgSend(v11, "count")))
  {
    v13 = (void *)objc_opt_new();
    v14 = objc_msgSend(v10, "count");
    v15 = CFSTR("kMDItemPhotosSceneClassificationLabels");
    if (v14)
    {
      v24 = a1;
      v25 = a3;
      v26 = a4;
      v16 = 0;
      LOBYTE(a1) = 1;
      do
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "intValue");

        LODWORD(a1) = ((v18 & 0xFFFFFFFE) != 6) & a1;
        v19 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v10, "objectAtIndexedSubscript:", v16);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndexedSubscript:", v16);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "stringWithFormat:", CFSTR("(kMDItemPhotosSceneClassificationTypedIdentifiers=%@-%@)"), v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v22);

        ++v16;
      }
      while (v16 < objc_msgSend(v10, "count"));
      v15 = CFSTR("kMDItemPhotosSceneClassificationLabels");
      if (!(_DWORD)a1)
        v15 = CFSTR("kMDItemPhotosLocationKeywords");
      a3 = v25;
      a4 = v26;
      a1 = v24;
    }
    objc_msgSend(a1, "_tagRangeWithFilters:key:filters:filterOp:", a3, a4, v15, v13, 0);

  }
  else
  {
    logForCSLogCategoryDefault();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[NSMutableAttributedString(UserAttributedQueryString) tagRangeWithSceneFilters:withCSSceneTypes:sceneIDs:].cold.1(v23);

  }
}

- (void)_tagRangeWithFilters:()UserAttributedQueryString key:filters:filterOp:
{
  id v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  const __CFString *v16;
  void *v17;

  v12 = a5;
  v13 = a6;
  if (objc_msgSend(v13, "count"))
  {
    if (objc_msgSend(v13, "count") == 1)
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a7)
        v16 = CFSTR(" && ");
      else
        v16 = CFSTR(" || ");
      objc_msgSend(v13, "componentsJoinedByString:", v16);
      v14 = objc_claimAutoreleasedReturnValue();
    }
    v17 = (void *)v14;
    objc_msgSend(a1, "addAttribute:value:range:", v12, v14, a3, a4);

  }
  else
  {
    logForCSLogCategoryDefault();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[NSMutableAttributedString(UserAttributedQueryString) _tagRangeWithFilters:key:filters:filterOp:].cold.1();

  }
}

- (void)tagRangeWithFilter:()UserAttributedQueryString withCSAttributedEntityKey:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_18C42F000, v0, v1, "Empty implicit value for string key: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)tagRangeWithFilter:()UserAttributedQueryString withCSAttributedEntityKey:startDates:endDates:filterOperator:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_18C42F000, v0, v1, "startdates don't match endDates: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)tagRangeWithFilter:()UserAttributedQueryString withCSAttributedEntityKey:stringValues:filterOperator:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_18C42F000, v0, v1, "No values provided for string key: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)tagRangeWithFilter:()UserAttributedQueryString withCSAttributedEntityKey:numberValues:filterOperator:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_18C42F000, v0, v1, "No values provided for number key: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)tagRangeWithFilter:()UserAttributedQueryString withCSAttributedEntityKey:dateISOValues:filterOperator:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_18C42F000, v0, v1, "No values provided for date key: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)tagRangeWithSceneFilters:()UserAttributedQueryString withCSSceneTypes:sceneIDs:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18C42F000, log, OS_LOG_TYPE_ERROR, "No values provided for scene filters or count of scene types and ids not same.", v1, 2u);
}

- (void)_tagRangeWithFilters:()UserAttributedQueryString key:filters:filterOp:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_18C42F000, v0, v1, "Empty filters provided for key: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
