@implementation MTLDebugAccelerationStructureCommandEncoder

- (MTLDebugAccelerationStructureCommandEncoder)initWithAccelerationStructureCommandEncoder:(id)a3 parent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTLDebugAccelerationStructureCommandEncoder;
  return -[MTLToolsCommandEncoder initWithBaseObject:parent:](&v5, sel_initWithBaseObject_parent_, a3, a4);
}

- (BOOL)checkEncoderState
{
  return !self->hasEndedEncoding;
}

- (void)buildAccelerationStructure:(id)a3 descriptor:(id)a4 scratchBuffer:(id)a5 scratchBufferOffset:(unint64_t)a6
{
  MTLDevice *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;

  if (!-[MTLDebugAccelerationStructureCommandEncoder checkEncoderState](self, "checkEncoderState"))
    MTLReportFailure();
  checkAccelerationStructureDescriptorWithRefitOptions(self->super.super.super._device, a4, 1, 3);
  checkAccelerationStructure((uint64_t)self->super.super.super._device, a3, 0, (uint64_t)CFSTR("Acceleration structure"));
  checkBuffer((unint64_t)self->super.super.super._device, a5, a6, 0, (uint64_t)CFSTR("Scratch buffer"));
  v11 = -[MTLToolsObject device](self, "device");
  if (v11)
    -[MTLDevice accelerationStructureSizesWithDescriptor:](v11, "accelerationStructureSizesWithDescriptor:", a4);
  objc_msgSend(a3, "size");
  if (a6 > objc_msgSend(a5, "length", v12, v14))
  {
    v15 = a6;
    v16 = 0;
    v13 = objc_msgSend(a5, "length");
    MTLReportFailure();
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", v13, v15, v16), "buildAccelerationStructure:descriptor:scratchBuffer:scratchBufferOffset:", objc_msgSend(a3, "baseObject"), unwrapAccelerationStructureDescriptor(a4), objc_msgSend(a5, "baseObject"), a6);
}

- (void)validateRefit:(id)a3 descriptor:(id)a4 destination:(id)a5 scratchBuffer:(id)a6 scratchBufferOffset:(unint64_t)a7 options:(unint64_t)a8
{
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  MTLAttributeFormat v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  MTLToolsDevice *device;
  void *v24;
  unint64_t v25;
  MTLDevice *v26;
  unint64_t v27;
  uint64_t v28;
  id v29;

  if (!-[MTLDebugAccelerationStructureCommandEncoder checkEncoderState](self, "checkEncoderState"))
  {
    MTLReportFailure();
    if (a8)
      goto LABEL_3;
LABEL_27:
    MTLReportFailure();
    goto LABEL_3;
  }
  if (!a8)
    goto LABEL_27;
LABEL_3:
  checkAccelerationStructureDescriptorWithRefitOptions(self->super.super.super._device, a4, 1, a8);
  checkAccelerationStructure((uint64_t)self->super.super.super._device, a3, 0, (uint64_t)CFSTR("Source acceleration structure"));
  checkAccelerationStructure((uint64_t)self->super.super.super._device, a5, 1, (uint64_t)CFSTR("Destination acceleration structure"));
  v29 = a6;
  checkBuffer((unint64_t)self->super.super.super._device, a6, a7, 1, (uint64_t)CFSTR("Scratch buffer"));
  v15 = (void *)objc_opt_class();
  if (objc_msgSend(v15, "isSubclassOfClass:", objc_opt_class())
    && objc_msgSend((id)objc_msgSend(a4, "geometryDescriptors"), "count"))
  {
    v16 = 0;
    do
    {
      v17 = (void *)objc_msgSend((id)objc_msgSend(a4, "geometryDescriptors"), "objectAtIndexedSubscript:", v16);
      v18 = (void *)objc_opt_class();
      if (objc_msgSend(v18, "isSubclassOfClass:", objc_opt_class()))
      {
        v19 = objc_msgSend(v17, "vertexFormat");
        v20 = objc_msgSend(v17, "vertexStride");
        if ((unint64_t)MTLAttributeFormatComponentCount(v19) <= 1)
          MTLReportFailure();
        v21 = MTLAttributeFormatSize(v19);
        if (v20 && v21 > v20)
        {
          v27 = v20;
          v28 = v21;
          MTLReportFailure();
        }
        v22 = MTLAttributeFormatAlignment(v19);
        if (v20 % v22)
        {
          v27 = v20;
          v28 = v22;
          MTLReportFailure();
        }
        device = self->super.super.super._device;
        v24 = (void *)objc_msgSend(v17, "transformationMatrixBuffer", v27, v28);
        v25 = objc_msgSend(v17, "transformationMatrixBufferOffset");
        checkBuffer((unint64_t)device, v24, v25, 1, (uint64_t)CFSTR("Transformation buffer"));
        if (v24)
        {
          if (v25 + 48 > objc_msgSend(v24, "length"))
          {
            v27 = v25;
            v28 = objc_msgSend(v24, "length");
            MTLReportFailure();
          }
          if ((v25 & 3) != 0)
          {
            v27 = v25;
            MTLReportFailure();
          }
        }
      }
      ++v16;
    }
    while (v16 < objc_msgSend((id)objc_msgSend(a4, "geometryDescriptors", v27), "count"));
  }
  if (v29)
  {
    v26 = -[MTLToolsObject device](self, "device");
    if (v26)
      -[MTLDevice accelerationStructureSizesWithDescriptor:](v26, "accelerationStructureSizesWithDescriptor:", a4);
    if (a7 > objc_msgSend(v29, "length"))
    {
      objc_msgSend(v29, "length");
      MTLReportFailure();
    }
  }
}

- (void)refitAccelerationStructure:(id)a3 descriptor:(id)a4 destination:(id)a5 scratchBuffer:(id)a6 scratchBufferOffset:(unint64_t)a7
{
  -[MTLDebugAccelerationStructureCommandEncoder validateRefit:descriptor:destination:scratchBuffer:scratchBufferOffset:options:](self, "validateRefit:descriptor:destination:scratchBuffer:scratchBufferOffset:options:", a3, a4, a5, a6, a7, 3);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "refitAccelerationStructure:descriptor:destination:scratchBuffer:scratchBufferOffset:", objc_msgSend(a3, "baseObject"), unwrapAccelerationStructureDescriptor(a4), objc_msgSend(a5, "baseObject"), objc_msgSend(a6, "baseObject"), a7);
}

