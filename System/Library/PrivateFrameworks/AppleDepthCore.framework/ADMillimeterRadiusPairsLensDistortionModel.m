@implementation ADMillimeterRadiusPairsLensDistortionModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_undistortedRadii, 0);
  objc_storeStrong((id *)&self->_distortedRadii, 0);
}

- (ADMillimeterRadiusPairsLensDistortionModel)initWithDistortionCenter:(CGPoint)a3 distortedRadii:(id)a4 undistortedRadii:(id)a5
{
  CGFloat y;
  CGFloat x;
  id v10;
  id v11;
  void *v12;
  ADMillimeterRadiusPairsLensDistortionModel *v13;
  uint64_t v14;
  ADMillimeterRadiusPairsLensDistortionModel *v15;
  const __CFString *v17;
  id v18;
  uint8_t v19[16];
  objc_super v20;

  y = a3.y;
  x = a3.x;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (!v10)
  {
    v17 = CFSTR("distortedRadii cannot be nil");
    goto LABEL_13;
  }
  if (!v11)
  {
    v17 = CFSTR("undistortedRadii cannot be nil");
LABEL_13:
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v17, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  v20.receiver = self;
  v20.super_class = (Class)ADMillimeterRadiusPairsLensDistortionModel;
  v13 = -[ADMillimeterRadiusPairsLensDistortionModel init](&v20, sel_init);
  if (!v13)
  {
LABEL_6:
    v15 = v13;
    goto LABEL_10;
  }
  v14 = objc_msgSend(v10, "length");
  if (v14 == objc_msgSend(v12, "length"))
  {
    v13->_distortionCenter.x = x;
    v13->_distortionCenter.y = y;
    objc_storeStrong((id *)&v13->_distortedRadii, a4);
    objc_storeStrong((id *)&v13->_undistortedRadii, a5);
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v19 = 0;
    _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "ADMillimeterRadiusPairsLensDistortionModel: cannot init when distorted and undistorted radii are not with the same length", v19, 2u);
  }
  v15 = 0;
LABEL_10:

  return v15;
}

- (void)distortPixels:(unint64_t)a3 undistortedPixels:(const CGPoint *)a4 withCameraCalibration:(id)a5 outDistortedPixels:(CGPoint *)a6
{
  double v10;
  double v11;
  double v12;
  int v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;

  v18 = a5;
  objc_msgSend(v18, "intrinsicMatrix");
  v16 = v11;
  v17 = v10;
  v15 = v12;
  objc_msgSend(v18, "pixelSize");
  LODWORD(v14) = v13;
  -[ADMillimeterRadiusPairsLensDistortionModel applyDistortionModelToPixels:inPixels:intrinsicsMatrix:pixelSize:distort:outPixels:](self, "applyDistortionModelToPixels:inPixels:intrinsicsMatrix:pixelSize:distort:outPixels:", a3, a4, 1, a6, v17, v16, v15, v14);

}

- (void)undistortPixels:(unint64_t)a3 distortedPixels:(const CGPoint *)a4 withCameraCalibration:(id)a5 outUndistortedPixels:(CGPoint *)a6
{
  double v10;
  double v11;
  double v12;
  int v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;

  v18 = a5;
  objc_msgSend(v18, "intrinsicMatrix");
  v16 = v11;
  v17 = v10;
  v15 = v12;
  objc_msgSend(v18, "pixelSize");
  LODWORD(v14) = v13;
  -[ADMillimeterRadiusPairsLensDistortionModel applyDistortionModelToPixels:inPixels:intrinsicsMatrix:pixelSize:distort:outPixels:](self, "applyDistortionModelToPixels:inPixels:intrinsicsMatrix:pixelSize:distort:outPixels:", a3, a4, 0, a6, v17, v16, v15, v14);

}

