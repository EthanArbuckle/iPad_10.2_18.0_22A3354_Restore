@implementation AGXA10FamilyBlitContext

- (AGXA10FamilyBlitContext)initWithCommandBuffer:(id)a3 descriptor:(id)a4
{
  id v6;
  void *v7;
  _QWORD *v8;
  uint64_t v10[6];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AGXA10FamilyBlitContext;
  v6 = -[IOGPUMetalCommandEncoder initWithCommandBuffer:](&v11, sel_initWithCommandBuffer_);
  if (v6)
  {
    v7 = malloc_type_calloc(0x1950uLL, 1uLL, 0x699AC894uLL);
    *((_QWORD *)v6 + 11) = v7;
    if (v7)
    {
      v10[2] = objc_msgSend(a3, "commandBufferStorage", objc_msgSend(a3, "device"), a3);
      v10[3] = (uint64_t)v6;
      v10[4] = objc_msgSend(a3, "globalTraceObjectID");
      v10[5] = objc_msgSend(v6, "globalTraceObjectID");
      v8 = (_QWORD *)AGX::BlitDispatchContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::BlitDispatchContext(*((_QWORD *)v6 + 11), v10, (MTLBlitPassDescriptor *)a4, 0);
      *v8 = &off_2503FFFE8;
      v8[808] = v8[183];
      v8[809] = 0;
    }
    else
    {
      objc_msgSend(v6, "endEncoding");

      return 0;
    }
  }
  return (AGXA10FamilyBlitContext *)v6;
}

- (id)reInitWithCommandBuffer:(id)a3
{
  objc_class *v5;

  v5 = (objc_class *)a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BDDD860]) = v5;
  -[objc_class setCurrentCommandEncoder:](v5, "setCurrentCommandEncoder:", self);
  objc_msgSend(a3, "setPreviousBlitCommandEncoder:", 0);
  return self;
}

- (void)dealloc
{
  _QWORD *impl;
  objc_super v4;

  impl = self->_impl;
  if (impl)
  {
    AGX::BlitDispatchContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::~BlitDispatchContext(impl);
    free(self->_impl);
    self->_impl = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)AGXA10FamilyBlitContext;
  -[_MTLCommandEncoder dealloc](&v4, sel_dealloc);
}

- (void)deferredEndEncoding
{
  void *impl;

  impl = self->_impl;
  if (impl)
  {
    AGX::BlitDispatchContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::commit((uint64_t)impl);
    AGX::BlitDispatchContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::~BlitDispatchContext((_QWORD *)self->_impl);
    free(self->_impl);
    self->_impl = 0;
  }
}

- (void)endEncoding
{
  uint64_t v3;
  uint64_t v4;
  unint64_t *v5;
  _QWORD *impl;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  objc_super v12;

  if (self->_impl)
  {
    v3 = (int)*MEMORY[0x24BDDD860];
    v4 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v3), "device");
    v5 = (unint64_t *)(v4 + 816);
    impl = self->_impl;
    v7 = impl[228];
    v8 = impl[229];
    do
      v9 = __ldaxr(v5);
    while (__stlxr(v9 | v7, v5));
    v10 = (unint64_t *)(v4 + 824);
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 | v8, v10));
    if ((objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v3), "disableDeferredEndEncoding") & 1) != 0)
      -[AGXA10FamilyBlitContext deferredEndEncoding](self, "deferredEndEncoding");
    else
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v3), "setPreviousBlitCommandEncoder:", self);
  }
  v12.receiver = self;
  v12.super_class = (Class)AGXA10FamilyBlitContext;
  -[IOGPUMetalCommandEncoder endEncoding](&v12, sel_endEncoding);
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11
{
  uint64_t *impl;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v18;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  int v25;
  unsigned int v26;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v29;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v30;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v31;
  int64x2_t v32;
  unint64_t v33;
  int64x2_t v34;
  unint64_t v35;
  int64x2_t v36;
  unint64_t var2;

  impl = (uint64_t *)self->_impl;
  v12 = *((_DWORD *)impl + 383);
  *((_DWORD *)impl + 384) = v12;
  v31 = *a11;
  v30 = *a6;
  v29 = *a7;
  v13 = *((_QWORD *)a3 + 67);
  v14 = *((_QWORD *)a8 + 67);
  v15 = *(_QWORD *)(v13 + 32);
  v16 = *(_QWORD *)(v14 + 32);
  v18 = v15 == 260 && v16 == 261;
  v20 = v16 == 260 && v15 == 261;
  v21 = *(_DWORD *)(*(_QWORD *)(v13 + 208) + 24);
  v22 = *(_DWORD *)(*(_QWORD *)(v14 + 208) + 24);
  if (v21 >= v22)
    v23 = v22;
  else
    v23 = v21;
  if (v23)
  {
    v25 = a5;
    v26 = a4;
    do
    {
      v36 = *(int64x2_t *)&v31.var0;
      var2 = v31.var2;
      v34 = *(int64x2_t *)&v30.var0;
      v35 = v30.var2;
      v32 = *(int64x2_t *)&v29.var0;
      v33 = v29.var2;
      AGX::BlitContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::copyTextureToTextureImpl(impl, (uint64_t)a8, v20++, a9, a10, &v36, (uint64_t)a3, v18++, v26, v25, &v34, &v32);
      --v23;
    }
    while (v23);
    impl = (uint64_t *)self->_impl;
    v12 = *((_DWORD *)impl + 383);
  }
  *((_DWORD *)impl + 385) = v12;
}

