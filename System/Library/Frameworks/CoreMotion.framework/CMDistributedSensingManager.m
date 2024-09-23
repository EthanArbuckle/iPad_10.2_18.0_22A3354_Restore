@implementation CMDistributedSensingManager

- (CMDistributedSensingManager)init
{
  CMDistributedSensingManager *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CMDistributedSensingManager;
  v2 = -[CMDistributedSensingManager init](&v4, sel_init);
  if (v2)
    v2->_internal = objc_alloc_init(CMDistributedSensingManagerInternal);
  return v2;
}

- (void)dealloc
{
  CMDistributedSensingManagerInternal *internal;
  NSObject *clientQueue;
  objc_super v5;
  _QWORD block[5];

  internal = self->_internal;
  clientQueue = internal->_clientQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F37C21C;
  block[3] = &unk_1E2955938;
  block[4] = internal;
  dispatch_async(clientQueue, block);

  v5.receiver = self;
  v5.super_class = (Class)CMDistributedSensingManager;
  -[CMDistributedSensingManager dealloc](&v5, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  CMDistributedSensingManagerInternal *internal;

  internal = self->_internal;
  objc_storeWeak((id *)&internal->_delegate, a3);
  objc_storeWeak((id *)&internal->_manager, self);
  self->_delegate = (CMDistributedSensingDelegate *)a3;
}

+ (BOOL)isVehicleStateUpdatesAvailable
{
  sub_18F1F77DC();
  if ((sub_18F20C9AC() & 1) != 0)
    return 1;
  sub_18F1F77DC();
  if ((sub_18F1E1B00() & 1) != 0)
    return 1;
  sub_18F1F77DC();
  return 0;
}

- (void)subscribeToVehicleState
{
  ((void (*)(CMDistributedSensingManagerInternal *, char *))MEMORY[0x1E0DE7D20])(self->_internal, sel__registerForVehicleStateUpdates);
}

- (void)unsubscribeToVehicleState
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend__unregisterForVehicleStateUpdates(self->_internal, a2, v2, v3, v4);
}

- (CMDistributedSensingManagerInternal)_internal
{
  return self->_internal;
}

- (CMDistributedSensingDelegate)delegate
{
  return self->_delegate;
}

@end
