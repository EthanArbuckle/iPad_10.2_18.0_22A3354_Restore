@implementation AAUIHeaderView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (AAUIHeaderView)initWithFrame:(CGRect)a3
{
  AAUIHeaderView *v3;
  AAUIHeaderView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AAUIHeaderView;
  v3 = -[AAUIBuddyView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    _AAUIHeaderViewCommonInit(v3);
  return v4;
}

- (AAUIHeaderView)initWithCoder:(id)a3
{
  AAUIHeaderView *v3;
  AAUIHeaderView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AAUIHeaderView;
  v3 = -[AAUIBuddyView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    _AAUIHeaderViewCommonInit(v3);
  return v4;
}

- (void)setHeaderImage:(id)a3
{
  -[UIImageView setImage:](self->_headerImageView, "setImage:");
  -[UIImageView setHidden:](self->_headerImageView, "setHidden:", a3 == 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AAUIHeaderView;
  -[AAUIHeaderView traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[AAUIHeaderView _updateStackViewSpacing](self, "_updateStackViewSpacing");
  -[AAUIHeaderView _updateLabelFonts](self, "_updateLabelFonts");
}

- (void)_updateStackViewSpacing
{
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;

  -[AAUIHeaderView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "horizontalSizeClass") != 2)
  {

    goto LABEL_5;
  }
  -[AAUIHeaderView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "verticalSizeClass");

  if (v5 != 2)
  {
LABEL_5:
    v6 = 36.0;
    goto LABEL_6;
  }
  v6 = 44.0;
LABEL_6:
  -[UIStackView setSpacing:](self->_stackView, "setSpacing:", v6);
}

- (void)_updateLabelFonts
{
  UILabel *titleLabel;
  void *v4;
  void *v5;
  void *v6;
  UILabel *messageLabel;
  void *v8;
  void *v9;
  id v10;

  titleLabel = self->_titleLabel;
  v4 = (void *)MEMORY[0x1E0DC1350];
  -[AAUIHeaderView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aa_titleFontForTraitCollection:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](titleLabel, "setFont:", v6);

  messageLabel = self->_messageLabel;
  v8 = (void *)MEMORY[0x1E0DC1350];
  -[AAUIHeaderView traitCollection](self, "traitCollection");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "aa_messageFontForTraitCollection:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](messageLabel, "setFont:", v9);

}

- (id)viewForFirstBaselineLayout
{
  return self->_titleLabel;
}

- (id)viewForLastBaselineLayout
{
  return self->_messageLabel;
}

- (UIImageView)headerImageView
{
  return self->_headerImageView;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_headerImageView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

@end
