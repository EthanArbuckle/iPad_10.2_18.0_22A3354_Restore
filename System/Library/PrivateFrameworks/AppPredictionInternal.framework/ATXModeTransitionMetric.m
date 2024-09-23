@implementation ATXModeTransitionMetric

- (ATXModeTransitionMetric)initWithPreviousModeSemanticType:(id)a3 previousModeDuration:(double)a4 previousModeHadScheduledExit:(BOOL)a5 exitReason:(id)a6 enterReason:(id)a7 transitionDeviceType:(id)a8 transitionSource:(id)a9 nextModeSemanticType:(id)a10
{
  id v18;
  id v19;
  ATXModeTransitionMetric *v20;
  ATXModeTransitionMetric *v21;
  id v23;
  id v24;
  id v25;
  id v26;
  objc_super v27;

  v26 = a3;
  v25 = a6;
  v24 = a7;
  v23 = a8;
  v18 = a9;
  v19 = a10;
  v27.receiver = self;
  v27.super_class = (Class)ATXModeTransitionMetric;
  v20 = -[_ATXCoreAnalyticsMetric init](&v27, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_previousModeSemanticType, a3);
    v21->_previousModeDuration = a4;
    v21->_previousModeHadScheduledExit = a5;
    objc_storeStrong((id *)&v21->_exitReason, a6);
    objc_storeStrong((id *)&v21->_enterReason, a7);
    objc_storeStrong((id *)&v21->_transitionDeviceType, a8);
    objc_storeStrong((id *)&v21->_transitionSource, a9);
    objc_storeStrong((id *)&v21->_nextModeSemanticType, a10);
  }

  return v21;
}

- (id)metricName
{
  return CFSTR("com.apple.ModeActivity.ModeTransition");
}

