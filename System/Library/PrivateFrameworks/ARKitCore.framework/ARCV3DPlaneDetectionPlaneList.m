@implementation ARCV3DPlaneDetectionPlaneList

- (ARCV3DPlaneDetectionPlaneList)initWithDetectionResult:(CV3DPlaneDetectionPlaneList *)a3
{
  ARCV3DPlaneDetectionPlaneList *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ARCV3DPlaneDetectionPlaneList;
  v4 = -[ARCV3DPlaneDetectionPlaneList init](&v6, sel_init);
  if (v4)
  {
    CV3DPlaneDetectionPlaneListRetain();
    v4->_cv3dPlaneDetections = a3;
  }
  return v4;
}

- (unint64_t)numberOfPlanes
{
  return CV3DPlaneDetectionPlaneListLength();
}

- (CV3DPlaneDetectionPlane)planeAtIndex:(unint64_t)a3
{
  return (CV3DPlaneDetectionPlane *)CV3DPlaneDetectionPlaneAtIndex();
}

- (void)dealloc
{
  objc_super v3;

  CV3DPlaneDetectionPlaneListRelease();
  v3.receiver = self;
  v3.super_class = (Class)ARCV3DPlaneDetectionPlaneList;
  -[ARCV3DPlaneDetectionPlaneList dealloc](&v3, sel_dealloc);
}

- (CV3DPlaneDetectionPlaneList)cv3dPlaneDetections
{
  return self->_cv3dPlaneDetections;
}

@end
