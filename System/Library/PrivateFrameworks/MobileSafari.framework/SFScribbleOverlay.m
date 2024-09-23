@implementation SFScribbleOverlay

- (SFScribbleOverlay)initWithFrame:(CGRect)a3
{
  SFScribbleOverlay *v3;
  SFScribbleOverlay *v4;
  id selectionHandler;
  id tapHandler;
  void *v7;
  void *v8;
  void *v9;
  SFScribbleClickGestureRecognizer *v10;
  SFScribbleOverlay *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SFScribbleOverlay;
  v3 = -[SFScribbleOverlay initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    selectionHandler = v3->_selectionHandler;
    v3->_selectionHandler = &__block_literal_global_16;

    tapHandler = v4->_tapHandler;
    v4->_tapHandler = &__block_literal_global_26;

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3858]), "initWithTarget:action:", v4, sel__didReceiveHover_);
    -[SFScribbleOverlay addGestureRecognizer:](v4, "addGestureRecognizer:", v7);

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA0]), "initWithTarget:action:", v4, sel__didReceivePan_);
    -[SFScribbleOverlay addGestureRecognizer:](v4, "addGestureRecognizer:", v8);

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v4, sel__didReceiveTapOrClick_);
    objc_msgSend(v9, "setAllowedTouchTypes:", &unk_1E2245D08);
    -[SFScribbleOverlay addGestureRecognizer:](v4, "addGestureRecognizer:", v9);
    v10 = -[SFScribbleClickGestureRecognizer initWithOverlay:]([SFScribbleClickGestureRecognizer alloc], "initWithOverlay:", v4);
    -[SFScribbleClickGestureRecognizer setAllowedTouchTypes:](v10, "setAllowedTouchTypes:", &unk_1E2245D20);
    -[SFScribbleOverlay addGestureRecognizer:](v4, "addGestureRecognizer:", v10);
    v11 = v4;

  }
  return v4;
}

- (void)_didReceiveHover:(id)a3
{
  uint64_t v4;
  id v5;

  v5 = a3;
  v4 = objc_msgSend(v5, "state");
  if ((unint64_t)(v4 - 1) >= 2)
  {
    if (v4 == 3)
      -[SFScribbleOverlay endSelectionWithCompletion:](self, "endSelectionWithCompletion:", 0);
  }
  else
  {
    -[SFScribbleSelectionOverlay setShowsHideButton:](self->_selectionOverlay, "setShowsHideButton:", 0);
    objc_msgSend(v5, "locationInView:", self);
    -[SFScribbleOverlay _selectionMovedToLocation:](self, "_selectionMovedToLocation:");
  }

}

- (void)_didReceivePan:(id)a3
{
  uint64_t v4;
  id v5;

  v5 = a3;
  v4 = objc_msgSend(v5, "state");
  if ((unint64_t)(v4 - 3) < 2)
  {
    -[SFScribbleSelectionOverlay setShowsHideButton:](self->_selectionOverlay, "setShowsHideButton:", 1);
  }
  else if ((unint64_t)(v4 - 1) <= 1)
  {
    -[SFScribbleSelectionOverlay setShowsHideButton:](self->_selectionOverlay, "setShowsHideButton:", 0);
    objc_msgSend(v5, "locationInView:", self);
    -[SFScribbleOverlay _selectionMovedToLocation:](self, "_selectionMovedToLocation:");
  }

}

- (void)_didReceiveTapOrClick:(id)a3
{
  id v4;
  SFScribbleSelectionOverlay *selectionOverlay;
  id v6;

  v4 = a3;
  selectionOverlay = self->_selectionOverlay;
  v6 = v4;
  objc_msgSend(v4, "locationInView:", selectionOverlay);
  if (-[SFScribbleSelectionOverlay pointInside:withEvent:](selectionOverlay, "pointInside:withEvent:", 0))
  {
    (*((void (**)(void))self->_tapHandler + 2))();
  }
  else
  {
    objc_msgSend(v6, "locationInView:", self);
    -[SFScribbleOverlay _selectionMovedToLocation:](self, "_selectionMovedToLocation:");
  }

}

- (void)_selectionMovedToLocation:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  CGPoint *p_lastSelectionLocation;

  y = a3.y;
  x = a3.x;
  p_lastSelectionLocation = &self->_lastSelectionLocation;
  if (self->_lastSelectionLocation.x != a3.x || self->_lastSelectionLocation.y != a3.y)
  {
    (*((void (**)(double, double))self->_selectionHandler + 2))(a3.x, a3.y);
    p_lastSelectionLocation->x = x;
    p_lastSelectionLocation->y = y;
  }
}

- (void)endSelection
{
  -[SFScribbleOverlay endSelectionWithCompletion:](self, "endSelectionWithCompletion:", 0);
}

- (void)endSelectionWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  SFScribbleSelectionOverlay *v5;
  SFScribbleSelectionOverlay *v6;
  SFScribbleSelectionOverlay *selectionOverlay;
  _QWORD v8[4];
  SFScribbleSelectionOverlay *v9;
  void (**v10)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  v5 = self->_selectionOverlay;
  v6 = v5;
  if (v5)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __48__SFScribbleOverlay_endSelectionWithCompletion___block_invoke;
    v8[3] = &unk_1E21E25E0;
    v9 = v5;
    v10 = v4;
    -[SFScribbleSelectionOverlay fadeOutWithCompletion:](v9, "fadeOutWithCompletion:", v8);
    selectionOverlay = self->_selectionOverlay;
    self->_selectionOverlay = 0;

  }
  else if (v4)
  {
    v4[2](v4);
  }

}

uint64_t __48__SFScribbleOverlay_endSelectionWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)moveSelectionToFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  SFScribbleSelectionOverlay *v8;
  SFScribbleSelectionOverlay *selectionOverlay;
  CGRect v10;
  CGRect v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SFScribbleSelectionOverlay frame](self->_selectionOverlay, "frame");
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  if (!CGRectEqualToRect(v10, v11))
  {
    -[SFScribbleOverlay endSelectionWithCompletion:](self, "endSelectionWithCompletion:", 0);
    v8 = -[SFScribbleSelectionOverlay initWithFrame:]([SFScribbleSelectionOverlay alloc], "initWithFrame:", x, y, width, height);
    selectionOverlay = self->_selectionOverlay;
    self->_selectionOverlay = v8;

    -[SFScribbleSelectionOverlay setHideButtonHandler:](self->_selectionOverlay, "setHideButtonHandler:", self->_tapHandler);
    -[SFScribbleOverlay addSubview:](self, "addSubview:", self->_selectionOverlay);
    -[SFScribbleSelectionOverlay fadeIn](self->_selectionOverlay, "fadeIn");
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  objc_super v10;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SFScribbleOverlay endSelection](self, "endSelection");
    v8 = 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SFScribbleOverlay;
    -[SFScribbleOverlay hitTest:withEvent:](&v10, sel_hitTest_withEvent_, v7, x, y);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)selectionHandler
{
  return self->_selectionHandler;
}

- (void)setSelectionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 440);
}

- (id)tapHandler
{
  return self->_tapHandler;
}

- (void)setTapHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_tapHandler, 0);
  objc_storeStrong(&self->_selectionHandler, 0);
  objc_storeStrong((id *)&self->_selectionOverlay, 0);
}

@end
