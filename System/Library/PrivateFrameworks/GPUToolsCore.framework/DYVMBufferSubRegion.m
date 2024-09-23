@implementation DYVMBufferSubRegion

- (DYVMBufferSubRegion)initWithDYVMBuffer:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  DYVMBufferSubRegion *v7;
  objc_super v9;

  length = a4.length;
  location = a4.location;
  v9.receiver = self;
  v9.super_class = (Class)DYVMBufferSubRegion;
  v7 = -[DYVMBufferSubRegion init](&v9, sel_init);
  if (v7)
  {
    v7->_parent = (DYVMBuffer *)a3;
    v7->_range.location = location;
    v7->_range.length = length;
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DYVMBufferSubRegion;
  -[DYVMBufferSubRegion dealloc](&v3, sel_dealloc);
}

- (unint64_t)length
{
  return self->_range.length;
}

- (const)bytes
{
  const void *result;

  result = -[DYVMBuffer bytes](self->_parent, "bytes");
  if (result)
    return (char *)result + self->_range.location;
  return result;
}

- (id)subdataWithRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;

  length = a3.length;
  location = a3.location;
  if (a3.location + a3.length <= -[DYVMBufferSubRegion length](self, "length"))
    return -[DYVMBufferSubRegion initWithDYVMBuffer:range:]([DYVMBufferSubRegion alloc], "initWithDYVMBuffer:range:", self->_parent, self->_range.location + location, length);
  else
    return 0;
}

- (id)DYGPUToolsData
{
  const void *v3;
  const void *v4;
  DYVMBufferSubRegion *v5;
  id v6;
  unint64_t v7;
  _QWORD v9[5];

  v3 = -[DYVMBufferSubRegion bytes](self, "bytes");
  if (!v3)
    return (id)objc_msgSend(MEMORY[0x24BDBCE50], "data");
  v4 = v3;
  v5 = self;
  v6 = objc_alloc(MEMORY[0x24BDBCE50]);
  v7 = -[DYVMBufferSubRegion length](self, "length");
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __37__DYVMBufferSubRegion_DYGPUToolsData__block_invoke;
  v9[3] = &unk_250D637C0;
  v9[4] = self;
  return (id)objc_msgSend(v6, "initWithBytesNoCopy:length:deallocator:", v4, v7, v9);
}

void __37__DYVMBufferSubRegion_DYGPUToolsData__block_invoke(uint64_t a1)
{

}

@end