- (id)coreAnalyticsDictionary
{
  uint64_t previousModeSemanticType;
  uint64_t exitReason;
  uint64_t enterReason;
  uint64_t transitionDeviceType;
  uint64_t transitionSource;
  uint64_t nextModeSemanticType;
  uint64_t inferredModeConfidenceScore;
  uint64_t inferredModeDuration;
  uint64_t inferredModeOriginAnchorType;
  NSString *inferredModeType;
  uint64_t v13;
  NSNumber *inferredModeUILocation;
  uint64_t v15;
  NSString *previousModeOrigin;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSString *currentModeOrigin;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  _QWORD v48[19];
  _QWORD v49[21];

  v49[19] = *MEMORY[0x1E0C80C00];
  previousModeSemanticType = (uint64_t)self->_previousModeSemanticType;
  v47 = previousModeSemanticType;
  v48[0] = CFSTR("previousMode");
  if (!previousModeSemanticType)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    previousModeSemanticType = objc_claimAutoreleasedReturnValue();
  }
  v35 = (void *)previousModeSemanticType;
  v49[0] = previousModeSemanticType;
  v48[1] = CFSTR("previousModeDuration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_previousModeDuration);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v46;
  v48[2] = CFSTR("previousHadScheduledExit");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_previousModeHadScheduledExit);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v49[2] = v45;
  v48[3] = CFSTR("exitReason");
  exitReason = (uint64_t)self->_exitReason;
  v44 = exitReason;
  if (!exitReason)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    exitReason = objc_claimAutoreleasedReturnValue();
  }
  v34 = (void *)exitReason;
  v49[3] = exitReason;
  v48[4] = CFSTR("enterReason");
  enterReason = (uint64_t)self->_enterReason;
  v43 = enterReason;
  if (!enterReason)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    enterReason = objc_claimAutoreleasedReturnValue();
  }
  v33 = (void *)enterReason;
  v49[4] = enterReason;
  v48[5] = CFSTR("transitionDeviceType");
  transitionDeviceType = (uint64_t)self->_transitionDeviceType;
  v42 = transitionDeviceType;
  if (!transitionDeviceType)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    transitionDeviceType = objc_claimAutoreleasedReturnValue();
  }
  v32 = (void *)transitionDeviceType;
  v49[5] = transitionDeviceType;
  v48[6] = CFSTR("transitionSource");
  transitionSource = (uint64_t)self->_transitionSource;
  v41 = transitionSource;
  if (!transitionSource)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    transitionSource = objc_claimAutoreleasedReturnValue();
  }
  v31 = (void *)transitionSource;
  v49[6] = transitionSource;
  v48[7] = CFSTR("nextMode");
  nextModeSemanticType = (uint64_t)self->_nextModeSemanticType;
  v40 = nextModeSemanticType;
  if (!nextModeSemanticType)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    nextModeSemanticType = objc_claimAutoreleasedReturnValue();
  }
  v30 = (void *)nextModeSemanticType;
  v49[7] = nextModeSemanticType;
  v48[8] = CFSTR("inferredModeConfidenceScore");
  inferredModeConfidenceScore = (uint64_t)self->_inferredModeConfidenceScore;
  v39 = inferredModeConfidenceScore;
  if (!inferredModeConfidenceScore)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    inferredModeConfidenceScore = objc_claimAutoreleasedReturnValue();
  }
  v29 = (void *)inferredModeConfidenceScore;
  v49[8] = inferredModeConfidenceScore;
  v48[9] = CFSTR("inferredModeDuration");
  inferredModeDuration = (uint64_t)self->_inferredModeDuration;
  v38 = inferredModeDuration;
  if (!inferredModeDuration)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    inferredModeDuration = objc_claimAutoreleasedReturnValue();
  }
  v28 = (void *)inferredModeDuration;
  v49[9] = inferredModeDuration;
  v48[10] = CFSTR("inferredModeOriginAnchorType");
  inferredModeOriginAnchorType = (uint64_t)self->_inferredModeOriginAnchorType;
  v37 = inferredModeOriginAnchorType;
  if (!inferredModeOriginAnchorType)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    inferredModeOriginAnchorType = objc_claimAutoreleasedReturnValue();
  }
  v27 = (void *)inferredModeOriginAnchorType;
  v49[10] = inferredModeOriginAnchorType;
  v48[11] = CFSTR("inferredModeType");
  inferredModeType = self->_inferredModeType;
  v13 = (uint64_t)inferredModeType;
  if (!inferredModeType)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v26 = (void *)v13;
  v49[11] = v13;
  v48[12] = CFSTR("inferredModeUILocation");
  inferredModeUILocation = self->_inferredModeUILocation;
  v15 = (uint64_t)inferredModeUILocation;
  if (!inferredModeUILocation)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v25 = (void *)v15;
  v49[12] = v15;
  v48[13] = CFSTR("previousModeOrigin");
  previousModeOrigin = self->_previousModeOrigin;
  v17 = previousModeOrigin;
  if (!previousModeOrigin)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v49[13] = v17;
  v48[14] = CFSTR("appBasedSchedulingEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_appBasedSchedulingEnabled);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v49[14] = v18;
  v48[15] = CFSTR("timeBasedSchedulingEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_timeBasedSchedulingEnabled);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v49[15] = v19;
  v48[16] = CFSTR("locationBasedSchedulingEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_locationBasedSchedulingEnabled);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v49[16] = v20;
  v48[17] = CFSTR("smartActivationEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_smartActivationEnabled);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v49[17] = v21;
  v48[18] = CFSTR("currentModeOrigin");
  currentModeOrigin = self->_currentModeOrigin;
  v23 = currentModeOrigin;
  if (!currentModeOrigin)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v49[18] = v23;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 19);
  v36 = (id)objc_claimAutoreleasedReturnValue();
  if (!currentModeOrigin)

  if (previousModeOrigin)
  {
    if (inferredModeUILocation)
      goto LABEL_31;
LABEL_52:

    if (inferredModeType)
      goto LABEL_32;
    goto LABEL_53;
  }

  if (!inferredModeUILocation)
    goto LABEL_52;
LABEL_31:
  if (inferredModeType)
    goto LABEL_32;
LABEL_53:

LABEL_32:
  if (!v37)

  if (!v38)
  if (!v39)

  if (!v40)
  if (!v41)

  if (!v42)
  if (!v43)

  if (!v44)
  if (!v47)

  return v36;
}

- (id)description
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v23 = (void *)MEMORY[0x1E0CB3940];
  -[ATXModeTransitionMetric previousModeSemanticType](self, "previousModeSemanticType");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeTransitionMetric previousModeDuration](self, "previousModeDuration");
  v4 = v3;
  v21 = -[ATXModeTransitionMetric previousModeHadScheduledExit](self, "previousModeHadScheduledExit");
  -[ATXModeTransitionMetric exitReason](self, "exitReason");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeTransitionMetric enterReason](self, "enterReason");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeTransitionMetric transitionDeviceType](self, "transitionDeviceType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeTransitionMetric transitionSource](self, "transitionSource");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeTransitionMetric nextModeSemanticType](self, "nextModeSemanticType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeTransitionMetric inferredModeConfidenceScore](self, "inferredModeConfidenceScore");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeTransitionMetric inferredModeDuration](self, "inferredModeDuration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeTransitionMetric inferredModeOriginAnchorType](self, "inferredModeOriginAnchorType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeTransitionMetric inferredModeType](self, "inferredModeType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeTransitionMetric inferredModeUILocation](self, "inferredModeUILocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeTransitionMetric previousModeOrigin](self, "previousModeOrigin");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ATXModeTransitionMetric appBasedSchedulingEnabled](self, "appBasedSchedulingEnabled");
  v9 = -[ATXModeTransitionMetric timeBasedSchedulingEnabled](self, "timeBasedSchedulingEnabled");
  v10 = -[ATXModeTransitionMetric locationBasedSchedulingEnabled](self, "locationBasedSchedulingEnabled");
  v11 = -[ATXModeTransitionMetric smartActivationEnabled](self, "smartActivationEnabled");
  -[ATXModeTransitionMetric currentModeOrigin](self, "currentModeOrigin");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringWithFormat:", CFSTR("ATXModeTransitionMetric previousMode:%@\npreviousModeDuration:%f\npreviousHadScheduledExit:%d\nexitReason:%@\nenterReason:%@\ntransitionDeviceType:%@\ntransitionSource:%@\nnextMode:%@\ninferredModeConfidenceScore:%@\ninferredModeDuration:%@\ninferredModeOriginAnchorType:%@\ninferredModeType:%@\ninferredModeUILocation:%@\npreviousModeOrigin:%@\nappBasedSchedulingEnabled:%d\ntimeBasedSchedulingEnabled:%d\nlocationBasedSchedulingEnabled:%d\nsmartActivationEnabled:%d\ncurrentModeOrigin:%@\n"), v22, v4, v21, v20, v19, v18, v25, v15, v17, v14, v16, v5, v6, v7, v8, v9,
    v10,
    v11,
    v12);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (NSString)previousModeSemanticType
{
  return self->_previousModeSemanticType;
}

