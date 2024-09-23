@implementation MTLLegacySVAccelerationStructureCommandEncoder

- (MTLLegacySVAccelerationStructureCommandEncoder)initWithAccelerationStructureCommandEncoder:(id)a3 parent:(id)a4 accelerationStructurePassDescriptor:(id)a5
{
  MTLLegacySVAccelerationStructureCommandEncoder *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTLLegacySVAccelerationStructureCommandEncoder;
  v6 = -[MTLToolsCommandEncoder initWithBaseObject:parent:](&v8, sel_initWithBaseObject_parent_, a3, a4);
  if (v6)
  {
    v6->_accelerationStructurePassDescriptor = (MTLAccelerationStructurePassDescriptor *)objc_msgSend(a5, "copy");
    v6->_accelerationStructureSupportLibrary = (MTLLibrary *)-[MTLDevice newLibraryWithURL:error:](-[MTLToolsObject device](v6->super.super.super._parent, "device"), "newLibraryWithURL:error:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.gpusw.MetalTools")), "URLForResource:withExtension:", CFSTR("MTLLegacySVAccelerationStructureSupport"), CFSTR("metallib")), 0);
  }
  return v6;
}

- (void)endEncoding
{
  std::__list_imp<objc_object  {objcproto9MTLBuffer}*>::clear(&self->_LegacySVResourceAndUsageList.__end_.__prev_);
  std::__list_imp<objc_object  {objcproto9MTLBuffer}*>::clear(&self->_heapList.__end_.__prev_);
  -[MTLLegacySVAccelerationStructureCommandEncoder destroyBaseAccelerationStructureCommandEncoder](self, "destroyBaseAccelerationStructureCommandEncoder");
}

- (void)newBaseAccelerationStructureCommandEncoder
{
  id v3;
  uint64_t v4;
  MTLLegacySVAccelerationStructureCommandEncoder *i;
  MTLToolsObject *baseObject;
  MTLToolsDevice *device;
  MTLLegacySVAccelerationStructureCommandEncoder *j;
  MTLToolsObject *v9;
  objc_super v10;
  objc_super v11;

  v3 = -[MTLToolsObject baseObject](self->super.super.super._parent, "baseObject");
  if (self->_accelerationStructurePassDescriptor)
    v4 = objc_msgSend(v3, "accelerationStructureCommandEncoderWithDescriptor:");
  else
    v4 = objc_msgSend(v3, "accelerationStructureCommandEncoder");
  -[MTLToolsObject setBaseObject:](self, "setBaseObject:", v4);
  -[MTLToolsObject baseObject](self, "baseObject");
  for (i = (MTLLegacySVAccelerationStructureCommandEncoder *)self->_LegacySVResourceAndUsageList.__end_.__next_;
        i != (MTLLegacySVAccelerationStructureCommandEncoder *)&self->_LegacySVResourceAndUsageList;
        i = (MTLLegacySVAccelerationStructureCommandEncoder *)i->super.super.super._parent)
  {
    baseObject = i->super.super.super._baseObject;
    device = i->super.super.super._device;
    v11.receiver = self;
    v11.super_class = (Class)MTLLegacySVAccelerationStructureCommandEncoder;
    -[MTLToolsAccelerationStructureCommandEncoder useResource:usage:](&v11, sel_useResource_usage_, baseObject, device);
  }
  for (j = (MTLLegacySVAccelerationStructureCommandEncoder *)self->_heapList.__end_.__next_;
        j != (MTLLegacySVAccelerationStructureCommandEncoder *)&self->_heapList;
        j = (MTLLegacySVAccelerationStructureCommandEncoder *)j->super.super.super._parent)
  {
    v9 = j->super.super.super._baseObject;
    v10.receiver = self;
    v10.super_class = (Class)MTLLegacySVAccelerationStructureCommandEncoder;
    -[MTLToolsAccelerationStructureCommandEncoder useHeap:](&v10, sel_useHeap_, v9);
  }
}

- (void)destroyBaseAccelerationStructureCommandEncoder
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "endEncoding");
  -[MTLToolsObject setBaseObject:](self, "setBaseObject:", 0);
}

- (void)blitAccelerationStructureType:(unint64_t)a3 toAccelerationStructure:(id)a4
{
  void *v7;
  id v8;

  v7 = (void *)-[MTLToolsObject blitCommandEncoder](self->super.super.super._parent, "blitCommandEncoder");
  v8 = (id)-[MTLDevice newInternalBufferWithLength:options:](-[MTLToolsObject device](self->super.super.super._parent, "device"), "newInternalBufferWithLength:options:", 8, 0);
  *(_QWORD *)objc_msgSend(v8, "contents") = a3;
  objc_msgSend(v7, "copyFromInternalBuffer:sourceOffset:toInternalBuffer:destinationOffset:size:", v8, 0, objc_msgSend(a4, "debugBuf"), 16, 8);
  objc_msgSend(v7, "endEncoding");

}

- (void)blitPrimitiveTypetoAccelerationStructure:(id)a3
{
  -[MTLLegacySVAccelerationStructureCommandEncoder blitAccelerationStructureType:toAccelerationStructure:](self, "blitAccelerationStructureType:toAccelerationStructure:", 1, a3);
}

- (void)blitInstanceTypetoAccelerationStructure:(id)a3
{
  -[MTLLegacySVAccelerationStructureCommandEncoder blitAccelerationStructureType:toAccelerationStructure:](self, "blitAccelerationStructureType:toAccelerationStructure:", 2, a3);
}

- (void)blitTypeFromAccelerationStructureDescriptor:(id)a3 toAccelerationStructure:(id)a4
{
  -[MTLLegacySVAccelerationStructureCommandEncoder blitAccelerationStructureType:toAccelerationStructure:](self, "blitAccelerationStructureType:toAccelerationStructure:", MTLLegacySVAccelerationStructureTypeFromDescriptor((MTLAccelerationStructureDescriptor *)a3), a4);
}

