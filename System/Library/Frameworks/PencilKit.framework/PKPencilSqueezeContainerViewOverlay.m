@implementation PKPencilSqueezeContainerViewOverlay

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void (**pencilHitTestWithEventHandler)(id, void *, double, double);
  void *v10;
  void *v11;
  void (**hitTestHandler)(id, void *, void *, double, double);
  id v13;
  objc_super v15;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = v7;
  if (v7
    && objc_msgSend(v7, "PK_isEventFromPencil")
    && objc_msgSend(v8, "type") != 11
    && (pencilHitTestWithEventHandler = (void (**)(id, void *, double, double))self->_pencilHitTestWithEventHandler) != 0)
  {
    pencilHitTestWithEventHandler[2](pencilHitTestWithEventHandler, v8, x, y);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)PKPencilSqueezeContainerViewOverlay;
    -[PKPencilSqueezeContainerViewOverlay hitTest:withEvent:](&v15, sel_hitTest_withEvent_, v8, x, y);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    hitTestHandler = (void (**)(id, void *, void *, double, double))self->_hitTestHandler;
    if (hitTestHandler)
    {
      hitTestHandler[2](hitTestHandler, v11, v8, x, y);
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = v11;
    }
    v10 = v13;

  }
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pencilHitTestWithEventHandler, 0);
  objc_storeStrong(&self->_hitTestHandler, 0);
}

@end
