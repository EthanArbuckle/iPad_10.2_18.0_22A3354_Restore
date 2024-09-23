@implementation _MTLSWRaytracingAccelerationStructureCommandEncoder

- (void)substreamSynchronizeDescriptor:(id)a3 access:(unint64_t)a4
{
  void *v7;
  void *v8;

  v7 = (void *)objc_opt_class();
  if (objc_msgSend(v7, "isSubclassOfClass:", objc_opt_class()))
  {
    if ((unint64_t)(objc_msgSend(a3, "instanceDescriptorType") - 3) > 1)
    {
      -[_MTLSWRaytracingAccelerationStructureCommandEncoder substreamSynchronizeAccelerationStructures:access:](self, "substreamSynchronizeAccelerationStructures:access:", objc_msgSend(a3, "instancedAccelerationStructures"), a4);
      return;
    }
  }
  else
  {
    v8 = (void *)objc_opt_class();
    if (!objc_msgSend(v8, "isSubclassOfClass:", objc_opt_class()))
      return;
  }
  MTLProgressBinsForceBarrier(self->_progressBins, self->_computeEncoder);
}

- (void)substreamSynchronizeAccelerationStructures:(id)a3 access:(unint64_t)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *progressBins;
  void *v12;
  _QWORD v14[5];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    v9 = MEMORY[0x1E0C809B0];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(a3);
        progressBins = self->_progressBins;
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "buffer");
        v14[0] = v9;
        v14[1] = 3221225472;
        v14[2] = __105___MTLSWRaytracingAccelerationStructureCommandEncoder_substreamSynchronizeAccelerationStructures_access___block_invoke;
        v14[3] = &unk_1E0FE3C70;
        v14[4] = self;
        MTLProgressBinsSynchronizeBufferAccess((uint64_t)progressBins, v12, a4, (uint64_t)v14);
        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }
}

- (void)beginBVHSubstream
{
  _BOOL4 virtualSubstreamOpen;
  MTLComputeCommandEncoderSPI *computeEncoder;

  if (self->_virtualSubstreamsEnabled)
  {
    virtualSubstreamOpen = self->_virtualSubstreamOpen;
    computeEncoder = self->_computeEncoder;
    if (virtualSubstreamOpen)
    {
      -[MTLComputeCommandEncoderSPI nextVirtualSubstream](computeEncoder, "nextVirtualSubstream");
    }
    else
    {
      -[MTLComputeCommandEncoderSPI beginVirtualSubstream](computeEncoder, "beginVirtualSubstream");
      self->_virtualSubstreamOpen = 1;
    }
  }
}

- (void)endBVHSubstream
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *progressBins;

  if (self->_virtualSubstreamOpen)
  {
    -[MTLComputeCommandEncoderSPI endVirtualSubstream](self->_computeEncoder, "endVirtualSubstream");
    self->_virtualSubstreamOpen = 0;
    progressBins = self->_progressBins;
    if (progressBins)
    {
      std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::clear((_QWORD *)progressBins + 12);
      *((_QWORD *)progressBins + 3) = 0;
      *((_QWORD *)progressBins + 4) = 0;
      *((_WORD *)progressBins + 21) = 0;
      *((_DWORD *)progressBins + 35) = 0;
    }
  }
}

- (_MTLSWRaytracingAccelerationStructureCommandEncoder)initWithCommandBuffer:(id)a3
{
  _MTLSWRaytracingAccelerationStructureCommandEncoder *v4;
  MTLComputePassDescriptor *v5;
  MTLComputePassDescriptor *v6;
  unsigned int v7;
  int v8;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *progressBins;
  _QWORD block[5];
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_MTLSWRaytracingAccelerationStructureCommandEncoder;
  v4 = -[_MTLObjectWithLabel init](&v12, sel_init);
  if (v4)
  {
    v4->_device = (MTLDevice *)(id)objc_msgSend(a3, "device");
    v4->_commandBuffer = (MTLCommandBuffer *)a3;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77___MTLSWRaytracingAccelerationStructureCommandEncoder_initWithCommandBuffer___block_invoke;
    block[3] = &unk_1E0FE2880;
    block[4] = v4;
    if (-[_MTLSWRaytracingAccelerationStructureCommandEncoder initWithCommandBuffer:]::onceToken != -1)
      dispatch_once(&-[_MTLSWRaytracingAccelerationStructureCommandEncoder initWithCommandBuffer:]::onceToken, block);
    v5 = objc_alloc_init(MTLComputePassDescriptor);
    v6 = v5;
    if (-[_MTLSWRaytracingAccelerationStructureCommandEncoder initWithCommandBuffer:]::useConcurrentDispatch)
      -[MTLComputePassDescriptor setDispatchType:](v5, "setDispatchType:", 1);
    if (-[_MTLSWRaytracingAccelerationStructureCommandEncoder initWithCommandBuffer:]::numSubstreams >= 2)
    {
      if (-[_MTLSWRaytracingAccelerationStructureCommandEncoder initWithCommandBuffer:]::numSubstreams >= 3)
        v7 = 3;
      else
        v7 = -[_MTLSWRaytracingAccelerationStructureCommandEncoder initWithCommandBuffer:]::numSubstreams;
      v4->_progressBins = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)MTLProgressBinsMake(v7, 0x80u, 547.61, 0.00035879, 1.9567, 0.00045325, 0.1188, 0.0000070741);
      v8 = -[MTLDevice supportsVirtualSubstreams](v4->_device, "supportsVirtualSubstreams");
      progressBins = v4->_progressBins;
      if (v8)
      {
        if (progressBins)
          *((_BYTE *)progressBins + 48) = 1;
        v4->_virtualSubstreamsEnabled = 1;
      }
      -[MTLComputePassDescriptor setSubstreamCount:](v6, "setSubstreamCount:", *((unsigned __int16 *)progressBins + 20));
      -[MTLComputePassDescriptor setAllowCommandEncoderCoalescing:](v6, "setAllowCommandEncoderCoalescing:", 0);
    }
    v4->_computeEncoder = (MTLComputeCommandEncoderSPI *)(id)objc_msgSend(a3, "computeCommandEncoderWithDescriptor:", v6);

  }
  return v4;
}

- (_MTLSWRaytracingAccelerationStructureCommandEncoder)initWithCommandBuffer:(id)a3 descriptor:(id)a4
{
  _MTLSWRaytracingAccelerationStructureCommandEncoder *v6;
  unsigned int v7;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *progressBins;
  void *v9;
  id commandBuffer;
  _QWORD block[5];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_MTLSWRaytracingAccelerationStructureCommandEncoder;
  v6 = -[_MTLObjectWithLabel init](&v13, sel_init);
  if (v6)
  {
    v6->_device = (MTLDevice *)(id)objc_msgSend(a3, "device");
    v6->_commandBuffer = (MTLCommandBuffer *)a3;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __88___MTLSWRaytracingAccelerationStructureCommandEncoder_initWithCommandBuffer_descriptor___block_invoke;
    block[3] = &unk_1E0FE2880;
    block[4] = v6;
    if (-[_MTLSWRaytracingAccelerationStructureCommandEncoder initWithCommandBuffer:descriptor:]::onceToken != -1)
      dispatch_once(&-[_MTLSWRaytracingAccelerationStructureCommandEncoder initWithCommandBuffer:descriptor:]::onceToken, block);
    if (-[_MTLSWRaytracingAccelerationStructureCommandEncoder initWithCommandBuffer:descriptor:]::numSubstreams >= 2
      && objc_msgSend(a4, "enableSubstreams"))
    {
      if (-[_MTLSWRaytracingAccelerationStructureCommandEncoder initWithCommandBuffer:descriptor:]::numSubstreams >= 3)
        v7 = 3;
      else
        v7 = -[_MTLSWRaytracingAccelerationStructureCommandEncoder initWithCommandBuffer:descriptor:]::numSubstreams;
      v6->_progressBins = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)MTLProgressBinsMake(v7, 0x80u, 547.61, 0.00035879, 1.9567, 0.00045325, 0.1188, 0.0000070741);
      if (-[MTLDevice supportsVirtualSubstreams](v6->_device, "supportsVirtualSubstreams"))
      {
        progressBins = v6->_progressBins;
        if (progressBins)
          *((_BYTE *)progressBins + 48) = 1;
        v6->_virtualSubstreamsEnabled = 1;
      }
      v9 = (void *)objc_msgSend(a4, "convertToComputePassDescriptorWithConcurrentDispatch:", -[_MTLSWRaytracingAccelerationStructureCommandEncoder initWithCommandBuffer:descriptor:]::useConcurrentDispatch);
      objc_msgSend(v9, "setSubstreamCount:", *((unsigned __int16 *)v6->_progressBins + 20));
      objc_msgSend(v9, "setAllowCommandEncoderCoalescing:", 0);
      commandBuffer = a3;
    }
    else
    {
      v9 = (void *)objc_msgSend(a4, "convertToComputePassDescriptorWithConcurrentDispatch:", -[_MTLSWRaytracingAccelerationStructureCommandEncoder initWithCommandBuffer:descriptor:]::useConcurrentDispatch);
      commandBuffer = v6->_commandBuffer;
    }
    v6->_computeEncoder = (MTLComputeCommandEncoderSPI *)(id)objc_msgSend(commandBuffer, "computeCommandEncoderWithDescriptor:", v9);

  }
  return v6;
}

- (unint64_t)globalTraceObjectID
{
  return -[MTLComputeCommandEncoderSPI globalTraceObjectID](self->_computeEncoder, "globalTraceObjectID");
}

- (MTLDevice)device
{
  return self->_device;
}

- (id)commandBuffer
{
  return self->_commandBuffer;
}

- (void)dealloc
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *progressBins;
  objc_super v4;

  progressBins = self->_progressBins;
  if (progressBins)
  {
    MTLAccelerationStructureCommandProgressBinsInternal::~MTLAccelerationStructureCommandProgressBinsInternal((MTLAccelerationStructureCommandProgressBinsInternal *)progressBins);
    MEMORY[0x186DABFBC]();
  }

  v4.receiver = self;
  v4.super_class = (Class)_MTLSWRaytracingAccelerationStructureCommandEncoder;
  -[_MTLObjectWithLabel dealloc](&v4, sel_dealloc);
}

- (void)endEncoding
{
  -[_MTLSWRaytracingAccelerationStructureCommandEncoder endBVHSubstream](self, "endBVHSubstream");
  -[MTLComputeCommandEncoderSPI endEncoding](self->_computeEncoder, "endEncoding");

  self->_device = 0;
  self->_commandBuffer = 0;
}

- (id)endEncodingAndRetrieveProgramAddressTable
{
  void *v3;

  v3 = (void *)-[MTLComputeCommandEncoderSPI endEncodingAndRetrieveProgramAddressTable](self->_computeEncoder, "endEncodingAndRetrieveProgramAddressTable");

  self->_device = 0;
  self->_commandBuffer = 0;
  return v3;
}

- (void)setLabel:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_MTLSWRaytracingAccelerationStructureCommandEncoder;
  -[_MTLObjectWithLabel setLabel:](&v5, sel_setLabel_);
  -[MTLComputeCommandEncoderSPI setLabel:](self->_computeEncoder, "setLabel:", a3);
}

