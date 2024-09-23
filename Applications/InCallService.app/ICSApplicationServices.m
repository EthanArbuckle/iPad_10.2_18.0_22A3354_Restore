@implementation ICSApplicationServices

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C8040;
  block[3] = &unk_100284948;
  block[4] = a1;
  if (qword_1002DCC30 != -1)
    dispatch_once(&qword_1002DCC30, block);
  return (id)qword_1002DCC28;
}

@end
