@implementation CMAPencilFusionResult

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = objc_msgSend_init(v8, v9, v10, v11);
  *(float *)(v12 + 12) = self->_altitudeAngle;
  *(float *)(v12 + 16) = self->_azimuthAngle;
  *(float *)(v12 + 20) = self->_rollAngle;
  *(_OWORD *)(v12 + 48) = *(_OWORD *)self->_position;
  *(_QWORD *)(v12 + 24) = objc_msgSend_copyWithZone_(self->_estimationUpdateIndex, v13, (uint64_t)a3, v14);
  *(_BYTE *)(v12 + 8) = self->_estimated;
  *(double *)(v12 + 32) = self->_timestamp;
  return (id)v12;
}

- (id)description
{
  uint64_t v2;
  NSNumber *estimationUpdateIndex;

  estimationUpdateIndex = self->_estimationUpdateIndex;
  if (self->_estimated)
    return (id)objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("FusionResult index: %@, %s, angles (%.1f, %.1f, %.1f)°, pos (%.1f, %.1f, %.1f) mm, timestamp: %.3f sec"), v2, estimationUpdateIndex, "estimated", (float)(self->_altitudeAngle * 57.296), (float)(self->_azimuthAngle * 57.296), (float)(self->_rollAngle * 57.296), *(float *)self->_position, *(float *)&self->_position[4], *(float *)&self->_position[8], *(_QWORD *)&self->_timestamp);
  else
    return (id)objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("FusionResult index: %@, %s, angles (%.1f, %.1f, %.1f)°, pos (%.1f, %.1f, %.1f) mm, timestamp: %.3f sec"), v2, estimationUpdateIndex, "real", (float)(self->_altitudeAngle * 57.296), (float)(self->_azimuthAngle * 57.296), (float)(self->_rollAngle * 57.296), *(float *)self->_position, *(float *)&self->_position[4], *(float *)&self->_position[8], *(_QWORD *)&self->_timestamp);
}

- (float)altitudeAngle
{
  return self->_altitudeAngle;
}

- (void)setAltitudeAngle:(float)a3
{
  self->_altitudeAngle = a3;
}

- (float)azimuthAngle
{
  return self->_azimuthAngle;
}

- (void)setAzimuthAngle:(float)a3
{
  self->_azimuthAngle = a3;
}

- (float)rollAngle
{
  return self->_rollAngle;
}

- (void)setRollAngle:(float)a3
{
  self->_rollAngle = a3;
}

- (__n128)position
{
  return a1[3];
}

- (void)setPosition:(CMAPencilFusionResult *)self
{
  __int128 v2;

  *(_OWORD *)self->_position = v2;
}

- (NSNumber)estimationUpdateIndex
{
  return self->_estimationUpdateIndex;
}

- (void)setEstimationUpdateIndex:(id)a3
{
  self->_estimationUpdateIndex = (NSNumber *)a3;
}

- (BOOL)estimated
{
  return self->_estimated;
}

- (void)setEstimated:(BOOL)a3
{
  self->_estimated = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

@end
