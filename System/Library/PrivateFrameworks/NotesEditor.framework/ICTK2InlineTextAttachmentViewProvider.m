@implementation ICTK2InlineTextAttachmentViewProvider

- (ICTK2InlineTextAttachmentViewProvider)initWithTextAttachment:(id)a3 parentView:(id)a4 textLayoutManager:(id)a5 location:(id)a6
{
  ICTK2InlineTextAttachmentViewProvider *v6;
  NSTextContentStorage *v7;
  NSTextContentStorage *tk2displayTextContentStorage;
  NSTextLayoutManager *v9;
  NSTextLayoutManager *tk2displayTextLayoutManager;
  NSTextContentStorage *v11;
  void *v12;
  void *v13;
  NSLayoutManager *v14;
  NSLayoutManager *displayTextLayoutManager;
  NSLayoutManager *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)ICTK2InlineTextAttachmentViewProvider;
  v6 = -[ICTK2TextAttachmentViewProvider initWithTextAttachment:parentView:textLayoutManager:location:](&v18, sel_initWithTextAttachment_parentView_textLayoutManager_location_, a3, a4, a5, a6);
  if (v6)
  {
    if (ICInternalSettingsIsAsyncFindEnabled())
    {
      v7 = (NSTextContentStorage *)objc_alloc_init(MEMORY[0x1E0DC12C8]);
      tk2displayTextContentStorage = v6->_tk2displayTextContentStorage;
      v6->_tk2displayTextContentStorage = v7;

      v9 = (NSTextLayoutManager *)objc_alloc_init(MEMORY[0x1E0DC12F0]);
      tk2displayTextLayoutManager = v6->_tk2displayTextLayoutManager;
      v6->_tk2displayTextLayoutManager = v9;

      v11 = v6->_tk2displayTextContentStorage;
      -[ICTK2InlineTextAttachmentViewProvider tk2displayTextLayoutManager](v6, "tk2displayTextLayoutManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSTextContentStorage addTextLayoutManager:](v11, "addTextLayoutManager:", v12);

      -[ICTK2InlineTextAttachmentViewProvider displayTextTextContainer](v6, "displayTextTextContainer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSTextLayoutManager setTextContainer:](v6->_tk2displayTextLayoutManager, "setTextContainer:", v13);
    }
    else
    {
      v14 = (NSLayoutManager *)objc_alloc_init(MEMORY[0x1E0DC1280]);
      displayTextLayoutManager = v6->_displayTextLayoutManager;
      v6->_displayTextLayoutManager = v14;

      v16 = v6->_displayTextLayoutManager;
      -[ICTK2InlineTextAttachmentViewProvider displayTextTextContainer](v6, "displayTextTextContainer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSLayoutManager addTextContainer:](v16, "addTextContainer:", v13);
    }

  }
  return v6;
}

- (void)loadView
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
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  objc_opt_class();
  -[NSTextAttachmentViewProvider textLayoutManager](self, "textLayoutManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v21 = (id)objc_claimAutoreleasedReturnValue();

  -[ICTK2InlineTextAttachmentViewProvider inlineTextAttachment](self, "inlineTextAttachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    objc_msgSend(v21, "textContainer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "newlyCreatedViewForTextContainer:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "textContentStorage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "documentRange");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "location");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTK2TextAttachmentViewProvider location](self, "location");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v8, "offsetFromLocation:toLocation:", v10, v11);

    objc_msgSend(v8, "textStorage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "attributesAtIndex:effectiveRange:", v12, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "updateStyleWithAttributes:", v14);
    -[ICTK2TextAttachmentViewProvider highlightPatternRegexFinder](self, "highlightPatternRegexFinder");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHighlightPatternRegexFinder:", v15);

    -[NSTextAttachmentViewProvider setView:](self, "setView:", v7);
    objc_opt_class();
    -[NSTextAttachmentViewProvider textAttachment](self, "textAttachment");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_opt_class();
      objc_msgSend(v21, "textContainer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      ICDynamicCast();
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "linkDelegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setLinkMenuDelegate:", v20);

    }
  }

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

