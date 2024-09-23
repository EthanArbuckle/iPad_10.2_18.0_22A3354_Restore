@implementation ADPolynomialsLensDistortionModel

- (void)crop:(CGRect)a3 fromDimensions:(CGSize)a4
{
  CGFloat v4;

  v4 = self->_distortionCenter.y - a3.origin.y;
  self->_distortionCenter.x = self->_distortionCenter.x - a3.origin.x;
  self->_distortionCenter.y = v4;
}

- (void)scale:(float)a3
{
  self->_distortionCenter = (CGPoint)vmulq_n_f64((float64x2_t)self->_distortionCenter, a3);
}

- (void)adjustForImageRotation:(int64_t)a3 forDimensions:(CGSize)a4
{
  CGFloat v5;

  self->_distortionCenter.x = rotateUVPoint(a3, self->_distortionCenter.x, self->_distortionCenter.y, a4.width, a4.height);
  self->_distortionCenter.y = v5;
}

- (BOOL)isEqual:(id)a3
{
  ADPolynomialsLensDistortionModel *v4;
  ADPolynomialsLensDistortionModel *v5;
  ADPolynomialsLensDistortionModel *v6;
  double y;
  double x;
  double v9;
  BOOL v10;
  double v11;

  v4 = (ADPolynomialsLensDistortionModel *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_8;
  if (self == v4)
  {
    v10 = 1;
    goto LABEL_10;
  }
  if ((-[ADPolynomialsLensDistortionModel isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v6 = v5;
    x = self->_distortionCenter.x;
    y = self->_distortionCenter.y;
    -[ADPolynomialsLensDistortionModel distortionCenter](v6, "distortionCenter");
    v10 = 0;
    if (x == v11 && y == v9)
      v10 = +[ADPolynomialsLensDistortionModel isEqualPolynomials:otherPolynomials:](ADPolynomialsLensDistortionModel, "isEqualPolynomials:otherPolynomials:", &self->_polynomials, -[ADPolynomialsLensDistortionModel distortionPolynomials](v6, "distortionPolynomials"));

  }
  else
  {
LABEL_8:
    v10 = 0;
  }
LABEL_10:

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_distortionCenter.x);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_distortionCenter.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ (2 * objc_msgSend(v5, "hash"));

  return v6 ^ (3
             * +[ADPolynomialsLensDistortionModel hashPolynomials:](ADPolynomialsLensDistortionModel, "hashPolynomials:", &self->_polynomials));
}

- (const)distortionPolynomials
{
  return &self->_polynomials;
}

- (void)setDistortionPolynomials:(const ADDistortionPolynomials *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  id v6;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("distortionPolynomials cannot be nil"), 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  v3 = *(_OWORD *)a3->forwardOrders;
  v4 = *(_OWORD *)&a3->forwardOrders[4];
  v5 = *(_OWORD *)a3->inverseOrders;
  *(_OWORD *)&self->_polynomials.inverseOrders[4] = *(_OWORD *)&a3->inverseOrders[4];
  *(_OWORD *)self->_polynomials.inverseOrders = v5;
  *(_OWORD *)&self->_polynomials.forwardOrders[4] = v4;
  *(_OWORD *)self->_polynomials.forwardOrders = v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[ADPolynomialsLensDistortionModel initWithDistortionCenter:andPolynomials:]([ADPolynomialsLensDistortionModel alloc], "initWithDistortionCenter:andPolynomials:", &self->_polynomials, self->_distortionCenter.x, self->_distortionCenter.y);
}

- (ADPolynomialsLensDistortionModel)initWithDistortionCenter:(CGPoint)a3 andPolynomials:(const ADDistortionPolynomials *)a4
{
  CGFloat y;
  CGFloat x;
  ADPolynomialsLensDistortionModel *result;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  id v11;
  objc_super v12;

  if (!a4)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("distortionPolynomials cannot be nil"), 0, a3.x, a3.y);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v11);
  }
  y = a3.y;
  x = a3.x;
  v12.receiver = self;
  v12.super_class = (Class)ADPolynomialsLensDistortionModel;
  result = -[ADPolynomialsLensDistortionModel init](&v12, sel_init);
  if (result)
  {
    result->_distortionCenter.x = x;
    result->_distortionCenter.y = y;
    v8 = *(_OWORD *)a4->forwardOrders;
    v9 = *(_OWORD *)&a4->forwardOrders[4];
    v10 = *(_OWORD *)a4->inverseOrders;
    *(_OWORD *)&result->_polynomials.inverseOrders[4] = *(_OWORD *)&a4->inverseOrders[4];
    *(_OWORD *)result->_polynomials.inverseOrders = v10;
    *(_OWORD *)&result->_polynomials.forwardOrders[4] = v9;
    *(_OWORD *)result->_polynomials.forwardOrders = v8;
  }
  return result;
}

