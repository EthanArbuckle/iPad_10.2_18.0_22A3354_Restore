@implementation MTLToolsAccelerationStructureCommandEncoder

- (MTLToolsAccelerationStructureCommandEncoder)initWithAccelerationStructureCommandEncoder:(id)a3 parent:(id)a4 descriptor:(id)a5
{
  MTLToolsAccelerationStructureCommandEncoder *v7;
  MTLToolsAccelerationStructureCommandEncoder *v8;
  uint64_t i;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MTLToolsAccelerationStructureCommandEncoder;
  v7 = -[MTLToolsCommandEncoder initWithBaseObject:parent:](&v11, sel_initWithBaseObject_parent_, a3);
  v8 = v7;
  if (a5 && v7)
  {
    for (i = 0; i != 4; ++i)
      objc_msgSend(a4, "addRetainedObject:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "sampleBufferAttachments"), "objectAtIndexedSubscript:", i), "sampleBuffer"));
  }
  return v8;
}

- (void)buildAccelerationStructure:(id)a3 descriptor:(id)a4 scratchBuffer:(id)a5 scratchBufferOffset:(unint64_t)a6
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "buildAccelerationStructure:descriptor:scratchBuffer:scratchBufferOffset:", objc_msgSend(a3, "baseObject"), unwrapAccelerationStructureDescriptor(a4), objc_msgSend(a5, "baseObject"), a6);
}

- (void)refitAccelerationStructure:(id)a3 descriptor:(id)a4 destination:(id)a5 scratchBuffer:(id)a6 scratchBufferOffset:(unint64_t)a7
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "refitAccelerationStructure:descriptor:destination:scratchBuffer:scratchBufferOffset:", objc_msgSend(a3, "baseObject"), unwrapAccelerationStructureDescriptor(a4), objc_msgSend(a5, "baseObject"), objc_msgSend(a6, "baseObject"), a7);
}

- (void)refitAccelerationStructure:(id)a3 descriptor:(id)a4 destination:(id)a5 scratchBuffer:(id)a6 scratchBufferOffset:(unint64_t)a7 options:(unint64_t)a8
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "refitAccelerationStructure:descriptor:destination:scratchBuffer:scratchBufferOffset:options:", objc_msgSend(a3, "baseObject"), unwrapAccelerationStructureDescriptor(a4), objc_msgSend(a5, "baseObject"), objc_msgSend(a6, "baseObject"), a7, a8);
}

- (void)copyAccelerationStructure:(id)a3 toAccelerationStructure:(id)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "copyAccelerationStructure:toAccelerationStructure:", objc_msgSend(a3, "baseObject"), objc_msgSend(a4, "baseObject"));
}

- (void)writeCompactedAccelerationStructureSize:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "writeCompactedAccelerationStructureSize:toBuffer:offset:", objc_msgSend(a3, "baseObject"), objc_msgSend(a4, "baseObject"), a5);
}

- (void)writeCompactedAccelerationStructureSize:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5 sizeDataType:(unint64_t)a6
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "writeCompactedAccelerationStructureSize:toBuffer:offset:sizeDataType:", objc_msgSend(a3, "baseObject"), objc_msgSend(a4, "baseObject"), a5, a6);
}

- (void)copyAndCompactAccelerationStructure:(id)a3 toAccelerationStructure:(id)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "copyAndCompactAccelerationStructure:toAccelerationStructure:", objc_msgSend(a3, "baseObject"), objc_msgSend(a4, "baseObject"));
}

- (void)writeSerializedAccelerationStructureSize:(id)a3 toBuffer:(id)a4 sizeBufferOffset:(unint64_t)a5
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "writeSerializedAccelerationStructureSize:toBuffer:sizeBufferOffset:", objc_msgSend(a3, "baseObject"), objc_msgSend(a4, "baseObject"), a5);
}

- (void)writeDeserializedAccelerationStructureSize:(id)a3 serializedOffset:(unint64_t)a4 toBuffer:(id)a5 sizeBufferOffset:(unint64_t)a6
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "writeDeserializedAccelerationStructureSize:serializedOffset:toBuffer:sizeBufferOffset:", objc_msgSend(a3, "baseObject"), a4, objc_msgSend(a5, "baseObject"), a6);
}

