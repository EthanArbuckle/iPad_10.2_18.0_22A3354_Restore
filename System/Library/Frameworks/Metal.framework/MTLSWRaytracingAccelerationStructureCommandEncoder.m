@implementation MTLSWRaytracingAccelerationStructureCommandEncoder

uint64_t __105___MTLSWRaytracingAccelerationStructureCommandEncoder_substreamSynchronizeAccelerationStructures_access___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  if (!*(_BYTE *)(v4 + 56))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "waitForVirtualSubstream:", v2);
}

uint64_t __77___MTLSWRaytracingAccelerationStructureCommandEncoder_initWithCommandBuffer___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t result;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "maximumComputeSubstreams");
  else
    v2 = 0;
  -[_MTLSWRaytracingAccelerationStructureCommandEncoder initWithCommandBuffer:]::numSubstreams = v2;
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "supportsFamily:", 1006);
  -[_MTLSWRaytracingAccelerationStructureCommandEncoder initWithCommandBuffer:]::useConcurrentDispatch = result;
  return result;
}

uint64_t __88___MTLSWRaytracingAccelerationStructureCommandEncoder_initWithCommandBuffer_descriptor___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t result;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "maximumComputeSubstreams");
  else
    v2 = 0;
  -[_MTLSWRaytracingAccelerationStructureCommandEncoder initWithCommandBuffer:descriptor:]::numSubstreams = v2;
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "supportsFamily:", 1006);
  -[_MTLSWRaytracingAccelerationStructureCommandEncoder initWithCommandBuffer:descriptor:]::useConcurrentDispatch = result;
  return result;
}

uint64_t __127___MTLSWRaytracingAccelerationStructureCommandEncoder_buildAccelerationStructure_descriptor_scratchBuffer_scratchBufferOffset___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  if (!*(_BYTE *)(v4 + 56))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "waitForVirtualSubstream:", v2);
}

uint64_t __127___MTLSWRaytracingAccelerationStructureCommandEncoder_buildAccelerationStructure_descriptor_scratchBuffer_scratchBufferOffset___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  if (!*(_BYTE *)(v4 + 56))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "waitForVirtualSubstream:", v2);
}

uint64_t __111___MTLSWRaytracingAccelerationStructureCommandEncoder_writeCompactedAccelerationStructureSize_toBuffer_offset___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  if (!*(_BYTE *)(v4 + 56))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "waitForVirtualSubstream:", v2);
}

uint64_t __111___MTLSWRaytracingAccelerationStructureCommandEncoder_writeCompactedAccelerationStructureSize_toBuffer_offset___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  if (!*(_BYTE *)(v4 + 56))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "waitForVirtualSubstream:", v2);
}

uint64_t __124___MTLSWRaytracingAccelerationStructureCommandEncoder_writeCompactedAccelerationStructureSize_toBuffer_offset_sizeDataType___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  if (!*(_BYTE *)(v4 + 56))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "waitForVirtualSubstream:", v2);
}

uint64_t __124___MTLSWRaytracingAccelerationStructureCommandEncoder_writeCompactedAccelerationStructureSize_toBuffer_offset_sizeDataType___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  if (!*(_BYTE *)(v4 + 56))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "waitForVirtualSubstream:", v2);
}

uint64_t __105___MTLSWRaytracingAccelerationStructureCommandEncoder_copyAccelerationStructure_toAccelerationStructure___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  if (!*(_BYTE *)(v4 + 56))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "waitForVirtualSubstream:", v2);
}

uint64_t __105___MTLSWRaytracingAccelerationStructureCommandEncoder_copyAccelerationStructure_toAccelerationStructure___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  if (!*(_BYTE *)(v4 + 56))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "waitForVirtualSubstream:", v2);
}

uint64_t __115___MTLSWRaytracingAccelerationStructureCommandEncoder_copyAndCompactAccelerationStructure_toAccelerationStructure___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  if (!*(_BYTE *)(v4 + 56))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "waitForVirtualSubstream:", v2);
}

uint64_t __115___MTLSWRaytracingAccelerationStructureCommandEncoder_copyAndCompactAccelerationStructure_toAccelerationStructure___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  if (!*(_BYTE *)(v4 + 56))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "waitForVirtualSubstream:", v2);
}