- (NSTextStorage)displayTextTextStorage
{
  NSTextStorage *displayTextTextStorage;
  NSTextStorage *v4;
  NSTextStorage *v5;
  char Enabled;
  void *v7;

  displayTextTextStorage = self->_displayTextTextStorage;
  if (!displayTextTextStorage)
  {
    v4 = (NSTextStorage *)objc_alloc_init(MEMORY[0x1E0DC1320]);
    v5 = self->_displayTextTextStorage;
    self->_displayTextTextStorage = v4;

    Enabled = ICInternalSettingsIsAsyncFindEnabled();
    displayTextTextStorage = self->_displayTextTextStorage;
    if ((Enabled & 1) == 0)
    {
      -[ICTK2InlineTextAttachmentViewProvider displayTextLayoutManager](self, "displayTextLayoutManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSTextStorage addLayoutManager:](displayTextTextStorage, "addLayoutManager:", v7);

      displayTextTextStorage = self->_displayTextTextStorage;
    }
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
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  id v32;

  -[ICTK2InlineTextAttachmentViewProvider inlineTextAttachment](self, "inlineTextAttachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attachment");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v4, "uiModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTK2InlineTextAttachmentViewProvider inlineAttachmentView](self, "inlineAttachmentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "surroundingAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributedStringWithSurroundingAttributes:formatter:", v7, 0);
  v32 = (id)objc_claimAutoreleasedReturnValue();

  -[ICTK2InlineTextAttachmentViewProvider displayTextTextStorage](self, "displayTextTextStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v8, "isEqual:", v32);

  if ((v4 & 1) == 0)
  {
    -[ICTK2InlineTextAttachmentViewProvider displayTextTextStorage](self, "displayTextTextStorage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTK2InlineTextAttachmentViewProvider displayTextTextStorage](self, "displayTextTextStorage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "ic_range");
    objc_msgSend(v9, "replaceCharactersInRange:withAttributedString:", v11, v12, v32);

  }
  if ((ICInternalSettingsIsAsyncFindEnabled() & 1) != 0)
    goto LABEL_6;
  -[ICTK2InlineTextAttachmentViewProvider displayTextTextContainer](self, "displayTextTextContainer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "size");
  v15 = v14;
  v17 = v16;
  -[NSTextAttachmentViewProvider view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bounds");
  v20 = v19;
  v22 = v21;

  if (v15 != v20)
    goto LABEL_7;
  if (v17 == v22)
  {
LABEL_6:
    -[ICTK2InlineTextAttachmentViewProvider displayTextTextStorage](self, "displayTextTextStorage");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTK2InlineTextAttachmentViewProvider tk2displayTextContentStorage](self, "tk2displayTextContentStorage");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setTextStorage:", v23);

    -[ICTK2InlineTextAttachmentViewProvider tk2displayTextLayoutManager](self, "tk2displayTextLayoutManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTK2InlineTextAttachmentViewProvider tk2displayTextLayoutManager](self, "tk2displayTextLayoutManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "documentRange");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "ensureLayoutForRange:", v27);

  }
  else
  {
LABEL_7:
    -[NSTextAttachmentViewProvider view](self, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "bounds");
    v29 = v28;
    v31 = v30;
    -[ICTK2InlineTextAttachmentViewProvider displayTextTextContainer](self, "displayTextTextContainer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setSize:", v29, v31);
  }

}

- (id)viewForRange:(_NSRange)a3 inFindableString:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  -[ICTK2InlineTextAttachmentViewProvider inlineTextAttachment](self, "inlineTextAttachment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "attachment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayTextRangeForSearchRange:inSearchableString:", location, length, v7);
  v11 = v10;

  if (v11)
  {
    -[NSTextAttachmentViewProvider view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)rectsForRange:(_NSRange)a3 inFindableString:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[2];

  length = a3.length;
  location = a3.location;
  v29[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  -[ICTK2InlineTextAttachmentViewProvider inlineTextAttachment](self, "inlineTextAttachment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "attachment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "displayTextRangeForSearchRange:inSearchableString:", location, length, v7);
  v12 = v11;

  v27 = 0;
  v28 = 0;
  -[ICTK2InlineTextAttachmentViewProvider updateDisplayTextTextStorage](self, "updateDisplayTextTextStorage");
  -[ICTK2InlineTextAttachmentViewProvider displayTextLayoutManager](self, "displayTextLayoutManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "characterRangeForGlyphRange:actualGlyphRange:", v10, v12, &v27);

  -[ICTK2InlineTextAttachmentViewProvider displayTextLayoutManager](self, "displayTextLayoutManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTK2InlineTextAttachmentViewProvider displayTextTextContainer](self, "displayTextTextContainer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "boundingRectForGlyphRange:inTextContainer:", v27, v28, v15);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", v17, v19, v21, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
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
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;

  length = a3.length;
  location = a3.location;
  v8 = a4;
  -[ICTK2InlineTextAttachmentViewProvider displayTextTextContainer](self, "displayTextTextContainer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "size");
  v11 = v10 * -0.5;
  -[ICTK2InlineTextAttachmentViewProvider displayTextTextContainer](self, "displayTextTextContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lineFragmentPadding");
  v14 = v11 - v13;

  -[ICTK2InlineTextAttachmentViewProvider inlineTextAttachment](self, "inlineTextAttachment");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "attachment");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "displayTextRangeForSearchRange:inSearchableString:", location, length, v8);
  v19 = v18;

  v22 = 0;
  v23 = 0;
  -[ICTK2InlineTextAttachmentViewProvider updateDisplayTextTextStorage](self, "updateDisplayTextTextStorage");
  -[ICTK2InlineTextAttachmentViewProvider displayTextLayoutManager](self, "displayTextLayoutManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "characterRangeForGlyphRange:actualGlyphRange:", v17, v19, &v22);

  -[ICTK2InlineTextAttachmentViewProvider displayTextLayoutManager](self, "displayTextLayoutManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "drawGlyphsForGlyphRange:atPoint:", v22, v23, 0.0, v14);

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
  v9.location = -[ICTK2InlineTextAttachmentViewProvider selectedSearchRange](self, "selectedSearchRange", a3.location, a3.length, a4);
  v11.location = location;
  v11.length = length;
  v8 = NSIntersectionRange(v9, v11);
  v7 = v8.length;
  v6 = v8.location;
  result.length = v7;
  result.location = v6;
  return result;
}

- (ICInlineTextAttachment)inlineTextAttachment
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[NSTextAttachmentViewProvider textAttachment](self, "textAttachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICInlineTextAttachment *)v4;
}

- (ICInlineAttachmentView)inlineAttachmentView
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[NSTextAttachmentViewProvider view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICInlineAttachmentView *)v4;
}

- (NSTextLayoutManager)tk2displayTextLayoutManager
{
  return self->_tk2displayTextLayoutManager;
}

- (NSLayoutManager)displayTextLayoutManager
{
  return self->_displayTextLayoutManager;
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

- (NSTextContentStorage)tk2displayTextContentStorage
{
  return self->_tk2displayTextContentStorage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tk2displayTextContentStorage, 0);
  objc_storeStrong((id *)&self->_displayTextLayoutManager, 0);
  objc_storeStrong((id *)&self->_tk2displayTextLayoutManager, 0);
  objc_storeStrong((id *)&self->_displayTextTextStorage, 0);
  objc_storeStrong((id *)&self->_displayTextTextContainer, 0);
}

@end
