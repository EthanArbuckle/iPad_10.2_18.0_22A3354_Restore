@implementation PHSOSKappaCheckInViewModel

- (NSString)titleString
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SOS_KAPPA_CHECK_IN_VIEW_TITLE"), &stru_10028DC20, CFSTR("Localizable-kappa")));

  return (NSString *)v3;
}

- (NSString)subtitleString
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SOS_KAPPA_CHECK_IN_VIEW_SUBTITLE"), &stru_10028DC20, CFSTR("Localizable-kappa")));

  return (NSString *)v3;
}

- (double)timeout
{
  return 10.0;
}

- (double)countdownTickDuration
{
  return 1.0;
}

- (int64_t)sosVoiceMessageType
{
  return 201;
}

@end
