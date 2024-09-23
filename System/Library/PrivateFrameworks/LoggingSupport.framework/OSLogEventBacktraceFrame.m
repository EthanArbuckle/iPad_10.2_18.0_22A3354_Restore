@implementation OSLogEventBacktraceFrame

- (unint64_t)imageOffset
{
  return self->_imageOffset;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OSLogEventBacktraceFrame;
  -[OSLogEventBacktraceFrame dealloc](&v3, sel_dealloc);
}

- (NSUUID)imageUUID
{
  NSUUID *result;

  result = self->_imageUUID;
  if (!result)
  {
    result = (NSUUID *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", self->_uuid);
    self->_imageUUID = result;
  }
  return result;
}

- (OSLogEventBacktraceFrame)initWithUUIDBytes:(const char *)a3 andOffset:(unint64_t)a4
{
  OSLogEventBacktraceFrame *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)OSLogEventBacktraceFrame;
  result = -[OSLogEventBacktraceFrame init](&v7, sel_init);
  if (result)
  {
    *(_OWORD *)result->_uuid = *(_OWORD *)a3;
    result->_imageOffset = a4;
  }
  return result;
}

- (const)imageUUIDBytes
{
  return (const char *)self->_uuid;
}

@end