- (void)refitAccelerationStructure:(id)a3 descriptor:(id)a4 destination:(id)a5 scratchBuffer:(id)a6 scratchBufferOffset:(unint64_t)a7 options:(unint64_t)a8
{
  -[MTLDebugAccelerationStructureCommandEncoder validateRefit:descriptor:destination:scratchBuffer:scratchBufferOffset:options:](self, "validateRefit:descriptor:destination:scratchBuffer:scratchBufferOffset:options:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "refitAccelerationStructure:descriptor:destination:scratchBuffer:scratchBufferOffset:options:", objc_msgSend(a3, "baseObject"), unwrapAccelerationStructureDescriptor(a4), objc_msgSend(a5, "baseObject"), objc_msgSend(a6, "baseObject"), a7, a8);
}

- (void)copyAccelerationStructure:(id)a3 toAccelerationStructure:(id)a4
{
  if (!-[MTLDebugAccelerationStructureCommandEncoder checkEncoderState](self, "checkEncoderState"))
    MTLReportFailure();
  checkAccelerationStructure((uint64_t)self->super.super.super._device, a3, 0, (uint64_t)CFSTR("Source acceleration structure"));
  checkAccelerationStructure((uint64_t)self->super.super.super._device, a4, 0, (uint64_t)CFSTR("Destination acceleration structure"));
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "copyAccelerationStructure:toAccelerationStructure:", objc_msgSend(a3, "baseObject"), objc_msgSend(a4, "baseObject"));
}

