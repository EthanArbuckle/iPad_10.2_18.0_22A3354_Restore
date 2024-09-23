@implementation ICLayoutManager

- (ICLayoutManager)init
{
  return (ICLayoutManager *)-[ICLayoutManager initForTemporaryProcessing:](self, "initForTemporaryProcessing:", 0);
}

- (id)initForTemporaryProcessing:(BOOL)a3
{
  ICLayoutManager *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  ICTextAttachmentLocationCache *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)ICLayoutManager;
  v4 = -[ICLayoutManager init](&v21, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[ICLayoutManager setTodoButtonsByTrackingUUID:](v4, "setTodoButtonsByTrackingUUID:", v5);

    if (!a3)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObserver:selector:name:object:", v4, sel_attachmentDidLoad_, *MEMORY[0x1E0D63608], 0);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObserver:selector:name:object:", v4, sel_mediaDidLoad_, *MEMORY[0x1E0D63768], 0);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *MEMORY[0x1E0D64A90];
      -[ICLayoutManager textStorage](v4, "textStorage");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObserver:selector:name:object:", v4, sel_textStorageDidEndEditingNotification_, v9, v10);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObserver:selector:name:object:", v4, sel_attachmentInlineDrawingMergeableDataDidChange_, *MEMORY[0x1E0D648A0], 0);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObserver:selector:name:object:", v4, sel_receivedMemoryWarning_, *MEMORY[0x1E0DC4778], 0);

    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLayoutManager setActiveSupplementalViews:](v4, "setActiveSupplementalViews:", v13);

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLayoutManager setHiddenSupplementalViews:](v4, "setHiddenSupplementalViews:", v14);

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLayoutManager setSupplementalViewControllers:](v4, "setSupplementalViewControllers:", v15);

    v16 = -[ICTextAttachmentLocationCache initWithLayoutManager:cachedTextAttachmentType:]([ICTextAttachmentLocationCache alloc], "initWithLayoutManager:cachedTextAttachmentType:", v4, objc_opt_class());
    -[ICLayoutManager setInlineAttachmentLocationCache:](v4, "setInlineAttachmentLocationCache:", v16);

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLayoutManager setSupplementalViewProviders:](v4, "setSupplementalViewProviders:", v17);

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLayoutManager setDelayedScrollOutViewDictionary:](v4, "setDelayedScrollOutViewDictionary:", v18);

    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D64268]), "initWithTarget:selector:delay:waitToFireUntilRequestsStop:callOnMainThread:", v4, sel_updateHiddenSupplementalViews, 1, 1, 0.1);
    -[ICLayoutManager setUpdateHiddenViewsSelectorDelayer:](v4, "setUpdateHiddenViewsSelectorDelayer:", v19);

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[ICLayoutManager updateHiddenViewsSelectorDelayer](self, "updateHiddenViewsSelectorDelayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelPreviousFireRequests");

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  -[ICLayoutManager clearAllSupplementalViews](self, "clearAllSupplementalViews");
  v5.receiver = self;
  v5.super_class = (Class)ICLayoutManager;
  -[ICLayoutManager dealloc](&v5, sel_dealloc);
}

- (NSDictionary)trackedToDoParagraphs
{
  void *v3;
  void *v4;
  NSDictionary *v5;
  NSDictionary *v6;

  -[ICBaseLayoutManager textController](self, "textController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "trackedToDoParagraphs");
    v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = self->_trackedToDoParagraphs;
  }
  v6 = v5;

  return v6;
}

- (void)drawGlyphsForGlyphRange:(_NSRange)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  NSUInteger length;
  NSUInteger location;

  y = a4.y;
  x = a4.x;
  length = a3.length;
  location = a3.location;
  -[ICLayoutManager setLineHeightIncludeParagraphSpacing:](self, "setLineHeightIncludeParagraphSpacing:", 1);
  -[ICLayoutManager drawGlyphsForGlyphRange:atPoint:updateAttachments:](self, "drawGlyphsForGlyphRange:atPoint:updateAttachments:", location, length, 1, x, y);
  -[ICLayoutManager setLineHeightIncludeParagraphSpacing:](self, "setLineHeightIncludeParagraphSpacing:", 0);
}

- (id)textContainerForGlyphAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  unint64_t v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  objc_super v12;

  v7 = -[ICLayoutManager characterIndexForGlyphAtIndex:](self, "characterIndexForGlyphAtIndex:");
  -[ICLayoutManager textStorage](self, "textStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v7 <= v9)
  {
    v12.receiver = self;
    v12.super_class = (Class)ICLayoutManager;
    -[ICLayoutManager textContainerForGlyphAtIndex:effectiveRange:](&v12, sel_textContainerForGlyphAtIndex_effectiveRange_, a3, a4);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a4)
      a4->location = 0x7FFFFFFFFFFFFFFFLL;
    v10 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ICLayoutManager textContainerForGlyphAtIndex:effectiveRange:].cold.1(v10);

    return 0;
  }
}

- (void)setHighlightPatternRegexFinder:(id)a3
{
  id v5;
  char v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v5 = a3;
  v6 = -[ICSearchResultRegexMatchFinder isEqual:](self->_highlightPatternRegexFinder, "isEqual:", v5);
  if ((v6 & 1) == 0)
    objc_storeStrong((id *)&self->_highlightPatternRegexFinder, a3);
  -[ICLayoutManager supplementalViewControllers](self, "supplementalViewControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __50__ICLayoutManager_setHighlightPatternRegexFinder___block_invoke;
  v17[3] = &unk_1EA7DE198;
  v9 = v5;
  v18 = v9;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v17);

  -[ICLayoutManager activeSupplementalViews](self, "activeSupplementalViews");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __50__ICLayoutManager_setHighlightPatternRegexFinder___block_invoke_2;
  v15[3] = &unk_1EA7DE1C0;
  v16 = v9;
  v14 = v9;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v15);

  if ((v6 & 1) == 0)
  {
    -[ICLayoutManager textStorage](self, "textStorage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "ic_range");
    -[ICLayoutManager invalidateDisplayForCharacterRange:](self, "invalidateDisplayForCharacterRange:", v12, v13);

  }
}

void __50__ICLayoutManager_setHighlightPatternRegexFinder___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  id v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a3;
  objc_opt_class();
  ICDynamicCast();
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setHighlightPatternRegexFinder:", v3);
}

void __50__ICLayoutManager_setHighlightPatternRegexFinder___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  objc_opt_class();
  ICDynamicCast();
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setHighlightPatternRegexFinder:", *(_QWORD *)(a1 + 32));
}

- (void)setCachedOrigin:(CGPoint)a3
{
  if (!self->_shouldIgnoreCachedOriginUpdates)
    self->_cachedOrigin = a3;
}

- (id)glyphIndexesForMatchesInTextStorage:(id)a3 regexFinder:(id)a4 glyphRange:(_NSRange)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v7 = a3;
  v8 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__3;
  v18 = __Block_byref_object_dispose__3;
  v19 = 0;
  objc_msgSend(v7, "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "matchesInDocumentWithPerTokenFallback:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __78__ICLayoutManager_glyphIndexesForMatchesInTextStorage_regexFinder_glyphRange___block_invoke;
  v13[3] = &unk_1EA7DE1E8;
  v13[4] = self;
  v13[5] = &v14;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v13);
  v11 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v11;
}

void __78__ICLayoutManager_glyphIndexesForMatchesInTextStorage_regexFinder_glyphRange___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  v11 = v3;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    v3 = v11;
  }
  v7 = objc_msgSend(v3, "range");
  v9 = objc_msgSend(*(id *)(a1 + 32), "glyphRangeForCharacterRange:actualCharacterRange:", v7, v8, 0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addIndexesInRange:", v9, v10);

}

- (void)drawGlyphsForGlyphRange:(_NSRange)a3 atPoint:(CGPoint)a4 updateAttachments:(BOOL)a5
{
  _BOOL4 v5;
  double y;
  double x;
  NSUInteger length;
  NSUInteger location;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  objc_super v18;

  v5 = a5;
  y = a4.y;
  x = a4.x;
  length = a3.length;
  location = a3.location;
  v11 = -[ICLayoutManager characterRangeForGlyphRange:actualGlyphRange:](self, "characterRangeForGlyphRange:actualGlyphRange:", a3.location, a3.length, 0);
  v13 = v12;
  -[ICLayoutManager cachedOrigin](self, "cachedOrigin");
  v15 = v14;
  v17 = v16;
  if (v5)
    -[ICLayoutManager updateSubviewsForCharacterRange:atPoint:](self, "updateSubviewsForCharacterRange:atPoint:", v11, v13, x, y);
  -[ICBaseLayoutManager drawListStylesForCharacterRange:atPoint:](self, "drawListStylesForCharacterRange:atPoint:", v11, v13, x, y);
  v18.receiver = self;
  v18.super_class = (Class)ICLayoutManager;
  -[ICLayoutManager drawGlyphsForGlyphRange:atPoint:](&v18, sel_drawGlyphsForGlyphRange_atPoint_, location, length, x, y);
  if (-[ICLayoutManager shouldManuallyRenderSeparateSubviews](self, "shouldManuallyRenderSeparateSubviews"))
  {
    -[ICLayoutManager manuallyRenderSubviewsForCharacterRange:](self, "manuallyRenderSubviewsForCharacterRange:", v11, v13);
    -[ICLayoutManager updateSubviewsForCharacterRange:atPoint:](self, "updateSubviewsForCharacterRange:atPoint:", v11, v13, v15, v17);
  }
}

- (void)icReplaceTextStorage:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[ICLayoutManager textStorage](self, "textStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeLayoutManager:", self);

  objc_msgSend(v5, "addLayoutManager:", self);
}

- (void)processEditingForTextStorage:(id)a3 edited:(unint64_t)a4 range:(_NSRange)a5 changeInLength:(int64_t)a6 invalidatedRange:(_NSRange)a7
{
  NSUInteger length;
  NSUInteger location;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  objc_super v19;
  _QWORD v20[5];

  length = a5.length;
  location = a5.location;
  v12 = a3;
  -[ICLayoutManager setNeedsClearRemovedAttachments:](self, "setNeedsClearRemovedAttachments:", 1);
  -[ICLayoutManager textStorage](self, "textStorage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x1E0DC10F8];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __93__ICLayoutManager_processEditingForTextStorage_edited_range_changeInLength_invalidatedRange___block_invoke;
  v20[3] = &unk_1EA7DE210;
  v20[4] = self;
  objc_msgSend(v13, "enumerateAttribute:inRange:options:usingBlock:", v14, location, length, 0, v20);

  -[ICLayoutManager icTextView](self, "icTextView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isInProcessEditingForTextStorage");

  -[ICLayoutManager icTextView](self, "icTextView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setIsInProcessEditingForTextStorage:", 1);

  v19.receiver = self;
  v19.super_class = (Class)ICLayoutManager;
  -[ICLayoutManager processEditingForTextStorage:edited:range:changeInLength:invalidatedRange:](&v19, sel_processEditingForTextStorage_edited_range_changeInLength_invalidatedRange_, v12, a4, location, length, a6, a7.location, a7.length);

  -[ICLayoutManager icTextView](self, "icTextView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setIsInProcessEditingForTextStorage:", v16);

}

void __93__ICLayoutManager_processEditingForTextStorage_edited_range_changeInLength_invalidatedRange___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "layoutViewForInlineTextAttachment:atCharacterIndex:", v5, a3);

}

- (void)textContainerChangedGeometry:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v12;

  v4 = a3;
  objc_msgSend(v4, "size");
  v6 = v5;
  v8 = v7;
  -[ICLayoutManager cachedTextContainerSize](self, "cachedTextContainerSize");
  if (v6 != v10 || v8 != v9)
  {
    objc_msgSend(v4, "size");
    -[ICLayoutManager setCachedTextContainerSize:](self, "setCachedTextContainerSize:");
    v12.receiver = self;
    v12.super_class = (Class)ICLayoutManager;
    -[ICLayoutManager textContainerChangedGeometry:](&v12, sel_textContainerChangedGeometry_, v4);
  }

}

- (CGRect)lineFragmentRectForGlyphAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  unint64_t v14;
  void *v15;
  unint64_t v16;
  int64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double MinY;
  BOOL v43;
  double v44;
  BOOL v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  CGFloat v64;
  CGFloat v65;
  double v66;
  CGFloat v67;
  double v68;
  double v69;
  CGFloat v70;
  CGFloat v71;
  char v72;
  double v73;
  double v74;
  double v75;
  double v76;
  char v77;
  void *v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double rect;
  CGFloat rect_8;
  CGFloat rect_8a;
  CGFloat rect_16;
  double rect_16a;
  CGFloat rect_24a;
  CGFloat rect_24;
  CGFloat v95;
  CGFloat v96;
  CGFloat v97;
  CGFloat v98;
  objc_super v99;
  objc_super v100;
  objc_super v101;
  objc_super v102;
  objc_super v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect result;

  v103.receiver = self;
  v103.super_class = (Class)ICLayoutManager;
  -[ICLayoutManager lineFragmentRectForGlyphAtIndex:effectiveRange:](&v103, sel_lineFragmentRectForGlyphAtIndex_effectiveRange_, a3, a4);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  if (!-[ICLayoutManager lineHeightIncludeParagraphSpacing](self, "lineHeightIncludeParagraphSpacing"))
  {
    v14 = -[ICLayoutManager characterIndexForGlyphAtIndex:](self, "characterIndexForGlyphAtIndex:", a3);
    -[ICLayoutManager textStorage](self, "textStorage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "length");

    if (v14 >= v16)
      v17 = v16;
    else
      v17 = v14;
    -[ICLayoutManager textStorage](self, "textStorage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "length") - 1;

    if (v17 >= v19)
    {
      -[ICBaseLayoutManager textView](self, "textView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "typingAttributes");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1178]);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[ICLayoutManager textStorage](self, "textStorage");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC1178], v17, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }

    if (v21)
    {
      v97 = v11;
      v98 = v7;
      -[ICBaseLayoutManager textView](self, "textView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "selectedRange");
      v26 = v25;

      v27 = -[ICLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self, "glyphRangeForCharacterRange:actualCharacterRange:", v24, v26, 0);
      if (v26)
      {
        v29 = v27;
        v30 = v28;
        v102.receiver = self;
        v102.super_class = (Class)ICLayoutManager;
        -[ICLayoutManager lineFragmentRectForGlyphAtIndex:effectiveRange:](&v102, sel_lineFragmentRectForGlyphAtIndex_effectiveRange_, v27, 0);
        rect = v31;
        v33 = v32;
        v35 = v34;
        v37 = v36;
        v101.receiver = self;
        v101.super_class = (Class)ICLayoutManager;
        -[ICLayoutManager lineFragmentRectForGlyphAtIndex:effectiveRange:](&v101, sel_lineFragmentRectForGlyphAtIndex_effectiveRange_, v30 + v29 - 1, 0);
        rect_24a = v39;
        v95 = v38;
        rect_8 = v41;
        rect_16 = v40;
        v104.origin.x = v98;
        v104.origin.y = v9;
        v104.size.width = v97;
        v104.size.height = v13;
        MinY = CGRectGetMinY(v104);
        v105.origin.x = rect;
        v105.origin.y = v33;
        v105.size.width = v35;
        v105.size.height = v37;
        v43 = MinY != CGRectGetMinY(v105);
        v106.origin.x = v98;
        v106.origin.y = v9;
        v106.size.width = v97;
        v106.size.height = v13;
        v44 = CGRectGetMinY(v106);
        v107.origin.y = rect_24a;
        v107.origin.x = v95;
        v107.size.height = rect_8;
        v107.size.width = rect_16;
        v45 = v44 != CGRectGetMinY(v107);
      }
      else
      {
        v43 = 0;
        v45 = 0;
      }
      -[ICLayoutManager textStorage](self, "textStorage");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "string");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "paragraphRangeForRange:", v17, 0);
      v50 = v49;

      v51 = -[ICLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self, "glyphRangeForCharacterRange:actualCharacterRange:", v48, v50, 0);
      v53 = v52;
      v100.receiver = self;
      v100.super_class = (Class)ICLayoutManager;
      -[ICLayoutManager lineFragmentRectForGlyphAtIndex:effectiveRange:](&v100, sel_lineFragmentRectForGlyphAtIndex_effectiveRange_, v51, 0);
      rect_24 = v54;
      v56 = v55;
      v58 = v57;
      v60 = v59;
      v99.receiver = self;
      v99.super_class = (Class)ICLayoutManager;
      -[ICLayoutManager lineFragmentRectForGlyphAtIndex:effectiveRange:](&v99, sel_lineFragmentRectForGlyphAtIndex_effectiveRange_, v53 + v51 - 1, 0);
      v64 = v61;
      v65 = v62;
      v96 = v66;
      v67 = v63;
      if (v48)
      {
        rect_8a = v60;
        rect_16a = v63;
        v68 = v62;
        v69 = v61;
        v70 = v56;
        v7 = v98;
        v108.origin.x = v98;
        v108.origin.y = v9;
        v71 = v58;
        v11 = v97;
        v108.size.width = v97;
        v108.size.height = v13;
        rect = CGRectGetMinY(v108);
        v109.origin.y = v70;
        v64 = v69;
        v65 = v68;
        v67 = rect_16a;
        v109.origin.x = rect_24;
        v109.size.width = v71;
        v109.size.height = rect_8a;
        v72 = rect != CGRectGetMinY(v109) || v43;
      }
      else
      {
        v72 = 1;
        v11 = v97;
        v7 = v98;
      }
      v110.origin.x = v7;
      v110.origin.y = v9;
      v110.size.width = v11;
      v110.size.height = v13;
      v73 = CGRectGetMinY(v110);
      v111.origin.x = v64;
      v111.origin.y = v65;
      v111.size.width = v96;
      v111.size.height = v67;
      v74 = CGRectGetMinY(v111);
      if ((v72 & 1) == 0)
      {
        objc_msgSend(v21, "paragraphSpacingBefore");
        v9 = v9 + v75;
        objc_msgSend(v21, "paragraphSpacingBefore");
        v13 = v13 - v76;
      }
      v77 = v73 != v74 || v45;
      if ((v77 & 1) == 0)
      {
        -[ICLayoutManager textStorage](self, "textStorage");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "string");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = objc_msgSend(v79, "paragraphRangeForRange:", v48 + v50, 0);
        v82 = v81;

        if (v48 != v80 || v50 != v82)
        {
          objc_msgSend(v21, "paragraphSpacing", *(_QWORD *)&rect);
          v13 = v13 - v83;
        }
      }
    }

  }
  v84 = v7;
  v85 = v9;
  v86 = v11;
  v87 = v13;
  result.size.height = v87;
  result.size.width = v86;
  result.origin.y = v85;
  result.origin.x = v84;
  return result;
}

- (CGRect)lineRectForRange:(_NSRange)a3
{
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _QWORD v15[5];
  uint64_t v16;
  double *v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  CGRect result;

  v16 = 0;
  v17 = (double *)&v16;
  v18 = 0x4010000000;
  v19 = &unk_1DDA28851;
  v4 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  v20 = *MEMORY[0x1E0C9D628];
  v21 = v4;
  v5 = -[ICLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self, "glyphRangeForCharacterRange:actualCharacterRange:", a3.location, a3.length, 0);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __36__ICLayoutManager_lineRectForRange___block_invoke;
  v15[3] = &unk_1EA7DE238;
  v15[4] = &v16;
  -[ICLayoutManager enumerateLineFragmentsForGlyphRange:usingBlock:](self, "enumerateLineFragmentsForGlyphRange:usingBlock:", v5, v6, v15);
  v7 = v17[4];
  v8 = v17[5];
  v9 = v17[6];
  v10 = v17[7];
  _Block_object_dispose(&v16, 8);
  v11 = v7;
  v12 = v8;
  v13 = v9;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

void __36__ICLayoutManager_lineRectForRange___block_invoke(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  CGRect v5;

  v5.size.height = a5;
  v5.size.width = a4;
  v5.origin.y = a3;
  v5.origin.x = a2;
  *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = CGRectUnion(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)+ 32), v5);
}

- (CGRect)usedLineRectForRange:(_NSRange)a3
{
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _QWORD v15[5];
  uint64_t v16;
  double *v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  CGRect result;

  v16 = 0;
  v17 = (double *)&v16;
  v18 = 0x4010000000;
  v19 = &unk_1DDA28851;
  v4 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  v20 = *MEMORY[0x1E0C9D628];
  v21 = v4;
  v5 = -[ICLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self, "glyphRangeForCharacterRange:actualCharacterRange:", a3.location, a3.length, 0);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __40__ICLayoutManager_usedLineRectForRange___block_invoke;
  v15[3] = &unk_1EA7DE238;
  v15[4] = &v16;
  -[ICLayoutManager enumerateLineFragmentsForGlyphRange:usingBlock:](self, "enumerateLineFragmentsForGlyphRange:usingBlock:", v5, v6, v15);
  v7 = v17[4];
  v8 = v17[5];
  v9 = v17[6];
  v10 = v17[7];
  _Block_object_dispose(&v16, 8);
  v11 = v7;
  v12 = v8;
  v13 = v9;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

void __40__ICLayoutManager_usedLineRectForRange___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = CGRectUnion(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)+ 32), *(CGRect *)&a6);
}

- (void)textController:(id)a3 removedTrackedAttribute:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(a4, "paragraph", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "todoTrackingUUID");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[ICLayoutManager todoButtonsByTrackingUUID](self, "todoButtonsByTrackingUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "removeFromSuperview");
  -[ICLayoutManager todoButtonsByTrackingUUID](self, "todoButtonsByTrackingUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObjectForKey:", v10);

  objc_msgSend(v10, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICLayoutManager clearSupplementalViewForIdentifier:](self, "clearSupplementalViewForIdentifier:", v9);

}

- (void)contentSizeCategoryDidChange
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[5];

  -[ICLayoutManager textStorage](self, "textStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0DC10F8];
  -[ICLayoutManager textStorage](self, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__ICLayoutManager_contentSizeCategoryDidChange__block_invoke;
  v7[3] = &unk_1EA7DDC18;
  v7[4] = self;
  objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", v4, 0, v6, 0, v7);

}

void __47__ICLayoutManager_contentSizeCategoryDidChange__block_invoke(uint64_t a1, void *a2)
{
  char isKindOfClass;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v4 = v8;
  if ((isKindOfClass & 1) != 0)
  {
    v5 = v8;
    objc_msgSend(*(id *)(a1 + 32), "viewForTextAttachment:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v6, "contentSizeCategoryDidChange");
    objc_msgSend(*(id *)(a1 + 32), "viewControllerForTextAttachmentNoCreate:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v7, "contentSizeCategoryDidChange");

    v4 = v8;
  }

}

- (void)zoomFactorOrInsetsDidChange
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[5];

  -[ICLayoutManager textStorage](self, "textStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0DC10F8];
  -[ICLayoutManager textStorage](self, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__ICLayoutManager_zoomFactorOrInsetsDidChange__block_invoke;
  v7[3] = &unk_1EA7DDC18;
  v7[4] = self;
  objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", v4, 0, v6, 0, v7);

}

void __46__ICLayoutManager_zoomFactorOrInsetsDidChange__block_invoke(uint64_t a1, void *a2)
{
  char isKindOfClass;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v4 = v6;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "viewControllerForTextAttachmentNoCreate:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v5, "zoomFactorOrInsetsDidChange");

    v4 = v6;
  }

}

- (id)drawTodoViewForListRange:(_NSRange)a3 paragraphStyle:(id)a4 checkmarkHighlightValue:(id)a5 atPoint:(CGPoint)a6
{
  double y;
  double x;
  NSUInteger length;
  NSUInteger location;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  void *v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  void *v48;
  double v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat width;
  CGFloat height;
  double v55;
  double v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  CGFloat v60;
  CGFloat v61;
  CGFloat v62;
  CGFloat v63;
  double MaxX;
  double v65;
  double v66;
  double MidY;
  double v68;
  void *v69;
  _QWORD v71[4];
  id v72;
  id v73;
  double v74;
  double v75;
  double v76;
  uint64_t v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;

  y = a6.y;
  x = a6.x;
  length = a3.length;
  location = a3.location;
  v12 = a4;
  v13 = a5;
  -[ICLayoutManager trackedToDoParagraphs](self, "trackedToDoParagraphs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "todoTrackingUUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    if (!-[ICLayoutManager shouldManuallyRenderSeparateSubviews](self, "shouldManuallyRenderSeparateSubviews"))
    {
      v20 = 0;
      goto LABEL_18;
    }
    goto LABEL_5;
  }
  -[ICLayoutManager todoButtonsByTrackingUUID](self, "todoButtonsByTrackingUUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "paragraph");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "todoTrackingUUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", v19);
  v20 = (id)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
LABEL_5:
    v21 = objc_alloc(MEMORY[0x1E0D64DD8]);
    -[ICLayoutManager icTextView](self, "icTextView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "textDragInteraction");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "delegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (id)objc_msgSend(v21, "initWithDragDelegate:", v24);

    -[ICLayoutManager overrideTraitCollection](self, "overrideTraitCollection");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      v26 = (void *)MEMORY[0x1E0DC3658];
      -[ICLayoutManager overrideTraitCollection](self, "overrideTraitCollection");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "ic_tintColorWithTraitCollection:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setOverrideTintColor:", v28);

    }
    objc_msgSend(v20, "setTrackedParagraph:", v16);
    -[ICLayoutManager todoButtonsByTrackingUUID](self, "todoButtonsByTrackingUUID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "todoTrackingUUID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setObject:forKeyedSubscript:", v20, v30);

    -[ICLayoutManager activeSupplementalViews](self, "activeSupplementalViews");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "todoTrackingUUID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "UUIDString");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setObject:forKeyedSubscript:", v20, v33);

    objc_msgSend(v20, "addTarget:action:forControlEvents:", self, sel_didPressTodoButton_, 64);
  }
  objc_msgSend(v20, "superview");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v34)
  {
    -[ICLayoutManager icTextView](self, "icTextView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "containerViewForAttachments");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addSubview:", v20);

  }
  objc_msgSend(v12, "todo");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setDone:animated:", objc_msgSend(v37, "done"), 0);

  objc_msgSend(v13, "foregroundAlpha");
  if (v38 == 0.0)
    v38 = 1.0;
  objc_msgSend(v20, "ic_setAlpha:", v38);
  objc_msgSend(v13, "highlightColor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setHighlightColor:", v39);

  -[ICLayoutManager lineFragmentUsedRectForGlyphAtIndex:effectiveRange:](self, "lineFragmentUsedRectForGlyphAtIndex:effectiveRange:", -[ICLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self, "glyphRangeForCharacterRange:actualCharacterRange:", location, length, 0), 0);
  v41 = v40;
  v43 = v42;
  v45 = x + v44;
  v47 = y + v46;
  -[ICBaseLayoutManager textContainer](self, "textContainer");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "lineFragmentPadding");
  v50 = v49;
  v78.origin.x = v45;
  v78.origin.y = v47;
  v78.size.width = v41;
  v78.size.height = v43;
  v79 = CGRectInset(v78, v50, 0.0);
  v51 = v79.origin.x;
  v52 = v79.origin.y;
  width = v79.size.width;
  height = v79.size.height;

  v80.origin.x = v51;
  v80.origin.y = v52;
  v80.size.width = width;
  v80.size.height = height;
  if (!CGRectIsNull(v80))
  {
    objc_msgSend(v20, "frame");
    v56 = v55;
    v58 = v57;
    v59 = objc_msgSend(v12, "layoutWritingDirection");
    v60 = v51;
    v61 = v52;
    v62 = width;
    v63 = height;
    if (v59)
    {
      MaxX = CGRectGetMaxX(*(CGRect *)&v60);
      v65 = 4.0;
    }
    else
    {
      MaxX = CGRectGetMinX(*(CGRect *)&v60) - v56;
      v65 = -4.0;
    }
    v66 = MaxX + v65;
    v81.origin.x = v51;
    v81.origin.y = v52;
    v81.size.width = width;
    v81.size.height = height;
    MidY = CGRectGetMidY(v81);
    objc_msgSend(v20, "frame");
    v68 = round(MidY + CGRectGetHeight(v82) * -0.5);
    v69 = (void *)MEMORY[0x1E0DC3F10];
    v71[0] = MEMORY[0x1E0C809B0];
    v71[1] = 3221225472;
    v71[2] = __91__ICLayoutManager_drawTodoViewForListRange_paragraphStyle_checkmarkHighlightValue_atPoint___block_invoke;
    v71[3] = &unk_1EA7DDDE0;
    v20 = v20;
    v72 = v20;
    v74 = v66;
    v75 = v68;
    v76 = v56;
    v77 = v58;
    v73 = v12;
    objc_msgSend(v69, "ic_performWithoutAnimation:", v71);

  }
LABEL_18:

  return v20;
}

