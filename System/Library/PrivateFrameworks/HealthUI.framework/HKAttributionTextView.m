@implementation HKAttributionTextView

- (HKAttributionTextView)initWithAttributedText:(id)a3 selectable:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  HKAttributionTextView *v7;
  HKAttributionTextView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = a4;
  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKAttributionTextView;
  v7 = -[HKAttributionTextView init](&v14, sel_init);
  v8 = v7;
  if (v7)
  {
    -[HKAttributionTextView setEditable:](v7, "setEditable:", 0);
    -[HKAttributionTextView textContainer](v8, "textContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLineFragmentPadding:", 0.0);

    -[HKAttributionTextView setScrollEnabled:](v8, "setScrollEnabled:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKAttributionTextView setBackgroundColor:](v8, "setBackgroundColor:", v10);

    -[HKAttributionTextView setAttributedText:](v8, "setAttributedText:", v6);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKAttributionTextView setFont:](v8, "setFont:", v11);

    if (v4)
    {
      -[HKAttributionTextView setSelectable:](v8, "setSelectable:", 1);
      HKHealthKeyColor();
    }
    else
    {
      -[HKAttributionTextView setSelectable:](v8, "setSelectable:", 0);
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKAttributionTextView setTextColor:](v8, "setTextColor:", v12);

  }
  return v8;
}

@end
