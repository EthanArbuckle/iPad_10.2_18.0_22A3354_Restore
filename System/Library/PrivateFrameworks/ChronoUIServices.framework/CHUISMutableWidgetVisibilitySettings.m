@implementation CHUISMutableWidgetVisibilitySettings

- (void)setSettled:(BOOL)a3
{
  self->super._settled = a3;
}

- (void)setVisibleBounds:(CGRect)a3
{
  self->super._visibleBounds = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CHUISWidgetVisibilitySettings _initWithVisibilitySettings:]([CHUISWidgetVisibilitySettings alloc], "_initWithVisibilitySettings:", self);
}

@end
