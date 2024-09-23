@implementation ICTextViewScrollState

+ (void)scrollStateForTextView:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "editorController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "note");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0(&dword_1DD7B0000, a2, v6, "Captured Text View Scroll State for Note %@", v7);

}

+ (id)scrollStateForTextView:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  unint64_t v19;
  void *v20;
  int v21;
  double v22;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v27;
  ICTextViewScrollState *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  _QWORD v39[2];
  CGRect v40;
  CGRect v41;

  v39[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "visibleTextRect");
  v5 = v4;
  v7 = v6;
  objc_msgSend(v3, "contentInset");
  v9 = v5 + v8;
  v11 = v7 + v10;
  if (ICInternalSettingsIsTextKit2Enabled())
  {
    objc_msgSend(v3, "safeAreaInsets");
    v9 = v9 + v12;
    v11 = v11 + v13;
  }
  objc_msgSend(v3, "closestPositionToPoint:", v9, v11 + 5.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textRangeFromPosition:toPosition:", v14, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v3, "ic_characterRangeFromTextRange:", v15);
  if (v16 == 0x7FFFFFFFFFFFFFFFLL
    || (v17 = v16,
        objc_msgSend(v3, "textStorage"),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        v19 = objc_msgSend(v18, "length"),
        v18,
        v17 >= v19))
  {
    v28 = 0;
  }
  else
  {
    objc_msgSend(v3, "textStorage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "containsAttachmentsInRange:", v17, 1);

    v22 = 0.0;
    if (v21)
    {
      objc_msgSend(v3, "firstRectForRange:", v15);
      x = v40.origin.x;
      y = v40.origin.y;
      width = v40.size.width;
      height = v40.size.height;
      CGRectGetMidX(v40);
      v41.origin.x = x;
      v41.origin.y = y;
      v41.size.width = width;
      v41.size.height = height;
      CGRectGetMinY(v41);
      TSUClamp();
      v22 = v27;
    }
    v28 = objc_alloc_init(ICTextViewScrollState);
    -[ICTextViewScrollState setTopLeftTextAttachmentScrollHeightOffsetRatio:](v28, "setTopLeftTextAttachmentScrollHeightOffsetRatio:", v22);
    objc_msgSend(v3, "editorController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "note");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTextViewScrollState setNote:](v28, "setNote:", v30);

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTextViewScrollState setDate:](v28, "setDate:", v31);

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v17, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v32;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICTextViewScrollState note](v28, "note");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "mergeableString");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "selectionForCharacterRanges:selectionAffinity:", v33, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTextViewScrollState setTopLeftStringSelection:](v28, "setTopLeftStringSelection:", v36);

    -[ICTextViewScrollState setTopLeftCharIndexAtCapture:](v28, "setTopLeftCharIndexAtCapture:", v17);
  }
  v37 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    +[ICTextViewScrollState scrollStateForTextView:].cold.1(v3, v37);

  return v28;
}