- (void)blitTypeFromAccelerationStructure:(id)a3 toAccelerationStructure:(id)a4
{
  void *v6;

  v6 = (void *)-[MTLToolsObject blitCommandEncoder](self->super.super.super._parent, "blitCommandEncoder");
  objc_msgSend(v6, "copyFromInternalBuffer:sourceOffset:toInternalBuffer:destinationOffset:size:", objc_msgSend(a3, "debugBuf"), 16, objc_msgSend(a4, "debugBuf"), 16, 8);
  objc_msgSend(v6, "endEncoding");
}

- (id)psoWithFunctionName:(id)a3
{
  MTLDevice *v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = -[MTLToolsObject device](self->super.super.super._parent, "device");
  v6 = (void *)-[MTLLibrary newFunctionWithName:](self->_accelerationStructureSupportLibrary, "newFunctionWithName:", a3);
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setComputeFunction:", v6);

  v8 = (void *)-[MTLDevice newComputePipelineStateWithDescriptor:options:reflection:error:](v5, "newComputePipelineStateWithDescriptor:options:reflection:error:", v7, 0, 0, 0);
  return v8;
}

- (id)encodeUnwrapAccelerationStructureDescriptor:(id)a3
{
  void *v5;
  MTLDevice *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  list<LegacySVResourceAndUsage, std::allocator<LegacySVResourceAndUsage>> *p_LegacySVResourceAndUsageList;
  list<LegacySVResourceAndUsage, std::allocator<LegacySVResourceAndUsage>> *i;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  int64x2_t v19;
  unint64_t v20;
  int64x2_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v5 = (void *)objc_opt_class();
  if (objc_msgSend(v5, "isSubclassOfClass:", objc_opt_class()))
  {
    v6 = -[MTLToolsObject device](self->super.super.super._parent, "device");
    v7 = (void *)objc_msgSend(a3, "copy");
    v8 = (void *)-[MTLDevice newBufferWithLength:options:](v6, "newBufferWithLength:options:", objc_msgSend((id)objc_msgSend(a3, "instanceDescriptorBuffer"), "length"), objc_msgSend((id)objc_msgSend(a3, "instanceDescriptorBuffer"), "resourceOptions"));
    objc_msgSend(v7, "setInstanceDescriptorBuffer:", v8);

    v9 = (void *)-[MTLToolsObject blitCommandEncoder](self->super.super.super._parent, "blitCommandEncoder");
    v10 = objc_msgSend(a3, "instanceDescriptorBufferOffset");
    objc_msgSend(v9, "copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:", objc_msgSend(a3, "instanceDescriptorBuffer"), v10, objc_msgSend(v7, "instanceDescriptorBuffer"), v10, objc_msgSend(a3, "maxInstanceCount") * objc_msgSend(a3, "instanceDescriptorStride"));
    objc_msgSend(v9, "endEncoding");
    v11 = -[MTLLegacySVAccelerationStructureCommandEncoder psoWithFunctionName:](self, "psoWithFunctionName:", CFSTR("unwrap_acceleration_structure_descriptor_buffer"));
    v12 = (void *)-[MTLToolsObject computeCommandEncoder](self->super.super.super._parent, "computeCommandEncoder");
    p_LegacySVResourceAndUsageList = &self->_LegacySVResourceAndUsageList;
    for (i = (list<LegacySVResourceAndUsage, std::allocator<LegacySVResourceAndUsage>> *)p_LegacySVResourceAndUsageList->__end_.__next_;
          i != p_LegacySVResourceAndUsageList;
          i = (list<LegacySVResourceAndUsage, std::allocator<LegacySVResourceAndUsage>> *)i->__end_.__next_)
    {
      objc_msgSend(v12, "useResource:usage:", i->__size_alloc_.__value_, i[1].__end_.__prev_);
    }
    v23 = 0;
    v24 = objc_msgSend(a3, "instanceDescriptorStride");
    v15 = objc_msgSend(a3, "instanceDescriptorType");
    if (v15 == 3)
    {
      v16 = 64;
    }
    else
    {
      if (v15 != 4)
      {
LABEL_10:
        v22 = objc_msgSend(a3, "maxInstanceCount");
        objc_msgSend(v12, "setComputePipelineState:", v11);
        objc_msgSend(v12, "setBuffer:offset:atIndex:", objc_msgSend(a3, "instanceDescriptorBuffer"), objc_msgSend(a3, "instanceDescriptorBufferOffset"), 0);
        objc_msgSend(v12, "setBuffer:offset:atIndex:", objc_msgSend(v7, "instanceDescriptorBuffer"), objc_msgSend(v7, "instanceDescriptorBufferOffset"), 1);
        objc_msgSend(v12, "setBytes:length:atIndex:", &v24, 8, 2);
        objc_msgSend(v12, "setBytes:length:atIndex:", &v23, 8, 3);
        objc_msgSend(v12, "setBytes:length:atIndex:", &v22, 8, 4);
        v20 = vcvtpd_u64_f64((double)v22 / (double)(unint64_t)objc_msgSend(v11, "maxTotalThreadsPerThreadgroup"));
        v21 = vdupq_n_s64(1uLL);
        v18 = objc_msgSend(v11, "maxTotalThreadsPerThreadgroup");
        v19 = v21;
        objc_msgSend(v12, "dispatchThreadgroups:threadsPerThreadgroup:", &v20, &v18);
        objc_msgSend(v12, "endEncoding");

        return v7;
      }
      v16 = 16;
    }
    v23 = v16;
    goto LABEL_10;
  }
  return a3;
}

