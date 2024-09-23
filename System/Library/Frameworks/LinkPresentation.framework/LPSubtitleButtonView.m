@implementation LPSubtitleButtonView

- (LPSubtitleButtonView)initWithHost:(id)a3
{

  return 0;
}

- (LPSubtitleButtonView)initWithHost:(id)a3 buttonProperties:(id)a4 style:(id)a5
{
  id v9;
  id v10;
  LPSubtitleButtonView *v11;
  LPSubtitleButtonView *v12;
  LPSubtitleButtonView *v13;
  objc_super v15;

  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)LPSubtitleButtonView;
  v11 = -[LPComponentView initWithHost:](&v15, sel_initWithHost_, a3);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_buttonProperties, a4);
    objc_storeStrong((id *)&v12->_style, a5);
    v13 = v12;
  }

  return v12;
}

- (void)_buildSubviewsIfNeeded
{
  UIButton *v3;
  UIButton *button;
  void *v5;
  UIButton *v6;
  void *v7;
  void *v8;
  UIButton *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  if (!self->_button)
  {
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
    v3 = (UIButton *)objc_claimAutoreleasedReturnValue();
    button = self->_button;
    self->_button = v3;

    -[LPCaptionButtonPresentationProperties foregroundColor](self->_buttonProperties, "foregroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = self->_button;
      -[LPCaptionButtonPresentationProperties foregroundColor](self->_buttonProperties, "foregroundColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton setTitleColor:forState:](v6, "setTitleColor:forState:", v7, 0);

    }
    -[UIButton _setDisableAutomaticTitleAnimations:](self->_button, "_setDisableAutomaticTitleAnimations:", 1);
    -[LPCaptionButtonPresentationProperties attributedText](self->_buttonProperties, "attributedText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = self->_button;
      -[LPCaptionButtonPresentationProperties attributedText](self->_buttonProperties, "attributedText");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton setAttributedTitle:forState:](v9, "setAttributedTitle:forState:", v10, 0);

    }
    else
    {
      v11 = objc_alloc(MEMORY[0x1E0CB3778]);
      -[LPCaptionButtonPresentationProperties text](self->_buttonProperties, "text");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v11, "initWithString:", v12);

      if (!-[LPCaptionButtonPresentationProperties type](self->_buttonProperties, "type")
        || -[LPCaptionButtonPresentationProperties type](self->_buttonProperties, "type") == 2)
      {
        v33 = objc_alloc_init(MEMORY[0x1E0DC33D0]);
        -[LPTextViewStyle font](self->_style, "font");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "fontDescriptor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v32 = v15;
        objc_msgSend(v15, "objectForKey:", *MEMORY[0x1E0DC4A40]);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectForKeyedSubscript:", *MEMORY[0x1E0DC4BA8]);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v16;
        if (v16)
          v17 = MEMORY[0x1A1B02970](objc_msgSend(v16, "doubleValue"));
        else
          v17 = 4;
        +[LPResources chevron](LPResources, "chevron");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "platformImage");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)MEMORY[0x1E0DC3888];
        -[LPTextViewStyle font](self->_style, "font");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "pointSize");
        objc_msgSend(v20, "configurationWithPointSize:weight:scale:", v17, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "imageWithConfiguration:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "imageWithRenderingMode:", 2);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setImage:", v24);

        v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
        objc_msgSend(v13, "appendAttributedString:", v25);

        objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v33);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "appendAttributedString:", v26);

      }
      v34 = *MEMORY[0x1E0DC32A0];
      -[LPTextViewStyle font](self->_style, "font");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = v27;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addAttributes:range:", v28, 0, objc_msgSend(v13, "length"));

      -[UIButton setAttributedTitle:forState:](self->_button, "setAttributedTitle:forState:", v13, 0);
    }
    -[UIButton titleLabel](self->_button, "titleLabel");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setBaselineAdjustment:", 2);

    -[UIButton addTarget:action:forControlEvents:](self->_button, "addTarget:action:forControlEvents:", self, sel_buttonPressed_, 64);
    -[LPSubtitleButtonView addSubview:](self, "addSubview:", self->_button);
  }
}

- (void)layoutComponentView
{
  double v3;
  double v4;

  -[LPSubtitleButtonView _buildSubviewsIfNeeded](self, "_buildSubviewsIfNeeded");
  -[LPSubtitleButtonView bounds](self, "bounds");
  -[LPSubtitleButtonView _layoutButtonForSize:applyingLayout:](self, "_layoutButtonForSize:applyingLayout:", 1, v3, v4);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[LPSubtitleButtonView _buildSubviewsIfNeeded](self, "_buildSubviewsIfNeeded");
  -[LPSubtitleButtonView _layoutButtonForSize:applyingLayout:](self, "_layoutButtonForSize:applyingLayout:", 0, width, height);
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGSize)_layoutButtonForSize:(CGSize)a3 applyingLayout:(BOOL)a4
{
  double height;
  double width;
  double v7;
  double v8;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (a4)
    -[UIButton setFrame:](self->_button, "setFrame:", 0.0, 0.0, a3.width, a3.height);
  -[UIButton sizeThatFits:](self->_button, "sizeThatFits:", width, height);
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)sizeToFit
{
  double v3;
  double v4;

  -[LPSubtitleButtonView sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  -[LPSubtitleButtonView setFrame:](self, "setFrame:", 0.0, 0.0, v3, v4);
}

- (void)buttonPressed:(id)a3
{
  void *v4;
  id v5;
  void (**v6)(void);

  -[LPComponentView host](self, "host", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentViewDidTapCaptionButton:buttonType:", self, -[LPCaptionButtonPresentationProperties type](self->_buttonProperties, "type"));

  -[LPCaptionButtonPresentationProperties callback](self->_buttonProperties, "callback");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[LPCaptionButtonPresentationProperties callback](self->_buttonProperties, "callback");
    v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v6[2]();

  }
}

- (id)viewForLastBaselineLayout
{
  return self->_button;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_buttonProperties, 0);
}

@end
