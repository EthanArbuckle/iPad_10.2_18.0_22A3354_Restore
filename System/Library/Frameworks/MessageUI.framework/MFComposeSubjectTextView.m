@implementation MFComposeSubjectTextView

- (MFComposeSubjectTextView)initWithFrame:(CGRect)a3
{
  MFComposeSubjectTextView *v3;
  MFComposeSubjectTextView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MFComposeSubjectTextView;
  v3 = -[MFComposeSubjectTextView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[MFComposeSubjectTextView setSupportsAdaptiveImageGlyph:](v3, "setSupportsAdaptiveImageGlyph:", 0);
  return v4;
}

- (void)setContentOffset:(CGPoint)a3
{
  double y;
  double x;
  NSString *v6;
  BOOL IsAccessibilityCategory;
  objc_super v8;

  y = a3.y;
  x = a3.x;
  objc_msgSend((id)*MEMORY[0x1E0DC4730], "preferredContentSizeCategory");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v6);

  if (!IsAccessibilityCategory)
  {
    v8.receiver = self;
    v8.super_class = (Class)MFComposeSubjectTextView;
    -[MFComposeSubjectTextView setContentOffset:](&v8, sel_setContentOffset_, x, y);
  }
}

- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  objc_super v9;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  cleanupSubjectString(v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9.receiver = self;
  v9.super_class = (Class)MFComposeSubjectTextView;
  -[MFComposeSubjectTextView setMarkedText:selectedRange:](&v9, sel_setMarkedText_selectedRange_, v8, location, length);

}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  unsigned __int8 v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  objc_super v12;

  v6 = a4;
  if (sel_selectAll_ == a3)
  {
    -[MFComposeSubjectTextView text](self, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");

    if (v9)
    {
      -[MFComposeSubjectTextView selectedRange](self, "selectedRange");
      v7 = v10 < v9;
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)MFComposeSubjectTextView;
    v7 = -[MFComposeSubjectTextView canPerformAction:withSender:](&v12, sel_canPerformAction_withSender_, a3, v6);
  }

  return v7;
}

@end
