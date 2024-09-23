@implementation PHSearchUtility

+ (unint64_t)PHSearchEntityCategoryTypeFromPHSearchSuggestionCategoriesType:(unint64_t)a3
{
  if (a3 - 1 > 6)
    return 0;
  else
    return qword_19944A578[a3 - 1];
}

+ (id)CSAttributedEntityKeyFromIndexCategoryType:(unint64_t)a3
{
  id v3;
  id *v4;
  char v5;

  v3 = 0;
  if ((uint64_t)a3 > 1599)
  {
    if ((uint64_t)a3 <= 1999)
    {
      if ((uint64_t)a3 <= 1800)
      {
        if ((uint64_t)a3 > 1699)
        {
          switch(a3)
          {
            case 0x6A4uLL:
              v4 = (id *)MEMORY[0x1E0CA5D18];
              break;
            case 0x6A5uLL:
              v4 = (id *)MEMORY[0x1E0CA5D10];
              break;
            case 0x708uLL:
              v4 = (id *)MEMORY[0x1E0CA5D50];
              break;
            default:
              return v3;
          }
        }
        else
        {
          if (a3 - 1600 > 0xB || ((1 << (a3 - 64)) & 0xC03) == 0)
            return v3;
          v4 = (id *)MEMORY[0x1E0CA5D98];
        }
      }
      else if (a3 - 1900 >= 0x14)
      {
        if (a3 - 1802 >= 2)
        {
          if (a3 != 1801)
            return v3;
          v4 = (id *)MEMORY[0x1E0CA5D58];
        }
        else
        {
          v4 = (id *)MEMORY[0x1E0CA5D48];
        }
      }
      else
      {
        v4 = (id *)MEMORY[0x1E0CA5DA0];
      }
LABEL_29:
      v3 = *v4;
      return v3;
    }
    if ((uint64_t)a3 <= 2399)
    {
      if ((uint64_t)a3 > 2199)
      {
        if (a3 == 2200)
        {
          v4 = (id *)MEMORY[0x1E0CA5E10];
        }
        else
        {
          if (a3 != 2300)
            return v3;
          v4 = (id *)MEMORY[0x1E0CA5D20];
        }
      }
      else if (a3 == 2000)
      {
        v4 = (id *)MEMORY[0x1E0CA5D60];
      }
      else
      {
        if (a3 != 2100)
          return v3;
        v4 = (id *)MEMORY[0x1E0CA5D68];
      }
      goto LABEL_29;
    }
    if (a3 - 2400 < 2)
    {
      v4 = (id *)MEMORY[0x1E0CA5D88];
      goto LABEL_29;
    }
    if (a3 - 2500 >= 2 && a3 - 2600 >= 2)
      return v3;
LABEL_28:
    v4 = (id *)MEMORY[0x1E0CA5E18];
    goto LABEL_29;
  }
  if ((uint64_t)a3 > 1199)
  {
    if ((uint64_t)a3 <= 1399)
    {
      switch(a3)
      {
        case 0x4B0uLL:
          v4 = (id *)MEMORY[0x1E0CA5D80];
          goto LABEL_29;
        case 0x4B1uLL:
          v4 = (id *)MEMORY[0x1E0CA5E38];
          goto LABEL_29;
        case 0x4B2uLL:
          v4 = (id *)MEMORY[0x1E0CA5D40];
          goto LABEL_29;
        case 0x4B3uLL:
        case 0x4B4uLL:
        case 0x4B5uLL:
          v4 = (id *)MEMORY[0x1E0CA5E30];
          goto LABEL_29;
        default:
          v5 = a3 - 20;
          if (a3 - 1300 > 0x1F)
            return v3;
          if (((1 << v5) & 0x300000) != 0)
          {
            v4 = (id *)MEMORY[0x1E0CA5E28];
          }
          else if (((1 << v5) & 0x40000001) != 0)
          {
            v4 = (id *)MEMORY[0x1E0CA5E00];
          }
          else
          {
            if (((1 << v5) & 0x80000002) == 0)
              return v3;
            v4 = (id *)MEMORY[0x1E0CA5DF8];
          }
          break;
      }
      goto LABEL_29;
    }
    if (a3 - 1500 > 0x1F || ((1 << (a3 + 36)) & 0xC0300C03) == 0)
    {
      if (a3 - 1400 >= 2)
        return v3;
      v4 = (id *)MEMORY[0x1E0CA5E08];
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  v4 = (id *)MEMORY[0x1E0CA5D90];
  if (a3 - 1 < 0xE)
    goto LABEL_29;
  switch(a3)
  {
    case 0x44CuLL:
      v4 = (id *)MEMORY[0x1E0CA5D28];
      goto LABEL_29;
    case 0x44DuLL:
      v4 = (id *)MEMORY[0x1E0CA5D30];
      goto LABEL_29;
    case 0x44EuLL:
      v4 = (id *)MEMORY[0x1E0CA5D38];
      goto LABEL_29;
    case 0x44FuLL:
      v4 = (id *)MEMORY[0x1E0CA5D70];
      goto LABEL_29;
    case 0x450uLL:
    case 0x451uLL:
      v4 = (id *)MEMORY[0x1E0CA5E20];
      goto LABEL_29;
    default:
      if (a3 - 1000 < 3)
        goto LABEL_29;
      break;
  }
  return v3;
}

+ (int64_t)CSSceneTypeFromIndexCategoryType:(unint64_t)a3
{
  char v3;

  if ((uint64_t)a3 <= 1519)
  {
    if (a3 - 1500 < 2)
      return 1;
    if (a3 - 1510 < 2)
      return 4;
  }
  else
  {
    v3 = a3 + 16;
    if (a3 - 1520 <= 0x15)
    {
      if (((1 << v3) & 3) != 0)
        return 6;
      if (((1 << v3) & 0xC00) != 0)
        return 7;
      if (((1 << v3) & 0x300000) != 0)
        return 8;
    }
    if (a3 - 2500 < 2)
      return 3;
    if (a3 - 2600 <= 1)
      return 2;
  }
  return 0;
}

+ (unint64_t)PHSearchEntityCategoryTypeFromCSAttributedEntityType:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CA5DF0]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CA5E00]) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CA5D90]) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CA5D38]) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CA5DE8]) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CA5DD0]) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CA5DC8]) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CA5DC0]) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CA5DE0]) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CA5DB8]) & 1) != 0)
  {
    v4 = 11;
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CA5DD8]))
  {
    v4 = 14;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)sceneIdFromIndexCategoryType:(unint64_t)a3 lookupIdentifier:(id)a4
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v11;

  v7 = a4;
  if (!objc_msgSend(v7, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHSearchUtility.m"), 326, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("lookupIdentifier.length > 0"));

  }
  if (a3 - 1500 > 0x1F || ((1 << (a3 + 36)) & 0xC0300C03) == 0)
  {
    if (a3 - 2600 < 2)
    {
      PLSearchHumanActionIdentifierFromLookupIdentifier();
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    if (a3 - 2500 > 1)
    {
      v9 = 0;
      goto LABEL_7;
    }
  }
  PLSearchSceneIdentifierFromLookupIdentifier();
  v8 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v9 = (void *)v8;
LABEL_7:

  return v9;
}

+ (id)updateInitialSearchQueryStringWithSearchAnnotations:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, uint64_t, uint64_t);
  void *v13;
  id v14;
  id v15;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = (void *)objc_msgSend(v4, "mutableCopy");
    v6 = objc_msgSend(v4, "length");
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __71__PHSearchUtility_updateInitialSearchQueryStringWithSearchAnnotations___block_invoke;
    v13 = &unk_1E35D5DB0;
    v14 = v5;
    v15 = a1;
    v7 = v5;
    objc_msgSend(v4, "enumerateAttributesInRange:options:usingBlock:", 0, v6, 0, &v10);
    v8 = (void *)objc_msgSend(v7, "copy", v10, v11, v12, v13);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (unint64_t)numberOfInsertedSpacesBetweenAnnotationsAndPlainTextInQueryString:(id)a3 beforeLocation:(unint64_t)a4
{
  id v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = objc_msgSend(v5, "length");
  v7 = 0;
  if (a4 && v6)
  {
    if (a4 == 0x7FFFFFFFFFFFFFFFLL || objc_msgSend(v5, "length") <= a4)
      a4 = objc_msgSend(v5, "length");
    objc_msgSend(v5, "attributedSubstringFromRange:", 0, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHSearchUtility insertSpacingIfNeededBetweenAnnotationsAndPlainTextInQueryString:](PHSearchUtility, "insertSpacingIfNeededBetweenAnnotationsAndPlainTextInQueryString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v9, "length") - a4;
  }

  return v7;
}

+ (id)insertSpacingIfNeededBetweenAnnotationsAndPlainTextInQueryString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, uint64_t);
  void *v23;
  id v24;
  id v25;
  id v26;
  __int128 *p_buf;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  _QWORD *v32;
  _QWORD v33[4];
  uint8_t v34[4];
  id v35;
  __int128 buf;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v4 = (void *)objc_msgSend(v3, "mutableCopy");
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x2020000000;
    v33[3] = 0;
    v6 = objc_msgSend(v3, "length");
    v7 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __84__PHSearchUtility_insertSpacingIfNeededBetweenAnnotationsAndPlainTextInQueryString___block_invoke;
    v28[3] = &unk_1E35D5DD8;
    v8 = v3;
    v29 = v8;
    v9 = v5;
    v30 = v9;
    v32 = v33;
    v10 = v4;
    v31 = v10;
    objc_msgSend(v8, "enumerateAttributesInRange:options:usingBlock:", 0, v6, 0, v28);
    if (!objc_msgSend(v10, "length"))
    {
      PLSearchBackendQueryGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v8;
        _os_log_impl(&dword_1991EC000, v11, OS_LOG_TYPE_ERROR, "[First Pass] Failed to insert spacing for query string: %@", (uint8_t *)&buf, 0xCu);
      }

    }
    v12 = (void *)objc_msgSend(v10, "mutableCopy");
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v37 = 0x2020000000;
    v38 = 0;
    v13 = objc_msgSend(v10, "length");
    v20 = v7;
    v21 = 3221225472;
    v22 = __84__PHSearchUtility_insertSpacingIfNeededBetweenAnnotationsAndPlainTextInQueryString___block_invoke_14;
    v23 = &unk_1E35D5DD8;
    v14 = v10;
    v24 = v14;
    v15 = v9;
    v25 = v15;
    p_buf = &buf;
    v16 = v12;
    v26 = v16;
    objc_msgSend(v14, "enumerateAttributesInRange:options:usingBlock:", 0, v13, 0, &v20);
    if (!objc_msgSend(v16, "length", v20, v21, v22, v23))
    {
      PLSearchBackendQueryGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v34 = 138412290;
        v35 = v8;
        _os_log_impl(&dword_1991EC000, v17, OS_LOG_TYPE_ERROR, "[Second Pass] Failed to insert spacing for query string: %@", v34, 0xCu);
      }

    }
    v18 = (id)objc_msgSend(v16, "copy");

    _Block_object_dispose(&buf, 8);
    _Block_object_dispose(v33, 8);

  }
  else
  {
    v18 = v3;
  }

  return v18;
}

