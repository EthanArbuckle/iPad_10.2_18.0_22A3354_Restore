@implementation _MTLCommandEncoder

- (MTLDevice)device
{
  return self->_device;
}

- (void)dealloc
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  self->_device = 0;
  self->_progressFence = 0;

  self->_debugSignposts = 0;
  if (self->_commandBuffer)
    MTLReportFailure(0, "-[_MTLCommandEncoder dealloc]", 134, (uint64_t)CFSTR("Command encoder released without endEncoding"), v3, v4, v5, v6, (uint64_t)v7.receiver);
  v7.receiver = self;
  v7.super_class = (Class)_MTLCommandEncoder;
  -[_MTLObjectWithLabel dealloc](&v7, sel_dealloc);
}

- (_MTLCommandEncoder)initWithCommandBuffer:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _MTLCommandEncoder *v9;
  void *v10;
  MTLCommandBuffer *commandBuffer;
  uint64_t v12;
  int v13;
  MTLCommandBuffer *v14;
  uint64_t v15;
  int v16;
  MTLCommandBuffer *v17;
  uint64_t v18;
  int v19;
  const __CFString *v21;
  unint64_t v22;
  uint64_t v23;
  int64x2_t v24;
  uint64_t v25;
  int64x2_t v26;
  uint64_t v27;
  objc_super v28;

  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    v21 = CFSTR("commandBuffer is not a MTLCommandBuffer.");
    v22 = 1;
    v23 = 38;
  }
  else
  {
    v21 = CFSTR("commandBuffer must not be nil.");
    v22 = 0;
    v23 = 35;
  }
  MTLReportFailure(v22, "-[_MTLCommandEncoder initWithCommandBuffer:]", v23, (uint64_t)v21, v3, v4, v5, v6, v24.i64[0]);
LABEL_3:
  v28.receiver = self;
  v28.super_class = (Class)_MTLCommandEncoder;
  v9 = -[_MTLObjectWithLabel init](&v28, sel_init);
  if (v9)
  {
    v9->_device = (MTLDevice *)(id)objc_msgSend(a3, "device");
    v9->_commandBuffer = (MTLCommandBuffer *)a3;
    v9->_needsFrameworkAssistedErrorTracking = -[MTLDevice getSupportedCommandBufferErrorOptions](v9->_device, "getSupportedCommandBufferErrorOptions") == 0;
    v9->_isProgressTrackingEncoder = *((_BYTE *)a3 + 524);
    if ((-[MTLCommandBuffer errorOptions](v9->_commandBuffer, "errorOptions") & 1) != 0
      && !v9->_isProgressTrackingEncoder)
    {
      -[MTLCommandBuffer initProgressTracking](v9->_commandBuffer, "initProgressTracking");
      if (v9->_needsFrameworkAssistedErrorTracking)
      {
        v9->_progressFence = (MTLFence *)-[MTLDevice newFence](v9->_device, "newFence");
        if (-[_MTLCommandEncoder getType](v9, "getType") || !*((_BYTE *)v9->_device + 328))
        {
          if (-[_MTLCommandEncoder getType](v9, "getType") == 1 && *((_BYTE *)v9->_device + 328))
          {
            v10 = (void *)-[MTLCommandBuffer progressTrackingComputeCommandEncoder](v9->_commandBuffer, "progressTrackingComputeCommandEncoder");
            objc_msgSend(v10, "setComputePipelineState:", *((_QWORD *)v9->_device + 43));
            commandBuffer = v9->_commandBuffer;
            v12 = *((_QWORD *)commandBuffer + 64);
            v13 = *((_DWORD *)commandBuffer + 130);
            *((_DWORD *)commandBuffer + 130) = v13 + 1;
            objc_msgSend(v10, "setBuffer:offset:atIndex:", v12, (4 * v13), 0);
            v26 = vdupq_n_s64(1uLL);
            v27 = 1;
            v24 = v26;
            v25 = 1;
            objc_msgSend(v10, "dispatchThreadgroups:threadsPerThreadgroup:", &v26, &v24);
          }
          else
          {
            v10 = (void *)-[MTLCommandBuffer progressTrackingBlitCommandEncoder](v9->_commandBuffer, "progressTrackingBlitCommandEncoder");
            v14 = v9->_commandBuffer;
            v15 = *((_QWORD *)v14 + 64);
            v16 = *((_DWORD *)v14 + 130);
            *((_DWORD *)v14 + 130) = v16 + 1;
            objc_msgSend(v10, "fillBuffer:range:value:", v15, (4 * v16), 4, 255);
          }
          objc_msgSend(v10, "updateFence:", v9->_progressFence);
        }
        else
        {
          v10 = (void *)-[MTLCommandBuffer progressTrackingRenderCommandEncoder](v9->_commandBuffer, "progressTrackingRenderCommandEncoder");
          objc_msgSend(v10, "setRenderPipelineState:", *((_QWORD *)v9->_device + 42));
          v17 = v9->_commandBuffer;
          v18 = *((_QWORD *)v17 + 64);
          v19 = *((_DWORD *)v17 + 130);
          *((_DWORD *)v17 + 130) = v19 + 1;
          objc_msgSend(v10, "setVertexBuffer:offset:atIndex:", v18, (4 * v19), 0);
          objc_msgSend(v10, "drawPrimitives:vertexStart:vertexCount:", 0, 0, 1);
          objc_msgSend(v10, "updateFence:afterStages:", v9->_progressFence, 2);
        }
        objc_msgSend(v10, "endEncoding");
      }
    }
    -[MTLCommandBuffer setCurrentCommandEncoder:](v9->_commandBuffer, "setCurrentCommandEncoder:", v9);
    if (-[MTLCommandBuffer isStatEnabled](v9->_commandBuffer, "isStatEnabled"))
      v9->_numThisEncoder = -[MTLCommandBuffer getAndIncrementNumEncoders](v9->_commandBuffer, "getAndIncrementNumEncoders");
  }
  return v9;
}

