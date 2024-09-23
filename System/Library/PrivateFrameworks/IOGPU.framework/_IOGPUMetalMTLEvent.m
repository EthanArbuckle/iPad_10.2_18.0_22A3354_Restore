@implementation _IOGPUMetalMTLEvent

- (_IOGPUMetalMTLEvent)initWithDevice:(id)a3
{
  return -[_IOGPUMetalMTLEvent initWithDevice:options:](self, "initWithDevice:options:", a3, 0);
}

- (_IOGPUMetalMTLEvent)initWithDevice:(id)a3 options:(unint64_t)a4
{
  _IOGPUMetalMTLEvent *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_IOGPUMetalMTLEvent;
  v5 = -[IOGPUMTLEvent initWithDeviceRef:options:](&v7, sel_initWithDeviceRef_options_, objc_msgSend(a3, "deviceRef"), a4);
  if (v5)
  {
    v5->_device = (MTLDevice *)a3;
    v5->_labelLock._os_unfair_lock_opaque = 0;
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_IOGPUMetalMTLEvent;
  -[IOGPUMTLEvent dealloc](&v3, sel_dealloc);
}

- (id)retainedLabel
{
  os_unfair_lock_s *p_labelLock;
  NSString *v4;

  p_labelLock = &self->_labelLock;
  os_unfair_lock_lock(&self->_labelLock);
  v4 = self->_label;
  os_unfair_lock_unlock(p_labelLock);
  return v4;
}

- (NSString)label
{
  return (NSString *)-[_IOGPUMetalMTLEvent retainedLabel](self, "retainedLabel");
}

- (void)setLabel:(id)a3
{
  unint64_t globalTraceObjectID;
  unint64_t labelTraceID;
  NSString *v7;
  NSString *label;

  if (*(_DWORD *)__globalGPUCommPage)
  {
    globalTraceObjectID = self->super._globalTraceObjectID;
    labelTraceID = self->_labelTraceID;
    objc_msgSend(a3, "cStringUsingEncoding:", 1);
    self->_labelTraceID = IOGPUDeviceTraceObjectLabel(0, 8, 0, globalTraceObjectID, labelTraceID);
  }
  v7 = (NSString *)objc_msgSend(a3, "copy");
  os_unfair_lock_lock(&self->_labelLock);
  label = self->_label;
  self->_label = v7;
  os_unfair_lock_unlock(&self->_labelLock);

}

- (MTLDevice)device
{
  return self->_device;
}

@end