- (void)setPreviousModeSemanticType:(id)a3
{
  objc_storeStrong((id *)&self->_previousModeSemanticType, a3);
}

- (double)previousModeDuration
{
  return self->_previousModeDuration;
}

- (void)setPreviousModeDuration:(double)a3
{
  self->_previousModeDuration = a3;
}

- (BOOL)previousModeHadScheduledExit
{
  return self->_previousModeHadScheduledExit;
}

- (void)setPreviousModeHadScheduledExit:(BOOL)a3
{
  self->_previousModeHadScheduledExit = a3;
}

- (NSString)exitReason
{
  return self->_exitReason;
}

- (void)setExitReason:(id)a3
{
  objc_storeStrong((id *)&self->_exitReason, a3);
}

- (NSString)enterReason
{
  return self->_enterReason;
}

- (void)setEnterReason:(id)a3
{
  objc_storeStrong((id *)&self->_enterReason, a3);
}

- (NSNumber)inferredModeConfidenceScore
{
  return self->_inferredModeConfidenceScore;
}

- (void)setInferredModeConfidenceScore:(id)a3
{
  objc_storeStrong((id *)&self->_inferredModeConfidenceScore, a3);
}

- (NSNumber)inferredModeDuration
{
  return self->_inferredModeDuration;
}

