@implementation DMCEnrollmentLinkLabelView

- (DMCEnrollmentLinkLabelView)initWithIcon:(id)a3 message:(id)a4 linkMessage:(id)a5 linkHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  DMCEnrollmentLinkLabelView *v14;
  id v15;
  void *v16;
  uint64_t v17;
  UIImageView *imageView;
  uint64_t v19;
  NSString *message;
  uint64_t v21;
  NSString *linkMessage;
  uint64_t v23;
  UILabel *textLabel;
  uint64_t v25;
  id linkHandler;
  void *v27;
  id v28;
  _QWORD v30[4];
  id v31;
  id location;
  objc_super v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v33.receiver = self;
  v33.super_class = (Class)DMCEnrollmentLinkLabelView;
  v14 = -[DMCEnrollmentLinkLabelView initWithFrame:](&v33, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  if (v14)
  {
    if (v10)
    {
      v15 = objc_alloc(MEMORY[0x24BDF6AE8]);
      objc_msgSend(MEMORY[0x24BDF6AC8], "_systemImageNamed:", v10);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "initWithImage:", v16);
      imageView = v14->_imageView;
      v14->_imageView = (UIImageView *)v17;

      -[UIImageView setContentMode:](v14->_imageView, "setContentMode:", 2);
      -[DMCEnrollmentLinkLabelView addSubview:](v14, "addSubview:", v14->_imageView);
    }
    v14->_enabled = 1;
    v19 = objc_msgSend(v11, "copy");
    message = v14->_message;
    v14->_message = (NSString *)v19;

    v21 = objc_msgSend(v12, "copy");
    linkMessage = v14->_linkMessage;
    v14->_linkMessage = (NSString *)v21;

    v23 = objc_opt_new();
    textLabel = v14->_textLabel;
    v14->_textLabel = (UILabel *)v23;

    -[UILabel setNumberOfLines:](v14->_textLabel, "setNumberOfLines:", 0);
    -[DMCEnrollmentLinkLabelView _populateTextLabelWithMessage:linkMessage:](v14, "_populateTextLabelWithMessage:linkMessage:", v11, v12);
    -[DMCEnrollmentLinkLabelView addSubview:](v14, "addSubview:", v14->_textLabel);
    v25 = MEMORY[0x2199F7854](v13);
    linkHandler = v14->_linkHandler;
    v14->_linkHandler = (id)v25;

    -[DMCEnrollmentLinkLabelView setUserInteractionEnabled:](v14, "setUserInteractionEnabled:", v13 != 0);
    objc_initWeak(&location, v14);
    v34[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __75__DMCEnrollmentLinkLabelView_initWithIcon_message_linkMessage_linkHandler___block_invoke;
    v30[3] = &unk_24D52E2D0;
    objc_copyWeak(&v31, &location);
    v28 = (id)-[DMCEnrollmentLinkLabelView registerForTraitChanges:withHandler:](v14, "registerForTraitChanges:withHandler:", v27, v30);

    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }

  return v14;
}

void __75__DMCEnrollmentLinkLabelView_initWithIcon_message_linkMessage_linkHandler___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "message");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "linkMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_populateTextLabelWithMessage:linkMessage:", v1, v2);

}