+ (unint64_t)suggestionTypeForQueryString:(id)a3 locationInQueryStringForSuggestionGeneration:(unint64_t)a4
{
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v5 = a3;
  if (!objc_msgSend(v5, "length"))
    goto LABEL_5;
  if (a4)
  {
    if (a4 != 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(v5, "length") < a4)
    {
LABEL_5:
      a4 = 0;
      goto LABEL_12;
    }
    if (objc_msgSend(v5, "length") <= a4)
    {
      v11 = 0;
      v12 = &v11;
      v13 = 0x2020000000;
      v14 = 0;
      v6 = objc_msgSend(v5, "length");
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __93__PHSearchUtility_suggestionTypeForQueryString_locationInQueryStringForSuggestionGeneration___block_invoke;
      v8[3] = &unk_1E35D5E00;
      v9 = v5;
      v10 = &v11;
      objc_msgSend(v9, "enumerateAttributesInRange:options:usingBlock:", 0, v6, 0, v8);
      if (*((_BYTE *)v12 + 24))
        a4 = 2;
      else
        a4 = 1;

      _Block_object_dispose(&v11, 8);
    }
    else
    {
      a4 = 1;
    }
  }
LABEL_12:

  return a4;
}

+ (id)suggestionComponentsInQueryString:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  id v14;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = objc_msgSend(v3, "length");
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __53__PHSearchUtility_suggestionComponentsInQueryString___block_invoke;
    v12 = &unk_1E35D5E28;
    v13 = v4;
    v14 = v3;
    v6 = v4;
    objc_msgSend(v14, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("PHSearchQueryAttributeKey"), 0, v5, 0, &v9);
    v7 = (void *)objc_msgSend(v6, "copy", v9, v10, v11, v12);

  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v7;
}

