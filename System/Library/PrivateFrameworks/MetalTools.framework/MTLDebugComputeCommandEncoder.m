@implementation MTLDebugComputeCommandEncoder

- (void)_setDefaults
{
  __end_ ***var0;
  __end_cap_ ***var1;
  unint64_t v5;
  __end_cap_ ***v6;
  unint64_t v7;

  bzero(self->_buffers, 0xAA8uLL);
  bzero(self->_textures, 0x2C00uLL);
  bzero(self->_samplers, 0x580uLL);
  bzero(self->_threadgroupMemoryLengths, 0xAA8uLL);
  self->_imageBlockSize.width = 0;
  self->_imageBlockSize.height = 0;
  self->_imageBlockSize.depth = 1;
  self->canDealloc = 0;
  self->canEndEncoding = 0;
  self->canSetComputePipelineState = 1;
  self->hasEndEncoding = 0;
  self->hasSetComputePipelineState = 0;
  self->allowsNullBufferBinds = 0;
  var0 = self->updatedFences.__map_.var0;
  var1 = self->updatedFences.__map_.var1;
  self->updatedFences.__size_.__value_ = 0;
  v5 = (char *)var1 - (char *)var0;
  if (v5 >= 0x11)
  {
    do
    {
      operator delete(*var0);
      v6 = self->updatedFences.__map_.var1;
      var0 = self->updatedFences.__map_.var0 + 1;
      self->updatedFences.__map_.var0 = var0;
      v5 = (char *)v6 - (char *)var0;
    }
    while (v5 > 0x10);
  }
  if (v5 >> 3 == 1)
  {
    v7 = 256;
    goto LABEL_7;
  }
  if (v5 >> 3 == 2)
  {
    v7 = 512;
LABEL_7:
    self->updatedFences.__start_ = v7;
  }
  self->_activeSubstream = 0;
  self->_numSubstreams = 0;
  std::__tree<unsigned int>::destroy((uint64_t)&self->_progressLabels, (_QWORD *)self->_progressLabels.__tree_.__pair1_.__value_.__left_);
  self->_progressLabels.__tree_.__begin_node_ = &self->_progressLabels.__tree_.__pair1_;
  self->_progressLabels.__tree_.__pair3_.__value_ = 0;
  self->_progressLabels.__tree_.__pair1_.__value_.__left_ = 0;
  self->_encodingVirtualSubstream = 0;
  self->_currentVirtualSubstreamIndex = 0;
  self->_encodedVirtualSubstreamDispatch = 0;
}

- (MTLDebugComputeCommandEncoder)initWithComputeCommandEncoder:(id)a3 commandBuffer:(id)a4 descriptor:(id)a5
{
  MTLDebugComputeCommandEncoder *v7;
  MTLDebugComputeCommandEncoder *v8;
  uint64_t i;
  unsigned int v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MTLDebugComputeCommandEncoder;
  v7 = -[MTLToolsComputeCommandEncoder initWithComputeCommandEncoder:parent:descriptor:](&v12, sel_initWithComputeCommandEncoder_parent_descriptor_, a3);
  v8 = v7;
  if (v7)
  {
    v7->_commandBuffer = (MTLDebugCommandBuffer *)a4;
    -[MTLDebugComputeCommandEncoder _setDefaults](v7, "_setDefaults");
    v8->hasSetStageInRegion = 0;
    if (a5)
    {
      for (i = 0; i != 4; ++i)
        -[MTLDebugCommandBuffer addObject:retained:purgeable:](v8->_commandBuffer, "addObject:retained:purgeable:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "sampleBufferAttachments"), "objectAtIndexedSubscript:", i), "sampleBuffer"), 1, 0);
    }
    v10 = objc_msgSend(a5, "substreamCount");
    v8->_activeSubstream = 0;
    v8->_numSubstreams = v10;
    std::__tree<unsigned int>::destroy((uint64_t)&v8->_progressLabels, (_QWORD *)v8->_progressLabels.__tree_.__pair1_.__value_.__left_);
    v8->_progressLabels.__tree_.__begin_node_ = &v8->_progressLabels.__tree_.__pair1_;
    v8->_progressLabels.__tree_.__pair3_.__value_ = 0;
    v8->_progressLabels.__tree_.__pair1_.__value_.__left_ = 0;
  }
  return v8;
}

- (void)dealloc
{
  deque<id, std::allocator<id>> *p_updatedFences;
  void **var0;
  __end_cap_ ***var1;
  unint64_t v6;
  __end_cap_ ***v7;
  uint64_t v8;
  objc_super v9;

  p_updatedFences = &self->updatedFences;
  var0 = (void **)self->updatedFences.__map_.var0;
  var1 = self->updatedFences.__map_.var1;
  self->updatedFences.__size_.__value_ = 0;
  v6 = (char *)var1 - (char *)var0;
  if (v6 >= 0x11)
  {
    do
    {
      operator delete(*var0);
      v7 = p_updatedFences->__map_.var1;
      var0 = (void **)(p_updatedFences->__map_.var0 + 1);
      p_updatedFences->__map_.var0 = (__end_ ***)var0;
      v6 = (char *)v7 - (char *)var0;
    }
    while (v6 > 0x10);
  }
  if (v6 >> 3 == 1)
  {
    v8 = 256;
  }
  else
  {
    if (v6 >> 3 != 2)
      goto LABEL_8;
    v8 = 512;
  }
  p_updatedFences->__start_ = v8;
LABEL_8:
  if (self->canDealloc)
  {
    v9.receiver = self;
    v9.super_class = (Class)MTLDebugComputeCommandEncoder;
    -[MTLToolsObject dealloc](&v9, sel_dealloc);
  }
  else
  {
    objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "endEncoding");
    v9.receiver = self;
    v9.super_class = (Class)MTLDebugComputeCommandEncoder;
    -[MTLToolsObject dealloc](&v9, sel_dealloc);
    MTLReportFailure();
  }
}

- (id)formattedDescription:(unint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  MTLComputePipelineState *computePipelineState;
  const __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  MTLDebugComputeCommandEncoder *v13;
  uint64_t v14;
  MTLDebugComputeCommandEncoder *v15;
  uint64_t v16;
  MTLDebugComputeCommandEncoder *v17;
  MTLDebugComputeCommandEncoder *v19;
  objc_super v20;
  _QWORD v21[2];
  _QWORD v22[3];
  _QWORD v23[2];
  _QWORD v24[3];
  _QWORD v25[2];
  _QWORD v26[3];
  _QWORD v27[2];
  _QWORD v28[3];
  _QWORD v29[7];

  v29[5] = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  v6 = a3 + 8;
  v7 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 8, CFSTR(" "), 0);
  v8 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 226);
  computePipelineState = self->_computePipelineState;
  v29[0] = v5;
  v29[1] = CFSTR("computePipelineState =");
  v10 = CFSTR("<null>");
  if (computePipelineState)
    v10 = (const __CFString *)computePipelineState;
  v29[2] = v10;
  v29[3] = v5;
  v29[4] = CFSTR("Set Buffers:");
  objc_msgSend(v8, "addObjectsFromArray:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 5));
  v11 = 0;
  v19 = self;
  do
  {
    v28[0] = v7;
    v28[1] = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Buffer %lu:"), v11);
    v28[2] = argumentFormattedDescription(v6, (uint64_t)self->_buffers);
    objc_msgSend(v8, "addObjectsFromArray:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 3));
    ++v11;
    self = (MTLDebugComputeCommandEncoder *)((char *)self + 88);
  }
  while (v11 != 31);
  v27[0] = v5;
  v27[1] = CFSTR("Set Textures:");
  objc_msgSend(v8, "addObjectsFromArray:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 2));
  v12 = 0;
  v13 = v19;
  do
  {
    v26[0] = v7;
    v26[1] = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Texture %lu:"), v12);
    v26[2] = argumentFormattedDescription(v6, (uint64_t)v13->_textures);
    objc_msgSend(v8, "addObjectsFromArray:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 3));
    ++v12;
    v13 = (MTLDebugComputeCommandEncoder *)((char *)v13 + 88);
  }
  while (v12 != 128);
  v25[0] = v5;
  v25[1] = CFSTR("Set Samplers:");
  objc_msgSend(v8, "addObjectsFromArray:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 2));
  v14 = 0;
  v15 = v19;
  do
  {
    v24[0] = v7;
    v24[1] = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Sampler %lu:"), v14);
    v24[2] = argumentFormattedDescription(v6, (uint64_t)v15->_samplers);
    objc_msgSend(v8, "addObjectsFromArray:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 3));
    ++v14;
    v15 = (MTLDebugComputeCommandEncoder *)((char *)v15 + 88);
  }
  while (v14 != 16);
  v23[0] = v5;
  v23[1] = CFSTR("Set ThreadgroupMemoryLengths:");
  objc_msgSend(v8, "addObjectsFromArray:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2));
  v16 = 0;
  v17 = v19;
  do
  {
    v22[0] = v7;
    v22[1] = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Threadgroup %lu:"), v16);
    v22[2] = argumentFormattedDescription(v6, (uint64_t)v17->_threadgroupMemoryLengths);
    objc_msgSend(v8, "addObjectsFromArray:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 3));
    ++v16;
    v17 = (MTLDebugComputeCommandEncoder *)((char *)v17 + 88);
  }
  while (v16 != 31);
  v21[0] = v5;
  v21[1] = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Image Block Size: %lu x %lu"), v19->_imageBlockSize.width, v19->_imageBlockSize.height);
  objc_msgSend(v8, "addObjectsFromArray:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2));
  v20.receiver = v19;
  v20.super_class = (Class)MTLDebugComputeCommandEncoder;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), -[MTLToolsObject description](&v20, sel_description), objc_msgSend(v8, "componentsJoinedByString:", CFSTR(" ")));
}

- (id)description
{
  return -[MTLDebugComputeCommandEncoder formattedDescription:](self, "formattedDescription:", 0);
}

- (void)setComputePipelineState:(id)a3
{
  MTLToolsDevice *device;

  if (!self->hasEndEncoding)
  {
    if (a3)
      goto LABEL_3;
LABEL_13:
    MTLReportFailure();
    goto LABEL_6;
  }
  MTLReportFailure();
  if (!a3)
    goto LABEL_13;
LABEL_3:
  if ((objc_msgSend(a3, "conformsToProtocol:", &unk_255C5AA38) & 1) == 0)
    MTLReportFailure();
  device = self->super.super.super._device;
  if (device != (MTLToolsDevice *)objc_msgSend(a3, "device"))
    goto LABEL_13;
LABEL_6:
  if (self->hasSetComputePipelineState && self->_computePipelineState == a3)
    MTLReportFailure();
  self->hasSetComputePipelineState = 1;
  if (!self->canSetComputePipelineState)
    MTLReportFailure();
  self->canSetComputePipelineState = 0;
  -[MTLDebugCommandBuffer addObject:retained:purgeable:](self->_commandBuffer, "addObject:retained:purgeable:", a3, 1, 0);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setComputePipelineState:", objc_msgSend(a3, "baseObject"));
  self->_computePipelineState = (MTLComputePipelineState *)a3;
}

- (void)setBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  -[MTLDebugComputeCommandEncoder setBytes:length:attributeStride:atIndex:](self, "setBytes:length:attributeStride:atIndex:", a3, a4, -1, a5);
}

- (void)setBytes:(const void *)a3 length:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  MTLDebugFunctionArgument *v11;
  _BOOL4 v12;
  id v13;
  unint64_t v14;
  unint64_t v15;

  if (self->hasEndEncoding)
    MTLReportFailure();
  if (-[MTLToolsDevice maxComputeBuffers](self->super.super.super._device, "maxComputeBuffers") <= a6)
  {
    v14 = a6;
    v15 = -[MTLToolsDevice maxComputeBuffers](self->super.super.super._device, "maxComputeBuffers");
    MTLReportFailure();
  }
  if (-[MTLToolsDevice maxComputeInlineDataSize](self->super.super.super._device, "maxComputeInlineDataSize", v14, v15) < a4)
  {
    -[MTLToolsDevice maxComputeInlineDataSize](self->super.super.super._device, "maxComputeInlineDataSize");
    MTLReportFailure();
  }
  v11 = &self->_buffers[a6];
  validateArg(MTLArgumentTypeBuffer, a6, v11);
  v12 = -[MTLToolsDevice supportsDynamicAttributeStride](self->super.super.super._device, "supportsDynamicAttributeStride");
  v13 = -[MTLToolsObject baseObject](self, "baseObject");
  if (v12)
    objc_msgSend(v13, "setBytes:length:attributeStride:atIndex:", a3, a4, a5, a6);
  else
    objc_msgSend(v13, "setBytes:length:atIndex:", a3, a4, a6);
  MTLReportFailureTypeEnabled();
  v11->isValid = a4 != 0;
  v11->hasBeenUsed = 0;
  v11->type = 0;
  v11->object = 0;
  v11->var0 = 0;
  v11->bufferLength = a4;
  v11->bufferOffset = 0;
  v11->bufferAttributeStride = a5;
  v11->threadgroupMemoryLength = 0;
  v11->threadgroupMemoryOffset = 0;
  v11->hasLodClamp = 0;
  v11->lodMinClamp = 0.0;
  v11->lodMaxClamp = 0.0;
}

- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  -[MTLDebugComputeCommandEncoder setBuffer:offset:attributeStride:atIndex:](self, "setBuffer:offset:attributeStride:atIndex:", a3, a4, -1, a5);
}

- (void)setBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  MTLToolsDevice *device;
  MTLDebugFunctionArgument *buffers;
  MTLDebugFunctionArgument *v13;
  _BOOL4 v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  MTLDebugFunctionArgument *v18;
  unint64_t v19;
  uint64_t v20;

  if (self->hasEndEncoding)
    MTLReportFailure();
  if (-[MTLToolsDevice maxComputeBuffers](self->super.super.super._device, "maxComputeBuffers") > a6)
  {
    if (a3)
      goto LABEL_5;
LABEL_12:
    if (!a4)
      goto LABEL_13;
    v19 = a4;
    goto LABEL_29;
  }
  v19 = a6;
  v20 = -[MTLToolsDevice maxComputeBuffers](self->super.super.super._device, "maxComputeBuffers");
  MTLReportFailure();
  if (!a3)
    goto LABEL_12;
LABEL_5:
  if ((objc_msgSend(a3, "conformsToProtocol:", &unk_255C54558, v19, v20) & 1) == 0)
    MTLReportFailure();
  device = self->super.super.super._device;
  if (device != (MTLToolsDevice *)objc_msgSend(a3, "device"))
    MTLReportFailure();
  if (objc_msgSend(a3, "length") <= a4)
  {
    v19 = a4;
    v20 = objc_msgSend(a3, "length");
LABEL_29:
    MTLReportFailure();
  }
LABEL_13:
  buffers = self->_buffers;
  v13 = &self->_buffers[a6];
  validateArg(MTLArgumentTypeBuffer, a6, v13);
  -[MTLDebugCommandBuffer addObject:retained:purgeable:](self->_commandBuffer, "addObject:retained:purgeable:", a3, 1, 1);
  v14 = -[MTLToolsDevice supportsDynamicAttributeStride](self->super.super.super._device, "supportsDynamicAttributeStride");
  v15 = -[MTLToolsObject baseObject](self, "baseObject");
  v16 = objc_msgSend(a3, "baseObject");
  if (v14)
    objc_msgSend(v15, "setBuffer:offset:attributeStride:atIndex:", v16, a4, a5, a6);
  else
    objc_msgSend(v15, "setBuffer:offset:atIndex:", v16, a4, a6);
  v17 = objc_msgSend(a3, "length", v19, v20);
  if (MTLReportFailureTypeEnabled())
  {
    if (a3)
    {
      v18 = &buffers[a6];
      if (!v18->hasLodClamp
        && v18->bufferAttributeStride == a5
        && v18->bufferOffset == a4
        && v18->bufferLength == v17
        && v18->object == a3
        && !(v18->var0 | v18->type)
        && *(_OWORD *)&v18->threadgroupMemoryLength == 0
        && !*(_QWORD *)&v18->lodMinClamp)
      {
        MTLReportFailure();
      }
    }
  }
  v13->isValid = v17 != 0;
  v13->hasBeenUsed = 0;
  v13->type = 0;
  v13->object = (baseLevel *)a3;
  v13->var0 = 0;
  v13->bufferLength = v17;
  v13->bufferOffset = a4;
  v13->bufferAttributeStride = a5;
  v13->threadgroupMemoryLength = 0;
  v13->threadgroupMemoryOffset = 0;
  v13->hasLodClamp = 0;
  v13->lodMinClamp = 0.0;
  v13->lodMaxClamp = 0.0;
}

- (void)setBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  -[MTLDebugComputeCommandEncoder setBufferOffset:attributeStride:atIndex:](self, "setBufferOffset:attributeStride:atIndex:", a3, -1, a4);
}

- (void)setBufferOffset:(unint64_t)a3 attributeStride:(unint64_t)a4 atIndex:(unint64_t)a5
{
  MTLDebugFunctionArgument *buffers;
  MTLDebugFunctionArgument *v10;
  id object;
  id *p_object;
  _BOOL4 v13;
  id v14;
  baseLevel *v15;
  uint64_t v16;
  MTLDebugFunctionArgument *v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;

  if (self->hasEndEncoding)
    MTLReportFailure();
  if (-[MTLToolsDevice maxComputeBuffers](self->super.super.super._device, "maxComputeBuffers") <= a5)
  {
    v18 = a5;
    v20 = -[MTLToolsDevice maxComputeBuffers](self->super.super.super._device, "maxComputeBuffers");
    MTLReportFailure();
  }
  buffers = self->_buffers;
  v10 = &self->_buffers[a5];
  validateArg(MTLArgumentTypeBuffer, a5, v10);
  p_object = (id *)&v10->object;
  object = v10->object;
  if (!object)
  {
    v18 = a5;
    MTLReportFailure();
    object = *p_object;
  }
  if (objc_msgSend(object, "length", v18, v20) <= a3)
  {
    v19 = a3;
    v21 = objc_msgSend(*p_object, "length");
    MTLReportFailure();
  }
  v13 = -[MTLToolsDevice supportsDynamicAttributeStride](self->super.super.super._device, "supportsDynamicAttributeStride", v19, v21);
  v14 = -[MTLToolsObject baseObject](self, "baseObject");
  if (v13)
    objc_msgSend(v14, "setBufferOffset:attributeStride:atIndex:", a3, a4, a5);
  else
    objc_msgSend(v14, "setBufferOffset:atIndex:", a3, a5);
  v15 = (baseLevel *)*p_object;
  v16 = objc_msgSend(*p_object, "length");
  if (MTLReportFailureTypeEnabled())
  {
    if (v15)
    {
      v17 = &buffers[a5];
      if (!v17->hasLodClamp
        && v17->bufferAttributeStride == -1
        && v17->bufferOffset == a3
        && v17->bufferLength == v16
        && *p_object == v15
        && !(v17->var0 | v17->type)
        && *(_OWORD *)&v17->threadgroupMemoryLength == 0
        && !*(_QWORD *)&v17->lodMinClamp)
      {
        MTLReportFailure();
      }
    }
  }
  v10->isValid = v16 != 0;
  v10->hasBeenUsed = 0;
  v10->type = 0;
  v10->object = v15;
  v10->var0 = 0;
  v10->bufferLength = v16;
  v10->bufferOffset = a3;
  v10->bufferAttributeStride = -1;
  v10->threadgroupMemoryLength = 0;
  v10->threadgroupMemoryOffset = 0;
  v10->hasLodClamp = 0;
  v10->lodMinClamp = 0.0;
  v10->lodMaxClamp = 0.0;
}

- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  void *v10;
  void *__b[3];

  length = a5.length;
  location = a5.location;
  std::vector<unsigned long>::vector(__b, a5.length);
  v10 = __b[0];
  if (length)
    memset(__b[0], 255, 8 * length);
  -[MTLDebugComputeCommandEncoder setBuffers:offsets:attributeStrides:withRange:](self, "setBuffers:offsets:attributeStrides:withRange:", a3, a4, v10, location, length);
  if (__b[0])
  {
    __b[1] = __b[0];
    operator delete(__b[0]);
  }
}

- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 attributeStrides:(const unint64_t *)a5 withRange:(_NSRange)a6
{
  NSUInteger length;
  NSUInteger location;
  MTLDebugComputeCommandEncoder *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  MTLToolsDevice *device;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  BOOL v22;
  BOOL v23;
  BOOL v24;
  BOOL v25;
  BOOL v26;
  BOOL v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  MTLDebugComputeCommandEncoder *v35;
  NSUInteger v36;
  NSUInteger v37;
  _QWORD v39[33];

  length = a6.length;
  location = a6.location;
  v10 = self;
  v39[31] = *MEMORY[0x24BDAC8D0];
  if (self->hasEndEncoding)
    MTLReportFailure();
  if (location + length > -[MTLToolsDevice maxComputeBuffers](v10->super.super.super._device, "maxComputeBuffers"))
  {
    v30 = (void *)(location + length);
    v32 = -[MTLToolsDevice maxComputeBuffers](v10->super.super.super._device, "maxComputeBuffers");
    MTLReportFailure();
    if (length)
      goto LABEL_5;
  }
  else if (length)
  {
LABEL_5:
    v11 = 0;
    v12 = (uint64_t)(&v10->super.super._commandBuffer + 11 * location);
    v36 = location;
    v37 = length;
    v35 = v10;
    while (1)
    {
      v13 = (void *)a3[(_QWORD)v11];
      if (v13)
        break;
      if (a4[(_QWORD)v11])
      {
        v30 = v11;
        v32 = a4[(_QWORD)v11];
LABEL_40:
        MTLReportFailure();
      }
LABEL_14:
      v17 = v12 + 48;
      validateArg(MTLArgumentTypeBuffer, (unint64_t)v11 + location, (MTLDebugFunctionArgument *)(v12 + 8));
      -[MTLDebugCommandBuffer addObject:retained:purgeable:](v10->_commandBuffer, "addObject:retained:purgeable:", a3[(_QWORD)v11], 1, 1);
      v39[(_QWORD)v11] = objc_msgSend((id)a3[(_QWORD)v11], "baseObject");
      v18 = (void *)a3[(_QWORD)v11];
      v19 = objc_msgSend(v18, "length");
      v20 = a4[(_QWORD)v11];
      v21 = a5[(_QWORD)v11];
      if (MTLReportFailureTypeEnabled() && v18 && !*(_BYTE *)(v12 + 80))
      {
        v22 = *(_QWORD *)(v12 + 56) == v21 && *(_QWORD *)v17 == v20;
        v23 = v22 && *(_QWORD *)(v12 + 40) == v19;
        v24 = v23 && *(_QWORD *)(v12 + 24) == (_QWORD)v18;
        v25 = v24 && (*(_QWORD *)(v12 + 32) | *(_QWORD *)(v12 + 16)) == 0;
        v26 = v25 && *(_OWORD *)(v12 + 64) == 0;
        if (v26 && *(_QWORD *)(v12 + 84) == 0)
        {
          v30 = v18;
          MTLReportFailure();
        }
      }
      *(_BYTE *)(v12 + 8) = v19 != 0;
      *(_BYTE *)(v12 + 9) = 0;
      *(_QWORD *)(v12 + 16) = 0;
      *(_QWORD *)(v12 + 24) = v18;
      *(_QWORD *)(v12 + 32) = 0;
      *(_QWORD *)(v12 + 40) = v19;
      *(_QWORD *)v17 = v20;
      *(_QWORD *)(v12 + 56) = v21;
      *(_QWORD *)(v12 + 64) = 0;
      *(_QWORD *)(v12 + 72) = 0;
      *(_BYTE *)(v12 + 80) = 0;
      v11 = (char *)v11 + 1;
      v12 += 88;
      *(_DWORD *)(v17 + 36) = 0;
      *(_DWORD *)(v17 + 40) = 0;
      location = v36;
      length = v37;
      v10 = v35;
      if ((void *)v37 == v11)
        goto LABEL_42;
    }
    if ((objc_msgSend(v13, "conformsToProtocol:", &unk_255C54558) & 1) == 0)
    {
      v30 = v11;
      MTLReportFailure();
    }
    device = v10->super.super.super._device;
    if (device != (MTLToolsDevice *)objc_msgSend((id)a3[(_QWORD)v11], "device", v30, v32, v33, v34))
    {
      v31 = v11;
      MTLReportFailure();
    }
    v15 = a4[(_QWORD)v11];
    if (v15 < objc_msgSend((id)a3[(_QWORD)v11], "length", v31))
      goto LABEL_14;
    v16 = a4[(_QWORD)v11];
    v33 = v11;
    v34 = objc_msgSend((id)a3[(_QWORD)v11], "length");
    v30 = v11;
    v32 = v16;
    goto LABEL_40;
  }
LABEL_42:
  v28 = -[MTLToolsDevice supportsDynamicAttributeStride](v10->super.super.super._device, "supportsDynamicAttributeStride", v30, v32, v33, v34);
  v29 = -[MTLToolsObject baseObject](v10, "baseObject");
  if (v28)
    objc_msgSend(v29, "setBuffers:offsets:attributeStrides:withRange:", v39, a4, a5, location, length);
  else
    objc_msgSend(v29, "setBuffers:offsets:withRange:", v39, a4, location, length);
}

- (void)setTexture:(id)a3 atIndex:(unint64_t)a4
{
  MTLToolsDevice *device;
  MTLDebugFunctionArgument *v8;
  MTLDebugFunctionArgument *v9;
  unint64_t type;
  baseLevel *object;
  unint64_t bufferAttributeStride;
  unint64_t v13;
  unint64_t v14;
  _BOOL4 hasLodClamp;
  int v16;
  unint64_t v23;
  unint64_t v24;

  if (self->hasEndEncoding)
    MTLReportFailure();
  if (-[MTLToolsDevice maxComputeTextures](self->super.super.super._device, "maxComputeTextures") <= a4)
  {
    v23 = a4;
    v24 = -[MTLToolsDevice maxComputeTextures](self->super.super.super._device, "maxComputeTextures");
    MTLReportFailure();
    if (!a3)
      goto LABEL_13;
  }
  else if (!a3)
  {
    goto LABEL_13;
  }
  if ((objc_msgSend(a3, "conformsToProtocol:", &unk_255C6E6C0, v23, v24) & 1) == 0)
    MTLReportFailure();
  device = self->super.super.super._device;
  if (device != (MTLToolsDevice *)objc_msgSend(a3, "device"))
    MTLReportFailure();
  if (objc_msgSend((id)objc_msgSend(a3, "baseObject"), "isFramebufferOnly"))
    MTLReportFailure();
  if (objc_msgSend((id)objc_msgSend(a3, "baseObject"), "storageMode") == 3)
    MTLReportFailure();
LABEL_13:
  v8 = &self->_textures[a4];
  validateArg(MTLArgumentTypeTexture, a4, v8);
  -[MTLDebugCommandBuffer addObject:retained:purgeable:](self->_commandBuffer, "addObject:retained:purgeable:", a3, 1, 1);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setTexture:atIndex:", objc_msgSend(a3, "baseObject"), a4);
  if (MTLReportFailureTypeEnabled())
  {
    v9 = &self->_textures[a4];
    type = v9->type;
    object = v9->object;
    bufferAttributeStride = v9->bufferAttributeStride;
    v13 = v9->bufferLength | v9->var0 | v9->bufferOffset;
    v14 = v9->threadgroupMemoryOffset | v9->threadgroupMemoryLength;
    hasLodClamp = v9->hasLodClamp;
    v16 = LODWORD(v9->lodMaxClamp) | LODWORD(v9->lodMinClamp);
    if (!hasLodClamp && bufferAttributeStride == -1 && type == 1 && object == a3 && v13 == 0 && v14 == 0 && v16 == 0)
      MTLReportFailure();
  }
  v8->isValid = a3 != 0;
  v8->hasBeenUsed = 0;
  v8->type = 1;
  v8->object = (baseLevel *)a3;
  v8->var0 = 0;
  v8->bufferLength = 0;
  v8->bufferOffset = 0;
  v8->bufferAttributeStride = -1;
  v8->threadgroupMemoryLength = 0;
  v8->threadgroupMemoryOffset = 0;
  v8->hasLodClamp = 0;
  v8->lodMinClamp = 0.0;
  v8->lodMaxClamp = 0.0;
}

