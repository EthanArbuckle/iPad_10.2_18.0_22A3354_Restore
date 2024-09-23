@implementation ARCV3DPlaneDetectionSingleShotPlaneList

- (ARCV3DPlaneDetectionSingleShotPlaneList)initWithDetectionResult:(CV3DPlaneDetectionSingleShotPlaneList *)a3
{
  ARCV3DPlaneDetectionSingleShotPlaneList *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ARCV3DPlaneDetectionSingleShotPlaneList;
  v4 = -[ARCV3DPlaneDetectionSingleShotPlaneList init](&v6, sel_init);
  if (v4)
  {
    CV3DPlaneDetectionSingleShotPlaneListRetain();
    v4->_cv3dPlaneDetections = a3;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  CV3DPlaneDetectionSingleShotPlaneListRelease();
  v3.receiver = self;
  v3.super_class = (Class)ARCV3DPlaneDetectionSingleShotPlaneList;
  -[ARCV3DPlaneDetectionSingleShotPlaneList dealloc](&v3, sel_dealloc);
}

- (CV3DPlaneDetectionSingleShotPlaneList)cv3dPlaneDetections
{
  return self->_cv3dPlaneDetections;
}

@end
