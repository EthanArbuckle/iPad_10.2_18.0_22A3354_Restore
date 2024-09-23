@implementation BWFrameStatistics

- (void)_setDisplayStrobeRGBEstimate:(id)a3
{
  NSArray *displayStrobeRGBEstimate;

  displayStrobeRGBEstimate = self->_displayStrobeRGBEstimate;
  if (displayStrobeRGBEstimate != a3)
  {

    self->_displayStrobeRGBEstimate = (NSArray *)a3;
  }
}

- (void)_setColorCorrectionMatrix:(id)a3
{
  NSData *colorCorrectionMatrix;

  colorCorrectionMatrix = self->_colorCorrectionMatrix;
  if (colorCorrectionMatrix != a3)
  {

    self->_colorCorrectionMatrix = (NSData *)a3;
  }
}

- (void)_setAEStatistics:(id)a3
{
  NSDictionary *aeStatistics;

  aeStatistics = self->_aeStatistics;
  if (aeStatistics != a3)
  {

    self->_aeStatistics = (NSDictionary *)a3;
  }
}

- (NSArray)displayStrobeRGBEstimate
{
  return self->_displayStrobeRGBEstimate;
}

- (NSData)colorCorrectionMatrix
{
  return self->_colorCorrectionMatrix;
}

- (NSDictionary)aeStatistics
{
  return self->_aeStatistics;
}

- ($CDAAB53AF0D0843407507AB6EB17E647)frameStatisticsStorage
{
  return self->_storage;
}

- (_QWORD)initWthPortType:(uint64_t)a3 storage:
{
  _QWORD *v5;
  objc_super v7;

  if (!a1)
    return 0;
  v7.receiver = a1;
  v7.super_class = (Class)BWFrameStatistics;
  v5 = objc_msgSendSuper2(&v7, sel_init);
  if (v5)
  {
    v5[1] = a2;
    v5[5] = a3;
  }
  return v5;
}

- (unsigned)aeAverage
{
  return self->_storage->var17;
}

- (unsigned)aeTarget
{
  return self->_storage->var19;
}

- (double)eit
{
  return self->_storage->var9 * self->_storage->var14;
}

- (double)exposureBias
{
  return self->_storage->var16;
}

- (double)integrationTime
{
  return self->_storage->var9;
}

- (NSString)portType
{
  return self->_portType;
}

- (float)sifrGain
{
  return self->_storage->var25;
}

- (unsigned)readNoise_8x
{
  return self->_storage->var6;
}

- (unsigned)readNoise_1x
{
  return self->_storage->var5;
}

- (unsigned)motionDataStatus
{
  return self->_storage->var38;
}

- (unsigned)ispDGain
{
  return self->_storage->var11;
}

- (float)ispDGainRangeExpansionFactor
{
  return self->_storage->var13;
}

- (BOOL)hrEnabled
{
  return self->_storage->var24;
}

- (unsigned)conversionGain
{
  return self->_storage->var4;
}

- (BOOL)aeLocked
{
  return self->_storage->var22;
}

- (NSString)afRecommendedMasterPortType
{
  return (NSString *)self->_storage->var37;
}

- (BOOL)aeLimitsReached
{
  return self->_storage->var20;
}

- (float)gain
{
  return self->_storage->var14;
}

- (int)afStatus
{
  return self->_storage->var26;
}

- (int)focusingMethod
{
  return self->_storage->var29;
}

- (float)focusDistance
{
  return self->_storage->var36;
}

- (unsigned)luxLevel
{
  return self->_storage->var3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)pts
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)self[1].var3;
  return self;
}

- (int)logicalFocusLensPosition
{
  return self->_storage->var32;
}

- (BOOL)aeStable
{
  return self->_storage->var21;
}

- (int)filteredLogicalFocusLensPosition
{
  return self->_storage->var34;
}

- (int)filteredLogicalFocusLensPositionStep
{
  return self->_storage->var35;
}

- (int)logicalFocusLensPositionStep
{
  return self->_storage->var33;
}

- (int)focusPositionStep
{
  return self->_storage->var31;
}

- (int)afStationaryCount
{
  return self->_storage->var28;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWFrameStatistics;
  -[BWFrameStatistics dealloc](&v3, sel_dealloc);
}

- (void)reset
{
  if (a1)
  {

    a1[2] = 0;
    a1[3] = 0;

    a1[4] = 0;
  }
}

- (float)currentFrameRate
{
  return self->_storage->var1;
}