+ (id)extractAssetUUIDsForLocationDisambiguationsInQueryString:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  if (v4)
  {
    v6 = objc_msgSend(v3, "length");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __76__PHSearchUtility_extractAssetUUIDsForLocationDisambiguationsInQueryString___block_invoke;
    v9[3] = &unk_1E35D75D8;
    v10 = v5;
    v7 = v5;
    objc_msgSend(v3, "enumerateAttributesInRange:options:usingBlock:", 0, v6, 0, v9);
    v5 = (id)objc_msgSend(v7, "copy");

  }
  return v5;
}

+ (id)queryTokensFromQueryText:(id)a3 limitToSuggestionCategories:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id obj;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  void *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "_parsedAttributedTokensFromQueryText:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v29 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        v24 = 0;
        v25 = &v24;
        v26 = 0x2020000000;
        v27 = 0;
        v13 = objc_msgSend(v12, "length");
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __72__PHSearchUtility_queryTokensFromQueryText_limitToSuggestionCategories___block_invoke;
        v19[3] = &unk_1E35D5E50;
        v23 = &v24;
        v20 = v7;
        v21 = v6;
        v22 = v12;
        objc_msgSend(v12, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("PHSearchQueryAttributeKey"), 0, v13, 0, v19);
        if (*((_BYTE *)v25 + 24))
        {
          objc_msgSend(v12, "string");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v14);

        }
        _Block_object_dispose(&v24, 8);
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v9);
  }

  v15 = (void *)objc_msgSend(v18, "copy");
  return v15;
}

