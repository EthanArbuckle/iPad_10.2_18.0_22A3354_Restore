@implementation MTLDebugBlitCommandEncoder

- (void)_setDefaults
{
  deque<id, std::allocator<id>> *p_updatedFences;
  void **var0;
  __end_cap_ ***var1;
  unint64_t v5;
  __end_cap_ ***v6;
  uint64_t v7;

  *(&self->hasEndEncoding + 2) = 0;
  *(&self->hasEndEncoding + 3) = 0;
  *(&self->hasEndEncoding + 4) = 0;
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

- (MTLDebugBlitCommandEncoder)initWithBlitCommandEncoder:(id)a3 commandBuffer:(id)a4 descriptor:(id)a5
{
  MTLDebugBlitCommandEncoder *v7;
  MTLDebugBlitCommandEncoder *v8;
  uint64_t i;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MTLDebugBlitCommandEncoder;
  v7 = -[MTLToolsBlitCommandEncoder initWithBlitCommandEncoder:parent:descriptor:](&v11, sel_initWithBlitCommandEncoder_parent_descriptor_, a3);
  v8 = v7;
  if (v7)
  {
    v7->_commandBuffer = (MTLDebugCommandBuffer *)a4;
    -[MTLDebugBlitCommandEncoder _setDefaults](v7, "_setDefaults");
    if (a5)
    {
      for (i = 0; i != 4; ++i)
        -[MTLDebugCommandBuffer addObject:retained:purgeable:](v8->_commandBuffer, "addObject:retained:purgeable:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "sampleBufferAttachments"), "objectAtIndexedSubscript:", i), "sampleBuffer"), 1, 0);
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
  if (*(&self->hasEndEncoding + 2))
  {
    v9.receiver = self;
    v9.super_class = (Class)MTLDebugBlitCommandEncoder;
    -[MTLToolsObject dealloc](&v9, sel_dealloc);
  }
  else
  {
    objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "endEncoding");
    v9.receiver = self;
    v9.super_class = (Class)MTLDebugBlitCommandEncoder;
    -[MTLToolsObject dealloc](&v9, sel_dealloc);
    MTLReportFailure();
  }
}

- (void)internalValidateCopyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11 options:(unint64_t)a12
{
  unint64_t device;
  unint64_t v19;
  MTLToolsDevice *v20;
  unint64_t *v21;
  uint64_t v22;
  int v23;
  unint64_t *v24;
  unint64_t *v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  unint64_t *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t var0;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t var1;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t var2;
  uint64_t v50;
  MTLDebugBlitCommandEncoder *v51;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A *v52;
  char *v53;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A *v54;
  char *v55;
  _MTLMessageContext v57;

  memset(&v57, 0, sizeof(v57));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  v19 = a12 & 0xFFFFFFFF9FFFFFFFLL;
  if ((~(_BYTE)a12 & 3) == 0)
    _MTLMessageContextPush_();
  validateMTLBlitOption(a12 & 0xFFFFFFFF9FFFFFFFLL, &v57);
  if (*(&self->hasEndEncoding + 4))
    _MTLMessageContextPush_();
  if (a3)
  {
    if ((objc_msgSend(a3, "conformsToProtocol:", &unk_255C6E6C0) & 1) == 0)
      _MTLMessageContextPush_();
    if (!objc_msgSend(a3, "conformsToProtocol:", &unk_255C6E6C0))
      goto LABEL_12;
    device = (unint64_t)self->super.super.super._device;
    if (device != objc_msgSend(a3, "device"))
      _MTLMessageContextPush_();
    if (objc_msgSend(a3, "storageMode") != 3)
    {
LABEL_12:
      if (a8)
        goto LABEL_13;
LABEL_167:
      _MTLMessageContextPush_();
      goto LABEL_19;
    }
  }
  _MTLMessageContextPush_();
  if (!a8)
    goto LABEL_167;
LABEL_13:
  if ((objc_msgSend(a8, "conformsToProtocol:", &unk_255C6E6C0) & 1) == 0)
    _MTLMessageContextPush_();
  if (objc_msgSend(a8, "conformsToProtocol:", &unk_255C6E6C0))
  {
    v20 = self->super.super.super._device;
    if (v20 != (MTLToolsDevice *)objc_msgSend(a8, "device"))
      _MTLMessageContextPush_();
    if (objc_msgSend(a8, "storageMode") == 3)
      goto LABEL_167;
  }
LABEL_19:
  if (!(a7->var1 * a7->var0 * a7->var2))
  {
    var2 = a7->var2;
    v50 = 0;
    var0 = a7->var0;
    var1 = a7->var1;
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  if (a3 && a8)
  {
    v52 = a6;
    a6 = ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)a7->var0;
    device = a7->var1;
    v19 = a7->var2;
    memset(&v57, 0, sizeof(v57));
    -[MTLToolsObject device](self, "device");
    _MTLMessageContextBegin_();
    v51 = self;
    validateBlitProtectionOptions(-[MTLToolsRetainingContainer protectionOptions](-[MTLToolsCommandEncoder commandBuffer](self, "commandBuffer"), "protectionOptions"), a3, a8, (uint64_t)CFSTR("texture"));
    v21 = (unint64_t *)((char *)a3 + 72);
    v55 = (char *)a8 + 72;
    v22 = objc_msgSend(a3, "pixelFormat");
    v53 = (char *)a3 + 72;
    if (v22 == objc_msgSend(a8, "pixelFormat"))
      goto LABEL_72;
    v23 = *((_DWORD *)a3 + 20);
    if ((v23 & 0x20) != 0 && (*((_BYTE *)a8 + 80) & 0x20) != 0
      || (v23 & 0x40) != 0 && (*((_BYTE *)a8 + 80) & 0x40) != 0)
    {
      if (*((_QWORD *)a3 + 11) == *((_QWORD *)a8 + 11))
        goto LABEL_72;
      var0 = *v21;
      var1 = *(_QWORD *)v55;
      goto LABEL_71;
    }
    v24 = (unint64_t *)((char *)a3 + 72);
    if ((v23 & 0x20) == 0)
    {
      if ((*((_BYTE *)a8 + 80) & 0x20) != 0)
        v24 = (unint64_t *)((char *)a8 + 72);
      else
        v24 = 0;
    }
    v25 = (unint64_t *)((char *)a3 + 72);
    if ((v23 & 0x40) == 0)
    {
      if ((*((_BYTE *)a8 + 80) & 0x40) != 0)
        v25 = (unint64_t *)((char *)a8 + 72);
      else
        v25 = 0;
    }
    if (v24)
    {
      if (!v25 || v24 == v25)
      {
        v26 = v21 == v24 ? (char *)a8 + 72 : (char *)a3 + 72;
        if ((v26[9] & 4) == 0)
        {
          v27 = v24[3];
          if (v27 != 2)
            v27 = 4;
          if (v27 == *((_QWORD *)v26 + 3))
          {
LABEL_72:
            v34 = objc_msgSend(a3, "sampleCount", var0, var1, var2, v50);
            if (v34 == objc_msgSend(a8, "sampleCount"))
              goto LABEL_73;
            goto LABEL_165;
          }
        }
      }
      goto LABEL_70;
    }
    if (v25)
    {
      if (v21 == v25)
        v28 = (char *)a8 + 72;
      else
        v28 = (char *)a3 + 72;
      if ((v28[9] & 4) == 0 && *((_QWORD *)v28 + 3) == 1)
        goto LABEL_72;
      goto LABEL_70;
    }
    v29 = *((_QWORD *)a3 + 11);
    v30 = *((_QWORD *)a8 + 11);
    v31 = *((_DWORD *)a8 + 20);
    if ((v23 & 0x400) != 0)
    {
      v32 = (unint64_t *)((char *)a3 + 72);
      if ((v31 & 0x400) != 0)
        goto LABEL_69;
    }
    else if ((v31 & 0x400) != 0)
    {
      v32 = (unint64_t *)((char *)a8 + 72);
    }
    else
    {
      v32 = 0;
    }
    if (v29 != v30 && v32)
    {
      if (v21 == v32)
        v33 = (char *)a8 + 72;
      else
        v33 = (char *)a3 + 72;
      if (*((_QWORD *)v33 + 3) == v32[3])
      {
        if (v21 == v32)
        {
          a6 = ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)((unint64_t)a6 / *((_QWORD *)a3 + 13));
          device /= *((_QWORD *)a3 + 14);
          v19 /= *((_QWORD *)a3 + 15);
        }
        else
        {
          a6 = ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)(v32[4] * (_QWORD)a6);
          device *= v32[5];
          v19 *= v32[6];
        }
        goto LABEL_72;
      }
      goto LABEL_70;
    }
LABEL_69:
    if (v29 == v30)
      goto LABEL_72;
LABEL_70:
    var0 = *v21;
    var1 = *(_QWORD *)v55;
LABEL_71:
    _MTLMessageContextPush_();
    goto LABEL_72;
  }
  MTLReleaseAssertionFailure();
LABEL_165:
  var0 = objc_msgSend(a3, "sampleCount", var0);
  v45 = objc_msgSend(a8, "sampleCount");
  _MTLMessageContextPush_();
LABEL_73:
  if (objc_msgSend(a3, "isFramebufferOnly", var0, v45))
    _MTLMessageContextPush_();
  if (objc_msgSend(a8, "isFramebufferOnly"))
    _MTLMessageContextPush_();
  v54 = a6;
  if (objc_msgSend(a3, "mipmapLevelCount") <= a5)
  {
    v41 = a5;
    v46 = objc_msgSend(a3, "mipmapLevelCount");
    _MTLMessageContextPush_();
  }
  v35 = objc_msgSend(a3, "numFaces", v41, v46);
  if (objc_msgSend(a3, "arrayLength") * v35 <= a4)
  {
    v39 = objc_msgSend(a3, "numFaces");
    v42 = a4;
    v47 = objc_msgSend(a3, "arrayLength") * v39;
    _MTLMessageContextPush_();
  }
  if (objc_msgSend(a8, "mipmapLevelCount", v42, v47) <= a10)
  {
    v43 = a10;
    v48 = objc_msgSend(a8, "mipmapLevelCount");
    _MTLMessageContextPush_();
  }
  v36 = objc_msgSend(a8, "numFaces", v43, v48);
  if (objc_msgSend(a8, "arrayLength") * v36 <= a9)
  {
    objc_msgSend(a8, "numFaces");
    objc_msgSend(a8, "arrayLength");
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  objc_msgSend(a3, "pixelFormat");
  objc_msgSend(a3, "width");
  objc_msgSend(a3, "height");
  objc_msgSend(a3, "depth");
  objc_msgSend(a3, "sampleCount");
  MTLGetTextureLevelInfoForDeviceWithOptions();
  objc_msgSend(a8, "pixelFormat");
  objc_msgSend(a8, "width");
  objc_msgSend(a8, "height");
  objc_msgSend(a8, "depth");
  objc_msgSend(a8, "sampleCount");
  MTLGetTextureLevelInfoForDeviceWithOptions();
  _MTLAdjustMTLSize();
  _MTLAdjustMTLSize();
  memset(&v57, 0, sizeof(v57));
  -[MTLToolsObject device](v51, "device");
  _MTLMessageContextBegin_();
  v37 = v52->var0;
  if ((v53[9] & 4) != 0)
  {
    if (v37)
      _MTLMessageContextPush_();
    if (v52->var1)
      _MTLMessageContextPush_();
    if (v52->var2)
      goto LABEL_168;
  }
  else
  {
    if (a7->var0 + v37)
      _MTLMessageContextPush_();
    if (a7->var1 + v52->var1)
      _MTLMessageContextPush_();
    if (a7->var2 + v52->var2)
LABEL_168:
      _MTLMessageContextPush_();
  }
  v38 = a11->var0;
  if ((v55[9] & 4) != 0)
  {
    if (v38)
      _MTLMessageContextPush_();
    if (a11->var1)
      _MTLMessageContextPush_();
    if (a11->var2)
      goto LABEL_169;
  }
  else
  {
    if (($F99D9A4FB75BC57F3386B8DC8EE08D7A *)((char *)v54 + v38))
      _MTLMessageContextPush_();
    if (a11->var1 + device)
      _MTLMessageContextPush_();
    if (a11->var2 + v19)
LABEL_169:
      _MTLMessageContextPush_();
  }
  if ((v53[9] & 4) != 0)
  {
    if (v52->var0 % *((_QWORD *)v53 + 4))
      _MTLMessageContextPush_();
    if (v52->var1 % *((_QWORD *)v53 + 5))
      _MTLMessageContextPush_();
    if (v52->var2 % *((_QWORD *)v53 + 6))
      _MTLMessageContextPush_();
    if (0uLL % *((_QWORD *)v53 + 4))
      _MTLMessageContextPush_();
    if (0uLL % *((_QWORD *)v53 + 5))
      _MTLMessageContextPush_();
    if (0uLL % *((_QWORD *)v53 + 6))
      _MTLMessageContextPush_();
  }
  if ((v55[9] & 4) != 0)
  {
    if (a11->var0 % *((_QWORD *)v55 + 4))
      _MTLMessageContextPush_();
    if (a11->var1 % *((_QWORD *)v55 + 5))
      _MTLMessageContextPush_();
    if (a11->var2 % *((_QWORD *)v55 + 6))
      _MTLMessageContextPush_();
    if (0uLL % *((_QWORD *)v55 + 4))
      _MTLMessageContextPush_();
    if (0uLL % *((_QWORD *)v55 + 5))
      _MTLMessageContextPush_();
    if (0uLL % *((_QWORD *)v55 + 6))
      _MTLMessageContextPush_();
  }
  if ((v53[9] & 0x20) != 0 || (v55[9] & 0x20) != 0)
  {
    if (v52->var0)
      _MTLMessageContextPush_();
    if (v52->var1)
      _MTLMessageContextPush_();
    if (v52->var2)
      _MTLMessageContextPush_();
    if (a7->var0)
      _MTLMessageContextPush_();
    if (a7->var1)
      _MTLMessageContextPush_();
    if (a7->var2)
      _MTLMessageContextPush_();
    if (a11->var0)
      _MTLMessageContextPush_();
    if (a11->var1)
      _MTLMessageContextPush_();
    if (a11->var2)
      _MTLMessageContextPush_();
    if (v54)
      _MTLMessageContextPush_();
    if (device)
      _MTLMessageContextPush_();
    if (v19)
      _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
}

- (void)validateCopyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11 options:(unint64_t)a12 move:(BOOL)a13
{
  _QWORD v15[3];
  _QWORD v16[3];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v17;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v18;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v19;

  v19 = *a6;
  v18 = *a7;
  v17 = *a11;
  -[MTLDebugBlitCommandEncoder internalValidateCopyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:options:](self, "internalValidateCopyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:options:", a3, a4, a5, &v19, &v18, a9, a10, &v17, a12);
  v16[1] = 0;
  v16[2] = 0;
  v15[2] = 0;
  v16[0] = a3;
  v15[0] = a8;
  v15[1] = 0;
  validateResourceAliasing((uint64_t)v16, (uint64_t)v15, a13);
}

- (void)validateCopyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceSize:(id *)a6 toTexture:(id)a7 destinationSlice:(unint64_t)a8 destinationLevel:(unint64_t)a9 options:(unint64_t)a10 sliceCount:(unint64_t)a11 levelCount:(unint64_t)a12
{
  char v14;
  __int128 v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  _QWORD v25[3];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v26;
  _QWORD v27[3];

  v14 = a5;
  memset(v27, 0, sizeof(v27));
  v26 = *a6;
  memset(v25, 0, sizeof(v25));
  -[MTLDebugBlitCommandEncoder internalValidateCopyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:options:](self, "internalValidateCopyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:options:", a3, a4, a5, v27, &v26, a7, a8, a9, v25, a10);
  *(_QWORD *)&v23 = ResourceIdentity::UnwindTexture(a3, (MTLTextureType)a4, a11, v14, a12, &v24, (int *)&v24 + 1);
  DWORD2(v23) = objc_msgSend(a3, "usage");
  HIDWORD(v23) = objc_msgSend(a3, "bufferBytesPerRow");
  *(_QWORD *)&v21 = ResourceIdentity::UnwindTexture(a7, (MTLTextureType)a8, a11, a9, a12, &v22, (int *)&v22 + 1);
  DWORD2(v21) = objc_msgSend(a7, "usage");
  HIDWORD(v21) = objc_msgSend(a7, "bufferBytesPerRow");
  v19 = v23;
  v20 = v24;
  v18 = v22;
  v17 = v21;
  validateResourceAliasing((uint64_t)&v19, (uint64_t)&v17, 1);
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11
{
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v22;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v23;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v24;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v25;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v26;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v27;

  v27 = *a6;
  v26 = *a7;
  v25 = *a11;
  LOBYTE(v20) = 0;
  -[MTLDebugBlitCommandEncoder validateCopyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:options:move:](self, "validateCopyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:options:move:", a3, a4, a5, &v27, &v26, a9, a10, &v25, 0, v20);
  *(&self->hasEndEncoding + 3) = 1;
  -[MTLDebugCommandBuffer addObject:retained:purgeable:](self->_commandBuffer, "addObject:retained:purgeable:", a3, 1, 1);
  -[MTLDebugCommandBuffer addObject:retained:purgeable:](self->_commandBuffer, "addObject:retained:purgeable:", a8, 1, 1);
  v17 = -[MTLToolsObject baseObject](self, "baseObject");
  v18 = objc_msgSend(a3, "baseObject");
  v24 = *a6;
  v23 = *a7;
  v19 = objc_msgSend(a8, "baseObject");
  v22 = *a11;
  objc_msgSend(v17, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", v18, a4, a5, &v24, &v23, v19, a9, a10, &v22);
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11 options:(unint64_t)a12
{
  unint64_t v19;
  int v20;
  int v21;
  unint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v32;
  __int128 v33;
  unint64_t v34;
  __int128 v35;
  unint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v41;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v42;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v43;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v44;
  __int128 v45;
  unint64_t v46;
  __int128 v47;
  unint64_t var2;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v49;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v50;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v51;

  v19 = a12 & 0xFFFFFFFF9FFFFFFFLL;
  if ((a12 & 0x20000000) != 0)
  {
    v51 = *a6;
    v50 = *a7;
    v49 = *a11;
    LOBYTE(v29) = 0;
    -[MTLDebugBlitCommandEncoder validateCopyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:options:move:](self, "validateCopyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:options:move:", a3, a4, a5, &v51, &v50, a8, a9, a10, &v49, a12, v29);
    *(&self->hasEndEncoding + 3) = 1;
    v23 = -[MTLToolsObject baseObject](self, "baseObject");
    v24 = objc_msgSend(a3, "baseObject");
    v47 = *(_OWORD *)&a6->var0;
    var2 = a6->var2;
    v45 = *(_OWORD *)&a7->var0;
    v46 = a7->var2;
    v25 = objc_msgSend(a8, "baseObject");
    v44 = *a11;
    objc_msgSend(v23, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:options:", v24, a4, a5, &v47, &v45, v25, a9, a10, &v44, v19);
    return;
  }
  v43 = *a6;
  v42 = *a7;
  v41 = *a11;
  LOBYTE(v29) = 0;
  -[MTLDebugBlitCommandEncoder validateCopyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:options:move:](self, "validateCopyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:options:move:", a3, a4, a5, &v43, &v42, a8, a9, a10, &v41, a12, v29);
  v40 = 0;
  v38 = 0u;
  v39 = 0u;
  v37 = 0u;
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  v20 = *((_DWORD *)a3 + 20);
  if ((~v20 & 0x60) == 0 && (~*((_DWORD *)a8 + 20) & 0x60) == 0)
  {
    -[__CFString cStringUsingEncoding:]((id)MTLBlitOptionString(v19), "cStringUsingEncoding:", 4);
    _MTLMessageContextPush_();
    v20 = *((_DWORD *)a3 + 20);
  }
  if ((a12 & 1) != 0 && (v20 & 0x20) == 0)
  {
    -[__CFString cStringUsingEncoding:]((id)MTLBlitOptionString(v19), "cStringUsingEncoding:", 4);
    _MTLMessageContextPush_();
    v20 = *((_DWORD *)a3 + 20);
  }
  if ((a12 & 2) != 0 && (v20 & 0x40) == 0)
  {
    -[__CFString cStringUsingEncoding:]((id)MTLBlitOptionString(v19), "cStringUsingEncoding:", 4);
    _MTLMessageContextPush_();
  }
  v21 = *((_DWORD *)a8 + 20);
  if ((a12 & 1) != 0)
  {
    v22 = a4;
    if ((v21 & 0x20) == 0)
    {
      -[__CFString cStringUsingEncoding:]((id)MTLBlitOptionString(v19), "cStringUsingEncoding:", 4);
      _MTLMessageContextPush_();
      v21 = *((_DWORD *)a8 + 20);
    }
    if ((a12 & 2) == 0)
      goto LABEL_20;
    goto LABEL_18;
  }
  v22 = a4;
  if ((a12 & 2) != 0)
  {
LABEL_18:
    if ((v21 & 0x40) == 0)
    {
      -[__CFString cStringUsingEncoding:]((id)MTLBlitOptionString(v19), "cStringUsingEncoding:", 4);
      _MTLMessageContextPush_();
    }
  }
LABEL_20:
  _MTLMessageContextEnd();
  *(&self->hasEndEncoding + 3) = 1;
  -[MTLDebugCommandBuffer addObject:retained:purgeable:](self->_commandBuffer, "addObject:retained:purgeable:", a3, 1, 1);
  -[MTLDebugCommandBuffer addObject:retained:purgeable:](self->_commandBuffer, "addObject:retained:purgeable:", a8, 1, 1);
  v26 = -[MTLToolsObject baseObject](self, "baseObject");
  v27 = objc_msgSend(a3, "baseObject");
  v35 = *(_OWORD *)&a6->var0;
  v36 = a6->var2;
  v33 = *(_OWORD *)&a7->var0;
  v34 = a7->var2;
  v28 = objc_msgSend(a8, "baseObject");
  v32 = *a11;
  objc_msgSend(v26, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:options:", v27, v22, a5, &v35, &v33, v28, a9, a10, &v32, v19);
}

- (void)validateCopyFromBuffer:(id)a3 sourceOffset:(unint64_t)a4 sourceBytesPerRow:(unint64_t)a5 sourceBytesPerImage:(unint64_t)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11 options:(unint64_t)a12
{
  MTLToolsDevice *device;
  MTLToolsDevice *v18;
  uint64_t v19;
  char *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t var0;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t var1;
  uint64_t v31;
  uint64_t v32;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A *v33;
  unint64_t var2;
  uint64_t v35;
  uint64_t v36;
  _QWORD v39[3];
  _QWORD v40[3];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;
  __int128 v59;
  unint64_t v60;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint64_t v71;
  _MTLMessageContext v72;

  memset(&v72, 0, sizeof(v72));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if ((~(_BYTE)a12 & 3) == 0)
    _MTLMessageContextPush_();
  validateMTLBlitOption(a12 & 0xFFFFFFFF9FFFFFFFLL, &v72);
  if (*(&self->hasEndEncoding + 4))
    _MTLMessageContextPush_();
  if (a3)
  {
    if ((objc_msgSend(a3, "conformsToProtocol:", &unk_255C54558) & 1) == 0)
      _MTLMessageContextPush_();
    if (!objc_msgSend(a3, "conformsToProtocol:", &unk_255C54558)
      || (device = self->super.super.super._device, device == (MTLToolsDevice *)objc_msgSend(a3, "device")))
    {
      if (a8)
        goto LABEL_11;
LABEL_67:
      _MTLMessageContextPush_();
      goto LABEL_17;
    }
  }
  _MTLMessageContextPush_();
  if (!a8)
    goto LABEL_67;
LABEL_11:
  if ((objc_msgSend(a8, "conformsToProtocol:", &unk_255C6E6C0) & 1) == 0)
    _MTLMessageContextPush_();
  if (objc_msgSend(a8, "conformsToProtocol:", &unk_255C6E6C0))
  {
    v18 = self->super.super.super._device;
    if (v18 != (MTLToolsDevice *)objc_msgSend(a8, "device"))
      _MTLMessageContextPush_();
    if (objc_msgSend(a8, "storageMode") == 3)
      goto LABEL_67;
  }
LABEL_17:
  if (!(a7->var1 * a7->var0 * a7->var2))
  {
    var2 = a7->var2;
    v36 = 0;
    var0 = a7->var0;
    var1 = a7->var1;
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  memset(&v72, 0, sizeof(v72));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  validateBlitProtectionOptions(-[MTLToolsRetainingContainer protectionOptions](-[MTLToolsCommandEncoder commandBuffer](self, "commandBuffer"), "protectionOptions"), a3, a8, (uint64_t)CFSTR("buffer"));
  if (objc_msgSend(a8, "isFramebufferOnly"))
    _MTLMessageContextPush_();
  if (objc_msgSend(a8, "mipmapLevelCount", var0, var1, var2, v36) <= a10)
  {
    v27 = a10;
    v31 = objc_msgSend(a8, "mipmapLevelCount");
    _MTLMessageContextPush_();
  }
  v19 = objc_msgSend(a8, "numFaces", v27, v31);
  if (objc_msgSend(a8, "arrayLength") * v19 <= a9)
  {
    v25 = objc_msgSend(a8, "numFaces");
    v28 = a9;
    v32 = objc_msgSend(a8, "arrayLength") * v25;
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  v71 = 0;
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  objc_msgSend(a8, "pixelFormat");
  objc_msgSend(a8, "width");
  v20 = (char *)objc_msgSend(a8, "height");
  objc_msgSend(a8, "depth");
  objc_msgSend(a8, "sampleCount");
  MTLGetTextureLevelInfoForDeviceWithOptions();
  memset(&v72, 0, sizeof(v72));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if (a7->var0 + a11->var0)
  {
    v28 = a7->var0 + a11->var0;
    v32 = 0;
    _MTLMessageContextPush_();
  }
  if (a7->var1 + a11->var1 > *((_QWORD *)&v65 + 1))
  {
    v28 = a7->var1 + a11->var1;
    v32 = *((_QWORD *)&v65 + 1);
    _MTLMessageContextPush_();
  }
  if (a7->var2 + a11->var2 > (unint64_t)v66)
  {
    v28 = a7->var2 + a11->var2;
    v32 = v66;
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  if (!a8)
  {
    MTLReleaseAssertionFailure();
    goto LABEL_63;
  }
  v20 = (char *)a8 + 72;
  v62 = 0;
  v63 = 0;
  v64 = 0;
  v61 = *a11;
  v59 = *(_OWORD *)&a7->var0;
  v60 = a7->var2;
  v56 = v69;
  v57 = v70;
  v58 = v71;
  v52 = v65;
  v53 = v66;
  v54 = v67;
  v55 = v68;
  v21 = *(_OWORD *)((char *)a8 + 72);
  v22 = *(_OWORD *)((char *)a8 + 88);
  v23 = *(_OWORD *)((char *)a8 + 104);
  v51 = *((_QWORD *)a8 + 15);
  v49 = v22;
  v50 = v23;
  v48 = v21;
  _MTLAdjustMTLSize();
  memset(&v72, 0, sizeof(v72));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  a7 = ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)*((_QWORD *)&v69 + 1);
  if (!*((_QWORD *)&v69 + 1))
  {
LABEL_63:
    v28 = -[__CFString cStringUsingEncoding:]((id)MTLBlitOptionString(a12 & 0xFFFFFFFF9FFFFFFFLL), "cStringUsingEncoding:", 4);
    v32 = *(_QWORD *)v20;
    goto LABEL_65;
  }
  if (!(a4 % *((_QWORD *)&v69 + 1)))
    goto LABEL_34;
  v28 = a4;
  v32 = *((_QWORD *)&v69 + 1);
LABEL_65:
  _MTLMessageContextPush_();
LABEL_34:
  if ((v20[9] & 4) == 0)
    goto LABEL_51;
  if (a11->var0 % *((_QWORD *)v20 + 4))
  {
    v32 = *(_QWORD *)v20;
    v35 = *((_QWORD *)v20 + 4);
    v28 = a11->var0;
    _MTLMessageContextPush_();
  }
  if (a11->var1 % *((_QWORD *)v20 + 5))
  {
    v32 = *(_QWORD *)v20;
    v35 = *((_QWORD *)v20 + 5);
    v28 = a11->var1;
    _MTLMessageContextPush_();
  }
  if (a11->var2 % *((_QWORD *)v20 + 6))
  {
    v32 = *(_QWORD *)v20;
    v35 = *((_QWORD *)v20 + 6);
    v28 = a11->var2;
    _MTLMessageContextPush_();
  }
  if (v62 % *((_QWORD *)v20 + 4))
  {
    v32 = *(_QWORD *)v20;
    v35 = *((_QWORD *)v20 + 4);
    v28 = v62;
    _MTLMessageContextPush_();
  }
  if (v63 % *((_QWORD *)v20 + 5))
  {
    v32 = *(_QWORD *)v20;
    v35 = *((_QWORD *)v20 + 5);
    v28 = v63;
    _MTLMessageContextPush_();
  }
  if (v64 % *((_QWORD *)v20 + 6))
  {
    v32 = *(_QWORD *)v20;
    v35 = *((_QWORD *)v20 + 6);
    v28 = v64;
    _MTLMessageContextPush_();
  }
  if ((v20[9] & 0x20) != 0)
  {
    if ((a12 & 4) != 0)
      goto LABEL_51;
  }
  else if ((a12 & 4) == 0)
  {
    goto LABEL_51;
  }
  v28 = *(_QWORD *)v20;
  _MTLMessageContextPush_();
LABEL_51:
  _MTLMessageContextEnd();
  memset(&v72, 0, sizeof(v72));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  v47 = 0;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  objc_msgSend(a8, "pixelFormat");
  objc_msgSend(a8, "sampleCount");
  MTLGetTextureLevelInfoForDeviceWithOptions();
  v24 = -(uint64_t)a5 - a6 + a4;
  if (v24 > objc_msgSend(a3, "length", v28, v32, v35))
  {
    v29 = v24 + *((_QWORD *)&v43 + 1) * a6;
    v33 = ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)objc_msgSend(a3, "length");
    _MTLMessageContextPush_();
  }
  if (a5 % (unint64_t)a7)
  {
    v29 = a5;
    v33 = a7;
    _MTLMessageContextPush_();
  }
  if (a6 % (unint64_t)a7)
  {
    v29 = a6;
    v33 = a7;
    _MTLMessageContextPush_();
  }
  if (objc_msgSend(a8, "textureType", v29, v33) != 9 && a5 > 0x7FFFLL * *((_QWORD *)&v69 + 1))
    _MTLMessageContextPush_();
  _MTLMessageContextEnd();
  v40[1] = 0;
  v40[2] = 0;
  v39[2] = 0;
  v40[0] = a3;
  v39[0] = a8;
  v39[1] = 0;
  validateResourceAliasing((uint64_t)v40, (uint64_t)v39, 0);
}

- (void)copyFromBuffer:(id)a3 sourceOffset:(unint64_t)a4 sourceBytesPerRow:(unint64_t)a5 sourceBytesPerImage:(unint64_t)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11
{
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v22;
  __int128 v23;
  unint64_t var2;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v25;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v26;

  v26 = *a7;
  v25 = *a11;
  -[MTLDebugBlitCommandEncoder validateCopyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:options:](self, "validateCopyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:options:", a3, a4, a5, a6, &v26, a9, a10, &v25, 0);
  if ((~*((_DWORD *)a8 + 20) & 0x60) == 0)
  {
    v20 = *((_QWORD *)a8 + 9);
    MTLReportFailure();
  }
  *(&self->hasEndEncoding + 3) = 1;
  -[MTLDebugCommandBuffer addObject:retained:purgeable:](self->_commandBuffer, "addObject:retained:purgeable:", a3, 1, 1, v20);
  -[MTLDebugCommandBuffer addObject:retained:purgeable:](self->_commandBuffer, "addObject:retained:purgeable:", a8, 1, 1);
  v17 = -[MTLToolsObject baseObject](self, "baseObject");
  v18 = objc_msgSend(a3, "baseObject");
  v23 = *(_OWORD *)&a7->var0;
  var2 = a7->var2;
  v19 = objc_msgSend(a8, "baseObject");
  v22 = *a11;
  objc_msgSend(v17, "copyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", v18, a4, a5, a6, &v23, v19, a9, a10, &v22);
}

- (void)copyFromBuffer:(id)a3 sourceOffset:(unint64_t)a4 sourceBytesPerRow:(unint64_t)a5 sourceBytesPerImage:(unint64_t)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11 options:(unint64_t)a12
{
  unint64_t v16;
  int v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v24;
  __int128 v25;
  unint64_t var2;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v31;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v32;

  v16 = a12 & 0xFFFFFFFF9FFFFFFFLL;
  v32 = *a7;
  v31 = *a11;
  -[MTLDebugBlitCommandEncoder validateCopyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:options:](self, "validateCopyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:options:", a3, a4, a5, a6, &v32, a9, a10, &v31, a12);
  v30 = 0;
  v28 = 0u;
  v29 = 0u;
  v27 = 0u;
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  v17 = *((_DWORD *)a8 + 20);
  if ((a12 & 1) != 0 && (v17 & 0x20) == 0)
  {
    -[__CFString cStringUsingEncoding:]((id)MTLBlitOptionString(v16), "cStringUsingEncoding:", 4);
    _MTLMessageContextPush_();
    v17 = *((_DWORD *)a8 + 20);
  }
  if ((a12 & 2) != 0 && (v17 & 0x40) == 0)
  {
    -[__CFString cStringUsingEncoding:]((id)MTLBlitOptionString(v16), "cStringUsingEncoding:", 4);
    _MTLMessageContextPush_();
    v17 = *((_DWORD *)a8 + 20);
  }
  if ((v17 & 0x20) != 0 && !v16 && (v17 & 0x40) != 0)
  {
    objc_msgSend(CFSTR("MTLBlitOptionNone"), "cStringUsingEncoding:", 4);
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  *(&self->hasEndEncoding + 3) = 1;
  -[MTLDebugCommandBuffer addObject:retained:purgeable:](self->_commandBuffer, "addObject:retained:purgeable:", a3, 1, 1);
  -[MTLDebugCommandBuffer addObject:retained:purgeable:](self->_commandBuffer, "addObject:retained:purgeable:", a8, 1, 1);
  v18 = -[MTLToolsObject baseObject](self, "baseObject");
  v19 = objc_msgSend(a3, "baseObject");
  v25 = *(_OWORD *)&a7->var0;
  var2 = a7->var2;
  v20 = objc_msgSend(a8, "baseObject");
  v24 = *a11;
  objc_msgSend(v18, "copyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:options:", v19, a4, a5, a6, &v25, v20, a9, a10, &v24, v16);
}

- (void)validateCopyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toBuffer:(id)a8 destinationOffset:(unint64_t)a9 destinationBytesPerRow:(unint64_t)a10 destinationBytesPerImage:(unint64_t)a11 options:(unint64_t)a12
{
  MTLToolsDevice *device;
  MTLToolsDevice *v20;
  uint64_t v21;
  char *v22;
  __int128 v23;
  __int128 v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char *v28;
  uint64_t v29;
  unint64_t var0;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t var1;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t var2;
  uint64_t v39;
  uint64_t v40;
  id v41;
  _QWORD v42[3];
  _QWORD v43[3];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;
  __int128 v62;
  unint64_t v63;
  __int128 v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint64_t v75;
  _MTLMessageContext v76;

  memset(&v76, 0, sizeof(v76));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if ((~(_BYTE)a12 & 3) == 0)
    _MTLMessageContextPush_();
  validateMTLBlitOption(a12 & 0xFFFFFFFF9FFFFFFFLL, &v76);
  if (*(&self->hasEndEncoding + 4))
    _MTLMessageContextPush_();
  if (a3)
  {
    if ((objc_msgSend(a3, "conformsToProtocol:", &unk_255C6E6C0) & 1) == 0)
      _MTLMessageContextPush_();
    if (!objc_msgSend(a3, "conformsToProtocol:", &unk_255C6E6C0))
      goto LABEL_12;
    device = self->super.super.super._device;
    if (device != (MTLToolsDevice *)objc_msgSend(a3, "device"))
      _MTLMessageContextPush_();
    if (objc_msgSend(a3, "storageMode") != 3)
    {
LABEL_12:
      if (a8)
        goto LABEL_13;
LABEL_73:
      _MTLMessageContextPush_();
      goto LABEL_17;
    }
  }
  _MTLMessageContextPush_();
  if (!a8)
    goto LABEL_73;
LABEL_13:
  if ((objc_msgSend(a8, "conformsToProtocol:", &unk_255C54558) & 1) == 0)
    _MTLMessageContextPush_();
  if (objc_msgSend(a8, "conformsToProtocol:", &unk_255C54558))
  {
    v20 = self->super.super.super._device;
    if (v20 != (MTLToolsDevice *)objc_msgSend(a8, "device"))
      goto LABEL_73;
  }
LABEL_17:
  if (!(a7->var1 * a7->var0 * a7->var2))
  {
    var2 = a7->var2;
    v40 = 0;
    var0 = a7->var0;
    var1 = a7->var1;
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  memset(&v76, 0, sizeof(v76));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  validateBlitProtectionOptions(-[MTLToolsRetainingContainer protectionOptions](-[MTLToolsCommandEncoder commandBuffer](self, "commandBuffer"), "protectionOptions"), a3, a8, (uint64_t)CFSTR("texture"));
  if (objc_msgSend(a3, "isFramebufferOnly"))
    _MTLMessageContextPush_();
  if (objc_msgSend(a3, "mipmapLevelCount", var0, var1, var2, v40) <= a5)
  {
    v31 = a5;
    v35 = objc_msgSend(a3, "mipmapLevelCount");
    _MTLMessageContextPush_();
  }
  v41 = a8;
  v21 = objc_msgSend(a3, "numFaces", v31, v35);
  if (objc_msgSend(a3, "arrayLength") * v21 <= a4)
  {
    v29 = objc_msgSend(a3, "numFaces");
    v32 = a4;
    v36 = objc_msgSend(a3, "arrayLength") * v29;
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  v75 = 0;
  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  objc_msgSend(a3, "pixelFormat");
  objc_msgSend(a3, "width");
  objc_msgSend(a3, "height");
  v22 = (char *)objc_msgSend(a3, "depth");
  objc_msgSend(a3, "sampleCount");
  MTLGetTextureLevelInfoForDeviceWithOptions();
  if (!a3)
  {
    MTLReleaseAssertionFailure();
    goto LABEL_69;
  }
  v22 = (char *)a3 + 72;
  v66 = 0;
  v67 = 0;
  v68 = 0;
  v64 = *(_OWORD *)&a6->var0;
  v65 = a6->var2;
  v62 = *(_OWORD *)&a7->var0;
  v63 = a7->var2;
  v59 = v73;
  v60 = v74;
  v61 = v75;
  v55 = v69;
  v56 = v70;
  v57 = v71;
  v58 = v72;
  v54 = *((_QWORD *)a3 + 15);
  v23 = *(_OWORD *)((char *)a3 + 104);
  v24 = *(_OWORD *)((char *)a3 + 72);
  v52 = *(_OWORD *)((char *)a3 + 88);
  v53 = v23;
  v51 = v24;
  _MTLAdjustMTLSize();
  memset(&v76, 0, sizeof(v76));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  v25 = a6->var0;
  if ((*((_BYTE *)a3 + 81) & 4) != 0)
  {
    v27 = v66 + v25;
    if (v27 > (unint64_t)v72)
    {
      v32 = v27;
      v36 = v72;
      _MTLMessageContextPush_();
    }
    if (v67 + a6->var1 > *((_QWORD *)&v72 + 1))
    {
      v32 = v67 + a6->var1;
      v36 = *((_QWORD *)&v72 + 1);
      _MTLMessageContextPush_();
    }
    if (v68 + a6->var2 > (unint64_t)v73)
    {
      v32 = v68 + a6->var2;
      v36 = v73;
      goto LABEL_75;
    }
  }
  else
  {
    v26 = a7->var0 + v25;
    if (v26 > (unint64_t)v69)
    {
      v32 = v26;
      v36 = v69;
      _MTLMessageContextPush_();
    }
    if (a7->var1 + a6->var1 > *((_QWORD *)&v69 + 1))
    {
      v32 = a7->var1 + a6->var1;
      v36 = *((_QWORD *)&v69 + 1);
      _MTLMessageContextPush_();
    }
    if (a7->var2 + a6->var2 > (unint64_t)v70)
    {
      v32 = a7->var2 + a6->var2;
      v36 = v70;
LABEL_75:
      _MTLMessageContextPush_();
    }
  }
  a7 = ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)a9;
  a5 = *((_QWORD *)&v73 + 1);
  if (!*((_QWORD *)&v73 + 1))
  {
LABEL_69:
    v32 = -[__CFString cStringUsingEncoding:]((id)MTLBlitOptionString(a12 & 0xFFFFFFFF9FFFFFFFLL), "cStringUsingEncoding:", 4);
    v36 = *(_QWORD *)v22;
    goto LABEL_71;
  }
  if (!(a9 % *((_QWORD *)&v73 + 1)))
    goto LABEL_40;
  v32 = a9;
  v36 = *((_QWORD *)&v73 + 1);
LABEL_71:
  _MTLMessageContextPush_();
LABEL_40:
  if ((v22[9] & 4) == 0)
    goto LABEL_57;
  if (a6->var0 % *((_QWORD *)v22 + 4))
  {
    v36 = *(_QWORD *)v22;
    v39 = *((_QWORD *)v22 + 4);
    v32 = a6->var0;
    _MTLMessageContextPush_();
  }
  if (a6->var1 % *((_QWORD *)v22 + 5))
  {
    v36 = *(_QWORD *)v22;
    v39 = *((_QWORD *)v22 + 5);
    v32 = a6->var1;
    _MTLMessageContextPush_();
  }
  if (a6->var2 % *((_QWORD *)v22 + 6))
  {
    v36 = *(_QWORD *)v22;
    v39 = *((_QWORD *)v22 + 6);
    v32 = a6->var2;
    _MTLMessageContextPush_();
  }
  if (v66 % *((_QWORD *)v22 + 4))
  {
    v36 = *(_QWORD *)v22;
    v39 = *((_QWORD *)v22 + 4);
    v32 = v66;
    _MTLMessageContextPush_();
  }
  if (v67 % *((_QWORD *)v22 + 5))
  {
    v36 = *(_QWORD *)v22;
    v39 = *((_QWORD *)v22 + 5);
    v32 = v67;
    _MTLMessageContextPush_();
  }
  if (v68 % *((_QWORD *)v22 + 6))
  {
    v36 = *(_QWORD *)v22;
    v39 = *((_QWORD *)v22 + 6);
    v32 = v68;
    _MTLMessageContextPush_();
  }
  if ((v22[9] & 0x20) != 0)
  {
    if ((a12 & 4) != 0)
      goto LABEL_57;
  }
  else if ((a12 & 4) == 0)
  {
    goto LABEL_57;
  }
  v32 = *(_QWORD *)v22;
  _MTLMessageContextPush_();
LABEL_57:
  _MTLMessageContextEnd();
  memset(&v76, 0, sizeof(v76));
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  v50 = 0;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  objc_msgSend(a3, "pixelFormat");
  objc_msgSend(a3, "sampleCount");
  MTLGetTextureLevelInfoForDeviceWithOptions();
  v28 = (char *)a7 - a10 - a11;
  if ((unint64_t)v28 > objc_msgSend(v41, "length", v32, v36, v39))
  {
    v33 = (unint64_t)&v28[*((_QWORD *)&v46 + 1) * a11];
    v37 = objc_msgSend(v41, "length");
    _MTLMessageContextPush_();
  }
  if (a10 % a5)
  {
    _MTLMessageContextPush_();
    v33 = a10;
    v37 = a5;
    _MTLMessageContextPush_();
  }
  if (a11 % a5)
  {
    v33 = a11;
    v37 = a5;
    _MTLMessageContextPush_();
  }
  if (objc_msgSend(a3, "textureType", v33, v37) != 9 && a10 > 0x7FFFLL * *((_QWORD *)&v73 + 1))
    _MTLMessageContextPush_();
  _MTLMessageContextEnd();
  v43[1] = 0;
  v43[2] = 0;
  v42[2] = 0;
  v43[0] = a3;
  v42[0] = v41;
  v42[1] = 0;
  validateResourceAliasing((uint64_t)v43, (uint64_t)v42, 0);
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toBuffer:(id)a8 destinationOffset:(unint64_t)a9 destinationBytesPerRow:(unint64_t)a10 destinationBytesPerImage:(unint64_t)a11
{
  id v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v21;
  unint64_t v22;
  __int128 v23;
  unint64_t var2;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v25;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v26;

  v26 = *a6;
  v25 = *a7;
  -[MTLDebugBlitCommandEncoder validateCopyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toBuffer:destinationOffset:destinationBytesPerRow:destinationBytesPerImage:options:](self, "validateCopyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toBuffer:destinationOffset:destinationBytesPerRow:destinationBytesPerImage:options:", a3, a4, a5, &v26, &v25, a9, a10, a11, 0);
  if ((~*((_DWORD *)a3 + 20) & 0x60) == 0)
  {
    v19 = *((_QWORD *)a3 + 9);
    MTLReportFailure();
  }
  *(&self->hasEndEncoding + 3) = 1;
  -[MTLDebugCommandBuffer addObject:retained:purgeable:](self->_commandBuffer, "addObject:retained:purgeable:", a3, 1, 1, v19);
  -[MTLDebugCommandBuffer addObject:retained:purgeable:](self->_commandBuffer, "addObject:retained:purgeable:", a8, 1, 1);
  v17 = -[MTLToolsObject baseObject](self, "baseObject");
  v18 = objc_msgSend(a3, "baseObject");
  v23 = *(_OWORD *)&a6->var0;
  var2 = a6->var2;
  v21 = *(_OWORD *)&a7->var0;
  v22 = a7->var2;
  objc_msgSend(v17, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toBuffer:destinationOffset:destinationBytesPerRow:destinationBytesPerImage:", v18, a4, a5, &v23, &v21, objc_msgSend(a8, "baseObject"), a9, a10, a11);
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toBuffer:(id)a8 destinationOffset:(unint64_t)a9 destinationBytesPerRow:(unint64_t)a10 destinationBytesPerImage:(unint64_t)a11 options:(unint64_t)a12
{
  unint64_t v17;
  int v18;
  id v19;
  uint64_t v20;
  __int128 v23;
  unint64_t v24;
  __int128 v25;
  unint64_t var2;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v31;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v32;

  v17 = a12 & 0xFFFFFFFF9FFFFFFFLL;
  v32 = *a6;
  v31 = *a7;
  -[MTLDebugBlitCommandEncoder validateCopyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toBuffer:destinationOffset:destinationBytesPerRow:destinationBytesPerImage:options:](self, "validateCopyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toBuffer:destinationOffset:destinationBytesPerRow:destinationBytesPerImage:options:", a3, a4, a5, &v32, &v31, a9, a10, a11, a12);
  v30 = 0;
  v28 = 0u;
  v29 = 0u;
  v27 = 0u;
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  v18 = *((_DWORD *)a3 + 20);
  if ((a12 & 1) != 0 && (v18 & 0x20) == 0)
  {
    -[__CFString cStringUsingEncoding:]((id)MTLBlitOptionString(v17), "cStringUsingEncoding:", 4);
    _MTLMessageContextPush_();
    v18 = *((_DWORD *)a3 + 20);
  }
  if ((a12 & 2) != 0 && (v18 & 0x40) == 0)
  {
    -[__CFString cStringUsingEncoding:]((id)MTLBlitOptionString(v17), "cStringUsingEncoding:", 4);
    _MTLMessageContextPush_();
    v18 = *((_DWORD *)a3 + 20);
  }
  if ((v18 & 0x20) != 0 && !v17 && (v18 & 0x40) != 0)
  {
    objc_msgSend(CFSTR("MTLBlitOptionNone"), "cStringUsingEncoding:", 4);
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  *(&self->hasEndEncoding + 3) = 1;
  -[MTLDebugCommandBuffer addObject:retained:purgeable:](self->_commandBuffer, "addObject:retained:purgeable:", a3, 1, 1);
  -[MTLDebugCommandBuffer addObject:retained:purgeable:](self->_commandBuffer, "addObject:retained:purgeable:", a8, 1, 1);
  v19 = -[MTLToolsObject baseObject](self, "baseObject");
  v20 = objc_msgSend(a3, "baseObject");
  v25 = *(_OWORD *)&a6->var0;
  var2 = a6->var2;
  v23 = *(_OWORD *)&a7->var0;
  v24 = a7->var2;
  objc_msgSend(v19, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toBuffer:destinationOffset:destinationBytesPerRow:destinationBytesPerImage:options:", v20, a4, a5, &v25, &v23, objc_msgSend(a8, "baseObject"), a9, a10, a11, v17);
}

- (void)generateMipmapsForTexture:(id)a3
{
  MTLToolsDevice *device;
  uint64_t *v6;
  int v7;
  uint64_t v8;

  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if (!a3)
    _MTLMessageContextPush_();
  if ((objc_msgSend(a3, "conformsToProtocol:", &unk_255C6E6C0) & 1) == 0)
    goto LABEL_17;
  while (1)
  {
    device = self->super.super.super._device;
    if (device != (MTLToolsDevice *)objc_msgSend(a3, "device"))
      _MTLMessageContextPush_();
    if (objc_msgSend(a3, "storageMode", v8) == 3)
      _MTLMessageContextPush_();
    if ((unint64_t)objc_msgSend(a3, "mipmapLevelCount") <= 1)
    {
      v8 = objc_msgSend(a3, "mipmapLevelCount");
      _MTLMessageContextPush_();
    }
    v6 = (uint64_t *)((char *)a3 + 72);
    v7 = *((_DWORD *)a3 + 20);
    if ((v7 & 0x10) != 0)
    {
      if ((v7 & 4) != 0)
        goto LABEL_12;
    }
    else
    {
      v8 = *v6;
      _MTLMessageContextPush_();
      v6 = (uint64_t *)((char *)a3 + 72);
      if ((*((_DWORD *)a3 + 20) & 4) != 0)
        goto LABEL_12;
    }
    v8 = *v6;
    _MTLMessageContextPush_();
LABEL_12:
    if (*(&self->hasEndEncoding + 4))
      _MTLMessageContextPush_();
    _MTLMessageContextEnd();
    if (a3)
      break;
    MTLReleaseAssertionFailure();
LABEL_17:
    _MTLMessageContextPush_();
  }
  *(&self->hasEndEncoding + 3) = 1;
  -[MTLDebugCommandBuffer addObject:retained:purgeable:](self->_commandBuffer, "addObject:retained:purgeable:", a3, 1, 1);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "generateMipmapsForTexture:", objc_msgSend(a3, "baseObject"));
}

- (void)fillBuffer:(id)a3 range:(_NSRange)a4 value:(unsigned __int8)a5
{
  uint64_t v5;
  NSUInteger length;
  NSUInteger location;
  MTLToolsDevice *device;

  v5 = a5;
  length = a4.length;
  location = a4.location;
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if (!a3)
    _MTLMessageContextPush_();
  if ((objc_msgSend(a3, "conformsToProtocol:", &unk_255C54558) & 1) == 0)
    _MTLMessageContextPush_();
  device = self->super.super.super._device;
  if (device != (MTLToolsDevice *)objc_msgSend(a3, "device"))
    _MTLMessageContextPush_();
  if (location + length > objc_msgSend((id)objc_msgSend(a3, "baseObject"), "length"))
  {
    objc_msgSend((id)objc_msgSend(a3, "baseObject"), "length");
    _MTLMessageContextPush_();
    if (length)
      goto LABEL_9;
  }
  else if (length)
  {
    goto LABEL_9;
  }
  _MTLMessageContextPush_();
LABEL_9:
  if (*(&self->hasEndEncoding + 4))
    _MTLMessageContextPush_();
  _MTLMessageContextEnd();
  *(&self->hasEndEncoding + 3) = 1;
  -[MTLDebugCommandBuffer addObject:retained:purgeable:](self->_commandBuffer, "addObject:retained:purgeable:", a3, 1, 1);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "fillBuffer:range:value:", objc_msgSend(a3, "baseObject"), location, length, v5);
}

- (void)fillBuffer:(id)a3 range:(_NSRange)a4 pattern4:(unsigned int)a5
{
  uint64_t v5;
  NSUInteger length;
  NSUInteger location;
  MTLToolsDevice *device;

  v5 = *(_QWORD *)&a5;
  length = a4.length;
  location = a4.location;
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if (!a3)
    _MTLMessageContextPush_();
  if ((objc_msgSend(a3, "conformsToProtocol:", &unk_255C54558) & 1) == 0)
    _MTLMessageContextPush_();
  device = self->super.super.super._device;
  if (device != (MTLToolsDevice *)objc_msgSend(a3, "device"))
    _MTLMessageContextPush_();
  if (location + length > objc_msgSend((id)objc_msgSend(a3, "baseObject"), "length"))
  {
    objc_msgSend((id)objc_msgSend(a3, "baseObject"), "length");
    _MTLMessageContextPush_();
    if (length)
      goto LABEL_9;
  }
  else if (length)
  {
    goto LABEL_9;
  }
  _MTLMessageContextPush_();
LABEL_9:
  if ((location & 3) != 0)
    _MTLMessageContextPush_();
  if ((length & 3) != 0)
    _MTLMessageContextPush_();
  if (*(&self->hasEndEncoding + 4))
    _MTLMessageContextPush_();
  _MTLMessageContextEnd();
  *(&self->hasEndEncoding + 3) = 1;
  -[MTLDebugCommandBuffer addObject:retained:purgeable:](self->_commandBuffer, "addObject:retained:purgeable:", a3, 1, 1);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "fillBuffer:range:pattern4:", objc_msgSend(a3, "baseObject"), location, length, v5);
}

- (void)copyFromBuffer:(id)a3 sourceOffset:(unint64_t)a4 toBuffer:(id)a5 destinationOffset:(unint64_t)a6 size:(unint64_t)a7
{
  MTLToolsDevice *device;
  MTLToolsDevice *v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[3];
  _QWORD v20[3];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v24 = 0;
  v22 = 0u;
  v23 = 0u;
  v21 = 0u;
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if (*(&self->hasEndEncoding + 4))
    _MTLMessageContextPush_();
  if (a3)
  {
    if ((objc_msgSend(a3, "conformsToProtocol:", &unk_255C54558) & 1) == 0)
      _MTLMessageContextPush_();
    if (!objc_msgSend(a3, "conformsToProtocol:", &unk_255C54558)
      || (device = self->super.super.super._device, device == (MTLToolsDevice *)objc_msgSend(a3, "device")))
    {
      if (a5)
        goto LABEL_9;
LABEL_22:
      _MTLMessageContextPush_();
      goto LABEL_13;
    }
  }
  _MTLMessageContextPush_();
  if (!a5)
    goto LABEL_22;
LABEL_9:
  if ((objc_msgSend(a5, "conformsToProtocol:", &unk_255C54558) & 1) == 0)
    _MTLMessageContextPush_();
  if (objc_msgSend(a5, "conformsToProtocol:", &unk_255C54558))
  {
    v14 = self->super.super.super._device;
    if (v14 != (MTLToolsDevice *)objc_msgSend(a5, "device"))
      goto LABEL_22;
  }
LABEL_13:
  _MTLMessageContextEnd();
  v24 = 0;
  v22 = 0u;
  v23 = 0u;
  v21 = 0u;
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if (a7 + a4 > objc_msgSend((id)objc_msgSend(a3, "baseObject"), "length"))
  {
    v15 = a7 + a4;
    v17 = objc_msgSend((id)objc_msgSend(a3, "baseObject"), "length");
    _MTLMessageContextPush_();
  }
  if (a7 + a6 > objc_msgSend((id)objc_msgSend(a5, "baseObject", v15, v17), "length"))
  {
    v16 = a7 + a6;
    v18 = objc_msgSend((id)objc_msgSend(a5, "baseObject"), "length");
    _MTLMessageContextPush_();
    if (a7)
      goto LABEL_17;
LABEL_20:
    v16 = 0;
    _MTLMessageContextPush_();
    goto LABEL_17;
  }
  if (!a7)
    goto LABEL_20;
LABEL_17:
  validateBlitProtectionOptions(-[MTLToolsRetainingContainer protectionOptions](-[MTLToolsCommandEncoder commandBuffer](self, "commandBuffer", v16, v18), "protectionOptions"), a3, a5, (uint64_t)CFSTR("buffer"));
  _MTLMessageContextEnd();
  v20[1] = 0;
  v20[2] = 0;
  v19[2] = 0;
  v20[0] = a3;
  v19[0] = a5;
  v19[1] = 0;
  validateResourceAliasing((uint64_t)v20, (uint64_t)v19, 1);
  *(&self->hasEndEncoding + 3) = 1;
  -[MTLDebugCommandBuffer addObject:retained:purgeable:](self->_commandBuffer, "addObject:retained:purgeable:", a3, 1, 1);
  -[MTLDebugCommandBuffer addObject:retained:purgeable:](self->_commandBuffer, "addObject:retained:purgeable:", a5, 1, 1);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:", objc_msgSend(a3, "baseObject"), a4, objc_msgSend(a5, "baseObject"), a6, a7);
}

- (void)updateFence:(id)a3
{
  id v5;

  v5 = a3;
  std::deque<objc_object *>::push_back(&self->updatedFences.__map_.__first_, &v5);
  *(&self->hasEndEncoding + 3) = 1;
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
  *(&self->hasEndEncoding + 3) = 1;
  -[MTLDebugCommandBuffer addObject:retained:purgeable:](self->_commandBuffer, "addObject:retained:purgeable:", a3, 1, 0);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "waitForFence:", objc_msgSend(a3, "baseObject"));
}

- (void)endEncoding
{
  if (*(&self->hasEndEncoding + 4))
    MTLReportFailure();
  if (!*(&self->hasEndEncoding + 3))
    MTLReportFailure();
  *(&self->hasEndEncoding + 2) = 1;
  *(&self->hasEndEncoding + 4) = 1;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "endEncoding");
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

- (void)getTextureAccessCounters:(id)a3 region:(id *)a4 mipLevel:(unint64_t)a5 slice:(unint64_t)a6 resetCounters:(BOOL)a7 countersBuffer:(id)a8 countersBufferOffset:(unint64_t)a9
{
  _BOOL8 v10;
  MTLToolsDevice *device;
  __int128 v17;
  id v18;
  uint64_t v19;
  __int128 v20;
  unint64_t v21;
  uint64_t v22;
  _OWORD v23[3];
  _OWORD v24[3];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  v10 = a7;
  v28 = 0;
  v26 = 0u;
  v27 = 0u;
  v25 = 0u;
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if (!a8)
    _MTLMessageContextPush_();
  if (!(_QWORD)v25)
  {
    if ((objc_msgSend(a8, "conformsToProtocol:", &unk_255C54558) & 1) == 0)
      _MTLMessageContextPush_();
    device = self->super.super.super._device;
    if (device != (MTLToolsDevice *)objc_msgSend(a8, "device"))
      _MTLMessageContextPush_();
    if (objc_msgSend((id)objc_msgSend(a8, "baseObject"), "length") < a9)
    {
      v21 = a9;
      v22 = objc_msgSend((id)objc_msgSend(a8, "baseObject"), "length");
      _MTLMessageContextPush_();
    }
  }
  if ((objc_msgSend(a3, "isSparse", v21, v22) & 1) == 0)
    _MTLMessageContextPush_();
  _MTLMessageContextEnd();
  v17 = *(_OWORD *)&a4->var0.var2;
  v24[0] = *(_OWORD *)&a4->var0.var0;
  v24[1] = v17;
  v24[2] = *(_OWORD *)&a4->var1.var1;
  -[MTLDebugBlitCommandEncoder validateTextureAccess:region:mipLevel:slice:](self, "validateTextureAccess:region:mipLevel:slice:", a3, v24, a5, a6);
  v18 = -[MTLToolsObject baseObject](self, "baseObject");
  v19 = objc_msgSend(a3, "baseObject");
  v20 = *(_OWORD *)&a4->var0.var2;
  v23[0] = *(_OWORD *)&a4->var0.var0;
  v23[1] = v20;
  v23[2] = *(_OWORD *)&a4->var1.var1;
  objc_msgSend(v18, "getTextureAccessCounters:region:mipLevel:slice:resetCounters:countersBuffer:countersBufferOffset:", v19, v23, a5, a6, v10, objc_msgSend(a8, "baseObject"), a9);
}

- (void)resetTextureAccessCounters:(id)a3 region:(id *)a4 mipLevel:(unint64_t)a5 slice:(unint64_t)a6
{
  __int128 v11;
  id v12;
  uint64_t v13;
  __int128 v14;
  _OWORD v15[3];
  _OWORD v16[3];

  if ((objc_msgSend(a3, "isSparse") & 1) == 0)
    MTLReportFailure();
  v11 = *(_OWORD *)&a4->var0.var2;
  v16[0] = *(_OWORD *)&a4->var0.var0;
  v16[1] = v11;
  v16[2] = *(_OWORD *)&a4->var1.var1;
  -[MTLDebugBlitCommandEncoder validateTextureAccess:region:mipLevel:slice:](self, "validateTextureAccess:region:mipLevel:slice:", a3, v16, a5, a6);
  v12 = -[MTLToolsObject baseObject](self, "baseObject");
  v13 = objc_msgSend(a3, "baseObject");
  v14 = *(_OWORD *)&a4->var0.var2;
  v15[0] = *(_OWORD *)&a4->var0.var0;
  v15[1] = v14;
  v15[2] = *(_OWORD *)&a4->var1.var1;
  objc_msgSend(v12, "resetTextureAccessCounters:region:mipLevel:slice:", v13, v15, a5, a6);
}

- (void)validateTextureAccess:(id)a3 region:(id *)a4 mipLevel:(unint64_t)a5 slice:(unint64_t)a6
{
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v10 = (unint64_t)self;
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  v11 = objc_msgSend(a3, "arrayLength");
  v12 = objc_msgSend(a3, "textureType");
  v13 = 6;
  if ((unint64_t)(v12 - 5) >= 2)
    v13 = 1;
  if (v13 * v11 <= a6)
  {
    v23 = a6;
    v25 = objc_msgSend(a3, "arrayLength");
    _MTLMessageContextPush_();
  }
  v14 = objc_msgSend(a3, "mipmapLevelCount", v23, v25) - 1;
  if (v14 >= objc_msgSend(a3, "firstMipmapInTail"))
    v15 = objc_msgSend(a3, "firstMipmapInTail");
  else
    v15 = objc_msgSend(a3, "mipmapLevelCount") - 1;
  if (v15 < a5)
  {
    v21 = objc_msgSend(a3, "mipmapLevelCount") - 1;
    if (v21 >= objc_msgSend(a3, "firstMipmapInTail"))
      v22 = objc_msgSend(a3, "firstMipmapInTail");
    else
      v22 = objc_msgSend(a3, "mipmapLevelCount") - 1;
    v24 = a5;
    v26 = v22;
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  objc_msgSend(a3, "pixelFormat");
  objc_msgSend(a3, "width");
  objc_msgSend(a3, "height");
  objc_msgSend(a3, "depth");
  objc_msgSend(a3, "sampleCount");
  MTLGetTextureLevelInfoForDeviceWithOptions();
  if (!a3)
  {
    MTLReleaseAssertionFailure();
LABEL_21:
    _MTLMessageContextPush_();
    goto LABEL_13;
  }
  v16 = (void *)objc_msgSend(a3, "device");
  v17 = objc_msgSend(a3, "textureType");
  v18 = objc_msgSend(a3, "pixelFormat");
  v19 = objc_msgSend(a3, "sampleCount");
  if (v16)
    objc_msgSend(v16, "sparseTileSizeWithTextureType:pixelFormat:sampleCount:", v17, v18, v19);
  objc_msgSend((id)v10, "device", v24, v26);
  _MTLMessageContextBegin_();
  a3 = 0;
  a5 = -1;
  v10 = 0xFFFFFFFFFFFFFFFFLL / 0;
  if (a4->var1.var0 + a4->var0.var0 > 0xFFFFFFFFFFFFFFFFLL / 0)
    goto LABEL_21;
LABEL_13:
  v20 = a5 / (unint64_t)a3;
  if (a4->var1.var1 + a4->var0.var1 > v10)
    _MTLMessageContextPush_();
  if (a4->var1.var2 + a4->var0.var2 > v20)
    _MTLMessageContextPush_();
  _MTLMessageContextEnd();
}

- (void)optimizeContentsForGPUAccess:(id)a3
{
  MTLToolsDevice *device;

  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if (!a3)
    _MTLMessageContextPush_();
  if ((objc_msgSend(a3, "conformsToProtocol:", &unk_255C6E6C0) & 1) == 0)
    _MTLMessageContextPush_();
  device = self->super.super.super._device;
  if (device != (MTLToolsDevice *)objc_msgSend(a3, "device"))
    _MTLMessageContextPush_();
  if (*(&self->hasEndEncoding + 4))
    _MTLMessageContextPush_();
  _MTLMessageContextEnd();
  *(&self->hasEndEncoding + 3) = 1;
  -[MTLDebugCommandBuffer addObject:retained:purgeable:](self->_commandBuffer, "addObject:retained:purgeable:", a3, 1, 1);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "optimizeContentsForGPUAccess:", objc_msgSend(a3, "baseObject"));
}

- (void)optimizeContentsForGPUAccess:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5
{
  MTLToolsDevice *device;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;

  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if (!a3)
    _MTLMessageContextPush_();
  if ((objc_msgSend(a3, "conformsToProtocol:", &unk_255C6E6C0) & 1) == 0)
    _MTLMessageContextPush_();
  device = self->super.super.super._device;
  if (device != (MTLToolsDevice *)objc_msgSend(a3, "device"))
    _MTLMessageContextPush_();
  if (objc_msgSend(a3, "mipmapLevelCount") <= a5)
  {
    v11 = a5;
    v12 = objc_msgSend(a3, "mipmapLevelCount");
    _MTLMessageContextPush_();
  }
  v10 = objc_msgSend(a3, "numFaces", v11, v12);
  if (objc_msgSend(a3, "arrayLength") * v10 <= a4)
  {
    objc_msgSend(a3, "numFaces");
    objc_msgSend(a3, "arrayLength");
    _MTLMessageContextPush_();
  }
  if (*(&self->hasEndEncoding + 4))
    _MTLMessageContextPush_();
  _MTLMessageContextEnd();
  *(&self->hasEndEncoding + 3) = 1;
  -[MTLDebugCommandBuffer addObject:retained:purgeable:](self->_commandBuffer, "addObject:retained:purgeable:", a3, 1, 1);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "optimizeContentsForGPUAccess:slice:level:", objc_msgSend(a3, "baseObject"), a4, a5);
}

- (void)optimizeContentsForCPUAccess:(id)a3
{
  MTLToolsDevice *device;

  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if (!a3)
    _MTLMessageContextPush_();
  if ((objc_msgSend(a3, "conformsToProtocol:", &unk_255C6E6C0) & 1) == 0)
    _MTLMessageContextPush_();
  device = self->super.super.super._device;
  if (device != (MTLToolsDevice *)objc_msgSend(a3, "device"))
    _MTLMessageContextPush_();
  if (*(&self->hasEndEncoding + 4))
    _MTLMessageContextPush_();
  _MTLMessageContextEnd();
  *(&self->hasEndEncoding + 3) = 1;
  -[MTLDebugCommandBuffer addObject:retained:purgeable:](self->_commandBuffer, "addObject:retained:purgeable:", a3, 1, 1);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "optimizeContentsForCPUAccess:", objc_msgSend(a3, "baseObject"));
}

- (void)optimizeContentsForCPUAccess:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5
{
  MTLToolsDevice *device;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;

  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if (!a3)
    _MTLMessageContextPush_();
  if ((objc_msgSend(a3, "conformsToProtocol:", &unk_255C6E6C0) & 1) == 0)
    _MTLMessageContextPush_();
  device = self->super.super.super._device;
  if (device != (MTLToolsDevice *)objc_msgSend(a3, "device"))
    _MTLMessageContextPush_();
  if (objc_msgSend(a3, "mipmapLevelCount") <= a5)
  {
    v11 = a5;
    v12 = objc_msgSend(a3, "mipmapLevelCount");
    _MTLMessageContextPush_();
  }
  v10 = objc_msgSend(a3, "numFaces", v11, v12);
  if (objc_msgSend(a3, "arrayLength") * v10 <= a4)
  {
    objc_msgSend(a3, "numFaces");
    objc_msgSend(a3, "arrayLength");
    _MTLMessageContextPush_();
  }
  if (*(&self->hasEndEncoding + 4))
    _MTLMessageContextPush_();
  _MTLMessageContextEnd();
  *(&self->hasEndEncoding + 3) = 1;
  -[MTLDebugCommandBuffer addObject:retained:purgeable:](self->_commandBuffer, "addObject:retained:purgeable:", a3, 1, 1);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "optimizeContentsForCPUAccess:slice:level:", objc_msgSend(a3, "baseObject"), a4, a5);
}

- (void)resetCommandsInBuffer:(id)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  NSRange v8;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSRange v15;
  unint64_t *v16;
  unint64_t *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char *v22;
  unint64_t *v23;
  unint64_t *v24;
  unint64_t *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t *v29;
  unint64_t v30;
  unint64_t *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char *v36;
  unint64_t v37;
  unint64_t *v38;
  unint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  char *v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  unint64_t v47;
  char *v48;
  uint64_t *v49;
  uint64_t *v50;
  NSUInteger v51;
  NSUInteger v52;
  char *v53;
  char *v54;
  char *v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  unint64_t v59;
  char *v60;
  NSUInteger *v61;
  NSUInteger *v62;
  _QWORD *v63;
  uint64_t v64;
  unint64_t v65;
  char *v66;
  uint64_t v67;
  unint64_t v68;
  NSUInteger v69;
  NSUInteger v70;
  uint64_t v71;
  char *v72;
  char *v73;
  char *v74;
  void *__p;
  unint64_t *v76;
  char *v77;
  NSRange v78;
  NSRange v79;
  NSRange v80;
  NSRange v81;

  length = a4.length;
  location = a4.location;
  v80.length = objc_msgSend(a3, "size");
  v78.location = location;
  v78.length = length;
  v80.location = 0;
  v8 = NSIntersectionRange(v78, v80);
  if (v8.location != location || v8.length != length)
  {
    v70 = length;
    v71 = objc_msgSend(a3, "size");
    v69 = location;
    MTLReportFailure();
  }
  -[MTLDebugCommandBuffer addObject:retained:purgeable:](self->_commandBuffer, "addObject:retained:purgeable:", a3, 1, 1, v69, v70, v71);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "resetCommandsInBuffer:withRange:", objc_msgSend(a3, "baseObject"), location, length);
  __p = 0;
  v76 = 0;
  v77 = 0;
  v10 = (void *)objc_msgSend(a3, "optimizedRangeList");
  v11 = 0;
  v72 = 0;
  v73 = 0;
  v74 = 0;
  while (v11 < objc_msgSend(v10, "count"))
  {
    v12 = objc_msgSend((id)objc_msgSend(v10, "objectAtIndexedSubscript:", v11), "rangeValue");
    v14 = v13;
    v79.location = objc_msgSend((id)objc_msgSend(v10, "objectAtIndexedSubscript:", v11), "rangeValue");
    v81.location = location;
    v81.length = length;
    v15 = NSIntersectionRange(v79, v81);
    if (v12 == location && v14 == length)
    {
      v16 = v76;
      if (v76 >= (unint64_t *)v77)
      {
        v17 = (unint64_t *)__p;
        v18 = ((char *)v76 - (_BYTE *)__p) >> 3;
        v19 = v18 + 1;
        if ((unint64_t)(v18 + 1) >> 61)
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        v20 = v77 - (_BYTE *)__p;
        if ((v77 - (_BYTE *)__p) >> 2 > v19)
          v19 = v20 >> 2;
        if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFF8)
          v21 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v21 = v19;
        if (v21)
        {
          v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v77, v21);
          v17 = (unint64_t *)__p;
          v16 = v76;
        }
        else
        {
          v22 = 0;
        }
        v29 = (unint64_t *)&v22[8 * v18];
        *v29 = v11;
        v23 = v29 + 1;
        while (v16 != v17)
        {
          v30 = *--v16;
          *--v29 = v30;
        }
        goto LABEL_50;
      }
LABEL_22:
      *v16 = v11;
      v23 = v16 + 1;
      goto LABEL_52;
    }
    if (v12 == v15.location && v14 == v15.length)
    {
      v16 = v76;
      if (v76 < (unint64_t *)v77)
        goto LABEL_22;
      v17 = (unint64_t *)__p;
      v26 = ((char *)v76 - (_BYTE *)__p) >> 3;
      v27 = v26 + 1;
      if ((unint64_t)(v26 + 1) >> 61)
        std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
      v28 = v77 - (_BYTE *)__p;
      if ((v77 - (_BYTE *)__p) >> 2 > v27)
        v27 = v28 >> 2;
      if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFF8)
        v21 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v21 = v27;
      if (v21)
      {
        v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v77, v21);
        v17 = (unint64_t *)__p;
        v16 = v76;
      }
      else
      {
        v22 = 0;
      }
      v29 = (unint64_t *)&v22[8 * v26];
      *v29 = v11;
      v23 = v29 + 1;
      while (v16 != v17)
      {
        v37 = *--v16;
        *--v29 = v37;
      }
LABEL_50:
      __p = v29;
      v76 = v23;
      v77 = &v22[8 * v21];
      if (v17)
        operator delete(v17);
LABEL_52:
      v76 = v23;
      goto LABEL_53;
    }
    if (v15.length)
    {
      v24 = v76;
      if (v76 >= (unint64_t *)v77)
      {
        v31 = (unint64_t *)__p;
        v32 = ((char *)v76 - (_BYTE *)__p) >> 3;
        v33 = v32 + 1;
        if ((unint64_t)(v32 + 1) >> 61)
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        v34 = v77 - (_BYTE *)__p;
        if ((v77 - (_BYTE *)__p) >> 2 > v33)
          v33 = v34 >> 2;
        if ((unint64_t)v34 >= 0x7FFFFFFFFFFFFFF8)
          v35 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v35 = v33;
        if (v35)
        {
          v36 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v77, v35);
          v31 = (unint64_t *)__p;
          v24 = v76;
        }
        else
        {
          v36 = 0;
        }
        v38 = (unint64_t *)&v36[8 * v32];
        *v38 = v11;
        v25 = v38 + 1;
        while (v24 != v31)
        {
          v39 = *--v24;
          *--v38 = v39;
        }
        __p = v38;
        v76 = v25;
        v77 = &v36[8 * v35];
        if (v31)
          operator delete(v31);
      }
      else
      {
        *v76 = v11;
        v25 = v24 + 1;
      }
      v76 = v25;
      v40 = (LODWORD(v15.location) - v12);
      if ((int)v40 < 1)
      {
        LODWORD(v40) = 0;
      }
      else
      {
        v41 = v73;
        if (v73 >= v74)
        {
          v43 = v72;
          v44 = (v73 - v72) >> 4;
          v45 = v44 + 1;
          if ((unint64_t)(v44 + 1) >> 60)
            std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
          v46 = v74 - v72;
          if ((v74 - v72) >> 3 > v45)
            v45 = v46 >> 3;
          if ((unint64_t)v46 >= 0x7FFFFFFFFFFFFFF0)
            v47 = 0xFFFFFFFFFFFFFFFLL;
          else
            v47 = v45;
          if (v47)
          {
            v48 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<NSData *,unsigned long>>>((uint64_t)&v74, v47);
            v43 = v72;
            v41 = v73;
          }
          else
          {
            v48 = 0;
          }
          v49 = (uint64_t *)&v48[16 * v44];
          *v49 = v12;
          v49[1] = v40;
          v50 = v49;
          if (v41 != v43)
          {
            do
            {
              *((_OWORD *)v50 - 1) = *((_OWORD *)v41 - 1);
              v50 -= 2;
              v41 -= 16;
            }
            while (v41 != v43);
            v43 = v72;
          }
          v42 = (char *)(v49 + 2);
          v72 = (char *)v50;
          v74 = &v48[16 * v47];
          if (v43)
            operator delete(v43);
        }
        else
        {
          *(_QWORD *)v73 = v12;
          *((_QWORD *)v73 + 1) = v40;
          v42 = v73 + 16;
        }
        v73 = v42;
      }
      v51 = (v14 - (v40 + LODWORD(v15.length)));
      if ((int)v51 >= 1)
      {
        v52 = v15.location + v15.length;
        v53 = v73;
        if (v73 >= v74)
        {
          v55 = v72;
          v56 = (v73 - v72) >> 4;
          v57 = v56 + 1;
          if ((unint64_t)(v56 + 1) >> 60)
            std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
          v58 = v74 - v72;
          if ((v74 - v72) >> 3 > v57)
            v57 = v58 >> 3;
          if ((unint64_t)v58 >= 0x7FFFFFFFFFFFFFF0)
            v59 = 0xFFFFFFFFFFFFFFFLL;
          else
            v59 = v57;
          if (v59)
          {
            v60 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<NSData *,unsigned long>>>((uint64_t)&v74, v59);
            v55 = v72;
            v53 = v73;
          }
          else
          {
            v60 = 0;
          }
          v61 = (NSUInteger *)&v60[16 * v56];
          *v61 = v52;
          v61[1] = v51;
          v62 = v61;
          if (v53 != v55)
          {
            do
            {
              *((_OWORD *)v62 - 1) = *((_OWORD *)v53 - 1);
              v62 -= 2;
              v53 -= 16;
            }
            while (v53 != v55);
            v55 = v72;
          }
          v54 = (char *)(v61 + 2);
          v72 = (char *)v62;
          v74 = &v60[16 * v59];
          if (v55)
            operator delete(v55);
        }
        else
        {
          *(_QWORD *)v73 = v52;
          *((_QWORD *)v73 + 1) = v51;
          v54 = v73 + 16;
        }
        v73 = v54;
      }
    }
LABEL_53:
    ++v11;
  }
  v63 = __p;
  if (v76 != __p)
  {
    v64 = 0;
    v65 = 0;
    do
    {
      objc_msgSend(v10, "removeObjectAtIndex:", v64 + v63[v65++]);
      v63 = __p;
      --v64;
    }
    while (v65 < ((char *)v76 - (_BYTE *)__p) >> 3);
  }
  v66 = v73;
  if (v73 != v72)
  {
    v67 = 0;
    v68 = 0;
    v66 = v72;
    do
    {
      objc_msgSend(v10, "addObject:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", *(_QWORD *)&v66[v67], *(_QWORD *)&v66[v67 + 8]));
      ++v68;
      v66 = v72;
      v67 += 16;
    }
    while (v68 < (v73 - v72) >> 4);
  }
  if (v66)
    operator delete(v66);
  if (__p)
  {
    v76 = (unint64_t *)__p;
    operator delete(__p);
  }
}

- (void)copyIndirectCommandBuffer:(id)a3 sourceRange:(_NSRange)a4 destination:(id)a5 destinationIndex:(unint64_t)a6
{
  NSUInteger length;
  NSUInteger location;

  length = a4.length;
  location = a4.location;
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if ((objc_msgSend(a3, "conformsToProtocol:", &unk_255C50940) & 1) == 0)
    _MTLMessageContextPush_();
  if ((objc_msgSend(a5, "conformsToProtocol:", &unk_255C50940) & 1) == 0)
    _MTLMessageContextPush_();
  _MTLMessageContextEnd();
  -[MTLDebugCommandBuffer addObject:retained:purgeable:](self->_commandBuffer, "addObject:retained:purgeable:", a3, 1, 1);
  -[MTLDebugCommandBuffer addObject:retained:purgeable:](self->_commandBuffer, "addObject:retained:purgeable:", a5, 1, 1);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "copyIndirectCommandBuffer:sourceRange:destination:destinationIndex:", objc_msgSend(a3, "baseObject"), location, length, objc_msgSend(a5, "baseObject"), a6);
}

