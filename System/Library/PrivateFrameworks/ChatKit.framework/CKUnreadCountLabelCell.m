@implementation CKUnreadCountLabelCell

- (CKUnreadCountLabelCell)initWithFrame:(CGRect)a3
{
  CKUnreadCountLabelCell *v3;
  UIView *v4;
  UIView *leftSeparator;
  UIView *v6;
  UIView *rightSeparator;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _QWORD v23[2];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v22.receiver = self;
  v22.super_class = (Class)CKUnreadCountLabelCell;
  v3 = -[CKTranscriptLabelCell initWithFrame:](&v22, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    leftSeparator = v3->_leftSeparator;
    v3->_leftSeparator = v4;

    v6 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    rightSeparator = v3->_rightSeparator;
    v3->_rightSeparator = v6;

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v23[0] = v3->_leftSeparator;
    v23[1] = v3->_rightSeparator;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          -[CKUnreadCountLabelCell addSubview:](v3, "addSubview:", v13);
          +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "theme");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "transcriptTextColor");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setBackgroundColor:", v16);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      }
      while (v10);
    }

  }
  return v3;
}

- (void)layoutSubviewsForContents
{
  void *v3;
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
  double v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CKUnreadCountLabelCell;
  -[CKTranscriptStampCell layoutSubviewsForContents](&v16, sel_layoutSubviewsForContents);
  -[CKTranscriptLabelCell label](self, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTranscriptStampCell contentAlignmentRect](self, "contentAlignmentRect");
  objc_msgSend(v3, "sizeThatFits:", v4, v5);
  v7 = v6;

  -[CKUnreadCountLabelCell frame](self, "frame");
  v9 = v8;
  -[CKUnreadCountLabelCell frame](self, "frame");
  v11 = v10;
  if (CKPixelWidth_once_19 != -1)
    dispatch_once(&CKPixelWidth_once_19, &__block_literal_global_268);
  v12 = v11 * 0.5;
  v13 = (v9 - v7 + -24.0) * 0.5;
  v14 = *(double *)&CKPixelWidth_sPixel_19;
  -[UIView setFrame:](self->_leftSeparator, "setFrame:", 0.0, v12, v13, *(double *)&CKPixelWidth_sPixel_19);
  -[CKUnreadCountLabelCell frame](self, "frame");
  -[UIView setFrame:](self->_rightSeparator, "setFrame:", v15 - v13, v12, v13, v14);
}

- (UIView)leftSeparator
{
  return self->_leftSeparator;
}

- (void)setLeftSeparator:(id)a3
{
  objc_storeStrong((id *)&self->_leftSeparator, a3);
}

- (UIView)rightSeparator
{
  return self->_rightSeparator;
}

- (void)setRightSeparator:(id)a3
{
  objc_storeStrong((id *)&self->_rightSeparator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightSeparator, 0);
  objc_storeStrong((id *)&self->_leftSeparator, 0);
}

@end
