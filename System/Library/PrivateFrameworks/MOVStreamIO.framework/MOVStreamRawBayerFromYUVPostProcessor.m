@implementation MOVStreamRawBayerFromYUVPostProcessor

- (MOVStreamRawBayerFromYUVPostProcessor)initWithOriginalPixelFormat:(unsigned int)a3 rawBayerMSBReplication:(BOOL)a4
{
  MOVStreamRawBayerFromYUVPostProcessor *v5;
  MOVStreamRawBayerFromYUVPostProcessor *v6;
  MOVStreamRawBayerFromYUVPostProcessor *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MOVStreamRawBayerFromYUVPostProcessor;
  v5 = -[MOVStreamDefaultPostProcessor initWithOriginalPixelFormat:](&v9, sel_initWithOriginalPixelFormat_, *(_QWORD *)&a3);
  v6 = v5;
  if (v5)
  {
    v5->_rawBayerMSBReplication = a4;
    v7 = v5;
  }

  return v6;
}

- (MOVStreamRawBayerFromYUVPostProcessor)initWithOriginalPixelFormat:(unsigned int)a3 bufferCacheMode:(int)a4 rawBayerMSBReplication:(BOOL)a5
{
  MOVStreamRawBayerFromYUVPostProcessor *v6;
  MOVStreamRawBayerFromYUVPostProcessor *v7;
  MOVStreamRawBayerFromYUVPostProcessor *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MOVStreamRawBayerFromYUVPostProcessor;
  v6 = -[MOVStreamDefaultPostProcessor initWithOriginalPixelFormat:bufferCacheMode:](&v10, sel_initWithOriginalPixelFormat_bufferCacheMode_, *(_QWORD *)&a3, *(_QWORD *)&a4);
  v7 = v6;
  if (v6)
  {
    v6->_rawBayerMSBReplication = a5;
    v8 = v6;
  }

  return v7;
}

- (unsigned)processedPixelFormat
{
  if (-[MOVStreamDefaultPostProcessor originalPixelFormat](self, "originalPixelFormat"))
    return -[MOVStreamDefaultPostProcessor originalPixelFormat](self, "originalPixelFormat");
  else
    return 1919379252;
}

- (__CVBuffer)processedPixelBufferFrom:(__CVBuffer *)a3 metadata:(id)a4 error:(id *)a5
{
  id v8;
  size_t Width;
  int Height;
  uint64_t v11;
  __CVBuffer *v12;
  __CVBuffer *v13;
  void *v14;
  void *v15;
  void *v17;
  __CVBuffer *v18;
  uint64_t v19;

  v8 = a4;
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  v11 = -[MOVStreamRawBayerFromYUVPostProcessor processedPixelFormat](self, "processedPixelFormat");
  LODWORD(v19) = 1;
  HIDWORD(v19) = -[MOVStreamDefaultPostProcessor bufferCacheMode](self, "bufferCacheMode");
  v12 = +[MIOPixelBufferUtility createRawPixelBufferWithWidth:height:extendedRows:extendedPixelsPerRow:pixelFormat:bytesPerRowAlignment:planeAlignment:bufferCacheMode:](MIOPixelBufferUtility, "createRawPixelBufferWithWidth:height:extendedRows:extendedPixelsPerRow:pixelFormat:bytesPerRowAlignment:planeAlignment:bufferCacheMode:", Width, (2 * Height), 0, 0, v11, 1, v19);
  if (+[MIOPixelBufferUtility joinYUVBuffer:intoRawBayerPixelBuffer:shiftBitsLeftBy:msbReplication:](MIOPixelBufferUtility, "joinYUVBuffer:intoRawBayerPixelBuffer:shiftBitsLeftBy:msbReplication:", a3, v12, 4294967294, self->_rawBayerMSBReplication))
  {
    if (-[MOVStreamDefaultPostProcessor shouldRemovePaddingOfPixelBuffer:metadata:](self, "shouldRemovePaddingOfPixelBuffer:metadata:", v12, v8))
    {
      v13 = -[MOVStreamDefaultPostProcessor pixelBufferWithoutPaddingFromPixelBuffer:error:](self, "pixelBufferWithoutPaddingFromPixelBuffer:error:", v12, a5);
      CVPixelBufferRelease(v12);
      v12 = v13;
    }
    else if (-[MOVStreamDefaultPostProcessor shouldChangeBytesPerRowOfPixelBuffer:](self, "shouldChangeBytesPerRowOfPixelBuffer:", a3))
    {
      -[MOVStreamDefaultPostProcessor exactBytesPerRow](self, "exactBytesPerRow");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[MOVStreamDefaultPostProcessor pixelBufferWithExactBytesPerRow:fromPixelBuffer:error:](self, "pixelBufferWithExactBytesPerRow:fromPixelBuffer:error:", v17, a3, a5);

      CVPixelBufferRelease(v12);
      v12 = v18;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", CFSTR("Error joining Warhol-Buffer for RawBayer pixel buffer."), 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (a5)
      *a5 = objc_retainAutorelease(v14);

    v12 = 0;
  }

  return v12;
}

- (BOOL)rawBayerMSBReplication
{
  return self->_rawBayerMSBReplication;
}

- (void)setRawBayerMSBReplication:(BOOL)a3
{
  self->_rawBayerMSBReplication = a3;
}

@end
