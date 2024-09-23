@implementation CKMessageEditingBalloonTextView

- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4 isSingleLine:(BOOL *)a5 isReplyPreview:(BOOL)a6
{
  _BOOL8 v6;
  double height;
  double width;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGSize result;

  v6 = a6;
  height = a3.height;
  width = a3.width;
  -[CKMessageEditingBalloonTextView attributedText](self, "attributedText");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "length"))
  {
    v13 = objc_alloc(MEMORY[0x1E0CB3498]);
    -[CKMessageEditingBalloonTextView typingAttributes](self, "typingAttributes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "initWithString:attributes:", CFSTR("A"), v14);

    v12 = (void *)v15;
  }
  -[CKMessageEditingBalloonTextView textContainer](self, "textContainer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKBalloonTextView sizeThatFits:attributedText:maximumNumberOfLines:lineBreakMode:isReplyPreview:outTextAlignmentInsets:outIsSingleLine:](CKBalloonTextView, "sizeThatFits:attributedText:maximumNumberOfLines:lineBreakMode:isReplyPreview:outTextAlignmentInsets:outIsSingleLine:", v12, objc_msgSend(v16, "maximumNumberOfLines"), objc_msgSend(v16, "lineBreakMode"), v6, a4, a5, width, height);
  v18 = v17;
  v20 = v19;

  v21 = v18;
  v22 = v20;
  result.height = v22;
  result.width = v21;
  return result;
}

- (BOOL)supportsAdaptiveImageGlyph
{
  return 0;
}

- (BOOL)shouldPreserveAdaptiveImageGlyphsInCompositionText
{
  return 1;
}

- (BOOL)isFakeSelected
{
  return self->_fakeSelected;
}

- (void)setFakeSelected:(BOOL)a3
{
  self->_fakeSelected = a3;
}

- (CKBalloonTextViewInteractionDelegate)interactionDelegate
{
  return (CKBalloonTextViewInteractionDelegate *)objc_loadWeakRetained((id *)&self->_interactionDelegate);
}

- (void)setInteractionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_interactionDelegate, a3);
}

- (BOOL)shouldAdjustInsetsForMinimumSize
{
  return self->_shouldAdjustInsetsForMinimumSize;
}

- (void)setShouldAdjustInsetsForMinimumSize:(BOOL)a3
{
  self->_shouldAdjustInsetsForMinimumSize = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_interactionDelegate);
}

@end
