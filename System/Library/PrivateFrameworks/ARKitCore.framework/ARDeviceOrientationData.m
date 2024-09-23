@implementation ARDeviceOrientationData

- (void)setDeviceMotion:(id)a3
{
  id v5;
  double v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  double v13;

  v5 = a3;
  objc_storeStrong((id *)&self->_deviceMotion, a3);
  objc_msgSend(v5, "timestamp");
  self->_timestamp = v6;
  objc_msgSend(v5, "attitude");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "rotationMatrix");
  }
  else
  {
    v13 = 0.0;
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
  }
  *(_OWORD *)&self->_rotationMatrix.m13 = v10;
  *(_OWORD *)&self->_rotationMatrix.m22 = v11;
  *(_OWORD *)&self->_rotationMatrix.m31 = v12;
  self->_rotationMatrix.m33 = v13;
  *(_OWORD *)&self->_rotationMatrix.m11 = v9;

}

- (double)rotationMatrixENU
{
  float32x4_t v1;
  float32x4_t v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  uint64_t v11;
  uint64_t v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  float32x4_t v22;
  float32x4_t v23;
  float32x4_t v24;
  float32x4_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;

  v1 = *(float32x4_t *)(a1 + 40);
  v2 = *(float32x4_t *)(a1 + 72);
  v24 = *(float32x4_t *)(a1 + 56);
  v25 = v2;
  v26 = *(_QWORD *)(a1 + 88);
  v22 = *(float32x4_t *)(a1 + 24);
  v23 = v1;
  *(double *)&v3 = ARMatrix4x4FromCMRotationMatrix((double *)v22.i64);
  v20 = v4;
  v21 = v3;
  v18 = v6;
  v19 = v5;
  *(double *)v7.i64 = ARIMUtoCameraCoordinateTransform();
  v11 = 0;
  v27 = v21;
  v28 = v20;
  v29 = v19;
  v30 = v18;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v22 + v11) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v7, COERCE_FLOAT(*(__int128 *)((char *)&v27 + v11))), v8, *(float32x2_t *)((char *)&v27 + v11), 1), v9, *(float32x4_t *)((char *)&v27 + v11), 2), v10, *(float32x4_t *)((char *)&v27 + v11), 3);
    v11 += 16;
  }
  while (v11 != 64);
  v12 = 0;
  v13 = v22;
  v14 = v23;
  v15 = v24;
  v16 = v25;
  v27 = xmmword_1B3C08380;
  v28 = xmmword_1B3C08390;
  v29 = xmmword_1B3C083A0;
  v30 = xmmword_1B3BDFD50;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v22 + v12) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v13, COERCE_FLOAT(*(__int128 *)((char *)&v27 + v12))), v14, *(float32x2_t *)((char *)&v27 + v12), 1), v15, *(float32x4_t *)((char *)&v27 + v12), 2), v16, *(float32x4_t *)((char *)&v27 + v12), 3);
    v12 += 16;
  }
  while (v12 != 64);
  return *(double *)v22.i64;
}

- (ARDeviceOrientationData)init
{
  _OWORD v3[4];
  uint64_t v4;

  v4 = 0;
  memset(v3, 0, sizeof(v3));
  return -[ARDeviceOrientationData initWithTimestamp:rotationMatrix:](self, "initWithTimestamp:rotationMatrix:", v3, 0.0);
}

- (ARDeviceOrientationData)initWithTimestamp:(double)a3 rotationMatrix:(id *)a4
{
  ARDeviceOrientationData *result;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ARDeviceOrientationData;
  result = -[ARDeviceOrientationData init](&v10, sel_init);
  if (result)
  {
    result->_timestamp = a3;
    *(_OWORD *)&result->_rotationMatrix.m11 = *(_OWORD *)&a4->var0;
    v7 = *(_OWORD *)&a4->var2;
    v8 = *(_OWORD *)&a4->var4;
    v9 = *(_OWORD *)&a4->var6;
    result->_rotationMatrix.m33 = a4->var8;
    *(_OWORD *)&result->_rotationMatrix.m31 = v9;
    *(_OWORD *)&result->_rotationMatrix.m22 = v8;
    *(_OWORD *)&result->_rotationMatrix.m13 = v7;
  }
  return result;
}

