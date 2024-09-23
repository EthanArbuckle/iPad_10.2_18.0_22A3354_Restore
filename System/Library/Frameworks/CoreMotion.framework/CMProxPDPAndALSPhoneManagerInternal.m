@implementation CMProxPDPAndALSPhoneManagerInternal

- (CMProxPDPAndALSPhoneManagerInternal)init
{
  CMProxPDPAndALSPhoneManagerInternal *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CMProxPDPAndALSPhoneManagerInternal;
  v2 = -[CMProxPDPAndALSPhoneManagerInternal init](&v4, sel_init);
  if (v2)
  {
    v2->fPrivateQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotionCMProxPDPAndALSPhoneManagerPrivateQueue", 0);
    *(_WORD *)&v2->fStartedPDPUpdates = 0;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  dispatch_release((dispatch_object_t)self->fPrivateQueue);
  self->fPrivateQueue = 0;
  v3.receiver = self;
  v3.super_class = (Class)CMProxPDPAndALSPhoneManagerInternal;
  -[CMProxPDPAndALSPhoneManagerInternal dealloc](&v3, sel_dealloc);
}

- (void)_startPDPUpdatesWithHandler:(id)a3
{
  NSObject *fPrivateQueue;
  _QWORD v4[6];

  fPrivateQueue = self->fPrivateQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_18F35EEBC;
  v4[3] = &unk_1E2955B38;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(fPrivateQueue, v4);
}

- (void)_startALSPhoneUpdatesWithHandler:(id)a3
{
  NSObject *fPrivateQueue;
  _QWORD v4[6];

  fPrivateQueue = self->fPrivateQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_18F35F778;
  v4[3] = &unk_1E2955B38;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(fPrivateQueue, v4);
}

@end
