@implementation SUUICommentPostBarView

- (SUUICommentPostBarView)initWithFrame:(CGRect)a3
{
  SUUICommentPostBarView *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  SUUICommentPostBarTextField *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  SUUICommentPostBarTextField *postTextField;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  UIButton *postButton;
  void *v24;
  void *v25;
  UIButton *v26;
  void *v27;
  UIButton *v28;
  void *v29;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)SUUICommentPostBarView;
  v3 = -[SUUICommentPostBarView initWithFrame:](&v31, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.97254902, 1.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUICommentPostBarView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.835294118, 0.839215686, 0.850980392, 1.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scale");
    v8 = 1.0 / v7;

    -[SUUICommentPostBarView bounds](v3, "bounds");
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", 0.0, 0.0, v9, v8);
    objc_msgSend(v10, "setAutoresizingMask:", 2);
    objc_msgSend(v10, "setBackgroundColor:", v5);
    -[SUUICommentPostBarView addSubview:](v3, "addSubview:", v10);
    v11 = [SUUICommentPostBarTextField alloc];
    v12 = *MEMORY[0x24BDBF090];
    v13 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v14 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v15 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v16 = -[SUUICommentPostBarTextField initWithFrame:](v11, "initWithFrame:", *MEMORY[0x24BDBF090], v13, v14, v15);
    postTextField = v3->_postTextField;
    v3->_postTextField = (SUUICommentPostBarTextField *)v16;

    -[SUUICommentPostBarTextField setDelegate:](v3->_postTextField, "setDelegate:", v3);
    -[SUUICommentPostBarTextField layer](v3->_postTextField, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setBorderWidth:", 1.0);

    -[SUUICommentPostBarTextField layer](v3->_postTextField, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setCornerRadius:", 5.0);

    -[SUUICommentPostBarTextField layer](v3->_postTextField, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_retainAutorelease(v5);
    objc_msgSend(v20, "setBorderColor:", objc_msgSend(v21, "CGColor"));

    -[SUUICommentPostBarView addSubview:](v3, "addSubview:", v3->_postTextField);
    v22 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD430]), "initWithFrame:", v12, v13, v14, v15);
    postButton = v3->_postButton;
    v3->_postButton = (UIButton *)v22;

    -[UIButton titleLabel](v3->_postButton, "titleLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "boldSystemFontOfSize:", 16.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setFont:", v25);

    v26 = v3->_postButton;
    -[SUUICommentPostBarView tintColor](v3, "tintColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forState:](v26, "setTitleColor:forState:", v27, 0);

    v28 = v3->_postButton;
    objc_msgSend(MEMORY[0x24BEBD4B8], "grayColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forState:](v28, "setTitleColor:forState:", v29, 2);

    -[UIButton addTarget:action:forControlEvents:](v3->_postButton, "addTarget:action:forControlEvents:", v3, sel__post_, 64);
    -[UIButton setEnabled:](v3->_postButton, "setEnabled:", 0);
    -[SUUICommentPostBarView addSubview:](v3, "addSubview:", v3->_postButton);

  }
  return v3;
}

- (void)_post:(id)a3
{
  -[SUUICommentPostBarView _postComment](self, "_postComment", a3);
  -[SUUICommentPostBarView resignFirstResponder](self, "resignFirstResponder");
}

- (void)_changeCommenter:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  v9 = a3;
  -[SUUICommentPostBarView delegate](self, "delegate");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[SUUICommentPostBarView delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "conformsToProtocol:", &unk_2571B6A98);

    if (v7)
    {
      -[SUUICommentPostBarView delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "commentPostBarView:changeCommenter:", self, v9);

    }
  }

}

- (void)setAsText:(id)a3
{
  NSString *v5;
  NSString **p_asText;
  NSString *asText;
  NSString *v8;
  void *v9;
  NSString *v10;

  v5 = (NSString *)a3;
  p_asText = &self->_asText;
  asText = self->_asText;
  v8 = v5;
  v10 = v5;
  if (asText != v5)
  {
    if ((-[NSString isEqual:](asText, "isEqual:", v5) & 1) == 0)
      objc_storeStrong((id *)&self->_asText, a3);
    v8 = *p_asText;
    v5 = v10;
  }
  if (v8)
  {
    -[SUUICommentPostBarView _asLabel](self, "_asLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", *p_asText);

    v5 = v10;
  }

}

