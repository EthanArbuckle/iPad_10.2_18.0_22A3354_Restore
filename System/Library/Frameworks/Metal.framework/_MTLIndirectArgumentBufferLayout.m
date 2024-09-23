@implementation _MTLIndirectArgumentBufferLayout

- (_MTLIndirectArgumentBufferLayout)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_MTLIndirectArgumentBufferLayout;
  return -[_MTLIndirectArgumentBufferLayout init](&v3, sel_init);
}

- (void)dealloc
{
  id *v3;
  objc_super v4;

  v3 = (id *)self->_private;
  if (v3)
  {
    _MTLIndirectArgumentBufferLayoutPrivate::~_MTLIndirectArgumentBufferLayoutPrivate(v3);
    MEMORY[0x186DABFBC]();
  }
  v4.receiver = self;
  v4.super_class = (Class)_MTLIndirectArgumentBufferLayout;
  -[_MTLIndirectArgumentBufferLayout dealloc](&v4, sel_dealloc);
}

- (void)setStructType:(id)a3 withDevice:(id)a4
{
  void *v7;

  v7 = (void *)operator new();
  _MTLIndirectArgumentBufferLayoutPrivate::_MTLIndirectArgumentBufferLayoutPrivate((uint64_t)v7, (MTLStructType *)a3, a4);
  self->_private = v7;
}

- (void)virtualAddressForBufferAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5
{
  -[_MTLIndirectArgumentBufferLayout doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
  return 0;
}

- (unint64_t)uniqueIdentifierForTextureAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5
{
  -[_MTLIndirectArgumentBufferLayout doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
  return 0;
}

- (unint64_t)uniqueIdentifierForSamplerAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5
{
  -[_MTLIndirectArgumentBufferLayout doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
  return 0;
}

- (unint64_t)uniqueIdentifierForRenderPipelineAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5
{
  -[_MTLIndirectArgumentBufferLayout doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
  return 0;
}

- (unint64_t)uniqueIdentifierForComputePipelineAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5
{
  -[_MTLIndirectArgumentBufferLayout doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
  return 0;
}

- (unint64_t)uniqueIdentifierForVisibleFunctionTableAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5
{
  uint64_t v9;

  if (-[MTLDeviceSPI requiresRaytracingEmulation](-[_MTLIndirectArgumentBufferLayout device](self, "device", a3, a4, a5), "requiresRaytracingEmulation"))
  {
    v9 = objc_msgSend(a4, "contents");
    return *(_QWORD *)(v9 + objc_msgSend(self->_private, "offsetForVisibleFunctionTable:", a3));
  }
  else
  {
    -[_MTLIndirectArgumentBufferLayout doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
    return 0;
  }
}

- (unint64_t)uniqueIdentifierForIntersectionFunctionTableAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5
{
  uint64_t v9;

  if (-[MTLDeviceSPI requiresRaytracingEmulation](-[_MTLIndirectArgumentBufferLayout device](self, "device", a3, a4, a5), "requiresRaytracingEmulation"))
  {
    v9 = objc_msgSend(a4, "contents");
    return *(_QWORD *)(v9 + objc_msgSend(self->_private, "offsetForIntersectionFunctionTable:", a3));
  }
  else
  {
    -[_MTLIndirectArgumentBufferLayout doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
    return 0;
  }
}

- (unint64_t)uniqueIdentifierForInstanceAccelerationStructureAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5
{
  uint64_t v9;

  if (-[MTLDeviceSPI requiresRaytracingEmulation](-[_MTLIndirectArgumentBufferLayout device](self, "device", a3, a4, a5), "requiresRaytracingEmulation"))
  {
    v9 = objc_msgSend(a4, "contents");
    return *(_QWORD *)(v9 + objc_msgSend(self->_private, "offsetForInstanceAccelerationStructure:", a3));
  }
  else
  {
    -[_MTLIndirectArgumentBufferLayout doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
    return 0;
  }
}

- (unint64_t)uniqueIdentifierForPrimitiveAccelerationStructureAtIndex:(unint64_t)a3 inIndirectArgumentBuffer:(id)a4 atOffset:(unint64_t)a5
{
  uint64_t v9;

  if (-[MTLDeviceSPI requiresRaytracingEmulation](-[_MTLIndirectArgumentBufferLayout device](self, "device", a3, a4, a5), "requiresRaytracingEmulation"))
  {
    v9 = objc_msgSend(a4, "contents");
    return *(_QWORD *)(v9 + objc_msgSend(self->_private, "offsetForPrimitiveAccelerationStructure:", a3));
  }
  else
  {
    -[_MTLIndirectArgumentBufferLayout doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
    return 0;
  }
}

- (BOOL)bufferLayoutMatchesFrontEndLayout
{
  return 1;
}

- (unint64_t)encodedLength
{
  return -1;
}

- (unint64_t)alignment
{
  return -1;
}

- (unsigned)hashValue
{
  return -1;
}

- (unsigned)hashOffset
{
  return -1;
}

- (unsigned)hashMask
{
  return -2097152;
}

- (unsigned)hashSignature
{
  return 2145386496;
}

- (unint64_t)constantOffsetAtIndex:(unint64_t)a3
{
  return -1;
}

- (id)bufferLayoutForResourceAtIndex:(unint64_t)a3
{
  _QWORD *v3;
  id result;
  unint64_t v5;

  v3 = self->_private;
  v5 = a3;
  result = std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::find<unsigned long>(v3 + 1, &v5);
  if (result)
    return (id)*((_QWORD *)result + 3);
  return result;
}

- (MTLDeviceSPI)device
{
  return *(MTLDeviceSPI **)self->_private;
}

@end
