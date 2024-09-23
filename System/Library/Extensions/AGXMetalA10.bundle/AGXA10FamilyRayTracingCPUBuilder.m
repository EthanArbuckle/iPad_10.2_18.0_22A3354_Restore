@implementation AGXA10FamilyRayTracingCPUBuilder

- (AGXA10FamilyRayTracingCPUBuilder)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AGXA10FamilyRayTracingCPUBuilder;
  return -[_MTLObjectWithLabel init](&v3, sel_init);
}

- (void)refitAccelerationStructure:(id)a3 descriptor:(id)a4 destination:(id)a5 scratchBuffer:(id)a6 scratchBufferOffset:(unint64_t)a7
{
  -[AGXA10FamilyRayTracingCPUBuilder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5, a6, a7);
}

- (void)copyAccelerationStructure:(id)a3 toAccelerationStructure:(id)a4
{
  -[AGXA10FamilyRayTracingCPUBuilder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

- (void)writeCompactedAccelerationStructureSize:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5
{
  uint64_t v5;

  v5 = *(_QWORD *)(*((_QWORD *)a3 + 41) + 72);
  *(_QWORD *)(objc_msgSend(a4, "contents") + a5) = v5;
}

- (void)writeCompactedAccelerationStructureSize:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5 sizeDataType:(unint64_t)a6
{
  -[AGXA10FamilyRayTracingCPUBuilder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5, a6);
}

- (void)copyAndCompactAccelerationStructure:(id)a3 toAccelerationStructure:(id)a4
{
  char *v5;
  uint64_t v6;

  v5 = (char *)a4 + 320;
  memcpy(*((void **)a4 + 41), *((const void **)a3 + 41), *(_QWORD *)(*((_QWORD *)a3 + 41) + 72));
  v6 = *((_QWORD *)v5 + 1);
  *(_QWORD *)(v6 + 144) = objc_msgSend(a4, "uniqueIdentifier");
}

- (void)writeSerializedAccelerationStructureSize:(id)a3 toBuffer:(id)a4 sizeBufferOffset:(unint64_t)a5
{
  uint64_t v5;

  v5 = *(_QWORD *)(*((_QWORD *)a3 + 41) + 72) + 24;
  *(_QWORD *)(objc_msgSend(a4, "contents") + a5) = v5;
}

- (void)writeDeserializedAccelerationStructureSize:(id)a3 serializedOffset:(unint64_t)a4 toBuffer:(id)a5 sizeBufferOffset:(unint64_t)a6
{
  unint64_t v8;

  v8 = objc_msgSend(a3, "contents") + a4;
  *(_QWORD *)(objc_msgSend(a5, "contents") + a6) = *(_QWORD *)(v8 + 16);
}

- (void)writeDeserializedPrimitiveAccelerationStructureSizes:(id)a3 serializedOffset:(unint64_t)a4 toBuffer:(id)a5 sizesBufferOffset:(unint64_t)a6
{
  -[AGXA10FamilyRayTracingCPUBuilder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5, a6);
}

- (void)serializePrimitiveAccelerationStructure:(id)a3 toBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5
{
  const void **v5;
  uint64_t v6;
  size_t v7;
  unint64_t v8;

  v5 = (const void **)((char *)a3 + 320);
  v6 = *((_QWORD *)a3 + 41);
  v7 = *(_QWORD *)(v6 + 72);
  v8 = objc_msgSend(a4, "contents") + a5;
  *(_DWORD *)v8 = 0;
  *(_DWORD *)(v8 + 4) = *(_DWORD *)(v6 + 64);
  *(_QWORD *)(v8 + 8) = v7 + 24;
  *(_QWORD *)(v8 + 16) = v7;
  memcpy((void *)(v8 + 24), v5[1], v7);
}

- (void)serializeInstanceAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 toBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6
{
  -[AGXA10FamilyRayTracingCPUBuilder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5, a6);
}

- (void)deserializePrimitiveAccelerationStructure:(id)a3 fromBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5
{
  -[AGXA10FamilyRayTracingCPUBuilder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
}

- (void)deserializeInstanceAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 fromBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6
{
  -[AGXA10FamilyRayTracingCPUBuilder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5, a6);
}

- (void)serializeAccelerationStructure:(id)a3 toBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5
{
  -[AGXA10FamilyRayTracingCPUBuilder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
}

- (void)deserializeAccelerationStructure:(id)a3 fromBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5
{
  -[AGXA10FamilyRayTracingCPUBuilder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
}

- (void)deserializeAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 fromBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6
{
  -[AGXA10FamilyRayTracingCPUBuilder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5, a6);
}

- (void)writeGeometrySizeOfAccelerationStructure:(id)a3 toBuffer:(id)a4 sizeBufferOffset:(unint64_t)a5
{
  -[AGXA10FamilyRayTracingCPUBuilder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
}

- (void)writeGeometryOfAccelerationStructure:(id)a3 toBuffer:(id)a4 geometryBufferOffset:(unint64_t)a5
{
  -[AGXA10FamilyRayTracingCPUBuilder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
}

- (void)writeGenericBVHStructureSizesOfAccelerationStructure:(id)a3 toBuffer:(id)a4 sizesBufferOffset:(unint64_t)a5
{
  -[AGXA10FamilyRayTracingCPUBuilder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
}

- (void)writeGenericBVHStructureOfAccelerationStructure:(id)a3 headerBuffer:(id)a4 headerBufferOffset:(unint64_t)a5 innerNodeBuffer:(id)a6 innerNodeBufferOffset:(unint64_t)a7 leafNodeBuffer:(id)a8 leafNodeBufferOffset:(unint64_t)a9 primitiveBuffer:(id)a10 primitiveBufferOffset:(unint64_t)a11 geometryBuffer:(id)a12 geometryOffset:(unint64_t)a13 instanceTransformBuffer:(id)a14 instanceTransformOffset:(unint64_t)a15 controlPointBuffer:(id)a16 controlPointBufferOffset:(unint64_t)a17
{
  -[AGXA10FamilyRayTracingCPUBuilder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5, a6, a7, a8);
}

+ ($F99D9A4FB75BC57F3386B8DC8EE08D7A)calcAllocSizesFromDescriptor:(SEL)a3
{
  *(_OWORD *)&retstr->var0 = xmmword_232D73A10;
  retstr->var2 = 16;
  return result;
}

@end