- (void)optimizeIndirectCommandBuffer:(id)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  NSRange v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  char v13;
  char v14;
  NSUInteger v15;
  NSUInteger v16;
  uint64_t v17;
  NSRange v18;
  NSRange v19;
  NSRange v20;
  NSRange v21;

  length = a4.length;
  location = a4.location;
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  v20.length = objc_msgSend(a3, "size");
  v18.location = location;
  v18.length = length;
  v20.location = 0;
  v8 = NSIntersectionRange(v18, v20);
  if (v8.location != location || v8.length != length)
  {
    v16 = length;
    v17 = objc_msgSend(a3, "size");
    v15 = location;
    _MTLMessageContextPush_();
  }
  v9 = (void *)objc_msgSend(a3, "optimizedRangeList", v15, v16, v17);
  if (!objc_msgSend(v9, "count"))
  {
    _MTLMessageContextEnd();
LABEL_21:
    objc_msgSend(v9, "addObject:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", location, length));
    goto LABEL_22;
  }
  v10 = 0;
  do
  {
    v12 = objc_msgSend((id)objc_msgSend(v9, "objectAtIndexedSubscript:", v10), "rangeValue") == location
       && v11 == length;
    v13 = v12;
    if (!v12)
    {
      v19.location = objc_msgSend((id)objc_msgSend(v9, "objectAtIndexedSubscript:", v10), "rangeValue");
      v21.location = location;
      v21.length = length;
      if (NSIntersectionRange(v19, v21).length)
        _MTLMessageContextPush_();
    }
    if (++v10 >= (unint64_t)objc_msgSend(v9, "count"))
      v14 = 1;
    else
      v14 = v13;
  }
  while ((v14 & 1) == 0);
  _MTLMessageContextEnd();
  if ((v13 & 1) == 0)
    goto LABEL_21;
