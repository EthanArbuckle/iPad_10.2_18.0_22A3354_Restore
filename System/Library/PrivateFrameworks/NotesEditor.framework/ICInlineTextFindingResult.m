@implementation ICInlineTextFindingResult

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  id v6;
  BOOL v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  objc_opt_class();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)ICInlineTextFindingResult;
  v6 = -[ICTextFindingResult compare:](&v11, sel_compare_, v4);

  if (v6)
    v7 = 1;
  else
    v7 = v5 == 0;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ICInlineTextFindingResult displayTextRange](self, "displayTextRange"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "displayTextRange"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v8, "compare:", v9);

  }
  return (int64_t)v6;
}

- (id)inlineAttachmentViewControllerInTextView:(id)a3
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
  objc_opt_class();
  objc_msgSend(v4, "layoutManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  ICDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0D64C48];
  -[ICInlineTextFindingResult attachment](self, "attachment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textAttachmentWithAttachment:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v6, "viewControllerForTextAttachment:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)inlineTextAttachmentViewProviderInTextView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "textLayoutManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  ICDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  -[ICInlineTextFindingResult attachment](self, "attachment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "existingAttachmentViewProviderForIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)framesForHighlightInTextView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "textLayoutManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ICInlineTextFindingResult inlineTextAttachmentViewProviderInTextView:](self, "inlineTextAttachmentViewProviderInTextView:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateDisplayTextTextStorage");
    objc_msgSend(v6, "tk2displayTextLayoutManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[ICInlineTextFindingResult displayTextRange](self, "displayTextRange");
    objc_msgSend(v7, "ic_rectForRange:", v8, v9);
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;

  }
  else
  {
    -[ICInlineTextFindingResult inlineAttachmentViewControllerInTextView:](self, "inlineAttachmentViewControllerInTextView:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateDisplayTextTextStorage");
    v39 = 0;
    v40 = 0;
    objc_msgSend(v6, "displayTextLayoutManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[ICInlineTextFindingResult displayTextRange](self, "displayTextRange");
    objc_msgSend(v18, "characterRangeForGlyphRange:actualGlyphRange:", v19, v20, &v39);

    objc_msgSend(v6, "displayTextLayoutManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayTextTextContainer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "boundingRectForGlyphRange:inTextContainer:", v39, v40, v22);
    v11 = v23;
    v13 = v24;
    v15 = v25;
    v17 = v26;

  }
  objc_msgSend(v6, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "convertRect:toView:", v4, v11, v13, v15, v17);
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v35 = v34;

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", v29, v31, v33, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v36;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  return v37;
}

- (ICInlineAttachment)attachment
{
  return (ICInlineAttachment *)objc_loadWeakRetained((id *)&self->_attachment);
}

- (void)setAttachment:(id)a3
{
  objc_storeWeak((id *)&self->_attachment, a3);
}

- (NSAttributedString)findableString
{
  return self->_findableString;
}

- (void)setFindableString:(id)a3
{
  objc_storeStrong((id *)&self->_findableString, a3);
}

- (_NSRange)displayTextRange
{
  _NSRange *p_displayTextRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_displayTextRange = &self->_displayTextRange;
  location = self->_displayTextRange.location;
  length = p_displayTextRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setDisplayTextRange:(_NSRange)a3
{
  self->_displayTextRange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_findableString, 0);
  objc_destroyWeak((id *)&self->_attachment);
}

@end