- (ICTextViewScrollState)initWithDictionary:(id)a3 note:(id)a4
{
  id v6;
  id v7;
  ICTextViewScrollState *v8;
  ICTextViewScrollState *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  NSObject *v21;
  os_log_t v22;
  float v23;
  void *v24;
  void *v25;
  uint64_t v27;
  void *v28;
  void *v29;
  objc_super v30;

  v6 = a3;
  v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)ICTextViewScrollState;
  v8 = -[ICTextViewScrollState init](&v30, sel_init);
  v9 = v8;
  if (v8)
  {
    -[ICTextViewScrollState setFromArchive:](v8, "setFromArchive:", 1);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ScrollStateTLStringSelectionData"));
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ScrollStateNoteIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ScrollStateTLScrollHeightOffsetRatio"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ScrollStateDate"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ScrollStateTLC"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "unsignedIntegerValue");

    objc_opt_class();
    v29 = (void *)v10;
    v27 = v15;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v10, 0);
    else
      v16 = 0;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend((id)objc_opt_class(), "setupDateFormatter");
      objc_msgSend((id)dateFormatter, "dateFromString:", v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = 0;
    }
    objc_opt_class();
    v28 = (void *)v16;
    ICDynamicCast();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "verifiedSelectionData != ((void *)0)", "-[ICTextViewScrollState initWithDictionary:note:]", 1, 0, CFSTR("Trying to init a text view scroll state without top left StringSelectionData"));
    objc_msgSend(v7, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqualToString:", v11);

    if ((v20 & 1) != 0)
    {
      if (v18)
      {
        v21 = os_log_create("com.apple.notes", "UI");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          -[ICTextViewScrollState initWithDictionary:note:].cold.2();

        v22 = (os_log_t)objc_msgSend(objc_alloc(MEMORY[0x1E0D63C78]), "initWithData:", v18);
        if (v22)
        {
          -[ICTextViewScrollState setTopLeftStringSelection:](v9, "setTopLeftStringSelection:", v22);
          -[ICTextViewScrollState setDate:](v9, "setDate:", v17);
          -[ICTextViewScrollState setNote:](v9, "setNote:", v7);
          objc_msgSend(v12, "floatValue");
          -[ICTextViewScrollState setTopLeftTextAttachmentScrollHeightOffsetRatio:](v9, "setTopLeftTextAttachmentScrollHeightOffsetRatio:", v23);
          -[ICTextViewScrollState setTopLeftCharIndexAtCapture:](v9, "setTopLeftCharIndexAtCapture:", v27);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "mergableStringSelection != ((void *)0)", "-[ICTextViewScrollState initWithDictionary:note:]", 1, 0, CFSTR("failure to create mergable string selection from data."));
        }
LABEL_19:

        goto LABEL_20;
      }
    }
    else
    {
      v24 = (void *)MEMORY[0x1E0D641A0];
      objc_msgSend(v7, "identifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "identifierMatches", "-[ICTextViewScrollState initWithDictionary:note:]", 1, 0, CFSTR("Trying to init a text view scroll state but identifiers don't match: expected %@ : received %@"), v25, v11);

    }
    -[ICTextViewScrollState setLoadingFromDictionaryFailed:](v9, "setLoadingFromDictionaryFailed:", 1);
    v22 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      -[ICTextViewScrollState initWithDictionary:note:].cold.1();
    goto LABEL_19;
  }
LABEL_20:

  return v9;
}

- (ICTextViewScrollState)initWithData:(id)a3 managedObjectContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  ICTextViewScrollState *v12;

  v6 = a3;
  v7 = a4;
  if (v6)
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v6, 0, 0);
  else
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ScrollStateNoteIdentifier"));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = 0;
  if (v7 && v9)
  {
    objc_msgSend(MEMORY[0x1E0D63BB8], "noteWithIdentifier:context:", v9, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = -[ICTextViewScrollState initWithDictionary:note:](self, "initWithDictionary:note:", v8, v11);

  return v12;
}

+ (id)scrollStateForAttachment:(id)a3 inNote:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "rangeForAttachment:", v6);
  v9 = v8;
  v11 = v10;
  if (v7 && v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v6, "parentAttachment");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v6, "parentAttachment");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "rangeForAttachment:", v13);
      v11 = v14;

    }
    else
    {
      v9 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  objc_msgSend(a1, "scrollStateForRange:inNote:", v9, v11, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)scrollStateForRange:(_NSRange)a3 inNote:(id)a4
{
  NSUInteger location;
  id v5;
  ICTextViewScrollState *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];

  location = a3.location;
  v16[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = objc_alloc_init(ICTextViewScrollState);
  -[ICTextViewScrollState setNote:](v6, "setNote:", v5);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTextViewScrollState setDate:](v6, "setDate:", v7);

  objc_msgSend(v5, "textStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "length");
  if (v9 < location)
    location = v9;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", location, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICTextViewScrollState note](v6, "note");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "mergeableString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "selectionForCharacterRanges:selectionAffinity:", v11, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTextViewScrollState setTopLeftStringSelection:](v6, "setTopLeftStringSelection:", v14);

  -[ICTextViewScrollState setTopLeftCharIndexAtCapture:](v6, "setTopLeftCharIndexAtCapture:", location);
  return v6;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  _QWORD v17[6];

  v17[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "setupDateFormatter");
  -[ICTextViewScrollState topLeftStringSelection](self, "topLeftStringSelection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serialize");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "base64EncodedStringWithOptions:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICTextViewScrollState date](self, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)dateFormatter;
    -[ICTextViewScrollState date](self, "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringFromDate:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  -[ICTextViewScrollState noteIdentifier](self, "noteIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[ICTextViewScrollState topLeftTextAttachmentScrollHeightOffsetRatio](self, "topLeftTextAttachmentScrollHeightOffsetRatio");
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ICTextViewScrollState topLeftCharIndexAtCapture](self, "topLeftCharIndexAtCapture"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (v9)
      goto LABEL_6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((topLeftDataAsString) != nil)", "-[ICTextViewScrollState dictionaryRepresentation]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "topLeftDataAsString");
    if (v9)
    {
LABEL_6:
      if (v10)
        goto LABEL_7;
LABEL_14:
      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((noteIdentifier) != nil)", "-[ICTextViewScrollState dictionaryRepresentation]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "noteIdentifier");
      if (v12)
        goto LABEL_8;
LABEL_15:
      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((offsetRatio) != nil)", "-[ICTextViewScrollState dictionaryRepresentation]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "offsetRatio");
