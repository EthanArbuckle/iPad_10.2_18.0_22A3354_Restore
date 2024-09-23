@implementation DSTableView

- (DSTableView)init
{
  DSTableView *v2;
  DSTableView *v3;
  void *v4;
  double v5;
  uint64_t v6;
  NSLayoutConstraint *heightConstraint;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)DSTableView;
  v2 = -[DSTableView initWithFrame:style:](&v10, sel_initWithFrame_style_, 2, 0.0, 0.0, 0.0, 0.0);
  v3 = v2;
  if (v2)
  {
    -[DSTableView heightAnchor](v2, "heightAnchor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSTableView contentSize](v3, "contentSize");
    objc_msgSend(v4, "constraintEqualToConstant:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    heightConstraint = v3->_heightConstraint;
    v3->_heightConstraint = (NSLayoutConstraint *)v6;

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSTableView setBackgroundColor:](v3, "setBackgroundColor:", v8);

    -[DSTableView setAllowsMultipleSelection:](v3, "setAllowsMultipleSelection:", 1);
    -[DSTableView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  }
  return v3;
}

- (void)setContentSize:(CGSize)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DSTableView;
  -[DSTableView setContentSize:](&v4, sel_setContentSize_, a3.width, a3.height);
  -[DSTableView constrainTableView](self, "constrainTableView");
}

- (void)constrainTableView
{
  double v3;
  double v4;
  void *v5;
  id v6;

  -[DSTableView contentSize](self, "contentSize");
  v4 = v3 + 10.0;
  -[DSTableView heightConstraint](self, "heightConstraint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConstant:", v4);

  -[DSTableView heightConstraint](self, "heightConstraint");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActive:", 1);

}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_heightConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightConstraint, 0);
}

@end
