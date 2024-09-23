@implementation CRBluetoothStatus

- (CRBluetoothStatus)init
{
  CRBluetoothStatus *v2;
  const char *v3;
  uint64_t v4;
  CRBluetoothStatus *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRBluetoothStatus;
  v2 = -[CRComponentAuth init](&v7, sel_init);
  v5 = v2;
  if (v2)
    objc_msgSend_setComponentName_(v2, v3, (uint64_t)CFSTR("Bluetooth"), v4);
  return v5;
}

- (int64_t)copyComponentStatus
{
  uint64_t v2;
  uint64_t v3;

  if (objc_msgSend_isComponentFailed(self, a2, v2, v3))
    return -1;
  else
    return 1;
}

- (BOOL)isComponentFailed
{
  uint64_t v2;
  uint64_t v3;
  CRBluetoothStatus *v4;
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