- (id)createChildrenWrappersBufferWithInstanceDescriptorBuffer:(id)a3 maxInstanceCount:(unint64_t)a4 instanceCountBuffer:(id)a5 instanceCountBufferOffset:(unint64_t)a6 instanceDescriptorStride:(unint64_t)a7 instanceDescriptorBufferOffset:(unint64_t)a8 instanceDescriptorType:(unint64_t)a9 accelerationStructureIDs:(id)a10
{
  MTLDevice *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  const __CFString *v20;
  uint64_t v21;
  id v22;
  uint64_t v25;
  int64x2_t v26;
  unint64_t v27;
  int64x2_t v28;
  uint64_t v29;
  unint64_t v30;

  v16 = -[MTLToolsObject device](self->super.super.super._parent, "device");
  v17 = (void *)-[MTLToolsObject computeCommandEncoder](self->super.super.super._parent, "computeCommandEncoder");
  v18 = (void *)-[MTLDevice newBufferWithLength:options:](v16, "newBufferWithLength:options:", 8 * a4, 0);
  v29 = 0;
  v30 = a7;
  switch(a9)
  {
    case 0uLL:
    case 1uLL:
      v19 = 60;
      goto LABEL_5;
    case 2uLL:
      v19 = 12;
LABEL_5:
      v29 = v19;
      v20 = CFSTR("create_children_wrappers_buffer");
      break;
    case 3uLL:
      v21 = 64;
      goto LABEL_8;
    case 4uLL:
      v21 = 16;
LABEL_8:
      v29 = v21;
      v20 = CFSTR("create_children_wrappers_buffer_from_indirect_descriptor");
      break;
    default:
      v20 = 0;
      break;
  }
  v22 = -[MTLLegacySVAccelerationStructureCommandEncoder psoWithFunctionName:](self, "psoWithFunctionName:", v20);
  objc_msgSend(v17, "setComputePipelineState:", v22);
  objc_msgSend(v17, "setBuffer:offset:atIndex:", a3, a8, 0);
  objc_msgSend(v17, "setBuffer:offset:atIndex:", v18, 0, 1);
  if (a10)
    objc_msgSend(v17, "setBuffer:offset:atIndex:", a10, 0, 2);
  objc_msgSend(v17, "setBytes:length:atIndex:", &v30, 8, 3);
  objc_msgSend(v17, "setBytes:length:atIndex:", &v29, 8, 4);
  objc_msgSend(v17, "setBuffer:offset:atIndex:", a5, a6, 5);
  v27 = vcvtpd_u64_f64((double)a4 / (double)(unint64_t)objc_msgSend(v22, "maxTotalThreadsPerThreadgroup"));
  v28 = vdupq_n_s64(1uLL);
  v25 = objc_msgSend(v22, "maxTotalThreadsPerThreadgroup");
  v26 = v28;
  objc_msgSend(v17, "dispatchThreadgroups:threadsPerThreadgroup:", &v27, &v25);
  objc_msgSend(v17, "endEncoding");

  return v18;
}

- (id)createChildrenWrappersBufferWithIASDescriptor:(id)a3
{
  MTLDevice *v5;
  uint64_t v6;
  void *v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v14;

  v5 = -[MTLToolsObject device](self->super.super.super._parent, "device");
  v6 = objc_msgSend((id)objc_msgSend(a3, "instancedAccelerationStructures"), "count");
  v7 = (void *)-[MTLDevice newBufferWithLength:options:](v5, "newBufferWithLength:options:", 8 * v6, 0);
  if (v6)
  {
    for (i = 0; i != v6; ++i)
    {
      v9 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "instancedAccelerationStructures"), "objectAtIndexedSubscript:", i), "gpuResourceID");
      *(_QWORD *)(objc_msgSend(v7, "contents") + 8 * i) = v9;
    }
  }
  v14 = objc_msgSend(a3, "instanceCount");
  v10 = (void *)-[MTLDevice newBufferWithBytes:length:options:](v5, "newBufferWithBytes:length:options:", &v14, 8, 0);
  v11 = objc_msgSend(a3, "instanceDescriptorBuffer");
  v12 = -[MTLLegacySVAccelerationStructureCommandEncoder createChildrenWrappersBufferWithInstanceDescriptorBuffer:maxInstanceCount:instanceCountBuffer:instanceCountBufferOffset:instanceDescriptorStride:instanceDescriptorBufferOffset:instanceDescriptorType:accelerationStructureIDs:](self, "createChildrenWrappersBufferWithInstanceDescriptorBuffer:maxInstanceCount:instanceCountBuffer:instanceCountBufferOffset:instanceDescriptorStride:instanceDescriptorBufferOffset:instanceDescriptorType:accelerationStructureIDs:", v11, v14, v10, 0, objc_msgSend(a3, "instanceDescriptorStride"), objc_msgSend(a3, "instanceDescriptorBufferOffset"), objc_msgSend(a3, "instanceDescriptorType"), v7);

  return v12;
}

- (id)createChildrenWrappersBufferWithIndirectIASDescriptor:(id)a3
{
  return -[MTLLegacySVAccelerationStructureCommandEncoder createChildrenWrappersBufferWithInstanceDescriptorBuffer:maxInstanceCount:instanceCountBuffer:instanceCountBufferOffset:instanceDescriptorStride:instanceDescriptorBufferOffset:instanceDescriptorType:accelerationStructureIDs:](self, "createChildrenWrappersBufferWithInstanceDescriptorBuffer:maxInstanceCount:instanceCountBuffer:instanceCountBufferOffset:instanceDescriptorStride:instanceDescriptorBufferOffset:instanceDescriptorType:accelerationStructureIDs:", objc_msgSend(a3, "instanceDescriptorBuffer"), objc_msgSend(a3, "maxInstanceCount"), objc_msgSend(a3, "instanceCountBuffer"), objc_msgSend(a3, "instanceCountBufferOffset"), objc_msgSend(a3, "instanceDescriptorStride"), objc_msgSend(a3, "instanceDescriptorBufferOffset"), objc_msgSend(a3, "instanceDescriptorType"), 0);
}

