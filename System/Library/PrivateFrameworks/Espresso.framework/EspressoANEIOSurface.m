@implementation EspressoANEIOSurface

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 11) = 0;
  *((_QWORD *)self + 12) = 0;
  return self;
}

- (void)setExternal_storage_blob_for_aliasing_mem:(shared_ptr<Espresso:(1>>)a3 :blob<unsigned)char
{
  std::shared_ptr<Espresso::analysis_result>::operator=[abi:ne180100](&self->_external_storage_blob_for_aliasing_mem.__ptr_, *(_QWORD *)a3.__ptr_, *((_QWORD *)a3.__ptr_ + 1));
}

- (void)doNonLazyAllocation:(id)a3
{
  id v4;
  __IOSurface *v5;
  uint64_t v6;
  surface_and_buffer *begin;
  void *v8;
  id v9;

  v4 = a3;
  if (self->created_with_lazy_iosurface)
  {
    v9 = v4;
    v5 = -[EspressoANEIOSurface createIOSurfaceWithExtraProperties:](self, "createIOSurfaceWithExtraProperties:", v4);
    *((_QWORD *)self->multiple_buffer_io_surfaces.__begin_ + 2) = v5;
    objc_msgSend(MEMORY[0x1E0CFDF50], "objectWithIOSurface:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    begin = self->multiple_buffer_io_surfaces.__begin_;
    v8 = (void *)*((_QWORD *)begin + 1);
    *((_QWORD *)begin + 1) = v6;

    self->created_with_lazy_iosurface = 0;
    v4 = v9;
  }

}

- (__IOSurface)createIOSurfaceWithExtraProperties:(id)a3
{
  id v4;
  NSDictionary *v5;
  IOSurfaceRef IOSurface;
  __IOSurface *v7;
  std::runtime_error *exception;
  std::runtime_error *v10;
  CVPixelBufferRef pixelBufferOut;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", self->params_dict);
    v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary addEntriesFromDictionary:](v5, "addEntriesFromDictionary:", v4);
  }
  else
  {
    v5 = self->params_dict;
  }
  if (self->ane_surface_use_cvpixelbuffer)
  {
    pixelBufferOut = 0;
    if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE30], self->width, self->height, self->_pixelFormat, (CFDictionaryRef)v5, &pixelBufferOut))
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Error creating CVPixelBuffer");
    }
    else
    {
      IOSurface = CVPixelBufferGetIOSurface(pixelBufferOut);
      v7 = IOSurface;
      if (IOSurface)
      {
        CFRetain(IOSurface);
        CVBufferRelease(pixelBufferOut);
        goto LABEL_9;
      }
      CVBufferRelease(pixelBufferOut);
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Could not get an IOSurface from the pixel buffer");
    }
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  v7 = IOSurfaceCreate((CFDictionaryRef)v5);
  if (!v7)
  {
    v10 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v10, "Error creating IOSurface");
    __cxa_throw(v10, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
LABEL_9:

  return v7;
}

