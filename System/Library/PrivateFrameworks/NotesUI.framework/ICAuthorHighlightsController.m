@implementation ICAuthorHighlightsController

void __72__ICAuthorHighlightsController_rangeHasOrNeedsHighlights_inTextStorage___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  void *v8;
  void *v9;
  char v10;
  char v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  char v17;
  char v18;
  id v19;

  v19 = a2;
  objc_msgSend(*(id *)(a1 + 32), "attributesAtIndex:effectiveRange:", a3, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsObject:", *MEMORY[0x1E0D63D18]);
  v11 = objc_msgSend(v9, "containsObject:", *MEMORY[0x1E0D63D10]);
  v12 = *MEMORY[0x1E0DC1140];
  objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1140]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v19, "objectForKeyedSubscript:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D63D50]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v14 != v15;

  }
  else
  {
    v16 = 0;
  }

  v17 = objc_msgSend(v9, "containsObject:", *MEMORY[0x1E0DC1100]);
  v18 = objc_msgSend(v9, "containsObject:", *MEMORY[0x1E0D63D20]);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v10 | v11 | v16 | v17 | v18 | objc_msgSend(v9, "containsObject:", *MEMORY[0x1E0D63908]);
  *a5 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

}

- (void)updateDerivedConfiguration
{
  void *v3;
  int v4;
  double v5;
  id v6;

  -[ICAuthorHighlightsController setFadedMultiplier:](self, "setFadedMultiplier:", 0.6);
  -[ICAuthorHighlightsController note](self, "note");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasAnyTextViewWithDarkAppearance");
  v5 = 0.2;
  if (v4)
    v5 = 0.25;
  -[ICAuthorHighlightsController setHighlightedMultiplier:](self, "setHighlightedMultiplier:", v5);

}

- (ICNote)note
{
  return self->_note;
}

- (BOOL)isPerformingHighlightUpdatesForTextStorage:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ICAuthorHighlightsController textStorageDocumentsBeingUpdated](self, "textStorageDocumentsBeingUpdated");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "document");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "containsObject:", v6);
  return (char)v4;
}

- (NSMutableSet)textStorageDocumentsBeingUpdated
{
  NSMutableSet *textStorageDocumentsBeingUpdated;
  NSMutableSet *v4;
  NSMutableSet *v5;

  textStorageDocumentsBeingUpdated = self->_textStorageDocumentsBeingUpdated;
  if (textStorageDocumentsBeingUpdated)
  {
    v4 = textStorageDocumentsBeingUpdated;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v4 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  }
  v5 = self->_textStorageDocumentsBeingUpdated;
  self->_textStorageDocumentsBeingUpdated = v4;

  return self->_textStorageDocumentsBeingUpdated;
}

- (void)textStorageDidProcessEndEditing:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  ICDynamicCast();
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (!-[ICAuthorHighlightsController isPerformingHighlightUpdatesForTextStorage:](self, "isPerformingHighlightUpdatesForTextStorage:", v8))
  {
    -[ICAuthorHighlightsController editGroupsForTextStorageDocument](self, "editGroupsForTextStorageDocument");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "document");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", v7);

  }
}

- (void)setHighlightedMultiplier:(double)a3
{
  self->_highlightedMultiplier = a3;
}

- (void)setFadedMultiplier:(double)a3
{
  self->_fadedMultiplier = a3;
}

- (BOOL)rangeHasOrNeedsHighlights:(_NSRange)a3 inTextStorage:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  NSRange v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  NSRange v19;
  NSRange v20;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  v19.location = objc_msgSend(v7, "ic_range");
  v20.location = location;
  v20.length = length;
  v8 = NSIntersectionRange(v19, v20);
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  -[ICAuthorHighlightsController highlightsAttributedStringForTextStorage:](self, "highlightsAttributedStringForTextStorage:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __72__ICAuthorHighlightsController_rangeHasOrNeedsHighlights_inTextStorage___block_invoke;
  v12[3] = &unk_1E5C1FC88;
  v10 = v7;
  v13 = v10;
  v14 = &v15;
  objc_msgSend(v9, "enumerateAttributesInRange:options:usingBlock:", v8.location, v8.length, 0, v12);
  LOBYTE(length) = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return length;
}

- (void)performHighlightUpdatesForRange:(_NSRange)a3 inTextStorage:(id)a4 updates:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  void (**v10)(id, NSUInteger, NSUInteger);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSUInteger v16;
  NSRange v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  NSRange v26;
  const __CFString *v27;
  id v28;
  const __CFString *v29;
  _QWORD v30[2];
  NSRange v31;
  NSRange v32;
  NSRange v33;
  NSRange v34;

  length = a3.length;
  location = a3.location;
  v30[1] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = (void (**)(id, NSUInteger, NSUInteger))a5;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[NSThread isMainThread]", "-[ICAuthorHighlightsController performHighlightUpdatesForRange:inTextStorage:updates:]", 1, 0, CFSTR("Unexpected call from background thread"));
  if (!v9)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((textStorage) != nil)", "-[ICAuthorHighlightsController performHighlightUpdatesForRange:inTextStorage:updates:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "textStorage");
  if (objc_msgSend(v9, "length") && length)
  {
    if (v10)
    {
      -[ICAuthorHighlightsController updateDerivedConfiguration](self, "updateDerivedConfiguration");
LABEL_9:
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = CFSTR("ICAuthorHighlightsControllerTextStorageKey");
      v30[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("ICAuthorHighlightsControllerWillPerformHighlightUpdatesNotification"), self, v12);

      -[ICAuthorHighlightsController textStorageDocumentsBeingUpdated](self, "textStorageDocumentsBeingUpdated");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "document");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v14);

      objc_opt_class();
      ICDynamicCast();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "beginPreventEditingUpdates");

      objc_msgSend(v9, "beginTemporaryAttributeEditing");
      if (v10)
        v10[2](v10, location, length);
      v33.location = objc_msgSend(v9, "ic_range");
      v33.length = v16;
      v31.location = location;
      v31.length = length;
      v17 = NSIntersectionRange(v31, v33);
      -[ICAuthorHighlightsController updateHighlightAttributesForRange:inTextStorage:](self, "updateHighlightAttributesForRange:inTextStorage:", v17.location, v17.length, v9);
      objc_msgSend(v9, "endTemporaryAttributeEditing");
      objc_opt_class();
      ICDynamicCast();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "endPreventEditingUpdates");

      -[ICAuthorHighlightsController textStorageDocumentsBeingUpdated](self, "textStorageDocumentsBeingUpdated");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "document");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "removeObject:", v20);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = CFSTR("ICAuthorHighlightsControllerTextStorageKey");
      v28 = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "postNotificationName:object:userInfo:", CFSTR("ICAuthorHighlightsControllerDidPerformHighlightUpdatesNotification"), self, v22);

      goto LABEL_20;
    }
    if (-[ICAuthorHighlightsController isPerformingHighlightUpdatesForTextStorage:](self, "isPerformingHighlightUpdatesForTextStorage:", v9))
    {
      goto LABEL_20;
    }
    -[ICAuthorHighlightsController updateDerivedConfiguration](self, "updateDerivedConfiguration");
    if (!-[ICAuthorHighlightsController rangeHasOrNeedsHighlights:inTextStorage:](self, "rangeHasOrNeedsHighlights:inTextStorage:", location, length, v9))goto LABEL_20;
    if (!-[ICAuthorHighlightsController coalesceAuthorHighlightUpdates](self, "coalesceAuthorHighlightUpdates"))
      goto LABEL_9;
    -[ICAuthorHighlightsController invalidHighlightsTextStorage](self, "invalidHighlightsTextStorage");
    v23 = objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v24 = (void *)v23;
      -[ICAuthorHighlightsController invalidHighlightsTextStorage](self, "invalidHighlightsTextStorage");
      v25 = (id)objc_claimAutoreleasedReturnValue();

      if (v25 != v9)
        goto LABEL_9;
    }
    -[ICAuthorHighlightsController setInvalidHighlightsTextStorage:](self, "setInvalidHighlightsTextStorage:", v9);
    if (-[ICAuthorHighlightsController invalidHighlightsRange](self, "invalidHighlightsRange") != 0x7FFFFFFFFFFFFFFFLL)
    {
      v32.location = -[ICAuthorHighlightsController invalidHighlightsRange](self, "invalidHighlightsRange");
      v34.location = location;
      v34.length = length;
      v26 = NSUnionRange(v32, v34);
      location = v26.location;
      length = v26.length;
    }
    -[ICAuthorHighlightsController setInvalidHighlightsRange:](self, "setInvalidHighlightsRange:", location, length);
  }
