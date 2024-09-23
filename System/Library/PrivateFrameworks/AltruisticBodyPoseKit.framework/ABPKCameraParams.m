@implementation ABPKCameraParams

- (BOOL)isMatrixIdentity:(int32x4_t)a3
{
  return a1.n128_f32[0] == 1.0
      && a1.n128_f32[1] == 0.0
      && a1.n128_f32[2] == 0.0
      && *(float *)a2.i32 == 0.0
      && *(float *)&a2.i32[1] == 1.0
      && (vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vceqq_f32((float32x4_t)vzip1q_s32(a3, vzip2q_s32(a2, a3)), (float32x4_t)xmmword_210881530)))) & 1) == 0;
}

- (void)checkAndSetApproximateIntrinsics
{
  CGSize inputRes;
  float v4;
  uint64_t v5;
  float v6;
  NSObject *v12;
  uint8_t v13[16];

  if (-[ABPKCameraParams isMatrixIdentity:](self, "isMatrixIdentity:", *(double *)self->_anon_40, *(double *)&self->_anon_40[16], *(double *)&self->_anon_40[32]))
  {
    inputRes = self->_inputRes;
    v4 = vmuld_lane_f64(1462.18103, (float64x2_t)inputRes, 1) / 1920.0;
    LODWORD(v5) = 0;
    v6 = v4;
    *((float *)&v5 + 1) = v4;
    __asm { FMOV            V1.2D, #0.5 }
    *(_DWORD *)&self->_anon_40[8] = 0;
    *(_QWORD *)self->_anon_40 = LODWORD(v6);
    *(_DWORD *)&self->_anon_40[24] = 0;
    *(_QWORD *)&self->_anon_40[16] = v5;
    *(_DWORD *)&self->_anon_40[40] = 1065353216;
    *(float32x2_t *)&self->_anon_40[32] = vcvt_f32_f64(vmulq_f64((float64x2_t)inputRes, _Q1));
    __ABPKLogSharedInstance();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_210836000, v12, OS_LOG_TYPE_DEBUG, " Input intrinsics is identity. Approximate intrinsics: ", v13, 2u);
    }

    printSimd3x3(*(__n128 *)self->_anon_40, *(__n128 *)&self->_anon_40[16], *(__n128 *)&self->_anon_40[32]);
  }
}

- (ABPKCameraParams)initWithIntrinsics:(__n128)a3 andExtrinsics:(__n128)a4 andDistortion:(__n128)a5
{
  ABPKCameraParams *v9;
  ABPKCameraParams *v10;
  objc_super v20;

  v20.receiver = a1;
  v20.super_class = (Class)ABPKCameraParams;
  v9 = -[ABPKCameraParams init](&v20, sel_init);
  v10 = v9;
  if (v9)
  {
    *(__n128 *)v9->_anon_40 = a2;
    *(__n128 *)&v9->_anon_40[16] = a3;
    *(__n128 *)&v9->_anon_40[32] = a4;
    *(__n128 *)&v9[1].super.isa = a5;
    *(__n128 *)&v9[1]._deviceType = a6;
    *(__n128 *)v9[1]._distortion = a7;
    v9[1]._inputRes = (CGSize)a8;
    *(__n128 *)v9->_distortion = a9;
    v9->_isImageRectified = 0;
    v9->_deviceOrientation = 3;
    -[ABPKCameraParams checkAndSetApproximateIntrinsics](v9, "checkAndSetApproximateIntrinsics");
  }
  return v10;
}

- (ABPKCameraParams)initWithIntrinsics:(__n128)a3 andExtrinsics:(__n128)a4 andDistortion:(__n128)a5 andInputResolution:(__n128)a6
{
  ABPKCameraParams *v18;
  ABPKCameraParams *v19;
  objc_super v29;

  v29.receiver = a1;
  v29.super_class = (Class)ABPKCameraParams;
  v18 = -[ABPKCameraParams init](&v29, sel_init);
  v19 = v18;
  if (v18)
  {
    *(__n128 *)v18->_anon_40 = a2;
    *(__n128 *)&v18->_anon_40[16] = a3;
    *(__n128 *)&v18->_anon_40[32] = a4;
    *(__n128 *)&v18[1].super.isa = a5;
    *(__n128 *)&v18[1]._deviceType = a6;
    *(__n128 *)v18[1]._distortion = a7;
    v18[1]._inputRes = (CGSize)a8;
    *(__n128 *)v18->_distortion = a9;
    v18->_inputRes.width = a10;
    v18->_inputRes.height = a11;
    v18->_isImageRectified = 0;
    v18->_deviceOrientation = 3;
    -[ABPKCameraParams checkAndSetApproximateIntrinsics](v18, "checkAndSetApproximateIntrinsics");
  }
  return v19;
}