- (void)writeCompactedAccelerationStructureSize:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5
{
  unint64_t v9;
  uint64_t v10;

  if (!-[MTLDebugAccelerationStructureCommandEncoder checkEncoderState](self, "checkEncoderState"))
    MTLReportFailure();
  checkAccelerationStructure((uint64_t)self->super.super.super._device, a3, 0, (uint64_t)CFSTR("Acceleration structure"));
  checkBuffer((unint64_t)self->super.super.super._device, a4, a5, 0, (uint64_t)CFSTR("Size buffer"));
  if (a5 + 4 > objc_msgSend(a4, "length"))
  {
    v9 = a5;
    v10 = objc_msgSend(a4, "length");
    MTLReportFailure();
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", v9, v10), "writeCompactedAccelerationStructureSize:toBuffer:offset:", objc_msgSend(a3, "baseObject"), objc_msgSend(a4, "baseObject"), a5);
}

- (void)writeCompactedAccelerationStructureSize:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5 sizeDataType:(unint64_t)a6
{
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;

  if (!-[MTLDebugAccelerationStructureCommandEncoder checkEncoderState](self, "checkEncoderState"))
    MTLReportFailure();
  if (a6 != 33 && a6 != 85)
    MTLReportFailure();
  checkAccelerationStructure((uint64_t)self->super.super.super._device, a3, 0, (uint64_t)CFSTR("Acceleration structure"));
  checkBuffer((unint64_t)self->super.super.super._device, a4, a5, 0, (uint64_t)CFSTR("Size buffer"));
  v11 = 8;
  if (a6 == 33)
    v11 = 4;
  if (v11 + a5 > objc_msgSend(a4, "length"))
  {
    v12 = a5;
    v13 = objc_msgSend(a4, "length");
    MTLReportFailure();
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", v12, v13), "writeCompactedAccelerationStructureSize:toBuffer:offset:sizeDataType:", objc_msgSend(a3, "baseObject"), objc_msgSend(a4, "baseObject"), a5, a6);
}

- (void)copyAndCompactAccelerationStructure:(id)a3 toAccelerationStructure:(id)a4
{
  if (!-[MTLDebugAccelerationStructureCommandEncoder checkEncoderState](self, "checkEncoderState"))
    MTLReportFailure();
  checkAccelerationStructure((uint64_t)self->super.super.super._device, a3, 0, (uint64_t)CFSTR("Source acceleration structure"));
  checkAccelerationStructure((uint64_t)self->super.super.super._device, a4, 0, (uint64_t)CFSTR("Destination acceleration structure"));
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "copyAndCompactAccelerationStructure:toAccelerationStructure:", objc_msgSend(a3, "baseObject"), objc_msgSend(a4, "baseObject"));
}

- (void)writeSerializedAccelerationStructureSize:(id)a3 toBuffer:(id)a4 sizeBufferOffset:(unint64_t)a5
{
  if (!-[MTLDebugAccelerationStructureCommandEncoder checkEncoderState](self, "checkEncoderState"))
    MTLReportFailure();
  checkAccelerationStructure((uint64_t)self->super.super.super._device, a3, 0, (uint64_t)CFSTR("Acceleration structure"));
  checkBuffer((unint64_t)self->super.super.super._device, a4, a5, 0, (uint64_t)CFSTR("Size buffer"));
  if ((unint64_t)objc_msgSend(a4, "length") <= 7)
    MTLReportFailure();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "writeSerializedAccelerationStructureSize:toBuffer:sizeBufferOffset:", objc_msgSend(a3, "baseObject"), objc_msgSend(a4, "baseObject"), a5);
}

- (void)writeDeserializedAccelerationStructureSize:(id)a3 serializedOffset:(unint64_t)a4 toBuffer:(id)a5 sizeBufferOffset:(unint64_t)a6
{
  if (!-[MTLDebugAccelerationStructureCommandEncoder checkEncoderState](self, "checkEncoderState"))
    MTLReportFailure();
  checkBuffer((unint64_t)self->super.super.super._device, a3, a4, 0, (uint64_t)CFSTR("Serialized acceleration structure buffer"));
  checkBuffer((unint64_t)self->super.super.super._device, a5, a6, 0, (uint64_t)CFSTR("Size buffer"));
  if ((unint64_t)objc_msgSend(a5, "length") <= 7)
    MTLReportFailure();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "writeDeserializedAccelerationStructureSize:serializedOffset:toBuffer:sizeBufferOffset:", objc_msgSend(a3, "baseObject"), a4, objc_msgSend(a5, "baseObject"), a6);
}

