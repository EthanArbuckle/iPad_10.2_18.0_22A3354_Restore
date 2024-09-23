@implementation ADXThetaDistortionModel

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
  ADXThetaDistortionModel *v4;
  ADXThetaDistortionModel *v5;
  ADXThetaDistortionModel *v6;
  double y;
  double x;
  double v9;
  NSArray *v10;
  double v11;
  unint64_t XThetaType;
  NSArray *distortionCoefficients;
  void *v14;
  void *v15;
  char v16;

  v4 = (ADXThetaDistortionModel *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_10;
  if (self == v4)
  {
    v16 = 1;
    goto LABEL_15;
  }
  if ((-[ADXThetaDistortionModel isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v6 = v5;
    x = self->_distortionCenter.x;
    y = self->_distortionCenter.y;
    -[ADXThetaDistortionModel distortionCenter](v6, "distortionCenter");
    LOBYTE(v10) = 1;
    if (x == v11 && y == v9)
    {
      XThetaType = self->_XThetaType;
      if (XThetaType == -[ADXThetaDistortionModel XThetaType](v6, "XThetaType"))
      {
        distortionCoefficients = self->_distortionCoefficients;
        -[ADXThetaDistortionModel distortionCoefficients](v6, "distortionCoefficients");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((distortionCoefficients != 0) == (v14 == 0))
        {
          LOBYTE(v10) = 1;
        }
        else
        {
          v10 = self->_distortionCoefficients;
          if (v10)
          {
            -[ADXThetaDistortionModel distortionCoefficients](v6, "distortionCoefficients");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v10) = !-[NSArray isEqualToArray:](v10, "isEqualToArray:", v15);

          }
        }

      }
    }
    v16 = v10 ^ 1;

  }
  else
  {
LABEL_10:
    v16 = 0;
  }
LABEL_15:

  return v16;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSArray *v9;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_distortionCenter.x);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_distortionCenter.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_XThetaType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4 ^ (2 * v6) ^ (3 * objc_msgSend(v7, "hash"));

  return v8 ^ (4 * ADCommonUtils::hashArray((ADCommonUtils *)self->_distortionCoefficients, v9));
}

- (void)applyDistortionModelToPixels:(double)a3 inPixels:(float32x2_t)a4 intrinsicsMatrix:(uint64_t)a5 distort:(uint64_t)a6 outPixels:(float64x2_t *)a7
{
  uint64_t v10;
  float32x2_t v12;
  uint64_t v13;
  float32x2_t v18;
  float32x2_t v19;
  float v20;
  float v21;
  id v22;
  uint64_t v23;
  float v24;
  uint64_t v25;
  float v26;
  uint64_t i;
  float v28;
  unint64_t v29;
  float v30;
  float v31;
  id v32;
  uint64_t v33;
  float v34;
  uint64_t v35;
  float v36;
  float v37;
  float v38;
  float v39;
  uint64_t v40;
  float v41;
  void *v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v48;
  float32x2_t v49;
  float32x2_t v50;
  float32x2_t v51;
  float32x2_t v52;
  int32x2_t v53;
  float32x2_t v55;
  float32x2_t v56;
  float v60;
  float v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint8_t buf[16];
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  v10 = *(_QWORD *)(a1 + 8);
  switch(v10)
  {
    case 0:
      if (!a6)
        return;
      v12 = (float32x2_t)__PAIR64__(HIDWORD(a3), LODWORD(a2));
      v13 = 0;
      __asm { FMOV            V0.2S, #1.0 }
      v51 = v12;
      v55 = vcvt_f32_f64(*(float64x2_t *)(a1 + 24));
      v56 = vdiv_f32(_D0, v12);
      v53 = vdup_n_s32(0x7FC00000u);
      while (1)
      {
        v18 = vcvt_f32_f64(a7[v13]);
        if (!a8)
          break;
        v19 = vmul_f32(v56, vsub_f32(v18, a4));
        v20 = sqrtf(vaddv_f32(vmul_f32(v19, v19)));
        v21 = atanf(v20);
        if (v21 > 0.0000001)
        {
          v68 = 0u;
          v69 = 0u;
          v66 = 0u;
          v67 = 0u;
          v22 = *(id *)(a1 + 16);
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v66, v72, 16);
          if (v23)
          {
            v24 = v21 * v21;
            v25 = *(_QWORD *)v67;
            v26 = v21;
            do
            {
              for (i = 0; i != v23; ++i)
              {
                if (*(_QWORD *)v67 != v25)
                  objc_enumerationMutation(v22);
                objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * i), "floatValue");
                v21 = v24 * v21;
                v26 = v26 + (float)(v28 * v21);
              }
              v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v66, v72, 16);
            }
            while (v23);
          }
          else
          {
            v26 = v21;
          }

          v48 = v26 / v20;
          v49 = vmul_f32(v51, v19);
          v50 = v55;
LABEL_42:
          v18 = vmla_n_f32(v50, v49, v48);
        }
