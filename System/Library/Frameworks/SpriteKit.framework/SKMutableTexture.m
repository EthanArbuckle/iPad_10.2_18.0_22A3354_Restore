@implementation SKMutableTexture

- (SKMutableTexture)initWithSize:(CGSize)a3 ioSurfaceBacked:(BOOL)a4 pixelFormat:(int)a5
{
  CGFloat height;
  CGFloat width;
  SKMutableTexture *v9;
  void *v10;
  double v11;
  unsigned int v12;
  double v13;
  unsigned int v14;
  char v15;
  BOOL v16;
  void *v17;
  void *v18;
  uint64_t v19;
  size_t v20;
  const __CFAllocator *v21;
  __CFDictionary *Mutable;
  CFNumberRef v23;
  CFNumberRef v24;
  CFNumberRef v25;
  CFNumberRef v26;
  CFNumberRef v27;
  CFNumberRef v28;
  objc_super v30;
  objc_super v31;
  int v32;
  int v33;
  unsigned int valuePtr;
  unsigned int v35;
  unsigned int v36;
  objc_super v37;
  int v38;

  height = a3.height;
  width = a3.width;
  v38 = a5;
  v37.receiver = self;
  v37.super_class = (Class)SKMutableTexture;
  v9 = -[SKTexture _initWithGLTextureId:size:](&v37, sel__initWithGLTextureId_size_, 0);
  if (v9)
  {
    SKGetGlobalDefaults();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("kSKMutableTextureExists"));

    -[SKTexture size](v9, "size");
    v12 = v11;
    v36 = v11;
    -[SKTexture size](v9, "size");
    v14 = v13;
    if (a5 == 1380410945)
      v15 = 4;
    else
      v15 = 2;
    if (a5 == 1380411457)
      v15 = 3;
    valuePtr = v12 << v15;
    v35 = v13;
    v16 = ((v12 << v15) & 0xC) == 0 && a4;
    v9->_ioSurface = 0;
    v9->_textureSize.width = width;
    v9->_textureSize.height = height;
    v9->_pixelData = 0;
    v9->_pixelDataLength = 0;
    v9->_ioSurfaceBacked = v16;
    v9->_pixelFormat = a5;
    -[SKTexture _textureCache](v9, "_textureCache");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (a5 == 1380410945)
    {
      v19 = 10;
    }
    else if (a5 == 1380411457)
    {
      v19 = 0;
    }
    else if (v9->_ioSurfaceBacked)
    {
      v19 = 4;
    }
    else
    {
      v19 = 3;
    }
    objc_msgSend(v17, "setTextureFormat:", v19);
    v20 = valuePtr * v14;
    v33 = valuePtr * v14;
    if (v9->_ioSurfaceBacked)
    {
      v9->_ioSurface = 0;
      v32 = 4;
      v21 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      v23 = CFNumberCreate(v21, kCFNumberSInt32Type, &valuePtr);
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CBBF08], v23);
      CFRelease(v23);
      v24 = CFNumberCreate(v21, kCFNumberSInt32Type, &v32);
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CBBF00], v24);
      CFRelease(v24);
      v25 = CFNumberCreate(v21, kCFNumberSInt32Type, &v36);
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CBC1E0], v25);
      CFRelease(v25);
      v26 = CFNumberCreate(v21, kCFNumberSInt32Type, &v35);
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CBC008], v26);
      CFRelease(v26);
      v27 = CFNumberCreate(v21, kCFNumberSInt32Type, &v38);
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CBC070], v27);
      CFRelease(v27);
      v28 = CFNumberCreate(v21, kCFNumberSInt32Type, &v33);
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CBBEE0], v28);
      CFRelease(v28);
      v9->_ioSurface = IOSurfaceCreate(Mutable);
      CFRelease(Mutable);
      v31.receiver = v9;
      v31.super_class = (Class)SKMutableTexture;
      -[SKTexture setTextureTarget:](&v31, sel_setTextureTarget_, 3553);
    }
    else
    {
      v9->_pixelDataLength = v20;
      v9->_pixelData = malloc_type_malloc(v20, 0x47E5514AuLL);
      v30.receiver = v9;
      v30.super_class = (Class)SKMutableTexture;
      -[SKTexture setTextureTarget:](&v30, sel_setTextureTarget_, 3553);
    }

  }
  return v9;
}

