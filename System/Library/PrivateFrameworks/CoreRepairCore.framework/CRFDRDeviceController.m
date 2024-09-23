@implementation CRFDRDeviceController

- (id)getHandlerForDevice
{
  uint64_t v2;
  uint64_t v3;
  CRFDRBaseDeviceHandler *handler;
  objc_class *v6;
  _QWORD block[5];

  handler = self->handler;
  if (!handler)
  {
    v6 = (objc_class *)objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_214523E90;
    block[3] = &unk_24D1AA2C8;
    block[4] = self;
    objc_enumerateClasses(0, 0, 0, v6, block);
    handler = self->handler;
  }
  return (id)objc_msgSend_copy(handler, a2, v2, v3);
}

- (CRFDRDeviceController)init
{
  void *v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  const char *v10;

  v4 = (void *)MEMORY[0x24BDBCE88];
  v5 = *MEMORY[0x24BDBCAB0];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_sharedSingleton);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_raise_format_(v4, v10, v5, (uint64_t)CFSTR("Use +[%@ %@] instead of -%@."), v7, v8, v9);

  return 0;
}

- (id)_init
{
  CRFDRDeviceController *v2;
  CRFDRDeviceController *v3;
  CRFDRBaseDeviceHandler *handler;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRFDRDeviceController;
  v2 = -[CRFDRDeviceController init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    handler = v2->handler;
    v2->handler = 0;

  }
  return v3;
}

+ (id)sharedSingleton
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_214524178;
  block[3] = &unk_24D1AA2E8;
  block[4] = a1;
  if (qword_253E797D8 != -1)
    dispatch_once(&qword_253E797D8, block);
  return (id)qword_253E79828;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->handler, 0);
}

@end