+ (BOOL)locationDisambiguationSpansFullLengthOfString:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  _QWORD v15[5];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(a1, "_parsedAttributedTokensFromQueryText:", v4);
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 0;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v17;
      v8 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v17 != v7)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          v11 = objc_msgSend(v10, "length");
          v15[0] = v8;
          v15[1] = 3221225472;
          v15[2] = __65__PHSearchUtility_locationDisambiguationSpansFullLengthOfString___block_invoke;
          v15[3] = &unk_1E35D7588;
          v15[4] = &v20;
          objc_msgSend(v10, "enumerateAttributesInRange:options:usingBlock:", 0, v11, 0, v15);
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      }
      while (v6);
    }

    v12 = v21[3];
    v13 = v12 == objc_msgSend(v5, "count");
    _Block_object_dispose(&v20, 8);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)tagRangeWithSpotlightAttributedTypeForLocationTripQueryString:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v15;
  uint8_t buf[4];
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0CB3778];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithAttributedString:", v4);

  if (objc_msgSend(v5, "length"))
  {
    PLServicesLocalizedFrameworkString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "length");
    if (v6)
    {
      v8 = *MEMORY[0x1E0CA5D98];
      v18[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
      v9 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "tagRangeWithFilter:withCSAttributedEntityKey:stringValues:", 0, v7, v8, v9);
    }
    else
    {
      PLSearchBackendQueryGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v5, "string");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v17 = v10;
        _os_log_impl(&dword_1991EC000, v9, OS_LOG_TYPE_ERROR, "Unable to find localized string for SEARCH_TRIP, will not annotate query as trip: %@", buf, 0xCu);

      }
    }

    objc_msgSend(v5, "string");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x1E0CA5D90];
    v15 = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tagRangeWithFilter:withCSAttributedEntityKey:stringValues:", 0, v7, v12, v13);

  }
  return v5;
}

+ (id)generateTripAnnotationWithTripUUIDs:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  PHSearchQueryQUToken *v7;
  void *v8;
  PHSearchQueryQUToken *v9;
  PHSearchQueryAnnotation *v10;
  PHSearchQueryAnnotation *v11;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  PLServicesLocalizedFrameworkString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndex:", 13);
  +[PHSearchQueryQUToken entityCategoryTypeKeyForEntityTypeCategory:](PHSearchQueryQUToken, "entityCategoryTypeKeyForEntityTypeCategory:", 13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = [PHSearchQueryQUToken alloc];
  v13 = v6;
  v14[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PHSearchQueryQUToken initWithText:entityCategoryTypes:metadata:](v7, "initWithText:entityCategoryTypes:metadata:", v4, v5, v8);

  v10 = [PHSearchQueryAnnotation alloc];
  v11 = -[PHSearchQueryAnnotation initWithQueryToken:](v10, "initWithQueryToken:", v9);

  return v11;
}

