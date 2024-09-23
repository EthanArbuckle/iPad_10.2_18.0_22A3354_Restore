@implementation ARWorldTrackingPoseData

- (ARWorldTrackingPoseData)initWithTimestamp:(double)a3
{
  ARWorldTrackingPoseData *v4;
  ARWorldTrackingPoseData *v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  ARWorldTrackingState *worldTrackingState;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)ARWorldTrackingPoseData;
  v4 = -[ARWorldTrackingPoseData init](&v14, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_timestamp = a3;
    v6 = MEMORY[0x1E0C83FF0];
    v7 = *MEMORY[0x1E0C83FF0];
    v8 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 16);
    *(_OWORD *)v4->_anon_50 = *MEMORY[0x1E0C83FF0];
    *(_OWORD *)&v4->_anon_50[16] = v8;
    v9 = *(_OWORD *)(v6 + 32);
    v10 = *(_OWORD *)(v6 + 48);
    *(_OWORD *)&v4->_anon_50[32] = v9;
    *(_OWORD *)&v4->_anon_50[48] = v10;
    *(_OWORD *)&v4[1].super.isa = v7;
    *(_OWORD *)&v4[1]._lastInertialTimestamp = v8;
    *(_OWORD *)&v4[1]._worldTrackingState = v9;
    *(_OWORD *)&v4[1]._currentlyActiveVideoFormat = v10;
    v4->_worldMappingStatus = 0;
    v11 = objc_opt_new();
    worldTrackingState = v5->_worldTrackingState;
    v5->_worldTrackingState = (ARWorldTrackingState *)v11;

    -[ARWorldTrackingState setState:](v5->_worldTrackingState, "setState:", 0);
    -[ARWorldTrackingState setReason:](v5->_worldTrackingState, "setReason:", 0);
  }
  return v5;
}

