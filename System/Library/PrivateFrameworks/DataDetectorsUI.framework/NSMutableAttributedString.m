@implementation NSMutableAttributedString

uint64_t __99__NSMutableAttributedString_DataDetectorsSupport__dd_urlifyResult_withBlock_referenceDate_context___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  if (a2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
    result = objc_msgSend(*(id *)(result + 32), "addAttribute:value:range:", CFSTR("DDFoundExistingLink"), MEMORY[0x1E0C9AAB0], a3, a4);
    *a5 = 1;
  }
  return result;
}

void __95__NSMutableAttributedString_DataDetectorsSupport__dd_appendUrl_context_range_backedAttributes___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "scheme");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D1CE48]))
    {
      v23 = a3;
      v24 = a4;

LABEL_8:
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("DDAttributeBackup"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
        v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v22 = a1;
        v14 = *(id *)(a1 + 40);
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v26;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v26 != v17)
                objc_enumerationMutation(v14);
              v19 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
              objc_msgSend(v8, "objectForKeyedSubscript:", v19);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              if (v20)
              {
                objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, v19);
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, v19);

              }
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
          }
          while (v16);
        }

        objc_msgSend(*(id *)(v22 + 48), "addAttribute:value:range:", CFSTR("DDAttributeBackup"), v4, v23, v24);
        goto LABEL_21;
      }
      goto LABEL_22;
    }
  }
  objc_msgSend(v8, "valueForKey:", *MEMORY[0x1E0D1CC00]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v23 = a3;
    v24 = a4;
    objc_msgSend(v8, "valueForKey:", CFSTR("DDFoundExistingLink"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "BOOLValue");

    if (v9)
    if ((v12 & 1) != 0)
      goto LABEL_22;
    goto LABEL_8;
  }

  if (v9)
LABEL_21:

LABEL_22:
}

void __129__NSMutableAttributedString_DataDetectorsSupport__dd_makeLinksForResultsInAttributesOfType_usingURLificationBlock_context_range___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "type");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D1CB58]);

    if (v6)
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      objc_msgSend(v4, "subResults", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v17;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v17 != v10)
              objc_enumerationMutation(v7);
            objc_msgSend(*(id *)(a1 + 32), "dd_urlifyResult:withBlock:referenceDate:context:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v9);
      }

    }
    else if (objc_msgSend(*(id *)(a1 + 32), "dd_urlifyResult:withBlock:referenceDate:context:", v4, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)))
    {
      if (*(_BYTE *)(a1 + 72))
      {
        objc_msgSend(v4, "coreResult");
        if (DDResultGetCategory() == 4)
        {
          v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
          if (!v12)
          {
            v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v14 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
            v15 = *(void **)(v14 + 40);
            *(_QWORD *)(v14 + 40) = v13;

            v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
          }
          objc_msgSend(v12, "addObject:", v4);
        }
      }
    }
  }

}

void __67__NSMutableAttributedString_DataDetectorsSupport__dd_resetResults___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  char v45;
  void *v46;
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
  v7 = a2;
  v8 = *MEMORY[0x1E0CEA0C0];
  objc_msgSend(v7, "valueForKey:", *MEMORY[0x1E0CEA0C0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = v9;
  }
  v11 = v10;
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v11, "scheme");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0D1CE48]) & 1) != 0)
    {
LABEL_9:

LABEL_19:
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("DDAttributeBackup"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");
      objc_msgSend(*(id *)(a1 + 40), "removeAllObjects");
      v44 = v7;
      v46 = v21;
      v42 = v9;
      v43 = v11;
      if (v21)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v41 = v8;
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = 0u;
          v52 = 0u;
          v53 = 0u;
          v54 = 0u;
          objc_msgSend(v21, "keyEnumerator");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
          if (v24)
          {
            v25 = v24;
            v26 = *(_QWORD *)v52;
            do
            {
              for (i = 0; i != v25; ++i)
              {
                if (*(_QWORD *)v52 != v26)
                  objc_enumerationMutation(v23);
                v28 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i);
                objc_msgSend(v46, "objectForKeyedSubscript:", v28);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v29, "isEqual:", v22))
                  objc_msgSend(*(id *)(a1 + 32), "addObject:", v28);
                else
                  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v29, v28);

              }
              v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
            }
            while (v25);
          }

          v11 = v43;
          v7 = v44;
          v8 = v41;
        }
        objc_msgSend(*(id *)(a1 + 32), "addObject:", CFSTR("DDAttributeBackup"));
      }
      if (v11)
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("DDContext"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (v30)
        objc_msgSend(*(id *)(a1 + 32), "addObject:", CFSTR("DDContext"));
      if (!*(_BYTE *)(a1 + 64))
      {
        objc_msgSend(*(id *)(a1 + 32), "addObject:", *MEMORY[0x1E0D1CC00]);
        objc_msgSend(*(id *)(a1 + 32), "addObject:", CFSTR("DDFoundExistingLink"));
      }
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      v31 = *(id *)(a1 + 32);
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v48;
        do
        {
          for (j = 0; j != v33; ++j)
          {
            if (*(_QWORD *)v48 != v34)
              objc_enumerationMutation(v31);
            v36 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * j);
            if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
            {
              objc_msgSend(*(id *)(a1 + 48), "beginEditing");
              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
            }
            objc_msgSend(*(id *)(a1 + 48), "removeAttribute:range:", v36, a3, a4);
          }
          v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
        }
        while (v33);
      }

      v11 = v43;
      v7 = v44;
      v9 = v42;
      if (objc_msgSend(*(id *)(a1 + 40), "count"))
      {
        if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
        {
          objc_msgSend(*(id *)(a1 + 48), "beginEditing");
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
        }
        objc_msgSend(*(id *)(a1 + 48), "addAttributes:range:", *(_QWORD *)(a1 + 40), a3, a4);
      }

      v20 = v46;
      goto LABEL_53;
    }
    objc_msgSend(v11, "scheme");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isEqualToString:", CFSTR("x-apple-data-detectors-clientdefined")))
    {

      goto LABEL_9;
    }
    v39 = v13;
    v40 = v12;
    v14 = 1;
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D1CC00], v39);
  }
  else
  {
    v14 = 0;
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D1CC00], v37);
  }
  v15 = objc_claimAutoreleasedReturnValue();
  if (!v15)
    goto LABEL_14;
  v16 = (void *)v15;
  v17 = v8;
  v18 = v9;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("DDFoundExistingLink"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v19, "BOOLValue") & 1) != 0)
  {

    v9 = v18;
LABEL_14:
    if ((v14 & 1) != 0)
    {

      v20 = v40;
LABEL_53:

      goto LABEL_54;
    }
    goto LABEL_54;
  }
  v45 = dd_urlLooksSuspicious(v11);

  if ((v14 & 1) != 0)
  {

  }
  v9 = v18;
  v8 = v17;
  if ((v45 & 1) == 0)
    goto LABEL_19;
