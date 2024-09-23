@implementation BWDeferredBufferIntermediate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BWDeferredBufferIntermediate)initWithBuffer:(__CVBuffer *)a3 tag:(id)a4 bufferType:(unint64_t)a5 captureFrameFlags:(unint64_t)a6 metadataTag:(id)a7 rawThumbnailsBufferTag:(id)a8 rawThumbnailsMetadataTag:(id)a9 mainRawThumbnailBufferTag:(id)a10 mainRawThumbnailMetadataTag:(id)a11 sifrRawThumbnailBufferTag:(id)a12 sifrRawThumbnailMetadataTag:(id)a13 portType:(id)a14 compressionProfile:(int)a15 URL:(id)a16
{
  BWDeferredBufferIntermediate *v22;
  BWDeferredBufferIntermediate *v23;
  objc_super v25;

  if (a3 && a5 && a15)
  {
    v25.receiver = self;
    v25.super_class = (Class)BWDeferredBufferIntermediate;
    v22 = -[BWDeferredIntermediate initWithTag:URL:](&v25, sel_initWithTag_URL_, a4, a16);
    v23 = v22;
    if (v22)
    {
      v22->_buffer = a3;
      CFRetain(a3);
      v23->_attributes = (NSDictionary *)(id)CVPixelBufferGetAttributes();
      v23->_metadataTag = (NSString *)a7;
      v23->_bufferType = a5;
      v23->_captureFrameFlags = a6;
      v23->_rawThumbnailsBufferTag = (NSString *)a8;
      v23->_rawThumbnailsMetadataTag = (NSString *)a9;
      v23->_mainRawThumbnailBufferTag = (NSString *)a10;
      v23->_mainRawThumbnailMetadataTag = (NSString *)a11;
      v23->_sifrRawThumbnailBufferTag = (NSString *)a12;
      v23->_sifrRawThumbnailMetadataTag = (NSString *)a13;
      v23->_portType = (NSString *)a14;
      v23->_compressionProfile = a15;
    }
  }
  else
  {
    FigDebugAssert3();

    return 0;
  }
  return v23;
}

- (BWDeferredBufferIntermediate)initWithBuffer:(__CVBuffer *)a3 tag:(id)a4 bufferType:(unint64_t)a5 captureFrameFlags:(unint64_t)a6 metadataTag:(id)a7 portType:(id)a8 compressionProfile:(int)a9 URL:(id)a10
{
  uint64_t v11;

  LODWORD(v11) = a9;
  return -[BWDeferredBufferIntermediate initWithBuffer:tag:bufferType:captureFrameFlags:metadataTag:rawThumbnailsBufferTag:rawThumbnailsMetadataTag:mainRawThumbnailBufferTag:mainRawThumbnailMetadataTag:sifrRawThumbnailBufferTag:sifrRawThumbnailMetadataTag:portType:compressionProfile:URL:](self, "initWithBuffer:tag:bufferType:captureFrameFlags:metadataTag:rawThumbnailsBufferTag:rawThumbnailsMetadataTag:mainRawThumbnailBufferTag:mainRawThumbnailMetadataTag:sifrRawThumbnailBufferTag:sifrRawThumbnailMetadataTag:portType:compressionProfile:URL:", a3, a4, a5, a6, a7, 0, 0, 0, 0, 0, 0, a8, v11, a10);
}

