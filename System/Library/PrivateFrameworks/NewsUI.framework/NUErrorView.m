@implementation NUErrorView

- (NUErrorView)initWithErrorMessage:(id)a3
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  NUErrorView *v10;
  NUErrorView *v11;
  uint64_t v12;
  UILabel *label;
  void *v14;
  void *v15;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)NUErrorView;
  v6 = *MEMORY[0x24BDBF090];
  v7 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v8 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v9 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v10 = -[NUErrorView initWithFrame:](&v17, sel_initWithFrame_, *MEMORY[0x24BDBF090], v7, v8, v9);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_errorMessage, a3);
    v11->_verticalAlignment = 0;
    v11->_textAlignment = 1;
    v12 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v6, v7, v8, v9);
    label = v11->_label;
    v11->_label = (UILabel *)v12;

    objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.490196078, 0.498039216, 0.498039216, 1.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v11->_label, "setTextColor:", v14);

    -[UILabel setNumberOfLines:](v11->_label, "setNumberOfLines:", 0);
    -[UILabel setAutoresizingMask:](v11->_label, "setAutoresizingMask:", 2);
    -[NUErrorView attributedStringForErrorMessage:](v11, "attributedStringForErrorMessage:", v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setAttributedText:](v11->_label, "setAttributedText:", v15);

    -[NUErrorView addSubview:](v11, "addSubview:", v11->_label);
    -[UILabel sizeToFit](v11->_label, "sizeToFit");
  }

  return v11;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  CGFloat v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  unint64_t v24;
  double v25;
  double v26;
  double x;
  double y;
  double width;
  double height;
  void *v31;
  objc_super v32;
  CGRect v33;
  CGRect v34;

  v32.receiver = self;
  v32.super_class = (Class)NUErrorView;
  -[NUErrorView layoutSubviews](&v32, sel_layoutSubviews);
  -[NUErrorView labelMaxWidthTrait](self, "labelMaxWidthTrait");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUErrorView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUErrorView bounds](self, "bounds");
  objc_msgSend(v3, "valueForTraitCollection:size:", v4, v5, v6);
  v8 = v7;
  -[NUErrorView label](self, "label");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPreferredMaxLayoutWidth:", v8);

  -[NUErrorView label](self, "label");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  v12 = v11;

  -[NUErrorView label](self, "label");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "preferredMaxLayoutWidth");
  v15 = v14;

  -[NUErrorView label](self, "label");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "intrinsicContentSize");
  v18 = v17;

  -[NUErrorView bounds](self, "bounds");
  v20 = v19;
  -[NUErrorView label](self, "label");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "preferredMaxLayoutWidth");
  v23 = v22;

  v24 = -[NUErrorView verticalAlignment](self, "verticalAlignment");
  if (v24)
  {
    if (v24 == 1)
    {
      -[NUErrorView center](self, "center");
      v12 = v25 + v18 * -0.5;
    }
  }
  else
  {
    -[NUErrorView bounds](self, "bounds");
    v12 = v26 / 3.0 + v18 * -0.5;
  }
  v33.origin.x = (v20 - v23) * 0.5;
  v33.origin.y = v12;
  v33.size.width = v15;
  v33.size.height = v18;
  v34 = CGRectIntegral(v33);
  x = v34.origin.x;
  y = v34.origin.y;
  width = v34.size.width;
  height = v34.size.height;
  -[NUErrorView label](self, "label");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setFrame:", x, y, width, height);

}

