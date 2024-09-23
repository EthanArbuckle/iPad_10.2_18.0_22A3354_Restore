@implementation MOVStreamFrameTransform

- (MOVStreamFrameTransform)initWithRotation:(int64_t)a3 flip:(int64_t)a4 bufferCacheMode:(int)a5
{
  MOVStreamFrameTransform *v8;
  VTSessionRef *p_rotationSession;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)MOVStreamFrameTransform;
  v8 = -[MOVStreamFrameTransform init](&v16, sel_init);
  if (v8)
  {
    p_rotationSession = (VTSessionRef *)&v8->_rotationSession;
    v10 = VTPixelRotationSessionCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], &v8->_rotationSession);
    if ((_DWORD)v10)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot create pixel buffer rotation session (err: %d)"), v10);
    }
    else
    {
      v8->_bufferCacheMode = a5;
      v8->_rotation = a3;
      if ((unint64_t)a3 >= 4)
        -[MOVStreamFrameTransform initWithRotation:flip:bufferCacheMode:].cold.1();
      v11 = VTSessionSetProperty(*p_rotationSession, (CFStringRef)*MEMORY[0x24BDF9648], **((CFTypeRef **)&unk_24CA44FC8 + a3));
      if ((_DWORD)v11)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot set rotation property (err: %d)."), v11);
      }
      else if ((a4 & 0xFFFFFFFFFFFFFFFDLL) == 1
             && (v12 = VTSessionSetProperty(*p_rotationSession, (CFStringRef)*MEMORY[0x24BDF9638], (CFTypeRef)*MEMORY[0x24BDBD270]), (_DWORD)v12))
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot set horizontal flip (err: %d)."), v12);
      }
      else
      {
        if ((a4 & 0xFFFFFFFFFFFFFFFELL) != 2)
          return v8;
        v13 = VTSessionSetProperty(*p_rotationSession, (CFStringRef)*MEMORY[0x24BDF9640], (CFTypeRef)*MEMORY[0x24BDBD270]);
        if (!(_DWORD)v13)
          return v8;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot set vertical flip (err: %d)."), v13);
      }
    }
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCA98], objc_claimAutoreleasedReturnValue(), 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v15);
  }
  return v8;
}

- (MOVStreamFrameTransform)initWithRotation:(int64_t)a3 flip:(int64_t)a4
{
  return -[MOVStreamFrameTransform initWithRotation:flip:bufferCacheMode:](self, "initWithRotation:flip:bufferCacheMode:", a3, a4, 0);
}

- (void)dealloc
{
  OpaqueVTPixelRotationSession *rotationSession;
  objc_super v4;

  rotationSession = self->_rotationSession;
  if (rotationSession)
  {
    VTPixelRotationSessionInvalidate(rotationSession);
    CFRelease(self->_rotationSession);
  }
  v4.receiver = self;
  v4.super_class = (Class)MOVStreamFrameTransform;
  -[MOVStreamFrameTransform dealloc](&v4, sel_dealloc);
}

- (__CVBuffer)transform:(__CVBuffer *)a3
{
  MIOPixelBufferPool *pool;
  size_t Width;
  size_t Height;
  uint64_t PixelFormatType;
  int64_t v9;
  size_t v10;
  size_t v11;
  MIOPixelBufferPool *v12;
  MIOPixelBufferPool *v13;
  __CVBuffer *v14;
  __CVBuffer *v15;
  uint64_t v16;
  void *v18;
  uint64_t v19;
  const __CFString *v20;
  uint64_t v21;
  id v22;

  pool = self->_pool;
  if (!pool)
  {
    Width = CVPixelBufferGetWidth(a3);
    Height = CVPixelBufferGetHeight(a3);
    PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
    v9 = self->_rotation | 2;
    v10 = v9 == 3 ? Width : Height;
    v11 = v9 == 3 ? Height : Width;
    +[MIOPixelBufferPool createMIOPixelBufferPoolWithWidth:height:pixelFormat:extendedPixelsPerRow:minBufferCount:bufferCacheMode:](MIOPixelBufferPool, "createMIOPixelBufferPoolWithWidth:height:pixelFormat:extendedPixelsPerRow:minBufferCount:bufferCacheMode:", v11, v10, PixelFormatType, 0, 10, self->_bufferCacheMode);
    v12 = (MIOPixelBufferPool *)objc_claimAutoreleasedReturnValue();
    v13 = self->_pool;
    self->_pool = v12;

    pool = self->_pool;
    if (!pool)
    {
      v18 = (void *)MEMORY[0x24BDBCE88];
      v19 = *MEMORY[0x24BDBCA98];
      v20 = CFSTR("Cannot create pixel buffer pool.");
LABEL_15:
      objc_msgSend(v18, "exceptionWithName:reason:userInfo:", v19, v20, 0);
      v22 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v22);
    }
  }
  v14 = -[MIOPixelBufferPool getPixelBuffer](pool, "getPixelBuffer");
  if (!v14)
  {
    v18 = (void *)MEMORY[0x24BDBCE88];
    v19 = *MEMORY[0x24BDBCA98];
    v20 = CFSTR("Cannot create new pixel buffer.");
    goto LABEL_15;
  }
  v15 = v14;
  v16 = VTPixelRotationSessionRotateImage(self->_rotationSession, a3, v14);
  if ((_DWORD)v16)
  {
    v21 = v16;
    CVPixelBufferRelease(v15);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot rotate pixel buffer (err: %d)."), v21);
    v20 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x24BDBCE88];
    v19 = *MEMORY[0x24BDBCA98];
    goto LABEL_15;
  }
  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pool, 0);
}

- (void)initWithRotation:flip:bufferCacheMode:.cold.1()
{
  __assert_rtn("-[MOVStreamFrameTransform initWithRotation:flip:bufferCacheMode:]", "MOVStreamFrameTransform.m", 63, "0");
}

@end
