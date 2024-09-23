@implementation ADRefinedPolynomialsLensDistortionModel

- (BOOL)isEqual:(id)a3
{
  ADRefinedPolynomialsLensDistortionModel *v4;
  ADRefinedPolynomialsLensDistortionModel *v5;
  ADRefinedPolynomialsLensDistortionModel *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;
  double v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float pixelSize;
  float v20;

  v4 = (ADRefinedPolynomialsLensDistortionModel *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_14;
  if (self == v4)
  {
    v12 = 1;
    goto LABEL_16;
  }
  if ((-[ADRefinedPolynomialsLensDistortionModel isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v6 = v5;
    -[ADPolynomialsLensDistortionModel distortionCenter](self, "distortionCenter");
    v8 = v7;
    v10 = v9;
    -[ADPolynomialsLensDistortionModel distortionCenter](v6, "distortionCenter");
    v12 = 0;
    if (v8 == v13 && v10 == v11)
    {
      v12 = 0;
      if (+[ADPolynomialsLensDistortionModel isEqualPolynomials:otherPolynomials:](ADPolynomialsLensDistortionModel, "isEqualPolynomials:otherPolynomials:", &self->super.super._polynomials, -[ADPolynomialsLensDistortionModel distortionPolynomials](v6, "distortionPolynomials")))
      {
        -[ADDynamicPolynomialsLensDistortionModel dynamicFactor](self, "dynamicFactor");
        v15 = v14;
        -[ADDynamicPolynomialsLensDistortionModel dynamicFactor](v6, "dynamicFactor");
        if (v15 == v16)
        {
          if (+[ADPolynomialsLensDistortionModel isEqualPolynomials:otherPolynomials:](ADPolynomialsLensDistortionModel, "isEqualPolynomials:otherPolynomials:", -[ADDynamicPolynomialsLensDistortionModel distortionPolynomialsBase](self, "distortionPolynomialsBase"), -[ADDynamicPolynomialsLensDistortionModel distortionPolynomialsBase](v6, "distortionPolynomialsBase")))
          {
            if (+[ADPolynomialsLensDistortionModel isEqualPolynomials:otherPolynomials:](ADPolynomialsLensDistortionModel, "isEqualPolynomials:otherPolynomials:", -[ADDynamicPolynomialsLensDistortionModel distortionPolynomialsDynamic](self, "distortionPolynomialsDynamic"), -[ADDynamicPolynomialsLensDistortionModel distortionPolynomialsDynamic](v6, "distortionPolynomialsDynamic")))
            {
              v17 = *(&self->super._dynamicFactor + 1);
              -[ADRefinedPolynomialsLensDistortionModel pixelSize](v6, "pixelSize");
              if (v17 == v18)
              {
                pixelSize = self->_pixelSize;
                -[ADRefinedPolynomialsLensDistortionModel focalLength](v6, "focalLength");
                if (pixelSize == v20)
                  v12 = 1;
              }
            }
          }
        }
      }
    }

  }
  else
  {
LABEL_14:
    v12 = 0;
  }
LABEL_16:

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3;
  double v4;
  void *v5;
  uint64_t v6;
  double v7;
  void *v8;
  unint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ADRefinedPolynomialsLensDistortionModel;
  v3 = -[ADDynamicPolynomialsLensDistortionModel hash](&v11, sel_hash);
  LODWORD(v4) = *((_DWORD *)&self->super._dynamicFactor + 1);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");

  *(float *)&v7 = self->_pixelSize;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v3 ^ (2 * v6) ^ (3 * objc_msgSend(v8, "hash"));

  return v9;
}

- (void)updateDynamicFactor
{
  double v2;
  objc_super v3;

  *(float *)&v2 = *(&self->super._dynamicFactor + 1) * self->_pixelSize;
  v3.receiver = self;
  v3.super_class = (Class)ADRefinedPolynomialsLensDistortionModel;
  -[ADDynamicPolynomialsLensDistortionModel setDynamicFactor:](&v3, sel_setDynamicFactor_, v2);
}

- (void)setPixelSize:(float)a3
{
  *(&self->super._dynamicFactor + 1) = a3;
  -[ADRefinedPolynomialsLensDistortionModel updateDynamicFactor](self, "updateDynamicFactor");
}

- (void)setFocalLength:(float)a3
{
  self->_pixelSize = a3;
  -[ADRefinedPolynomialsLensDistortionModel updateDynamicFactor](self, "updateDynamicFactor");
}

- (void)setDynamicFactor:(float)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ADRefinedPolynomialsLensDistortionModel;
  -[ADDynamicPolynomialsLensDistortionModel setDynamicFactor:](&v5, sel_setDynamicFactor_);
  *(&self->super._dynamicFactor + 1) = a3;
  self->_pixelSize = 1.0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ADRefinedPolynomialsLensDistortionModel *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  int v9;
  float pixelSize;
  const ADDistortionPolynomials *v11;
  const ADDistortionPolynomials *v12;
  double v13;
  double v14;

  v4 = [ADRefinedPolynomialsLensDistortionModel alloc];
  -[ADPolynomialsLensDistortionModel distortionCenter](self, "distortionCenter");
  v6 = v5;
  v8 = v7;
  v9 = *((_DWORD *)&self->super._dynamicFactor + 1);
  pixelSize = self->_pixelSize;
  v11 = -[ADDynamicPolynomialsLensDistortionModel distortionPolynomialsBase](self, "distortionPolynomialsBase");
  v12 = -[ADDynamicPolynomialsLensDistortionModel distortionPolynomialsDynamic](self, "distortionPolynomialsDynamic");
  LODWORD(v13) = v9;
  *(float *)&v14 = pixelSize;
  return -[ADRefinedPolynomialsLensDistortionModel initWithDistortionCenter:pixelSize:focalLength:polynomialsBase:polynomialsDynamic:](v4, "initWithDistortionCenter:pixelSize:focalLength:polynomialsBase:polynomialsDynamic:", v11, v12, v6, v8, v13, v14);
}

- (ADRefinedPolynomialsLensDistortionModel)initWithDistortionCenter:(CGPoint)a3 pixelSize:(float)a4 focalLength:(float)a5 polynomialsBase:(const ADDistortionPolynomials *)a6 polynomialsDynamic:(const ADDistortionPolynomials *)a7
{
  double v9;
  ADRefinedPolynomialsLensDistortionModel *result;
  id v11;
  objc_super v12;

  if (!a6 || !a7)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("distortion polynomials cannot be nil"), 0, a3.x, a3.y);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v11);
  }
  *(float *)&v9 = a4 * a5;
  v12.receiver = self;
  v12.super_class = (Class)ADRefinedPolynomialsLensDistortionModel;
  result = -[ADDynamicPolynomialsLensDistortionModel initWithDistortionCenter:dynFactor:polynomialsBase:polynomialsDynamic:](&v12, sel_initWithDistortionCenter_dynFactor_polynomialsBase_polynomialsDynamic_, a3.x, a3.y, v9);
  if (result)
  {
    result->_pixelSize = a5;
    *(&result->super._dynamicFactor + 1) = a4;
  }
  return result;
}