+ (id)completionSuggestionTextsForQueryString:(id)a3 locationInQueryString:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  uint8_t buf[4];
  unint64_t v39;
  __int16 v40;
  unint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!objc_msgSend(v6, "length"))
  {
    v18 = (id)MEMORY[0x1E0C9AA60];
    goto LABEL_49;
  }
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
    a4 = objc_msgSend(v6, "length");
  if ((objc_msgSend(a1, "_locationExists:forString:", a4, v6) & 1) == 0)
  {
    PLSearchBackendQueryGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v39 = a4;
      v40 = 2112;
      v41 = (unint64_t)v6;
      _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_ERROR, "Unable to locate specified location: %tu in query string: \"%@\", no suggestions will be generated.", buf, 0x16u);
    }
    goto LABEL_24;
  }
  objc_msgSend(a1, "_parsedAttributedTokensFromQueryText:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(a1, "_shouldOfferCompletionSuggestionsInQueryString:atLocation:parsedQueryTokens:", v6, a4, v7))
  {
LABEL_24:
    v18 = (id)MEMORY[0x1E0C9AA60];
    goto LABEL_48;
  }
  v8 = -[NSObject count](v7, "count");
  if (v8 - 1 < 0)
    goto LABEL_33;
  v9 = v8;
  v37 = v6;
  v10 = 0x7FFFFFFFFFFFFFFFLL;
  v11 = 0x7FFFFFFFFFFFFFFFLL;
  while (1)
  {
    -[NSObject objectAtIndexedSubscript:](v7, "objectAtIndexedSubscript:", --v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(a1, "_tokenHasSuggestion:", v12))
      goto LABEL_11;
    v13 = 0x7FFFFFFFFFFFFFFFLL;
    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
      break;
LABEL_19:

    v11 = v13;
    if (v9 <= 0)
      goto LABEL_26;
  }
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_11:
    v14 = objc_msgSend(a1, "_rangeOfTokenInQueryString:", v12);
    v16 = v14 + v15;
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
      v17 = v9;
    else
      v17 = v11;
    if (v16 <= a4)
      v13 = v17;
    else
      v13 = v11;
    if (v16 <= a4)
      v10 = v9;
    goto LABEL_19;
  }

  v13 = v11;
LABEL_26:
  v6 = v37;
  if (v10 == 0x7FFFFFFFFFFFFFFFLL || v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_33:
    PLSearchBackendQueryGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v39 = (unint64_t)v6;
      v40 = 2048;
      v41 = a4;
      _os_log_impl(&dword_1991EC000, v19, OS_LOG_TYPE_ERROR, "Unable to extract completion suggestion texts for query: \"%@\" at location: %tu", buf, 0x16u);
    }
    v18 = (id)MEMORY[0x1E0C9AA60];
    goto LABEL_47;
  }
  v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[NSObject objectAtIndexedSubscript:](v7, "objectAtIndexedSubscript:", v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(a1, "_rangeOfTokenInQueryString:", v20);
  if (v21 == 0x7FFFFFFFFFFFFFFFLL)
  {
    PLSearchBackendQueryGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      goto LABEL_30;
    goto LABEL_31;
  }
  v35 = v20;
  if (v13 < v10)
  {
LABEL_45:
    v18 = -[NSObject copy](v19, "copy");
    v20 = v35;
  }
  else
  {
    v24 = 0;
    v34 = v21 + v22;
    while (v13 + v24 <= (unint64_t)(-[NSObject count](v7, "count", v34) - 1))
    {
      -[NSObject objectAtIndexedSubscript:](v7, "objectAtIndexedSubscript:", v13 + v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        v26 = objc_msgSend(a1, "_rangeOfTokenInQueryString:", v25);
        if (v26 == 0x7FFFFFFFFFFFFFFFLL)
        {
          PLSearchBackendQueryGetLog();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v39 = (unint64_t)v6;
            v40 = 2048;
            v41 = a4;
            _os_log_impl(&dword_1991EC000, v33, OS_LOG_TYPE_ERROR, "Unable to extract completion suggestion texts for query: \"%@\" at location: %tu", buf, 0x16u);
          }
          v20 = v35;
          goto LABEL_58;
        }
        v27 = v26;
        v36 = v25;
        v28 = v19;
        v29 = v34 - v26;
        if ((objc_msgSend(a1, "rangeExists:forString:", v26, v34 - v26, v6) & 1) == 0)
        {
          PLSearchBackendQueryGetLog();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v39 = (unint64_t)v6;
            v40 = 2048;
            v41 = a4;
            _os_log_impl(&dword_1991EC000, v33, OS_LOG_TYPE_ERROR, "Unable to extract completion suggestion texts for query: \"%@\" at location: %tu", buf, 0x16u);
          }
          v19 = v28;
          v20 = v35;
          v25 = v36;
LABEL_58:

          goto LABEL_32;
        }
        objc_msgSend(v6, "string");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "substringWithRange:", v27, v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = v28;
        v25 = v36;
        v6 = v37;
      }
      else
      {
        objc_msgSend(v35, "string");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[NSObject addObject:](v19, "addObject:", v31);

      --v24;
      if (v13 + v24 + 1 <= v10)
        goto LABEL_45;
    }
    PLSearchBackendQueryGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    v20 = v35;
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      goto LABEL_31;
LABEL_30:
    *(_DWORD *)buf = 138412546;
    v39 = (unint64_t)v6;
    v40 = 2048;
    v41 = a4;
    _os_log_impl(&dword_1991EC000, v23, OS_LOG_TYPE_ERROR, "Unable to extract completion suggestion texts for query: \"%@\" at location: %tu", buf, 0x16u);
LABEL_31:

LABEL_32:
    v18 = (id)MEMORY[0x1E0C9AA60];
  }

