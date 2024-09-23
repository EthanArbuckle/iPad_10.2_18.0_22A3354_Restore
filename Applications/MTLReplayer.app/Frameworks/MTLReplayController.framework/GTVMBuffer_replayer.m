@implementation GTVMBuffer_replayer

- (GTVMBuffer_replayer)initWithVMBuffer:(VMBuffer *)a3
{
  GTVMBuffer_replayer *result;
  objc_super v5;

  if (!a3)
    __assert_rtn("-[GTVMBuffer initWithVMBuffer:]", ", 0, "vmBuffer");
  v5.receiver = self;
  v5.super_class = (Class)GTVMBuffer_replayer;
  result = -[GTVMBuffer_replayer init](&v5, "init");
  if (result)
    result->_vmBuffer = a3;
  return result;
}

- (GTVMBuffer_replayer)initWithCapacity:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GTVMBuffer_replayer;
  if (-[GTVMBuffer_replayer init](&v4, "init"))
    operator new();
  return 0;
}

- (GTVMBuffer_replayer)initWithLength:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GTVMBuffer_replayer;
  if (-[GTVMBuffer_replayer init](&v4, "init"))
    operator new();
  return 0;
}

- (void)dealloc
{
  objc_super v2;

  if (self->_vmBuffer)
  {
    GPUTools::VMBuffer::_dealloc(&self->_vmBuffer->var0);
    operator delete();
  }
  v2.receiver = self;
  v2.super_class = (Class)GTVMBuffer_replayer;
  -[GTVMBuffer_replayer dealloc](&v2, "dealloc");
}

- (unint64_t)length
{
  return self->_vmBuffer->var4;
}

- (const)bytes
{
  return (const void *)(self->_vmBuffer->var3 + self->_vmBuffer->var0);
}

- (void)mutableBytes
{
  return (void *)(self->_vmBuffer->var3 + self->_vmBuffer->var0);
}

- (void)setLength:(unint64_t)a3
{
  VMBuffer *vmBuffer;
  unint64_t var1;
  vm_address_t var0;
  uint64_t var2;
  vm_size_t v9;
  unint64_t var5;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;

  vmBuffer = self->_vmBuffer;
  var1 = vmBuffer->var1;
  if (var1 < a3)
  {
    var0 = vmBuffer->var0;
    var2 = vmBuffer->var2;
    if (GPUTools::VMBuffer::_alloc((GPUTools::VMBuffer *)self->_vmBuffer, a3, var2))
    {
      if (var1 >= vmBuffer->var1)
        v9 = vmBuffer->var1;
      else
        v9 = var1;
      if (vm_copy(mach_task_self_, var0, v9, vmBuffer->var0))
        GPUTools::VMBuffer::_dealloc(&vmBuffer->var0);
      else
        vm_deallocate(mach_task_self_, var0, vm_page_size + var1 + var1 * var2);
    }
    vmBuffer = self->_vmBuffer;
  }
  var5 = vmBuffer->var5;
  v11 = var5 - 1;
  v12 = var5 - 1 + vmBuffer->var0;
  v13 = -(uint64_t)var5;
  v14 = (v12 & v13) - vmBuffer->var0;
  vmBuffer->var3 = v14;
  vmBuffer->var4 = v14 + ((v11 + a3) & v13);
}

- (id)subdataWithRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;

  length = a3.length;
  location = a3.location;
  if (a3.location + a3.length <= -[GTVMBuffer_replayer length](self, "length"))
    return -[GTVMBufferSubRegion_replayer initWithGTVMBuffer:range:]([GTVMBufferSubRegion_replayer alloc], "initWithGTVMBuffer:range:", self, location, length);
  else
    return 0;
}

- (VMBuffer)vmBuffer
{
  return self->_vmBuffer;
}

@end
