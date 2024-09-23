@implementation MTLToolsBlitCommandEncoder

- (MTLToolsBlitCommandEncoder)initWithBaseObject:(id)a3 parent:(id)a4
{
  return -[MTLToolsBlitCommandEncoder initWithBlitCommandEncoder:parent:descriptor:](self, "initWithBlitCommandEncoder:parent:descriptor:", a3, a4, 0);
}

- (MTLToolsBlitCommandEncoder)initWithBlitCommandEncoder:(id)a3 parent:(id)a4 descriptor:(id)a5
{
  MTLToolsBlitCommandEncoder *v6;
  MTLToolsBlitCommandEncoder *v7;
  uint64_t i;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MTLToolsBlitCommandEncoder;
  v6 = -[MTLToolsCommandEncoder initWithBaseObject:parent:](&v10, sel_initWithBaseObject_parent_, a3, a4);
  v7 = v6;
  if (a5 && v6)
  {
    for (i = 0; i != 4; ++i)
      -[MTLToolsCommandEncoder addRetainedObject:](v7, "addRetainedObject:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "sampleBufferAttachments"), "objectAtIndexedSubscript:", i), "sampleBuffer"));
  }
  return v7;
}

- (void)updateFence:(id)a3
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "updateFence:", objc_msgSend(a3, "baseObject"));
}