- (void)setPlaceholderText:(id)a3
{
  -[SUUICommentPostBarTextField setPlaceholder:](self->_postTextField, "setPlaceholder:", a3);
}

- (void)setPostButtonText:(id)a3
{
  -[UIButton setTitle:forState:](self->_postButton, "setTitle:forState:", a3, 0);
}

- (void)setText:(id)a3
{
  -[SUUICommentPostBarTextField setText:](self->_postTextField, "setText:", a3);
}

- (void)setCommenter:(id)a3
{
  NSString *v5;
  NSString *commenter;
  char v7;
  void *v8;
  NSString *v9;

  v5 = (NSString *)a3;
  commenter = self->_commenter;
  if (commenter != v5)
  {
    v9 = v5;
    v7 = -[NSString isEqual:](commenter, "isEqual:", v5);
    v5 = v9;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_commenter, a3);
      -[SUUICommentPostBarView _asNameButton](self, "_asNameButton");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTitle:forState:", self->_commenter, 0);

      -[SUUICommentPostBarView setNeedsLayout](self, "setNeedsLayout");
      v5 = v9;
    }
  }

}

- (void)setPostButtonVisible:(BOOL)a3
{
  -[UIButton setHidden:](self->_postButton, "setHidden:", !a3);
  -[SUUICommentPostBarView setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  int v11;
  void *v12;
  void *v13;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v10 = a5;
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("\n"));
  if (v11)
  {
    -[SUUICommentPostBarView _postComment](self, "_postComment");
  }
  else
  {
    objc_msgSend(v9, "text");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByReplacingCharactersInRange:withString:", location, length, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIButton setEnabled:](self->_postButton, "setEnabled:", objc_msgSend(v13, "length") != 0);
  }

  return v11 ^ 1;
}

- (BOOL)becomeFirstResponder
{
  return -[SUUICommentPostBarTextField becomeFirstResponder](self->_postTextField, "becomeFirstResponder");
}

- (BOOL)canBecomeFirstResponder
{
  return -[SUUICommentPostBarTextField canBecomeFirstResponder](self->_postTextField, "canBecomeFirstResponder");
}