- (void)setTextures:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  const void *v8;
  char *v9;
  void *v10;
  MTLToolsDevice *device;
  char *v12;
  const void *v13;
  BOOL v14;
  const void *v20;
  const void *v21;
  const void *v22;
  unint64_t v23;
  _QWORD v24[130];

  length = a4.length;
  location = a4.location;
  v24[128] = *MEMORY[0x24BDAC8D0];
  if (self->hasEndEncoding)
    MTLReportFailure();
  if (location + length > -[MTLToolsDevice maxComputeTextures](self->super.super.super._device, "maxComputeTextures"))
  {
    v20 = (const void *)(location + length);
    v23 = -[MTLToolsDevice maxComputeTextures](self->super.super.super._device, "maxComputeTextures");
    MTLReportFailure();
    if (!length)
      goto LABEL_39;
  }
  else if (!length)
  {
    goto LABEL_39;
  }
  v8 = 0;
  v9 = (char *)self + 88 * location;
  do
  {
    v10 = (void *)a3[(_QWORD)v8];
    if (v10)
    {
      if ((objc_msgSend(v10, "conformsToProtocol:", &unk_255C6E6C0) & 1) == 0)
      {
        v20 = v8;
        MTLReportFailure();
      }
      device = self->super.super.super._device;
      if (device != (MTLToolsDevice *)objc_msgSend((id)a3[(_QWORD)v8], "device", v20, v23))
      {
        v21 = v8;
        MTLReportFailure();
      }
      if (objc_msgSend((id)objc_msgSend((id)a3[(_QWORD)v8], "baseObject", v21), "isFramebufferOnly"))
      {
        v22 = v8;
        MTLReportFailure();
      }
      if (objc_msgSend((id)objc_msgSend((id)a3[(_QWORD)v8], "baseObject", v22), "storageMode") == 3)
      {
        v20 = v8;
        MTLReportFailure();
      }
    }
    v12 = v9 + 2776;
    validateArg(MTLArgumentTypeTexture, (unint64_t)v8 + location, (MTLDebugFunctionArgument *)(v9 + 2776));
    -[MTLDebugCommandBuffer addObject:retained:purgeable:](self->_commandBuffer, "addObject:retained:purgeable:", a3[(_QWORD)v8], 1, 1);
    v24[(_QWORD)v8] = objc_msgSend((id)a3[(_QWORD)v8], "baseObject");
    v13 = a3[(_QWORD)v8];
    if (MTLReportFailureTypeEnabled())
    {
      if (v9[2848])
        v14 = 0;
      else
        v14 = *((_QWORD *)v9 + 353) == -1;
      if (v14
        && *((_QWORD *)v9 + 348) == 1
        && *((_QWORD *)v9 + 349) == (_QWORD)v13
        && (*((_QWORD *)v9 + 351) | *((_QWORD *)v9 + 350) | *((_QWORD *)v9 + 352)) == 0
        && *((_OWORD *)v9 + 177) == 0
        && *(_QWORD *)(v9 + 2852) == 0)
      {
        v20 = v13;
        MTLReportFailure();
      }
    }
    *v12 = v13 != 0;
    v9[2777] = 0;
    *((_QWORD *)v9 + 348) = 1;
    *((_QWORD *)v9 + 349) = v13;
    *((_QWORD *)v9 + 350) = 0;
    *((_QWORD *)v9 + 351) = 0;
    *((_QWORD *)v9 + 352) = 0;
    *((_QWORD *)v9 + 353) = -1;
    *((_QWORD *)v9 + 354) = 0;
    *((_QWORD *)v9 + 355) = 0;
    v9[2848] = 0;
    v8 = (char *)v8 + 1;
    v9 += 88;
    *((_DWORD *)v12 + 19) = 0;
    *((_DWORD *)v12 + 20) = 0;
  }
  while ((const void *)length != v8);
LABEL_39:
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", v20), "setTextures:withRange:", v24, location, length);
}

- (void)setSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  MTLToolsDevice *device;
  MTLDebugFunctionArgument *v8;
  MTLDebugFunctionArgument *v9;
  unint64_t type;
  baseLevel *object;
  unint64_t bufferAttributeStride;
  unint64_t v13;
  unint64_t v14;
  _BOOL4 hasLodClamp;
  int v16;
  unint64_t v23;
  unint64_t v24;

  if (self->hasEndEncoding)
    MTLReportFailure();
  if (-[MTLToolsDevice maxComputeSamplers](self->super.super.super._device, "maxComputeSamplers") <= a4)
  {
    v23 = a4;
    v24 = -[MTLToolsDevice maxComputeSamplers](self->super.super.super._device, "maxComputeSamplers");
    MTLReportFailure();
    if (!a3)
      goto LABEL_9;
  }
  else if (!a3)
  {
    goto LABEL_9;
  }
  if ((objc_msgSend(a3, "conformsToProtocol:", &unk_255C54070, v23, v24) & 1) == 0)
    MTLReportFailure();
  device = self->super.super.super._device;
  if (device != (MTLToolsDevice *)objc_msgSend(a3, "device"))
    MTLReportFailure();
LABEL_9:
  v8 = &self->_samplers[a4];
  validateArg(MTLArgumentTypeSampler, a4, v8);
  -[MTLDebugCommandBuffer addObject:retained:purgeable:](self->_commandBuffer, "addObject:retained:purgeable:", a3, 1, 0);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setSamplerState:atIndex:", objc_msgSend(a3, "baseObject"), a4);
  if (MTLReportFailureTypeEnabled())
  {
    v9 = &self->_samplers[a4];
    type = v9->type;
    object = v9->object;
    bufferAttributeStride = v9->bufferAttributeStride;
    v13 = v9->bufferLength | v9->var0 | v9->bufferOffset;
    v14 = v9->threadgroupMemoryOffset | v9->threadgroupMemoryLength;
    hasLodClamp = v9->hasLodClamp;
    v16 = LODWORD(v9->lodMaxClamp) | LODWORD(v9->lodMinClamp);
    if (!hasLodClamp && bufferAttributeStride == -1 && type == 2 && object == a3 && v13 == 0 && v14 == 0 && v16 == 0)
      MTLReportFailure();
  }
  v8->isValid = a3 != 0;
  v8->hasBeenUsed = 0;
  v8->type = 2;
  v8->object = (baseLevel *)a3;
  v8->var0 = 0;
  v8->bufferLength = 0;
  v8->bufferOffset = 0;
  v8->bufferAttributeStride = -1;
  v8->threadgroupMemoryLength = 0;
  v8->threadgroupMemoryOffset = 0;
  v8->hasLodClamp = 0;
  v8->lodMinClamp = 0.0;
  v8->lodMaxClamp = 0.0;
}

- (void)setSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  const void *v8;
  char *v9;
  void *v10;
  MTLToolsDevice *device;
  char *v12;
  const void *v13;
  BOOL v14;
  const void *v20;
  unint64_t v21;
  _QWORD v22[18];

  length = a4.length;
  location = a4.location;
  v22[16] = *MEMORY[0x24BDAC8D0];
  if (self->hasEndEncoding)
    MTLReportFailure();
  if (location + length > -[MTLToolsDevice maxComputeSamplers](self->super.super.super._device, "maxComputeSamplers"))
  {
    v20 = (const void *)(location + length);
    v21 = -[MTLToolsDevice maxComputeSamplers](self->super.super.super._device, "maxComputeSamplers");
    MTLReportFailure();
    if (!length)
      goto LABEL_35;
  }
  else if (!length)
  {
    goto LABEL_35;
  }
  v8 = 0;
  v9 = (char *)self + 88 * location;
  do
  {
    v10 = (void *)a3[(_QWORD)v8];
    if (v10)
    {
      if ((objc_msgSend(v10, "conformsToProtocol:", &unk_255C54070) & 1) == 0)
      {
        v20 = v8;
        MTLReportFailure();
      }
      device = self->super.super.super._device;
      if (device != (MTLToolsDevice *)objc_msgSend((id)a3[(_QWORD)v8], "device", v20, v21))
      {
        v20 = v8;
        MTLReportFailure();
      }
    }
    v12 = v9 + 14040;
    validateArg(MTLArgumentTypeSampler, (unint64_t)v8 + location, (MTLDebugFunctionArgument *)(v9 + 14040));
    -[MTLDebugCommandBuffer addObject:retained:purgeable:](self->_commandBuffer, "addObject:retained:purgeable:", a3[(_QWORD)v8], 1, 0);
    v22[(_QWORD)v8] = objc_msgSend((id)a3[(_QWORD)v8], "baseObject");
    v13 = a3[(_QWORD)v8];
    if (MTLReportFailureTypeEnabled())
    {
      if (v9[14112])
        v14 = 0;
      else
        v14 = *((_QWORD *)v9 + 1761) == -1;
      if (v14
        && *((_QWORD *)v9 + 1756) == 2
        && *((_QWORD *)v9 + 1757) == (_QWORD)v13
        && (*((_QWORD *)v9 + 1759) | *((_QWORD *)v9 + 1758) | *((_QWORD *)v9 + 1760)) == 0
        && *((_OWORD *)v9 + 881) == 0
        && *(_QWORD *)(v9 + 14116) == 0)
      {
        v20 = v13;
        MTLReportFailure();
      }
    }
    *v12 = v13 != 0;
    v9[14041] = 0;
    *((_QWORD *)v9 + 1756) = 2;
    *((_QWORD *)v9 + 1757) = v13;
    *((_QWORD *)v9 + 1758) = 0;
    *((_QWORD *)v9 + 1759) = 0;
    *((_QWORD *)v9 + 1760) = 0;
    *((_QWORD *)v9 + 1761) = -1;
    *((_QWORD *)v9 + 1762) = 0;
    *((_QWORD *)v9 + 1763) = 0;
    v9[14112] = 0;
    v8 = (char *)v8 + 1;
    v9 += 88;
    *((_DWORD *)v12 + 19) = 0;
    *((_DWORD *)v12 + 20) = 0;
  }
  while ((const void *)length != v8);
LABEL_35:
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", v20), "setSamplerStates:withRange:", v22, location, length);
}

- (void)setSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  MTLToolsDevice *device;
  MTLDebugFunctionArgument *samplers;
  MTLDebugFunctionArgument *v13;
  id v14;
  uint64_t v15;
  double v16;
  double v17;
  MTLDebugFunctionArgument *v18;
  unint64_t v26;
  unint64_t v27;

  if (self->hasEndEncoding)
    MTLReportFailure();
  if (-[MTLToolsDevice maxComputeSamplers](self->super.super.super._device, "maxComputeSamplers") <= a6)
  {
    v26 = a6;
    v27 = -[MTLToolsDevice maxComputeSamplers](self->super.super.super._device, "maxComputeSamplers");
    MTLReportFailure();
    if (!a3)
      goto LABEL_9;
  }
  else if (!a3)
  {
    goto LABEL_9;
  }
  if ((objc_msgSend(a3, "conformsToProtocol:", &unk_255C54070, v26, v27) & 1) == 0)
    MTLReportFailure();
  device = self->super.super.super._device;
  if (device != (MTLToolsDevice *)objc_msgSend(a3, "device"))
    MTLReportFailure();
LABEL_9:
  samplers = self->_samplers;
  v13 = &self->_samplers[a6];
  validateArg(MTLArgumentTypeSampler, a6, v13);
  -[MTLDebugCommandBuffer addObject:retained:purgeable:](self->_commandBuffer, "addObject:retained:purgeable:", a3, 1, 0);
  v14 = -[MTLToolsObject baseObject](self, "baseObject");
  v15 = objc_msgSend(a3, "baseObject");
  *(float *)&v16 = a4;
  *(float *)&v17 = a5;
  objc_msgSend(v14, "setSamplerState:lodMinClamp:lodMaxClamp:atIndex:", v15, a6, v16, v17);
  if (MTLReportFailureTypeEnabled())
  {
    v18 = &samplers[a6];
    if (LODWORD(v18->lodMaxClamp) == LODWORD(a5)
      && LODWORD(v18->lodMinClamp) == LODWORD(a4)
      && v18->hasLodClamp
      && v18->bufferAttributeStride == -1
      && v18->type == 2
      && v18->object == a3
      && (v18->bufferLength | v18->var0 | v18->bufferOffset) == 0
      && *(_OWORD *)&v18->threadgroupMemoryLength == 0)
    {
      MTLReportFailure();
    }
  }
  v13->isValid = a3 != 0;
  v13->hasBeenUsed = 0;
  v13->type = 2;
  v13->object = (baseLevel *)a3;
  v13->var0 = 0;
  v13->bufferLength = 0;
  v13->bufferOffset = 0;
  v13->bufferAttributeStride = -1;
  v13->threadgroupMemoryLength = 0;
  v13->threadgroupMemoryOffset = 0;
  v13->hasLodClamp = 1;
  v13->lodMinClamp = a4;
  v13->lodMaxClamp = a5;
}

- (void)setSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  NSUInteger length;
  NSUInteger location;
  const void *v11;
  unint64_t *p_bufferLength;
  void *v13;
  MTLToolsDevice *device;
  float *v15;
  const void *v16;
  float v17;
  float v18;
  const void *v26;
  unint64_t v27;
  _QWORD v29[18];

  length = a6.length;
  location = a6.location;
  v29[16] = *MEMORY[0x24BDAC8D0];
  if (self->hasEndEncoding)
    MTLReportFailure();
  if (location + length > -[MTLToolsDevice maxComputeSamplers](self->super.super.super._device, "maxComputeSamplers"))
  {
    v26 = (const void *)(location + length);
    v27 = -[MTLToolsDevice maxComputeSamplers](self->super.super.super._device, "maxComputeSamplers");
    MTLReportFailure();
    if (!length)
      goto LABEL_38;
  }
  else if (!length)
  {
    goto LABEL_38;
  }
  v11 = 0;
  p_bufferLength = &self->_buffers[location].bufferLength;
  do
  {
    v13 = (void *)a3[(_QWORD)v11];
    if (v13)
    {
      if ((objc_msgSend(v13, "conformsToProtocol:", &unk_255C54070) & 1) == 0)
      {
        v26 = v11;
        MTLReportFailure();
      }
      device = self->super.super.super._device;
      if (device != (MTLToolsDevice *)objc_msgSend((id)a3[(_QWORD)v11], "device", v26, v27))
      {
        v26 = v11;
        MTLReportFailure();
      }
    }
    v15 = (float *)(p_bufferLength + 1755);
    validateArg(MTLArgumentTypeSampler, (unint64_t)v11 + location, (MTLDebugFunctionArgument *)(p_bufferLength + 1745));
    -[MTLDebugCommandBuffer addObject:retained:purgeable:](self->_commandBuffer, "addObject:retained:purgeable:", a3[(_QWORD)v11], 1, 0);
    v29[(_QWORD)v11] = objc_msgSend((id)a3[(_QWORD)v11], "baseObject");
    v16 = a3[(_QWORD)v11];
    v17 = a4[(_QWORD)v11];
    v18 = a5[(_QWORD)v11];
    if (MTLReportFailureTypeEnabled())
    {
      if (*(_DWORD *)v15 == LODWORD(v18)
        && *((_DWORD *)p_bufferLength + 3509) == LODWORD(v17)
        && *((_BYTE *)p_bufferLength + 14032) != 0
        && p_bufferLength[1751] == -1
        && p_bufferLength[1746] == 2
        && p_bufferLength[1747] == (_QWORD)v16
        && (p_bufferLength[1749] | p_bufferLength[1748] | p_bufferLength[1750]) == 0
        && *((_OWORD *)p_bufferLength + 876) == 0)
      {
        v26 = v16;
        MTLReportFailure();
      }
    }
    *((_BYTE *)p_bufferLength + 13960) = v16 != 0;
    *((_BYTE *)p_bufferLength + 13961) = 0;
    p_bufferLength[1746] = 2;
    p_bufferLength[1747] = (unint64_t)v16;
    p_bufferLength[1748] = 0;
    p_bufferLength[1749] = 0;
    p_bufferLength[1750] = 0;
    p_bufferLength[1751] = -1;
    p_bufferLength[1752] = 0;
    p_bufferLength[1753] = 0;
    *((_BYTE *)p_bufferLength + 14032) = 1;
    *((float *)p_bufferLength + 3509) = v17;
    *v15 = v18;
    v11 = (char *)v11 + 1;
    p_bufferLength += 11;
  }
  while ((const void *)length != v11);