LABEL_20:

}

- (ICAuthorHighlightsController)initWithNote:(id)a3 textLayoutManager:(id)a4
{
  id v7;
  id v8;
  ICAuthorHighlightsController *v9;
  ICAuthorHighlightsController *v10;
  void *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ICAuthorHighlightsController;
  v9 = -[ICAuthorHighlightsController init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_note, a3);
    objc_storeStrong((id *)&v10->_textLayoutManager, a4);
    v10->_allowsAnimations = 1;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v10, sel_textStorageDidProcessEndEditing_, CFSTR("ICTTTextStorageDidProcessEndEditingNotification"), 0);

    -[ICAuthorHighlightsController updateDerivedConfiguration](v10, "updateDerivedConfiguration");
  }

  return v10;
}

- (id)highlightsAttributedStringForTextStorage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = a3;
  objc_opt_class();
  ICDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_opt_class();
    objc_msgSend(v3, "highlightsAttributedString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ICCheckedDynamicCast();
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (NSCache)editGroupsForTextStorageDocument
{
  NSCache *editGroupsForTextStorageDocument;
  NSCache *v4;
  NSCache *v5;

  editGroupsForTextStorageDocument = self->_editGroupsForTextStorageDocument;
  if (editGroupsForTextStorageDocument)
    v4 = editGroupsForTextStorageDocument;
  else
    v4 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
  v5 = self->_editGroupsForTextStorageDocument;
  self->_editGroupsForTextStorageDocument = v4;

  return self->_editGroupsForTextStorageDocument;
}

- (ICAuthorHighlightsController)initWithNote:(id)a3
{
  return -[ICAuthorHighlightsController initWithNote:textLayoutManager:](self, "initWithNote:textLayoutManager:", a3, 0);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ICAuthorHighlightsController;
  -[ICAuthorHighlightsController dealloc](&v4, sel_dealloc);
}

- (id)highlightColorForUserID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[ICAuthorHighlightsController note](self, "note");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collaborationColorManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthorHighlightsController note](self, "note");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "highlightColorForUserID:note:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setHighlightValue:(id)a3 forRange:(_NSRange)a4 inTextStorage:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  NSRange v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  NSRange v19;
  NSRange v20;
  NSRange v21;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v10 = a5;
  -[ICAuthorHighlightsController updateDerivedConfiguration](self, "updateDerivedConfiguration");
  v20.location = objc_msgSend(v10, "ic_range");
  v21.location = location;
  v21.length = length;
  v11 = NSIntersectionRange(v20, v21);
  -[ICAuthorHighlightsController highlightsAttributedStringForTextStorage:](self, "highlightsAttributedStringForTextStorage:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = *MEMORY[0x1E0D63D18];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __73__ICAuthorHighlightsController_setHighlightValue_forRange_inTextStorage___block_invoke;
  v16[3] = &unk_1E5C1FBC0;
  v17 = v9;
  v18 = v12;
  v19 = v11;
  v14 = v12;
  v15 = v9;
  objc_msgSend(v14, "enumerateAttribute:inRange:options:usingBlock:", v13, v11.location, v11.length, 0x100000, v16);

}

void __73__ICAuthorHighlightsController_setHighlightValue_forRange_inTextStorage___block_invoke(uint64_t a1, void *a2)
{
  ICAuthorHighlightValueAttribute *v3;
  void *v4;
  void *v5;
  float v6;
  void *v7;
  id v8;

  v8 = a2;
  v3 = objc_alloc_init(ICAuthorHighlightValueAttribute);
  objc_msgSend(*(id *)(a1 + 32), "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "floatValue");
    -[ICAuthorHighlightValueAttribute setValue:](v3, "setValue:", v6);

  }
  else
  {
    objc_msgSend(v8, "value");
    -[ICAuthorHighlightValueAttribute setValue:](v3, "setValue:");
  }

  objc_msgSend(*(id *)(a1 + 32), "color");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthorHighlightValueAttribute setColor:](v3, "setColor:", v7);

  objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *MEMORY[0x1E0D63D18], v3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)removeHighlightValuesForRange:(_NSRange)a3 inTextStorage:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v6;

  length = a3.length;
  location = a3.location;
  -[ICAuthorHighlightsController highlightsAttributedStringForTextStorage:](self, "highlightsAttributedStringForTextStorage:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAttribute:range:", *MEMORY[0x1E0D63D18], location, length);

}

- (BOOL)isAnimating
{
  void *v2;
  BOOL v3;

  -[ICAuthorHighlightsController textStorageDocumentsNeedingHighlightUpdates](self, "textStorageDocumentsNeedingHighlightUpdates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)shouldAnimateInTextStorage:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;

  v4 = a3;
  if (-[ICAuthorHighlightsController allowsAnimations](self, "allowsAnimations"))
  {
    -[ICAuthorHighlightsController now](self, "now");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = 1;
    }
    else
    {
      objc_msgSend(v4, "textViews");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v7, "count") != 0;

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)setHighlightAnimation:(id)a3 forRange:(_NSRange)a4 inTextStorage:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSRange v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  ICAuthorHighlightsController *v25;
  id v26;
  NSRange v27;
  NSRange v28;

  length = a4.length;
  location = a4.location;
  v20 = a3;
  v9 = a5;
  if (-[ICAuthorHighlightsController shouldAnimateInTextStorage:](self, "shouldAnimateInTextStorage:", v9)
    || (objc_msgSend(v20, "isRemovedOnCompletion") & 1) == 0)
  {
    -[ICAuthorHighlightsController removeHighlightAnimationsForRange:inTextStorage:](self, "removeHighlightAnimationsForRange:inTextStorage:", location, length, v9, v20);
    -[ICAuthorHighlightsController updateDerivedConfiguration](self, "updateDerivedConfiguration");
    -[ICAuthorHighlightsController now](self, "now");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;

    v27.location = objc_msgSend(v9, "ic_range");
    v28.location = location;
    v28.length = length;
    v14 = NSIntersectionRange(v27, v28);
    -[ICAuthorHighlightsController highlightsAttributedStringForTextStorage:](self, "highlightsAttributedStringForTextStorage:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *MEMORY[0x1E0D63D18];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __77__ICAuthorHighlightsController_setHighlightAnimation_forRange_inTextStorage___block_invoke;
    v21[3] = &unk_1E5C1FBE8;
    v22 = v13;
    v23 = v20;
    v24 = v15;
    v25 = self;
    v17 = v9;
    v26 = v17;
    v18 = v15;
    v19 = v13;
    objc_msgSend(v18, "enumerateAttribute:inRange:options:usingBlock:", v16, v14.location, v14.length, 0x100000, v21);
    if (!-[ICAuthorHighlightsController shouldAnimateInTextStorage:](self, "shouldAnimateInTextStorage:", v17))
      -[ICAuthorHighlightsController removeHighlightAnimationsForRange:inTextStorage:](self, "removeHighlightAnimationsForRange:inTextStorage:", v14.location, v14.length, v17);

  }
}

void __77__ICAuthorHighlightsController_setHighlightAnimation_forRange_inTextStorage___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  ICAuthorHighlightAnimationAttribute *v7;
  void *v8;
  void *v9;
  float v10;
  void *v11;
  void *v12;
  float v13;
  void *v14;
  float v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;

  v21 = a2;
  v7 = -[ICAuthorHighlightAnimationAttribute initWithStartDate:]([ICAuthorHighlightAnimationAttribute alloc], "initWithStartDate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "duration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 40), "duration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "floatValue");
    -[ICAuthorHighlightAnimationAttribute setDuration:](v7, "setDuration:", v10);

  }
  else
  {
    -[ICAuthorHighlightAnimationAttribute setDuration:](v7, "setDuration:", 0.25);
  }

  objc_msgSend(*(id *)(a1 + 40), "fromValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 40), "fromValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "floatValue");
    -[ICAuthorHighlightAnimationAttribute setFromValue:](v7, "setFromValue:", v13);

  }
  else
  {
    objc_msgSend(v21, "value");
    -[ICAuthorHighlightAnimationAttribute setFromValue:](v7, "setFromValue:");
  }

  objc_msgSend(*(id *)(a1 + 40), "toValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "floatValue");
  -[ICAuthorHighlightAnimationAttribute setToValue:](v7, "setToValue:", v15);

  objc_msgSend(*(id *)(a1 + 40), "color");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthorHighlightAnimationAttribute setColor:](v7, "setColor:", v16);

  -[ICAuthorHighlightAnimationAttribute setAboveExistingHighlights:](v7, "setAboveExistingHighlights:", objc_msgSend(*(id *)(a1 + 40), "isAboveExistingHighlights"));
  -[ICAuthorHighlightAnimationAttribute setRemovedOnCompletion:](v7, "setRemovedOnCompletion:", objc_msgSend(*(id *)(a1 + 40), "isRemovedOnCompletion"));
  -[ICAuthorHighlightAnimationAttribute fromValue](v7, "fromValue");
  v18 = v17;
  -[ICAuthorHighlightAnimationAttribute toValue](v7, "toValue");
  if (vabdd_f64(v18, v19) >= 0.00999999978)
  {
    objc_msgSend(*(id *)(a1 + 48), "addAttribute:value:range:", *MEMORY[0x1E0D63D10], v7, a3, a4);
    if (-[ICAuthorHighlightAnimationAttribute isRemovedOnCompletion](v7, "isRemovedOnCompletion"))
    {
      -[ICAuthorHighlightAnimationAttribute duration](v7, "duration");
      if (v20 <= 0.0)
        objc_msgSend(*(id *)(a1 + 56), "removeHighlightAnimationsForRange:inTextStorage:", a3, a4, *(_QWORD *)(a1 + 64));
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "removeAttribute:range:", *MEMORY[0x1E0D63D18], a3, a4);
    }
  }

}