LABEL_54:

}

void __67__NSMutableAttributedString_DataDetectorsSupport__dd_resetResults___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  id v8;

  v7 = a2;
  if (v7)
  {
    v8 = v7;
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      objc_msgSend(*(id *)(a1 + 32), "beginEditing");
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }
    objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", *(_QWORD *)(a1 + 40), a3, a4);
    v7 = v8;
  }

}

uint64_t __86__NSMutableAttributedString_DataDetectorsSupport__dd_urlifyClientRange_index_context___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  if (a2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

void __129__NSMutableAttributedString_DataDetectorsSupport__dd_makeLinksForResultsInAttributesOfType_usingURLificationBlock_context_range___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  double v3;
  double Helper_x8__OBJC_CLASS___SGNLEventSuggestionsMetrics;
  uint64_t v5;

  v2 = a2;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    __129__NSMutableAttributedString_DataDetectorsSupport__dd_makeLinksForResultsInAttributesOfType_usingURLificationBlock_context_range___block_invoke_2_cold_1(v2);
  Helper_x8__OBJC_CLASS___SGNLEventSuggestionsMetrics = gotLoadHelper_x8__OBJC_CLASS___SGNLEventSuggestionsMetrics(v3);
  objc_msgSend(*(id *)(v5 + 2232), "shownViaDataDetectorsLinkInApp:", 2, Helper_x8__OBJC_CLASS___SGNLEventSuggestionsMetrics);

}

id __109__NSMutableAttributedString_DataDetectorsSupport__dd_replaceResultAttributesWithSimpleLinksForTypes_context___block_invoke(uint64_t a1, void *a2)
{
  int Category;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  Category = DDResultGetCategory();
  if (Category == 1)
  {
    if ((*(_BYTE *)(a1 + 32) & 2) == 0)
    {
LABEL_10:
      v9 = 0;
      return v9;
    }
LABEL_8:
    v9 = (void *)DDResultCopyExtractedURL();
    return v9;
  }
  if (Category == 2)
  {
    if ((*(_BYTE *)(a1 + 32) & 1) == 0)
      goto LABEL_10;
    goto LABEL_8;
  }
  if (Category != 3 || (*(_BYTE *)(a1 + 32) & 4) == 0)
    goto LABEL_10;
  DDMapURLForResult(a2);
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLOverrideForURL:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v8, "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __129__NSMutableAttributedString_DataDetectorsSupport__dd_makeLinksForResultsInAttributesOfType_usingURLificationBlock_context_range___block_invoke_2_cold_1(void *a1)
{
  void *v2;
  uint64_t v3;
  __int16 v4;
  uint8_t v5[14];
  uint64_t v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "matchedString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_2();
  v6 = v3;
  v7 = v4;
  v8 = a1;
  _os_log_debug_impl(&dword_19EFBB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Date/time result(s) haven't been registered before for being shown (in cache %p). Will log Display event for result '%@': %@ #DDUINLEventMetrics", v5, 0x20u);

  OUTLINED_FUNCTION_0_1();
}

@end