- (void)endEncoding
{
  void *v3;
  MTLCommandBuffer *commandBuffer;
  uint64_t v5;
  int v6;
  MTLCommandBuffer *v7;
  uint64_t v8;
  int v9;
  MTLCommandBuffer *v10;
  uint64_t v11;
  int v12;
  MTLFence *progressFence;
  MTLCommandBuffer *v14;
  void *v15;
  _QWORD v16[5];
  int64x2_t v17;
  uint64_t v18;
  int64x2_t v19;
  uint64_t v20;

  -[MTLCommandBuffer executeSynchronizationNotifications:](self->_commandBuffer, "executeSynchronizationNotifications:", 1);
  -[MTLCommandBuffer setCurrentCommandEncoder:](self->_commandBuffer, "setCurrentCommandEncoder:", 0);
  if (!self->_isProgressTrackingEncoder)
  {
    if ((-[MTLCommandBuffer errorOptions](self->_commandBuffer, "errorOptions") & 1) != 0
      && self->_needsFrameworkAssistedErrorTracking)
    {
      if (-[_MTLCommandEncoder getType](self, "getType") || !*((_BYTE *)self->_device + 328))
      {
        if (-[_MTLCommandEncoder getType](self, "getType") == 1 && *((_BYTE *)self->_device + 328))
        {
          v3 = (void *)-[MTLCommandBuffer progressTrackingComputeCommandEncoder](self->_commandBuffer, "progressTrackingComputeCommandEncoder");
          objc_msgSend(v3, "waitForFence:", self->_progressFence);
          objc_msgSend(v3, "setComputePipelineState:", *((_QWORD *)self->_device + 43));
          commandBuffer = self->_commandBuffer;
          v5 = *((_QWORD *)commandBuffer + 64);
          v6 = *((_DWORD *)commandBuffer + 130);
          *((_DWORD *)commandBuffer + 130) = v6 + 1;
          objc_msgSend(v3, "setBuffer:offset:atIndex:", v5, (4 * v6), 0);
          v19 = vdupq_n_s64(1uLL);
          v20 = 1;
          v17 = v19;
          v18 = 1;
          objc_msgSend(v3, "dispatchThreadgroups:threadsPerThreadgroup:", &v19, &v17);
        }
        else
        {
          v3 = (void *)-[MTLCommandBuffer progressTrackingBlitCommandEncoder](self->_commandBuffer, "progressTrackingBlitCommandEncoder");
          objc_msgSend(v3, "waitForFence:", self->_progressFence);
          v7 = self->_commandBuffer;
          v8 = *((_QWORD *)v7 + 64);
          v9 = *((_DWORD *)v7 + 130);
          *((_DWORD *)v7 + 130) = v9 + 1;
          objc_msgSend(v3, "fillBuffer:range:value:", v8, (4 * v9), 4, 255);
        }
      }
      else
      {
        v3 = (void *)-[MTLCommandBuffer progressTrackingRenderCommandEncoder](self->_commandBuffer, "progressTrackingRenderCommandEncoder");
        objc_msgSend(v3, "waitForFence:beforeStages:", self->_progressFence, 1);
        objc_msgSend(v3, "setRenderPipelineState:", *((_QWORD *)self->_device + 42));
        v10 = self->_commandBuffer;
        v11 = *((_QWORD *)v10 + 64);
        v12 = *((_DWORD *)v10 + 130);
        *((_DWORD *)v10 + 130) = v12 + 1;
        objc_msgSend(v3, "setVertexBuffer:offset:atIndex:", v11, (4 * v12), 0);
        objc_msgSend(v3, "drawPrimitives:vertexStart:vertexCount:", 0, 0, 1);
      }
      objc_msgSend(v3, "endEncoding");
      progressFence = self->_progressFence;
      if ((-[MTLCommandBuffer retainedReferences](self->_commandBuffer, "retainedReferences") & 1) != 0)
      {

      }
      else
      {
        v14 = self->_commandBuffer;
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __33___MTLCommandEncoder_endEncoding__block_invoke;
        v16[3] = &unk_1E0FE28A8;
        v16[4] = progressFence;
        -[MTLCommandBuffer addCompletedHandler:](v14, "addCompletedHandler:", v16);
      }
      self->_progressFence = 0;
    }
    if ((-[MTLCommandBuffer errorOptions](self->_commandBuffer, "errorOptions") & 1) != 0)
    {
      v15 = (void *)objc_opt_new();
      objc_msgSend(v15, "setUniqueID:", -[_MTLCommandEncoder getDriverUniqueID](self, "getDriverUniqueID"));
      objc_msgSend(v15, "setLabel:", -[_MTLObjectWithLabel label](self, "label"));
      objc_msgSend(v15, "setDebugSignposts:", self->_debugSignposts);

      self->_debugSignposts = 0;
      objc_msgSend(v15, "setErrorState:", 0);
      objc_msgSend(*((id *)self->_commandBuffer + 66), "addObject:", v15);

    }
  }

  self->_commandBuffer = 0;
}

