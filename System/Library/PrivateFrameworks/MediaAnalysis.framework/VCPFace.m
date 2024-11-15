@implementation VCPFace

- (VCPFace)init
{
  VCPFace *result;
  CGSize v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VCPFace;
  result = -[VCPFace init](&v4, sel_init);
  if (result)
  {
    result->_smile = 0;
    *(_WORD *)&result->_leftEyeClosed = 0;
    result->_yaw = 2;
    result->_trackID = 0;
    v3 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    result->_torsoBounds.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    result->_torsoBounds.size = v3;
  }
  return result;
}

- (unint64_t)flagsForOrientation:(BOOL)a3 width:(unint64_t)a4 height:(unint64_t)a5
{
  unint64_t v5;
  uint64_t v6;

  v5 = 2 * self->_smile;
  if (self->_leftEyeClosed)
  {
    if (self->_rightEyeClosed)
    {
      v5 |= 4uLL;
      goto LABEL_6;
    }
  }
  else if (!self->_rightEyeClosed)
  {
    goto LABEL_6;
  }
  v5 |= 8uLL;
LABEL_6:
  v6 = 56;
  if (a3)
    v6 = 64;
  else
    a5 = a4;
  if (*(double *)((char *)&self->super.isa + v6) / (double)a5 >= 0.449999988)
    return v5 | 0x10;
  else
    return v5;
}

- (CGRect)faceBounds:(unint64_t)a3 height:(unint64_t)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  v4 = self->_bounds.origin.x / (double)a3;
  v5 = self->_bounds.size.width / (double)a3;
  v6 = self->_bounds.origin.y / (double)a4;
  v7 = self->_bounds.size.height / (double)a4;
  result.size.height = v7;
  result.size.width = v5;
  result.origin.y = v6;
  result.origin.x = v4;
  return result;
}

- (CGRect)faceBoundsWithTransform:(unint64_t)a3 height:(unint64_t)a4 transform:(CGAffineTransform *)a5
{
  __int128 v6;
  CGAffineTransform v7;
  CGRect v8;

  -[VCPFace faceBounds:height:](self, "faceBounds:height:", a3, a4);
  v6 = *(_OWORD *)&a5->c;
  *(_OWORD *)&v7.a = *(_OWORD *)&a5->a;
  *(_OWORD *)&v7.c = v6;
  *(_OWORD *)&v7.tx = *(_OWORD *)&a5->tx;
  return CGRectApplyAffineTransform(v8, &v7);
}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_bounds, 32, 1, 0);
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

- (void)setBounds:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->_bounds, &v3, 32, 1, 0);
}

- (CGRect)torsoBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_torsoBounds, 32, 1, 0);
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

- (void)setTorsoBounds:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->_torsoBounds, &v3, 32, 1, 0);
}

- (BOOL)leftEyeClosed
{
  return self->_leftEyeClosed;
}

- (void)setLeftEyeClosed:(BOOL)a3
{
  self->_leftEyeClosed = a3;
}

- (BOOL)rightEyeClosed
{
  return self->_rightEyeClosed;
}

- (void)setRightEyeClosed:(BOOL)a3
{
  self->_rightEyeClosed = a3;
}

- (BOOL)smile
{
  return self->_smile;
}

- (void)setSmile:(BOOL)a3
{
  self->_smile = a3;
}

- (int64_t)yaw
{
  return self->_yaw;
}

- (void)setYaw:(int64_t)a3
{
  self->_yaw = a3;
}

- (int)trackID
{
  return self->_trackID;
}

- (void)setTrackID:(int)a3
{
  self->_trackID = a3;
}

- (float)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(float)a3
{
  self->_confidence = a3;
}

- (float)faceQuality
{
  return self->_faceQuality;
}

- (void)setFaceQuality:(float)a3
{
  self->_faceQuality = a3;
}

- (VNFaceObservation)observation
{
  return (VNFaceObservation *)objc_getProperty(self, a2, 32, 1);
}

- (void)setObservation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observation, 0);
}

@end
