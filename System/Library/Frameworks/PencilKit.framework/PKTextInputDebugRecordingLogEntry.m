@implementation PKTextInputDebugRecordingLogEntry

- (PKTextInputDebugRecordingLogEntry)initWithResultCommand:(id)a3
{
  id v4;
  PKTextInputDebugRecordingLogEntry *v5;
  PKTextInputDebugRecordingLogEntry *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKTextInputDebugRecordingLogEntry;
  v5 = -[PKTextInputDebugRecordingLogEntry init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[PKTextInputDebugRecordingLogEntry _extractDataFromResultCommand:](v5, "_extractDataFromResultCommand:", v4);

  return v6;
}

- (void)_extractDataFromResultCommand:(id)a3
{
  id *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id *v21;
  id *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  __CFString *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  const __CFString *v45;
  void *v46;
  id *v47;

  v4 = (id *)a3;
  v47 = v4;
  if (v4)
  {
    v5 = v4[5];
    v6 = v47[4];
  }
  else
  {
    v5 = 0;
    v6 = 0;
  }
  v7 = v6;
  objc_msgSend(v7, "correctionResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugLogEntry setEntryDate:](self, "setEntryDate:", v9);

  objc_msgSend(v5, "languageSpec");
  v10 = (id *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputLanguageSpec debugLocaleDescriptions](v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugLogEntry setRecognitionLocaleIdentifiers:](self, "setRecognitionLocaleIdentifiers:", v11);

  objc_msgSend(v5, "strokeProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "drawing");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugRecordingLogEntry set_originalDrawing:](self, "set_originalDrawing:", v13);

  objc_msgSend(v5, "inputInProgressStroke");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugLogEntry setInputContainsInProgressStroke:](self, "setInputContainsInProgressStroke:", v14 != 0);

  objc_msgSend(v5, "textInputTargets");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  -[PKTextInputDebugLogEntry setInputTargets:](self, "setInputTargets:", v16);

  if (v47)
  {
    v17 = v47[6];
    v18 = v17;
    if (v17)
    {
      v19 = (void *)*((_QWORD *)v17 + 1);
      goto LABEL_6;
    }
  }
  else
  {
    v18 = 0;
  }
  v19 = 0;
LABEL_6:
  v20 = v19;

  if (!v20)
    goto LABEL_15;
  if (v47 && (v21 = (id *)v47[6]) != 0)
  {
    v22 = v21;
    v23 = v21[1];
    v24 = v23;
    if (v23)
    {
      v25 = (void *)*((_QWORD *)v23 + 14);
      goto LABEL_11;
    }
  }
  else
  {
    v24 = 0;
    v22 = 0;
  }
  v25 = 0;
LABEL_11:
  v26 = v25;

  objc_msgSend(v5, "submittedTargetContentInfoForRecognitionIdentifier:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugLogEntry setInputTargetContentInfo:](self, "setInputTargetContentInfo:", v27);

  if (!v47)
  {
    v29 = 0;
    goto LABEL_34;
  }
  v28 = v47[6];
  v29 = v28;
  if (!v28)
  {
LABEL_34:
    v30 = 0;
    goto LABEL_14;
  }
  v30 = (void *)*((_QWORD *)v28 + 1);
LABEL_14:
  v31 = v30;
  -[PKTextInputElement debugElementTypeDescription](v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugLogEntry setInputTargetElementType:](self, "setInputTargetElementType:", v32);

LABEL_15:
  if (v47)
  {
    v33 = v47[4];
    -[PKTextInputDebugRecordingLogEntry set_resultQueryItem:](self, "set_resultQueryItem:", v33);

    objc_msgSend(v8, "textResult");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputDebugLogEntry setTokenizedTextResult:](self, "setTokenizedTextResult:", v34);

    v35 = v47[10];
  }
  else
  {
    -[PKTextInputDebugRecordingLogEntry set_resultQueryItem:](self, "set_resultQueryItem:", 0);
    objc_msgSend(v8, "textResult");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputDebugLogEntry setTokenizedTextResult:](self, "setTokenizedTextResult:", v46);

    v35 = 0;
  }
  v36 = v35;
  -[PKTextInputDebugLogEntry setResultCommittedText:](self, "setResultCommittedText:", v36);

  objc_msgSend(v8, "textResult");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "topTranscription");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugLogEntry setResultTopTranscription:](self, "setResultTopTranscription:", v38);

  if (v47)
  {
    -[PKTextInputDebugLogEntry setResultCommittedTokenColumnCount:](self, "setResultCommittedTokenColumnCount:", v47[11]);
    v39 = v47[12];
  }
  else
  {
    -[PKTextInputDebugLogEntry setResultCommittedTokenColumnCount:](self, "setResultCommittedTokenColumnCount:", 0);
    v39 = 0;
  }
  v40 = v39;
  -[PKTextInputDebugLogEntry setResultCommitReason:](self, "setResultCommitReason:", v40);

  if (v8)
  {
    v41 = objc_msgSend(v8, "affectedRange");
    v43 = v42;
  }
  else
  {
    v43 = 0;
    v41 = 0x7FFFFFFFFFFFFFFFLL;
  }
  -[PKTextInputDebugLogEntry setResultAffectedRange:](self, "setResultAffectedRange:", v41, v43);
  v44 = objc_msgSend(v8, "resultType");
  if (v44 > 8)
    v45 = &stru_1E777DEE8;
  else
    v45 = off_1E777DC50[v44];
  -[PKTextInputDebugLogEntry setResultTypeDescription:](self, "setResultTypeDescription:", v45);
  objc_msgSend(v5, "recognitionDuration");
  -[PKTextInputDebugLogEntry setResultRecognitionDuration:](self, "setResultRecognitionDuration:");

}