LABEL_43:
        a9[v13++] = vcvtq_f64_f32(v18);
        if (v13 == a6)
          return;
      }
      v52 = vmul_f32(v56, vsub_f32(v18, v55));
      v61 = sqrtf(vaddv_f32(vmul_f32(v52, v52)));
      if (v61 < 0.00000001)
        goto LABEL_43;
      v29 = 0;
      v30 = 3.4028e38;
      v31 = v61;
      while (1)
      {
        v64 = 0u;
        v65 = 0u;
        v62 = 0u;
        v63 = 0u;
        v32 = *(id *)(a1 + 16);
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
        v60 = v30;
        if (v33)
        {
          v34 = v31 * v31;
          v35 = *(_QWORD *)v63;
          v36 = 1.0;
          v37 = v31;
          v38 = v31;
          v39 = 1.0;
          do
          {
            v40 = 0;
            v41 = v38;
            do
            {
              if (*(_QWORD *)v63 != v35)
                objc_enumerationMutation(v32);
              v42 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v40);
              objc_msgSend(v42, "floatValue");
              v44 = v43;
              objc_msgSend(v42, "floatValue");
              v39 = v39 + 2.0;
              v38 = v34 * v41;
              v36 = v36 + (float)((float)(v39 * v44) * (float)(v31 * v41));
              v37 = v37 + (float)(v45 * (float)(v34 * v41));
              ++v40;
              v41 = v34 * v41;
            }
            while (v33 != v40);
            v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
          }
          while (v33);
        }
        else
        {
          v36 = 1.0;
          v37 = v31;
        }

        if (fabsf(v36) < 0.001)
          break;
        v30 = (float)(v37 - v61) / v36;
        v31 = v31 - v30;
        v46 = fabsf(v30);
        if (v46 <= 0.0000011921 || v29++ >= 0x13)
          goto LABEL_36;
      }
      v46 = fabsf(v60);
LABEL_36:
      v18 = (float32x2_t)v53;
      if (v46 > 0.001)
        goto LABEL_43;
      v18 = (float32x2_t)v53;
      if (v31 < 0.0)
        goto LABEL_43;
      v18 = (float32x2_t)v53;
      if (v31 > 1.57079633)
        goto LABEL_43;
      v48 = tanf(v31) / v61;
      v49 = vmul_f32(v51, v52);
      v50 = a4;
      goto LABEL_42;
    case 1:
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "FSinTheta distort/undistort not supported", buf, 2u);
      }
      break;
    case 2:
      memcpy(a9, a7, 16 * a6);
      break;
  }
}

- (void)distortPixels:(unint64_t)a3 undistortedPixels:(const CGPoint *)a4 withCameraCalibration:(id)a5 outDistortedPixels:(CGPoint *)a6
{
  id v10;

  v10 = a5;
  objc_msgSend(v10, "intrinsicMatrix");
  -[ADXThetaDistortionModel applyDistortionModelToPixels:inPixels:intrinsicsMatrix:distort:outPixels:](self, "applyDistortionModelToPixels:inPixels:intrinsicsMatrix:distort:outPixels:", a3, a4, 1, a6);

}

