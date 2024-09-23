@implementation PKTextInputDebugLogEntry

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;
  NSRange v24;

  -[PKTextInputDebugLogEntry inputDrawing](self, "inputDrawing");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "strokes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 == 1)
  {
    v6 = CFSTR("1 stroke");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld strokes"), v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  -[PKTextInputDebugLogEntry resultTopTranscription](self, "resultTopTranscription");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (__CFString *)v7;
  else
    v9 = &stru_1E777DEE8;
  v10 = v9;

  -[PKTextInputDebugLogEntry resultCommittedText](self, "resultCommittedText");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (__CFString *)v11;
  else
    v13 = &stru_1E777DEE8;
  v14 = v13;

  if (-[PKTextInputDebugLogEntry resultAffectedRange](self, "resultAffectedRange") == 0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = CFSTR("N/A");
  }
  else
  {
    v24.location = -[PKTextInputDebugLogEntry resultAffectedRange](self, "resultAffectedRange");
    NSStringFromRange(v24);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v23.receiver = self;
  v23.super_class = (Class)PKTextInputDebugLogEntry;
  -[PKTextInputDebugLogEntry description](&v23, sel_description);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugLogEntry inputTargetContentInfo](self, "inputTargetContentInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "textInputTarget");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "inputTargetIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugLogEntry resultTypeDescription](self, "resultTypeDescription");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringByAppendingFormat:", CFSTR(" drawing: %@, targetID: %@, resultType: %@, affectedRange: %@, transcription: \"%@\", committedText: \"%@\"), v6, v19, v20, v15, v10, v14);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)minimalDescription
{
  void *v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  __CFString *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  NSRange v15;

  -[PKTextInputDebugLogEntry inputDrawing](self, "inputDrawing");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "strokes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 == 1)
  {
    v6 = CFSTR("1 stroke");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld strokes"), v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (-[PKTextInputDebugLogEntry resultAffectedRange](self, "resultAffectedRange") == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = CFSTR("(No range)");
  }
  else
  {
    v15.location = -[PKTextInputDebugLogEntry resultAffectedRange](self, "resultAffectedRange");
    NSStringFromRange(v15);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (-[PKTextInputDebugLogEntry resultType](self, "resultType") == 1)
  {
    -[PKTextInputDebugLogEntry resultTopTranscription](self, "resultTopTranscription");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = &stru_1E777DEE8;
    if (v8)
      v10 = (__CFString *)v8;
    v11 = v10;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Text: \"%@\"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[PKTextInputDebugLogEntry resultTypeDescription](self, "resultTypeDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@, %@, %@"), v6, v7, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (int64_t)resultType
{
  id v2;
  int64_t v3;

  -[PKTextInputDebugLogEntry resultTypeDescription](self, "resultTypeDescription");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("None")) & 1) != 0)
  {
    v3 = 0;
  }
  else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("Text")) & 1) != 0)
  {
    v3 = 1;
  }
  else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("Dot")) & 1) != 0)
  {
    v3 = 2;
  }
  else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("Line")) & 1) != 0)
  {
    v3 = 3;
  }
  else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("Encircle")) & 1) != 0)
  {
    v3 = 4;
  }
  else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("Polygon")) & 1) != 0)
  {
    v3 = 5;
  }
  else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("Scribble")) & 1) != 0)
  {
    v3 = 6;
  }
  else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("SplitJoin")) & 1) != 0)
  {
    v3 = 7;
  }
  else if (objc_msgSend(v2, "isEqualToString:", CFSTR("InsertionCaret")))
  {
    v3 = 8;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)mediumDescription
{
  void *v2;
  void *v3;

  -[PKTextInputDebugLogEntry dictionaryRepresentationWithDetailLevel:targetContentLevel:](self, "dictionaryRepresentationWithDetailLevel:targetContentLevel:", 0, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)mediumDescriptionForResultQueryItem:(id)a3
{
  void *v3;
  void *v4;

  +[PKTextInputDebugLogEntry _mutableDictionaryRepresentationForResultQueryItem:detailLevel:](PKTextInputDebugRecordingLogEntry, "_mutableDictionaryRepresentationForResultQueryItem:detailLevel:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)referenceSubstringWithTargetContentLevel:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[PKTextInputDebugLogEntry inputTargetContentInfo](self, "inputTargetContentInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PKTextInputDebugLogEntry resultAffectedRange](self, "resultAffectedRange");
  v8 = v7;
  v9 = (void *)objc_opt_class();
  -[PKTextInputDebugLogEntry recognitionLocaleIdentifiers](self, "recognitionLocaleIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_referenceSubstringForTargetContentInfo:resultAffectedRange:targetContentLevel:localeIdentifier:", v5, v6, v8, a3, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)_referenceSubstringForTargetContentInfo:(id)a3 resultAffectedRange:(_NSRange)a4 targetContentLevel:(int64_t)a5 localeIdentifier:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  NSUInteger v18;
  uint64_t v19;
  __CFString *v20;
  uint64_t v21;
  __CFString *v22;
  uint64_t v24;
  uint64_t v25;

  length = a4.length;
  location = a4.location;
  v11 = a3;
  v12 = a6;
  objc_msgSend(v11, "referenceSubstring");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (a5 == 2)
  {
    v20 = v13;
  }
  else
  {
    if (a5 == 1)
    {
      v21 = 0x7FFFFFFFFFFFFFFFLL;
      if (location == 0x7FFFFFFFFFFFFFFFLL
        || objc_msgSend(v11, "referenceSubstringRange") == 0x7FFFFFFFFFFFFFFFLL
        || location < objc_msgSend(v11, "referenceSubstringRange"))
      {
        length = 0;
      }
      else
      {
        v24 = objc_msgSend(v11, "referenceSubstringRange");
        if (location + length <= v24 + v25)
        {
          v21 = location - objc_msgSend(v11, "referenceSubstringRange");
        }
        else
        {
          length = 0;
          v21 = 0x7FFFFFFFFFFFFFFFLL;
        }
      }
      v15 = a1;
      v16 = v14;
      v17 = v21;
      v18 = length;
      v19 = 10;
    }
    else
    {
      if (a5)
      {
        v22 = &stru_1E777DEE8;
        goto LABEL_14;
      }
      v15 = a1;
      v16 = v14;
      v17 = 0x7FFFFFFFFFFFFFFFLL;
      v18 = 0;
      v19 = 0;
    }
    objc_msgSend(v15, "_minimalReferenceString:rangeOfInterest:tokenSearchDistance:localeIdentifier:", v16, v17, v18, v19, v12);
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v22 = v20;
LABEL_14:

  return v22;
}

- (id)dictionaryRepresentationWithTargetContentLevel:(int64_t)a3
{
  return -[PKTextInputDebugLogEntry dictionaryRepresentationWithDetailLevel:targetContentLevel:](self, "dictionaryRepresentationWithDetailLevel:targetContentLevel:", 1, a3);
}

- (id)dictionaryRepresentationWithDetailLevel:(int64_t)a3 targetContentLevel:(int64_t)a4
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)_mutableDictionaryRepresentationForResultQueryItem:(id)a3 detailLevel:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  __CFString *v37;
  uint64_t v38;
  void *v39;
  __CFString *v40;
  __CFString *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  __CFString *v46;
  uint64_t v47;
  unint64_t v48;
  __CFString *v49;
  __CFString *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  NSObject *v58;
  int64_t v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  id v68;
  _QWORD v69[4];
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint8_t buf[4];
  id v76;
  _QWORD v77[4];
  _QWORD v78[4];
  _BYTE v79[128];
  uint64_t v80;
  NSRange v81;

  v80 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "correctionResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("itemIdentifier"));

  objc_msgSend(v5, "itemStableIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("itemStableIdentifier"));

  if (v7)
  {
    objc_msgSend(v7, "inputTarget");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "inputTargetIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("inputTargetIdentifier"));

    v81.location = objc_msgSend(v7, "affectedRange");
    NSStringFromRange(v81);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("affectedRange"));

    v14 = objc_msgSend(v7, "resultType");
    v15 = &stru_1E777DEE8;
    if (v14 <= 8)
      v15 = off_1E777DC50[v14];
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, CFSTR("resultType"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "isCharacterLevel"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, CFSTR("isCharacterLevel"));

    objc_msgSend(v8, "recognizerDebugDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, CFSTR("recognizerInfo"));

    objc_msgSend(v7, "error");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v7, "error");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v20, CFSTR("error"));

    }
    if (v8)
    {
      v60 = a4;
      v61 = v7;
      v62 = v5;
      objc_msgSend(v8, "topTranscription");
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)v21;
      if (v21)
        v23 = (const __CFString *)v21;
      else
        v23 = &stru_1E777DEE8;
      v63 = v6;
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v23, CFSTR("topTranscription"));

      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "tokenColumnCount"));
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "transcriptionPaths");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "firstObject");
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v8, "tokenColumnCount") >= 1)
      {
        v25 = 0;
        v26 = 0x1E0CB3000uLL;
        do
        {
          v27 = v8;
          objc_msgSend(v8, "tokenRowsAtColumnIndex:", v25);
          v66 = v25;
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "objectAtIndexedSubscript:", objc_msgSend(v64, "indexAtPosition:", v25));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v26 + 1952), "string");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = 0u;
          v72 = 0u;
          v73 = 0u;
          v74 = 0u;
          v30 = v28;
          v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
          if (v31)
          {
            v32 = v31;
            v33 = 0;
            v34 = *(_QWORD *)v72;
            do
            {
              for (i = 0; i != v32; ++i)
              {
                if (*(_QWORD *)v72 != v34)
                  objc_enumerationMutation(v30);
                v36 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
                if (v33 + i < 1)
                {
                  v37 = &stru_1E777DEE8;
                }
                else
                {
                  objc_msgSend(v27, "precedingSeparatorForToken:", *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * i));
                  v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
                }
                objc_msgSend(v36, "string");
                v38 = objc_claimAutoreleasedReturnValue();
                v39 = (void *)v38;
                if (v38)
                  v40 = (__CFString *)v38;
                else
                  v40 = &stru_1E777DEE8;
                v41 = v40;

                objc_msgSend(v29, "appendFormat:", CFSTR("%@%@"), v37, v41);
              }
              v33 += v32;
              v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
            }
            while (v32);
          }

          v42 = objc_msgSend(v67, "count") - 1;
          objc_msgSend(v30, "firstObject");
          v43 = objc_claimAutoreleasedReturnValue();
          if (v43)
          {
            v8 = v27;
            v44 = v27;
            v45 = (void *)v43;
            objc_msgSend(v44, "precedingSeparatorForToken:", v43);
            v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v47 = v66;
            v48 = 0x1E0CB3000;
          }
          else
          {
            v46 = 0;
            v8 = v27;
            v47 = v66;
            v48 = 0x1E0CB3000uLL;
            v45 = 0;
          }
          v49 = &stru_1E777DEE8;
          if (v46)
            v49 = v46;
          v50 = v49;

          objc_msgSend(v8, "strokeIndexesForColumnsInRange:", v47, 1);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v48 + 1952), "string");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v69[0] = MEMORY[0x1E0C809B0];
          v69[1] = 3221225472;
          v69[2] = __91__PKTextInputDebugLogEntry__mutableDictionaryRepresentationForResultQueryItem_detailLevel___block_invoke;
          v69[3] = &unk_1E777DC30;
          v70 = v52;
          v53 = v52;
          objc_msgSend(v51, "enumerateRangesUsingBlock:", v69);
          v78[0] = v29;
          v77[0] = CFSTR("topTranscription");
          v77[1] = CFSTR("candidatesCount");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v42);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v78[1] = v54;
          v78[2] = v50;
          v77[2] = CFSTR("precedingSeparator");
          v77[3] = CFSTR("strokeIndexes");
          v78[3] = v53;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v78, v77, 4);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "addObject:", v55);

          v26 = 0x1E0CB3000;
          v25 = v47 + 1;
        }
        while (v25 < objc_msgSend(v8, "tokenColumnCount"));
      }
      v6 = v63;
      objc_msgSend(v63, "setObject:forKeyedSubscript:", v65, CFSTR("tokenColumns"));
      v7 = v61;
      v5 = v62;
      if (v60 == 1)
      {
        v68 = 0;
        objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, &v68);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = v68;
        if (v56)
        {
          objc_msgSend(v63, "setObject:forKeyedSubscript:", v56, CFSTR("tokenizedTextResultData"));
        }
        else
        {
          v58 = os_log_create("com.apple.pencilkit", "PencilTextInput");
          if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v76 = v57;
            _os_log_error_impl(&dword_1BE213000, v58, OS_LOG_TYPE_ERROR, "Error archiving CHTokenizedTextResult: %@", buf, 0xCu);
          }

        }
      }

    }
  }

  return v6;
}

