@implementation FigIrisAutoTrimmerMotionSample

- (double)timestamp
{
  return self->_timestamp;
}

- (FigIrisAutoTrimmerMotionSample)initWithAttitude:(id *)a3 gravity:(id *)a4 motionTimestamp:(double)a5 frameTimestamp:(id *)a6 previousSample:(id)a7
{
  char *v12;
  FigIrisAutoTrimmerMotionSample *v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  __int128 v25;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)FigIrisAutoTrimmerMotionSample;
  v12 = -[FigIrisAutoTrimmerMotionSample init](&v27, sel_init);
  v13 = (FigIrisAutoTrimmerMotionSample *)v12;
  if (v12)
  {
    v14 = *(_OWORD *)&a3->var0;
    *(_OWORD *)(v12 + 104) = *(_OWORD *)&a3->var2;
    *(_OWORD *)(v12 + 88) = v14;
    v15 = *(_QWORD *)&a4->var0;
    *((_DWORD *)v12 + 14) = LODWORD(a4->var2);
    *((_QWORD *)v12 + 6) = v15;
    *((double *)v12 + 2) = a5;
    v16 = *(_OWORD *)&a6->var0;
    *(_QWORD *)(v12 + 76) = a6->var3;
    *(_OWORD *)(v12 + 60) = v16;
    if (a7)
    {
      *((double *)v12 + 15) = FigMotionMultiplyByInverseOfQuaternion(&a3->var0, (uint64_t *)a7 + 11);
      v13->_delta.x = v17;
      v13->_delta.y = v18;
      v13->_delta.z = v19;
      v13->_accel.w = FigMotionMultiplyByInverseOfQuaternion(&v13->_delta.w, (uint64_t *)a7 + 15);
      v13->_accel.x = v20;
      v13->_accel.y = v21;
      v13->_accel.z = v22;
      objc_msgSend(a7, "timestamp");
      v24 = a5 - v23;
    }
    else
    {
      *((_QWORD *)v12 + 19) = 0x3FF0000000000000;
      *((_QWORD *)v12 + 20) = 0;
      *((_QWORD *)v12 + 21) = 0;
      *((_QWORD *)v12 + 22) = 0;
      v25 = *(_OWORD *)(v12 + 168);
      *(_OWORD *)(v12 + 120) = *(_OWORD *)(v12 + 152);
      *(_OWORD *)(v12 + 136) = v25;
      v24 = 0.0666666667;
    }
    v13->_deltaPeriod = v24;
  }
  return v13;
}

+ (void)initialize
{
  objc_opt_class();
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)attitudeRelativeTo:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  v3 = FigMotionMultiplyByInverseOfQuaternion(&self->_attitude.w, (uint64_t *)a3 + 11);
  result.var3 = v6;
  result.var2 = v5;
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigIrisAutoTrimmerMotionSample;
  -[FigIrisAutoTrimmerMotionSample dealloc](&v3, sel_dealloc);
}

- (void)prepareIntermediates:(int64_t)a3
{
  if (!self->_intermediateCalculations)
    self->_intermediateCalculations = (NSMutableDictionary *)(id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", a3);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)cmTimestamp
{
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMakeWithSeconds((CMTime *)retstr, self->_timestamp, 1000000);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)originatingFrameTime
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[2].var2;
  retstr->var3 = *(int64_t *)((char *)&self[3].var0 + 4);
  return self;
}

- (double)deltaPeriod
{
  return self->_deltaPeriod;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)attitude
{
  double w;
  double x;
  double y;
  double z;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  w = self->_attitude.w;
  x = self->_attitude.x;
  y = self->_attitude.y;
  z = self->_attitude.z;
  result.var3 = z;
  result.var2 = y;
  result.var1 = x;
  result.var0 = w;
  return result;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)delta
{
  double w;
  double x;
  double y;
  double z;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  w = self->_delta.w;
  x = self->_delta.x;
  y = self->_delta.y;
  z = self->_delta.z;
  result.var3 = z;
  result.var2 = y;
  result.var1 = x;
  result.var0 = w;
  return result;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)accel
{
  double w;
  double x;
  double y;
  double z;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  w = self->_accel.w;
  x = self->_accel.x;
  y = self->_accel.y;
  z = self->_accel.z;
  result.var3 = z;
  result.var2 = y;
  result.var1 = x;
  result.var0 = w;
  return result;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)gravity
{
  float x;
  float y;
  float z;
  $E2C29196C7A5C696474C6955C5A9CE06 result;

  x = self->_gravity.x;
  y = self->_gravity.y;
  z = self->_gravity.z;
  result.var2 = z;
  result.var1 = y;
  result.var0 = x;
  return result;
}

- (NSDictionary)inferences
{
  return self->_inferences;
}

- (void)setInferences:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (int)vitalityObjectCount
{
  return self->_vitalityObjectCount;
}

- (void)setVitalityObjectCount:(int)a3
{
  self->_vitalityObjectCount = a3;
}

- (NSMutableDictionary)intermediateCalculations
{
  return self->_intermediateCalculations;
}

@end
