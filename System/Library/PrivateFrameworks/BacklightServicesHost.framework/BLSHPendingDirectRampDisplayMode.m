@implementation BLSHPendingDirectRampDisplayMode

- (BLSHPendingDirectRampDisplayMode)initWithRampBeginDisplayMode:(int64_t)a3 targetDisplayMode:(int64_t)a4
{
  BLSHPendingDirectRampDisplayMode *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BLSHPendingDirectRampDisplayMode;
  result = -[BLSHPendingUpdateDisplayMode initWithCurrentDisplayMode:targetDisplayMode:](&v6, sel_initWithCurrentDisplayMode_targetDisplayMode_, a3, a4);
  if (result)
  {
    result->_rampBeginDisplayMode = a3;
    result->_readyToStart = 1;
  }
  return result;
}

- (BOOL)isDirectRamp
{
  return 1;
}

- (id)updateOperation
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[BLSHPendingTwoPhaseUpdateDisplayMode previous](self, "previous");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[BLSHPendingTwoPhaseUpdateDisplayMode next](self, "next");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  _BOOL8 v5;
  const __CFString *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLSHPendingTwoPhaseUpdateDisplayMode previous](self, "previous");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[BLSHPendingTwoPhaseUpdateDisplayMode isStarted](self, "isStarted");
  if (v4)
    v6 = CFSTR("started");
  else
    v6 = CFSTR("bothStarted");
  v7 = (id)objc_msgSend(v3, "appendBool:withName:", v5, v6);
  v8 = (id)objc_msgSend(v3, "appendBool:withName:", -[BLSHPendingDirectRampDisplayMode isReadyToStart](self, "isReadyToStart"), CFSTR("isReadyToStart"));
  v9 = (id)objc_msgSend(v3, "appendBool:withName:", -[BLSHPendingUpdateDisplayMode isCompleted](self, "isCompleted"), CFSTR("completed"));
  NSStringFromBLSBacklightDisplayMode(self->_rampBeginDisplayMode);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v10, CFSTR("begin"));

  NSStringFromBLSBacklightDisplayMode(-[BLSHPendingUpdateDisplayMode targetDisplayMode](self, "targetDisplayMode"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v11, CFSTR("target"));

  v12 = (id)objc_msgSend(v3, "appendTimeInterval:withName:decomposeUnits:", CFSTR("duration"), 1, self->_duration);
  v13 = (id)objc_msgSend(v3, "appendPointer:withName:", v4, CFSTR("previous"));
  -[BLSHPendingTwoPhaseUpdateDisplayMode next](self, "next");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v3, "appendObject:withName:", v14, CFSTR("next"));

  objc_msgSend(v3, "build");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (int64_t)rampBeginDisplayMode
{
  return self->_rampBeginDisplayMode;
}

- (BOOL)isReadyToStart
{
  return self->_readyToStart;
}

- (void)setReadyToStart:(BOOL)a3
{
  self->_readyToStart = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

@end