LABEL_38:
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", v26), "setSamplerStates:lodMinClamps:lodMaxClamps:withRange:", v29, a4, a5, location, length);
}

- (void)setThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4
{
  MTLDebugFunctionArgument *v7;
  MTLDebugFunctionArgument *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;

  if (self->hasEndEncoding)
    MTLReportFailure();
  if (-[MTLToolsDevice maxComputeLocalMemorySizes](self->super.super.super._device, "maxComputeLocalMemorySizes") <= a4)
  {
    v9 = a4;
    v11 = -[MTLToolsDevice maxComputeLocalMemorySizes](self->super.super.super._device, "maxComputeLocalMemorySizes");
    MTLReportFailure();
  }
  if (-[MTLToolsDevice maxThreadgroupMemoryLength](self->super.super.super._device, "maxThreadgroupMemoryLength", v9, v11) < a3)
  {
    v10 = a3;
    v12 = -[MTLToolsDevice maxThreadgroupMemoryLength](self->super.super.super._device, "maxThreadgroupMemoryLength");
    MTLReportFailure();
  }
  if (a3
     % -[MTLToolsDevice maxComputeThreadgroupMemoryAlignmentBytes](self->super.super.super._device, "maxComputeThreadgroupMemoryAlignmentBytes", v10, v12))
  {
    -[MTLToolsDevice maxComputeThreadgroupMemoryAlignmentBytes](self->super.super.super._device, "maxComputeThreadgroupMemoryAlignmentBytes");
    MTLReportFailure();
  }
  v7 = &self->_threadgroupMemoryLengths[a4];
  validateArg(MTLArgumentTypeThreadgroupMemory, a4, v7);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setThreadgroupMemoryLength:atIndex:", a3, a4);
  if (MTLReportFailureTypeEnabled())
  {
    v8 = &self->_threadgroupMemoryLengths[a4];
    if (!v8->hasLodClamp
      && !v8->threadgroupMemoryOffset
      && v8->threadgroupMemoryLength == a3
      && v8->bufferAttributeStride == -1
      && v8->type == 3
      && !v8->object
      && !(v8->bufferLength | v8->var0 | v8->bufferOffset)
      && !*(_QWORD *)&v8->lodMinClamp)
    {
      MTLReportFailure();
    }
  }
  v7->isValid = a3 != 0;
  v7->hasBeenUsed = 0;
  v7->type = 3;
  *(_OWORD *)&v7->object = 0u;
  *(_OWORD *)&v7->bufferLength = 0u;
  v7->bufferAttributeStride = -1;
  v7->threadgroupMemoryLength = a3;
  v7->threadgroupMemoryOffset = 0;
  v7->hasLodClamp = 0;
  v7->lodMinClamp = 0.0;
  v7->lodMaxClamp = 0.0;
}

- (void)setImageblockWidth:(unint64_t)a3 height:(unint64_t)a4
{
  uint8x8_t v7;
  uint8x8_t v8;
  unint64_t v9;
  unint64_t v10;

  if (self->hasEndEncoding)
    MTLReportFailure();
  v7 = (uint8x8_t)vcnt_s8((int8x8_t)a3);
  v7.i16[0] = vaddlv_u8(v7);
  if (v7.u32[0] != 1)
  {
    v9 = a3;
    MTLReportFailure();
  }
  v8 = (uint8x8_t)vcnt_s8((int8x8_t)a4);
  v8.i16[0] = vaddlv_u8(v8);
  if (v8.u32[0] != 1)
  {
    v9 = a4;
    MTLReportFailure();
  }
  if (a4 * a3 >= 0x401)
  {
    v9 = a3;
    v10 = a4;
    MTLReportFailure();
  }
  self->_imageBlockSize.width = a3;
  self->_imageBlockSize.height = a4;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", v9, v10), "setImageblockWidth:height:", a3, a4);
}

- (void)validateStageInRegion:(id *)a3
{
  $CA738AB79F3123F4596C9DACA9C56F2D *p_stageInRegion;
  unint64_t width;

  p_stageInRegion = &self->stageInRegion;
  width = self->stageInRegion.size.width;
  if (!(self->stageInRegion.size.height * width * self->stageInRegion.size.depth))
  {
    MTLReportFailure();
    width = p_stageInRegion->size.width;
  }
  if (width > a3->var0)
    MTLReportFailure();
  if (p_stageInRegion->size.height > a3->var1)
    MTLReportFailure();
  if (p_stageInRegion->size.depth > a3->var2)
    MTLReportFailure();
}

- (void)setStageInRegion:(id *)a3
{
  __int128 v4;
  __int128 v5;
  id v6;
  __int128 v7;
  _OWORD v8[3];

  self->hasSetStageInRegion = 1;
  self->hasIndirectSetStageInRegion = 0;
  v4 = *(_OWORD *)&a3->var0.var0;
  v5 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->stageInRegion.origin.z = *(_OWORD *)&a3->var0.var2;
  *(_OWORD *)&self->stageInRegion.size.height = v5;
  *(_OWORD *)&self->stageInRegion.origin.x = v4;
  v6 = -[MTLToolsObject baseObject](self, "baseObject");
  v7 = *(_OWORD *)&a3->var0.var2;
  v8[0] = *(_OWORD *)&a3->var0.var0;
  v8[1] = v7;
  v8[2] = *(_OWORD *)&a3->var1.var1;
  objc_msgSend(v6, "setStageInRegion:", v8);
}

- (void)setStageInRegionWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4
{
  unint64_t v7;

  self->hasSetStageInRegion = 0;
  self->hasIndirectSetStageInRegion = 1;
  if ((a4 & 3) != 0)
  {
    v7 = a4;
    MTLReportFailure();
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", v7), "setStageInRegionWithIndirectBuffer:indirectBufferOffset:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)_validateAllFunctionArguments
{
  unint64_t v3;
  MTLDebugFunctionArgument *buffers;
  unint64_t v5;
  MTLDebugFunctionArgument *textures;
  unint64_t v7;
  MTLDebugFunctionArgument *samplers;
  unint64_t v9;
  MTLDebugFunctionArgument *threadgroupMemoryLengths;

  v3 = 0;
  buffers = self->_buffers;
  do
    validateArg(MTLArgumentTypeBuffer, v3++, buffers++);
  while (v3 != 31);
  v5 = 0;
  textures = self->_textures;
  do
    validateArg(MTLArgumentTypeTexture, v5++, textures++);
  while (v5 != 128);
  v7 = 0;
  samplers = self->_samplers;
  do
    validateArg(MTLArgumentTypeSampler, v7++, samplers++);
  while (v7 != 16);
  v9 = 0;
  threadgroupMemoryLengths = self->_threadgroupMemoryLengths;
  do
    validateArg(MTLArgumentTypeThreadgroupMemory, v9++, threadgroupMemoryLengths++);
  while (v9 != 31);
}

- (void)_validateThreadsPerThreadgroup:(id *)a3
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  MTLToolsDevice *device;
  MTLToolsDevice *v9;
  unint64_t v10;
  MTLToolsDevice *v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t var0;
  unint64_t var1;
  unint64_t var2;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  MTLToolsDevice *v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;

  v5 = a3->var1 * a3->var0 * a3->var2;
  if (!v5)
  {
    v28 = *a3;
    v35 = 0;
    MTLReportFailure();
    v5 = a3->var1 * a3->var0 * a3->var2;
  }
  if (v5 > -[MTLToolsDevice maxTotalComputeThreadsPerThreadgroup](self->super.super.super._device, "maxTotalComputeThreadsPerThreadgroup", v28.var0, v28.var1, v28.var2, v35))
  {
    var0 = a3->var0;
    var1 = a3->var1;
    var2 = a3->var2;
    v36 = var1 * a3->var0 * var2;
    v38 = -[MTLToolsDevice maxTotalComputeThreadsPerThreadgroup](self->super.super.super._device, "maxTotalComputeThreadsPerThreadgroup");
    v31 = var1;
    v33 = var2;
    v29 = var0;
    MTLReportFailure();
  }
  v6 = a3->var1 * a3->var0 * a3->var2;
  if (v6 > -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_computePipelineState, "maxTotalThreadsPerThreadgroup", v29, v31, v33, v36, v38))
  {
    v18 = a3->var0;
    v19 = a3->var1;
    v20 = a3->var2;
    v37 = v19 * a3->var0 * v20;
    v39 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_computePipelineState, "maxTotalThreadsPerThreadgroup");
    v32 = v19;
    v34 = v20;
    v30 = v18;
    MTLReportFailure();
  }
  v7 = a3->var0;
  device = self->super.super.super._device;
  if (!device)
  {
    if (!v7)
    {
      v10 = a3->var1;
      goto LABEL_15;
    }
    v24 = a3->var0;
LABEL_33:
    v25 = 0;
    v40 = 0;
    v41 = 0;
    v42 = 0;
    goto LABEL_34;
  }
  -[MTLToolsDevice maxThreadsPerThreadgroup](device, "maxThreadsPerThreadgroup");
  v9 = self->super.super.super._device;
  if (v7 <= v40)
    goto LABEL_9;
  v24 = a3->var0;
  if (!v9)
    goto LABEL_33;
  -[MTLToolsDevice maxThreadsPerThreadgroup](v9, "maxThreadsPerThreadgroup");
  v25 = v40;
LABEL_34:
  v30 = v24;
  v32 = v25;
  MTLReportFailure();
  v9 = self->super.super.super._device;
LABEL_9:
  v10 = a3->var1;
  if (!v9)
  {
LABEL_15:
    if (!v10)
    {
      v13 = 0;
      v12 = a3->var2;
      goto LABEL_17;
    }
    v26 = a3->var1;
LABEL_30:
    v27 = 0;
    v40 = 0;
    v41 = 0;
    v42 = 0;
    goto LABEL_31;
  }
  -[MTLToolsDevice maxThreadsPerThreadgroup](v9, "maxThreadsPerThreadgroup");
  v11 = self->super.super.super._device;
  if (v10 <= v41)
    goto LABEL_11;
  v26 = a3->var1;
  if (!v11)
    goto LABEL_30;
  -[MTLToolsDevice maxThreadsPerThreadgroup](v11, "maxThreadsPerThreadgroup");
  v27 = v41;
LABEL_31:
  v30 = v26;
  v32 = v27;
  MTLReportFailure();
  v11 = self->super.super.super._device;
LABEL_11:
  v12 = a3->var2;
  if (v11)
  {
    -[MTLToolsDevice maxThreadsPerThreadgroup](v11, "maxThreadsPerThreadgroup");
    v13 = v42;
  }
  else
  {
    v13 = 0;
  }
LABEL_17:
  if (v12 > v13)
  {
    v21 = a3->var2;
    v22 = self->super.super.super._device;
    if (v22)
    {
      -[MTLToolsDevice maxThreadsPerThreadgroup](v22, "maxThreadsPerThreadgroup");
      v23 = v42;
    }
    else
    {
      v23 = 0;
      v40 = 0;
      v41 = 0;
      v42 = 0;
    }
    v30 = v21;
    v32 = v23;
    MTLReportFailure();
  }
  if (objc_msgSend((id)-[MTLComputePipelineState descriptor](self->_computePipelineState, "descriptor", v30, v32, v34, v37, v39, v40, v41, v42), "threadGroupSizeIsMultipleOfThreadExecutionWidth"))
  {
    v14 = a3->var1 * a3->var0 * a3->var2;
    if (v14 % -[MTLComputePipelineState threadExecutionWidth](self->_computePipelineState, "threadExecutionWidth"))
    {
      -[MTLComputePipelineState threadExecutionWidth](self->_computePipelineState, "threadExecutionWidth");
      MTLReportFailure();
    }
  }
}

