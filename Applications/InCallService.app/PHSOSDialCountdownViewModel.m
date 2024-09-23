@implementation PHSOSDialCountdownViewModel

- (NSString)titleString
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("EMERGENCY_SOS"), &stru_10028DC20, CFSTR("InCallService")));

  return (NSString *)v3;
}

- (NSString)subtitleString
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SOS_COUNTDOWN_SUBTITLE"), &stru_10028DC20, CFSTR("InCallService")));

  return (NSString *)v3;
}

- (unint64_t)countdown
{
  return 8;
}

- (unint64_t)countdownWithAudio
{
  return 5;
}

- (id)countdownString:(unint64_t)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter localizedStringFromNumber:numberStyle:](NSNumberFormatter, "localizedStringFromNumber:numberStyle:", v3, 0));

  return v4;
}

- (double)countdownTickDuration
{
  return 1.04999995;
}

- (BOOL)playsSound
{
  return +[SOSUtilities shouldPlayAudioDuringCountdown](SOSUtilities, "shouldPlayAudioDuringCountdown");
}

- (BOOL)playsHaptics
{
  return 1;
}

@end