- (void)buildAccelerationStructure:(id)a3 descriptor:(id)a4 scratchBuffer:(id)a5 scratchBufferOffset:(unint64_t)a6
{
  MTLAccelerationStructureDescriptor *v7;
  char v10;
  uint64_t v11;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *progressBins;
  MTLComputeCommandEncoderSPI *computeEncoder;
  unint64_t PrimitiveCountFromDescriptor;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v15;
  void *v16;
  uint64_t v17;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  MTLAccelerationStructureDescriptor *v26;
  MTLBVHDescriptor *v27;
  void *v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  id v35;
  void *v36;
  int v37;
  MTLComputeCommandEncoderSPI *v38;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v39;
  uint64_t v40;
  void *context;
  void *v42;
  id v43;
  char v45;
  MTLAccelerationStructureDescriptor *v46;
  unint64_t v47;
  _QWORD v48[5];
  _QWORD v49[6];

  v7 = (MTLAccelerationStructureDescriptor *)a4;
  v10 = objc_msgSend(a4, "isInstanceDescriptor");
  v46 = v7;
  if ((v10 & 1) != 0)
  {
    v11 = -[_MTLSWRaytracingAccelerationStructureCommandEncoder endBVHSubstream](self, "endBVHSubstream");
  }
  else
  {
    v11 = -[_MTLSWRaytracingAccelerationStructureCommandEncoder beginBVHSubstream](self, "beginBVHSubstream");
    progressBins = self->_progressBins;
    if (progressBins)
    {
      computeEncoder = self->_computeEncoder;
      PrimitiveCountFromDescriptor = MTLProgressBinsGetPrimitiveCountFromDescriptor(v7);
      -[MTLComputeCommandEncoderSPI setSubstream:](computeEncoder, "setSubstream:", MTLProgressBinsSelectSubstreamWithPrimitiveCount((uint64_t)progressBins, 0, PrimitiveCountFromDescriptor));
      v15 = self->_progressBins;
      v16 = (void *)objc_msgSend(a3, "buffer");
      v17 = MEMORY[0x1E0C809B0];
      v49[0] = MEMORY[0x1E0C809B0];
      v49[1] = 3221225472;
      v49[2] = __127___MTLSWRaytracingAccelerationStructureCommandEncoder_buildAccelerationStructure_descriptor_scratchBuffer_scratchBufferOffset___block_invoke;
      v49[3] = &unk_1E0FE3C70;
      v49[4] = self;
      MTLProgressBinsSynchronizeBufferAccess((uint64_t)v15, v16, 1, (uint64_t)v49);
      -[_MTLSWRaytracingAccelerationStructureCommandEncoder substreamSynchronizeDescriptor:access:](self, "substreamSynchronizeDescriptor:access:", v46, 0);
      v18 = self->_progressBins;
      v48[0] = v17;
      v7 = v46;
      v48[1] = 3221225472;
      v48[2] = __127___MTLSWRaytracingAccelerationStructureCommandEncoder_buildAccelerationStructure_descriptor_scratchBuffer_scratchBufferOffset___block_invoke_2;
      v48[3] = &unk_1E0FE3C70;
      v48[4] = self;
      v11 = MTLProgressBinsSynchronizeBufferAccess((uint64_t)v18, a5, 1, (uint64_t)v48);
    }
  }
  v19 = MEMORY[0x186DAC640](v11);
  v20 = (void *)objc_opt_class();
  v45 = v10;
  v42 = (void *)v19;
  v43 = a3;
  if (objc_msgSend(v20, "isSubclassOfClass:", objc_opt_class()))
  {
    if (-[MTLAccelerationStructureDescriptor instanceDescriptorType](v7, "instanceDescriptorType") == 2
      || -[MTLAccelerationStructureDescriptor instanceDescriptorType](v7, "instanceDescriptorType") == 4)
    {
      v21 = a5;
      v22 = 56 * -[MTLAccelerationStructureDescriptor instanceCount](v7, "instanceCount");
    }
    else
    {
      v21 = a5;
      v22 = 24 * -[MTLAccelerationStructureDescriptor instanceCount](v7, "instanceCount");
    }
  }
  else
  {
    v21 = a5;
    v23 = (void *)objc_opt_class();
    if (!objc_msgSend(v23, "isSubclassOfClass:", objc_opt_class()))
    {
      v22 = 0;
      v26 = 0;
      goto LABEL_16;
    }
    v24 = -[MTLAccelerationStructureDescriptor instanceDescriptorType](v7, "instanceDescriptorType");
    v25 = -[MTLAccelerationStructureDescriptor maxInstanceCount](v7, "maxInstanceCount");
    if (v24 == 4)
      v22 = 56 * v25;
    else
      v22 = 24 * v25;
  }
  v26 = v7;
LABEL_16:
  context = (void *)MEMORY[0x186DAC640]();
  v27 = MTLBVHDescriptorForMTLAccelerationStructureDescriptor(v7);
  v28 = (void *)-[MTLDevice GPUBVHBuilder](self->_device, "GPUBVHBuilder");
  v29 = objc_msgSend(v28, "getBuildScratchBufferSizeForDescriptor:", v27);
  v30 = objc_msgSend(v28, "getEncodeMTLSWBVHScratchBufferSizeForDescriptor:bvhDescriptor:", v7, v27);
  if (v29 <= v30)
    v31 = v30;
  else
    v31 = v29;
  v32 = (v31 + 255) & 0xFFFFFFFFFFFFFF00;
  v33 = (v22 + v32 + 255) & 0xFFFFFFFFFFFFFF00;
  if (v26)
  {
    v34 = v32 + a6;
    objc_msgSend(v28, "getMTLInstanceBoundingBoxesWithEncoder:descriptor:boundingBoxBuffer:boundingBoxBufferOffset:", self->_computeEncoder, v26, v21, v32 + a6);
    v35 = -[NSArray objectAtIndexedSubscript:](-[MTLBVHDescriptor geometryDescriptors](v27, "geometryDescriptors"), "objectAtIndexedSubscript:", 0);
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v35, "boundingBoxBuffers"), "objectAtIndexedSubscript:", 0), "setBuffer:", v21);
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v35, "boundingBoxBuffers"), "objectAtIndexedSubscript:", 0), "setOffset:", v34);
  }
  v36 = (void *)objc_opt_class();
  v37 = objc_msgSend(v36, "isSubclassOfClass:", objc_opt_class());
  v38 = self->_computeEncoder;
  v47 = v33 + a6;
  if (v37)
    objc_msgSend(v28, "buildGenericBVHWithEncoder:descriptor:outputBuffer:outputBufferOffset:scratchBuffer:scratchBufferOffset:primitiveCountBuffer:primitiveCountBufferOffset:", v38, v27, v21, v47, v21, a6, -[MTLAccelerationStructureDescriptor instanceCountBuffer](v46, "instanceCountBuffer"), -[MTLAccelerationStructureDescriptor instanceCountBufferOffset](v46, "instanceCountBufferOffset"));
  else
    objc_msgSend(v28, "buildGenericBVHWithEncoder:descriptor:outputBuffer:outputBufferOffset:scratchBuffer:scratchBufferOffset:", v38, v27, v21, v47, v21, a6);
  objc_msgSend(v28, "encodeMTLSWBVHWithEncoder:descriptor:bvhDescriptor:outputBuffer:outputBufferOffset:genericBVHBuffer:genericBVHBufferOffset:scratchBuffer:scratchBufferOffset:gpuResourceID:accelerationStructureUniqueIdentifier:", self->_computeEncoder, v46, v27, objc_msgSend(v43, "buffer"), objc_msgSend(v43, "bufferOffset"), v21, v47, v21, a6, objc_msgSend(v43, "gpuResourceID"), objc_msgSend(v43, "accelerationStructureUniqueIdentifier"));
  objc_autoreleasePoolPop(context);
  objc_autoreleasePoolPop(v42);
  if ((v45 & 1) == 0)
  {
    v39 = self->_progressBins;
    if (v39)
    {
      v40 = MTLProgressBinsUpdate((uint64_t)v39);
      if ((v40 & 0x80000000) == 0 && !self->_virtualSubstreamsEnabled)
        -[MTLComputeCommandEncoderSPI signalProgress:](self->_computeEncoder, "signalProgress:", v40);
    }
  }
}

- (void)writeCompactedAccelerationStructureSize:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *progressBins;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v10;
  void *v11;
  uint64_t v12;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v13;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v14;
  uint64_t v15;
  _QWORD v16[5];
  _QWORD v17[5];

  -[_MTLSWRaytracingAccelerationStructureCommandEncoder beginBVHSubstream](self, "beginBVHSubstream");
  progressBins = self->_progressBins;
  if (progressBins)
  {
    -[MTLComputeCommandEncoderSPI setSubstream:](self->_computeEncoder, "setSubstream:", MTLProgressBinsSelectSubstreamWithBufferWriteSize((uint64_t)progressBins, 8uLL));
    v10 = self->_progressBins;
    v11 = (void *)objc_msgSend(a3, "buffer");
    v12 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __111___MTLSWRaytracingAccelerationStructureCommandEncoder_writeCompactedAccelerationStructureSize_toBuffer_offset___block_invoke;
    v17[3] = &unk_1E0FE3C70;
    v17[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v10, v11, 0, (uint64_t)v17);
    v13 = self->_progressBins;
    v16[0] = v12;
    v16[1] = 3221225472;
    v16[2] = __111___MTLSWRaytracingAccelerationStructureCommandEncoder_writeCompactedAccelerationStructureSize_toBuffer_offset___block_invoke_2;
    v16[3] = &unk_1E0FE3C70;
    v16[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v13, a4, 1, (uint64_t)v16);
  }
  objc_msgSend((id)-[MTLDevice GPUBVHBuilder](self->_device, "GPUBVHBuilder"), "writeCompactedMTLSWBVHSizeWithEncoder:BVHBuffer:BVHBufferOffset:toBuffer:sizeBufferOffset:sizeDataType:", self->_computeEncoder, objc_msgSend(a3, "buffer"), objc_msgSend(a3, "bufferOffset"), a4, a5, 33);
  v14 = self->_progressBins;
  if (v14)
  {
    v15 = MTLProgressBinsUpdate((uint64_t)v14);
    if ((v15 & 0x80000000) == 0 && !self->_virtualSubstreamsEnabled)
      -[MTLComputeCommandEncoderSPI signalProgress:](self->_computeEncoder, "signalProgress:", v15);
  }
}