- (id)createChildrenWrappersBufferWithASDescriptor:(id)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)objc_opt_class();
  if (objc_msgSend(v5, "isSubclassOfClass:", objc_opt_class()))
  {
    if (objc_msgSend(a3, "instanceCount"))
    {
      v6 = -[MTLLegacySVAccelerationStructureCommandEncoder createChildrenWrappersBufferWithIASDescriptor:](self, "createChildrenWrappersBufferWithIASDescriptor:", a3);
      goto LABEL_6;
    }
    return 0;
  }
  v7 = (void *)objc_opt_class();
  if (!objc_msgSend(v7, "isSubclassOfClass:", objc_opt_class()))
    return 0;
  v6 = -[MTLLegacySVAccelerationStructureCommandEncoder createChildrenWrappersBufferWithIndirectIASDescriptor:](self, "createChildrenWrappersBufferWithIndirectIASDescriptor:", a3);
LABEL_6:
  v8 = v6;
  if (v6)
    -[MTLLegacySVAccelerationStructureCommandEncoder useResource:usage:](self, "useResource:usage:", v6, 1);
  return v8;
}

- (void)blitChildrenWrappersBufferAddress:(id)a3 toAccelerationStructure:(id)a4
{
  void *v7;
  uint64_t v8;
  id v9;
  id v10;

  v7 = (void *)-[MTLToolsObject blitCommandEncoder](self->super.super.super._parent, "blitCommandEncoder");
  v10 = (id)-[MTLDevice newInternalBufferWithLength:options:](-[MTLToolsObject device](self->super.super.super._parent, "device"), "newInternalBufferWithLength:options:", 8, 0);
  v8 = objc_msgSend((id)objc_msgSend(a3, "baseObject"), "gpuAddress");
  *(_QWORD *)objc_msgSend(v10, "contents") = v8;
  v9 = (id)objc_msgSend(a4, "debugBuf");
  objc_msgSend(a4, "setChildrenWrappersBuffer:", a3);
  objc_msgSend(v7, "copyFromInternalBuffer:sourceOffset:toInternalBuffer:destinationOffset:size:", v10, 0, v9, 24, 8);
  objc_msgSend(v7, "endEncoding");

}

- (void)blitChildrenWrappersBufferFromAcceleratrionStructure:(id)a3 toAccelerationStructure:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)-[MTLToolsObject blitCommandEncoder](self->super.super.super._parent, "blitCommandEncoder");
  v8 = (id)objc_msgSend(a3, "debugBuf");
  v7 = (id)objc_msgSend(a4, "debugBuf");
  objc_msgSend(a4, "setChildrenWrappersBuffer:", objc_msgSend(a3, "childrenWrappersBuffer"));
  objc_msgSend(v6, "copyFromInternalBuffer:sourceOffset:toInternalBuffer:destinationOffset:size:", v8, 24, v7, 24, 8);
  objc_msgSend(v6, "endEncoding");

}

- (void)buildAccelerationStructure:(id)a3 descriptor:(id)a4 scratchBuffer:(id)a5 scratchBufferOffset:(unint64_t)a6
{
  id v11;
  id v12;
  objc_super v13;

  -[MTLLegacySVAccelerationStructureCommandEncoder destroyBaseAccelerationStructureCommandEncoder](self, "destroyBaseAccelerationStructureCommandEncoder");
  v11 = -[MTLLegacySVAccelerationStructureCommandEncoder createChildrenWrappersBufferWithASDescriptor:](self, "createChildrenWrappersBufferWithASDescriptor:", a4);
  v12 = -[MTLLegacySVAccelerationStructureCommandEncoder encodeUnwrapAccelerationStructureDescriptor:](self, "encodeUnwrapAccelerationStructureDescriptor:", a4);
  -[MTLLegacySVAccelerationStructureCommandEncoder newBaseAccelerationStructureCommandEncoder](self, "newBaseAccelerationStructureCommandEncoder");
  v13.receiver = self;
  v13.super_class = (Class)MTLLegacySVAccelerationStructureCommandEncoder;
  -[MTLToolsAccelerationStructureCommandEncoder buildAccelerationStructure:descriptor:scratchBuffer:scratchBufferOffset:](&v13, sel_buildAccelerationStructure_descriptor_scratchBuffer_scratchBufferOffset_, a3, v12, a5, a6);
  -[MTLLegacySVAccelerationStructureCommandEncoder destroyBaseAccelerationStructureCommandEncoder](self, "destroyBaseAccelerationStructureCommandEncoder");
  -[MTLLegacySVAccelerationStructureCommandEncoder blitTypeFromAccelerationStructureDescriptor:toAccelerationStructure:](self, "blitTypeFromAccelerationStructureDescriptor:toAccelerationStructure:", a4, a3);
  if (v11)
    -[MTLLegacySVAccelerationStructureCommandEncoder blitChildrenWrappersBufferAddress:toAccelerationStructure:](self, "blitChildrenWrappersBufferAddress:toAccelerationStructure:", v11, a3);

  -[MTLLegacySVAccelerationStructureCommandEncoder newBaseAccelerationStructureCommandEncoder](self, "newBaseAccelerationStructureCommandEncoder");
}

