@implementation FULabel

- (void)setUppercase:(BOOL)a3 usingCurrentLocale:(BOOL)a4
{
  if (self->_uppercase != a3 || self->_useCurrentLocale != a4)
  {
    self->_uppercase = a3;
    self->_useCurrentLocale = a4;
    if (self->_stringValue)
      -[FULabel setText:](self, "setText:");
    if (self->_attributedStringValue)
      -[FULabel setAttributedText:](self, "setAttributedText:");
  }
}

- (void)awakeFromNib
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FULabel;
  -[FULabel awakeFromNib](&v4, sel_awakeFromNib);
  -[FULabel setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 1);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", self, sel_performTap_);
  -[FULabel addGestureRecognizer:](self, "addGestureRecognizer:", v3);

}

- (void)performTap:(id)a3
{
  void *v4;
  void (**v5)(void);

  if (objc_msgSend(a3, "state") == 3)
  {
    -[FULabel onTap](self, "onTap");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[FULabel onTap](self, "onTap");
      v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v5[2]();

    }
  }
}

- (void)setAssociatedScalingLabel:(id)a3
{
  id v4;
  id obj;

  obj = a3;
  -[FULabel associatedScalingLabel](self, "associatedScalingLabel");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != obj)
  {
    objc_storeWeak((id *)&self->_associatedScalingLabel, obj);
    -[FULabel setAdjustsFontSizeToFitWidth:](self, "setAdjustsFontSizeToFitWidth:", 1);
    objc_msgSend(obj, "setAdjustsFontSizeToFitWidth:", 1);
  }

}

- (id)_associatedScalingLabel
{
  return self->_realAssociatedScalingLabel;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;

  -[FULabel associatedScalingLabel](self, "associatedScalingLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_actualScaleFactor");
  v5 = v4;
  -[FULabel _actualScaleFactor](self, "_actualScaleFactor");
  if (v5 != v6)
  {
    -[FULabel _actualScaleFactor](self, "_actualScaleFactor");
    v8 = v7;
    objc_msgSend(v3, "_actualScaleFactor");
    if (v8 > v9)
      objc_storeStrong((id *)&self->_realAssociatedScalingLabel, v3);
  }
  -[FULabel setNeedsDisplay](self, "setNeedsDisplay");
  v10.receiver = self;
  v10.super_class = (Class)FULabel;
  -[TLKLabel layoutSubviews](&v10, sel_layoutSubviews);

}

- (void)updateWidthConstraintWithRatio:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[FULabel associatedLabelConstraint](self, "associatedLabelConstraint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActive:", 0);

  v6 = (void *)MEMORY[0x24BDD1628];
  -[FULabel associatedScalingLabel](self, "associatedScalingLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 7, 0, v7, 7, a3, 0.0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setActive:", 1);
  -[FULabel setAssociatedLabelConstraint:](self, "setAssociatedLabelConstraint:", v8);

}

- (void)setText:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  BOOL v7;
  NSString *stringValue;
  NSString *v9;
  NSString *v10;
  FULabel *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v20;
  void *v21;
  double v22;
  FULabel *v23;
  objc_super v24;

  v4 = (__CFString *)a3;
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = &stru_24ED16380;
  objc_storeStrong((id *)&self->_stringValue, v6);
  v7 = -[FULabel uppercase](self, "uppercase");
  stringValue = self->_stringValue;
  if (v7)
  {
    -[NSString FU_uppercaseStringUsingCurrentLocale:](stringValue, "FU_uppercaseStringUsingCurrentLocale:", -[FULabel useCurrentLocale](self, "useCurrentLocale"));
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = stringValue;
  }
  v10 = v9;
  -[FULabel associatedScalingLabel](self, "associatedScalingLabel");
  v11 = (FULabel *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[FULabel _defaultAttributes](self, "_defaultAttributes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString sizeWithAttributes:](v10, "sizeWithAttributes:", v12);
    v14 = v13;

    -[FULabel text](v11, "text");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[FULabel _defaultAttributes](self, "_defaultAttributes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sizeWithAttributes:", v16);
    v18 = v17;

    if (v18 <= 0.0 || v14 <= 0.0)
      v20 = 1.0;
    else
      v20 = v14 / v18;
    -[FULabel associatedLabelConstraint](v11, "associatedLabelConstraint");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v22 = 1.0 / v20;
      v23 = v11;
    }
    else
    {
      v23 = self;
      v22 = v20;
    }
    -[FULabel updateWidthConstraintWithRatio:](v23, "updateWidthConstraintWithRatio:", v22);
  }
  v24.receiver = self;
  v24.super_class = (Class)FULabel;
  -[TLKLabel setText:](&v24, sel_setText_, v10);

}

- (void)setStyleProvider:(id)a3 primaryStyle:(BOOL)a4
{
  -[TLKLabel setProminence:](self, "setProminence:", !a4);
}

- (void)setAttributedText:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  void *attributedStringValue;
  objc_super v8;

  v4 = a3;
  v5 = v4;
  if (!v4)
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", &stru_24ED16380);
  objc_storeStrong((id *)&self->_attributedStringValue, v5);
  if (!v4)

  v6 = -[FULabel uppercase](self, "uppercase");
  attributedStringValue = self->_attributedStringValue;
  if (v6)
  {
    objc_msgSend(attributedStringValue, "FU_uppercaseAttributedStringCurrentLocale:", -[FULabel useCurrentLocale](self, "useCurrentLocale"));
    attributedStringValue = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8.receiver = self;
  v8.super_class = (Class)FULabel;
  -[TLKLabel setAttributedText:](&v8, sel_setAttributedText_, attributedStringValue);
  if (v6)

}

- (id)onTap
{
  return objc_getProperty(self, a2, 920, 1);
}

- (void)setOnTap:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 920);
}

- (BOOL)uppercase
{
  return self->_uppercase;
}

- (BOOL)useCurrentLocale
{
  return self->_useCurrentLocale;
}

- (FULabel)associatedScalingLabel
{
  return (FULabel *)objc_loadWeakRetained((id *)&self->_associatedScalingLabel);
}

- (NSLayoutConstraint)associatedLabelConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_associatedLabelConstraint);
}

- (void)setAssociatedLabelConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_associatedLabelConstraint, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_associatedLabelConstraint);
  objc_destroyWeak((id *)&self->_associatedScalingLabel);
  objc_storeStrong(&self->_onTap, 0);
  objc_storeStrong((id *)&self->_realAssociatedScalingLabel, 0);
  objc_storeStrong((id *)&self->_attributedStringValue, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);
}

@end
