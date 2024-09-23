@implementation AGXTextureLayout

- (void)dealloc
{
  void (***impl)(void *, SEL);
  objc_super v4;

  impl = (void (***)(void *, SEL))self->_impl;
  if (impl)
  {
    (**impl)(impl, a2);
    free(self->_impl);
    self->_impl = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)AGXTextureLayout;
  -[AGXTextureLayout dealloc](&v4, sel_dealloc);
}

- (AGXTextureLayout)initWithDevice:(id)a3 descriptor:(id)a4 isHeapOrBufferBacked:(BOOL)a5
{
  AGXTextureLayout *v7;
  uint64_t v8;
  MTLPixelFormat v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  _BOOL4 v18;
  void *v19;
  uint32x2_t v20;
  unint64_t v21;
  int v22;
  int v23;
  uint64_t v25;
  uint64_t v26;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)AGXTextureLayout;
  v7 = -[IOGPUMetalTextureLayout initWithDevice:descriptor:](&v27, sel_initWithDevice_descriptor_);
  if (!v7)
    goto LABEL_25;
  v8 = objc_msgSend(a4, "descriptorPrivate");
  v10 = v8;
  v11 = *(_QWORD *)(v8 + 96);
  if (v11 == 2)
  {
    v15 = 0;
  }
  else
  {
    if (v11 == 1)
      LODWORD(v11) = 9;
    else
      LODWORD(v11) = 0;
    v12 = *(_QWORD *)(v8 + 152);
    v13 = 512;
    v14 = 256;
    if (v12 != 1)
      v14 = 0;
    if (v12 != 2)
      v13 = v14;
    v15 = v12 == 3 ? 768 : v13;
  }
  v16 = v11 & 0xFFFFFFFB;
  v17 = *(_BYTE *)(v8 + 128) ? v16 : 2;
  v18 = (*((_DWORD *)AGX::G9::TextureFormatTable::chooseTextureFormatOBJC(*(AGX::G9::TextureFormatTable **)(v8 + 8), v9)
         + 15) & 0xC) != 0;
  v19 = malloc_type_calloc(0x1C0uLL, 1uLL, 0x55FB10BDuLL);
  v7->_impl = v19;
  if (!v19
    || ((v21 = *(_QWORD *)(v10 + 168) - 1, v21 > 9) ? (v22 = 0) : (v22 = dword_232D77F80[v21]),
        (unint64_t)(*(_QWORD *)(v10 + 72) - 1) < 4 ? (v23 = *(_DWORD *)(v10 + 72)) : (v23 = 0),
        LODWORD(v26) = 0,
        LODWORD(v25) = *(_QWORD *)(v10 + 48),
        HIDWORD(v25) = *(_QWORD *)(v10 + 56),
        *(_QWORD *)AGX::TextureGen2<(AGXTextureMemoryLayout)1,AGX::G9::Encoders,AGX::G9::Classes>::TextureGen2((uint64_t)v19, *((MTLPixelFormat *)a3 + 101), *(_QWORD *)v10, *(AGX::G9::TextureFormatTable **)(v10 + 8), *(_QWORD *)(v10 + 104), *(_QWORD *)(v10 + 192), v15 | v17 | v18, v22, v23, *(_DWORD *)(v10 + 84), v20, *(_QWORD *)(v10 + 16), *(_QWORD *)(v10 + 24), *(_QWORD *)(v10 + 32), *(_DWORD *)(v10 + 40), v25, 0, v26, *(_QWORD *)(v10 + 112) & 0xFLL,
                     0,
                     0,
                     0,
                     0,
                     0,
                     0,
                     0,
                     0) = off_250402690,
        !*((_BYTE *)v7->_impl + 200)))
  {
LABEL_25:

    return 0;
  }
  return v7;
}

- (unint64_t)size
{
  return *((_QWORD *)self->_impl + 44) + 16;
}