- (BWDeferredBufferIntermediate)initWithCoder:(id)a3
{
  BWDeferredBufferIntermediate *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BWDeferredBufferIntermediate;
  v4 = -[BWDeferredIntermediate initWithCoder:](&v10, sel_initWithCoder_);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v4->_attributes = (NSDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, v7, v8, objc_opt_class(), 0), CFSTR("attributes"));
    v4->_metadataTag = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metadataTag"));
    v4->_bufferType = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bufferType")), "unsignedIntegerValue");
    v4->_captureFrameFlags = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("captureFrameFlags")), "unsignedIntegerValue");
    v4->_rawThumbnailsBufferTag = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rawThumbnailsBufferTag"));
    v4->_rawThumbnailsMetadataTag = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rawThumbnailsMetadataTag"));
    v4->_mainRawThumbnailBufferTag = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mainRawThumbnailBufferTag"));
    v4->_mainRawThumbnailMetadataTag = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mainRawThumbnailMetadataTag"));
    v4->_sifrRawThumbnailBufferTag = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sifrRawThumbnailBufferTag"));
    v4->_sifrRawThumbnailMetadataTag = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sifrRawThumbnailMetadataTag"));
    v4->_portType = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("portType"));
    v4->_compressionProfile = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("compressionProfile")), "unsignedIntegerValue");
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  NSDictionary *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BWDeferredBufferIntermediate;
  -[BWDeferredIntermediate encodeWithCoder:](&v8, sel_encodeWithCoder_);
  v5 = self->_attributes;
  if (objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("PixelFormatDescription")), "objectForKeyedSubscript:", CFSTR("FillExtendedPixelsCallback")))
  {
    v6 = (void *)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("PixelFormatDescription")), "mutableCopy");
    objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, CFSTR("FillExtendedPixelsCallback"));
    v7 = (void *)-[NSDictionary mutableCopy](v5, "mutableCopy");
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("PixelFormatDescription"));

    v5 = (NSDictionary *)objc_msgSend(v7, "copy");
  }
  objc_msgSend(a3, "encodeObject:forKey:", v5, CFSTR("attributes"));

  objc_msgSend(a3, "encodeObject:forKey:", self->_metadataTag, CFSTR("metadataTag"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_bufferType), CFSTR("bufferType"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_captureFrameFlags), CFSTR("captureFrameFlags"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_rawThumbnailsBufferTag, CFSTR("rawThumbnailsBufferTag"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_rawThumbnailsMetadataTag, CFSTR("rawThumbnailsMetadataTag"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_mainRawThumbnailBufferTag, CFSTR("mainRawThumbnailBufferTag"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_mainRawThumbnailMetadataTag, CFSTR("mainRawThumbnailMetadataTag"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_sifrRawThumbnailBufferTag, CFSTR("sifrRawThumbnailBufferTag"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_sifrRawThumbnailMetadataTag, CFSTR("sifrRawThumbnailMetadataTag"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_portType, CFSTR("portType"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_compressionProfile), CFSTR("compressionProfile"));
}

- (void)dealloc
{
  __CVBuffer *buffer;
  objc_super v4;

  buffer = self->_buffer;
  if (buffer)
    CFRelease(buffer);

  v4.receiver = self;
  v4.super_class = (Class)BWDeferredBufferIntermediate;
  -[BWDeferredIntermediate dealloc](&v4, sel_dealloc);
}

- (int)setURL:(id)a3 prefetchQueue:(id)a4
{
  _opaque_pthread_mutex_t *p_lock;
  int v8;
  uint64_t *v10;
  int v11;
  _QWORD block[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  int v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  p_lock = &self->super._lock;
  pthread_mutex_lock(&self->super._lock);
  if (!a3)
  {
    FigDebugAssert3();
    v10 = v14;
    v11 = -16134;
LABEL_9:
    *((_DWORD *)v10 + 6) = v11;
    goto LABEL_6;
  }
  if (self->_buffer || self->super._URL)
  {
    FigDebugAssert3();
    v10 = v14;
    v11 = -16135;
    goto LABEL_9;
  }
  self->super._URL = (NSURL *)objc_msgSend(a3, "copy");
  if (a4)
  {
    self->super._prefetching = 1;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__BWDeferredBufferIntermediate_setURL_prefetchQueue___block_invoke;
    block[3] = &unk_1E491F1A0;
    block[4] = self;
    block[5] = &v13;
    dispatch_async((dispatch_queue_t)a4, block);
  }
LABEL_6:
  pthread_mutex_unlock(p_lock);
  v8 = *((_DWORD *)v14 + 6);
  _Block_object_dispose(&v13, 8);
  return v8;
}

uint64_t __53__BWDeferredBufferIntermediate_setURL_prefetchQueue___block_invoke(uint64_t a1)
{
  CFTypeRef v2;

  v2 = -[BWDeferredBufferIntermediate _read:](*(CFTypeRef *)(a1 + 32), (int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    FigDebugAssert3();
  pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 8));
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    if (v2)
      CFRelease(v2);
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152) = v2;
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 144) = 0;
  pthread_cond_signal((pthread_cond_t *)(*(_QWORD *)(a1 + 32) + 72));
  return pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 8));
}

- (CFTypeRef)_read:(CFTypeRef)result
{
  uint64_t v2;
  uint64_t v4;
  id v5;
  void *v6;
  int v7;
  unsigned __int8 v8;
  char v9;
  int Container;
  unsigned __int8 v11;
  int v12;
  char v13;
  int ImageForIndex;
  int v15;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v17;
  id v18;
  CFTypeRef cf;
  CFTypeRef v20;
  CFTypeRef v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v4 = (uint64_t)result;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v20 = 0;
  v21 = 0;
  cf = 0;
  FigGetUpTimeNanoseconds();
  if (!*(_QWORD *)(v4 + 128) || *(_QWORD *)(v4 + 152))
  {
    FigDebugAssert3();
    v6 = 0;
    v15 = -16135;
    goto LABEL_20;
  }
  if (!*(_QWORD *)(v4 + 160))
  {
    FigDebugAssert3();
    v6 = 0;
    v15 = -16132;
    goto LABEL_20;
  }
  v18 = 0;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:options:error:", *(_QWORD *)(v4 + 128), 0, &v18);
  if (!v6)
  {
    LODWORD(v17) = 0;
    FigDebugAssert3();
    objc_msgSend(v18, "code", v17, v2);
    v15 = FigSignalErrorAt();
    goto LABEL_19;
  }
  v7 = CMPhotoDecompressionSessionCreate();
  if (v7)
  {
    v15 = v7;
    goto LABEL_39;
  }
  v8 = objc_msgSend((id)objc_msgSend(*(id *)(v4 + 160), "objectForKeyedSubscript:", *MEMORY[0x1E0CA90E0]), "unsignedIntValue");
  v9 = objc_msgSend((id)objc_msgSend(*(id *)(v4 + 160), "objectForKeyedSubscript:", *MEMORY[0x1E0CA8FD8]), "unsignedIntValue");
  Container = CMPhotoDecompressionSessionCreateContainer();
  if (Container)
  {
    v15 = Container;
    goto LABEL_39;
  }
  if (*(_DWORD *)(v4 + 248) == 1)
  {
    v11 = objc_msgSend((id)objc_msgSend(*(id *)(v4 + 160), "objectForKeyedSubscript:", *MEMORY[0x1E0CA8FA0]), "unsignedIntValue")+ v9;
    if (((v8 | v11) & 7) == 0 || !(v8 & 0xF | v11 & 3))
    {
      v12 = -[BWDeferredBufferIntermediate _createCVPixelBufferFromAttributes:pixelBuffer:](v4, *(void **)(v4 + 160), (CVPixelBufferRef *)&cf);
      if (!v12)
      {
        objc_msgSend(v5, "setObject:forKeyedSubscript:", cf, *MEMORY[0x1E0D095A8]);
        v13 = 0;
        goto LABEL_14;
      }
      v15 = v12;
LABEL_39:
      FigDebugAssert3();
      goto LABEL_20;
    }
  }
  v13 = 1;
LABEL_14:
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E4A01868, *MEMORY[0x1E0D09538]);
  if (v20 && (ImageForIndex = CMPhotoDecompressionContainerCreateImageForIndex()) != 0)
  {
    v15 = ImageForIndex;
    FigDebugAssert3();
    if ((v13 & 1) != 0)
      goto LABEL_20;
  }
  else
  {
    v15 = 0;
    if ((v13 & 1) != 0)
      goto LABEL_21;
  }
  if (cf)
    CFRelease(cf);
LABEL_19:
  if (v15)
LABEL_20:
    cf = 0;
LABEL_21:

  if (v20)
    CFRelease(v20);
  if (v21)
    CFRelease(v21);

  if (a2)
    *a2 = v15;
  FigGetUpTimeNanoseconds();
  if (dword_1ECFE9AB0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return cf;
}

- (int)setBuffer:(__CVBuffer *)a3
{
  _opaque_pthread_mutex_t *p_lock;
  int v6;

  p_lock = &self->super._lock;
  pthread_mutex_lock(&self->super._lock);
  if (self->_buffer || self->super._URL)
  {
    FigDebugAssert3();
    v6 = -16135;
  }
  else
  {
    self->_buffer = a3;
    CFRetain(a3);
    v6 = 0;
  }
  pthread_mutex_unlock(p_lock);
  return v6;
}

- (void)releaseBuffer
{
  _opaque_pthread_mutex_t *p_lock;
  __CVBuffer *buffer;

  p_lock = &self->super._lock;
  pthread_mutex_lock(&self->super._lock);
  buffer = self->_buffer;
  if (buffer)
  {
    CFRelease(buffer);
    self->_buffer = 0;
  }
  pthread_mutex_unlock(p_lock);
}

- (uint64_t)_compressionSettingsForProfile:(int *)a3 format:(uint64_t *)a4 options:
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  _QWORD v12[4];
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    if (a2 && a3 && a4)
    {
      if (a2 == 2)
      {
        v9 = *MEMORY[0x1E0D09418];
        v11[0] = *MEMORY[0x1E0D09378];
        v11[1] = v9;
        v12[0] = &unk_1E49FB6B8;
        v12[1] = &unk_1E49FB6D0;
        v10 = *MEMORY[0x1E0D09440];
        v11[2] = *MEMORY[0x1E0D09410];
        v11[3] = v10;
        v12[2] = &unk_1E49FB6E8;
        v12[3] = MEMORY[0x1E0C9AAA0];
        v7 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
        v8 = 1;
LABEL_11:
        result = 0;
        *a3 = v8;
        *a4 = v7;
        return result;
      }
      if (a2 == 1)
      {
        if (_compressionSettingsForProfile_format_options__onceToken != -1)
          dispatch_once(&_compressionSettingsForProfile_format_options__onceToken, &__block_literal_global_99);
        v6 = *MEMORY[0x1E0D09340];
        v13[0] = *MEMORY[0x1E0D09378];
        v13[1] = v6;
        v14[0] = &unk_1E49FB6A0;
        v14[1] = MEMORY[0x1E0C9AAB0];
        v13[2] = *MEMORY[0x1E0D09440];
        v14[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2);
        v7 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
        v8 = 0;
        goto LABEL_11;
      }
    }
    else
    {
      FigDebugAssert3();
    }
    return 4294951162;
  }
  return result;
}

- (uint64_t)_createCVPixelBufferFromAttributes:(CVPixelBufferRef *)a3 pixelBuffer:
{
  void *v5;
  size_t v6;
  size_t v7;
  OSType v8;
  CVPixelBufferRef pixelBufferOut;

  if (result)
  {
    v5 = (void *)result;
    pixelBufferOut = 0;
    v6 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0CA90E0]), "unsignedLongValue");
    v7 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0CA8FD8]), "unsignedLongValue");
    v8 = objc_msgSend(v5, "pixelFormat");
    if (v8)
    {
      result = CVPixelBufferCreate(0, v6, v7, v8, (CFDictionaryRef)a2, &pixelBufferOut);
      if ((_DWORD)result)
      {
        FigDebugAssert3();
        result = FigSignalErrorAt();
      }
    }
    else
    {
      FigDebugAssert3();
      result = 4294954516;
    }
    if (a3)
      *a3 = pixelBufferOut;
  }
  return result;
}

