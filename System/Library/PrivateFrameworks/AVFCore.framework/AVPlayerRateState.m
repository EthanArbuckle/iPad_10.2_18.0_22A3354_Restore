@implementation AVPlayerRateState

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVPlayerRateState;
  -[AVPlayerRateState dealloc](&v3, sel_dealloc);
}

- (id)rateStateByUpdatingBasedOnFigPlayerPlaybackState:(int)a3 hasCurrentInterstitialEvent:(BOOL)a4 nameForLogging:(id)a5
{
  _BOOL8 v5;
  const __CFString *v6;
  uint64_t v7;

  v5 = a4;
  switch(a3)
  {
    case 1:
      v6 = CFSTR("AVPlayerWaitingWhileEvaluatingBufferingRateReason");
      goto LABEL_9;
    case 2:
      v6 = CFSTR("AVPlayerWaitingToMinimizeStallsReason");
      goto LABEL_9;
    case 3:
      v6 = CFSTR("AVPlayerWaitingWithNoItemToPlayReason");
      goto LABEL_9;
    case 4:
      v6 = 0;
      v7 = 2;
      return (id)objc_msgSend(-[AVPlayerRateState rateStateBySettingTimeControlStatus:reasonForWaitingToPlay:nameForLogging:](self, "rateStateBySettingTimeControlStatus:reasonForWaitingToPlay:nameForLogging:", v7, v6, a5), "rateStateByUpdatingBasedOnPresenceOfCurrentInterstitialEvent:nameForLogging:", v5, a5);
    case 5:
      v6 = CFSTR("AVPlayerWaitingForCoordinatedPlaybackReason");
      goto LABEL_9;
    case 6:
      v6 = CFSTR("AVPlayerWaitingDuringInterstitialEventReason");
LABEL_9:
      v7 = 1;
      break;
    default:
      v7 = 0;
      v6 = 0;
      break;
  }
  return (id)objc_msgSend(-[AVPlayerRateState rateStateBySettingTimeControlStatus:reasonForWaitingToPlay:nameForLogging:](self, "rateStateBySettingTimeControlStatus:reasonForWaitingToPlay:nameForLogging:", v7, v6, a5), "rateStateByUpdatingBasedOnPresenceOfCurrentInterstitialEvent:nameForLogging:", v5, a5);
}

- (id)rateStateByInferringTimeControlStatusAndWaitingReasonBasedOnPresenceOfCurrentItem:(BOOL)a3 hasCurrentInterstitialEvent:(BOOL)a4 nameForLogging:(id)a5
{
  _BOOL8 v6;
  _BOOL4 v7;
  int64_t v9;
  NSString *v10;
  float v11;
  uint64_t v12;
  const __CFString *v13;
  _BOOL4 v15;

  v6 = a4;
  v7 = a3;
  v9 = -[AVPlayerRateState timeControlStatus](self, "timeControlStatus");
  v10 = -[AVPlayerRateState reasonForWaitingToPlay](self, "reasonForWaitingToPlay");
  -[AVPlayerRateState rate](self, "rate");
  v12 = v11 != 0.0;
  if (v11 == 0.0)
    v13 = 0;
  else
    v13 = CFSTR("AVPlayerWaitingWithNoItemToPlayReason");
  if (v11 != 0.0 && v7)
  {
    if (-[AVPlayerRateState automaticallyWaitsToMinimizeStalling](self, "automaticallyWaitsToMinimizeStalling", v12))
    {
      if (v9 == 2)
      {
        v13 = 0;
        v12 = 2;
        return (id)objc_msgSend(-[AVPlayerRateState rateStateBySettingTimeControlStatus:reasonForWaitingToPlay:nameForLogging:](self, "rateStateBySettingTimeControlStatus:reasonForWaitingToPlay:nameForLogging:", v12, v13, a5), "rateStateByUpdatingBasedOnPresenceOfCurrentInterstitialEvent:nameForLogging:", v6, a5);
      }
    }
    else
    {
      v15 = -[AVPlayerRateState usesLegacyAutomaticWaitingBehavior](self, "usesLegacyAutomaticWaitingBehavior");
      v13 = 0;
      v12 = 2;
      if (!v15 || v9 == 2)
        return (id)objc_msgSend(-[AVPlayerRateState rateStateBySettingTimeControlStatus:reasonForWaitingToPlay:nameForLogging:](self, "rateStateBySettingTimeControlStatus:reasonForWaitingToPlay:nameForLogging:", v12, v13, a5), "rateStateByUpdatingBasedOnPresenceOfCurrentInterstitialEvent:nameForLogging:", v6, a5);
    }
    v13 = CFSTR("AVPlayerWaitingWhileEvaluatingBufferingRateReason");
    if (v10 && !-[NSString isEqualToString:](v10, "isEqualToString:", CFSTR("AVPlayerWaitingWithNoItemToPlayReason")))
      v13 = (const __CFString *)v10;
    v12 = 1;
  }
  return (id)objc_msgSend(-[AVPlayerRateState rateStateBySettingTimeControlStatus:reasonForWaitingToPlay:nameForLogging:](self, "rateStateBySettingTimeControlStatus:reasonForWaitingToPlay:nameForLogging:", v12, v13, a5), "rateStateByUpdatingBasedOnPresenceOfCurrentInterstitialEvent:nameForLogging:", v6, a5);
}

