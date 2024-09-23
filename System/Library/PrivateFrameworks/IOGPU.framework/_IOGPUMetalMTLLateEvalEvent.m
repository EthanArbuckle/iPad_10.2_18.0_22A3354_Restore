@implementation _IOGPUMetalMTLLateEvalEvent

- (_IOGPUMetalMTLLateEvalEvent)initWithDevice:(id)a3
{
  _IOGPUMetalMTLLateEvalEvent *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_IOGPUMetalMTLLateEvalEvent;
  v4 = -[IOGPUMTLLateEvalEvent initWithDevice:](&v6, sel_initWithDevice_, objc_msgSend(a3, "deviceRef"));
  if (v4)
  {
    v4->_device = (MTLDevice *)a3;
    v4->_labelLock._os_unfair_lock_opaque = 0;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_IOGPUMetalMTLLateEvalEvent;
  -[IOGPUMTLLateEvalEvent dealloc](&v3, sel_dealloc);
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
  return (NSString *)-[_IOGPUMetalMTLLateEvalEvent retainedLabel](self, "retainedLabel");
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

- (id)newSharedEventHandle
{
  return 0;
}

- (MTLDevice)device
{
  return self->_device;
}

@end