- (CGRect)finalCropRect
{
  $CDAAB53AF0D0843407507AB6EB17E647 *storage;
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  storage = self->_storage;
  x = storage->var2.origin.x;
  y = storage->var2.origin.y;
  width = storage->var2.size.width;
  height = storage->var2.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (float)normalizedSNR
{
  return self->_storage->var7;
}

- (float)normalizedQsumSNR
{
  return self->_storage->var8;
}

- (unsigned)agc
{
  return self->_storage->var10;
}

- (unsigned)sensorDGain
{
  return self->_storage->var12;
}

- (float)baseISO
{
  return self->_storage->var15;
}

- (unsigned)aeFaceAverage
{
  return self->_storage->var18;
}

- (int)motionFromAEMatrix
{
  return self->_storage->var23;
}

- (BOOL)afLocked
{
  return self->_storage->var27;
}

- (int)focusPosition
{
  return self->_storage->var30;
}

- (float)motionDataBiasErrorEstimate
{
  return self->_storage->var39;
}

- (int)ltmCurve
{
  return self->_storage->var40;
}

- (BOOL)awbStable
{
  return self->_storage->var41;
}

- (BOOL)awbLocked
{
  return self->_storage->var42;
}

- (unsigned)awbRGain
{
  return self->_storage->var43;
}

- (unsigned)awbGGain
{
  return self->_storage->var44;
}

- (unsigned)awbBGain
{
  return self->_storage->var45;
}

- (unsigned)awbComboRGain
{
  return self->_storage->var46;
}

- (unsigned)awbComboGGain
{
  return self->_storage->var47;
}

- (unsigned)awbComboBGain
{
  return self->_storage->var48;
}

- (unsigned)awbSkinRGain
{
  return self->_storage->var49;
}

- (unsigned)awbSkinGGain
{
  return self->_storage->var50;
}

- (unsigned)awbSkinBGain
{
  return self->_storage->var51;
}

- (unsigned)awbSpatialCCMMixingFactor
{
  return self->_storage->var52;
}

- (unsigned)cct
{
  return self->_storage->var53;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  $CDAAB53AF0D0843407507AB6EB17E647 *storage;
  __int128 v6;
  Float64 Seconds;
  $CDAAB53AF0D0843407507AB6EB17E647 *v8;
  double var1;
  CGPoint origin;
  CGFloat width;
  CGFloat height;
  double var7;
  double var9;
  float var15;
  double var14;
  double v17;
  float var39;
  double v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  _BOOL8 var20;
  NSString *portType;
  NSString *v30;
  void *v31;
  CMTime time;

  v31 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  portType = self->_portType;
  v30 = v4;
  storage = self->_storage;
  v6 = *(_OWORD *)&storage->var0.var0;
  time.epoch = storage->var0.var3;
  *(_OWORD *)&time.value = v6;
  Seconds = CMTimeGetSeconds(&time);
  v8 = self->_storage;
  var1 = v8->var1;
  origin = v8->var2.origin;
  width = v8->var2.size.width;
  height = v8->var2.size.height;
  var7 = v8->var7;
  var9 = v8->var9;
  var15 = v8->var15;
  var14 = v8->var14;
  v17 = var15;
  var20 = v8->var20;
  var39 = v8->var39;
  v19 = var39;
  LOWORD(var39) = v8->var43;
  LOWORD(var15) = v8->var44;
  LOWORD(v20) = v8->var45;
  LOWORD(v21) = v8->var46;
  LOWORD(v22) = v8->var47;
  LOWORD(v23) = v8->var48;
  LOWORD(v24) = v8->var49;
  LOWORD(v25) = v8->var50;
  LOWORD(v26) = v8->var51;
  return (id)objc_msgSend(v31, "stringWithFormat:", CFSTR("<%p: %@>: portType: %@, pts:%.3f, currentFrameRate:%.3f, finalCropRect:{origin:(%.3f,%.3f),size:(%.3f,%.3f)}, luxLevel:%d, conversionGain:%d, readNoise_1x:%d, readNoise_8x:%d, normalizedSNR:%f, integrationTime:%f, gain:%f, baseISO:%f, exposureBias:%f, aeAverage:%d, aeFaceAverage:%d, aeTarget:%d, aeLimitsReached:%d, aeStable:%d, aeLocked:%d, motionFromAEMatrix:%d, hasAEStatistics:%d, hrEnabled:%d, sifrGain:%f, afStatus:%d, afLocked:%d, afStationaryCount:%d, focusingMethod:%d, focusPosition:%d, focusPositionStep:%d, logicalFocusPosition:%d, logicalFocusPositionStep:%d, focusDistance:%f, afRecommendedMasterPortType:%@, motionDataStatus:%d, motionDataBiasErrorEstimate:%f, ltmCurve:%d, hasDisplayStrobeRGBEstimate:%d, awbStable:%d, awbLocked:%d, awbRGBGains:(%.3f, %.3f, %.3f), awbComboRGBGains:(%.3f, %.3f, %.3f), awbSkinRGBGains:(%.3f, %.3f, %.3f), awbSpatialCCMMixingFactor:%f, cct:%d, hasCCM:%d"), self, v30, portType, *(_QWORD *)&Seconds, *(_QWORD *)&var1, origin, *(_QWORD *)&width, *(_QWORD *)&height, v8->var3, v8->var4, v8->var5, v8->var6, *(_QWORD *)&var7, *(_QWORD *)&var9, *(_QWORD *)&var14, *(_QWORD *)&v17,
               *(_QWORD *)&v8->var16,
               v8->var17,
               v8->var18,
               v8->var19,
               var20,
               v8->var21,
               v8->var22,
               v8->var23,
               self->_aeStatistics != 0,
               v8->var24,
               v8->var25,
               v8->var26,
               v8->var27,
               v8->var28,
               v8->var29,
               v8->var30,
               v8->var31,
               v8->var32,
               v8->var33,
               v8->var36,
               v8->var37,
               v8->var38,
               *(_QWORD *)&v19,
               v8->var40,
               self->_displayStrobeRGBEstimate != 0,
               v8->var41,
               v8->var42,
               (float)((float)LODWORD(var39) * 0.00024414),
               (float)((float)LODWORD(var15) * 0.00024414),
               (float)((float)v20 * 0.00024414),
               (float)((float)v21 * 0.00024414),
               (float)((float)v22 * 0.00024414),
               (float)((float)v23 * 0.00024414),
               (float)((float)v24 * 0.00024414),
               (float)((float)v25 * 0.00024414),
               (float)((float)v26 * 0.00024414),
               (float)((float)v8->var52 * 0.0039062),
               v8->var53,
               self->_colorCorrectionMatrix != 0);
}

@end