- (id)rateStateBySettingTimeControlStatus:(int64_t)a3 reasonForWaitingToPlay:(id)a4 nameForLogging:(id)a5
{
  _QWORD *v7;
  id v8;

  v7 = (_QWORD *)-[AVPlayerRateState copy](self, "copy", a3, a4, a5);
  v7[2] = a3;
  v8 = (id)v7[3];
  if (v8 != a4)
  {

    v7[3] = objc_msgSend(a4, "copy");
  }
  return v7;
}

- (id)rateStateByUpdatingBasedOnPresenceOfCurrentInterstitialEvent:(BOOL)a3 nameForLogging:(id)a4
{
  _BOOL4 v5;
  int64_t v7;
  const __CFString *v8;

  v5 = a3;
  v7 = -[AVPlayerRateState timeControlStatus](self, "timeControlStatus");
  v8 = -[AVPlayerRateState reasonForWaitingToPlay](self, "reasonForWaitingToPlay");
  if (-[AVPlayerRateState timeControlStatus](self, "timeControlStatus") != 2
    && !-[NSString isEqualToString:](-[AVPlayerRateState reasonForWaitingToPlay](self, "reasonForWaitingToPlay"), "isEqualToString:", CFSTR("AVPlayerWaitingWithNoItemToPlayReason"))&& v5)
  {
    v7 = 1;
    v8 = CFSTR("AVPlayerWaitingDuringInterstitialEventReason");
  }
  return -[AVPlayerRateState rateStateBySettingTimeControlStatus:reasonForWaitingToPlay:nameForLogging:](self, "rateStateBySettingTimeControlStatus:reasonForWaitingToPlay:nameForLogging:", v7, v8, a4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  AVPlayerRateState *v4;
  float v5;

  v4 = objc_alloc_init(AVPlayerRateState);
  -[AVPlayerRateState rate](self, "rate");
  v4->_rate = v5;
  v4->_automaticallyWaitsToMinimizeStalling = -[AVPlayerRateState automaticallyWaitsToMinimizeStalling](self, "automaticallyWaitsToMinimizeStalling");
  v4->_usesLegacyAutomaticWaitingBehavior = -[AVPlayerRateState usesLegacyAutomaticWaitingBehavior](self, "usesLegacyAutomaticWaitingBehavior");
  v4->_timeControlStatus = -[AVPlayerRateState timeControlStatus](self, "timeControlStatus");
  v4->_reasonForWaitingToPlay = (NSString *)-[NSString copy](-[AVPlayerRateState reasonForWaitingToPlay](self, "reasonForWaitingToPlay"), "copy");
  return v4;
}

- (int64_t)timeControlStatus
{
  return self->_timeControlStatus;
}

- (NSString)reasonForWaitingToPlay
{
  return self->_reasonForWaitingToPlay;
}

- (float)rate
{
  return self->_rate;
}

- (BOOL)automaticallyWaitsToMinimizeStalling
{
  return self->_automaticallyWaitsToMinimizeStalling;
}

- (BOOL)usesLegacyAutomaticWaitingBehavior
{
  return self->_usesLegacyAutomaticWaitingBehavior;
}

- (id)rateStateBySettingRate:(float)a3 nameForLogging:(id)a4
{
  float *v5;

  v5 = (float *)-[AVPlayerRateState copy](self, "copy", a4);
  v5[2] = a3;
  return v5;
}

- (AVPlayerRateState)initWithAutomaticallyWaitsToMinimizeStalling:(BOOL)a3 usesLegacyAutomaticWaitingBehavior:(BOOL)a4 timeControlStatus:(int64_t)a5
{
  AVPlayerRateState *v8;
  AVPlayerRateState *v9;
  AVPlayerRateState *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AVPlayerRateState;
  v8 = -[AVPlayerRateState init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_automaticallyWaitsToMinimizeStalling = a3;
    v8->_usesLegacyAutomaticWaitingBehavior = a4;
    v8->_timeControlStatus = a5;
    v10 = v8;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)rateStateBySettingAutomaticallyWaitsToMinimizeStalling:(BOOL)a3
{
  id result;

  result = (id)-[AVPlayerRateState copy](self, "copy");
  *((_BYTE *)result + 12) = a3;
  *((_BYTE *)result + 13) = 0;
  return result;
}

- (id)rateStateBySettingUsesLegacyAutomaticWaitingBehavior:(BOOL)a3
{
  _BYTE *v4;

  v4 = (_BYTE *)-[AVPlayerRateState copy](self, "copy");
  v4[13] = a3;
  return v4;
}

- (id)rateStateByUpdatingBasedOnFigPlayer:(OpaqueFigPlayer *)a3 hasCurrentItem:(BOOL)a4 hasCurrentInterstitialEvent:(BOOL)a5 nameForLogging:(id)a6
{
  _BOOL8 v7;
  uint64_t FigBaseObject;
  void (*v10)(uint64_t, _QWORD, _QWORD, CFNumberRef *);
  id v11;
  unsigned int valuePtr;
  CFNumberRef number;

  v7 = a5;
  if (!a3)
    return -[AVPlayerRateState rateStateByInferringTimeControlStatusAndWaitingReasonBasedOnPresenceOfCurrentItem:hasCurrentInterstitialEvent:nameForLogging:](self, "rateStateByInferringTimeControlStatusAndWaitingReasonBasedOnPresenceOfCurrentItem:hasCurrentInterstitialEvent:nameForLogging:", a4, a5, a6);
  number = 0;
  valuePtr = 0;
  FigBaseObject = FigPlayerGetFigBaseObject();
  v10 = *(void (**)(uint64_t, _QWORD, _QWORD, CFNumberRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (!v10)
    return 0;
  v10(FigBaseObject, *MEMORY[0x1E0CC5AC8], *MEMORY[0x1E0C9AE00], &number);
  if (!number)
    return 0;
  CFNumberGetValue(number, kCFNumberSInt32Type, &valuePtr);
  v11 = -[AVPlayerRateState rateStateByUpdatingBasedOnFigPlayerPlaybackState:hasCurrentInterstitialEvent:nameForLogging:](self, "rateStateByUpdatingBasedOnFigPlayerPlaybackState:hasCurrentInterstitialEvent:nameForLogging:", valuePtr, v7, a6);
  if (number)
    CFRelease(number);
  return v11;
}

@end