- (unint64_t)numThisEncoder
{
  return self->_numThisEncoder;
}

- (void)pushDebugGroup:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const __CFString *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (!a3)
  {
    v7 = CFSTR("string must not be nil.");
    v8 = 0;
    v9 = 330;
LABEL_5:
    MTLReportFailure(v8, "-[_MTLCommandEncoder pushDebugGroup:]", v9, (uint64_t)v7, v3, v4, v5, v6, v10);
    return;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = CFSTR("string is not a NSString.");
    v8 = 1;
    v9 = 333;
    goto LABEL_5;
  }
}

- (id)formattedDescription:(unint64_t)a3
{
  unint64_t v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  id v8;
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
  v14.super_class = (Class)_MTLCommandEncoder;
  v8 = -[_MTLCommandEncoder description](&v14, sel_description);
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

- (id)description
{
  return -[_MTLCommandEncoder formattedDescription:](self, "formattedDescription:", 0);
}

- (id)commandBuffer
{
  return self->_commandBuffer;
}

- (void)preEndEncoding
{
  unint64_t v3;
  MTLFence *progressFence;

  if ((-[MTLCommandBuffer errorOptions](self->_commandBuffer, "errorOptions") & 1) != 0
    && !self->_isProgressTrackingEncoder
    && self->_needsFrameworkAssistedErrorTracking)
  {
    v3 = -[_MTLCommandEncoder getType](self, "getType");
    progressFence = self->_progressFence;
    if (v3)
    {
      -[_MTLCommandEncoder waitForFence:](self, "waitForFence:", progressFence);
      -[_MTLCommandEncoder updateFence:](self, "updateFence:", self->_progressFence);
    }
    else
    {
      -[_MTLCommandEncoder waitForFence:beforeStages:](self, "waitForFence:beforeStages:", progressFence, 1);
      -[_MTLCommandEncoder updateFence:afterStages:](self, "updateFence:afterStages:", self->_progressFence, 2);
    }
  }
}

- (id)endEncodingAndRetrieveProgramAddressTable
{
  -[_MTLCommandEncoder endEncoding](self, "endEncoding");
  return 0;
}

- (void)insertDebugSignpost:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSMutableArray *debugSignposts;
  const __CFString *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    v10 = CFSTR("string is not a NSString.");
    v11 = 1;
    v12 = 316;
  }
  else
  {
    v10 = CFSTR("string must not be nil.");
    v11 = 0;
    v12 = 313;
  }
  MTLReportFailure(v11, "-[_MTLCommandEncoder insertDebugSignpost:]", v12, (uint64_t)v10, v3, v4, v5, v6, v13);
