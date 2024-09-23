@implementation CKTranscriptCollectionViewCell

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CKTranscriptCollectionViewCell;
  -[CKTranscriptCollectionViewCell layoutSubviews](&v16, sel_layoutSubviews);
  -[CKTranscriptCollectionViewCell debugLabel](self, "debugLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CKTranscriptCollectionViewCell contentView](self, "contentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "systemPinkColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBackgroundColor:", v5);

    -[CKTranscriptCollectionViewCell contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;

    -[CKTranscriptCollectionViewCell debugLabel](self, "debugLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);

  }
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKTranscriptCollectionViewCell;
  -[CKTranscriptCollectionViewCell prepareForReuse](&v4, sel_prepareForReuse);
  -[CKTranscriptCollectionViewCell debugLabel](self, "debugLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", 0);

}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[CKTranscriptCollectionViewCell debugLabel](self, "debugLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%p %@"), v4, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

+ (id)reuseIdentifier
{
  return CFSTR("TC");
}

- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v8 = a3;
  -[CKTranscriptCollectionViewCell debugLabel](self, "debugLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v10 = objc_alloc(MEMORY[0x1E0CEA700]);
    v11 = (void *)objc_msgSend(v10, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(v11, "setAdjustsFontSizeToFitWidth:", 1);
    objc_msgSend(v11, "setNumberOfLines:", 0);
    -[CKTranscriptCollectionViewCell contentView](self, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v11);

    -[CKTranscriptCollectionViewCell setDebugLabel:](self, "setDebugLabel:", v11);
  }
  v13 = (void *)MEMORY[0x1E0CB3940];
  v14 = objc_opt_class();
  objc_msgSend(v8, "IMChatItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "guid");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@-%@"), v14, v16);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  -[CKTranscriptCollectionViewCell debugLabel](self, "debugLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setText:", v18);

}

- (BOOL)isAnimatingInDarkEffect
{
  return self->isAnimatingInDarkEffect;
}

- (void)setIsAnimatingInDarkEffect:(BOOL)a3
{
  self->isAnimatingInDarkEffect = a3;
}

- (CGRect)contentAlignmentRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->contentAlignmentRect.origin.x;
  y = self->contentAlignmentRect.origin.y;
  width = self->contentAlignmentRect.size.width;
  height = self->contentAlignmentRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setContentAlignmentRect:(CGRect)a3
{
  self->contentAlignmentRect = a3;
}

- (UILabel)debugLabel
{
  return self->_debugLabel;
}

- (void)setDebugLabel:(id)a3
{
  objc_storeStrong((id *)&self->_debugLabel, a3);
}

- (BOOL)wantsDrawerLayout
{
  return self->_wantsDrawerLayout;
}

- (void)setWantsDrawerLayout:(BOOL)a3
{
  self->_wantsDrawerLayout = a3;
}

- (char)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(char)a3
{
  self->_orientation = a3;
}

- (double)drawerPercentRevealed
{
  return self->_drawerPercentRevealed;
}

- (void)setDrawerPercentRevealed:(double)a3
{
  self->_drawerPercentRevealed = a3;
}

- (double)associatedItemOffset
{
  return self->_associatedItemOffset;
}

- (void)setAssociatedItemOffset:(double)a3
{
  self->_associatedItemOffset = a3;
}

- (BOOL)isInReplyContext
{
  return self->_isInReplyContext;
}

- (void)setIsInReplyContext:(BOOL)a3
{
  self->_isInReplyContext = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugLabel, 0);
}

@end
