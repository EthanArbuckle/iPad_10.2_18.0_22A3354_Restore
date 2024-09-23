@implementation CPUIAssistantCell

- (void)configureCell
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CPUIAssistantCell;
  -[_CPUIBaseTableCell configureCell](&v4, sel_configureCell);
  -[CPUIAssistantCell textLabel](self, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAdjustsFontSizeToFitWidth:", 1);

  -[CPUIAssistantCell setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", CFSTR("CPListAssistantCell"));
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3;

  v3 = 54.0;
  result.height = v3;
  return result;
}

- (void)applyConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CPUIAssistantCell _setSiriAccessory](self, "_setSiriAccessory");
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CPUIAssistantCell textLabel](self, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  -[CPUIAssistantCell textLabel](self, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CPUIAssistantCell textLabel](self, "textLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIAssistantCell setAccessibilityUserInputLabels:](self, "setAccessibilityUserInputLabels:", v11);

  }
  else
  {
    -[CPUIAssistantCell setAccessibilityUserInputLabels:](self, "setAccessibilityUserInputLabels:", MEMORY[0x24BDBD1A8]);
  }
  -[CPUIAssistantCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CPUIAssistantCell;
  -[CPUIAssistantCell setHighlighted:animated:](&v9, sel_setHighlighted_animated_, a3, a4);
  if (a3)
    objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusLabelColor");
  else
    objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIAssistantCell textLabel](self, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextColor:", v6);

  -[CPUIAssistantCell accessoryView](self, "accessoryView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTintColor:", v6);

}

- (void)_setSiriAccessory
{
  void *v3;
  void *v4;
  id v5;

  _CPUISiriGlyph(4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageWithRenderingMode:", 2);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v5);
  -[CPUIAssistantCell setAccessoryView:](self, "setAccessoryView:", v4);

}

@end
