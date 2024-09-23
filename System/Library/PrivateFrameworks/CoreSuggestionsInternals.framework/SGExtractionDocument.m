@implementation SGExtractionDocument

- (SGExtractionDocument)initWithEnrichedTaggedCharacterRanges:(id)a3 modelOutput:(id)a4
{
  id v7;
  id v8;
  SGExtractionDocument *v9;
  SGExtractionDocument *v10;
  uint64_t v11;
  NSDictionary *indexSetForOutputNameLabel;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SGExtractionDocument;
  v9 = -[SGExtractionDocument init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_enrichedTaggedCharacterRanges, a3);
    objc_storeStrong((id *)&v10->_modelOutput, a4);
    objc_msgSend((id)objc_opt_class(), "indexSetForOutputNameLabelForModelOutput:", v10->_modelOutput);
    v11 = objc_claimAutoreleasedReturnValue();
    indexSetForOutputNameLabel = v10->_indexSetForOutputNameLabel;
    v10->_indexSetForOutputNameLabel = (NSDictionary *)v11;

  }
  return v10;
}

- (id)labelTokenIndexesForOutputName:(id)a3 label:(id)a4
{
  NSDictionary *indexSetForOutputNameLabel;
  id v6;
  id v7;
  void *v8;
  void *v9;

  indexSetForOutputNameLabel = self->_indexSetForOutputNameLabel;
  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "keyForOutputName:label:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSDictionary objectForKeyedSubscript:](indexSetForOutputNameLabel, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)candidatesForLabelTokenIndexes:(id)a3 inPlainText:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  -[SGExtractionDocument enrichedTaggedCharacterRanges](self, "enrichedTaggedCharacterRanges");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend((id)objc_opt_class(), "candidatesForLabelTokenIndexes:inPlainText:forTaggedCharacterRanges:", v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v9;
}

- (id)detectedDateComponentsForTokenIndexes:(id)a3 dataDetectorMatches:(id)a4 allowDatesInPast:(BOOL)a5 inferDates:(BOOL)a6 approximateTime:(BOOL)a7 partialDate:(BOOL)a8 allowTimeOffset:(BOOL)a9 useEndForDurations:(BOOL)a10
{
  _BOOL8 v10;
  _BOOL8 v11;
  _BOOL8 v12;
  _BOOL8 v13;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  id v30;
  id v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v10 = a8;
  v11 = a7;
  v12 = a6;
  v13 = a5;
  v38 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  -[SGExtractionDocument modelOutput](self, "modelOutput");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v30 = v17;
    v31 = v16;
    -[SGExtractionDocument dataDetectorMatchesForTokenIndexes:dataDetectorMatches:allowDatesInPast:allowTimeOffset:](self, "dataDetectorMatchesForTokenIndexes:dataDetectorMatches:allowDatesInPast:allowTimeOffset:", v16, v17, v13, a9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)objc_opt_new();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v29 = v19;
    objc_msgSend(v19, "first");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v34 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend((id)objc_opt_class(), "dateComponentsFromDataDetectorMatch:inferDates:approximateTime:partialDate:useEndForDurations:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i), v12, v11, v10, a10);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (v25)
            objc_msgSend(v32, "addObject:", v25);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v22);
    }

    v26 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(v32, "allObjects");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v26);

    v17 = v30;
    v16 = v31;
  }
  else
  {
    v27 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v27;
}

- (id)dataDetectorMatchesForTokenIndexes:(id)a3 dataDetectorMatches:(id)a4 allowDatesInPast:(BOOL)a5 allowTimeOffset:(BOOL)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v18[5];
  id v19;
  id v20;
  uint64_t *v21;
  BOOL v22;
  BOOL v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v10 = a3;
  v11 = a4;
  v12 = (void *)objc_opt_new();
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__33955;
  v28 = __Block_byref_object_dispose__33956;
  v29 = (id)MEMORY[0x1E0C9AAA0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __112__SGExtractionDocument_dataDetectorMatchesForTokenIndexes_dataDetectorMatches_allowDatesInPast_allowTimeOffset___block_invoke;
  v18[3] = &unk_1E7DB72E8;
  v18[4] = self;
  v13 = v11;
  v19 = v13;
  v22 = a6;
  v23 = a5;
  v14 = v12;
  v20 = v14;
  v21 = &v24;
  objc_msgSend(v10, "enumerateRangesUsingBlock:", v18);
  v15 = objc_alloc(MEMORY[0x1E0D81638]);
  v16 = (void *)objc_msgSend(v15, "initWithFirst:second:", v14, v25[5]);

  _Block_object_dispose(&v24, 8);
  return v16;
}