LABEL_22:
  -[MTLDebugCommandBuffer addObject:retained:purgeable:](self->_commandBuffer, "addObject:retained:purgeable:", a3, 1, 1);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "optimizeIndirectCommandBuffer:withRange:", objc_msgSend(a3, "baseObject"), location, length);
}

- (void)fillTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 region:(id *)a6 bytes:(const void *)a7 length:(unint64_t)a8
{
  id v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  _OWORD v19[3];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;

  v34 = 0;
  v32 = 0u;
  v33 = 0u;
  v31 = 0u;
  _MTLMessageContextBegin_();
  if (*(&self->hasEndEncoding + 4))
  {
    _MTLMessageContextPush_();
    if (a7)
      goto LABEL_3;
  }
  else if (a7)
  {
    goto LABEL_3;
  }
  _MTLMessageContextPush_();
LABEL_3:
  v30 = 0;
  v28 = 0u;
  v29 = 0u;
  v27 = 0u;
  validateTextureRegion(self->super.super.super._device, a3, a4, a5, a6, (uint64_t)&v27);
  if ((BYTE8(v27) & 0x61) == 1)
  {
    if ((WORD4(v27) & 0x2000) == 0)
      goto LABEL_17;
  }
  else
  {
    v18 = v27;
    _MTLMessageContextPush_();
    if ((WORD4(v27) & 0x2000) == 0)
      goto LABEL_17;
  }
  v26 = 0;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(a3, "pixelFormat", v18);
  objc_msgSend(a3, "width");
  objc_msgSend(a3, "height");
  objc_msgSend(a3, "depth");
  objc_msgSend(a3, "sampleCount");
  MTLGetTextureLevelInfoForDeviceWithOptions();
  if (a6->var0.var0)
    _MTLMessageContextPush_();
  if (a6->var0.var1)
    _MTLMessageContextPush_();
  if (a6->var0.var2)
    _MTLMessageContextPush_();
  if (a6->var1.var0 != (_QWORD)v20)
    _MTLMessageContextPush_();
  if (a6->var1.var1 != *((_QWORD *)&v20 + 1))
    _MTLMessageContextPush_();
  if (a6->var1.var2 != (_QWORD)v21)
    _MTLMessageContextPush_();
LABEL_17:
  if (*((_QWORD *)&v28 + 1) > a8)
    _MTLMessageContextPush_();
  _MTLMessageContextEnd();
  *(&self->hasEndEncoding + 3) = 1;
  -[MTLDebugCommandBuffer addObject:retained:purgeable:](self->_commandBuffer, "addObject:retained:purgeable:", a3, 1, 1);
  v15 = -[MTLToolsObject baseObject](self, "baseObject");
  v16 = objc_msgSend(a3, "baseObject");
  v17 = *(_OWORD *)&a6->var0.var2;
  v19[0] = *(_OWORD *)&a6->var0.var0;
  v19[1] = v17;
  v19[2] = *(_OWORD *)&a6->var1.var1;
  objc_msgSend(v15, "fillTexture:level:slice:region:bytes:length:", v16, a4, a5, v19, a7, a8);
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
  _OWORD v20[3];
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  var3 = a7.var3;
  var2 = a7.var2;
  var1 = a7.var1;
  var0 = a7.var0;
  v25 = 0;
  v23 = 0u;
  v24 = 0u;
  v22 = 0u;
  _MTLMessageContextBegin_();
  if (*(&self->hasEndEncoding + 4))
    _MTLMessageContextPush_();
  v21 = 0;
  memset(v20, 0, sizeof(v20));
  validateTextureRegion(self->super.super.super._device, a3, a4, a5, a6, (uint64_t)v20);
  if ((WORD4(v20[0]) & 0x461) != 1)
    _MTLMessageContextPush_();
  _MTLMessageContextEnd();
  *(&self->hasEndEncoding + 3) = 1;
  -[MTLDebugCommandBuffer addObject:retained:purgeable:](self->_commandBuffer, "addObject:retained:purgeable:", a3, 1, 1);
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
  _OWORD v21[6];
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;

  var3 = a7.var3;
  var2 = a7.var2;
  var1 = a7.var1;
  var0 = a7.var0;
  v30 = 0;
  v28 = 0u;
  v29 = 0u;
  v27 = 0u;
  _MTLMessageContextBegin_();
  if (*(&self->hasEndEncoding + 4))
    _MTLMessageContextPush_();
  v26 = 0;
  v24 = 0u;
  v25 = 0u;
  v23 = 0u;
  validateTextureRegion(self->super.super.super._device, a3, a4, a5, a6, (uint64_t)&v23);
  v22 = 0;
  memset(&v21[3], 0, 48);
  -[MTLToolsObject baseObject](self->super.super.super._device, "baseObject");
  MTLPixelFormatGetInfoForDevice();
  _MTLMessageContextPush_();
  if ((_QWORD)v24)
    _MTLMessageContextPush_();
  _MTLMessageContextEnd();
  *(&self->hasEndEncoding + 3) = 1;
  -[MTLDebugCommandBuffer addObject:retained:purgeable:](self->_commandBuffer, "addObject:retained:purgeable:", a3, 1, 1);
  v18 = -[MTLToolsObject baseObject](self, "baseObject");
  v19 = objc_msgSend(a3, "baseObject");
  v20 = *(_OWORD *)&a6->var0.var2;
  v21[0] = *(_OWORD *)&a6->var0.var0;
  v21[1] = v20;
  v21[2] = *(_OWORD *)&a6->var1.var1;
  objc_msgSend(v18, "fillTexture:level:slice:region:color:pixelFormat:", v19, a4, a5, v21, a8, var0, var1, var2, var3);
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 toTexture:(id)a6 destinationSlice:(unint64_t)a7 destinationLevel:(unint64_t)a8 sliceCount:(unint64_t)a9 levelCount:(unint64_t)a10
{
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v33[3];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;

  v51 = 0;
  v49 = 0u;
  v50 = 0u;
  v48 = 0u;
  _MTLMessageContextBegin_();
  if (!a9)
    _MTLMessageContextPush_();
  if (!a10)
    _MTLMessageContextPush_();
  v47 = 0;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  objc_msgSend(a3, "pixelFormat");
  objc_msgSend(a3, "width");
  objc_msgSend(a3, "height");
  objc_msgSend(a3, "depth");
  objc_msgSend(a3, "sampleCount");
  MTLGetTextureLevelInfoForDevice();
  v40 = 0;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(a6, "pixelFormat");
  objc_msgSend(a6, "width");
  objc_msgSend(a6, "height");
  objc_msgSend(a6, "depth");
  objc_msgSend(a6, "sampleCount");
  MTLGetTextureLevelInfoForDevice();
  v27 = objc_msgSend(a3, "numFaces");
  v28 = objc_msgSend(a6, "numFaces");
  if (a10 + a5 > objc_msgSend(a3, "mipmapLevelCount", v13, v17, v21, v25))
  {
    v18 = a10;
    v22 = objc_msgSend(a3, "mipmapLevelCount");
    v14 = a5;
    _MTLMessageContextPush_();
  }
  if (a10 + a8 > objc_msgSend(a6, "mipmapLevelCount", v14, v18, v22))
  {
    v19 = a10;
    v23 = objc_msgSend(a6, "mipmapLevelCount");
    v15 = a8;
    _MTLMessageContextPush_();
  }
  if (a9 + a4 > objc_msgSend(a3, "arrayLength", v15, v19, v23) * v27)
  {
    v24 = objc_msgSend(a3, "arrayLength");
    v26 = v27;
    v16 = a4;
    v20 = a9;
    _MTLMessageContextPush_();
  }
  if (a9 + a7 > objc_msgSend(a6, "arrayLength", v16, v20, v24, v26) * v28)
  {
    objc_msgSend(a6, "arrayLength");
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  memset(v33, 0, sizeof(v33));
  -[MTLDebugBlitCommandEncoder validateCopyFromTexture:sourceSlice:sourceLevel:sourceSize:toTexture:destinationSlice:destinationLevel:options:sliceCount:levelCount:](self, "validateCopyFromTexture:sourceSlice:sourceLevel:sourceSize:toTexture:destinationSlice:destinationLevel:options:sliceCount:levelCount:", a3, a4, a5, v33, a6, a7, a8, 0, a9, a10);
  *(&self->hasEndEncoding + 3) = 1;
  -[MTLDebugCommandBuffer addObject:retained:purgeable:](self->_commandBuffer, "addObject:retained:purgeable:", a3, 1, 1);
  -[MTLDebugCommandBuffer addObject:retained:purgeable:](self->_commandBuffer, "addObject:retained:purgeable:", a6, 1, 1);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "copyFromTexture:sourceSlice:sourceLevel:toTexture:destinationSlice:destinationLevel:sliceCount:levelCount:", objc_msgSend(a3, "baseObject"), a4, a5, objc_msgSend(a6, "baseObject"), a7, a8, a9, a10);
}

- (void)copyFromTexture:(id)a3 toTexture:(id)a4
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t *v13;
  unint64_t *v14;
  unint64_t *v15;
  unint64_t *v16;
  BOOL v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  int v26;
  unint64_t *v27;
  unint64_t *v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD v53[3];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint64_t v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint64_t v71;
  unint64_t v72;
  unint64_t v73;
  unint64_t v74;
  unint64_t v75;

  v6 = objc_msgSend(a3, "width");
  v7 = objc_msgSend(a3, "height");
  v8 = objc_msgSend(a3, "depth");
  v74 = v8;
  v75 = v7;
  v9 = objc_msgSend(a4, "width");
  v10 = objc_msgSend(a4, "height");
  v11 = objc_msgSend(a4, "depth");
  v12 = 0;
  v72 = v11;
  v73 = v10;
  v13 = &v73;
  v14 = &v72;
  v15 = &v73;
  v16 = &v72;
  v17 = v8 > v11;
  if (v8 <= v11)
    v18 = v11;
  else
    v18 = v8;
  if (v8 <= v11)
    v19 = v10;
  else
    v19 = v7;
  if (v17)
    v20 = v9;
  else
    v20 = v6;
  if (v17)
  {
    v21 = v6;
  }
  else
  {
    v16 = &v74;
    v21 = v9;
  }
  v22 = v17;
  if (!v17)
    v15 = &v75;
  if (v7 <= v10)
    v23 = v18;
  else
    v23 = v8;
  if (v7 <= v10)
    v24 = v19;
  else
    v24 = v7;
  if (v7 <= v10)
    v25 = v20;
  else
    v25 = v9;
  if (v7 <= v10)
  {
    v26 = v22;
  }
  else
  {
    v21 = v6;
    v26 = 1;
  }
  if (v7 <= v10)
    v27 = v16;
  else
    v27 = &v72;
  if (v7 <= v10)
    v28 = v15;
  else
    v28 = &v73;
  if (v6 <= v9)
    v29 = v23;
  else
    v29 = v8;
  if (v6 <= v9)
    v30 = v24;
  else
    v30 = v7;
  if (v6 <= v9)
    v31 = v25;
  else
    v31 = v9;
  if (v6 <= v9)
    v32 = v21;
  else
    v32 = v6;
  if (v6 <= v9)
    v33 = v26;
  else
    v33 = 1;
  if (v6 <= v9)
  {
    v14 = v27;
    v13 = v28;
  }
  while (v32 > v31 || v30 > *v13 || v29 > *v14)
  {
    v32 >>= 1;
    v30 >>= 1;
    ++v12;
    v29 >>= 1;
  }
  if (v33)
    v34 = v12;
  else
    v34 = 0;
  if (v33)
    v35 = 0;
  else
    v35 = v12;
  v51 = v34;
  v71 = 0;
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  objc_msgSend(a4, "pixelFormat");
  objc_msgSend(a4, "width");
  objc_msgSend(a4, "height");
  objc_msgSend(a4, "depth");
  objc_msgSend(a4, "sampleCount");
  MTLGetTextureLevelInfoForDevice();
  v64 = 0;
  v62 = 0u;
  v63 = 0u;
  v61 = 0u;
  v59 = 0u;
  v60 = 0u;
  v58 = 0u;
  objc_msgSend(a3, "pixelFormat");
  objc_msgSend(a3, "width");
  objc_msgSend(a3, "height");
  objc_msgSend(a3, "depth");
  objc_msgSend(a3, "sampleCount");
  MTLGetTextureLevelInfoForDevice();
  v57 = 0;
  v55 = 0u;
  v56 = 0u;
  v54 = 0u;
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  v36 = v35;
  _MTLMessageContextEnd();
  v37 = objc_msgSend(a3, "arrayLength");
  v38 = objc_msgSend(a3, "numFaces");
  v39 = objc_msgSend(a4, "arrayLength");
  v40 = objc_msgSend(a4, "numFaces");
  v41 = objc_msgSend(a3, "mipmapLevelCount") - v51;
  v42 = objc_msgSend(a4, "mipmapLevelCount") - v36;
  if (v41 >= v42)
    v43 = a4;
  else
    v43 = a3;
  if (v41 >= v42)
    v44 = v36;
  else
    v44 = v51;
  v45 = objc_msgSend(v43, "mipmapLevelCount", v47, v48, v49, v50);
  v46 = v38 * v37;
  if (v38 * v37 >= (unint64_t)(v40 * v39))
    v46 = v40 * v39;
  memset(v53, 0, sizeof(v53));
  -[MTLDebugBlitCommandEncoder validateCopyFromTexture:sourceSlice:sourceLevel:sourceSize:toTexture:destinationSlice:destinationLevel:options:sliceCount:levelCount:](self, "validateCopyFromTexture:sourceSlice:sourceLevel:sourceSize:toTexture:destinationSlice:destinationLevel:options:sliceCount:levelCount:", a3, 0, v51, v53, a4, 0, v36, 0, v46, v45 - v44);
  *(&self->hasEndEncoding + 3) = 1;
  -[MTLDebugCommandBuffer addObject:retained:purgeable:](self->_commandBuffer, "addObject:retained:purgeable:", a3, 1, 1);
  -[MTLDebugCommandBuffer addObject:retained:purgeable:](self->_commandBuffer, "addObject:retained:purgeable:", a4, 1, 1);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "copyFromTexture:toTexture:", objc_msgSend(a3, "baseObject"), objc_msgSend(a4, "baseObject"));
}

- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5
{
  _BOOL8 v5;
  MTLToolsDevice *device;
  unint64_t v10;
  uint64_t v11;

  v5 = a5;
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if (!a3)
    _MTLMessageContextPush_();
  if ((objc_msgSend(a3, "conformsToProtocol:", &unk_255C522D0) & 1) == 0)
    _MTLMessageContextPush_();
  device = self->super.super.super._device;
  if (device != (MTLToolsDevice *)objc_msgSend(a3, "device"))
    _MTLMessageContextPush_();
  if (objc_msgSend(a3, "sampleCount") <= a4)
  {
    v10 = a4;
    v11 = objc_msgSend(a3, "sampleCount");
    _MTLMessageContextPush_();
  }
  if (!-[MTLToolsDevice supportsCounterSampling:](self->super.super.super._device, "supportsCounterSampling:", 4, v10, v11))_MTLMessageContextPush_();
  _MTLMessageContextEnd();
  -[MTLDebugCommandBuffer addObject:retained:purgeable:](self->_commandBuffer, "addObject:retained:purgeable:", a3, 1, 0);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "sampleCountersInBuffer:atSampleIndex:withBarrier:", objc_msgSend(a3, "baseObject"), a4, v5);
}

- (void)resolveCounters:(id)a3 inRange:(_NSRange)a4 destinationBuffer:(id)a5 destinationOffset:(unint64_t)a6
{
  NSUInteger length;
  NSUInteger location;
  MTLToolsDevice *device;
  MTLToolsDevice *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;

  length = a4.length;
  location = a4.location;
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if (!a3)
    _MTLMessageContextPush_();
  if ((objc_msgSend(a3, "conformsToProtocol:", &unk_255C522D0) & 1) == 0)
    _MTLMessageContextPush_();
  if ((objc_msgSend(a5, "conformsToProtocol:", &unk_255C54558) & 1) == 0)
    _MTLMessageContextPush_();
  device = self->super.super.super._device;
  if (device != (MTLToolsDevice *)objc_msgSend(a3, "device"))
    _MTLMessageContextPush_();
  v13 = self->super.super.super._device;
  if (v13 != (MTLToolsDevice *)objc_msgSend(a5, "device"))
    _MTLMessageContextPush_();
  v14 = -[MTLToolsDevice minConstantBufferAlignmentBytes](self->super.super.super._device, "minConstantBufferAlignmentBytes");
  if (a6 % v14)
  {
    v15 = a6;
    v16 = v14;
    _MTLMessageContextPush_();
  }
  if (location + length > objc_msgSend(a3, "sampleCount", v15, v16))
  {
    objc_msgSend(a3, "sampleCount");
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  -[MTLDebugCommandBuffer addObject:retained:purgeable:](self->_commandBuffer, "addObject:retained:purgeable:", a3, 1, 0);
  -[MTLDebugCommandBuffer addObject:retained:purgeable:](self->_commandBuffer, "addObject:retained:purgeable:", a5, 1, 1);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "resolveCounters:inRange:destinationBuffer:destinationOffset:", objc_msgSend(a3, "baseObject"), location, length, objc_msgSend(a5, "baseObject"), a6);
}