LABEL_16:
      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICTextViewScrollState dictionaryRepresentation]", 1, 0, CFSTR("Missing data to create scroll state archive, returning nil"));
      v14 = 0;
      goto LABEL_17;
    }
  }
  objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((dateString) != nil)", "-[ICTextViewScrollState dictionaryRepresentation]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "dateString");
  if (!v10)
    goto LABEL_14;
LABEL_7:
  if (!v12)
    goto LABEL_15;
LABEL_8:
  if (!v5 || !v9 || !v10)
    goto LABEL_16;
  v16[0] = CFSTR("ScrollStateTLStringSelectionData");
  v16[1] = CFSTR("ScrollStateDate");
  v17[0] = v5;
  v17[1] = v9;
  v16[2] = CFSTR("ScrollStateNoteIdentifier");
  v16[3] = CFSTR("ScrollStateTLScrollHeightOffsetRatio");
  v17[2] = v10;
  v17[3] = v12;
  v16[4] = CFSTR("ScrollStateTLC");
  v17[4] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

  return (NSDictionary *)v14;
}

- (NSData)dataRepresentation
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  id v6;
  id v8;

  -[ICTextViewScrollState dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v8 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, &v8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v8;
    if (v4)
    {
      v5 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[ICTextViewScrollState dataRepresentation].cold.1();

      v6 = 0;
    }
    else
    {
      v6 = v3;
    }

  }
  else
  {
    v6 = 0;
  }

  return (NSData *)v6;
}

- (void)setNote:(id)a3
{
  ICNote **p_note;
  id v5;
  void *v6;
  id v7;

  p_note = &self->_note;
  v7 = a3;
  v5 = objc_storeWeak((id *)p_note, v7);
  objc_msgSend(v7, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICTextViewScrollState setNoteIdentifier:](self, "setNoteIdentifier:", v6);
}

- (unint64_t)topLeftTextCharacterIndex
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  -[ICTextViewScrollState topLeftStringSelection](self, "topLeftStringSelection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ICTextViewScrollState note](self, "note");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[ICTextViewScrollState note](self, "note");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "managedObjectContext");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __50__ICTextViewScrollState_topLeftTextCharacterIndex__block_invoke;
      v9[3] = &unk_1EA7DD7D0;
      v9[4] = self;
      v9[5] = &v10;
      objc_msgSend(v6, "performBlockAndWait:", v9);

    }
  }
  v7 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v7;
}

void __50__ICTextViewScrollState_topLeftTextCharacterIndex__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "note");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mergeableString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "topLeftStringSelection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "characterRangesForSelection:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v8;
  if (v8)
  {
    objc_msgSend(v8, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "rangeValue");

    v5 = v8;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v7;
  }

}

- (BOOL)isValid
{
  _BOOL4 v3;

  v3 = -[ICTextViewScrollState captureIsWithinTimeThreshold](self, "captureIsWithinTimeThreshold");
  if (v3)
    LOBYTE(v3) = !-[ICTextViewScrollState loadingFromDictionaryFailed](self, "loadingFromDictionaryFailed");
  return v3;
}

- (double)timeIntervalSinceCapture
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTextViewScrollState date](self, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  v6 = v5;

  return v6;
}

- (BOOL)captureIsWithinTimeThreshold
{
  double v2;

  -[ICTextViewScrollState timeIntervalSinceCapture](self, "timeIntervalSinceCapture");
  return v2 < 300.0;
}