- (void)removeHighlightAnimationsForRange:(_NSRange)a3 inTextStorage:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  NSRange v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  NSRange v15;
  NSRange v16;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  v15.location = objc_msgSend(v7, "ic_range");
  v16.location = location;
  v16.length = length;
  v8 = NSIntersectionRange(v15, v16);
  -[ICAuthorHighlightsController highlightsAttributedStringForTextStorage:](self, "highlightsAttributedStringForTextStorage:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (_QWORD *)MEMORY[0x1E0D63D10];
  v11 = *MEMORY[0x1E0D63D10];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __80__ICAuthorHighlightsController_removeHighlightAnimationsForRange_inTextStorage___block_invoke;
  v13[3] = &unk_1E5C1FC38;
  v14 = v9;
  v12 = v9;
  objc_msgSend(v12, "enumerateAttribute:inRange:options:usingBlock:", v11, v8.location, v8.length, 0x100000, v13);
  objc_msgSend(v12, "removeAttribute:range:", *v10, v8.location, v8.length);

}

void __80__ICAuthorHighlightsController_removeHighlightAnimationsForRange_inTextStorage___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v7 = a2;
  v8 = v7;
  if (v7)
  {
    v12 = v7;
    v9 = objc_msgSend(v7, "isRemovedOnCompletion");
    v8 = v12;
    if ((v9 & 1) == 0)
    {
      v10 = *(void **)(a1 + 32);
      v11 = *MEMORY[0x1E0D63D18];
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __80__ICAuthorHighlightsController_removeHighlightAnimationsForRange_inTextStorage___block_invoke_2;
      v13[3] = &unk_1E5C1FC10;
      v14 = v12;
      v15 = *(id *)(a1 + 32);
      objc_msgSend(v10, "enumerateAttribute:inRange:options:usingBlock:", v11, a3, a4, 0, v13);

      v8 = v12;
    }
  }

}

void __80__ICAuthorHighlightsController_removeHighlightAnimationsForRange_inTextStorage___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  ICAuthorHighlightValueAttribute *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  id v13;

  v13 = a2;
  v7 = objc_alloc_init(ICAuthorHighlightValueAttribute);
  if (objc_msgSend(*(id *)(a1 + 32), "isAboveExistingHighlights"))
  {
    objc_msgSend(v13, "value");
    v9 = v8;
    objc_msgSend(*(id *)(a1 + 32), "toValue");
    v11 = v9 + v10;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "toValue");
  }
  -[ICAuthorHighlightValueAttribute setValue:](v7, "setValue:", v11);
  objc_msgSend(*(id *)(a1 + 32), "color");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthorHighlightValueAttribute setColor:](v7, "setColor:", v12);

  objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *MEMORY[0x1E0D63D18], v7, a3, a4);
}

- (void)flashHighlightsForRange:(_NSRange)a3 withDuration:(id)a4 inTextStorage:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  NSRange v10;
  void *v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  ICAuthorHighlightsController *v16;
  id v17;
  NSRange v18;
  NSRange v19;

  length = a3.length;
  location = a3.location;
  v13 = a4;
  v9 = a5;
  if (-[ICAuthorHighlightsController shouldAnimateInTextStorage:](self, "shouldAnimateInTextStorage:", v9))
  {
    -[ICAuthorHighlightsController updateDerivedConfiguration](self, "updateDerivedConfiguration");
    v18.location = objc_msgSend(v9, "ic_range");
    v19.location = location;
    v19.length = length;
    v10 = NSIntersectionRange(v18, v19);
    -[ICAuthorHighlightsController highlightsAttributedStringForTextStorage:](self, "highlightsAttributedStringForTextStorage:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x1E0D63D18];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __83__ICAuthorHighlightsController_flashHighlightsForRange_withDuration_inTextStorage___block_invoke;
    v14[3] = &unk_1E5C1FC60;
    v15 = v13;
    v16 = self;
    v17 = v9;
    objc_msgSend(v11, "enumerateAttribute:inRange:options:usingBlock:", v12, v10.location, v10.length, 0, v14);

  }
}

void __83__ICAuthorHighlightsController_flashHighlightsForRange_withDuration_inTextStorage___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  ICAuthorHighlightAnimation *v7;
  ICAuthorHighlightAnimation *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a2;
  v7 = objc_alloc_init(ICAuthorHighlightAnimation);
  v8 = v7;
  if (*(_QWORD *)(a1 + 32))
  {
    -[ICAuthorHighlightAnimation setDuration:](v7, "setDuration:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 2.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAuthorHighlightAnimation setDuration:](v8, "setDuration:", v9);

  }
  objc_msgSend(v19, "value");
  v11 = v10;
  v12 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v19, "value");
  v14 = -1.0;
  if (v11 <= 0.0)
    v14 = 1.0;
  objc_msgSend(v12, "numberWithDouble:", v13 + v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthorHighlightAnimation setFromValue:](v8, "setFromValue:", v15);

  v16 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v19, "value");
  objc_msgSend(v16, "numberWithDouble:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthorHighlightAnimation setToValue:](v8, "setToValue:", v17);

  objc_msgSend(v19, "color");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthorHighlightAnimation setColor:](v8, "setColor:", v18);

  -[ICAuthorHighlightAnimation setRemovedOnCompletion:](v8, "setRemovedOnCompletion:", 1);
  objc_msgSend(*(id *)(a1 + 40), "setHighlightAnimation:forRange:inTextStorage:", v8, a3, a4, *(_QWORD *)(a1 + 48));

}

- (void)setCoalesceAuthorHighlightUpdates:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[NSThread isMainThread]", "-[ICAuthorHighlightsController setCoalesceAuthorHighlightUpdates:]", 1, 0, CFSTR("Unexpected call from background thread"));
  if (self->_coalesceAuthorHighlightUpdates != v3)
  {
    self->_coalesceAuthorHighlightUpdates = v3;
    if (!v3
      && -[ICAuthorHighlightsController invalidHighlightsRange](self, "invalidHighlightsRange") != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[ICAuthorHighlightsController invalidHighlightsRange](self, "invalidHighlightsRange");
      if (v5)
      {
        -[ICAuthorHighlightsController invalidHighlightsTextStorage](self, "invalidHighlightsTextStorage");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (v6)
        {
          v7 = -[ICAuthorHighlightsController invalidHighlightsRange](self, "invalidHighlightsRange");
          v9 = v8;
          -[ICAuthorHighlightsController invalidHighlightsTextStorage](self, "invalidHighlightsTextStorage");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICAuthorHighlightsController performHighlightUpdatesForRange:inTextStorage:updates:](self, "performHighlightUpdatesForRange:inTextStorage:updates:", v7, v9, v10, 0);

        }
      }
    }
    -[ICAuthorHighlightsController setInvalidHighlightsRange:](self, "setInvalidHighlightsRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
    -[ICAuthorHighlightsController setInvalidHighlightsTextStorage:](self, "setInvalidHighlightsTextStorage:", 0);
  }
}

