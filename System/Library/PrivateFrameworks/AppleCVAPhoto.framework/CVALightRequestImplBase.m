@implementation CVALightRequestImplBase

- (CVALightRequestImplBase)init
{
  CVALightRequestImplBase *v2;
  CVALightRequestImplBase *v3;
  CVALightRequestImplBase *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CVALightRequestImplBase;
  v2 = -[CVALightRequestImplBase init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_portraitStyleStrength = NAN;
    v4 = v2;
  }

  return v3;
}

- (NSDictionary)faceKitProcessOutput
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFaceKitProcessOutput:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (float)portraitStyleStrength
{
  return self->_portraitStyleStrength;
}

- (void)setPortraitStyleStrength:(float)a3
{
  self->_portraitStyleStrength = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceKitProcessOutput, 0);
}

@end
