@implementation CVAPortraitGenericRequestImpl

- (CVABackgroundRequest)background
{
  return (CVABackgroundRequest *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBackground:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (CVALightRequest)light
{
  return (CVALightRequest *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLight:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (CVAPostProcessingRequest)post
{
  return (CVAPostProcessingRequest *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPost:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (BOOL)isTmpConfig
{
  return self->_isTmpConfig;
}

- (void)setIsTmpConfig:(BOOL)a3
{
  self->_isTmpConfig = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_post, 0);
  objc_storeStrong((id *)&self->_light, 0);
  objc_storeStrong((id *)&self->_background, 0);
}

@end