LABEL_47:
LABEL_48:

LABEL_49:
  return v18;
}

+ (BOOL)rangeExists:(_NSRange)a3 forString:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v6;
  BOOL v7;

  length = a3.length;
  location = a3.location;
  v6 = a4;
  v7 = 0;
  if (objc_msgSend(v6, "length") && location != 0x7FFFFFFFFFFFFFFFLL)
    v7 = location <= objc_msgSend(v6, "length") && location + length <= objc_msgSend(v6, "length");

  return v7;
}

+ (id)_parsedAttributedTokensFromQueryText:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CCE180]), "initWithUnit:", 0);
    objc_msgSend(v3, "string");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setString:", v5);

    objc_msgSend(v4, "string");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __56__PHSearchUtility__parsedAttributedTokensFromQueryText___block_invoke;
    v15[3] = &unk_1E35D5EA0;
    v16 = v4;
    v9 = v3;
    v17 = v9;
    v10 = v8;
    v18 = v10;
    v11 = v4;
    objc_msgSend(v11, "enumerateTokensInRange:usingBlock:", 0, v7, v15);
    if (!objc_msgSend(v10, "count"))
    {
      PLSearchBackendQueryGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v9;
        _os_log_impl(&dword_1991EC000, v12, OS_LOG_TYPE_ERROR, "Unable to extract query parses from query: %@", buf, 0xCu);
      }

    }
    v13 = (void *)objc_msgSend(v10, "copy");

  }
  else
  {
    v13 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v13;
}

+ (BOOL)_shouldOfferCompletionSuggestionsInQueryString:(id)a3 atLocation:(unint64_t)a4 parsedQueryTokens:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  BOOL v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  unint64_t v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = a5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
LABEL_3:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v23 != v12)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v13);
      v15 = objc_msgSend(a1, "_rangeOfTokenInQueryString:", v14, (_QWORD)v22);
      if (v15 == 0x7FFFFFFFFFFFFFFFLL)
        break;
      v17 = v15 + v16;
      if (v15 + v16 > (unint64_t)objc_msgSend(v8, "length"))
        break;
      if (v17 == a4)
      {
        objc_msgSend(v14, "string");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
          goto LABEL_15;
        goto LABEL_12;
      }
      if (v11 == ++v13)
      {
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
        if (v11)
          goto LABEL_3;
        break;
      }
    }
  }

LABEL_12:
  PLSearchBackendQueryGetLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    v27 = a4;
    v28 = 2112;
    v29 = v8;
    v30 = 2112;
    v31 = v9;
    _os_log_impl(&dword_1991EC000, v18, OS_LOG_TYPE_INFO, "Unable to locate specified location: %tu in query string: \"%@\" with parsed query tokens: %@, no suggestions will be generated.", buf, 0x20u);
  }

  v19 = 0;
LABEL_15:
  v20 = objc_msgSend(v19, "length", (_QWORD)v22) != 0;

  return v20;
}

+ (_NSRange)_rangeOfTokenInQueryString:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  _NSRange result;

  v3 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3010000000;
  v16 = &unk_19949EB27;
  v17 = xmmword_19944AC80;
  v4 = objc_msgSend(v3, "length");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __46__PHSearchUtility__rangeOfTokenInQueryString___block_invoke;
  v10[3] = &unk_1E35D5E00;
  v5 = v3;
  v11 = v5;
  v12 = &v13;
  objc_msgSend(v5, "enumerateAttributesInRange:options:usingBlock:", 0, v4, 0, v10);
  v6 = v14[4];
  v7 = v14[5];

  _Block_object_dispose(&v13, 8);
  v8 = v6;
  v9 = v7;
  result.length = v9;
  result.location = v8;
  return result;
}

