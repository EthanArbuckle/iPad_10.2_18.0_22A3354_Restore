@implementation NSMutableAttributedString(DataDetectorsSupport)

- (uint64_t)dd_urlifyResult:()DataDetectorsSupport withBlock:referenceDate:context:
{
  id v10;
  void (**v11)(_QWORD);
  id v12;
  id v13;
  NSUInteger RangeForURLification;
  NSUInteger v15;
  NSUInteger v16;
  void *v17;
  NSUInteger v18;
  NSRange v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  int v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  _BOOL4 v31;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  _QWORD v38[6];
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;
  _QWORD v43[2];
  _QWORD v44[4];
  NSRange v45;
  NSRange v46;
  NSRange v47;

  v44[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v10, "coreResult");
  RangeForURLification = DDResultGetRangeForURLification();
  v16 = v15;
  objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(a1, "length");
  v45.location = RangeForURLification;
  v45.length = v16;
  v47.location = 0;
  v47.length = v18;
  v19 = NSIntersectionRange(v45, v47);
  if (v19.location == RangeForURLification && v19.length == v16)
  {
    v39 = 0;
    v40 = &v39;
    v41 = 0x2020000000;
    v42 = 0;
    v20 = *MEMORY[0x1E0CEA0C0];
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __99__NSMutableAttributedString_DataDetectorsSupport__dd_urlifyResult_withBlock_referenceDate_context___block_invoke;
    v38[3] = &unk_1E4258D10;
    v38[4] = a1;
    v38[5] = &v39;
    objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v20, RangeForURLification, v16, 0, v38);
    if (*((_BYTE *)v40 + 24))
    {
      v21 = 0;
LABEL_29:
      _Block_object_dispose(&v39, 8);
      goto LABEL_30;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%lu"), CFSTR("embedded-result"), RangeForURLification);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v10, "coreResult");
    v11[2](v11);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "dd_URLWithPotentiallyInvalidURLString:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
      v24 = v23;
      if (v23 && (dd_urlLooksSuspicious(v23) & 1) == 0)
      {
        if (DDShouldUseLightLinksForResult())
        {
          v25 = *MEMORY[0x1E0CEA178];
          v44[0] = *MEMORY[0x1E0CEA180];
          v44[1] = v25;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 2);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "bundleIdentifier");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v33, "isEqualToString:", CFSTR("com.apple.mobilenotes"));
          v28 = v33;
          if (v27)
          {
            v29 = *MEMORY[0x1E0CEA178];
            v43[0] = *MEMORY[0x1E0CEA0A0];
            v43[1] = v29;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
            v30 = objc_claimAutoreleasedReturnValue();
            v28 = v33;
            v36 = (void *)v30;
          }
          else
          {
            v36 = 0;
          }

        }
        objc_msgSend(a1, "dd_appendUrl:context:range:backedAttributes:", v24, v13, RangeForURLification, v16, v36);

        v21 = 1;
        goto LABEL_28;
      }
LABEL_24:
      v21 = 0;
LABEL_28:

      goto LABEL_29;
    }
    if (DDResultHasType())
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("IncludeMoney"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v26, "BOOLValue"))
      {

        goto LABEL_20;
      }
      v31 = +[DDConversionAction actionAvailableForResult:](DDConversionAction, "actionAvailableForResult:", v35);

      if (v31)
      {
LABEL_20:
        DDInternalURLStringForResultIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_10;
        }
LABEL_23:
        v24 = 0;
        goto LABEL_24;
      }
    }
    v22 = 0;
    goto LABEL_23;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v46.location = RangeForURLification;
    v46.length = v16;
    -[NSMutableAttributedString(DataDetectorsSupport) dd_urlifyResult:withBlock:referenceDate:context:].cold.1((int)v10, v46, 0, v18);
  }
  v21 = 0;
LABEL_30:

  return v21;
}