void __91__PKTextInputDebugLogEntry__mutableDictionaryRepresentationForResultQueryItem_detailLevel___block_invoke(uint64_t a1, NSUInteger a2, NSUInteger a3)
{
  void *v6;
  id v7;
  NSRange v8;

  if (objc_msgSend(*(id *)(a1 + 32), "length"))
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(", "));
  v6 = *(void **)(a1 + 32);
  v8.location = a2;
  v8.length = a3;
  NSStringFromRange(v8);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("%@"), v7);

}

+ (id)loggedDateFormatter
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTimeZone:", v4);

  objc_msgSend(v2, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss.SSS Z"));
  return v2;
}

+ (id)_minimalReferenceString:(id)a3 rangeOfInterest:(_NSRange)a4 tokenSearchDistance:(int64_t)a5 localeIdentifier:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  __CFString *v10;
  id v11;
  const __CFLocale *v12;
  uint64_t v13;
  CFIndex v14;
  unint64_t v15;
  uint64_t v16;
  CFIndex v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  __CFStringTokenizer *v21;
  CFRange CurrentTokenRange;
  NSRange v23;
  CFRange v24;
  NSRange v25;
  uint64_t v26;
  __CFString *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  NSRange v33;
  NSRange v34;
  CFRange v35;

  length = a4.length;
  location = a4.location;
  v10 = (__CFString *)a3;
  v11 = a6;
  if (location == 0x7FFFFFFFFFFFFFFFLL || !-[__CFString length](v10, "length"))
  {
    objc_msgSend(&stru_1E777DEE8, "stringByPaddingToLength:withString:startingAtIndex:", -[__CFString length](v10, "length"), CFSTR("_"), 0);
    v28 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v11, "length")
      || (objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v11),
          (v12 = (const __CFLocale *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v12 = (const __CFLocale *)objc_claimAutoreleasedReturnValue();
    }
    v13 = location - a5;
    v14 = (location - a5) & ~((uint64_t)(location - a5) >> 63);
    v15 = location + length + a5;
    v16 = -[__CFString length](v10, "length");
    if (v15 >= v16 - 1)
      v17 = v16 - 1;
    else
      v17 = v15;
    v18 = -[__CFString length](v10, "length");
    if (v17 + 10 >= v18)
      v19 = v18;
    else
      v19 = v17 + 10;
    v20 = 10;
    if (v13 > 10)
      v20 = v13;
    v35.location = v20 - 10;
    v35.length = v19 - (v20 - 10);
    v21 = CFStringTokenizerCreate(0, v10, v35, 4uLL, v12);
    if (CFStringTokenizerGoToTokenAtIndex(v21, v14))
    {
      CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v21);
      if (CurrentTokenRange.location != 0x7FFFFFFFFFFFFFFFLL)
      {
        v33.location = location;
        v33.length = length;
        v23 = NSUnionRange(v33, (NSRange)CurrentTokenRange);
        location = v23.location;
        length = v23.length;
      }
    }
    if (CFStringTokenizerGoToTokenAtIndex(v21, v17))
    {
      v24 = CFStringTokenizerGetCurrentTokenRange(v21);
      if (v24.location != 0x7FFFFFFFFFFFFFFFLL)
      {
        v34.location = location;
        v34.length = length;
        v25 = NSUnionRange(v34, (NSRange)v24);
        location = v25.location;
        length = v25.length;
      }
    }
    if (v21)
      CFRelease(v21);
    v26 = -[__CFString length](v10, "length");
    if (location == 0x7FFFFFFFFFFFFFFFLL || length + location > -[__CFString length](v10, "length"))
    {
      v27 = &stru_1E777DEE8;
    }
    else
    {
      -[__CFString substringWithRange:](v10, "substringWithRange:", location, length);
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v26 = location;
    }
    objc_msgSend(&stru_1E777DEE8, "stringByPaddingToLength:withString:startingAtIndex:", v26, CFSTR("_"), 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringByAppendingString:", v27);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v30, "stringByPaddingToLength:withString:startingAtIndex:", -[__CFString length](v10, "length"), CFSTR("_"), 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = v31;
  }

  return v28;
}