- (void)layoutSubviews
{
  CGFloat v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  void *v14;
  objc_super v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;

  v15.receiver = self;
  v15.super_class = (Class)DMCEnrollmentLinkLabelView;
  -[DMCEnrollmentLinkLabelView layoutSubviews](&v15, sel_layoutSubviews);
  -[DMCEnrollmentLinkLabelView bounds](self, "bounds");
  v3 = (CGRectGetWidth(v16) + -35.0) * 0.5;
  -[DMCEnrollmentLinkLabelView imageView](self, "imageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFrame:", v3, 0.0, 35.0, 35.0);

  -[DMCEnrollmentLinkLabelView textLabel](self, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCEnrollmentLinkLabelView bounds](self, "bounds");
  objc_msgSend(v5, "sizeThatFits:", v6, v7);
  v9 = v8;
  v11 = v10;

  -[DMCEnrollmentLinkLabelView bounds](self, "bounds");
  v12 = (CGRectGetWidth(v17) - v9) * 0.5;
  -[DMCEnrollmentLinkLabelView bounds](self, "bounds");
  v13 = CGRectGetHeight(v18) - v11 + -5.0;
  -[DMCEnrollmentLinkLabelView textLabel](self, "textLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFrame:", v12, v13, v9, v11);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[DMCEnrollmentLinkLabelView textLabel](self, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sizeThatFits:", width, height);
  v8 = v7;
  v10 = v9;

  -[DMCEnrollmentLinkLabelView imageView](self, "imageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    v12 = v10 + 50.0;
  else
    v12 = v10;
  v13 = v8;
  result.height = v12;
  result.width = v13;
  return result;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  -[DMCEnrollmentLinkLabelView setAlpha:](self, "setAlpha:", a3, a4, 0.7);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  void *v5;
  void (**v6)(void);

  -[DMCEnrollmentLinkLabelView setAlpha:](self, "setAlpha:", a3, a4, 1.0);
  -[DMCEnrollmentLinkLabelView linkHandler](self, "linkHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[DMCEnrollmentLinkLabelView linkHandler](self, "linkHandler");
    v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v6[2]();

  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  -[DMCEnrollmentLinkLabelView setAlpha:](self, "setAlpha:", a3, a4, 1.0);
}

- (void)setEnabled:(BOOL)a3
{
  void *v4;
  id v5;

  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    -[DMCEnrollmentLinkLabelView message](self, "message");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[DMCEnrollmentLinkLabelView linkMessage](self, "linkMessage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCEnrollmentLinkLabelView _populateTextLabelWithMessage:linkMessage:](self, "_populateTextLabelWithMessage:linkMessage:", v5, v4);

  }
}

- (void)_populateTextLabelWithMessage:(id)a3 linkMessage:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  _QWORD v24[3];
  _QWORD v25[3];
  _QWORD v26[3];
  _QWORD v27[4];

  v27[3] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v22 = a4;
  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setAlignment:", 1);
  v9 = *MEMORY[0x24BEBB360];
  v26[0] = *MEMORY[0x24BEBB360];
  -[DMCEnrollmentLinkLabelView _textFont](self, "_textFont");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v10;
  v11 = *MEMORY[0x24BEBB368];
  v26[1] = *MEMORY[0x24BEBB368];
  objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x24BEBB3A8];
  v26[2] = *MEMORY[0x24BEBB3A8];
  v27[1] = v12;
  v27[2] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v6, v14);
    objc_msgSend(v7, "appendAttributedString:", v15);

  }
  v23 = v6;
  v24[0] = v9;
  -[DMCEnrollmentLinkLabelView _textFont](self, "_textFont");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v16;
  v24[1] = v11;
  if (-[DMCEnrollmentLinkLabelView enabled](self, "enabled"))
    objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
  else
    objc_msgSend(MEMORY[0x24BDF6950], "placeholderTextColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v13;
  v25[1] = v17;
  v25[2] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v19 = objc_alloc(MEMORY[0x24BDD1458]);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\n%@"), v22);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v19, "initWithString:attributes:", v20, v18);
    objc_msgSend(v7, "appendAttributedString:", v21);

  }
  -[UILabel setAttributedText:](self->_textLabel, "setAttributedText:", v7);

}

- (id)_textFont
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x24BDF77C0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v2, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void)setTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_textLabel, a3);
}

- (id)linkHandler
{
  return self->_linkHandler;
}

- (void)setLinkHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 440);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (NSString)linkMessage
{
  return self->_linkMessage;
}

- (void)setLinkMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkMessage, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong(&self->_linkHandler, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