- (void)copyFromBuffer:(id)a3 sourceOffset:(unint64_t)a4 sourceBytesPerRow:(unint64_t)a5 sourceBytesPerImage:(unint64_t)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11
{
  uint64_t *impl;
  int64x2_t v13;
  unint64_t v14;
  int64x2_t v15;
  unint64_t var2;

  impl = (uint64_t *)self->_impl;
  *((_DWORD *)impl + 384) = *((_DWORD *)impl + 383);
  v15 = *(int64x2_t *)&a11->var0;
  var2 = a11->var2;
  v13 = *(int64x2_t *)&a7->var0;
  v14 = a7->var2;
  AGX::BlitContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::copyBufferToTexture(impl, (uint64_t)a8, a9, a10, &v15, &v13, (char *)a3, a4, a5, a6, 0);
  *((_DWORD *)self->_impl + 385) = *((_DWORD *)self->_impl + 383);
}

- (void)copyFromBuffer:(id)a3 sourceOffset:(unint64_t)a4 toBuffer:(id)a5 destinationOffset:(unint64_t)a6 size:(unint64_t)a7
{
  uint64_t *impl;

  impl = (uint64_t *)self->_impl;
  *((_DWORD *)impl + 384) = *((_DWORD *)impl + 383);
  AGX::BlitContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::copyBufferToBuffer(impl, (char *)a5, a6, (char *)a3, a4, a7);
  *((_DWORD *)self->_impl + 385) = *((_DWORD *)self->_impl + 383);
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toBuffer:(id)a8 destinationOffset:(unint64_t)a9 destinationBytesPerRow:(unint64_t)a10 destinationBytesPerImage:(unint64_t)a11
{
  uint64_t *impl;
  int64x2_t v13;
  unint64_t v14;
  int64x2_t v15;
  unint64_t var2;

  impl = (uint64_t *)self->_impl;
  *((_DWORD *)impl + 384) = *((_DWORD *)impl + 383);
  v15 = *(int64x2_t *)&a6->var0;
  var2 = a6->var2;
  v13 = *(int64x2_t *)&a7->var0;
  v14 = a7->var2;
  AGX::BlitContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::copyTextureToBuffer(impl, (char *)a8, a9, a10, a11, (uint64_t)a3, a4, a5, &v15, &v13, 0);
  *((_DWORD *)self->_impl + 385) = *((_DWORD *)self->_impl + 383);
}

- (void)generateMipmapsForTexture:(id)a3
{
  _DWORD *impl;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  unsigned int v13;
  unsigned int v14;
  int v15;
  unsigned int i;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  int v24;
  unsigned int v25;
  int v26;
  BOOL v27;
  int v28;
  _QWORD *v29;
  uint64_t v30;
  unsigned int v31;
  unsigned int v32;
  AGX::G9::TextureFormatTable *v33;
  int v34;
  _DWORD v35[112];
  _BYTE v36[448];
  _BYTE v37[448];
  _QWORD v38[3];

  v38[1] = *MEMORY[0x24BDAC8D0];
  (*(_QWORD **)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BDDD860]))[85] |= 4uLL;
  impl = self->_impl;
  v4 = impl[383];
  impl[384] = v4;
  v5 = *((_QWORD *)a3 + 67);
  if (!*(_QWORD *)(v5 + 168))
  {
    v6 = *(_QWORD *)(v5 + 32);
    if ((unint64_t)(v6 - 624) >= 4
      && (unint64_t)(v6 - 550) >= 2
      && (*(_BYTE *)(*(_QWORD *)(v5 + 208) + 60) & 3) != 0)
    {
      v33 = *(AGX::G9::TextureFormatTable **)(v5 + 32);
      v31 = *(_DWORD *)(v5 + 180);
      v32 = *(_DWORD *)(v5 + 176);
      v30 = *(_QWORD *)(v5 + 184);
      v23 = *(_QWORD *)(v5 + 24);
      if (v23 == 7)
        v7 = 7;
      else
        v7 = 2;
      v25 = *(_DWORD *)(v5 + 108) - 1;
      v9 = *(_QWORD *)(v5 + 152);
      v8 = *(_QWORD *)(v5 + 160);
      v38[0] = a3;
      if (*(_DWORD *)*MEMORY[0x24BE516B0])
        IOGPUDeviceTraceEvent();
      if (v25)
      {
        v10 = 0;
        v27 = 0;
        v29 = (_QWORD *)(v5 + 380);
        v24 = 1;
        do
        {
          v28 = v10 + 1;
          v11 = *(_DWORD *)(v5 + 144) + v10 + 1;
          if (*(_DWORD *)(v5 + 136) >> (*(_BYTE *)(v5 + 144) + v10 + 1) <= 1u)
            v12 = 1;
          else
            v12 = *(_DWORD *)(v5 + 136) >> (*(_BYTE *)(v5 + 144) + v10 + 1);
          if (v23 == 7)
          {
            v26 = v10 + 2;
          }
          else
          {
            v13 = *(_DWORD *)(v5 + 132) >> v11;
            if (v13 <= 1)
              LOBYTE(v13) = 1;
            v14 = *(_DWORD *)(v5 + 128) >> v11;
            if (v14 <= 1)
              LOBYTE(v14) = 1;
            v26 = v10 + 2;
            v27 = ((v14 | v13) & 1) == 0 && (int)v10 + 2 < v25;
            if (v27)
              v15 = 2;
            else
              v15 = 1;
            v24 = v15;
          }
          for (i = 0; ; ++i)
          {
            v17 = *v29 & 0xFF00;
            if ((*v29 & 0x10000) != 0 || v17 == 1024)
              break;
            if (i)
              goto LABEL_12;
LABEL_36:
            v19 = v10;
            AGX::Texture<(AGXTextureMemoryLayout)1,AGX::G9::Encoders,AGX::G9::Classes>::createTextureViewForBlit((uint64_t)v37, v5, v7, v33, *(_QWORD *)(v5 + 40), *(_DWORD *)(v5 + 308), i, v10, 0, 0, v9, v8, 0, 0, __SPAIR64__(v31, v32), v30, SHIDWORD(v30), 0);
            AGX::Texture<(AGXTextureMemoryLayout)1,AGX::G9::Encoders,AGX::G9::Classes>::createTextureViewForBlit((uint64_t)v36, v5, v7, v33, *(_QWORD *)(v5 + 40), *(_DWORD *)(v5 + 308), i, v28, 0, 0, v9, v8, 0, 0, __SPAIR64__(v31, v32), v30, SHIDWORD(v30), 0);
            if (v27)
            {
              AGX::Texture<(AGXTextureMemoryLayout)1,AGX::G9::Encoders,AGX::G9::Classes>::createTextureViewForBlit((uint64_t)v35, v5, v7, v33, *(_QWORD *)(v5 + 40), *(_DWORD *)(v5 + 308), i, v26, 0, 0, v9, v8, 0, 0, __SPAIR64__(v31, v32), v30, SHIDWORD(v30), 0);
              v20 = 0;
              do
              {
                v34 = 1;
                AGX::BlitDispatchContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::renderTexture((uint64_t)impl, (uint64_t)v38, (uint64_t)v36, (uint64_t)v35, (uint64_t)v38, (uint64_t)v37, (uint64_t)&v34, v20, 0, 0);
                v20 = (v20 + 1);
              }
              while (v12 != (_DWORD)v20);
            }
            else
            {
              v21 = 0;
              do
              {
                v35[0] = 1;
                AGX::BlitDispatchContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::renderTexture((uint64_t)impl, (uint64_t)v38, (uint64_t)v36, 0, (uint64_t)v38, (uint64_t)v37, (uint64_t)v35, v21, 0, 0);
                v21 = (v21 + 1);
              }
              while (v12 != (_DWORD)v21);
            }
            v10 = v19;
          }
          if (v17 == 1024)
            v18 = 6 * *(_DWORD *)(v5 + 376);
          else
            v18 = *(_DWORD *)(v5 + 376);
          if (i < v18)
            goto LABEL_36;
LABEL_12:
          v10 = (v24 + v10);
        }
        while (v10 < v25);
      }
      impl = self->_impl;
      v4 = impl[383];
    }
  }
  impl[385] = v4;
}