+ (BOOL)_tokenHasSuggestion:(id)a3
{
  id v3;
  uint64_t v4;
  char v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v3 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v4 = objc_msgSend(v3, "length");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__PHSearchUtility__tokenHasSuggestion___block_invoke;
  v7[3] = &unk_1E35D7588;
  v7[4] = &v8;
  objc_msgSend(v3, "enumerateAttributesInRange:options:usingBlock:", 0, v4, 0, v7);
  v5 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return v5;
}

+ (BOOL)_locationExists:(unint64_t)a3 forString:(id)a4
{
  return objc_msgSend(a4, "length") >= a3;
}

+ (id)_searchQueryAnnotationFromRankedGroup:(id)a3 matchRange:(_NSRange)a4
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  PHSearchSuggestion *v8;
  void *v9;
  void *v10;
  PHSearchSuggestion *v11;
  PHSearchQueryAnnotation *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "searchIndexingCategory");
    v6 = PLSearchSuggestionCategoriesTypeForSearchIndexCategory();
    objc_msgSend(v5, "suggestionComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      if ((unint64_t)(v6 - 1) >= 0x29)
        v6 = 0;
      v8 = [PHSearchSuggestion alloc];
      objc_msgSend(v5, "displayString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[PHSearchSuggestion initWithType:categoriesType:text:matchRangeOfSearchText:count:suggestionComponents:](v8, "initWithType:categoriesType:text:matchRangeOfSearchText:count:suggestionComponents:", 4, v6, v9, 0x7FFFFFFFFFFFFFFFLL, 0, 0, v10);

      v12 = -[PHSearchQueryAnnotation initWithSuggestion:queryToken:]([PHSearchQueryAnnotation alloc], "initWithSuggestion:queryToken:", v11, 0);
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __39__PHSearchUtility__tokenHasSuggestion___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  void *v7;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("PHSearchQueryAttributeKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
}

void __46__PHSearchUtility__rangeOfTokenInQueryString___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("PHSearchParsedTokenRangeInQueryKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "rangeValue");
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    *(_QWORD *)(v6 + 32) = v5;
    *(_QWORD *)(v6 + 40) = v7;
  }
  else
  {
    PLSearchBackendQueryGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_ERROR, "Unable to find associated range value for the parsed token: %@", (uint8_t *)&v10, 0xCu);
    }

  }
}

void __56__PHSearchUtility__parsedAttributedTokensFromQueryText___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  uint64_t v14;

  objc_msgSend(*(id *)(a1 + 32), "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "substringWithRange:", a2, a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v10);
  v8 = *(void **)(a1 + 40);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__PHSearchUtility__parsedAttributedTokensFromQueryText___block_invoke_2;
  v11[3] = &unk_1E35D5E78;
  v12 = v7;
  v13 = a2;
  v14 = a3;
  v9 = v7;
  objc_msgSend(v8, "enumerateAttributesInRange:options:usingBlock:", a2, a3, 0, v11);
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v9);

}

void __56__PHSearchUtility__parsedAttributedTokensFromQueryText___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)MEMORY[0x1E0CB3B18];
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = a2;
  objc_msgSend(v3, "valueWithRange:", v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addAttribute:value:range:", CFSTR("PHSearchParsedTokenRangeInQueryKey"), v8, 0, objc_msgSend(*(id *)(a1 + 32), "length"));

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PHSearchQueryAttributeKey"));
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "suggestion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", CFSTR("PHSearchQueryAttributeKey"), v10, 0, objc_msgSend(*(id *)(a1 + 32), "length"));

}

void __65__PHSearchUtility_locationDisambiguationSpansFullLengthOfString___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("PHSearchQueryAttributeKey"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "suggestion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "type") == 3)
  {
    objc_msgSend(v8, "suggestion");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locationAssetUUIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    v7 = v8;
    if (v6)
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {

    v7 = v8;
  }

}

void __72__PHSearchUtility_queryTokensFromQueryText_limitToSuggestionCategories___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "suggestion");
      v4 = objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        if (objc_msgSend(*(id *)(a1 + 32), "count"))
          v5 = objc_msgSend(*(id *)(a1 + 32), "containsIndex:", -[NSObject categoriesType](v4, "categoriesType"));
        else
          v5 = 1;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v5;
      }
    }
    else
    {
      PLSearchBackendQueryGetLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v6 = *(_QWORD *)(a1 + 40);
        v7 = *(_QWORD *)(a1 + 48);
        v8 = 138412546;
        v9 = v6;
        v10 = 2112;
        v11 = v7;
        _os_log_impl(&dword_1991EC000, v4, OS_LOG_TYPE_ERROR, "Found unexpected attribute for PHSearchQueryAttributeKey in query string: %@, not including %@ as a query token for OCR match highlighting", (uint8_t *)&v8, 0x16u);
      }
    }

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }

}

