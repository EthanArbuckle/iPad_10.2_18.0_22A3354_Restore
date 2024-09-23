@implementation BLSHBacklightDisplayStateMachineAbortContext

- (BLSHBacklightDisplayStateMachineAbortContext)initWithDisplayMode:(int64_t)a3 prewarmingDisplayMode:(int64_t)a4 lastSteadyStateDisplayMode:(int64_t)a5 caDisplayState:(int64_t)a6 cbDisplayMode:(int64_t)a7 showingBlankingWindow:(BOOL)a8 sleepRequested:(BOOL)a9 sleepImminent:(BOOL)a10 timeInSleepImminent:(double)a11 hasEnsureFlipbookCurrent:(BOOL)a12
{
  BLSHBacklightDisplayStateMachineAbortContext *v19;
  BLSHBacklightDisplayStateMachineAbortContext *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)BLSHBacklightDisplayStateMachineAbortContext;
  v19 = -[BLSHBacklightDisplayStateMachineAbortContext init](&v22, sel_init);
  v20 = v19;
  if (v19)
  {
    v19->_displayMode = a3;
    v19->_prewarmingDisplayMode = a4;
    v19->_lastSteadyStateDisplayMode = a5;
    v19->_caDisplayState = a6;
    v19->_cbDisplayMode = a7;
    v19->_showingBlankingWindow = a8;
    v19->_hasEnsureFlipbookCurrent = a12;
    v19->_sleepRequested = a9;
    v19->_sleepImminent = a10;
    v19->_timeInSleepImminent = a11;
    v19->_abortReason = 2;
    v19->_payloadSize = 20;
    -[BLSHBacklightDisplayStateMachineAbortContext _populatePayload](v19, "_populatePayload");
  }
  return v20;
}

- (NSString)abortReasonString
{
  if (self->_abortReason == 7)
    return (NSString *)CFSTR("DSM_SI");
  else
    return (NSString *)CFSTR("DSM");
}

- (void)setSleepImminentAbortReason
{
  self->_abortReason = 7;
}

- (BOOL)wantsPanic
{
  return self->_abortReason == 7;
}

- (void)_populatePayload
{
  _DWORD *v3;
  char v4;
  char v5;
  char v6;
  int64_t caDisplayState;
  char v9;

  v3 = malloc_type_calloc(1uLL, self->_payloadSize, 0xC3A90EB2uLL);
  *v3 = 1;
  v3[1] = self->_displayMode;
  v3[2] = self->_prewarmingDisplayMode;
  v3[3] = self->_lastSteadyStateDisplayMode;
  v4 = v3[4] & 0xFE | ((self->_caDisplayState & 0xFFFFFFFFFFFFFFFELL) == 2);
  *((_BYTE *)v3 + 16) = v4;
  *((_BYTE *)v3 + 16) = v4 & 0xFD | (2 * self->_showingBlankingWindow);
  v5 = v3[4] & 0xFB | (4 * (BLSBacklightFactorFromCBDisplayMode(self->_cbDisplayMode) != 0));
  *((_BYTE *)v3 + 16) = v5;
  v6 = v5 & 0xF7 | (8 * (self->_caDisplayState != 1));
  *((_BYTE *)v3 + 16) = v6;
  caDisplayState = self->_caDisplayState;
  if (caDisplayState == 3 || caDisplayState == 0)
    v9 = 16;
  else
    v9 = 0;
  *((_BYTE *)v3 + 16) = v9 | v6 & 0xEF;
  self->_payload = v3;
}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromBLSBacklightDisplayMode(self->_displayMode);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("displayMode"));

  v5 = (id)objc_msgSend(v3, "appendBool:withName:", self->_sleepRequested, CFSTR("sleepRequested"));
  v6 = (id)objc_msgSend(v3, "appendBool:withName:", self->_sleepImminent, CFSTR("sleepImminent"));
  v7 = (id)objc_msgSend(v3, "appendBool:withName:", self->_hasEnsureFlipbookCurrent, CFSTR("hasEnsureFlipbookCurrent"));
  if (self->_sleepImminent)
    v8 = (id)objc_msgSend(v3, "appendDouble:withName:decimalPrecision:", CFSTR("timeInSleepImminent"), 1, self->_timeInSleepImminent);
  NSStringFromBLSBacklightDisplayMode(self->_prewarmingDisplayMode);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v9, CFSTR("prewarmingDisplayMode"));

  NSStringFromBLSBacklightDisplayMode(self->_lastSteadyStateDisplayMode);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v10, CFSTR("lastSteadyStateDisplayMode"));

  NSStringFromCADisplayState();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v3, "appendObject:withName:", v11, CFSTR("caDisplayState"));

  NSStringFromCBDisplayMode_bls(self->_cbDisplayMode);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v3, "appendObject:withName:", v13, CFSTR("cbDisplayMode"));

  v15 = (id)objc_msgSend(v3, "appendBool:withName:", self->_showingBlankingWindow, CFSTR("showingBlankingWindow"));
  objc_msgSend(v3, "build");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v16;
}

- (void)dealloc
{
  void *payload;
  objc_super v4;

  payload = (void *)self->_payload;
  if (payload)
  {
    free(payload);
    self->_payload = 0;
    self->_payloadSize = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)BLSHBacklightDisplayStateMachineAbortContext;
  -[BLSHBacklightDisplayStateMachineAbortContext dealloc](&v4, sel_dealloc);
}

- (unint64_t)abortReason
{
  return self->_abortReason;
}

- (const)payload
{
  return self->_payload;
}

- (unsigned)payloadSize
{
  return self->_payloadSize;
}

- (BOOL)hasEnsureFlipbookCurrent
{
  return self->_hasEnsureFlipbookCurrent;
}

@end
