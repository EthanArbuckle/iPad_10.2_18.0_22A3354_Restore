@implementation HighlightRecognizer

- (HighlightRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  HighlightRecognizer *v4;
  HighlightRecognizer *v5;
  HighlightRecognizer *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HighlightRecognizer;
  v4 = -[HighlightRecognizer initWithTarget:action:](&v8, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[HighlightRecognizer setDelaysTouchesEnded:](v4, "setDelaysTouchesEnded:", 0);
    v6 = v5;
  }

  return v5;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  SEL highlightAction;
  id WeakRetained;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HighlightRecognizer;
  v6 = a4;
  v7 = a3;
  -[HighlightRecognizer touchesBegan:withEvent:](&v12, sel_touchesBegan_withEvent_, v7, v6);
  v8 = objc_msgSend(v7, "count", v12.receiver, v12.super_class);

  self->_numberOfTouches += v8;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  highlightAction = self->_highlightAction;
  WeakRetained = objc_loadWeakRetained(&self->_highlightTarget);
  objc_msgSend(v9, "sendAction:to:from:forEvent:", highlightAction, WeakRetained, self, v6);

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  SEL highlightAction;
  id WeakRetained;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HighlightRecognizer;
  v6 = a4;
  v7 = a3;
  -[HighlightRecognizer touchesEnded:withEvent:](&v12, sel_touchesEnded_withEvent_, v7, v6);
  v8 = objc_msgSend(v7, "count", v12.receiver, v12.super_class);

  self->_numberOfTouches -= v8;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  highlightAction = self->_highlightAction;
  WeakRetained = objc_loadWeakRetained(&self->_highlightTarget);
  objc_msgSend(v9, "sendAction:to:from:forEvent:", highlightAction, WeakRetained, self, v6);

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  SEL highlightAction;
  id WeakRetained;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HighlightRecognizer;
  v6 = a4;
  v7 = a3;
  -[HighlightRecognizer touchesCancelled:withEvent:](&v12, sel_touchesCancelled_withEvent_, v7, v6);
  v8 = objc_msgSend(v7, "count", v12.receiver, v12.super_class);

  self->_numberOfTouches -= v8;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  highlightAction = self->_highlightAction;
  WeakRetained = objc_loadWeakRetained(&self->_highlightTarget);
  objc_msgSend(v9, "sendAction:to:from:forEvent:", highlightAction, WeakRetained, self, v6);

}

- (unint64_t)numberOfTouches
{
  return self->_numberOfTouches;
}

- (void)reset
{
  void *v3;
  SEL highlightAction;
  id WeakRetained;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HighlightRecognizer;
  -[HighlightRecognizer reset](&v6, sel_reset);
  self->_numberOfTouches = 0;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  highlightAction = self->_highlightAction;
  WeakRetained = objc_loadWeakRetained(&self->_highlightTarget);
  objc_msgSend(v3, "sendAction:to:from:forEvent:", highlightAction, WeakRetained, self, 0);

}

- (id)highlightTarget
{
  return objc_loadWeakRetained(&self->_highlightTarget);
}

- (void)setHighlightTarget:(id)a3
{
  objc_storeWeak(&self->_highlightTarget, a3);
}

- (SEL)highlightAction
{
  return self->_highlightAction;
}

- (void)setHighlightAction:(SEL)a3
{
  self->_highlightAction = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_highlightTarget);
}

@end