- (void)dispatchThreadgroups:(id *)a3 threadsPerThreadgroup:(id *)a4
{
  unint64_t var2;
  MTLComputePipelineState *computePipelineState;
  MTLComputePipelineState *v7;
  MTLToolsDevice *device;
  uint64_t v9;
  void *v10;
  MTLComputePipelineState *v11;
  MTLDevice *v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  unint64_t *p_bufferAttributeStride;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  id v21;
  unint64_t var0;
  unint64_t v23;
  unint64_t var1;
  unint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  __int128 v31;
  unint64_t v32;
  __int128 v33;
  unint64_t v34;
  _QWORD v35[3];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  __int128 v40;
  unint64_t depth;
  MTLSize v42;
  MTLSize v43;
  __int128 v44;
  unint64_t v45;

  if ((MTLReportFailureTypeEnabled() & 1) != 0 || MTLReportFailureTypeEnabled())
  {
    if (self->hasEndEncoding)
      MTLReportFailure();
    if (!self->_computePipelineState)
      MTLReportFailure();
    if (HIDWORD(a3->var0))
    {
      var0 = a3->var0;
      MTLReportFailure();
    }
    if (HIDWORD(a3->var1))
    {
      var0 = a3->var1;
      MTLReportFailure();
    }
    var2 = a3->var2;
    if (HIDWORD(var2))
    {
      var0 = a3->var2;
      MTLReportFailure();
      var2 = a3->var2;
    }
    if (!(a3->var1 * a3->var0 * var2))
    {
      v25 = var2;
      v26 = 0;
      var0 = a3->var0;
      var1 = a3->var1;
      MTLReportFailure();
    }
    v44 = *(_OWORD *)&a4->var0;
    v45 = a4->var2;
    -[MTLDebugComputeCommandEncoder _validateThreadsPerThreadgroup:](self, "_validateThreadsPerThreadgroup:", &v44, var0, var1, v25, v26);
    computePipelineState = self->_computePipelineState;
    v43 = (MTLSize)*a4;
    v42 = (MTLSize)*a3;
    validateBuiltinArguments((MTLDebugComputePipelineState *)computePipelineState, &v43, &v42);
    v7 = self->_computePipelineState;
    v40 = *(_OWORD *)&self->_imageBlockSize.width;
    depth = self->_imageBlockSize.depth;
    v28 = -[MTLComputePipelineState imageblockMemoryLengthForDimensions:](v7, "imageblockMemoryLengthForDimensions:", &v40);
    v27 = (const char *)-[MTLToolsRetainingContainer protectionOptions](-[MTLToolsCommandEncoder commandBuffer](self, "commandBuffer"), "protectionOptions");
    device = self->super.super.super._device;
    v9 = objc_msgSend((id)-[MTLComputePipelineState function](self->_computePipelineState, "function"), "name");
    v10 = (void *)objc_msgSend((id)-[MTLComputePipelineState reflection](self->_computePipelineState, "reflection"), "arguments");
    -[MTLToolsDevice maxComputeBuffers](self->super.super.super._device, "maxComputeBuffers");
    -[MTLToolsDevice maxComputeTextures](self->super.super.super._device, "maxComputeTextures");
    -[MTLToolsDevice maxComputeSamplers](self->super.super.super._device, "maxComputeSamplers");
    -[MTLToolsDevice maxComputeLocalMemorySizes](self->super.super.super._device, "maxComputeLocalMemorySizes");
    validateComputeFunctionArguments(device, v9, v10, (uint64_t)self->_buffers, (uint64_t)self->_textures, (uint64_t)self->_samplers, v27, (uint64_t)self->_threadgroupMemoryLengths, -[MTLComputePipelineState staticThreadgroupMemoryLength](self->_computePipelineState, "staticThreadgroupMemoryLength"), v28, self->allowsNullBufferBinds);
  }
  v39 = 0;
  v37 = 0u;
  v38 = 0u;
  v36 = 0u;
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  v11 = self->_computePipelineState;
  v12 = -[MTLToolsObject device](self, "device");
  v13 = -[MTLToolsDevice maxComputeBuffers](self->super.super.super._device, "maxComputeBuffers");
  v14 = objc_msgSend((id)objc_msgSend((id)-[MTLComputePipelineState descriptor](v11, "descriptor"), "stageInputDescriptor"), "layouts");
  if (v13)
  {
    v15 = (void *)v14;
    v16 = 0;
    p_bufferAttributeStride = &self->_buffers[0].bufferAttributeStride;
    do
    {
      if (*((_BYTE *)p_bufferAttributeStride - 48)
        && !*(p_bufferAttributeStride - 5)
        && objc_msgSend((id)objc_msgSend(v15, "objectAtIndexedSubscript:", v16), "stride"))
      {
        if (objc_msgSend((id)objc_msgSend(v15, "objectAtIndexedSubscript:", v16), "stride") != -1
          && *p_bufferAttributeStride != -1)
        {
          var0 = *p_bufferAttributeStride;
          var1 = v16;
          _MTLMessageContextPush_();
        }
        if (objc_msgSend((id)objc_msgSend(v15, "objectAtIndexedSubscript:", v16, var0, var1), "stride") == -1
          && *p_bufferAttributeStride == -1)
        {
          v23 = v16;
          _MTLMessageContextPush_();
        }
        if (objc_msgSend((id)objc_msgSend(v15, "objectAtIndexedSubscript:", v16, v23), "stride") == -1)
          v18 = *p_bufferAttributeStride;
        else
          v18 = objc_msgSend((id)objc_msgSend(v15, "objectAtIndexedSubscript:", v16), "stride");
        if ((-[MTLDevice supportsUnalignedVertexFetch](v12, "supportsUnalignedVertexFetch") & 1) == 0
          && (unint64_t)(v18 + 1) >= 2
          && (v18 & 3) != 0)
        {
          var0 = v18;
          var1 = v16;
          _MTLMessageContextPush_();
        }
      }
      ++v16;
      p_bufferAttributeStride += 11;
    }
    while (v13 != v16);
  }
  _MTLMessageContextEnd();
  if (objc_msgSend((id)objc_msgSend((id)-[MTLComputePipelineState function](self->_computePipelineState, "function"), "stageInputAttributes"), "count"))
  {
    if (!self->hasSetStageInRegion && !self->hasIndirectSetStageInRegion)
      MTLReportFailure();
    if (!self->hasIndirectSetStageInRegion)
    {
      v19 = a4->var2 * a3->var2;
      v20 = a4->var1 * a3->var1;
      v35[0] = a4->var0 * a3->var0;
      v35[1] = v20;
      v35[2] = v19;
      -[MTLDebugComputeCommandEncoder validateStageInRegion:](self, "validateStageInRegion:", v35);
    }
  }
  self->canSetComputePipelineState = 1;
  self->canEndEncoding = 1;
  self->_encodedVirtualSubstreamDispatch = 1;
  v21 = -[MTLToolsObject baseObject](self, "baseObject", var0);
  v33 = *(_OWORD *)&a3->var0;
  v34 = a3->var2;
  v31 = *(_OWORD *)&a4->var0;
  v32 = a4->var2;
  objc_msgSend(v21, "dispatchThreadgroups:threadsPerThreadgroup:", &v33, &v31);
}

- (void)dispatchThreadgroupsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4 threadsPerThreadgroup:(id *)a5
{
  MTLToolsDevice *device;
  MTLComputePipelineState *computePipelineState;
  MTLComputePipelineState *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  MTLToolsDevice *v19;
  const char *v20;
  uint64_t v21;
  __int128 v22;
  unint64_t v23;
  __int128 v24;
  unint64_t depth;
  MTLSize v26;
  MTLSize v27;
  __int128 v28;
  unint64_t var2;

  if ((MTLReportFailureTypeEnabled() & 1) == 0 && !MTLReportFailureTypeEnabled())
    goto LABEL_15;
  -[MTLToolsObject originalObject](self->super.super.super._device, "originalObject");
  MTLValidateFeatureSupport();
  if (self->hasEndEncoding)
    MTLReportFailure();
  if (self->_computePipelineState)
  {
    if (a3)
      goto LABEL_7;
  }
  else
  {
    MTLReportFailure();
    if (a3)
    {
LABEL_7:
      if ((objc_msgSend(a3, "conformsToProtocol:", &unk_255C54558) & 1) == 0)
        MTLReportFailure();
      device = self->super.super.super._device;
      if (device == (MTLToolsDevice *)objc_msgSend(a3, "device"))
        goto LABEL_10;
    }
  }
  MTLReportFailure();
LABEL_10:
  if (a4 + 12 > objc_msgSend(a3, "length"))
  {
    v16 = a4 + 12;
    v17 = objc_msgSend(a3, "length");
    MTLReportFailure();
  }
  if ((a4 & 3) != 0)
  {
    v16 = a4;
    MTLReportFailure();
  }
  v28 = *(_OWORD *)&a5->var0;
  var2 = a5->var2;
  -[MTLDebugComputeCommandEncoder _validateThreadsPerThreadgroup:](self, "_validateThreadsPerThreadgroup:", &v28, v16, v17);
  computePipelineState = self->_computePipelineState;
  v27 = (MTLSize)*a5;
  *(int64x2_t *)&v26.width = vdupq_n_s64(1uLL);
  v26.depth = 1;
  validateBuiltinArguments((MTLDebugComputePipelineState *)computePipelineState, &v27, &v26);
  v11 = self->_computePipelineState;
  v24 = *(_OWORD *)&self->_imageBlockSize.width;
  depth = self->_imageBlockSize.depth;
  v21 = -[MTLComputePipelineState imageblockMemoryLengthForDimensions:](v11, "imageblockMemoryLengthForDimensions:", &v24);
  v12 = -[MTLToolsRetainingContainer protectionOptions](-[MTLToolsCommandEncoder commandBuffer](self, "commandBuffer"), "protectionOptions");
  v19 = self->super.super.super._device;
  v20 = (const char *)v12;
  v18 = objc_msgSend((id)-[MTLComputePipelineState function](self->_computePipelineState, "function"), "name");
  v13 = (void *)objc_msgSend((id)-[MTLComputePipelineState reflection](self->_computePipelineState, "reflection"), "arguments");
  -[MTLToolsDevice maxComputeBuffers](self->super.super.super._device, "maxComputeBuffers");
  -[MTLToolsDevice maxComputeTextures](self->super.super.super._device, "maxComputeTextures");
  -[MTLToolsDevice maxComputeSamplers](self->super.super.super._device, "maxComputeSamplers");
  -[MTLToolsDevice maxComputeLocalMemorySizes](self->super.super.super._device, "maxComputeLocalMemorySizes");
  validateComputeFunctionArguments(v19, v18, v13, (uint64_t)self->_buffers, (uint64_t)self->_textures, (uint64_t)self->_samplers, v20, (uint64_t)self->_threadgroupMemoryLengths, -[MTLComputePipelineState staticThreadgroupMemoryLength](self->_computePipelineState, "staticThreadgroupMemoryLength"), v21, self->allowsNullBufferBinds);
LABEL_15:
  self->canSetComputePipelineState = 1;
  self->canEndEncoding = 1;
  self->_encodedVirtualSubstreamDispatch = 1;
  -[MTLDebugCommandBuffer addObject:retained:purgeable:](self->_commandBuffer, "addObject:retained:purgeable:", a3, 1, 1);
  v14 = -[MTLToolsObject baseObject](self, "baseObject");
  v15 = objc_msgSend(a3, "baseObject");
  v22 = *(_OWORD *)&a5->var0;
  v23 = a5->var2;
  objc_msgSend(v14, "dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:", v15, a4, &v22);
}

- (void)dispatchThreads:(id *)a3 threadsPerThreadgroup:(id *)a4
{
  unint64_t var2;
  unint64_t v8;
  unint64_t v9;
  NSUInteger v10;
  MTLComputePipelineState *computePipelineState;
  MTLComputePipelineState *v12;
  uint64_t v13;
  void *v14;
  id v15;
  unint64_t var0;
  unint64_t var1;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  MTLToolsDevice *device;
  const char *v22;
  uint64_t v23;
  __int128 v24;
  unint64_t v25;
  __int128 v26;
  unint64_t v27;
  __int128 v28;
  unint64_t depth;
  MTLSize v30;
  MTLSize v31;
  __int128 v32;
  unint64_t v33;

  if ((MTLReportFailureTypeEnabled() & 1) != 0 || MTLReportFailureTypeEnabled())
  {
    -[MTLToolsObject originalObject](self->super.super.super._device, "originalObject");
    MTLValidateFeatureSupport();
    if (self->hasEndEncoding)
      MTLReportFailure();
    if (!self->_computePipelineState)
      MTLReportFailure();
    if (HIDWORD(a3->var0))
    {
      var0 = a3->var0;
      MTLReportFailure();
    }
    if (HIDWORD(a3->var1))
    {
      var0 = a3->var1;
      MTLReportFailure();
    }
    var2 = a3->var2;
    if (HIDWORD(var2))
    {
      var0 = a3->var2;
      MTLReportFailure();
      var2 = a3->var2;
    }
    if (!(a3->var1 * a3->var0 * var2))
    {
      v18 = var2;
      v19 = 0;
      var0 = a3->var0;
      var1 = a3->var1;
      MTLReportFailure();
    }
    v32 = *(_OWORD *)&a4->var0;
    v33 = a4->var2;
    -[MTLDebugComputeCommandEncoder _validateThreadsPerThreadgroup:](self, "_validateThreadsPerThreadgroup:", &v32, var0, var1, v18, v19);
    v8 = a3->var1;
    v9 = a4->var1;
    v10 = (a3->var0 + a4->var0 - 1) / a4->var0;
    computePipelineState = self->_computePipelineState;
    v31 = (MTLSize)*a4;
    v30.width = v10;
    v30.height = (v8 + v9 - 1) / v9;
    v30.depth = (a3->var2 + v31.depth - 1) / v31.depth;
    validateBuiltinArguments((MTLDebugComputePipelineState *)computePipelineState, &v31, &v30);
    v12 = self->_computePipelineState;
    v28 = *(_OWORD *)&self->_imageBlockSize.width;
    depth = self->_imageBlockSize.depth;
    v23 = -[MTLComputePipelineState imageblockMemoryLengthForDimensions:](v12, "imageblockMemoryLengthForDimensions:", &v28);
    v13 = -[MTLToolsRetainingContainer protectionOptions](-[MTLToolsCommandEncoder commandBuffer](self, "commandBuffer"), "protectionOptions");
    device = self->super.super.super._device;
    v22 = (const char *)v13;
    v20 = objc_msgSend((id)-[MTLComputePipelineState function](self->_computePipelineState, "function"), "name");
    v14 = (void *)objc_msgSend((id)-[MTLComputePipelineState reflection](self->_computePipelineState, "reflection"), "arguments");
    -[MTLToolsDevice maxComputeBuffers](self->super.super.super._device, "maxComputeBuffers");
    -[MTLToolsDevice maxComputeTextures](self->super.super.super._device, "maxComputeTextures");
    -[MTLToolsDevice maxComputeSamplers](self->super.super.super._device, "maxComputeSamplers");
    -[MTLToolsDevice maxComputeLocalMemorySizes](self->super.super.super._device, "maxComputeLocalMemorySizes");
    validateComputeFunctionArguments(device, v20, v14, (uint64_t)self->_buffers, (uint64_t)self->_textures, (uint64_t)self->_samplers, v22, (uint64_t)self->_threadgroupMemoryLengths, -[MTLComputePipelineState staticThreadgroupMemoryLength](self->_computePipelineState, "staticThreadgroupMemoryLength"), v23, self->allowsNullBufferBinds);
  }
  self->canSetComputePipelineState = 1;
  self->canEndEncoding = 1;
  self->_encodedVirtualSubstreamDispatch = 1;
  v15 = -[MTLToolsObject baseObject](self, "baseObject");
  v26 = *(_OWORD *)&a3->var0;
  v27 = a3->var2;
  v24 = *(_OWORD *)&a4->var0;
  v25 = a4->var2;
  objc_msgSend(v15, "dispatchThreads:threadsPerThreadgroup:", &v26, &v24);
}