LABEL_3:
  if ((-[MTLCommandBuffer errorOptions](self->_commandBuffer, "errorOptions") & 1) != 0)
  {
    debugSignposts = self->_debugSignposts;
    if (!debugSignposts)
    {
      debugSignposts = (NSMutableArray *)objc_opt_new();
      self->_debugSignposts = debugSignposts;
    }
    -[NSMutableArray addObject:](debugSignposts, "addObject:", a3);
  }
}

- (unint64_t)getType
{
  return 0;
}

- (void)memoryBarrierNotificationWithScope:(unint64_t)a3
{
  -[MTLCommandBuffer executeSynchronizationNotifications:scope:resources:count:](self->_commandBuffer, "executeSynchronizationNotifications:scope:resources:count:", 0, a3, 0, 0);
}

- (void)memoryBarrierNotificationWithResources:(const void *)a3 count:(unint64_t)a4
{
  -[MTLCommandBuffer executeSynchronizationNotifications:scope:resources:count:](self->_commandBuffer, "executeSynchronizationNotifications:scope:resources:count:", 0, 0, a3, a4);
}

- (unint64_t)dispatchType
{
  return 0;
}

- (void)setAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  if (-[_MTLCommandEncoder getType](self, "getType") == 1
    && (-[MTLDevice requiresRaytracingEmulation](-[_MTLCommandEncoder device](self, "device"), "requiresRaytracingEmulation") & 1) != 0)
  {
    -[_MTLCommandEncoder setBuffer:offset:atIndex:](self, "setBuffer:offset:atIndex:", objc_msgSend(a3, "buffer"), objc_msgSend(a3, "bufferOffset"), a4);
  }
  else
  {
    -[_MTLCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  }
}

- (void)setVertexAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  if (-[_MTLCommandEncoder getType](self, "getType")
    || (-[MTLDevice requiresRaytracingEmulation](-[_MTLCommandEncoder device](self, "device"), "requiresRaytracingEmulation") & 1) == 0)
  {
    -[_MTLCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  }
  else
  {
    -[_MTLCommandEncoder setVertexBuffer:offset:atIndex:](self, "setVertexBuffer:offset:atIndex:", objc_msgSend(a3, "buffer"), objc_msgSend(a3, "bufferOffset"), a4);
  }
}

- (void)setFragmentAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  if (-[_MTLCommandEncoder getType](self, "getType")
    || (-[MTLDevice requiresRaytracingEmulation](-[_MTLCommandEncoder device](self, "device"), "requiresRaytracingEmulation") & 1) == 0)
  {
    -[_MTLCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  }
  else
  {
    -[_MTLCommandEncoder setFragmentBuffer:offset:atIndex:](self, "setFragmentBuffer:offset:atIndex:", objc_msgSend(a3, "buffer"), objc_msgSend(a3, "bufferOffset"), a4);
  }
}

- (void)setTileAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  if (-[_MTLCommandEncoder getType](self, "getType")
    || (-[MTLDevice requiresRaytracingEmulation](-[_MTLCommandEncoder device](self, "device"), "requiresRaytracingEmulation") & 1) == 0)
  {
    -[_MTLCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  }
  else
  {
    -[_MTLCommandEncoder setTileBuffer:offset:atIndex:](self, "setTileBuffer:offset:atIndex:", objc_msgSend(a3, "buffer"), objc_msgSend(a3, "bufferOffset"), a4);
  }
}

- (void)setObjectBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  -[_MTLCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
}

- (void)setObjectBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  -[_MTLCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
}

- (void)setObjectBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  -[_MTLCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

- (void)setObjectBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  -[_MTLCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5.location, a5.length);
}