- (double)getMaxDistortedRadius:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  double v6;

  v3 = a3.width * 0.5;
  v4 = a3.height * 0.5;
  v5 = vabdd_f64(self->_distortionCenter.x, v3);
  v6 = vabdd_f64(self->_distortionCenter.y, v4);
  return sqrt((v4 + v6) * (v4 + v6) + (v3 + v5) * (v3 + v5));
}

- (void)distortPixels:(unint64_t)a3 undistortedPixels:(const CGPoint *)a4 withPixelSize:(float)a5 referenceDimensions:(CGSize)a6 outDistortedPixels:(CGPoint *)a7
{
  CGFloat x;
  double y;
  double v14;
  double v15;
  float64x2_t v16;
  CGPoint v17;
  CGPoint v18;
  CGPoint v19;

  -[ADPolynomialsLensDistortionModel getMaxDistortedRadius:](self, "getMaxDistortedRadius:", a6.width, a6.height);
  x = self->_distortionCenter.x;
  y = self->_distortionCenter.y;
  v17.x = x;
  v17.y = v14 + y;
  v15 = a5;
  v18.x = x;
  v18.y = y;
  applyDistortionCoefficients(1, (float64x2_t *)&v17, v15, v18, v14 + v14, self->_polynomials.forwardOrders, &v16);
  v19.x = x;
  v19.y = y;
  applyDistortionCoefficients(a3, (float64x2_t *)a4, v15, v19, v16.f64[1] - y, self->_polynomials.inverseOrders, (float64x2_t *)a7);
}

- (void)distortPixels:(unint64_t)a3 undistortedPixels:(const CGPoint *)a4 withCameraCalibration:(id)a5 outDistortedPixels:(CGPoint *)a6
{
  int v10;
  int v11;
  double v12;
  double v13;
  double v14;
  id v15;

  v15 = a5;
  objc_msgSend(v15, "pixelSize");
  v11 = v10;
  objc_msgSend(v15, "referenceDimensions");
  v13 = v12;
  LODWORD(v12) = v11;
  -[ADPolynomialsLensDistortionModel distortPixels:undistortedPixels:withPixelSize:referenceDimensions:outDistortedPixels:](self, "distortPixels:undistortedPixels:withPixelSize:referenceDimensions:outDistortedPixels:", a3, a4, a6, v12, v13, v14);

}

- (void)undistortPixels:(unint64_t)a3 distortedPixels:(const CGPoint *)a4 withPixelSize:(float)a5 referenceDimensions:(CGSize)a6 outUndistortedPixels:(CGPoint *)a7
{
  double v12;

  -[ADPolynomialsLensDistortionModel getMaxDistortedRadius:](self, "getMaxDistortedRadius:", a6.width, a6.height);
  applyDistortionCoefficients(a3, (float64x2_t *)a4, a5, self->_distortionCenter, v12, self->_polynomials.forwardOrders, (float64x2_t *)a7);
}

- (void)undistortPixels:(unint64_t)a3 distortedPixels:(const CGPoint *)a4 withCameraCalibration:(id)a5 outUndistortedPixels:(CGPoint *)a6
{
  int v10;
  int v11;
  double v12;
  double v13;
  double v14;
  id v15;

  v15 = a5;
  objc_msgSend(v15, "pixelSize");
  v11 = v10;
  objc_msgSend(v15, "referenceDimensions");
  v13 = v12;
  LODWORD(v12) = v11;
  -[ADPolynomialsLensDistortionModel undistortPixels:distortedPixels:withPixelSize:referenceDimensions:outUndistortedPixels:](self, "undistortPixels:distortedPixels:withPixelSize:referenceDimensions:outUndistortedPixels:", a3, a4, a6, v12, v13, v14);

}