uint64_t __139___MTLSWRaytracingAccelerationStructureCommandEncoder_refitAccelerationStructure_descriptor_destination_scratchBuffer_scratchBufferOffset___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  if (!*(_BYTE *)(v4 + 56))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "waitForVirtualSubstream:", v2);
}

uint64_t __139___MTLSWRaytracingAccelerationStructureCommandEncoder_refitAccelerationStructure_descriptor_destination_scratchBuffer_scratchBufferOffset___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  if (!*(_BYTE *)(v4 + 56))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "waitForVirtualSubstream:", v2);
}

uint64_t __139___MTLSWRaytracingAccelerationStructureCommandEncoder_refitAccelerationStructure_descriptor_destination_scratchBuffer_scratchBufferOffset___block_invoke_3(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  if (!*(_BYTE *)(v4 + 56))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "waitForVirtualSubstream:", v2);
}

uint64_t __147___MTLSWRaytracingAccelerationStructureCommandEncoder_refitAccelerationStructure_descriptor_destination_scratchBuffer_scratchBufferOffset_options___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  if (!*(_BYTE *)(v4 + 56))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "waitForVirtualSubstream:", v2);
}

uint64_t __147___MTLSWRaytracingAccelerationStructureCommandEncoder_refitAccelerationStructure_descriptor_destination_scratchBuffer_scratchBufferOffset_options___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  if (!*(_BYTE *)(v4 + 56))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "waitForVirtualSubstream:", v2);
}

uint64_t __147___MTLSWRaytracingAccelerationStructureCommandEncoder_refitAccelerationStructure_descriptor_destination_scratchBuffer_scratchBufferOffset_options___block_invoke_3(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  if (!*(_BYTE *)(v4 + 56))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "waitForVirtualSubstream:", v2);
}

uint64_t __122___MTLSWRaytracingAccelerationStructureCommandEncoder_writeSerializedAccelerationStructureSize_toBuffer_sizeBufferOffset___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  if (!*(_BYTE *)(v4 + 56))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "waitForVirtualSubstream:", v2);
}

uint64_t __122___MTLSWRaytracingAccelerationStructureCommandEncoder_writeSerializedAccelerationStructureSize_toBuffer_sizeBufferOffset___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  if (!*(_BYTE *)(v4 + 56))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "waitForVirtualSubstream:", v2);
}

uint64_t __141___MTLSWRaytracingAccelerationStructureCommandEncoder_writeDeserializedAccelerationStructureSize_serializedOffset_toBuffer_sizeBufferOffset___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  if (!*(_BYTE *)(v4 + 56))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "waitForVirtualSubstream:", v2);
}

uint64_t __141___MTLSWRaytracingAccelerationStructureCommandEncoder_writeDeserializedAccelerationStructureSize_serializedOffset_toBuffer_sizeBufferOffset___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  if (!*(_BYTE *)(v4 + 56))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "waitForVirtualSubstream:", v2);
}

uint64_t __152___MTLSWRaytracingAccelerationStructureCommandEncoder_writeDeserializedPrimitiveAccelerationStructureSizes_serializedOffset_toBuffer_sizesBufferOffset___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  if (!*(_BYTE *)(v4 + 56))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "waitForVirtualSubstream:", v2);
}

uint64_t __152___MTLSWRaytracingAccelerationStructureCommandEncoder_writeDeserializedPrimitiveAccelerationStructureSizes_serializedOffset_toBuffer_sizesBufferOffset___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  if (!*(_BYTE *)(v4 + 56))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "waitForVirtualSubstream:", v2);
}

uint64_t __127___MTLSWRaytracingAccelerationStructureCommandEncoder_serializePrimitiveAccelerationStructure_toBuffer_serializedBufferOffset___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  if (!*(_BYTE *)(v4 + 56))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "waitForVirtualSubstream:", v2);
}

uint64_t __127___MTLSWRaytracingAccelerationStructureCommandEncoder_serializePrimitiveAccelerationStructure_toBuffer_serializedBufferOffset___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  if (!*(_BYTE *)(v4 + 56))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "waitForVirtualSubstream:", v2);
}

uint64_t __158___MTLSWRaytracingAccelerationStructureCommandEncoder_serializeInstanceAccelerationStructure_primitiveAccelerationStructures_toBuffer_serializedBufferOffset___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  if (!*(_BYTE *)(v4 + 56))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "waitForVirtualSubstream:", v2);
}