uint64_t __91__ICLayoutManager_drawTodoViewForListRange_paragraphStyle_checkmarkHighlightValue_atPoint___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:leftToRight:", objc_msgSend(*(id *)(a1 + 40), "layoutWritingDirection") == 0, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

- (void)didPressTodoButton:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[ICLayoutManager icTextView](self, "icTextView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isDraggingChecklistItem");

  if ((v5 & 1) == 0)
    -[ICLayoutManager handleTodoButtonPress:](self, "handleTodoButtonPress:", v6);

}

- (void)handleTodoButtonPress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  BOOL v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  id location;

  v4 = a3;
  -[ICLayoutManager icTextView](self, "icTextView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICBaseLayoutManager textView](self, "textView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "textViewShouldBeginEditing:", v7);

  objc_msgSend(v4, "trackedParagraph");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "characterRange");
  if (!v8)
    goto LABEL_19;
  v12 = v10;
  v13 = v11;
  v14 = objc_msgSend(v4, "isDone") ^ 1;
  -[ICBaseLayoutManager textController](self, "textController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICLayoutManager textStorage](self, "textStorage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "setDone:range:inTextStorage:", v14, v12, v13, v16);

  if (v17)
  {
    objc_msgSend(v4, "setDone:", v14);
    objc_msgSend(v4, "wasPressed");
    -[ICLayoutManager icTextView](self, "icTextView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "icDelegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_opt_respondsToSelector();

    if ((v20 & 1) != 0)
    {
      -[ICLayoutManager icTextView](self, "icTextView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "icDelegate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "didInvokeAnalyticsChecklistActionChecked:", v14);

    }
  }
  objc_msgSend(MEMORY[0x1E0DC39D8], "sharedMenuController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "isMenuVisible");

  if (v24)
  {
    objc_msgSend(MEMORY[0x1E0DC39D8], "sharedMenuController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setMenuVisible:animated:", 0, 1);

  }
  -[ICBaseLayoutManager textView](self, "textView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v26, "isFirstResponder"))
  {
    v27 = -[ICLayoutManager selectedRangesIntersectWithRange:](self, "selectedRangesIntersectWithRange:", v12, v13);

    if (v27)
      goto LABEL_13;
    if (v12 <= v13 + v12 - 1)
      v12 = v13 + v12 - 1;
    -[ICBaseLayoutManager textView](self, "textView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setSelectedRange:", v12, 0);
  }

LABEL_13:
  if (v17)
  {
    -[ICBaseLayoutManager textView](self, "textView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "delegate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_opt_respondsToSelector();

    if ((v30 & 1) != 0)
    {
      -[ICBaseLayoutManager textView](self, "textView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "delegate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICBaseLayoutManager textView](self, "textView");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "textViewDidChange:", v33);

    }
    objc_opt_class();
    -[ICLayoutManager icTextView](self, "icTextView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      objc_initWeak(&location, self);
      -[ICBaseLayoutManager textController](self, "textController");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __41__ICLayoutManager_handleTodoButtonPress___block_invoke;
      v37[3] = &unk_1EA7DE260;
      objc_copyWeak(&v38, &location);
      objc_msgSend(v36, "autoSortChecklistIfNecessaryForTrackedParagraph:textView:analyticsHandler:", v9, v35, v37);

      dispatchMainAfterDelay();
      objc_destroyWeak(&v38);
      objc_destroyWeak(&location);
    }

  }
LABEL_19:

}

void __41__ICLayoutManager_handleTodoButtonPress___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "eventReporter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "submitMoveCheckedItemsToBottomSwitchEventWithNewState:isInApp:", a2, 1);

}

void __41__ICLayoutManager_handleTodoButtonPress___block_invoke_2()
{
  UIAccessibilityPostNotification(*MEMORY[0x1E0DC4578], 0);
}

- (ICNAEventReporter)eventReporter
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  ICNAEventReporter *v7;
  ICNAEventReporter *eventReporter;
  void *v9;

  if (!self->_eventReporter && objc_msgSend(MEMORY[0x1E0D62A30], "isOptedInForAnalytics"))
  {
    v3 = objc_alloc(MEMORY[0x1E0D62A30]);
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICBaseLayoutManager textView](self, "textView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (ICNAEventReporter *)objc_msgSend(v3, "initWithSubTrackerName:view:", v5, v6);
    eventReporter = self->_eventReporter;
    self->_eventReporter = v7;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", self, sel_eventReporterLostSession_, *MEMORY[0x1E0D62A18], self->_eventReporter);

  }
  return self->_eventReporter;
}

- (void)eventReporterLostSession:(id)a3
{
  ICNAEventReporter *eventReporter;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  eventReporter = self->_eventReporter;
  self->_eventReporter = 0;
  v5 = a3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D62A18];
  objc_msgSend(v5, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "removeObserver:name:object:", self, v6, v7);
}

- (BOOL)selectedRangesIntersectWithRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSUInteger v11;
  NSUInteger v12;
  NSRange v13;
  BOOL v14;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;
  NSRange v23;

  length = a3.length;
  location = a3.location;
  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[ICBaseLayoutManager textView](self, "textView", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ic_selectedRanges");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "rangeValue");
        v13.location = v11;
        v13.length = v12;
        if (v12 || (v11 >= location ? (v14 = v11 - location >= length) : (v14 = 1), v14))
        {
          v23.location = location;
          v23.length = length;
          if (!NSIntersectionRange(v23, v13).length)
            continue;
        }
        v15 = 1;
        goto LABEL_17;
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v8)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_17:

  return v15;
}

- (void)clearAllTodos
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[ICLayoutManager todoButtonsByTrackingUUID](self, "todoButtonsByTrackingUUID", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v7);
        -[ICLayoutManager todoButtonsByTrackingUUID](self, "todoButtonsByTrackingUUID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "removeFromSuperview");
        objc_msgSend(v8, "UUIDString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICLayoutManager clearSupplementalViewForIdentifier:](self, "clearSupplementalViewForIdentifier:", v11);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  -[ICLayoutManager todoButtonsByTrackingUUID](self, "todoButtonsByTrackingUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeAllObjects");

}

- (void)prepareForScreenshotWithVisibleRange:(_NSRange)a3
{
  -[ICLayoutManager setShouldManuallyRenderSeparateSubviews:](self, "setShouldManuallyRenderSeparateSubviews:", 1, a3.length);
  -[ICLayoutManager hideVisibleTodoButtons](self, "hideVisibleTodoButtons");
}

- (void)cleanUpAfterScreenshot
{
  -[ICLayoutManager setShouldManuallyRenderSeparateSubviews:](self, "setShouldManuallyRenderSeparateSubviews:", 0);
  -[ICLayoutManager cleanupStaleTodoButtons](self, "cleanupStaleTodoButtons");
  -[ICLayoutManager clearAllSupplementalViews](self, "clearAllSupplementalViews");
  -[ICLayoutManager updateVisibleSupplementalViews](self, "updateVisibleSupplementalViews");
}

- (void)hideVisibleTodoButtons
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[ICLayoutManager todoButtonsByTrackingUUID](self, "todoButtonsByTrackingUUID", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8);
        -[ICLayoutManager todoButtonsByTrackingUUID](self, "todoButtonsByTrackingUUID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v11, "isHidden") & 1) == 0)
        {
          objc_msgSend(v11, "setHidden:", 1);
          objc_msgSend(v3, "ic_addNonNilObject:", v11);
        }

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  -[ICLayoutManager setHiddenTodosForManualLayout:](self, "setHiddenTodosForManualLayout:", v3);
}

- (void)unHideVisibleTodoButtons
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[ICLayoutManager hiddenTodosForManualLayout](self, "hiddenTodosForManualLayout", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setHidden:", 0);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  -[ICLayoutManager setHiddenTodosForManualLayout:](self, "setHiddenTodosForManualLayout:", 0);
}

- (void)layoutViewForInlineTextAttachment:(id)a3 atCharacterIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a3;
  -[ICLayoutManager inlineAttachmentLocationCache](self, "inlineAttachmentLocationCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLocation:forTextAttachmentOfViewIdentifier:", a4, v8);

  objc_opt_class();
  -[ICLayoutManager supplementalViewControllers](self, "supplementalViewControllers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v12 = v13;
  if (v13)
  {
    objc_msgSend(v13, "layoutWithStyleAttributesOfCharacterIndex:", a4);
    v12 = v13;
  }

}

- (void)manuallyRenderSubviewsForCharacterRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  CGContextRef CurrentContext;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[5];
  id v22;
  _QWORD aBlock[5];
  _BYTE v24[128];
  uint64_t v25;

  length = a3.length;
  location = a3.location;
  v25 = *MEMORY[0x1E0C80C00];
  CurrentContext = UIGraphicsGetCurrentContext();
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__ICLayoutManager_manuallyRenderSubviewsForCharacterRange___block_invoke;
  aBlock[3] = &__block_descriptor_40_e22_v24__0__UIView_8B16B20l;
  aBlock[4] = CurrentContext;
  v8 = _Block_copy(aBlock);
  -[ICLayoutManager textStorage](self, "textStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0DC10F8];
  v21[0] = v7;
  v21[1] = 3221225472;
  v21[2] = __59__ICLayoutManager_manuallyRenderSubviewsForCharacterRange___block_invoke_2;
  v21[3] = &unk_1EA7DE2C8;
  v21[4] = self;
  v11 = v8;
  v22 = v11;
  objc_msgSend(v9, "enumerateAttribute:inRange:options:usingBlock:", v10, location, length, 0, v21);

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[ICLayoutManager todoButtonsForCharacterRange:](self, "todoButtonsForCharacterRange:", location, length, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v24, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        (*((void (**)(id, _QWORD, BOOL, _QWORD))v11 + 2))(v11, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16++), -[ICLayoutManager shouldAdjustTodoButtonFramesForPrinting](self, "shouldAdjustTodoButtonFramesForPrinting"), 0);
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v24, 16);
    }
    while (v14);
  }

}

