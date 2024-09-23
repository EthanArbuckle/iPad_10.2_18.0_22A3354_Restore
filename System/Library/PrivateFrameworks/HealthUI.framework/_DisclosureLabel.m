@implementation _DisclosureLabel

- (_DisclosureLabel)initWithFrame:(CGRect)a3
{
  _DisclosureLabel *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_DisclosureLabel;
  v3 = -[_DisclosureLabel initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4A98]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fontDescriptorWithSymbolicTraits:", 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v5, 0.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DisclosureLabel setFont:](v3, "setFont:", v6);
    objc_msgSend(v6, "lineHeight");
    v3->_edgeInsets.top = v7;
    v3->_edgeInsets.left = v7 * 1.2;
    v3->_edgeInsets.bottom = v7;
    v3->_edgeInsets.right = v7 * 1.2;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("CLINICAL_DOCUMENT_CDA_DISCLOSURE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DisclosureLabel setText:](v3, "setText:", v9);

    -[_DisclosureLabel setNumberOfLines:](v3, "setNumberOfLines:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DisclosureLabel setBackgroundColor:](v3, "setBackgroundColor:", v10);

    HKHealthKeyColor();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DisclosureLabel setTextColor:](v3, "setTextColor:", v11);

  }
  return v3;
}

- (void)drawTextInRect:(CGRect)a3
{
  double top;
  double left;
  CGFloat v5;
  CGFloat v6;
  objc_super v7;

  top = self->_edgeInsets.top;
  left = self->_edgeInsets.left;
  v5 = a3.size.width - (left + self->_edgeInsets.right);
  v6 = a3.size.height - (top + self->_edgeInsets.bottom);
  v7.receiver = self;
  v7.super_class = (Class)_DisclosureLabel;
  -[_DisclosureLabel drawTextInRect:](&v7, sel_drawTextInRect_, a3.origin.x + left, a3.origin.y + top, v5, v6);
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;
  CGSize result;

  v7.receiver = self;
  v7.super_class = (Class)_DisclosureLabel;
  -[_DisclosureLabel intrinsicContentSize](&v7, sel_intrinsicContentSize);
  v4 = v3 + self->_edgeInsets.top + self->_edgeInsets.bottom;
  v6 = v5 + self->_edgeInsets.left + self->_edgeInsets.right;
  result.height = v4;
  result.width = v6;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_DisclosureLabel bounds](self, "bounds");
  if (width != v8)
    -[_DisclosureLabel setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  v9.receiver = self;
  v9.super_class = (Class)_DisclosureLabel;
  -[_DisclosureLabel setBounds:](&v9, sel_setBounds_, x, y, width, height);
}

- (void)updateConstraints
{
  double v3;
  double v4;
  double v5;
  objc_super v6;

  -[_DisclosureLabel bounds](self, "bounds");
  v4 = v3 - self->_edgeInsets.left - self->_edgeInsets.right;
  -[_DisclosureLabel preferredMaxLayoutWidth](self, "preferredMaxLayoutWidth");
  if (v5 != v4)
    -[_DisclosureLabel setPreferredMaxLayoutWidth:](self, "setPreferredMaxLayoutWidth:", v4);
  v6.receiver = self;
  v6.super_class = (Class)_DisclosureLabel;
  -[_DisclosureLabel updateConstraints](&v6, sel_updateConstraints);
}

- (UIEdgeInsets)edgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_edgeInsets.top;
  left = self->_edgeInsets.left;
  bottom = self->_edgeInsets.bottom;
  right = self->_edgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

@end