uint64_t __158___MTLSWRaytracingAccelerationStructureCommandEncoder_serializeInstanceAccelerationStructure_primitiveAccelerationStructures_toBuffer_serializedBufferOffset___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  if (!*(_BYTE *)(v4 + 56))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "waitForVirtualSubstream:", v2);
}

uint64_t __131___MTLSWRaytracingAccelerationStructureCommandEncoder_deserializePrimitiveAccelerationStructure_fromBuffer_serializedBufferOffset___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  if (!*(_BYTE *)(v4 + 56))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "waitForVirtualSubstream:", v2);
}

uint64_t __131___MTLSWRaytracingAccelerationStructureCommandEncoder_deserializePrimitiveAccelerationStructure_fromBuffer_serializedBufferOffset___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  if (!*(_BYTE *)(v4 + 56))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "waitForVirtualSubstream:", v2);
}

uint64_t __162___MTLSWRaytracingAccelerationStructureCommandEncoder_deserializeInstanceAccelerationStructure_primitiveAccelerationStructures_fromBuffer_serializedBufferOffset___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  if (!*(_BYTE *)(v4 + 56))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "waitForVirtualSubstream:", v2);
}

uint64_t __162___MTLSWRaytracingAccelerationStructureCommandEncoder_deserializeInstanceAccelerationStructure_primitiveAccelerationStructures_fromBuffer_serializedBufferOffset___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  if (!*(_BYTE *)(v4 + 56))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "waitForVirtualSubstream:", v2);
}

uint64_t __146___MTLSWRaytracingAccelerationStructureCommandEncoder_deserializePrimitiveAccelerationStructure_fromBuffer_serializedBufferOffset_withDescriptor___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  if (!*(_BYTE *)(v4 + 56))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "waitForVirtualSubstream:", v2);
}

uint64_t __146___MTLSWRaytracingAccelerationStructureCommandEncoder_deserializePrimitiveAccelerationStructure_fromBuffer_serializedBufferOffset_withDescriptor___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  if (!*(_BYTE *)(v4 + 56))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "waitForVirtualSubstream:", v2);
}

uint64_t __177___MTLSWRaytracingAccelerationStructureCommandEncoder_deserializeInstanceAccelerationStructure_primitiveAccelerationStructures_fromBuffer_serializedBufferOffset_withDescriptor___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  if (!*(_BYTE *)(v4 + 56))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "waitForVirtualSubstream:", v2);
}

uint64_t __177___MTLSWRaytracingAccelerationStructureCommandEncoder_deserializeInstanceAccelerationStructure_primitiveAccelerationStructures_fromBuffer_serializedBufferOffset_withDescriptor___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  if (!*(_BYTE *)(v4 + 56))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "waitForVirtualSubstream:", v2);
}

uint64_t __122___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGeometrySizeOfAccelerationStructure_toBuffer_sizeBufferOffset___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  if (!*(_BYTE *)(v4 + 56))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "waitForVirtualSubstream:", v2);
}

uint64_t __122___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGeometrySizeOfAccelerationStructure_toBuffer_sizeBufferOffset___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  if (!*(_BYTE *)(v4 + 56))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "waitForVirtualSubstream:", v2);
}

uint64_t __122___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGeometryOfAccelerationStructure_toBuffer_geometryBufferOffset___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  if (!*(_BYTE *)(v4 + 56))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "waitForVirtualSubstream:", v2);
}

uint64_t __122___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGeometryOfAccelerationStructure_toBuffer_geometryBufferOffset___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  if (!*(_BYTE *)(v4 + 56))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "waitForVirtualSubstream:", v2);
}

uint64_t __113___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGenericBVHStructureSizesOfAccelerationStructure_into___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  if (!*(_BYTE *)(v4 + 56))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "waitForVirtualSubstream:", v2);
}