- (id)inputDrawing
{
  PKDrawing *inputDrawing;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  PKDrawing *v22;
  PKDrawing *v23;
  id obj;
  _OWORD v26[3];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  inputDrawing = self->super._inputDrawing;
  if (!inputDrawing)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKTextInputCanvasController defaultInkWithColor:]((uint64_t)PKTextInputCanvasController, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)MEMORY[0x1E0C99DE8];
    -[PKTextInputDebugRecordingLogEntry _originalDrawing](self, "_originalDrawing");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "strokes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrayWithCapacity:", objc_msgSend(v8, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    -[PKTextInputDebugRecordingLogEntry _originalDrawing](self, "_originalDrawing");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "strokes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v11;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v28 != v14)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          -[PKTextInputDebugRecordingLogEntry _originalDrawing](self, "_originalDrawing");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_alloc((Class)objc_msgSend(v17, "strokeClass"));
          objc_msgSend(v16, "path");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
            objc_msgSend(v16, "transform");
          else
            memset(v26, 0, sizeof(v26));
          objc_msgSend(v16, "mask");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (void *)objc_msgSend(v18, "initWithInk:strokePath:transform:mask:", v5, v19, v26, v20);
          objc_msgSend(v9, "addObject:", v21);

        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v13);
    }

    v22 = -[PKDrawing initWithStrokes:]([PKDrawing alloc], "initWithStrokes:", v9);
    v23 = self->super._inputDrawing;
    self->super._inputDrawing = v22;

    inputDrawing = self->super._inputDrawing;
  }
  return inputDrawing;
}