- (void)refitAccelerationStructure:(id)a3 descriptor:(id)a4 destination:(id)a5 scratchBuffer:(id)a6 scratchBufferOffset:(unint64_t)a7
{
  id v13;
  id v14;
  objc_super v15;

  -[MTLLegacySVAccelerationStructureCommandEncoder destroyBaseAccelerationStructureCommandEncoder](self, "destroyBaseAccelerationStructureCommandEncoder");
  v13 = -[MTLLegacySVAccelerationStructureCommandEncoder createChildrenWrappersBufferWithASDescriptor:](self, "createChildrenWrappersBufferWithASDescriptor:", a4);
  v14 = -[MTLLegacySVAccelerationStructureCommandEncoder encodeUnwrapAccelerationStructureDescriptor:](self, "encodeUnwrapAccelerationStructureDescriptor:", a4);
  -[MTLLegacySVAccelerationStructureCommandEncoder newBaseAccelerationStructureCommandEncoder](self, "newBaseAccelerationStructureCommandEncoder");
  v15.receiver = self;
  v15.super_class = (Class)MTLLegacySVAccelerationStructureCommandEncoder;
  -[MTLToolsAccelerationStructureCommandEncoder refitAccelerationStructure:descriptor:destination:scratchBuffer:scratchBufferOffset:](&v15, sel_refitAccelerationStructure_descriptor_destination_scratchBuffer_scratchBufferOffset_, a3, v14, a5, a6, a7);
  -[MTLLegacySVAccelerationStructureCommandEncoder destroyBaseAccelerationStructureCommandEncoder](self, "destroyBaseAccelerationStructureCommandEncoder");
  if (a5)
  {
    -[MTLLegacySVAccelerationStructureCommandEncoder blitTypeFromAccelerationStructureDescriptor:toAccelerationStructure:](self, "blitTypeFromAccelerationStructureDescriptor:toAccelerationStructure:", a4, a5);
    if (v13)
      -[MTLLegacySVAccelerationStructureCommandEncoder blitChildrenWrappersBufferAddress:toAccelerationStructure:](self, "blitChildrenWrappersBufferAddress:toAccelerationStructure:", v13, a5);
  }
  -[MTLLegacySVAccelerationStructureCommandEncoder newBaseAccelerationStructureCommandEncoder](self, "newBaseAccelerationStructureCommandEncoder");

}

- (void)refitAccelerationStructure:(id)a3 descriptor:(id)a4 destination:(id)a5 scratchBuffer:(id)a6 scratchBufferOffset:(unint64_t)a7 options:(unint64_t)a8
{
  id v15;
  id v16;
  objc_super v17;

  -[MTLLegacySVAccelerationStructureCommandEncoder destroyBaseAccelerationStructureCommandEncoder](self, "destroyBaseAccelerationStructureCommandEncoder");
  v15 = -[MTLLegacySVAccelerationStructureCommandEncoder createChildrenWrappersBufferWithASDescriptor:](self, "createChildrenWrappersBufferWithASDescriptor:", a4);
  v16 = -[MTLLegacySVAccelerationStructureCommandEncoder encodeUnwrapAccelerationStructureDescriptor:](self, "encodeUnwrapAccelerationStructureDescriptor:", a4);
  -[MTLLegacySVAccelerationStructureCommandEncoder newBaseAccelerationStructureCommandEncoder](self, "newBaseAccelerationStructureCommandEncoder");
  v17.receiver = self;
  v17.super_class = (Class)MTLLegacySVAccelerationStructureCommandEncoder;
  -[MTLToolsAccelerationStructureCommandEncoder refitAccelerationStructure:descriptor:destination:scratchBuffer:scratchBufferOffset:options:](&v17, sel_refitAccelerationStructure_descriptor_destination_scratchBuffer_scratchBufferOffset_options_, a3, v16, a5, a6, a7, a8);
  -[MTLLegacySVAccelerationStructureCommandEncoder destroyBaseAccelerationStructureCommandEncoder](self, "destroyBaseAccelerationStructureCommandEncoder");
  if (a5)
  {
    -[MTLLegacySVAccelerationStructureCommandEncoder blitTypeFromAccelerationStructureDescriptor:toAccelerationStructure:](self, "blitTypeFromAccelerationStructureDescriptor:toAccelerationStructure:", a4, a5);
    if (v15)
      -[MTLLegacySVAccelerationStructureCommandEncoder blitChildrenWrappersBufferAddress:toAccelerationStructure:](self, "blitChildrenWrappersBufferAddress:toAccelerationStructure:", v15, a5);
  }
  -[MTLLegacySVAccelerationStructureCommandEncoder newBaseAccelerationStructureCommandEncoder](self, "newBaseAccelerationStructureCommandEncoder");

}

- (void)copyAccelerationStructure:(id)a3 toAccelerationStructure:(id)a4
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTLLegacySVAccelerationStructureCommandEncoder;
  -[MTLToolsAccelerationStructureCommandEncoder copyAccelerationStructure:toAccelerationStructure:](&v7, sel_copyAccelerationStructure_toAccelerationStructure_);
  -[MTLLegacySVAccelerationStructureCommandEncoder destroyBaseAccelerationStructureCommandEncoder](self, "destroyBaseAccelerationStructureCommandEncoder");
  -[MTLLegacySVAccelerationStructureCommandEncoder blitTypeFromAccelerationStructure:toAccelerationStructure:](self, "blitTypeFromAccelerationStructure:toAccelerationStructure:", a3, a4);
  -[MTLLegacySVAccelerationStructureCommandEncoder blitChildrenWrappersBufferFromAcceleratrionStructure:toAccelerationStructure:](self, "blitChildrenWrappersBufferFromAcceleratrionStructure:toAccelerationStructure:", a3, a4);
  -[MTLLegacySVAccelerationStructureCommandEncoder newBaseAccelerationStructureCommandEncoder](self, "newBaseAccelerationStructureCommandEncoder");
}

- (void)writeCompactedAccelerationStructureSize:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTLLegacySVAccelerationStructureCommandEncoder;
  -[MTLToolsAccelerationStructureCommandEncoder writeCompactedAccelerationStructureSize:toBuffer:offset:](&v5, sel_writeCompactedAccelerationStructureSize_toBuffer_offset_, a3, a4, a5);
}

- (void)writeCompactedAccelerationStructureSize:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5 sizeDataType:(unint64_t)a6
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTLLegacySVAccelerationStructureCommandEncoder;
  -[MTLToolsAccelerationStructureCommandEncoder writeCompactedAccelerationStructureSize:toBuffer:offset:sizeDataType:](&v6, sel_writeCompactedAccelerationStructureSize_toBuffer_offset_sizeDataType_, a3, a4, a5, a6);
}

