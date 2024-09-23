@implementation SUUIOnboardingInstructionsView

- (SUUIOnboardingInstructionsView)initWithFrame:(CGRect)a3
{
  SUUIOnboardingInstructionsView *v3;
  SUUIOnboardingInstructionsView *v4;
  uint64_t v5;
  UILabel *explanationLabel;
  uint64_t v7;
  UILabel *titleLabel;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SUUIOnboardingInstructionsView;
  v3 = -[SUUIOnboardingInstructionsView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = -[SUUIOnboardingInstructionsView _newExplanationLabel](v3, "_newExplanationLabel");
    explanationLabel = v4->_explanationLabel;
    v4->_explanationLabel = (UILabel *)v5;

    -[SUUIOnboardingInstructionsView addSubview:](v4, "addSubview:", v4->_explanationLabel);
    v7 = -[SUUIOnboardingInstructionsView _newTitleLabel](v4, "_newTitleLabel");
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = (UILabel *)v7;

    -[SUUIOnboardingInstructionsView addSubview:](v4, "addSubview:", v4->_titleLabel);
  }
  return v4;
}

+ (id)explanationAttributedStringWithString:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x24BDBCED8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 13.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, *MEMORY[0x24BEBB360]);

  objc_msgSend(MEMORY[0x24BEBD4B8], "grayColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v7, *MEMORY[0x24BEBB368]);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:attributes:", v4, v5);
  return v8;
}

+ (id)titleAttributedStringWithString:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x24BDBCED8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(MEMORY[0x24BEBB520], "_ultraLightSystemFontOfSize:", 28.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, *MEMORY[0x24BEBB360]);

  objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v7, *MEMORY[0x24BEBB368]);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:attributes:", v4, v5);
  return v8;
}

