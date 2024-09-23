@implementation CKTextReplyPreviewBalloonView

- (void)configureForMessagePart:(id)a3
{
  id v4;
  objc_super v5[5];
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CKTextReplyPreviewBalloonView;
  -[CKTextBalloonView configureForMessagePart:](&v6, sel_configureForMessagePart_, v4);
  if (v4)
    objc_msgSend(v4, "balloonDescriptor");
  else
    memset(v5, 0, sizeof(v5));
  -[CKColoredBalloonView setBalloonDescriptor:](self, "setBalloonDescriptor:", v5);
  -[CKTextReplyPreviewBalloonView setIsFromMe:](self, "setIsFromMe:", objc_msgSend(v4, "isFromMe"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)CKTextReplyPreviewBalloonView;
  -[CKTextBalloonView textView](&v9, sel_textView);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)CKTextReplyPreviewBalloonView;
  -[CKTextBalloonView description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[CKTextReplyPreviewBalloonView textView:%@ %@]"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CKTextReplyPreviewBalloonView)initWithFrame:(CGRect)a3
{
  CKTextReplyPreviewBalloonView *v3;
  CKTextReplyPreviewBalloonView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CKTextReplyPreviewBalloonView;
  v3 = -[CKTextBalloonView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CKTextBalloonView textView](v3, "textView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKTextReplyPreviewBalloonView targetTextContainerInsets](v4, "targetTextContainerInsets");
    objc_msgSend(v5, "setTextContainerInset:");
    objc_msgSend(v5, "setSelectable:", 0);
    objc_msgSend(v5, "textContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMaximumNumberOfLines:", objc_msgSend(v7, "replyBalloonMaximumNumberOfLines"));

    objc_msgSend(v6, "setLineBreakMode:", 4);
    -[CKTextReplyPreviewBalloonView setIsFromMe:](v4, "setIsFromMe:", 0);
    -[CKBalloonView doubleTapGestureRecognizer](v4, "doubleTapGestureRecognizer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setEnabled:", 0);

  }
  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  char v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  objc_super v39;

  v39.receiver = self;
  v39.super_class = (Class)CKTextReplyPreviewBalloonView;
  -[CKTextBalloonView layoutSubviews](&v39, sel_layoutSubviews);
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isExpressiveTextEnabled");

  if ((v4 & 1) == 0)
  {
    -[CKTextReplyPreviewBalloonView bounds](self, "bounds");
    -[CKTextReplyPreviewBalloonView alignmentRectForFrame:](self, "alignmentRectForFrame:");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[CKBalloonView textAlignmentInsets](self, "textAlignmentInsets");
    v14 = v13;
    v16 = v15;
    v18 = v15 + v17;
    v20 = v12 + v13 + v19;
    if (-[CKTextBalloonView containsExcessiveLineHeightCharacters](self, "containsExcessiveLineHeightCharacters"))
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "transcriptTextFontLanguageAwareOutsets");
      v23 = v22;
      v38 = v10;
      v24 = v8;
      v25 = v6;
      v27 = v26;

      v28 = v23 + v27;
      v6 = v25;
      v8 = v24;
      v10 = v38;
      v20 = v20 + v28;
    }
    v29 = v6 - v16;
    v30 = v8 - v14;
    v31 = v10 + v18;
    if (CKMainScreenScale_once_76 != -1)
      dispatch_once(&CKMainScreenScale_once_76, &__block_literal_global_186);
    v32 = *(double *)&CKMainScreenScale_sMainScreenScale_76;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_76 == 0.0)
      v32 = 1.0;
    v33 = floor(v29 * v32) / v32;
    v34 = ceil(v31 * v32) / v32;
    v35 = floor(v30 * v32) / v32;
    v36 = ceil(v20 * v32) / v32;
    -[CKTextBalloonView textView](self, "textView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setFrame:", v33, v35, v34, v36);

  }
}

