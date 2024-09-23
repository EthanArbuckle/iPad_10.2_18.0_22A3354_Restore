@implementation GTMTLReplaySharedBlitBuffer

- (GTMTLReplaySharedBlitBuffer)initWithCommandQueue:(id)a3 resourcePool:(id)a4
{
  id v7;
  id v8;
  GTMTLReplaySharedBlitBuffer *v9;
  GTMTLReplaySharedResourcePool *v10;
  NSMutableArray *v11;
  GTMTLReplaySharedResourcePool *resourcePool;
  NSMutableArray *retainArray;
  MTLCommandBuffer *commandBuffer;
  MTLCommandEncoder *commandEncoder;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)GTMTLReplaySharedBlitBuffer;
  v9 = -[GTMTLReplaySharedBlitBuffer init](&v17, "init");
  if (v9)
  {
    v10 = (GTMTLReplaySharedResourcePool *)v8;
    v11 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 4);
    resourcePool = v9->_bufferArray.resourcePool;
    v9->_bufferArray.resourcePool = v10;

    retainArray = v9->_bufferArray.retainArray;
    v9->_bufferArray.retainArray = v11;

    v9->_bufferArray.bufferOffset = 0;
    objc_storeStrong((id *)&v9->_commandBuffer.commandQueue, a3);
    commandBuffer = v9->_commandBuffer.commandBuffer;
    v9->_commandBuffer.commandBuffer = 0;

    commandEncoder = v9->_commandBuffer.commandEncoder;
    v9->_commandBuffer.commandEncoder = 0;

  }
  return v9;
}

- (void)dealloc
{
  MTLCommandQueue *commandQueue;
  GTMTLReplaySharedResourcePool *resourcePool;
  NSMutableArray *retainArray;
  objc_super v6;

  SharedCommandBuffer_clearCommandBuffer((uint64_t)&self->_commandBuffer);
  commandQueue = self->_commandBuffer.commandQueue;
  self->_commandBuffer.commandQueue = 0;

  resourcePool = self->_bufferArray.resourcePool;
  self->_bufferArray.resourcePool = 0;

  retainArray = self->_bufferArray.retainArray;
  self->_bufferArray.retainArray = 0;

  v6.receiver = self;
  v6.super_class = (Class)GTMTLReplaySharedBlitBuffer;
  -[GTMTLReplaySharedBlitBuffer dealloc](&v6, "dealloc");
}

- (GTMTLReplaySharedBlitBuffer)bufferWithLength:(unint64_t)a3 alignment:(unint64_t)a4
{
  void *v7;
  id v8;
  unint64_t v9;
  void *v10;
  id v11;
  unint64_t v12;
  unint64_t v13;
  GTMTLReplaySharedBufferRange *v14;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_bufferArray.retainArray, "lastObject"));
  if (v7)
  {
    v8 = v7;
    v9 = (a4 + self->_bufferArray.bufferOffset - 1) & -(uint64_t)a4;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "buffer"));
    v11 = objc_msgSend(v10, "length");

    if ((unint64_t)v11 >= v9 + a3)
      goto LABEL_7;

  }
  v12 = -[GTMTLReplaySharedResourcePool defaultBufferCapacity](self->_bufferArray.resourcePool, "defaultBufferCapacity");
  v13 = a3;
  if (v12 > a3)
    v13 = -[GTMTLReplaySharedResourcePool defaultBufferCapacity](self->_bufferArray.resourcePool, "defaultBufferCapacity", a3);
  v8 = -[GTMTLReplaySharedResourcePool newBufferHeapWithLength:](self->_bufferArray.resourcePool, "newBufferHeapWithLength:", v13);
  -[NSMutableArray addObject:](self->_bufferArray.retainArray, "addObject:", v8);
  v9 = 0;
LABEL_7:
  self->_bufferArray.bufferOffset = v9 + a3;
  v14 = -[GTMTLReplaySharedBufferRange initWithHeap:range:]([GTMTLReplaySharedBufferRange alloc], "initWithHeap:range:", v8, v9, a3);

  return (GTMTLReplaySharedBlitBuffer *)v14;
}

- (id)resourcePool
{
  return self->_bufferArray.resourcePool;
}

- (id)commandBuffer
{
  return SharedCommandBuffer_commandBuffer((uint64_t)&self->_commandBuffer);
}