- (void)writeDeserializedPrimitiveAccelerationStructureSizes:(id)a3 serializedOffset:(unint64_t)a4 toBuffer:(id)a5 sizesBufferOffset:(unint64_t)a6
{
  if (!-[MTLDebugAccelerationStructureCommandEncoder checkEncoderState](self, "checkEncoderState"))
    MTLReportFailure();
  checkBuffer((unint64_t)self->super.super.super._device, a3, a4, 0, (uint64_t)CFSTR("Serialized acceleration structure buffer"));
  checkBuffer((unint64_t)self->super.super.super._device, a5, a6, 0, (uint64_t)CFSTR("Size buffer"));
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "writeDeserializedPrimitiveAccelerationStructureSizes:serializedOffset:toBuffer:sizesBufferOffset:", objc_msgSend(a3, "baseObject"), a4, objc_msgSend(a5, "baseObject"), a6);
}

- (void)serializePrimitiveAccelerationStructure:(id)a3 toBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5
{
  _MTLMessageContextBegin_();
  if (!-[MTLDebugAccelerationStructureCommandEncoder checkEncoderState](self, "checkEncoderState", 0, 0, 0, 0, 0, 0, 0))_MTLMessageContextPush_();
  checkAccelerationStructure((uint64_t)self->super.super.super._device, a3, 0, (uint64_t)CFSTR("Acceleration structure"));
  checkBuffer((unint64_t)self->super.super.super._device, a4, a5, 0, (uint64_t)CFSTR("Buffer"));
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "serializePrimitiveAccelerationStructure:toBuffer:serializedBufferOffset:", objc_msgSend(a3, "baseObject"), objc_msgSend(a4, "baseObject"), a5);
}

- (void)serializeInstanceAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 toBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6
{
  void *v11;
  uint64_t v12;
  unsigned int v13;
  unint64_t v15;

  _MTLMessageContextBegin_();
  if (!-[MTLDebugAccelerationStructureCommandEncoder checkEncoderState](self, "checkEncoderState"))
    _MTLMessageContextPush_();
  checkAccelerationStructure((uint64_t)self->super.super.super._device, a3, 0, (uint64_t)CFSTR("Acceleration structure"));
  v15 = a6;
  checkBuffer((unint64_t)self->super.super.super._device, a5, a6, 0, (uint64_t)CFSTR("Buffer"));
  _MTLMessageContextEnd();
  v11 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(a4, "count"));
  if (objc_msgSend(a4, "count"))
  {
    v12 = 0;
    v13 = 1;
    do
    {
      checkAccelerationStructure((uint64_t)self->super.super.super._device, (void *)objc_msgSend(a4, "objectAtIndexedSubscript:", v12), 0, (uint64_t)CFSTR("Primitive acceleration structure"));
      objc_msgSend(v11, "addObject:", objc_msgSend((id)objc_msgSend(a4, "objectAtIndexedSubscript:", v12), "baseObject"));
      v12 = v13;
    }
    while (objc_msgSend(a4, "count") > (unint64_t)v13++);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "serializeInstanceAccelerationStructure:primitiveAccelerationStructures:toBuffer:serializedBufferOffset:", objc_msgSend(a3, "baseObject"), v11, objc_msgSend(a5, "baseObject"), v15);
}

- (void)deserializePrimitiveAccelerationStructure:(id)a3 fromBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5
{
  _MTLMessageContextBegin_();
  if (!-[MTLDebugAccelerationStructureCommandEncoder checkEncoderState](self, "checkEncoderState", 0, 0, 0, 0, 0, 0, 0))_MTLMessageContextPush_();
  checkAccelerationStructure((uint64_t)self->super.super.super._device, a3, 0, (uint64_t)CFSTR("Acceleration structure"));
  checkBuffer((unint64_t)self->super.super.super._device, a4, a5, 0, (uint64_t)CFSTR("Buffer"));
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "deserializePrimitiveAccelerationStructure:fromBuffer:serializedBufferOffset:", objc_msgSend(a3, "baseObject"), objc_msgSend(a4, "baseObject"), a5);
}