- (void)invalidateCompressedTexture:(id)a3
{
  MTLToolsDevice *device;
  objc_super v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;

  v10 = 0;
  v8 = 0u;
  v9 = 0u;
  v7 = 0u;
  _MTLMessageContextBegin_();
  if (!a3)
    _MTLMessageContextPush_();
  if (!(_QWORD)v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      _MTLMessageContextPush_();
    device = self->super.super.super._device;
    if (device != (MTLToolsDevice *)objc_msgSend(a3, "device"))
      _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
  v6.receiver = self;
  v6.super_class = (Class)MTLDebugBlitCommandEncoder;
  -[MTLToolsBlitCommandEncoder invalidateCompressedTexture:](&v6, sel_invalidateCompressedTexture_, a3);
}

- (void)invalidateCompressedTexture:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5
{
  MTLToolsDevice *device;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  objc_super v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = 0;
  v15 = 0u;
  v16 = 0u;
  v14 = 0u;
  _MTLMessageContextBegin_();
  if (!a3)
    _MTLMessageContextPush_();
  if (!(_QWORD)v14)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      _MTLMessageContextPush_();
    device = self->super.super.super._device;
    if (device != (MTLToolsDevice *)objc_msgSend(a3, "device"))
      _MTLMessageContextPush_();
    if (objc_msgSend(a3, "mipmapLevelCount") <= a5)
    {
      v11 = a5;
      v12 = objc_msgSend(a3, "mipmapLevelCount");
      _MTLMessageContextPush_();
    }
    v10 = objc_msgSend(a3, "numFaces", v11, v12);
    if (objc_msgSend(a3, "arrayLength") * v10 <= a4)
    {
      objc_msgSend(a3, "numFaces");
      objc_msgSend(a3, "arrayLength");
      _MTLMessageContextPush_();
    }
  }
  _MTLMessageContextEnd();
  v13.receiver = self;
  v13.super_class = (Class)MTLDebugBlitCommandEncoder;
  -[MTLToolsBlitCommandEncoder invalidateCompressedTexture:slice:level:](&v13, sel_invalidateCompressedTexture_slice_level_, a3, a4, a5);
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