- (void)dd_makeLinksForResultsInAttributesOfType:()DataDetectorsSupport usingURLificationBlock:context:range:
{
  id v11;
  void *v12;
  _BOOL4 v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  _BOOL4 v26;
  NSObject *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  NSObject *v34;
  id v35;
  _QWORD v36[5];
  NSObject *v37;
  id v38;
  id v39;
  uint64_t *v40;
  BOOL v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  char v48[32];
  uint64_t v49;
  NSRange v50;

  v49 = *MEMORY[0x1E0C80C00];
  v35 = a4;
  v11 = a5;
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("CoreSpotlightUniqueIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    v13 = DDTrackEventCreationInHostApplication(0);
  else
    v13 = 0;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__4;
  v46 = __Block_byref_object_dispose__4;
  v47 = 0;
  if (a6 != 0x7FFFFFFFFFFFFFFFLL && a7)
  {
    v14 = objc_msgSend(a1, "length");
    v15 = v14;
    if (a6 > v14 || a6 + a7 > v14)
    {
      v27 = MEMORY[0x1E0C81028];
      v28 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v50.location = a6;
        v50.length = a7;
        NSStringFromRange(v50);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableAttributedString(DataDetectorsSupport) dd_makeLinksForResultsInAttributesOfType:usingURLificationBlock:context:range:].cold.1(v29, (uint64_t)v48, v15);
      }
    }
    else
    {
      objc_msgSend(v11, "objectForKey:", CFSTR("ReferenceDate"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *MEMORY[0x1E0D1CC00];
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __129__NSMutableAttributedString_DataDetectorsSupport__dd_makeLinksForResultsInAttributesOfType_usingURLificationBlock_context_range___block_invoke;
      v36[3] = &unk_1E4258D60;
      v36[4] = a1;
      v39 = v35;
      v34 = v16;
      v37 = v34;
      v18 = v11;
      v41 = v13;
      v38 = v18;
      v40 = &v42;
      objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v17, a6, a7, 0, v36);
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("CustomActionRanges"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v20 = objc_msgSend(v19, "count");
          if (v20)
          {
            for (i = 0; i != v20; ++i)
            {
              objc_msgSend(v19, "objectAtIndexedSubscript:", i, v34);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v24 = objc_msgSend(v22, "rangeValue");
                if (v24 != 0x7FFFFFFFFFFFFFFFLL)
                {
                  if (v23)
                    objc_msgSend(a1, "dd_urlifyClientRange:index:context:", v24, v23, i, v18);
                }
              }

            }
          }
        }
      }
      if (v13)
      {
        objc_msgSend((id)dd_makeLinksForResultsInAttributesOfType_usingURLificationBlock_context_range___trackedCoreSpotlightUniqueIdentifiersCache, "objectForKey:", v12);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v25 == 0;

        if (v26)
        {
          objc_msgSend((id)v43[5], "enumerateObjectsUsingBlock:", &__block_literal_global_10);
          v30 = (void *)dd_makeLinksForResultsInAttributesOfType_usingURLificationBlock_context_range___trackedCoreSpotlightUniqueIdentifiersCache;
          if (!dd_makeLinksForResultsInAttributesOfType_usingURLificationBlock_context_range___trackedCoreSpotlightUniqueIdentifiersCache)
          {
            v31 = objc_alloc_init(MEMORY[0x1E0C99D38]);
            v32 = (void *)dd_makeLinksForResultsInAttributesOfType_usingURLificationBlock_context_range___trackedCoreSpotlightUniqueIdentifiersCache;
            dd_makeLinksForResultsInAttributesOfType_usingURLificationBlock_context_range___trackedCoreSpotlightUniqueIdentifiersCache = (uint64_t)v31;

            v30 = (void *)dd_makeLinksForResultsInAttributesOfType_usingURLificationBlock_context_range___trackedCoreSpotlightUniqueIdentifiersCache;
          }
          objc_msgSend(MEMORY[0x1E0C99E38], "null", v34);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setObject:forKey:", v33, v12);

        }
        else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          -[NSMutableAttributedString(DataDetectorsSupport) dd_makeLinksForResultsInAttributesOfType:usingURLificationBlock:context:range:].cold.2();
        }
      }

      v27 = v34;
    }

  }
  _Block_object_dispose(&v42, 8);

}

- (void)dd_makeLinksForResultsInAttributesOfType:()DataDetectorsSupport context:range:
{
  id v10;
  void *v11;

  v10 = a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    -[NSMutableAttributedString(DataDetectorsSupport) dd_makeLinksForResultsInAttributesOfType:context:].cold.1();
  +[DDOperation urlificationBlockForTypes:](DDOperation, "urlificationBlockForTypes:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dd_makeLinksForResultsInAttributesOfType:usingURLificationBlock:context:range:", a3, v11, v10, a5, a6);

}