- (void)errorMessage:(id)a3
{
  id v4;
  NUErrorMessage *errorMessage;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  errorMessage = self->_errorMessage;
  v11 = v4;
  if (!errorMessage || (v6 = -[NUErrorMessage isEqual:](errorMessage, "isEqual:", v4), v7 = v11, !v6))
  {
    -[NUErrorView attributedStringForErrorMessage:](self, "attributedStringForErrorMessage:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUErrorView label](self, "label");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAttributedText:", v8);

    -[NUErrorView label](self, "label");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sizeToFit");

    -[NUErrorView setNeedsLayout](self, "setNeedsLayout");
    -[NUErrorView layoutIfNeeded](self, "layoutIfNeeded");
    v7 = v11;
  }

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityElements
{
  return 0;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[NUErrorView label](self, "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)attributedStringForErrorMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v4 = a3;
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = &stru_24D5A3F98;
  if (v5 && v6)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\n%@"), v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v8);
    objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77E8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x24BDF65F8];
    objc_msgSend(v9, "addAttribute:value:range:", *MEMORY[0x24BDF65F8], v10, 0, objc_msgSend(v5, "length"));
    objc_msgSend(v9, "addAttribute:value:range:", v12, v11, objc_msgSend(v5, "length"), objc_msgSend(v6, "length"));
    v13 = objc_alloc_init(MEMORY[0x24BDF6748]);
    objc_msgSend(v13, "setLineSpacing:", 2.0);
    objc_msgSend(v13, "setAlignment:", -[NUErrorView textAlignment](self, "textAlignment"));
    objc_msgSend(v9, "addAttribute:value:range:", *MEMORY[0x24BDF6628], v13, 0, objc_msgSend(v9, "length"));
    v7 = (__CFString *)objc_msgSend(v9, "copy");

  }
  return v7;
}

- (NUTrait)labelMaxWidthTrait
{
  NUTrait *labelMaxWidthTrait;
  NUTrait *v4;
  void *v5;
  NUTrait *v6;
  NUTrait *v7;
  _QWORD v9[4];
  id v10;
  id location;

  labelMaxWidthTrait = self->_labelMaxWidthTrait;
  if (!labelMaxWidthTrait)
  {
    objc_initWeak(&location, self);
    v4 = objc_alloc_init(NUTrait);
    -[NUTrait when:block:](v4, "when:block:", 3, &__block_literal_global_15);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __33__NUErrorView_labelMaxWidthTrait__block_invoke_2;
    v9[3] = &unk_24D5A19D8;
    objc_copyWeak(&v10, &location);
    objc_msgSend(v5, "when:block:", 12, v9);
    v6 = (NUTrait *)objc_claimAutoreleasedReturnValue();
    v7 = self->_labelMaxWidthTrait;
    self->_labelMaxWidthTrait = v6;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
    labelMaxWidthTrait = self->_labelMaxWidthTrait;
  }
  return labelMaxWidthTrait;
}

double __33__NUErrorView_labelMaxWidthTrait__block_invoke(double a1, uint64_t a2, void *a3)
{
  int v4;
  double v5;

  v4 = objc_msgSend(a3, "isLandscape");
  v5 = 0.7;
  if (!v4)
    v5 = 0.75;
  return a1 * v5;
}

double __33__NUErrorView_labelMaxWidthTrait__block_invoke_2(uint64_t a1, void *a2, double a3)
{
  double v5;
  double v6;
  id WeakRetained;
  uint64_t v8;

  if (objc_msgSend(a2, "isLandscape"))
  {
    if (a3 > 540.0)
    {
      v5 = 0.4;
      goto LABEL_7;
    }
LABEL_5:
    v6 = 0.7;
    return a3 * v6;
  }
  if (a3 < 768.0)
    goto LABEL_5;
  v5 = 0.3;
LABEL_7:
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = objc_msgSend(WeakRetained, "textAlignment");

  v6 = 0.7;
  if (v8)
    v6 = v5;
  return a3 * v6;
}

- (NUErrorMessage)errorMessage
{
  return self->_errorMessage;
}

- (void)setErrorMessage:(id)a3
{
  objc_storeStrong((id *)&self->_errorMessage, a3);
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (void)setTextAlignment:(int64_t)a3
{
  self->_textAlignment = a3;
}

- (unint64_t)verticalAlignment
{
  return self->_verticalAlignment;
}

- (void)setVerticalAlignment:(unint64_t)a3
{
  self->_verticalAlignment = a3;
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabelMaxWidthTrait:(id)a3
{
  objc_storeStrong((id *)&self->_labelMaxWidthTrait, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelMaxWidthTrait, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_errorMessage, 0);
}

@end