- (ABPKCameraParams)initWithDictionary:(id)a3
{
  id v4;
  ABPKCameraParams *v5;
  void *v6;
  __n128 v7;
  int v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  CGSize v22;
  void *v23;
  void *v24;
  NSObject *v25;
  _BOOL4 isImageRectified;
  const char *v27;
  NSObject *v28;
  uint32_t v29;
  void *v30;
  BOOL v31;
  void *v32;
  int v33;
  NSObject *v34;
  const char *v35;
  void *v36;
  int v37;
  ABPKCameraParams *v38;
  NSObject *v40;
  objc_super v41;
  uint8_t buf[4];
  _BOOL4 v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)ABPKCameraParams;
  v5 = -[ABPKCameraParams init](&v41, sel_init);
  if (!v5)
    goto LABEL_19;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("intrinsics"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = convertNSArrayToSimd3x3(v6);
  *(_DWORD *)&v5->_anon_40[8] = v7.n128_u32[2];
  *(_DWORD *)&v5->_anon_40[24] = v8;
  *(_QWORD *)v5->_anon_40 = v7.n128_u64[0];
  *(_QWORD *)&v5->_anon_40[16] = v9;
  *(_DWORD *)&v5->_anon_40[40] = v10;
  *(_QWORD *)&v5->_anon_40[32] = v11;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("distortion"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *(__n128 *)v5->_distortion = convertNSArrayToSimd4(v12);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resolution"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "integerValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resolution"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectAtIndexedSubscript:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "integerValue");
  v5->_inputRes.width = (double)v15;
  v5->_inputRes.height = (double)v18;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("extrinsics"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  *(__n128 *)&v5[1].super.isa = convertNSMatToSimd4x4(v19);
  *(_OWORD *)&v5[1]._deviceType = v20;
  *(_OWORD *)v5[1]._distortion = v21;
  v5[1]._inputRes = v22;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("is_image_rectified"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v15) = v23 == 0;

  if ((v15 & 1) != 0)
  {
    v5->_isImageRectified = 0;
    __ABPKLogSharedInstance();
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      goto LABEL_8;
    *(_WORD *)buf = 0;
    v27 = " Image rectification type not specified. Setting Default to fisheye distortion ";
    v28 = v25;
    v29 = 2;
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("is_image_rectified"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isImageRectified = objc_msgSend(v24, "BOOLValue");

    __ABPKLogSharedInstance();
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      goto LABEL_8;
    isImageRectified = v5->_isImageRectified;
    *(_DWORD *)buf = 67109120;
    v43 = isImageRectified;
    v27 = " Recorded data is rectified: %d ";
    v28 = v25;
    v29 = 8;
  }
  _os_log_impl(&dword_210836000, v28, OS_LOG_TYPE_DEBUG, v27, buf, v29);
LABEL_8:

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("device_orientation"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30 == 0;

  if (v31)
  {
    v5->_deviceOrientation = 3;
    __ABPKLogSharedInstance();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      v35 = " Device orientation not specified. Setting Default to landscape ";
      goto LABEL_17;
    }
LABEL_18:

    -[ABPKCameraParams checkAndSetApproximateIntrinsics](v5, "checkAndSetApproximateIntrinsics");
LABEL_19:
    v38 = v5;
    goto LABEL_20;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("device_orientation"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "isEqualToString:", CFSTR("landscape"));

  if (v33)
  {
    v5->_deviceOrientation = 3;
    __ABPKLogSharedInstance();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      v35 = " Recorded sequence with landscape orientation ";
LABEL_17:
      _os_log_impl(&dword_210836000, v34, OS_LOG_TYPE_DEBUG, v35, buf, 2u);
      goto LABEL_18;
    }
    goto LABEL_18;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("device_orientation"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "isEqualToString:", CFSTR("portrait"));

  if (v37)
  {
    v5->_deviceOrientation = 1;
    __ABPKLogSharedInstance();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      v35 = " Recorded sequence with portrait orientation ";
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  __ABPKLogSharedInstance();
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_210836000, v40, OS_LOG_TYPE_ERROR, " Invalid device orientation type specified. Exit ", buf, 2u);
  }

  v38 = 0;
LABEL_20:

  return v38;
}

- (id)toDict
{
  id v3;
  __n128 v4;
  __n128 v5;
  __n128 v6;
  void *v7;
  __n128 v8;
  __n128 v9;
  __n128 v10;
  __n128 v11;
  void *v12;
  __n128 v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[ABPKCameraParams intrinsics](self, "intrinsics");
  simdMatrix3x3ToNSMat(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("intrinsics"));

  -[ABPKCameraParams extrinsics](self, "extrinsics");
  simdMatrix4x4ToNSMat(v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("extrinsics"));

  -[ABPKCameraParams distortion](self, "distortion");
  simdFloat4ToNSArray(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("distortion"));

  v15 = (void *)MEMORY[0x24BDD16E0];
  -[ABPKCameraParams inputRes](self, "inputRes");
  objc_msgSend(v15, "numberWithDouble:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v17;
  v18 = (void *)MEMORY[0x24BDD16E0];
  -[ABPKCameraParams inputRes](self, "inputRes");
  objc_msgSend(v18, "numberWithDouble:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("resolution"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[ABPKCameraParams isImageRectified](self, "isImageRectified"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("is_image_rectified"));

  if (-[ABPKCameraParams deviceOrientation](self, "deviceOrientation") == 3)
  {
    v22 = CFSTR("landscape");
  }
  else if (-[ABPKCameraParams deviceOrientation](self, "deviceOrientation") == 1)
  {
    v22 = CFSTR("portrait");
  }
  else
  {
    v22 = CFSTR("invalid");
  }
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("device_orientation"));
  return v3;
}

- (double)intrinsics
{
  __int128 v2;

  objc_copyStruct(&v2, (const void *)(a1 + 64), 48, 1, 0);
  return *(double *)&v2;
}

- (void)setIntrinsics:(__n128)a3
{
  _OWORD v4[3];

  v4[0] = a2;
  v4[1] = a3;
  v4[2] = a4;
  objc_copyStruct((void *)(a1 + 64), v4, 48, 1, 0);
}

- (double)extrinsics
{
  __int128 v2;

  objc_copyStruct(&v2, (const void *)(a1 + 112), 64, 1, 0);
  return *(double *)&v2;
}

- (void)setExtrinsics:(__n128)a3
{
  _OWORD v5[4];

  v5[0] = a2;
  v5[1] = a3;
  v5[2] = a4;
  v5[3] = a5;
  objc_copyStruct((void *)(a1 + 112), v5, 64, 1, 0);
}

- (double)distortion
{
  __int128 v2;

  objc_copyStruct(&v2, (const void *)(a1 + 32), 16, 1, 0);
  return *(double *)&v2;
}

- (void)setDistortion:(ABPKCameraParams *)self
{
  __int128 v2;
  __int128 v3;

  v3 = v2;
  objc_copyStruct(self->_distortion, &v3, 16, 1, 0);
}

- (CGSize)inputRes
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_inputRes, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setInputRes:(CGSize)a3
{
  CGSize v3;

  v3 = a3;
  objc_copyStruct(&self->_inputRes, &v3, 16, 1, 0);
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(int64_t)a3
{
  self->_deviceType = a3;
}

- (BOOL)isImageRectified
{
  return self->_isImageRectified;
}

- (void)setIsImageRectified:(BOOL)a3
{
  self->_isImageRectified = a3;
}

- (int64_t)deviceOrientation
{
  return self->_deviceOrientation;
}

- (void)setDeviceOrientation:(int64_t)a3
{
  self->_deviceOrientation = a3;
}

@end