- (_NSRange)textRangeForTokenRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v5;
  uint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  _NSRange result;

  length = a3.length;
  location = a3.location;
  -[SGExtractionDocument enrichedTaggedCharacterRanges](self, "enrichedTaggedCharacterRanges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_msgSend((id)objc_opt_class(), "textRangeForIndexRange:inTaggedCharacterRanges:", location, length, v5);
    v8 = v7;
  }
  else
  {
    v6 = 0;
    v8 = 0;
  }

  v9 = v6;
  v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

- (id)detectedDateComponentsForTokenIndexes:(id)a3 dataDetectorMatches:(id)a4 allowDatesInPast:(BOOL)a5 inferDates:(BOOL)a6 approximateTime:(BOOL)a7 partialDate:(BOOL)a8 useEndForDurations:(BOOL)a9
{
  uint64_t v10;

  BYTE1(v10) = a9;
  LOBYTE(v10) = 0;
  return -[SGExtractionDocument detectedDateComponentsForTokenIndexes:dataDetectorMatches:allowDatesInPast:inferDates:approximateTime:partialDate:allowTimeOffset:useEndForDurations:](self, "detectedDateComponentsForTokenIndexes:dataDetectorMatches:allowDatesInPast:inferDates:approximateTime:partialDate:allowTimeOffset:useEndForDurations:", a3, a4, a5, a6, a7, a8, v10);
}

- (NSArray)enrichedTaggedCharacterRanges
{
  return self->_enrichedTaggedCharacterRanges;
}

- (void)setEnrichedTaggedCharacterRanges:(id)a3
{
  objc_storeStrong((id *)&self->_enrichedTaggedCharacterRanges, a3);
}

- (NSDictionary)modelOutput
{
  return self->_modelOutput;
}

- (void)setModelOutput:(id)a3
{
  objc_storeStrong((id *)&self->_modelOutput, a3);
}

- (NSDictionary)indexSetForOutputNameLabel
{
  return self->_indexSetForOutputNameLabel;
}

- (void)setIndexSetForOutputNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_indexSetForOutputNameLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexSetForOutputNameLabel, 0);
  objc_storeStrong((id *)&self->_modelOutput, 0);
  objc_storeStrong((id *)&self->_enrichedTaggedCharacterRanges, 0);
}

void __112__SGExtractionDocument_dataDetectorMatchesForTokenIndexes_dataDetectorMatches_allowDatesInPast_allowTimeOffset___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  NSUInteger v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  double v20;
  uint64_t v21;
  void *v22;
  int v23;
  NSUInteger v24;
  NSUInteger v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;
  NSRange v32;
  NSRange v33;

  v3 = a1;
  v31 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(*(id *)(a1 + 32), "textRangeForTokenRange:", a2, a3);
  v24 = v5;
  v25 = v4;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v6 = *(id *)(v3 + 40);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x1C3BD4F6C]();
        if (objc_msgSend(v11, "matchType") == 3
          || *(_BYTE *)(v3 + 64) && objc_msgSend(v11, "matchType") == 8)
        {
          objc_msgSend(v11, "detectedDate");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13
            && (v33.location = objc_msgSend(v11, "range"),
                v33.length = v14,
                v32.length = v24,
                v32.location = v25,
                NSIntersectionRange(v32, v33).length))
          {
            v15 = v9;
            v16 = v3;
            v17 = v6;
            objc_msgSend(v11, "detectedDate");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99D68], "date");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "timeIntervalSinceDate:", v19);
            if (v20 > 0.0)
            {

              v6 = v17;
              v3 = v16;
              v9 = v15;
              goto LABEL_15;
            }
            v23 = *(unsigned __int8 *)(v16 + 65);

            v6 = v17;
            v3 = v16;
            v9 = v15;
            if (v23)