- (void)copyAndCompactAccelerationStructure:(id)a3 toAccelerationStructure:(id)a4
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTLLegacySVAccelerationStructureCommandEncoder;
  -[MTLToolsAccelerationStructureCommandEncoder copyAndCompactAccelerationStructure:toAccelerationStructure:](&v7, sel_copyAndCompactAccelerationStructure_toAccelerationStructure_);
  -[MTLLegacySVAccelerationStructureCommandEncoder destroyBaseAccelerationStructureCommandEncoder](self, "destroyBaseAccelerationStructureCommandEncoder");
  -[MTLLegacySVAccelerationStructureCommandEncoder blitTypeFromAccelerationStructure:toAccelerationStructure:](self, "blitTypeFromAccelerationStructure:toAccelerationStructure:", a3, a4);
  -[MTLLegacySVAccelerationStructureCommandEncoder blitChildrenWrappersBufferFromAcceleratrionStructure:toAccelerationStructure:](self, "blitChildrenWrappersBufferFromAcceleratrionStructure:toAccelerationStructure:", a3, a4);
  -[MTLLegacySVAccelerationStructureCommandEncoder newBaseAccelerationStructureCommandEncoder](self, "newBaseAccelerationStructureCommandEncoder");
}

- (void)writeSerializedAccelerationStructureSize:(id)a3 toBuffer:(id)a4 sizeBufferOffset:(unint64_t)a5
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTLLegacySVAccelerationStructureCommandEncoder;
  -[MTLToolsAccelerationStructureCommandEncoder writeSerializedAccelerationStructureSize:toBuffer:sizeBufferOffset:](&v5, sel_writeSerializedAccelerationStructureSize_toBuffer_sizeBufferOffset_, a3, a4, a5);
}

- (void)writeDeserializedAccelerationStructureSize:(id)a3 serializedOffset:(unint64_t)a4 toBuffer:(id)a5 sizeBufferOffset:(unint64_t)a6
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTLLegacySVAccelerationStructureCommandEncoder;
  -[MTLToolsAccelerationStructureCommandEncoder writeDeserializedAccelerationStructureSize:serializedOffset:toBuffer:sizeBufferOffset:](&v6, sel_writeDeserializedAccelerationStructureSize_serializedOffset_toBuffer_sizeBufferOffset_, a3, a4, a5, a6);
}

- (void)writeDeserializedPrimitiveAccelerationStructureSizes:(id)a3 serializedOffset:(unint64_t)a4 toBuffer:(id)a5 sizesBufferOffset:(unint64_t)a6
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTLLegacySVAccelerationStructureCommandEncoder;
  -[MTLToolsAccelerationStructureCommandEncoder writeDeserializedPrimitiveAccelerationStructureSizes:serializedOffset:toBuffer:sizesBufferOffset:](&v6, sel_writeDeserializedPrimitiveAccelerationStructureSizes_serializedOffset_toBuffer_sizesBufferOffset_, a3, a4, a5, a6);
}

- (void)serializePrimitiveAccelerationStructure:(id)a3 toBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTLLegacySVAccelerationStructureCommandEncoder;
  -[MTLToolsAccelerationStructureCommandEncoder serializePrimitiveAccelerationStructure:toBuffer:serializedBufferOffset:](&v5, sel_serializePrimitiveAccelerationStructure_toBuffer_serializedBufferOffset_, a3, a4, a5);
}

- (void)serializeInstanceAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 toBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTLLegacySVAccelerationStructureCommandEncoder;
  -[MTLToolsAccelerationStructureCommandEncoder serializeInstanceAccelerationStructure:primitiveAccelerationStructures:toBuffer:serializedBufferOffset:](&v6, sel_serializeInstanceAccelerationStructure_primitiveAccelerationStructures_toBuffer_serializedBufferOffset_, a3, a4, a5, a6);
}

- (void)deserializePrimitiveAccelerationStructure:(id)a3 fromBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTLLegacySVAccelerationStructureCommandEncoder;
  -[MTLToolsAccelerationStructureCommandEncoder deserializePrimitiveAccelerationStructure:fromBuffer:serializedBufferOffset:](&v7, sel_deserializePrimitiveAccelerationStructure_fromBuffer_serializedBufferOffset_, a3, a4, a5);
  -[MTLLegacySVAccelerationStructureCommandEncoder destroyBaseAccelerationStructureCommandEncoder](self, "destroyBaseAccelerationStructureCommandEncoder");
  -[MTLLegacySVAccelerationStructureCommandEncoder blitPrimitiveTypetoAccelerationStructure:](self, "blitPrimitiveTypetoAccelerationStructure:", a3);
  -[MTLLegacySVAccelerationStructureCommandEncoder newBaseAccelerationStructureCommandEncoder](self, "newBaseAccelerationStructureCommandEncoder");
}

- (void)deserializeInstanceAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 fromBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6
{
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTLLegacySVAccelerationStructureCommandEncoder;
  -[MTLToolsAccelerationStructureCommandEncoder deserializeInstanceAccelerationStructure:primitiveAccelerationStructures:fromBuffer:serializedBufferOffset:](&v8, sel_deserializeInstanceAccelerationStructure_primitiveAccelerationStructures_fromBuffer_serializedBufferOffset_, a3, a4, a5, a6);
  -[MTLLegacySVAccelerationStructureCommandEncoder destroyBaseAccelerationStructureCommandEncoder](self, "destroyBaseAccelerationStructureCommandEncoder");
  -[MTLLegacySVAccelerationStructureCommandEncoder blitInstanceTypetoAccelerationStructure:](self, "blitInstanceTypetoAccelerationStructure:", a3);
  -[MTLLegacySVAccelerationStructureCommandEncoder newBaseAccelerationStructureCommandEncoder](self, "newBaseAccelerationStructureCommandEncoder");
}

