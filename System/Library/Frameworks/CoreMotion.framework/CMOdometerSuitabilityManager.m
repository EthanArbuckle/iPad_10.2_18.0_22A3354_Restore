@implementation CMOdometerSuitabilityManager

- (CMOdometerSuitabilityManager)init
{
  CMOdometerSuitabilityManager *v2;
  CMOdometerSuitabilityManagerProxy *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CMOdometerSuitabilityManagerProxy *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CMOdometerSuitabilityManager;
  v2 = -[CMOdometerSuitabilityManager init](&v13, sel_init);
  if (v2)
  {
    v3 = [CMOdometerSuitabilityManagerProxy alloc];
    v7 = (CMOdometerSuitabilityManagerProxy *)objc_msgSend_initWithOdometerSuitability_(v3, v4, (uint64_t)v2, v5, v6);
    v2->_odometerSuitabilityManagerProxy = v7;
    objc_msgSend__startDaemonConnection(v7, v8, v9, v10, v11);
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v6;
  objc_super v7;
  _QWORD block[5];

  v6 = *(NSObject **)(objc_msgSend_odometerSuitabilityManagerProxy(self, a2, v2, v3, v4) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F3F3E78;
  block[3] = &unk_1E2955938;
  block[4] = self;
  dispatch_sync(v6, block);

  v7.receiver = self;
  v7.super_class = (Class)CMOdometerSuitabilityManager;
  -[CMOdometerSuitabilityManager dealloc](&v7, sel_dealloc);
}

- (void)startOdometerSuitabilityUpdatesWithHandler:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v7;
  void *v9;
  const char *v10;
  _QWORD block[6];

  if (!a3)
  {
    v9 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3, v4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMOdometerSuitabilityManager.mm"), 175, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));
  }
  v7 = *(NSObject **)(objc_msgSend_odometerSuitabilityManagerProxy(self, a2, (uint64_t)a3, v3, v4) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F3F3F3C;
  block[3] = &unk_1E2955B38;
  block[4] = self;
  block[5] = a3;
  dispatch_async(v7, block);
}

- (void)stopOdometerSuitabilityUpdates
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v6;
  _QWORD block[5];

  v6 = *(NSObject **)(objc_msgSend_odometerSuitabilityManagerProxy(self, a2, v2, v3, v4) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F3F3FC8;
  block[3] = &unk_1E2955938;
  block[4] = self;
  dispatch_sync(v6, block);
}

- (CMOdometerSuitabilityManagerProxy)odometerSuitabilityManagerProxy
{
  return self->_odometerSuitabilityManagerProxy;
}

@end