- (void)dispatchThreadsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4
{
  MTLToolsDevice *device;
  MTLComputePipelineState *computePipelineState;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  MTLToolsDevice *v14;
  const char *v15;
  uint64_t v16;
  __int128 v17;
  unint64_t depth;

  if ((MTLReportFailureTypeEnabled() & 1) == 0 && !MTLReportFailureTypeEnabled())
    goto LABEL_15;
  -[MTLToolsObject originalObject](self->super.super.super._device, "originalObject");
  MTLValidateFeatureSupport();
  if (self->hasEndEncoding)
    MTLReportFailure();
  if (self->_computePipelineState)
  {
    if (a3)
      goto LABEL_7;
  }
  else
  {
    MTLReportFailure();
    if (a3)
    {
LABEL_7:
      if ((objc_msgSend(a3, "conformsToProtocol:", &unk_255C54558) & 1) == 0)
        MTLReportFailure();
      device = self->super.super.super._device;
      if (device == (MTLToolsDevice *)objc_msgSend(a3, "device"))
        goto LABEL_10;
    }
  }
  MTLReportFailure();
LABEL_10:
  if (a4 + 24 > objc_msgSend(a3, "length"))
  {
    v12 = a4 + 24;
    v13 = objc_msgSend(a3, "length");
    MTLReportFailure();
  }
  if ((a4 & 3) != 0)
  {
    v12 = a4;
    MTLReportFailure();
  }
  computePipelineState = self->_computePipelineState;
  v17 = *(_OWORD *)&self->_imageBlockSize.width;
  depth = self->_imageBlockSize.depth;
  v16 = -[MTLComputePipelineState imageblockMemoryLengthForDimensions:](computePipelineState, "imageblockMemoryLengthForDimensions:", &v17, v12, v13);
  v9 = -[MTLToolsRetainingContainer protectionOptions](-[MTLToolsCommandEncoder commandBuffer](self, "commandBuffer"), "protectionOptions");
  v14 = self->super.super.super._device;
  v15 = (const char *)v9;
  v10 = objc_msgSend((id)-[MTLComputePipelineState function](self->_computePipelineState, "function"), "name");
  v11 = (void *)objc_msgSend((id)-[MTLComputePipelineState reflection](self->_computePipelineState, "reflection"), "arguments");
  -[MTLToolsDevice maxComputeBuffers](self->super.super.super._device, "maxComputeBuffers");
  -[MTLToolsDevice maxComputeTextures](self->super.super.super._device, "maxComputeTextures");
  -[MTLToolsDevice maxComputeSamplers](self->super.super.super._device, "maxComputeSamplers");
  -[MTLToolsDevice maxComputeLocalMemorySizes](self->super.super.super._device, "maxComputeLocalMemorySizes");
  validateComputeFunctionArguments(v14, v10, v11, (uint64_t)self->_buffers, (uint64_t)self->_textures, (uint64_t)self->_samplers, v15, (uint64_t)self->_threadgroupMemoryLengths, -[MTLComputePipelineState staticThreadgroupMemoryLength](self->_computePipelineState, "staticThreadgroupMemoryLength"), v16, self->allowsNullBufferBinds);
LABEL_15:
  self->canSetComputePipelineState = 1;
  self->canEndEncoding = 1;
  self->_encodedVirtualSubstreamDispatch = 1;
  -[MTLDebugCommandBuffer addObject:retained:purgeable:](self->_commandBuffer, "addObject:retained:purgeable:", a3, 1, 1);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "dispatchThreadsWithIndirectBuffer:indirectBufferOffset:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)updateFence:(id)a3
{
  id v5;

  v5 = a3;
  std::deque<objc_object *>::push_back(&self->updatedFences.__map_.__first_, &v5);
  self->canEndEncoding = 1;
  -[MTLDebugCommandBuffer addObject:retained:purgeable:](self->_commandBuffer, "addObject:retained:purgeable:", a3, 1, 0);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "updateFence:", objc_msgSend(a3, "baseObject"));
}

- (void)waitForFence:(id)a3
{
  deque<id, std::allocator<id>> *p_updatedFences;
  unint64_t value;
  uint64_t v7;
  unsigned int v8;

  p_updatedFences = &self->updatedFences;
  value = self->updatedFences.__size_.__value_;
  if (value)
  {
    v7 = 0;
    v8 = 1;
    do
    {
      if ((*(__end_ ***)((char *)p_updatedFences->__map_.var0
                        + (((p_updatedFences->__start_ + v7) >> 6) & 0x3FFFFFFFFFFFFF8)))[(p_updatedFences->__start_
                                                                                           + v7) & 0x1FF] == a3)
      {
        MTLReportFailure();
        value = p_updatedFences->__size_.__value_;
      }
      v7 = v8;
    }
    while (value > v8++);
  }
  self->canEndEncoding = 1;
  -[MTLDebugCommandBuffer addObject:retained:purgeable:](self->_commandBuffer, "addObject:retained:purgeable:", a3, 1, 0);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "waitForFence:", objc_msgSend(a3, "baseObject"));
}

- (void)endEncoding_private
{
  if (self->hasEndEncoding)
    MTLReportFailure();
  if (!self->canEndEncoding)
    MTLReportFailure();
  if ((MTLReportFailureTypeEnabled() & 1) != 0 || MTLReportFailureTypeEnabled())
    -[MTLDebugComputeCommandEncoder _validateAllFunctionArguments](self, "_validateAllFunctionArguments");
  -[MTLDebugComputeCommandEncoder _setDefaults](self, "_setDefaults");
  self->canDealloc = 1;
  self->hasEndEncoding = 1;
}

- (void)endEncoding
{
  -[MTLDebugComputeCommandEncoder endEncoding_private](self, "endEncoding_private");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "endEncoding");
}

- (id)endEncodingAndRetrieveProgramAddressTable
{
  -[MTLDebugComputeCommandEncoder endEncoding_private](self, "endEncoding_private");
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "endEncodingAndRetrieveProgramAddressTable");
}

- (void)filterCounterRangeWithFirstBatch:(unsigned int)a3 lastBatch:(unsigned int)a4 filterIndex:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v7 = *(_QWORD *)&a3;
  if (a3 > a4)
  {
    v9 = *(_QWORD *)&a3;
    v10 = *(_QWORD *)&a4;
    MTLReportFailure();
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", v9, v10), "filterCounterRangeWithFirstBatch:lastBatch:filterIndex:", v7, v6, v5);
}

- (void)enumerateBuffersUsingBlock:(id)a3
{
  enumerateFunctionArgumentWithArray((uint64_t)self->_buffers, -[MTLDevice maxComputeBuffers](-[MTLToolsObject device](self, "device"), "maxComputeBuffers"), (uint64_t)a3);
}

- (void)enumerateTexturesUsingBlock:(id)a3
{
  enumerateFunctionArgumentWithArray((uint64_t)self->_textures, -[MTLDevice maxComputeTextures](-[MTLToolsObject device](self, "device"), "maxComputeTextures"), (uint64_t)a3);
}

- (void)enumerateSamplersUsingBlock:(id)a3
{
  enumerateFunctionArgumentWithArray((uint64_t)self->_samplers, -[MTLDevice maxComputeSamplers](-[MTLToolsObject device](self, "device"), "maxComputeSamplers"), (uint64_t)a3);
}

- (void)enumerateThreadgroupMemoryLengthsUsingBlock:(id)a3
{
  enumerateFunctionArgumentWithArray((uint64_t)self->_threadgroupMemoryLengths, -[MTLDevice maxComputeLocalMemorySizes](-[MTLToolsObject device](self, "device"), "maxComputeLocalMemorySizes"), (uint64_t)a3);
}

- (void)validateFunctionTableUseResource:(id)a3 selectorName:(id)a4
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(a3, "stage") != 1)
  {
    MTLDebugStageToString(objc_msgSend(a3, "stage"));
    MTLReportFailure();
  }
}

- (void)useResource:(id)a3 usage:(unint64_t)a4
{
  unint64_t v7;

  if (!a3)
    MTLReportFailure();
  if (a4 >= 8)
  {
    v7 = a4;
    MTLReportFailure();
  }
  -[MTLDebugComputeCommandEncoder validateFunctionTableUseResource:selectorName:](self, "validateFunctionTableUseResource:selectorName:", a3, CFSTR("useResource:usage:"), v7);
  -[MTLDebugCommandBuffer addObject:retained:purgeable:](self->_commandBuffer, "addObject:retained:purgeable:", a3, 1, 1);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "useResource:usage:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5
{
  uint64_t v9;
  const void *v10;
  uint64_t v11;
  id v12;
  unint64_t v13;
  void *__p[3];

  if (a5 >= 8)
  {
    v13 = a5;
    MTLReportFailure();
  }
  std::vector<objc_object  {objcproto11MTLResource}*>::vector(__p, a4);
  if (a4)
  {
    v9 = 0;
    do
    {
      v10 = a3[v9];
      if (!v10)
      {
        MTLReportFailure();
        v10 = a3[v9];
      }
      -[MTLDebugComputeCommandEncoder validateFunctionTableUseResource:selectorName:](self, "validateFunctionTableUseResource:selectorName:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("useResources:count:usage: (index = %lu)"), v9));
      v11 = objc_msgSend((id)a3[v9], "baseObject");
      *((_QWORD *)__p[0] + v9) = v11;
      -[MTLDebugCommandBuffer addObject:retained:purgeable:](self->_commandBuffer, "addObject:retained:purgeable:", a3[v9++], 1, 1);
    }
    while (a4 != v9);
  }
  v12 = -[MTLToolsObject baseObject](self, "baseObject", v13);
  objc_msgSend(v12, "useResources:count:usage:", __p[0], a4, a5);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)useHeap:(id)a3
{
  if (!a3)
    MTLReportFailure();
  -[MTLDebugCommandBuffer addObject:retained:purgeable:](self->_commandBuffer, "addObject:retained:purgeable:", a3, 1, 1);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "useHeap:", objc_msgSend(a3, "baseObject"));
}

- (void)useHeaps:(const void *)a3 count:(unint64_t)a4
{
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *__p[3];

  std::vector<objc_object  {objcproto7MTLHeap}*>::vector(__p, a4);
  if (a4)
  {
    v7 = 0;
    do
    {
      v8 = (void *)a3[v7];
      if (!v8)
      {
        v11 = v7;
        MTLReportFailure();
        v8 = (void *)a3[v7];
      }
      v9 = objc_msgSend(v8, "baseObject", v11);
      *((_QWORD *)__p[0] + v7) = v9;
      -[MTLDebugCommandBuffer addObject:retained:purgeable:](self->_commandBuffer, "addObject:retained:purgeable:", a3[v7++], 1, 1);
    }
    while (a4 != v7);
  }
  v10 = -[MTLToolsObject baseObject](self, "baseObject");
  objc_msgSend(v10, "useHeaps:count:", __p[0], a4);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)memoryBarrierWithScope:(unint64_t)a3
{
  unint64_t v5;

  if (-[MTLToolsDevice supportsComputeMemoryBarrier](self->super.super.super._device, "supportsComputeMemoryBarrier"))
  {
    if (a3 >= 4)
    {
      v5 = a3;
      MTLReportFailure();
    }
    objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", v5), "memoryBarrierWithScope:", a3);
  }
  else
  {
    MTLReportFailure();
  }
}

- (void)memoryBarrierWithResources:(const void *)a3 count:(unint64_t)a4
{
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *__p[3];

  if (!a3 || !a4)
    MTLReportFailure();
  if (-[MTLToolsDevice supportsComputeMemoryBarrier](self->super.super.super._device, "supportsComputeMemoryBarrier"))
  {
    if (a3)
    {
      std::vector<objc_object  {objcproto11MTLResource}*>::vector(__p, a4);
      if (a4)
      {
        v7 = 0;
        do
        {
          v8 = (void *)a3[v7];
          if (!v8)
          {
            v11 = v7;
            MTLReportFailure();
            v8 = (void *)a3[v7];
          }
          v9 = objc_msgSend(v8, "baseObject", v11);
          *((_QWORD *)__p[0] + v7++) = v9;
        }
        while (a4 != v7);
      }
      v10 = -[MTLToolsObject baseObject](self, "baseObject");
      objc_msgSend(v10, "memoryBarrierWithResources:count:", __p[0], a4);
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
    }
  }
  else
  {
    MTLReportFailure();
  }
}

- (void)executeCommandsInBuffer:(id)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  NSRange v8;
  NSUInteger v9;
  NSUInteger v10;
  uint64_t v11;
  objc_super v12;
  NSRange v13;
  NSRange v14;

  length = a4.length;
  location = a4.location;
  if (self->_encodingVirtualSubstream)
    MTLReportFailure();
  v14.length = objc_msgSend(a3, "size");
  v13.location = location;
  v13.length = length;
  v14.location = 0;
  v8 = NSIntersectionRange(v13, v14);
  if (v8.location != location || v8.length != length)
  {
    v10 = length;
    v11 = objc_msgSend(a3, "size");
    v9 = location;
    MTLReportFailure();
  }
  if (objc_msgSend((id)objc_msgSend(a3, "descriptor", v9, v10, v11), "inheritPipelineState")
    && (-[MTLComputePipelineState supportIndirectCommandBuffers](-[MTLDebugComputeCommandEncoder computePipelineState](self, "computePipelineState"), "supportIndirectCommandBuffers") & 1) == 0)
  {
    MTLReportFailure();
  }
  v12.receiver = self;
  v12.super_class = (Class)MTLDebugComputeCommandEncoder;
  -[MTLToolsComputeCommandEncoder executeCommandsInBuffer:withRange:](&v12, sel_executeCommandsInBuffer_withRange_, a3, location, length);
}