- (void)writeDeserializedPrimitiveAccelerationStructureSizes:(id)a3 serializedOffset:(unint64_t)a4 toBuffer:(id)a5 sizesBufferOffset:(unint64_t)a6
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "writeDeserializedPrimitiveAccelerationStructureSizes:serializedOffset:toBuffer:sizesBufferOffset:", objc_msgSend(a3, "baseObject"), a4, objc_msgSend(a5, "baseObject"), a6);
}

- (void)serializePrimitiveAccelerationStructure:(id)a3 toBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "serializePrimitiveAccelerationStructure:toBuffer:serializedBufferOffset:", objc_msgSend(a3, "baseObject"), objc_msgSend(a4, "baseObject"), a5);
}

- (void)serializeInstanceAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 toBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6
{
  void *v11;
  uint64_t v12;
  unsigned int v13;

  v11 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(a4, "count"));
  if (objc_msgSend(a4, "count"))
  {
    v12 = 0;
    v13 = 1;
    do
    {
      objc_msgSend(v11, "addObject:", objc_msgSend((id)objc_msgSend(a4, "objectAtIndexedSubscript:", v12), "baseObject"));
      v12 = v13;
    }
    while (objc_msgSend(a4, "count") > (unint64_t)v13++);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "serializeInstanceAccelerationStructure:primitiveAccelerationStructures:toBuffer:serializedBufferOffset:", objc_msgSend(a3, "baseObject"), v11, objc_msgSend(a5, "baseObject"), a6);
}

- (void)deserializePrimitiveAccelerationStructure:(id)a3 fromBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "deserializePrimitiveAccelerationStructure:fromBuffer:serializedBufferOffset:", objc_msgSend(a3, "baseObject"), objc_msgSend(a4, "baseObject"), a5);
}

- (void)deserializeInstanceAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 fromBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6
{
  void *v11;
  uint64_t v12;
  unsigned int v13;

  v11 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(a4, "count"));
  if (objc_msgSend(a4, "count"))
  {
    v12 = 0;
    v13 = 1;
    do
    {
      objc_msgSend(v11, "addObject:", objc_msgSend((id)objc_msgSend(a4, "objectAtIndexedSubscript:", v12), "baseObject"));
      v12 = v13;
    }
    while (objc_msgSend(a4, "count") > (unint64_t)v13++);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "deserializeInstanceAccelerationStructure:primitiveAccelerationStructures:fromBuffer:serializedBufferOffset:", objc_msgSend(a3, "baseObject"), v11, objc_msgSend(a5, "baseObject"), a6);
}

- (void)deserializePrimitiveAccelerationStructure:(id)a3 fromBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5 withDescriptor:(id)a6
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "deserializePrimitiveAccelerationStructure:fromBuffer:serializedBufferOffset:withDescriptor:", objc_msgSend(a3, "baseObject"), objc_msgSend(a4, "baseObject"), a5, unwrapAccelerationStructureDescriptor(a6));
}

- (void)deserializeInstanceAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 fromBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6 withDescriptor:(id)a7
{
  void *v13;
  uint64_t v14;
  unsigned int v15;

  v13 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(a4, "count"));
  if (objc_msgSend(a4, "count"))
  {
    v14 = 0;
    v15 = 1;
    do
    {
      objc_msgSend(v13, "addObject:", objc_msgSend((id)objc_msgSend(a4, "objectAtIndexedSubscript:", v14), "baseObject"));
      v14 = v15;
    }
    while (objc_msgSend(a4, "count") > (unint64_t)v15++);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "deserializeInstanceAccelerationStructure:primitiveAccelerationStructures:fromBuffer:serializedBufferOffset:withDescriptor:", objc_msgSend(a3, "baseObject"), v13, objc_msgSend(a5, "baseObject"), a6, unwrapAccelerationStructureDescriptor(a7));
}

- (void)serializeAccelerationStructure:(id)a3 toBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "serializeAccelerationStructure:toBuffer:serializedBufferOffset:", objc_msgSend(a3, "baseObject"), objc_msgSend(a4, "baseObject"), a5);
}

- (void)deserializeAccelerationStructure:(id)a3 fromBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "deserializeAccelerationStructure:fromBuffer:serializedBufferOffset:", objc_msgSend(a3, "baseObject"), objc_msgSend(a4, "baseObject"), a5);
}