LABEL_15:
              objc_msgSend(*(id *)(v3 + 48), "addObject:", v11);
          }
          else
          {

          }
          if ((objc_msgSend(v11, "inferredDate") & 1) == 0)
          {
            v21 = *(_QWORD *)(*(_QWORD *)(v3 + 56) + 8);
            v22 = *(void **)(v21 + 40);
            *(_QWORD *)(v21 + 40) = MEMORY[0x1E0C9AAB0];

          }
        }
        objc_autoreleasePoolPop(v12);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v8);
  }

}

+ (id)keyForOutputName:(id)a3 label:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;

  v5 = (objc_class *)MEMORY[0x1E0CB3940];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithFormat:", CFSTR("%@_%@"), v7, v6);

  return v8;
}

+ (id)indexSetForOutputNameLabelForModelOutput:(id)a3
{
  id v4;
  void *v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  id obj;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(v4, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v22)
  {
    v21 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v24 != v21)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "count");

        if (v9)
        {
          v10 = 0;
          do
          {
            objc_msgSend(v4, "objectForKeyedSubscript:", v7);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "objectAtIndexedSubscript:", v10);
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            if ((objc_msgSend(CFSTR("NONE"), "isEqualToString:", v12) & 1) == 0)
            {
              objc_msgSend(a1, "keyForOutputName:label:", v7, v12);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "objectForKeyedSubscript:", v13);
              v14 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v14)
              {
                v15 = (void *)objc_opt_new();
                objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, v13);

              }
              objc_msgSend(v5, "objectForKeyedSubscript:", v13);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "addIndex:", v10);

            }
            ++v10;
            objc_msgSend(v4, "objectForKeyedSubscript:", v7);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "count");

          }
          while (v18 > v10);
        }
      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v22);
  }

  return v5;
}

+ (id)labelTokenIndexesForOutputName:(id)a3 label:(id)a4 modelOutput:(id)a5 maxMergeDistance:(unint64_t)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  id v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint8_t v24[16];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)objc_opt_new();
  if (v11)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "count"))
    {
      v14 = 0;
      v15 = a6 + 1;
      do
      {
        objc_msgSend(v13, "objectAtIndexedSubscript:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "isEqualToString:", v10))
        {
          if (a6
            && objc_msgSend(v12, "lastIndex") != 0x7FFFFFFFFFFFFFFFLL
            && v14 - objc_msgSend(v12, "lastIndex") >= 2
            && v14 - objc_msgSend(v12, "lastIndex") <= v15)
          {
            v17 = v9;
            v18 = v15;
            v19 = objc_msgSend(v12, "lastIndex");
            v20 = objc_msgSend(v12, "lastIndex");
            v21 = v19;
            v15 = v18;
            v9 = v17;
            objc_msgSend(v12, "addIndexesInRange:", v21, v14 - v20);
          }
          objc_msgSend(v12, "addIndex:", v14);
        }

        ++v14;
      }
      while (objc_msgSend(v13, "count") > v14);
    }

  }
  else
  {
    sgLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v24 = 0;
      _os_log_error_impl(&dword_1C3607000, v22, OS_LOG_TYPE_ERROR, "SGExtractionDocument: No model output", v24, 2u);
    }

  }
  return v12;
}

+ (id)labelTokenIndexesForOutputName:(id)a3 label:(id)a4 modelOutput:(id)a5
{
  return (id)objc_msgSend(a1, "labelTokenIndexesForOutputName:label:modelOutput:maxMergeDistance:", a3, a4, a5, 0);
}

+ (_NSRange)firstRangeInIndexSet:(id)a3
{
  id v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  _NSRange result;

  v3 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3010000000;
  v14 = 0;
  v12 = "";
  v13 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__SGExtractionDocument_firstRangeInIndexSet___block_invoke;
  v8[3] = &unk_1E7DB7270;
  v8[4] = &v9;
  objc_msgSend(v3, "enumerateRangesUsingBlock:", v8);
  v4 = v10[4];
  v5 = v10[5];
  _Block_object_dispose(&v9, 8);

  v6 = v4;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

+ (_NSRange)textRangeForIndexRange:(_NSRange)a3 inTaggedCharacterRanges:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v6;
  unint64_t v7;
  NSObject *v8;
  NSUInteger v9;
  NSUInteger v10;
  void *v11;
  void *v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  NSUInteger v16;
  NSRange v17;
  NSUInteger v18;
  NSUInteger v19;
  uint8_t v20[16];
  NSRange v21;
  _NSRange result;
  NSRange v23;

  length = a3.length;
  location = a3.location;
  v6 = a4;
  v7 = location + length;
  if (v7 <= objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", location);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", v7 - 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "range");
    v15 = v14;
    v23.location = objc_msgSend(v12, "range");
    v23.length = v16;
    v21.location = v13;
    v21.length = v15;
    v17 = NSUnionRange(v21, v23);
    v9 = v17.location;
    v10 = v17.length;

  }
  else
  {
    sgLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v20 = 0;
      _os_log_error_impl(&dword_1C3607000, v8, OS_LOG_TYPE_ERROR, "SGExtractionDocument: Invalid range", v20, 2u);
    }

    v9 = 0;
    v10 = 0;
  }

  v18 = v9;
  v19 = v10;
  result.length = v19;
  result.location = v18;
  return result;
}

