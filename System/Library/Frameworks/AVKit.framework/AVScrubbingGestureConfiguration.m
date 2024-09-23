@implementation AVScrubbingGestureConfiguration

- (float)syntheticFriction
{
  return self->_syntheticFriction;
}

- (BOOL)usesNaturalDirection
{
  return self->_usesNaturalDirection;
}

- (BOOL)linearSeeking
{
  return self->_linearSeeking;
}

- (AVScrubbingGesturePlatformConfiguration)platformConfiguration
{
  return self->_platformConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platformConfiguration, 0);
}

+ (id)defaultConfiguration
{
  void *v2;
  double v3;
  void *v4;

  +[AVScrubbingGesturePlatformConfiguration defaultConfiguration](AVScrubbingGesturePlatformConfiguration, "defaultConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = 1063675494;
  +[AVScrubbingGestureConfiguration configurationWithSyntheticFriction:usesNaturalDirection:platformConfiguration:](AVScrubbingGestureConfiguration, "configurationWithSyntheticFriction:usesNaturalDirection:platformConfiguration:", 0, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (AVScrubbingGestureConfiguration)configurationWithSyntheticFriction:(float)a3 usesNaturalDirection:(BOOL)a4 platformConfiguration:(id)a5
{
  AVScrubbingGesturePlatformConfiguration *v7;
  AVScrubbingGestureConfiguration *v8;
  AVScrubbingGesturePlatformConfiguration *platformConfiguration;
  AVScrubbingGesturePlatformConfiguration *v10;
  float v11;
  float v12;

  v7 = (AVScrubbingGesturePlatformConfiguration *)a5;
  v8 = objc_alloc_init(AVScrubbingGestureConfiguration);
  v8->_syntheticFriction = a3;
  v8->_usesNaturalDirection = a4;
  platformConfiguration = v8->_platformConfiguration;
  v8->_platformConfiguration = v7;
  v10 = v7;

  -[AVScrubbingGesturePlatformConfiguration nonLinearity](v10, "nonLinearity");
  v12 = v11;

  v8->_linearSeeking = v12 == 1.0;
  return v8;
}

@end
