@implementation NIVisionInput

- (NIVisionInput)initWithTimestamp:(__n128)a3 devicePose:(__n128)a4 trackingState:(__n128)a5 lightEstimate:(__n128)a6 majorRelocalization:(double)a7 minorRelocalization:(uint64_t)a8
{
  NIVisionInput *v16;
  NIVisionInput *v17;
  NIVisionInput *v18;
  objc_super v24;

  v24.receiver = a1;
  v24.super_class = (Class)NIVisionInput;
  v16 = -[NIVisionInput init](&v24, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_timestamp = a2;
    *(__n128 *)&v16[1].super.isa = a3;
    *(__n128 *)&v16[1]._timestamp = a4;
    *(__n128 *)&v16[1]._lightEstimate = a5;
    *(__n128 *)&v16[2].super.isa = a6;
    v16->_trackingState = a9;
    v16->_lightEstimate = a7;
    v16->_majorRelocalization = a10;
    v16->_minorRelocalization = a11;
    v18 = v16;
  }

  return v17;
}

- (void)overrideTimestamp:(double)a3
{
  self->_timestamp = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithTimestamp:devicePose:trackingState:lightEstimate:majorRelocalization:minorRelocalization:", self->_trackingState, self->_majorRelocalization, self->_minorRelocalization, self->_timestamp, *(double *)&self[1].super.isa, self[1]._timestamp, self[1]._lightEstimate, *(double *)&self[2].super.isa, self->_lightEstimate);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("timestamp"), self->_timestamp);
  objc_msgSend(v4, "encodeMatrix4x4:forKey:", CFSTR("devicePose"), *(double *)&self[1].super.isa, self[1]._timestamp, self[1]._lightEstimate, *(double *)&self[2].super.isa);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_trackingState, CFSTR("trackingState"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("lightEstimate"), self->_lightEstimate);
  objc_msgSend(v4, "encodeBool:forKey:", self->_majorRelocalization, CFSTR("majorRelocalization"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_minorRelocalization, CFSTR("minorRelocalization"));

}

- (NIVisionInput)initWithCoder:(id)a3
{
  id v4;
  NIVisionInput *v5;
  double v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  double v11;
  NIVisionInput *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NIVisionInput;
  v5 = -[NIVisionInput init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timestamp"));
    v5->_timestamp = v6;
    objc_msgSend(v4, "decodeMatrix4x4ForKey:", CFSTR("devicePose"));
    *(_OWORD *)&v5[1].super.isa = v7;
    *(_OWORD *)&v5[1]._timestamp = v8;
    *(_OWORD *)&v5[1]._lightEstimate = v9;
    *(_OWORD *)&v5[2].super.isa = v10;
    v5->_trackingState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("trackingState"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("lightEstimate"));
    v5->_lightEstimate = v11;
    v5->_majorRelocalization = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("majorRelocalization"));
    v5->_minorRelocalization = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("minorRelocalization"));
    v12 = v5;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NIVisionInput *v5;
  NIVisionInput *v6;
  double timestamp;
  double v8;
  double v9;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  int64_t trackingState;
  uint64_t v15;
  double lightEstimate;
  double v17;
  double v18;
  int majorRelocalization;
  int v20;
  int minorRelocalization;
  int v22;
  BOOL v23;
  float32x4_t v26;
  float32x4_t v27;
  float32x4_t v28;
  float32x4_t v29;
  float32x4_t v30;
  float32x4_t v31;
  float32x4_t v32;
  float32x4_t v33;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (NIVisionInput *)v4;
    v6 = v5;
    if (v5 == self)
    {
      v23 = 1;
    }
    else
    {
      timestamp = self->_timestamp;
      -[NIVisionInput timestamp](v5, "timestamp");
      v9 = v8;
      v30 = *(float32x4_t *)&self[1]._timestamp;
      v31 = *(float32x4_t *)&self[1].super.isa;
      v32 = *(float32x4_t *)&self[2].super.isa;
      v33 = *(float32x4_t *)&self[1]._lightEstimate;
      -[NIVisionInput devicePose](v6, "devicePose");
      v26 = v11;
      v27 = v10;
      v28 = v13;
      v29 = v12;
      trackingState = self->_trackingState;
      v15 = -[NIVisionInput trackingState](v6, "trackingState");
      lightEstimate = self->_lightEstimate;
      -[NIVisionInput lightEstimate](v6, "lightEstimate");
      v18 = v17;
      majorRelocalization = self->_majorRelocalization;
      v20 = -[NIVisionInput majorRelocalization](v6, "majorRelocalization");
      minorRelocalization = self->_minorRelocalization;
      v22 = -[NIVisionInput minorRelocalization](v6, "minorRelocalization");
      v23 = 0;
      if (timestamp == v9
        && (vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(v31, v27), (int8x16_t)vceqq_f32(v30, v26)), vandq_s8((int8x16_t)vceqq_f32(v33, v29), (int8x16_t)vceqq_f32(v32, v28)))) & 0x80000000) != 0&& trackingState == v15&& lightEstimate == v18)
      {
        v23 = majorRelocalization == v20 && minorRelocalization == v22;
      }
    }

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  uint64_t v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &self[1], 64);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v15, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timestamp);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_trackingState);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_lightEstimate);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_majorRelocalization);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_minorRelocalization);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v4 ^ v14 ^ v6 ^ v8 ^ v10 ^ objc_msgSend(v11, "hash");

  return v12;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (double)devicePose
{
  __int128 v2;

  objc_copyStruct(&v2, (const void *)(a1 + 48), 64, 1, 0);
  return *(double *)&v2;
}

- (int64_t)trackingState
{
  return self->_trackingState;
}

- (double)lightEstimate
{
  return self->_lightEstimate;
}

- (BOOL)majorRelocalization
{
  return self->_majorRelocalization;
}

- (BOOL)minorRelocalization
{
  return self->_minorRelocalization;
}

@end
