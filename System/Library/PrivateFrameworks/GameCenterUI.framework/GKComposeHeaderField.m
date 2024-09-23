@implementation GKComposeHeaderField

- (GKComposeHeaderField)initWithFrame:(CGRect)a3
{
  GKComposeHeaderField *v3;
  GKLabel *v4;
  GKLabel *valueLabel;
  double v6;
  double v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)GKComposeHeaderField;
  v3 = -[GKBaseComposeHeaderField initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(GKLabel);
    valueLabel = v3->_valueLabel;
    v3->_valueLabel = v4;

    -[GKLabel setOpaque:](v3->_valueLabel, "setOpaque:", 0);
    -[GKLabel setBackgroundColor:](v3->_valueLabel, "setBackgroundColor:", 0);
    -[GKLabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_valueLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[GKLabel setUserInteractionEnabled:](v3->_valueLabel, "setUserInteractionEnabled:", 0);
    LODWORD(v6) = 1120403456;
    -[GKLabel setContentCompressionResistancePriority:forAxis:](v3->_valueLabel, "setContentCompressionResistancePriority:forAxis:", 0, v6);
    LODWORD(v7) = 1144750080;
    -[GKLabel setContentCompressionResistancePriority:forAxis:](v3->_valueLabel, "setContentCompressionResistancePriority:forAxis:", 1, v7);
    -[GKComposeHeaderField addSubview:](v3, "addSubview:", v3->_valueLabel);
    -[GKBaseComposeHeaderField addConstraintsForValueView:](v3, "addConstraintsForValueView:", v3->_valueLabel);
  }
  return v3;
}

- (id)valueText
{
  void *v2;
  void *v3;
  void *v4;

  -[GKComposeHeaderField valueLabel](self, "valueLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setValueText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  GKLabel *valueLabel;
  __CFString *v15;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v6);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = &stru_1E59EB978;
  }
  objc_msgSend(MEMORY[0x1E0D25B28], "textStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "composeFields");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "emphasized");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v10, "userInterfaceLayoutDirection") == 1;

  objc_msgSend(v9, "alignment:lineBreakMode:", 2 * v8, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[__CFString _gkAttributedStringByApplyingStyle:](v15, "_gkAttributedStringByApplyingStyle:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length");
  valueLabel = self->_valueLabel;
  if (v13)
    -[GKLabel setAttributedText:](valueLabel, "setAttributedText:", v12);
  else
    -[GKLabel setText:](valueLabel, "setText:", 0);
  -[GKComposeHeaderField invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");

}

- (void)setMaxLineCount:(unint64_t)a3
{
  objc_super v5;

  if (-[GKBaseComposeHeaderField maxLineCount](self, "maxLineCount") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)GKComposeHeaderField;
    -[GKBaseComposeHeaderField setMaxLineCount:](&v5, sel_setMaxLineCount_, a3);
    -[GKLabel setNumberOfLines:](self->_valueLabel, "setNumberOfLines:", a3);
  }
}

- (CGRect)valueFrame
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[GKComposeHeaderField superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

  -[GKLabel frame](self->_valueLabel, "frame");
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (GKLabel)valueLabel
{
  return self->_valueLabel;
}

- (void)setValueLabel:(id)a3
{
  objc_storeStrong((id *)&self->_valueLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueLabel, 0);
}

@end
