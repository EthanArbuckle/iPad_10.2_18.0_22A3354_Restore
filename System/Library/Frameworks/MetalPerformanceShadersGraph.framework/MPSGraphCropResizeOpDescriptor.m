@implementation MPSGraphCropResizeOpDescriptor

+ (id)descriptorWithResizeWidth:(unint64_t)a3 resizeHeight:(unint64_t)a4 normalizeCoordinates:(BOOL)a5 spatialScale:(float)a6 resizeMode:(unint64_t)a7 samplingMode:(unint64_t)a8 coordinateMode:(unint64_t)a9
{
  _BOOL8 v13;
  MPSGraphCropResizeOpDescriptor *v16;
  double v17;

  v13 = a5;
  v16 = objc_alloc_init(MPSGraphCropResizeOpDescriptor);
  -[MPSGraphCropResizeOpDescriptor setResizeWidth:](v16, "setResizeWidth:", a3);
  -[MPSGraphCropResizeOpDescriptor setResizeHeight:](v16, "setResizeHeight:", a4);
  -[MPSGraphCropResizeOpDescriptor setNormalizeCoordinates:](v16, "setNormalizeCoordinates:", v13);
  *(float *)&v17 = a6;
  -[MPSGraphCropResizeOpDescriptor setSpatialScale:](v16, "setSpatialScale:", v17);
  -[MPSGraphCropResizeOpDescriptor setResizeMode:](v16, "setResizeMode:", a7);
  -[MPSGraphCropResizeOpDescriptor setSamplingMode:](v16, "setSamplingMode:", a8);
  -[MPSGraphCropResizeOpDescriptor setCoordinateMode:](v16, "setCoordinateMode:", a9);
  return v16;
}

+ (id)descriptorWithResizeWidth:(unint64_t)a3 resizeHeight:(unint64_t)a4
{
  MPSGraphCropResizeOpDescriptor *v6;
  double v7;

  v6 = objc_alloc_init(MPSGraphCropResizeOpDescriptor);
  -[MPSGraphCropResizeOpDescriptor setResizeWidth:](v6, "setResizeWidth:", a3);
  -[MPSGraphCropResizeOpDescriptor setResizeHeight:](v6, "setResizeHeight:", a4);
  -[MPSGraphCropResizeOpDescriptor setNormalizeCoordinates:](v6, "setNormalizeCoordinates:", 1);
  LODWORD(v7) = 1.0;
  -[MPSGraphCropResizeOpDescriptor setSpatialScale:](v6, "setSpatialScale:", v7);
  -[MPSGraphCropResizeOpDescriptor setResizeMode:](v6, "setResizeMode:", 1);
  -[MPSGraphCropResizeOpDescriptor setSamplingMode:](v6, "setSamplingMode:", 1);
  -[MPSGraphCropResizeOpDescriptor setCoordinateMode:](v6, "setCoordinateMode:", 0);
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MPSGraphCropResizeOpDescriptor *v4;
  double v5;

  v4 = [MPSGraphCropResizeOpDescriptor alloc];
  -[MPSGraphCropResizeOpDescriptor setResizeWidth:](v4, "setResizeWidth:", self->_resizeWidth);
  -[MPSGraphCropResizeOpDescriptor setResizeHeight:](v4, "setResizeHeight:", self->_resizeHeight);
  -[MPSGraphCropResizeOpDescriptor setNormalizeCoordinates:](v4, "setNormalizeCoordinates:", self->_normalizeCoordinates);
  *(float *)&v5 = self->_spatialScale;
  -[MPSGraphCropResizeOpDescriptor setSpatialScale:](v4, "setSpatialScale:", v5);
  -[MPSGraphCropResizeOpDescriptor setResizeMode:](v4, "setResizeMode:", self->_resizeMode);
  -[MPSGraphCropResizeOpDescriptor setSamplingMode:](v4, "setSamplingMode:", self->_samplingMode);
  -[MPSGraphCropResizeOpDescriptor setCoordinateMode:](v4, "setCoordinateMode:", self->_coordinateMode);
  -[MPSGraphCropResizeOpDescriptor setResizeWidth:](v4, "setResizeWidth:", self->_resizeWidth);
  return v4;
}

- (unint64_t)resizeWidth
{
  return self->_resizeWidth;
}

- (void)setResizeWidth:(unint64_t)a3
{
  self->_resizeWidth = a3;
}

- (unint64_t)resizeHeight
{
  return self->_resizeHeight;
}

- (void)setResizeHeight:(unint64_t)a3
{
  self->_resizeHeight = a3;
}

- (BOOL)normalizeCoordinates
{
  return self->_normalizeCoordinates;
}

- (void)setNormalizeCoordinates:(BOOL)a3
{
  self->_normalizeCoordinates = a3;
}

- (float)spatialScale
{
  return self->_spatialScale;
}

- (void)setSpatialScale:(float)a3
{
  self->_spatialScale = a3;
}

- (unint64_t)resizeMode
{
  return self->_resizeMode;
}

- (void)setResizeMode:(unint64_t)a3
{
  self->_resizeMode = a3;
}

- (unint64_t)samplingMode
{
  return self->_samplingMode;
}

- (void)setSamplingMode:(unint64_t)a3
{
  self->_samplingMode = a3;
}

- (unint64_t)coordinateMode
{
  return self->_coordinateMode;
}

- (void)setCoordinateMode:(unint64_t)a3
{
  self->_coordinateMode = a3;
}

@end
