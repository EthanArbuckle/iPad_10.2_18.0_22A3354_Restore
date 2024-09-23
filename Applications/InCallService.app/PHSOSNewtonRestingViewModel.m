@implementation PHSOSNewtonRestingViewModel

- (NSString)titleString
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SOS_NEWTON_RESTING_VIEW_TITLE"), &stru_10028DC20, CFSTR("Localizable-Stewie")));

  return (NSString *)v3;
}

- (NSString)subtitleString
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSNewtonRestingViewModel dateOfSOSEvent](self, "dateOfSOSEvent"));
  v3 = sub_100031078(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return (NSString *)v4;
}

- (NSDate)dateOfSOSEvent
{
  return self->_dateOfSOSEvent;
}

- (void)setDateOfSOSEvent:(id)a3
{
  objc_storeStrong((id *)&self->_dateOfSOSEvent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateOfSOSEvent, 0);
}

@end
