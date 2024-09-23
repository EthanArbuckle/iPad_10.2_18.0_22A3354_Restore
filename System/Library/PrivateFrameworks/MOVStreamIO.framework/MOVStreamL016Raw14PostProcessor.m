@implementation MOVStreamL016Raw14PostProcessor

- (MOVStreamL016Raw14PostProcessor)initWithOriginalPixelFormat:(unsigned int)a3 l010OutputFormatRAW14L016:(BOOL)a4
{
  MOVStreamL016Raw14PostProcessor *v5;
  MOVStreamL016Raw14PostProcessor *v6;
  MOVStreamL016Raw14PostProcessor *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MOVStreamL016Raw14PostProcessor;
  v5 = -[MOVStreamDefaultPostProcessor initWithOriginalPixelFormat:](&v9, sel_initWithOriginalPixelFormat_, *(_QWORD *)&a3);
  v6 = v5;
  if (v5)
  {
    v5->_l010OutputFormatRAW14L016 = a4;
    v7 = v5;
  }

  return v6;
}

- (MOVStreamL016Raw14PostProcessor)initWithOriginalPixelFormat:(unsigned int)a3 bufferCacheMode:(int)a4 l010OutputFormatRAW14L016:(BOOL)a5
{
  MOVStreamL016Raw14PostProcessor *v6;
  MOVStreamL016Raw14PostProcessor *v7;
  MOVStreamL016Raw14PostProcessor *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MOVStreamL016Raw14PostProcessor;
  v6 = -[MOVStreamDefaultPostProcessor initWithOriginalPixelFormat:bufferCacheMode:](&v10, sel_initWithOriginalPixelFormat_bufferCacheMode_, *(_QWORD *)&a3, *(_QWORD *)&a4);
  v7 = v6;
  if (v6)
  {
    v6->_l010OutputFormatRAW14L016 = a5;
    v8 = v6;
  }

  return v7;
}

- (unsigned)processedPixelFormat
{
  if (self->_l010OutputFormatRAW14L016)
    return 1278226742;
  else
    return -[MOVStreamDefaultPostProcessor originalPixelFormat](self, "originalPixelFormat");
}

- (__CVBuffer)processedPixelBufferFrom:(__CVBuffer *)a3 metadata:(id)a4 error:(id *)a5
{
  id v8;
  MIOPixelBufferPool *pool;
  int Width;
  int Height;
  MIOPixelBufferPool *v12;
  MIOPixelBufferPool *v13;
  __CVBuffer *v14;
  __CVBuffer *v15;
  void *v16;
  __CVBuffer *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v8 = a4;
  if (self->_l010OutputFormatRAW14L016)
  {
    pool = self->_pool;
    if (pool)
      goto LABEL_4;
    Width = CVPixelBufferGetWidth(a3);
    Height = CVPixelBufferGetHeight(a3);
    +[MIOPixelBufferPool createMIOPixelBufferPoolWithWidth:height:pixelFormat:extendedPixelsPerRow:minBufferCount:bufferCacheMode:](MIOPixelBufferPool, "createMIOPixelBufferPoolWithWidth:height:pixelFormat:extendedPixelsPerRow:minBufferCount:bufferCacheMode:", Width, Height, 1278226742, (int)((CVPixelBufferGetBytesPerRow(a3) >> 1) - Width), 10, -[MOVStreamDefaultPostProcessor bufferCacheMode](self, "bufferCacheMode"));
    v12 = (MIOPixelBufferPool *)objc_claimAutoreleasedReturnValue();
    v13 = self->_pool;
    self->_pool = v12;

    pool = self->_pool;
    if (pool)
    {
LABEL_4:
      v14 = -[MIOPixelBufferPool getPixelBuffer](pool, "getPixelBuffer");
      +[MIOPixelBufferUtility copyFromPixelBuffer:toPixelBuffer:andShiftBits:](MIOPixelBufferUtility, "copyFromPixelBuffer:toPixelBuffer:andShiftBits:", a3, v14, 4294967294);
      if (-[MOVStreamDefaultPostProcessor shouldRemovePaddingOfPixelBuffer:metadata:](self, "shouldRemovePaddingOfPixelBuffer:metadata:", v14, v8))
      {
        v15 = -[MOVStreamDefaultPostProcessor pixelBufferWithoutPaddingFromPixelBuffer:error:](self, "pixelBufferWithoutPaddingFromPixelBuffer:error:", v14, a5);
        CVPixelBufferRelease(v14);
        v14 = v15;
      }
      else if (-[MOVStreamDefaultPostProcessor shouldChangeBytesPerRowOfPixelBuffer:](self, "shouldChangeBytesPerRowOfPixelBuffer:", a3))
      {
        -[MOVStreamDefaultPostProcessor exactBytesPerRow](self, "exactBytesPerRow");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[MOVStreamDefaultPostProcessor pixelBufferWithExactBytesPerRow:fromPixelBuffer:error:](self, "pixelBufferWithExactBytesPerRow:fromPixelBuffer:error:", v16, v14, a5);

        CVPixelBufferRelease(v14);
        v14 = v17;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", CFSTR("Cannot create pixel buffer pool for Non-Planar stream."), 19);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (a5)
        *a5 = objc_retainAutorelease(v18);

      v14 = 0;
    }
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)MOVStreamL016Raw14PostProcessor;
    v14 = -[MOVStreamDefaultPostProcessor processedPixelBufferFrom:metadata:error:](&v21, sel_processedPixelBufferFrom_metadata_error_, a3, v8, a5);
  }

  return v14;
}

- (BOOL)l010OutputFormatRAW14L016
{
  return self->_l010OutputFormatRAW14L016;
}

- (void)setL010OutputFormatRAW14L016:(BOOL)a3
{
  self->_l010OutputFormatRAW14L016 = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pool, 0);
}

@end
