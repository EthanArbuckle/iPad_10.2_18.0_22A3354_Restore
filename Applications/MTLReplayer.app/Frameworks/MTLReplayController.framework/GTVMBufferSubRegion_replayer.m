@implementation GTVMBufferSubRegion_replayer

- (GTVMBufferSubRegion_replayer)initWithGTVMBuffer:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  GTVMBufferSubRegion_replayer *v7;
  objc_super v9;

  length = a4.length;
  location = a4.location;
  v9.receiver = self;
  v9.super_class = (Class)GTVMBufferSubRegion_replayer;
  v7 = -[GTVMBufferSubRegion_replayer init](&v9, "init");
  if (v7)
  {
    v7->_parent = (GTVMBuffer_replayer *)a3;
    v7->_range.location = location;
    v7->_range.length = length;
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GTVMBufferSubRegion_replayer;
  -[GTVMBufferSubRegion_replayer dealloc](&v3, "dealloc");
}

- (unint64_t)length
{
  return self->_range.length;
}

- (const)bytes
{
  const void *result;

  result = -[GTVMBuffer_replayer bytes](self->_parent, "bytes");
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
  if (a3.location + a3.length <= -[GTVMBufferSubRegion_replayer length](self, "length"))
    return -[GTVMBufferSubRegion_replayer initWithGTVMBuffer:range:]([GTVMBufferSubRegion_replayer alloc], "initWithGTVMBuffer:range:", self->_parent, self->_range.location + location, length);
  else
    return 0;
}

- (id)GTGPUToolsData
{
  const void *v3;
  const void *v4;
  GTVMBufferSubRegion_replayer *v5;
  _QWORD v7[5];

  v3 = -[GTVMBufferSubRegion_replayer bytes](self, "bytes");
  if (!v3)
    return +[NSData data](NSData, "data");
  v4 = v3;
  v5 = self;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __37__GTVMBufferSubRegion_GTGPUToolsData__block_invoke;
  v7[3] = &unk_725CF0;
  v7[4] = self;
  return objc_msgSend(objc_alloc((Class)NSData), "initWithBytesNoCopy:length:deallocator:", v4, -[GTVMBufferSubRegion_replayer length](self, "length"), v7);
}

@end
