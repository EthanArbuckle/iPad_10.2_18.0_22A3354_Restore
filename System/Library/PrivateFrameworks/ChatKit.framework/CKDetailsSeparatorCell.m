@implementation CKDetailsSeparatorCell

- (CKDetailsSeparatorCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CKDetailsSeparatorCell *v4;
  id v5;
  uint64_t v6;
  UIView *separatorView;
  UIView *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CKDetailsSeparatorCell;
  v4 = -[CKDetailsCell initWithStyle:reuseIdentifier:](&v12, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0CEABB0]);
    v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    separatorView = v4->_separatorView;
    v4->_separatorView = (UIView *)v6;

    v8 = v4->_separatorView;
    objc_msgSend(MEMORY[0x1E0CEA478], "separatorColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v8, "setBackgroundColor:", v9);

    -[CKDetailsSeparatorCell addSubview:](v4, "addSubview:", v4->_separatorView);
    -[CKDetailsSeparatorCell setIndentSeparator:](v4, "setIndentSeparator:", 1);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsSeparatorCell setBackgroundColor:](v4, "setBackgroundColor:", v10);

  }
  return v4;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  int v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CKDetailsSeparatorCell;
  -[CKDetailsCell layoutSubviews](&v16, sel_layoutSubviews);
  -[CKDetailsSeparatorCell layoutMargins](self, "layoutMargins");
  v4 = v3;
  v6 = v5;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "detailsSeperatorsFollowLayoutMargins");

  -[CKDetailsSeparatorCell bounds](self, "bounds");
  v10 = v9;
  LODWORD(v7) = -[CKDetailsSeparatorCell indentSeparator](self, "indentSeparator") | v8;
  -[CKDetailsSeparatorCell leadingSpace](self, "leadingSpace");
  v12 = v11;
  v13 = 0.0;
  if ((_DWORD)v7)
    v13 = v6;
  else
    v4 = 0.0;
  v14 = v10 - v4 - v13;
  -[CKDetailsSeparatorCell separatorView](self, "separatorView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFrame:", v4, v12, v14, 1.0);

}

- (void)prepareForReuse
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CKDetailsSeparatorCell;
  -[CKDetailsCell prepareForReuse](&v2, sel_prepareForReuse);
}

+ (id)reuseIdentifier
{
  return CFSTR("CKDetailsSeparatorCell_reuseIdentifier");
}

+ (double)defaultHeight
{
  return 1.0;
}

+ (double)defaultLeadingSpace
{
  return 0.0;
}

- (double)leadingSpace
{
  return self->_leadingSpace;
}

- (void)setLeadingSpace:(double)a3
{
  self->_leadingSpace = a3;
}

- (BOOL)indentSeparator
{
  return self->_indentSeparator;
}

- (void)setIndentSeparator:(BOOL)a3
{
  self->_indentSeparator = a3;
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorView, 0);
}

@end
