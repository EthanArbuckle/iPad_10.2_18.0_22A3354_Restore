@implementation CKThrowBalloonViewAttributes

- (CKBalloonView)throwBalloonView
{
  return self->_throwBalloonView;
}

- (void)setThrowBalloonView:(id)a3
{
  objc_storeStrong((id *)&self->_throwBalloonView, a3);
}

- (NSDictionary)supplementaryViews
{
  return self->_supplementaryViews;
}

- (void)setSupplementaryViews:(id)a3
{
  objc_storeStrong((id *)&self->_supplementaryViews, a3);
}

- (CGRect)startFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_startFrame.origin.x;
  y = self->_startFrame.origin.y;
  width = self->_startFrame.size.width;
  height = self->_startFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setStartFrame:(CGRect)a3
{
  self->_startFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supplementaryViews, 0);
  objc_storeStrong((id *)&self->_throwBalloonView, 0);
}

@end
