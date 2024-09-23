@implementation ARWorldTrackingState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ARWorldTrackingState *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  NSArray *mergedSessionIdentifiers;

  v5 = -[ARWorldTrackingState init](+[ARWorldTrackingState allocWithZone:](ARWorldTrackingState, "allocWithZone:"), "init");
  v5->_state = self->_state;
  v5->_reason = self->_reason;
  v5->_majorRelocalization = self->_majorRelocalization;
  v5->_minorRelocalization = self->_minorRelocalization;
  v5->_poseGraphUpdated = self->_poseGraphUpdated;
  v6 = *(_OWORD *)&self[1].super.isa;
  v7 = *(_OWORD *)&self[1]._state;
  v8 = *(_OWORD *)&self[1]._originTimestamp;
  *(_OWORD *)&v5[1]._vioTrackingState = *(_OWORD *)&self[1]._vioTrackingState;
  *(_OWORD *)&v5[1]._originTimestamp = v8;
  *(_OWORD *)&v5[1].super.isa = v6;
  *(_OWORD *)&v5[1]._state = v7;
  v5->_vioTrackingState = self->_vioTrackingState;
  v5->_lastMajorRelocalizationTimestamp = self->_lastMajorRelocalizationTimestamp;
  v5->_originTimestamp = self->_originTimestamp;
  v5->_poseTimestamp = self->_poseTimestamp;
  v9 = -[NSArray copyWithZone:](self->_mergedSessionIdentifiers, "copyWithZone:", a3);
  mergedSessionIdentifiers = v5->_mergedSessionIdentifiers;
  v5->_mergedSessionIdentifiers = (NSArray *)v9;

  objc_storeStrong((id *)&v5->_collaborationStats, self->_collaborationStats);
  v5->_numberOfCameraSwitches = self->_numberOfCameraSwitches;
  v5->_currentVIOMapSize = self->_currentVIOMapSize;
  v5->_reinitializationAttempts = self->_reinitializationAttempts;
  objc_storeStrong((id *)&v5->_inertialState, self->_inertialState);
  return v5;
}

