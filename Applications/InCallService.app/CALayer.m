@implementation CALayer

+ (void)load
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000795D4;
  block[3] = &unk_100284948;
  block[4] = a1;
  if (qword_1002DCA00 != -1)
    dispatch_once(&qword_1002DCA00, block);
}

- (void)_debugSetNeedsLayout
{
  id v3;
  NSObject *v4;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v3 = sub_1000C5588();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      sub_1001A99B8(v4);

  }
  -[CALayer _debugSetNeedsLayout](self, "_debugSetNeedsLayout");
}

@end