- (void)executeCommandsInBuffer:(id)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5
{
  objc_super v9;

  if (self->_encodingVirtualSubstream)
    MTLReportFailure();
  if (objc_msgSend((id)objc_msgSend(a3, "descriptor"), "inheritPipelineState")
    && (-[MTLComputePipelineState supportIndirectCommandBuffers](-[MTLDebugComputeCommandEncoder computePipelineState](self, "computePipelineState"), "supportIndirectCommandBuffers") & 1) == 0)
  {
    MTLReportFailure();
  }
  v9.receiver = self;
  v9.super_class = (Class)MTLDebugComputeCommandEncoder;
  -[MTLToolsComputeCommandEncoder executeCommandsInBuffer:indirectBuffer:indirectBufferOffset:](&v9, sel_executeCommandsInBuffer_indirectBuffer_indirectBufferOffset_, a3, a4, a5);
}

- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5
{
  _BOOL8 v5;
  MTLToolsDevice *device;
  unint64_t v10;
  uint64_t v11;

  v5 = a5;
  if (-[MTLToolsDevice supportsCounterSampling:](self->super.super.super._device, "supportsCounterSampling:", 2))
  {
    if (!a3)
      goto LABEL_7;
  }
  else
  {
    MTLReportFailure();
    if (!a3)
      goto LABEL_7;
  }
  if ((objc_msgSend(a3, "conformsToProtocol:", &unk_255C522D0) & 1) == 0)
    MTLReportFailure();
  device = self->super.super.super._device;
  if (device != (MTLToolsDevice *)objc_msgSend(a3, "device"))
    MTLReportFailure();
LABEL_7:
  if (objc_msgSend(a3, "sampleCount") <= a4)
  {
    v10 = a4;
    v11 = objc_msgSend(a3, "sampleCount");
    MTLReportFailure();
  }
  -[MTLDebugCommandBuffer addObject:retained:purgeable:](self->_commandBuffer, "addObject:retained:purgeable:", a3, 1, 0, v10, v11);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "sampleCountersInBuffer:atSampleIndex:withBarrier:", objc_msgSend(a3, "baseObject"), a4, v5);
}

- (void)enableNullBufferBinds:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  self->allowsNullBufferBinds = a3;
  -[MTLToolsObject baseObject](self, "baseObject");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "enableNullBufferBinds:", v3);
}

- (void)setAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  MTLDebugFunctionArgument *buffers;
  MTLDebugFunctionArgument *v8;
  uint64_t v9;
  MTLDebugFunctionArgument *v10;
  int64x2_t v11;

  if (self->hasEndEncoding)
    MTLReportFailure();
  if (-[MTLToolsDevice maxComputeBuffers](self->super.super.super._device, "maxComputeBuffers") <= a4)
  {
    -[MTLToolsDevice maxComputeBuffers](self->super.super.super._device, "maxComputeBuffers");
    MTLReportFailure();
  }
  checkAccelerationStructure((uint64_t)self->super.super.super._device, a3, 1, (uint64_t)CFSTR("Acceleration structure"));
  buffers = self->_buffers;
  v8 = &self->_buffers[a4];
  validateArg(MTLArgumentTypePrimitiveAccelerationStructure, a4, v8);
  -[MTLDebugCommandBuffer addObject:retained:purgeable:](self->_commandBuffer, "addObject:retained:purgeable:", a3, 1, 1);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setAccelerationStructure:atBufferIndex:", objc_msgSend(a3, "baseObject"), a4);
  v9 = objc_msgSend(a3, "size");
  if (MTLReportFailureTypeEnabled())
  {
    v10 = &buffers[a4];
    v11.i64[0] = v10->type;
    v11.i64[1] = v10->var0;
    if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_s64(v11, (int64x2_t)xmmword_22CEAB6D0), (int32x4_t)vceqq_s64(*(int64x2_t *)&v10->bufferLength, (int64x2_t)(unint64_t)v9))))) & 1) == 0&& v10->bufferAttributeStride == -1&& *(_OWORD *)&v10->threadgroupMemoryLength == 0&& v10->object == a3&& a3&& !*(_QWORD *)&v10->lodMinClamp&& !v10->hasLodClamp)
    {
      MTLReportFailure();
    }
  }
  v8->isValid = v9 != 0;
  v8->hasBeenUsed = 0;
  v8->type = 4;
  v8->object = (baseLevel *)a3;
  v8->var0 = 0;
  v8->bufferLength = v9;
  *(_OWORD *)&v8->bufferOffset = xmmword_22CEAB6E0;
  v8->threadgroupMemoryLength = 0;
  v8->threadgroupMemoryOffset = 0;
  v8->hasLodClamp = 0;
  v8->lodMinClamp = 0.0;
  v8->lodMaxClamp = 0.0;
}

- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  MTLToolsDevice *device;
  MTLDebugFunctionArgument *buffers;
  MTLDebugFunctionArgument *v9;
  uint64_t v10;
  MTLDebugFunctionArgument *v11;
  int64x2_t v12;
  unint64_t v13;
  unint64_t v14;

  if (self->hasEndEncoding)
    MTLReportFailure();
  if (-[MTLToolsDevice maxComputeBuffers](self->super.super.super._device, "maxComputeBuffers") <= a4)
  {
    v13 = a4;
    v14 = -[MTLToolsDevice maxComputeBuffers](self->super.super.super._device, "maxComputeBuffers");
    MTLReportFailure();
  }
  if ((objc_msgSend((id)-[MTLDevice baseObject](-[MTLToolsObject device](self, "device", v13, v14), "baseObject"), "supportsFunctionPointers") & 1) != 0)
  {
    if (!a3)
      goto LABEL_11;
  }
  else
  {
    MTLReportFailure();
    if (!a3)
      goto LABEL_11;
  }
  if ((objc_msgSend(a3, "conformsToProtocol:", &unk_255C57818) & 1) == 0)
    MTLReportFailure();
  device = self->super.super.super._device;
  if (device != (MTLToolsDevice *)objc_msgSend(a3, "device"))
    MTLReportFailure();
LABEL_11:
  buffers = self->_buffers;
  v9 = &self->_buffers[a4];
  validateArg(MTLArgumentTypeVisibleFunctionTable, a4, v9);
  -[MTLDebugCommandBuffer addObject:retained:purgeable:](self->_commandBuffer, "addObject:retained:purgeable:", a3, 1, 1);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVisibleFunctionTable:atBufferIndex:", objc_msgSend(a3, "baseObject"), a4);
  v10 = objc_msgSend(a3, "functionCount");
  if (MTLReportFailureTypeEnabled())
  {
    v11 = &buffers[a4];
    v12.i64[0] = v11->type;
    v12.i64[1] = v11->var0;
    if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_s64(v12, (int64x2_t)xmmword_22CEAB6F0), (int32x4_t)vceqq_s64(*(int64x2_t *)&v11->bufferLength, (int64x2_t)(unint64_t)v10))))) & 1) == 0&& v11->bufferAttributeStride == -1&& *(_OWORD *)&v11->threadgroupMemoryLength == 0&& v11->object == a3&& a3&& !*(_QWORD *)&v11->lodMinClamp&& !v11->hasLodClamp)
    {
      MTLReportFailure();
    }
  }
  v9->isValid = v10 != 0;
  v9->hasBeenUsed = 0;
  v9->type = 5;
  v9->object = (baseLevel *)a3;
  v9->var0 = 0;
  v9->bufferLength = v10;
  *(_OWORD *)&v9->bufferOffset = xmmword_22CEAB6E0;
  v9->threadgroupMemoryLength = 0;
  v9->threadgroupMemoryOffset = 0;
  v9->hasLodClamp = 0;
  v9->lodMinClamp = 0.0;
  v9->lodMaxClamp = 0.0;
}

- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  MTLToolsRetainingContainer *v8;
  MTLToolsRetainingContainer **v9;
  void *v10;
  MTLToolsDevice *device;
  MTLToolsRetainingContainer **v12;
  MTLToolsRetainingContainer *v13;
  uint64_t v14;
  int64x2_t v15;
  NSUInteger v21;
  MTLToolsRetainingContainer *v22;
  unint64_t v23;
  _QWORD v24[33];

  length = a4.length;
  location = a4.location;
  v24[31] = *MEMORY[0x24BDAC8D0];
  if (self->hasEndEncoding)
    MTLReportFailure();
  if (location + length > -[MTLToolsDevice maxComputeBuffers](self->super.super.super._device, "maxComputeBuffers"))
  {
    v21 = location + length;
    v23 = -[MTLToolsDevice maxComputeBuffers](self->super.super.super._device, "maxComputeBuffers");
    MTLReportFailure();
  }
  if ((objc_msgSend((id)-[MTLDevice baseObject](-[MTLToolsObject device](self, "device", v21, v23), "baseObject"), "supportsFunctionPointers") & 1) != 0)
  {
    if (!length)
      goto LABEL_35;
  }
  else
  {
    MTLReportFailure();
    if (!length)
      goto LABEL_35;
  }
  v8 = 0;
  v9 = &self->super.super._commandBuffer + 11 * location;
  do
  {
    v10 = (void *)a3[(_QWORD)v8];
    if (v10)
    {
      if ((objc_msgSend(v10, "conformsToProtocol:", &unk_255C57818) & 1) == 0)
      {
        v22 = v8;
        MTLReportFailure();
      }
      device = self->super.super.super._device;
      if (device != (MTLToolsDevice *)objc_msgSend((id)a3[(_QWORD)v8], "device", v22))
      {
        v22 = v8;
        MTLReportFailure();
      }
    }
    v12 = v9 + 6;
    validateArg(MTLArgumentTypeVisibleFunctionTable, (unint64_t)v8 + location, (MTLDebugFunctionArgument *)(v9 + 1));
    -[MTLDebugCommandBuffer addObject:retained:purgeable:](self->_commandBuffer, "addObject:retained:purgeable:", a3[(_QWORD)v8], 1, 1);
    v24[(_QWORD)v8] = objc_msgSend((id)a3[(_QWORD)v8], "baseObject");
    v13 = (MTLToolsRetainingContainer *)a3[(_QWORD)v8];
    v14 = -[MTLToolsRetainingContainer functionCount](v13, "functionCount");
    if (MTLReportFailureTypeEnabled())
    {
      v15.i64[0] = (uint64_t)v9[2];
      v15.i64[1] = (uint64_t)v9[4];
      if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_s64(v15, (int64x2_t)xmmword_22CEAB6F0), (int32x4_t)vceqq_s64(*(int64x2_t *)(v9 + 5), (int64x2_t)(unint64_t)v14))))) & 1) == 0&& v9[7] == (MTLToolsRetainingContainer *)-1&& *((_OWORD *)v9 + 4) == 0&& v9[3] == v13&& v13 != 0&& *(MTLToolsRetainingContainer **)((char *)v9 + 84) == 0&& *((_BYTE *)v9 + 80) == 0)
      {
        v22 = v13;
        MTLReportFailure();
      }
    }
    *((_BYTE *)v9 + 8) = v14 != 0;
    *((_BYTE *)v9 + 9) = 0;
    v9[2] = (MTLToolsRetainingContainer *)5;
    v9[3] = v13;
    v9[4] = 0;
    v9[5] = (MTLToolsRetainingContainer *)v14;
    *(_OWORD *)v12 = xmmword_22CEAB6E0;
    v9[8] = 0;
    v9[9] = 0;
    *((_BYTE *)v9 + 80) = 0;
    v8 = (MTLToolsRetainingContainer *)((char *)v8 + 1);
    v9 += 11;
    *((_DWORD *)v12 + 9) = 0;
    *((_DWORD *)v12 + 10) = 0;
  }
  while ((MTLToolsRetainingContainer *)length != v8);
LABEL_35:
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", v22), "setVisibleFunctionTables:withBufferRange:", v24, location, length);
}

- (void)setIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  MTLToolsDevice *device;
  MTLDebugFunctionArgument *buffers;
  MTLDebugFunctionArgument *v9;
  uint64_t v10;
  MTLDebugFunctionArgument *v11;
  int64x2_t v12;
  unint64_t v13;
  unint64_t v14;

  if (self->hasEndEncoding)
    MTLReportFailure();
  if (-[MTLToolsDevice maxComputeBuffers](self->super.super.super._device, "maxComputeBuffers") <= a4)
  {
    v13 = a4;
    v14 = -[MTLToolsDevice maxComputeBuffers](self->super.super.super._device, "maxComputeBuffers");
    MTLReportFailure();
    if (!a3)
      goto LABEL_9;
  }
  else if (!a3)
  {
    goto LABEL_9;
  }
  if ((objc_msgSend(a3, "conformsToProtocol:", &unk_255C6D340, v13, v14) & 1) == 0)
    MTLReportFailure();
  device = self->super.super.super._device;
  if (device != (MTLToolsDevice *)objc_msgSend(a3, "device"))
    MTLReportFailure();
LABEL_9:
  buffers = self->_buffers;
  v9 = &self->_buffers[a4];
  validateArg(MTLArgumentTypeIntersectionFunctionTable, a4, v9);
  -[MTLDebugCommandBuffer addObject:retained:purgeable:](self->_commandBuffer, "addObject:retained:purgeable:", a3, 1, 1);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setIntersectionFunctionTable:atBufferIndex:", objc_msgSend(a3, "baseObject"), a4);
  v10 = objc_msgSend(a3, "functionCount");
  if (MTLReportFailureTypeEnabled())
  {
    v11 = &buffers[a4];
    v12.i64[0] = v11->type;
    v12.i64[1] = v11->var0;
    if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_s64(v12, (int64x2_t)xmmword_22CEAB700), (int32x4_t)vceqq_s64(*(int64x2_t *)&v11->bufferLength, (int64x2_t)(unint64_t)v10))))) & 1) == 0&& v11->bufferAttributeStride == -1&& *(_OWORD *)&v11->threadgroupMemoryLength == 0&& v11->object == a3&& a3&& !*(_QWORD *)&v11->lodMinClamp&& !v11->hasLodClamp)
    {
      MTLReportFailure();
    }
  }
  v9->isValid = v10 != 0;
  v9->hasBeenUsed = 0;
  v9->type = 6;
  v9->object = (baseLevel *)a3;
  v9->var0 = 0;
  v9->bufferLength = v10;
  *(_OWORD *)&v9->bufferOffset = xmmword_22CEAB6E0;
  v9->threadgroupMemoryLength = 0;
  v9->threadgroupMemoryOffset = 0;
  v9->hasLodClamp = 0;
  v9->lodMinClamp = 0.0;
  v9->lodMaxClamp = 0.0;
}