void __59__ICLayoutManager_manuallyRenderSubviewsForCharacterRange___block_invoke(uint64_t a1, void *a2, int a3, int a4)
{
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  id v13;

  v13 = a2;
  v7 = objc_msgSend(v13, "isHidden");
  objc_msgSend(v13, "setHidden:", 0);
  objc_msgSend(v13, "layoutIfNeeded");
  CGContextSaveGState(*(CGContextRef *)(a1 + 32));
  objc_msgSend(v13, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "layer", "-[ICLayoutManager manuallyRenderSubviewsForCharacterRange:]_block_invoke", 1, 0, CFSTR("Subview does not have any layer for rendering %@"), v13);
  objc_msgSend(v13, "frame");
  v10 = v9;
  CGContextTranslateCTM(*(CGContextRef *)(a1 + 32), v11, v12);
  if (a3)
  {
    CGContextScaleCTM(*(CGContextRef *)(a1 + 32), v10 / (v10 + 3.0), v10 / (v10 + 3.0));
    CGContextTranslateCTM(*(CGContextRef *)(a1 + 32), 0.0, 3.0);
  }
  if (a4)
  {
    objc_msgSend(v13, "bounds");
    objc_msgSend(v13, "drawViewHierarchyInRect:afterScreenUpdates:", 0);
  }
  else
  {
    objc_msgSend(v8, "renderInContext:", *(_QWORD *)(a1 + 32));
  }
  CGContextRestoreGState(*(CGContextRef *)(a1 + 32));
  objc_msgSend(v13, "setHidden:", v7);

}

void __59__ICLayoutManager_manuallyRenderSubviewsForCharacterRange___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void (*v17)(void);
  char isKindOfClass;
  id v19;
  void *v20;
  id v21;

  v5 = a2;
  if (!v5)
    goto LABEL_15;
  v21 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = v21;
      objc_msgSend(*(id *)(a1 + 32), "textView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "viewProviderForParentView:characterIndex:layoutManager:", v15, a3, *(_QWORD *)(a1 + 32));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "view");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_12:
        v17();
      }
    }
    else
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v5 = v21;
      if ((isKindOfClass & 1) == 0)
        goto LABEL_15;
      v19 = v21;
      objc_msgSend(*(id *)(a1 + 32), "textView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "viewProviderForParentView:characterIndex:layoutManager:", v20, a3, *(_QWORD *)(a1 + 32));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "view");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
        goto LABEL_12;
      }
    }

LABEL_14:
    v5 = v21;
    goto LABEL_15;
  }
  v6 = objc_msgSend(*(id *)(a1 + 32), "isRenderingPreviewForDragAndDrop");
  v5 = v21;
  if (v6)
  {
    v7 = v21;
    objc_msgSend(*(id *)(a1 + 32), "viewForTextAttachment:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = *(void **)(a1 + 32);
      objc_msgSend(v7, "viewIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "unhideSupplementalView:forIdentifier:", v8, v10);

      objc_opt_class();
      objc_msgSend(*(id *)(a1 + 32), "viewControllerForTextAttachment:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      ICDynamicCast();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "prepareForPrinting");

      objc_opt_class();
      ICDynamicCast();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "prepareForPrinting");

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    goto LABEL_14;
  }
LABEL_15:

}

- (id)todoButtonsForCharacterRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  ICLayoutManager *v16;
  id v17;

  length = a3.length;
  location = a3.location;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICLayoutManager textStorage](self, "textStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0D63928];
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __48__ICLayoutManager_todoButtonsForCharacterRange___block_invoke;
  v15 = &unk_1EA7DE148;
  v16 = self;
  v17 = v6;
  v9 = v6;
  objc_msgSend(v7, "ic_enumerateUnclampedAttribute:inRange:options:usingBlock:", v8, location, length, 0, &v12);

  v10 = (void *)objc_msgSend(v9, "copy", v12, v13, v14, v15, v16);
  return v10;
}

void __48__ICLayoutManager_todoButtonsForCharacterRange___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char isKindOfClass;
  int v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a2;
  if (v3)
  {
    v10 = v3;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v3 = v10;
    if ((isKindOfClass & 1) != 0)
    {
      v5 = objc_msgSend(v10, "isList");
      v3 = v10;
      if (v5)
      {
        v6 = objc_msgSend(v10, "style");
        v3 = v10;
        if (v6 == 103)
        {
          objc_msgSend(*(id *)(a1 + 32), "todoButtonsByTrackingUUID");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "todoTrackingUUID");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectForKeyedSubscript:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (v9)
            objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);

          v3 = v10;
        }
      }
    }
  }

}

- (id)trackedTodoParagraphAtIndexIfExists:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[ICLayoutManager paragraphStyleForCharacterIndex:](self, "paragraphStyleForCharacterIndex:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICLayoutManager trackedToDoParagraphs](self, "trackedToDoParagraphs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "todoTrackingUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ic_objectForNonNilKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)todoButtonForTrackedParagraphIfExists:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "paragraph");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "todoTrackingUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICLayoutManager todoButtonsByTrackingUUID](self, "todoButtonsByTrackingUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ic_objectForNonNilKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)lineCountForCharacterRange:(_NSRange)a3
{
  NSUInteger v3;
  unint64_t v5;
  uint64_t v7;
  uint64_t v8;

  v3 = a3.location + a3.length;
  if (__CFADD__(a3.location, a3.length))
    return 0;
  v5 = 0;
  do
  {
    -[ICLayoutManager lineFragmentRectForGlyphAtIndex:effectiveRange:](self, "lineFragmentRectForGlyphAtIndex:effectiveRange:", 0, 0);
    ++v5;
  }
  while (v8 + v7 <= v3);
  return v5;
}

- (void)cleanupStaleTodoButtonsAndUpdateSupplementalViewsForDictionary:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v3, "allKeys", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v10, "viewIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v11)
          {
            objc_msgSend(v10, "removeFromSuperview");
            objc_msgSend(v3, "removeObjectForKey:", v9);
          }
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (void)cleanupStaleTodoButtons
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  BOOL v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[ICLayoutManager activeSupplementalViews](self, "activeSupplementalViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICLayoutManager cleanupStaleTodoButtonsAndUpdateSupplementalViewsForDictionary:](self, "cleanupStaleTodoButtonsAndUpdateSupplementalViewsForDictionary:", v3);

  -[ICLayoutManager hiddenSupplementalViews](self, "hiddenSupplementalViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICLayoutManager cleanupStaleTodoButtonsAndUpdateSupplementalViewsForDictionary:](self, "cleanupStaleTodoButtonsAndUpdateSupplementalViewsForDictionary:", v4);

  -[ICLayoutManager icTextView](self, "icTextView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containerViewForAttachments");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subviews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v13);
        objc_opt_class();
        ICDynamicCast();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "viewIdentifier", (_QWORD)v19);
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = (void *)v16;
        if (v15)
          v18 = v16 == 0;
        else
          v18 = 0;
        if (v18)
          objc_msgSend(v14, "removeFromSuperview");

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

}

- (void)updateSubviewsForCharacterRange:(_NSRange)a3 atPoint:(CGPoint)a4
{
  NSUInteger length;
  NSUInteger location;

  length = a3.length;
  location = a3.location;
  -[ICLayoutManager setCachedOrigin:](self, "setCachedOrigin:", a4.x, a4.y);
  -[ICLayoutManager updateSubviewsForCharacterRange:](self, "updateSubviewsForCharacterRange:", location, length);
}

- (void)updateSubviewsForCharacterRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  uint64_t v7;
  _QWORD v8[5];

  length = a3.length;
  location = a3.location;
  -[ICLayoutManager textStorage](self, "textStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0D63928];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__ICLayoutManager_updateSubviewsForCharacterRange___block_invoke;
  v8[3] = &unk_1EA7DE2F0;
  v8[4] = self;
  objc_msgSend(v6, "ic_enumerateUnclampedAttribute:inRange:options:usingBlock:", v7, location, length, 0, v8);

}

void __51__ICLayoutManager_updateSubviewsForCharacterRange___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v11 = a2;
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && objc_msgSend(v11, "isList")
      && objc_msgSend(v11, "style") == 103)
    {
      objc_msgSend(*(id *)(a1 + 32), "textStorage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63D28], a3, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = *(void **)(a1 + 32);
      objc_msgSend(v9, "cachedOrigin");
      v10 = (id)objc_msgSend(v9, "drawTodoViewForListRange:paragraphStyle:checkmarkHighlightValue:atPoint:", a3, a4, v11, v8);

    }
  }

}

- (void)clearAllSupplementalViews
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a1, "supplementalViewControllers");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2(&dword_1DD7B0000, v3, v4, "Cleaning up remaining view controllers after clearing supplemental views: %@", v5, v6, v7, v8, 2u);

}

- (void)clearAllTodoSupplementalViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[ICLayoutManager activeSupplementalViews](self, "activeSupplementalViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICLayoutManager hiddenSupplementalViews](self, "hiddenSupplementalViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        objc_opt_class();
        ICDynamicCast();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          -[ICLayoutManager removeClearingControllerForView:](self, "removeClearingControllerForView:", v13, v15);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  -[ICLayoutManager todoButtonsByTrackingUUID](self, "todoButtonsByTrackingUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeAllObjects");

}

- (void)textStorageDidEndEditingNotification:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICLayoutManager textStorage](self, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
    -[ICLayoutManager clearRemovedAttachmentsIfNeeded](self, "clearRemovedAttachmentsIfNeeded");
}

- (void)removeClearingControllerForView:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;

  v4 = a3;
  objc_msgSend(v4, "viewIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[ICLayoutManager removeClearingControllerForView:].cold.1(v4);

  }
  -[ICLayoutManager removeClearingControllerForView:viewIdentifier:](self, "removeClearingControllerForView:viewIdentifier:", v4, v5);

}

- (void)removeClearingControllerForView:(id)a3 viewIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v6 = a4;
  if (v6)
  {
    -[ICLayoutManager supplementalViewProviders](self, "supplementalViewProviders");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    -[ICLayoutManager supplementalViewControllers](self, "supplementalViewControllers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
    v8 = 0;
  }
  objc_msgSend(v11, "willMoveToParentViewController:", 0);
  objc_msgSend(v8, "textAttachment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v8, "textAttachment");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "superview");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "detachView:fromParentView:", v18, v14);

    if (!v11)
      goto LABEL_7;
    goto LABEL_6;
  }
  objc_msgSend(v18, "removeFromSuperview");
  if (v11)
  {
LABEL_6:
    -[ICLayoutManager supplementalViewControllers](self, "supplementalViewControllers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeObjectForKey:", v6);

  }
LABEL_7:
  if (v6)
  {
    -[ICLayoutManager supplementalViewProviders](self, "supplementalViewProviders");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeObjectForKey:", v6);

    -[ICLayoutManager inlineAttachmentLocationCache](self, "inlineAttachmentLocationCache");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "forgetLocationForViewIdentifier:", v6);

  }
  objc_msgSend(v11, "removeFromParentViewController");

}

- (void)clearRemovedAttachmentsIfNeeded
{
  ICLayoutManager *obj;

  obj = self;
  objc_sync_enter(obj);
  if (-[ICLayoutManager needsClearRemovedAttachments](obj, "needsClearRemovedAttachments"))
  {
    -[ICLayoutManager _clearRemovedAttachments](obj, "_clearRemovedAttachments");
    -[ICLayoutManager setNeedsClearRemovedAttachments:](obj, "setNeedsClearRemovedAttachments:", 0);
  }
  objc_sync_exit(obj);

}

- (void)_clearRemovedAttachments
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id obj;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[4];
  id v37;
  _BYTE v38[128];
  _QWORD v39[2];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICLayoutManager textStorage](self, "textStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0DC10F8];
  -[ICLayoutManager textStorage](self, "textStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __43__ICLayoutManager__clearRemovedAttachments__block_invoke;
  v36[3] = &unk_1EA7DDC18;
  v8 = v3;
  v37 = v8;
  objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", v5, 0, v7, 0, v36);

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[ICLayoutManager hiddenSupplementalViews](self, "hiddenSupplementalViews");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v9;
  -[ICLayoutManager activeSupplementalViews](self, "activeSupplementalViews");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v11;
  v26 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v26)
  {
    v25 = *(_QWORD *)v33;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v33 != v25)
          objc_enumerationMutation(obj);
        v27 = v12;
        v13 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v12);
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        objc_msgSend(v13, "allKeys");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v14, "copy");

        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v29;
          do
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v29 != v18)
                objc_enumerationMutation(v15);
              v20 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
              objc_msgSend(v13, "objectForKeyedSubscript:", v20);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                if (!objc_msgSend(v8, "containsObject:", v20)
                  || (objc_msgSend(v21, "viewIdentifier"),
                      v22 = (void *)objc_claimAutoreleasedReturnValue(),
                      v22,
                      !v22))
                {
                  -[ICLayoutManager removeClearingControllerForView:viewIdentifier:](self, "removeClearingControllerForView:viewIdentifier:", v21, v20);
                  objc_msgSend(v13, "removeObjectForKey:", v20);
                  -[ICLayoutManager delayedScrollOutViewDictionary](self, "delayedScrollOutViewDictionary");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v23, "removeObjectForKey:", v20);

                }
              }

            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
          }
          while (v17);
        }

        v12 = v27 + 1;
      }
      while (v27 + 1 != v26);
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v26);
  }

}

