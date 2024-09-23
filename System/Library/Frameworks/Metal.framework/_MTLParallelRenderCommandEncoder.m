@implementation _MTLParallelRenderCommandEncoder

- (_MTLParallelRenderCommandEncoder)initWithCommandBuffer:(id)a3 renderPassDescriptor:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _MTLParallelRenderCommandEncoder *v11;
  int v12;
  const __CFString *v14;
  unint64_t v15;
  uint64_t v16;
  const __CFString *v17;
  unint64_t v18;
  uint64_t v19;
  objc_super v20;

  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (a4)
        goto LABEL_4;
LABEL_12:
      v17 = CFSTR("framebuffer must not be nil.");
      v18 = 0;
      v19 = 40;
LABEL_14:
      MTLReportFailure(v18, "-[_MTLParallelRenderCommandEncoder initWithCommandBuffer:renderPassDescriptor:]", v19, (uint64_t)v17, v4, v5, v6, v7, (uint64_t)v20.receiver);
      goto LABEL_5;
    }
    v14 = CFSTR("commandBuffer is not a MTLCommandBuffer.");
    v15 = 1;
    v16 = 37;
  }
  else
  {
    v14 = CFSTR("commandBuffer must not be nil.");
    v15 = 0;
    v16 = 34;
  }
  MTLReportFailure(v15, "-[_MTLParallelRenderCommandEncoder initWithCommandBuffer:renderPassDescriptor:]", v16, (uint64_t)v14, v4, v5, v6, v7, (uint64_t)v20.receiver);
  if (!a4)
    goto LABEL_12;
LABEL_4:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v17 = CFSTR("render pass descriptor is not an MTLRenderPassDescriptor.");
    v18 = 1;
    v19 = 43;
    goto LABEL_14;
  }
LABEL_5:
  v20.receiver = self;
  v20.super_class = (Class)_MTLParallelRenderCommandEncoder;
  v11 = -[_MTLObjectWithLabel init](&v20, sel_init);
  if (v11)
  {
    v11->_device = (MTLDevice *)(id)objc_msgSend(a3, "device");
    v11->_queue = (MTLCommandQueue *)(id)objc_msgSend(a3, "commandQueue");
    v11->_commandBuffer = (MTLCommandBuffer *)a3;
    v11->_renderPassDescriptor = (MTLRenderPassDescriptor *)objc_msgSend(a4, "copy");
    -[_MTLParallelRenderCommandEncoder initializeEnhancedCommandBufferErrors](v11, "initializeEnhancedCommandBufferErrors");
    -[MTLCommandBuffer setCurrentCommandEncoder:](v11->_commandBuffer, "setCurrentCommandEncoder:", v11);
    pthread_mutex_init(&v11->_lock, 0);
    v11->_retainedReferences = -[MTLCommandBuffer retainedReferences](v11->_commandBuffer, "retainedReferences");
    v11->_commandBuffersSize = 16;
    v11->_commandBuffers = (id *)malloc_type_malloc(0x80uLL, 0x80040B8603338uLL);
    v12 = -[MTLCommandBuffer isStatEnabled](v11->_commandBuffer, "isStatEnabled");
    v11->_StatEnabled = v12;
    if (v12)
      v11->_numThisEncoder = -[MTLCommandBuffer getAndIncrementNumEncoders](v11->_commandBuffer, "getAndIncrementNumEncoders");
  }
  return v11;
}