- (void)waitForFence:(id)a3
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "waitForFence:", objc_msgSend(a3, "baseObject"));
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11
{
  id v18;
  uint64_t v19;
  uint64_t v20;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v21;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v22;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v23;

  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", a8);
  v18 = -[MTLToolsObject baseObject](self, "baseObject");
  v19 = objc_msgSend(a3, "baseObject");
  v23 = *a6;
  v22 = *a7;
  v20 = objc_msgSend(a8, "baseObject");
  v21 = *a11;
  objc_msgSend(v18, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", v19, a4, a5, &v23, &v22, v20, a9, a10, &v21);
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11 options:(unint64_t)a12
{
  id v18;
  uint64_t v19;
  uint64_t v20;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v22;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v23;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v24;

  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", a8);
  v18 = -[MTLToolsObject baseObject](self, "baseObject");
  v19 = objc_msgSend(a3, "baseObject");
  v24 = *a6;
  v23 = *a7;
  v20 = objc_msgSend(a8, "baseObject");
  v22 = *a11;
  objc_msgSend(v18, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:options:", v19, a4, a5, &v24, &v23, v20, a9, a10, &v22, a12);
}

- (void)copyFromBuffer:(id)a3 sourceOffset:(unint64_t)a4 sourceBytesPerRow:(unint64_t)a5 sourceBytesPerImage:(unint64_t)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11
{
  id v18;
  uint64_t v19;
  uint64_t v20;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v21;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v22;

  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", a8);
  v18 = -[MTLToolsObject baseObject](self, "baseObject");
  v19 = objc_msgSend(a3, "baseObject");
  v22 = *a7;
  v20 = objc_msgSend(a8, "baseObject");
  v21 = *a11;
  objc_msgSend(v18, "copyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", v19, a4, a5, a6, &v22, v20, a9, a10, &v21);
}

- (void)copyFromBuffer:(id)a3 sourceOffset:(unint64_t)a4 sourceBytesPerRow:(unint64_t)a5 sourceBytesPerImage:(unint64_t)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11 options:(unint64_t)a12
{
  id v18;
  uint64_t v19;
  uint64_t v20;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v22;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v23;

  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", a8);
  v18 = -[MTLToolsObject baseObject](self, "baseObject");
  v19 = objc_msgSend(a3, "baseObject");
  v23 = *a7;
  v20 = objc_msgSend(a8, "baseObject");
  v22 = *a11;
  objc_msgSend(v18, "copyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:options:", v19, a4, a5, a6, &v23, v20, a9, a10, &v22, a12);
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toBuffer:(id)a8 destinationOffset:(unint64_t)a9 destinationBytesPerRow:(unint64_t)a10 destinationBytesPerImage:(unint64_t)a11
{
  id v18;
  uint64_t v19;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v20;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v21;

  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", a8);
  v18 = -[MTLToolsObject baseObject](self, "baseObject");
  v19 = objc_msgSend(a3, "baseObject");
  v21 = *a6;
  v20 = *a7;
  objc_msgSend(v18, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toBuffer:destinationOffset:destinationBytesPerRow:destinationBytesPerImage:", v19, a4, a5, &v21, &v20, objc_msgSend(a8, "baseObject"), a9, a10, a11);
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toBuffer:(id)a8 destinationOffset:(unint64_t)a9 destinationBytesPerRow:(unint64_t)a10 destinationBytesPerImage:(unint64_t)a11 options:(unint64_t)a12
{
  id v19;
  uint64_t v20;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v21;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v22;

  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", a8);
  v19 = -[MTLToolsObject baseObject](self, "baseObject");
  v20 = objc_msgSend(a3, "baseObject");
  v22 = *a6;
  v21 = *a7;
  objc_msgSend(v19, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toBuffer:destinationOffset:destinationBytesPerRow:destinationBytesPerImage:options:", v20, a4, a5, &v22, &v21, objc_msgSend(a8, "baseObject"), a9, a10, a11, a12);
}

- (void)copyFromBuffer:(id)a3 sourceOffset:(unint64_t)a4 toBuffer:(id)a5 destinationOffset:(unint64_t)a6 size:(unint64_t)a7
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", a5);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:", objc_msgSend(a3, "baseObject"), a4, objc_msgSend(a5, "baseObject"), a6, a7);
}

- (void)generateMipmapsForTexture:(id)a3
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "generateMipmapsForTexture:", objc_msgSend(a3, "baseObject"));
}

- (void)fillBuffer:(id)a3 range:(_NSRange)a4 value:(unsigned __int8)a5
{
  uint64_t v5;
  NSUInteger length;
  NSUInteger location;

  v5 = a5;
  length = a4.length;
  location = a4.location;
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "fillBuffer:range:value:", objc_msgSend(a3, "baseObject"), location, length, v5);
}

- (void)fillBuffer:(id)a3 range:(_NSRange)a4 pattern4:(unsigned int)a5
{
  uint64_t v5;
  NSUInteger length;
  NSUInteger location;

  v5 = *(_QWORD *)&a5;
  length = a4.length;
  location = a4.location;
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "fillBuffer:range:pattern4:", objc_msgSend(a3, "baseObject"), location, length, v5);
}

- (void)fillTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 region:(id *)a6 bytes:(const void *)a7 length:(unint64_t)a8
{
  id v15;
  uint64_t v16;
  __int128 v17;
  _OWORD v18[3];

  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  v15 = -[MTLToolsObject baseObject](self, "baseObject");
  v16 = objc_msgSend(a3, "baseObject");
  v17 = *(_OWORD *)&a6->var0.var2;
  v18[0] = *(_OWORD *)&a6->var0.var0;
  v18[1] = v17;
  v18[2] = *(_OWORD *)&a6->var1.var1;
  objc_msgSend(v15, "fillTexture:level:slice:region:bytes:length:", v16, a4, a5, v18, a7, a8);
}

- (void)fillTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 region:(id *)a6 color:(id)a7
{
  double var3;
  double var2;
  double var1;
  double var0;
  id v16;
  uint64_t v17;
  __int128 v18;
  _OWORD v19[3];

  var3 = a7.var3;
  var2 = a7.var2;
  var1 = a7.var1;
  var0 = a7.var0;
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  v16 = -[MTLToolsObject baseObject](self, "baseObject");
  v17 = objc_msgSend(a3, "baseObject");
  v18 = *(_OWORD *)&a6->var0.var2;
  v19[0] = *(_OWORD *)&a6->var0.var0;
  v19[1] = v18;
  v19[2] = *(_OWORD *)&a6->var1.var1;
  objc_msgSend(v16, "fillTexture:level:slice:region:color:", v17, a4, a5, v19, var0, var1, var2, var3);
}

- (void)fillTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 region:(id *)a6 color:(id)a7 pixelFormat:(unint64_t)a8
{
  double var3;
  double var2;
  double var1;
  double var0;
  id v18;
  uint64_t v19;
  __int128 v20;
  _OWORD v21[3];

  var3 = a7.var3;
  var2 = a7.var2;
  var1 = a7.var1;
  var0 = a7.var0;
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  v18 = -[MTLToolsObject baseObject](self, "baseObject");
  v19 = objc_msgSend(a3, "baseObject");
  v20 = *(_OWORD *)&a6->var0.var2;
  v21[0] = *(_OWORD *)&a6->var0.var0;
  v21[1] = v20;
  v21[2] = *(_OWORD *)&a6->var1.var1;
  objc_msgSend(v18, "fillTexture:level:slice:region:color:pixelFormat:", v19, a4, a5, v21, a8, var0, var1, var2, var3);
}

- (void)invalidateCompressedTexture:(id)a3
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "invalidateCompressedTexture:", objc_msgSend(a3, "baseObject"));
}

