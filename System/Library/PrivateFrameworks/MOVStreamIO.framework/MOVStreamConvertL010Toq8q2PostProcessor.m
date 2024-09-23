@implementation MOVStreamConvertL010Toq8q2PostProcessor

- (__CVBuffer)processedPixelBufferFrom:(__CVBuffer *)a3 metadata:(id)a4 error:(id *)a5
{
  id v8;
  size_t Width;
  size_t Height;
  MIOPixelBufferPool *pool;
  MIOPixelBufferPool *v12;
  MIOPixelBufferPool *v13;
  __CVBuffer *v14;
  __CVBuffer *v15;
  id v16;
  void *v17;
  __CVBuffer *v18;

  v8 = a4;
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  pool = self->_pool;
  if (pool
    || (+[MIOPixelBufferPool createMIOPixelBufferPoolWithWidth:height:pixelFormat:extendedPixelsPerRow:minBufferCount:](MIOPixelBufferPool, "createMIOPixelBufferPoolWithWidth:height:pixelFormat:extendedPixelsPerRow:minBufferCount:", Width, Height, 1899524402, 0, 10), v12 = (MIOPixelBufferPool *)objc_claimAutoreleasedReturnValue(), v13 = self->_pool, self->_pool = v12, v13, (pool = self->_pool) != 0))
  {
    v14 = -[MIOPixelBufferPool getPixelBuffer](pool, "getPixelBuffer");
    if (+[MIOPixelBufferUtility transferL010PixelBuffer:toq8q2PixelBuffer:](MIOPixelBufferUtility, "transferL010PixelBuffer:toq8q2PixelBuffer:", a3, v14))
    {
      if (-[MOVStreamDefaultPostProcessor shouldRemovePaddingOfPixelBuffer:metadata:](self, "shouldRemovePaddingOfPixelBuffer:metadata:", v14, v8))
      {
        v15 = -[MOVStreamDefaultPostProcessor pixelBufferWithoutPaddingFromPixelBuffer:error:](self, "pixelBufferWithoutPaddingFromPixelBuffer:error:", v14, a5);
        CVPixelBufferRelease(v14);
        v14 = v15;
      }
      else if (-[MOVStreamDefaultPostProcessor shouldChangeBytesPerRowOfPixelBuffer:](self, "shouldChangeBytesPerRowOfPixelBuffer:", a3))
      {
        -[MOVStreamDefaultPostProcessor exactBytesPerRow](self, "exactBytesPerRow");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -[MOVStreamDefaultPostProcessor pixelBufferWithExactBytesPerRow:fromPixelBuffer:error:](self, "pixelBufferWithExactBytesPerRow:fromPixelBuffer:error:", v17, v14, a5);

        CVPixelBufferRelease(v14);
        v14 = v18;
      }
      goto LABEL_13;
    }
    CVPixelBufferRelease(v14);
    CVPixelBufferRelease(a3);
    objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", CFSTR("Cannot convert L010 to q8q2 buffer."), 20);
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", CFSTR("Cannot create pixel buffer pool for q8q2 stream."), 19);
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a5)
  {
    v16 = objc_retainAutorelease(v16);
    *a5 = v16;
  }

  v14 = 0;
LABEL_13:

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pool, 0);
}

@end