- (void)initializeEnhancedCommandBufferErrors
{
  MTLCommandBuffer *commandBuffer;
  void *v4;
  MTLCommandBuffer *v5;
  uint64_t v6;
  int v7;
  MTLCommandBuffer *v8;
  uint64_t v9;
  int v10;

  self->_needsFrameworkAssistedErrorTracking = -[MTLDevice getSupportedCommandBufferErrorOptions](self->_device, "getSupportedCommandBufferErrorOptions") == 0;
  if ((-[MTLCommandBuffer errorOptions](self->_commandBuffer, "errorOptions") & 1) != 0)
  {
    -[MTLCommandBuffer initProgressTracking](self->_commandBuffer, "initProgressTracking");
    if (self->_needsFrameworkAssistedErrorTracking)
    {
      self->_progressFence = (MTLFence *)-[MTLDevice newFence](self->_device, "newFence");
      commandBuffer = self->_commandBuffer;
      if (*((_BYTE *)self->_device + 328))
      {
        v4 = (void *)-[MTLCommandBuffer progressTrackingRenderCommandEncoder](commandBuffer, "progressTrackingRenderCommandEncoder");
        objc_msgSend(v4, "setRenderPipelineState:", *((_QWORD *)self->_device + 42));
        v5 = self->_commandBuffer;
        v6 = *((_QWORD *)v5 + 64);
        v7 = *((_DWORD *)v5 + 130);
        *((_DWORD *)v5 + 130) = v7 + 1;
        objc_msgSend(v4, "setVertexBuffer:offset:atIndex:", v6, (4 * v7), 0);
        objc_msgSend(v4, "drawPrimitives:vertexStart:vertexCount:", 0, 0, 1);
        objc_msgSend(v4, "updateFence:afterStages:", self->_progressFence, 1);
      }
      else
      {
        v4 = (void *)-[MTLCommandBuffer progressTrackingBlitCommandEncoder](commandBuffer, "progressTrackingBlitCommandEncoder");
        v8 = self->_commandBuffer;
        v9 = *((_QWORD *)v8 + 64);
        v10 = *((_DWORD *)v8 + 130);
        *((_DWORD *)v8 + 130) = v10 + 1;
        objc_msgSend(v4, "fillBuffer:range:value:", v9, (4 * v10), 4, 255);
        objc_msgSend(v4, "updateFence:", self->_progressFence);
      }
      objc_msgSend(v4, "endEncoding");
    }
  }
}

- (void)dealloc
{
  unint64_t v3;
  objc_super v4;

  self->_device = 0;
  self->_queue = 0;

  self->_renderPassDescriptor = 0;
  if (self->_commandBuffersCount)
  {
    v3 = 0;
    do

    while (v3 < self->_commandBuffersCount);
  }
  free(self->_commandBuffers);
  v4.receiver = self;
  v4.super_class = (Class)_MTLParallelRenderCommandEncoder;
  -[_MTLObjectWithLabel dealloc](&v4, sel_dealloc);
}

- (id)formattedDescription:(unint64_t)a3
{
  unint64_t v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  NSString *v8;
  const __CFString *v9;
  MTLDevice *device;
  const __CFString *v11;
  void *v12;
  objc_super v14;
  _QWORD v15[7];

  v15[6] = *MEMORY[0x1E0C80C00];
  v4 = a3 + 4;
  v5 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  v6 = -[_MTLObjectWithLabel retainedLabel](self, "retainedLabel");
  v7 = (void *)MEMORY[0x1E0CB3940];
  v14.receiver = self;
  v14.super_class = (Class)_MTLParallelRenderCommandEncoder;
  v8 = -[_MTLParallelRenderCommandEncoder description](&v14, sel_description);
  v15[0] = v5;
  v15[1] = CFSTR("label =");
  if (v6)
    v9 = v6;
  else
    v9 = CFSTR("<none>");
  v15[2] = v9;
  v15[3] = v5;
  v15[4] = CFSTR("device =");
  device = self->_device;
  if (device)
    v11 = (const __CFString *)-[MTLDevice formattedDescription:](device, "formattedDescription:", v4);
  else
    v11 = CFSTR("<null>");
  v15[5] = v11;
  v12 = (void *)objc_msgSend(v7, "stringWithFormat:", CFSTR("%@%@"), v8, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 6), "componentsJoinedByString:", CFSTR(" ")));

  return v12;
}

- (NSString)description
{
  return (NSString *)-[_MTLParallelRenderCommandEncoder formattedDescription:](self, "formattedDescription:", 0);
}

- (id)commandBuffer
{
  return self->_commandBuffer;
}