- (EspressoANEIOSurface)initWithIOSurfaceProperties:(id)a3 andPixelFormats:(id)a4
{
  id v6;
  id v7;
  char *v8;
  EspressoANEIOSurface *v9;
  char *v10;
  void *v11;
  uint64_t v12;
  NSDictionary *params_dict;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  EspressoANEIOSurface *v22;
  objc_super v24;

  v6 = a3;
  v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)EspressoANEIOSurface;
  v8 = -[EspressoANEIOSurface init](&v24, sel_init);
  v9 = (EspressoANEIOSurface *)v8;
  if (v8)
  {
    v8[40] = 1;
    v10 = v8 + 16;
    std::vector<Espresso::ANERuntimeEngine::surface_and_buffer>::resize((char **)v8 + 2, 1uLL);
    v11 = *(void **)(*(_QWORD *)v10 + 8);
    *(_QWORD *)(*(_QWORD *)v10 + 8) = 0;

    v12 = objc_msgSend(v6, "copy");
    params_dict = v9->params_dict;
    v9->params_dict = (NSDictionary *)v12;

    v14 = *MEMORY[0x1E0CA9040];
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CA9040]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v9->ane_surface_use_cvpixelbuffer = v15 != 0;

    if (v9->ane_surface_use_cvpixelbuffer)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CA90E0]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v9->width = objc_msgSend(v16, "unsignedIntValue");

      objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CA8FD8]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v9->height = objc_msgSend(v17, "unsignedIntValue");

      objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CA8F68]);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v9->rowBytes = objc_msgSend(v18, "unsignedIntValue");

      objc_msgSend(v6, "objectForKeyedSubscript:", v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v9->_pixelFormat = objc_msgSend(v19, "unsignedIntValue");
    }
    else
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CBC1E0]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v9->width = objc_msgSend(v20, "unsignedIntValue");

      objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CBC008]);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v9->height = objc_msgSend(v21, "unsignedIntValue");

      objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CBBF08]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v9->rowBytes = objc_msgSend(v19, "unsignedIntValue");
    }

    objc_storeStrong((id *)&v9->valid_pixel_formats, a4);
    v22 = v9;
  }

  return v9;
}

- (unint64_t)nFrames
{
  return 0xCCCCCCCCCCCCCCCDLL
       * ((self->multiple_buffer_io_surfaces.__end_ - self->multiple_buffer_io_surfaces.__begin_) >> 3);
}

