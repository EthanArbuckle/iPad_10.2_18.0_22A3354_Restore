@implementation _PipelineLibrarySerializer

- (_PipelineLibrarySerializer)init
{
  _PipelineLibrarySerializer *v2;
  MTLPipelineLibrarySerializer::PipelineLibraryBinarySerializer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_PipelineLibrarySerializer;
  v2 = -[_PipelineLibrarySerializer init](&v5, sel_init);
  if (v2)
  {
    v3 = (MTLPipelineLibrarySerializer::PipelineLibraryBinarySerializer *)operator new();
    MTLPipelineLibrarySerializer::PipelineLibraryBinarySerializer::PipelineLibraryBinarySerializer(v3);
    v2->_binarySerializer = v3;
  }
  return v2;
}

- (void)dealloc
{
  void *binarySerializer;
  objc_super v4;

  binarySerializer = self->_binarySerializer;
  if (binarySerializer)
    (*(void (**)(void *, SEL))(*(_QWORD *)binarySerializer + 88))(binarySerializer, a2);
  v4.receiver = self;
  v4.super_class = (Class)_PipelineLibrarySerializer;
  -[_PipelineLibrarySerializer dealloc](&v4, sel_dealloc);
}

- (unint64_t)addLibrary:(void *)a3
{
  return (**(uint64_t (***)(void *, void *))self->_binarySerializer)(self->_binarySerializer, a3);
}

- (id)addSpecializedFunction:(id)a3 descriptor:(const void *)a4
{
  (*(void (**)(void *, const void *, id))(*(_QWORD *)self->_binarySerializer + 8))(self->_binarySerializer, a4, a3);
  return self;
}

- (id)addRenderPipelineDescriptor:(const void *)a3
{
  (*(void (**)(void *, const void *))(*(_QWORD *)self->_binarySerializer + 32))(self->_binarySerializer, a3);
  return self;
}

- (id)addComputePipelineDescriptor:(const void *)a3
{
  (*(void (**)(void *, const void *))(*(_QWORD *)self->_binarySerializer + 24))(self->_binarySerializer, a3);
  return self;
}

- (id)addTileRenderPipelineDescriptor:(const void *)a3
{
  (*(void (**)(void *, const void *))(*(_QWORD *)self->_binarySerializer + 56))(self->_binarySerializer, a3);
  return self;
}

- (id)addMeshRenderPipelineDescriptor:(const void *)a3
{
  (*(void (**)(void *, const void *))(*(_QWORD *)self->_binarySerializer + 64))(self->_binarySerializer, a3);
  return self;
}

- (unint64_t)totalSize
{
  return MTLPipelineLibrarySerializer::PipelineLibraryBinarySerializer::getTotalSize((MTLPipelineLibrarySerializer::BinarySerializationContext **)self->_binarySerializer);
}

- (unint64_t)writeToMemory:(char *)a3 size:(unint64_t)a4
{
  return MTLPipelineLibrarySerializer::PipelineLibraryBinarySerializer::writeToMemory((MTLPipelineLibrarySerializer::PipelineLibraryBinarySerializer *)self->_binarySerializer, a3, a4);
}

@end
