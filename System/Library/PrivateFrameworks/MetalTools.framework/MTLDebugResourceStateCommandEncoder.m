@implementation MTLDebugResourceStateCommandEncoder

- (void)_setDefaults
{
  deque<id, std::allocator<id>> *p_updatedFences;
  void **var0;
  __end_cap_ ***var1;
  unint64_t v5;
  __end_cap_ ***v6;
  uint64_t v7;

  *(&self->hasEndedEncoding + 2) = 0;
  *(&self->hasEndedEncoding + 3) = 0;
  *(&self->hasEndedEncoding + 4) = 0;
  p_updatedFences = &self->updatedFences;
  var0 = (void **)self->updatedFences.__map_.var0;
  var1 = self->updatedFences.__map_.var1;
  self->updatedFences.__size_.__value_ = 0;
  v5 = (char *)var1 - (char *)var0;
  if (v5 >= 0x11)
  {
    do
    {
      operator delete(*var0);
      v6 = p_updatedFences->__map_.var1;
      var0 = (void **)(p_updatedFences->__map_.var0 + 1);
      p_updatedFences->__map_.var0 = (__end_ ***)var0;
      v5 = (char *)v6 - (char *)var0;
    }
    while (v5 > 0x10);
  }
  if (v5 >> 3 == 1)
  {
    v7 = 256;
  }
  else
  {
    if (v5 >> 3 != 2)
      return;
    v7 = 512;
  }
  p_updatedFences->__start_ = v7;
}