- (void)deserializePrimitiveAccelerationStructure:(id)a3 fromBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5 withDescriptor:(id)a6
{
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTLLegacySVAccelerationStructureCommandEncoder;
  -[MTLToolsAccelerationStructureCommandEncoder deserializePrimitiveAccelerationStructure:fromBuffer:serializedBufferOffset:withDescriptor:](&v9, sel_deserializePrimitiveAccelerationStructure_fromBuffer_serializedBufferOffset_withDescriptor_, a3, a4, a5);
  -[MTLLegacySVAccelerationStructureCommandEncoder destroyBaseAccelerationStructureCommandEncoder](self, "destroyBaseAccelerationStructureCommandEncoder");
  -[MTLLegacySVAccelerationStructureCommandEncoder blitTypeFromAccelerationStructureDescriptor:toAccelerationStructure:](self, "blitTypeFromAccelerationStructureDescriptor:toAccelerationStructure:", a6, a3);
  -[MTLLegacySVAccelerationStructureCommandEncoder newBaseAccelerationStructureCommandEncoder](self, "newBaseAccelerationStructureCommandEncoder");
}

- (void)deserializeInstanceAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 fromBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6 withDescriptor:(id)a7
{
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MTLLegacySVAccelerationStructureCommandEncoder;
  -[MTLToolsAccelerationStructureCommandEncoder deserializeInstanceAccelerationStructure:primitiveAccelerationStructures:fromBuffer:serializedBufferOffset:withDescriptor:](&v10, sel_deserializeInstanceAccelerationStructure_primitiveAccelerationStructures_fromBuffer_serializedBufferOffset_withDescriptor_, a3, a4, a5, a6);
  -[MTLLegacySVAccelerationStructureCommandEncoder destroyBaseAccelerationStructureCommandEncoder](self, "destroyBaseAccelerationStructureCommandEncoder");
  -[MTLLegacySVAccelerationStructureCommandEncoder blitTypeFromAccelerationStructureDescriptor:toAccelerationStructure:](self, "blitTypeFromAccelerationStructureDescriptor:toAccelerationStructure:", a7, a3);
  -[MTLLegacySVAccelerationStructureCommandEncoder newBaseAccelerationStructureCommandEncoder](self, "newBaseAccelerationStructureCommandEncoder");
}

- (void)serializeAccelerationStructure:(id)a3 toBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTLLegacySVAccelerationStructureCommandEncoder;
  -[MTLToolsAccelerationStructureCommandEncoder serializeAccelerationStructure:toBuffer:serializedBufferOffset:](&v5, sel_serializeAccelerationStructure_toBuffer_serializedBufferOffset_, a3, a4, a5);
}

- (void)deserializeAccelerationStructure:(id)a3 fromBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTLLegacySVAccelerationStructureCommandEncoder;
  -[MTLToolsAccelerationStructureCommandEncoder deserializeAccelerationStructure:fromBuffer:serializedBufferOffset:](&v7, sel_deserializeAccelerationStructure_fromBuffer_serializedBufferOffset_, a3, a4, a5);
  -[MTLLegacySVAccelerationStructureCommandEncoder destroyBaseAccelerationStructureCommandEncoder](self, "destroyBaseAccelerationStructureCommandEncoder");
  -[MTLLegacySVAccelerationStructureCommandEncoder blitPrimitiveTypetoAccelerationStructure:](self, "blitPrimitiveTypetoAccelerationStructure:", a3);
  -[MTLLegacySVAccelerationStructureCommandEncoder newBaseAccelerationStructureCommandEncoder](self, "newBaseAccelerationStructureCommandEncoder");
}

- (void)deserializeAccelerationStructure:(id)a3 primitiveAccelerationStructures:(id)a4 fromBuffer:(id)a5 serializedBufferOffset:(unint64_t)a6
{
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTLLegacySVAccelerationStructureCommandEncoder;
  -[MTLToolsAccelerationStructureCommandEncoder deserializeInstanceAccelerationStructure:primitiveAccelerationStructures:fromBuffer:serializedBufferOffset:](&v8, sel_deserializeInstanceAccelerationStructure_primitiveAccelerationStructures_fromBuffer_serializedBufferOffset_, a3, a4, a5, a6);
  -[MTLLegacySVAccelerationStructureCommandEncoder destroyBaseAccelerationStructureCommandEncoder](self, "destroyBaseAccelerationStructureCommandEncoder");
  -[MTLLegacySVAccelerationStructureCommandEncoder blitInstanceTypetoAccelerationStructure:](self, "blitInstanceTypetoAccelerationStructure:", a3);
  -[MTLLegacySVAccelerationStructureCommandEncoder newBaseAccelerationStructureCommandEncoder](self, "newBaseAccelerationStructureCommandEncoder");
}

- (void)writeGeometrySizeOfAccelerationStructure:(id)a3 toBuffer:(id)a4 sizeBufferOffset:(unint64_t)a5
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTLLegacySVAccelerationStructureCommandEncoder;
  -[MTLToolsAccelerationStructureCommandEncoder writeGeometrySizeOfAccelerationStructure:toBuffer:sizeBufferOffset:](&v5, sel_writeGeometrySizeOfAccelerationStructure_toBuffer_sizeBufferOffset_, a3, a4, a5);
}

- (void)writeGeometryOfAccelerationStructure:(id)a3 toBuffer:(id)a4 geometryBufferOffset:(unint64_t)a5
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTLLegacySVAccelerationStructureCommandEncoder;
  -[MTLToolsAccelerationStructureCommandEncoder writeGeometryOfAccelerationStructure:toBuffer:geometryBufferOffset:](&v5, sel_writeGeometryOfAccelerationStructure_toBuffer_geometryBufferOffset_, a3, a4, a5);
}

- (BOOL)writeGenericBVHStructureSizesOfAccelerationStructure:(id)a3 into:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTLLegacySVAccelerationStructureCommandEncoder;
  return -[MTLToolsAccelerationStructureCommandEncoder writeGenericBVHStructureSizesOfAccelerationStructure:into:](&v5, sel_writeGenericBVHStructureSizesOfAccelerationStructure_into_, a3, a4);
}