- (void)popLabelState
{
  UILabel *v3;
  UILabel *titleLabel;
  UILabel *v5;
  void *v6;
  UILabel *v7;
  UILabel *explanationLabel;
  UILabel *v9;
  void *v10;

  if ((unint64_t)-[NSMutableArray count](self->_labelsStack, "count") >= 2)
  {
    -[UILabel removeFromSuperview](self->_explanationLabel, "removeFromSuperview");
    -[UILabel removeFromSuperview](self->_titleLabel, "removeFromSuperview");
    -[NSMutableArray lastObject](self->_labelsStack, "lastObject");
    v3 = (UILabel *)objc_claimAutoreleasedReturnValue();
    titleLabel = self->_titleLabel;
    self->_titleLabel = v3;

    v5 = self->_titleLabel;
    -[SUUIOnboardingInstructionsView backgroundColor](self, "backgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v5, "setBackgroundColor:", v6);

    -[NSMutableArray removeLastObject](self->_labelsStack, "removeLastObject");
    -[SUUIOnboardingInstructionsView addSubview:](self, "addSubview:", self->_titleLabel);
    -[NSMutableArray lastObject](self->_labelsStack, "lastObject");
    v7 = (UILabel *)objc_claimAutoreleasedReturnValue();
    explanationLabel = self->_explanationLabel;
    self->_explanationLabel = v7;

    v9 = self->_explanationLabel;
    -[SUUIOnboardingInstructionsView backgroundColor](self, "backgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v9, "setBackgroundColor:", v10);

    -[NSMutableArray removeLastObject](self->_labelsStack, "removeLastObject");
    -[SUUIOnboardingInstructionsView addSubview:](self, "addSubview:", self->_explanationLabel);
    -[SUUIOnboardingInstructionsView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)pushLabelState
{
  NSMutableArray *labelsStack;
  NSMutableArray *v4;
  NSMutableArray *v5;
  UILabel *v6;
  UILabel *explanationLabel;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  UILabel *titleLabel;
  UILabel *v12;
  void *v13;

  labelsStack = self->_labelsStack;
  if (!labelsStack)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v5 = self->_labelsStack;
    self->_labelsStack = v4;

    labelsStack = self->_labelsStack;
  }
  -[NSMutableArray addObject:](labelsStack, "addObject:", self->_explanationLabel);
  -[NSMutableArray addObject:](self->_labelsStack, "addObject:", self->_titleLabel);
  -[UILabel removeFromSuperview](self->_explanationLabel, "removeFromSuperview");
  -[UILabel removeFromSuperview](self->_titleLabel, "removeFromSuperview");
  v6 = -[SUUIOnboardingInstructionsView _newExplanationLabel](self, "_newExplanationLabel");
  explanationLabel = self->_explanationLabel;
  self->_explanationLabel = v6;

  v8 = self->_explanationLabel;
  -[SUUIOnboardingInstructionsView backgroundColor](self, "backgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setBackgroundColor:](v8, "setBackgroundColor:", v9);

  -[SUUIOnboardingInstructionsView addSubview:](self, "addSubview:", self->_explanationLabel);
  v10 = -[SUUIOnboardingInstructionsView _newTitleLabel](self, "_newTitleLabel");
  titleLabel = self->_titleLabel;
  self->_titleLabel = v10;

  v12 = self->_titleLabel;
  -[SUUIOnboardingInstructionsView backgroundColor](self, "backgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setBackgroundColor:](v12, "setBackgroundColor:", v13);

  -[SUUIOnboardingInstructionsView addSubview:](self, "addSubview:", self->_titleLabel);
  -[SUUIOnboardingInstructionsView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (a3.left != self->_contentInset.left
    || a3.top != self->_contentInset.top
    || a3.right != self->_contentInset.right
    || a3.bottom != self->_contentInset.bottom)
  {
    self->_contentInset = a3;
    -[SUUIOnboardingInstructionsView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setContentPosition:(int64_t)a3
{
  -[SUUIOnboardingInstructionsView setContentPosition:animated:completionBlock:](self, "setContentPosition:animated:completionBlock:", a3, 0, 0);
}

- (void)setContentPosition:(int64_t)a3 animated:(BOOL)a4 completionBlock:(id)a5
{
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[9];
  _QWORD v47[9];

  v8 = a5;
  v9 = v8;
  if (self->_contentPosition == a3)
  {
    if (v8)
      (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);
  }
  else
  {
    self->_contentPosition = a3;
    if (a4)
    {
      -[UILabel frame](self->_explanationLabel, "frame");
      v38 = v11;
      v39 = v10;
      v36 = v13;
      v37 = v12;
      -[UILabel frame](self->_titleLabel, "frame");
      v15 = v14;
      v17 = v16;
      v19 = v18;
      v21 = v20;
      -[SUUIOnboardingInstructionsView layoutSubviews](self, "layoutSubviews");
      -[UILabel frame](self->_explanationLabel, "frame");
      v42 = v23;
      v43 = v22;
      v40 = v25;
      v41 = v24;
      -[UILabel frame](self->_titleLabel, "frame");
      v27 = v26;
      v29 = v28;
      v31 = v30;
      v33 = v32;
      -[UILabel setFrame:](self->_explanationLabel, "setFrame:", v39, v38, v37, v36);
      -[UILabel setFrame:](self->_titleLabel, "setFrame:", v15, v17, v19, v21);
      v34 = MEMORY[0x24BDAC760];
      v47[0] = MEMORY[0x24BDAC760];
      v47[1] = 3221225472;
      v47[2] = __78__SUUIOnboardingInstructionsView_setContentPosition_animated_completionBlock___block_invoke;
      v47[3] = &unk_2511F4980;
      v47[4] = self;
      v47[5] = v27;
      v47[6] = v29;
      v47[7] = v31;
      v47[8] = v33;
      objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:delay:options:animations:completion:", 0, v47, 0, 1.0, 0.0);
      v35 = (void *)MEMORY[0x24BEBDB00];
      v46[0] = v34;
      v46[1] = 3221225472;
      v46[2] = __78__SUUIOnboardingInstructionsView_setContentPosition_animated_completionBlock___block_invoke_2;
      v46[3] = &unk_2511F4980;
      v46[4] = self;
      v46[5] = v43;
      v46[6] = v42;
      v46[7] = v41;
      v46[8] = v40;
      v44[0] = v34;
      v44[1] = 3221225472;
      v44[2] = __78__SUUIOnboardingInstructionsView_setContentPosition_animated_completionBlock___block_invoke_3;
      v44[3] = &unk_2511F49A8;
      v45 = v9;
      objc_msgSend(v35, "animateWithDuration:delay:options:animations:completion:", 0, v46, v44, 1.05, 0.05);

    }
    else
    {
      if (v8)
        (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);
      -[SUUIOnboardingInstructionsView setNeedsLayout](self, "setNeedsLayout");
    }
  }

}

uint64_t __78__SUUIOnboardingInstructionsView_setContentPosition_animated_completionBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __78__SUUIOnboardingInstructionsView_setContentPosition_animated_completionBlock___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __78__SUUIOnboardingInstructionsView_setContentPosition_animated_completionBlock___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)layoutSubviews
{
  double v3;
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
  double top;
  float v15;
  double v16;
  CGFloat left;
  float v18;
  float v19;
  CGFloat v20;
  float v21;
  double v22;
  CGFloat v23;
  CGRect v24;

  -[SUUIOnboardingInstructionsView bounds](self, "bounds");
  v4 = v3;
  v6 = v5 - self->_contentInset.left - self->_contentInset.right;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v6, 1.79769313e308);
  v8 = v7;
  v10 = v9;
  -[UILabel sizeThatFits:](self->_explanationLabel, "sizeThatFits:", v6, 1.79769313e308);
  v13 = v12;
  top = self->_contentInset.top;
  if (!self->_contentPosition)
  {
    v15 = top + (v4 - top - self->_contentInset.bottom - v10 - v12 + -10.0) * 0.5;
    top = floorf(v15);
  }
  if (v11 >= v6)
    v16 = v6;
  else
    v16 = v11;
  if (v8 >= v6)
    v8 = v6;
  left = self->_contentInset.left;
  v18 = (v6 - v8) * 0.5;
  v19 = left + floorf(v18);
  v20 = floorf(v19);
  v21 = (v6 - v16) * 0.5;
  *(float *)&left = left + floorf(v21);
  v22 = floorf(*(float *)&left);
  v24.origin.x = v20;
  v24.origin.y = top;
  v24.size.width = v8;
  v24.size.height = v10;
  v23 = CGRectGetMaxY(v24) + 10.0;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v20, top, v8, v10);
  -[UILabel setFrame:](self->_explanationLabel, "setFrame:", v22, v23, v16, v13);
}

- (void)setBackgroundColor:(id)a3
{
  UILabel *explanationLabel;
  id v5;
  objc_super v6;

  explanationLabel = self->_explanationLabel;
  v5 = a3;
  -[UILabel setBackgroundColor:](explanationLabel, "setBackgroundColor:", v5);
  -[UILabel setBackgroundColor:](self->_titleLabel, "setBackgroundColor:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SUUIOnboardingInstructionsView;
  -[SUUIOnboardingInstructionsView setBackgroundColor:](&v6, sel_setBackgroundColor_, v5);

}

- (id)_newExplanationLabel
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x24BEBD708]);
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v3);

  objc_msgSend(v2, "setNumberOfLines:", 0);
  objc_msgSend(v2, "setTextAlignment:", 1);
  return v2;
}

- (id)_newTitleLabel
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x24BEBD708]);
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v3);

  objc_msgSend(v2, "setNumberOfLines:", 0);
  objc_msgSend(v2, "setTextAlignment:", 1);
  return v2;
}

- (UIEdgeInsets)contentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInset.top;
  left = self->_contentInset.left;
  bottom = self->_contentInset.bottom;
  right = self->_contentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (int64_t)contentPosition
{
  return self->_contentPosition;
}

- (UILabel)explanationLabel
{
  return self->_explanationLabel;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_labelsStack, 0);
  objc_storeStrong((id *)&self->_explanationLabel, 0);
}

@end
