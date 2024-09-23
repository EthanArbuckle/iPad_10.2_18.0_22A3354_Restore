@implementation LPHighlightGestureRecognizer

- (void)startHighlightIfPossible
{
  CGFloat v3;
  CGFloat v4;

  if (!-[LPHighlightGestureRecognizer state](self, "state"))
  {
    -[LPHighlightGestureRecognizer setState:](self, "setState:", 1);
    -[LPHighlightGestureRecognizer _locationInWindow](self, "_locationInWindow");
    self->_startPointInWindowCoordinates.x = v3;
    self->_startPointInWindowCoordinates.y = v4;
  }
}

- (void)updateHighlight
{
  CGPoint *p_startPointInWindowCoordinates;
  double v4;
  double v5;

  p_startPointInWindowCoordinates = &self->_startPointInWindowCoordinates;
  -[LPHighlightGestureRecognizer _locationInWindow](self, "_locationInWindow");
  if (distanceBetweenPoints(p_startPointInWindowCoordinates->x, p_startPointInWindowCoordinates->y, v4, v5) > 10.0)
    -[LPHighlightGestureRecognizer cancelHighlight](self, "cancelHighlight");
}

- (void)cancelHighlight
{
  -[LPHighlightGestureRecognizer setState:](self, "setState:", 5);
}

- (CGPoint)_locationInWindow
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  -[LPHighlightGestureRecognizer view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPHighlightGestureRecognizer locationInView:](self, "locationInView:", v4);
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

@end