- (void)deserializeInstanceAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 fromBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6
{
  void *v10;
  uint64_t v11;
  unsigned int v12;

  _MTLMessageContextBegin_();
  if (!-[MTLDebugAccelerationStructureCommandEncoder checkEncoderState](self, "checkEncoderState"))
    _MTLMessageContextPush_();
  checkAccelerationStructure((uint64_t)self->super.super.super._device, a3, 0, (uint64_t)CFSTR("Acceleration structure"));
  v10 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(a4, "count"));
  if (objc_msgSend(a4, "count"))
  {
    v11 = 0;
    v12 = 1;
    do
    {
      checkAccelerationStructure((uint64_t)self->super.super.super._device, (void *)objc_msgSend(a4, "objectAtIndexedSubscript:", v11), 0, (uint64_t)CFSTR("Primitive acceleration structure"));
      objc_msgSend(v10, "addObject:", objc_msgSend((id)objc_msgSend(a4, "objectAtIndexedSubscript:", v11), "baseObject"));
      v11 = v12;
    }
    while (objc_msgSend(a4, "count") > (unint64_t)v12++);
  }
  checkBuffer((unint64_t)self->super.super.super._device, a5, a6, 0, (uint64_t)CFSTR("Buffer"));
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "deserializeInstanceAccelerationStructure:primitiveAccelerationStructures:fromBuffer:serializedBufferOffset:", objc_msgSend(a3, "baseObject"), v10, objc_msgSend(a5, "baseObject"), a6);
}

- (void)deserializePrimitiveAccelerationStructure:(id)a3 fromBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5 withDescriptor:(id)a6
{
  _MTLMessageContextBegin_();
  if (!-[MTLDebugAccelerationStructureCommandEncoder checkEncoderState](self, "checkEncoderState", 0, 0, 0, 0, 0, 0, 0))_MTLMessageContextPush_();
  checkAccelerationStructure((uint64_t)self->super.super.super._device, a3, 0, (uint64_t)CFSTR("Acceleration structure"));
  checkBuffer((unint64_t)self->super.super.super._device, a4, a5, 0, (uint64_t)CFSTR("Buffer"));
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "deserializePrimitiveAccelerationStructure:fromBuffer:serializedBufferOffset:withDescriptor:", objc_msgSend(a3, "baseObject"), objc_msgSend(a4, "baseObject"), a5, unwrapAccelerationStructureDescriptor(a6));
}

- (void)deserializeInstanceAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 fromBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6 withDescriptor:(id)a7
{
  void *v11;
  uint64_t v12;
  unsigned int v13;
  id v15;

  v15 = a7;
  _MTLMessageContextBegin_();
  if (!-[MTLDebugAccelerationStructureCommandEncoder checkEncoderState](self, "checkEncoderState"))
    _MTLMessageContextPush_();
  checkAccelerationStructure((uint64_t)self->super.super.super._device, a3, 0, (uint64_t)CFSTR("Acceleration structure"));
  v11 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(a4, "count"));
  if (objc_msgSend(a4, "count"))
  {
    v12 = 0;
    v13 = 1;
    do
    {
      checkAccelerationStructure((uint64_t)self->super.super.super._device, (void *)objc_msgSend(a4, "objectAtIndexedSubscript:", v12, v15), 0, (uint64_t)CFSTR("Primitive acceleration structure"));
      objc_msgSend(v11, "addObject:", objc_msgSend((id)objc_msgSend(a4, "objectAtIndexedSubscript:", v12), "baseObject"));
      v12 = v13;
    }
    while (objc_msgSend(a4, "count") > (unint64_t)v13++);
  }
  checkBuffer((unint64_t)self->super.super.super._device, a5, a6, 0, (uint64_t)CFSTR("Buffer"));
  _MTLMessageContextEnd();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "deserializeInstanceAccelerationStructure:primitiveAccelerationStructures:fromBuffer:serializedBufferOffset:withDescriptor:", objc_msgSend(a3, "baseObject"), v11, objc_msgSend(a5, "baseObject"), a6, unwrapAccelerationStructureDescriptor(v15));
}

- (void)serializeAccelerationStructure:(id)a3 toBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5
{
  if (!-[MTLDebugAccelerationStructureCommandEncoder checkEncoderState](self, "checkEncoderState"))
    MTLReportFailure();
  checkAccelerationStructure((uint64_t)self->super.super.super._device, a3, 0, (uint64_t)CFSTR("Acceleration structure"));
  checkBuffer((unint64_t)self->super.super.super._device, a4, a5, 0, (uint64_t)CFSTR("Buffer"));
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "serializeAccelerationStructure:toBuffer:serializedBufferOffset:", objc_msgSend(a3, "baseObject"), objc_msgSend(a4, "baseObject"), a5);
}