- (SKMutableTexture)initWithSize:(CGSize)size
{
  return -[SKMutableTexture initWithSize:ioSurfaceBacked:pixelFormat:](self, "initWithSize:ioSurfaceBacked:pixelFormat:", 1, 1380401729, size.width, size.height);
}

- (SKMutableTexture)initWithSize:(CGSize)size pixelFormat:(int)format
{
  return -[SKMutableTexture initWithSize:ioSurfaceBacked:pixelFormat:](self, "initWithSize:ioSurfaceBacked:pixelFormat:", 1, *(_QWORD *)&format, size.width, size.height);
}

+ (SKMutableTexture)mutableTextureWithSize:(CGSize)size
{
  return -[SKMutableTexture initWithSize:]([SKMutableTexture alloc], "initWithSize:", size.width, size.height);
}

- (void)modifyPixelDataWithBlock:(void *)block
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *BaseAddress;
  size_t AllocSize;
  void *v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  uint64_t v12;
  std::__shared_weak_count *v13;

  v4 = block;
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))v4;
  if (self->_ioSurfaceBacked)
  {
    IOSurfaceLock(self->_ioSurface, 0, 0);
    BaseAddress = IOSurfaceGetBaseAddress(self->_ioSurface);
    AllocSize = IOSurfaceGetAllocSize(self->_ioSurface);
    ((void (**)(_QWORD, void *, size_t))v5)[2](v5, BaseAddress, AllocSize);
    IOSurfaceUnlock(self->_ioSurface, 0, 0);
  }
  else
  {
    (*((void (**)(void *, void *, unint64_t))v4 + 2))(v4, self->_pixelData, self->_pixelDataLength);
    -[SKTexture _textureCache](self, "_textureCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v13 = 0;
    objc_msgSend(v8, "setBackingTexture:", &v12);
    v9 = v13;
    if (v13)
    {
      p_shared_owners = (unint64_t *)&v13->__shared_owners_;
      do
        v11 = __ldaxr(p_shared_owners);
      while (__stlxr(v11 - 1, p_shared_owners));
      if (!v11)
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
    }

  }
}

- (shared_ptr<jet_texture>)_backingTexture
{
  _QWORD *v2;
  _QWORD *v4;
  void *v5;
  void *v6;
  jet_texture *v7;
  __shared_weak_count *v8;
  std::__shared_weak_count *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  unsigned int v15;
  void *v16;
  void *v17;
  std::__shared_weak_count *v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  _QWORD v21[5];
  unsigned int v22;
  unsigned int v23;
  uint64_t v24;
  std::__shared_weak_count *v25;
  shared_ptr<jet_texture> result;

  v4 = v2;
  -[SKTexture _textureCache](self, "_textureCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "backingTexture");
  }
  else
  {
    v24 = 0;
    v25 = 0;
  }

  if (v24)
  {
    v9 = v25;
    *v4 = v24;
    v4[1] = v9;
  }
  else
  {
    -[SKTexture _textureCache](self, "_textureCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pixelSize");
    v12 = v11;

    -[SKTexture _textureCache](self, "_textureCache");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "pixelSize");
    v15 = vcvtpd_u64_f64(v14);

    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __35__SKMutableTexture__backingTexture__block_invoke;
    v21[3] = &unk_1EA500048;
    v21[4] = self;
    v22 = vcvtpd_u64_f64(v12);
    v23 = v15;
    SKCPerformResourceOperation(v21);
    -[SKTexture _textureCache](self, "_textureCache");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      objc_msgSend(v16, "backingTexture");
    }
    else
    {
      *v4 = 0;
      v4[1] = 0;
    }

    v18 = v25;
    if (v25)
    {
      p_shared_owners = (unint64_t *)&v25->__shared_owners_;
      do
        v20 = __ldaxr(p_shared_owners);
      while (__stlxr(v20 - 1, p_shared_owners));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
  }
  result.__cntrl_ = v8;
  result.__ptr_ = v7;
  return result;
}

