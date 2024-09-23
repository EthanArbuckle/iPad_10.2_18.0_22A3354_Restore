@implementation PHSOSKappaNotifyCountdownViewModel

- (NSString)titleString
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SOS_NOTIFICATION"), &stru_10028DC20, CFSTR("InCallService")));

  return (NSString *)v3;
}

- (NSString)subtitleString
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SOS_KAPPA_CONTACT_NOTIFICATION_SUBTITLE"), &stru_10028DC20, CFSTR("Localizable-kappa")));

  return (NSString *)v3;
}

- (unint64_t)countdown
{
  return 10;
}

- (unint64_t)countdownWithAudio
{
  return 0;
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
  return 1.0;
}

- (BOOL)playsSound
{
  return 0;
}

- (BOOL)playsHaptics
{
  return 0;
}

@end
