@implementation ICInlineAttachmentViewController

- (ICInlineAttachmentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICInlineAttachmentViewController initWithNibName:bundle:]", 1, 0, CFSTR("ICInlineAttachmentViewController should never be initialized from nib."));

  return 0;
}

- (ICInlineAttachmentViewController)initWithCoder:(id)a3
{
  objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICInlineAttachmentViewController initWithCoder:]", 1, 0, CFSTR("ICInlineAttachmentViewController should never be archived."));

  return 0;
}

- (ICInlineAttachmentViewController)initWithTextAttachment:(id)a3 forManualRendering:(BOOL)a4 layoutManager:(id)a5
{
  id v8;
  id v9;
  ICInlineAttachmentViewController *v10;
  ICInlineAttachmentViewController *v11;
  void *v12;
  objc_super v14;

  v8 = a3;
  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ICInlineAttachmentViewController;
  v10 = -[ICInlineAttachmentViewController initWithNibName:bundle:](&v14, sel_initWithNibName_bundle_, 0, 0);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_textAttachment, v8);
    objc_msgSend(v8, "attachment");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v11->_attachment, v12);

    v11->_forManualRendering = a4;
    objc_storeWeak((id *)&v11->_layoutManager, v9);
    v11->_initialCharIndex = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v11;
}

- (ICInlineAttachmentViewController)initWithTextAttachment:(id)a3 forManualRendering:(BOOL)a4 layoutManager:(id)a5 initialCharacterIndex:(unint64_t)a6
{
  ICInlineAttachmentViewController *result;

  result = -[ICInlineAttachmentViewController initWithTextAttachment:forManualRendering:layoutManager:](self, "initWithTextAttachment:forManualRendering:layoutManager:", a3, a4, a5);
  if (result)
    result->_initialCharIndex = a6;
  return result;
}

