@implementation CVAPortraitRequest_StageLight

- (CVAPortraitRequest_StageLight)initWithMattingRequest:(id)a3 destinationColorPixelBuffer:(__CVBuffer *)a4 proxyCubeData:(id)a5 cubeData:(id)a6 vignetteIntensity:(float)a7 stageLightIntensity:(float)a8
{
  id v15;
  id v16;
  id v17;
  CVAPortraitRequest_StageLight *v18;
  CVAPortraitRequest_StageLight *v19;
  CVAPortraitRequest_StageLight *v20;
  objc_super v22;

  v15 = a3;
  v16 = a5;
  v17 = a6;
  v22.receiver = self;
  v22.super_class = (Class)CVAPortraitRequest_StageLight;
  v18 = -[CVAPortraitRequest_StageLight init](&v22, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_mattingRequest, a3);
    v19->_destinationColorPixelBuffer = a4;
    CVPixelBufferRetain(a4);
    objc_storeStrong((id *)&v19->_proxyCubeData, a5);
    objc_storeStrong((id *)&v19->_cubeData, a6);
    v19->_vignetteIntensity = a7;
    v19->_stageLightIntensity = a8;
    v20 = v19;
  }

  return v19;
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(self->_destinationColorPixelBuffer);
  v3.receiver = self;
  v3.super_class = (Class)CVAPortraitRequest_StageLight;
  -[CVAPortraitRequest_StageLight dealloc](&v3, sel_dealloc);
}

- (CVAMattingRequest)mattingRequest
{
  return (CVAMattingRequest *)objc_getProperty(self, a2, 16, 1);
}

- (__CVBuffer)destinationColorPixelBuffer
{
  return self->_destinationColorPixelBuffer;
}

- (NSData)proxyCubeData
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (NSData)cubeData
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (float)vignetteIntensity
{
  return self->_vignetteIntensity;
}

- (float)stageLightIntensity
{
  return self->_stageLightIntensity;
}

- (CVAPortraitGenericRequest)parentGenericRequestFrom
{
  return (CVAPortraitGenericRequest *)objc_getProperty(self, a2, 48, 1);
}

- (void)setParentGenericRequestFrom:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (CVAPortraitGenericRequest)parentGenericRequestTo
{
  return (CVAPortraitGenericRequest *)objc_getProperty(self, a2, 56, 1);
}

- (void)setParentGenericRequestTo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentGenericRequestTo, 0);
  objc_storeStrong((id *)&self->_parentGenericRequestFrom, 0);
  objc_storeStrong((id *)&self->_cubeData, 0);
  objc_storeStrong((id *)&self->_proxyCubeData, 0);
  objc_storeStrong((id *)&self->_mattingRequest, 0);
}

@end