- (void)writeCompactedAccelerationStructureSize:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5 sizeDataType:(unint64_t)a6
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *progressBins;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v12;
  void *v13;
  uint64_t v14;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v15;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v16;
  uint64_t v17;
  _QWORD v18[5];
  _QWORD v19[5];

  -[_MTLSWRaytracingAccelerationStructureCommandEncoder beginBVHSubstream](self, "beginBVHSubstream");
  progressBins = self->_progressBins;
  if (progressBins)
  {
    -[MTLComputeCommandEncoderSPI setSubstream:](self->_computeEncoder, "setSubstream:", MTLProgressBinsSelectSubstreamWithBufferWriteSize((uint64_t)progressBins, 8uLL));
    v12 = self->_progressBins;
    v13 = (void *)objc_msgSend(a3, "buffer");
    v14 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __124___MTLSWRaytracingAccelerationStructureCommandEncoder_writeCompactedAccelerationStructureSize_toBuffer_offset_sizeDataType___block_invoke;
    v19[3] = &unk_1E0FE3C70;
    v19[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v12, v13, 0, (uint64_t)v19);
    v15 = self->_progressBins;
    v18[0] = v14;
    v18[1] = 3221225472;
    v18[2] = __124___MTLSWRaytracingAccelerationStructureCommandEncoder_writeCompactedAccelerationStructureSize_toBuffer_offset_sizeDataType___block_invoke_2;
    v18[3] = &unk_1E0FE3C70;
    v18[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v15, a4, 1, (uint64_t)v18);
  }
  objc_msgSend((id)-[MTLDevice GPUBVHBuilder](self->_device, "GPUBVHBuilder"), "writeCompactedMTLSWBVHSizeWithEncoder:BVHBuffer:BVHBufferOffset:toBuffer:sizeBufferOffset:sizeDataType:", self->_computeEncoder, objc_msgSend(a3, "buffer"), objc_msgSend(a3, "bufferOffset"), a4, a5, a6);
  v16 = self->_progressBins;
  if (v16)
  {
    v17 = MTLProgressBinsUpdate((uint64_t)v16);
    if ((v17 & 0x80000000) == 0 && !self->_virtualSubstreamsEnabled)
      -[MTLComputeCommandEncoderSPI signalProgress:](self->_computeEncoder, "signalProgress:", v17);
  }
}

- (void)copyAccelerationStructure:(id)a3 toAccelerationStructure:(id)a4
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *progressBins;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v8;
  void *v9;
  uint64_t v10;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v11;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v12;
  uint64_t v13;
  _QWORD v14[5];
  _QWORD v15[5];

  -[_MTLSWRaytracingAccelerationStructureCommandEncoder beginBVHSubstream](self, "beginBVHSubstream");
  progressBins = self->_progressBins;
  if (progressBins)
  {
    -[MTLComputeCommandEncoderSPI setSubstream:](self->_computeEncoder, "setSubstream:", MTLProgressBinsSelectSubstreamWithBufferWriteSize((uint64_t)progressBins, objc_msgSend(a4, "size") + objc_msgSend(a3, "size")));
    v8 = self->_progressBins;
    v9 = (void *)objc_msgSend(a3, "buffer");
    v10 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __105___MTLSWRaytracingAccelerationStructureCommandEncoder_copyAccelerationStructure_toAccelerationStructure___block_invoke;
    v15[3] = &unk_1E0FE3C70;
    v15[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v8, v9, 0, (uint64_t)v15);
    v11 = self->_progressBins;
    v14[0] = v10;
    v14[1] = 3221225472;
    v14[2] = __105___MTLSWRaytracingAccelerationStructureCommandEncoder_copyAccelerationStructure_toAccelerationStructure___block_invoke_2;
    v14[3] = &unk_1E0FE3C70;
    v14[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v11, (void *)objc_msgSend(a4, "buffer"), 1, (uint64_t)v14);
  }
  objc_msgSend((id)-[MTLDevice GPUBVHBuilder](self->_device, "GPUBVHBuilder"), "copyMTLSWBVHWithEncoder:sourceBuffer:sourceBufferOffset:toBuffer:destinationBufferOffset:destinationMTLResourceID:destinationAccelerationStructureUniqueIdentifier:", self->_computeEncoder, objc_msgSend(a3, "buffer"), objc_msgSend(a3, "bufferOffset"), objc_msgSend(a4, "buffer"), objc_msgSend(a4, "bufferOffset"), objc_msgSend(a4, "gpuResourceID"), objc_msgSend(a4, "accelerationStructureUniqueIdentifier"));
  objc_msgSend(a4, "setDescriptor:", objc_msgSend(a3, "descriptor"));
  v12 = self->_progressBins;
  if (v12)
  {
    v13 = MTLProgressBinsUpdate((uint64_t)v12);
    if ((v13 & 0x80000000) == 0 && !self->_virtualSubstreamsEnabled)
      -[MTLComputeCommandEncoderSPI signalProgress:](self->_computeEncoder, "signalProgress:", v13);
  }
}

- (void)copyAndCompactAccelerationStructure:(id)a3 toAccelerationStructure:(id)a4
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *progressBins;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v8;
  void *v9;
  uint64_t v10;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v11;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v12;
  uint64_t v13;
  _QWORD v14[5];
  _QWORD v15[5];

  -[_MTLSWRaytracingAccelerationStructureCommandEncoder beginBVHSubstream](self, "beginBVHSubstream");
  progressBins = self->_progressBins;
  if (progressBins)
  {
    -[MTLComputeCommandEncoderSPI setSubstream:](self->_computeEncoder, "setSubstream:", MTLProgressBinsSelectSubstreamWithBufferWriteSize((uint64_t)progressBins, objc_msgSend(a4, "size") + objc_msgSend(a3, "size")));
    v8 = self->_progressBins;
    v9 = (void *)objc_msgSend(a3, "buffer");
    v10 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __115___MTLSWRaytracingAccelerationStructureCommandEncoder_copyAndCompactAccelerationStructure_toAccelerationStructure___block_invoke;
    v15[3] = &unk_1E0FE3C70;
    v15[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v8, v9, 0, (uint64_t)v15);
    v11 = self->_progressBins;
    v14[0] = v10;
    v14[1] = 3221225472;
    v14[2] = __115___MTLSWRaytracingAccelerationStructureCommandEncoder_copyAndCompactAccelerationStructure_toAccelerationStructure___block_invoke_2;
    v14[3] = &unk_1E0FE3C70;
    v14[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v11, (void *)objc_msgSend(a4, "buffer"), 1, (uint64_t)v14);
  }
  objc_msgSend((id)-[MTLDevice GPUBVHBuilder](self->_device, "GPUBVHBuilder"), "copyAndCompactMTLSWBVHWithEncoder:sourceBuffer:sourceBufferOffset:toBuffer:destinationBufferOffset:destinationMTLResourceID:destinationAccelerationStructureUniqueIdentifier:", self->_computeEncoder, objc_msgSend(a3, "buffer"), objc_msgSend(a3, "bufferOffset"), objc_msgSend(a4, "buffer"), objc_msgSend(a4, "bufferOffset"), objc_msgSend(a4, "gpuResourceID"), objc_msgSend(a4, "accelerationStructureUniqueIdentifier"));
  objc_msgSend(a4, "setDescriptor:", objc_msgSend(a3, "descriptor"));
  v12 = self->_progressBins;
  if (v12)
  {
    v13 = MTLProgressBinsUpdate((uint64_t)v12);
    if ((v13 & 0x80000000) == 0 && !self->_virtualSubstreamsEnabled)
      -[MTLComputeCommandEncoderSPI signalProgress:](self->_computeEncoder, "signalProgress:", v13);
  }
}

- (void)refitAccelerationStructure:(id)a3 descriptor:(id)a4 destination:(id)a5 scratchBuffer:(id)a6 scratchBufferOffset:(unint64_t)a7
{
  uint64_t v11;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *progressBins;
  MTLComputeCommandEncoderSPI *computeEncoder;
  unint64_t PrimitiveCountFromDescriptor;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v15;
  void *v16;
  uint64_t v17;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v18;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v19;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v20;
  uint64_t v21;
  void *context;
  _QWORD v25[5];
  _QWORD v26[5];
  _QWORD v27[6];

  v11 = -[_MTLSWRaytracingAccelerationStructureCommandEncoder beginBVHSubstream](self, "beginBVHSubstream");
  progressBins = self->_progressBins;
  if (progressBins)
  {
    computeEncoder = self->_computeEncoder;
    PrimitiveCountFromDescriptor = MTLProgressBinsGetPrimitiveCountFromDescriptor((MTLAccelerationStructureDescriptor *)a4);
    -[MTLComputeCommandEncoderSPI setSubstream:](computeEncoder, "setSubstream:", MTLProgressBinsSelectSubstreamWithPrimitiveCount((uint64_t)progressBins, 1, PrimitiveCountFromDescriptor));
    v15 = self->_progressBins;
    v16 = (void *)objc_msgSend(a3, "buffer");
    v17 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __139___MTLSWRaytracingAccelerationStructureCommandEncoder_refitAccelerationStructure_descriptor_destination_scratchBuffer_scratchBufferOffset___block_invoke;
    v27[3] = &unk_1E0FE3C70;
    v27[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v15, v16, 0, (uint64_t)v27);
    v18 = self->_progressBins;
    v26[0] = v17;
    v26[1] = 3221225472;
    v26[2] = __139___MTLSWRaytracingAccelerationStructureCommandEncoder_refitAccelerationStructure_descriptor_destination_scratchBuffer_scratchBufferOffset___block_invoke_2;
    v26[3] = &unk_1E0FE3C70;
    v26[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v18, (void *)objc_msgSend(a5, "buffer"), 1, (uint64_t)v26);
    v19 = self->_progressBins;
    v25[0] = v17;
    v25[1] = 3221225472;
    v25[2] = __139___MTLSWRaytracingAccelerationStructureCommandEncoder_refitAccelerationStructure_descriptor_destination_scratchBuffer_scratchBufferOffset___block_invoke_3;
    v25[3] = &unk_1E0FE3C70;
    v25[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v19, a6, 1, (uint64_t)v25);
    v11 = -[_MTLSWRaytracingAccelerationStructureCommandEncoder substreamSynchronizeDescriptor:access:](self, "substreamSynchronizeDescriptor:access:", a4, 0);
  }
  context = (void *)MEMORY[0x186DAC640](v11);
  objc_msgSend((id)-[MTLDevice GPUBVHBuilder](self->_device, "GPUBVHBuilder"), "refitMTLSWBVHWithEncoder:descriptor:bvhDescriptor:sourceBuffer:sourceBufferOffset:destinationBuffer:destinationBufferOffset:destinationMTLResourceID:destinationAccelerationStructureUniqueIdentifier:scratchBuffer:scratchBufferOffset:", self->_computeEncoder, a4, MTLBVHDescriptorForMTLAccelerationStructureDescriptor(a4), objc_msgSend(a3, "buffer"), objc_msgSend(a3, "bufferOffset"), objc_msgSend(a5, "buffer"), objc_msgSend(a5, "bufferOffset"), objc_msgSend(a5, "gpuResourceID"), objc_msgSend(a5, "accelerationStructureUniqueIdentifier"), a6, a7);
  objc_autoreleasePoolPop(context);
  v20 = self->_progressBins;
  if (v20)
  {
    v21 = MTLProgressBinsUpdate((uint64_t)v20);
    if ((v21 & 0x80000000) == 0 && !self->_virtualSubstreamsEnabled)
      -[MTLComputeCommandEncoderSPI signalProgress:](self->_computeEncoder, "signalProgress:", v21);
  }
}

