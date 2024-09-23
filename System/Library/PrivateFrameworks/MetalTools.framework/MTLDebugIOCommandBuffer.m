@implementation MTLDebugIOCommandBuffer

- (void)internalValidateEvent:(id)a3
{
  uint64_t v5;

  -[MTLToolsObject device](self, "device", 0, 0, 0, 0, 0, 0, 0);
  _MTLMessageContextBegin_();
  if (!a3)
    goto LABEL_7;
  if ((objc_msgSend(a3, "conformsToProtocol:", &unk_255C69D18) & 1) == 0)
    _MTLMessageContextPush_();
  if (objc_msgSend(a3, "conformsToProtocol:", &unk_255C69D18))
  {
    v5 = *(_QWORD *)&self->MTLToolsIOCommandBuffer_opaque[24];
    if (v5 != objc_msgSend(a3, "device"))
LABEL_7:
      _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
}

- (void)addCompletedHandler:(id)a3
{
  objc_super v5;

  if (!a3)
    MTLReportFailure();
  v5.receiver = self;
  v5.super_class = (Class)MTLDebugIOCommandBuffer;
  -[MTLToolsIOCommandBuffer addCompletedHandler:](&v5, sel_addCompletedHandler_, a3);
}

- (void)encodeWaitForEvent:(id)a3 value:(unint64_t)a4
{
  objc_super v7;

  -[MTLDebugIOCommandBuffer internalValidateEvent:](self, "internalValidateEvent:");
  v7.receiver = self;
  v7.super_class = (Class)MTLDebugIOCommandBuffer;
  -[MTLToolsIOCommandBuffer encodeWaitForEvent:value:](&v7, sel_encodeWaitForEvent_value_, a3, a4);
}

- (void)encodeSignalEvent:(id)a3 value:(unint64_t)a4
{
  objc_super v7;

  -[MTLDebugIOCommandBuffer internalValidateEvent:](self, "internalValidateEvent:");
  v7.receiver = self;
  v7.super_class = (Class)MTLDebugIOCommandBuffer;
  -[MTLToolsIOCommandBuffer encodeSignalEvent:value:](&v7, sel_encodeSignalEvent_value_, a3, a4);
}

- (void)waitForEvent:(id)a3 value:(unint64_t)a4
{
  objc_super v7;

  -[MTLDebugIOCommandBuffer internalValidateEvent:](self, "internalValidateEvent:");
  v7.receiver = self;
  v7.super_class = (Class)MTLDebugIOCommandBuffer;
  -[MTLToolsIOCommandBuffer encodeWaitForEvent:value:](&v7, sel_encodeWaitForEvent_value_, a3, a4);
}

- (void)signalEvent:(id)a3 value:(unint64_t)a4
{
  objc_super v7;

  -[MTLDebugIOCommandBuffer internalValidateEvent:](self, "internalValidateEvent:");
  v7.receiver = self;
  v7.super_class = (Class)MTLDebugIOCommandBuffer;
  -[MTLToolsIOCommandBuffer encodeSignalEvent:value:](&v7, sel_encodeSignalEvent_value_, a3, a4);
}

- (void)internalValidateLoadBuffer:(id)a3 offset:(unint64_t)a4 size:(unint64_t)a5 sourceHandle:(id)a6 sourceHandleOffset:(unint64_t)a7
{
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;

  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if (a3)
  {
    if ((objc_msgSend(a3, "conformsToProtocol:", &unk_255C54558) & 1) == 0)
      _MTLMessageContextPush_();
    if (!objc_msgSend(a3, "conformsToProtocol:", &unk_255C54558)
      || (v13 = *(_QWORD *)&self->MTLToolsIOCommandBuffer_opaque[24], v13 == objc_msgSend(a3, "device")))
    {
      if (a6)
        goto LABEL_7;
LABEL_22:
      _MTLMessageContextPush_();
      goto LABEL_11;
    }
  }
  _MTLMessageContextPush_();
  if (!a6)
    goto LABEL_22;
LABEL_7:
  if ((objc_msgSend(a6, "conformsToProtocol:", &unk_255C746B8) & 1) == 0)
    _MTLMessageContextPush_();
  if (objc_msgSend(a6, "conformsToProtocol:", &unk_255C746B8))
  {
    v14 = *(_QWORD *)&self->MTLToolsIOCommandBuffer_opaque[24];
    if (v14 != objc_msgSend(a6, "device"))
      goto LABEL_22;
  }
LABEL_11:
  v15 = a5 + a4;
  if (v15 > objc_msgSend((id)objc_msgSend(a3, "baseObject"), "length"))
  {
    v16 = v15;
    v18 = objc_msgSend((id)objc_msgSend(a3, "baseObject"), "length");
    _MTLMessageContextPush_();
    if (a5)
      goto LABEL_13;
  }
  else if (a5)
  {
    goto LABEL_13;
  }
  v16 = 0;
  _MTLMessageContextPush_();
LABEL_13:
  if (objc_msgSend((id)objc_msgSend(a6, "baseObject", v16, v18), "length") < a7)
  {
    v17 = a7;
    v19 = objc_msgSend((id)objc_msgSend(a6, "baseObject"), "length");
    _MTLMessageContextPush_();
  }
  if (a7 + a5 > objc_msgSend((id)objc_msgSend(a6, "baseObject", v17, v19), "length"))
  {
    objc_msgSend((id)objc_msgSend(a6, "baseObject"), "length");
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
}

- (void)internalValidateLoadBytes:(void *)a3 size:(unint64_t)a4 sourceHandle:(id)a5 sourceHandleOffset:(unint64_t)a6
{
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;

  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if (a3)
  {
    if (!a5)
      goto LABEL_14;
  }
  else
  {
    _MTLMessageContextPush_();
    if (!a5)
      goto LABEL_14;
  }
  if ((objc_msgSend(a5, "conformsToProtocol:", &unk_255C746B8) & 1) == 0)
    _MTLMessageContextPush_();
  if (objc_msgSend(a5, "conformsToProtocol:", &unk_255C746B8))
  {
    v11 = *(_QWORD *)&self->MTLToolsIOCommandBuffer_opaque[24];
    if (v11 != objc_msgSend(a5, "device"))
    {
LABEL_14:
      _MTLMessageContextPush_();
      if (a4)
        goto LABEL_8;
      goto LABEL_15;
    }
  }
  if (a4)
    goto LABEL_8;
LABEL_15:
  v12 = 0;
  _MTLMessageContextPush_();
LABEL_8:
  if (objc_msgSend((id)objc_msgSend(a5, "baseObject", v12), "length") < a6)
  {
    v13 = a6;
    v14 = objc_msgSend((id)objc_msgSend(a5, "baseObject"), "length");
    _MTLMessageContextPush_();
  }
  if (a6 + a4 > objc_msgSend((id)objc_msgSend(a5, "baseObject", v13, v14), "length"))
  {
    objc_msgSend((id)objc_msgSend(a5, "baseObject"), "length");
    _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
}

- (void)loadBytes:(void *)a3 size:(unint64_t)a4 sourceHandle:(id)a5 sourceHandleOffset:(unint64_t)a6
{
  objc_super v11;

  -[MTLDebugIOCommandBuffer internalValidateLoadBytes:size:sourceHandle:sourceHandleOffset:](self, "internalValidateLoadBytes:size:sourceHandle:sourceHandleOffset:");
  v11.receiver = self;
  v11.super_class = (Class)MTLDebugIOCommandBuffer;
  -[MTLToolsIOCommandBuffer loadBytes:size:sourceHandle:sourceHandleOffset:](&v11, sel_loadBytes_size_sourceHandle_sourceHandleOffset_, a3, a4, a5, a6);
}

- (void)loadBuffer:(id)a3 offset:(unint64_t)a4 size:(unint64_t)a5 handle:(id)a6 handleOffset:(unint64_t)a7
{
  objc_super v13;

  -[MTLDebugIOCommandBuffer internalValidateLoadBuffer:offset:size:sourceHandle:sourceHandleOffset:](self, "internalValidateLoadBuffer:offset:size:sourceHandle:sourceHandleOffset:");
  v13.receiver = self;
  v13.super_class = (Class)MTLDebugIOCommandBuffer;
  -[MTLToolsIOCommandBuffer loadBuffer:offset:size:sourceHandle:sourceHandleOffset:](&v13, sel_loadBuffer_offset_size_sourceHandle_sourceHandleOffset_, a3, a4, a5, a6, a7);
}

- (void)loadBuffer:(id)a3 offset:(unint64_t)a4 size:(unint64_t)a5 sourceHandle:(id)a6 sourceHandleOffset:(unint64_t)a7
{
  objc_super v13;

  -[MTLDebugIOCommandBuffer internalValidateLoadBuffer:offset:size:sourceHandle:sourceHandleOffset:](self, "internalValidateLoadBuffer:offset:size:sourceHandle:sourceHandleOffset:");
  v13.receiver = self;
  v13.super_class = (Class)MTLDebugIOCommandBuffer;
  -[MTLToolsIOCommandBuffer loadBuffer:offset:size:sourceHandle:sourceHandleOffset:](&v13, sel_loadBuffer_offset_size_sourceHandle_sourceHandleOffset_, a3, a4, a5, a6, a7);
}

- (void)internalValidateLoadTexture:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5 size:(id *)a6 sourceBytesPerRow:(unint64_t)a7 sourceBytesPerImage:(unint64_t)a8 destinationOrigin:(id *)a9 sourceHandle:(id)a10 sourceHandleOffset:(unint64_t)a11
{
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t var0;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t var1;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t var2;
  uint64_t v34;
  uint64_t v35;

  -[MTLToolsObject device](self, "device", a3, a4, a5, a6, a7, a8);
  _MTLMessageContextBegin_();
  if (a3)
  {
    if ((objc_msgSend(a3, "conformsToProtocol:", &unk_255C6E6C0) & 1) == 0)
      _MTLMessageContextPush_();
    if (!objc_msgSend(a3, "conformsToProtocol:", &unk_255C6E6C0)
      || (v16 = *(_QWORD *)&self->MTLToolsIOCommandBuffer_opaque[24], v16 == objc_msgSend(a3, "device")))
    {
      if (a10)
        goto LABEL_7;
LABEL_55:
      _MTLMessageContextPush_();
      goto LABEL_13;
    }
  }
  _MTLMessageContextPush_();
  if (!a10)
    goto LABEL_55;
LABEL_7:
  if ((objc_msgSend(a10, "conformsToProtocol:", &unk_255C746B8) & 1) == 0)
    _MTLMessageContextPush_();
  if (objc_msgSend(a10, "conformsToProtocol:", &unk_255C746B8))
  {
    v17 = *(_QWORD *)&self->MTLToolsIOCommandBuffer_opaque[24];
    if (v17 != objc_msgSend(a10, "device"))
      _MTLMessageContextPush_();
    if (objc_msgSend(a3, "storageMode") == 3)
      goto LABEL_55;
  }
LABEL_13:
  if (!(a6->var1 * a6->var0 * a6->var2))
  {
    var2 = a6->var2;
    v35 = 0;
    var0 = a6->var0;
    var1 = a6->var1;
    _MTLMessageContextPush_();
  }
  if (objc_msgSend((id)objc_msgSend(a10, "baseObject", var0, var1, var2, v35), "length") < a11)
  {
    v24 = a11;
    v29 = objc_msgSend((id)objc_msgSend(a10, "baseObject"), "length");
    _MTLMessageContextPush_();
  }
  if (objc_msgSend(a3, "isFramebufferOnly", v24, v29))
    _MTLMessageContextPush_();
  if (objc_msgSend(a3, "mipmapLevelCount") <= a5)
  {
    v25 = a5;
    v30 = objc_msgSend(a3, "mipmapLevelCount");
    _MTLMessageContextPush_();
  }
  v18 = objc_msgSend(a3, "numFaces", v25, v30);
  if (objc_msgSend(a3, "arrayLength") * v18 <= a4)
  {
    v22 = objc_msgSend(a3, "numFaces");
    v26 = a4;
    v31 = objc_msgSend(a3, "arrayLength") * v22;
    _MTLMessageContextPush_();
  }
  v19 = (uint64_t *)((char *)a3 + 72);
  objc_msgSend(a3, "pixelFormat", v26, v31);
  objc_msgSend(a3, "width");
  objc_msgSend(a3, "height");
  objc_msgSend(a3, "depth");
  objc_msgSend(a3, "sampleCount");
  MTLGetTextureLevelInfoForDevice();
  _MTLAdjustMTLSize();
  v20 = a9->var0;
  if ((*((_BYTE *)a3 + 81) & 4) != 0)
  {
    if (v20)
    {
      v27 = a9->var0;
      v32 = 0;
      _MTLMessageContextPush_();
    }
    if (a9->var1)
    {
      v27 = a9->var1;
      v32 = 0;
      _MTLMessageContextPush_();
    }
    if (a9->var2)
    {
      v27 = a9->var2;
      v32 = 0;
      goto LABEL_57;
    }
  }
  else
  {
    v21 = a6->var0 + v20;
    if (v21)
    {
      v27 = v21;
      v32 = 0;
      _MTLMessageContextPush_();
    }
    if (a6->var1 + a9->var1)
    {
      v27 = a6->var1 + a9->var1;
      v32 = 0;
      _MTLMessageContextPush_();
    }
    if (a6->var2 + a9->var2)
    {
      v27 = a6->var2 + a9->var2;
      v32 = 0;
LABEL_57:
      _MTLMessageContextPush_();
    }
  }
  if ((*((_BYTE *)a3 + 81) & 4) != 0)
  {
    if (a9->var0 % *((_QWORD *)a3 + 13))
    {
      v32 = *v19;
      v34 = *((_QWORD *)a3 + 13);
      v27 = a9->var0;
      _MTLMessageContextPush_();
    }
    if (a9->var1 % *((_QWORD *)a3 + 14))
    {
      v32 = *v19;
      v34 = *((_QWORD *)a3 + 14);
      v27 = a9->var1;
      _MTLMessageContextPush_();
    }
    if (a9->var2 % *((_QWORD *)a3 + 15))
    {
      v32 = *v19;
      v34 = *((_QWORD *)a3 + 15);
      v27 = a9->var2;
      _MTLMessageContextPush_();
    }
    if (0uLL % *((_QWORD *)a3 + 13))
    {
      v32 = *v19;
      v34 = *((_QWORD *)a3 + 13);
      v27 = 0;
      _MTLMessageContextPush_();
    }
    if (0uLL % *((_QWORD *)a3 + 14))
    {
      v32 = *v19;
      v34 = *((_QWORD *)a3 + 14);
      v27 = 0;
      _MTLMessageContextPush_();
    }
    if (0uLL % *((_QWORD *)a3 + 15))
    {
      v32 = *v19;
      v34 = *((_QWORD *)a3 + 15);
      v27 = 0;
      _MTLMessageContextPush_();
    }
  }
  if ((*((_BYTE *)a3 + 81) & 4) != 0)
  {
    if (*((_QWORD *)a3 + 15) != 1)
      _MTLMessageContextPush_();
    if (objc_msgSend(a3, "textureType", v27, v32, v34) == 9)
      _MTLMessageContextPush_();
  }
  _MTLMessageContextEnd();
}

- (void)loadTexture:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5 size:(id *)a6 bytesPerRow:(unint64_t)a7 bytesPerImage:(unint64_t)a8 dstOrigin:(id *)a9 handle:(id)a10 handleOffset:(unint64_t)a11
{
  objc_super v18;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v19;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v20;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v21;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v22;

  v22 = *a6;
  v21 = *a9;
  -[MTLDebugIOCommandBuffer internalValidateLoadTexture:slice:level:size:sourceBytesPerRow:sourceBytesPerImage:destinationOrigin:sourceHandle:sourceHandleOffset:](self, "internalValidateLoadTexture:slice:level:size:sourceBytesPerRow:sourceBytesPerImage:destinationOrigin:sourceHandle:sourceHandleOffset:", a3, a4, a5, &v22, &v21, a10, a11);
  v20 = *a6;
  v19 = *a9;
  v18.receiver = self;
  v18.super_class = (Class)MTLDebugIOCommandBuffer;
  -[MTLToolsIOCommandBuffer loadTexture:slice:level:size:sourceBytesPerRow:sourceBytesPerImage:destinationOrigin:sourceHandle:sourceHandleOffset:](&v18, sel_loadTexture_slice_level_size_sourceBytesPerRow_sourceBytesPerImage_destinationOrigin_sourceHandle_sourceHandleOffset_, a3, a4, a5, &v20, a7, a8, &v19, a10, a11);
}

- (void)loadTexture:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5 size:(id *)a6 sourceBytesPerRow:(unint64_t)a7 sourceBytesPerImage:(unint64_t)a8 destinationOrigin:(id *)a9 sourceHandle:(id)a10 sourceHandleOffset:(unint64_t)a11
{
  objc_super v18;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v19;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v20;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v21;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v22;

  v22 = *a6;
  v21 = *a9;
  -[MTLDebugIOCommandBuffer internalValidateLoadTexture:slice:level:size:sourceBytesPerRow:sourceBytesPerImage:destinationOrigin:sourceHandle:sourceHandleOffset:](self, "internalValidateLoadTexture:slice:level:size:sourceBytesPerRow:sourceBytesPerImage:destinationOrigin:sourceHandle:sourceHandleOffset:", a3, a4, a5, &v22, &v21, a10, a11);
  v20 = *a6;
  v19 = *a9;
  v18.receiver = self;
  v18.super_class = (Class)MTLDebugIOCommandBuffer;
  -[MTLToolsIOCommandBuffer loadTexture:slice:level:size:sourceBytesPerRow:sourceBytesPerImage:destinationOrigin:sourceHandle:sourceHandleOffset:](&v18, sel_loadTexture_slice_level_size_sourceBytesPerRow_sourceBytesPerImage_destinationOrigin_sourceHandle_sourceHandleOffset_, a3, a4, a5, &v20, a7, a8, &v19, a10, a11);
}

- (void)commit
{
  objc_super v3[4];
  uint64_t v4;

  v4 = 0;
  memset(&v3[1], 0, 48);
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if (objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "isCommitted"))
    _MTLMessageContextPush_();
  _MTLMessageContextEnd();
  v3[0].receiver = self;
  v3[0].super_class = (Class)MTLDebugIOCommandBuffer;
  -[objc_super commit](v3, sel_commit);
}

- (void)tryCancel
{
  objc_super v3[4];
  uint64_t v4;

  v4 = 0;
  memset(&v3[1], 0, 48);
  -[MTLToolsObject device](self, "device");
  _MTLMessageContextBegin_();
  if ((objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "isCommitted") & 1) == 0)
    _MTLMessageContextPush_();
  _MTLMessageContextEnd();
  v3[0].receiver = self;
  v3[0].super_class = (Class)MTLDebugIOCommandBuffer;
  -[objc_super tryCancel](v3, sel_tryCancel);
}

@end
