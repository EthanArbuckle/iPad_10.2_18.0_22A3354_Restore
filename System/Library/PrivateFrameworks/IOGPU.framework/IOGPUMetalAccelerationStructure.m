@implementation IOGPUMetalAccelerationStructure

- (unint64_t)uniqueIdentifier
{
  return -[MTLBuffer gpuAddress](self->_buffer, "gpuAddress");
}

- (unint64_t)accelerationStructureUniqueIdentifier
{
  return -[MTLBuffer gpuAddress](self->_buffer, "gpuAddress");
}

- (MTLBuffer)buffer
{
  return self->_buffer;
}

- (unint64_t)bufferOffset
{
  return self->_bufferOffset;
}

- (unint64_t)size
{
  return -[MTLBuffer length](self->_buffer, "length");
}

- (MTLHeap)heap
{
  return (MTLHeap *)-[MTLBuffer heap](self->_buffer, "heap");
}

- (unint64_t)heapOffset
{
  return -[MTLBuffer heapOffset](self->_buffer, "heapOffset");
}

- (unint64_t)allocatedSize
{
  return -[MTLBuffer allocatedSize](self->_buffer, "allocatedSize");
}

- (void)makeAliasable
{
  -[MTLBuffer makeAliasable](self->_buffer, "makeAliasable");
}

- (BOOL)isAliasable
{
  return -[MTLBuffer isAliasable](self->_buffer, "isAliasable");
}

- (void)copyPropertiesFromBuffer:(id)a3
{
  char *v4;
  id v5;
  uint64_t v6;

  v4 = (char *)a3 + 32;
  v5 = *((id *)a3 + 27);
  v6 = *((_QWORD *)v4 + 24);
  *(_QWORD *)&self->super._anon_50[136] = v5;
  *(_QWORD *)&self->super._anon_50[144] = v6;
  *(_OWORD *)&self->super._anon_50[152] = *(_OWORD *)(v4 + 200);
  self->super._anon_50[168] = v4[216];
  *(_QWORD *)&self->super._anon_50[24] = *((_QWORD *)v4 + 9);
  *(_QWORD *)&self->super._anon_50[80] = *((_QWORD *)v4 + 16);
}

- (IOGPUMetalAccelerationStructure)initWithBuffer:(id)a3 offset:(unint64_t)a4
{
  IOGPUMetalAccelerationStructure *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IOGPUMetalAccelerationStructure;
  v6 = -[IOGPUMetalResource initWithResource:](&v8, sel_initWithResource_);
  if (v6)
  {
    v6->_buffer = (MTLBuffer *)a3;
    v6->_bufferOffset = a4;
    -[IOGPUMetalAccelerationStructure copyPropertiesFromBuffer:](v6, "copyPropertiesFromBuffer:", a3);
  }
  return v6;
}

- (IOGPUMetalAccelerationStructure)initWithBuffer:(id)a3 offset:(unint64_t)a4 resourceIndex:(unint64_t)a5
{
  IOGPUMetalAccelerationStructure *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)IOGPUMetalAccelerationStructure;
  v8 = -[IOGPUMetalResource initWithResource:](&v10, sel_initWithResource_);
  if (v8)
  {
    v8->_buffer = (MTLBuffer *)a3;
    v8->_bufferOffset = a4;
    v8->_resourceIndex = a5;
    -[IOGPUMetalAccelerationStructure copyPropertiesFromBuffer:](v8, "copyPropertiesFromBuffer:", a3);
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  *(_QWORD *)&self->super._anon_50[136] = 0;
  v3.receiver = self;
  v3.super_class = (Class)IOGPUMetalAccelerationStructure;
  -[IOGPUMetalResource dealloc](&v3, sel_dealloc);
}

- (MTLAccelerationStructureDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 304);
}

- (unint64_t)resourceIndex
{
  return self->_resourceIndex;
}

@end