- (void)refitAccelerationStructure:(id)a3 descriptor:(id)a4 destination:(id)a5 scratchBuffer:(id)a6 scratchBufferOffset:(unint64_t)a7 options:(unint64_t)a8
{
  uint64_t v12;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *progressBins;
  MTLComputeCommandEncoderSPI *computeEncoder;
  unint64_t PrimitiveCountFromDescriptor;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v16;
  void *v17;
  uint64_t v18;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v19;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v20;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v21;
  uint64_t v22;
  void *context;
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD v29[6];

  v12 = -[_MTLSWRaytracingAccelerationStructureCommandEncoder beginBVHSubstream](self, "beginBVHSubstream");
  progressBins = self->_progressBins;
  if (progressBins)
  {
    computeEncoder = self->_computeEncoder;
    PrimitiveCountFromDescriptor = MTLProgressBinsGetPrimitiveCountFromDescriptor((MTLAccelerationStructureDescriptor *)a4);
    -[MTLComputeCommandEncoderSPI setSubstream:](computeEncoder, "setSubstream:", MTLProgressBinsSelectSubstreamWithPrimitiveCount((uint64_t)progressBins, 1, PrimitiveCountFromDescriptor));
    v16 = self->_progressBins;
    v17 = (void *)objc_msgSend(a3, "buffer");
    v18 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __147___MTLSWRaytracingAccelerationStructureCommandEncoder_refitAccelerationStructure_descriptor_destination_scratchBuffer_scratchBufferOffset_options___block_invoke;
    v29[3] = &unk_1E0FE3C70;
    v29[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v16, v17, 0, (uint64_t)v29);
    v19 = self->_progressBins;
    v28[0] = v18;
    v28[1] = 3221225472;
    v28[2] = __147___MTLSWRaytracingAccelerationStructureCommandEncoder_refitAccelerationStructure_descriptor_destination_scratchBuffer_scratchBufferOffset_options___block_invoke_2;
    v28[3] = &unk_1E0FE3C70;
    v28[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v19, (void *)objc_msgSend(a5, "buffer"), 1, (uint64_t)v28);
    v20 = self->_progressBins;
    v27[0] = v18;
    v27[1] = 3221225472;
    v27[2] = __147___MTLSWRaytracingAccelerationStructureCommandEncoder_refitAccelerationStructure_descriptor_destination_scratchBuffer_scratchBufferOffset_options___block_invoke_3;
    v27[3] = &unk_1E0FE3C70;
    v27[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v20, a6, 1, (uint64_t)v27);
    v12 = -[_MTLSWRaytracingAccelerationStructureCommandEncoder substreamSynchronizeDescriptor:access:](self, "substreamSynchronizeDescriptor:access:", a4, 0);
  }
  context = (void *)MEMORY[0x186DAC640](v12);
  objc_msgSend((id)-[MTLDevice GPUBVHBuilder](self->_device, "GPUBVHBuilder"), "refitMTLSWBVHWithEncoder:descriptor:bvhDescriptor:sourceBuffer:sourceBufferOffset:destinationBuffer:destinationBufferOffset:destinationMTLResourceID:destinationAccelerationStructureUniqueIdentifier:scratchBuffer:scratchBufferOffset:options:", self->_computeEncoder, a4, MTLBVHDescriptorForMTLAccelerationStructureDescriptor(a4), objc_msgSend(a3, "buffer"), objc_msgSend(a3, "bufferOffset"), objc_msgSend(a5, "buffer"), objc_msgSend(a5, "bufferOffset"), objc_msgSend(a5, "gpuResourceID"), objc_msgSend(a5, "accelerationStructureUniqueIdentifier"), a6, a7, a8);
  objc_autoreleasePoolPop(context);
  v21 = self->_progressBins;
  if (v21)
  {
    v22 = MTLProgressBinsUpdate((uint64_t)v21);
    if ((v22 & 0x80000000) == 0 && !self->_virtualSubstreamsEnabled)
      -[MTLComputeCommandEncoderSPI signalProgress:](self->_computeEncoder, "signalProgress:", v22);
  }
}

- (void)writeSerializedAccelerationStructureSize:(id)a3 toBuffer:(id)a4 sizeBufferOffset:(unint64_t)a5
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *progressBins;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v10;
  void *v11;
  uint64_t v12;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v13;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v14;
  uint64_t v15;
  _QWORD v16[5];
  _QWORD v17[5];

  -[_MTLSWRaytracingAccelerationStructureCommandEncoder beginBVHSubstream](self, "beginBVHSubstream");
  progressBins = self->_progressBins;
  if (progressBins)
  {
    -[MTLComputeCommandEncoderSPI setSubstream:](self->_computeEncoder, "setSubstream:", MTLProgressBinsSelectSubstreamWithBufferWriteSize((uint64_t)progressBins, 8uLL));
    v10 = self->_progressBins;
    v11 = (void *)objc_msgSend(a3, "buffer");
    v12 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __122___MTLSWRaytracingAccelerationStructureCommandEncoder_writeSerializedAccelerationStructureSize_toBuffer_sizeBufferOffset___block_invoke;
    v17[3] = &unk_1E0FE3C70;
    v17[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v10, v11, 0, (uint64_t)v17);
    v13 = self->_progressBins;
    v16[0] = v12;
    v16[1] = 3221225472;
    v16[2] = __122___MTLSWRaytracingAccelerationStructureCommandEncoder_writeSerializedAccelerationStructureSize_toBuffer_sizeBufferOffset___block_invoke_2;
    v16[3] = &unk_1E0FE3C70;
    v16[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v13, a4, 1, (uint64_t)v16);
  }
  objc_msgSend((id)-[MTLDevice GPUBVHBuilder](self->_device, "GPUBVHBuilder"), "writeSerializedMTLSWBVHSizeWithEncoder:BVHBuffer:BVHBufferOffset:toBuffer:sizeBufferOffset:", self->_computeEncoder, objc_msgSend(a3, "buffer"), objc_msgSend(a3, "bufferOffset"), a4, a5);
  v14 = self->_progressBins;
  if (v14)
  {
    v15 = MTLProgressBinsUpdate((uint64_t)v14);
    if ((v15 & 0x80000000) == 0 && !self->_virtualSubstreamsEnabled)
      -[MTLComputeCommandEncoderSPI signalProgress:](self->_computeEncoder, "signalProgress:", v15);
  }
}

- (void)writeDeserializedAccelerationStructureSize:(id)a3 serializedOffset:(unint64_t)a4 toBuffer:(id)a5 sizeBufferOffset:(unint64_t)a6
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *progressBins;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v12;
  uint64_t v13;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v14;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v15;
  uint64_t v16;
  _QWORD v17[5];
  _QWORD v18[5];

  -[_MTLSWRaytracingAccelerationStructureCommandEncoder beginBVHSubstream](self, "beginBVHSubstream");
  progressBins = self->_progressBins;
  if (progressBins)
  {
    -[MTLComputeCommandEncoderSPI setSubstream:](self->_computeEncoder, "setSubstream:", MTLProgressBinsSelectSubstreamWithBufferWriteSize((uint64_t)progressBins, 8uLL));
    v12 = self->_progressBins;
    v13 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __141___MTLSWRaytracingAccelerationStructureCommandEncoder_writeDeserializedAccelerationStructureSize_serializedOffset_toBuffer_sizeBufferOffset___block_invoke;
    v18[3] = &unk_1E0FE3C70;
    v18[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v12, a3, 0, (uint64_t)v18);
    v14 = self->_progressBins;
    v17[0] = v13;
    v17[1] = 3221225472;
    v17[2] = __141___MTLSWRaytracingAccelerationStructureCommandEncoder_writeDeserializedAccelerationStructureSize_serializedOffset_toBuffer_sizeBufferOffset___block_invoke_2;
    v17[3] = &unk_1E0FE3C70;
    v17[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v14, a5, 1, (uint64_t)v17);
  }
  objc_msgSend((id)-[MTLDevice GPUBVHBuilder](self->_device, "GPUBVHBuilder"), "writeDeserializedMTLSWBVHSizeWithEncoder:serializedBuffer:serializedBufferOffset:toBuffer:sizeBufferOffset:", self->_computeEncoder, a3, a4, a5, a6);
  v15 = self->_progressBins;
  if (v15)
  {
    v16 = MTLProgressBinsUpdate((uint64_t)v15);
    if ((v16 & 0x80000000) == 0 && !self->_virtualSubstreamsEnabled)
      -[MTLComputeCommandEncoderSPI signalProgress:](self->_computeEncoder, "signalProgress:", v16);
  }
}

- (void)writeDeserializedPrimitiveAccelerationStructureSizes:(id)a3 serializedOffset:(unint64_t)a4 toBuffer:(id)a5 sizesBufferOffset:(unint64_t)a6
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *progressBins;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v12;
  uint64_t v13;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v14;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v15;
  uint64_t v16;
  _QWORD v17[5];
  _QWORD v18[5];

  -[_MTLSWRaytracingAccelerationStructureCommandEncoder beginBVHSubstream](self, "beginBVHSubstream");
  progressBins = self->_progressBins;
  if (progressBins)
  {
    -[MTLComputeCommandEncoderSPI setSubstream:](self->_computeEncoder, "setSubstream:", MTLProgressBinsSelectSubstreamWithBufferWriteSize((uint64_t)progressBins, 8uLL));
    v12 = self->_progressBins;
    v13 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __152___MTLSWRaytracingAccelerationStructureCommandEncoder_writeDeserializedPrimitiveAccelerationStructureSizes_serializedOffset_toBuffer_sizesBufferOffset___block_invoke;
    v18[3] = &unk_1E0FE3C70;
    v18[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v12, a3, 0, (uint64_t)v18);
    v14 = self->_progressBins;
    v17[0] = v13;
    v17[1] = 3221225472;
    v17[2] = __152___MTLSWRaytracingAccelerationStructureCommandEncoder_writeDeserializedPrimitiveAccelerationStructureSizes_serializedOffset_toBuffer_sizesBufferOffset___block_invoke_2;
    v17[3] = &unk_1E0FE3C70;
    v17[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v14, a5, 1, (uint64_t)v17);
  }
  objc_msgSend((id)-[MTLDevice GPUBVHBuilder](self->_device, "GPUBVHBuilder"), "writeDeserializedMTLSWPrimitiveBVHSizesWithEncoder:serializedBuffer:serializedBufferOffset:toBuffer:sizesBufferOffset:", self->_computeEncoder, a3, a4, a5, a6);
  v15 = self->_progressBins;
  if (v15)
  {
    v16 = MTLProgressBinsUpdate((uint64_t)v15);
    if ((v16 & 0x80000000) == 0 && !self->_virtualSubstreamsEnabled)
      -[MTLComputeCommandEncoderSPI signalProgress:](self->_computeEncoder, "signalProgress:", v16);
  }
}

