@implementation CSScrollView

- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double y;
  double x;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  -[BSUIScrollView delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8 || objc_msgSend(v8, "coverSheetScrollView:shouldSetContentOffset:animated:", self, v4, x, y))
  {
    v10.receiver = self;
    v10.super_class = (Class)CSScrollView;
    -[BSUIScrollView setContentOffset:animated:](&v10, sel_setContentOffset_animated_, v4, x, y);
  }

}

- (void)setContentOffset:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  objc_super v8;

  y = a3.y;
  x = a3.x;
  -[BSUIScrollView delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6 || objc_msgSend(v6, "coverSheetScrollView:shouldSetContentOffset:animated:", self, 0, x, y))
  {
    v8.receiver = self;
    v8.super_class = (Class)CSScrollView;
    -[BSUIScrollView setContentOffset:](&v8, sel_setContentOffset_, x, y);
  }

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[BSUIScrollView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v5, "coverSheetScrollView:gestureRecognizerShouldBegin:", self, v4);

  return (char)self;
}

@end
