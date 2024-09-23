@implementation MOVStreamFrameConverter

- (MOVStreamFrameConverter)init
{
  MOVStreamFrameConverter *v2;
  MOVStreamFrameConverter *v3;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MOVStreamFrameConverter;
  v2 = -[MOVStreamFrameConverter init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_transferSessionUsageDisabled = 0;
    if (VTPixelTransferSessionCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], &v2->_transferSession))
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCA98], CFSTR("Cannot create pixel buffer transfer session"), 0);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v5);
    }
  }
  return v3;
}

- (MOVStreamFrameConverter)initWithTargetWidth:(unint64_t)a3 height:(unint64_t)a4 format:(unsigned int)a5 extendedPixelsPerRow:(unint64_t)a6
{
  return -[MOVStreamFrameConverter initWithTargetWidth:height:format:extendedPixelsPerRow:bufferCacheMode:](self, "initWithTargetWidth:height:format:extendedPixelsPerRow:bufferCacheMode:", a3, a4, *(_QWORD *)&a5, a6, 0);
}

- (MOVStreamFrameConverter)initWithTargetWidth:(unint64_t)a3 height:(unint64_t)a4 format:(unsigned int)a5 bytesPerRow:(unint64_t)a6
{
  return -[MOVStreamFrameConverter initWithTargetWidth:height:format:bytesPerRow:bufferCacheMode:](self, "initWithTargetWidth:height:format:bytesPerRow:bufferCacheMode:", a3, a4, *(_QWORD *)&a5, a6, 0);
}

- (MOVStreamFrameConverter)initWithTargetWidth:(unint64_t)a3 height:(unint64_t)a4 format:(unsigned int)a5 bytesPerRows:(id)a6
{
  return -[MOVStreamFrameConverter initWithTargetWidth:height:format:bytesPerRows:bufferCacheMode:](self, "initWithTargetWidth:height:format:bytesPerRows:bufferCacheMode:", a3, a4, *(_QWORD *)&a5, a6, 0);
}

- (MOVStreamFrameConverter)initWithTargetWidth:(unint64_t)a3 height:(unint64_t)a4 format:(unsigned int)a5 extendedPixelsPerRow:(unint64_t)a6 bufferCacheMode:(int)a7
{
  uint64_t v7;
  uint64_t v9;
  MOVStreamFrameConverter *v12;
  uint64_t v13;
  MIOPixelBufferPool *pool;
  id v16;

  v7 = *(_QWORD *)&a7;
  v9 = *(_QWORD *)&a5;
  v12 = -[MOVStreamFrameConverter init](self, "init");
  if (v12)
  {
    +[MIOPixelBufferPool createMIOPixelBufferPoolWithWidth:height:pixelFormat:extendedPixelsPerRow:minBufferCount:bufferCacheMode:](MIOPixelBufferPool, "createMIOPixelBufferPoolWithWidth:height:pixelFormat:extendedPixelsPerRow:minBufferCount:bufferCacheMode:", a3, a4, v9, a6, 1, v7);
    v13 = objc_claimAutoreleasedReturnValue();
    pool = v12->_pool;
    v12->_pool = (MIOPixelBufferPool *)v13;

    if (!v12->_pool)
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCA98], CFSTR("Cannot create pixel buffer pool"), 0);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v16);
    }
  }
  return v12;
}

- (MOVStreamFrameConverter)initWithTargetWidth:(unint64_t)a3 height:(unint64_t)a4 format:(unsigned int)a5 bytesPerRow:(unint64_t)a6 bufferCacheMode:(int)a7
{
  uint64_t v7;
  uint64_t v9;
  MOVStreamFrameConverter *v12;
  uint64_t v13;
  MIOPixelBufferPool *pool;
  id v16;

  v7 = *(_QWORD *)&a7;
  v9 = *(_QWORD *)&a5;
  v12 = -[MOVStreamFrameConverter init](self, "init");
  if (v12)
  {
    +[MIOPixelBufferPool createMIOPixelBufferPoolWithWidth:height:pixelFormat:exactBytesPerRow:minBufferCount:bufferCacheMode:](MIOPixelBufferPool, "createMIOPixelBufferPoolWithWidth:height:pixelFormat:exactBytesPerRow:minBufferCount:bufferCacheMode:", a3, a4, v9, a6, 1, v7);
    v13 = objc_claimAutoreleasedReturnValue();
    pool = v12->_pool;
    v12->_pool = (MIOPixelBufferPool *)v13;

    if (!v12->_pool)
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCA98], CFSTR("Cannot create pixel buffer pool"), 0);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v16);
    }
  }
  return v12;
}