- (double)setVisionCameraTransform:(uint64_t)a1
{
  float32x4_t v3;
  float32x4_t v4;
  float32x4_t v5;
  float32x4_t v6;
  unint64_t v7;
  simd_float4 v8;
  unint64_t v9;
  simd_float4 v10;
  simd_float4 v11;
  simd_float4 v12;
  double result;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  simd_float4 v17;
  float32x4_t v18;
  simd_float4 v19;
  float32x4_t v20;
  simd_float4 v21;
  float32x4_t v22;
  simd_float4 v23;
  float32x4_t v24;
  simd_float4 v25;
  simd_float4 v26;
  simd_float4 v27;
  simd_float4 v28;
  float32x4_t v29;
  float32x4_t v30;
  float32x4_t v31;
  float32x4_t v32;
  simd_float4x4 v33;

  *(simd_float4x4 *)(a1 + 80) = a2;
  v33 = __invert_f4(a2);
  v21 = v33.columns[1];
  v23 = v33.columns[0];
  v17 = v33.columns[3];
  v19 = v33.columns[2];
  *(double *)v3.i64 = ARVisionToRenderingCoordinateTransform();
  v7 = 0;
  v25 = v23;
  v26 = v21;
  v27 = v19;
  v28 = v17;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v29 + v7) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v3, COERCE_FLOAT(*(_OWORD *)((char *)&v25 + v7))), v4, *(float32x2_t *)&v25.f32[v7 / 4], 1), v5, *(float32x4_t *)((char *)&v25 + v7), 2), v6, *(float32x4_t *)((char *)&v25 + v7), 3);
    v7 += 16;
  }
  while (v7 != 64);
  v22 = v30;
  v24 = v29;
  v18 = v32;
  v20 = v31;
  *(double *)v8.i64 = ARRenderingToVisionCameraCoordinateTransform();
  v9 = 0;
  v25 = v8;
  v26 = v10;
  v27 = v11;
  v28 = v12;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v29 + v9) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v24, COERCE_FLOAT(*(_OWORD *)((char *)&v25 + v9))), v22, *(float32x2_t *)&v25.f32[v9 / 4], 1), v20, *(float32x4_t *)((char *)&v25 + v9), 2), v18, *(float32x4_t *)((char *)&v25 + v9), 3);
    v9 += 16;
  }
  while (v9 != 64);
  result = *(double *)v29.i64;
  v14 = v30;
  v15 = v31;
  v16 = v32;
  *(float32x4_t *)(a1 + 144) = v29;
  *(float32x4_t *)(a1 + 160) = v14;
  *(float32x4_t *)(a1 + 176) = v15;
  *(float32x4_t *)(a1 + 192) = v16;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ARWorldTrackingPoseData)initWithCoder:(id)a3
{
  id v4;
  ARWorldTrackingPoseData *v5;
  double v6;
  double v7;
  double v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  ARWorldTrackingState *worldTrackingState;
  uint64_t v19;
  ARVideoFormat *currentlyActiveVideoFormat;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)ARWorldTrackingPoseData;
  v5 = -[ARWorldTrackingPoseData init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timestamp"));
    v5->_timestamp = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("lastInertialTimestamp"));
    v5->_lastInertialTimestamp = v7;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("currentStateTimestamp"));
    v5->_currentStateTimestamp = v8;
    objc_msgSend(v4, "ar_decodeMatrix4x4ForKey:", CFSTR("visionCameraTransform"));
    *(_OWORD *)v5->_anon_50 = v9;
    *(_OWORD *)&v5->_anon_50[16] = v10;
    *(_OWORD *)&v5->_anon_50[32] = v11;
    *(_OWORD *)&v5->_anon_50[48] = v12;
    objc_msgSend(v4, "ar_decodeMatrix4x4ForKey:", CFSTR("cameraTransform"));
    *(_OWORD *)&v5[1].super.isa = v13;
    *(_OWORD *)&v5[1]._lastInertialTimestamp = v14;
    *(_OWORD *)&v5[1]._worldTrackingState = v15;
    *(_OWORD *)&v5[1]._currentlyActiveVideoFormat = v16;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("worldTrackingState"));
    v17 = objc_claimAutoreleasedReturnValue();
    worldTrackingState = v5->_worldTrackingState;
    v5->_worldTrackingState = (ARWorldTrackingState *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currentlyActiveVideoFormat"));
    v19 = objc_claimAutoreleasedReturnValue();
    currentlyActiveVideoFormat = v5->_currentlyActiveVideoFormat;
    v5->_currentlyActiveVideoFormat = (ARVideoFormat *)v19;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double timestamp;
  id v5;

  timestamp = self->_timestamp;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("timestamp"), timestamp);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("lastInertialTimestamp"), self->_lastInertialTimestamp);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("currentStateTimestamp"), self->_currentStateTimestamp);
  objc_msgSend(v5, "ar_encodeMatrix4x4:forKey:", CFSTR("visionCameraTransform"), *(double *)self->_anon_50, *(double *)&self->_anon_50[16], *(double *)&self->_anon_50[32], *(double *)&self->_anon_50[48]);
  objc_msgSend(v5, "ar_encodeMatrix4x4:forKey:", CFSTR("cameraTransform"), *(double *)&self[1].super.isa, self[1]._lastInertialTimestamp, *(double *)&self[1]._worldTrackingState, *(double *)&self[1]._currentlyActiveVideoFormat);
  objc_msgSend(v5, "encodeObject:forKey:", self->_worldTrackingState, CFSTR("worldTrackingState"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currentlyActiveVideoFormat, CFSTR("currentlyActiveVideoFormat"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  id v12;
  void *v13;
  id v14;
  void *v15;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithTimestamp:", self->_timestamp);
  v6 = *(_OWORD *)&self[1]._currentlyActiveVideoFormat;
  v8 = *(_OWORD *)&self[1].super.isa;
  v7 = *(_OWORD *)&self[1]._lastInertialTimestamp;
  *(_OWORD *)(v5 + 176) = *(_OWORD *)&self[1]._worldTrackingState;
  *(_OWORD *)(v5 + 192) = v6;
  *(_OWORD *)(v5 + 144) = v8;
  *(_OWORD *)(v5 + 160) = v7;
  v9 = *(_OWORD *)self->_anon_50;
  v10 = *(_OWORD *)&self->_anon_50[16];
  v11 = *(_OWORD *)&self->_anon_50[48];
  *(_OWORD *)(v5 + 112) = *(_OWORD *)&self->_anon_50[32];
  *(_OWORD *)(v5 + 128) = v11;
  *(_OWORD *)(v5 + 80) = v9;
  *(_OWORD *)(v5 + 96) = v10;
  objc_storeStrong((id *)(v5 + 32), self->_worldTrackingState);
  *(_QWORD *)(v5 + 56) = self->_worldMappingStatus;
  v12 = -[ARVideoFormat copyWithZone:](self->_currentlyActiveVideoFormat, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v12;

  v14 = -[ARLineCloud copyWithZone:](self->_lineCloud, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v14;

  objc_storeStrong((id *)(v5 + 64), self->_slamState);
  *(double *)(v5 + 16) = self->_lastInertialTimestamp;
  *(double *)(v5 + 24) = self->_currentStateTimestamp;
  return (id)v5;
}

- (unint64_t)hash
{
  return (unint64_t)(self->_timestamp * 1000.0);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  _QWORD *v6;
  ARWorldTrackingState *worldTrackingState;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = v5;
    v8 = vabdd_f64(self->_timestamp, *((double *)v5 + 1)) < 2.22044605e-16
      && vabdd_f64(self->_lastInertialTimestamp, *((double *)v5 + 2)) < 2.22044605e-16
      && vabdd_f64(self->_currentStateTimestamp, *((double *)v5 + 3)) < 2.22044605e-16
      && AREqualTransforms(*(float32x4_t *)self->_anon_50, *(float32x4_t *)&self->_anon_50[16], *(float32x4_t *)&self->_anon_50[32], *(float32x4_t *)&self->_anon_50[48], *((float32x4_t *)v5 + 5), *((float32x4_t *)v5 + 6), *((float32x4_t *)v5 + 7), *((float32x4_t *)v5 + 8))&& ((worldTrackingState = self->_worldTrackingState, worldTrackingState == (ARWorldTrackingState *)v6[4])|| -[ARWorldTrackingState isEqual:](worldTrackingState, "isEqual:"))&& self->_worldMappingStatus == v6[7];

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (double)lastInertialTimestamp
{
  return self->_lastInertialTimestamp;
}

- (void)setLastInertialTimestamp:(double)a3
{
  self->_lastInertialTimestamp = a3;
}

- (double)currentStateTimestamp
{
  return self->_currentStateTimestamp;
}

- (void)setCurrentStateTimestamp:(double)a3
{
  self->_currentStateTimestamp = a3;
}

- (__n128)visionCameraTransform
{
  return a1[5];
}

- (ARWorldTrackingState)worldTrackingState
{
  return self->_worldTrackingState;
}

- (void)setWorldTrackingState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (ARLineCloud)lineCloud
{
  return self->_lineCloud;
}

- (void)setLineCloud:(id)a3
{
  objc_storeStrong((id *)&self->_lineCloud, a3);
}

- (ARVideoFormat)currentlyActiveVideoFormat
{
  return self->_currentlyActiveVideoFormat;
}

- (void)setCurrentlyActiveVideoFormat:(id)a3
{
  objc_storeStrong((id *)&self->_currentlyActiveVideoFormat, a3);
}

- (int64_t)worldMappingStatus
{
  return self->_worldMappingStatus;
}

- (void)setWorldMappingStatus:(int64_t)a3
{
  self->_worldMappingStatus = a3;
}

- (__n128)cameraTransform
{
  return a1[9];
}

- (__n128)setCameraTransform:(__n128)a3
{
  result[9] = a2;
  result[10] = a3;
  result[11] = a4;
  result[12] = a5;
  return result;
}

- (ARSLAMState)slamState
{
  return self->_slamState;
}

- (void)setSlamState:(id)a3
{
  objc_storeStrong((id *)&self->_slamState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slamState, 0);
  objc_storeStrong((id *)&self->_currentlyActiveVideoFormat, 0);
  objc_storeStrong((id *)&self->_lineCloud, 0);
  objc_storeStrong((id *)&self->_worldTrackingState, 0);
}

@end