void __113___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGenericBVHStructureSizesOfAccelerationStructure_into___block_invoke_2(uint64_t a1)
{
  _QWORD *v2;

  v2 = (_QWORD *)objc_msgSend(*(id *)(a1 + 32), "contents");
  objc_msgSend(*(id *)(a1 + 40), "setHeaderBufferSize:", *v2);
  objc_msgSend(*(id *)(a1 + 40), "setInnerNodeBufferSize:", v2[1]);
  objc_msgSend(*(id *)(a1 + 40), "setLeafNodeBufferSize:", v2[2]);
  objc_msgSend(*(id *)(a1 + 40), "setPrimitiveBufferSize:", v2[3]);
  objc_msgSend(*(id *)(a1 + 40), "setGeometryBufferSize:", v2[4]);
  objc_msgSend(*(id *)(a1 + 40), "setInstanceTransformBufferSize:", v2[5]);
  objc_msgSend(*(id *)(a1 + 40), "setPerPrimitiveDataBufferSize:", v2[6]);
  objc_msgSend(*(id *)(a1 + 40), "setControlPointBufferSize:", v2[7]);

}

uint64_t __108___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGenericBVHStructureOfAccelerationStructure_into___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  if (!*(_BYTE *)(v4 + 56))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "waitForVirtualSubstream:", v2);
}

uint64_t __108___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGenericBVHStructureOfAccelerationStructure_into___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  if (!*(_BYTE *)(v4 + 56))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "waitForVirtualSubstream:", v2);
}

uint64_t __108___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGenericBVHStructureOfAccelerationStructure_into___block_invoke_3(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  if (!*(_BYTE *)(v4 + 56))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "waitForVirtualSubstream:", v2);
}

uint64_t __108___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGenericBVHStructureOfAccelerationStructure_into___block_invoke_4(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  if (!*(_BYTE *)(v4 + 56))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "waitForVirtualSubstream:", v2);
}

uint64_t __108___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGenericBVHStructureOfAccelerationStructure_into___block_invoke_5(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  if (!*(_BYTE *)(v4 + 56))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "waitForVirtualSubstream:", v2);
}

uint64_t __108___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGenericBVHStructureOfAccelerationStructure_into___block_invoke_6(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  if (!*(_BYTE *)(v4 + 56))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "waitForVirtualSubstream:", v2);
}

uint64_t __108___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGenericBVHStructureOfAccelerationStructure_into___block_invoke_7(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  if (!*(_BYTE *)(v4 + 56))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "waitForVirtualSubstream:", v2);
}

uint64_t __108___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGenericBVHStructureOfAccelerationStructure_into___block_invoke_8(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  if (!*(_BYTE *)(v4 + 56))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "waitForVirtualSubstream:", v2);
}

uint64_t __108___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGenericBVHStructureOfAccelerationStructure_into___block_invoke_9(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  if (!*(_BYTE *)(v4 + 56))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "waitForVirtualSubstream:", v2);
}

uint64_t __135___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGenericBVHStructureSizesOfAccelerationStructure_toBuffer_sizesBufferOffset___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  if (!*(_BYTE *)(v4 + 56))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "waitForVirtualSubstream:", v2);
}

uint64_t __135___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGenericBVHStructureSizesOfAccelerationStructure_toBuffer_sizesBufferOffset___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  if (!*(_BYTE *)(v4 + 56))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "waitForVirtualSubstream:", v2);
}

uint64_t __369___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGenericBVHStructureOfAccelerationStructure_headerBuffer_headerBufferOffset_innerNodeBuffer_innerNodeBufferOffset_leafNodeBuffer_leafNodeBufferOffset_primitiveBuffer_primitiveBufferOffset_geometryBuffer_geometryOffset_instanceTransformBuffer_instanceTransformOffset_controlPointBuffer_controlPointBufferOffset___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  if (!*(_BYTE *)(v4 + 56))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "waitForVirtualSubstream:", v2);
}

uint64_t __369___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGenericBVHStructureOfAccelerationStructure_headerBuffer_headerBufferOffset_innerNodeBuffer_innerNodeBufferOffset_leafNodeBuffer_leafNodeBufferOffset_primitiveBuffer_primitiveBufferOffset_geometryBuffer_geometryOffset_instanceTransformBuffer_instanceTransformOffset_controlPointBuffer_controlPointBufferOffset___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  if (!*(_BYTE *)(v4 + 56))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "waitForVirtualSubstream:", v2);
}