void __43__ICLayoutManager__clearRemovedAttachments__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v4, "viewIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "ic_addNonNilObject:", v3);

}

- (void)setNeedsClearRemovedAttachments:(BOOL)a3
{
  BOOL v3;
  void *v5;
  void *v6;
  char v7;

  v3 = a3;
  if (a3)
  {
    objc_opt_class();
    -[ICLayoutManager textStorage](self, "textStorage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEditing");

    if ((v7 & 1) == 0)
    {
      -[ICLayoutManager _clearRemovedAttachments](self, "_clearRemovedAttachments");
      v3 = 0;
    }
  }
  self->_needsClearRemovedAttachments = v3;
}

- (void)ensureViewIsAddedForAttachment:(id)a3 inCharacterRange:(_NSRange)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  -[ICLayoutManager viewForTextAttachment:](self, "viewForTextAttachment:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  ICDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "attachment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "attachment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 != v9)
    {
      -[ICLayoutManager clearViewForTextAttachment:](self, "clearViewForTextAttachment:", v12);
      -[ICLayoutManager viewForTextAttachment:](self, "viewForTextAttachment:", v12);
      v10 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v10;
    }
  }
  objc_msgSend(v12, "viewIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICLayoutManager unhideSupplementalView:forIdentifier:](self, "unhideSupplementalView:forIdentifier:", v5, v11);

}

- (_NSRange)rangeForAttachment:(id)a3 withTextAttachment:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  _NSRange result;

  v6 = a3;
  -[ICLayoutManager textStorage](self, "textStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "ic_rangeForAttachment:withTextAttachment:", v6, a4);
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.length = v12;
  result.location = v11;
  return result;
}

- (_NSRange)rangeForBaseAttachment:(id)a3 withTextAttachment:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  _NSRange result;

  v6 = a3;
  -[ICLayoutManager textStorage](self, "textStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "ic_rangeForBaseAttachment:withTextAttachment:", v6, a4);
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.length = v12;
  result.location = v11;
  return result;
}

- (void)enumerateAttachmentViewsInRange:(_NSRange)a3 usingBlock:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[5];
  id v12;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  -[ICLayoutManager textStorage](self, "textStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0DC10F8];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__ICLayoutManager_enumerateAttachmentViewsInRange_usingBlock___block_invoke;
  v11[3] = &unk_1EA7DE318;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v8, "enumerateAttribute:inRange:options:usingBlock:", v9, location, length, 0, v11);

}

void __62__ICLayoutManager_enumerateAttachmentViewsInRange_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  char isKindOfClass;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v4 = v8;
  if ((isKindOfClass & 1) != 0)
  {
    v5 = v8;
    objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "viewForTextAttachmentNoCreate:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    v4 = v8;
  }

}

- (id)viewProviderForTextAttachment:(id)a3 parentView:(id)a4 characterIndex:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "viewIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICLayoutManager supplementalViewProviders](self, "supplementalViewProviders");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v13 = (void *)MEMORY[0x1E0DC12B0];
    objc_msgSend(v8, "fileType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "textAttachmentViewProviderClassForFileType:", v14);

    if (((objc_msgSend(v15, "isSubclassOfClass:", objc_opt_class()) & 1) == 0 && v15
       || objc_msgSend(v8, "isUnsupported")
       && (v17 = (void *)MEMORY[0x1E0D63C60],
           objc_msgSend(v8, "fileType"),
           v18 = (void *)objc_claimAutoreleasedReturnValue(),
           LODWORD(v17) = objc_msgSend(v17, "typeUTIIsInlineAttachment:", v18),
           v18,
           (_DWORD)v17)
       && (v15 = (void *)objc_msgSend(MEMORY[0x1E0DC12B0], "textAttachmentViewProviderClassForFileType:", *MEMORY[0x1E0D63870])) != 0)&& !objc_msgSend(v8, "isUnsupported"))
    {
      v16 = 0;
    }
    else
    {
      v15 = (void *)objc_opt_class();
      v16 = 1;
    }
    v12 = (void *)objc_msgSend(objc_alloc((Class)v15), "initWithTextAttachment:parentView:characterIndex:layoutManager:", v8, v9, a5, self);
    if (v16 && v10)
    {
      -[ICLayoutManager supplementalViewProviders](self, "supplementalViewProviders");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v12, v10);

    }
  }

  return v12;
}

- (void)willPlaceView:(id)a3 forTextAttachment:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v9;
    -[ICBaseLayoutManager textContainer](self, "textContainer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "attachmentSizeForTextContainer:", v8);
    objc_msgSend(v7, "setAttachmentContentSize:");

  }
}

- (void)didAddViewForTextAttachment:(id)a3
{
  id v4;
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
  void *v15;
  id v16;

  v4 = a3;
  -[ICLayoutManager icTextView](self, "icTextView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((self.icTextView) != nil)", "-[ICLayoutManager didAddViewForTextAttachment:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "self.icTextView");
  -[ICLayoutManager supplementalViewControllers](self, "supplementalViewControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[ICLayoutManager icTextView](self, "icTextView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "editorController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "textViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addChildViewController:", v16);

    -[ICLayoutManager icTextView](self, "icTextView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "editorController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "textViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "didMoveToParentViewController:", v13);

    -[ICLayoutManager highlightPatternRegexFinder](self, "highlightPatternRegexFinder");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    ICDynamicCast();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setHighlightPatternRegexFinder:", v14);

  }
}

- (id)paragraphStyleForCharacterIndex:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[ICLayoutManager textStorage](self, "textStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63928], a3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)receivedMemoryWarning:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[ICLayoutManager delayedScrollOutViewDictionary](self, "delayedScrollOutViewDictionary", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10);
        objc_opt_class();
        -[ICLayoutManager supplementalViewForIdentifier:allowHiddenViews:](self, "supplementalViewForIdentifier:allowHiddenViews:", v11, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        ICDynamicCast();
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        -[ICLayoutManager delayedScrollOutViewDictionary](self, "delayedScrollOutViewDictionary");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "removeObjectForKey:", v11);

        objc_msgSend(v13, "didScrollOutOfVisibleRange");
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  -[ICLayoutManager delayedScrollOutViewDictionary](self, "delayedScrollOutViewDictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeAllObjects");

  -[ICLayoutManager updateHiddenViewsSelectorDelayer](self, "updateHiddenViewsSelectorDelayer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "cancelPreviousFireRequests");

}

- (void)updateHiddenSupplementalViews
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[ICLayoutManager delayedScrollOutViewDictionary](self, "delayedScrollOutViewDictionary", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v9);
        -[ICLayoutManager delayedScrollOutViewDictionary](self, "delayedScrollOutViewDictionary");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "timeIntervalSinceNow");
        if (v13 <= -0.1)
        {
          objc_opt_class();
          -[ICLayoutManager supplementalViewForIdentifier:allowHiddenViews:](self, "supplementalViewForIdentifier:allowHiddenViews:", v10, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          ICDynamicCast();
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          -[ICLayoutManager delayedScrollOutViewDictionary](self, "delayedScrollOutViewDictionary");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "removeObjectForKey:", v10);

          objc_msgSend(v15, "didScrollOutOfVisibleRange");
        }

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v7);
  }

  -[ICLayoutManager delayedScrollOutViewDictionary](self, "delayedScrollOutViewDictionary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  -[ICLayoutManager updateHiddenViewsSelectorDelayer](self, "updateHiddenViewsSelectorDelayer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v18)
    objc_msgSend(v19, "requestFire");
  else
    objc_msgSend(v19, "cancelPreviousFireRequests");

}

- (BOOL)unhideSupplementalView:(id)a3 forIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  NSObject *v19;
  uint8_t v21[16];

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    v19 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_1DD7B0000, v19, OS_LOG_TYPE_DEFAULT, "Asked to unhide a view with a nil identifier", v21, 2u);
    }

    goto LABEL_9;
  }
  -[ICLayoutManager delayedScrollOutViewDictionary](self, "delayedScrollOutViewDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICLayoutManager delayedScrollOutViewDictionary](self, "delayedScrollOutViewDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObjectForKey:", v7);

  -[ICLayoutManager hiddenSupplementalViews](self, "hiddenSupplementalViews");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
LABEL_9:
    v18 = 0;
    goto LABEL_10;
  }
  -[ICLayoutManager hiddenSupplementalViews](self, "hiddenSupplementalViews");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeObjectForKey:", v7);

  -[ICLayoutManager activeSupplementalViews](self, "activeSupplementalViews");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v6, v7);

  -[ICLayoutManager highlightPatternRegexFinder](self, "highlightPatternRegexFinder");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  ICDynamicCast();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setHighlightPatternRegexFinder:", v15);

  objc_msgSend(v6, "setHidden:", 0);
  if (!v9)
  {
    objc_opt_class();
    ICDynamicCast();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "didScrollIntoVisibleRange");

  }
  v18 = 1;
LABEL_10:

  return v18;
}

- (void)hideSupplementalView:(id)a3 forIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint8_t v23[16];

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[ICLayoutManager activeSupplementalViews](self, "activeSupplementalViews");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
LABEL_16:
      -[ICLayoutManager updateHiddenSupplementalViews](self, "updateHiddenSupplementalViews");
      goto LABEL_17;
    }
    objc_opt_class();
    -[ICLayoutManager supplementalViewControllers](self, "supplementalViewControllers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12 || (objc_msgSend(v12, "isInResponderChain") & 1) == 0)
    {
      -[ICLayoutManager activeSupplementalViews](self, "activeSupplementalViews");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "removeObjectForKey:", v7);

      -[ICLayoutManager hiddenSupplementalViews](self, "hiddenSupplementalViews");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v6, v7);

      objc_msgSend(v6, "setHidden:", 1);
    }
    objc_opt_class();
    ICDynamicCast();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      v17 = objc_msgSend(v15, "cancelDidScrollIntoVisibleRange");
      -[ICLayoutManager delayedScrollOutViewDictionary](self, "delayedScrollOutViewDictionary");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v17)
      {
        objc_msgSend(v18, "removeObjectForKey:", v7);
LABEL_14:

        goto LABEL_15;
      }
      objc_msgSend(v18, "objectForKeyedSubscript:", v7);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v21)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICLayoutManager delayedScrollOutViewDictionary](self, "delayedScrollOutViewDictionary");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setObject:forKeyedSubscript:", v19, v7);

        goto LABEL_14;
      }
    }
LABEL_15:

    goto LABEL_16;
  }
  v20 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v23 = 0;
    _os_log_impl(&dword_1DD7B0000, v20, OS_LOG_TYPE_DEFAULT, "Asked to hide a view with a nil identifier", v23, 2u);
  }

LABEL_17:
}