- (void)dd_appendUrl:()DataDetectorsSupport context:range:backedAttributes:
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  void *v21;

  v16 = a3;
  v12 = a4;
  v13 = a7;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", v16, *MEMORY[0x1E0CEA0C0]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v12)
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v12, CFSTR("DDContext"));
  objc_msgSend(a1, "addAttributes:range:", v15, a5, a6, v16);
  if (objc_msgSend(v13, "count"))
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __95__NSMutableAttributedString_DataDetectorsSupport__dd_appendUrl_context_range_backedAttributes___block_invoke;
    v18[3] = &unk_1E4258CE8;
    v19 = v17;
    v20 = v13;
    v21 = a1;
    objc_msgSend(a1, "enumerateAttributesInRange:options:usingBlock:", a5, a6, 0, v18);

  }
}

- (uint64_t)dd_resetResults
{
  return objc_msgSend(a1, "dd_resetResults:", 0);
}

- (void)dd_resetResults:()DataDetectorsSupport
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[4];
  id v20;
  id v21;
  void *v22;
  uint64_t *v23;
  char v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v5 = objc_msgSend(a1, "length");
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 8);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __67__NSMutableAttributedString_DataDetectorsSupport__dd_resetResults___block_invoke;
  v19[3] = &unk_1E4258C98;
  v8 = v6;
  v20 = v8;
  v9 = v7;
  v24 = a3;
  v22 = a1;
  v23 = &v25;
  v21 = v9;
  objc_msgSend(a1, "enumerateAttributesInRange:options:usingBlock:", 0, v5, 0, v19);
  if ((a3 & 1) == 0)
  {
    v14 = v9;
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    dd_transientAttributesSet();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v29, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v10);
          objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:");
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v29, 16);
      }
      while (v11);
    }

    v9 = v14;
  }
  if (*((_BYTE *)v26 + 24))
    objc_msgSend(a1, "endEditing");

  _Block_object_dispose(&v25, 8);
}

- (BOOL)dd_urlifyClientRange:()DataDetectorsSupport index:context:
{
  id v10;
  NSUInteger v11;
  NSRange v12;
  uint64_t v13;
  _BOOL8 v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  _QWORD v26[3];
  NSRange v27;
  NSRange v28;
  NSRange v29;

  v26[2] = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v11 = objc_msgSend(a1, "length");
  v27.location = a3;
  v27.length = a4;
  v29.location = 0;
  v29.length = v11;
  v12 = NSIntersectionRange(v27, v29);
  if (v12.location == a3 && v12.length == a4)
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x2020000000;
    v25 = 0;
    v13 = *MEMORY[0x1E0CEA0C0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __86__NSMutableAttributedString_DataDetectorsSupport__dd_urlifyClientRange_index_context___block_invoke;
    v21[3] = &unk_1E4258D38;
    v21[4] = &v22;
    objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v13, a3, a4, 0, v21);
    v14 = *((_BYTE *)v23 + 24) == 0;
    if (!*((_BYTE *)v23 + 24))
    {
      v15 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%lu"), CFSTR("x-apple-data-detectors-clientdefined"), a5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "URLWithString:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = *MEMORY[0x1E0CEA178];
      v26[0] = *MEMORY[0x1E0CEA180];
      v26[1] = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "dd_appendUrl:context:range:backedAttributes:", v17, v10, a3, a4, v19);

    }
    _Block_object_dispose(&v22, 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v28.location = a3;
      v28.length = a4;
      -[NSMutableAttributedString(DataDetectorsSupport) dd_urlifyClientRange:index:context:].cold.1(v28, 0, v11);
    }
    v14 = 0;
  }

  return v14;
}

- (void)dd_makeLinksForResultsInAttributesOfType:()DataDetectorsSupport context:
{
  id v6;
  void *v7;

  v6 = a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    -[NSMutableAttributedString(DataDetectorsSupport) dd_makeLinksForResultsInAttributesOfType:context:].cold.1();
  +[DDOperation urlificationBlockForTypes:](DDOperation, "urlificationBlockForTypes:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dd_makeLinksForResultsInAttributesOfType:usingURLificationBlock:context:range:", a3, v7, v6, 0, objc_msgSend(a1, "length"));

}

