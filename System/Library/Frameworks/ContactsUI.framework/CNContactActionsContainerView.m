@implementation CNContactActionsContainerView

+ (Class)layerClass
{
  return (Class)objc_msgSend(MEMORY[0x1E0DC3F10], "layerClass");
}

- (CNContactActionsContainerView)initWithArrangedSubviews:(id)a3
{
  CNContactActionsContainerView *v3;
  CNContactActionsContainerView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNContactActionsContainerView;
  v3 = -[NUIContainerBoxView initWithArrangedSubviews:](&v6, sel_initWithArrangedSubviews_, a3);
  v4 = v3;
  if (v3)
  {
    -[CNContactActionsContainerView setLayoutMarginsRelativeArrangement:](v3, "setLayoutMarginsRelativeArrangement:", 1);
    -[NUIContainerBoxView setHorizontalAlignment:](v4, "setHorizontalAlignment:", 3);
    -[NUIContainerBoxView setVerticalAlignment:](v4, "setVerticalAlignment:", 3);
  }
  return v4;
}

@end