+ (id)candidatesForLabelTokenIndexes:(id)a3 inPlainText:(id)a4 forTaggedCharacterRanges:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_opt_new();
  if (v10)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __92__SGExtractionDocument_candidatesForLabelTokenIndexes_inPlainText_forTaggedCharacterRanges___block_invoke;
    v16[3] = &unk_1E7DB7298;
    v20 = a1;
    v17 = v10;
    v18 = v9;
    v12 = v11;
    v19 = v12;
    objc_msgSend(v8, "enumerateRangesUsingBlock:", v16);
    v13 = v19;
    v14 = v12;

  }
  return v11;
}

+ (id)candidatesForLabelsWithPlainTextIndexSets:(id)a3 inPlainText:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v9, "objectForKeyedSubscript:", v14, (_QWORD)v18);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "candidatesForPlainTextIndexSet:inPlainText:", v15, v7);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  return v8;
}

+ (id)candidatesForPlainTextIndexSet:(id)a3 inPlainText:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __67__SGExtractionDocument_candidatesForPlainTextIndexSet_inPlainText___block_invoke;
  v13[3] = &unk_1E7DB72C0;
  v14 = v5;
  v8 = v7;
  v15 = v8;
  v9 = v5;
  objc_msgSend(v6, "enumerateRangesUsingBlock:", v13);

  v10 = v15;
  v11 = v8;

  return v11;
}

+ (id)dateComponentsFromDataDetectorMatch:(id)a3 inferDates:(BOOL)a4 approximateTime:(BOOL)a5 partialDate:(BOOL)a6 useEndForDurations:(BOOL)a7
{
  _BOOL4 v7;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v7 = a7;
  v11 = a3;
  v12 = v11;
  if (v7
    && (objc_msgSend(v11, "detectedEndDate"), v13 = (void *)objc_claimAutoreleasedReturnValue(), v13, v13))
  {
    objc_msgSend(v12, "detectedEndDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "detectedEndTimeZone");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v12, "detectedDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "detectedTimeZone");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v16 = (void *)v15;
  if (objc_msgSend(v12, "allDay"))
  {
    objc_msgSend((id)objc_opt_class(), "allDayDateComponentsFromDate:", v14);
    v17 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (!v16)
  {
    objc_msgSend((id)objc_opt_class(), "dateComponentsFromDate:", v14);
    v17 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v19 = (void *)v17;
    if (a4)
      goto LABEL_14;
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "componentsInTimeZone:fromDate:", v16, v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4)
    goto LABEL_14;
LABEL_12:
  if (objc_msgSend(v12, "inferredDate"))
  {
    v20 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setCalendar:", v21);

    objc_msgSend(v19, "timeZone");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setTimeZone:", v22);

    objc_msgSend(v20, "setHour:", objc_msgSend(v19, "hour"));
    objc_msgSend(v20, "setMinute:", objc_msgSend(v19, "minute"));

    v19 = v20;
  }
LABEL_14:
  if (!a5 && objc_msgSend(v12, "approximateTime"))
  {
    objc_msgSend(v19, "setHour:", 0x7FFFFFFFFFFFFFFFLL);
    objc_msgSend(v19, "setMinute:", 0x7FFFFFFFFFFFFFFFLL);
  }
  if (!a6 && objc_msgSend(v12, "partialDate"))
  {
    objc_msgSend(v19, "setDay:", 0x7FFFFFFFFFFFFFFFLL);
    objc_msgSend(v19, "setMonth:", 0x7FFFFFFFFFFFFFFFLL);
    objc_msgSend(v19, "setYear:", 0x7FFFFFFFFFFFFFFFLL);
  }
  if (objc_msgSend(v19, "year") == 0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(v19, "month") == 0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(v19, "day") == 0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(v19, "hour") == 0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(v19, "minute") == 0x7FFFFFFFFFFFFFFFLL)
  {
    v23 = 0;
  }
  else
  {
    v23 = v19;
  }

  return v23;
}

+ (id)allDayDateComponentsFromDate:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99D48];
  v4 = a3;
  objc_msgSend(v3, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 1048604, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)dateComponentsFromDate:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99D48];
  v4 = a3;
  objc_msgSend(v3, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 1048700, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)mergeDetectedDateComponents:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCalendar:", v6);

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v7 = v4;
  v20 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v20)
  {
    v8 = *(_QWORD *)v26;
    v19 = *(_QWORD *)v26;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(v7);
        v10 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v9);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v11 = objc_msgSend(&unk_1E7E113E8, "countByEnumeratingWithState:objects:count:", &v21, v29, 16, v19);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v22;
          while (2)
          {
            v14 = 0;
            v15 = v5;
            do
            {
              if (*(_QWORD *)v22 != v13)
                objc_enumerationMutation(&unk_1E7E113E8);
              objc_msgSend(a1, "mergeComponent:usingBaseDateComponents:withDateComponents:", objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v14), "integerValue"), v15, v10);
              v16 = objc_claimAutoreleasedReturnValue();
              if (!v16)
              {

                v17 = 0;
                goto LABEL_18;
              }
              v5 = (void *)v16;

              ++v14;
              v15 = v5;
            }
            while (v12 != v14);
            v12 = objc_msgSend(&unk_1E7E113E8, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
            if (v12)
              continue;
            break;
          }
        }
        ++v9;
        v8 = v19;
      }
      while (v9 != v20);
      v20 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v20);
  }

  v15 = v5;
  v17 = v15;