- (void)serializePrimitiveAccelerationStructure:(id)a3 toBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *progressBins;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v10;
  void *v11;
  uint64_t v12;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v13;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v14;
  uint64_t v15;
  _QWORD v16[5];
  _QWORD v17[5];

  -[_MTLSWRaytracingAccelerationStructureCommandEncoder beginBVHSubstream](self, "beginBVHSubstream");
  progressBins = self->_progressBins;
  if (progressBins)
  {
    -[MTLComputeCommandEncoderSPI setSubstream:](self->_computeEncoder, "setSubstream:", MTLProgressBinsSelectSubstreamWithBufferWriteSize((uint64_t)progressBins, objc_msgSend(a3, "size")));
    v10 = self->_progressBins;
    v11 = (void *)objc_msgSend(a3, "buffer");
    v12 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __127___MTLSWRaytracingAccelerationStructureCommandEncoder_serializePrimitiveAccelerationStructure_toBuffer_serializedBufferOffset___block_invoke;
    v17[3] = &unk_1E0FE3C70;
    v17[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v10, v11, 0, (uint64_t)v17);
    v13 = self->_progressBins;
    v16[0] = v12;
    v16[1] = 3221225472;
    v16[2] = __127___MTLSWRaytracingAccelerationStructureCommandEncoder_serializePrimitiveAccelerationStructure_toBuffer_serializedBufferOffset___block_invoke_2;
    v16[3] = &unk_1E0FE3C70;
    v16[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v13, a4, 1, (uint64_t)v16);
  }
  objc_msgSend((id)-[MTLDevice GPUBVHBuilder](self->_device, "GPUBVHBuilder"), "writeSerializedMTLSWBVHWithEncoder:BVHBuffer:BVHBufferOffset:primitiveAccelerationStructures:toBuffer:serializedBufferOffset:", self->_computeEncoder, objc_msgSend(a3, "buffer"), objc_msgSend(a3, "bufferOffset"), 0, a4, a5);
  v14 = self->_progressBins;
  if (v14)
  {
    v15 = MTLProgressBinsUpdate((uint64_t)v14);
    if ((v15 & 0x80000000) == 0 && !self->_virtualSubstreamsEnabled)
      -[MTLComputeCommandEncoderSPI signalProgress:](self->_computeEncoder, "signalProgress:", v15);
  }
}

- (void)serializeInstanceAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 toBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *progressBins;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v12;
  void *v13;
  uint64_t v14;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v15;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v16;
  uint64_t v17;
  _QWORD v18[5];
  _QWORD v19[5];

  -[_MTLSWRaytracingAccelerationStructureCommandEncoder beginBVHSubstream](self, "beginBVHSubstream");
  progressBins = self->_progressBins;
  if (progressBins)
  {
    -[MTLComputeCommandEncoderSPI setSubstream:](self->_computeEncoder, "setSubstream:", MTLProgressBinsSelectSubstreamWithBufferWriteSize((uint64_t)progressBins, objc_msgSend(a3, "size")));
    v12 = self->_progressBins;
    v13 = (void *)objc_msgSend(a3, "buffer");
    v14 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __158___MTLSWRaytracingAccelerationStructureCommandEncoder_serializeInstanceAccelerationStructure_primitiveAccelerationStructures_toBuffer_serializedBufferOffset___block_invoke;
    v19[3] = &unk_1E0FE3C70;
    v19[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v12, v13, 0, (uint64_t)v19);
    -[_MTLSWRaytracingAccelerationStructureCommandEncoder substreamSynchronizeAccelerationStructures:access:](self, "substreamSynchronizeAccelerationStructures:access:", a4, 0);
    v15 = self->_progressBins;
    v18[0] = v14;
    v18[1] = 3221225472;
    v18[2] = __158___MTLSWRaytracingAccelerationStructureCommandEncoder_serializeInstanceAccelerationStructure_primitiveAccelerationStructures_toBuffer_serializedBufferOffset___block_invoke_2;
    v18[3] = &unk_1E0FE3C70;
    v18[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v15, a5, 1, (uint64_t)v18);
  }
  objc_msgSend((id)-[MTLDevice GPUBVHBuilder](self->_device, "GPUBVHBuilder"), "writeSerializedMTLSWBVHWithEncoder:BVHBuffer:BVHBufferOffset:primitiveAccelerationStructures:toBuffer:serializedBufferOffset:", self->_computeEncoder, objc_msgSend(a3, "buffer"), objc_msgSend(a3, "bufferOffset"), a4, a5, a6);
  v16 = self->_progressBins;
  if (v16)
  {
    v17 = MTLProgressBinsUpdate((uint64_t)v16);
    if ((v17 & 0x80000000) == 0 && !self->_virtualSubstreamsEnabled)
      -[MTLComputeCommandEncoderSPI signalProgress:](self->_computeEncoder, "signalProgress:", v17);
  }
}

- (void)deserializePrimitiveAccelerationStructure:(id)a3 fromBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *progressBins;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v10;
  void *v11;
  uint64_t v12;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v13;
  void *v14;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v15;
  uint64_t v16;
  _QWORD v17[5];
  _QWORD v18[5];

  -[_MTLSWRaytracingAccelerationStructureCommandEncoder beginBVHSubstream](self, "beginBVHSubstream");
  progressBins = self->_progressBins;
  if (progressBins)
  {
    -[MTLComputeCommandEncoderSPI setSubstream:](self->_computeEncoder, "setSubstream:", MTLProgressBinsSelectSubstreamWithBufferWriteSize((uint64_t)progressBins, objc_msgSend(a3, "size")));
    v10 = self->_progressBins;
    v11 = (void *)objc_msgSend(a3, "buffer");
    v12 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __131___MTLSWRaytracingAccelerationStructureCommandEncoder_deserializePrimitiveAccelerationStructure_fromBuffer_serializedBufferOffset___block_invoke;
    v18[3] = &unk_1E0FE3C70;
    v18[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v10, v11, 1, (uint64_t)v18);
    v13 = self->_progressBins;
    v17[0] = v12;
    v17[1] = 3221225472;
    v17[2] = __131___MTLSWRaytracingAccelerationStructureCommandEncoder_deserializePrimitiveAccelerationStructure_fromBuffer_serializedBufferOffset___block_invoke_2;
    v17[3] = &unk_1E0FE3C70;
    v17[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v13, a4, 0, (uint64_t)v17);
  }
  v14 = (void *)objc_opt_new();
  -[_MTLSWRaytracingAccelerationStructureCommandEncoder deserializePrimitiveAccelerationStructure:fromBuffer:serializedBufferOffset:withDescriptor:](self, "deserializePrimitiveAccelerationStructure:fromBuffer:serializedBufferOffset:withDescriptor:", a3, a4, a5, v14);

  v15 = self->_progressBins;
  if (v15)
  {
    v16 = MTLProgressBinsUpdate((uint64_t)v15);
    if ((v16 & 0x80000000) == 0 && !self->_virtualSubstreamsEnabled)
      -[MTLComputeCommandEncoderSPI signalProgress:](self->_computeEncoder, "signalProgress:", v16);
  }
}

- (void)deserializeInstanceAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 fromBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *progressBins;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v12;
  void *v13;
  uint64_t v14;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v15;
  void *v16;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v17;
  uint64_t v18;
  _QWORD v19[5];
  _QWORD v20[5];

  -[_MTLSWRaytracingAccelerationStructureCommandEncoder beginBVHSubstream](self, "beginBVHSubstream");
  progressBins = self->_progressBins;
  if (progressBins)
  {
    -[MTLComputeCommandEncoderSPI setSubstream:](self->_computeEncoder, "setSubstream:", MTLProgressBinsSelectSubstreamWithBufferWriteSize((uint64_t)progressBins, objc_msgSend(a3, "size")));
    v12 = self->_progressBins;
    v13 = (void *)objc_msgSend(a3, "buffer");
    v14 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __162___MTLSWRaytracingAccelerationStructureCommandEncoder_deserializeInstanceAccelerationStructure_primitiveAccelerationStructures_fromBuffer_serializedBufferOffset___block_invoke;
    v20[3] = &unk_1E0FE3C70;
    v20[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v12, v13, 1, (uint64_t)v20);
    -[_MTLSWRaytracingAccelerationStructureCommandEncoder substreamSynchronizeAccelerationStructures:access:](self, "substreamSynchronizeAccelerationStructures:access:", a4, 0);
    v15 = self->_progressBins;
    v19[0] = v14;
    v19[1] = 3221225472;
    v19[2] = __162___MTLSWRaytracingAccelerationStructureCommandEncoder_deserializeInstanceAccelerationStructure_primitiveAccelerationStructures_fromBuffer_serializedBufferOffset___block_invoke_2;
    v19[3] = &unk_1E0FE3C70;
    v19[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v15, a5, 0, (uint64_t)v19);
  }
  v16 = (void *)objc_opt_new();
  -[_MTLSWRaytracingAccelerationStructureCommandEncoder deserializeInstanceAccelerationStructure:primitiveAccelerationStructures:fromBuffer:serializedBufferOffset:withDescriptor:](self, "deserializeInstanceAccelerationStructure:primitiveAccelerationStructures:fromBuffer:serializedBufferOffset:withDescriptor:", a3, a4, a5, a6, v16);

  v17 = self->_progressBins;
  if (v17)
  {
    v18 = MTLProgressBinsUpdate((uint64_t)v17);
    if ((v18 & 0x80000000) == 0 && !self->_virtualSubstreamsEnabled)
      -[MTLComputeCommandEncoderSPI signalProgress:](self->_computeEncoder, "signalProgress:", v18);
  }
}

- (void)deserializePrimitiveAccelerationStructure:(id)a3 fromBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5 withDescriptor:(id)a6
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *progressBins;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v10;
  void *v11;
  uint64_t v12;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v13;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v14;
  uint64_t v15;
  _QWORD v17[5];
  _QWORD v18[5];

  -[_MTLSWRaytracingAccelerationStructureCommandEncoder beginBVHSubstream](self, "beginBVHSubstream", a3, a4, a5, a6);
  progressBins = self->_progressBins;
  if (progressBins)
  {
    -[MTLComputeCommandEncoderSPI setSubstream:](self->_computeEncoder, "setSubstream:", MTLProgressBinsSelectSubstreamWithBufferWriteSize((uint64_t)progressBins, objc_msgSend(a3, "size")));
    v10 = self->_progressBins;
    v11 = (void *)objc_msgSend(a3, "buffer");
    v12 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __146___MTLSWRaytracingAccelerationStructureCommandEncoder_deserializePrimitiveAccelerationStructure_fromBuffer_serializedBufferOffset_withDescriptor___block_invoke;
    v18[3] = &unk_1E0FE3C70;
    v18[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v10, v11, 1, (uint64_t)v18);
    v13 = self->_progressBins;
    v17[0] = v12;
    v17[1] = 3221225472;
    v17[2] = __146___MTLSWRaytracingAccelerationStructureCommandEncoder_deserializePrimitiveAccelerationStructure_fromBuffer_serializedBufferOffset_withDescriptor___block_invoke_2;
    v17[3] = &unk_1E0FE3C70;
    v17[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v13, a4, 0, (uint64_t)v17);
  }
  objc_msgSend((id)-[MTLDevice GPUBVHBuilder](self->_device, "GPUBVHBuilder"), "writeDeserializedMTLSWBVHWithEncoder:BVHBuffer:BVHBufferOffset:primitiveAccelerationStructures:fromBuffer:serializedBufferOffset:accelerationStructureMTLResourceID:accelerationStructureUniqueIdentifier:", self->_computeEncoder, objc_msgSend(a3, "buffer"), objc_msgSend(a3, "bufferOffset"), 0, a4, a5, objc_msgSend(a3, "gpuResourceID"), objc_msgSend(a3, "accelerationStructureUniqueIdentifier"));
  v14 = self->_progressBins;
  if (v14)
  {
    v15 = MTLProgressBinsUpdate((uint64_t)v14);
    if ((v15 & 0x80000000) == 0 && !self->_virtualSubstreamsEnabled)
      -[MTLComputeCommandEncoderSPI signalProgress:](self->_computeEncoder, "signalProgress:", v15);
  }
}