- (id)dictionaryRepresentationWithDetailLevel:(int64_t)a3 targetContentLevel:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  int64_t v29;
  void *v30;
  unint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  const __CFString *v50;
  uint64_t v51;
  void *v52;
  const __CFString *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  const __CFString *v57;
  void *v58;
  uint64_t v60;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "loggedDateFormatter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugLogEntry entryDate](self, "entryDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringFromDate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("date"));

  -[PKTextInputDebugRecordingLogEntry inputDrawing](self, "inputDrawing");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend((id)objc_opt_class(), "_dictionaryRepresentationForDrawing:detailLevel:containsInProgress:", v10, a3, -[PKTextInputDebugLogEntry inputContainsInProgressStroke](self, "inputContainsInProgressStroke"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("inputDrawing"));

  }
  v12 = 0x1E0CB3000uLL;
  if (a3)
  {
    if (a3 == 1)
    {
      v13 = (void *)MEMORY[0x1E0C99DE8];
      -[PKTextInputDebugLogEntry inputTargets](self, "inputTargets");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "arrayWithCapacity:", objc_msgSend(v14, "count"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      -[PKTextInputDebugLogEntry inputTargets](self, "inputTargets");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v63;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v63 != v19)
              objc_enumerationMutation(v16);
            objc_msgSend((id)objc_opt_class(), "_dictionaryRepresentationForTarget:", *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * i));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "addObject:", v21);

          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
        }
        while (v18);
      }

      objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, CFSTR("inputTargets"));
      v12 = 0x1E0CB3000;
    }
  }
  else
  {
    v22 = (void *)MEMORY[0x1E0CB37E8];
    -[PKTextInputDebugLogEntry inputTargets](self, "inputTargets");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "numberWithUnsignedInteger:", objc_msgSend(v23, "count"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v24, CFSTR("inputTargetsCount"));

  }
  -[PKTextInputDebugLogEntry inputTargetContentInfo](self, "inputTargetContentInfo");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    v60 = -[PKTextInputDebugLogEntry resultAffectedRange](self, "resultAffectedRange");
    v27 = v26;
    v28 = v6;
    v29 = a3;
    v30 = v10;
    v31 = v12;
    v32 = objc_opt_class();
    -[PKTextInputDebugLogEntry inputTargetContentInfo](self, "inputTargetContentInfo");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputDebugLogEntry inputTargetElementType](self, "inputTargetElementType");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputDebugLogEntry recognitionLocaleIdentifiers](self, "recognitionLocaleIdentifiers");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)v32;
    v12 = v31;
    v10 = v30;
    a3 = v29;
    v6 = v28;
    objc_msgSend(v36, "_dictionaryRepresentationForTargetContentInfo:elementType:detailLevel:contentLevel:resultAffectedRange:localeIdentifiers:", v33, v34, a3, a4, v60, v27, v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setObject:forKeyedSubscript:", v37, CFSTR("inputTargetContentInfo"));
  }
  -[PKTextInputDebugRecordingLogEntry _resultQueryItem](self, "_resultQueryItem");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    v39 = (void *)objc_opt_class();
    -[PKTextInputDebugRecordingLogEntry _resultQueryItem](self, "_resultQueryItem");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "_mutableDictionaryRepresentationForResultQueryItem:detailLevel:", v40, a3);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    v42 = *(void **)(v12 + 2024);
    -[PKTextInputDebugLogEntry resultRecognitionDuration](self, "resultRecognitionDuration");
    objc_msgSend(v42, "numberWithDouble:");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setObject:forKeyedSubscript:", v43, CFSTR("recognitionDuration"));

    -[PKTextInputDebugLogEntry recognitionLocaleIdentifiers](self, "recognitionLocaleIdentifiers");
    v44 = objc_claimAutoreleasedReturnValue();
    v45 = (void *)v44;
    if (v44)
      v46 = v44;
    else
      v46 = MEMORY[0x1E0C9AA60];
    objc_msgSend(v41, "setObject:forKeyedSubscript:", v46, CFSTR("recognitionLocales"));

    -[PKTextInputDebugLogEntry recognitionLocaleIdentifiers](self, "recognitionLocaleIdentifiers");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "firstObject");
    v48 = objc_claimAutoreleasedReturnValue();
    v49 = (void *)v48;
    if (v48)
      v50 = (const __CFString *)v48;
    else
      v50 = &stru_1E777DEE8;
    objc_msgSend(v41, "setObject:forKeyedSubscript:", v50, CFSTR("recognitionLocale"));

    objc_msgSend(v6, "setObject:forKeyedSubscript:", v41, CFSTR("recognitionResult"));
  }
  -[PKTextInputDebugLogEntry resultCommittedText](self, "resultCommittedText");
  v51 = objc_claimAutoreleasedReturnValue();
  v52 = (void *)v51;
  if (v51)
    v53 = (const __CFString *)v51;
  else
    v53 = &stru_1E777DEE8;
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v53, CFSTR("committedText"));

  objc_msgSend(*(id *)(v12 + 2024), "numberWithInteger:", -[PKTextInputDebugLogEntry resultCommittedTokenColumnCount](self, "resultCommittedTokenColumnCount"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v54, CFSTR("committedTokenColumnCount"));

  -[PKTextInputDebugLogEntry resultCommitReason](self, "resultCommitReason");
  v55 = objc_claimAutoreleasedReturnValue();
  v56 = (void *)v55;
  if (v55)
    v57 = (const __CFString *)v55;
  else
    v57 = &stru_1E777DEE8;
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v57, CFSTR("commitReason"));

  v58 = (void *)objc_msgSend(v6, "copy");
  return v58;
}