- (MTLDebugResourceStateCommandEncoder)initWithResourceStateCommandEncoder:(id)a3 commandBuffer:(id)a4 descriptor:(id)a5
{
  MTLDebugResourceStateCommandEncoder *v7;
  MTLDebugResourceStateCommandEncoder *v8;
  uint64_t i;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MTLDebugResourceStateCommandEncoder;
  v7 = -[MTLToolsResourceStateCommandEncoder initWithResourceStateCommandEncoder:parent:descriptor:](&v11, sel_initWithResourceStateCommandEncoder_parent_descriptor_, a3);
  v8 = v7;
  if (v7)
  {
    -[MTLDebugResourceStateCommandEncoder _setDefaults](v7, "_setDefaults");
    if (a5)
    {
      for (i = 0; i != 4; ++i)
        objc_msgSend(a4, "addObject:retained:purgeable:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "sampleBufferAttachments"), "objectAtIndexedSubscript:", i), "sampleBuffer"), 1, 0);
    }
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
  if (*(&self->hasEndedEncoding + 2))
  {
    v9.receiver = self;
    v9.super_class = (Class)MTLDebugResourceStateCommandEncoder;
    -[MTLToolsObject dealloc](&v9, sel_dealloc);
  }
  else
  {
    objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "endEncoding");
    v9.receiver = self;
    v9.super_class = (Class)MTLDebugResourceStateCommandEncoder;
    -[MTLToolsObject dealloc](&v9, sel_dealloc);
    MTLReportFailure();
  }
}

- (BOOL)checkEncoderState
{
  return !*(&self->hasEndedEncoding + 4);
}

- (void)validateSparseTextureMappingMode:(unint64_t)a3
{
  if (a3 >= 2)
    MTLReportFailure();
}

- (void)validateTextureAccess:(id)a3 region:(id *)a4 mipLevel:(unint64_t)a5 slice:(unint64_t)a6
{
  unint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t device;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v9 = (unint64_t)a3;
  v11 = objc_msgSend(a3, "arrayLength");
  v12 = objc_msgSend((id)v9, "textureType");
  v13 = 6;
  if ((unint64_t)(v12 - 5) >= 2)
    v13 = 1;
  if (v13 * v11 <= a6)
  {
    v24 = a6;
    v26 = objc_msgSend((id)v9, "arrayLength");
    MTLReportFailure();
  }
  v14 = objc_msgSend((id)v9, "mipmapLevelCount", v24, v26) - 1;
  if (v14 >= objc_msgSend((id)v9, "firstMipmapInTail"))
    v15 = objc_msgSend((id)v9, "firstMipmapInTail");
  else
    v15 = objc_msgSend((id)v9, "mipmapLevelCount") - 1;
  if (v15 < a5)
  {
    v22 = objc_msgSend((id)v9, "mipmapLevelCount") - 1;
    if (v22 >= objc_msgSend((id)v9, "firstMipmapInTail"))
      v23 = objc_msgSend((id)v9, "firstMipmapInTail");
    else
      v23 = objc_msgSend((id)v9, "mipmapLevelCount") - 1;
    v25 = a5;
    v27 = v23;
    MTLReportFailure();
  }
  device = (unint64_t)self->super.super.super._device;
  objc_msgSend((id)v9, "pixelFormat", v25, v27);
  objc_msgSend((id)v9, "width");
  objc_msgSend((id)v9, "height");
  objc_msgSend((id)v9, "depth");
  objc_msgSend((id)v9, "sampleCount");
  MTLGetTextureLevelInfoForDeviceWithOptions();
  if (!v9)
  {
    MTLReleaseAssertionFailure();
LABEL_21:
    MTLReportFailure();
    goto LABEL_13;
  }
  v17 = (void *)objc_msgSend((id)v9, "device");
  v18 = objc_msgSend((id)v9, "textureType");
  v19 = objc_msgSend((id)v9, "pixelFormat");
  v20 = objc_msgSend((id)v9, "sampleCount");
  if (v17)
    objc_msgSend(v17, "sparseTileSizeWithTextureType:pixelFormat:sampleCount:", v18, v19, v20);
  v9 = 0;
  device = -1;
  a5 = 0xFFFFFFFFFFFFFFFFLL / 0;
  if (a4->var1.var0 + a4->var0.var0 > 0xFFFFFFFFFFFFFFFFLL / 0)
    goto LABEL_21;
LABEL_13:
  v21 = device / v9;
  if (a4->var1.var1 + a4->var0.var1 > a5)
    MTLReportFailure();
  if (a4->var1.var2 + a4->var0.var2 > v21)
    MTLReportFailure();
}

- (void)updateTextureMappings:(id)a3 mode:(unint64_t)a4 regions:(id *)a5 mipLevels:(const unint64_t *)a6 slices:(const unint64_t *)a7 numRegions:(unint64_t)a8
{
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  const $1A7EE345FBD7959593737C54B12A4BDF *v18;
  __int128 v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  _OWORD v23[3];

  if (!-[MTLDebugResourceStateCommandEncoder checkEncoderState](self, "checkEncoderState"))
    MTLReportFailure();
  if ((objc_msgSend(a3, "isSparse") & 1) != 0)
  {
    if (!a8)
      goto LABEL_11;
  }
  else
  {
    MTLReportFailure();
    if (!a8)
      goto LABEL_11;
  }
  v15 = 0;
  v16 = 0;
  do
  {
    v17 = a6[v15];
    if (v17 > objc_msgSend(a3, "firstMipmapInTail"))
    {
      v21 = a6[v15];
      v22 = objc_msgSend(a3, "firstMipmapInTail");
      v20 = v16;
      MTLReportFailure();
    }
    v18 = &a5[v15];
    v19 = *(_OWORD *)&v18->var0.var2;
    v23[0] = *(_OWORD *)&v18->var0.var0;
    v23[1] = v19;
    v23[2] = *(_OWORD *)&v18->var1.var1;
    -[MTLDebugResourceStateCommandEncoder validateTextureAccess:region:mipLevel:slice:](self, "validateTextureAccess:region:mipLevel:slice:", a3, v23, a6[v15], a7[v15], v20, v21, v22);
    -[MTLDebugResourceStateCommandEncoder validateSparseTextureMappingMode:](self, "validateSparseTextureMappingMode:", a4);
    v15 = (v16 + 1);
    v16 = v15;
  }
  while (v15 < a8);
LABEL_11:
  -[MTLToolsRetainingContainer addObject:retained:purgeable:](-[MTLToolsCommandEncoder commandBuffer](self, "commandBuffer"), "addObject:retained:purgeable:", a3, 1, 1);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "updateTextureMappings:mode:regions:mipLevels:slices:numRegions:", objc_msgSend(a3, "baseObject"), a4, a5, a6, a7, a8);
  *(&self->hasEndedEncoding + 3) = 1;
}

