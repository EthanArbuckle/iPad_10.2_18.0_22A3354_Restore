@implementation VNGenerateOpticalFlowRequestConfiguration

- (VNGenerateOpticalFlowRequestConfiguration)initWithRequestClass:(Class)a3
{
  VNGenerateOpticalFlowRequestConfiguration *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VNGenerateOpticalFlowRequestConfiguration;
  result = -[VNImageBasedRequestConfiguration initWithRequestClass:](&v4, sel_initWithRequestClass_, a3);
  if (result)
  {
    result->_computationAccuracy = 1;
    result->_outputPixelFormat = 843264102;
    result->_keepNetworkOutput = 0;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VNGenerateOpticalFlowRequestConfiguration;
  result = -[VNImageBasedRequestConfiguration copyWithZone:](&v5, sel_copyWithZone_, a3);
  if (result)
  {
    *((_QWORD *)result + 19) = self->_computationAccuracy;
    *((_DWORD *)result + 37) = self->_outputPixelFormat;
    *((_BYTE *)result + 144) = self->_keepNetworkOutput;
  }
  return result;
}

@end