- (ADPolynomialsLensDistortionModel)initWithDictionary:(id)a3
{
  NSDictionary *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  ADPolynomialsLensDistortionModel *v18;
  _DWORD v20[16];

  v4 = (NSDictionary *)a3;
  if (getDistortionCenterFromDictionary(v4, &self->_distortionCenter))
  {
    -[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("gdcPolynomials"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("forwardOrders"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7 && objc_msgSend(v7, "count") == 8)
      {
        v9 = 0;
        while (1)
        {
          objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10;
          if (!v10)
            break;
          objc_msgSend(v10, "floatValue");
          v20[v9] = v12;

          if (++v9 == 8)
          {
            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("inverseOrders"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v8, "count") == 8)
            {
              v14 = 0;
              while (1)
              {
                objc_msgSend(v13, "objectAtIndexedSubscript:", v14);
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                v16 = v15;
                if (!v15)
                  break;
                objc_msgSend(v15, "floatValue");
                v20[v14 + 8] = v17;

                if (++v14 == 8)
                {
                  self = -[ADPolynomialsLensDistortionModel initWithDistortionCenter:andPolynomials:](self, "initWithDistortionCenter:andPolynomials:", v20, self->_distortionCenter.x, self->_distortionCenter.y);
                  v18 = self;
                  goto LABEL_20;
                }
              }
            }
            v18 = 0;
LABEL_20:

            goto LABEL_15;
          }
        }
      }
      v18 = 0;
LABEL_15:

    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)dictionaryRepresentation:(BOOL)a3
{
  void *v4;
  CFDictionaryRef DictionaryRepresentation;
  void *v6;
  void *v7;
  const ADDistortionPolynomials *v8;
  double v9;
  uint64_t i;
  void *v11;
  void *v12;
  double v13;
  uint64_t v14;
  float *inverseOrders;
  void *v16;

  v4 = (void *)objc_opt_new();
  DictionaryRepresentation = CGPointCreateDictionaryRepresentation(self->_distortionCenter);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", DictionaryRepresentation, CFSTR("lensDistortionCenter"));

  v6 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ADPolynomialsLensDistortionModel distortionPolynomials](self, "distortionPolynomials");
  for (i = 0; i != 8; ++i)
  {
    *(float *)&v9 = v8->forwardOrders[i];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v11);

  }
  v12 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("forwardOrders"));

  objc_msgSend(v7, "removeAllObjects");
  v14 = 0;
  inverseOrders = v8->inverseOrders;
  do
  {
    *(float *)&v13 = inverseOrders[v14];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v16);

    ++v14;
  }
  while (v14 != 8);
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("inverseOrders"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("gdcPolynomials"));

  return v4;
}

- (CGPoint)distortionCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_distortionCenter.x;
  y = self->_distortionCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setDistortionCenter:(CGPoint)a3
{
  self->_distortionCenter = a3;
}

+ (BOOL)isEqualPolynomials:(const ADDistortionPolynomials *)a3 otherPolynomials:(const ADDistortionPolynomials *)a4
{
  BOOL v4;
  unint64_t v6;
  float *inverseOrders;
  float *v8;
  float v9;
  float v10;

  if (a3->forwardOrders[0] == a4->forwardOrders[0])
  {
    v6 = 0;
    v4 = 0;
    inverseOrders = a4->inverseOrders;
    v8 = a3->inverseOrders;
    do
    {
      if (*v8 != *inverseOrders)
        break;
      v4 = v6 > 6;
      if (v6 == 7)
        break;
      v9 = *(v8 - 7);
      v10 = *(inverseOrders - 7);
      ++inverseOrders;
      ++v8;
      ++v6;
    }
    while (v9 == v10);
  }
  else
  {
    return 0;
  }
  return v4;
}

+ (unint64_t)hashPolynomials:(const ADDistortionPolynomials *)a3
{
  double v3;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  double v9;
  void *v10;

  v5 = 0;
  v6 = 0;
  do
  {
    *(float *)&v3 = a3->forwardOrders[v5];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hash");

    *(float *)&v9 = a3->inverseOrders[v5];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v6 ^= (v8 * (v5 + 1)) ^ (objc_msgSend(v10, "hash") * (v5 + 9));

    ++v5;
  }
  while (v5 != 8);
  return v6;
}

@end