+ (id)_dictionaryRepresentationForDrawing:(id)a3 detailLevel:(int64_t)a4 containsInProgress:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CGRect v16;

  v5 = a5;
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v7, "strokes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("strokeCount"));

  objc_msgSend(v7, "bounds");
  NSStringFromCGRect(v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, CFSTR("bounds"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, CFSTR("containsInProgressStroke"));

  if (a4 == 1)
  {
    objc_msgSend(v7, "dataRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, CFSTR("drawingData"));

  }
  return v8;
}

+ (id)_dictionaryRepresentationForTarget:(id)a3
{
  id v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  void *v14;
  _QWORD v16[2];
  _QWORD v17[3];
  CGRect v18;

  v17[2] = *MEMORY[0x1E0C80C00];
  v16[0] = CFSTR("identifier");
  v3 = a3;
  objc_msgSend(v3, "inputTargetIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = CFSTR("frame");
  v17[0] = v4;
  objc_msgSend(v3, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v18.origin.x = v6;
  v18.origin.y = v8;
  v18.size.width = v10;
  v18.size.height = v12;
  NSStringFromCGRect(v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)_dictionaryRepresentationForTargetContentInfo:(id)a3 elementType:(id)a4 detailLevel:(int64_t)a5 contentLevel:(int64_t)a6 resultAffectedRange:(_NSRange)a7 localeIdentifiers:(id)a8
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  unsigned int v27;
  const __CFString *v28;
  unsigned int v29;
  const __CFString *v30;
  unsigned int v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  __CFString *v44;
  uint64_t v47;
  uint64_t v48;
  NSRange v49;
  NSRange v50;
  NSRange v51;
  NSRange v52;
  CGRect v53;

  v12 = a3;
  v13 = a4;
  v14 = a8;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "textInputTarget");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "inputTargetIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, CFSTR("targetIdentifier"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v12, "textContentLength"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v18, CFSTR("textContentLength"));

  if (v13)
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v13, CFSTR("elementType"));
  if (objc_msgSend(v12, "referenceSubstringRange", a7.location, a7.length) != 0x7FFFFFFFFFFFFFFFLL)
  {
    v49.location = objc_msgSend(v12, "referenceSubstringRange");
    NSStringFromRange(v49);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v19, CFSTR("referenceSubstringRange"));

  }
  if (objc_msgSend(v12, "strokeCoveredTextRange") != 0x7FFFFFFFFFFFFFFFLL)
  {
    v50.location = objc_msgSend(v12, "strokeCoveredTextRange");
    NSStringFromRange(v50);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v20, CFSTR("strokeCoveredTextRange"));

  }
  if (objc_msgSend(v12, "selectedTextRange") != 0x7FFFFFFFFFFFFFFFLL)
  {
    v51.location = objc_msgSend(v12, "selectedTextRange");
    NSStringFromRange(v51);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v21, CFSTR("selectedTextRange"));

  }
  if (objc_msgSend(v12, "activePreviewRange") != 0x7FFFFFFFFFFFFFFFLL)
  {
    v52.location = objc_msgSend(v12, "activePreviewRange");
    NSStringFromRange(v52);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v22, CFSTR("activePreviewRange"));

  }
  if (objc_msgSend(v12, "lastCharacterLevelPosition") != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v12, "lastCharacterLevelPosition"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v23, CFSTR("lastCharacterLevelPosition"));

  }
  objc_msgSend(v12, "protectedCharacterIndexes");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "count");

  if (v25)
  {
    objc_msgSend(v12, "protectedCharacterIndexes");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v26, CFSTR("protectedCharacterIndexes"));

  }
  v27 = objc_msgSend(v12, "contentType");
  if (v27 > 7)
    v28 = &stru_1E777DEE8;
  else
    v28 = off_1E777DC98[v27];
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v28, CFSTR("contentType"));
  v29 = objc_msgSend(v12, "autoCapitalizationMode");
  if (v29 > 5)
    v30 = &stru_1E777DEE8;
  else
    v30 = off_1E777DCD8[v29];
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v30, CFSTR("autocapitalization"));
  v31 = objc_msgSend(v12, "autoCorrectionMode");
  if (v31 > 2)
    v32 = &stru_1E777DEE8;
  else
    v32 = off_1E777DD08[v31];
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v32, CFSTR("autocorrection"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v12, "isCursorStrong"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v33, CFSTR("isCursorStrong"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v12, "isSingleLine"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v34, CFSTR("isSingleLine"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v12, "containsCommittedStrokes"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v35, CFSTR("containsCommittedStrokes"));

  if (a5 == 1)
  {
    v36 = objc_msgSend(v12, "referenceSubstringRange");
    v38 = v37;
    if (objc_msgSend(v12, "characterRectsInReferenceSubstring"))
    {
      if (v36 != 0x7FFFFFFFFFFFFFFFLL && v38)
      {
        v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v38);
        v40 = objc_msgSend(v12, "characterRectsInReferenceSubstring") + 16;
        do
        {
          v53 = *(CGRect *)(v40 - 16);
          v40 += 32;
          NSStringFromCGRect(v53);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "addObject:", v41);

          --v38;
        }
        while (v38);
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v39, CFSTR("characterRectsInReferenceSubstring"));

      }
    }
  }
  objc_msgSend(v14, "firstObject");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_referenceSubstringForTargetContentInfo:resultAffectedRange:targetContentLevel:localeIdentifier:", v12, v47, v48, a6, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)a6 > 2)
    v44 = 0;
  else
    v44 = off_1E777DD20[a6];
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v43, CFSTR("referenceSubstring"));
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v44, CFSTR("referenceSubstringLogContentLevel"));

  return v15;
}

- (CHTextInputQueryItem)_resultQueryItem
{
  return self->__resultQueryItem;
}

- (void)set_resultQueryItem:(id)a3
{
  objc_storeStrong((id *)&self->__resultQueryItem, a3);
}

- (PKDrawing)_originalDrawing
{
  return self->__originalDrawing;
}

- (void)set_originalDrawing:(id)a3
{
  objc_storeStrong((id *)&self->__originalDrawing, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__originalDrawing, 0);
  objc_storeStrong((id *)&self->__resultQueryItem, 0);
}

@end