- (void)setIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  MTLToolsRetainingContainer *v8;
  MTLToolsRetainingContainer **v9;
  void *v10;
  MTLToolsDevice *device;
  MTLToolsRetainingContainer **v12;
  MTLToolsRetainingContainer *v13;
  uint64_t v14;
  int64x2_t v15;
  MTLToolsRetainingContainer *v21;
  unint64_t v22;
  _QWORD v23[33];

  length = a4.length;
  location = a4.location;
  v23[31] = *MEMORY[0x24BDAC8D0];
  if (self->hasEndEncoding)
    MTLReportFailure();
  if (location + length > -[MTLToolsDevice maxComputeBuffers](self->super.super.super._device, "maxComputeBuffers"))
  {
    v21 = (MTLToolsRetainingContainer *)(location + length);
    v22 = -[MTLToolsDevice maxComputeBuffers](self->super.super.super._device, "maxComputeBuffers");
    MTLReportFailure();
    if (!length)
      goto LABEL_33;
  }
  else if (!length)
  {
    goto LABEL_33;
  }
  v8 = 0;
  v9 = &self->super.super._commandBuffer + 11 * location;
  do
  {
    v10 = (void *)a3[(_QWORD)v8];
    if (v10)
    {
      if ((objc_msgSend(v10, "conformsToProtocol:", &unk_255C6D340) & 1) == 0)
      {
        v21 = v8;
        MTLReportFailure();
      }
      device = self->super.super.super._device;
      if (device != (MTLToolsDevice *)objc_msgSend((id)a3[(_QWORD)v8], "device", v21, v22))
      {
        v21 = v8;
        MTLReportFailure();
      }
    }
    v12 = v9 + 6;
    validateArg(MTLArgumentTypeIntersectionFunctionTable, (unint64_t)v8 + location, (MTLDebugFunctionArgument *)(v9 + 1));
    -[MTLDebugCommandBuffer addObject:retained:purgeable:](self->_commandBuffer, "addObject:retained:purgeable:", a3[(_QWORD)v8], 1, 1);
    v23[(_QWORD)v8] = objc_msgSend((id)a3[(_QWORD)v8], "baseObject");
    v13 = (MTLToolsRetainingContainer *)a3[(_QWORD)v8];
    v14 = -[MTLToolsRetainingContainer functionCount](v13, "functionCount");
    if (MTLReportFailureTypeEnabled())
    {
      v15.i64[0] = (uint64_t)v9[2];
      v15.i64[1] = (uint64_t)v9[4];
      if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_s64(v15, (int64x2_t)xmmword_22CEAB700), (int32x4_t)vceqq_s64(*(int64x2_t *)(v9 + 5), (int64x2_t)(unint64_t)v14))))) & 1) == 0&& v9[7] == (MTLToolsRetainingContainer *)-1&& *((_OWORD *)v9 + 4) == 0&& v9[3] == v13&& v13 != 0&& *(MTLToolsRetainingContainer **)((char *)v9 + 84) == 0&& *((_BYTE *)v9 + 80) == 0)
      {
        v21 = v13;
        MTLReportFailure();
      }
    }
    *((_BYTE *)v9 + 8) = v14 != 0;
    *((_BYTE *)v9 + 9) = 0;
    v9[2] = (MTLToolsRetainingContainer *)6;
    v9[3] = v13;
    v9[4] = 0;
    v9[5] = (MTLToolsRetainingContainer *)v14;
    *(_OWORD *)v12 = xmmword_22CEAB6E0;
    v9[8] = 0;
    v9[9] = 0;
    *((_BYTE *)v9 + 80) = 0;
    v8 = (MTLToolsRetainingContainer *)((char *)v8 + 1);
    v9 += 11;
    *((_DWORD *)v12 + 9) = 0;
    *((_DWORD *)v12 + 10) = 0;
  }
  while ((MTLToolsRetainingContainer *)length != v8);
LABEL_33:
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", v21), "setIntersectionFunctionTables:withBufferRange:", v23, location, length);
}

- (void)setSubstream:(unsigned int)a3
{
  uint64_t v3;
  unsigned int numSubstreams;

  v3 = *(_QWORD *)&a3;
  numSubstreams = self->_numSubstreams;
  if (!numSubstreams)
  {
    MTLReportFailure();
    numSubstreams = self->_numSubstreams;
  }
  if (numSubstreams <= v3)
    MTLReportFailure();
  if (self->_encodingVirtualSubstream && self->_encodedVirtualSubstreamDispatch)
    MTLReportFailure();
  self->_activeSubstream = v3;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setSubstream:", v3);
}

- (void)signalProgress:(unsigned int)a3
{
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned int, void *>>> *p_pair1;
  _QWORD *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned int, void *>>> **v7;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned int, void *>>> **v8;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned int, void *>>> *v9;
  BOOL v10;
  id v11;
  _QWORD *v12;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned int, void *>>> *v13;
  unsigned int v14;

  v14 = a3;
  if (!self->_numSubstreams)
    MTLReportFailure();
  if (self->_encodingVirtualSubstream)
    MTLReportFailure();
  if (self->_progressLabels.__tree_.__pair3_.__value_)
  {
    p_pair1 = &self->_progressLabels.__tree_.__pair1_;
    left = self->_progressLabels.__tree_.__pair1_.__value_.__left_;
    if (left)
    {
      v7 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned int, void *>>> **)self->_progressLabels.__tree_.__pair1_.__value_.__left_;
      do
      {
        v8 = v7;
        v7 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned int, void *>>> **)v7[1];
      }
      while (v7);
    }
    else
    {
      v9 = &self->_progressLabels.__tree_.__pair1_;
      do
      {
        v8 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned int, void *>>> **)v9[2].__value_.__left_;
        v10 = *v8 == v9;
        v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned int, void *>>> *)v8;
      }
      while (v10);
    }
    if (*((_DWORD *)v8 + 7) >= a3)
    {
      if (left)
      {
        v12 = self->_progressLabels.__tree_.__pair1_.__value_.__left_;
        do
          v12 = (_QWORD *)v12[1];
        while (v12);
      }
      else
      {
        v13 = &self->_progressLabels.__tree_.__pair1_;
        do
        {
          v10 = *(_QWORD *)v13[2].__value_.__left_ == (_QWORD)v13;
          v13 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned int, void *>>> *)v13[2].__value_.__left_;
        }
        while (v10);
      }
      if (left)
      {
        do
          left = (_QWORD *)left[1];
        while (left);
      }
      else
      {
        do
        {
          v10 = *(_QWORD *)p_pair1[2].__value_.__left_ == (_QWORD)p_pair1;
          p_pair1 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned int, void *>>> *)p_pair1[2].__value_.__left_;
        }
        while (v10);
      }
      MTLReportFailure();
    }
  }
  std::__tree<unsigned int>::__emplace_unique_key_args<unsigned int,unsigned int const&>((uint64_t **)&self->_progressLabels, &v14, &v14);
  v11 = -[MTLToolsObject baseObject](self, "baseObject");
  objc_msgSend(v11, "signalProgress:", v14);
}

- (void)waitForProgress:(unsigned int)a3
{
  uint64_t v3;
  char *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned int, void *>>> *p_pair1;
  unsigned int v7;
  BOOL v8;
  char **v9;
  uint64_t v10;
  uint64_t v11;

  v3 = *(_QWORD *)&a3;
  if (!self->_numSubstreams)
    MTLReportFailure();
  left = (char *)self->_progressLabels.__tree_.__pair1_.__value_.__left_;
  if (!left)
    goto LABEL_14;
  p_pair1 = &self->_progressLabels.__tree_.__pair1_;
  do
  {
    v7 = *((_DWORD *)left + 7);
    v8 = v7 >= v3;
    if (v7 >= v3)
      v9 = (char **)left;
    else
      v9 = (char **)(left + 8);
    if (v8)
      p_pair1 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned int, void *>>> *)left;
    left = *v9;
  }
  while (*v9);
  if (p_pair1 == &self->_progressLabels.__tree_.__pair1_ || HIDWORD(p_pair1[3].__value_.__left_) > v3)
  {
LABEL_14:
    v10 = v3;
    v11 = v3;
    MTLReportFailure();
  }
  if (self->_encodingVirtualSubstream)
    MTLReportFailure();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", v10, v11), "waitForProgress:", v3);
}

- (void)beginVirtualSubstream
{
  -[MTLToolsObject originalObject](self->super.super.super._device, "originalObject");
  MTLValidateFeatureSupport();
  if (self->_encodingVirtualSubstream)
    MTLReportFailure();
  self->_encodingVirtualSubstream = 1;
  self->_currentVirtualSubstreamIndex = 0;
  self->_encodedVirtualSubstreamDispatch = 0;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "beginVirtualSubstream");
}

- (unint64_t)nextVirtualSubstream
{
  -[MTLToolsObject originalObject](self->super.super.super._device, "originalObject");
  MTLValidateFeatureSupport();
  if (!self->_encodingVirtualSubstream)
    MTLReportFailure();
  ++self->_currentVirtualSubstreamIndex;
  self->_encodedVirtualSubstreamDispatch = 0;
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "nextVirtualSubstream");
}

- (void)endVirtualSubstream
{
  -[MTLToolsObject originalObject](self->super.super.super._device, "originalObject");
  MTLValidateFeatureSupport();
  if (!self->_encodingVirtualSubstream)
    MTLReportFailure();
  self->_encodingVirtualSubstream = 0;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "endVirtualSubstream");
}

- (void)waitForVirtualSubstream:(unint64_t)a3
{
  unint64_t v5;
  uint64_t currentVirtualSubstreamIndex;

  -[MTLToolsObject originalObject](self->super.super.super._device, "originalObject");
  MTLValidateFeatureSupport();
  if (!self->_encodingVirtualSubstream)
    MTLReportFailure();
  if (self->_encodedVirtualSubstreamDispatch)
    MTLReportFailure();
  if (self->_currentVirtualSubstreamIndex <= a3)
  {
    v5 = a3;
    currentVirtualSubstreamIndex = self->_currentVirtualSubstreamIndex;
    MTLReportFailure();
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", v5, currentVirtualSubstreamIndex), "waitForVirtualSubstream:", a3);
}

- (void)useResidencySet:(id)a3
{
  objc_super v5;

  if (!a3)
    MTLReportFailure();
  v5.receiver = self;
  v5.super_class = (Class)MTLDebugComputeCommandEncoder;
  -[MTLToolsComputeCommandEncoder useResidencySet:](&v5, sel_useResidencySet_, a3);
}

- (void)useResidencySets:(const void *)a3 count:(unint64_t)a4
{
  uint64_t i;
  uint64_t v8;
  objc_super v9;

  if (a4)
  {
    for (i = 0; i != a4; ++i)
    {
      if (!a3[i])
      {
        v8 = i;
        MTLReportFailure();
      }
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)MTLDebugComputeCommandEncoder;
  -[MTLToolsComputeCommandEncoder useResidencySets:count:](&v9, sel_useResidencySets_count_, a3, a4, v8);
}

- (MTLComputePipelineState)computePipelineState
{
  return self->_computePipelineState;
}

- (void).cxx_destruct
{
  std::__tree<unsigned int>::destroy((uint64_t)&self->_progressLabels, (_QWORD *)self->_progressLabels.__tree_.__pair1_.__value_.__left_);
  std::deque<objc_object *>::~deque[abi:ne180100](&self->updatedFences.__map_.__first_);
}

- (id).cxx_construct
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;

  v2 = 48;
  v3 = 31;
  do
  {
    v4 = (char *)self + v2;
    *((_QWORD *)v4 + 3) = 0;
    *((_QWORD *)v4 + 4) = 0;
    *((_QWORD *)v4 + 5) = 0;
    *((_QWORD *)v4 + 6) = -1;
    *((_DWORD *)v4 + 19) = 0;
    *((_DWORD *)v4 + 20) = 0;
    *((_QWORD *)v4 + 7) = 0;
    *((_QWORD *)v4 + 8) = 0;
    v2 += 88;
    v4[72] = 0;
    --v3;
  }
  while (v3);
  v5 = 2776;
  v6 = 128;
  do
  {
    v7 = (char *)self + v5;
    *((_QWORD *)v7 + 3) = 0;
    *((_QWORD *)v7 + 4) = 0;
    *((_QWORD *)v7 + 5) = 0;
    *((_QWORD *)v7 + 6) = -1;
    *((_DWORD *)v7 + 19) = 0;
    *((_DWORD *)v7 + 20) = 0;
    *((_QWORD *)v7 + 7) = 0;
    *((_QWORD *)v7 + 8) = 0;
    v5 += 88;
    v7[72] = 0;
    --v6;
  }
  while (v6);
  v8 = 14040;
  v9 = 16;
  do
  {
    v10 = (char *)self + v8;
    *((_QWORD *)v10 + 3) = 0;
    *((_QWORD *)v10 + 4) = 0;
    *((_QWORD *)v10 + 5) = 0;
    *((_QWORD *)v10 + 6) = -1;
    *((_DWORD *)v10 + 19) = 0;
    *((_DWORD *)v10 + 20) = 0;
    *((_QWORD *)v10 + 7) = 0;
    *((_QWORD *)v10 + 8) = 0;
    v8 += 88;
    v10[72] = 0;
    --v9;
  }
  while (v9);
  v11 = 15448;
  v12 = 31;
  do
  {
    v13 = (char *)self + v11;
    *((_QWORD *)v13 + 3) = 0;
    *((_QWORD *)v13 + 4) = 0;
    *((_QWORD *)v13 + 5) = 0;
    *((_QWORD *)v13 + 6) = -1;
    *((_DWORD *)v13 + 19) = 0;
    *((_DWORD *)v13 + 20) = 0;
    *((_QWORD *)v13 + 7) = 0;
    *((_QWORD *)v13 + 8) = 0;
    v11 += 88;
    v13[72] = 0;
    --v12;
  }
  while (v12);
  *((_OWORD *)self + 1142) = 0u;
  *((_OWORD *)self + 1143) = 0u;
  *((_OWORD *)self + 1144) = 0u;
  *((_QWORD *)self + 2293) = 0;
  *((_QWORD *)self + 2292) = 0;
  *((_QWORD *)self + 2291) = (char *)self + 18336;
  return self;
}

@end