- (BOOL)writeGenericBVHStructureOfAccelerationStructure:(id)a3 into:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTLLegacySVAccelerationStructureCommandEncoder;
  return -[MTLToolsAccelerationStructureCommandEncoder writeGenericBVHStructureOfAccelerationStructure:into:](&v5, sel_writeGenericBVHStructureOfAccelerationStructure_into_, a3, a4);
}

- (void)writeGenericBVHStructureSizesOfAccelerationStructure:(id)a3 toBuffer:(id)a4 sizesBufferOffset:(unint64_t)a5
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTLLegacySVAccelerationStructureCommandEncoder;
  -[MTLToolsAccelerationStructureCommandEncoder writeGenericBVHStructureSizesOfAccelerationStructure:toBuffer:sizesBufferOffset:](&v5, sel_writeGenericBVHStructureSizesOfAccelerationStructure_toBuffer_sizesBufferOffset_, a3, a4, a5);
}

- (void)writeGenericBVHStructureOfAccelerationStructure:(id)a3 headerBuffer:(id)a4 headerBufferOffset:(unint64_t)a5 innerNodeBuffer:(id)a6 innerNodeBufferOffset:(unint64_t)a7 leafNodeBuffer:(id)a8 leafNodeBufferOffset:(unint64_t)a9 primitiveBuffer:(id)a10 primitiveBufferOffset:(unint64_t)a11 geometryBuffer:(id)a12 geometryOffset:(unint64_t)a13 instanceTransformBuffer:(id)a14 instanceTransformOffset:(unint64_t)a15
{
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)MTLLegacySVAccelerationStructureCommandEncoder;
  -[MTLLegacySVAccelerationStructureCommandEncoder writeGenericBVHStructureOfAccelerationStructure:headerBuffer:headerBufferOffset:innerNodeBuffer:innerNodeBufferOffset:leafNodeBuffer:leafNodeBufferOffset:primitiveBuffer:primitiveBufferOffset:geometryBuffer:geometryOffset:instanceTransformBuffer:instanceTransformOffset:](&v15, sel_writeGenericBVHStructureOfAccelerationStructure_headerBuffer_headerBufferOffset_innerNodeBuffer_innerNodeBufferOffset_leafNodeBuffer_leafNodeBufferOffset_primitiveBuffer_primitiveBufferOffset_geometryBuffer_geometryOffset_instanceTransformBuffer_instanceTransformOffset_, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15);
}

- (void)writeAccelerationStructureSerializationData:(id)a3 toBuffer:(id)a4 offset:(unint64_t)a5
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTLLegacySVAccelerationStructureCommandEncoder;
  -[MTLToolsAccelerationStructureCommandEncoder writeAccelerationStructureSerializationData:toBuffer:offset:](&v5, sel_writeAccelerationStructureSerializationData_toBuffer_offset_, a3, a4, a5);
}

- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTLLegacySVAccelerationStructureCommandEncoder;
  -[MTLToolsAccelerationStructureCommandEncoder sampleCountersInBuffer:atSampleIndex:withBarrier:](&v5, sel_sampleCountersInBuffer_atSampleIndex_withBarrier_, a3, a4, a5);
}

- (void)useResource:(id)a3 usage:(unint64_t)a4
{
  list<LegacySVResourceAndUsage, std::allocator<LegacySVResourceAndUsage>> *p_LegacySVResourceAndUsageList;
  _QWORD *v7;
  _QWORD *prev;

  p_LegacySVResourceAndUsageList = &self->_LegacySVResourceAndUsageList;
  v7 = operator new(0x20uLL);
  v7[2] = a3;
  v7[3] = a4;
  prev = p_LegacySVResourceAndUsageList->__end_.__prev_;
  *v7 = p_LegacySVResourceAndUsageList->__end_.__prev_;
  v7[1] = p_LegacySVResourceAndUsageList;
  prev[1] = v7;
  p_LegacySVResourceAndUsageList->__end_.__prev_ = v7;
  ++p_LegacySVResourceAndUsageList->__size_alloc_.__value_;
}

- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5
{
  unint64_t v6;
  uint64_t v9;

  if (a4)
  {
    v6 = a4;
    do
    {
      v9 = (uint64_t)*a3++;
      -[MTLLegacySVAccelerationStructureCommandEncoder useResource:usage:](self, "useResource:usage:", v9, a5);
      --v6;
    }
    while (v6);
  }
}

- (void)useHeap:(id)a3
{
  list<id<MTLHeap>, std::allocator<id<MTLHeap>>> *p_heapList;
  _QWORD *v5;
  _QWORD *prev;

  p_heapList = &self->_heapList;
  v5 = operator new(0x18uLL);
  v5[1] = p_heapList;
  v5[2] = a3;
  prev = p_heapList->__end_.__prev_;
  *v5 = p_heapList->__end_.__prev_;
  prev[1] = v5;
  p_heapList->__end_.__prev_ = v5;
  ++p_heapList->__size_alloc_.__value_;
}

- (void)useHeaps:(const void *)a3 count:(unint64_t)a4
{
  unint64_t v4;
  uint64_t v7;

  if (a4)
  {
    v4 = a4;
    do
    {
      v7 = (uint64_t)*a3++;
      -[MTLLegacySVAccelerationStructureCommandEncoder useHeap:](self, "useHeap:", v7);
      --v4;
    }
    while (v4);
  }
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLLegacySVAccelerationStructureCommandEncoder;
  -[MTLToolsObject dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  std::__list_imp<objc_object  {objcproto9MTLBuffer}*>::clear(&self->_heapList.__end_.__prev_);
  std::__list_imp<objc_object  {objcproto9MTLBuffer}*>::clear(&self->_LegacySVResourceAndUsageList.__end_.__prev_);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = (char *)self + 56;
  *((_QWORD *)self + 8) = (char *)self + 56;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 10) = (char *)self + 80;
  *((_QWORD *)self + 11) = (char *)self + 80;
  *((_QWORD *)self + 12) = 0;
  return self;
}

@end