- (UIEdgeInsets)targetTextContainerInsets
{
  void *v2;
  double v3;
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
  double v14;
  UIEdgeInsets result;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "replyBalloonTextContainerInset");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (UIEdgeInsets)alignmentRectInsets
{
  int v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  UIEdgeInsets result;

  v2 = -[CKBalloonView orientation](self, "orientation");
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textReplyPreviewBalloonAlignmentRectInsets");
  v7 = v6;
  v9 = v8;
  if (v2)
    v10 = v4;
  else
    v10 = v5;
  if (v2)
    v11 = v5;
  else
    v11 = v4;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "textAlignmentRectInsetsScaleFactor");
  v14 = v7 * v13;
  v15 = v10 * v13;
  v16 = v9 * v13;
  v17 = v11 * v13;

  v18 = v14;
  v19 = v15;
  v20 = v16;
  v21 = v17;
  result.right = v21;
  result.bottom = v20;
  result.left = v19;
  result.top = v18;
  return result;
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKTextReplyPreviewBalloonView;
  -[CKTextBalloonView prepareForReuse](&v4, sel_prepareForReuse);
  -[CKTextBalloonView textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 0);

  -[CKTextBalloonView setContainsExcessiveLineHeightCharacters:](self, "setContainsExcessiveLineHeightCharacters:", 0);
}

- (CGSize)_textSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4 isSingleLine:(BOOL *)a5
{
  double height;
  double width;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[CKTextBalloonView textView](self, "textView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sizeThatFits:textAlignmentInsets:isSingleLine:isReplyPreview:", a4, a5, 1, width, height);
  v11 = v10;
  v13 = v12;

  v14 = v11;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (CGSize)_minimumFittingSize
{
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  if (-[CKBalloonView hasTail](self, "hasTail"))
    v3 = -[CKBalloonView balloonTailShape](self, "balloonTailShape");
  else
    v3 = 0;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "skinnyReplyBalloonMaskSizeWithTailShape:", v3);
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4 isSingleLine:(BOOL *)a5
{
  double height;
  double width;
  void *v10;
  int v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  __int128 v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  uint64_t v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  __int128 v47;
  __int128 v48;
  objc_super v49;
  CGSize result;

  height = a3.height;
  width = a3.width;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isExpressiveTextEnabled");

  if (v11)
  {
    v49.receiver = self;
    v49.super_class = (Class)CKTextReplyPreviewBalloonView;
    -[CKTextBalloonView sizeThatFits:textAlignmentInsets:isSingleLine:](&v49, sel_sizeThatFits_textAlignmentInsets_isSingleLine_, a4, a5, width, height);
    v13 = v12;
    v15 = v14;
  }
  else
  {
    -[CKTextBalloonView textView](self, "textView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView __ck_alignmentRectSizeForFrameSize:](self, "__ck_alignmentRectSizeForFrameSize:", width, height);
    v17 = *(_OWORD *)(MEMORY[0x1E0CEB4B0] + 16);
    v47 = *MEMORY[0x1E0CEB4B0];
    v48 = v17;
    objc_msgSend(v16, "sizeThatFits:textAlignmentInsets:isSingleLine:isReplyPreview:", &v47, a5, 1);
    v19 = v18;
    v21 = v20;
    -[CKTextReplyPreviewBalloonView alignmentRectInsets](self, "alignmentRectInsets");
    if (*((double *)&v47 + 1) >= v23)
      v26 = v23;
    else
      v26 = *((double *)&v47 + 1);
    if (*((double *)&v48 + 1) >= v25)
      v27 = v25;
    else
      v27 = *((double *)&v48 + 1);
    if (*(double *)&v47 >= v22)
      v28 = v22;
    else
      v28 = *(double *)&v47;
    if (*(double *)&v48 >= v24)
      v29 = v24;
    else
      v29 = *(double *)&v48;
    if (CKMainScreenScale_once_76 != -1)
      dispatch_once(&CKMainScreenScale_once_76, &__block_literal_global_186);
    v30 = 1.0;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_76 != 0.0)
      v30 = *(double *)&CKMainScreenScale_sMainScreenScale_76;
    -[UIView __ck_frameSizeForAlignmentRectSize:](self, "__ck_frameSizeForAlignmentRectSize:", ceil((v19 - (v26 + v27)) * v30) / v30, ceil((v21 - (v28 + v29)) * v30) / v30);
    v32 = v31;
    v34 = v33;
    if (-[CKBalloonView hasTail](self, "hasTail"))
      v35 = -[CKBalloonView balloonTailShape](self, "balloonTailShape");
    else
      v35 = 0;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "skinnyReplyBalloonMaskSizeWithTailShape:", v35);
    v38 = v37;
    v40 = v39;

    if (v32 < v38)
    {
      v46 = v34;
      v41 = (v38 - v32) * 0.5;
      if (CKMainScreenScale_once_76 != -1)
        dispatch_once(&CKMainScreenScale_once_76, &__block_literal_global_186);
      v42 = *(double *)&CKMainScreenScale_sMainScreenScale_76;
      if (*(double *)&CKMainScreenScale_sMainScreenScale_76 == 0.0)
        v42 = 1.0;
      v27 = v27 - floor(v41 * v42) / v42;
      v43 = *(double *)&CKMainScreenScale_sMainScreenScale_76;
      if (*(double *)&CKMainScreenScale_sMainScreenScale_76 == 0.0)
        v43 = 1.0;
      v26 = v26 - floor(v41 * v43) / v43;
      v34 = v46;
    }
    if (a4)
    {
      a4->top = v28;
      a4->left = v26;
      a4->bottom = v29;
      a4->right = v27;
    }
    v13 = fmax(v32, v38);
    v15 = fmax(v34, v40);

  }
  v44 = v13;
  v45 = v15;
  result.height = v45;
  result.width = v44;
  return result;
}

