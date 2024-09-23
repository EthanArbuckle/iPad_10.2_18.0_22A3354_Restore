@implementation DYVMBuffer

- (DYVMBuffer)initWithVMBuffer:(VMBuffer *)a3
{
  DYVMBuffer *result;
  objc_super v5;

  if (!a3)
    __assert_rtn("-[DYVMBuffer initWithVMBuffer:]", ", 0, "vmBuffer");
  v5.receiver = self;
  v5.super_class = (Class)DYVMBuffer;
  result = -[DYVMBuffer init](&v5, sel_init);
  if (result)
    result->_vmBuffer = a3;
  return result;
}

- (DYVMBuffer)initWithCapacity:(unint64_t)a3
{
  DYVMBuffer *v4;
  GPUTools::VMBuffer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DYVMBuffer;
  v4 = -[DYVMBuffer init](&v7, sel_init);
  if (v4)
  {
    v5 = (GPUTools::VMBuffer *)operator new();
    GPUTools::VMBuffer::VMBuffer(v5, a3, 0);
    v4->_vmBuffer = (VMBuffer *)v5;
  }
  return v4;
}

- (DYVMBuffer)initWithLength:(unint64_t)a3
{
  DYVMBuffer *v4;
  GPUTools::VMBuffer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DYVMBuffer;
  v4 = -[DYVMBuffer init](&v7, sel_init);
  if (v4)
  {
    v5 = (GPUTools::VMBuffer *)operator new();
    GPUTools::VMBuffer::VMBuffer(v5, a3, 0);
    v4->_vmBuffer = (VMBuffer *)v5;
    *((_QWORD *)v5 + 4) += (a3 + *((_QWORD *)v5 + 5) - 1) & -*((_QWORD *)v5 + 5);
  }
  return v4;
}

- (void)dealloc
{
  VMBuffer *vmBuffer;
  objc_super v4;

  vmBuffer = self->_vmBuffer;
  if (vmBuffer)
  {
    GPUTools::VMBuffer::~VMBuffer((GPUTools::VMBuffer *)vmBuffer);
    MEMORY[0x242622C98]();
  }
  v4.receiver = self;
  v4.super_class = (Class)DYVMBuffer;
  -[DYVMBuffer dealloc](&v4, sel_dealloc);
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
  unint64_t var5;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  vmBuffer = self->_vmBuffer;
  if (vmBuffer->var1 < a3)
  {
    GPUTools::VMBuffer::resize((GPUTools::VMBuffer *)vmBuffer, a3);
    vmBuffer = self->_vmBuffer;
  }
  var5 = vmBuffer->var5;
  v7 = var5 - 1;
  v8 = var5 - 1 + vmBuffer->var0;
  v9 = -(uint64_t)var5;
  v10 = (v8 & v9) - vmBuffer->var0;
  vmBuffer->var3 = v10;
  vmBuffer->var4 = v10 + ((v7 + a3) & v9);
}

- (id)subdataWithRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;

  length = a3.length;
  location = a3.location;
  if (a3.location + a3.length <= -[DYVMBuffer length](self, "length"))
    return -[DYVMBufferSubRegion initWithDYVMBuffer:range:]([DYVMBufferSubRegion alloc], "initWithDYVMBuffer:range:", self, location, length);
  else
    return 0;
}

- (VMBuffer)vmBuffer
{
  return self->_vmBuffer;
}

@end