void __35__SKMutableTexture__backingTexture__block_invoke(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t ID;
  uint64_t v6;
  void *v7;
  void *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  void *v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  uint64_t texture_2d;
  void *v19;
  void *v20;
  unint64_t *v21;
  unint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  void *v26;
  unint64_t *v27;
  uint64_t v28;
  std::__shared_weak_count *v29;
  uint64_t v30;
  std::__shared_weak_count *v31;
  uint64_t v32;
  std::__shared_weak_count *v33;

  v3 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v3 + 248))
  {
    v4 = *a2;
    ID = IOSurfaceGetID(*(IOSurfaceRef *)(v3 + 240));
    v6 = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, _QWORD))(*(_QWORD *)v4 + 32))(v4, ID, *(unsigned int *)(a1 + 40), *(unsigned int *)(a1 + 44), 3, 0);
    std::shared_ptr<jet_texture>::shared_ptr[abi:ne180100]<jet_texture,void>(&v32, v6);
    objc_msgSend(*(id *)(a1 + 32), "_textureCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v30 = v32;
    v31 = v33;
    if (v33)
    {
      p_shared_owners = (unint64_t *)&v33->__shared_owners_;
      do
        v10 = __ldxr(p_shared_owners);
      while (__stxr(v10 + 1, p_shared_owners));
    }
    objc_msgSend(v7, "setBackingTexture:", &v30);
    v11 = v31;
    if (v31)
    {
      v12 = (unint64_t *)&v31->__shared_owners_;
      do
        v13 = __ldaxr(v12);
      while (__stlxr(v13 - 1, v12));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }

    objc_msgSend(*(id *)(a1 + 32), "_textureCache");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPixelData:", 0);

    v15 = v33;
    if (v33)
    {
      v16 = (unint64_t *)&v33->__shared_owners_;
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
LABEL_25:
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
  }
  else
  {
    texture_2d = jet_context::create_texture_2d();
    std::shared_ptr<jet_texture>::shared_ptr[abi:ne180100]<jet_texture,void>(&v32, texture_2d);
    objc_msgSend(*(id *)(a1 + 32), "_textureCache");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    v28 = v32;
    v29 = v33;
    if (v33)
    {
      v21 = (unint64_t *)&v33->__shared_owners_;
      do
        v22 = __ldxr(v21);
      while (__stxr(v22 + 1, v21));
    }
    objc_msgSend(v19, "setBackingTexture:", &v28);
    v23 = v29;
    if (v29)
    {
      v24 = (unint64_t *)&v29->__shared_owners_;
      do
        v25 = __ldaxr(v24);
      while (__stlxr(v25 - 1, v24));
      if (!v25)
      {
        ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
        std::__shared_weak_count::__release_weak(v23);
      }
    }

    objc_msgSend(*(id *)(a1 + 32), "_textureCache", v28);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setPixelData:", 0);

    v15 = v33;
    if (v33)
    {
      v27 = (unint64_t *)&v33->__shared_owners_;
      do
        v17 = __ldaxr(v27);
      while (__stlxr(v17 - 1, v27));
      goto LABEL_25;
    }
  }
}

- (id)description
{
  void *v3;
  double v4;
  uint64_t v5;
  double v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SKTexture pixelSize](self, "pixelSize");
  v5 = (int)v4;
  -[SKTexture pixelSize](self, "pixelSize");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<SKMutableTexture> (%d x %d)"), v5, (int)v6);
}

- (void)dealloc
{
  __IOSurface *ioSurface;
  void *pixelData;
  objc_super v5;

  ioSurface = self->_ioSurface;
  if (ioSurface)
  {
    CFRelease(ioSurface);
    self->_ioSurface = 0;
  }
  pixelData = self->_pixelData;
  if (pixelData)
  {
    free(pixelData);
    self->_pixelData = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)SKMutableTexture;
  -[SKTexture dealloc](&v5, sel_dealloc);
}

@end