- (float)applyDistortionModelToPixels:(double)a3 inPixels:(double)a4 intrinsicsMatrix:(float)a5 pixelSize:(uint64_t)a6 distort:(uint64_t)a7 outPixels:(const void *)a8
{
  id *v16;
  unint64_t v17;
  float *result;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  float v31;
  unint64_t v32;
  float *v33;
  unint64_t v34;
  float *v35;
  float *v36;
  float v37;
  double v38;
  double v39;
  double v40;
  double *v41;

  v16 = (id *)(a1 + 8);
  v17 = objc_msgSend(*(id *)(a1 + 8), "length");
  if (v17 <= 3)
    return (float *)memcpy(a10, a8, 16 * a7);
  v19 = v17;
  if (a9)
  {
    v20 = objc_msgSend(*(id *)(a1 + 16), "bytes");
  }
  else
  {
    v20 = objc_msgSend(*(id *)(a1 + 8), "bytes");
    v16 = (id *)(a1 + 16);
  }
  result = (float *)objc_msgSend(*v16, "bytes");
  if (a7)
  {
    v21 = 0;
    v22 = a5;
    v23 = ((unint64_t)v19 >> 2) - 1;
    do
    {
      v24 = *((float *)&a4 + 1);
      v25 = *(float *)&a4;
      if (a9)
      {
        v25 = *(double *)(a1 + 24);
        v24 = *(double *)(a1 + 32);
      }
      v26 = *((double *)a8 + 2 * v21 + 1) - v24;
      v27 = (*((double *)a8 + 2 * v21) - v25) * v22;
      v28 = v26 * v22;
      v29 = sqrt(v28 * v28 + v27 * v27);
      v30 = 1.0;
      if (v29 != 0.0)
      {
        v31 = *(float *)(v20 + 4 * v23);
        v32 = v19 >> 2;
        v33 = (float *)v20;
        if (v29 >= v31)
        {
          if (v31 != 0.0)
            v30 = (float)(result[v23] / v31);
        }
        else
        {
          do
          {
            v34 = v32 >> 1;
            v35 = &v33[v32 >> 1];
            v37 = *v35;
            v36 = v35 + 1;
            v32 += ~(v32 >> 1);
            if (v29 < v37)
              v32 = v34;
            else
              v33 = v36;
          }
          while (v32);
          v30 = (*(float *)((char *)v33 + (_QWORD)result - v20 - 4)
               + (float)((float)(*(float *)((char *)v33 + (_QWORD)result - v20)
                               - *(float *)((char *)v33 + (_QWORD)result - v20 - 4))
                       / (float)(*v33 - *(v33 - 1)))
               * (v29 - *(v33 - 1)))
              / v29;
        }
      }
      v38 = v28 * v30 / v22;
      if (a9)
      {
        v39 = v38 + *((float *)&a4 + 1);
        v40 = *(float *)&a4;
      }
      else
      {
        v40 = *(double *)(a1 + 24);
        v39 = v38 + *(double *)(a1 + 32);
      }
      v41 = (double *)&a10[16 * v21];
      *v41 = v27 * v30 / v22 + v40;
      v41[1] = v39;
      ++v21;
    }
    while (v21 != a7);
  }
  return result;
}

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
  ADMillimeterRadiusPairsLensDistortionModel *v4;
  ADMillimeterRadiusPairsLensDistortionModel *v5;
  ADMillimeterRadiusPairsLensDistortionModel *v6;
  double y;
  double x;
  double v9;
  int v10;
  double v11;
  NSData *distortedRadii;
  void *v13;
  NSData *undistortedRadii;
  void *v15;
  char v16;

  v4 = (ADMillimeterRadiusPairsLensDistortionModel *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_8;
  if (self == v4)
  {
    v16 = 1;
    goto LABEL_13;
  }
  if ((-[ADMillimeterRadiusPairsLensDistortionModel isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v6 = v5;
    x = self->_distortionCenter.x;
    y = self->_distortionCenter.y;
    -[ADMillimeterRadiusPairsLensDistortionModel distortionCenter](v6, "distortionCenter");
    LOBYTE(v10) = 1;
    if (x == v11 && y == v9)
    {
      distortedRadii = self->_distortedRadii;
      -[ADMillimeterRadiusPairsLensDistortionModel distortedRadii](v6, "distortedRadii");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSData isEqualToData:](distortedRadii, "isEqualToData:", v13))
      {
        undistortedRadii = self->_undistortedRadii;
        -[ADMillimeterRadiusPairsLensDistortionModel undistortedRadii](v6, "undistortedRadii");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = !-[NSData isEqualToData:](undistortedRadii, "isEqualToData:", v15);

      }
      else
      {
        LOBYTE(v10) = 1;
      }

    }
    v16 = v10 ^ 1;

  }
  else
  {
LABEL_8:
    v16 = 0;
  }
LABEL_13:

  return v16;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_distortionCenter.x);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_distortionCenter.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ (2 * objc_msgSend(v5, "hash"));

  v7 = v6 ^ (3 * -[NSData hash](self->_distortedRadii, "hash"));
  return v7 ^ (4 * -[NSData hash](self->_undistortedRadii, "hash"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  ADMillimeterRadiusPairsLensDistortionModel *v4;
  double x;
  double y;
  void *v7;
  void *v8;
  ADMillimeterRadiusPairsLensDistortionModel *v9;

  v4 = [ADMillimeterRadiusPairsLensDistortionModel alloc];
  x = self->_distortionCenter.x;
  y = self->_distortionCenter.y;
  v7 = (void *)-[NSData copy](self->_distortedRadii, "copy");
  v8 = (void *)-[NSData copy](self->_undistortedRadii, "copy");
  v9 = -[ADMillimeterRadiusPairsLensDistortionModel initWithDistortionCenter:distortedRadii:undistortedRadii:](v4, "initWithDistortionCenter:distortedRadii:undistortedRadii:", v7, v8, x, y);

  return v9;
}

- (ADMillimeterRadiusPairsLensDistortionModel)initWithDictionary:(id)a3
{
  NSDictionary *v4;
  objc_object *v5;
  void *v6;
  objc_object *v7;
  ADMillimeterRadiusPairsLensDistortionModel *v8;
  objc_object *v9;
  void *v10;
  objc_object *v11;

  v4 = (NSDictionary *)a3;
  if (getDistortionCenterFromDictionary(v4, &self->_distortionCenter))
  {
    -[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("distortedRadii"));
    v5 = (objc_object *)objc_claimAutoreleasedReturnValue();
    getTableAsNSData(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if ((v6
       || (-[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("lensDistortionLookupTable")),
           v7 = (objc_object *)objc_claimAutoreleasedReturnValue(),
           getTableAsNSData(v7),
           v6 = (void *)objc_claimAutoreleasedReturnValue(),
           v7,
           v6))
      && (objc_msgSend(v6, "length") & 3) == 0)
    {
      -[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("undistortedRadii"));
      v9 = (objc_object *)objc_claimAutoreleasedReturnValue();
      getTableAsNSData(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if ((v10
         || (-[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("inverseLensDistortionLookupTable")), v11 = (objc_object *)objc_claimAutoreleasedReturnValue(), getTableAsNSData(v11), v10 = (void *)objc_claimAutoreleasedReturnValue(), v11, v10))&& (objc_msgSend(v10, "length") & 3) == 0)
      {
        self = -[ADMillimeterRadiusPairsLensDistortionModel initWithDistortionCenter:distortedRadii:undistortedRadii:](self, "initWithDistortionCenter:distortedRadii:undistortedRadii:", v6, v10, self->_distortionCenter.x, self->_distortionCenter.y);
        v8 = self;
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)dictionaryRepresentation:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  CFDictionaryRef DictionaryRepresentation;
  void *v7;
  void *v8;

  v3 = a3;
  v5 = (void *)objc_opt_new();
  DictionaryRepresentation = CGPointCreateDictionaryRepresentation(self->_distortionCenter);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", DictionaryRepresentation, CFSTR("lensDistortionCenter"));

  if (v3)
  {
    dataToFloatsArray(self->_distortedRadii);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("distortedRadii"));

    dataToFloatsArray(self->_undistortedRadii);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("undistortedRadii"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", self->_distortedRadii, CFSTR("distortedRadii"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", self->_undistortedRadii, CFSTR("undistortedRadii"));
  }
  return v5;
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

- (NSData)distortedRadii
{
  return self->_distortedRadii;
}

- (void)setDistortedRadii:(id)a3
{
  objc_storeStrong((id *)&self->_distortedRadii, a3);
}

- (NSData)undistortedRadii
{
  return self->_undistortedRadii;
}

- (void)setUndistortedRadii:(id)a3
{
  objc_storeStrong((id *)&self->_undistortedRadii, a3);
}

@end
