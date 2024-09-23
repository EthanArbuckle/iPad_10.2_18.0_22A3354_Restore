@implementation CNFRegLoadingView

- (CNFRegLoadingView)initWithFrame:(CGRect)a3
{
  CNFRegLoadingView *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  UILabel *label;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  UIActivityIndicatorView *spinner;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CNFRegLoadingView;
  v3 = -[CNFRegLoadingView initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "colorWithAlphaComponent:", 0.600000024);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegLoadingView setBackgroundColor:](v3, "setBackgroundColor:", v5);

    v6 = objc_alloc(MEMORY[0x24BEBD708]);
    v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    label = v3->_label;
    v3->_label = (UILabel *)v7;

    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 17.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_label, "setFont:", v9);

    CommunicationsSetupUIBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    CNFRegStringTableName();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("LOADING"), &stru_24D077260, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v3->_label, "setText:", v12);

    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_label, "setTextColor:", v13);

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v3->_label, "setBackgroundColor:", v14);

    -[CNFRegLoadingView addSubview:](v3, "addSubview:", v3->_label);
    v15 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 1);
    spinner = v3->_spinner;
    v3->_spinner = (UIActivityIndicatorView *)v15;

    -[UIActivityIndicatorView startAnimating](v3->_spinner, "startAnimating");
    -[CNFRegLoadingView addSubview:](v3, "addSubview:", v3->_spinner);
  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double width;
  double height;
  double v18;
  double v19;
  double v20;
  double MidX;
  double MidY;
  CGFloat v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat y;
  CGFloat x;
  double v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  -[CNFRegLoadingView bounds](self, "bounds");
  v34 = v4;
  v35 = v3;
  v33 = v5;
  v7 = v6;
  -[UILabel sizeToFit](self->_label, "sizeToFit");
  -[UILabel bounds](self->_label, "bounds");
  v9 = v8;
  v31 = v10;
  v32 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v30 = v14;
  -[UIActivityIndicatorView sizeToFit](self->_spinner, "sizeToFit");
  -[UIActivityIndicatorView bounds](self->_spinner, "bounds");
  y = v36.origin.y;
  x = v36.origin.x;
  width = v36.size.width;
  height = v36.size.height;
  v18 = CGRectGetHeight(v36);
  v37.origin.x = v9;
  v37.origin.y = v11;
  v37.size.width = v13;
  v37.size.height = v15;
  v19 = CGRectGetHeight(v37);
  if (v19 <= 0.0)
    v20 = v18;
  else
    v20 = v18 + v19 + 5.0;
  v27 = v20;
  v38.origin.x = v35;
  v38.origin.y = v34;
  v38.size.width = v33;
  v38.size.height = v7;
  MidX = CGRectGetMidX(v38);
  v39.origin.x = v35;
  v39.origin.y = v34;
  v39.size.width = v33;
  v39.size.height = v7;
  MidY = CGRectGetMidY(v39);
  v40.origin.y = y;
  v40.origin.x = x;
  v40.size.width = width;
  v40.size.height = height;
  v23 = MidX - CGRectGetWidth(v40) * 0.5;
  v24 = MidY - v27 * 0.5;
  v41.origin.y = v31;
  v41.origin.x = v32;
  v41.size.width = v13;
  v41.size.height = v30;
  v25 = MidX - CGRectGetWidth(v41) * 0.5;
  v42.origin.x = v23;
  v42.origin.y = v24;
  v42.size.width = width;
  v42.size.height = height;
  v26 = CGRectGetMaxY(v42) + 5.0;
  -[UIActivityIndicatorView setFrame:](self->_spinner, "setFrame:", v23, v24, width, height);
  -[UILabel setFrame:](self->_label, "setFrame:", v25, v26, v13, v30);
}

- (NSString)message
{
  return -[UILabel text](self->_label, "text");
}

- (void)setMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;

  v4 = a3;
  v9 = v4;
  if (!v4)
  {
    CommunicationsSetupUIBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    CNFRegStringTableName();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("LOADING"), &stru_24D077260, v6);
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[UILabel text](self->_label, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "isEqualToString:", v7);

  if ((v8 & 1) == 0)
  {
    -[UILabel setText:](self->_label, "setText:", v4);
    -[CNFRegLoadingView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