- (void)updateTextureMapping:(id)a3 mode:(unint64_t)a4 region:(id *)a5 mipLevel:(unint64_t)a6 slice:(unint64_t)a7
{
  __int128 v13;
  id v14;
  uint64_t v15;
  __int128 v16;
  unint64_t v17;
  uint64_t v18;
  _OWORD v19[3];
  _OWORD v20[3];

  if (!-[MTLDebugResourceStateCommandEncoder checkEncoderState](self, "checkEncoderState"))
    MTLReportFailure();
  if ((objc_msgSend(a3, "isSparse") & 1) == 0)
    MTLReportFailure();
  if (objc_msgSend(a3, "firstMipmapInTail") < a6)
  {
    v17 = a6;
    v18 = objc_msgSend(a3, "firstMipmapInTail");
    MTLReportFailure();
  }
  v13 = *(_OWORD *)&a5->var0.var2;
  v20[0] = *(_OWORD *)&a5->var0.var0;
  v20[1] = v13;
  v20[2] = *(_OWORD *)&a5->var1.var1;
  -[MTLDebugResourceStateCommandEncoder validateTextureAccess:region:mipLevel:slice:](self, "validateTextureAccess:region:mipLevel:slice:", a3, v20, a6, a7, v17, v18);
  -[MTLDebugResourceStateCommandEncoder validateSparseTextureMappingMode:](self, "validateSparseTextureMappingMode:", a4);
  -[MTLToolsRetainingContainer addObject:retained:purgeable:](-[MTLToolsCommandEncoder commandBuffer](self, "commandBuffer"), "addObject:retained:purgeable:", a3, 1, 1);
  v14 = -[MTLToolsObject baseObject](self, "baseObject");
  v15 = objc_msgSend(a3, "baseObject");
  v16 = *(_OWORD *)&a5->var0.var2;
  v19[0] = *(_OWORD *)&a5->var0.var0;
  v19[1] = v16;
  v19[2] = *(_OWORD *)&a5->var1.var1;
  objc_msgSend(v14, "updateTextureMapping:mode:region:mipLevel:slice:", v15, a4, v19, a6, a7);
  *(&self->hasEndedEncoding + 3) = 1;
}

- (void)updateTextureMapping:(id)a3 mode:(unint64_t)a4 indirectBuffer:(id)a5 indirectBufferOffset:(unint64_t)a6
{
  if (!-[MTLDebugResourceStateCommandEncoder checkEncoderState](self, "checkEncoderState"))
    MTLReportFailure();
  if ((objc_msgSend(a3, "isSparse") & 1) == 0)
    MTLReportFailure();
  -[MTLToolsRetainingContainer addObject:retained:purgeable:](-[MTLToolsCommandEncoder commandBuffer](self, "commandBuffer"), "addObject:retained:purgeable:", a3, 1, 1);
  -[MTLToolsRetainingContainer addObject:retained:purgeable:](-[MTLToolsCommandEncoder commandBuffer](self, "commandBuffer"), "addObject:retained:purgeable:", a5, 1, 1);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "updateTextureMapping:mode:indirectBuffer:indirectBufferOffset:", objc_msgSend(a3, "baseObject"), a4, objc_msgSend(a5, "baseObject"), a6);
  *(&self->hasEndedEncoding + 3) = 1;
}

