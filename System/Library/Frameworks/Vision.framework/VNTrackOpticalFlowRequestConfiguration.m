@implementation VNTrackOpticalFlowRequestConfiguration

- (VNTrackOpticalFlowRequestConfiguration)initWithRequestClass:(Class)a3
{
  VNTrackOpticalFlowRequestConfiguration *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VNTrackOpticalFlowRequestConfiguration;
  result = -[VNStatefulRequestConfiguration initWithRequestClass:](&v4, sel_initWithRequestClass_, a3);
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
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNTrackOpticalFlowRequestConfiguration;
  v4 = -[VNStatefulRequestConfiguration copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setComputationAccuracy:", self->_computationAccuracy);
    objc_msgSend(v5, "setOutputPixelFormat:", self->_outputPixelFormat);
    objc_msgSend(v5, "setKeepNetworkOutput:", self->_keepNetworkOutput);
  }
  return v5;
}

- (unint64_t)computationAccuracy
{
  return self->_computationAccuracy;
}

- (void)setComputationAccuracy:(unint64_t)a3
{
  self->_computationAccuracy = a3;
}

- (unsigned)outputPixelFormat
{
  return self->_outputPixelFormat;
}

- (void)setOutputPixelFormat:(unsigned int)a3
{
  self->_outputPixelFormat = a3;
}

- (BOOL)keepNetworkOutput
{
  return self->_keepNetworkOutput;
}

- (void)setKeepNetworkOutput:(BOOL)a3
{
  self->_keepNetworkOutput = a3;
}

@end