- (uint64_t)_writeAndReleaseBacking
{
  _DWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const void *v12;
  uint64_t v13;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v16;
  unsigned int v17;
  CFTypeRef cf;
  uint64_t v19;
  _QWORD v20[5];
  _QWORD v21[6];

  v21[5] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v19 = 0;
  FigGetUpTimeNanoseconds();
  v2 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  cf = 0;
  v17 = 0;
  v16 = 0;
  if (*(_QWORD *)(a1 + 152) && *(_QWORD *)(a1 + 128))
  {
    v3 = CMPhotoCompressionSessionCreate();
    if ((_DWORD)v3)
    {
      v13 = v3;
    }
    else
    {
      v4 = -[BWDeferredBufferIntermediate _compressionSettingsForProfile:format:options:](a1, *(_DWORD *)(a1 + 248), (int *)&v17, &v16);
      if ((_DWORD)v4)
      {
        v13 = v4;
      }
      else
      {
        v20[0] = *MEMORY[0x1E0D09318];
        v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v17);
        v6 = *MEMORY[0x1E0D09308];
        v21[0] = v5;
        v21[1] = &unk_1E49FB700;
        v7 = *MEMORY[0x1E0D092F8];
        v20[1] = v6;
        v20[2] = v7;
        v8 = *MEMORY[0x1E0D09328];
        v21[2] = *(_QWORD *)(a1 + 128);
        v21[3] = &unk_1E49FB718;
        v9 = *MEMORY[0x1E0D09310];
        v20[3] = v8;
        v20[4] = v9;
        v21[4] = MEMORY[0x1E0C9AAB0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 5);
        v10 = CMPhotoCompressionSessionOpenEmptyContainer();
        if ((_DWORD)v10)
        {
          v13 = v10;
        }
        else
        {
          v11 = CMPhotoCompressionSessionAddImage();
          if (!(_DWORD)v11)
          {
            v12 = *(const void **)(a1 + 152);
            if (v12)
            {
              CFRelease(v12);
              v13 = 0;
              *(_QWORD *)(a1 + 152) = 0;
            }
            else
            {
              v13 = 0;
            }
            goto LABEL_13;
          }
          v13 = v11;
        }
      }
    }
    FigDebugAssert3();
  }
  else
  {
    FigDebugAssert3();
    v13 = 4294951160;
  }