- (BOOL)applyToTextView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  BOOL v20;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  NSObject *v44;
  unint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t);
  void *v64;
  id v65;
  ICTextViewScrollState *v66;
  unint64_t v67;
  uint64_t v68;
  _QWORD v69[6];
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  id v75;
  uint8_t buf[4];
  void *v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v70 = 0;
  v71 = &v70;
  v72 = 0x3032000000;
  v73 = __Block_byref_object_copy__21;
  v74 = __Block_byref_object_dispose__21;
  v75 = 0;
  -[ICTextViewScrollState note](self, "note");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v69[0] = MEMORY[0x1E0C809B0];
  v69[1] = 3221225472;
  v69[2] = __41__ICTextViewScrollState_applyToTextView___block_invoke;
  v69[3] = &unk_1EA7DE5C8;
  v69[4] = self;
  v69[5] = &v70;
  objc_msgSend(v6, "performBlockAndWait:", v69);

  if (!ICInternalSettingsIsTextKit2Enabled())
  {
    if (+[ICExtensionSafeAPIShims applicationState](ICExtensionSafeAPIShims, "applicationState") == 2)
      goto LABEL_12;
    -[ICTextViewScrollState note](self, "note");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
      goto LABEL_12;
    objc_msgSend(v4, "editorController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v4, "editorController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "note");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isEqualToString:", v71[5]);

      if (!v19)
        goto LABEL_12;
    }
    else
    {

    }
    v22 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v4, "editorController");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "note");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "identifier");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v77 = v57;
      _os_log_debug_impl(&dword_1DD7B0000, v22, OS_LOG_TYPE_DEBUG, "Applying Text View Scroll State for Note %@", buf, 0xCu);

    }
    if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
    {
      v24 = objc_msgSend(v4, "ic_visibleRange");
      if (v24 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v25 = v23;
        objc_msgSend(v4, "layoutManager");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "ensureLayoutForCharacterRange:", 0, v24 + v25);

      }
    }
    v27 = -[ICTextViewScrollState topLeftTextCharacterIndex](self, "topLeftTextCharacterIndex");
    objc_msgSend(v4, "ic_textRangeFromCharacterRange:", v27, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (ICInternalSettingsIsTextKit2Enabled())
    {
      objc_msgSend(v4, "textLayoutManager");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "documentRange");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "location");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v29, "locationFromLocation:withOffset:", v31, v27 + 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC1318]), "initWithLocation:endLocation:", v31, v32);
      objc_msgSend(v4, "textLayoutManager");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "ensureLayoutForRange:", v33);

    }
    else
    {
      objc_msgSend(v4, "layoutManager");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "ensureGlyphsForCharacterRange:", v27, 1);
    }

    objc_msgSend(v4, "firstRectForRange:", v28);
    v36 = v35;
    v38 = v37;
    if (-[ICTextViewScrollState topLeftTextCharacterIndex](self, "topLeftTextCharacterIndex"))
    {
      -[ICTextViewScrollState topLeftTextAttachmentScrollHeightOffsetRatio](self, "topLeftTextAttachmentScrollHeightOffsetRatio");
      if (v39 == 0.0)
        v40 = -2.0;
      else
        v40 = 0.0;
      if (ICInternalSettingsIsTextKit2Enabled())
        objc_msgSend(v4, "safeAreaInsets");
      else
        objc_msgSend(v4, "contentInset");
      v43 = v36 + v40 - v41;
    }
    else
    {
      if (ICInternalSettingsIsTextKit2Enabled())
        objc_msgSend(v4, "safeAreaInsets");
      else
        objc_msgSend(v4, "contentInset");
      v43 = -v42;
    }
    -[ICTextViewScrollState topLeftTextAttachmentScrollHeightOffsetRatio](self, "topLeftTextAttachmentScrollHeightOffsetRatio");
    if (v52 > 0.0)
    {
      -[ICTextViewScrollState topLeftTextAttachmentScrollHeightOffsetRatio](self, "topLeftTextAttachmentScrollHeightOffsetRatio");
      v43 = v43 + v38 * v53;
    }
    objc_msgSend(v4, "contentOffset");
    if (vabdd_f64(v43, v54) > 20.0)
      objc_msgSend(v4, "setClippedContentOffset:", *MEMORY[0x1E0C9D538], v43);
    goto LABEL_43;
  }
  if (+[ICExtensionSafeAPIShims applicationState](ICExtensionSafeAPIShims, "applicationState") != 2
    && !-[ICTextViewScrollState isApplying](self, "isApplying"))
  {
    -[ICTextViewScrollState note](self, "note");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v4, "editorController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {

LABEL_34:
        -[ICTextViewScrollState setIsApplying:](self, "setIsApplying:", 1);
        v44 = os_log_create("com.apple.notes", "UI");
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v4, "editorController");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "note");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "identifier");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v77 = v60;
          _os_log_debug_impl(&dword_1DD7B0000, v44, OS_LOG_TYPE_DEBUG, "Applying Text View Scroll State for Note %@", buf, 0xCu);

        }
        v45 = -[ICTextViewScrollState topLeftTextCharacterIndex](self, "topLeftTextCharacterIndex");
        objc_opt_class();
        objc_msgSend(v4, "textLayoutManager");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "textContentManager");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        ICDynamicCast();
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "outlineController");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v28, "expandAncestorsOfRange:", v45, 1);
        objc_opt_class();
        ICDynamicCast();
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = (void *)MEMORY[0x1E0DC3F10];
        v61 = v7;
        v62 = 3221225472;
        v63 = __41__ICTextViewScrollState_applyToTextView___block_invoke_57;
        v64 = &unk_1EA7DDCB8;
        v51 = v49;
        v67 = v45;
        v68 = 1;
        v65 = v51;
        v66 = self;
        objc_msgSend(v50, "performWithoutAnimation:", &v61);
        -[ICTextViewScrollState setIsApplying:](self, "setIsApplying:", 0, v61, v62, v63, v64);