- (void)deserializeInstanceAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 fromBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6 withDescriptor:(id)a7
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *progressBins;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v12;
  void *v13;
  uint64_t v14;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v15;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v16;
  uint64_t v17;
  _QWORD v19[5];
  _QWORD v20[5];

  -[_MTLSWRaytracingAccelerationStructureCommandEncoder beginBVHSubstream](self, "beginBVHSubstream", a3, a4, a5, a6, a7);
  progressBins = self->_progressBins;
  if (progressBins)
  {
    -[MTLComputeCommandEncoderSPI setSubstream:](self->_computeEncoder, "setSubstream:", MTLProgressBinsSelectSubstreamWithBufferWriteSize((uint64_t)progressBins, objc_msgSend(a3, "size")));
    v12 = self->_progressBins;
    v13 = (void *)objc_msgSend(a3, "buffer");
    v14 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __177___MTLSWRaytracingAccelerationStructureCommandEncoder_deserializeInstanceAccelerationStructure_primitiveAccelerationStructures_fromBuffer_serializedBufferOffset_withDescriptor___block_invoke;
    v20[3] = &unk_1E0FE3C70;
    v20[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v12, v13, 1, (uint64_t)v20);
    -[_MTLSWRaytracingAccelerationStructureCommandEncoder substreamSynchronizeAccelerationStructures:access:](self, "substreamSynchronizeAccelerationStructures:access:", a4, 0);
    v15 = self->_progressBins;
    v19[0] = v14;
    v19[1] = 3221225472;
    v19[2] = __177___MTLSWRaytracingAccelerationStructureCommandEncoder_deserializeInstanceAccelerationStructure_primitiveAccelerationStructures_fromBuffer_serializedBufferOffset_withDescriptor___block_invoke_2;
    v19[3] = &unk_1E0FE3C70;
    v19[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v15, a5, 0, (uint64_t)v19);
  }
  objc_msgSend((id)-[MTLDevice GPUBVHBuilder](self->_device, "GPUBVHBuilder"), "writeDeserializedMTLSWBVHWithEncoder:BVHBuffer:BVHBufferOffset:primitiveAccelerationStructures:fromBuffer:serializedBufferOffset:accelerationStructureMTLResourceID:accelerationStructureUniqueIdentifier:", self->_computeEncoder, objc_msgSend(a3, "buffer"), objc_msgSend(a3, "bufferOffset"), a4, a5, a6, objc_msgSend(a3, "gpuResourceID"), objc_msgSend(a3, "accelerationStructureUniqueIdentifier"));
  v16 = self->_progressBins;
  if (v16)
  {
    v17 = MTLProgressBinsUpdate((uint64_t)v16);
    if ((v17 & 0x80000000) == 0 && !self->_virtualSubstreamsEnabled)
      -[MTLComputeCommandEncoderSPI signalProgress:](self->_computeEncoder, "signalProgress:", v17);
  }
}

- (void)serializeAccelerationStructure:(id)a3 toBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5
{
  -[_MTLSWRaytracingAccelerationStructureCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
}

- (void)deserializeAccelerationStructure:(id)a3 fromBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5
{
  -[_MTLSWRaytracingAccelerationStructureCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
}

- (void)deserializeAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 fromBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6
{
  -[_MTLSWRaytracingAccelerationStructureCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5, a6);
}

- (void)writeGeometrySizeOfAccelerationStructure:(id)a3 toBuffer:(id)a4 sizeBufferOffset:(unint64_t)a5
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *progressBins;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v10;
  void *v11;
  uint64_t v12;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v13;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v14;
  uint64_t v15;
  _QWORD v16[5];
  _QWORD v17[5];

  -[_MTLSWRaytracingAccelerationStructureCommandEncoder beginBVHSubstream](self, "beginBVHSubstream");
  progressBins = self->_progressBins;
  if (progressBins)
  {
    -[MTLComputeCommandEncoderSPI setSubstream:](self->_computeEncoder, "setSubstream:", MTLProgressBinsSelectSubstreamWithBufferWriteSize((uint64_t)progressBins, objc_msgSend(a3, "size")));
    v10 = self->_progressBins;
    v11 = (void *)objc_msgSend(a3, "buffer");
    v12 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __122___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGeometrySizeOfAccelerationStructure_toBuffer_sizeBufferOffset___block_invoke;
    v17[3] = &unk_1E0FE3C70;
    v17[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v10, v11, 0, (uint64_t)v17);
    v13 = self->_progressBins;
    v16[0] = v12;
    v16[1] = 3221225472;
    v16[2] = __122___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGeometrySizeOfAccelerationStructure_toBuffer_sizeBufferOffset___block_invoke_2;
    v16[3] = &unk_1E0FE3C70;
    v16[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v13, a4, 1, (uint64_t)v16);
  }
  objc_msgSend((id)-[MTLDevice GPUBVHBuilder](self->_device, "GPUBVHBuilder"), "writeSerializedGeometrySizeWithEncoder:BVHBuffer:BVHBufferOffset:toBuffer:sizeBufferOffset:", self->_computeEncoder, objc_msgSend(a3, "buffer"), objc_msgSend(a3, "bufferOffset"), a4, a5);
  v14 = self->_progressBins;
  if (v14)
  {
    v15 = MTLProgressBinsUpdate((uint64_t)v14);
    if ((v15 & 0x80000000) == 0 && !self->_virtualSubstreamsEnabled)
      -[MTLComputeCommandEncoderSPI signalProgress:](self->_computeEncoder, "signalProgress:", v15);
  }
}

- (void)writeGeometryOfAccelerationStructure:(id)a3 toBuffer:(id)a4 geometryBufferOffset:(unint64_t)a5
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *progressBins;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v10;
  void *v11;
  uint64_t v12;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v13;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v14;
  uint64_t v15;
  _QWORD v16[5];
  _QWORD v17[5];

  -[_MTLSWRaytracingAccelerationStructureCommandEncoder beginBVHSubstream](self, "beginBVHSubstream");
  progressBins = self->_progressBins;
  if (progressBins)
  {
    -[MTLComputeCommandEncoderSPI setSubstream:](self->_computeEncoder, "setSubstream:", MTLProgressBinsSelectSubstreamWithBufferWriteSize((uint64_t)progressBins, objc_msgSend(a3, "size")));
    v10 = self->_progressBins;
    v11 = (void *)objc_msgSend(a3, "buffer");
    v12 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __122___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGeometryOfAccelerationStructure_toBuffer_geometryBufferOffset___block_invoke;
    v17[3] = &unk_1E0FE3C70;
    v17[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v10, v11, 0, (uint64_t)v17);
    v13 = self->_progressBins;
    v16[0] = v12;
    v16[1] = 3221225472;
    v16[2] = __122___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGeometryOfAccelerationStructure_toBuffer_geometryBufferOffset___block_invoke_2;
    v16[3] = &unk_1E0FE3C70;
    v16[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v13, a4, 1, (uint64_t)v16);
  }
  objc_msgSend((id)-[MTLDevice GPUBVHBuilder](self->_device, "GPUBVHBuilder"), "writeSerializedGeometryWithEncoder:BVHBuffer:BVHBufferOffset:toBuffer:geometryBufferOffset:", self->_computeEncoder, objc_msgSend(a3, "buffer"), objc_msgSend(a3, "bufferOffset"), a4, a5);
  v14 = self->_progressBins;
  if (v14)
  {
    v15 = MTLProgressBinsUpdate((uint64_t)v14);
    if ((v15 & 0x80000000) == 0 && !self->_virtualSubstreamsEnabled)
      -[MTLComputeCommandEncoderSPI signalProgress:](self->_computeEncoder, "signalProgress:", v15);
  }
}

- (BOOL)writeGenericBVHStructureSizesOfAccelerationStructure:(id)a3 into:(id)a4
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *progressBins;
  uint64_t v8;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v9;
  uint64_t v10;
  char v11;
  MTLCommandBuffer *commandBuffer;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v13;
  uint64_t v14;
  _QWORD v16[6];
  _QWORD v17[5];

  if (!a4)
    return 0;
  -[_MTLSWRaytracingAccelerationStructureCommandEncoder beginBVHSubstream](self, "beginBVHSubstream");
  progressBins = self->_progressBins;
  v8 = MEMORY[0x1E0C809B0];
  if (progressBins)
  {
    -[MTLComputeCommandEncoderSPI setSubstream:](self->_computeEncoder, "setSubstream:", MTLProgressBinsSelectSubstreamWithBufferWriteSize((uint64_t)progressBins, 0x40uLL));
    v9 = self->_progressBins;
    v17[0] = v8;
    v17[1] = 3221225472;
    v17[2] = __113___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGenericBVHStructureSizesOfAccelerationStructure_into___block_invoke;
    v17[3] = &unk_1E0FE3C70;
    v17[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v9, (void *)objc_msgSend(a3, "buffer"), 0, (uint64_t)v17);
  }
  v10 = -[MTLDevice newBufferWithLength:options:](self->_device, "newBufferWithLength:options:", 64, 0);
  v11 = objc_msgSend((id)-[MTLDevice GPUBVHBuilder](self->_device, "GPUBVHBuilder"), "writeGenericBVHStructureSizesWithEncoder:version:BVHBuffer:BVHBufferOffset:toBuffer:sizesBufferOffset:", self->_computeEncoder, objc_msgSend(a4, "version"), objc_msgSend(a3, "buffer"), objc_msgSend(a3, "bufferOffset"), v10, 0);
  commandBuffer = self->_commandBuffer;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __113___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGenericBVHStructureSizesOfAccelerationStructure_into___block_invoke_2;
  v16[3] = &unk_1E0FE3C98;
  v16[4] = v10;
  v16[5] = a4;
  -[MTLCommandBuffer addCompletedHandler:](commandBuffer, "addCompletedHandler:", v16);
  v13 = self->_progressBins;
  if (v13)
  {
    v14 = MTLProgressBinsUpdate((uint64_t)v13);
    if ((v14 & 0x80000000) == 0 && !self->_virtualSubstreamsEnabled)
      -[MTLComputeCommandEncoderSPI signalProgress:](self->_computeEncoder, "signalProgress:", v14);
  }
  return v11;
}

- (BOOL)isSupportedVersion:(unint64_t)a3
{
  return a3 - 256 < 5;
}

