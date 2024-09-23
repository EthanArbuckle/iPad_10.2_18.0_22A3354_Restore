@implementation VNNOPRequestConfiguration

- (VNNOPRequestConfiguration)initWithRequestClass:(Class)a3
{
  VNNOPRequestConfiguration *v3;
  VNSizeRange *v4;
  VNSupportedImageSize *v5;
  VNSupportedImageSize *detectorPreferredImageSize;
  VNNOPRequestConfiguration *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VNNOPRequestConfiguration;
  v3 = -[VNImageBasedRequestConfiguration initWithRequestClass:](&v9, sel_initWithRequestClass_, a3);
  if (v3)
  {
    v4 = -[VNSizeRange initWithMinimumDimension:maximumDimension:idealDimension:]([VNSizeRange alloc], "initWithMinimumDimension:maximumDimension:idealDimension:", 299, 299, 299);
    v5 = -[VNSupportedImageSize initWithIdealFormat:pixelsWideRange:pixelsHighRange:aspectRatioHandling:idealOrientation:orientationAgnostic:]([VNSupportedImageSize alloc], "initWithIdealFormat:pixelsWideRange:pixelsHighRange:aspectRatioHandling:idealOrientation:orientationAgnostic:", 1111970369, v4, v4, 0, 1, 1);

    detectorPreferredImageSize = v3->_detectorPreferredImageSize;
    v3->_detectorPreferredImageSize = v5;

    v3->_detectorWantsAnisotropicScaling = 1;
    v7 = v3;
  }

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNNOPRequestConfiguration;
  v4 = -[VNImageBasedRequestConfiguration copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setDetectorPreferredImageSize:", self->_detectorPreferredImageSize);
    objc_msgSend(v5, "setDetectorWantsAnisotropicScaling:", self->_detectorWantsAnisotropicScaling);
    objc_msgSend(v5, "setDetectorExecutionTimeInterval:", self->_detectorExecutionTimeInterval);
  }
  return v5;
}

- (VNSupportedImageSize)detectorPreferredImageSize
{
  return self->_detectorPreferredImageSize;
}

- (void)setDetectorPreferredImageSize:(id)a3
{
  objc_storeStrong((id *)&self->_detectorPreferredImageSize, a3);
}

- (BOOL)detectorWantsAnisotropicScaling
{
  return self->_detectorWantsAnisotropicScaling;
}

- (void)setDetectorWantsAnisotropicScaling:(BOOL)a3
{
  self->_detectorWantsAnisotropicScaling = a3;
}

- (double)detectorExecutionTimeInterval
{
  return self->_detectorExecutionTimeInterval;
}

- (void)setDetectorExecutionTimeInterval:(double)a3
{
  self->_detectorExecutionTimeInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectorPreferredImageSize, 0);
}

@end
