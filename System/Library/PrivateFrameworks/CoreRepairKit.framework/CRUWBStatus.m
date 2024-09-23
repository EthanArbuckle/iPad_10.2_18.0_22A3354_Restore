@implementation CRUWBStatus

- (CRUWBStatus)init
{
  CRUWBStatus *v2;
  const char *v3;
  uint64_t v4;
  CRUWBStatus *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRUWBStatus;
  v2 = -[CRComponentAuth init](&v7, sel_init);
  v5 = v2;
  if (v2)
    objc_msgSend_setComponentName_(v2, v3, (uint64_t)CFSTR("UWB"), v4);
  return v5;
}

- (int64_t)copyComponentStatus
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;

  if (!MGGetBoolAnswer())
    return 0;
  if (objc_msgSend_isComponentFailed(self, v3, v4, v5))
    return -1;
  return 1;
}

- (BOOL)isComponentFailed
{
  uint64_t v2;
  uint64_t v3;
  CRUWBStatus *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;

  v4 = self;
  objc_msgSend_componentName(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingString_(v5, v6, (uint64_t)CFSTR("Failed"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend__checkForComponentFailureInDefaults_(v4, v9, (uint64_t)v8, v10);

  return (char)v4;
}

@end