- (void)distortPixels:(unint64_t)a3 undistortedPixels:(const CGPoint *)a4 withCameraCalibration:(id)a5 outDistortedPixels:(CGPoint *)a6
{
  id v10;
  int v11;
  double v12;
  double v13;
  double v14;
  id v15;

  v10 = a5;
  v11 = *((_DWORD *)&self->super._dynamicFactor + 1);
  v15 = v10;
  objc_msgSend(v10, "referenceDimensions");
  v13 = v12;
  LODWORD(v12) = v11;
  -[ADPolynomialsLensDistortionModel distortPixels:undistortedPixels:withPixelSize:referenceDimensions:outDistortedPixels:](self, "distortPixels:undistortedPixels:withPixelSize:referenceDimensions:outDistortedPixels:", a3, a4, a6, v12, v13, v14);

}

- (void)undistortPixels:(unint64_t)a3 distortedPixels:(const CGPoint *)a4 withCameraCalibration:(id)a5 outUndistortedPixels:(CGPoint *)a6
{
  id v10;
  int v11;
  double v12;
  double v13;
  double v14;
  id v15;

  v10 = a5;
  v11 = *((_DWORD *)&self->super._dynamicFactor + 1);
  v15 = v10;
  objc_msgSend(v10, "referenceDimensions");
  v13 = v12;
  LODWORD(v12) = v11;
  -[ADPolynomialsLensDistortionModel undistortPixels:distortedPixels:withPixelSize:referenceDimensions:outUndistortedPixels:](self, "undistortPixels:distortedPixels:withPixelSize:referenceDimensions:outUndistortedPixels:", a3, a4, a6, v12, v13, v14);

}

- (float)pixelSize
{
  return *(&self->super._dynamicFactor + 1);
}

- (float)focalLength
{
  return self->_pixelSize;
}

@end
