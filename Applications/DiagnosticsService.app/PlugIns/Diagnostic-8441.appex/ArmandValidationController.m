@implementation ArmandValidationController

- (void)start
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[16];

  v3 = ODIServiceProviderIdAppleCare;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleIdentifier"));

  v6 = objc_msgSend(objc_alloc((Class)ODISession), "initWithServiceIdentifier:forDSIDType:andLocationBundleIdentifier:", v3, 2, v5);
  v7 = v6;
  if (v6)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000037D0;
    v10[3] = &unk_1000040D0;
    v10[4] = self;
    v11 = v6;
    objc_msgSend(v11, "getAssessment:", v10);

  }
  else
  {
    v8 = DiagnosticLogHandleForCategory(3);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Diagnostic-8441 CoreODI session failed.", buf, 2u);
    }

    -[ArmandValidationController setFinished:](self, "setFinished:", 1);
  }

}

- (void)cancel
{
  uint64_t v3;
  NSObject *v4;

  v3 = DiagnosticLogHandleForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_100003A54((uint64_t)self, v4);

  -[ArmandValidationController setFinished:](self, "setFinished:", 1);
}

@end
