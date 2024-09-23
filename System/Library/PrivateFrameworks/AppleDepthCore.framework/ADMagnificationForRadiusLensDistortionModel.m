@implementation ADMagnificationForRadiusLensDistortionModel

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
  ADMagnificationForRadiusLensDistortionModel *v4;
  ADMagnificationForRadiusLensDistortionModel *v5;
  ADMagnificationForRadiusLensDistortionModel *v6;
  double y;
  double x;
  double v9;
  int v10;
  double v11;
  NSData *lensDistortionLookupTable;
  void *v13;
  NSData *inverseLensDistortionLookupTable;
  void *v15;
  char v16;

  v4 = (ADMagnificationForRadiusLensDistortionModel *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_8;
  if (self == v4)
  {
    v16 = 1;
    goto LABEL_13;
  }
  if ((-[ADMagnificationForRadiusLensDistortionModel isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v6 = v5;
    x = self->_distortionCenter.x;
    y = self->_distortionCenter.y;
    -[ADMagnificationForRadiusLensDistortionModel distortionCenter](v6, "distortionCenter");
    LOBYTE(v10) = 1;
    if (x == v11 && y == v9)
    {
      lensDistortionLookupTable = self->_lensDistortionLookupTable;
      -[ADMagnificationForRadiusLensDistortionModel lensDistortionLookupTable](v6, "lensDistortionLookupTable");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSData isEqualToData:](lensDistortionLookupTable, "isEqualToData:", v13))
      {
        inverseLensDistortionLookupTable = self->_inverseLensDistortionLookupTable;
        -[ADMagnificationForRadiusLensDistortionModel inverseLensDistortionLookupTable](v6, "inverseLensDistortionLookupTable");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = !-[NSData isEqualToData:](inverseLensDistortionLookupTable, "isEqualToData:", v15);

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

  v7 = v6 ^ (3 * -[NSData hash](self->_lensDistortionLookupTable, "hash"));
  return v7 ^ (4 * -[NSData hash](self->_inverseLensDistortionLookupTable, "hash"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  ADMagnificationForRadiusLensDistortionModel *v4;
  double x;
  double y;
  void *v7;
  void *v8;
  ADMagnificationForRadiusLensDistortionModel *v9;

  v4 = [ADMagnificationForRadiusLensDistortionModel alloc];
  x = self->_distortionCenter.x;
  y = self->_distortionCenter.y;
  v7 = (void *)-[NSData copy](self->_lensDistortionLookupTable, "copy");
  v8 = (void *)-[NSData copy](self->_inverseLensDistortionLookupTable, "copy");
  v9 = -[ADMagnificationForRadiusLensDistortionModel initWithDistortionCenter:lensDistortionLookupTable:inverseLensDistortionLookupTable:](v4, "initWithDistortionCenter:lensDistortionLookupTable:inverseLensDistortionLookupTable:", v7, v8, x, y);

  return v9;
}

- (ADMagnificationForRadiusLensDistortionModel)initWithDistortionCenter:(CGPoint)a3 lensDistortionLookupTable:(id)a4 inverseLensDistortionLookupTable:(id)a5
{
  CGFloat y;
  CGFloat x;
  id v10;
  id v11;
  void *v12;
  ADMagnificationForRadiusLensDistortionModel *v13;
  ADMagnificationForRadiusLensDistortionModel *v14;
  const __CFString *v16;
  id v17;
  objc_super v18;

  y = a3.y;
  x = a3.x;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (!v10)
  {
    v16 = CFSTR("lensDistortionLookupTable cannot be nil");
    goto LABEL_8;
  }
  if (!v11)
  {
    v16 = CFSTR("inverseLensDistortionLookupTable cannot be nil");
LABEL_8:
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v16, 0);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v17);
  }
  v18.receiver = self;
  v18.super_class = (Class)ADMagnificationForRadiusLensDistortionModel;
  v13 = -[ADMagnificationForRadiusLensDistortionModel init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_distortionCenter.x = x;
    v13->_distortionCenter.y = y;
    objc_storeStrong((id *)&v13->_lensDistortionLookupTable, a4);
    objc_storeStrong((id *)&v14->_inverseLensDistortionLookupTable, a5);
  }

  return v14;
}

- (void)applyDistortionModelToPixels:(double)a3 inPixels:(double)a4 intrinsicsMatrix:(double)a5 referenceDimensions:(double)a6 magnificationLookupTable:(uint64_t)a7 outPixels:(uint64_t)a8
{
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  unint64_t v23;
  float v24;
  float v25;
  float v26;
  uint64_t v27;
  float64x2_t v28;
  float32x2_t v29;
  float v30;
  float v31;
  float v32;
  id v33;

  v17 = a10;
  v18 = *(double *)(a1 + 24);
  v19 = *(double *)(a1 + 32);
  if (v18 <= a5 - v18)
    v20 = a5 - v18;
  else
    v20 = *(double *)(a1 + 24);
  if (v19 <= a6 - v19)
    v21 = a6 - v19;
  else
    v21 = *(double *)(a1 + 32);
  v33 = objc_retainAutorelease(v17);
  v22 = objc_msgSend(v33, "bytes");
  v23 = objc_msgSend(v33, "length");
  if (v23 > 3)
  {
    if (a8)
    {
      v24 = v20;
      v25 = v21;
      v26 = sqrtf((float)(v25 * v25) + (float)(v24 * v24));
      v27 = (v23 >> 2) - 1;
      do
      {
        v28 = *(float64x2_t *)(a1 + 24);
        v29 = vcvt_f32_f64(vsubq_f64(*a9, v28));
        v30 = sqrtf(vmlas_n_f32(COERCE_FLOAT(vmul_f32(v29, v29).i32[1]), v29.f32[0], v29.f32[0]));
        if (v30 >= v26)
        {
          v32 = *(float *)(v22 + 4 * v27);
        }
        else
        {
          v31 = (float)((float)(unint64_t)v27 / v26) * v30;
          v32 = (float)((float)(v31 - (float)(int)v31) * *(float *)(v22 + 4 * (int)v31 + 4))
              + (float)((float)(1.0 - (float)(v31 - (float)(int)v31)) * *(float *)(v22 + 4 * (int)v31));
        }
        *a11++ = vaddq_f64(v28, vcvtq_f64_f32(vmla_n_f32(v29, v29, v32)));
        ++a9;
        --a8;
      }
      while (a8);
    }

  }
  else
  {
    memcpy(a11, a9, 16 * a8);

  }
}

- (void)distortPixels:(unint64_t)a3 undistortedPixels:(const CGPoint *)a4 withCameraCalibration:(id)a5 outDistortedPixels:(CGPoint *)a6
{
  double v10;
  double v11;
  double v12;
  double v13;
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
  objc_msgSend(v18, "referenceDimensions");
  -[ADMagnificationForRadiusLensDistortionModel applyDistortionModelToPixels:inPixels:intrinsicsMatrix:referenceDimensions:magnificationLookupTable:outPixels:](self, "applyDistortionModelToPixels:inPixels:intrinsicsMatrix:referenceDimensions:magnificationLookupTable:outPixels:", a3, a4, self->_inverseLensDistortionLookupTable, a6, v17, v16, v15, v13, v14);

}

- (void)undistortPixels:(unint64_t)a3 distortedPixels:(const CGPoint *)a4 withCameraCalibration:(id)a5 outUndistortedPixels:(CGPoint *)a6
{
  double v10;
  double v11;
  double v12;
  double v13;
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
  objc_msgSend(v18, "referenceDimensions");
  -[ADMagnificationForRadiusLensDistortionModel applyDistortionModelToPixels:inPixels:intrinsicsMatrix:referenceDimensions:magnificationLookupTable:outPixels:](self, "applyDistortionModelToPixels:inPixels:intrinsicsMatrix:referenceDimensions:magnificationLookupTable:outPixels:", a3, a4, self->_lensDistortionLookupTable, a6, v17, v16, v15, v13, v14);

}

- (ADMagnificationForRadiusLensDistortionModel)initWithDictionary:(id)a3
{
  NSDictionary *v4;
  objc_object *v5;
  void *v6;
  objc_object *v7;
  ADMagnificationForRadiusLensDistortionModel *v8;
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
        self = -[ADMagnificationForRadiusLensDistortionModel initWithDistortionCenter:lensDistortionLookupTable:inverseLensDistortionLookupTable:](self, "initWithDistortionCenter:lensDistortionLookupTable:inverseLensDistortionLookupTable:", v6, v10, self->_distortionCenter.x, self->_distortionCenter.y);
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
    dataToFloatsArray(self->_lensDistortionLookupTable);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("distortedRadii"));

    dataToFloatsArray(self->_inverseLensDistortionLookupTable);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("undistortedRadii"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", self->_lensDistortionLookupTable, CFSTR("distortedRadii"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", self->_inverseLensDistortionLookupTable, CFSTR("undistortedRadii"));
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

- (NSData)lensDistortionLookupTable
{
  return self->_lensDistortionLookupTable;
}

- (void)setLensDistortionLookupTable:(id)a3
{
  objc_storeStrong((id *)&self->_lensDistortionLookupTable, a3);
}

- (NSData)inverseLensDistortionLookupTable
{
  return self->_inverseLensDistortionLookupTable;
}

- (void)setInverseLensDistortionLookupTable:(id)a3
{
  objc_storeStrong((id *)&self->_inverseLensDistortionLookupTable, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inverseLensDistortionLookupTable, 0);
  objc_storeStrong((id *)&self->_lensDistortionLookupTable, 0);
}

@end
