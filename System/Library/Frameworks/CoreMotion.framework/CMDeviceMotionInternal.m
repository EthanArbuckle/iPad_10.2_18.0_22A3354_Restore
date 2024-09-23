@implementation CMDeviceMotionInternal

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMDeviceMotionInternal;
  -[CMDeviceMotionInternal dealloc](&v3, sel_dealloc);
}

- (CMDeviceMotionInternal)initWithDeviceMotion:(id *)a3 internal:(id)a4
{
  CMDeviceMotionInternal *v6;
  CMAttitude *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  _OWORD v18[5];
  uint64_t v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CMDeviceMotionInternal;
  v6 = -[CMDeviceMotionInternal init](&v20, sel_init);
  if (v6)
  {
    v7 = [CMAttitude alloc];
    v6->fAttitude = (CMAttitude *)objc_msgSend_initWithQuaternion_(v7, v8, v9, v10, v11, a3->var0.var0, a3->var0.var1, a3->var0.var2, a3->var0.var3);
    v19 = *(_QWORD *)&a3->var9;
    v12 = *(_OWORD *)&a3->var2.var1;
    v18[2] = *(_OWORD *)&a3->var1.var0;
    v18[3] = v12;
    v18[4] = *(_OWORD *)&a3->var3.var2;
    v13 = *(_OWORD *)&a3->var0.var2;
    v18[0] = *(_OWORD *)&a3->var0.var0;
    v18[1] = v13;
    objc_msgSend_setDeviceMotion_internal_(v6, v14, (uint64_t)v18, v15, v16, COERCE_DOUBLE(__PAIR64__(DWORD1(v18[0]), a4.var0)));
  }
  return v6;
}

- (void)setDeviceMotion:(id *)a3 internal:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  float v9;
  float v10;
  float64x2_t v11;
  int var4;
  float var8;

  objc_msgSend_setQuaternion_(self->fAttitude, a2, (uint64_t)a3, v4, v5, a3->var0.var0, a3->var0.var1, a3->var0.var2, a3->var0.var3);
  self->fGravity.x = sub_18F1FE3CC(&a3->var0.var0);
  self->fGravity.y = v9;
  self->fGravity.z = v10;
  *(float64x2_t *)&self->fRotationRate.y = vcvtq_f64_f32(*(float32x2_t *)&a3->var2.var1);
  v11 = vcvtq_f64_f32(*(float32x2_t *)&a3->var1.var2);
  *(float64x2_t *)&self->fUserAcceleration.x = vcvtq_f64_f32(*(float32x2_t *)&a3->var1.var0);
  *(float64x2_t *)&self->fUserAcceleration.z = v11;
  var4 = a3->var4;
  self->fMagneticFieldCalibrationLevel = var4;
  if (var4)
  {
    *(float64x2_t *)&self->fMagneticField.x = vcvtq_f64_f32(*(float32x2_t *)&a3->var3.var0);
    self->fMagneticField.z = a3->var3.var2;
  }
  else
  {
    bzero(&self->fMagneticField, 0x18uLL);
  }
  self->fDoingYawCorrection = a3->var5;
  self->fDoingBiasEstimation = a3->var6;
  self->fIsInitialized = a3->var7;
  var8 = a3->var8;
  self->fFusedWithVision = a3->var9;
  self->fUsingVisionCorrections = a3->var10;
  self->fHeading = var8;
  self->fHeadingAccuracy = a4.var0;
  self->fSensorLocation = a3->var11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;

  v5 = (void *)objc_opt_class();
  v9 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  v14 = objc_msgSend_init(v9, v10, v11, v12, v13);
  v18 = v14;
  if (v14)
  {
    v19 = *(_OWORD *)&self->fGravity.x;
    *(double *)(v14 + 24) = self->fGravity.z;
    *(_OWORD *)(v14 + 8) = v19;
    v20 = *(_OWORD *)&self->fUserAcceleration.x;
    *(double *)(v14 + 48) = self->fUserAcceleration.z;
    *(_OWORD *)(v14 + 32) = v20;
    v21 = *(_OWORD *)&self->fRotationRate.x;
    *(double *)(v14 + 72) = self->fRotationRate.z;
    *(_OWORD *)(v14 + 56) = v21;
    *(_QWORD *)(v14 + 80) = objc_msgSend_copyWithZone_(self->fAttitude, v15, (uint64_t)a3, v16, v17);
    v22 = *(_OWORD *)&self->fMagneticField.x;
    *(double *)(v18 + 104) = self->fMagneticField.z;
    *(_OWORD *)(v18 + 88) = v22;
    *(_DWORD *)(v18 + 112) = self->fMagneticFieldCalibrationLevel;
    *(_BYTE *)(v18 + 116) = self->fDoingYawCorrection;
    *(_BYTE *)(v18 + 117) = self->fDoingBiasEstimation;
    *(float *)(v18 + 120) = self->fHeading;
    *(float *)(v18 + 124) = self->fHeadingAccuracy;
    *(_BYTE *)(v18 + 128) = self->fFusedWithVision;
    *(_BYTE *)(v18 + 129) = self->fUsingVisionCorrections;
    *(_QWORD *)(v18 + 136) = self->fSensorLocation;
  }
  return (id)v18;
}

- (BOOL)isEqual:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  int isEqual;

  if (a3 == self)
  {
    LOBYTE(isEqual) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_17;
    isEqual = objc_msgSend_isEqual_(self->fAttitude, v5, *((_QWORD *)a3 + 10), v6, v7);
    if (!isEqual)
      return isEqual;
    if (self->fUserAcceleration.x != *((double *)a3 + 4)
      || self->fUserAcceleration.y != *((double *)a3 + 5)
      || self->fUserAcceleration.z != *((double *)a3 + 6)
      || self->fRotationRate.x != *((double *)a3 + 7)
      || self->fRotationRate.y != *((double *)a3 + 8)
      || self->fRotationRate.z != *((double *)a3 + 9)
      || self->fMagneticField.x != *((double *)a3 + 11)
      || self->fMagneticField.y != *((double *)a3 + 12)
      || self->fMagneticField.z != *((double *)a3 + 13)
      || self->fMagneticFieldCalibrationLevel != *((_DWORD *)a3 + 28)
      || self->fHeading != *((float *)a3 + 30)
      || self->fHeadingAccuracy != *((float *)a3 + 31))
    {
LABEL_17:
      LOBYTE(isEqual) = 0;
      return isEqual;
    }
    LOBYTE(isEqual) = self->fSensorLocation == *((_QWORD *)a3 + 17);
  }
  return isEqual;
}

@end