- (void)ensureLayoutForSurroundingPages
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double MinY;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  int v17;
  double v18;
  double MaxY;
  BOOL v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;

  -[ICBaseLayoutManager textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[ICLayoutManager layoutEnsuredBounds](self, "layoutEnsuredBounds");
  if (!CGRectIsInfinite(v31))
  {
    -[ICLayoutManager layoutEnsuredBounds](self, "layoutEnsuredBounds");
    if (CGRectIsNull(v32)
      || (v33.origin.x = v5,
          v33.origin.y = v7,
          v33.size.width = v9,
          v33.size.height = v11,
          MinY = CGRectGetMinY(v33),
          -[ICLayoutManager layoutEnsuredBounds](self, "layoutEnsuredBounds"),
          MinY < v11 * 0.125 + CGRectGetMinY(v34)))
    {
      v35.origin.x = v5;
      v35.origin.y = v7;
      v35.size.width = v9;
      v35.size.height = v11;
      v36 = CGRectOffset(v35, 0.0, v11 * -2.0);
      v47.origin.x = v5;
      v47.origin.y = v7;
      v47.size.width = v9;
      v47.size.height = v11;
      v37 = CGRectUnion(v36, v47);
      x = v37.origin.x;
      y = v37.origin.y;
      width = v37.size.width;
      height = v37.size.height;
      v17 = 1;
    }
    else
    {
      v17 = 0;
      height = v11;
      width = v9;
      y = v7;
      x = v5;
    }
    -[ICLayoutManager layoutEnsuredBounds](self, "layoutEnsuredBounds");
    if (CGRectIsNull(v38))
      goto LABEL_8;
    v39.origin.x = v5;
    v39.origin.y = v7;
    v39.size.width = v9;
    v39.size.height = v11;
    v29 = width;
    v18 = height;
    MaxY = CGRectGetMaxY(v39);
    -[ICLayoutManager layoutEnsuredBounds](self, "layoutEnsuredBounds");
    v20 = MaxY <= CGRectGetMaxY(v40) + v11 * -0.125;
    height = v18;
    width = v29;
    if (v20)
    {
      if (!v17)
        return;
    }
    else
    {
LABEL_8:
      v41.origin.x = v5;
      v41.origin.y = v7;
      v41.size.width = v9;
      v41.size.height = v11;
      v42 = CGRectOffset(v41, 0.0, v11 + v11);
      v48.origin.x = x;
      v48.origin.y = y;
      v48.size.width = width;
      v48.size.height = height;
      v43 = CGRectUnion(v42, v48);
      x = v43.origin.x;
      y = v43.origin.y;
      width = v43.size.width;
      height = v43.size.height;
    }
    -[ICLayoutManager layoutEnsuredBounds](self, "layoutEnsuredBounds");
    v49.origin.x = x;
    v49.origin.y = y;
    v49.size.width = width;
    v49.size.height = height;
    v45 = CGRectUnion(v44, v49);
    -[ICLayoutManager setLayoutEnsuredBounds:](self, "setLayoutEnsuredBounds:", v45.origin.x, v45.origin.y, v45.size.width, v45.size.height);
    -[ICLayoutManager layoutEnsuredBounds](self, "layoutEnsuredBounds");
    if (!CGRectIsNull(v46))
    {
      -[ICLayoutManager layoutEnsuredBounds](self, "layoutEnsuredBounds");
      v22 = v21;
      v24 = v23;
      v26 = v25;
      v28 = v27;
      -[ICBaseLayoutManager textContainer](self, "textContainer");
      v30 = (id)objc_claimAutoreleasedReturnValue();
      -[ICLayoutManager ensureLayoutForBoundingRect:inTextContainer:](self, "ensureLayoutForBoundingRect:inTextContainer:", v30, v22, v24, v26, v28);

    }
  }
}

- (void)clearLayoutEnsuredBounds
{
  -[ICLayoutManager setLayoutEnsuredBounds:](self, "setLayoutEnsuredBounds:", *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
}

- (void)invalidateLayoutForCharacterRange:(_NSRange)a3 actualCharacterRange:(_NSRange *)a4
{
  NSUInteger length;
  NSUInteger location;
  objc_super v8;

  length = a3.length;
  location = a3.location;
  if (!-[ICLayoutManager isSettingLinkTextAttributes](self, "isSettingLinkTextAttributes"))
  {
    -[ICLayoutManager clearLayoutEnsuredBounds](self, "clearLayoutEnsuredBounds");
    v8.receiver = self;
    v8.super_class = (Class)ICLayoutManager;
    -[ICLayoutManager invalidateLayoutForCharacterRange:actualCharacterRange:](&v8, sel_invalidateLayoutForCharacterRange_actualCharacterRange_, location, length, a4);
  }
}

- (void)ensureLayoutForTextContainer:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  objc_super v9;

  v4 = *MEMORY[0x1E0C9D5E0];
  v5 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
  v8 = a3;
  -[ICLayoutManager setLayoutEnsuredBounds:](self, "setLayoutEnsuredBounds:", v4, v5, v6, v7);
  v9.receiver = self;
  v9.super_class = (Class)ICLayoutManager;
  -[ICLayoutManager ensureLayoutForTextContainer:](&v9, sel_ensureLayoutForTextContainer_, v8);

}

- (CGRect)boundingRectForGlyphRange:(_NSRange)a3 inTextContainer:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  double v8;
  double x;
  double v10;
  CGFloat y;
  double v12;
  double width;
  double v14;
  CGFloat height;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  objc_super v42;
  _BYTE v43[128];
  uint64_t v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect result;
  CGRect v49;

  length = a3.length;
  location = a3.location;
  v44 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v42.receiver = self;
  v42.super_class = (Class)ICLayoutManager;
  -[ICLayoutManager boundingRectForGlyphRange:inTextContainer:](&v42, sel_boundingRectForGlyphRange_inTextContainer_, location, length, v7);
  x = v8;
  y = v10;
  width = v12;
  height = v14;
  if (-[ICLayoutManager isDraggingChecklistItem](self, "isDraggingChecklistItem"))
  {
    v16 = -[ICLayoutManager characterRangeForGlyphRange:actualGlyphRange:](self, "characterRangeForGlyphRange:actualGlyphRange:", location, length, 0);
    v18 = v17;
    -[ICLayoutManager paragraphStyleForCharacterIndex:](self, "paragraphStyleForCharacterIndex:", v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "writingDirection");
    -[ICLayoutManager todoButtonsForCharacterRange:](self, "todoButtonsForCharacterRange:", v16, v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textContainerOrigin");
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v22 = v21;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (v23)
    {
      v24 = v23;
      TSDMultiplyPointScalar();
      v25 = *(_QWORD *)v39;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v39 != v25)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v26), "frame", (_QWORD)v38);
          v28 = v27;
          v30 = v29;
          TSDAddPoints();
          v49.origin.x = v31;
          v49.origin.y = v32;
          v45.origin.x = x;
          v45.origin.y = y;
          v45.size.width = width;
          v45.size.height = height;
          v49.size.width = v28;
          v49.size.height = v30;
          v46 = CGRectUnion(v45, v49);
          v47 = CGRectIntegral(v46);
          x = v47.origin.x;
          y = v47.origin.y;
          width = v47.size.width;
          height = v47.size.height;
          ++v26;
        }
        while (v24 != v26);
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      }
      while (v24);
    }

    v33 = -0.0;
    if (v20 != 1)
      v33 = x;
    width = width + v33;
    if (v20 != 1)
      x = 0.0;

  }
  v34 = x;
  v35 = y;
  v36 = width;
  v37 = height;
  result.size.height = v37;
  result.size.width = v36;
  result.origin.y = v35;
  result.origin.x = v34;
  return result;
}

- (void)updateVisibleSupplementalViews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[5];
  id v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD v45[5];
  id v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  -[ICLayoutManager textStorage](self, "textStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICBaseLayoutManager textView](self, "textView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

    -[ICBaseLayoutManager textContainer](self, "textContainer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLayoutManager ensureLayoutForBoundingRect:inTextContainer:](self, "ensureLayoutForBoundingRect:inTextContainer:", v13, v6, v8, v10, v12);

    -[ICBaseLayoutManager textContainer](self, "textContainer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[ICLayoutManager glyphRangeForBoundingRect:inTextContainer:](self, "glyphRangeForBoundingRect:inTextContainer:", v14, v6, v8, v10, v12);
    v17 = v16;

    v18 = -[ICLayoutManager characterRangeForGlyphRange:actualGlyphRange:](self, "characterRangeForGlyphRange:actualGlyphRange:", v15, v17, 0);
    v20 = v19;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v20 && v18 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v23 = MEMORY[0x1E0C809B0];
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __49__ICLayoutManager_updateVisibleSupplementalViews__block_invoke;
      v45[3] = &unk_1EA7DE340;
      v45[4] = self;
      v24 = v21;
      v46 = v24;
      -[ICLayoutManager enumerateAttachmentViewsInRange:usingBlock:](self, "enumerateAttachmentViewsInRange:usingBlock:", v18, v20, v45);
      v25 = (void *)MEMORY[0x1E0DC3F10];
      v41[0] = v23;
      v41[1] = 3221225472;
      v41[2] = __49__ICLayoutManager_updateVisibleSupplementalViews__block_invoke_2;
      v41[3] = &unk_1EA7DDCB8;
      v41[4] = self;
      v43 = v18;
      v44 = v20;
      v42 = v24;
      objc_msgSend(v25, "ic_performWithoutAnimation:", v41);

    }
    v26 = (void *)MEMORY[0x1E0C99E20];
    -[ICLayoutManager activeSupplementalViews](self, "activeSupplementalViews");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "allValues");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setWithArray:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v29, "minusSet:", v22);
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v30 = v29;
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v38 != v33)
            objc_enumerationMutation(v30);
          v35 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          objc_msgSend(v35, "viewIdentifier", (_QWORD)v37);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICLayoutManager hideSupplementalView:forIdentifier:](self, "hideSupplementalView:forIdentifier:", v35, v36);

        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
      }
      while (v32);
    }

    -[ICLayoutManager updateHiddenSupplementalViews](self, "updateHiddenSupplementalViews");
  }
}

void __49__ICLayoutManager_updateVisibleSupplementalViews__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(a3, "viewIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unhideSupplementalView:forIdentifier:", v7, v6);

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
}

void __49__ICLayoutManager_updateVisibleSupplementalViews__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "textStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[2] = __49__ICLayoutManager_updateVisibleSupplementalViews__block_invoke_3;
  v5[3] = &unk_1EA7DE148;
  v3 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v4 = *MEMORY[0x1E0D63928];
  v5[1] = 3221225472;
  v6 = v3;
  objc_msgSend(v2, "ic_enumerateUnclampedAttribute:inRange:options:usingBlock:", v4, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0, v5);

}

void __49__ICLayoutManager_updateVisibleSupplementalViews__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  char isKindOfClass;
  int v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v7 = a2;
  if (v7)
  {
    v17 = v7;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v7 = v17;
    if ((isKindOfClass & 1) != 0)
    {
      v9 = objc_msgSend(v17, "isList");
      v7 = v17;
      if (v9)
      {
        v10 = objc_msgSend(v17, "style");
        v7 = v17;
        if (v10 == 103)
        {
          objc_msgSend(*(id *)(a1 + 32), "textStorage");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63D28], a3, 0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v13 = *(void **)(a1 + 32);
          objc_msgSend(v13, "cachedOrigin");
          objc_msgSend(v13, "drawTodoViewForListRange:paragraphStyle:checkmarkHighlightValue:atPoint:", a3, a4, v17, v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            objc_msgSend(*(id *)(a1 + 40), "addObject:", v14);
            v15 = *(void **)(a1 + 32);
            objc_msgSend(v14, "viewIdentifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "unhideSupplementalView:forIdentifier:", v14, v16);

          }
          v7 = v17;
        }
      }
    }
  }

}

- (void)updateInlineDrawingViews
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  _QWORD v7[5];

  -[ICBaseLayoutManager textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textStorage");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v4 = *MEMORY[0x1E0DC10F8];
  v5 = objc_msgSend(v6, "length");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__ICLayoutManager_updateInlineDrawingViews__block_invoke;
  v7[3] = &unk_1EA7DDC18;
  v7[4] = self;
  objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", v4, 0, v5, 0, v7);

}

void __43__ICLayoutManager_updateInlineDrawingViews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
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

  v5 = a2;
  objc_opt_class();
  ICDynamicCast();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v13;
  if (v13)
  {
    objc_msgSend(*(id *)(a1 + 32), "viewProviderForTextAttachment:characterIndex:", v13, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "conformsToProtocol:", &unk_1F04A72F0)
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v13, "attachment");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "managedObjectContext");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "ic_refreshObject:mergeChanges:", v9, 1);

      objc_msgSend(v9, "inlineDrawingModel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v11, "newDrawingFromMergeableData");

      objc_msgSend(v8, "drawingDataDidChange:", v12);
    }

    v6 = v13;
  }

}

- (void)attachmentDidLoad:(id)a3
{
  id v4;
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
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D639F0];
  v29 = v4;
  objc_msgSend(v4, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICBaseLayoutManager textController](self, "textController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "note");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ic_existingObjectWithID:context:", v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = 0;
    v12 = v10;
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0D63B40];
    objc_msgSend(v29, "object");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICBaseLayoutManager textController](self, "textController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "note");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "managedObjectContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "ic_existingObjectWithID:context:", v14, v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v12;
  }
  v18 = v12;
  objc_msgSend(v18, "note");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICBaseLayoutManager textController](self, "textController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "note");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v19, "isEqual:", v21);

  if (v22)
  {
    v23 = -[ICLayoutManager rangeForBaseAttachment:withTextAttachment:](self, "rangeForBaseAttachment:withTextAttachment:", v18, 0);
    if (v23 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v25 = v23;
      v26 = v24;
      objc_opt_class();
      -[ICLayoutManager textStorage](self, "textStorage");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      ICDynamicCast();
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      -[ICLayoutManager filterAttachmentsInTextStorage:range:targetAttachment:](self, "filterAttachmentsInTextStorage:range:targetAttachment:", v28, v25, v26, v18);
      -[ICLayoutManager invalidateLayoutForCharacterRange:actualCharacterRange:](self, "invalidateLayoutForCharacterRange:actualCharacterRange:", v25, v26, 0);

    }
  }

}