- (void)dd_replaceResultAttributesWithSimpleLinksForTypes:()DataDetectorsSupport context:
{
  id v6;
  _QWORD v7[5];

  v6 = a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    -[NSMutableAttributedString(DataDetectorsSupport) dd_replaceResultAttributesWithSimpleLinksForTypes:context:].cold.1();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __109__NSMutableAttributedString_DataDetectorsSupport__dd_replaceResultAttributesWithSimpleLinksForTypes_context___block_invoke;
  v7[3] = &__block_descriptor_40_e229___NSString_40__0____DDResult____CFRuntimeBase_QAQ____DDQueryRange____DDQueryOffset_b16b16b32____DDQueryOffset_b16b16b32_____qq_q____CFArray_____CFString_____CFString__v____CFDictionary_qCf_8__NSString_16__NSDate_24__NSTimeZone_32l;
  v7[4] = a3;
  objc_msgSend(a1, "dd_makeLinksForResultsInAttributesOfType:usingURLificationBlock:context:range:", a3, v7, v6, 0, objc_msgSend(a1, "length"));
  objc_msgSend(a1, "removeAttribute:range:", *MEMORY[0x1E0D1CC00], 0, objc_msgSend(a1, "length"));

}

- (void)dd_urlifyResult:()DataDetectorsSupport withBlock:referenceDate:context:.cold.1(int a1, NSRange range, NSUInteger a3, NSUInteger a4)
{
  void *v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint8_t v10[14];
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;
  NSRange v15;

  v14 = *MEMORY[0x1E0C80C00];
  NSStringFromRange(range);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15.location = a3;
  v15.length = a4;
  NSStringFromRange(v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_2();
  v11 = v6;
  v12 = v8;
  v13 = v9;
  _os_log_error_impl(&dword_19EFBB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Bad result %@: its range %@ is not completely included in the range %@ of the string it is attached to", v10, 0x20u);

  OUTLINED_FUNCTION_0_1();
}

- (void)dd_urlifyClientRange:()DataDetectorsSupport index:context:.cold.1(NSRange a1, NSUInteger a2, NSUInteger a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;
  NSRange v13;

  v12 = *MEMORY[0x1E0C80C00];
  NSStringFromRange(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13.location = a2;
  v13.length = a3;
  NSStringFromRange(v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = v5;
  v10 = 2112;
  v11 = v6;
  OUTLINED_FUNCTION_4_2(&dword_19EFBB000, MEMORY[0x1E0C81028], v7, "Bad custom client range %@ not completely included in the range %@ of the string it is attached to", (uint8_t *)&v8);

}

- (void)dd_makeLinksForResultsInAttributesOfType:()DataDetectorsSupport usingURLificationBlock:context:range:.cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a2 = 138412546;
  *(_QWORD *)(a2 + 4) = a1;
  *(_WORD *)(a2 + 12) = 2048;
  *(_QWORD *)(a2 + 14) = a3;
  OUTLINED_FUNCTION_4_2(&dword_19EFBB000, MEMORY[0x1E0C81028], a3, "dd_makeLinksForResults called with an invalid range %@ (self length = %lu))", (uint8_t *)a2);

}

- (void)dd_makeLinksForResultsInAttributesOfType:()DataDetectorsSupport usingURLificationBlock:context:range:.cold.2()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 134217984;
  v1 = dd_makeLinksForResultsInAttributesOfType_usingURLificationBlock_context_range___trackedCoreSpotlightUniqueIdentifiersCache;
  _os_log_debug_impl(&dword_19EFBB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Date/time result has been shown before (registered in cache %p). Skipping logging the Display event. #DDUINLEventMetrics", (uint8_t *)&v0, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)dd_makeLinksForResultsInAttributesOfType:()DataDetectorsSupport context:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_0(&dword_19EFBB000, MEMORY[0x1E0C81028], v0, "Making links for results in %p with context %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

- (void)dd_replaceResultAttributesWithSimpleLinksForTypes:()DataDetectorsSupport context:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_0(&dword_19EFBB000, MEMORY[0x1E0C81028], v0, "Making shareable links for results in %p with context %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

@end