- (NSDate)entryDate
{
  return self->_entryDate;
}

- (void)setEntryDate:(id)a3
{
  objc_storeStrong((id *)&self->_entryDate, a3);
}

- (NSArray)recognitionLocaleIdentifiers
{
  return self->_recognitionLocaleIdentifiers;
}

- (void)setRecognitionLocaleIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (PKDrawing)inputDrawing
{
  return self->_inputDrawing;
}

- (void)setInputDrawing:(id)a3
{
  objc_storeStrong((id *)&self->_inputDrawing, a3);
}

- (BOOL)inputContainsInProgressStroke
{
  return self->_inputContainsInProgressStroke;
}

- (void)setInputContainsInProgressStroke:(BOOL)a3
{
  self->_inputContainsInProgressStroke = a3;
}

- (NSArray)inputTargets
{
  return self->_inputTargets;
}

- (void)setInputTargets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (CHTextInputTargetContentInfo)inputTargetContentInfo
{
  return self->_inputTargetContentInfo;
}

- (void)setInputTargetContentInfo:(id)a3
{
  objc_storeStrong((id *)&self->_inputTargetContentInfo, a3);
}

- (NSString)inputTargetElementType
{
  return self->_inputTargetElementType;
}

- (void)setInputTargetElementType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (CHTokenizedTextResult)tokenizedTextResult
{
  return self->_tokenizedTextResult;
}