void __76__PHSearchUtility_extractAssetUUIDsForLocationDisambiguationsInQueryString___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("PHSearchQueryAttributeKey"));
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "suggestion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "type") != 3)
  {
LABEL_7:

    v7 = v13;
    goto LABEL_8;
  }
  objc_msgSend(v13, "suggestion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationAssetUUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  v7 = v13;
  if (v6)
  {
    v8 = objc_msgSend(*(id *)(a1 + 32), "count");
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v13, "suggestion");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "locationAssetUUIDs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v8)
    {
      objc_msgSend(v9, "intersectSet:", v10);
    }
    else
    {
      objc_msgSend(v10, "allObjects");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObjectsFromArray:", v12);

    }
    goto LABEL_7;
  }
LABEL_8:

}

void __53__PHSearchUtility_suggestionComponentsInQueryString___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  id v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "suggestion");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = v4;
      if (v4)
      {
        v6 = *(void **)(a1 + 32);
        -[NSObject suggestionComponents](v4, "suggestionComponents");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObjectsFromArray:", v7);

      }
    }
    else
    {
      PLSearchBackendQueryGetLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v8 = *(_QWORD *)(a1 + 40);
        v9 = 138412546;
        v10 = v3;
        v11 = 2112;
        v12 = v8;
        _os_log_impl(&dword_1991EC000, v5, OS_LOG_TYPE_ERROR, "Found unexpected attribute %@ for PHSearchQueryAttributeKey in query string: %@", (uint8_t *)&v9, 0x16u);
      }
    }

  }
}

void __93__PHSearchUtility_suggestionTypeForQueryString_locationInQueryStringForSuggestionGeneration___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  id v13;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("PHSearchQueryAttributeKey"));
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v9 = a3 + a4;
  v10 = objc_msgSend(*(id *)(a1 + 32), "length");
  objc_msgSend(v13, "suggestion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    v12 = v9 == v10;
  else
    v12 = 0;
  if (v12)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a5 = 1;
  }

}

void __84__PHSearchUtility_insertSpacingIfNeededBetweenAnnotationsAndPlainTextInQueryString___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("PHSearchQueryAttributeKey"));
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v7 = a3 + a4;
    if (v7 != objc_msgSend(*(id *)(a1 + 32), "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "string");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "characterAtIndex:", v7);

      if ((objc_msgSend(*(id *)(a1 + 40), "characterIsMember:", v9) & 1) == 0)
      {
        v10 = *(void **)(a1 + 48);
        v11 = v7 + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
        objc_msgSend(v10, "insertAttributedString:atIndex:", v12, v11);

        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      }
    }
  }

}

void __84__PHSearchUtility_insertSpacingIfNeededBetweenAnnotationsAndPlainTextInQueryString___block_invoke_14(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  BOOL v6;
  void *v7;
  uint64_t v8;
  char v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("PHSearchQueryAttributeKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = a3 == 0;
  else
    v6 = 1;
  if (!v6)
  {
    v13 = v5;
    objc_msgSend(*(id *)(a1 + 32), "string");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "characterAtIndex:", a3 - 1);

    v9 = objc_msgSend(*(id *)(a1 + 40), "characterIsMember:", v8);
    v5 = v13;
    if ((v9 & 1) == 0)
    {
      v10 = *(void **)(a1 + 48);
      v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) + a3;
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
      objc_msgSend(v10, "insertAttributedString:atIndex:", v12, v11);

      v5 = v13;
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    }
  }

}

void __71__PHSearchUtility_updateInitialSearchQueryStringWithSearchAnnotations___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v7 = *MEMORY[0x1E0D72D88];
  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D72D88]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", v7, a3, a4);
    objc_msgSend(*(id *)(a1 + 40), "_searchQueryAnnotationFromRankedGroup:matchRange:", v8, a3, a4);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
    {
      v11 = *(void **)(a1 + 32);
      v13 = CFSTR("PHSearchQueryAttributeKey");
      v14[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addAttributes:range:", v12, a3, a4);

    }
  }

}

@end
