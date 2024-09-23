@implementation MTLToolsIOHandle

- (NSString)label
{
  return (NSString *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "label");
}

- (void)setLabel:(id)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setLabel:", a3);
}

- (unsigned)vnioID
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "vnioID");
}

- (MTLToolsIOHandle)initWithBaseObject:(id)a3 parent:(id)a4
{
  objc_super v5;

  if (a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)MTLToolsIOHandle;
    return -[MTLToolsObject initWithBaseObject:parent:](&v5, sel_initWithBaseObject_parent_, a3, a4);
  }
  else
  {

    return 0;
  }
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MTLToolsIOHandle;
  -[MTLToolsObject dealloc](&v2, sel_dealloc);
}

- (unint64_t)globalTraceObjectID
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "globalTraceObjectID");
}

- (int64_t)read:(void *)a3 size:(unint64_t)a4 offset:(unint64_t)a5 stagingBuffer:(void *)a6 stagingBufferSize:(unint64_t)a7 needsDecompress:(BOOL *)a8
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "read:size:offset:stagingBuffer:stagingBufferSize:needsDecompress:", a3, a4, a5, a6, a7, a8);
}

- (void)readIntoStagingBuffer:(unint64_t)a3 offset:(unint64_t)a4 stagingBuffer:(void *)a5 stagingBufferSize:(unint64_t)a6 needsDecompress:(BOOL *)a7
{
  return (void *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "readIntoStagingBuffer:offset:stagingBuffer:stagingBufferSize:needsDecompress:", a3, a4, a5, a6, a7);
}

- (int64_t)read:(void *)a3 size:(unint64_t)a4 offset:(unint64_t)a5 stagingBuffer:(void *)a6 stagingBufferSize:(unint64_t)a7
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "read:size:offset:stagingBuffer:stagingBufferSize:", a3, a4, a5, a6, a7);
}

- (void)readIntoStagingBuffer:(unint64_t)a3 offset:(unint64_t)a4 stagingBuffer:(void *)a5 stagingBufferSize:(unint64_t)a6
{
  return (void *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "readIntoStagingBuffer:offset:stagingBuffer:stagingBufferSize:", a3, a4, a5, a6);
}

- (unint64_t)stagingBufferSize:(unint64_t)a3 offset:(unint64_t)a4
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "stagingBufferSize:offset:", a3, a4);
}

- (unint64_t)getHandleOffset:(unint64_t)a3 offset:(unint64_t)a4
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "getHandleOffset:offset:", a3, a4);
}

- (int64_t)decompress:(void *)a3 size:(unint64_t)a4 offset:(unint64_t)a5 stagingBuffer:(void *)a6 stagingBufferSize:(unint64_t)a7
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "decompress:size:offset:stagingBuffer:stagingBufferSize:", a3, a4, a5, a6, a7);
}

- (unint64_t)length
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "length");
}

@end