- (id)_renderCommandEncoderCommon
{
  _BOOL4 retainedReferences;
  MTLCommandQueue *queue;
  void *v5;
  id v6;
  MTLCommandBuffer *commandBuffer;
  unint64_t commandBuffersCount;
  id *commandBuffers;
  _QWORD v11[5];

  retainedReferences = self->_retainedReferences;
  queue = self->_queue;
  if (retainedReferences)
    v5 = (void *)-[MTLCommandQueue commandBuffer](queue, "commandBuffer");
  else
    v5 = (void *)-[MTLCommandQueue commandBufferWithUnretainedReferences](queue, "commandBufferWithUnretainedReferences");
  v6 = v5;
  objc_msgSend(v6, "signalCommandBufferAvailable");
  objc_msgSend(v6, "setOwnedByParallelEncoder:", 1);
  objc_msgSend(v6, "setErrorOptions:", 0);
  commandBuffer = self->_commandBuffer;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63___MTLParallelRenderCommandEncoder__renderCommandEncoderCommon__block_invoke;
  v11[3] = &unk_1E0FE28A8;
  v11[4] = v6;
  -[MTLCommandBuffer addCompletedHandler:](commandBuffer, "addCompletedHandler:", v11);
  if (self->_StatEnabled)
  {
    objc_msgSend(v6, "setNumEncoders:", -[MTLCommandBuffer getAndIncrementNumEncoders](self->_commandBuffer, "getAndIncrementNumEncoders") - 1);
    objc_msgSend(v6, "setNumThisCommandBuffer:", -[MTLCommandBuffer numThisCommandBuffer](self->_commandBuffer, "numThisCommandBuffer"));
  }
  pthread_mutex_lock(&self->_lock);
  commandBuffersCount = self->_commandBuffersCount;
  if (commandBuffersCount == self->_commandBuffersSize)
  {
    self->_commandBuffersSize = 2 * commandBuffersCount;
    commandBuffers = (id *)malloc_type_realloc(self->_commandBuffers, 16 * commandBuffersCount, 0x80040B8603338uLL);
    self->_commandBuffers = commandBuffers;
    commandBuffersCount = self->_commandBuffersCount;
  }
  else
  {
    commandBuffers = self->_commandBuffers;
  }
  self->_commandBuffersCount = commandBuffersCount + 1;
  commandBuffers[commandBuffersCount] = v6;
  pthread_mutex_unlock(&self->_lock);
  return v6;
}

- (id)renderCommandEncoder
{
  void *v3;

  v3 = (void *)objc_msgSend(-[_MTLParallelRenderCommandEncoder _renderCommandEncoderCommon](self, "_renderCommandEncoderCommon"), "renderCommandEncoderWithDescriptor:", self->_renderPassDescriptor);
  if (MTLTraceEnabled())
  {
    -[_MTLParallelRenderCommandEncoder globalTraceObjectID](self, "globalTraceObjectID");
    objc_msgSend(v3, "globalTraceObjectID");
    kdebug_trace();
  }
  return v3;
}

- (id)sampledRenderCommandEncoderWithProgramInfoBuffer:(id *)a3 capacity:(unint64_t)a4
{
  void *v5;

  v5 = (void *)objc_msgSend(-[_MTLParallelRenderCommandEncoder _renderCommandEncoderCommon](self, "_renderCommandEncoderCommon"), "sampledRenderCommandEncoderWithDescriptor:programInfoBuffer:capacity:", self->_renderPassDescriptor, a3, a4);
  if (MTLTraceEnabled())
  {
    -[_MTLParallelRenderCommandEncoder globalTraceObjectID](self, "globalTraceObjectID");
    objc_msgSend(v5, "globalTraceObjectID");
    kdebug_trace();
  }
  return v5;
}

- (void)preEndEncoding
{
  id v3;

  if ((-[MTLCommandBuffer errorOptions](self->_commandBuffer, "errorOptions") & 1) != 0
    && self->_needsFrameworkAssistedErrorTracking)
  {
    v3 = -[_MTLParallelRenderCommandEncoder renderCommandEncoder](self, "renderCommandEncoder");
    objc_msgSend(v3, "waitForFence:beforeStages:", self->_progressFence, 1);
    objc_msgSend(v3, "updateFence:afterStages:", self->_progressFence, 2);
    objc_msgSend(v3, "endEncoding");
  }
}

- (id)endEncodingAndRetrieveProgramAddressTable
{
  -[_MTLParallelRenderCommandEncoder endEncoding](self, "endEncoding");
  return 0;
}

