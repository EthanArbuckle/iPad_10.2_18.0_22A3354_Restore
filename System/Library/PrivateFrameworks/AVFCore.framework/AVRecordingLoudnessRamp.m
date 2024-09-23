@implementation AVRecordingLoudnessRamp

+ (float)defaultFloatValue
{
  return 0.0;
}

+ (id)recordingLoudnessRampWithStartValue:(float)a3 endValue:(float)a4 timeRange:(id *)a5
{
  __int128 v5;
  _OWORD v7[3];

  v5 = *(_OWORD *)&a5->var0.var3;
  v7[0] = *(_OWORD *)&a5->var0.var0;
  v7[1] = v5;
  v7[2] = *(_OWORD *)&a5->var1.var1;
  return (id)objc_msgSend(a1, "scheduledFloatValueRampWithStartValue:endValue:timeRange:", v7);
}

@end
