@implementation PKViewWithHitTestHandler

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void (**hitTestHandler)(id, void *, id, double, double);
  id v10;
  void *v11;
  objc_super v13;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PKViewWithHitTestHandler;
  -[PKViewWithHitTestHandler hitTest:withEvent:](&v13, sel_hitTest_withEvent_, v7, x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  hitTestHandler = (void (**)(id, void *, id, double, double))self->_hitTestHandler;
  if (hitTestHandler)
  {
    hitTestHandler[2](hitTestHandler, v8, v7, x, y);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = v8;
  }
  v11 = v10;

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_hitTestHandler, 0);
}

@end