- (BOOL)writeGenericBVHStructureOfAccelerationStructure:(id)a3 into:(id)a4
{
  id v4;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *progressBins;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v8;
  void *v9;
  uint64_t v10;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v11;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v12;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v13;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v14;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v15;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v16;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v17;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v18;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v19;
  uint64_t v20;
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD v29[5];
  _QWORD v30[5];

  v4 = a4;
  if (a4)
  {
    if (-[_MTLSWRaytracingAccelerationStructureCommandEncoder isSupportedVersion:](self, "isSupportedVersion:", objc_msgSend(a4, "version")))
    {
      -[_MTLSWRaytracingAccelerationStructureCommandEncoder beginBVHSubstream](self, "beginBVHSubstream");
      progressBins = self->_progressBins;
      if (progressBins)
      {
        -[MTLComputeCommandEncoderSPI setSubstream:](self->_computeEncoder, "setSubstream:", MTLProgressBinsSelectSubstreamWithBufferWriteSize((uint64_t)progressBins, objc_msgSend(a3, "size")));
        v8 = self->_progressBins;
        v9 = (void *)objc_msgSend(a3, "buffer");
        v10 = MEMORY[0x1E0C809B0];
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __108___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGenericBVHStructureOfAccelerationStructure_into___block_invoke;
        v30[3] = &unk_1E0FE3C70;
        v30[4] = self;
        MTLProgressBinsSynchronizeBufferAccess((uint64_t)v8, v9, 0, (uint64_t)v30);
        v11 = self->_progressBins;
        v29[0] = v10;
        v29[1] = 3221225472;
        v29[2] = __108___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGenericBVHStructureOfAccelerationStructure_into___block_invoke_2;
        v29[3] = &unk_1E0FE3C70;
        v29[4] = self;
        MTLProgressBinsSynchronizeBufferAccess((uint64_t)v11, (void *)objc_msgSend(v4, "headerBuffer"), 1, (uint64_t)v29);
        if (objc_msgSend(v4, "innerNodeBuffer"))
        {
          v12 = self->_progressBins;
          v28[0] = v10;
          v28[1] = 3221225472;
          v28[2] = __108___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGenericBVHStructureOfAccelerationStructure_into___block_invoke_3;
          v28[3] = &unk_1E0FE3C70;
          v28[4] = self;
          MTLProgressBinsSynchronizeBufferAccess((uint64_t)v12, (void *)objc_msgSend(v4, "innerNodeBuffer"), 1, (uint64_t)v28);
        }
        if (objc_msgSend(v4, "leafNodeBuffer"))
        {
          v13 = self->_progressBins;
          v27[0] = v10;
          v27[1] = 3221225472;
          v27[2] = __108___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGenericBVHStructureOfAccelerationStructure_into___block_invoke_4;
          v27[3] = &unk_1E0FE3C70;
          v27[4] = self;
          MTLProgressBinsSynchronizeBufferAccess((uint64_t)v13, (void *)objc_msgSend(v4, "leafNodeBuffer"), 1, (uint64_t)v27);
        }
        if (objc_msgSend(v4, "primitiveBuffer"))
        {
          v14 = self->_progressBins;
          v26[0] = v10;
          v26[1] = 3221225472;
          v26[2] = __108___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGenericBVHStructureOfAccelerationStructure_into___block_invoke_5;
          v26[3] = &unk_1E0FE3C70;
          v26[4] = self;
          MTLProgressBinsSynchronizeBufferAccess((uint64_t)v14, (void *)objc_msgSend(v4, "primitiveBuffer"), 1, (uint64_t)v26);
        }
        if (objc_msgSend(v4, "geometryBuffer"))
        {
          v15 = self->_progressBins;
          v25[0] = v10;
          v25[1] = 3221225472;
          v25[2] = __108___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGenericBVHStructureOfAccelerationStructure_into___block_invoke_6;
          v25[3] = &unk_1E0FE3C70;
          v25[4] = self;
          MTLProgressBinsSynchronizeBufferAccess((uint64_t)v15, (void *)objc_msgSend(v4, "geometryBuffer"), 1, (uint64_t)v25);
        }
        if (objc_msgSend(v4, "instanceTransformBuffer"))
        {
          v16 = self->_progressBins;
          v24[0] = v10;
          v24[1] = 3221225472;
          v24[2] = __108___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGenericBVHStructureOfAccelerationStructure_into___block_invoke_7;
          v24[3] = &unk_1E0FE3C70;
          v24[4] = self;
          MTLProgressBinsSynchronizeBufferAccess((uint64_t)v16, (void *)objc_msgSend(v4, "instanceTransformBuffer"), 1, (uint64_t)v24);
        }
        if (objc_msgSend(v4, "perPrimitiveDataBuffer"))
        {
          v17 = self->_progressBins;
          v23[0] = v10;
          v23[1] = 3221225472;
          v23[2] = __108___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGenericBVHStructureOfAccelerationStructure_into___block_invoke_8;
          v23[3] = &unk_1E0FE3C70;
          v23[4] = self;
          MTLProgressBinsSynchronizeBufferAccess((uint64_t)v17, (void *)objc_msgSend(v4, "perPrimitiveDataBuffer"), 1, (uint64_t)v23);
        }
        if (objc_msgSend(v4, "controlPointBuffer"))
        {
          v18 = self->_progressBins;
          v22[0] = v10;
          v22[1] = 3221225472;
          v22[2] = __108___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGenericBVHStructureOfAccelerationStructure_into___block_invoke_9;
          v22[3] = &unk_1E0FE3C70;
          v22[4] = self;
          MTLProgressBinsSynchronizeBufferAccess((uint64_t)v18, (void *)objc_msgSend(v4, "controlPointBuffer"), 1, (uint64_t)v22);
        }
      }
      LOBYTE(v4) = objc_msgSend((id)-[MTLDevice GPUBVHBuilder](self->_device, "GPUBVHBuilder"), "writeGenericBVHStructureWithEncoder:BVHBuffer:BVHBufferOffset:into:", self->_computeEncoder, objc_msgSend(a3, "buffer"), objc_msgSend(a3, "bufferOffset"), v4);
      v19 = self->_progressBins;
      if (v19)
      {
        v20 = MTLProgressBinsUpdate((uint64_t)v19);
        if ((v20 & 0x80000000) == 0 && !self->_virtualSubstreamsEnabled)
          -[MTLComputeCommandEncoderSPI signalProgress:](self->_computeEncoder, "signalProgress:", v20);
      }
    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }
  return (char)v4;
}

- (void)writeGenericBVHStructureSizesOfAccelerationStructure:(id)a3 toBuffer:(id)a4 sizesBufferOffset:(unint64_t)a5
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *progressBins;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v10;
  void *v11;
  uint64_t v12;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v13;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v14;
  uint64_t v15;
  _QWORD v16[5];
  _QWORD v17[5];

  -[_MTLSWRaytracingAccelerationStructureCommandEncoder beginBVHSubstream](self, "beginBVHSubstream");
  progressBins = self->_progressBins;
  if (progressBins)
  {
    -[MTLComputeCommandEncoderSPI setSubstream:](self->_computeEncoder, "setSubstream:", MTLProgressBinsSelectSubstreamWithBufferWriteSize((uint64_t)progressBins, 8uLL));
    v10 = self->_progressBins;
    v11 = (void *)objc_msgSend(a3, "buffer");
    v12 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __135___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGenericBVHStructureSizesOfAccelerationStructure_toBuffer_sizesBufferOffset___block_invoke;
    v17[3] = &unk_1E0FE3C70;
    v17[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v10, v11, 0, (uint64_t)v17);
    v13 = self->_progressBins;
    v16[0] = v12;
    v16[1] = 3221225472;
    v16[2] = __135___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGenericBVHStructureSizesOfAccelerationStructure_toBuffer_sizesBufferOffset___block_invoke_2;
    v16[3] = &unk_1E0FE3C70;
    v16[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v13, a4, 1, (uint64_t)v16);
  }
  objc_msgSend((id)-[MTLDevice GPUBVHBuilder](self->_device, "GPUBVHBuilder"), "writeGenericBVHStructureSizesWithEncoder:BVHBuffer:BVHBufferOffset:toBuffer:sizesBufferOffset:", self->_computeEncoder, objc_msgSend(a3, "buffer"), objc_msgSend(a3, "bufferOffset"), a4, a5);
  v14 = self->_progressBins;
  if (v14)
  {
    v15 = MTLProgressBinsUpdate((uint64_t)v14);
    if ((v15 & 0x80000000) == 0 && !self->_virtualSubstreamsEnabled)
      -[MTLComputeCommandEncoderSPI signalProgress:](self->_computeEncoder, "signalProgress:", v15);
  }
}