- (__IOSurface)ioSurfaceForMultiBufferFrame:(unint64_t)a3
{
  void *v3;
  __IOSurface *v4;

  -[EspressoANEIOSurface ane_io_surfaceForMultiBufferFrame:](self, "ane_io_surfaceForMultiBufferFrame:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (__IOSurface *)objc_msgSend(v3, "ioSurface");

  return v4;
}

- (id)ane_io_surfaceForMultiBufferFrame:(unint64_t)a3
{
  -[EspressoANEIOSurface lazilyAutoCreateSurfaceForFrame:](self, "lazilyAutoCreateSurfaceForFrame:");
  return *((id *)self->multiple_buffer_io_surfaces.__begin_ + 5 * a3 + 1);
}

- (void)lazilyAutoCreateSurfaceForFrame:(unint64_t)a3
{
  NSObject *v5;
  __IOSurface *v6;
  unint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint8_t v11[16];

  if (!*((_QWORD *)self->multiple_buffer_io_surfaces.__begin_ + 5 * a3 + 1))
  {
    Espresso::espresso_os_log_subsystem((Espresso *)self, a2);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v11 = 0;
      _os_log_debug_impl(&dword_190DAF000, v5, OS_LOG_TYPE_DEBUG, "EspressoANEIOSurface::lazilyAutoCreateSurfaceForFrame", v11, 2u);
    }

    v6 = -[EspressoANEIOSurface createIOSurfaceWithExtraProperties:](self, "createIOSurfaceWithExtraProperties:", 0);
    v7 = 5 * a3;
    *((_QWORD *)self->multiple_buffer_io_surfaces.__begin_ + v7 + 2) = v6;
    objc_msgSend(MEMORY[0x1E0CFDF50], "objectWithIOSurface:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (char *)self->multiple_buffer_io_surfaces.__begin_ + 8 * v7;
    v10 = (void *)*((_QWORD *)v9 + 1);
    *((_QWORD *)v9 + 1) = v8;

  }
}

- (void)resizeForMultipleAsyncBuffers:(unint64_t)a3
{
  vector<Espresso::ANERuntimeEngine::surface_and_buffer, std::allocator<Espresso::ANERuntimeEngine::surface_and_buffer>> *p_multiple_buffer_io_surfaces;
  uint64_t v6;
  unint64_t v7;
  surface_and_buffer *begin;
  __IOSurface *v9;
  uint64_t v10;
  char *v11;
  void *v12;
  char *v13;
  void *v14;

  p_multiple_buffer_io_surfaces = &self->multiple_buffer_io_surfaces;
  if (0xCCCCCCCCCCCCCCCDLL
     * ((self->multiple_buffer_io_surfaces.__end_ - self->multiple_buffer_io_surfaces.__begin_) >> 3) < a3)
  {
    std::vector<Espresso::ANERuntimeEngine::surface_and_buffer>::resize((char **)&self->multiple_buffer_io_surfaces, a3);
    if (a3 >= 2)
    {
      v6 = 0;
      v7 = a3 - 1;
      do
      {
        begin = p_multiple_buffer_io_surfaces->__begin_;
        if (!*(_QWORD *)((char *)p_multiple_buffer_io_surfaces->__begin_ + v6 + 48))
        {
          if (!self->created_with_lazy_iosurface)
          {
            v9 = -[EspressoANEIOSurface createIOSurfaceWithExtraProperties:](self, "createIOSurfaceWithExtraProperties:", 0);
            *(_QWORD *)((char *)self->multiple_buffer_io_surfaces.__begin_ + v6 + 56) = v9;
            objc_msgSend(MEMORY[0x1E0CFDF50], "objectWithIOSurface:", v9);
            v10 = objc_claimAutoreleasedReturnValue();
            v11 = (char *)self->multiple_buffer_io_surfaces.__begin_ + v6;
            v12 = (void *)*((_QWORD *)v11 + 6);
            *((_QWORD *)v11 + 6) = v10;

            begin = self->multiple_buffer_io_surfaces.__begin_;
          }
          v13 = (char *)begin + v6;
          v14 = (void *)*((_QWORD *)v13 + 5);
          *((_QWORD *)v13 + 5) = 0;

        }
        v6 += 40;
        --v7;
      }
      while (v7);
    }
  }
}

- (BOOL)checkIfMatches:(__CVBuffer *)a3
{
  const char *v5;
  size_t Height;
  size_t Width;
  Espresso *PixelFormatType;
  const char *v9;
  int v10;
  NSObject *v11;
  unint64_t v12;
  unint64_t v13;
  unsigned int pixelFormat;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  Espresso *BytesPerRow;
  const char *v19;
  Espresso *v20;
  unint64_t v22;
  unint64_t rowBytes;
  int v24;
  unint64_t v25;
  __int16 v26;
  size_t v27;
  __int16 v28;
  unint64_t v29;
  __int16 v30;
  size_t v31;
  __int16 v32;
  unsigned int v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (CVPixelBufferGetIOSurface(a3))
  {
    Height = CVPixelBufferGetHeight(a3);
    if (self->ane_surface_use_cvpixelbuffer)
    {
      Width = CVPixelBufferGetWidth(a3);
      PixelFormatType = (Espresso *)CVPixelBufferGetPixelFormatType(a3);
      v10 = (int)PixelFormatType;
      if (self->width != Width || self->height != Height)
      {
        Espresso::espresso_os_log_subsystem(PixelFormatType, v9);
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          v12 = self->width;
          v13 = self->height;
          pixelFormat = self->_pixelFormat;
          v24 = 134219264;
          v25 = v12;
          v26 = 2048;
          v27 = Width;
          v28 = 2048;
          v29 = v13;
          v30 = 2048;
          v31 = Height;
          v32 = 1024;
          v33 = pixelFormat;
          v34 = 1024;
          v35 = v10;
          v15 = "Mismatching CVPixelBuffer Params: width: expected:%zu != client:%zu; height: expected:%zu != client:%zu;"
                " pixel format expected:%x != client:%x";
          v16 = v11;
          v17 = 54;
LABEL_14:
          _os_log_debug_impl(&dword_190DAF000, v16, OS_LOG_TYPE_DEBUG, v15, (uint8_t *)&v24, v17);
          goto LABEL_15;
        }
        goto LABEL_15;
      }
    }
    else
    {
      BytesPerRow = (Espresso *)CVPixelBufferGetBytesPerRow(a3);
      v20 = BytesPerRow;
      if (self->height != Height || (Espresso *)self->rowBytes != BytesPerRow)
      {
        Espresso::espresso_os_log_subsystem(BytesPerRow, v19);
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          v22 = self->height;
          rowBytes = self->rowBytes;
          v24 = 134218752;
          v25 = v22;
          v26 = 2048;
          v27 = Height;
          v28 = 2048;
          v29 = rowBytes;
          v30 = 2048;
          v31 = (size_t)v20;
          v15 = "Mismatching IOSurface Params: height: expected:%zu != client:%zu || rowBytes expected:%zu != client:%zu";
          v16 = v11;
          v17 = 42;
          goto LABEL_14;
        }
        goto LABEL_15;
      }
    }
    return 1;
  }
  Espresso::espresso_os_log_subsystem(0, v5);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v24) = 0;
    v15 = "Could not get IOSurface from cvpixelbuffer";
    v16 = v11;
    v17 = 2;
    goto LABEL_14;
  }
