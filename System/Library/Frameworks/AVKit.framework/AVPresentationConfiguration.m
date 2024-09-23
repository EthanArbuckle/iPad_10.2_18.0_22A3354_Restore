@implementation AVPresentationConfiguration

- (unint64_t)transitionStyle
{
  return self->_transitionStyle;
}

- (double)transitionDuration
{
  return self->_transitionDuration;
}

+ (AVPresentationConfiguration)configurationWithTransitionStyle:(unint64_t)a3 transitionDuration:(double)a4
{
  AVPresentationConfiguration *v6;

  v6 = objc_alloc_init(AVPresentationConfiguration);
  v6->_transitionStyle = a3;
  v6->_transitionDuration = a4;
  return v6;
}

@end