- (void)setInferredModeDuration:(id)a3
{
  objc_storeStrong((id *)&self->_inferredModeDuration, a3);
}

- (NSString)inferredModeOriginAnchorType
{
  return self->_inferredModeOriginAnchorType;
}

- (void)setInferredModeOriginAnchorType:(id)a3
{
  objc_storeStrong((id *)&self->_inferredModeOriginAnchorType, a3);
}

- (NSString)inferredModeType
{
  return self->_inferredModeType;
}

- (void)setInferredModeType:(id)a3
{
  objc_storeStrong((id *)&self->_inferredModeType, a3);
}

- (NSNumber)inferredModeUILocation
{
  return self->_inferredModeUILocation;
}

- (void)setInferredModeUILocation:(id)a3
{
  objc_storeStrong((id *)&self->_inferredModeUILocation, a3);
}

- (NSString)previousModeOrigin
{
  return self->_previousModeOrigin;
}

- (void)setPreviousModeOrigin:(id)a3
{
  objc_storeStrong((id *)&self->_previousModeOrigin, a3);
}

- (NSString)currentModeOrigin
{
  return self->_currentModeOrigin;
}

- (void)setCurrentModeOrigin:(id)a3
{
  objc_storeStrong((id *)&self->_currentModeOrigin, a3);
}

- (NSString)transitionDeviceType
{
  return self->_transitionDeviceType;
}

- (void)setTransitionDeviceType:(id)a3
{
  objc_storeStrong((id *)&self->_transitionDeviceType, a3);
}

- (NSString)transitionSource
{
  return self->_transitionSource;
}

- (void)setTransitionSource:(id)a3
{
  objc_storeStrong((id *)&self->_transitionSource, a3);
}

- (NSString)nextModeSemanticType
{
  return self->_nextModeSemanticType;
}

- (void)setNextModeSemanticType:(id)a3
{
  objc_storeStrong((id *)&self->_nextModeSemanticType, a3);
}

- (BOOL)appBasedSchedulingEnabled
{
  return self->_appBasedSchedulingEnabled;
}

- (void)setAppBasedSchedulingEnabled:(BOOL)a3
{
  self->_appBasedSchedulingEnabled = a3;
}

- (BOOL)timeBasedSchedulingEnabled
{
  return self->_timeBasedSchedulingEnabled;
}

- (void)setTimeBasedSchedulingEnabled:(BOOL)a3
{
  self->_timeBasedSchedulingEnabled = a3;
}

- (BOOL)locationBasedSchedulingEnabled
{
  return self->_locationBasedSchedulingEnabled;
}

- (void)setLocationBasedSchedulingEnabled:(BOOL)a3
{
  self->_locationBasedSchedulingEnabled = a3;
}

- (BOOL)smartActivationEnabled
{
  return self->_smartActivationEnabled;
}

- (void)setSmartActivationEnabled:(BOOL)a3
{
  self->_smartActivationEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextModeSemanticType, 0);
  objc_storeStrong((id *)&self->_transitionSource, 0);
  objc_storeStrong((id *)&self->_transitionDeviceType, 0);
  objc_storeStrong((id *)&self->_currentModeOrigin, 0);
  objc_storeStrong((id *)&self->_previousModeOrigin, 0);
  objc_storeStrong((id *)&self->_inferredModeUILocation, 0);
  objc_storeStrong((id *)&self->_inferredModeType, 0);
  objc_storeStrong((id *)&self->_inferredModeOriginAnchorType, 0);
  objc_storeStrong((id *)&self->_inferredModeDuration, 0);
  objc_storeStrong((id *)&self->_inferredModeConfidenceScore, 0);
  objc_storeStrong((id *)&self->_enterReason, 0);
  objc_storeStrong((id *)&self->_exitReason, 0);
  objc_storeStrong((id *)&self->_previousModeSemanticType, 0);
}

@end