uint64_t __369___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGenericBVHStructureOfAccelerationStructure_headerBuffer_headerBufferOffset_innerNodeBuffer_innerNodeBufferOffset_leafNodeBuffer_leafNodeBufferOffset_primitiveBuffer_primitiveBufferOffset_geometryBuffer_geometryOffset_instanceTransformBuffer_instanceTransformOffset_controlPointBuffer_controlPointBufferOffset___block_invoke_3(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  if (!*(_BYTE *)(v4 + 56))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "waitForVirtualSubstream:", v2);
}

uint64_t __369___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGenericBVHStructureOfAccelerationStructure_headerBuffer_headerBufferOffset_innerNodeBuffer_innerNodeBufferOffset_leafNodeBuffer_leafNodeBufferOffset_primitiveBuffer_primitiveBufferOffset_geometryBuffer_geometryOffset_instanceTransformBuffer_instanceTransformOffset_controlPointBuffer_controlPointBufferOffset___block_invoke_4(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  if (!*(_BYTE *)(v4 + 56))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "waitForVirtualSubstream:", v2);
}

uint64_t __369___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGenericBVHStructureOfAccelerationStructure_headerBuffer_headerBufferOffset_innerNodeBuffer_innerNodeBufferOffset_leafNodeBuffer_leafNodeBufferOffset_primitiveBuffer_primitiveBufferOffset_geometryBuffer_geometryOffset_instanceTransformBuffer_instanceTransformOffset_controlPointBuffer_controlPointBufferOffset___block_invoke_5(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  if (!*(_BYTE *)(v4 + 56))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "waitForVirtualSubstream:", v2);
}

uint64_t __369___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGenericBVHStructureOfAccelerationStructure_headerBuffer_headerBufferOffset_innerNodeBuffer_innerNodeBufferOffset_leafNodeBuffer_leafNodeBufferOffset_primitiveBuffer_primitiveBufferOffset_geometryBuffer_geometryOffset_instanceTransformBuffer_instanceTransformOffset_controlPointBuffer_controlPointBufferOffset___block_invoke_6(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  if (!*(_BYTE *)(v4 + 56))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "waitForVirtualSubstream:", v2);
}

uint64_t __369___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGenericBVHStructureOfAccelerationStructure_headerBuffer_headerBufferOffset_innerNodeBuffer_innerNodeBufferOffset_leafNodeBuffer_leafNodeBufferOffset_primitiveBuffer_primitiveBufferOffset_geometryBuffer_geometryOffset_instanceTransformBuffer_instanceTransformOffset_controlPointBuffer_controlPointBufferOffset___block_invoke_7(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  if (!*(_BYTE *)(v4 + 56))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "waitForVirtualSubstream:", v2);
}

uint64_t __369___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGenericBVHStructureOfAccelerationStructure_headerBuffer_headerBufferOffset_innerNodeBuffer_innerNodeBufferOffset_leafNodeBuffer_leafNodeBufferOffset_primitiveBuffer_primitiveBufferOffset_geometryBuffer_geometryOffset_instanceTransformBuffer_instanceTransformOffset_controlPointBuffer_controlPointBufferOffset___block_invoke_8(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  if (!*(_BYTE *)(v4 + 56))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "waitForVirtualSubstream:", v2);
}

uint64_t __115___MTLSWRaytracingAccelerationStructureCommandEncoder_writeAccelerationStructureSerializationData_toBuffer_offset___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  if (!*(_BYTE *)(v4 + 56))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "waitForVirtualSubstream:", v2);
}

uint64_t __115___MTLSWRaytracingAccelerationStructureCommandEncoder_writeAccelerationStructureSerializationData_toBuffer_offset___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  if (!*(_BYTE *)(v4 + 56))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "waitForVirtualSubstream:", v2);
}

uint64_t __112___MTLSWRaytracingAccelerationStructureCommandEncoder_writeAccelerationStructureTraversalDepth_toBuffer_offset___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  if (!*(_BYTE *)(v4 + 56))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "waitForVirtualSubstream:", v2);
}

uint64_t __112___MTLSWRaytracingAccelerationStructureCommandEncoder_writeAccelerationStructureTraversalDepth_toBuffer_offset___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  void *v5;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  if (!*(_BYTE *)(v4 + 56))
    return objc_msgSend(v5, "waitForProgress:", a2);
  objc_msgSend(v5, "setSubstream:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "waitForVirtualSubstream:", v2);
}

@end