- (void)undistortPixels:(unint64_t)a3 distortedPixels:(const CGPoint *)a4 withCameraCalibration:(id)a5 outUndistortedPixels:(CGPoint *)a6
{
  id v10;

  v10 = a5;
  objc_msgSend(v10, "intrinsicMatrix");
  -[ADXThetaDistortionModel applyDistortionModelToPixels:inPixels:intrinsicsMatrix:distort:outPixels:](self, "applyDistortionModelToPixels:inPixels:intrinsicsMatrix:distort:outPixels:", a3, a4, 0, a6);

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[ADXThetaDistortionModel initWithDistortionCenter:XThetaType:distortionCoefficients:]([ADXThetaDistortionModel alloc], "initWithDistortionCenter:XThetaType:distortionCoefficients:", self->_XThetaType, self->_distortionCoefficients, self->_distortionCenter.x, self->_distortionCenter.y);
}

- (ADXThetaDistortionModel)initWithDistortionCenter:(CGPoint)a3 XThetaType:(unint64_t)a4
{
  return -[ADXThetaDistortionModel initWithDistortionCenter:XThetaType:distortionCoefficients:](self, "initWithDistortionCenter:XThetaType:distortionCoefficients:", a4, 0, a3.x, a3.y);
}

- (ADXThetaDistortionModel)initWithDistortionCenter:(CGPoint)a3 XThetaType:(unint64_t)a4 distortionCoefficients:(id)a5
{
  CGFloat y;
  CGFloat x;
  id v10;
  ADXThetaDistortionModel *v11;
  ADXThetaDistortionModel *v12;
  objc_super v14;

  y = a3.y;
  x = a3.x;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ADXThetaDistortionModel;
  v11 = -[ADXThetaDistortionModel init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_distortionCenter.x = x;
    v11->_distortionCenter.y = y;
    v11->_XThetaType = a4;
    objc_storeStrong((id *)&v11->_distortionCoefficients, a5);
  }

  return v12;
}

- (ADXThetaDistortionModel)initWithDictionary:(id)a3
{
  NSDictionary *v4;
  ADXThetaDistortionModel *v5;
  NSArray *v6;
  NSArray *distortionCoefficients;
  void *v8;
  uint64_t v9;

  v4 = (NSDictionary *)a3;
  if (getDistortionCenterFromDictionary(v4, &self->_distortionCenter))
  {
    -[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("typeXTheta"));
    v5 = (ADXThetaDistortionModel *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("distortionCoefficients"));
      v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
      distortionCoefficients = self->_distortionCoefficients;
      self->_distortionCoefficients = v6;

      -[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("typeXTheta"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "unsignedIntegerValue");

      self = -[ADXThetaDistortionModel initWithDistortionCenter:XThetaType:distortionCoefficients:](self, "initWithDistortionCenter:XThetaType:distortionCoefficients:", v9, self->_distortionCoefficients, self->_distortionCenter.x, self->_distortionCenter.y);
      v5 = self;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)dictionaryRepresentation:(BOOL)a3
{
  void *v4;
  CFDictionaryRef DictionaryRepresentation;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  DictionaryRepresentation = CGPointCreateDictionaryRepresentation(self->_distortionCenter);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", DictionaryRepresentation, CFSTR("lensDistortionCenter"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_XThetaType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("typeXTheta"));

  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_distortionCoefficients, CFSTR("distortionCoefficients"));
  v7 = (void *)objc_msgSend(v4, "copy");

  return v7;
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

- (unint64_t)XThetaType
{
  return self->_XThetaType;
}

- (NSArray)distortionCoefficients
{
  return self->_distortionCoefficients;
}

- (void)setDistortionCoefficients:(id)a3
{
  objc_storeStrong((id *)&self->_distortionCoefficients, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distortionCoefficients, 0);
}

@end
