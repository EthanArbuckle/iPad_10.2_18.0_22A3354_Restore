@implementation MTLCountersResourceStateCommandEncoder

- (MTLCountersResourceStateCommandEncoder)initWithResourceStateCommandEncoder:(id)a3 commandBuffer:(id)a4 descriptor:(id)a5
{
  MTLCountersResourceStateCommandEncoder *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTLCountersResourceStateCommandEncoder;
  v6 = -[MTLToolsResourceStateCommandEncoder initWithResourceStateCommandEncoder:parent:descriptor:](&v8, sel_initWithResourceStateCommandEncoder_parent_descriptor_, a3, a4, a5);
  if (v6)
    v6->_traceEncoder = (MTLCountersTraceResourceStateCommandEncoder *)(id)objc_msgSend((id)objc_msgSend(a4, "traceBuffer"), "resourceStateCommandEncoder");
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLCountersResourceStateCommandEncoder;
  -[MTLToolsObject dealloc](&v3, sel_dealloc);
}

- (void)insertDebugSignpost:(id)a3
{
  -[MTLCountersTraceCommandEncoder insertDebugSignpost:](self->_traceEncoder, "insertDebugSignpost:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "insertDebugSignpost:", a3);
}

- (void)pushDebugGroup:(id)a3
{
  -[MTLCountersTraceCommandEncoder pushDebugGroup:](self->_traceEncoder, "pushDebugGroup:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "pushDebugGroup:", a3);
}

- (void)popDebugGroup
{
  -[MTLCountersTraceCommandEncoder popDebugGroup](self->_traceEncoder, "popDebugGroup");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "popDebugGroup");
}

- (void)setLabel:(id)a3
{
  -[MTLCountersTraceCommandEncoder setLabel:](self->_traceEncoder, "setLabel:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setLabel:", a3);
}

- (void)updateTextureMappings:(id)a3 mode:(unint64_t)a4 regions:(id *)a5 mipLevels:(const unint64_t *)a6 slices:(const unint64_t *)a7 numRegions:(unint64_t)a8
{
  -[MTLCountersTraceResourceStateCommandEncoder updateTextureMappings:mode:regions:mipLevels:slices:numRegions:](self->_traceEncoder, "updateTextureMappings:mode:regions:mipLevels:slices:numRegions:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "updateTextureMappings:mode:regions:mipLevels:slices:numRegions:", a3, a4, a5, a6, a7, a8);
}

- (void)updateTextureMapping:(id)a3 mode:(unint64_t)a4 region:(id *)a5 mipLevel:(unint64_t)a6 slice:(unint64_t)a7
{
  MTLCountersTraceResourceStateCommandEncoder *traceEncoder;
  __int128 v14;
  id v15;
  __int128 v16;
  _OWORD v17[3];
  _OWORD v18[3];

  traceEncoder = self->_traceEncoder;
  v14 = *(_OWORD *)&a5->var0.var2;
  v18[0] = *(_OWORD *)&a5->var0.var0;
  v18[1] = v14;
  v18[2] = *(_OWORD *)&a5->var1.var1;
  -[MTLCountersTraceResourceStateCommandEncoder updateTextureMapping:mode:region:mipLevel:slice:](traceEncoder, "updateTextureMapping:mode:region:mipLevel:slice:", a3, a4, v18);
  v15 = -[MTLToolsObject baseObject](self, "baseObject");
  v16 = *(_OWORD *)&a5->var0.var2;
  v17[0] = *(_OWORD *)&a5->var0.var0;
  v17[1] = v16;
  v17[2] = *(_OWORD *)&a5->var1.var1;
  objc_msgSend(v15, "updateTextureMapping:mode:region:mipLevel:slice:", a3, a4, v17, a6, a7);
}

- (void)updateTextureMapping:(id)a3 mode:(unint64_t)a4 indirectBuffer:(id)a5 indirectBufferOffset:(unint64_t)a6
{
  -[MTLCountersTraceResourceStateCommandEncoder updateTextureMapping:mode:indirectBuffer:indirectBufferOffset:](self->_traceEncoder, "updateTextureMapping:mode:indirectBuffer:indirectBufferOffset:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "updateTextureMapping:mode:indirectBuffer:indirectBufferOffset:", a3, a4, a5, a6);
}

- (void)copyMappingStateFromTexture:(id)a3 mipLevel:(unint64_t)a4 slice:(unint64_t)a5 toBuffer:(id)a6 offset:(unint64_t)a7 numTiles:(unint64_t)a8
{
  -[MTLCountersTraceResourceStateCommandEncoder copyMappingStateFromTexture:mipLevel:slice:toBuffer:offset:numTiles:](self->_traceEncoder, "copyMappingStateFromTexture:mipLevel:slice:toBuffer:offset:numTiles:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "copyMappingStateFromTexture:mipLevel:slice:toBuffer:offset:numTiles:", a3, a4, a5, a6, a7, a8);
}

- (void)moveTextureMappingsFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11
{
  MTLCountersTraceResourceStateCommandEncoder *traceEncoder;
  id v19;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v20;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v21;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v22;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v23;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v24;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v25;

  traceEncoder = self->_traceEncoder;
  v25 = *a6;
  v24 = *a7;
  v23 = *a11;
  -[MTLCountersTraceResourceStateCommandEncoder moveTextureMappingsFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:](traceEncoder, "moveTextureMappingsFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", a3, a4, a5, &v25, &v24, a9, a10, &v23);
  v19 = -[MTLToolsObject baseObject](self, "baseObject");
  v22 = *a6;
  v21 = *a7;
  v20 = *a11;
  objc_msgSend(v19, "moveTextureMappingsFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", a3, a4, a5, &v22, &v21, a8, a9, a10, &v20);
}

- (void)updateFence:(id)a3
{
  -[MTLCountersTraceResourceStateCommandEncoder updateFence:](self->_traceEncoder, "updateFence:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "updateFence:", a3);
}

- (void)waitForFence:(id)a3
{
  -[MTLCountersTraceResourceStateCommandEncoder waitForFence:](self->_traceEncoder, "waitForFence:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "waitForFence:", a3);
}

- (void)endEncoding
{
  -[MTLCountersTraceCommandEncoder endEncoding](self->_traceEncoder, "endEncoding");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "endEncoding");
}

@end