- (void)extendHighlightsForRange:(_NSRange)a3 inTextStorage:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  NSRange v7;
  void *v8;
  void *v9;
  id v10;
  NSRange v11;
  NSRange v12;

  length = a3.length;
  location = a3.location;
  v10 = a4;
  v11.location = objc_msgSend(v10, "ic_range");
  v12.location = location;
  v12.length = length;
  v7 = NSIntersectionRange(v11, v12);
  -[ICAuthorHighlightsController editGroupsForTextStorageDocument](self, "editGroupsForTextStorageDocument");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "document");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObjectForKey:", v9);

  -[ICAuthorHighlightsController extendHighlightsForRange:inTextStorage:reverse:](self, "extendHighlightsForRange:inTextStorage:reverse:", v7.location, v7.length, v10, 0);
  -[ICAuthorHighlightsController extendHighlightsForRange:inTextStorage:reverse:](self, "extendHighlightsForRange:inTextStorage:reverse:", v7.location, v7.length, v10, 1);

}

- (void)extendHighlightsForRange:(_NSRange)a3 inTextStorage:(id)a4 reverse:(BOOL)a5
{
  _BOOL4 v5;
  NSUInteger length;
  NSUInteger location;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;

  v5 = a5;
  length = a3.length;
  location = a3.location;
  v9 = a4;
  v10 = v9;
  if (v5)
    v11 = length;
  else
    v11 = -1;
  objc_msgSend(v9, "attributesAtIndex:effectiveRange:", location + v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__26;
  v22[4] = __Block_byref_object_dispose__26;
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D63D18]);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__26;
  v20[4] = __Block_byref_object_dispose__26;
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D63D10]);
  v21 = (id)objc_claimAutoreleasedReturnValue();
  -[ICAuthorHighlightsController highlightsAttributedStringForTextStorage:](self, "highlightsAttributedStringForTextStorage:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v14 = 2;
  else
    v14 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __79__ICAuthorHighlightsController_extendHighlightsForRange_inTextStorage_reverse___block_invoke;
  v16[3] = &unk_1E5C1FCB0;
  v18 = v22;
  v15 = v13;
  v17 = v15;
  v19 = v20;
  objc_msgSend(v15, "enumerateAttributesInRange:options:usingBlock:", location, length, v14, v16);

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v22, 8);

}

void __79__ICAuthorHighlightsController_extendHighlightsForRange_inTextStorage_reverse___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;

  v7 = a2;
  v8 = *MEMORY[0x1E0D63D18];
  v18 = v7;
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D63D18]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = v9;
  if (!v9)
    v11 = *(void **)(v10 + 40);
  objc_storeStrong((id *)(v10 + 40), v11);

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(v18, "objectForKeyedSubscript:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", v8, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3, a4);
  }
  v13 = (_QWORD *)MEMORY[0x1E0D63D10];
  objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0D63D10]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v16 = v14;
  if (!v14)
    v16 = *(void **)(v15 + 40);
  objc_storeStrong((id *)(v15 + 40), v16);

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(v18, "objectForKeyedSubscript:", *v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
      objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *v13, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3, a4);
  }

}

- (NSMutableSet)textStorageDocumentsNeedingHighlightUpdates
{
  NSMutableSet *textStorageDocumentsNeedingHighlightUpdates;
  NSMutableSet *v4;
  NSMutableSet *v5;

  textStorageDocumentsNeedingHighlightUpdates = self->_textStorageDocumentsNeedingHighlightUpdates;
  if (textStorageDocumentsNeedingHighlightUpdates)
  {
    v4 = textStorageDocumentsNeedingHighlightUpdates;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v4 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  }
  v5 = self->_textStorageDocumentsNeedingHighlightUpdates;
  self->_textStorageDocumentsNeedingHighlightUpdates = v4;

  return self->_textStorageDocumentsNeedingHighlightUpdates;
}

- (CADisplayLink)highlightAnimationsDisplayLink
{
  CADisplayLink *highlightAnimationsDisplayLink;
  void *v4;
  CADisplayLink *v5;
  CADisplayLink *v6;
  CADisplayLink *v7;
  void *v8;

  highlightAnimationsDisplayLink = self->_highlightAnimationsDisplayLink;
  if (!highlightAnimationsDisplayLink)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayLinkWithTarget:selector:", self, sel_updateHighlightAnimationsIfNeeded);
    v5 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
    v6 = self->_highlightAnimationsDisplayLink;
    self->_highlightAnimationsDisplayLink = v5;

    v7 = self->_highlightAnimationsDisplayLink;
    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADisplayLink addToRunLoop:forMode:](v7, "addToRunLoop:forMode:", v8, *MEMORY[0x1E0C99860]);

    highlightAnimationsDisplayLink = self->_highlightAnimationsDisplayLink;
  }
  return highlightAnimationsDisplayLink;
}

- (void)updateHighlightAnimationsIfNeeded
{
  void *v3;
  uint64_t v4;
  id v5;

  -[ICAuthorHighlightsController textStorageDocumentsNeedingHighlightUpdates](self, "textStorageDocumentsNeedingHighlightUpdates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    performBlockOnMainThreadAndWait();
  }
  else
  {
    -[ICAuthorHighlightsController highlightAnimationsDisplayLink](self, "highlightAnimationsDisplayLink");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPaused:", 1);

  }
}

void __65__ICAuthorHighlightsController_updateHighlightAnimationsIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id obj;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  const char *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "textStorageDocumentsNeedingHighlightUpdates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  obj = v3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v28 != v5)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_opt_class();
        objc_opt_class();
        ICDynamicCast();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "mergeableString");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "delegate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        ICDynamicCast();
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          v22 = 0;
          v23 = &v22;
          v24 = 0x3010000000;
          v25 = "";
          v26 = xmmword_1ACA582A0;
          objc_msgSend(*(id *)(a1 + 32), "highlightsAttributedStringForTextStorage:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = *MEMORY[0x1E0D63D10];
          v14 = objc_msgSend(v11, "ic_range");
          v21[0] = MEMORY[0x1E0C809B0];
          v21[1] = 3221225472;
          v21[2] = __65__ICAuthorHighlightsController_updateHighlightAnimationsIfNeeded__block_invoke_2;
          v21[3] = &unk_1E5C1FCD8;
          v21[4] = &v22;
          objc_msgSend(v12, "enumerateAttribute:inRange:options:usingBlock:", v13, v14, v15, 0, v21);
          v16 = v23[5];
          if (v16)
          {
            objc_msgSend(*(id *)(a1 + 32), "performHighlightUpdatesForRange:inTextStorage:updates:", v23[4], v16, v11, &__block_literal_global_31);
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 32), "textStorageDocumentsNeedingHighlightUpdates");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "document");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "removeObject:", v19);

          }
          _Block_object_dispose(&v22, 8);
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 32), "textStorageDocumentsNeedingHighlightUpdates");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "removeObject:", v7);

        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v4);
  }

}

void __65__ICAuthorHighlightsController_updateHighlightAnimationsIfNeeded__block_invoke_2(uint64_t a1, void *a2, NSUInteger a3, NSUInteger length)
{
  NSRange v7;
  uint64_t v8;
  id location;
  NSRange v10;

  v7.location = (NSUInteger)a2;
  if (v7.location)
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7.length = *(_QWORD *)(v8 + 40);
    if (v7.length)
    {
      location = (id)v7.location;
      v7.location = *(_QWORD *)(v8 + 32);
      v10.location = a3;
      v10.length = length;
      v7 = NSUnionRange(v7, v10);
      a3 = v7.location;
      v7.location = (NSUInteger)location;
      length = v7.length;
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    }
    *(_QWORD *)(v8 + 32) = a3;
    *(_QWORD *)(v8 + 40) = length;
  }

}