LABEL_18:

  return v17;
}

+ (id)mergeComponent:(unint64_t)a3 usingBaseDateComponents:(id)a4 withDateComponents:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  id v20;

  v7 = a4;
  v8 = a5;
  v9 = v8;
  if (a3 != 0x200000)
  {
    if (objc_msgSend(v8, "valueForComponent:", a3) == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_11;
    if (objc_msgSend(v7, "valueForComponent:", a3) == 0x7FFFFFFFFFFFFFFFLL
      || (v19 = objc_msgSend(v9, "valueForComponent:", a3), v19 == objc_msgSend(v7, "valueForComponent:", a3)))
    {
      objc_msgSend(v7, "setValue:forComponent:", objc_msgSend(v9, "valueForComponent:", a3), a3);
      goto LABEL_11;
    }
    goto LABEL_14;
  }
  objc_msgSend(v8, "timeZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v7, "timeZone");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
LABEL_6:
      objc_msgSend(v9, "timeZone");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setTimeZone:", v18);

      goto LABEL_11;
    }
    v12 = (void *)v11;
    objc_msgSend(v7, "timeZone");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      objc_msgSend(v9, "timeZone");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "timeZone");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "isEqualToTimeZone:", v16);

      if (v17)
        goto LABEL_6;
    }
    else
    {

    }
LABEL_14:
    v20 = 0;
    goto LABEL_12;
  }
LABEL_11:
  v20 = v7;
LABEL_12:

  return v20;
}

void __67__SGExtractionDocument_candidatesForPlainTextIndexSet_inPlainText___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
    v4 = v5;
  }

}

void __92__SGExtractionDocument_candidatesForLabelTokenIndexes_inPlainText_forTaggedCharacterRanges___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = objc_msgSend(*(id *)(a1 + 56), "textRangeForIndexRange:inTaggedCharacterRanges:", a2, a3, *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "substringWithRange:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = *(void **)(a1 + 48);
    v9 = v6;
    _PASCollapseWhitespaceAndStrip();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

    v6 = v9;
  }

}

uint64_t __45__SGExtractionDocument_firstRangeInIndexSet___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v4;

  v4 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  *(_QWORD *)(v4 + 32) = a2;
  *(_QWORD *)(v4 + 40) = a3;
  *a4 = 1;
  return result;
}

@end
