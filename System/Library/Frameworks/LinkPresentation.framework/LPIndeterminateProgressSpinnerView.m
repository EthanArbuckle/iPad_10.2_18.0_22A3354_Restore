@implementation LPIndeterminateProgressSpinnerView

- (LPIndeterminateProgressSpinnerView)initWithHost:(id)a3 style:(id)a4 properties:(id)a5
{
  id v9;
  id v10;
  LPIndeterminateProgressSpinnerView *v11;
  LPIndeterminateProgressSpinnerView *v12;
  LPIndeterminateProgressSpinnerView *v13;
  objc_super v15;

  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)LPIndeterminateProgressSpinnerView;
  v11 = -[LPComponentView initWithHost:](&v15, sel_initWithHost_, a3);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_style, a4);
    objc_storeStrong((id *)&v12->_properties, a5);
    v13 = v12;
  }

  return v12;
}

- (void)ensureIndicatorView
{
  UIActivityIndicatorView **p_indicatorView;
  void *v4;
  void *v5;
  LPUIActivityIndicatorView *obj;
  _QWORD v7[5];

  p_indicatorView = &self->_indicatorView;
  if (!self->_indicatorView)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __57__LPIndeterminateProgressSpinnerView_ensureIndicatorView__block_invoke;
    v7[3] = &unk_1E44A8C80;
    v7[4] = self;
    obj = -[LPUIActivityIndicatorView initWithActivityIndicatorStyle:]([LPUIActivityIndicatorView alloc], "initWithActivityIndicatorStyle:", __57__LPIndeterminateProgressSpinnerView_ensureIndicatorView__block_invoke((uint64_t)v7));
    -[LPIndeterminateProgressSpinnerStyle indicatorColor](self->_style, "indicatorColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[LPIndeterminateProgressSpinnerStyle indicatorColor](self->_style, "indicatorColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPUIActivityIndicatorView setColor:](obj, "setColor:", v5);

    }
    -[LPUIActivityIndicatorView startAnimating](obj, "startAnimating");
    objc_storeStrong((id *)p_indicatorView, obj);
    -[LPIndeterminateProgressSpinnerView addSubview:](self, "addSubview:", *p_indicatorView);

  }
}

uint64_t __57__LPIndeterminateProgressSpinnerView_ensureIndicatorView__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char v4;
  void *v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "indicatorColor");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "useLargeIndicatorStyle");

    if ((v4 & 1) != 0)
      return 10;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "indicatorColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    return 9;
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "useLargeIndicatorStyle"))
    return 101;
  return 100;
}

- (void)ensureURLLabel
{
  void *v3;
  uint64_t v4;
  LPTextView *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  LPTextView *v11;
  LPTextView *text;

  if (!self->_text)
  {
    -[LPIndeterminateProgressSpinnerPresentationProperties text](self->_properties, "text");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "length");

    if (v4)
    {
      v5 = [LPTextView alloc];
      -[LPComponentView host](self, "host");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_alloc(MEMORY[0x1E0CB3498]);
      -[LPIndeterminateProgressSpinnerPresentationProperties text](self->_properties, "text");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v7, "initWithString:", v8);
      -[LPIndeterminateProgressSpinnerStyle label](self->_style, "label");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[LPTextView initWithHost:text:style:](v5, "initWithHost:text:style:", v6, v9, v10);
      text = self->_text;
      self->_text = v11;

      -[LPIndeterminateProgressSpinnerView addSubview:](self, "addSubview:", self->_text);
    }
  }
}

- (void)layoutComponentView
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  LPTextView *text;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;

  -[LPIndeterminateProgressSpinnerView ensureIndicatorView](self, "ensureIndicatorView");
  -[LPIndeterminateProgressSpinnerView ensureURLLabel](self, "ensureURLLabel");
  -[LPIndeterminateProgressSpinnerView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[UIActivityIndicatorView bounds](self->_indicatorView, "bounds");
  v8 = v7;
  v10 = v9;
  text = self->_text;
  -[LPIndeterminateProgressSpinnerView bounds](self, "bounds");
  -[LPTextView sizeThatFits:](text, "sizeThatFits:", v12, v13);
  v15 = v14;
  v17 = v16;
  if (self->_text)
  {
    -[LPIndeterminateProgressSpinnerStyle spacing](self->_style, "spacing");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "value");
    v20 = v19 * 0.5;

  }
  else
  {
    v20 = 0.0;
  }
  v32 = v15;
  -[LPIndeterminateProgressSpinnerStyle verticalOffset](self->_style, "verticalOffset");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "value");
  v22 = v6 - v10;
  v23 = v4;
  v24 = (v4 - v8) * 0.5;
  v25 = v10;
  v26 = v8;
  v28 = v22 * 0.5 - v17 * 0.5 + v20 + v27;

  -[UIActivityIndicatorView setFrame:](self->_indicatorView, "setFrame:", v24, v28, v26, v25);
  -[LPIndeterminateProgressSpinnerStyle verticalOffset](self->_style, "verticalOffset");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "value");
  v31 = v25 * 0.5 + (v6 - v17) * 0.5 + v20 + v30;

  -[LPTextView setFrame:](self->_text, "setFrame:", (v23 - v32) * 0.5, v31, v32, v17);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[LPIndeterminateProgressSpinnerView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "userInterfaceIdiom") == 6)
  {
    -[LPIndeterminateProgressSpinnerPresentationProperties text](self->_properties, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");

    if (!v8)
    {
      v9 = 64.0;
      v10 = 64.0;
      goto LABEL_9;
    }
  }
  else
  {

  }
  -[LPIndeterminateProgressSpinnerView ensureIndicatorView](self, "ensureIndicatorView");
  -[LPIndeterminateProgressSpinnerView ensureURLLabel](self, "ensureURLLabel");
  -[LPTextView sizeThatFits:](self->_text, "sizeThatFits:", width, height);
  v12 = v11;
  v14 = v13;
  -[UIActivityIndicatorView sizeThatFits:](self->_indicatorView, "sizeThatFits:", width, height);
  v16 = v15;
  v18 = v17;
  if (self->_text)
  {
    -[LPIndeterminateProgressSpinnerStyle spacing](self->_style, "spacing");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "value");
    v21 = v20;

  }
  else
  {
    v21 = 0.0;
  }
  -[LPIndeterminateProgressSpinnerStyle padding](self->_style, "padding");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "leading");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "value");
  v25 = v24;
  -[LPIndeterminateProgressSpinnerStyle padding](self->_style, "padding");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "trailing");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "value");
  v29 = v28;

  -[LPIndeterminateProgressSpinnerStyle padding](self->_style, "padding");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "top");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "value");
  v33 = v32;
  -[LPIndeterminateProgressSpinnerStyle padding](self->_style, "padding");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "bottom");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "value");
  v9 = v12 + v16 + v25 + v29;
  v10 = v14 + v18 + v21 + v33 + v36;

LABEL_9:
  v37 = v9;
  v38 = v10;
  result.height = v38;
  result.width = v37;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_indicatorView, 0);
}

@end