- (void)layoutSubviews
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double Width;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  float v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
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
  double MinX;
  double v43;
  double v44;
  double v45;
  float v46;
  double v47;
  double v48;
  CGFloat v49;
  UIButton *postButton;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  CGFloat v57;
  double v58;
  CGFloat v59;
  float v60;
  double v61;
  objc_super v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;

  v62.receiver = self;
  v62.super_class = (Class)SUUICommentPostBarView;
  -[SUUICommentPostBarView layoutSubviews](&v62, sel_layoutSubviews);
  if (self->_commenter)
  {
    v3 = objc_msgSend(MEMORY[0x24BEBDB00], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[SUUICommentPostBarView semanticContentAttribute](self, "semanticContentAttribute"));
    -[SUUICommentPostBarView _asLabel](self, "_asLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidden:", 0);

    -[SUUICommentPostBarView _asNameButton](self, "_asNameButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", 0);

    -[SUUICommentPostBarView _asLabel](self, "_asLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    v8 = v7;
    v10 = v9;

    -[SUUICommentPostBarView _asLabel](self, "_asLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUICommentPostBarView bounds](self, "bounds");
    objc_msgSend(v11, "sizeThatFits:", v12, v13);
    v15 = v14;
    v17 = v16;

    if (v3)
    {
      -[SUUICommentPostBarView bounds](self, "bounds");
      Width = CGRectGetWidth(v63);
      v64.origin.x = v8;
      v64.origin.y = v10;
      v64.size.width = v15;
      v64.size.height = v17;
      v19 = Width - CGRectGetWidth(v64) + -16.0;
    }
    else
    {
      v19 = 16.0;
    }
    v24 = (30.0 - v17) * 0.5;
    v25 = ceilf(v24) + 2.0;
    -[SUUICommentPostBarView _asLabel](self, "_asLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setFrame:", v19, v25, v15, v17);

    -[SUUICommentPostBarView _asNameButton](self, "_asNameButton");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "frame");
    v29 = v28;
    v31 = v30;

    if (v3)
    {
      v65.origin.x = v19;
      v65.origin.y = v25;
      v65.size.width = v15;
      v65.size.height = v17;
      v32 = CGRectGetMinX(v65) + -5.0;
    }
    else
    {
      -[SUUICommentPostBarView bounds](self, "bounds");
      v33 = CGRectGetWidth(v66);
      v67.origin.x = v19;
      v67.origin.y = v25;
      v67.size.width = v15;
      v67.size.height = v17;
      v32 = v33 - (CGRectGetMaxX(v67) + 5.0);
    }
    -[UIButton sizeThatFits:](self->_asNameButton, "sizeThatFits:", v32, 30.0);
    v35 = v34;
    v37 = v36;
    v38 = v19;
    v39 = v25;
    v40 = v15;
    v41 = v17;
    if (v3)
    {
      MinX = CGRectGetMinX(*(CGRect *)&v38);
      v68.origin.x = v29;
      v68.origin.y = v31;
      v68.size.width = v35;
      v68.size.height = v37;
      v43 = MinX - CGRectGetWidth(v68);
      v44 = -6.0;
    }
    else
    {
      v43 = CGRectGetMaxX(*(CGRect *)&v38) + 5.0;
      v44 = 1.0;
    }
    v45 = v43 + v44;
    v22 = 30.0;
    v46 = (30.0 - v37) * 0.5;
    v47 = ceilf(v46) + 2.0;
    -[SUUICommentPostBarView _asNameButton](self, "_asNameButton");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setFrame:", v45, v47, v35, v37);
    v23 = 40.0;
  }
  else
  {
    -[SUUICommentPostBarView _asLabel](self, "_asLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setHidden:", 1);

    -[SUUICommentPostBarView _asNameButton](self, "_asNameButton");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setHidden:", 1);
    v22 = 1.0;
    v23 = 45.0;
  }

  v48 = 30.0;
  if ((-[UIButton isHidden](self->_postButton, "isHidden") & 1) == 0)
  {
    v49 = *MEMORY[0x24BDBF090];
    postButton = self->_postButton;
    -[SUUICommentPostBarView bounds](self, "bounds");
    -[UIButton sizeThatFits:](postButton, "sizeThatFits:", v51, v52);
    v54 = v53;
    v56 = v55;
    *(float *)&v53 = (v23 - v55) * 0.5;
    v57 = v22 + floorf(*(float *)&v53);
    -[SUUICommentPostBarView bounds](self, "bounds");
    v58 = CGRectGetWidth(v69);
    v70.origin.x = v49;
    v70.origin.y = v57;
    v70.size.width = v54;
    v70.size.height = v56;
    v59 = v58 - (CGRectGetWidth(v70) + 15.0);
    -[UIButton setFrame:](self->_postButton, "setFrame:", v59, v57, v54, v56);
    v71.origin.x = v59;
    v71.origin.y = v57;
    v71.size.width = v54;
    v71.size.height = v56;
    v48 = CGRectGetWidth(v71) + 15.0 + 30.0;
  }
  v60 = (v23 + -28.0) * 0.5;
  v61 = v22 + floorf(v60);
  -[SUUICommentPostBarView bounds](self, "bounds");
  -[SUUICommentPostBarTextField setFrame:](self->_postTextField, "setFrame:", 15.0, v61, CGRectGetWidth(v72) - v48, 28.0);
}