- (BOOL)hasBackground
{
  return 0;
}

- (CKBalloonDescriptor_t)balloonDescriptor
{
  CKBalloonDescriptor_t *result;
  objc_super v6;

  *(_OWORD *)&retstr->var6.alpha = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var5 = 0u;
  *(_OWORD *)&retstr->var6.green = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  v6.receiver = self;
  v6.super_class = (Class)CKTextReplyPreviewBalloonView;
  -[CKBalloonDescriptor_t balloonDescriptor](&v6, sel_balloonDescriptor);
  result = (CKBalloonDescriptor_t *)-[CKTextReplyPreviewBalloonView shouldUseFilledBalloonStyle](self, "shouldUseFilledBalloonStyle");
  if ((_DWORD)result)
  {
    retstr->var2 = 0;
    retstr->var5 = 4;
  }
  return result;
}

- (void)addFilter:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[CKTextReplyPreviewBalloonView setShouldUseFilledBalloonStyle:](self, "setShouldUseFilledBalloonStyle:", 1);
  -[CKTextBalloonView prepareForDisplay](self, "prepareForDisplay");
  v5.receiver = self;
  v5.super_class = (Class)CKTextReplyPreviewBalloonView;
  -[CKTextBalloonView addFilter:](&v5, sel_addFilter_, v4);

}

- (void)clearFilters
{
  objc_super v3;

  -[CKTextReplyPreviewBalloonView setShouldUseFilledBalloonStyle:](self, "setShouldUseFilledBalloonStyle:", 0);
  -[CKTextBalloonView prepareForDisplay](self, "prepareForDisplay");
  v3.receiver = self;
  v3.super_class = (Class)CKTextReplyPreviewBalloonView;
  -[CKTextBalloonView clearFilters](&v3, sel_clearFilters);
}

- (BOOL)isFromMe
{
  return self->_isFromMe;
}

- (void)setIsFromMe:(BOOL)a3
{
  self->_isFromMe = a3;
}

- (BOOL)shouldUseFilledBalloonStyle
{
  return self->_shouldUseFilledBalloonStyle;
}

- (void)setShouldUseFilledBalloonStyle:(BOOL)a3
{
  self->_shouldUseFilledBalloonStyle = a3;
}

@end