- (void)deserializeAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 fromBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6
{
  void *v11;
  uint64_t v12;
  unsigned int v13;

  v11 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(a4, "count"));
  if (objc_msgSend(a4, "count"))
  {
    v12 = 0;
    v13 = 1;
    do
    {
      objc_msgSend(v11, "addObject:", objc_msgSend((id)objc_msgSend(a4, "objectAtIndexedSubscript:", v12), "baseObject"));
      v12 = v13;
    }
    while (objc_msgSend(a4, "count") > (unint64_t)v13++);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "deserializeAccelerationStructure:primitiveAccelerationStructures:fromBuffer:serializedBufferOffset:", objc_msgSend(a3, "baseObject"), v11, objc_msgSend(a5, "baseObject"), a6);
}

- (void)writeGeometrySizeOfAccelerationStructure:(id)a3 toBuffer:(id)a4 sizeBufferOffset:(unint64_t)a5
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "writeGeometrySizeOfAccelerationStructure:toBuffer:sizeBufferOffset:", objc_msgSend(a3, "baseObject"), objc_msgSend(a4, "baseObject"), a5);
}

- (void)writeGeometryOfAccelerationStructure:(id)a3 toBuffer:(id)a4 geometryBufferOffset:(unint64_t)a5
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "writeGeometryOfAccelerationStructure:toBuffer:geometryBufferOffset:", objc_msgSend(a3, "baseObject"), objc_msgSend(a4, "baseObject"), a5);
}

- (BOOL)writeGenericBVHStructureSizesOfAccelerationStructure:(id)a3 into:(id)a4
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "writeGenericBVHStructureSizesOfAccelerationStructure:into:", objc_msgSend(a3, "baseObject"), a4);
}

- (BOOL)writeGenericBVHStructureOfAccelerationStructure:(id)a3 into:(id)a4
{
  void *v7;

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDD5E0]), "initWithVersion:", objc_msgSend(a4, "version"));
  objc_msgSend(v7, "setHeaderBuffer:", objc_msgSend((id)objc_msgSend(a4, "headerBuffer"), "baseObject"));
  objc_msgSend(v7, "setHeaderBufferOffset:", objc_msgSend(a4, "headerBufferOffset"));
  objc_msgSend(v7, "setInnerNodeBuffer:", objc_msgSend((id)objc_msgSend(a4, "innerNodeBuffer"), "baseObject"));
  objc_msgSend(v7, "setInnerNodeBufferOffset:", objc_msgSend(a4, "innerNodeBufferOffset"));
  objc_msgSend(v7, "setLeafNodeBuffer:", objc_msgSend((id)objc_msgSend(a4, "leafNodeBuffer"), "baseObject"));
  objc_msgSend(v7, "setLeafNodeBufferOffset:", objc_msgSend(a4, "leafNodeBufferOffset"));
  objc_msgSend(v7, "setPrimitiveBuffer:", objc_msgSend((id)objc_msgSend(a4, "primitiveBuffer"), "baseObject"));
  objc_msgSend(v7, "setPrimitiveBufferOffset:", objc_msgSend(a4, "primitiveBufferOffset"));
  objc_msgSend(v7, "setGeometryBuffer:", objc_msgSend((id)objc_msgSend(a4, "geometryBuffer"), "baseObject"));
  objc_msgSend(v7, "setGeometryBufferOffset:", objc_msgSend(a4, "geometryBufferOffset"));
  objc_msgSend(v7, "setInstanceTransformBuffer:", objc_msgSend((id)objc_msgSend(a4, "instanceTransformBuffer"), "baseObject"));
  objc_msgSend(v7, "setInstanceTransformBufferOffset:", objc_msgSend(a4, "instanceTransformBufferOffset"));
  objc_msgSend(v7, "setPerPrimitiveDataBuffer:", objc_msgSend((id)objc_msgSend(a4, "perPrimitiveDataBuffer"), "baseObject"));
  objc_msgSend(v7, "setPerPrimitiveDataBufferOffset:", objc_msgSend(a4, "perPrimitiveDataBufferOffset"));
  objc_msgSend(v7, "setControlPointBuffer:", objc_msgSend((id)objc_msgSend(a4, "controlPointBuffer"), "baseObject"));
  objc_msgSend(v7, "setControlPointBufferOffset:", objc_msgSend(a4, "controlPointBufferOffset"));
  LOBYTE(a3) = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "writeGenericBVHStructureOfAccelerationStructure:into:", objc_msgSend(a3, "baseObject"), v7);

  return (char)a3;
}