- (ARDeviceOrientationData)initWithMotionData:(id)a3
{
  id v4;
  ARDeviceOrientationData *v5;
  ARDeviceOrientationData *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ARDeviceOrientationData;
  v5 = -[ARDeviceOrientationData init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[ARDeviceOrientationData setDeviceMotion:](v5, "setDeviceMotion:", v4);

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  CMDeviceMotion *deviceMotion;
  double timestamp;
  id v6;
  __int128 v7;
  __int128 v8;
  id v9;
  _OWORD v10[4];
  double m33;

  deviceMotion = self->_deviceMotion;
  if (deviceMotion)
  {
    v9 = a3;
    objc_msgSend(v9, "encodeObject:forKey:", deviceMotion, CFSTR("deviceMotion"));

  }
  else
  {
    timestamp = self->_timestamp;
    v6 = a3;
    objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("timestamp"), timestamp);
    v7 = *(_OWORD *)&self->_rotationMatrix.m13;
    v8 = *(_OWORD *)&self->_rotationMatrix.m31;
    v10[2] = *(_OWORD *)&self->_rotationMatrix.m22;
    v10[3] = v8;
    m33 = self->_rotationMatrix.m33;
    v10[0] = *(_OWORD *)&self->_rotationMatrix.m11;
    v10[1] = v7;
    objc_msgSend(v6, "ar_encodeCMRotationMatrix:forKey:", v10, CFSTR("rotationMatrix"));

  }
}

- (ARDeviceOrientationData)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ARDeviceOrientationData *v6;
  double v7;
  double v8;
  ARDeviceOrientationData *v9;
  _OWORD v11[4];
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceMotion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[ARDeviceOrientationData initWithMotionData:](self, "initWithMotionData:", v5);
  }
  else
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timestamp"));
    v8 = v7;
    v17 = 0;
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    if (v4)
      objc_msgSend(v4, "ar_decodeCMRotationMatrixForKey:", CFSTR("rotationMatrix"));
    v11[2] = v15;
    v11[3] = v16;
    v12 = v17;
    v11[0] = v13;
    v11[1] = v14;
    v6 = -[ARDeviceOrientationData initWithTimestamp:rotationMatrix:](self, "initWithTimestamp:rotationMatrix:", v11, v8);
  }
  v9 = v6;

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)encodeToDictionary
{
  CMDeviceMotion *deviceMotion;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  deviceMotion = self->_deviceMotion;
  if (!deviceMotion)
    return MEMORY[0x1E0C9AA70];
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", deviceMotion, 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "base64EncodedStringWithOptions:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("deviceMotion");
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (ARDeviceOrientationData)initWithDictionary:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  ARDeviceOrientationData *v10;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("deviceMotion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), &stru_1E6676798);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\r"), &stru_1E6676798);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v7, 1);
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      self = -[ARDeviceOrientationData initWithMotionData:](self, "initWithMotionData:", v9);
      v10 = self;
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)encodeToMetadataWrapper
{
  return (id)objc_msgSend(MEMORY[0x1E0CFCB40], "encodeDeviceMotionData:andAdditionalData:", self->_deviceMotion, 0);
}

- (ARDeviceOrientationData)initWithMetadataWrapper:(id)a3
{
  void *v4;
  ARDeviceOrientationData *v5;

  objc_msgSend(MEMORY[0x1E0CFCB40], "decodeCMDeviceMotion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    self = -[ARDeviceOrientationData initWithMotionData:](self, "initWithMotionData:", v4);
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)appendToWriter:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ARDeviceOrientationData deviceMotion](self, "deviceMotion");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "processDeviceMotionData:andAdditionalData:", v5, 0);

}

+ (id)grabNextFromReader:(id)a3 timestamp:(double *)a4
{
  id v5;
  void *v6;
  void *v7;
  __int128 v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  CMTime v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1B5E2DDB0]();
  v8 = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 16);
  v21 = *MEMORY[0x1E0CA2E50];
  v22 = v8;
  v23 = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 32);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v5, "grabNextCMDeviceMotion:", &v21);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithMotionData:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13));
        objc_msgSend(v6, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v24, 16);
    }
    while (v11);
  }

  *(_OWORD *)&v16.value = v21;
  v16.epoch = v22;
  *a4 = CMTimeGetSeconds(&v16);
  objc_autoreleasePoolPop(v7);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CMDeviceMotion *deviceMotion;
  void *v5;
  double timestamp;
  __int128 v8;
  __int128 v9;
  _OWORD v10[4];
  double m33;

  deviceMotion = self->_deviceMotion;
  v5 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  if (deviceMotion)
    return (id)objc_msgSend(v5, "initWithMotionData:", self->_deviceMotion);
  timestamp = self->_timestamp;
  v8 = *(_OWORD *)&self->_rotationMatrix.m13;
  v9 = *(_OWORD *)&self->_rotationMatrix.m31;
  v10[2] = *(_OWORD *)&self->_rotationMatrix.m22;
  v10[3] = v9;
  m33 = self->_rotationMatrix.m33;
  v10[0] = *(_OWORD *)&self->_rotationMatrix.m11;
  v10[1] = v8;
  return (id)objc_msgSend(v5, "initWithTimestamp:rotationMatrix:", v10, timestamp);
}

