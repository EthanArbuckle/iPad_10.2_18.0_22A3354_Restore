@implementation _PKInlineDrawingScrollView

- (id)_parentScrollView
{
  void *v2;
  uint64_t v3;

  -[_PKInlineDrawingScrollView superview](self, "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v2, "superview");
      v3 = objc_claimAutoreleasedReturnValue();

      v2 = (void *)v3;
    }
    while (v3);
  }
  return v2;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  BOOL v12;

  v6 = a4;
  v7 = a3;
  -[_PKInlineDrawingScrollView panGestureRecognizer](self, "panGestureRecognizer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[_PKInlineDrawingScrollView _parentScrollView](self, "_parentScrollView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "panGestureRecognizer");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v12 = v8 == v7 && v10 == v6;
  return v12;
}

- (void)setContentOffset:(CGPoint)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_PKInlineDrawingScrollView;
  -[_PKInlineDrawingScrollView setContentOffset:](&v3, sel_setContentOffset_, a3.x, 0.0);
}

@end
