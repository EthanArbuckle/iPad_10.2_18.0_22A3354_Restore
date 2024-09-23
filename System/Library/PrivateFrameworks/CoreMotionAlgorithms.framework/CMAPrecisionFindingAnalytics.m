@implementation CMAPrecisionFindingAnalytics

- (CMAPrecisionFindingAnalytics)init
{
  CMAPrecisionFindingAnalytics *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CMAPrecisionFindingAnalytics;
  result = -[CMAPrecisionFindingAnalytics init](&v8, sel_init);
  if (result)
  {
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)&result->_timestampOfFirstRawRange = _Q0;
    *(_OWORD *)&result->_timestampOfPreviousDMSample = _Q0;
    *(_OWORD *)&result->_totalTimeDuringRevoke = 0u;
    *(_OWORD *)&result->_countWristDown = 0u;
    *(_OWORD *)&result->_countAcceptedRange = 0u;
    *(_QWORD *)((char *)&result->_countRawRangeDuringRevoke + 2) = 0;
    *(_OWORD *)&result->_minEstimatedHeight = 0u;
    *(_OWORD *)&result->_percentOfSessionInWristUp = 0u;
    *(_OWORD *)&result->_timeFromFirstRangeToFirstAcceptedRange = 0u;
    *(_OWORD *)&result->_meanRawRangeFrequencyThroughoutSession = 0u;
    *(_OWORD *)&result->_meanRawRangeFrequencyWhileConverging = 0u;
    *(_OWORD *)&result->_meanRawRangeFrequencyDuringRevoke = 0u;
    *(_OWORD *)&result->_maxEstimatedDeltaHeightOverSession = 0u;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMAPrecisionFindingAnalytics;
  -[CMAPrecisionFindingAnalytics dealloc](&v3, sel_dealloc);
}

- (void)feedDeviceMotion:(CMADeviceMotionType *)a3
{
  float32x4_t v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  float v17;
  int countDM;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  double timestampOfPreviousDMSample;
  double v29;
  float32x4_t v30;

  if (self->_timestampOfFirstDMSample == -1.0)
    self->_timestampOfFirstDMSample = a3->var0;
  self->_timestampOfRecentDMSample = a3->var0;
  if (self->_crown && self->_wrist)
  {
    ++self->_countDM;
    v5 = *(float32x4_t *)&a3->var1.var2;
    v30 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a3->var1.var0), (float64x2_t)v5);
    sub_21B89329C(&v30, v5);
    v6 = sub_21B893020(v30.f32);
    v8 = v7;
    v10 = v9 * v9;
    v11 = sqrtf((float)(v9 * v9) + (float)(v7 * v7));
    v12 = atan2f(v11, v6);
    if (self->_wrist == self->_crown)
      v12 = atan2f(v11, -v6);
    v13 = v12;
    v17 = atan2f(sqrtf((float)(v6 * v6) + v10), v8);
    if (v13 < 1.9199 && v13 > 1.309 && v17 > 1.5708)
      ++self->_countWristUp;
    if (v13 < 1.0472)
      ++self->_countWristDown;
    countDM = self->_countDM;
    if (countDM >= 1)
    {
      v19 = objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v14, v15, v16, (double)self->_countWristUp / (double)countDM * 100.0);
      objc_msgSend_setPercentOfSessionInWristUp_(self, v20, v19, v21);
      v25 = objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v22, v23, v24, (double)self->_countWristDown / (double)self->_countDM * 100.0);
      objc_msgSend_setPercentOfSessionInWristDown_(self, v26, v25, v27);
    }
    if (self->_wasFirstArcShown && self->_revokeReason == 2)
    {
      timestampOfPreviousDMSample = self->_timestampOfPreviousDMSample;
      if (timestampOfPreviousDMSample > 0.0)
      {
        v29 = a3->var0 - timestampOfPreviousDMSample;
        if (v29 > 0.0)
          self->_totalTimeDuringRevoke = v29 + self->_totalTimeDuringRevoke;
      }
    }
    self->_timestampOfPreviousDMSample = a3->var0;
  }
}

