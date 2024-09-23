@implementation CIBurstFaceConfigEntry

- (CIBurstFaceConfigEntry)initWithRect:(CGRect)a3 withFaceId:(int)a4
{
  self->faceRect = a3;
  self->faceId = a4;
  self->framesSinceLast = 0;
  return self;
}

- (int)faceId
{
  return self->faceId;
}

- (void)setFaceId:(int)a3
{
  self->faceId = a3;
}

- (CGRect)faceRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->faceRect, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFaceRect:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->faceRect, &v3, 32, 1, 0);
}

- (int)framesSinceLast
{
  return self->framesSinceLast;
}

- (void)setFramesSinceLast:(int)a3
{
  self->framesSinceLast = a3;
}

@end
