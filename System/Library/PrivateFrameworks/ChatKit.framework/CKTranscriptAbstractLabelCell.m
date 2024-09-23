@implementation CKTranscriptAbstractLabelCell

- (CKTranscriptAbstractLabelCell)initWithFrame:(CGRect)a3
{
  CKTranscriptAbstractLabelCell *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKTranscriptAbstractLabelCell;
  v3 = -[CKTranscriptCell initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transcriptTextVibrancyEffect");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKEditableCollectionViewCell setEffect:](v3, "setEffect:", v5);

  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[CKTranscriptAbstractLabelCell cellView](self, "cellView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeThatFits:", width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)layoutSubviewsForContents
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
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
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  objc_super v43;

  v43.receiver = self;
  v43.super_class = (Class)CKTranscriptAbstractLabelCell;
  -[CKEditableCollectionViewCell layoutSubviewsForContents](&v43, sel_layoutSubviewsForContents);
  -[CKTranscriptAbstractLabelCell contentAlignmentRect](self, "contentAlignmentRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (-[CKTranscriptAbstractLabelCell wantsContactImageLayout](self, "wantsContactImageLayout"))
  {
    if (!-[CKEditableCollectionViewCell orientation](self, "orientation"))
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "transcriptContactImageDiameter");
      v13 = v12;
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "contactPhotoBalloonMargin");
      v42 = v13 + v15;

      -[CKEditableCollectionViewCell marginInsets](self, "marginInsets");
      v39 = v17;
      v40 = v16;
      v41 = v18;
      v38 = v19;
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "balloonTranscriptInsets");
      v22 = v21;
      v24 = v23;
      v36 = v25;
      v37 = v26;

      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "contactPhotoTranscriptInsets");
      v29 = v28;
      v31 = v30;
      v34 = v33;
      v35 = v32;

      -[CKEditableCollectionViewCell setContentAlignmentRect:](self, "setContentAlignmentRect:", v24 + v42 + v4 - (v39 + v24) + v39 + v31, v22 + v6 - (v40 + v22) + v40 + v29 + 0.0, v8 + v39 + v24 + v38 + v37 - (v39 + v31 + v38 + v34) - (v42 + 0.0) - (v24 + v37), v10 + v40 + v22 + v41 + v36 - (v40 + v29 + v41 + v35) - (v22 + v36));
    }
  }
}

- (void)layoutSubviewsForAlignmentContents
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  char isKindOfClass;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double Width;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  objc_super v41;
  CGRect v42;
  CGRect v43;

  v41.receiver = self;
  v41.super_class = (Class)CKTranscriptAbstractLabelCell;
  -[CKEditableCollectionViewCell layoutSubviewsForAlignmentContents](&v41, sel_layoutSubviewsForAlignmentContents);
  -[CKTranscriptAbstractLabelCell contentAlignmentRect](self, "contentAlignmentRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CKTranscriptAbstractLabelCell cellView](self, "cellView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sizeThatFits:", v8, 1.79769313e308);
  v13 = v12;
  v15 = v14;

  v16 = floor((v10 - v15) * 0.5);
  v17 = *(double *)(MEMORY[0x1E0CEA080] + 8);
  v18 = *(double *)(MEMORY[0x1E0CEA080] + 24);
  -[CKTranscriptAbstractLabelCell cellView](self, "cellView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[CKTranscriptAbstractLabelCell cellView](self, "cellView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "configuration");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "background");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "cornerRadius");
    v25 = v24;

    if (v25 > 0.0)
    {
      objc_msgSend(v21, "configuration");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "contentInsets");
      v17 = v27;
      v18 = v28;

    }
  }
  v29 = v6 + v16;
  if (-[CKEditableCollectionViewCell orientation](self, "orientation") == 2)
  {
    -[CKTranscriptAbstractLabelCell bounds](self, "bounds");
    Width = CGRectGetWidth(v42);
    -[CKEditableCollectionViewCell marginInsets](self, "marginInsets");
    v32 = Width - v31;
    v43.origin.x = v4;
    v43.origin.y = v29;
    v43.size.width = v13;
    v43.size.height = v15;
    v33 = v32 - CGRectGetWidth(v43);
    -[CKTranscriptAbstractLabelCell safeAreaInsets](self, "safeAreaInsets");
    v35 = v18 + v33 - v34;
  }
  else if (-[CKTranscriptAbstractLabelCell wantsContactImageLayout](self, "wantsContactImageLayout"))
  {
    v35 = v4 - v17;
  }
  else
  {
    -[CKEditableCollectionViewCell marginInsets](self, "marginInsets");
    v37 = v36;
    -[CKTranscriptAbstractLabelCell safeAreaInsets](self, "safeAreaInsets");
    v35 = v37 + v38 - v17;
  }
  -[CKTranscriptAbstractLabelCell cellView](self, "cellView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (CKMainScreenScale_once_85 != -1)
    dispatch_once(&CKMainScreenScale_once_85, &__block_literal_global_208);
  if (*(double *)&CKMainScreenScale_sMainScreenScale_85 == 0.0)
    v40 = 1.0;
  else
    v40 = *(double *)&CKMainScreenScale_sMainScreenScale_85;
  objc_msgSend(v39, "setFrame:", round(v35 * v40) / v40, round(v29 * v40) / v40, round(v13 * v40) / v40, round(v15 * v40) / v40);

}