- (void)feedRange:(CMARangeType *)a3
{
  uint64_t v3;
  double timestampOfFirstRawRange;
  int v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  int v17;
  double totalTimeDuringRevoke;
  uint64_t v19;
  uint64_t v20;

  timestampOfFirstRawRange = self->_timestampOfFirstRawRange;
  if (timestampOfFirstRawRange == -1.0)
  {
    timestampOfFirstRawRange = a3->timestamp;
    self->_timestampOfFirstRawRange = a3->timestamp;
  }
  v6 = self->_countRawRange + 1;
  self->_countRawRange = v6;
  if (self->_timestampOfFirstDMSample > 0.0)
  {
    v7 = objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], a2, (uint64_t)a3, v3, (double)v6 / (self->_timestampOfRecentDMSample - timestampOfFirstRawRange));
    objc_msgSend_setMeanRawRangeFrequencyThroughoutSession_(self, v8, v7, v9);
    if (self->_wasFirstRangeAccepted && !self->_wasFirstArcShown)
    {
      v13 = self->_countRawRangeWhileConverging + 1;
      self->_countRawRangeWhileConverging = v13;
      v14 = objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v10, v11, v12, (double)v13 / (self->_timestampOfRecentDMSample - self->_timestampOfFirstAcceptedRange));
      objc_msgSend_setMeanRawRangeFrequencyWhileConverging_(self, v15, v14, v16);
    }
    if (self->_wasFirstArcShown && self->_revokeReason == 2)
    {
      v17 = self->_countRawRangeDuringRevoke + 1;
      self->_countRawRangeDuringRevoke = v17;
      totalTimeDuringRevoke = self->_totalTimeDuringRevoke;
      if (totalTimeDuringRevoke > 0.0)
      {
        v19 = objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v10, v11, v12, (double)v17 / totalTimeDuringRevoke);
        MEMORY[0x24BEDD108](self, sel_setMeanRawRangeFrequencyDuringRevoke_, v19, v20);
      }
    }
  }
}

- (void)feedWatchOrientation:(CMAWatchOrientationStruct)a3
{
  *(_QWORD *)&self->_crown = __ROR8__(*(_QWORD *)&a3.wrist, 32);
}

- (void)feedAcceptedRange:(CMARangeType *)a3
{
  uint64_t v3;
  double timestamp;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  int v27;
  double totalTimeDuringRevoke;
  uint64_t v29;
  uint64_t v30;

  if (self->_timestampOfFirstAcceptedRange == -1.0)
  {
    timestamp = a3->timestamp;
    self->_timestampOfFirstAcceptedRange = a3->timestamp;
    v7 = objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], a2, (uint64_t)a3, v3, timestamp - self->_timestampOfFirstRawRange);
    objc_msgSend_setTimeFromFirstRangeToFirstAcceptedRange_(self, v8, v7, v9);
    v13 = objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v10, v11, v12, a3->range);
    objc_msgSend_setFirstAcceptedRange_(self, v14, v13, v15);
    self->_wasFirstRangeAccepted = 1;
  }
  v16 = self->_countAcceptedRange + 1;
  self->_countAcceptedRange = v16;
  if (self->_timestampOfFirstDMSample > 0.0)
  {
    v17 = objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], a2, (uint64_t)a3, v3, (double)v16 / (self->_timestampOfRecentDMSample - self->_timestampOfFirstAcceptedRange));
    objc_msgSend_setMeanAcceptedRangeFrequencyThroughoutSession_(self, v18, v17, v19);
    if (self->_wasFirstRangeAccepted && !self->_wasFirstArcShown)
    {
      v23 = self->_countAcceptedRangeWhileConverging + 1;
      self->_countAcceptedRangeWhileConverging = v23;
      v24 = objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v20, v21, v22, (double)v23 / (self->_timestampOfRecentDMSample - self->_timestampOfFirstAcceptedRange));
      objc_msgSend_setMeanAcceptedRangeFrequencyWhileConverging_(self, v25, v24, v26);
    }
    if (self->_wasFirstArcShown && self->_revokeReason == 2)
    {
      v27 = self->_countAcceptedRangeDuringRevoke + 1;
      self->_countAcceptedRangeDuringRevoke = v27;
      totalTimeDuringRevoke = self->_totalTimeDuringRevoke;
      if (totalTimeDuringRevoke > 0.0)
      {
        v29 = objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v20, v21, v22, (double)v27 / totalTimeDuringRevoke);
        MEMORY[0x24BEDD108](self, sel_setMeanAcceptedFrequencyQualityDuringRevoke_, v29, v30);
      }
    }
  }
}

- (void)feedRevokeReason:(int)a3
{
  self->_revokeReason = a3;
  if (!a3)
    self->_wasFirstArcShown = 1;
}