- (void)moveTextureMappingsFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11
{
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t var2;
  unint64_t v22;
  unint64_t v23;
  __int128 v24;
  unint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v45;
  __int128 v46;
  unint64_t v47;
  __int128 v48;
  unint64_t v49;
  _OWORD v50[4];
  _BYTE v51[32];
  _OWORD v52[3];
  __int128 v53;
  _BYTE v54[32];
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;

  v58 = 0;
  v56 = 0u;
  v57 = 0u;
  v55 = 0u;
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if (!-[MTLDebugResourceStateCommandEncoder checkEncoderState](self, "checkEncoderState"))
    _MTLMessageContextPush_();
  if ((objc_msgSend(a3, "isSparse") & 1) == 0)
    _MTLMessageContextPush_();
  if ((objc_msgSend(a8, "isSparse") & 1) == 0)
    _MTLMessageContextPush_();
  v16 = objc_msgSend(a8, "pixelFormat");
  if (v16 != objc_msgSend(a3, "pixelFormat"))
    _MTLMessageContextPush_();
  v17 = objc_msgSend(a3, "heap");
  if (v17 != objc_msgSend(a8, "heap"))
    _MTLMessageContextPush_();
  v18 = objc_msgSend(a3, "sampleCount");
  if (v18 != objc_msgSend(a8, "sampleCount"))
  {
    v31 = objc_msgSend(a3, "sampleCount");
    v37 = objc_msgSend(a8, "sampleCount");
    _MTLMessageContextPush_();
  }
  if (objc_msgSend(a3, "mipmapLevelCount", v31, v37) <= a5)
  {
    v32 = a5;
    v38 = objc_msgSend(a3, "mipmapLevelCount");
    _MTLMessageContextPush_();
  }
  v19 = objc_msgSend(a3, "numFaces", v32, v38);
  if (objc_msgSend(a3, "arrayLength") * v19 <= a4)
  {
    v29 = objc_msgSend(a3, "numFaces");
    v33 = a4;
    v39 = objc_msgSend(a3, "arrayLength") * v29;
    _MTLMessageContextPush_();
  }
  if (objc_msgSend(a8, "mipmapLevelCount", v33, v39) <= a10)
  {
    v34 = a10;
    v40 = objc_msgSend(a8, "mipmapLevelCount");
    _MTLMessageContextPush_();
  }
  v20 = objc_msgSend(a8, "numFaces", v34, v40);
  if (objc_msgSend(a8, "arrayLength") * v20 <= a9)
  {
    v30 = objc_msgSend(a8, "numFaces");
    v35 = a9;
    v41 = objc_msgSend(a8, "arrayLength") * v30;
    _MTLMessageContextPush_();
  }
  if (objc_msgSend(a8, "firstMipmapInTail", v35, v41) < a10)
  {
    v36 = a10;
    v42 = objc_msgSend(a8, "firstMipmapInTail");
    _MTLMessageContextPush_();
  }
  if (objc_msgSend(a3, "firstMipmapInTail", v36, v42) < a5)
  {
    objc_msgSend(a3, "firstMipmapInTail");
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  var2 = a6->var2;
  v53 = *(_OWORD *)&a6->var0;
  *(_OWORD *)&v54[8] = *(_OWORD *)&a7->var0;
  v22 = a7->var2;
  *(_QWORD *)v54 = var2;
  *(_QWORD *)&v54[24] = v22;
  v52[0] = v53;
  v52[1] = *(_OWORD *)v54;
  v52[2] = *(_OWORD *)&v54[16];
  -[MTLDebugResourceStateCommandEncoder validateTextureAccess:region:mipLevel:slice:](self, "validateTextureAccess:region:mipLevel:slice:", a3, v52, a5, a4);
  v23 = a11->var2;
  v24 = *(_OWORD *)&a11->var0;
  *(_OWORD *)&v51[8] = *(_OWORD *)&a7->var0;
  v25 = a7->var2;
  *(_QWORD *)v51 = v23;
  *(_QWORD *)&v51[24] = v25;
  v50[0] = v24;
  v50[1] = *(_OWORD *)v51;
  v50[2] = *(_OWORD *)&v51[16];
  v50[3] = v24;
  -[MTLDebugResourceStateCommandEncoder validateTextureAccess:region:mipLevel:slice:](self, "validateTextureAccess:region:mipLevel:slice:", a8, v50, a10, a9);
  -[MTLToolsRetainingContainer addObject:retained:purgeable:](-[MTLToolsCommandEncoder commandBuffer](self, "commandBuffer"), "addObject:retained:purgeable:", a3, 1, 1);
  -[MTLToolsRetainingContainer addObject:retained:purgeable:](-[MTLToolsCommandEncoder commandBuffer](self, "commandBuffer"), "addObject:retained:purgeable:", a8, 1, 1);
  v26 = -[MTLToolsObject baseObject](self, "baseObject");
  v27 = objc_msgSend(a3, "baseObject");
  v48 = *(_OWORD *)&a6->var0;
  v49 = a6->var2;
  v46 = *(_OWORD *)&a7->var0;
  v47 = a7->var2;
  v28 = objc_msgSend(a8, "baseObject");
  v45 = *a11;
  objc_msgSend(v26, "moveTextureMappingsFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", v27, a4, a5, &v48, &v46, v28, a9, a10, &v45);
  *(&self->hasEndedEncoding + 3) = 1;
}

- (void)updateFence:(id)a3
{
  id v5;

  v5 = a3;
  std::deque<objc_object *>::push_back(&self->updatedFences.__map_.__first_, &v5);
  *(&self->hasEndedEncoding + 3) = 1;
  -[MTLToolsRetainingContainer addObject:retained:purgeable:](-[MTLToolsCommandEncoder commandBuffer](self, "commandBuffer"), "addObject:retained:purgeable:", a3, 1, 0);
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
  *(&self->hasEndedEncoding + 3) = 1;
  -[MTLToolsRetainingContainer addObject:retained:purgeable:](-[MTLToolsCommandEncoder commandBuffer](self, "commandBuffer"), "addObject:retained:purgeable:", a3, 1, 0);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "waitForFence:", objc_msgSend(a3, "baseObject"));
}

- (void)endEncoding
{
  objc_super v3;

  if (*(&self->hasEndedEncoding + 4))
    MTLReportFailure();
  if (!*(&self->hasEndedEncoding + 3))
    MTLReportFailure();
  v3.receiver = self;
  v3.super_class = (Class)MTLDebugResourceStateCommandEncoder;
  -[MTLToolsCommandEncoder endEncoding](&v3, sel_endEncoding);
  *(&self->hasEndedEncoding + 4) = 1;
  *(&self->hasEndedEncoding + 2) = 1;
  *(&self->hasEndedEncoding + 3) = 0;
}

- (void).cxx_destruct
{
  std::deque<objc_object *>::~deque[abi:ne180100](&self->updatedFences.__map_.__first_);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  return self;
}

@end