- (ICTTTextEditGrouper)editGrouper
{
  ICTTTextEditGrouper *editGrouper;
  id v4;
  void *v5;
  ICTTTextEditGrouper *v6;
  ICTTTextEditGrouper *v7;
  id v8;
  void *v9;

  editGrouper = self->_editGrouper;
  if (!editGrouper)
  {
    v4 = objc_alloc(MEMORY[0x1E0D63CB8]);
    -[ICAuthorHighlightsController note](self, "note");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (ICTTTextEditGrouper *)objc_msgSend(v4, "initWithNote:", v5);
    v7 = self->_editGrouper;
    self->_editGrouper = v6;

    -[ICTTTextEditGrouper setJoinsWhitespaceAndNewlineGaps:](self->_editGrouper, "setJoinsWhitespaceAndNewlineGaps:", 1);
    v8 = objc_alloc_init(MEMORY[0x1E0D63CA8]);
    -[ICTTTextEditGrouper setFilter:](self->_editGrouper, "setFilter:", v8);

    -[ICTTTextEditGrouper filter](self->_editGrouper, "filter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAllowsMissingUsers:", 0);

    editGrouper = self->_editGrouper;
  }
  return editGrouper;
}

- (id)editGroupsForTextStorage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[ICAuthorHighlightsController editGroupsForTextStorageDocument](self, "editGroupsForTextStorageDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "document");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[ICAuthorHighlightsController editGrouper](self, "editGrouper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v4, "ic_range");
    objc_msgSend(v4, "editsInRange:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "groupedEditsForEdits:inAttributedString:", v11, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICAuthorHighlightsController editGroupsForTextStorageDocument](self, "editGroupsForTextStorageDocument");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "document");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v7, v13);

  }
  return v7;
}

- (void)updateHighlightAttributesForRange:(_NSRange)a3 inTextStorage:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  ICAuthorHighlightsController *v24;
  id v25;
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  -[ICAuthorHighlightsController now](self, "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  -[ICAuthorHighlightsController editGroupsForTextStorage:](self, "editGroupsForTextStorage:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  -[ICAuthorHighlightsController highlightsAttributedStringForTextStorage:](self, "highlightsAttributedStringForTextStorage:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __80__ICAuthorHighlightsController_updateHighlightAttributesForRange_inTextStorage___block_invoke;
  v22[3] = &unk_1E5C1FD40;
  v14 = v11;
  v23 = v14;
  v24 = self;
  v15 = v7;
  v25 = v15;
  v27 = &v28;
  v16 = v12;
  v26 = v16;
  objc_msgSend(v13, "enumerateAttributesInRange:options:usingBlock:", location, length, 0, v22);
  if (*((_BYTE *)v29 + 24))
  {
    -[ICAuthorHighlightsController textStorageDocumentsNeedingHighlightUpdates](self, "textStorageDocumentsNeedingHighlightUpdates");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "document");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v18);

    -[ICAuthorHighlightsController highlightAnimationsDisplayLink](self, "highlightAnimationsDisplayLink");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setPaused:", 0);
LABEL_9:

    goto LABEL_10;
  }
  if (location == objc_msgSend(v15, "ic_range") && length == v20)
  {
    -[ICAuthorHighlightsController textStorageDocumentsNeedingHighlightUpdates](self, "textStorageDocumentsNeedingHighlightUpdates");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "document");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "removeObject:", v21);

    goto LABEL_9;
  }
LABEL_10:

  _Block_object_dispose(&v28, 8);
}

void __80__ICAuthorHighlightsController_updateHighlightAttributesForRange_inTextStorage___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  int v27;
  double v28;
  id v29;

  v7 = *MEMORY[0x1E0D63D18];
  v8 = a2;
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v29 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D63D10]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v29, "value");
  v11 = v10;
  objc_msgSend(v9, "color");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    objc_msgSend(v29, "color");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;

  if (v9)
  {
    v16 = *(void **)(a1 + 32);
    objc_msgSend(v9, "startDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "timeIntervalSinceDate:", v17);
    v19 = v18;

    objc_msgSend(v9, "duration");
    v21 = v19 / v20;
    if (v21 < 0.0)
      v21 = 0.0;
    v22 = fmin(v21, 1.0);
    objc_msgSend(v9, "fromValue");
    v24 = v23;
    objc_msgSend(v9, "toValue");
    v26 = v25 * v22 + v24 * (1.0 - v22);
    v27 = objc_msgSend(v9, "isAboveExistingHighlights");
    v28 = -0.0;
    if (v27)
      v28 = v11;
    v11 = v28 + v26;
    if (v22 < 1.0 && (objc_msgSend(*(id *)(a1 + 40), "shouldAnimateInTextStorage:", *(_QWORD *)(a1 + 48)) & 1) != 0)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    else
      objc_msgSend(*(id *)(a1 + 40), "removeHighlightAnimationsForRange:inTextStorage:", a3, a4, *(_QWORD *)(a1 + 48));
  }
  objc_msgSend(*(id *)(a1 + 40), "setHighlightAttributesForHighlightValue:highlightColor:forRange:inTextStorage:editGroups:", v15, a3, a4, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v11);

}

- (void)setHighlightAttributesForHighlightValue:(double)a3 highlightColor:(id)a4 forRange:(_NSRange)a5 inTextStorage:(id)a6 editGroups:(id)a7
{
  NSUInteger length;
  NSUInteger location;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  double v19;
  NSUInteger v20;
  NSUInteger v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  NSRange v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id obj;
  _QWORD range2[3];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;
  NSRange v39;
  NSRange v40;

  length = a5.length;
  location = a5.location;
  v38 = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v14 = a6;
  v15 = a7;
  -[ICAuthorHighlightsController highlightsAttributedStringForTextStorage:](self, "highlightsAttributedStringForTextStorage:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *MEMORY[0x1E0D63D30];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAttribute:value:range:", v17, v18, location, length);

  -[ICAuthorHighlightsController setAttachmentHighlightValue:highlightColor:forRange:inTextStorage:](self, "setAttachmentHighlightValue:highlightColor:forRange:inTextStorage:", 0, location, length, v14, a3);
  v19 = 0.0;
  if (!v13)
    v19 = a3;
  -[ICAuthorHighlightsController setCheckmarkHighlightValue:highlightColor:forRange:inTextStorage:](self, "setCheckmarkHighlightValue:highlightColor:forRange:inTextStorage:", 0, location, length, v14, v19);
  range2[0] = location;
  v20 = location;
  v21 = length;
  -[ICAuthorHighlightsController setTextHighlightValue:highlightColor:blendsTextColor:forRange:inTextStorage:](self, "setTextHighlightValue:highlightColor:blendsTextColor:forRange:inTextStorage:", 0, 0, v20, length, v14, a3);
  if (a3 > 0.0)
  {
    if (v13)
    {
      -[ICAuthorHighlightsController setAttachmentHighlightValue:highlightColor:forRange:inTextStorage:](self, "setAttachmentHighlightValue:highlightColor:forRange:inTextStorage:", v13, range2[0], length, v14, a3);
      -[ICAuthorHighlightsController setTextHighlightValue:highlightColor:blendsTextColor:forRange:inTextStorage:](self, "setTextHighlightValue:highlightColor:blendsTextColor:forRange:inTextStorage:", v13, 0, range2[0], length, v14, a3);
    }
    else
    {
      v30 = v16;
      v31 = v15;
      v35 = 0u;
      v36 = 0u;
      *(_OWORD *)&range2[1] = 0u;
      v34 = 0u;
      obj = v15;
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &range2[1], v37, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v34 != v24)
              objc_enumerationMutation(obj);
            v26 = *(void **)(range2[2] + 8 * i);
            v39.location = objc_msgSend(v26, "range");
            v40.location = range2[0];
            v40.length = v21;
            v27 = NSIntersectionRange(v39, v40);
            if (v27.length)
            {
              objc_msgSend(v26, "userID");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              -[ICAuthorHighlightsController highlightColorForUserID:](self, "highlightColorForUserID:", v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();

              -[ICAuthorHighlightsController setAttachmentHighlightValue:highlightColor:forRange:inTextStorage:](self, "setAttachmentHighlightValue:highlightColor:forRange:inTextStorage:", v29, v27.location, v27.length, v14, a3);
              -[ICAuthorHighlightsController setCheckmarkHighlightValue:highlightColor:forRange:inTextStorage:](self, "setCheckmarkHighlightValue:highlightColor:forRange:inTextStorage:", v29, v27.location, v27.length, v14, a3);
              -[ICAuthorHighlightsController setTextHighlightValue:highlightColor:blendsTextColor:forRange:inTextStorage:](self, "setTextHighlightValue:highlightColor:blendsTextColor:forRange:inTextStorage:", v29, 1, v27.location, v27.length, v14, a3);

            }
          }
          v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &range2[1], v37, 16);
        }
        while (v23);
      }

      v15 = v31;
      v13 = 0;
      v16 = v30;
    }
  }

}