- (ARWorldTrackingState)initWithCoder:(id)a3
{
  id v4;
  ARWorldTrackingState *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  ARInertialState *inertialState;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ARWorldTrackingState;
  v5 = -[ARWorldTrackingState init](&v19, sel_init);
  if (v5)
  {
    v5->_state = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("state"));
    v5->_reason = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("reason"));
    v5->_majorRelocalization = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("majorRelocalization"));
    v5->_minorRelocalization = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("minorRelocalization"));
    v5->_poseGraphUpdated = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("poseGraphUpdated"));
    objc_msgSend(v4, "ar_decodeMatrix4x4ForKey:", CFSTR("majorRelocalizationCameraTransform"));
    *(_OWORD *)&v5[1].super.isa = v6;
    *(_OWORD *)&v5[1]._state = v7;
    *(_OWORD *)&v5[1]._vioTrackingState = v8;
    *(_OWORD *)&v5[1]._originTimestamp = v9;
    v5->_vioTrackingState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("vioTrackingState"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("lastMajorRelocalizationTimestamp"));
    v5->_lastMajorRelocalizationTimestamp = v10;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("originTimestamp"));
    v5->_originTimestamp = v11;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("poseTimestamp"));
    v5->_poseTimestamp = v12;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("numberOfCameraSwitches"));
    v5->_numberOfCameraSwitches = (unint64_t)v13;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("currentVIOMapSize"));
    v5->_currentVIOMapSize = (unint64_t)v14;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("reinitializationAttempts"));
    v5->_reinitializationAttempts = (unint64_t)v15;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inertialState"));
    v16 = objc_claimAutoreleasedReturnValue();
    inertialState = v5->_inertialState;
    v5->_inertialState = (ARInertialState *)v16;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t state;
  id v5;

  state = self->_state;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", state, CFSTR("state"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_reason, CFSTR("reason"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_majorRelocalization, CFSTR("majorRelocalization"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_minorRelocalization, CFSTR("minorRelocalization"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_poseGraphUpdated, CFSTR("poseGraphUpdated"));
  objc_msgSend(v5, "ar_encodeMatrix4x4:forKey:", CFSTR("majorRelocalizationCameraTransform"), *(double *)&self[1].super.isa, *(double *)&self[1]._state, *(double *)&self[1]._vioTrackingState, self[1]._originTimestamp);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_vioTrackingState, CFSTR("vioTrackingState"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("lastMajorRelocalizationTimestamp"), self->_lastMajorRelocalizationTimestamp);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("originTimestamp"), self->_originTimestamp);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("poseTimestamp"), self->_poseTimestamp);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("numberOfCameraSwitches"), (double)self->_numberOfCameraSwitches);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("currentVIOMapSize"), (double)self->_currentVIOMapSize);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("reinitializationAttempts"), (double)self->_reinitializationAttempts);
  objc_msgSend(v5, "encodeObject:forKey:", self->_inertialState, CFSTR("inertialState"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  float32x4_t *v5;
  float32x4_t *v6;
  ARInertialState *inertialState;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (float32x4_t *)v4;
    v6 = v5;
    v8 = self->_state == v5[1].i64[0]
      && self->_reason == v5[1].i64[1]
      && self->_majorRelocalization == v5->u8[8]
      && self->_minorRelocalization == v5->u8[9]
      && self->_poseGraphUpdated == v5->u8[10]
      && AREqualTransforms(*(float32x4_t *)&self[1].super.isa, *(float32x4_t *)&self[1]._state, *(float32x4_t *)&self[1]._vioTrackingState, *(float32x4_t *)&self[1]._originTimestamp, v5[7], v5[8], v5[9], v5[10])&& self->_vioTrackingState == v6[2].i64[0]&& self->_numberOfCameraSwitches == v6[4].i64[1]&& self->_currentVIOMapSize == v6[4].i64[0]&& self->_reinitializationAttempts == v6[5].i64[0]&& ((inertialState = self->_inertialState, inertialState == (ARInertialState *)v6[6].i64[1])|| -[ARInertialState isEqual:](inertialState, "isEqual:"))&& vabdd_f64(self->_lastMajorRelocalizationTimestamp, *(double *)&v6[2].i64[1]) < 2.22044605e-16&& vabdd_f64(self->_originTimestamp, *(double *)v6[3].i64) < 2.22044605e-16&& vabdd_f64(self->_poseTimestamp, *(double *)&v6[3].i64[1]) < 2.22044605e-16;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (int64_t)reason
{
  return self->_reason;
}

- (void)setReason:(int64_t)a3
{
  self->_reason = a3;
}

- (BOOL)majorRelocalization
{
  return self->_majorRelocalization;
}

- (void)setMajorRelocalization:(BOOL)a3
{
  self->_majorRelocalization = a3;
}

- (BOOL)minorRelocalization
{
  return self->_minorRelocalization;
}

- (void)setMinorRelocalization:(BOOL)a3
{
  self->_minorRelocalization = a3;
}

- (BOOL)poseGraphUpdated
{
  return self->_poseGraphUpdated;
}

- (void)setPoseGraphUpdated:(BOOL)a3
{
  self->_poseGraphUpdated = a3;
}

- (__n128)majorRelocalizationCameraTransform
{
  return a1[7];
}

- (__n128)setMajorRelocalizationCameraTransform:(__n128)a3
{
  result[7] = a2;
  result[8] = a3;
  result[9] = a4;
  result[10] = a5;
  return result;
}

- (int64_t)vioTrackingState
{
  return self->_vioTrackingState;
}

- (void)setVioTrackingState:(int64_t)a3
{
  self->_vioTrackingState = a3;
}

- (double)lastMajorRelocalizationTimestamp
{
  return self->_lastMajorRelocalizationTimestamp;
}

- (void)setLastMajorRelocalizationTimestamp:(double)a3
{
  self->_lastMajorRelocalizationTimestamp = a3;
}

- (double)originTimestamp
{
  return self->_originTimestamp;
}

- (void)setOriginTimestamp:(double)a3
{
  self->_originTimestamp = a3;
}

- (double)poseTimestamp
{
  return self->_poseTimestamp;
}

- (void)setPoseTimestamp:(double)a3
{
  self->_poseTimestamp = a3;
}

- (unint64_t)currentVIOMapSize
{
  return self->_currentVIOMapSize;
}

- (void)setCurrentVIOMapSize:(unint64_t)a3
{
  self->_currentVIOMapSize = a3;
}

- (unint64_t)numberOfCameraSwitches
{
  return self->_numberOfCameraSwitches;
}

- (void)setNumberOfCameraSwitches:(unint64_t)a3
{
  self->_numberOfCameraSwitches = a3;
}

- (unint64_t)reinitializationAttempts
{
  return self->_reinitializationAttempts;
}

- (void)setReinitializationAttempts:(unint64_t)a3
{
  self->_reinitializationAttempts = a3;
}

- (NSArray)mergedSessionIdentifiers
{
  return self->_mergedSessionIdentifiers;
}

- (void)setMergedSessionIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_mergedSessionIdentifiers, a3);
}

- (NSArray)collaborationStats
{
  return self->_collaborationStats;
}

- (void)setCollaborationStats:(id)a3
{
  objc_storeStrong((id *)&self->_collaborationStats, a3);
}

- (ARInertialState)inertialState
{
  return self->_inertialState;
}

- (void)setInertialState:(id)a3
{
  objc_storeStrong((id *)&self->_inertialState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inertialState, 0);
  objc_storeStrong((id *)&self->_collaborationStats, 0);
  objc_storeStrong((id *)&self->_mergedSessionIdentifiers, 0);
}

@end
