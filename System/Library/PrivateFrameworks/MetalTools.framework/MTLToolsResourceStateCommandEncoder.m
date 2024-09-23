@implementation MTLToolsResourceStateCommandEncoder

- (MTLToolsResourceStateCommandEncoder)initWithBaseObject:(id)a3 parent:(id)a4
{
  return -[MTLToolsResourceStateCommandEncoder initWithResourceStateCommandEncoder:parent:descriptor:](self, "initWithResourceStateCommandEncoder:parent:descriptor:", a3, a4, 0);
}

- (MTLToolsResourceStateCommandEncoder)initWithResourceStateCommandEncoder:(id)a3 parent:(id)a4 descriptor:(id)a5
{
  MTLToolsResourceStateCommandEncoder *v6;
  MTLToolsResourceStateCommandEncoder *v7;
  uint64_t i;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MTLToolsResourceStateCommandEncoder;
  v6 = -[MTLToolsCommandEncoder initWithBaseObject:parent:](&v10, sel_initWithBaseObject_parent_, a3, a4);
  v7 = v6;
  if (a5 && v6)
  {
    for (i = 0; i != 4; ++i)
      -[MTLToolsCommandEncoder addRetainedObject:](v7, "addRetainedObject:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "sampleBufferAttachments"), "objectAtIndexedSubscript:", i), "sampleBuffer"));
  }
  return v7;
}

- (void)updateTextureMappings:(id)a3 mode:(unint64_t)a4 regions:(id *)a5 mipLevels:(const unint64_t *)a6 slices:(const unint64_t *)a7 numRegions:(unint64_t)a8
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "updateTextureMappings:mode:regions:mipLevels:slices:numRegions:", objc_msgSend(a3, "baseObject"), a4, a5, a6, a7, a8);
}

- (void)updateTextureMapping:(id)a3 mode:(unint64_t)a4 region:(id *)a5 mipLevel:(unint64_t)a6 slice:(unint64_t)a7
{
  id v13;
  uint64_t v14;
  __int128 v15;
  _OWORD v16[3];

  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  v13 = -[MTLToolsObject baseObject](self, "baseObject");
  v14 = objc_msgSend(a3, "baseObject");
  v15 = *(_OWORD *)&a5->var0.var2;
  v16[0] = *(_OWORD *)&a5->var0.var0;
  v16[1] = v15;
  v16[2] = *(_OWORD *)&a5->var1.var1;
  objc_msgSend(v13, "updateTextureMapping:mode:region:mipLevel:slice:", v14, a4, v16, a6, a7);
}

- (void)updateTextureMapping:(id)a3 mode:(unint64_t)a4 indirectBuffer:(id)a5 indirectBufferOffset:(unint64_t)a6
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "updateTextureMapping:mode:indirectBuffer:indirectBufferOffset:", objc_msgSend(a3, "baseObject"), a4, objc_msgSend(a5, "baseObject"), a6);
}

- (void)moveTextureMappingsFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11
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
  objc_msgSend(v18, "moveTextureMappingsFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", v19, a4, a5, &v23, &v22, v20, a9, a10, &v21);
}

- (void)copyMappingStateFromTexture:(id)a3 mipLevel:(unint64_t)a4 slice:(unint64_t)a5 toBuffer:(id)a6 offset:(unint64_t)a7 numTiles:(unint64_t)a8
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", a6);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "copyMappingStateFromTexture:mipLevel:slice:toBuffer:offset:numTiles:", objc_msgSend(a3, "baseObject"), a4, a5, objc_msgSend(a6, "baseObject"), a7, a8);
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

- (id)endEncodingAndRetrieveProgramAddressTable
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "endEncodingAndRetrieveProgramAddressTable");
}

@end
