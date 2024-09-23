@implementation _MTLIOAccelMTLEvent

- (_MTLIOAccelMTLEvent)initWithDevice:(id)a3
{
  return -[_MTLIOAccelMTLEvent initWithDevice:options:](self, "initWithDevice:options:", a3, 0);
}

- (_MTLIOAccelMTLEvent)initWithDevice:(id)a3 options:(int64_t)a4
{
  _MTLIOAccelMTLEvent *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_MTLIOAccelMTLEvent;
  v5 = -[IOAccelMTLEvent initWithShared:options:](&v7, sel_initWithShared_options_, objc_msgSend(a3, "sharedRef"), a4);
  if (v5)
  {
    v5->_device = (MTLDevice *)a3;
    v5->_labelLock._os_unfair_lock_opaque = 0;
    v5->_enableBarrier = 1;
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_MTLIOAccelMTLEvent;
  -[IOAccelMTLEvent dealloc](&v3, sel_dealloc);
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
  return (NSString *)-[_MTLIOAccelMTLEvent retainedLabel](self, "retainedLabel");
}

- (void)setLabel:(id)a3
{
  NSString *v5;
  NSString *label;

  if (*(_DWORD *)*MEMORY[0x1E0D39EE0])
  {
    objc_msgSend(a3, "cStringUsingEncoding:", 1);
    self->_labelTraceID = IOAccelDeviceTraceObjectLabel();
  }
  v5 = (NSString *)objc_msgSend(a3, "copy");
  os_unfair_lock_lock(&self->_labelLock);
  label = self->_label;
  self->_label = v5;
  os_unfair_lock_unlock(&self->_labelLock);

}

- (MTLDevice)device
{
  return self->_device;
}

- (BOOL)enableBarrier
{
  return self->_enableBarrier;
}

- (void)setEnableBarrier:(BOOL)a3
{
  self->_enableBarrier = a3;
}

@end