- (void)feedEstimatedHeight:(double)maxEstimatedHeight
{
  uint64_t v3;
  uint64_t v4;
  double minEstimatedHeight;
  uint64_t v7;
  uint64_t v8;

  minEstimatedHeight = self->_minEstimatedHeight;
  if (minEstimatedHeight > maxEstimatedHeight)
    minEstimatedHeight = maxEstimatedHeight;
  if (self->_maxEstimatedHeight >= maxEstimatedHeight)
    maxEstimatedHeight = self->_maxEstimatedHeight;
  self->_minEstimatedHeight = minEstimatedHeight;
  self->_maxEstimatedHeight = maxEstimatedHeight;
  v7 = objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], a2, v3, v4, vabdd_f64(maxEstimatedHeight, minEstimatedHeight));
  MEMORY[0x24BEDD108](self, sel_setMaxEstimatedDeltaHeightOverSession_, v7, v8);
}

- (void)feedFractionAboveThreshold:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  uint64_t v18;

  v7 = objc_msgSend_maxPercentParticlesAboveHeightThreshold(self, a2, v3, v4);
  v11 = (void *)MEMORY[0x24BDD16E0];
  if (v7)
  {
    v12 = (void *)objc_msgSend_maxPercentParticlesAboveHeightThreshold(self, v8, v9, v10);
    objc_msgSend_doubleValue(v12, v13, v14, v15);
    if (v16 >= a3)
      a3 = v16;
  }
  v17 = objc_msgSend_numberWithDouble_(v11, v8, v9, v10, a3);
  MEMORY[0x24BEDD108](self, sel_setMaxPercentParticlesAboveHeightThreshold_, v17, v18);
}

- (id)analyticsDictionary
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t RangeToFirstAcceptedRange;
  const char *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t AcceptedRange;
  const char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;

  v5 = (void *)objc_msgSend_dictionary(MEMORY[0x24BDBCED8], a2, v2, v3);
  if (objc_msgSend_percentOfSessionInWristUp(self, v6, v7, v8))
  {
    v12 = objc_msgSend_percentOfSessionInWristUp(self, v9, v10, v11);
    objc_msgSend_setObject_forKey_(v5, v13, v12, (uint64_t)CFSTR("PercentOfSessionInWristUp"));
  }
  if (objc_msgSend_percentOfSessionInWristDown(self, v9, v10, v11))
  {
    v17 = objc_msgSend_percentOfSessionInWristDown(self, v14, v15, v16);
    objc_msgSend_setObject_forKey_(v5, v18, v17, (uint64_t)CFSTR("PercentOfSessionInWristDown"));
  }
  if (objc_msgSend_timeFromFirstRangeToFirstAcceptedRange(self, v14, v15, v16))
  {
    RangeToFirstAcceptedRange = objc_msgSend_timeFromFirstRangeToFirstAcceptedRange(self, v19, v20, v21);
    objc_msgSend_setObject_forKey_(v5, v23, RangeToFirstAcceptedRange, (uint64_t)CFSTR("TimeFromFirstRangeToFirstAcceptedRange"));
  }
  if (objc_msgSend_firstAcceptedRange(self, v19, v20, v21))
  {
    AcceptedRange = objc_msgSend_firstAcceptedRange(self, v24, v25, v26);
    objc_msgSend_setObject_forKey_(v5, v28, AcceptedRange, (uint64_t)CFSTR("FirstAcceptedRange"));
  }
  if (objc_msgSend_meanRawRangeFrequencyThroughoutSession(self, v24, v25, v26))
  {
    v32 = objc_msgSend_meanRawRangeFrequencyThroughoutSession(self, v29, v30, v31);
    objc_msgSend_setObject_forKey_(v5, v33, v32, (uint64_t)CFSTR("MeanRawRangeFrequencyThroughoutSession"));
  }
  if (objc_msgSend_meanAcceptedRangeFrequencyThroughoutSession(self, v29, v30, v31))
  {
    v37 = objc_msgSend_meanAcceptedRangeFrequencyThroughoutSession(self, v34, v35, v36);
    objc_msgSend_setObject_forKey_(v5, v38, v37, (uint64_t)CFSTR("MeanAcceptedRangeFrequencyThroughoutSession"));
  }
  if (objc_msgSend_meanRawRangeFrequencyWhileConverging(self, v34, v35, v36))
  {
    v42 = objc_msgSend_meanRawRangeFrequencyWhileConverging(self, v39, v40, v41);
    objc_msgSend_setObject_forKey_(v5, v43, v42, (uint64_t)CFSTR("MeanRawRangeFrequencyWhileConverging"));
  }
  if (objc_msgSend_meanAcceptedRangeFrequencyWhileConverging(self, v39, v40, v41))
  {
    v47 = objc_msgSend_meanAcceptedRangeFrequencyWhileConverging(self, v44, v45, v46);
    objc_msgSend_setObject_forKey_(v5, v48, v47, (uint64_t)CFSTR("MeanAcceptedRangeFrequencyWhileConverging"));
  }
  if (objc_msgSend_meanRawRangeFrequencyDuringRevoke(self, v44, v45, v46))
  {
    v52 = objc_msgSend_meanRawRangeFrequencyDuringRevoke(self, v49, v50, v51);
    objc_msgSend_setObject_forKey_(v5, v53, v52, (uint64_t)CFSTR("MeanRawRangeFrequencyDuringRevoke"));
  }
  if (objc_msgSend_meanAcceptedFrequencyQualityDuringRevoke(self, v49, v50, v51))
  {
    v57 = objc_msgSend_meanAcceptedFrequencyQualityDuringRevoke(self, v54, v55, v56);
    objc_msgSend_setObject_forKey_(v5, v58, v57, (uint64_t)CFSTR("MeanAcceptedFrequencyQualityDuringRevoke"));
  }
  if (objc_msgSend_maxEstimatedDeltaHeightOverSession(self, v54, v55, v56))
  {
    v62 = objc_msgSend_maxEstimatedDeltaHeightOverSession(self, v59, v60, v61);
    objc_msgSend_setObject_forKey_(v5, v63, v62, (uint64_t)CFSTR("MaxEstimatedDeltaHeightOverSession"));
  }
  if (objc_msgSend_maxPercentParticlesAboveHeightThreshold(self, v59, v60, v61))
  {
    v67 = objc_msgSend_maxPercentParticlesAboveHeightThreshold(self, v64, v65, v66);
    objc_msgSend_setObject_forKey_(v5, v68, v67, (uint64_t)CFSTR("MaxPercentParticlesAboveHeightThreshold"));
  }
  return v5;
}