LABEL_15:

  return 0;
}

- (BOOL)checkIfMatchesIOSurface:(__IOSurface *)a3
{
  return 0;
}

- (__IOSurface)ioSurfaceForMultiBufferFrameNoLazyForTesting:(unint64_t)a3
{
  return (__IOSurface *)objc_msgSend(*((id *)self->multiple_buffer_io_surfaces.__begin_ + 5 * a3 + 1), "ioSurface");
}

- (void)cleanup
{
  surface_and_buffer *begin;
  uint64_t v4;
  unint64_t v5;
  const void *v6;
  char *v7;
  void *v8;
  surface_and_buffer *v9;
  void *v10;

  begin = self->multiple_buffer_io_surfaces.__begin_;
  if (self->multiple_buffer_io_surfaces.__end_ != begin)
  {
    v4 = 0;
    v5 = 0;
    do
    {
      v6 = *(const void **)((char *)begin + v4 + 16);
      if (v6)
      {
        CFRelease(v6);
        begin = self->multiple_buffer_io_surfaces.__begin_;
      }
      v7 = (char *)begin + v4;
      v8 = (void *)*((_QWORD *)v7 + 1);
      *((_QWORD *)v7 + 1) = 0;

      v9 = self->multiple_buffer_io_surfaces.__begin_;
      v10 = *(void **)((char *)v9 + v4);
      *(_QWORD *)((char *)v9 + v4) = 0;

      ++v5;
      begin = self->multiple_buffer_io_surfaces.__begin_;
      v4 += 40;
    }
    while (v5 < 0xCCCCCCCCCCCCCCCDLL * ((self->multiple_buffer_io_surfaces.__end_ - begin) >> 3));
  }
}

- (void)setExternalStorage:(unint64_t)a3 ioSurface:(__IOSurface *)a4
{
  uint64_t PixelFormat;
  NSSet *valid_pixel_formats;
  void *v9;
  void *v10;
  surface_and_buffer *begin;
  char *v12;
  _BYTE *v13;
  int v14;
  char *v15;
  uint64_t v16;
  void *v17;
  void *v18;

  PixelFormat = IOSurfaceGetPixelFormat(a4);
  if (-[NSSet count](self->valid_pixel_formats, "count"))
  {
    valid_pixel_formats = self->valid_pixel_formats;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", PixelFormat);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSSet member:](valid_pixel_formats, "member:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      Espresso::throw_exception_selector<Espresso::invalid_argument_error>("Bad pixel format");
  }
  begin = self->multiple_buffer_io_surfaces.__begin_;
  v12 = (char *)begin + 40 * a3;
  v14 = v12[24];
  v13 = v12 + 24;
  if (!v14)
  {
    objc_storeStrong((id *)begin + 5 * a3 + 4, *((id *)begin + 5 * a3 + 1));
    *v13 = 1;
  }
  v15 = (char *)begin + 40 * a3;
  objc_msgSend(MEMORY[0x1E0CFDF50], "objectWithIOSurface:", a4);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)*((_QWORD *)v15 + 1);
  *((_QWORD *)v15 + 1) = v16;

  v18 = *(void **)v15;
  *(_QWORD *)v15 = 0;

  self->_pixelFormat = PixelFormat;
}

