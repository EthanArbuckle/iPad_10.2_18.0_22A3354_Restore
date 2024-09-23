@implementation _SFMultipleLineAlertActionViewController

- (_SFMultipleLineAlertActionViewController)initWithTitle:(id)a3 detail:(id)a4 style:(int64_t)a5
{
  id v8;
  id v9;
  _SFMultipleLineAlertActionViewController *v10;
  uint64_t v11;
  NSString *title;
  uint64_t v13;
  NSString *detail;
  _SFMultipleLineAlertActionViewController *v15;

  v8 = a3;
  v9 = a4;
  v10 = -[_SFMultipleLineAlertActionViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    title = v10->_title;
    v10->_title = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    detail = v10->_detail;
    v10->_detail = (NSString *)v13;

    v10->_style = a5;
    v15 = v10;
  }

  return v10;
}

- (void)loadView
{
  void *v3;
  NSString *title;
  void *v5;
  NSString *detail;
  void *v7;
  _SFMultipleLineAlertActionView *v8;

  v8 = objc_alloc_init(_SFMultipleLineAlertActionView);
  if (self->_style == 2)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFMultipleLineAlertActionView setTintColor:](v8, "setTintColor:", v3);

  }
  title = self->_title;
  -[_SFMultipleLineAlertActionView titleLabel](v8, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", title);

  detail = self->_detail;
  -[_SFMultipleLineAlertActionView detailLabel](v8, "detailLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", detail);

  -[_SFMultipleLineAlertActionViewController setView:](self, "setView:", v8);
}

- (CGSize)preferredContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[_SFMultipleLineAlertActionViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0DC4FF8], *(double *)(MEMORY[0x1E0DC4FF8] + 8));
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detail, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