LABEL_13:
  if (cf)
  {
    v13 = CMPhotoCompressionSessionCloseContainer();
    if (cf)
      CFRelease(cf);
  }
  if (*v2 == 1)
    kdebug_trace();
  FigGetUpTimeNanoseconds();
  if (dword_1ECFE9AB0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v13;
}

- (id)fetchAndRetain:(int *)a3
{
  _opaque_pthread_mutex_t *p_lock;
  id result;
  int v7;

  v7 = 0;
  p_lock = &self->super._lock;
  pthread_mutex_lock(&self->super._lock);
  if (self->super._prefetching)
    pthread_cond_wait(&self->super._cv, p_lock);
  if (!self->_buffer)
    self->_buffer = (__CVBuffer *)-[BWDeferredBufferIntermediate _read:](self, &v7);
  pthread_mutex_unlock(p_lock);
  if (a3)
    *a3 = v7;
  result = self->_buffer;
  if (result)
  {
    CFRetain(result);
    return self->_buffer;
  }
  return result;
}

- (id)archive:(int *)a3
{
  _opaque_pthread_mutex_t *p_lock;
  __CVBuffer *buffer;
  __IOSurface *IOSurface;
  xpc_object_t XPCObject;
  void *v9;
  int v10;

  p_lock = &self->super._lock;
  pthread_mutex_lock(&self->super._lock);
  buffer = self->_buffer;
  if (buffer)
  {
    IOSurface = CVPixelBufferGetIOSurface(buffer);
    if (IOSurface)
    {
      XPCObject = IOSurfaceCreateXPCObject(IOSurface);
      v9 = XPCObject;
      if (XPCObject)
      {
        CFAutorelease(XPCObject);
        v10 = 0;
        goto LABEL_5;
      }
      FigDebugAssert3();
    }
    else
    {
      FigDebugAssert3();
      v9 = 0;
    }
    v10 = -16133;
  }
  else
  {
    FigDebugAssert3();
    v9 = 0;
    v10 = -16136;
  }
LABEL_5:
  pthread_mutex_unlock(p_lock);
  if (a3)
    *a3 = v10;
  return v9;
}

