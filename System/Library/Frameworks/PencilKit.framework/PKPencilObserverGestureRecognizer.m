@implementation PKPencilObserverGestureRecognizer

+ (PKPencilObserverGestureRecognizer)pencilObserverWithDelegate:(uint64_t)a1
{
  id v2;
  PKPencilObserverGestureRecognizer *v3;
  PKPencilObserverGestureRecognizer *v4;
  PKPencilObserverGestureRecognizer *v5;

  v2 = a2;
  objc_opt_self();
  v3 = objc_alloc_init(PKPencilObserverGestureRecognizer);
  v4 = v3;
  if (v3)
  {
    -[PKPencilObserverGestureRecognizer setName:](v3, "setName:", CFSTR("pencilkit.pencilObserver"));
    -[PKPencilObserverGestureRecognizer setDelegate:](v4, "setDelegate:", v2);
    -[PKPencilObserverGestureRecognizer setDelaysTouchesEnded:](v4, "setDelaysTouchesEnded:", 0);
    -[PKPencilObserverGestureRecognizer setCancelsTouchesInView:](v4, "setCancelsTouchesInView:", 0);
    -[PKPencilObserverGestureRecognizer setRequiresExclusiveTouchType:](v4, "setRequiresExclusiveTouchType:", 0);
    -[PKPencilObserverGestureRecognizer setAllowedTouchTypes:](v4, "setAllowedTouchTypes:", &unk_1E77ECA60);
    v5 = v4;
  }

  return v4;
}

- (void)setDelegate:(id)a3
{
  id v4;
  id v5;
  char v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKPencilObserverGestureRecognizer;
  -[PKPencilObserverGestureRecognizer setDelegate:](&v7, sel_setDelegate_, v4);
  v5 = v4;
  self->_delegateRespondsToDidBegin = objc_opt_respondsToSelector() & 1;
  self->_delegateRespondsToDidMove = objc_opt_respondsToSelector() & 1;
  v6 = objc_opt_respondsToSelector();

  self->_delegateRespondsToDidEnd = v6 & 1;
}

- (CGPoint)locationInView:(id)a3
{
  double v3;
  double v4;
  objc_super v5;
  CGPoint result;

  if (a3 && self->_drawingTouch)
  {
    -[UITouch PK_locationInView:](self->_drawingTouch, "PK_locationInView:");
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PKPencilObserverGestureRecognizer;
    -[PKPencilObserverGestureRecognizer locationInView:](&v5, sel_locationInView_);
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)_inputPointFromTouch:(void *)a3 event:(void *)a4 checkPredicted:(int)a5
{
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = a3;
  v9 = a4;
  if (a2)
  {
    objc_msgSend(a2, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = v14;
      if (a5)
      {
        objc_msgSend(v9, "predictedTouchesForTouch:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "count"))
        {
          objc_msgSend(v12, "lastObject");
          v13 = objc_claimAutoreleasedReturnValue();

          v11 = (id)v13;
        }

      }
      objc_msgSend(v11, "PK_locationInView:", v10);
      +[PKInputPointUtility drawingInputPoint:view:touch:predicted:activeInputProperties:](PKInputPointUtility, "drawingInputPoint:view:touch:predicted:activeInputProperties:", v10, v11, 0, 23);

    }
    else
    {
      a1[6] = 0u;
      a1[7] = 0u;
      a1[4] = 0u;
      a1[5] = 0u;
      a1[2] = 0u;
      a1[3] = 0u;
      *a1 = 0u;
      a1[1] = 0u;
    }

  }
  else
  {
    a1[6] = 0u;
    a1[7] = 0u;
    a1[4] = 0u;
    a1[5] = 0u;
    a1[2] = 0u;
    a1[3] = 0u;
    *a1 = 0u;
    a1[1] = 0u;
  }

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _OWORD v10[8];

  v6 = a4;
  if (!self->_drawingTouch)
  {
    objc_msgSend(a3, "objectsPassingTest:", &__block_literal_global_38);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "anyObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_storeStrong((id *)&self->_drawingTouch, v8);
      -[PKPencilObserverGestureRecognizer setState:](self, "setState:", 1);
      if (self->_delegateRespondsToDidBegin)
      {
        -[PKPencilObserverGestureRecognizer delegate](self, "delegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPencilObserverGestureRecognizer _inputPointFromTouch:event:checkPredicted:](v10, self, v8, v6, 0);
        objc_msgSend(v9, "pencilObserver:didBeginAtPoint:", self, v10);

      }
    }

  }
}

BOOL __60__PKPencilObserverGestureRecognizer_touchesBegan_withEvent___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 2;
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  _OWORD v8[8];

  v6 = a4;
  if (objc_msgSend(a3, "containsObject:", self->_drawingTouch) && self->_delegateRespondsToDidMove)
  {
    -[PKPencilObserverGestureRecognizer delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPencilObserverGestureRecognizer _inputPointFromTouch:event:checkPredicted:](v8, self, self->_drawingTouch, v6, 1);
    objc_msgSend(v7, "pencilObserver:didMoveToPoint:", self, v8);

  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  uint64_t v5;

  if (self)
  {
    if (-[PKPencilObserverGestureRecognizer state](self, "state", a3, a4))
      v5 = 4;
    else
      v5 = 5;
    -[PKPencilObserverGestureRecognizer setState:](self, "setState:", v5);
    -[PKPencilObserverGestureRecognizer _endGestureIfNecessary]((uint64_t)self);
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  -[PKPencilObserverGestureRecognizer setState:](self, "setState:", 3, a4);
  -[PKPencilObserverGestureRecognizer _endGestureIfNecessary]((uint64_t)self);
}

- (void)_endGestureIfNecessary
{
  void *v2;
  id v3;

  if (a1)
  {
    v2 = *(void **)(a1 + 272);
    if (v2)
    {
      *(_QWORD *)(a1 + 272) = 0;

      if (*(_BYTE *)(a1 + 282))
      {
        objc_msgSend((id)a1, "delegate");
        v3 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "pencilObserverDidEnd:", a1);

      }
    }
  }
}

- (BOOL)shouldBeRequiredToFailByGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)shouldRequireFailureOfGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_drawingTouch, 0);
}

@end
