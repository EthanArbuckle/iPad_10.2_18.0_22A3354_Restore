@implementation MTLGPUDebugBlitCommandEncoder

- (MTLGPUDebugBlitCommandEncoder)initWithBlitCommandEncoder:(id)a3 parent:(id)a4 descriptor:(id)a5 encoderID:(unsigned int)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTLGPUDebugBlitCommandEncoder;
  return -[MTLToolsBlitCommandEncoder initWithBlitCommandEncoder:parent:descriptor:](&v7, sel_initWithBlitCommandEncoder_parent_descriptor_, a3, a4, a5, *(_QWORD *)&a6);
}

- (void)copyIndirectCommandBuffer:(id)a3 sourceRange:(_NSRange)a4 destination:(id)a5 destinationIndex:(unint64_t)a6
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v12;
  uint64_t v13;
  NSUInteger v14;
  MTLToolsObject *baseObject;
  uint64_t v16;
  uint64_t v17;
  NSUInteger v18;
  unint64_t v19;
  unint64_t v20;

  length = a4.length;
  location = a4.location;
  if (objc_msgSend(a3, "internalICBBuffer"))
  {
    v12 = objc_msgSend(a3, "commandByteStride");
    v13 = v12 * location + 40;
    v19 = v12 * a6 + 40;
    v20 = a6;
    v14 = v12 * length;
    baseObject = self->super.super.super._baseObject;
    v16 = objc_msgSend(a3, "internalICBBuffer");
    v17 = objc_msgSend(a5, "internalICBBuffer");
    v18 = v14;
    a6 = v20;
    -[MTLToolsObject copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:](baseObject, "copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:", v16, v13, v17, v19, v18);
  }
  -[MTLToolsObject copyIndirectCommandBuffer:sourceRange:destination:destinationIndex:](self->super.super.super._baseObject, "copyIndirectCommandBuffer:sourceRange:destination:destinationIndex:", objc_msgSend(a3, "baseObject"), location, length, objc_msgSend(a5, "baseObject"), a6);
}

- (void)copyFromInternalBuffer:(id)a3 sourceOffset:(unint64_t)a4 toInternalBuffer:(id)a5 destinationOffset:(unint64_t)a6 size:(unint64_t)a7
{
  -[MTLToolsObject copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:](self->super.super.super._baseObject, "copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:", a3, a4, a5, a6, a7);
}

- (id)temporaryBufferWithBytes:(const void *)a3 length:(unint64_t)a4
{
  return (id)-[MTLToolsObject temporaryBufferWithBytes:length:](self->super.super.super._parent, "temporaryBufferWithBytes:length:", a3, a4);
}

- (id)temporaryBufferWithLength:(unint64_t)a3
{
  return (id)-[MTLToolsObject temporaryBufferWithLength:](self->super.super.super._parent, "temporaryBufferWithLength:", a3);
}

- (unsigned)encoderID
{
  return self->_encoderID;
}

@end