- (int)flush
{
  _opaque_pthread_mutex_t *p_lock;
  int v4;

  p_lock = &self->super._lock;
  pthread_mutex_lock(&self->super._lock);
  if (!self->super._URL)
    goto LABEL_10;
  if (!self->_buffer)
  {
    if (!self->super._dirty)
      goto LABEL_8;
LABEL_10:
    FigDebugAssert3();
    v4 = -16136;
    goto LABEL_9;
  }
  if (!self->super._dirty)
  {
LABEL_8:
    v4 = 0;
    goto LABEL_9;
  }
  v4 = -[BWDeferredBufferIntermediate _writeAndReleaseBacking]((uint64_t)self);
  if (v4)
    FigDebugAssert3();
  self->super._dirty = 0;
LABEL_9:
  pthread_mutex_unlock(p_lock);
  return v4;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  NSString *v5;
  uint64_t v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[BWDeferredIntermediate tag](self, "tag");
  v6 = BWStillImageProcessorTypeToShortString(self->_bufferType);
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>: tag:%@ bufferType:%@ captureFrameFlags:%@ portType:%@ metadataTag:%@ bufferAttributes:%@"), v4, self, v5, v6, BWStillImageCaptureFrameFlagsToShortString(self->_captureFrameFlags), self->_portType, self->_metadataTag, self->_attributes);
}

