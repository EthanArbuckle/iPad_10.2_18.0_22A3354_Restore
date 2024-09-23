@implementation ADNilDistortionModel

- (BOOL)isEqual:(id)a3
{
  ADNilDistortionModel *v4;
  ADNilDistortionModel *v5;
  char v6;

  v4 = (ADNilDistortionModel *)a3;
  v5 = v4;
  v6 = 1;
  if (v4 && self != v4)
    v6 = -[ADNilDistortionModel isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class());

  return v6;
}

- (unint64_t)hash
{
  return 0;
}

- (void)distortPixels:(unint64_t)a3 undistortedPixels:(const CGPoint *)a4 withCameraCalibration:(id)a5 outDistortedPixels:(CGPoint *)a6
{
  memcpy(a6, a4, 16 * a3);
}

- (void)undistortPixels:(unint64_t)a3 distortedPixels:(const CGPoint *)a4 withCameraCalibration:(id)a5 outUndistortedPixels:(CGPoint *)a6
{
  memcpy(a6, a4, 16 * a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_opt_new();
}

- (ADNilDistortionModel)initWithDictionary:(id)a3
{
  ADNilDistortionModel *v4;

  v4 = (ADNilDistortionModel *)objc_opt_new();

  return v4;
}

- (id)dictionaryRepresentation:(BOOL)a3
{
  return 0;
}

@end
