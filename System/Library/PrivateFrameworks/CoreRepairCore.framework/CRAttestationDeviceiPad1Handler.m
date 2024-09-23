@implementation CRAttestationDeviceiPad1Handler

- (CRAttestationDeviceiPad1Handler)init
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  CRAttestationDeviceiPad1Handler *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CRAttestationDeviceiPad1Handler;
  v5 = -[CRAttestationBaseDeviceHandler init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend_sharedSingleton(CRComponentDisplayRoswell, v2, v3, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend_componentsMapping(v5, v6, v7, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v10, v11, (uint64_t)v9, (uint64_t)CFSTR("tcrt"));

    }
  }
  return v5;
}

+ (BOOL)isiPad1ProductType:(int)a3
{
  BOOL result;
  uint64_t v4;

  result = 1;
  if (*(uint64_t *)&a3 > 2619317133)
  {
    if (*(_QWORD *)&a3 == 2619317134)
      return result;
    v4 = 3241053352;
  }
  else
  {
    if (*(_QWORD *)&a3 == 555503454)
      return result;
    v4 = 2487868872;
  }
  if (*(_QWORD *)&a3 != v4)
    return 0;
  return result;
}

+ (id)getDeviceHandlerForProductType:(int)a3
{
  uint64_t v3;
  CRAttestationDeviceiPad1Handler *v4;

  if (objc_msgSend_isiPad1ProductType_(CRAttestationDeviceiPad1Handler, a2, *(uint64_t *)&a3, v3))v4 = objc_alloc_init(CRAttestationDeviceiPad1Handler);
  else
    v4 = 0;
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_alloc_init(CRAttestationDeviceiPad1Handler);
}

@end