- (void)setTokenizedTextResult:(id)a3
{
  objc_storeStrong((id *)&self->_tokenizedTextResult, a3);
}

- (NSString)resultCommittedText
{
  return self->_resultCommittedText;
}

- (void)setResultCommittedText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)resultTopTranscription
{
  return self->_resultTopTranscription;
}

- (void)setResultTopTranscription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (int64_t)resultCommittedTokenColumnCount
{
  return self->_resultCommittedTokenColumnCount;
}

- (void)setResultCommittedTokenColumnCount:(int64_t)a3
{
  self->_resultCommittedTokenColumnCount = a3;
}

- (_NSRange)resultAffectedRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_resultAffectedRange.length;
  location = self->_resultAffectedRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setResultAffectedRange:(_NSRange)a3
{
  self->_resultAffectedRange = a3;
}

- (NSString)resultTypeDescription
{
  return self->_resultTypeDescription;
}

- (void)setResultTypeDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)resultCommitReason
{
  return self->_resultCommitReason;
}

- (void)setResultCommitReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (double)resultRecognitionDuration
{
  return self->_resultRecognitionDuration;
}

- (void)setResultRecognitionDuration:(double)a3
{
  self->_resultRecognitionDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultCommitReason, 0);
  objc_storeStrong((id *)&self->_resultTypeDescription, 0);
  objc_storeStrong((id *)&self->_resultTopTranscription, 0);
  objc_storeStrong((id *)&self->_resultCommittedText, 0);
  objc_storeStrong((id *)&self->_tokenizedTextResult, 0);
  objc_storeStrong((id *)&self->_inputTargetElementType, 0);
  objc_storeStrong((id *)&self->_inputTargetContentInfo, 0);
  objc_storeStrong((id *)&self->_inputTargets, 0);
  objc_storeStrong((id *)&self->_recognitionLocaleIdentifiers, 0);
  objc_storeStrong((id *)&self->_entryDate, 0);
  objc_storeStrong((id *)&self->_inputDrawing, 0);
}

@end
