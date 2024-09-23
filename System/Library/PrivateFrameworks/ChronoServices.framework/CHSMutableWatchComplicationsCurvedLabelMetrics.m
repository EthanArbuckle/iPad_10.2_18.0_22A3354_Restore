@implementation CHSMutableWatchComplicationsCurvedLabelMetrics

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CHSWatchComplicationsCurvedLabelMetrics _initWithInstance:]([CHSWatchComplicationsCurvedLabelMetrics alloc], "_initWithInstance:", self);
}

- (void)setCircleCenter:(CGPoint)a3
{
  self->super._circleCenter = a3;
}

- (void)setCircleRadius:(double)a3
{
  self->super._circleRadius = a3;
}

- (void)setMaximumAngularWidth:(double)a3
{
  self->super._maximumAngularWidth = a3;
}

- (void)setCenterAngle:(double)a3
{
  self->super._centerAngle = a3;
}

- (void)setBezierPath:(id)a3
{
  CHSBezierPath *v4;
  CHSBezierPath *bezierPath;
  id v6;

  v6 = a3;
  v4 = (CHSBezierPath *)objc_msgSend(v6, "copy");
  bezierPath = self->super._bezierPath;
  self->super._bezierPath = v4;

}

- (void)setInterior:(BOOL)a3
{
  self->super._interior = a3;
}

- (void)setTracking:(double)a3
{
  self->super._tracking = a3;
}

- (void)setFontSize:(double)a3
{
  self->super._fontSize = a3;
}

- (void)setTextColor:(id)a3
{
  BSColor *v4;
  BSColor *textColor;
  id v6;

  v6 = a3;
  v4 = (BSColor *)objc_msgSend(v6, "copy");
  textColor = self->super._textColor;
  self->super._textColor = v4;

}

- (void)setAccessoryPlacement:(unint64_t)a3
{
  self->super._accessoryPlacement = a3;
}

- (void)setAccessoryPadding:(double)a3
{
  self->super._accessoryPadding = a3;
}

- (void)setAccessoryMaxSize:(CGSize)a3
{
  self->super._accessoryMaxSize = a3;
}

@end
