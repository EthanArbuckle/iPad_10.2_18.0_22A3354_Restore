@implementation MOVStreamL008ToNonPlanarPostProcessor

- (unint64_t)adjustedWidthForWidth:(unint64_t)a3
{
  double v4;
  unint64_t v5;

  +[MOVStreamIOUtility bytesPerPixelForFormat:](MOVStreamIOUtility, "bytesPerPixelForFormat:", -[MOVStreamDefaultPostProcessor originalPixelFormat](self, "originalPixelFormat"));
  v5 = (unint64_t)v4;
  if (!(unint64_t)v4)
    v5 = 2;
  return a3 / v5;
}

- (__CVBuffer)processedPixelBufferFrom:(__CVBuffer *)a3 metadata:(id)a4 error:(id *)a5
{
  id v8;
  MIOPixelBufferPool *pool;
  size_t Width;
  MIOPixelBufferPool *v11;
  MIOPixelBufferPool *v12;
  __CVBuffer *v13;
  __CVBuffer *v14;
  void *v15;
  __CVBuffer *v16;
  void *v17;
  void *v18;

  v8 = a4;
  pool = self->_pool;
  if (pool
    || (Width = CVPixelBufferGetWidth(a3),
        +[MIOPixelBufferPool createMIOPixelBufferPoolWithWidth:height:pixelFormat:extendedPixelsPerRow:minBufferCount:bufferCacheMode:](MIOPixelBufferPool, "createMIOPixelBufferPoolWithWidth:height:pixelFormat:extendedPixelsPerRow:minBufferCount:bufferCacheMode:", -[MOVStreamL008ToNonPlanarPostProcessor adjustedWidthForWidth:](self, "adjustedWidthForWidth:", Width), CVPixelBufferGetHeight(a3), -[MOVStreamDefaultPostProcessor originalPixelFormat](self, "originalPixelFormat"), 0, 10, -[MOVStreamDefaultPostProcessor bufferCacheMode](self, "bufferCacheMode")), v11 = (MIOPixelBufferPool *)objc_claimAutoreleasedReturnValue(), v12 = self->_pool, self->_pool = v11, v12, (pool = self->_pool) != 0))
  {
    v13 = -[MIOPixelBufferPool getPixelBuffer](pool, "getPixelBuffer");
    +[MIOPixelBufferUtility copyPixelBuffer:toPixelBuffer:](MIOPixelBufferUtility, "copyPixelBuffer:toPixelBuffer:", a3, v13);
    if (-[MOVStreamDefaultPostProcessor shouldRemovePaddingOfPixelBuffer:metadata:](self, "shouldRemovePaddingOfPixelBuffer:metadata:", v13, v8))
    {
      v14 = -[MOVStreamDefaultPostProcessor pixelBufferWithoutPaddingFromPixelBuffer:error:](self, "pixelBufferWithoutPaddingFromPixelBuffer:error:", v13, a5);
      CVPixelBufferRelease(v13);
      v13 = v14;
    }
    else if (-[MOVStreamDefaultPostProcessor shouldChangeBytesPerRowOfPixelBuffer:](self, "shouldChangeBytesPerRowOfPixelBuffer:", a3))
    {
      -[MOVStreamDefaultPostProcessor exactBytesPerRow](self, "exactBytesPerRow");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[MOVStreamDefaultPostProcessor pixelBufferWithExactBytesPerRow:fromPixelBuffer:error:](self, "pixelBufferWithExactBytesPerRow:fromPixelBuffer:error:", v15, v13, a5);

      CVPixelBufferRelease(v13);
      v13 = v16;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", CFSTR("Cannot create pixel buffer pool for Non-Planar stream."), 19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (a5)
      *a5 = objc_retainAutorelease(v17);

    v13 = 0;
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pool, 0);
}

@end