- (void)writeGenericBVHStructureSizesOfAccelerationStructure:(id)a3 toBuffer:(id)a4 sizesBufferOffset:(unint64_t)a5
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "writeGenericBVHStructureSizesOfAccelerationStructure:toBuffer:sizesBufferOffset:", objc_msgSend(a3, "baseObject"), objc_msgSend(a4, "baseObject"), a5);
}

- (void)writeGenericBVHStructureOfAccelerationStructure:(id)a3 headerBuffer:(id)a4 headerBufferOffset:(unint64_t)a5 innerNodeBuffer:(id)a6 innerNodeBufferOffset:(unint64_t)a7 leafNodeBuffer:(id)a8 leafNodeBufferOffset:(unint64_t)a9 primitiveBuffer:(id)a10 primitiveBufferOffset:(unint64_t)a11 geometryBuffer:(id)a12 geometryOffset:(unint64_t)a13 instanceTransformBuffer:(id)a14 instanceTransformOffset:(unint64_t)a15 controlPointBuffer:(id)a16 controlPointBufferOffset:(unint64_t)a17
{
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v21 = -[MTLToolsObject baseObject](self, "baseObject");
  v22 = objc_msgSend(a3, "baseObject");
  v23 = objc_msgSend(a4, "baseObject");
  v24 = objc_msgSend(a6, "baseObject");
  v25 = objc_msgSend(a8, "baseObject");
  objc_msgSend(a10, "baseObject");
  objc_msgSend(a12, "baseObject");
  objc_msgSend(a14, "baseObject");
  objc_msgSend(a16, "baseObject");
  objc_msgSend(v21, "writeGenericBVHStructureOfAccelerationStructure:headerBuffer:headerBufferOffset:innerNodeBuffer:innerNodeBufferOffset:leafNodeBuffer:leafNodeBufferOffset:primitiveBuffer:primitiveBufferOffset:geometryBuffer:geometryOffset:instanceTransformBuffer:instanceTransformOffset:controlPointBuffer:controlPointBufferOffset:", v22, v23, a5, v24, a7, v25);
}

- (void)writeAccelerationStructureSerializationData:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "writeAccelerationStructureSerializationData:toBuffer:offset:", objc_msgSend(a3, "baseObject"), objc_msgSend(a4, "baseObject"), a5);
}

- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "sampleCountersInBuffer:atSampleIndex:withBarrier:", objc_msgSend(a3, "baseObject"), a4, a5);
}

- (void)updateFence:(id)a3
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "updateFence:", objc_msgSend(a3, "baseObject"));
}

- (void)waitForFence:(id)a3
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "waitForFence:", objc_msgSend(a3, "baseObject"));
}

- (void)useResource:(id)a3 usage:(unint64_t)a4
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "useResource:usage:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5
{
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *__p[3];

  std::vector<objc_object  {objcproto11MTLResource}*>::vector(__p, a4);
  if (a4)
  {
    v9 = 0;
    do
    {
      -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", a3[v9]);
      v10 = objc_msgSend((id)a3[v9], "baseObject");
      *((_QWORD *)__p[0] + v9++) = v10;
    }
    while (a4 != v9);
  }
  v11 = -[MTLToolsObject baseObject](self, "baseObject");
  objc_msgSend(v11, "useResources:count:usage:", __p[0], a4, a5);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)useHeap:(id)a3
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "useHeap:", objc_msgSend(a3, "baseObject"));
}

- (void)useHeaps:(const void *)a3 count:(unint64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *__p[3];

  std::vector<objc_object  {objcproto7MTLHeap}*>::vector(__p, a4);
  if (a4)
  {
    v7 = 0;
    do
    {
      -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", a3[v7]);
      v8 = objc_msgSend((id)a3[v7], "baseObject");
      *((_QWORD *)__p[0] + v7++) = v8;
    }
    while (a4 != v7);
  }
  v9 = -[MTLToolsObject baseObject](self, "baseObject");
  objc_msgSend(v9, "useHeaps:count:", __p[0], a4);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (id)endEncodingAndRetrieveProgramAddressTable
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "endEncodingAndRetrieveProgramAddressTable");
}

- (void)writeAccelerationStructureTraversalDepth:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "writeAccelerationStructureTraversalDepth:toBuffer:offset:", objc_msgSend(a3, "baseObject"), objc_msgSend(a4, "baseObject"), a5);
}

@end
