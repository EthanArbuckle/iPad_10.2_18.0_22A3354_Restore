@implementation PHSpringBoardPreferences

+ (id)sharedPreferences
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C7F78;
  block[3] = &unk_100284948;
  block[4] = a1;
  if (qword_1002DCC20 != -1)
    dispatch_once(&qword_1002DCC20, block);
  return (id)qword_1002DCC18;
}

- (id)domain
{
  return CFSTR("com.apple.springboard");
}

- (BOOL)isProximitySensorAvailable
{
  return !-[PHPreferences BOOLForKey:defaultValue:](self, "BOOLForKey:defaultValue:", CFSTR("SBDisableProximity"), 0);
}

@end