- (NSNumber)percentOfSessionInWristUp
{
  return self->_percentOfSessionInWristUp;
}

- (void)setPercentOfSessionInWristUp:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

- (NSNumber)percentOfSessionInWristDown
{
  return self->_percentOfSessionInWristDown;
}

- (void)setPercentOfSessionInWristDown:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

- (NSNumber)timeFromFirstRangeToFirstAcceptedRange
{
  return self->_timeFromFirstRangeToFirstAcceptedRange;
}

- (void)setTimeFromFirstRangeToFirstAcceptedRange:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 144);
}

- (NSNumber)firstAcceptedRange
{
  return self->_firstAcceptedRange;
}

- (void)setFirstAcceptedRange:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 152);
}

- (NSNumber)meanRawRangeFrequencyThroughoutSession
{
  return self->_meanRawRangeFrequencyThroughoutSession;
}

- (void)setMeanRawRangeFrequencyThroughoutSession:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 160);
}

- (NSNumber)meanAcceptedRangeFrequencyThroughoutSession
{
  return self->_meanAcceptedRangeFrequencyThroughoutSession;
}

- (void)setMeanAcceptedRangeFrequencyThroughoutSession:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 168);
}

- (NSNumber)meanRawRangeFrequencyWhileConverging
{
  return self->_meanRawRangeFrequencyWhileConverging;
}

- (void)setMeanRawRangeFrequencyWhileConverging:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 176);
}

- (NSNumber)meanAcceptedRangeFrequencyWhileConverging
{
  return self->_meanAcceptedRangeFrequencyWhileConverging;
}

- (void)setMeanAcceptedRangeFrequencyWhileConverging:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 184);
}

- (NSNumber)meanRawRangeFrequencyDuringRevoke
{
  return self->_meanRawRangeFrequencyDuringRevoke;
}

- (void)setMeanRawRangeFrequencyDuringRevoke:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 192);
}

- (NSNumber)meanAcceptedFrequencyQualityDuringRevoke
{
  return self->_meanAcceptedFrequencyQualityDuringRevoke;
}

- (void)setMeanAcceptedFrequencyQualityDuringRevoke:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 200);
}

- (NSNumber)maxEstimatedDeltaHeightOverSession
{
  return self->_maxEstimatedDeltaHeightOverSession;
}

- (void)setMaxEstimatedDeltaHeightOverSession:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 208);
}

- (NSNumber)maxPercentParticlesAboveHeightThreshold
{
  return self->_maxPercentParticlesAboveHeightThreshold;
}

- (void)setMaxPercentParticlesAboveHeightThreshold:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 216);
}

@end
