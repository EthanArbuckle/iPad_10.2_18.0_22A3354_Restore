@implementation AVControlsViewController

+ (double)autoHideInterval
{
  return 3.0;
}

- (unint64_t)visibilityPolicy
{
  return self->_visibilityPolicy;
}

@end
