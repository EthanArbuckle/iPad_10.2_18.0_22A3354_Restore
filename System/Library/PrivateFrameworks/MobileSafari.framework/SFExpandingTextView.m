@implementation SFExpandingTextView

- (SFExpandingTextView)init
{
  return -[SFExpandingTextView initWithMaxHeight:](self, "initWithMaxHeight:", 0.0);
}

- (SFExpandingTextView)initWithMaxHeight:(double)a3
{
  SFExpandingTextView *v4;
  SFExpandingTextView *v5;
  SFExpandingTextView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFExpandingTextView;
  v4 = -[SFExpandingTextView init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_maxHeight = a3;
    -[SFExpandingTextView setScrollEnabled:](v4, "setScrollEnabled:", 0);
    v6 = v5;
  }

  return v5;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double maxHeight;
  double v8;
  double v9;
  objc_super v10;
  CGSize result;

  v10.receiver = self;
  v10.super_class = (Class)SFExpandingTextView;
  -[SFExpandingTextView intrinsicContentSize](&v10, sel_intrinsicContentSize);
  v5 = v4;
  v6 = v3;
  maxHeight = self->_maxHeight;
  if (maxHeight != 0.0)
  {
    -[SFExpandingTextView setScrollEnabled:](self, "setScrollEnabled:", v3 >= maxHeight);
    if (v6 >= maxHeight)
      v6 = self->_maxHeight;
  }
  v8 = v5;
  v9 = v6;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)setText:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFExpandingTextView;
  -[SFExpandingTextView setText:](&v4, sel_setText_, a3);
  -[SFExpandingTextView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

@end
