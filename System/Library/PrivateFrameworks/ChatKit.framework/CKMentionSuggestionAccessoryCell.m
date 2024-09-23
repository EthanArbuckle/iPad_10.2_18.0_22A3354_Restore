@implementation CKMentionSuggestionAccessoryCell

+ (id)supplementryViewKind
{
  return CFSTR("CKMentionsSuggestionAccessoryCellKind");
}

+ (id)reuseIdentifier
{
  return CFSTR("CKMentionsSuggestionAccessoryReuseIdentifier");
}

- (CKMentionSuggestionAccessoryCell)initWithFrame:(CGRect)a3
{
  CKMentionSuggestionAccessoryCell *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CKMentionSuggestionAccessoryCell;
  v3 = -[CKMentionSuggestionAccessoryCell initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc(MEMORY[0x1E0CEABE8]);
    objc_msgSend(MEMORY[0x1E0CEABA8], "effectForBlurEffect:style:", v4, 7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithEffect:", v6);

    objc_msgSend(v7, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "theme");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "paddleSeparatorColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v11);

    -[CKMentionSuggestionAccessoryCell addSubview:](v3, "addSubview:", v7);
    -[CKMentionSuggestionAccessoryCell setSeparatorView:](v3, "setSeparatorView:", v7);

  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  double v12;
  CGFloat v13;
  double x;
  double y;
  double width;
  double height;
  void *v18;
  objc_super v19;
  CGRect v20;
  CGRect v21;

  v19.receiver = self;
  v19.super_class = (Class)CKMentionSuggestionAccessoryCell;
  -[CKMentionSuggestionAccessoryCell layoutSubviews](&v19, sel_layoutSubviews);
  -[CKMentionSuggestionAccessoryCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "paddleDividerInset");
  v13 = v12;
  v20.origin.x = v4;
  v20.origin.y = v6;
  v20.size.width = v8;
  v20.size.height = v10;
  v21 = CGRectInset(v20, 0.0, v13);
  x = v21.origin.x;
  y = v21.origin.y;
  width = v21.size.width;
  height = v21.size.height;

  -[CKMentionSuggestionAccessoryCell separatorView](self, "separatorView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFrame:", x, y, width, height);

}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
  objc_storeStrong((id *)&self->_separatorView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorView, 0);
}

@end