LABEL_43:
        v20 = 1;
        goto LABEL_13;
      }
      objc_msgSend(v4, "editorController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "note");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", v71[5]);

      if (v13)
        goto LABEL_34;
    }
  }
LABEL_12:
  v20 = 0;
LABEL_13:
  _Block_object_dispose(&v70, 8);

  return v20;
}

void __41__ICTextViewScrollState_applyToTextView___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "note");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __41__ICTextViewScrollState_applyToTextView___block_invoke_57(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "topLeftTextAttachmentScrollHeightOffsetRatio");
  return objc_msgSend(v2, "scrollRangeToVisible:withHeightPercentageAdjustment:forceTop:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 1);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  void *v26;
  unint64_t v27;
  void *v28;
  unint64_t v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  unint64_t v34;
  int v36;

  v4 = a3;
  objc_opt_class();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "setupDateFormatter");
    -[ICTextViewScrollState date](self, "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)dateFormatter;
      -[ICTextViewScrollState date](self, "date");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringFromDate:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
    }

    objc_msgSend(v5, "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)dateFormatter;
      objc_msgSend(v5, "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringFromDate:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = 0;
    }

    -[ICTextViewScrollState topLeftStringSelection](self, "topLeftStringSelection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "topLeftStringSelection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)*MEMORY[0x1E0C9B0D0];
    if ((void *)*MEMORY[0x1E0C9B0D0] == v15)
      v18 = 0;
    else
      v18 = v15;
    v19 = v18;
    if (v17 == v16)
      v20 = 0;
    else
      v20 = v16;
    v21 = v20;
    if (v19 | v21)
    {
      v22 = (void *)v21;
      LOBYTE(v10) = 0;
      if (!v19 || !v21)
        goto LABEL_43;
      v10 = objc_msgSend((id)v19, "isEqual:", v21);

      if (!v10)
        goto LABEL_44;
    }
    v23 = v17 == v9 ? 0 : v9;
    v19 = v23;
    v24 = v17 == v14 ? 0 : v14;
    v25 = v24;
    if (v19 | v25)
    {
      v22 = (void *)v25;
      LOBYTE(v10) = 0;
      if (!v19 || !v25)
        goto LABEL_43;
      v10 = objc_msgSend((id)v19, "isEqual:", v25);

      if (!v10)
      {
LABEL_44:

        goto LABEL_45;
      }
    }
    -[ICTextViewScrollState noteIdentifier](self, "noteIdentifier");
    v19 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "noteIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17 == (void *)v19)
      v26 = 0;
    else
      v26 = (void *)v19;
    v27 = v26;
    if (v17 == v22)
      v28 = 0;
    else
      v28 = v22;
    v29 = v28;
    if (!(v27 | v29))
      goto LABEL_39;
    v30 = (void *)v29;
    if (!v27 || !v29)
    {

      goto LABEL_42;
    }
    v36 = objc_msgSend((id)v27, "isEqual:", v29);

    if (v36)
    {
LABEL_39:
      -[ICTextViewScrollState topLeftTextAttachmentScrollHeightOffsetRatio](self, "topLeftTextAttachmentScrollHeightOffsetRatio");
      v32 = v31;
      objc_msgSend(v5, "topLeftTextAttachmentScrollHeightOffsetRatio");
      if (v32 == v33)
      {
        v34 = -[ICTextViewScrollState topLeftCharIndexAtCapture](self, "topLeftCharIndexAtCapture");
        LOBYTE(v10) = v34 == objc_msgSend(v5, "topLeftCharIndexAtCapture");
LABEL_43:

        goto LABEL_44;
      }
    }
LABEL_42:
    LOBYTE(v10) = 0;
    goto LABEL_43;
  }
  LOBYTE(v10) = 0;