- (CGRect)contentAlignmentRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  objc_super v20;
  CGRect result;

  v20.receiver = self;
  v20.super_class = (Class)CKTranscriptAbstractLabelCell;
  -[CKEditableCollectionViewCell contentAlignmentRect](&v20, sel_contentAlignmentRect);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (-[CKTranscriptAbstractLabelCell wantsOffsetForReplyLine](self, "wantsOffsetForReplyLine")
    && !-[CKEditableCollectionViewCell orientation](self, "orientation"))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "replyLineWidth");
    v13 = v12;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "replyLineViewHorizontalPadding");
    v4 = v4 + v13 + v15;

  }
  v16 = v4;
  v17 = v6;
  v18 = v8;
  v19 = v10;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)addFilter:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKTranscriptAbstractLabelCell;
  v4 = a3;
  -[CKEditableCollectionViewCell addFilter:](&v8, sel_addFilter_, v4);
  -[CKTranscriptAbstractLabelCell label](self, "label", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentAlpha");
  v7 = v6;

  objc_msgSend(v5, "setAlpha:", v7);
}

- (void)clearFilters
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKTranscriptAbstractLabelCell;
  -[CKEditableCollectionViewCell clearFilters](&v4, sel_clearFilters);
  -[CKTranscriptAbstractLabelCell label](self, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 1.0);

}

- (void)setWantsContactImageLayout:(BOOL)a3
{
  if (self->_wantsContactImageLayout != a3)
  {
    self->_wantsContactImageLayout = a3;
    -[CKTranscriptAbstractLabelCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setWantsOffsetForReplyLine:(BOOL)a3
{
  if (self->_wantsOffsetForReplyLine != a3)
  {
    self->_wantsOffsetForReplyLine = a3;
    -[CKTranscriptAbstractLabelCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKTranscriptAbstractLabelCell;
  -[CKTranscriptCell prepareForReuse](&v3, sel_prepareForReuse);
  -[CKTranscriptAbstractLabelCell setWantsOffsetForReplyLine:](self, "setWantsOffsetForReplyLine:", 0);
}

+ (CGSize)sizeThatFits:(CGSize)a3 attributedText:(id)a4 displayScale:(double)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C99DA0];
  v8 = *MEMORY[0x1E0C99768];
  v9 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ is not implemented"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v11, 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v12);
}

- (void)setAttributedText:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ is not implemented"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (NSAttributedString)attributedText
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is not implemented"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (id)cellView
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is not implemented"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (id)label
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is not implemented"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (BOOL)wantsContactImageLayout
{
  return self->_wantsContactImageLayout;
}

- (BOOL)wantsOffsetForReplyLine
{
  return self->_wantsOffsetForReplyLine;
}

@end
