@implementation GCVirtualControllerElementConfiguration

- (BOOL)isHidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)hidden
{
  self->_hidden = hidden;
}

- (UIBezierPath)path
{
  return self->_path;
}

- (void)setPath:(UIBezierPath *)path
{
  objc_storeStrong((id *)&self->_path, path);
}

- (BOOL)actsAsTouchpad
{
  return self->_actsAsTouchpad;
}

- (void)setActsAsTouchpad:(BOOL)actsAsTouchpad
{
  self->_actsAsTouchpad = actsAsTouchpad;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
}

@end