- (void)setObjectTexture:(id)a3 atIndex:(unint64_t)a4
{
  -[_MTLCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

- (void)setObjectTextures:(const void *)a3 withRange:(_NSRange)a4
{
  -[_MTLCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4.location, a4.length);
}

- (void)setObjectSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  -[_MTLCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

- (void)setObjectSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  -[_MTLCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4.location, a4.length);
}

- (void)setObjectSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  -[_MTLCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a6);
}

- (void)setObjectSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  -[_MTLCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5, a6.location, a6.length);
}

- (void)setObjectThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4
{
  -[_MTLCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

- (void)setMeshBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  -[_MTLCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
}

- (void)setMeshBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  -[_MTLCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
}

- (void)setMeshBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  -[_MTLCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

- (void)setMeshBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  -[_MTLCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5.location, a5.length);
}

- (void)setMeshTexture:(id)a3 atIndex:(unint64_t)a4
{
  -[_MTLCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

- (void)setMeshTextures:(const void *)a3 withRange:(_NSRange)a4
{
  -[_MTLCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4.location, a4.length);
}

- (void)setMeshSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  -[_MTLCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

- (void)setMeshSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  -[_MTLCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4.location, a4.length);
}

- (void)setMeshSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  -[_MTLCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a6);
}

- (void)setMeshSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  -[_MTLCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5, a6.location, a6.length);
}

- (void)drawMeshThreadgroups:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5
{
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v5;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v6;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v7;

  v7 = *a3;
  v6 = *a4;
  v5 = *a5;
  -[_MTLCommandEncoder drawMeshThreadgroups:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:](self, "drawMeshThreadgroups:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:", &v7, &v6, &v5);
}

- (void)drawMeshThreads:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5
{
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v5;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v6;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v7;

  v7 = *a3;
  v6 = *a4;
  v5 = *a5;
  -[_MTLCommandEncoder drawMeshThreads:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:](self, "drawMeshThreads:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:", &v7, &v6, &v5);
}

- (void)drawMeshThreadgroupsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4 threadsPerObjectThreadgroup:(id *)a5 threadsPerMeshThreadgroup:(id *)a6
{
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v6;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v7;

  v7 = *a5;
  v6 = *a6;
  -[_MTLCommandEncoder drawMeshThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:](self, "drawMeshThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:", a3, a4, &v7, &v6);
}

- (void)setObjectVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  -[_MTLCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

- (void)setObjectVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  -[_MTLCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4.location, a4.length);
}

- (void)setMeshVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  -[_MTLCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

- (void)setMeshVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  -[_MTLCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4.location, a4.length);
}

- (void)setObjectIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  -[_MTLCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

- (void)setObjectIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  -[_MTLCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4.location, a4.length);
}

- (void)setObjectAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  -[_MTLCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

- (void)setMeshIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  -[_MTLCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

- (void)setMeshIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  -[_MTLCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4.location, a4.length);
}

- (void)setMeshAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  -[_MTLCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

- (void)invalidateCompressedTexture:(id)a3
{
  -[_MTLCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)invalidateCompressedTexture:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5
{
  -[_MTLCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
}

- (void)setThreadgroupPackingDisabled:(BOOL)a3
{
  -[_MTLCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)setBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  -[_MTLCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5, a6);
}

- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 attributeStrides:(const unint64_t *)a5 withRange:(_NSRange)a6
{
  -[_MTLCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5, a6.location, a6.length);
}

- (void)setBufferOffset:(unint64_t)a3 attributeStride:(unint64_t)a4 atIndex:(unint64_t)a5
{
  -[_MTLCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
}

- (void)setBytes:(const void *)a3 length:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  -[_MTLCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5, a6);
}

- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  -[_MTLCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5, a6);
}

- (void)setVertexBuffers:(const void *)a3 offsets:(const unint64_t *)a4 attributeStrides:(const unint64_t *)a5 withRange:(_NSRange)a6
{
  -[_MTLCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5, a6.location, a6.length);
}

- (void)setVertexBufferOffset:(unint64_t)a3 attributeStride:(unint64_t)a4 atIndex:(unint64_t)a5
{
  -[_MTLCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
}

- (void)setVertexBytes:(const void *)a3 length:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  -[_MTLCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5, a6);
}

- (void)useResidencySet:(id)a3
{
  -[_MTLCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)useResidencySets:(const void *)a3 count:(unint64_t)a4
{
  -[_MTLCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

- (unint64_t)globalTraceObjectID
{
  return self->_globalTraceObjectID;
}

- (void)setNumThisEncoder:(unint64_t)a3
{
  self->_numThisEncoder = a3;
}

@end