- (id)blitCommandEncoder
{
  MTLCommandEncoder **p_commandEncoder;
  MTLCommandEncoder *v3;
  MTLCommandEncoder *v4;
  id v5;
  void *v6;
  id v7;

  p_commandEncoder = &self->_commandBuffer.commandEncoder;
  v3 = self->_commandBuffer.commandEncoder;
  if (!v3)
    goto LABEL_4;
  v4 = v3;
  if ((-[MTLCommandEncoder conformsToProtocol:](v3, "conformsToProtocol:", &OBJC_PROTOCOL___MTLBlitCommandEncoder) & 1) == 0)
  {
    -[MTLCommandEncoder endEncoding](v4, "endEncoding");

LABEL_4:
    v5 = SharedCommandBuffer_commandBuffer((uint64_t)(p_commandEncoder - 2));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = InternalBlitCommandEncoder(v6, *(p_commandEncoder - 2));
    v4 = (MTLCommandEncoder *)objc_claimAutoreleasedReturnValue(v7);
    objc_storeStrong((id *)p_commandEncoder, v4);

  }
  return v4;
}

- (id)accelerationStructureCommandEncoder
{
  MTLCommandEncoder **p_commandEncoder;
  MTLCommandEncoder *v3;
  MTLCommandEncoder *v4;
  id v5;
  void *v6;

  p_commandEncoder = &self->_commandBuffer.commandEncoder;
  v3 = self->_commandBuffer.commandEncoder;
  if (!v3)
    goto LABEL_4;
  v4 = v3;
  if ((-[MTLCommandEncoder conformsToProtocol:](v3, "conformsToProtocol:", &OBJC_PROTOCOL___MTLAccelerationStructureCommandEncoder) & 1) == 0)
  {
    -[MTLCommandEncoder endEncoding](v4, "endEncoding");

LABEL_4:
    v5 = SharedCommandBuffer_commandBuffer((uint64_t)(p_commandEncoder - 2));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v4 = (MTLCommandEncoder *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accelerationStructureCommandEncoder"));
    objc_storeStrong((id *)p_commandEncoder, v4);

  }
  return v4;
}

- (id)renderCommandEncoderWithDescriptor:(id)a3
{
  id v4;
  MTLCommandEncoder **p_commandEncoder;
  MTLCommandEncoder *v6;
  MTLCommandEncoder *v7;
  id v8;
  void *v9;
  void *v10;

  v4 = a3;
  p_commandEncoder = &self->_commandBuffer.commandEncoder;
  v6 = self->_commandBuffer.commandEncoder;
  if (v6)
  {
    v7 = v6;
    -[MTLCommandEncoder endEncoding](v6, "endEncoding");

  }
  v8 = SharedCommandBuffer_commandBuffer((uint64_t)&self->_commandBuffer);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "renderCommandEncoderWithDescriptor:", v4));
  objc_storeStrong((id *)p_commandEncoder, v10);

  return v10;
}

- (BOOL)commitCommandBuffer
{
  return -[GTMTLReplaySharedBlitBuffer commitCommandBufferWithLog:](self, "commitCommandBufferWithLog:", g_activityLog);
}

- (BOOL)commitCommandBufferWithLog:(id)a3
{
  SharedCommandBuffer *p_commandBuffer;
  id v5;
  id v6;
  MTLCommandBuffer *v7;
  id v8;
  _QWORD v10[4];
  id v11;

  p_commandBuffer = &self->_commandBuffer;
  objc_msgSend(a3, "logSharedCommandBuffer:", self->_commandBuffer.commandBuffer);
  v5 = SharedBufferArray_retainArray((uint64_t)&self->_bufferArray);
  v6 = (id)objc_claimAutoreleasedReturnValue(v5);
  v7 = self->_commandBuffer.commandBuffer;
  SharedCommandBuffer_clearCommandBuffer((uint64_t)p_commandBuffer);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __SharedCommandBuffer_commitCommandBuffer_block_invoke;
  v10[3] = &unk_7261C8;
  v11 = v6;
  v8 = v6;
  -[MTLCommandBuffer addCompletedHandler:](v7, "addCompletedHandler:", v10);
  GTMTLReplay_commitCommandBuffer(v7);

  return v7 != 0;
}

- (void)clearCommandBuffer
{
  id v3;

  v3 = SharedBufferArray_retainArray((uint64_t)&self->_bufferArray);
  SharedCommandBuffer_clearCommandBuffer((uint64_t)&self->_commandBuffer);
}

- (void)releaseBuffer
{
  -[NSMutableArray removeAllObjects](self->_bufferArray.retainArray, "removeAllObjects");
}

- (void).cxx_destruct
{

}

@end