- (void)invalidateCompressedTexture:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "invalidateCompressedTexture:slice:level:", objc_msgSend(a3, "baseObject"), a4, a5);
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 toTexture:(id)a6 destinationSlice:(unint64_t)a7 destinationLevel:(unint64_t)a8 sliceCount:(unint64_t)a9 levelCount:(unint64_t)a10
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", a6);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "copyFromTexture:sourceSlice:sourceLevel:toTexture:destinationSlice:destinationLevel:sliceCount:levelCount:", objc_msgSend(a3, "baseObject"), a4, a5, objc_msgSend(a6, "baseObject"), a7, a8);
}

- (void)copyFromTexture:(id)a3 toTexture:(id)a4
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", a4);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "copyFromTexture:toTexture:", objc_msgSend(a3, "baseObject"), objc_msgSend(a4, "baseObject"));
}

- (void)getTextureAccessCounters:(id)a3 region:(id *)a4 mipLevel:(unint64_t)a5 slice:(unint64_t)a6 resetCounters:(BOOL)a7 countersBuffer:(id)a8 countersBufferOffset:(unint64_t)a9
{
  _BOOL8 v10;
  id v15;
  uint64_t v16;
  __int128 v17;
  _OWORD v18[3];

  v10 = a7;
  v15 = -[MTLToolsObject baseObject](self, "baseObject");
  v16 = objc_msgSend(a3, "baseObject");
  v17 = *(_OWORD *)&a4->var0.var2;
  v18[0] = *(_OWORD *)&a4->var0.var0;
  v18[1] = v17;
  v18[2] = *(_OWORD *)&a4->var1.var1;
  objc_msgSend(v15, "getTextureAccessCounters:region:mipLevel:slice:resetCounters:countersBuffer:countersBufferOffset:", v16, v18, a5, a6, v10, objc_msgSend(a8, "baseObject"), a9);
}

- (void)resetTextureAccessCounters:(id)a3 region:(id *)a4 mipLevel:(unint64_t)a5 slice:(unint64_t)a6
{
  id v10;
  uint64_t v11;
  __int128 v12;
  _OWORD v13[3];

  v10 = -[MTLToolsObject baseObject](self, "baseObject");
  v11 = objc_msgSend(a3, "baseObject");
  v12 = *(_OWORD *)&a4->var0.var2;
  v13[0] = *(_OWORD *)&a4->var0.var0;
  v13[1] = v12;
  v13[2] = *(_OWORD *)&a4->var1.var1;
  objc_msgSend(v10, "resetTextureAccessCounters:region:mipLevel:slice:", v11, v13, a5, a6);
}

- (void)optimizeContentsForGPUAccess:(id)a3
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "optimizeContentsForGPUAccess:", objc_msgSend(a3, "baseObject"));
}

- (void)optimizeContentsForGPUAccess:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "optimizeContentsForGPUAccess:slice:level:", objc_msgSend(a3, "baseObject"), a4, a5);
}

- (void)optimizeContentsForCPUAccess:(id)a3
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "optimizeContentsForCPUAccess:", objc_msgSend(a3, "baseObject"));
}

- (void)optimizeContentsForCPUAccess:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "optimizeContentsForCPUAccess:slice:level:", objc_msgSend(a3, "baseObject"), a4, a5);
}

- (void)resetCommandsInBuffer:(id)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;

  length = a4.length;
  location = a4.location;
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "resetCommandsInBuffer:withRange:", objc_msgSend(a3, "baseObject"), location, length);
}

- (void)copyIndirectCommandBuffer:(id)a3 sourceRange:(_NSRange)a4 destination:(id)a5 destinationIndex:(unint64_t)a6
{
  NSUInteger length;
  NSUInteger location;

  length = a4.length;
  location = a4.location;
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", a5);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "copyIndirectCommandBuffer:sourceRange:destination:destinationIndex:", objc_msgSend(a3, "baseObject"), location, length, objc_msgSend(a5, "baseObject"), a6);
}

- (void)optimizeIndirectCommandBuffer:(id)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;

  length = a4.length;
  location = a4.location;
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "optimizeIndirectCommandBuffer:withRange:", objc_msgSend(a3, "baseObject"), location, length);
}

- (void)resolveCounters:(id)a3 inRange:(_NSRange)a4 destinationBuffer:(id)a5 destinationOffset:(unint64_t)a6
{
  NSUInteger length;
  NSUInteger location;

  length = a4.length;
  location = a4.location;
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", a5);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "resolveCounters:inRange:destinationBuffer:destinationOffset:", objc_msgSend(a3, "baseObject"), location, length, objc_msgSend(a5, "baseObject"), a6);
}

- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5
{
  _BOOL8 v5;

  v5 = a5;
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "sampleCountersInBuffer:atSampleIndex:withBarrier:", objc_msgSend(a3, "baseObject"), a4, v5);
}

- (id)endEncodingAndRetrieveProgramAddressTable
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "endEncodingAndRetrieveProgramAddressTable");
}

@end
