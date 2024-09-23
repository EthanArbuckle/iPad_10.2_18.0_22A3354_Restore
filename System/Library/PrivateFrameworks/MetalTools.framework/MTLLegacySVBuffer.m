@implementation MTLLegacySVBuffer

- (MTLLegacySVBuffer)initWithBuffer:(id)a3 device:(id)a4
{
  return -[MTLLegacySVBuffer initWithBuffer:device:offset:length:track:](self, "initWithBuffer:device:offset:length:track:", a3, a4, 0, objc_msgSend(a3, "length"), 1);
}

- (MTLLegacySVBuffer)initWithBuffer:(id)a3 device:(id)a4 offset:(unint64_t)a5 length:(unint64_t)a6
{
  return -[MTLLegacySVBuffer initWithBuffer:device:offset:length:track:](self, "initWithBuffer:device:offset:length:track:", a3, a4, a5, a6, 1);
}

- (MTLLegacySVBuffer)initWithBuffer:(id)a3 device:(id)a4 offset:(unint64_t)a5 length:(unint64_t)a6 track:(BOOL)a7
{
  return -[MTLLegacySVBuffer initWithBuffer:heap:device:offset:length:track:](self, "initWithBuffer:heap:device:offset:length:track:", a3, 0, a4, a5, a6, a7);
}

- (MTLLegacySVBuffer)initWithBuffer:(id)a3 heap:(id)a4 device:(id)a5
{
  return -[MTLLegacySVBuffer initWithBuffer:heap:device:offset:length:track:](self, "initWithBuffer:heap:device:offset:length:track:", a3, a4, a5, 0, objc_msgSend(a3, "length"), 1);
}

- (MTLLegacySVBuffer)initWithBuffer:(id)a3 heap:(id)a4 device:(id)a5 offset:(unint64_t)a6 length:(unint64_t)a7 track:(BOOL)a8
{
  _BOOL4 v8;
  id v12;
  MTLLegacySVBuffer *v13;
  MTLLegacySVBuffer *v14;
  objc_super v16;

  v8 = a8;
  v12 = a4;
  if (!a4)
    a4 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MTLLegacySVBuffer;
  v13 = -[MTLToolsResource initWithBaseObject:parent:heap:](&v16, sel_initWithBaseObject_parent_heap_, a3, a4, v12);
  v14 = v13;
  if (v13)
  {
    v13->_offset = a6;
    v13->_length = a7;
    if (v8 && (*((_BYTE *)a5 + 286) & 0x80) != 0)
    {
      v13->_descriptorHeap = (char *)a5 + 296;
      -[MTLLegacySVBuffer setBufferIndex:](v13, "setBufferIndex:", LegacySVBufferDescriptorHeap::createHandle((std::mutex *)((char *)a5 + 296), v13));
    }
  }
  return v14;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_descriptorHeap)
    -[MTLLegacySVBuffer setBufferIndex:](self, "setBufferIndex:", 0);
  v3.receiver = self;
  v3.super_class = (Class)MTLLegacySVBuffer;
  -[MTLToolsBuffer dealloc](&v3, sel_dealloc);
}

- (id)newLinearTextureWithDescriptor:(id)a3 offset:(unint64_t)a4 bytesPerRow:(unint64_t)a5 bytesPerImage:(unint64_t)a6
{
  id result;

  result = (id)-[MTLToolsObject newLinearTextureWithDescriptor:offset:bytesPerRow:bytesPerImage:](self->super.super.super._baseObject, "newLinearTextureWithDescriptor:offset:bytesPerRow:bytesPerImage:", a3, a4, a5, a6);
  if (result)
    return CreateTexture(result, (uint64_t)self);
  return result;
}

- (id)newTextureWithDescriptor:(id)a3 offset:(unint64_t)a4 bytesPerRow:(unint64_t)a5
{
  id result;

  result = (id)-[MTLToolsObject newTextureWithDescriptor:offset:bytesPerRow:](self->super.super.super._baseObject, "newTextureWithDescriptor:offset:bytesPerRow:", a3, a4, a5);
  if (result)
    return CreateTexture(result, (uint64_t)self);
  return result;
}

- (void)setBufferIndex:(unint64_t)a3
{
  unint64_t bufferIndex;

  bufferIndex = self->_bufferIndex;
  if (bufferIndex != a3)
  {
    if (bufferIndex)
    {
      MTLLegacySVSetBufferForResourceHandle((MTLLegacySVDevice *)self->super.super.super._device, bufferIndex, 0);
      LegacySVBufferDescriptorHeap::freeBufferHandle((std::mutex *)self->_descriptorHeap, self->_bufferIndex);
    }
    self->_bufferIndex = a3;
    if (a3)
      MTLLegacySVSetBufferForResourceHandle((MTLLegacySVDevice *)self->super.super.super._device, a3, self);
  }
}

- (unint64_t)bufferIndex
{
  return self->_bufferIndex;
}

- (unint64_t)handleForOffset:(unint64_t)a3
{
  return a3 + (self->_bufferIndex << 40);
}

- (unint64_t)length
{
  return self->_length;
}

- (unint64_t)offset
{
  return self->_offset;
}

- (void)contents
{
  return (void *)(-[MTLToolsObject contents](self->super.super.super._baseObject, "contents") + self->_offset);
}

- (unint64_t)gpuAddress
{
  return -[MTLLegacySVBuffer handleForOffset:](self, "handleForOffset:", 0);
}

- (unint64_t)underlyingGPUAddress
{
  return self->_offset + -[MTLToolsObject gpuAddress](self->super.super.super._baseObject, "gpuAddress");
}

- (BOOL)isTracked
{
  return self->_bufferIndex != 0;
}

- (void)useWithComputeEncoder:(id)a3 usage:(unint64_t)a4
{
  objc_msgSend(a3, "useResourceInternal:usage:", self->super.super.super._baseObject, a4);
}

- (void)useWithRenderEncoder:(id)a3 usage:(unint64_t)a4 stages:(optional<unsigned long>)a5
{
  objc_msgSend(a3, "useResourceInternal:usage:stages:", self->super.super.super._baseObject, a4, a5.var0.var1, *(_QWORD *)&a5.var1);
}

@end
