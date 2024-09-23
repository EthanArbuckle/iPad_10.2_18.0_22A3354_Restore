@implementation CMITiledInferenceProcessorTileInfoImpl

- (void)resetTileSpecificInfo
{
  CMITiledInferenceProcessorNetwork *nextNetwork;
  CMITiledInferenceProcessorNetwork *previousNetwork;
  MTLCommandBuffer *commandBuffer;
  void *v6;

  nextNetwork = self->_nextNetwork;
  *(_QWORD *)self->_tileIndex = 0;
  self->_nextNetwork = 0;

  previousNetwork = self->_previousNetwork;
  self->_previousNetwork = 0;

  commandBuffer = self->_commandBuffer;
  self->_commandBuffer = 0;

  v6 = (void *)MEMORY[0x1D824D210]();
  -[CMITiledInferenceProcessorTileInfoImpl setUserContext:](self, "setUserContext:", 0);
  objc_autoreleasePoolPop(v6);
}

- (id)userContext
{
  return self->userContext;
}

- (void)setUserContext:(id)a3
{
  objc_storeStrong(&self->userContext, a3);
}

- (MTLCommandBuffer)lastCommandBuffer
{
  return self->lastCommandBuffer;
}

- (void)setLastCommandBuffer:(id)a3
{
  objc_storeStrong((id *)&self->lastCommandBuffer, a3);
}

- (double)tileCount
{
  return *(double *)(a1 + 24);
}

- (void)setTileCount:(CMITiledInferenceProcessorTileInfoImpl *)self
{
  uint64_t v2;

  *(_QWORD *)self->_tileCount = v2;
}

- (unint64_t)bufferCount
{
  return self->_bufferCount;
}

- (void)setBufferCount:(unint64_t)a3
{
  self->_bufferCount = a3;
}

- (MTLCommandQueue)commandQueue
{
  return self->_commandQueue;
}

- (void)setCommandQueue:(id)a3
{
  objc_storeStrong((id *)&self->_commandQueue, a3);
}

- (unint64_t)bufferIndex
{
  return self->_bufferIndex;
}

- (void)setBufferIndex:(unint64_t)a3
{
  self->_bufferIndex = a3;
}

- (NSArray)networks
{
  return self->_networks;
}

- (void)setNetworks:(id)a3
{
  objc_storeStrong((id *)&self->_networks, a3);
}

- (double)tileIndex
{
  return *(double *)(a1 + 64);
}

- (void)setTileIndex:(CMITiledInferenceProcessorTileInfoImpl *)self
{
  uint64_t v2;

  *(_QWORD *)self->_tileIndex = v2;
}

- (CMITiledInferenceProcessorNetwork)nextNetwork
{
  return self->_nextNetwork;
}

- (void)setNextNetwork:(id)a3
{
  objc_storeStrong((id *)&self->_nextNetwork, a3);
}

- (CMITiledInferenceProcessorNetwork)previousNetwork
{
  return self->_previousNetwork;
}

- (void)setPreviousNetwork:(id)a3
{
  objc_storeStrong((id *)&self->_previousNetwork, a3);
}

- (MTLCommandBuffer)commandBuffer
{
  return self->_commandBuffer;
}

- (void)setCommandBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_commandBuffer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandBuffer, 0);
  objc_storeStrong((id *)&self->_previousNetwork, 0);
  objc_storeStrong((id *)&self->_nextNetwork, 0);
  objc_storeStrong((id *)&self->_networks, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->lastCommandBuffer, 0);
  objc_storeStrong(&self->userContext, 0);
}

@end
