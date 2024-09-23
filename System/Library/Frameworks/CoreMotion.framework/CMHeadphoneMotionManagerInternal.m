@implementation CMHeadphoneMotionManagerInternal

- (CMHeadphoneMotionManagerInternal)init
{
  CMHeadphoneMotionManagerInternal *v2;
  NSObject *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CMHeadphoneMotionManagerInternal;
  v2 = -[CMHeadphoneMotionManagerInternal init](&v5, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMHeadphoneMotionManager", v3);
    v2->_connectionClient = 0;
    *(_WORD *)&v2->_deviceMotionActive = 0;
    v2->_deviceConnected = 0;
    *(_WORD *)&v2->_statusActive = 0;
    v2->_deviceConnectionTimestamp = 0.0;
    v2->_firstValidDeviceMotionTimestamp = 0.0;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  dispatch_release((dispatch_object_t)self->_dispatchQueue);
  v3.receiver = self;
  v3.super_class = (Class)CMHeadphoneMotionManagerInternal;
  -[CMHeadphoneMotionManagerInternal dealloc](&v3, sel_dealloc);
}

- (void)connect
{
  RMConnectionClient *v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_connectionClient)
  {
    v3 = (RMConnectionClient *)sub_18F386354((id *)[RMConnectionClient alloc], self->_dispatchQueue, CFSTR("com.apple.relatived.public"), &unk_1E2954008);
    self->_connectionClient = v3;
    sub_18F386A7C((uint64_t)v3);
  }
}

- (void)disconnect
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  sub_18F386EAC((uint64_t)self->_connectionClient);

  self->_connectionClient = 0;
}

- (void)connectStatus
{
  RMConnectionClient *v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_statusConnectionClient)
  {
    v3 = (RMConnectionClient *)sub_18F386354((id *)[RMConnectionClient alloc], self->_dispatchQueue, CFSTR("com.apple.relatived.status"), &unk_1E2958CD8);
    self->_statusConnectionClient = v3;
    sub_18F386A7C((uint64_t)v3);
  }
}

- (void)disconnectStatus
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  sub_18F386EAC((uint64_t)self->_statusConnectionClient);

  self->_statusConnectionClient = 0;
}

- (CMDeviceMotion)deviceMotion
{
  return (CMDeviceMotion *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDeviceMotion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (CMAttitude)initialReferenceAttitude
{
  return self->_initialReferenceAttitude;
}

- (void)setInitialReferenceAttitude:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

@end
