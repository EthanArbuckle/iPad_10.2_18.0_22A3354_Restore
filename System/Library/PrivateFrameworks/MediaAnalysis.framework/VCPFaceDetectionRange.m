@implementation VCPFaceDetectionRange

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)start
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_start, 24, 1, 0);
  return result;
}

- (void)setStart:(id *)a3
{
  objc_copyStruct(&self->_start, a3, 24, 1, 0);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)last
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_last, 24, 1, 0);
  return result;
}

- (void)setLast:(id *)a3
{
  objc_copyStruct(&self->_last, a3, 24, 1, 0);
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
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

- (unint64_t)position
{
  return self->_position;
}

- (void)setPosition:(unint64_t)a3
{
  self->_position = a3;
}

- (unint64_t)faceID
{
  return self->_faceID;
}

- (void)setFaceID:(unint64_t)a3
{
  self->_faceID = a3;
}

@end
