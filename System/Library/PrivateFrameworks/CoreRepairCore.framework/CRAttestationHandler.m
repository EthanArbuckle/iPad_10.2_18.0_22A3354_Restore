@implementation CRAttestationHandler

- (id)_init
{
  CRAttestationHandler *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  CRAttestationHandler *v6;
  uint64_t v7;
  CRAttestationBaseDeviceHandler *handle;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CRAttestationHandler;
  v2 = -[CRAttestationHandler init](&v10, sel_init);
  v6 = v2;
  if (v2)
  {
    objc_msgSend_getHandlerForDevice(v2, v3, v4, v5);
    v7 = objc_claimAutoreleasedReturnValue();
    handle = v6->handle;
    v6->handle = (CRAttestationBaseDeviceHandler *)v7;

  }
  return v6;
}

+ (id)sharedInstance
{
  if (qword_254D7B0D8 != -1)
    dispatch_once(&qword_254D7B0D8, &unk_24D1AA858);
  return (id)qword_254D7B0D0;
}

- (void)challengeComponentsWith:(id)a3 withReply:(id)a4
{
  objc_msgSend_challengeComponentsWith_withReply_(self->handle, a2, (uint64_t)a3, (uint64_t)a4);
}

- (void)getStrongComponentsWithReply:(id)a3
{
  uint64_t v3;

  objc_msgSend_getStrongComponentsWithReply_(self->handle, a2, (uint64_t)a3, v3);
}

- (id)getHandlerForDevice
{
  uint64_t v2;
  uint64_t v3;
  CRAttestationBaseDeviceHandler *handle;
  objc_class *v6;
  NSObject *v7;
  CRAttestationBaseDeviceHandler *v8;
  CRAttestationBaseDeviceHandler *v9;
  uint8_t v11[8];
  _QWORD block[5];

  handle = self->handle;
  if (!handle)
  {
    v6 = (objc_class *)objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_21454E3BC;
    block[3] = &unk_24D1AA2C8;
    block[4] = self;
    objc_enumerateClasses(0, 0, 0, v6, block);
    handle = self->handle;
    if (!handle)
    {
      handleForCategory(0);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_214503000, v7, OS_LOG_TYPE_DEFAULT, "Legacy device:", v11, 2u);
      }

      v8 = objc_alloc_init(CRAttestationBaseDeviceHandler);
      v9 = self->handle;
      self->handle = v8;

      handle = self->handle;
    }
  }
  return (id)objc_msgSend_copy(handle, a2, v2, v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->handle, 0);
}

@end