- (unint64_t)hash
{
  return (unint64_t)(self->_timestamp * 1000.0);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char *v5;
  __int128 v6;
  __int128 v7;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  __int128 v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  unsigned int v18;
  float32x4_t v20;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  double m33;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = (char *)v4;
    if (vabdd_f64(self->_timestamp, *((double *)v5 + 2)) >= 2.22044605e-16)
    {
      LOBYTE(v18) = 0;
    }
    else
    {
      v6 = *(_OWORD *)&self->_rotationMatrix.m13;
      v7 = *(_OWORD *)&self->_rotationMatrix.m31;
      v26 = *(_OWORD *)&self->_rotationMatrix.m22;
      v27 = v7;
      m33 = self->_rotationMatrix.m33;
      v24 = *(_OWORD *)&self->_rotationMatrix.m11;
      v25 = v6;
      *(double *)v8.i64 = ARMatrix4x4FromCMRotationMatrix((double *)&v24);
      v20 = v8;
      v21 = v9;
      v22 = v10;
      v23 = v11;
      v12 = *(_OWORD *)(v5 + 56);
      v25 = *(_OWORD *)(v5 + 40);
      v26 = v12;
      v27 = *(_OWORD *)(v5 + 72);
      m33 = *((double *)v5 + 11);
      v24 = *(_OWORD *)(v5 + 24);
      *(double *)v13.i64 = ARMatrix4x4FromCMRotationMatrix((double *)&v24);
      v14 = (float32x4_t)vdupq_n_s32(0x25800000u);
      v18 = vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vcgeq_f32(v14, vabdq_f32(v20, v13)), (int8x16_t)vcgeq_f32(v14, vabdq_f32(v21, v15))), vandq_s8((int8x16_t)vcgeq_f32(v14, vabdq_f32(v22, v16)), (int8x16_t)vcgeq_f32(v14, vabdq_f32(v23, v17))))) >> 31;
    }

  }
  else
  {
    LOBYTE(v18) = 0;
  }

  return v18;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ARDeviceOrientationData timestamp](self, "timestamp");
  objc_msgSend(v6, "appendFormat:", CFSTR(" timestamp=%f"), v7);
  -[ARDeviceOrientationData deviceMotion](self, "deviceMotion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "attitude");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pitch");
  v11 = v10;
  -[ARDeviceOrientationData deviceMotion](self, "deviceMotion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "attitude");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "roll");
  v15 = v14;
  -[ARDeviceOrientationData deviceMotion](self, "deviceMotion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "attitude");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "yaw");
  objc_msgSend(v6, "appendFormat:", CFSTR(" pitch=%f roll=%f yaw=%f"), v11, v15, v18);

  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return (NSString *)v6;
}

- (CMDeviceMotion)deviceMotion
{
  return self->_deviceMotion;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- ($8452678F12DBC466148836A9D382CAFC)rotationMatrix
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&self->var5;
  v4 = *(_OWORD *)&self[1].var0;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self->var7;
  *(_OWORD *)&retstr->var6 = v4;
  retstr->var8 = self[1].var2;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var3;
  *(_OWORD *)&retstr->var2 = v3;
  return self;
}

- (void)setRotationMatrix:(id *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  *(_OWORD *)&self->_rotationMatrix.m11 = *(_OWORD *)&a3->var0;
  v3 = *(_OWORD *)&a3->var2;
  v4 = *(_OWORD *)&a3->var4;
  v5 = *(_OWORD *)&a3->var6;
  self->_rotationMatrix.m33 = a3->var8;
  *(_OWORD *)&self->_rotationMatrix.m31 = v5;
  *(_OWORD *)&self->_rotationMatrix.m22 = v4;
  *(_OWORD *)&self->_rotationMatrix.m13 = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceMotion, 0);
}

@end
