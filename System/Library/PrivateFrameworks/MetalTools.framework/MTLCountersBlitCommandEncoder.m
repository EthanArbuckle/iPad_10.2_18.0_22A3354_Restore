@implementation MTLCountersBlitCommandEncoder

- (MTLCountersBlitCommandEncoder)initWithBlitCommandEncoder:(id)a3 commandBuffer:(id)a4 descriptor:(id)a5
{
  MTLCountersBlitCommandEncoder *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTLCountersBlitCommandEncoder;
  v6 = -[MTLToolsBlitCommandEncoder initWithBlitCommandEncoder:parent:descriptor:](&v8, sel_initWithBlitCommandEncoder_parent_descriptor_, a3, a4, a5);
  if (v6)
    v6->_traceEncoder = (MTLCountersTraceBlitCommandEncoder *)(id)objc_msgSend((id)objc_msgSend(a4, "traceBuffer"), "blitCommandEncoder");
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLCountersBlitCommandEncoder;
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

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11
{
  MTLCountersTraceBlitCommandEncoder *traceEncoder;
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
  -[MTLCountersTraceBlitCommandEncoder copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:](traceEncoder, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", a3, a4, a5, &v25, &v24, a9, a10, &v23);
  v19 = -[MTLToolsObject baseObject](self, "baseObject");
  v22 = *a6;
  v21 = *a7;
  v20 = *a11;
  objc_msgSend(v19, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", a3, a4, a5, &v22, &v21, a8, a9, a10, &v20);
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11 options:(unint64_t)a12
{
  MTLCountersTraceBlitCommandEncoder *traceEncoder;
  id v19;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v21;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v22;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v23;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v24;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v25;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v26;

  traceEncoder = self->_traceEncoder;
  v26 = *a6;
  v25 = *a7;
  v24 = *a11;
  -[MTLCountersTraceBlitCommandEncoder copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:options:](traceEncoder, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:options:", a3, a4, a5, &v26, &v25, a9, a10, &v24, a12);
  v19 = -[MTLToolsObject baseObject](self, "baseObject");
  v23 = *a6;
  v22 = *a7;
  v21 = *a11;
  objc_msgSend(v19, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:options:", a3, a4, a5, &v23, &v22, a8, a9, a10, &v21, a12);
}

- (void)copyFromBuffer:(id)a3 sourceOffset:(unint64_t)a4 sourceBytesPerRow:(unint64_t)a5 sourceBytesPerImage:(unint64_t)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11
{
  MTLCountersTraceBlitCommandEncoder *traceEncoder;
  id v19;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v20;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v21;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v22;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v23;

  traceEncoder = self->_traceEncoder;
  v23 = *a7;
  v22 = *a11;
  -[MTLCountersTraceBlitCommandEncoder copyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:](traceEncoder, "copyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", a3, a4, a5, a6, &v23, a9, a10, &v22);
  v19 = -[MTLToolsObject baseObject](self, "baseObject");
  v21 = *a7;
  v20 = *a11;
  objc_msgSend(v19, "copyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", a3, a4, a5, a6, &v21, a8, a9, a10, &v20);
}

- (void)copyFromBuffer:(id)a3 sourceOffset:(unint64_t)a4 sourceBytesPerRow:(unint64_t)a5 sourceBytesPerImage:(unint64_t)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11 options:(unint64_t)a12
{
  MTLCountersTraceBlitCommandEncoder *traceEncoder;
  id v19;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v21;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v22;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v23;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v24;

  traceEncoder = self->_traceEncoder;
  v24 = *a7;
  v23 = *a11;
  -[MTLCountersTraceBlitCommandEncoder copyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:options:](traceEncoder, "copyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:options:", a3, a4, a5, a6, &v24, a9, a10, &v23, a12);
  v19 = -[MTLToolsObject baseObject](self, "baseObject");
  v22 = *a7;
  v21 = *a11;
  objc_msgSend(v19, "copyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:options:", a3, a4, a5, a6, &v22, a8, a9, a10, &v21, a12);
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toBuffer:(id)a8 destinationOffset:(unint64_t)a9 destinationBytesPerRow:(unint64_t)a10 destinationBytesPerImage:(unint64_t)a11
{
  MTLCountersTraceBlitCommandEncoder *traceEncoder;
  id v19;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v20;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v21;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v22;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v23;

  traceEncoder = self->_traceEncoder;
  v23 = *a6;
  v22 = *a7;
  -[MTLCountersTraceBlitCommandEncoder copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toBuffer:destinationOffset:destinationBytesPerRow:destinationBytesPerImage:](traceEncoder, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toBuffer:destinationOffset:destinationBytesPerRow:destinationBytesPerImage:", a3, a4, a5, &v23, &v22, a9, a10, a11);
  v19 = -[MTLToolsObject baseObject](self, "baseObject");
  v21 = *a6;
  v20 = *a7;
  objc_msgSend(v19, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toBuffer:destinationOffset:destinationBytesPerRow:destinationBytesPerImage:", a3, a4, a5, &v21, &v20, a8, a9, a10, a11);
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toBuffer:(id)a8 destinationOffset:(unint64_t)a9 destinationBytesPerRow:(unint64_t)a10 destinationBytesPerImage:(unint64_t)a11 options:(unint64_t)a12
{
  MTLCountersTraceBlitCommandEncoder *traceEncoder;
  id v19;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v21;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v22;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v23;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v24;

  traceEncoder = self->_traceEncoder;
  v24 = *a6;
  v23 = *a7;
  -[MTLCountersTraceBlitCommandEncoder copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toBuffer:destinationOffset:destinationBytesPerRow:destinationBytesPerImage:options:](traceEncoder, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toBuffer:destinationOffset:destinationBytesPerRow:destinationBytesPerImage:options:", a3, a4, a5, &v24, &v23, a9, a10, a11, a12);
  v19 = -[MTLToolsObject baseObject](self, "baseObject");
  v22 = *a6;
  v21 = *a7;
  objc_msgSend(v19, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toBuffer:destinationOffset:destinationBytesPerRow:destinationBytesPerImage:options:", a3, a4, a5, &v22, &v21, a8, a9, a10, a11, a12);
}

- (void)generateMipmapsForTexture:(id)a3
{
  -[MTLCountersTraceBlitCommandEncoder generateMipmapsForTexture:](self->_traceEncoder, "generateMipmapsForTexture:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "generateMipmapsForTexture:", a3);
}

- (void)fillBuffer:(id)a3 range:(_NSRange)a4 value:(unsigned __int8)a5
{
  uint64_t v5;
  NSUInteger length;
  NSUInteger location;

  v5 = a5;
  length = a4.length;
  location = a4.location;
  -[MTLCountersTraceBlitCommandEncoder fillBuffer:range:value:](self->_traceEncoder, "fillBuffer:range:value:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "fillBuffer:range:value:", a3, location, length, v5);
}

- (void)fillBuffer:(id)a3 range:(_NSRange)a4 pattern4:(unsigned int)a5
{
  uint64_t v5;
  NSUInteger length;
  NSUInteger location;

  v5 = *(_QWORD *)&a5;
  length = a4.length;
  location = a4.location;
  -[MTLCountersTraceBlitCommandEncoder fillBuffer:range:pattern4:](self->_traceEncoder, "fillBuffer:range:pattern4:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "fillBuffer:range:pattern4:", a3, location, length, v5);
}

- (void)fillTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 region:(id *)a6 bytes:(const void *)a7 length:(unint64_t)a8
{
  MTLCountersTraceBlitCommandEncoder *traceEncoder;
  __int128 v16;
  id v17;
  __int128 v18;
  _OWORD v19[3];
  _OWORD v20[3];

  traceEncoder = self->_traceEncoder;
  v16 = *(_OWORD *)&a6->var0.var2;
  v20[0] = *(_OWORD *)&a6->var0.var0;
  v20[1] = v16;
  v20[2] = *(_OWORD *)&a6->var1.var1;
  -[MTLCountersTraceBlitCommandEncoder fillTexture:level:slice:region:bytes:length:](traceEncoder, "fillTexture:level:slice:region:bytes:length:", a3, a4, a5, v20);
  v17 = -[MTLToolsObject baseObject](self, "baseObject");
  v18 = *(_OWORD *)&a6->var0.var2;
  v19[0] = *(_OWORD *)&a6->var0.var0;
  v19[1] = v18;
  v19[2] = *(_OWORD *)&a6->var1.var1;
  objc_msgSend(v17, "fillTexture:level:slice:region:bytes:length:", a3, a4, a5, v19, a7, a8);
}

- (void)fillTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 region:(id *)a6 color:(id)a7
{
  double var3;
  double var2;
  double var1;
  double var0;
  MTLCountersTraceBlitCommandEncoder *traceEncoder;
  __int128 v17;
  id v18;
  __int128 v19;
  _OWORD v20[3];
  _OWORD v21[3];

  var3 = a7.var3;
  var2 = a7.var2;
  var1 = a7.var1;
  var0 = a7.var0;
  traceEncoder = self->_traceEncoder;
  v17 = *(_OWORD *)&a6->var0.var2;
  v21[0] = *(_OWORD *)&a6->var0.var0;
  v21[1] = v17;
  v21[2] = *(_OWORD *)&a6->var1.var1;
  -[MTLCountersTraceBlitCommandEncoder fillTexture:level:slice:region:color:](traceEncoder, "fillTexture:level:slice:region:color:", a3, a4, a5, v21, a7.var0, var1);
  v18 = -[MTLToolsObject baseObject](self, "baseObject");
  v19 = *(_OWORD *)&a6->var0.var2;
  v20[0] = *(_OWORD *)&a6->var0.var0;
  v20[1] = v19;
  v20[2] = *(_OWORD *)&a6->var1.var1;
  objc_msgSend(v18, "fillTexture:level:slice:region:color:", a3, a4, a5, v20, var0, var1, var2, var3);
}

- (void)fillTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 region:(id *)a6 color:(id)a7 pixelFormat:(unint64_t)a8
{
  double var3;
  double var2;
  double var1;
  double var0;
  MTLCountersTraceBlitCommandEncoder *traceEncoder;
  __int128 v19;
  id v20;
  __int128 v21;
  _OWORD v22[3];
  _OWORD v23[3];

  var3 = a7.var3;
  var2 = a7.var2;
  var1 = a7.var1;
  var0 = a7.var0;
  traceEncoder = self->_traceEncoder;
  v19 = *(_OWORD *)&a6->var0.var2;
  v23[0] = *(_OWORD *)&a6->var0.var0;
  v23[1] = v19;
  v23[2] = *(_OWORD *)&a6->var1.var1;
  -[MTLCountersTraceBlitCommandEncoder fillTexture:level:slice:region:color:pixelFormat:](traceEncoder, "fillTexture:level:slice:region:color:pixelFormat:", a3, a4, a5, v23, a7.var0, var1);
  v20 = -[MTLToolsObject baseObject](self, "baseObject");
  v21 = *(_OWORD *)&a6->var0.var2;
  v22[0] = *(_OWORD *)&a6->var0.var0;
  v22[1] = v21;
  v22[2] = *(_OWORD *)&a6->var1.var1;
  objc_msgSend(v20, "fillTexture:level:slice:region:color:pixelFormat:", a3, a4, a5, v22, a8, var0, var1, var2, var3);
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 toTexture:(id)a6 destinationSlice:(unint64_t)a7 destinationLevel:(unint64_t)a8 sliceCount:(unint64_t)a9 levelCount:(unint64_t)a10
{
  -[MTLCountersTraceBlitCommandEncoder copyFromTexture:sourceSlice:sourceLevel:toTexture:destinationSlice:destinationLevel:sliceCount:levelCount:](self->_traceEncoder, "copyFromTexture:sourceSlice:sourceLevel:toTexture:destinationSlice:destinationLevel:sliceCount:levelCount:", a9, a10);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "copyFromTexture:sourceSlice:sourceLevel:toTexture:destinationSlice:destinationLevel:sliceCount:levelCount:", a3, a4, a5, a6, a7, a8);
}

- (void)copyFromTexture:(id)a3 toTexture:(id)a4
{
  -[MTLCountersTraceBlitCommandEncoder copyFromTexture:toTexture:](self->_traceEncoder, "copyFromTexture:toTexture:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "copyFromTexture:toTexture:", a3, a4);
}

- (void)copyFromBuffer:(id)a3 sourceOffset:(unint64_t)a4 toBuffer:(id)a5 destinationOffset:(unint64_t)a6 size:(unint64_t)a7
{
  -[MTLCountersTraceBlitCommandEncoder copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:](self->_traceEncoder, "copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:", a3, a4, a5, a6, a7);
}

- (void)updateFence:(id)a3
{
  -[MTLCountersTraceBlitCommandEncoder updateFence:](self->_traceEncoder, "updateFence:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "updateFence:", a3);
}

- (void)waitForFence:(id)a3
{
  -[MTLCountersTraceBlitCommandEncoder waitForFence:](self->_traceEncoder, "waitForFence:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "waitForFence:", a3);
}

- (void)endEncoding
{
  -[MTLCountersTraceCommandEncoder endEncoding](self->_traceEncoder, "endEncoding");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "endEncoding");
}

- (void)optimizeContentsForGPUAccess:(id)a3
{
  -[MTLCountersTraceBlitCommandEncoder optimizeContentsForGPUAccess:](self->_traceEncoder, "optimizeContentsForGPUAccess:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "optimizeContentsForGPUAccess:", a3);
}

- (void)optimizeContentsForGPUAccess:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5
{
  -[MTLCountersTraceBlitCommandEncoder optimizeContentsForGPUAccess:slice:level:](self->_traceEncoder, "optimizeContentsForGPUAccess:slice:level:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "optimizeContentsForGPUAccess:slice:level:", a3, a4, a5);
}

- (void)optimizeContentsForCPUAccess:(id)a3
{
  -[MTLCountersTraceBlitCommandEncoder optimizeContentsForCPUAccess:](self->_traceEncoder, "optimizeContentsForCPUAccess:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "optimizeContentsForCPUAccess:", a3);
}

- (void)optimizeContentsForCPUAccess:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5
{
  -[MTLCountersTraceBlitCommandEncoder optimizeContentsForCPUAccess:slice:level:](self->_traceEncoder, "optimizeContentsForCPUAccess:slice:level:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "optimizeContentsForCPUAccess:slice:level:", a3, a4, a5);
}

@end