- (BOOL)resignFirstResponder
{
  SUUICommentPostBarTextField *postTextField;
  objc_super v5;

  postTextField = self->_postTextField;
  if (postTextField)
    -[SUUICommentPostBarTextField resignFirstResponder](postTextField, "resignFirstResponder");
  v5.receiver = self;
  v5.super_class = (Class)SUUICommentPostBarView;
  return -[SUUICommentPostBarView resignFirstResponder](&v5, sel_resignFirstResponder);
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3;

  v3 = dbl_241EFBBA0[self->_commenter == 0];
  result.height = v3;
  return result;
}

- (void)tintColorDidChange
{
  UIButton *asNameButton;
  void *v4;
  UIButton *postButton;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUUICommentPostBarView;
  -[SUUICommentPostBarView tintColorDidChange](&v7, sel_tintColorDidChange);
  asNameButton = self->_asNameButton;
  if (asNameButton)
  {
    -[SUUICommentPostBarView tintColor](self, "tintColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](asNameButton, "setTintColor:", v4);

  }
  postButton = self->_postButton;
  if (postButton)
  {
    -[SUUICommentPostBarView tintColor](self, "tintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forState:](postButton, "setTitleColor:forState:", v6, 0);

  }
}

- (id)_asNameButton
{
  UIButton *asNameButton;
  id v4;
  UIButton *v5;
  UIButton *v6;
  void *v7;
  void *v8;
  UIButton *v9;
  void *v10;

  asNameButton = self->_asNameButton;
  if (!asNameButton)
  {
    v4 = objc_alloc(MEMORY[0x24BEBD430]);
    v5 = (UIButton *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    v6 = self->_asNameButton;
    self->_asNameButton = v5;

    -[UIButton titleLabel](self->_asNameButton, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 15.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFont:", v8);

    v9 = self->_asNameButton;
    -[SUUICommentPostBarView tintColor](self, "tintColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forState:](v9, "setTitleColor:forState:", v10, 0);

    -[UIButton addTarget:action:forControlEvents:](self->_asNameButton, "addTarget:action:forControlEvents:", self, sel__changeCommenter_, 64);
    -[SUUICommentPostBarView addSubview:](self, "addSubview:", self->_asNameButton);
    -[SUUICommentPostBarView setNeedsLayout](self, "setNeedsLayout");
    asNameButton = self->_asNameButton;
  }
  return asNameButton;
}

- (id)_asLabel
{
  UILabel *asLabel;
  id v4;
  UILabel *v5;
  UILabel *v6;
  UILabel *v7;
  void *v8;
  UILabel *v9;
  void *v10;

  asLabel = self->_asLabel;
  if (!asLabel)
  {
    v4 = objc_alloc(MEMORY[0x24BEBD708]);
    v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    v6 = self->_asLabel;
    self->_asLabel = v5;

    v7 = self->_asLabel;
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 15.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v7, "setFont:", v8);

    v9 = self->_asLabel;
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.670588235, 0.670588235, 0.670588235, 1.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v9, "setTextColor:", v10);

    -[SUUICommentPostBarView addSubview:](self, "addSubview:", self->_asLabel);
    asLabel = self->_asLabel;
  }
  return asLabel;
}

- (void)_postComment
{
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  -[SUUICommentPostBarTextField text](self->_postTextField, "text");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    -[SUUICommentPostBarView delegate](self, "delegate");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = (void *)v3;
      -[SUUICommentPostBarView delegate](self, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "conformsToProtocol:", &unk_2571B6A98);

      if (v6)
      {
        -[SUUICommentPostBarView delegate](self, "delegate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "commentPostBarView:text:as:", self, v8, self->_commenter);

      }
    }
  }

}

- (NSString)commenter
{
  return self->_commenter;
}

- (SUUICommentDelegate)delegate
{
  return (SUUICommentDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_asText, 0);
  objc_storeStrong((id *)&self->_asNameButton, 0);
  objc_storeStrong((id *)&self->_asLabel, 0);
  objc_storeStrong((id *)&self->_commenter, 0);
  objc_storeStrong((id *)&self->_postTextField, 0);
  objc_storeStrong((id *)&self->_postButton, 0);
}

@end
