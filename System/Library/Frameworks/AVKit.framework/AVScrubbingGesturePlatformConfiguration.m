@implementation AVScrubbingGesturePlatformConfiguration

- (float)magnitude
{
  return self->_magnitude;
}

- (float)nonLinearity
{
  return self->_nonLinearity;
}

+ (id)defaultConfiguration
{
  double v2;
  double v3;

  LODWORD(v2) = 1.0;
  LODWORD(v3) = 1.0;
  return +[AVScrubbingGesturePlatformConfiguration configurationWithMagnitude:nonLinearity:](AVScrubbingGesturePlatformConfiguration, "configurationWithMagnitude:nonLinearity:", v2, v3);
}

+ (id)configurationWithMagnitude:(float)a3 nonLinearity:(float)a4
{
  AVScrubbingGesturePlatformConfiguration *v6;

  v6 = objc_alloc_init(AVScrubbingGesturePlatformConfiguration);
  v6->_magnitude = a3;
  v6->_nonLinearity = a4;
  return v6;
}

@end
