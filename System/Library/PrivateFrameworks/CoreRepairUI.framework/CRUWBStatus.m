@implementation CRUWBStatus

- (CRUWBStatus)init
{
  CRUWBStatus *v2;
  CRUWBStatus *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRUWBStatus;
  v2 = -[CRComponentAuth init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[CRComponentAuth setComponentName:](v2, "setComponentName:", CFSTR("UWB"));
  return v3;
}

- (int64_t)copyComponentStatus
{
  if (!MGGetBoolAnswer())
    return 0;
  if (-[CRUWBStatus isComponentFailed](self, "isComponentFailed"))
    return -1;
  return 1;
}

- (BOOL)isComponentFailed
{
  CRUWBStatus *v2;
  void *v3;
  void *v4;

  v2 = self;
  -[CRComponentAuth componentName](self, "componentName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", CFSTR("Failed"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[CRComponentAuth _checkForComponentFailureInDefaults:](v2, "_checkForComponentFailureInDefaults:", v4);

  return (char)v2;
}

@end
