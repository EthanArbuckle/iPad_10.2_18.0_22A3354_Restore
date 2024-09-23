@implementation PHSOSKappaMaskedAlertRestingViewModel

- (NSString)titleString
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SOS_KAPPA_MASKED_RESTING_VIEW_TITLE"), &stru_10028DC20, CFSTR("Localizable-kappa")));

  return (NSString *)v3;
}

@end