- (void)deserializeAccelerationStructure:(id)a3 fromBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5
{
  if (!-[MTLDebugAccelerationStructureCommandEncoder checkEncoderState](self, "checkEncoderState"))
    MTLReportFailure();
  checkAccelerationStructure((uint64_t)self->super.super.super._device, a3, 0, (uint64_t)CFSTR("Acceleration structure"));
  checkBuffer((unint64_t)self->super.super.super._device, a4, a5, 0, (uint64_t)CFSTR("Buffer"));
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "deserializeAccelerationStructure:fromBuffer:serializedBufferOffset:", objc_msgSend(a3, "baseObject"), objc_msgSend(a4, "baseObject"), a5);
}

- (void)deserializeAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 fromBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6
{
  void *v10;
  uint64_t v11;
  unsigned int v12;

  if (!-[MTLDebugAccelerationStructureCommandEncoder checkEncoderState](self, "checkEncoderState"))
    MTLReportFailure();
  checkAccelerationStructure((uint64_t)self->super.super.super._device, a3, 0, (uint64_t)CFSTR("Acceleration structure"));
  v10 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(a4, "count"));
  if (objc_msgSend(a4, "count"))
  {
    v11 = 0;
    v12 = 1;
    do
    {
      checkAccelerationStructure((uint64_t)self->super.super.super._device, (void *)objc_msgSend(a4, "objectAtIndexedSubscript:", v11), 0, (uint64_t)CFSTR("Primitive acceleration structure"));
      objc_msgSend(v10, "addObject:", objc_msgSend((id)objc_msgSend(a4, "objectAtIndexedSubscript:", v11), "baseObject"));
      v11 = v12;
    }
    while (objc_msgSend(a4, "count") > (unint64_t)v12++);
  }
  checkBuffer((unint64_t)self->super.super.super._device, a5, a6, 0, (uint64_t)CFSTR("Buffer"));
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "deserializeAccelerationStructure:primitiveAccelerationStructures:fromBuffer:serializedBufferOffset:", objc_msgSend(a3, "baseObject"), v10, objc_msgSend(a5, "baseObject"), a6);
}

- (void)writeGeometrySizeOfAccelerationStructure:(id)a3 toBuffer:(id)a4 sizeBufferOffset:(unint64_t)a5
{
  if (!-[MTLDebugAccelerationStructureCommandEncoder checkEncoderState](self, "checkEncoderState"))
    MTLReportFailure();
  checkAccelerationStructure((uint64_t)self->super.super.super._device, a3, 0, (uint64_t)CFSTR("Acceleration structure"));
  checkBuffer((unint64_t)self->super.super.super._device, a4, a5, 0, (uint64_t)CFSTR("Size buffer"));
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "writeGeometrySizeOfAccelerationStructure:toBuffer:sizeBufferOffset:", objc_msgSend(a3, "baseObject"), objc_msgSend(a4, "baseObject"), a5);
}

- (void)writeGeometryOfAccelerationStructure:(id)a3 toBuffer:(id)a4 geometryBufferOffset:(unint64_t)a5
{
  if (!-[MTLDebugAccelerationStructureCommandEncoder checkEncoderState](self, "checkEncoderState"))
    MTLReportFailure();
  checkAccelerationStructure((uint64_t)self->super.super.super._device, a3, 0, (uint64_t)CFSTR("Acceleration structure"));
  checkBuffer((unint64_t)self->super.super.super._device, a4, a5, 0, (uint64_t)CFSTR("Geometry buffer"));
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "writeGeometryOfAccelerationStructure:toBuffer:geometryBufferOffset:", objc_msgSend(a3, "baseObject"), objc_msgSend(a4, "baseObject"), a5);
}

- (BOOL)writeGenericBVHStructureSizesOfAccelerationStructure:(id)a3 into:(id)a4
{
  if (!-[MTLDebugAccelerationStructureCommandEncoder checkEncoderState](self, "checkEncoderState"))
    MTLReportFailure();
  checkAccelerationStructure((uint64_t)self->super.super.super._device, a3, 0, (uint64_t)CFSTR("Acceleration structure"));
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "writeGenericBVHStructureSizesOfAccelerationStructure:into:", objc_msgSend(a3, "baseObject"), a4);
}