- (void)restoreInternalStorage:(unint64_t)a3
{
  surface_and_buffer *begin;
  char *v4;
  _BYTE *v5;
  int v6;

  begin = self->multiple_buffer_io_surfaces.__begin_;
  v4 = (char *)begin + 40 * a3;
  v6 = v4[24];
  v5 = v4 + 24;
  if (v6)
  {
    objc_storeStrong((id *)begin + 5 * a3 + 1, *((id *)begin + 5 * a3 + 4));
    *v5 = 0;
  }
}

- (void)restoreInternalStorageForAllMultiBufferFrames
{
  uint64_t v3;
  unint64_t v4;

  if (self->multiple_buffer_io_surfaces.__end_ != self->multiple_buffer_io_surfaces.__begin_)
  {
    v3 = 0;
    v4 = 0;
    do
    {
      -[EspressoANEIOSurface restoreInternalStorage:](self, "restoreInternalStorage:", v3 >> 32);
      ++v4;
      v3 += 0x100000000;
    }
    while (v4 < 0xCCCCCCCCCCCCCCCDLL
               * ((self->multiple_buffer_io_surfaces.__end_ - self->multiple_buffer_io_surfaces.__begin_) >> 3));
  }
}

- (id)metalBufferWithDevice:(id)a3 multiBufferFrame:(unint64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  surface_and_buffer *begin;
  unint64_t v10;
  void *v11;
  id v12;

  v6 = a3;
  v7 = (void *)*((_QWORD *)self->multiple_buffer_io_surfaces.__begin_ + 5 * a4);
  if (!v7)
  {
    v8 = objc_msgSend(v6, "newBufferWithIOSurface:", -[EspressoANEIOSurface ioSurfaceForMultiBufferFrame:](self, "ioSurfaceForMultiBufferFrame:", a4));
    begin = self->multiple_buffer_io_surfaces.__begin_;
    v10 = 5 * a4;
    v11 = (void *)*((_QWORD *)begin + v10);
    *((_QWORD *)begin + v10) = v8;

    v7 = (void *)*((_QWORD *)self->multiple_buffer_io_surfaces.__begin_ + v10);
  }
  v12 = v7;

  return v12;
}

- (unsigned)pixelFormat
{
  return self->_pixelFormat;
}

- (shared_ptr<Espresso::blob<unsigned)external_storage_blob_for_aliasing_mem
{
  void **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<Espresso::blob<unsigned char, 1>> result;

  cntrl = self->_external_storage_blob_for_aliasing_mem.__cntrl_;
  *v2 = self->_external_storage_blob_for_aliasing_mem.__ptr_;
  v2[1] = cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = self;
  return result;
}

- (void).cxx_destruct
{
  surface_and_buffer *begin;
  surface_and_buffer *end;
  surface_and_buffer *v5;

  std::shared_ptr<void>::~shared_ptr[abi:ne180100]((uint64_t)&self->_external_storage_blob_for_aliasing_mem);
  objc_storeStrong((id *)&self->valid_pixel_formats, 0);
  begin = self->multiple_buffer_io_surfaces.__begin_;
  if (begin)
  {
    end = self->multiple_buffer_io_surfaces.__end_;
    v5 = self->multiple_buffer_io_surfaces.__begin_;
    if (end != begin)
    {
      do
      {
        end = (surface_and_buffer *)((char *)end - 40);
        std::allocator<Espresso::ANERuntimeEngine::surface_and_buffer>::destroy[abi:ne180100]((id *)end);
      }
      while (end != begin);
      v5 = self->multiple_buffer_io_surfaces.__begin_;
    }
    self->multiple_buffer_io_surfaces.__end_ = begin;
    operator delete(v5);
  }
  objc_storeStrong((id *)&self->params_dict, 0);
}

@end