- (void)setAttachmentHighlightValue:(double)a3 highlightColor:(id)a4 forRange:(_NSRange)a5 inTextStorage:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  id v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  double v24;
  double v25;

  length = a5.length;
  location = a5.location;
  v11 = a6;
  v12 = a4;
  -[ICAuthorHighlightsController fadedMultiplier](self, "fadedMultiplier");
  v14 = a3 * v13 + 1.0;
  if (v14 < 0.0)
    v14 = 0.0;
  v15 = fmin(v14, 1.0);
  if (a3 >= 0.0)
    v16 = a3;
  else
    v16 = 0.0;
  objc_msgSend(v12, "colorWithAlphaComponent:", fmin(v16, 1.0));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = *MEMORY[0x1E0DC10F8];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __98__ICAuthorHighlightsController_setAttachmentHighlightValue_highlightColor_forRange_inTextStorage___block_invoke;
  v21[3] = &unk_1E5C1FD68;
  v22 = v17;
  v23 = v11;
  v24 = v15;
  v25 = a3;
  v19 = v11;
  v20 = v17;
  objc_msgSend(v19, "enumerateAttribute:inRange:options:usingBlock:", v18, location, length, 0, v21);

}

void __98__ICAuthorHighlightsController_setAttachmentHighlightValue_highlightColor_forRange_inTextStorage___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_opt_class();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "setForegroundAlpha:", *(double *)(a1 + 48));
    objc_msgSend(v6, "setHighlightColor:", *(_QWORD *)(a1 + 32));
    if (ICInternalSettingsIsTextKit2Enabled()
      && (objc_msgSend(*(id *)(a1 + 40), "textLayoutManagers"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v7, "count"),
          v7,
          v8))
    {
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      objc_msgSend(*(id *)(a1 + 40), "textLayoutManagers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      if (v10)
      {
        v11 = v10;
        v31 = v4;
        v33 = *(_QWORD *)v39;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v39 != v33)
              objc_enumerationMutation(v9);
            v13 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
            objc_msgSend(v6, "viewIdentifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "existingAttachmentViewForIdentifier:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            objc_opt_class();
            ICDynamicCast();
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v16;
            if (v16)
            {
              objc_msgSend(v16, "setForegroundAlpha:", *(double *)(a1 + 48));
              objc_msgSend(v17, "setHighlightColor:", *(_QWORD *)(a1 + 32));
            }
            objc_opt_class();
            ICDynamicCast();
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (v18)
            {
              objc_msgSend(*(id *)(a1 + 40), "attributesAtIndex:effectiveRange:", a3, 0);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = (void *)objc_msgSend(v19, "mutableCopy");

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 56));
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0D63D30]);

              v22 = (void *)objc_msgSend(v20, "copy");
              objc_msgSend(v18, "updateHighlightsWithAttributes:", v22);

            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
        }
        while (v11);
        v4 = v31;
      }
    }
    else
    {
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      objc_msgSend(*(id *)(a1 + 40), "layoutManagers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      if (v23)
      {
        v24 = v23;
        v25 = v4;
        v26 = *(_QWORD *)v35;
        do
        {
          for (j = 0; j != v24; ++j)
          {
            if (*(_QWORD *)v35 != v26)
              objc_enumerationMutation(v9);
            v28 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
            objc_opt_class();
            objc_msgSend(v28, "viewForTextAttachmentNoCreate:", v6);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            ICDynamicCast();
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v30, "setForegroundAlpha:", *(double *)(a1 + 48));
            objc_msgSend(v30, "setHighlightColor:", *(_QWORD *)(a1 + 32));

          }
          v24 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
        }
        while (v24);
        v4 = v25;
      }
    }

  }
}

- (void)setCheckmarkHighlightValue:(double)a3 highlightColor:(id)a4 forRange:(_NSRange)a5 inTextStorage:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  id v11;
  id v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  double v25;
  double v26;

  length = a5.length;
  location = a5.location;
  v11 = a4;
  v12 = a6;
  -[ICAuthorHighlightsController fadedMultiplier](self, "fadedMultiplier");
  v14 = a3 * v13 + 1.0;
  if (v14 < 0.0)
    v14 = 0.0;
  v15 = fmin(v14, 1.0);
  -[ICAuthorHighlightsController highlightsAttributedStringForTextStorage:](self, "highlightsAttributedStringForTextStorage:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeAttribute:range:", *MEMORY[0x1E0D63D28], location, length);
  v17 = *MEMORY[0x1E0D63928];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __97__ICAuthorHighlightsController_setCheckmarkHighlightValue_highlightColor_forRange_inTextStorage___block_invoke;
  v21[3] = &unk_1E5C1FD90;
  v21[4] = self;
  v22 = v11;
  v25 = a3;
  v26 = v15;
  v23 = v12;
  v24 = v16;
  v18 = v16;
  v19 = v12;
  v20 = v11;
  objc_msgSend(v19, "enumerateAttribute:inRange:options:usingBlock:", v17, location, length, 0, v21);

}

void __97__ICAuthorHighlightsController_setCheckmarkHighlightValue_highlightColor_forRange_inTextStorage___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  double v15;
  void *v16;
  ICCheckmarkAuthorHighlightValueAttribute *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a2;
  objc_msgSend(v22, "todo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "note");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "todo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "userIDForChecklistItemWithIdentifier:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(*(id *)(a1 + 32), "highlightColorForUserID:", v12);
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = *(id *)(a1 + 40);
    }
    v14 = v13;
    v15 = *(double *)(a1 + 64);
    if (v15 < 0.0)
      v15 = 0.0;
    objc_msgSend(v13, "colorWithAlphaComponent:", fmin(v15, 1.0));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (ICInternalSettingsIsTextKit2Enabled())
    {
      objc_msgSend(*(id *)(a1 + 48), "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC1178], a3, 0);
      v17 = (ICCheckmarkAuthorHighlightValueAttribute *)objc_claimAutoreleasedReturnValue();
      -[ICCheckmarkAuthorHighlightValueAttribute textLists](v17, "textLists");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "firstObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      objc_msgSend(v19, "markerTextAttachment");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      ICCheckedDynamicCast();
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "setForegroundAlpha:", *(double *)(a1 + 72));
      objc_msgSend(v21, "setHighlightColor:", v16);

    }
    else
    {
      v17 = objc_alloc_init(ICCheckmarkAuthorHighlightValueAttribute);
      -[ICCheckmarkAuthorHighlightValueAttribute setForegroundAlpha:](v17, "setForegroundAlpha:", *(double *)(a1 + 72));
      -[ICCheckmarkAuthorHighlightValueAttribute setHighlightColor:](v17, "setHighlightColor:", v16);
      objc_msgSend(*(id *)(a1 + 56), "addAttribute:value:range:", *MEMORY[0x1E0D63D28], v17, a3, a4);
    }

  }
}