- (id)_shortString
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v3 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_attributes, "objectForKeyedSubscript:", *MEMORY[0x1E0CA90E0]), "unsignedIntValue");
  v4 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_attributes, "objectForKeyedSubscript:", *MEMORY[0x1E0CA8FD8]), "unsignedIntValue");
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = BWStillImageProcessorTypeToShortString(self->_bufferType);
  v7 = BWStillImageCaptureFrameFlagsToShortString(self->_captureFrameFlags);
  return (id)objc_msgSend(v5, "stringWithFormat:", CFSTR("'%@ - %@' ('%@', %dx%d)"), v6, v7, BWStringFromCVPixelFormatType(-[BWDeferredBufferIntermediate pixelFormat](self, "pixelFormat")), v3, v4);
}

- (unsigned)pixelFormat
{
  id v2;

  v2 = -[NSDictionary objectForKeyedSubscript:](self->_attributes, "objectForKeyedSubscript:", *MEMORY[0x1E0CA9040]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = (id)objc_msgSend(v2, "firstObject");
  return objc_msgSend(v2, "unsignedIntValue");
}

- (__CVBuffer)buffer
{
  return self->_buffer;
}

- (unint64_t)bufferType
{
  return self->_bufferType;
}

- (unint64_t)captureFrameFlags
{
  return self->_captureFrameFlags;
}

- (NSString)metadataTag
{
  return self->_metadataTag;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (NSString)rawThumbnailsBufferTag
{
  return self->_rawThumbnailsBufferTag;
}

- (NSString)rawThumbnailsMetadataTag
{
  return self->_rawThumbnailsMetadataTag;
}

- (NSString)mainRawThumbnailBufferTag
{
  return self->_mainRawThumbnailBufferTag;
}

- (NSString)mainRawThumbnailMetadataTag
{
  return self->_mainRawThumbnailMetadataTag;
}

- (NSString)sifrRawThumbnailBufferTag
{
  return self->_sifrRawThumbnailBufferTag;
}

- (NSString)sifrRawThumbnailMetadataTag
{
  return self->_sifrRawThumbnailMetadataTag;
}

- (NSString)portType
{
  return self->_portType;
}

- (int)compressionProfile
{
  return self->_compressionProfile;
}

@end