- (unint64_t)alignment
{
  unsigned int *impl;
  unint64_t v3;
  _QWORD *v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  int v10;
  BOOL v11;
  int v12;

  impl = (unsigned int *)self->_impl;
  if (*((_BYTE *)impl + 16))
    return 0;
  if (*((_BYTE *)impl + 232))
    return *((_QWORD *)impl + 40);
  v3 = impl[59];
  if (!(_DWORD)v3)
  {
    v4 = impl + 95;
    v5 = *((unsigned __int8 *)impl + 380);
    v6 = *((unsigned __int8 *)impl + 381);
    v7 = AGX::Texture<(AGXTextureMemoryLayout)1,AGX::G9::Encoders,AGX::G9::Classes>::getMipmapSize<(AGX::Texture<(AGXTextureMemoryLayout)1,AGX::G9::Encoders,AGX::G9::Classes>::View)0>((uint64_t)impl, 0);
    v8 = (*v4 >> 16) & 1;
    if (v6 == 1)
      v9 = WORD1(*v4) & 1;
    else
      v9 = 0;
    if (v6 != 2)
      LODWORD(v8) = 0;
    if ((v9 & 1) != 0)
      LODWORD(v8) = 1;
    if ((v6 - 3) >= 2)
      v10 = v8;
    else
      v10 = 1;
    if (v5)
    {
      v11 = (v7 & 0xFFFFFFFFFFFFC000) != 0 && v5 == 1;
      v12 = v11;
      v11 = (v12 & v10) == 0;
      v3 = 64;
      if (!v11)
        return 0x4000;
    }
    else
    {
      return 16;
    }
  }
  return v3;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)copyGranularity
{
  uint64_t v3;
  __int128 v4;

  v3 = *(_QWORD *)(self->var1 + 216);
  *(_QWORD *)&v4 = v3;
  *((_QWORD *)&v4 + 1) = HIDWORD(v3);
  *(_OWORD *)&retstr->var0 = v4;
  retstr->var2 = 1;
  return self;
}

- ($71D83D51AB0F57F7CF166351F850C832)watermark
{
  unint64_t v2;
  unint64_t v3;
  $71D83D51AB0F57F7CF166351F850C832 result;

  v2 = 0xF4AA93D1F315E8AELL;
  v3 = 0x6B4DC612A90E09F1;
  result.var0[1] = v3;
  result.var0[0] = v2;
  return result;
}

- (void)copyFromLinearBytes:(const void *)a3 linearOffset:(unint64_t)a4 linearBytesPerRow:(unint64_t)a5 linearBytesPerImage:(unint64_t)a6 toTextureMemory:(void *)a7 textureSlice:(unint64_t)a8 textureLevel:(unint64_t)a9 textureRegion:(id *)a10
{
  unsigned int v10;
  _QWORD *impl;

  v10 = a8;
  impl = self->_impl;
  impl[37] = a7;
  impl[9] = 0;
  (*(void (**)(_QWORD *, SEL))(*impl + 16))(impl, a2);
  AGX::Texture<(AGXTextureMemoryLayout)1,AGX::G9::Encoders,AGX::G9::Classes>::writeRegion((uint64_t)self->_impl, a10->var0.var0, a10->var0.var1, a10->var0.var2, a10->var1.var0, a10->var1.var1, a10->var1.var2, v10, a9, (unsigned __int8 *)a3 + a4, a5, a6);
}

- (void)copyFromTextureMemory:(const void *)a3 textureSlice:(unint64_t)a4 textureLevel:(unint64_t)a5 textureRegion:(id *)a6 toLinearBytes:(void *)a7 linearOffset:(unint64_t)a8 linearBytesPerRow:(unint64_t)a9 linearBytesPerImage:(unint64_t)a10
{
  unsigned int v13;
  unsigned int v14;
  _QWORD *impl;

  v13 = a5;
  v14 = a4;
  impl = self->_impl;
  impl[37] = a3;
  impl[9] = 0;
  (*(void (**)(_QWORD *, SEL))(*impl + 16))(impl, a2);
  AGX::Texture<(AGXTextureMemoryLayout)1,AGX::G9::Encoders,AGX::G9::Classes>::readRegion((uint64_t)self->_impl, a6->var0.var0, a6->var0.var1, a6->var0.var2, a6->var1.var0, a6->var1.var1, a6->var1.var2, v14, v13, (unsigned __int8 *)a7 + a8, a9, a10);
}

- (void)finalizeTextureMemory:(void *)a3
{
  *(_OWORD *)((char *)a3 + *((_QWORD *)self->_impl + 44)) = AGX::G9::Texture::twiddle_hash;
}

@end