- (void)setTextHighlightValue:(double)a3 highlightColor:(id)a4 blendsTextColor:(BOOL)a5 forRange:(_NSRange)a6 inTextStorage:(id)a7
{
  NSUInteger length;
  NSUInteger location;
  _BOOL4 v10;
  id v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  double v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[4];
  id v49;
  _QWORD v50[4];
  id v51;
  double v52;
  double v53;
  _BYTE v54[128];
  uint64_t v55;

  length = a6.length;
  location = a6.location;
  v10 = a5;
  v55 = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v14 = a7;
  -[ICAuthorHighlightsController fadedMultiplier](self, "fadedMultiplier");
  v16 = a3 * v15 + 1.0;
  if (v16 >= 0.0)
    v17 = v16;
  else
    v17 = 0.0;
  -[ICAuthorHighlightsController highlightedMultiplier](self, "highlightedMultiplier");
  v19 = v18 * a3;
  if (v19 < 0.0)
    v19 = 0.0;
  objc_msgSend(v13, "colorWithAlphaComponent:", fmin(v19, 1.0));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAuthorHighlightsController highlightsAttributedStringForTextStorage:](self, "highlightsAttributedStringForTextStorage:", v14);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v17 < 1.0)
  {
    objc_msgSend(v21, "removeAttribute:range:", *MEMORY[0x1E0DC1100], location, length);
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __108__ICAuthorHighlightsController_setTextHighlightValue_highlightColor_blendsTextColor_forRange_inTextStorage___block_invoke;
    v50[3] = &unk_1E5C1D8B0;
    v52 = a3;
    v53 = v17;
    v51 = v22;
    objc_msgSend(v51, "enumerateAttributesInRange:options:usingBlock:", location, length, 0, v50);
    v23 = v51;
LABEL_21:

    goto LABEL_22;
  }
  if (!v20)
  {
    objc_msgSend(v21, "removeAttribute:range:", *MEMORY[0x1E0DC1100], location, length);
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __108__ICAuthorHighlightsController_setTextHighlightValue_highlightColor_blendsTextColor_forRange_inTextStorage___block_invoke_4;
    v36[3] = &unk_1E5C1D7E8;
    v37 = v14;
    v38 = v22;
    objc_msgSend(v38, "enumerateAttributesInRange:options:usingBlock:", location, length, 0, v36);

    v23 = v37;
    goto LABEL_21;
  }
  v34 = v13;
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __108__ICAuthorHighlightsController_setTextHighlightValue_highlightColor_blendsTextColor_forRange_inTextStorage___block_invoke_2;
  v48[3] = &unk_1E5C1FDB8;
  v33 = v14;
  v49 = v14;
  v35 = v49;
  objc_msgSend(v49, "ic_componentRangesSeparatedByPredicate:inRange:", v48, location, length);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v45;
    v28 = *MEMORY[0x1E0DC1100];
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v45 != v27)
          objc_enumerationMutation(v24);
        v31 = objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * v29), "rangeValue");
        v32 = v30;
        if (v10)
        {
          v39[0] = MEMORY[0x1E0C809B0];
          v39[1] = 3221225472;
          v39[2] = __108__ICAuthorHighlightsController_setTextHighlightValue_highlightColor_blendsTextColor_forRange_inTextStorage___block_invoke_3;
          v39[3] = &unk_1E5C1FDE0;
          v40 = v20;
          v41 = v35;
          v43 = a3;
          v42 = v22;
          objc_msgSend(v42, "enumerateAttributesInRange:options:usingBlock:", v31, v32, 0, v39);

        }
        else
        {
          objc_msgSend(v22, "addAttribute:value:range:", v28, v20, v31, v30);
        }
        ++v29;
      }
      while (v26 != v29);
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
    }
    while (v26);
  }

  v14 = v33;
  v13 = v34;
LABEL_22:

}

void __108__ICAuthorHighlightsController_setTextHighlightValue_highlightColor_blendsTextColor_forRange_inTextStorage___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;

  v7 = *MEMORY[0x1E0D63D50];
  v8 = a2;
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "preferredDefaultFontColor");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D63D20]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "color");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    v16 = (void *)v14;
  else
    v16 = v12;
  v17 = v16;

  objc_msgSend(MEMORY[0x1E0DC3658], "preferredDefaultFontColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "ic_colorBlendedWithColor:fraction:", v18, fabs(*(double *)(a1 + 40)));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "colorWithAlphaComponent:", *(double *)(a1 + 48));
  v27 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *MEMORY[0x1E0DC1140], v27, a3, a4);
  v20 = objc_msgSend(v13, "underlineStyle");
  v21 = *(void **)(a1 + 32);
  v22 = *MEMORY[0x1E0DC1248];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addAttribute:value:range:", v22, v23, a3, a4);

  objc_msgSend(v13, "underlineColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
    v25 = v24;
  else
    v25 = v27;
  v26 = v25;

  objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *MEMORY[0x1E0DC1240], v26, a3, a4);
}

uint64_t __108__ICAuthorHighlightsController_setTextHighlightValue_highlightColor_blendsTextColor_forRange_inTextStorage___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  char v7;
  char isKindOfClass;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "characterIsMember:", a3);

  if ((v7 & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else if ((_DWORD)a3 == 65532)
  {
    objc_msgSend(*(id *)(a1 + 32), "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC10F8], a2, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  else
  {
    isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

void __108__ICAuthorHighlightsController_setTextHighlightValue_highlightColor_blendsTextColor_forRange_inTextStorage___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;

  v42 = a2;
  objc_msgSend(v42, "objectForKeyedSubscript:", *MEMORY[0x1E0D63D50]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "preferredDefaultFontColor");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  v11 = *(id *)(a1 + 32);
  objc_opt_class();
  objc_msgSend(v42, "objectForKeyedSubscript:", *MEMORY[0x1E0D63908]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)ICEmphasisColorTypeForTag((int)objc_msgSend(v13, "intValue"));
  if (v14)
  {
    ICColorForEmphasisColorType(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(*(id *)(a1 + 40), "isForTextKit2") & 1) == 0)
    {
      objc_msgSend(v15, "colorWithAlphaComponent:", 0.2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "ic_colorBlendedWithColor:fraction:", v11, *(double *)(a1 + 56));
      v17 = objc_claimAutoreleasedReturnValue();

      v11 = (id)v17;
    }
  }
  else
  {
    v15 = v10;
  }
  objc_msgSend(v42, "objectForKeyedSubscript:", *MEMORY[0x1E0D63D20]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v13;
  v19 = v11;
  v20 = a3;
  v21 = a4;
  if (objc_msgSend(v18, "type") == 1)
  {
    objc_msgSend(*(id *)(a1 + 40), "textViews", v40);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "anyObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "tintColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v24 = 0;
  }
  if (v24)
    v25 = v24;
  else
    v25 = v15;
  v26 = v25;

  objc_msgSend(MEMORY[0x1E0DC3658], "preferredDefaultFontColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "ic_colorBlendedWithColor:fraction:", v27, *(double *)(a1 + 56));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "addAttribute:value:range:", *MEMORY[0x1E0DC1140], v28, v20, a4);
  v29 = v19;
  if (v19)
    objc_msgSend(*(id *)(a1 + 48), "addAttribute:value:range:", *MEMORY[0x1E0DC1100], v19, v20, v21);
  v30 = objc_msgSend(v18, "underlineStyle", v40);
  v31 = *(void **)(a1 + 48);
  v32 = *MEMORY[0x1E0DC1248];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v30);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addAttribute:value:range:", v32, v33, v20, v21);

  objc_msgSend(v18, "underlineColor");
  v34 = objc_claimAutoreleasedReturnValue();
  v35 = (void *)v34;
  if (v34)
    v36 = (void *)v34;
  else
    v36 = v28;
  v37 = v36;

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "ic_colorBlendedWithColor:fraction:", v38, *(double *)(a1 + 56));
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "addAttribute:value:range:", *MEMORY[0x1E0DC1240], v39, v20, v21);
}

void __108__ICAuthorHighlightsController_setTextHighlightValue_highlightColor_blendsTextColor_forRange_inTextStorage___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  id v29;

  v29 = a2;
  objc_msgSend(v29, "objectForKeyedSubscript:", *MEMORY[0x1E0D63D50]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "preferredDefaultFontColor");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  objc_opt_class();
  objc_msgSend(v29, "objectForKeyedSubscript:", *MEMORY[0x1E0D63908]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)ICEmphasisColorTypeForTag((int)objc_msgSend(v12, "intValue"));
  if (v13)
  {
    ICColorForEmphasisColorType(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(*(id *)(a1 + 32), "isForTextKit2") & 1) != 0)
    {
      v15 = 0;
    }
    else
    {
      objc_msgSend(v14, "colorWithAlphaComponent:", 0.2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v10 = v14;
  }
  else
  {
    v15 = 0;
  }
  objc_msgSend(v29, "objectForKeyedSubscript:", *MEMORY[0x1E0D63D20]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "color");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v17)
    v19 = (void *)v17;
  else
    v19 = v10;
  v20 = v19;

  objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *MEMORY[0x1E0DC1140], v20, a3, a4);
  if (v15)
    objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *MEMORY[0x1E0DC1100], v15, a3, a4);
  v21 = objc_msgSend(v16, "underlineStyle");
  v22 = *(void **)(a1 + 40);
  v23 = *MEMORY[0x1E0DC1248];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addAttribute:value:range:", v23, v24, a3, a4);

  objc_msgSend(v16, "underlineColor");
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)v25;
  if (v25)
    v27 = (void *)v25;
  else
    v27 = v20;
  v28 = v27;

  objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *MEMORY[0x1E0DC1240], v28, a3, a4);
}