- (BOOL)writeGenericBVHStructureOfAccelerationStructure:(id)a3 into:(id)a4
{
  objc_super v8;

  if (!-[MTLDebugAccelerationStructureCommandEncoder checkEncoderState](self, "checkEncoderState"))
    MTLReportFailure();
  checkAccelerationStructure((uint64_t)self->super.super.super._device, a3, 0, (uint64_t)CFSTR("Acceleration structure"));
  checkBuffer((unint64_t)self->super.super.super._device, (void *)objc_msgSend(a4, "headerBuffer"), objc_msgSend(a4, "headerBufferOffset"), 0, (uint64_t)CFSTR("Header buffer"));
  checkBuffer((unint64_t)self->super.super.super._device, (void *)objc_msgSend(a4, "innerNodeBuffer"), objc_msgSend(a4, "innerNodeBufferOffset"), 1, (uint64_t)CFSTR("Inner node buffer"));
  checkBuffer((unint64_t)self->super.super.super._device, (void *)objc_msgSend(a4, "leafNodeBuffer"), objc_msgSend(a4, "leafNodeBufferOffset"), 1, (uint64_t)CFSTR("Leaf node buffer"));
  checkBuffer((unint64_t)self->super.super.super._device, (void *)objc_msgSend(a4, "primitiveBuffer"), objc_msgSend(a4, "primitiveBufferOffset"), 1, (uint64_t)CFSTR("Primitive buffer"));
  checkBuffer((unint64_t)self->super.super.super._device, (void *)objc_msgSend(a4, "geometryBuffer"), objc_msgSend(a4, "geometryBufferOffset"), 1, (uint64_t)CFSTR("Geometry buffer"));
  checkBuffer((unint64_t)self->super.super.super._device, (void *)objc_msgSend(a4, "instanceTransformBuffer"), objc_msgSend(a4, "instanceTransformBufferOffset"), 1, (uint64_t)CFSTR("Instance transform buffer"));
  checkBuffer((unint64_t)self->super.super.super._device, (void *)objc_msgSend(a4, "controlPointBuffer"), objc_msgSend(a4, "controlPointBufferOffset"), 1, (uint64_t)CFSTR("Control Point buffer"));
  v8.receiver = self;
  v8.super_class = (Class)MTLDebugAccelerationStructureCommandEncoder;
  return -[MTLToolsAccelerationStructureCommandEncoder writeGenericBVHStructureOfAccelerationStructure:into:](&v8, sel_writeGenericBVHStructureOfAccelerationStructure_into_, a3, a4);
}

- (void)writeGenericBVHStructureSizesOfAccelerationStructure:(id)a3 toBuffer:(id)a4 sizesBufferOffset:(unint64_t)a5
{
  if (!-[MTLDebugAccelerationStructureCommandEncoder checkEncoderState](self, "checkEncoderState"))
    MTLReportFailure();
  checkAccelerationStructure((uint64_t)self->super.super.super._device, a3, 0, (uint64_t)CFSTR("Acceleration structure"));
  checkBuffer((unint64_t)self->super.super.super._device, a4, a5, 0, (uint64_t)CFSTR("Sizes buffer"));
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "writeGenericBVHStructureSizesOfAccelerationStructure:toBuffer:sizesBufferOffset:", objc_msgSend(a3, "baseObject"), objc_msgSend(a4, "baseObject"), a5);
}

