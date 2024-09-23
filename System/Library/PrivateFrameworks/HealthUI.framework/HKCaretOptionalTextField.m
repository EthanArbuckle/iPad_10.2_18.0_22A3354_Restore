@implementation HKCaretOptionalTextField

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
  if (-[HKCaretOptionalTextField allowsSelection](self, "allowsSelection"))
  {
    v10.receiver = self;
    v10.super_class = (Class)HKCaretOptionalTextField;
    -[HKCaretOptionalTextField hitTest:withEvent:](&v10, sel_hitTest_withEvent_, v7, x, y);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (CGRect)caretRectForPosition:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;
  CGRect result;

  if (self->_allowsSelection)
  {
    v7.receiver = self;
    v7.super_class = (Class)HKCaretOptionalTextField;
    -[HKCaretOptionalTextField caretRectForPosition:](&v7, sel_caretRectForPosition_, a3);
  }
  else
  {
    v3 = *MEMORY[0x1E0C9D648];
    v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (double)actualMinimumFontSize
{
  return 10.0;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  objc_super v5;

  if (self->_disableActions)
    return 0;
  v5.receiver = self;
  v5.super_class = (Class)HKCaretOptionalTextField;
  return -[HKCaretOptionalTextField canPerformAction:withSender:](&v5, sel_canPerformAction_withSender_, a3, a4);
}

- (BOOL)allowsSelection
{
  return self->_allowsSelection;
}

- (void)setAllowsSelection:(BOOL)a3
{
  self->_allowsSelection = a3;
}

- (BOOL)disableActions
{
  return self->_disableActions;
}

- (void)setDisableActions:(BOOL)a3
{
  self->_disableActions = a3;
}

@end