- (id)attributesForHighlightingTextLineFragment:(id)a3 characterRange:(_NSRange)a4 defaultRenderingAttributes:(id)a5 effectiveRange:(_NSRange *)a6 textView:(id)a7
{
  NSUInteger location;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSUInteger v24;
  void *v25;
  void *v26;
  void *v27;
  NSRange v28;
  NSUInteger v29;
  NSUInteger length;
  NSUInteger v31;
  _BOOL4 v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  NSUInteger v37;
  NSUInteger v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  float v51;
  double v52;
  void *v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  char v63;
  void *v64;
  uint64_t v65;
  void *v68;
  void *v69;
  void *v70;
  NSRange v71;
  uint64_t v72;
  _QWORD v73[2];

  location = a4.location;
  v73[1] = *MEMORY[0x1E0C80C00];
  v12 = a5;
  v13 = a7;
  v14 = a3;
  objc_opt_class();
  objc_msgSend(v14, "textLayoutFragment");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "textElement");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v70 = v13;
  if (v17)
  {
    objc_msgSend(v17, "locationForCharacterIndex:dataSourceLocationsOnly:actualRange:", location, 1, 0);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18
      || (objc_msgSend(v17, "locationForCharacterIndex:dataSourceLocationsOnly:actualRange:", location, 0, 0),
          (v19 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v71.location = 0;
      v71.length = 0;
      -[ICAuthorHighlightsController note](self, "note", self);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "textContentStorage");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "documentRange");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "location");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = (void *)v19;
      v24 = objc_msgSend(v21, "offsetFromLocation:toLocation:", v23, v19);

      objc_msgSend(v21, "textStorage");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "highlightsAttributedString");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "attributesAtIndex:effectiveRange:", v24, &v71);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v28.location = objc_msgSend(v13, "ic_markedTextRange");
      if (v28.location == 0x7FFFFFFFFFFFFFFFLL
        || (v29 = v28.location, length = v28.length, !NSIntersectionRange(v28, v71).location))
      {
        v32 = 0;
      }
      else
      {
        if (v71.location <= v24)
          v31 = v24;
        else
          v31 = v71.location;
        if (v29 <= v31)
        {
          if (v29 + length <= v31)
          {
            v32 = v29 == v71.location && length == v71.length;
          }
          else
          {
            v71.location = v31;
            v71.length = v29 + length - v31;
            v32 = 1;
          }
        }
        else
        {
          v32 = 0;
          v71.location = v31;
          v71.length = v29 - v31;
        }
      }
      objc_msgSend(v21, "documentRange");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "location");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "locationFromLocation:withOffset:", v35, v71.location);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      v37 = objc_msgSend(v17, "rangeForLocation:allowsTrailingEdge:", v36, 1);
      v38 = v71.length;
      a6->location = v37;
      a6->length = v38;
      v39 = (void *)objc_msgSend(v12, "mutableCopy");
      if (!v18)
      {
        objc_opt_class();
        v46 = *MEMORY[0x1E0DC1140];
        objc_msgSend(v39, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1140]);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        ICCheckedDynamicCast();
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        objc_msgSend(v27, "objectForKeyedSubscript:", *MEMORY[0x1E0D63D30]);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        ICCheckedDynamicCast();
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "floatValue");
        v52 = v51;

        if (fabs(v52) >= 0.00999999978)
        {
          objc_msgSend(v39, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1160]);
          v53 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v53)
          {
            objc_msgSend(v68, "fadedMultiplier");
            v55 = v52 * v54 + 1.0;
            if (v55 < 0.0)
              v55 = 0.0;
            objc_msgSend(v48, "colorWithAlphaComponent:", fmin(v55, 1.0));
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "setObject:forKeyedSubscript:", v56, v46);

          }
        }
        goto LABEL_27;
      }
      v40 = *MEMORY[0x1E0DC1100];
      objc_msgSend(v27, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1100]);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setObject:forKeyedSubscript:", v41, v40);

      if (v32)
      {
        v42 = *MEMORY[0x1E0DC1140];
        objc_msgSend(v39, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1140]);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = v42;
        objc_msgSend(v43, "colorWithAlphaComponent:", 0.8);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v73[0] = v44;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v73, &v72, 1);
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v39, "addEntriesFromDictionary:", v45);
      }
      else
      {
        objc_msgSend(v39, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1160]);
        v57 = (void *)objc_claimAutoreleasedReturnValue();

        if (v57)
          goto LABEL_24;
        v58 = *MEMORY[0x1E0DC1140];
        objc_msgSend(v27, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1140]);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setObject:forKeyedSubscript:", v43, v58);
      }

LABEL_24:
      v59 = *MEMORY[0x1E0DC1248];
      objc_msgSend(v27, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1248]);
      v60 = objc_claimAutoreleasedReturnValue();
      if (!v60)
        goto LABEL_28;
      v61 = (void *)v60;
      objc_msgSend(v27, "objectForKeyedSubscript:", v59);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = objc_msgSend(v62, "isEqual:", &unk_1E5C71DF0);

      if ((v63 & 1) != 0)
        goto LABEL_28;
      objc_msgSend(v27, "objectForKeyedSubscript:", v59);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setObject:forKeyedSubscript:", v64, v59);

      v65 = *MEMORY[0x1E0DC1240];
      objc_msgSend(v27, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1240]);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setObject:forKeyedSubscript:", v48, v65);
LABEL_27:

LABEL_28:
      v33 = (id)objc_msgSend(v39, "copy");

      goto LABEL_29;
    }
  }
  v33 = v12;
LABEL_29:

  return v33;
}

- (NSTextLayoutManager)textLayoutManager
{
  return self->_textLayoutManager;
}

- (double)fadedMultiplier
{
  return self->_fadedMultiplier;
}

- (double)highlightedMultiplier
{
  return self->_highlightedMultiplier;
}

- (BOOL)allowsAnimations
{
  return self->_allowsAnimations;
}

- (void)setAllowsAnimations:(BOOL)a3
{
  self->_allowsAnimations = a3;
}

- (BOOL)coalesceAuthorHighlightUpdates
{
  return self->_coalesceAuthorHighlightUpdates;
}

- (NSDate)now
{
  return self->_now;
}

- (void)setNow:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (_NSRange)invalidHighlightsRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_invalidHighlightsRange.length;
  location = self->_invalidHighlightsRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setInvalidHighlightsRange:(_NSRange)a3
{
  self->_invalidHighlightsRange = a3;
}

- (ICTTTextStorage)invalidHighlightsTextStorage
{
  return (ICTTTextStorage *)objc_loadWeakRetained((id *)&self->_invalidHighlightsTextStorage);
}

- (void)setInvalidHighlightsTextStorage:(id)a3
{
  objc_storeWeak((id *)&self->_invalidHighlightsTextStorage, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_invalidHighlightsTextStorage);
  objc_storeStrong((id *)&self->_now, 0);
  objc_storeStrong((id *)&self->_textLayoutManager, 0);
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_editGroupsForTextStorageDocument, 0);
  objc_storeStrong((id *)&self->_editGrouper, 0);
  objc_storeStrong((id *)&self->_highlightAnimationsDisplayLink, 0);
  objc_storeStrong((id *)&self->_textStorageDocumentsNeedingHighlightUpdates, 0);
  objc_storeStrong((id *)&self->_textStorageDocumentsBeingUpdated, 0);
}

@end