- (void)writeGenericBVHStructureOfAccelerationStructure:(id)a3 headerBuffer:(id)a4 headerBufferOffset:(unint64_t)a5 innerNodeBuffer:(id)a6 innerNodeBufferOffset:(unint64_t)a7 leafNodeBuffer:(id)a8 leafNodeBufferOffset:(unint64_t)a9 primitiveBuffer:(id)a10 primitiveBufferOffset:(unint64_t)a11 geometryBuffer:(id)a12 geometryOffset:(unint64_t)a13 instanceTransformBuffer:(id)a14 instanceTransformOffset:(unint64_t)a15 controlPointBuffer:(id)a16 controlPointBufferOffset:(unint64_t)a17
{
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;

  if (!-[MTLDebugAccelerationStructureCommandEncoder checkEncoderState](self, "checkEncoderState"))
    MTLReportFailure();
  checkAccelerationStructure((uint64_t)self->super.super.super._device, a3, 0, (uint64_t)CFSTR("Acceleration structure"));
  checkBuffer((unint64_t)self->super.super.super._device, a4, a5, 0, (uint64_t)CFSTR("Header buffer"));
  checkBuffer((unint64_t)self->super.super.super._device, a6, a7, 0, (uint64_t)CFSTR("Inner node buffer"));
  checkBuffer((unint64_t)self->super.super.super._device, a8, a9, 0, (uint64_t)CFSTR("Leaf node buffer"));
  checkBuffer((unint64_t)self->super.super.super._device, a10, a11, 0, (uint64_t)CFSTR("Primitive buffer"));
  checkBuffer((unint64_t)self->super.super.super._device, a12, a13, 0, (uint64_t)CFSTR("Geometry buffer"));
  checkBuffer((unint64_t)self->super.super.super._device, a14, a15, 0, (uint64_t)CFSTR("Instance transform buffer"));
  checkBuffer((unint64_t)self->super.super.super._device, a16, a17, 0, (uint64_t)CFSTR("Control Point buffer"));
  v26 = -[MTLToolsObject baseObject](self, "baseObject");
  v27 = objc_msgSend(a3, "baseObject");
  v25 = objc_msgSend(a4, "baseObject");
  v23 = objc_msgSend(a6, "baseObject");
  v24 = objc_msgSend(a8, "baseObject");
  objc_msgSend(a10, "baseObject");
  objc_msgSend(a12, "baseObject");
  objc_msgSend(a14, "baseObject");
  objc_msgSend(a16, "baseObject");
  objc_msgSend(v26, "writeGenericBVHStructureOfAccelerationStructure:headerBuffer:headerBufferOffset:innerNodeBuffer:innerNodeBufferOffset:leafNodeBuffer:leafNodeBufferOffset:primitiveBuffer:primitiveBufferOffset:geometryBuffer:geometryOffset:instanceTransformBuffer:instanceTransformOffset:controlPointBuffer:controlPointBufferOffset:", v27, v25, a5, v23, a7, v24);
}

- (void)writeAccelerationStructureSerializationData:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5
{
  unint64_t v9;
  uint64_t v10;

  if (!-[MTLDebugAccelerationStructureCommandEncoder checkEncoderState](self, "checkEncoderState"))
    MTLReportFailure();
  checkAccelerationStructure((uint64_t)self->super.super.super._device, a3, 0, (uint64_t)CFSTR("Acceleration structure"));
  checkBuffer((unint64_t)self->super.super.super._device, a4, a5, 0, (uint64_t)CFSTR("Output buffer"));
  if (a5 + 24 > objc_msgSend(a4, "length"))
  {
    v9 = a5;
    v10 = objc_msgSend(a4, "length");
    MTLReportFailure();
  }
  if ((a5 & 3) != 0)
  {
    v9 = a5;
    MTLReportFailure();
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", v9, v10), "writeAccelerationStructureSerializationData:toBuffer:offset:", objc_msgSend(a3, "baseObject"), objc_msgSend(a4, "baseObject"), a5);
}

- (void)writeAccelerationStructureTraversalDepth:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5
{
  unint64_t v9;
  uint64_t v10;

  if (!-[MTLDebugAccelerationStructureCommandEncoder checkEncoderState](self, "checkEncoderState"))
    MTLReportFailure();
  checkAccelerationStructure((uint64_t)self->super.super.super._device, a3, 0, (uint64_t)CFSTR("Acceleration structure"));
  checkBuffer((unint64_t)self->super.super.super._device, a4, a5, 0, (uint64_t)CFSTR("Destination buffer"));
  if ((a5 & 3) != 0)
  {
    v9 = a5;
    v10 = 4;
    MTLReportFailure();
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", v9, v10), "writeAccelerationStructureTraversalDepth:toBuffer:offset:", objc_msgSend(a3, "baseObject"), objc_msgSend(a4, "baseObject"), a5);
}

@end