- (void)filterAttachmentsInTextStorage:(id)a3 range:(_NSRange)a4 targetAttachment:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  id v9;

  length = a4.length;
  location = a4.location;
  v8 = a3;
  objc_msgSend(a5, "note");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "filterAttachmentsInTextStorage:range:", v8, location, length);

}

- (void)mediaDidLoad:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = (void *)MEMORY[0x1E0D63BA8];
  objc_msgSend(a3, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICBaseLayoutManager textController](self, "textController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "note");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ic_existingObjectWithID:context:", v5, v8);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "attachment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "note");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICBaseLayoutManager textController](self, "textController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "note");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 == v12)
    -[ICLayoutManager invalidateLayoutForAttachment:](self, "invalidateLayoutForAttachment:", v9);

}

- (void)invalidateLayoutForAttachment:(id)a3
{
  uint64_t v4;
  uint64_t v5;

  v4 = -[ICLayoutManager rangeForAttachment:withTextAttachment:](self, "rangeForAttachment:withTextAttachment:", a3, 0);
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    -[ICLayoutManager invalidateLayoutForCharacterRange:actualCharacterRange:](self, "invalidateLayoutForCharacterRange:actualCharacterRange:", v4, v5, 0);
}

- (void)attachmentInlineDrawingMergeableDataDidChange:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  ICCheckedDynamicCast();
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v6)
  {
    v7 = v6;
    performBlockOnMainThreadAndWait();

    v5 = v6;
  }

}

void __65__ICLayoutManager_attachmentInlineDrawingMergeableDataDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;

  objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v4 = *(_QWORD *)(a1 + 32);
  v24 = 0;
  objc_msgSend(v3, "existingObjectWithID:error:", v4, &v24);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v24;
  ICCheckedDynamicCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = *(void **)(a1 + 40);
    v23 = 0;
    v9 = objc_msgSend(v8, "rangeForAttachment:withTextAttachment:", v7, &v23);
    v10 = v23;
    if (v10)
    {
      objc_msgSend(*(id *)(a1 + 40), "viewProviderForTextAttachment:characterIndex:", v10, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "conformsToProtocol:", &unk_1F04A72F0)
        && (objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 40), "workerContext");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
        {
          objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "workerManagedObjectContext");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "setWorkerContext:", v15);

        }
        objc_msgSend(*(id *)(a1 + 40), "workerContext");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __65__ICLayoutManager_attachmentInlineDrawingMergeableDataDidChange___block_invoke_2;
        v19[3] = &unk_1EA7DDBF0;
        v17 = *(id *)(a1 + 32);
        v18 = *(_QWORD *)(a1 + 40);
        v20 = v17;
        v21 = v18;
        v22 = v12;
        objc_msgSend(v16, "performBlockAndWait:", v19);

      }
    }
  }
  else
  {
    v10 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __65__ICLayoutManager_attachmentInlineDrawingMergeableDataDidChange___block_invoke_cold_1((uint64_t)v6, v10);
  }

}

void __65__ICLayoutManager_attachmentInlineDrawingMergeableDataDidChange___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v2 = (void *)MEMORY[0x1E0D639F0];
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "workerContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_existingObjectWithID:context:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "inlineDrawingModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "newDrawingFromMergeableData");

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __65__ICLayoutManager_attachmentInlineDrawingMergeableDataDidChange___block_invoke_3;
    v9[3] = &unk_1EA7DD498;
    v10 = *(id *)(a1 + 48);
    v11 = v7;
    v8 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], v9);

  }
}

uint64_t __65__ICLayoutManager_attachmentInlineDrawingMergeableDataDidChange___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawingDataDidChange:", *(_QWORD *)(a1 + 40));
}

- (id)supplementalViewForIdentifier:(id)a3 allowHiddenViews:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint8_t v12[16];

  v4 = a4;
  v6 = a3;
  if (v6)
  {
    -[ICLayoutManager activeSupplementalViews](self, "activeSupplementalViews");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8 && v4)
    {
      -[ICLayoutManager hiddenSupplementalViews](self, "hiddenSupplementalViews");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v10 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1DD7B0000, v10, OS_LOG_TYPE_DEFAULT, "Asked for a supplemental view for a nil-identifier", v12, 2u);
    }

    v8 = 0;
  }

  return v8;
}

- (void)clearSupplementalViewForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];

  v4 = a3;
  if (v4)
  {
    -[ICLayoutManager activeSupplementalViews](self, "activeSupplementalViews");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectForKey:", v4);

    -[ICLayoutManager hiddenSupplementalViews](self, "hiddenSupplementalViews");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", v4);

    -[ICLayoutManager delayedScrollOutViewDictionary](self, "delayedScrollOutViewDictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject removeObjectForKey:](v7, "removeObjectForKey:", v4);
  }
  else
  {
    v7 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1DD7B0000, v7, OS_LOG_TYPE_DEFAULT, "Asked to clear a supplemental view for a nil-identifier", v8, 2u);
    }
  }

}

- (id)viewForTextAttachment:(id)a3
{
  return -[ICLayoutManager viewForTextAttachment:initialCharacterIndex:](self, "viewForTextAttachment:initialCharacterIndex:", a3, 0x7FFFFFFFFFFFFFFFLL);
}

- (id)viewForTextAttachment:(id)a3 initialCharacterIndex:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  int v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  void *v40;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  id v54;
  __int16 v55;
  uint64_t v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[ICLayoutManager viewForTextAttachmentNoCreate:](self, "viewForTextAttachmentNoCreate:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[ICBaseLayoutManager textContainer](self, "textContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "attachmentViewClassForTextContainer:", v9);
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      goto LABEL_34;
    v11 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD7B0000, v11, OS_LOG_TYPE_DEFAULT, "Found view of wrong type. Recreating.", buf, 2u);
    }

    -[ICLayoutManager clearViewForTextAttachment:](self, "clearViewForTextAttachment:", v6);
  }
  objc_msgSend(v6, "viewIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (-[ICLayoutManager shouldManuallyRenderSeparateSubviews](self, "shouldManuallyRenderSeparateSubviews"))
      v12 = -[ICLayoutManager isRenderingPreviewForDragAndDrop](self, "isRenderingPreviewForDragAndDrop") ^ 1;
    else
      v12 = 0;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[ICLayoutManager inlineAttachmentLocationCache](self, "inlineAttachmentLocationCache");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "viewIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (a4 == 0x7FFFFFFFFFFFFFFFLL)
        a4 = objc_msgSend(v13, "locationForTextAttachmentOfViewIdentifier:", v14);
      else
        objc_msgSend(v13, "setLocation:forTextAttachmentOfViewIdentifier:", a4, v14);

    }
    objc_msgSend(v6, "newlyCreatedViewControllerForManualRendering:layoutManager:initialCharacterIndex:", v12, self, a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      -[ICLayoutManager highlightPatternRegexFinder](self, "highlightPatternRegexFinder");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      ICDynamicCast();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setHighlightPatternRegexFinder:", v16);

      -[ICLayoutManager supplementalViewControllers](self, "supplementalViewControllers");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "viewIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v15, v19);

      objc_msgSend(v15, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (-[ICLayoutManager shouldManuallyRenderSeparateSubviews](self, "shouldManuallyRenderSeparateSubviews")
        && !-[ICLayoutManager isRenderingPreviewForDragAndDrop](self, "isRenderingPreviewForDragAndDrop"))
      {
        -[ICBaseLayoutManager textContainer](self, "textContainer");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "newlyCreatedViewForManualRenderingInTextContainer:", v20);
        v21 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[ICBaseLayoutManager textContainer](self, "textContainer");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "newlyCreatedViewForTextContainer:", v20);
        v21 = objc_claimAutoreleasedReturnValue();
      }
      v8 = (void *)v21;

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[ICLayoutManager icTextView](self, "icTextView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "editorController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setLinkMenuDelegate:", v23);

    }
    -[ICLayoutManager activeSupplementalViews](self, "activeSupplementalViews");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "viewIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v8, v25);

    objc_opt_class();
    ICDynamicCast();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLayoutManager highlightPatternRegexFinder](self, "highlightPatternRegexFinder");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setHighlightPatternRegexFinder:", v27);

    -[ICBaseLayoutManager textController](self, "textController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "authorHighlightsController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      objc_msgSend(v6, "foregroundAlpha");
      objc_msgSend(v26, "setForegroundAlpha:");
      objc_msgSend(v6, "highlightColor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setHighlightColor:", v30);

    }
    objc_msgSend(v6, "attachment");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v32 = v31;
      if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
      {
        objc_msgSend(v32, "managedObjectContext");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "ic_isMainThreadContext");

        if (v34)
        {
          v35 = os_log_create("com.apple.notes", "UI");
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v32, "shortLoggingDescription");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v32, "markedForDeletion"));
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v32, "mergeableData");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "numberWithUnsignedInteger:", objc_msgSend(v44, "length"));
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "media");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "shortLoggingDescription");
            v37 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413314;
            v48 = v46;
            v49 = 2112;
            v50 = v45;
            v51 = 2112;
            v52 = v42;
            v53 = 2112;
            v54 = v6;
            v55 = 2112;
            v56 = v37;
            v38 = (void *)v37;
            _os_log_impl(&dword_1DD7B0000, v35, OS_LOG_TYPE_INFO, "Created view for attachment %@ markedForDeletion=%@ mergeableDataLength=%@ textAttachment=%@ media=%@", buf, 0x34u);

          }
        }
      }

    }
  }
LABEL_34:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v39 = v8;
    -[ICLayoutManager attachmentViewDelegate](self, "attachmentViewDelegate");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setDelegate:", v40);

  }
  return v8;
}

- (id)viewForTextAttachmentNoCreate:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "attachmentIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICLayoutManager supplementalViewForIdentifier:allowHiddenViews:](self, "supplementalViewForIdentifier:allowHiddenViews:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)viewForBaseTextAttachmentNoCreate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[ICLayoutManager viewForTextAttachmentNoCreate:](self, "viewForTextAttachmentNoCreate:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "attachment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLayoutManager viewProviderForTextAttachment:characterIndex:](self, "viewProviderForTextAttachment:characterIndex:", v4, -[ICLayoutManager rangeForAttachment:withTextAttachment:](self, "rangeForAttachment:withTextAttachment:", v6, 0));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)viewControllerForTextAttachment:(id)a3 createIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a4;
  v6 = a3;
  -[ICLayoutManager supplementalViewControllers](self, "supplementalViewControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9 && v4)
  {
    v10 = -[ICLayoutManager viewForTextAttachment:](self, "viewForTextAttachment:", v6);
    -[ICLayoutManager supplementalViewControllers](self, "supplementalViewControllers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "viewIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICLayoutManager highlightPatternRegexFinder](self, "highlightPatternRegexFinder");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    ICDynamicCast();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setHighlightPatternRegexFinder:", v13);

  }
  return v9;
}

- (id)viewControllerForTextAttachment:(id)a3
{
  return -[ICLayoutManager viewControllerForTextAttachment:createIfNeeded:](self, "viewControllerForTextAttachment:createIfNeeded:", a3, 1);
}

- (id)viewControllerForTextAttachmentNoCreate:(id)a3
{
  return -[ICLayoutManager viewControllerForTextAttachment:createIfNeeded:](self, "viewControllerForTextAttachment:createIfNeeded:", a3, 0);
}

- (void)clearViewsForAllTextAttachmentsThatSupportThumbnailMode
{
  void *v3;
  uint64_t v4;
  _QWORD v5[5];

  -[ICLayoutManager textStorage](self, "textStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __74__ICLayoutManager_clearViewsForAllTextAttachmentsThatSupportThumbnailMode__block_invoke;
  v5[3] = &unk_1EA7DE368;
  v5[4] = self;
  -[ICLayoutManager enumerateAttachmentViewsInRange:usingBlock:](self, "enumerateAttachmentViewsInRange:usingBlock:", 0, v4, v5);
}

void __74__ICLayoutManager_clearViewsForAllTextAttachmentsThatSupportThumbnailMode__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "supportsMultiplePresentationSizes"))
    objc_msgSend(*(id *)(a1 + 32), "clearViewForTextAttachment:", v4);

}

- (void)clearViewForTextAttachment:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[ICLayoutManager viewForTextAttachmentNoCreate:](self, "viewForTextAttachmentNoCreate:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v7, "viewIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLayoutManager clearSupplementalViewForIdentifier:](self, "clearSupplementalViewForIdentifier:", v5);

    objc_msgSend(v7, "viewIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLayoutManager removeClearingControllerForView:viewIdentifier:](self, "removeClearingControllerForView:viewIdentifier:", v4, v6);

  }
}