- (MOVStreamFrameConverter)initWithTargetWidth:(unint64_t)a3 height:(unint64_t)a4 format:(unsigned int)a5 bytesPerRows:(id)a6 bufferCacheMode:(int)a7
{
  uint64_t v7;
  uint64_t v8;
  id v12;
  MOVStreamFrameConverter *v13;
  uint64_t v14;
  MIOPixelBufferPool *pool;
  id v17;

  v7 = *(_QWORD *)&a7;
  v8 = *(_QWORD *)&a5;
  v12 = a6;
  v13 = -[MOVStreamFrameConverter init](self, "init");
  if (v13)
  {
    +[MIOPixelBufferPool createMIOPixelBufferPoolWithWidth:height:pixelFormat:exactBytesPerRows:minBufferCount:bufferCacheMode:](MIOPixelBufferPool, "createMIOPixelBufferPoolWithWidth:height:pixelFormat:exactBytesPerRows:minBufferCount:bufferCacheMode:", a3, a4, v8, v12, 1, v7);
    v14 = objc_claimAutoreleasedReturnValue();
    pool = v13->_pool;
    v13->_pool = (MIOPixelBufferPool *)v14;

    if (!v13->_pool)
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCA98], CFSTR("Cannot create pixel buffer pool"), 0);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v17);
    }
  }

  return v13;
}

- (void)dealloc
{
  OpaqueVTPixelTransferSession *transferSession;
  objc_super v4;

  transferSession = self->_transferSession;
  if (transferSession)
  {
    VTPixelTransferSessionInvalidate(transferSession);
    CFRelease(self->_transferSession);
  }
  v4.receiver = self;
  v4.super_class = (Class)MOVStreamFrameConverter;
  -[MOVStreamFrameConverter dealloc](&v4, sel_dealloc);
}

- (__CVBuffer)convertPixelBuffer:(__CVBuffer *)a3
{
  __CVBuffer *v5;
  __CVBuffer *v6;
  void *v7;
  uint64_t v8;
  const __CFString *v9;
  const __CFDictionary *v10;
  id v12;

  v5 = -[MIOPixelBufferPool getPixelBuffer](self->_pool, "getPixelBuffer");
  if (!v5)
  {
    v7 = (void *)MEMORY[0x24BDBCE88];
    v8 = *MEMORY[0x24BDBCA98];
    v9 = CFSTR("Cannot create new pixel buffer.");
    goto LABEL_11;
  }
  v6 = v5;
  if (!self->_transferSessionUsageDisabled)
  {
    if (!VTPixelTransferSessionTransferImage(self->_transferSession, a3, v5))
      goto LABEL_6;
    CVPixelBufferRelease(v6);
    v7 = (void *)MEMORY[0x24BDBCE88];
    v8 = *MEMORY[0x24BDBCA98];
    v9 = CFSTR("Cannot transfer pixel buffer");
LABEL_11:
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v12);
  }
  if (!+[MIOPixelBufferUtility copyPixelBuffer:toPixelBuffer:](MIOPixelBufferUtility, "copyPixelBuffer:toPixelBuffer:", a3, v5))
  {
    CVPixelBufferRelease(v6);
    v7 = (void *)MEMORY[0x24BDBCE88];
    v8 = *MEMORY[0x24BDBCA98];
    v9 = CFSTR("Cannot copy pixel buffer");
    goto LABEL_11;
  }
LABEL_6:
  v10 = CVBufferCopyAttachments(a3, kCVAttachmentMode_ShouldPropagate);
  CVBufferSetAttachments(v6, v10, kCVAttachmentMode_ShouldPropagate);
  if (v10)
    CFRelease(v10);
  return v6;
}

- (BOOL)transferSessionUsageDisabled
{
  return self->_transferSessionUsageDisabled;
}

- (void)setTransferSessionUsageDisabled:(BOOL)a3
{
  self->_transferSessionUsageDisabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pool, 0);
}

@end