- (void)endEncoding
{
  MTLCommandBuffer *commandBuffer;
  void *v4;
  MTLCommandBuffer *v5;
  uint64_t v6;
  int v7;
  MTLCommandBuffer *v8;
  uint64_t v9;
  int v10;
  MTLFence *progressFence;
  MTLCommandBuffer *v12;
  void *v13;
  _QWORD v14[5];

  -[MTLCommandBuffer setCurrentCommandEncoder:](self->_commandBuffer, "setCurrentCommandEncoder:", 0);
  if ((-[MTLCommandBuffer errorOptions](self->_commandBuffer, "errorOptions") & 1) != 0
    && self->_needsFrameworkAssistedErrorTracking)
  {
    commandBuffer = self->_commandBuffer;
    if (*((_BYTE *)self->_device + 328))
    {
      v4 = (void *)-[MTLCommandBuffer progressTrackingRenderCommandEncoder](commandBuffer, "progressTrackingRenderCommandEncoder");
      objc_msgSend(v4, "waitForFence:beforeStages:", self->_progressFence, 1);
      objc_msgSend(v4, "setRenderPipelineState:", *((_QWORD *)self->_device + 42));
      v5 = self->_commandBuffer;
      v6 = *((_QWORD *)v5 + 64);
      v7 = *((_DWORD *)v5 + 130);
      *((_DWORD *)v5 + 130) = v7 + 1;
      objc_msgSend(v4, "setVertexBuffer:offset:atIndex:", v6, (4 * v7), 0);
      objc_msgSend(v4, "drawPrimitives:vertexStart:vertexCount:", 0, 0, 1);
    }
    else
    {
      v4 = (void *)-[MTLCommandBuffer progressTrackingBlitCommandEncoder](commandBuffer, "progressTrackingBlitCommandEncoder");
      objc_msgSend(v4, "waitForFence:", self->_progressFence);
      v8 = self->_commandBuffer;
      v9 = *((_QWORD *)v8 + 64);
      v10 = *((_DWORD *)v8 + 130);
      *((_DWORD *)v8 + 130) = v10 + 1;
      objc_msgSend(v4, "fillBuffer:range:value:", v9, (4 * v10), 4, 255);
    }
    objc_msgSend(v4, "endEncoding");
    progressFence = self->_progressFence;
    if ((-[MTLCommandBuffer retainedReferences](self->_commandBuffer, "retainedReferences") & 1) != 0)
    {

    }
    else
    {
      v12 = self->_commandBuffer;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __47___MTLParallelRenderCommandEncoder_endEncoding__block_invoke;
      v14[3] = &unk_1E0FE28A8;
      v14[4] = progressFence;
      -[MTLCommandBuffer addCompletedHandler:](v12, "addCompletedHandler:", v14);
    }
    self->_progressFence = 0;
  }
  if ((-[MTLCommandBuffer errorOptions](self->_commandBuffer, "errorOptions") & 1) != 0)
  {
    v13 = (void *)objc_opt_new();
    objc_msgSend(v13, "setUniqueID:", -[_MTLParallelRenderCommandEncoder getDriverUniqueID](self, "getDriverUniqueID"));
    objc_msgSend(v13, "setLabel:", -[_MTLObjectWithLabel label](self, "label"));
    objc_msgSend(v13, "setDebugSignposts:", self->_debugSignposts);
    objc_msgSend(v13, "setErrorState:", 0);
    objc_msgSend(*((id *)self->_commandBuffer + 66), "addObject:", v13);

  }
  self->_commandBuffer = 0;
}

- (void)insertDebugSignpost:(id)a3
{
  NSMutableArray *debugSignposts;

  if ((-[MTLCommandBuffer errorOptions](self->_commandBuffer, "errorOptions") & 1) != 0)
  {
    debugSignposts = self->_debugSignposts;
    if (!debugSignposts)
    {
      debugSignposts = (NSMutableArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      self->_debugSignposts = debugSignposts;
    }
    -[NSMutableArray addObject:](debugSignposts, "addObject:", a3);
  }
}

- (void)setColorStoreAction:(unint64_t)a3 atIndex:(unint64_t)a4
{
  -[_MTLParallelRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

- (void)setDepthStoreAction:(unint64_t)a3
{
  -[_MTLParallelRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)setStencilStoreAction:(unint64_t)a3
{
  -[_MTLParallelRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (BOOL)isMemorylessRender
{
  return 0;
}

- (MTLDevice)device
{
  return self->_device;
}

- (unint64_t)globalTraceObjectID
{
  return self->_globalTraceObjectID;
}

@end