- (void)invalidateLayoutAfterAttachmentViewTypeChangeIfNecessary
{
  if (!-[ICLayoutManager isUpdatingForAttachmentViewTypeChange](self, "isUpdatingForAttachmentViewTypeChange"))
  {
    -[ICLayoutManager clearViewsForAllTextAttachmentsThatSupportThumbnailMode](self, "clearViewsForAllTextAttachmentsThatSupportThumbnailMode");
    -[ICLayoutManager invalidateLayoutAfterAttachmentViewTypeChange](self, "invalidateLayoutAfterAttachmentViewTypeChange");
  }
}

- (void)invalidateLayoutAfterAttachmentViewTypeChange
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  -[ICLayoutManager textStorage](self, "textStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  -[ICLayoutManager textStorage](self, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0DC10F8];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__ICLayoutManager_invalidateLayoutAfterAttachmentViewTypeChange__block_invoke;
  v9[3] = &unk_1EA7DDC18;
  v9[4] = self;
  objc_msgSend(v5, "enumerateAttribute:inRange:options:usingBlock:", v6, 0, v4, 0, v9);

  -[ICBaseLayoutManager textView](self, "textView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICLayoutManager ensureLayoutForTextContainer:](self, "ensureLayoutForTextContainer:", v8);

}

void __64__ICLayoutManager_invalidateLayoutAfterAttachmentViewTypeChange__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;

  v7 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v7, "supportsMultiplePresentationSizes"))
  {
    objc_msgSend(*(id *)(a1 + 32), "invalidateLayoutForCharacterRange:actualCharacterRange:", a3, a4, 0);
    objc_msgSend(*(id *)(a1 + 32), "invalidateDisplayForCharacterRange:", a3, a4);
  }

}

- (void)fillBackgroundRectArray:(const CGRect *)a3 count:(unint64_t)a4 forCharacterRange:(_NSRange)a5 color:(id)a6
{
  unint64_t v6;
  CGSize *p_size;
  double width;
  double height;
  double v11;
  double v12;
  void *v13;

  v6 = a4;
  objc_msgSend(a6, "set", a3, a4, a5.location, a5.length);
  if (v6)
  {
    p_size = &a3->size;
    do
    {
      width = p_size[-1].width;
      height = p_size[-1].height;
      v11 = p_size->width;
      v12 = p_size->height;
      p_size += 2;
      objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", width, height, v11, v12, 3.0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "fill");

      --v6;
    }
    while (v6);
  }
}

- (id)linkAttributesForLink:(id)a3 forCharacterAtIndex:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  float v17;
  double v18;
  uint64_t v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;

  objc_msgSend(MEMORY[0x1E0D64B60], "defaultLinkTextAttributes", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0D1CF68], "sharedController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICLayoutManager textStorage](self, "textStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferredTextAttributesForLinkAtCharacterIndex:ofStorage:", a4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "mutableCopy");
  v12 = (void *)v11;
  if (v11)
    v13 = (void *)v11;
  else
    v13 = v7;
  v14 = v13;

  -[ICLayoutManager textStorage](self, "textStorage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63D30], a4, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "floatValue");
  v18 = v17;

  objc_opt_class();
  v19 = *MEMORY[0x1E0DC1140];
  objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1140]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = fabs(v18);
  if (v22 >= 0.00999999978)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "preferredDefaultFontColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "ic_colorBlendedWithColor:fraction:", v23, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = v18 * 0.6 + 1.0;
    if (v25 < 0.0)
      v25 = 0.0;
    objc_msgSend(v24, "colorWithAlphaComponent:", fmin(v25, 1.0));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v14, "ic_setNonNilObject:forKey:", v21, v19);
  if (v18 <= -0.1)
    v26 = &unk_1EA821BF8;
  else
    v26 = &unk_1EA821BE0;
  objc_msgSend(v14, "ic_setNonNilObject:forKey:", v26, *MEMORY[0x1E0DC1248]);
  v27 = (void *)objc_msgSend(v14, "copy");

  return v27;
}

- (id)icaxTodoButtonForParagraphStyle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[ICLayoutManager trackedToDoParagraphs](self, "trackedToDoParagraphs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "todoTrackingUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[ICLayoutManager todoButtonsByTrackingUUID](self, "todoButtonsByTrackingUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "paragraph");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "todoTrackingUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)isZooming
{
  return self->_isZooming;
}

- (void)setIsZooming:(BOOL)a3
{
  self->_isZooming = a3;
}

- (BOOL)isUpdatingForAttachmentViewTypeChange
{
  return self->_isUpdatingForAttachmentViewTypeChange;
}

- (void)setIsUpdatingForAttachmentViewTypeChange:(BOOL)a3
{
  self->_isUpdatingForAttachmentViewTypeChange = a3;
}

- (BOOL)lineHeightIncludeParagraphSpacing
{
  return self->_lineHeightIncludeParagraphSpacing;
}

- (void)setLineHeightIncludeParagraphSpacing:(BOOL)a3
{
  self->_lineHeightIncludeParagraphSpacing = a3;
}

- (BOOL)shouldManuallyRenderSeparateSubviews
{
  return self->_shouldManuallyRenderSeparateSubviews;
}

- (void)setShouldManuallyRenderSeparateSubviews:(BOOL)a3
{
  self->_shouldManuallyRenderSeparateSubviews = a3;
}

- (BOOL)shouldAdjustTodoButtonFramesForPrinting
{
  return self->_shouldAdjustTodoButtonFramesForPrinting;
}

- (void)setShouldAdjustTodoButtonFramesForPrinting:(BOOL)a3
{
  self->_shouldAdjustTodoButtonFramesForPrinting = a3;
}

- (BOOL)isRenderingPreviewForDragAndDrop
{
  return self->_isRenderingPreviewForDragAndDrop;
}

- (void)setIsRenderingPreviewForDragAndDrop:(BOOL)a3
{
  self->_isRenderingPreviewForDragAndDrop = a3;
}

- (BOOL)shouldIgnoreCachedOriginUpdates
{
  return self->_shouldIgnoreCachedOriginUpdates;
}

- (void)setShouldIgnoreCachedOriginUpdates:(BOOL)a3
{
  self->_shouldIgnoreCachedOriginUpdates = a3;
}

- (BOOL)isRenderingImageForPrint
{
  return self->_isRenderingImageForPrint;
}

- (void)setIsRenderingImageForPrint:(BOOL)a3
{
  self->_isRenderingImageForPrint = a3;
}

- (BOOL)isSettingLinkTextAttributes
{
  return self->_isSettingLinkTextAttributes;
}

- (void)setIsSettingLinkTextAttributes:(BOOL)a3
{
  self->_isSettingLinkTextAttributes = a3;
}

- (UITraitCollection)overrideTraitCollection
{
  return self->_overrideTraitCollection;
}

- (void)setOverrideTraitCollection:(id)a3
{
  objc_storeStrong((id *)&self->_overrideTraitCollection, a3);
}

- (void)setTrackedToDoParagraphs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (ICAttachmentViewDelegate)attachmentViewDelegate
{
  return (ICAttachmentViewDelegate *)objc_loadWeakRetained((id *)&self->_attachmentViewDelegate);
}

- (void)setAttachmentViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_attachmentViewDelegate, a3);
}

- (BOOL)isDraggingChecklistItem
{
  return self->_isDraggingChecklistItem;
}

- (void)setIsDraggingChecklistItem:(BOOL)a3
{
  self->_isDraggingChecklistItem = a3;
}

- (ICSearchResultRegexMatchFinder)highlightPatternRegexFinder
{
  return self->_highlightPatternRegexFinder;
}

- (BOOL)needsClearRemovedAttachments
{
  return self->_needsClearRemovedAttachments;
}

- (NSMutableDictionary)todoButtonsByTrackingUUID
{
  return self->_todoButtonsByTrackingUUID;
}

- (void)setTodoButtonsByTrackingUUID:(id)a3
{
  objc_storeStrong((id *)&self->_todoButtonsByTrackingUUID, a3);
}

- (CGPoint)cachedOrigin
{
  double x;
  double y;
  CGPoint result;

  x = self->_cachedOrigin.x;
  y = self->_cachedOrigin.y;
  result.y = y;
  result.x = x;
  return result;
}

- (NSMutableDictionary)activeSupplementalViews
{
  return self->_activeSupplementalViews;
}

- (void)setActiveSupplementalViews:(id)a3
{
  objc_storeStrong((id *)&self->_activeSupplementalViews, a3);
}

- (NSMutableDictionary)hiddenSupplementalViews
{
  return self->_hiddenSupplementalViews;
}

- (void)setHiddenSupplementalViews:(id)a3
{
  objc_storeStrong((id *)&self->_hiddenSupplementalViews, a3);
}

- (NSMutableDictionary)supplementalViewControllers
{
  return self->_supplementalViewControllers;
}

- (void)setSupplementalViewControllers:(id)a3
{
  objc_storeStrong((id *)&self->_supplementalViewControllers, a3);
}

- (ICTextAttachmentLocationCache)inlineAttachmentLocationCache
{
  return self->_inlineAttachmentLocationCache;
}

- (void)setInlineAttachmentLocationCache:(id)a3
{
  objc_storeStrong((id *)&self->_inlineAttachmentLocationCache, a3);
}

- (NSMutableDictionary)supplementalViewProviders
{
  return self->_supplementalViewProviders;
}

- (void)setSupplementalViewProviders:(id)a3
{
  objc_storeStrong((id *)&self->_supplementalViewProviders, a3);
}

- (CGSize)cachedTextContainerSize
{
  double width;
  double height;
  CGSize result;

  width = self->_cachedTextContainerSize.width;
  height = self->_cachedTextContainerSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCachedTextContainerSize:(CGSize)a3
{
  self->_cachedTextContainerSize = a3;
}

- (ICSelectorDelayer)updateHiddenViewsSelectorDelayer
{
  return self->_updateHiddenViewsSelectorDelayer;
}

- (void)setUpdateHiddenViewsSelectorDelayer:(id)a3
{
  objc_storeStrong((id *)&self->_updateHiddenViewsSelectorDelayer, a3);
}

- (NSMutableDictionary)delayedScrollOutViewDictionary
{
  return self->_delayedScrollOutViewDictionary;
}

- (void)setDelayedScrollOutViewDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_delayedScrollOutViewDictionary, a3);
}

- (NSManagedObjectContext)workerContext
{
  return self->_workerContext;
}

- (void)setWorkerContext:(id)a3
{
  objc_storeStrong((id *)&self->_workerContext, a3);
}

- (CGRect)layoutEnsuredBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_layoutEnsuredBounds.origin.x;
  y = self->_layoutEnsuredBounds.origin.y;
  width = self->_layoutEnsuredBounds.size.width;
  height = self->_layoutEnsuredBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setLayoutEnsuredBounds:(CGRect)a3
{
  self->_layoutEnsuredBounds = a3;
}

- (void)setEventReporter:(id)a3
{
  objc_storeStrong((id *)&self->_eventReporter, a3);
}

- (NSSet)hiddenTodosForManualLayout
{
  return self->_hiddenTodosForManualLayout;
}

- (void)setHiddenTodosForManualLayout:(id)a3
{
  objc_storeStrong((id *)&self->_hiddenTodosForManualLayout, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hiddenTodosForManualLayout, 0);
  objc_storeStrong((id *)&self->_eventReporter, 0);
  objc_storeStrong((id *)&self->_workerContext, 0);
  objc_storeStrong((id *)&self->_delayedScrollOutViewDictionary, 0);
  objc_storeStrong((id *)&self->_updateHiddenViewsSelectorDelayer, 0);
  objc_storeStrong((id *)&self->_supplementalViewProviders, 0);
  objc_storeStrong((id *)&self->_inlineAttachmentLocationCache, 0);
  objc_storeStrong((id *)&self->_supplementalViewControllers, 0);
  objc_storeStrong((id *)&self->_hiddenSupplementalViews, 0);
  objc_storeStrong((id *)&self->_activeSupplementalViews, 0);
  objc_storeStrong((id *)&self->_todoButtonsByTrackingUUID, 0);
  objc_storeStrong((id *)&self->_highlightPatternRegexFinder, 0);
  objc_destroyWeak((id *)&self->_attachmentViewDelegate);
  objc_storeStrong((id *)&self->_trackedToDoParagraphs, 0);
  objc_storeStrong((id *)&self->_overrideTraitCollection, 0);
}

- (void)textContainerForGlyphAtIndex:(os_log_t)log effectiveRange:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DD7B0000, log, OS_LOG_TYPE_ERROR, "-[ICLayoutManager textContainerForGlyphAtIndex:effectiveRange:] Error: index out of bounds", v1, 2u);
}

- (void)removeClearingControllerForView:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "className");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2(&dword_1DD7B0000, v2, v3, "View identifier was nil when clearing view of type: %@", v4, v5, v6, v7, 2u);

}

void __65__ICLayoutManager_attachmentInlineDrawingMergeableDataDidChange___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1DD7B0000, a2, OS_LOG_TYPE_ERROR, "Unable to find attachment in attachmentInlineDrawingMergeableDataDidChange: %@", (uint8_t *)&v2, 0xCu);
}

@end