LABEL_45:

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  char v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;

  objc_msgSend((id)objc_opt_class(), "setupDateFormatter");
  -[ICTextViewScrollState date](self, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)dateFormatter;
    -[ICTextViewScrollState date](self, "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringFromDate:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  -[ICTextViewScrollState topLeftStringSelection](self, "topLeftStringSelection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  v9 = objc_msgSend(v6, "hash");
  -[ICTextViewScrollState noteIdentifier](self, "noteIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hash");
  -[ICTextViewScrollState topLeftTextAttachmentScrollHeightOffsetRatio](self, "topLeftTextAttachmentScrollHeightOffsetRatio");
  -[ICTextViewScrollState topLeftCharIndexAtCapture](self, "topLeftCharIndexAtCapture");
  v18 = ICHashWithHashKeys(v8, v11, v12, v13, v14, v15, v16, v17, v9);

  return v18;
}

+ (void)setupDateFormatter
{
  if (setupDateFormatter_onceToken != -1)
    dispatch_once(&setupDateFormatter_onceToken, &__block_literal_global_22);
}

uint64_t __43__ICTextViewScrollState_setupDateFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)dateFormatter;
  dateFormatter = (uint64_t)v0;

  return objc_msgSend((id)dateFormatter, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ss.SSSZZZ"));
}

- (ICNote)note
{
  return (ICNote *)objc_loadWeakRetained((id *)&self->_note);
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (BOOL)isFromArchive
{
  return self->_fromArchive;
}

- (void)setFromArchive:(BOOL)a3
{
  self->_fromArchive = a3;
}

- (ICTTMergeableStringSelection)topLeftStringSelection
{
  return self->_topLeftStringSelection;
}

- (void)setTopLeftStringSelection:(id)a3
{
  objc_storeStrong((id *)&self->_topLeftStringSelection, a3);
}

- (double)topLeftTextAttachmentScrollHeightOffsetRatio
{
  return self->_topLeftTextAttachmentScrollHeightOffsetRatio;
}

- (void)setTopLeftTextAttachmentScrollHeightOffsetRatio:(double)a3
{
  self->_topLeftTextAttachmentScrollHeightOffsetRatio = a3;
}

- (NSString)noteIdentifier
{
  return self->_noteIdentifier;
}

- (void)setNoteIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)loadingFromDictionaryFailed
{
  return self->_loadingFromDictionaryFailed;
}

- (void)setLoadingFromDictionaryFailed:(BOOL)a3
{
  self->_loadingFromDictionaryFailed = a3;
}

- (BOOL)isApplying
{
  return self->_isApplying;
}

- (void)setIsApplying:(BOOL)a3
{
  self->_isApplying = a3;
}

- (unint64_t)topLeftCharIndexAtCapture
{
  return self->_topLeftCharIndexAtCapture;
}

- (void)setTopLeftCharIndexAtCapture:(unint64_t)a3
{
  self->_topLeftCharIndexAtCapture = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noteIdentifier, 0);
  objc_storeStrong((id *)&self->_topLeftStringSelection, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_destroyWeak((id *)&self->_note);
}

- (void)initWithDictionary:note:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0(&dword_1DD7B0000, v0, v1, "Skipping loading text view scroll state from archive for note:%@", v2);
  OUTLINED_FUNCTION_6();
}

- (void)initWithDictionary:note:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0(&dword_1DD7B0000, v0, v1, "Loading text view scroll state from archive for note:%@", v2);
  OUTLINED_FUNCTION_6();
}

- (void)dataRepresentation
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_0();
  _os_log_error_impl(&dword_1DD7B0000, v0, OS_LOG_TYPE_ERROR, "ICTextViewScrollState: Unable to serialize dictionary %@", v1, 0xCu);
  OUTLINED_FUNCTION_6();
}

@end