- (void)writeGenericBVHStructureOfAccelerationStructure:(id)a3 headerBuffer:(id)a4 headerBufferOffset:(unint64_t)a5 innerNodeBuffer:(id)a6 innerNodeBufferOffset:(unint64_t)a7 leafNodeBuffer:(id)a8 leafNodeBufferOffset:(unint64_t)a9 primitiveBuffer:(id)a10 primitiveBufferOffset:(unint64_t)a11 geometryBuffer:(id)a12 geometryOffset:(unint64_t)a13 instanceTransformBuffer:(id)a14 instanceTransformOffset:(unint64_t)a15 controlPointBuffer:(id)a16 controlPointBufferOffset:(unint64_t)a17
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *progressBins;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v23;
  void *v24;
  uint64_t v25;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v26;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v27;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v28;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v29;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v30;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v31;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v32;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v33;
  uint64_t v34;
  _QWORD v37[5];
  _QWORD v38[5];
  _QWORD v39[5];
  _QWORD v40[5];
  _QWORD v41[5];
  _QWORD v42[5];
  _QWORD v43[5];
  _QWORD v44[6];

  -[_MTLSWRaytracingAccelerationStructureCommandEncoder beginBVHSubstream](self, "beginBVHSubstream");
  progressBins = self->_progressBins;
  if (progressBins)
  {
    -[MTLComputeCommandEncoderSPI setSubstream:](self->_computeEncoder, "setSubstream:", MTLProgressBinsSelectSubstreamWithBufferWriteSize((uint64_t)progressBins, objc_msgSend(a3, "size")));
    v23 = self->_progressBins;
    v24 = (void *)objc_msgSend(a3, "buffer");
    v25 = MEMORY[0x1E0C809B0];
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __369___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGenericBVHStructureOfAccelerationStructure_headerBuffer_headerBufferOffset_innerNodeBuffer_innerNodeBufferOffset_leafNodeBuffer_leafNodeBufferOffset_primitiveBuffer_primitiveBufferOffset_geometryBuffer_geometryOffset_instanceTransformBuffer_instanceTransformOffset_controlPointBuffer_controlPointBufferOffset___block_invoke;
    v44[3] = &unk_1E0FE3C70;
    v44[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v23, v24, 0, (uint64_t)v44);
    v26 = self->_progressBins;
    v43[0] = v25;
    v43[1] = 3221225472;
    v43[2] = __369___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGenericBVHStructureOfAccelerationStructure_headerBuffer_headerBufferOffset_innerNodeBuffer_innerNodeBufferOffset_leafNodeBuffer_leafNodeBufferOffset_primitiveBuffer_primitiveBufferOffset_geometryBuffer_geometryOffset_instanceTransformBuffer_instanceTransformOffset_controlPointBuffer_controlPointBufferOffset___block_invoke_2;
    v43[3] = &unk_1E0FE3C70;
    v43[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v26, a4, 1, (uint64_t)v43);
    v27 = self->_progressBins;
    v42[0] = v25;
    v42[1] = 3221225472;
    v42[2] = __369___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGenericBVHStructureOfAccelerationStructure_headerBuffer_headerBufferOffset_innerNodeBuffer_innerNodeBufferOffset_leafNodeBuffer_leafNodeBufferOffset_primitiveBuffer_primitiveBufferOffset_geometryBuffer_geometryOffset_instanceTransformBuffer_instanceTransformOffset_controlPointBuffer_controlPointBufferOffset___block_invoke_3;
    v42[3] = &unk_1E0FE3C70;
    v42[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v27, a6, 1, (uint64_t)v42);
    v28 = self->_progressBins;
    v41[0] = v25;
    v41[1] = 3221225472;
    v41[2] = __369___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGenericBVHStructureOfAccelerationStructure_headerBuffer_headerBufferOffset_innerNodeBuffer_innerNodeBufferOffset_leafNodeBuffer_leafNodeBufferOffset_primitiveBuffer_primitiveBufferOffset_geometryBuffer_geometryOffset_instanceTransformBuffer_instanceTransformOffset_controlPointBuffer_controlPointBufferOffset___block_invoke_4;
    v41[3] = &unk_1E0FE3C70;
    v41[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v28, a8, 1, (uint64_t)v41);
    v29 = self->_progressBins;
    v40[0] = v25;
    v40[1] = 3221225472;
    v40[2] = __369___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGenericBVHStructureOfAccelerationStructure_headerBuffer_headerBufferOffset_innerNodeBuffer_innerNodeBufferOffset_leafNodeBuffer_leafNodeBufferOffset_primitiveBuffer_primitiveBufferOffset_geometryBuffer_geometryOffset_instanceTransformBuffer_instanceTransformOffset_controlPointBuffer_controlPointBufferOffset___block_invoke_5;
    v40[3] = &unk_1E0FE3C70;
    v40[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v29, a10, 1, (uint64_t)v40);
    v30 = self->_progressBins;
    v39[0] = v25;
    v39[1] = 3221225472;
    v39[2] = __369___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGenericBVHStructureOfAccelerationStructure_headerBuffer_headerBufferOffset_innerNodeBuffer_innerNodeBufferOffset_leafNodeBuffer_leafNodeBufferOffset_primitiveBuffer_primitiveBufferOffset_geometryBuffer_geometryOffset_instanceTransformBuffer_instanceTransformOffset_controlPointBuffer_controlPointBufferOffset___block_invoke_6;
    v39[3] = &unk_1E0FE3C70;
    v39[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v30, a12, 1, (uint64_t)v39);
    v31 = self->_progressBins;
    v38[0] = v25;
    v38[1] = 3221225472;
    v38[2] = __369___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGenericBVHStructureOfAccelerationStructure_headerBuffer_headerBufferOffset_innerNodeBuffer_innerNodeBufferOffset_leafNodeBuffer_leafNodeBufferOffset_primitiveBuffer_primitiveBufferOffset_geometryBuffer_geometryOffset_instanceTransformBuffer_instanceTransformOffset_controlPointBuffer_controlPointBufferOffset___block_invoke_7;
    v38[3] = &unk_1E0FE3C70;
    v38[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v31, a14, 1, (uint64_t)v38);
    v32 = self->_progressBins;
    v37[0] = v25;
    v37[1] = 3221225472;
    v37[2] = __369___MTLSWRaytracingAccelerationStructureCommandEncoder_writeGenericBVHStructureOfAccelerationStructure_headerBuffer_headerBufferOffset_innerNodeBuffer_innerNodeBufferOffset_leafNodeBuffer_leafNodeBufferOffset_primitiveBuffer_primitiveBufferOffset_geometryBuffer_geometryOffset_instanceTransformBuffer_instanceTransformOffset_controlPointBuffer_controlPointBufferOffset___block_invoke_8;
    v37[3] = &unk_1E0FE3C70;
    v37[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v32, a16, 1, (uint64_t)v37);
  }
  objc_msgSend((id)-[MTLDevice GPUBVHBuilder](self->_device, "GPUBVHBuilder"), "writeGenericBVHStructureWithEncoder:BVHBuffer:BVHBufferOffset:header:headerBufferOffset:innerNodes:innerNodeBufferOffset:leafNodes:leafNodeBufferOffset:primitives:primitiveBufferOffset:geometry:geometryOffset:instanceTransform:instanceTransformOffset:controlPoints:controlPointBufferOffset:", self->_computeEncoder, objc_msgSend(a3, "buffer"), objc_msgSend(a3, "bufferOffset"), a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15,
    a16,
    a17);
  v33 = self->_progressBins;
  if (v33)
  {
    v34 = MTLProgressBinsUpdate((uint64_t)v33);
    if ((v34 & 0x80000000) == 0 && !self->_virtualSubstreamsEnabled)
      -[MTLComputeCommandEncoderSPI signalProgress:](self->_computeEncoder, "signalProgress:", v34);
  }
}

- (void)writeAccelerationStructureSerializationData:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *progressBins;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v10;
  void *v11;
  uint64_t v12;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v13;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v14;
  uint64_t v15;
  _QWORD v16[5];
  _QWORD v17[5];

  -[_MTLSWRaytracingAccelerationStructureCommandEncoder beginBVHSubstream](self, "beginBVHSubstream");
  progressBins = self->_progressBins;
  if (progressBins)
  {
    -[MTLComputeCommandEncoderSPI setSubstream:](self->_computeEncoder, "setSubstream:", MTLProgressBinsSelectSubstreamWithBufferWriteSize((uint64_t)progressBins, objc_msgSend(a3, "size")));
    v10 = self->_progressBins;
    v11 = (void *)objc_msgSend(a3, "buffer");
    v12 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __115___MTLSWRaytracingAccelerationStructureCommandEncoder_writeAccelerationStructureSerializationData_toBuffer_offset___block_invoke;
    v17[3] = &unk_1E0FE3C70;
    v17[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v10, v11, 0, (uint64_t)v17);
    v13 = self->_progressBins;
    v16[0] = v12;
    v16[1] = 3221225472;
    v16[2] = __115___MTLSWRaytracingAccelerationStructureCommandEncoder_writeAccelerationStructureSerializationData_toBuffer_offset___block_invoke_2;
    v16[3] = &unk_1E0FE3C70;
    v16[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v13, a4, 1, (uint64_t)v16);
  }
  objc_msgSend((id)-[MTLDevice GPUBVHBuilder](self->_device, "GPUBVHBuilder"), "writeAccelerationStructureSerializationDataWithEncoder:BVHBuffer:BVHBufferOffset:toBuffer:offset:", self->_computeEncoder, objc_msgSend(a3, "buffer"), objc_msgSend(a3, "bufferOffset"), a4, a5);
  v14 = self->_progressBins;
  if (v14)
  {
    v15 = MTLProgressBinsUpdate((uint64_t)v14);
    if ((v15 & 0x80000000) == 0 && !self->_virtualSubstreamsEnabled)
      -[MTLComputeCommandEncoderSPI signalProgress:](self->_computeEncoder, "signalProgress:", v15);
  }
}

- (void)insertDebugSignpost:(id)a3
{
  -[MTLComputeCommandEncoderSPI insertDebugSignpost:](self->_computeEncoder, "insertDebugSignpost:", a3);
}

- (void)popDebugGroup
{
  -[MTLComputeCommandEncoderSPI popDebugGroup](self->_computeEncoder, "popDebugGroup");
}

- (void)pushDebugGroup:(id)a3
{
  -[MTLComputeCommandEncoderSPI pushDebugGroup:](self->_computeEncoder, "pushDebugGroup:", a3);
}

- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5
{
  -[MTLComputeCommandEncoderSPI sampleCountersInBuffer:atSampleIndex:withBarrier:](self->_computeEncoder, "sampleCountersInBuffer:atSampleIndex:withBarrier:", a3, a4, a5);
}

- (void)updateFence:(id)a3
{
  -[MTLComputeCommandEncoderSPI updateFence:](self->_computeEncoder, "updateFence:", a3);
}

- (void)useHeap:(id)a3
{
  -[MTLComputeCommandEncoderSPI useHeap:](self->_computeEncoder, "useHeap:", a3);
}

- (void)useHeaps:(const void *)a3 count:(unint64_t)a4
{
  -[MTLComputeCommandEncoderSPI useHeaps:count:](self->_computeEncoder, "useHeaps:count:", a3, a4);
}

- (void)useResource:(id)a3 usage:(unint64_t)a4
{
  -[MTLComputeCommandEncoderSPI useResource:usage:](self->_computeEncoder, "useResource:usage:", a3, a4);
}

- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5
{
  -[MTLComputeCommandEncoderSPI useResources:count:usage:](self->_computeEncoder, "useResources:count:usage:", a3, a4, a5);
}

- (void)waitForFence:(id)a3
{
  -[MTLComputeCommandEncoderSPI waitForFence:](self->_computeEncoder, "waitForFence:", a3);
}

- (void)writeAccelerationStructureTraversalDepth:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *progressBins;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v10;
  void *v11;
  uint64_t v12;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v13;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v14;
  uint64_t v15;
  _QWORD v16[5];
  _QWORD v17[5];

  progressBins = self->_progressBins;
  if (progressBins)
  {
    -[MTLComputeCommandEncoderSPI setSubstream:](self->_computeEncoder, "setSubstream:", MTLProgressBinsSelectSubstreamWithBufferWriteSize((uint64_t)progressBins, 8uLL));
    v10 = self->_progressBins;
    v11 = (void *)objc_msgSend(a3, "buffer");
    v12 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __112___MTLSWRaytracingAccelerationStructureCommandEncoder_writeAccelerationStructureTraversalDepth_toBuffer_offset___block_invoke;
    v17[3] = &unk_1E0FE3C70;
    v17[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v10, v11, 0, (uint64_t)v17);
    v13 = self->_progressBins;
    v16[0] = v12;
    v16[1] = 3221225472;
    v16[2] = __112___MTLSWRaytracingAccelerationStructureCommandEncoder_writeAccelerationStructureTraversalDepth_toBuffer_offset___block_invoke_2;
    v16[3] = &unk_1E0FE3C70;
    v16[4] = self;
    MTLProgressBinsSynchronizeBufferAccess((uint64_t)v13, a4, 1, (uint64_t)v16);
  }
  objc_msgSend((id)-[MTLDevice GPUBVHBuilder](self->_device, "GPUBVHBuilder"), "writeMTLSWBVHAccelerationStructureDepthWithEncoder:BVHBuffer:BVHBufferOffset:toBuffer:sizeBufferOffset:", self->_computeEncoder, objc_msgSend(a3, "buffer"), objc_msgSend(a3, "bufferOffset"), a4, a5);
  v14 = self->_progressBins;
  if (v14)
  {
    v15 = MTLProgressBinsUpdate((uint64_t)v14);
    if ((v15 & 0x80000000) == 0 && !self->_virtualSubstreamsEnabled)
      -[MTLComputeCommandEncoderSPI signalProgress:](self->_computeEncoder, "signalProgress:", v15);
  }
}

@end
