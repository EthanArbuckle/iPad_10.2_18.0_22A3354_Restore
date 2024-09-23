@implementation VNTrajectoryRequestState

- (VNTrajectoryRequestState)init
{
  objc_super v3;

  self->_targetImageDimensionForContourDetection = 320;
  v3.receiver = self;
  v3.super_class = (Class)VNTrajectoryRequestState;
  return -[VNTrajectoryRequestState init](&v3, sel_init);
}

- (unint64_t)targetImageDimensionForContourDetection
{
  return self->_targetImageDimensionForContourDetection;
}

- (void)setTargetImageDimensionForContourDetection:(unint64_t)a3
{
  self->_targetImageDimensionForContourDetection = a3;
}

@end
