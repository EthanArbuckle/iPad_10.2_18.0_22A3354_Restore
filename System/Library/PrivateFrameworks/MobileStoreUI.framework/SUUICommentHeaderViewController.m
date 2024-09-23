@implementation SUUICommentHeaderViewController

- (SUUICommentHeaderViewController)initWithTitle:(id)a3
{
  id v5;
  SUUICommentHeaderViewController *v6;
  SUUICommentHeaderViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUICommentHeaderViewController;
  v6 = -[SUUICommentHeaderViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_title, a3);

  return v7;
}

- (void)viewDidLoad
{
  id v3;
  UILabel *v4;
  UILabel *titleLabel;
  UILabel *v6;
  void *v7;
  UILabel *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SUUICommentHeaderViewController;
  -[SUUICommentHeaderViewController viewDidLoad](&v11, sel_viewDidLoad);
  v3 = objc_alloc(MEMORY[0x24BEBD708]);
  v4 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  titleLabel = self->_titleLabel;
  self->_titleLabel = v4;

  -[UILabel setText:](self->_titleLabel, "setText:", self->_title);
  v6 = self->_titleLabel;
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v6, "setTextColor:", v7);

  v8 = self->_titleLabel;
  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 18.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v8, "setFont:", v9);

  -[SUUICommentHeaderViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", self->_titleLabel);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;
  CGRect v16;

  v15.receiver = self;
  v15.super_class = (Class)SUUICommentHeaderViewController;
  -[SUUICommentHeaderViewController viewWillLayoutSubviews](&v15, sel_viewWillLayoutSubviews);
  -[SUUICommentHeaderViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[UILabel frame](self->_titleLabel, "frame");
  v16.origin.x = v5;
  v16.origin.y = v7;
  v16.size.width = v9;
  v16.size.height = v11;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", CGRectGetWidth(v16) + -10.0 + -10.0, v11);
  v13 = v12;
  *(float *)&v12 = (v11 - v14) * 0.5;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", 10.0, floorf(*(float *)&v12), v13, v14);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