- (void)loadView
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  id v13;

  -[ICInlineAttachmentViewController layoutManager](self, "layoutManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textContainers");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v4, "lastObject");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = -[ICInlineAttachmentViewController forManualRendering](self, "forManualRendering");
  -[ICInlineAttachmentViewController textAttachment](self, "textAttachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((v4 & 1) != 0)
    objc_msgSend(v5, "newlyCreatedViewForManualRenderingInTextContainer:", v13);
  else
    objc_msgSend(v5, "newlyCreatedViewForTextContainer:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICInlineAttachmentViewController setView:](self, "setView:", v7);

  -[ICInlineAttachmentViewController layoutWithStyleAttributesOfCharacterIndex:](self, "layoutWithStyleAttributesOfCharacterIndex:", -[ICInlineAttachmentViewController initialCharIndex](self, "initialCharIndex"));
  objc_opt_class();
  -[ICInlineAttachmentViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setDelegate:", self);
  if (ICInternalSettingsIsTextKit2Enabled())
  {
    objc_msgSend(v9, "intrinsicContentSize");
    v11 = v10;
    objc_msgSend(v9, "intrinsicContentSize");
    objc_msgSend(v9, "setFrame:", 0.0, 0.0, v11, v12);
  }
  objc_msgSend(v9, "animateInsertionIfNecessary");

}

- (id)inlineAttachmentView
{
  void *v3;
  void *v4;

  if (-[ICInlineAttachmentViewController isViewLoaded](self, "isViewLoaded"))
  {
    objc_opt_class();
    -[ICInlineAttachmentViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (ICInlineTextAttachment)textAttachment
{
  ICInlineTextAttachment **p_textAttachment;
  void *WeakRetained;
  void *v5;
  void *v6;

  p_textAttachment = &self->_textAttachment;
  WeakRetained = objc_loadWeakRetained((id *)&self->_textAttachment);
  if (WeakRetained)
    goto LABEL_4;
  if (-[ICInlineAttachmentViewController isViewLoaded](self, "isViewLoaded"))
  {
    objc_opt_class();
    -[ICInlineAttachmentViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "textAttachment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)p_textAttachment, v6);

LABEL_4:
  }
  return (ICInlineTextAttachment *)objc_loadWeakRetained((id *)p_textAttachment);
}

- (void)layoutWithStyleAttributesOfCharacterIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;

  objc_opt_class();
  -[ICInlineAttachmentViewController layoutManager](self, "layoutManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[ICInlineAttachmentViewController layoutWithStyleAttributesOfCharacterIndex:].cold.1(self, v8);

    v9 = 0;
  }
  else
  {
    objc_msgSend(v7, "attributesAtIndex:effectiveRange:", a3, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_opt_class();
  -[ICInlineAttachmentViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v7, "styler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "authorHighlightsController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isPerformingHighlightUpdatesForTextStorage:", v7);

  if (v15)
    objc_msgSend(v11, "updateHighlightsWithAttributes:", v9);
  else
    objc_msgSend(v11, "updateStyleWithAttributes:", v9);

}

- (void)setHighlightPatternRegexFinder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_opt_class();
  -[ICInlineAttachmentViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setHighlightPatternRegexFinder:", v4);
}

- (NSTextContainer)displayTextTextContainer
{
  NSTextContainer *displayTextTextContainer;
  NSTextContainer *v4;
  NSTextContainer *v5;

  displayTextTextContainer = self->_displayTextTextContainer;
  if (!displayTextTextContainer)
  {
    v4 = (NSTextContainer *)objc_alloc_init(MEMORY[0x1E0DC12C0]);
    v5 = self->_displayTextTextContainer;
    self->_displayTextTextContainer = v4;

    -[NSTextContainer setLineFragmentPadding:](self->_displayTextTextContainer, "setLineFragmentPadding:", 0.0);
    -[NSTextContainer setMaximumNumberOfLines:](self->_displayTextTextContainer, "setMaximumNumberOfLines:", 1);
    displayTextTextContainer = self->_displayTextTextContainer;
  }
  return displayTextTextContainer;
}

- (NSLayoutManager)displayTextLayoutManager
{
  NSLayoutManager *displayTextLayoutManager;
  NSLayoutManager *v4;
  NSLayoutManager *v5;
  NSLayoutManager *v6;
  void *v7;

  displayTextLayoutManager = self->_displayTextLayoutManager;
  if (!displayTextLayoutManager)
  {
    v4 = (NSLayoutManager *)objc_alloc_init(MEMORY[0x1E0DC1280]);
    v5 = self->_displayTextLayoutManager;
    self->_displayTextLayoutManager = v4;

    v6 = self->_displayTextLayoutManager;
    -[ICInlineAttachmentViewController displayTextTextContainer](self, "displayTextTextContainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSLayoutManager addTextContainer:](v6, "addTextContainer:", v7);

    displayTextLayoutManager = self->_displayTextLayoutManager;
  }
  return displayTextLayoutManager;
}

- (NSTextStorage)displayTextTextStorage
{
  NSTextStorage *displayTextTextStorage;
  NSTextStorage *v4;
  NSTextStorage *v5;
  NSTextStorage *v6;
  void *v7;

  displayTextTextStorage = self->_displayTextTextStorage;
  if (!displayTextTextStorage)
  {
    v4 = (NSTextStorage *)objc_alloc_init(MEMORY[0x1E0DC1320]);
    v5 = self->_displayTextTextStorage;
    self->_displayTextTextStorage = v4;

    v6 = self->_displayTextTextStorage;
    -[ICInlineAttachmentViewController displayTextLayoutManager](self, "displayTextLayoutManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSTextStorage addLayoutManager:](v6, "addLayoutManager:", v7);

    displayTextTextStorage = self->_displayTextTextStorage;
  }
  return displayTextTextStorage;
}

- (void)updateDisplayTextTextStorage
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  id v28;

  -[ICInlineAttachmentViewController attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uiModel");
  v4 = objc_claimAutoreleasedReturnValue();
  -[ICInlineAttachmentViewController inlineAttachmentView](self, "inlineAttachmentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "surroundingAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v4, "attributedStringWithSurroundingAttributes:formatter:", v6, 0);
  v28 = (id)objc_claimAutoreleasedReturnValue();

  -[ICInlineAttachmentViewController displayTextTextStorage](self, "displayTextTextStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v7, "isEqual:", v28);

  if ((v4 & 1) == 0)
  {
    -[ICInlineAttachmentViewController displayTextTextStorage](self, "displayTextTextStorage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICInlineAttachmentViewController displayTextTextStorage](self, "displayTextTextStorage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "ic_range");
    objc_msgSend(v8, "replaceCharactersInRange:withAttributedString:", v10, v11, v28);

  }
  -[ICInlineAttachmentViewController displayTextTextContainer](self, "displayTextTextContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "size");
  v14 = v13;
  v16 = v15;
  -[ICInlineAttachmentViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bounds");
  v19 = v18;
  v21 = v20;

  if (v14 != v19 || v16 != v21)
  {
    -[ICInlineAttachmentViewController view](self, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bounds");
    v24 = v23;
    v26 = v25;
    -[ICInlineAttachmentViewController displayTextTextContainer](self, "displayTextTextContainer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setSize:", v24, v26);

  }
}

- (_NSRange)attachmentRange
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSUInteger v16;
  NSUInteger v17;
  NSUInteger v18;
  NSUInteger v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t, uint64_t, uint64_t, _BYTE *);
  void *v23;
  id v24;
  uint64_t *v25;
  _QWORD v26[4];
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  void *v32;
  __int128 v33;
  _NSRange result;

  -[ICInlineAttachmentViewController inlineAttachmentView](self, "inlineAttachmentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textAttachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0;
  v30 = &v29;
  v31 = 0x3010000000;
  v32 = &unk_1DDA28851;
  v33 = xmmword_1DD9E6F90;
  if (-[ICInlineAttachmentViewController initialCharIndex](self, "initialCharIndex") != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = -[ICInlineAttachmentViewController initialCharIndex](self, "initialCharIndex");
    -[ICInlineAttachmentViewController layoutManager](self, "layoutManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textStorage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "managedObjectContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __51__ICInlineAttachmentViewController_attachmentRange__block_invoke;
    v26[3] = &unk_1EA7E0318;
    v27 = v5;
    v28 = &v29;
    objc_msgSend(v8, "ic_enumerateAbstractAttachmentsInContext:range:options:usingBlock:", v9, v6, 1, 0x100000, v26);

  }
  if (v30[4] == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[ICInlineAttachmentViewController layoutManager](self, "layoutManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "textStorage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "length");

    -[ICInlineAttachmentViewController layoutManager](self, "layoutManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "textStorage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "managedObjectContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __51__ICInlineAttachmentViewController_attachmentRange__block_invoke_2;
    v23 = &unk_1EA7E0318;
    v24 = v5;
    v25 = &v29;
    objc_msgSend(v14, "ic_enumerateAbstractAttachmentsInContext:range:options:usingBlock:", v15, 0, v12, 0x100000, &v20);

  }
  if (-[ICInlineAttachmentViewController initialCharIndex](self, "initialCharIndex", v20, v21, v22, v23) == 0x7FFFFFFFFFFFFFFFLL)
    -[ICInlineAttachmentViewController setInitialCharIndex:](self, "setInitialCharIndex:", v30[4]);
  v16 = v30[4];
  v17 = v30[5];
  _Block_object_dispose(&v29, 8);

  v18 = v16;
  v19 = v17;
  result.length = v19;
  result.location = v18;
  return result;
}

uint64_t __51__ICInlineAttachmentViewController_attachmentRange__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t v5;

  if (*(_QWORD *)(result + 32) == a2)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
    *(_QWORD *)(v5 + 32) = a3;
    *(_QWORD *)(v5 + 40) = a4;
    *a5 = 1;
  }
  return result;
}

uint64_t __51__ICInlineAttachmentViewController_attachmentRange__block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t v5;

  if (*(_QWORD *)(result + 32) == a2)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
    *(_QWORD *)(v5 + 32) = a3;
    *(_QWORD *)(v5 + 40) = a4;
    *a5 = 1;
  }
  return result;
}

- (void)redrawInlineAttachmentView:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  -[ICInlineAttachmentViewController inlineAttachmentView](self, "inlineAttachmentView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    v6 = -[ICInlineAttachmentViewController attachmentRange](self, "attachmentRange");
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v8 = v6;
      v9 = v7;
      -[ICInlineAttachmentViewController layoutManager](self, "layoutManager");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "invalidateDisplayForCharacterRange:", v8, v9);

    }
  }
}

- (void)relayoutInlineAttachmentView:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  -[ICInlineAttachmentViewController inlineAttachmentView](self, "inlineAttachmentView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    v6 = -[ICInlineAttachmentViewController attachmentRange](self, "attachmentRange");
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v8 = v6;
      v9 = v7;
      -[ICInlineAttachmentViewController layoutManager](self, "layoutManager");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "invalidateLayoutForCharacterRange:actualCharacterRange:", v8, v9, 0);

    }
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)forManualRendering
{
  return self->_forManualRendering;
}

- (void)setForManualRendering:(BOOL)a3
{
  self->_forManualRendering = a3;
}

- (ICInlineAttachment)attachment
{
  return (ICInlineAttachment *)objc_loadWeakRetained((id *)&self->_attachment);
}

- (void)setTextAttachment:(id)a3
{
  objc_storeWeak((id *)&self->_textAttachment, a3);
}

- (NSLayoutManager)layoutManager
{
  return (NSLayoutManager *)objc_loadWeakRetained((id *)&self->_layoutManager);
}

- (void)setLayoutManager:(id)a3
{
  objc_storeWeak((id *)&self->_layoutManager, a3);
}

- (unint64_t)initialCharIndex
{
  return self->_initialCharIndex;
}

- (void)setInitialCharIndex:(unint64_t)a3
{
  self->_initialCharIndex = a3;
}

- (_NSRange)selectedSearchRange
{
  _NSRange *p_selectedSearchRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_selectedSearchRange = &self->_selectedSearchRange;
  location = self->_selectedSearchRange.location;
  length = p_selectedSearchRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setSelectedSearchRange:(_NSRange)a3
{
  self->_selectedSearchRange = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_layoutManager);
  objc_destroyWeak((id *)&self->_textAttachment);
  objc_destroyWeak((id *)&self->_attachment);
  objc_storeStrong((id *)&self->_displayTextTextStorage, 0);
  objc_storeStrong((id *)&self->_displayTextLayoutManager, 0);
  objc_storeStrong((id *)&self->_displayTextTextContainer, 0);
}

- (id)viewForRange:(_NSRange)a3 inFindableString:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  -[ICInlineAttachmentViewController attachment](self, "attachment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayTextRangeForSearchRange:inSearchableString:", location, length, v7);
  v10 = v9;

  if (v10)
  {
    -[ICInlineAttachmentViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)rectsForRange:(_NSRange)a3 inFindableString:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[2];

  length = a3.length;
  location = a3.location;
  v28[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  -[ICInlineAttachmentViewController attachment](self, "attachment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "displayTextRangeForSearchRange:inSearchableString:", location, length, v7);
  v11 = v10;

  v26 = 0;
  v27 = 0;
  -[ICInlineAttachmentViewController updateDisplayTextTextStorage](self, "updateDisplayTextTextStorage");
  -[ICInlineAttachmentViewController displayTextLayoutManager](self, "displayTextLayoutManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "characterRangeForGlyphRange:actualGlyphRange:", v9, v11, &v26);

  -[ICInlineAttachmentViewController displayTextLayoutManager](self, "displayTextLayoutManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICInlineAttachmentViewController displayTextTextContainer](self, "displayTextTextContainer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "boundingRectForGlyphRange:inTextContainer:", v26, v27, v14);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", v16, v18, v20, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (void)drawCharactersInRange:(_NSRange)a3 inFindableString:(id)a4 forContentView:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;

  length = a3.length;
  location = a3.location;
  v8 = a4;
  -[ICInlineAttachmentViewController displayTextTextContainer](self, "displayTextTextContainer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "size");
  v11 = v10 * -0.5;
  -[ICInlineAttachmentViewController displayTextTextContainer](self, "displayTextTextContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lineFragmentPadding");
  v14 = v11 - v13;

  -[ICInlineAttachmentViewController attachment](self, "attachment");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "displayTextRangeForSearchRange:inSearchableString:", location, length, v8);
  v18 = v17;

  v21 = 0;
  v22 = 0;
  -[ICInlineAttachmentViewController updateDisplayTextTextStorage](self, "updateDisplayTextTextStorage");
  -[ICInlineAttachmentViewController displayTextLayoutManager](self, "displayTextLayoutManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "characterRangeForGlyphRange:actualGlyphRange:", v16, v18, &v21);

  -[ICInlineAttachmentViewController displayTextLayoutManager](self, "displayTextLayoutManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "drawGlyphsForGlyphRange:atPoint:", v21, v22, 0.0, v14);

}

- (_NSRange)selectedRangeWithinRange:(_NSRange)a3 inFindableString:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v6;
  NSUInteger v7;
  NSRange v8;
  NSRange v9;
  _NSRange result;
  NSRange v11;

  length = a3.length;
  location = a3.location;
  v9.location = -[ICInlineAttachmentViewController selectedSearchRange](self, "selectedSearchRange", a3.location, a3.length, a4);
  v11.location = location;
  v11.length = length;
  v8 = NSIntersectionRange(v9, v11);
  v7 = v8.length;
  v6 = v8.location;
  result.length = v7;
  result.location = v6;
  return result;
}

- (void)layoutWithStyleAttributesOfCharacterIndex:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "textAttachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attachmentIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_1DD7B0000, a2, OS_LOG_TYPE_ERROR, "View of Token Attachment %@ character index is NSNotFound", (uint8_t *)&v5, 0xCu);

}

@end