- (void)fillBuffer:(id)a3 range:(_NSRange)a4 value:(unsigned __int8)a5
{
  uint64_t *impl;
  unsigned __int8 v7;

  impl = (uint64_t *)self->_impl;
  *((_DWORD *)impl + 384) = *((_DWORD *)impl + 383);
  v7 = a5;
  AGX::BlitContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::fillBuffer(impl, (char *)a3, a4.location, a4.length, &v7, 1uLL);
  *((_DWORD *)self->_impl + 385) = *((_DWORD *)self->_impl + 383);
}

- (void)copyFromBuffer:(id)a3 sourceOffset:(unint64_t)a4 sourceBytesPerRow:(unint64_t)a5 sourceBytesPerImage:(unint64_t)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11 options:(unint64_t)a12
{
  uint64_t *impl;
  int64x2_t v14;
  unint64_t v15;
  int64x2_t v16;
  unint64_t var2;

  impl = (uint64_t *)self->_impl;
  *((_DWORD *)impl + 384) = *((_DWORD *)impl + 383);
  v16 = *(int64x2_t *)&a11->var0;
  var2 = a11->var2;
  v14 = *(int64x2_t *)&a7->var0;
  v15 = a7->var2;
  AGX::BlitContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::copyBufferToTexture(impl, (uint64_t)a8, a9, a10, &v16, &v14, (char *)a3, a4, a5, a6, a12);
  *((_DWORD *)self->_impl + 385) = *((_DWORD *)self->_impl + 383);
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toBuffer:(id)a8 destinationOffset:(unint64_t)a9 destinationBytesPerRow:(unint64_t)a10 destinationBytesPerImage:(unint64_t)a11 options:(unint64_t)a12
{
  uint64_t *impl;
  int64x2_t v14;
  unint64_t v15;
  int64x2_t v16;
  unint64_t var2;

  impl = (uint64_t *)self->_impl;
  *((_DWORD *)impl + 384) = *((_DWORD *)impl + 383);
  v16 = *(int64x2_t *)&a6->var0;
  var2 = a6->var2;
  v14 = *(int64x2_t *)&a7->var0;
  v15 = a7->var2;
  AGX::BlitContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::copyTextureToBuffer(impl, (char *)a8, a9, a10, a11, (uint64_t)a3, a4, a5, &v16, &v14, a12);
  *((_DWORD *)self->_impl + 385) = *((_DWORD *)self->_impl + 383);
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11 options:(unint64_t)a12
{
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v12;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v13;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v14;

  v14 = *a6;
  v13 = *a7;
  v12 = *a11;
  -[AGXA10FamilyBlitContext copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:](self, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", a3, a4, a5, &v14, &v13, a8, a9, a10, &v12);
}

- (void)fillBuffer:(id)a3 range:(_NSRange)a4 pattern4:(unsigned int)a5
{
  uint64_t *impl;
  unsigned int v7;

  impl = (uint64_t *)self->_impl;
  *((_DWORD *)impl + 384) = *((_DWORD *)impl + 383);
  v7 = a5;
  AGX::BlitContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::fillBuffer(impl, (char *)a3, a4.location, a4.length, (unsigned __int8 *)&v7, 4uLL);
  *((_DWORD *)self->_impl + 385) = *((_DWORD *)self->_impl + 383);
}

- (void)fillTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 region:(id *)a6 bytes:(const void *)a7 length:(unint64_t)a8
{
  uint64_t *impl;
  __int128 v10;
  _OWORD v11[3];

  impl = (uint64_t *)self->_impl;
  *((_DWORD *)impl + 384) = *((_DWORD *)impl + 383);
  v10 = *(_OWORD *)&a6->var0.var2;
  v11[0] = *(_OWORD *)&a6->var0.var0;
  v11[1] = v10;
  v11[2] = *(_OWORD *)&a6->var1.var1;
  AGX::BlitContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::fillTexture(impl, (uint64_t)a3, a4, a5, v11, (unsigned __int8 *)a7, a8);
  *((_DWORD *)self->_impl + 385) = *((_DWORD *)self->_impl + 383);
}

- (void)copyFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 toTexture:(id)a6 destinationSlice:(unint64_t)a7 destinationLevel:(unint64_t)a8 sliceCount:(unint64_t)a9 levelCount:(unint64_t)a10
{
  __n128 v10;
  AGXA10FamilyBlitContext *v13;
  _DWORD *impl;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  _BOOL4 v22;
  _BOOL4 v24;
  void *v25;
  unsigned int v26;
  int i;
  int v28;
  int v29;
  int v30;
  uint64_t v31;
  __n128 *v32;
  BOOL v33;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  __n128 **v42;
  int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  int v48;
  int v49;
  __n128 *v50;
  unint64_t v51;
  uint64_t v52;
  __n128 v53;
  __n128 *v54;
  __n128 *v55;
  __n128 *v56;
  __n128 v57;
  unint64_t v58;
  char *v59;
  uint64_t v60;
  int v61;
  int v62;
  int v63;
  int v64;
  int v65;
  int v66;
  int v67;
  unint64_t v68;
  uint64_t v69;
  _QWORD *v70;
  _QWORD *v71;
  _QWORD *v72;
  __int128 v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  _QWORD *v78;
  id *v79;
  __int128 v80;
  __int128 v81;
  _DWORD *v82;
  AGXA10FamilyBlitContext *v84;
  AGXA10FamilyBlitContext *v85;
  int v86;
  int v87;
  int v88;
  _BOOL4 v89;
  _BOOL4 v90;
  unsigned int v91;
  int v92;
  int v93;
  int v94;
  int v95;
  id v96;
  uint64_t v97;
  uint64_t *(*v98)(uint64_t, __int128 *);
  void *v99;
  id v100;
  id v101;
  _DWORD *v102;
  id v103;
  uint64_t v104;
  void (*v105)(id *, id *, id *);
  void *v106;
  id v107;
  id v108;
  void *v109;
  void *v110;
  id *v111;
  id *v112;
  _DWORD *v113;
  __int16 v114;
  id v115;
  id *v116;
  uint64_t v117;
  __n128 (*v118)(__n128 *, __n128 *);
  void (*v119)(uint64_t);
  void *v120;
  void *__p;
  void *v122;
  char *v123;
  _QWORD v124[2];
  void (*v125)(uint64_t, uint64_t, unsigned int *);
  void *v126;
  void *v127;
  id *v128;
  char v129;
  id v130;
  id *v131;
  uint64_t v132;
  __n128 (*v133)(__n128 *, __n128 *);
  void (*v134)(uint64_t);
  void *v135;
  void *v136;
  void *v137;
  __n128 *v138;
  _QWORD v139[2];
  uint64_t (*v140)(uint64_t, uint64_t, id *);
  void *v141;
  uint64_t *v142;
  char v143;
  uint64_t v144;
  uint64_t *v145;
  uint64_t v146;
  int v147;
  __int128 v148;
  uint64_t v149;

  v92 = a5;
  v93 = a8;
  v94 = a4;
  v95 = a7;
  v13 = self;
  impl = self->_impl;
  impl[384] = impl[383];
  v15 = *((_QWORD *)a3 + 67);
  v16 = *((_QWORD *)a6 + 67);
  if (*(_DWORD *)(v15 + 236))
    v17 = 1;
  else
    v17 = *(_DWORD *)(v16 + 236) != 0;
  v18 = *(_DWORD *)(*(_QWORD *)(v15 + 208) + 24);
  if (*(_DWORD *)(*(_QWORD *)(v16 + 208) + 24) < v18)
    v18 = *(_DWORD *)(*(_QWORD *)(v16 + 208) + 24);
  v91 = v18;
  v19 = *(_QWORD *)(v16 + 32);
  v20 = *(_QWORD *)(v15 + 32);
  v22 = v19 == 260 && v20 == 261;
  v24 = v20 == 260 && v19 == 261;
  v89 = v24;
  v90 = v22;
  if (v17 || *(unsigned __int8 *)(v15 + 380) != *(unsigned __int8 *)(v16 + 380))
  {
    v103 = (id)MEMORY[0x24BDAC760];
    v104 = 3221225472;
    v105 = (void (*)(id *, id *, id *))___ZN3AGX11BlitContextINS_2G98EncodersENS1_7ClassesENS1_10ObjClassesEE20copyTextureToTextureEP19AGXA10FamilyTexturejjS7_jjjj_block_invoke_2;
    v106 = &unk_250400018;
    v108 = a3;
    v109 = impl;
    v107 = a6;
    if (v91)
      v33 = (_DWORD)a9 == 0;
    else
      v33 = 1;
    if (!v33 && (_DWORD)a10 != 0)
    {
      v35 = 0;
      do
      {
        v36 = 0;
        v37 = v35 + v90;
        v86 = v35;
        v38 = v35 + v89;
        do
        {
          v39 = v93;
          v40 = v92;
          v41 = a10;
          do
          {
            v130 = a6;
            LODWORD(v131) = v37;
            HIDWORD(v131) = v36 + v95;
            LODWORD(v132) = v39;
            v115 = a3;
            LODWORD(v116) = v38;
            HIDWORD(v116) = v36 + v94;
            LODWORD(v117) = v40;
            v105(&v103, &v130, &v115);
            ++v40;
            ++v39;
            --v41;
          }
          while (v41);
          ++v36;
        }
        while (v36 != (_DWORD)a9);
        v35 = v86 + 1;
      }
      while (v86 + 1 != v91);
    }
    v13 = self;
  }
  else
  {
    v144 = 0;
    v145 = &v144;
    v10.n128_u64[0] = 0x2020000000;
    v146 = 0x2020000000;
    v147 = 0;
    v25 = (void *)MEMORY[0x24BDAC760];
    v139[0] = MEMORY[0x24BDAC760];
    v139[1] = 3221225472;
    v140 = (uint64_t (*)(uint64_t, uint64_t, id *))___ZN3AGX11BlitContextINS_2G98EncodersENS1_7ClassesENS1_10ObjClassesEE20copyTextureToTextureEP19AGXA10FamilyTexturejjS7_jjjj_block_invoke_3;
    v141 = &unk_250400040;
    v142 = &v144;
    v143 = 1;
    v26 = v91;
    v82 = impl;
    if (v91)
    {
      v26 = a10;
      if ((_DWORD)a10)
      {
        for (i = 0; i != v91; ++i)
        {
          v28 = v93;
          v29 = v92;
          v30 = a10;
          do
          {
            v103 = a6;
            LODWORD(v104) = i + v90;
            HIDWORD(v104) = v95;
            LODWORD(v105) = v28;
            v130 = a3;
            LODWORD(v131) = i + v89;
            HIDWORD(v131) = v94;
            LODWORD(v132) = v29;
            v140((uint64_t)v139, (uint64_t)&v103, &v130);
            ++v29;
            ++v28;
            --v30;
          }
          while (v30);
        }
        v26 = *((_DWORD *)v145 + 6);
        impl = v82;
        v25 = (void *)MEMORY[0x24BDAC760];
      }
    }
    v130 = 0;
    v131 = &v130;
    v132 = 0x4812000000;
    v31 = v91 * (_DWORD)a9 * v26;
    v133 = __Block_byref_object_copy__222;
    v134 = __Block_byref_object_dispose__223;
    v135 = &unk_232D8A46F;
    v136 = 0;
    v137 = 0;
    v138 = 0;
    if ((_DWORD)v31)
    {
      v32 = (__n128 *)operator new(16 * v31);
      v136 = v32;
      v137 = v32;
      v138 = &v32[v31];
    }
    else
    {
      v32 = 0;
    }
    v124[0] = v25;
    v42 = (__n128 **)&v137;
    v124[1] = 3221225472;
    v125 = ___ZN3AGX11BlitContextINS_2G98EncodersENS1_7ClassesENS1_10ObjClassesEE20copyTextureToTextureEP19AGXA10FamilyTexturejjS7_jjjj_block_invoke_182;
    v126 = &unk_2504000A8;
    v129 = 1;
    v127 = &__block_literal_global_178;
    v128 = &v130;
    if (v91 && (_DWORD)a9 && (_DWORD)a10)
    {
      v84 = v13;
      v43 = 0;
      do
      {
        v44 = 0;
        v45 = v43 + v90;
        v87 = v43;
        v46 = v43 + v89;
        do
        {
          v47 = v93;
          v48 = v92;
          v49 = a10;
          do
          {
            v103 = a6;
            LODWORD(v104) = v45;
            HIDWORD(v104) = v44 + v95;
            LODWORD(v105) = v47;
            v115 = a3;
            LODWORD(v116) = v46;
            HIDWORD(v116) = v44 + v94;
            LODWORD(v117) = v48;
            v125((uint64_t)v124, (uint64_t)&v103, (unsigned int *)&v115);
            ++v48;
            ++v47;
            --v49;
          }
          while (v49);
          ++v44;
        }
        while (v44 != (_DWORD)a9);
        v43 = v87 + 1;
      }
      while (v87 + 1 != v91);
      v42 = (__n128 **)(v131 + 7);
      v32 = (__n128 *)v131[6];
      v13 = v84;
      impl = v82;
      v25 = (void *)MEMORY[0x24BDAC760];
    }
    v50 = *v42;
    v51 = 126 - 2 * __clz(*v42 - v32);
    if (v50 == v32)
      v52 = 0;
    else
      v52 = v51;
    v53 = std::__introsort<std::_ClassicAlgPolicy,AGX::BlitContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::copyTextureToTexture(AGXA10FamilyTexture *,unsigned int,unsigned int,AGXA10FamilyTexture *,unsigned int,unsigned int,unsigned int,unsigned int)::{lambda(AGX::BlitContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::copyTextureToTexture(AGXA10FamilyTexture *,unsigned int,unsigned int,AGXA10FamilyTexture *,unsigned int,unsigned int,unsigned int,unsigned int)::MemRange,AGX::BlitContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::copyTextureToTexture(AGXA10FamilyTexture *,unsigned int,unsigned int,AGXA10FamilyTexture *,unsigned int,unsigned int,unsigned int,unsigned int)::MemRange)#1} &,AGX::BlitContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::copyTextureToTexture(AGXA10FamilyTexture *,unsigned int,unsigned int,AGXA10FamilyTexture *,unsigned int,unsigned int,unsigned int,unsigned int)::MemRange*,false>(v32, v50, v52, 1, v10);
    v55 = (__n128 *)v131[6];
    v54 = (__n128 *)v131[7];
    if (v55 != v54)
    {
      v56 = (__n128 *)v131[6];
      while (1)
      {
        v57 = *v56++;
        v53 = v57;
        *v55 = v57;
        if (v56 == v54)
          break;
        v58 = v55->n128_u64[1];
        while (v58 == v56->n128_u64[0])
        {
          v58 = v56->n128_u64[1];
          v55->n128_u64[1] = v58;
          if (++v56 == v54)
            goto LABEL_66;
        }
        ++v55;
        if (v56 == v54)
          goto LABEL_67;
      }
LABEL_66:
      ++v55;
    }
LABEL_67:
    if (v55 != v131[7])
      v131[7] = v55;
    v115 = 0;
    v116 = &v115;
    v117 = 0x4812000000;
    v118 = __Block_byref_object_copy__184;
    v119 = __Block_byref_object_dispose__185;
    v120 = &unk_232D8A46F;
    __p = 0;
    v122 = 0;
    v123 = 0;
    if ((_DWORD)v31)
    {
      v59 = (char *)operator new(24 * v31);
      __p = v59;
      v122 = v59;
      v123 = &v59[24 * v31];
    }
    else
    {
      v59 = 0;
    }
    v103 = v25;
    v104 = 3221225472;
    v105 = (void (*)(id *, id *, id *))___ZN3AGX11BlitContextINS_2G98EncodersENS1_7ClassesENS1_10ObjClassesEE20copyTextureToTextureEP19AGXA10FamilyTexturejjS7_jjjj_block_invoke_2_190;
    v106 = &unk_250400110;
    v112 = &v115;
    v113 = impl;
    v114 = 256;
    v109 = &__block_literal_global_189;
    v110 = &__block_literal_global_178;
    v111 = &v130;
    v107 = a6;
    v108 = a3;
    if (v91 && (_DWORD)a9)
    {
      v60 = (uint64_t)v59;
      if ((_DWORD)a10)
      {
        v85 = v13;
        v61 = 0;
        do
        {
          v62 = 0;
          v63 = v61 + v90;
          v88 = v61;
          v64 = v61 + v89;
          do
          {
            v65 = v93;
            v66 = v92;
            v67 = a10;
            do
            {
              v96 = a6;
              LODWORD(v97) = v63;
              HIDWORD(v97) = v62 + v95;
              LODWORD(v98) = v65;
              *(_QWORD *)&v148 = a3;
              DWORD2(v148) = v64;
              HIDWORD(v148) = v62 + v94;
              LODWORD(v149) = v66;
              v105(&v103, &v96, (id *)&v148);
              ++v66;
              ++v65;
              --v67;
            }
            while (v67);
            ++v62;
          }
          while (v62 != (_DWORD)a9);
          v61 = v88 + 1;
        }
        while (v88 + 1 != v91);
        v60 = (uint64_t)v116[6];
        v59 = (char *)v116[7];
        v13 = v85;
        impl = v82;
        v25 = (void *)MEMORY[0x24BDAC760];
      }
    }
    else
    {
      v60 = (uint64_t)v59;
    }
    v68 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v59[-v60] >> 3));
    if (v59 == (char *)v60)
      v69 = 0;
    else
      v69 = v68;
    std::__introsort<std::_ClassicAlgPolicy,AGX::BlitContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::copyTextureToTexture(AGXA10FamilyTexture *,unsigned int,unsigned int,AGXA10FamilyTexture *,unsigned int,unsigned int,unsigned int,unsigned int)::{lambda(AGX::BlitContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::CopyRange,AGX::BlitContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::CopyRange)#1} &,AGX::BlitContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::CopyRange*,false>(v60, (unint64_t)v59, v69, 1, v53);
    v70 = v116[6];
    v71 = v116[7];
    if (v70 == v71)
    {
      v72 = v116[6];
    }
    else
    {
      v72 = v116[6];
      while (1)
      {
        v73 = *(_OWORD *)v70;
        v72[2] = v70[2];
        *(_OWORD *)v72 = v73;
        v70 += 3;
        if (v70 == v71)
          break;
        v74 = *v72;
        v75 = v72[1];
        v76 = v72[2];
        while (v76 + v74 == *v70 && v76 + v75 == v70[1])
        {
          v76 += v70[2];
          v72[2] = v76;
          v70 += 3;
          if (v70 == v71)
            goto LABEL_99;
        }
        v72 += 3;
        if (v70 == v71)
          goto LABEL_101;
      }
LABEL_99:
      v72 += 3;
    }
LABEL_101:
    v78 = v116[6];
    if (v72 != v116[7])
    {
      v79 = v116;
      v116[7] = v72;
      v72 = v79[7];
      v25 = (void *)MEMORY[0x24BDAC760];
    }
    if (v78 != v72)
    {
      v96 = v25;
      v97 = 3221225472;
      v98 = (uint64_t *(*)(uint64_t, __int128 *))___ZN3AGX11BlitContextINS_2G98EncodersENS1_7ClassesENS1_10ObjClassesEE20copyTextureToTextureEP19AGXA10FamilyTexturejjS7_jjjj_block_invoke_3_191;
      v99 = &unk_250400138;
      v101 = a3;
      v102 = impl;
      v100 = a6;
      if (v78[1] <= *v78)
      {
        while (v72 != v116[6])
        {
          v81 = *(_OWORD *)(v72 - 3);
          v149 = *(v72 - 1);
          v148 = v81;
          v98((uint64_t)&v96, &v148);
          v72 -= 3;
        }
      }
      else
      {
        do
        {
          v80 = *(_OWORD *)v78;
          v149 = v78[2];
          v148 = v80;
          v98((uint64_t)&v96, &v148);
          v78 += 3;
        }
        while (v78 != v116[7]);
      }
    }
    _Block_object_dispose(&v115, 8);
    if (__p)
    {
      v122 = __p;
      operator delete(__p);
    }
    _Block_object_dispose(&v130, 8);
    if (v136)
    {
      v137 = v136;
      operator delete(v136);
    }
    _Block_object_dispose(&v144, 8);
  }
  *((_DWORD *)v13->_impl + 385) = *((_DWORD *)v13->_impl + 383);
}

- (void)updateFence:(id)a3
{
  _QWORD *impl;
  uint64_t v5;
  uint64_t v6;

  impl = self->_impl;
  if (impl[186])
    MTLResourceListAddResource();
  v5 = impl[223];
  if (!v5)
  {
    v5 = operator new();
    v6 = *(_QWORD *)(impl[183] + 808) + 6192;
    bzero((void *)v5, 0x208uLL);
    *(_QWORD *)(v5 + 520) = v6;
    *(_DWORD *)(v5 + 528) = 0;
    impl[223] = v5;
  }
  AGX::FenceList::insertFence((AGX::FenceList *)v5, *(unsigned __int16 *)((char *)a3 + (int)*MEMORY[0x24BE51630]));
}

- (void)waitForFence:(id)a3
{
  _QWORD *impl;
  uint64_t v5;
  uint64_t v6;

  impl = self->_impl;
  if (impl[186])
    MTLResourceListAddResource();
  v5 = impl[224];
  if (!v5)
  {
    v5 = operator new();
    v6 = *(_QWORD *)(impl[183] + 808) + 6192;
    bzero((void *)v5, 0x208uLL);
    *(_QWORD *)(v5 + 520) = v6;
    *(_DWORD *)(v5 + 528) = 0;
    impl[224] = v5;
  }
  AGX::FenceList::insertFence((AGX::FenceList *)v5, *(unsigned __int16 *)((char *)a3 + (int)*MEMORY[0x24BE51630]));
}

- (void)updateTextureMappings:(id)a3 mode:(unint64_t)a4 regions:(id *)a5 mipLevels:(const unint64_t *)a6 slices:(const unint64_t *)a7 numRegions:(unint64_t)a8
{
  _DWORD *impl;
  int v9;

  impl = self->_impl;
  v9 = impl[383];
  impl[384] = v9;
  impl[385] = v9;
}

- (void)updateTextureMapping:(id)a3 mode:(unint64_t)a4 region:(id *)a5 mipLevel:(unint64_t)a6 slice:(unint64_t)a7
{
  _DWORD *impl;
  int v8;

  impl = self->_impl;
  v8 = impl[383];
  impl[384] = v8;
  impl[385] = v8;
}

- (void)updateTextureMapping:(id)a3 mode:(unint64_t)a4 indirectBuffer:(id)a5 indirectBufferOffset:(unint64_t)a6
{
  _DWORD *impl;
  int v7;

  impl = self->_impl;
  v7 = impl[383];
  impl[384] = v7;
  impl[385] = v7;
}

- (void)getTextureAccessCounters:(id)a3 region:(id *)a4 mipLevel:(unint64_t)a5 slice:(unint64_t)a6 resetCounters:(BOOL)a7 countersBuffer:(id)a8 countersBufferOffset:(unint64_t)a9
{
  _DWORD *impl;
  int v10;

  impl = self->_impl;
  v10 = impl[383];
  impl[384] = v10;
  impl[385] = v10;
}

- (void)resetTextureAccessCounters:(id)a3 region:(id *)a4 mipLevel:(unint64_t)a5 slice:(unint64_t)a6
{
  _DWORD *impl;
  int v7;

  impl = self->_impl;
  v7 = impl[383];
  impl[384] = v7;
  impl[385] = v7;
}

- (void)moveTextureMappingsFromTexture:(id)a3 sourceSlice:(unint64_t)a4 sourceLevel:(unint64_t)a5 sourceOrigin:(id *)a6 sourceSize:(id *)a7 toTexture:(id)a8 destinationSlice:(unint64_t)a9 destinationLevel:(unint64_t)a10 destinationOrigin:(id *)a11
{
  _DWORD *impl;
  int v12;

  impl = self->_impl;
  v12 = impl[383];
  impl[384] = v12;
  impl[385] = v12;
}

- (void)resetCommandsInBuffer:(id)a3 withRange:(_NSRange)a4
{
  AGX::BlitDispatchContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::blitProcessICBWithTA((_QWORD *)self->_impl, *((char **)a3 + 47), 5, a4.location, a4.length, *((_DWORD *)a3 + 92) == 0);
}

- (void)copyIndirectCommandBuffer:(id)a3 sourceRange:(_NSRange)a4 destination:(id)a5 destinationIndex:(unint64_t)a6
{
  int v6;
  int location;
  _QWORD *impl;
  char *v9;
  char *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  int v17;
  uint64_t BlitProgramVariant;
  uint64_t v19;
  uint64_t v20;
  int length;
  _BYTE v22[24];
  int v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  _QWORD v27[4];
  int v28;
  int v29;
  int v30;
  __int128 v31;
  void *__p[2];
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  void *v36[3];

  v6 = a6;
  length = a4.length;
  location = a4.location;
  v36[1] = *(void **)MEMORY[0x24BDAC8D0];
  impl = self->_impl;
  v9 = (char *)*((_QWORD *)a5 + 47);
  v10 = (char *)*((_QWORD *)a3 + 47);
  v11 = *((_DWORD *)a3 + 92);
  v12 = (int)*MEMORY[0x24BE51650];
  v13 = *(_QWORD *)&v9[v12 + 8];
  v14 = *(_QWORD *)&v10[v12 + 8];
  if (*(_DWORD *)*MEMORY[0x24BE516B0])
    IOGPUDeviceTraceEvent();
  v34 = 0;
  v35 = 0;
  AGX::BlitDispatchContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::startTAHardwareCommand();
  v36[0] = v10;
  AGX::BlitDispatchContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::bindTAResources((uint64_t)impl, v9, v36);
  v15 = *(_QWORD *)(impl[183] + 808);
  v16 = *(_QWORD **)(v15 + 5016);
  if (v16)
  {
    do
    {
      IOGPUResourceListAddResource();
      v16 = (_QWORD *)*v16;
    }
    while (v16);
    v15 = *(_QWORD *)(impl[183] + 808);
  }
  DWORD2(v31) = 15;
  __p[1] = 0;
  *(_QWORD *)&v33 = 0;
  __p[0] = 0;
  *(_QWORD *)&v31 = off_2504005F8;
  if (v11)
    v17 = 4;
  else
    v17 = 134217732;
  DWORD2(v33) = v17;
  BlitProgramVariant = AGX::Device<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::findOrCreateBlitProgramVariant(v15, (uint64_t)&v31);
  *(_QWORD *)&v31 = off_250400638;
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  *(_OWORD *)__p = 0u;
  v33 = 0u;
  v31 = 0u;
  v27[3] = 0;
  v27[0] = v14;
  v27[1] = v13;
  v28 = 0;
  v29 = location;
  v30 = v6;
  v19 = *(_QWORD *)(*(_QWORD *)(impl[183] + 808) + 5488);
  v24 = *(_QWORD *)(impl[183] + 808);
  v25 = v19;
  v23 = 0;
  v26 = 0;
  if (*(_DWORD *)(BlitProgramVariant + 3424))
  {
    v23 = *(_DWORD *)(BlitProgramVariant + 3424);
    v26 = 1;
    v20 = v34;
    if (AGX::SpillInfoGen1<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::allocateUSCSpillBuffer((uint64_t)&v23, (_QWORD *)(v34 + 184), impl[187], (uint64_t)v22))
    {
      IOGPUResourceListAddResource();
    }
  }
  else
  {
    v20 = v34;
  }
  AGX::BlitDispatchContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::encodeTACommonDrawState((uint64_t)impl);
  AGX::BlitDispatchContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::encodeTADraw(impl, BlitProgramVariant, (uint64_t)&v31, (uint64_t)v27, length, 1);
  AGX::BlitDispatchContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::endTAHardwareCommand((uint64_t)impl, v35, v20);
  if (*(_DWORD *)*MEMORY[0x24BE516B0])
    IOGPUDeviceTraceEvent();
}

- (void)optimizeIndirectCommandBuffer:(id)a3 withRange:(_NSRange)a4
{
  if (LODWORD(a4.length) >= 2)
    AGX::BlitDispatchContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::blitProcessICBWithTA((_QWORD *)self->_impl, *((char **)a3 + 47), 6, LODWORD(a4.location) + 1, LODWORD(a4.length) - 1, *((_DWORD *)a3 + 92) == 0);
}

- (void)filterCounterRangeWithFirstBatch:(unsigned int)a3 lastBatch:(unsigned int)a4 filterIndex:(unsigned int)a5
{
  _DWORD *impl;

  impl = self->_impl;
  impl[381] = a3;
  impl[382] = a4;
}

- (BOOL)commandBatchIdRangeMin:(unsigned int *)a3 max:(unsigned int *)a4
{
  return AGX::ContextCommon<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::userDrawTokenIndex((uint64_t)self->_impl + 8, a3, a4);
}

- (unsigned)commandBatchIdOffset
{
  return 0;
}

- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5
{
  MTLReportFailure();
}

- (BOOL)setMTLCounterSampleLocationWithBuffer:(id)a3 startIndex:(unsigned int)a4 endIndex:(unsigned int)a5
{
  unsigned int *impl;
  char v7;
  int v8;
  BOOL result;

  result = a3
        && ((impl = (unsigned int *)self->_impl,
             impl[452] = a4,
             impl[453] = a5,
             v7 = AGX::CounterSamplingContextGen1::validateSampleIndex(a3, impl + 452),
             v8 = AGX::CounterSamplingContextGen1::validateSampleIndex(a3, impl + 453),
             (v7 & 1) != 0)
         || v8)
        && AGX::CounterSamplingContextGen1::setCounterSampleBuffer((AGX::CounterSamplingContextGen1 *)(impl + 450), (AGXMTLCounterSampleBuffer *)a3);
  return result;
}

- (void)resolveCounters:(id)a3 inRange:(_NSRange)a4 destinationBuffer:(id)a5 destinationOffset:(unint64_t)a6
{
  NSUInteger length;
  NSUInteger location;
  uint64_t *impl;
  char *v12;
  unsigned int v13;
  uint64_t v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (a4.length)
  {
    length = a4.length;
    location = a4.location;
    impl = (uint64_t *)self->_impl;
    if (a4.length + a4.location <= objc_msgSend(a3, "sampleCount"))
    {
      v12 = (char *)objc_msgSend(a3, "buffer");
      if (*((_DWORD *)impl + 452) != -1 && objc_msgSend(a3, "buffer") == impl[225])
      {
        v13 = *((_DWORD *)impl + 452);
        if (v13 >= location && v13 < (int)length + (int)location)
        {
          AGX::BlitDispatchContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::endPreviousBlitCommand(impl, 0);
          AGX::BlitDispatchContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::beginComputePass((uint64_t)impl, 0);
        }
      }
      *((_BYTE *)impl + 1816) = 1;
      v15 = objc_msgSend(a3, "sampleSize");
      AGX::BlitContext<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::copyBufferToBuffer(impl, (char *)a5, a6, v12, v15 * location, v15 * length);
      *((_BYTE *)impl + 1816) = 0;
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AGX: %s:%d:%s: *** Cannot resolve MTLCounter data: out of bounds access\n", "agxa_blit_template.hpp", 3464, "resolveCounters");
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v17 = "agxa_blit_template.hpp";
        v18 = 1024;
        v19 = 3464;
        v20 = 2080;
        v21 = "resolveCounters";
        _os_log_error_impl(&dword_232C19000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGX: AGX: %s:%d:%s: *** Cannot resolve MTLCounter data: out of bounds access\n", buf, 0x1Cu);
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v17 = "agxa_blit_template.hpp";
        v18 = 1024;
        v19 = 3464;
        v20 = 2080;
        v21 = "resolveCounters";
        _os_log_impl(&dword_232C19000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "AGX: AGX: %s:%d:%s: *** Cannot resolve MTLCounter data: out of bounds access\n", buf, 0x1Cu);
      }
    }
  }
}

@end
