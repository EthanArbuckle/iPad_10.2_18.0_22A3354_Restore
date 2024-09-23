@implementation _MTLSharedEvent

- (unsigned)encodeKernelSignalEventCommandArgs:(IOAccelKernelCommandSignalOrWaitEventArgs *)a3 value:(unint64_t)a4
{
  a3->var0 = *(_DWORD *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E0CBBEC8]);
  a3->var3 = a4;
  return 4;
}

- (unsigned)encodeKernelWaitEventCommandArgs:(IOAccelKernelCommandSignalOrWaitEventArgs *)a3 value:(unint64_t)a4
{
  a3->var0 = *(_DWORD *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E0CBBEC8]);
  a3->var3 = a4;
  return 5;
}

- (unsigned)encodeKernelWaitEventCommandArgs:(IOAccelKernelCommandSignalOrWaitEventArgs *)a3 value:(unint64_t)a4 timeout:(unsigned int)a5
{
  unsigned __int16 v5;

  a3->var0 = *(_DWORD *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E0CBBEC8]);
  a3->var3 = a4;
  if (a5 >= 0xFFFF)
    v5 = -1;
  else
    v5 = a5;
  a3->var2 = v5;
  return 11;
}

- (unsigned)encodeConditionalEventAbortCommandArgs:(IOAccelKernelCommandSignalOrWaitEventArgs *)a3
{
  a3->var0 = *(_DWORD *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E0CBBEC8]);
  a3->var3 = 0;
  a3->var2 = 0;
  return 13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_MTLSharedEvent;
  -[IOSurfaceSharedEvent dealloc](&v3, sel_dealloc);
}

- (MTLDevice)device
{
  return 0;
}

- (BOOL)supportsRollback
{
  return 0;
}

- (_MTLSharedEvent)initWithSharedEventHandle:(id)a3
{
  _MTLSharedEvent *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_MTLSharedEvent;
  v4 = -[IOSurfaceSharedEvent initWithMachPort:](&v6, sel_initWithMachPort_, objc_msgSend(a3, "eventPort"));
  if (v4)
  {
    v4->_label = (NSString *)objc_msgSend((id)objc_msgSend(a3, "label"), "copy");
    v4->_labelLock._os_unfair_lock_opaque = 0;
    v4->_labelTraceID = objc_msgSend(a3, "labelTraceID");
  }
  return v4;
}

- (_MTLSharedEvent)initWithMachPort:(unsigned int)a3
{
  _MTLSharedEvent *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_MTLSharedEvent;
  result = -[IOSurfaceSharedEvent initWithMachPort:](&v4, sel_initWithMachPort_, *(_QWORD *)&a3);
  if (result)
    result->_labelLock._os_unfair_lock_opaque = 0;
  return result;
}

- (_MTLSharedEvent)initWithOptions:(int64_t)a3
{
  _MTLSharedEvent *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_MTLSharedEvent;
  result = -[IOSurfaceSharedEvent initWithOptions:](&v4, sel_initWithOptions_, a3);
  if (result)
    result->_labelLock._os_unfair_lock_opaque = 0;
  return result;
}

- (id)newSharedEventHandle
{
  return -[MTLSharedEventHandle initWithSharedEvent:]([MTLSharedEventHandle alloc], "initWithSharedEvent:", self);
}

- (void)notifyListener:(id)a3 atValue:(unint64_t)a4 block:(id)a5
{
  objc_msgSend(a3, "_notifyEventPort:event:atValue:block:", *(unsigned int *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E0CBBEC8]), self, a4, a5);
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
  return (NSString *)-[_MTLSharedEvent retainedLabel](self, "retainedLabel");
}

- (void)setLabel:(id)a3
{
  NSString *v5;
  NSString *label;

  if (MTLTraceEnabledSPI() && *(_DWORD *)*MEMORY[0x1E0D39EE0])
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

- (unint64_t)labelTraceID
{
  return self->_labelTraceID;
}

@end
