@implementation CMProxPDPAndALSPhoneManager

+ (BOOL)isAvailable
{
  return ((unint64_t)sub_18F1F7BFC() >> 8) & 1;
}

- (void)startPDPUpdatesWithHandler:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;

  if (!a3)
  {
    v9 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3, v4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMProxPDPAndALSPhoneManager.mm"), 156, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));
  }
  v7 = objc_msgSend__internal(self, a2, (uint64_t)a3, v3, v4);
  MEMORY[0x1E0DE7D20](v7, sel__startPDPUpdatesWithHandler_, a3, v11, v12);
}

- (void)startALSPhoneUpdatesWithHandler:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;

  if (!a3)
  {
    v9 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3, v4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMProxPDPAndALSPhoneManager.mm"), 162, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));
  }
  v7 = objc_msgSend__internal(self, a2, (uint64_t)a3, v3, v4);
  MEMORY[0x1E0DE7D20](v7, sel__startALSPhoneUpdatesWithHandler_, a3, v11, v12);
}

- (CMProxPDPAndALSPhoneManager)init
{
  CMProxPDPAndALSPhoneManager *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CMProxPDPAndALSPhoneManager;
  v2 = -[CMProxPDPAndALSPhoneManager init](&v4, sel_init);
  if (v2)
    v2->_internal = objc_alloc_init(CMProxPDPAndALSPhoneManagerInternal);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  self->_internal = 0;
  v3.receiver = self;
  v3.super_class = (Class)CMProxPDPAndALSPhoneManager;
  -[CMProxPDPAndALSPhoneManager dealloc](&v3, sel_dealloc);
}

- (CMProxPDPAndALSPhoneManagerInternal)_internal
{
  return (CMProxPDPAndALSPhoneManagerInternal *)self->_internal;
}

@end
