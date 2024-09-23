@implementation MOVStreamCompandedRawBayerPostProcessor

- (unsigned)processedPixelFormat
{
  if (-[MOVStreamDefaultPostProcessor originalPixelFormat](self, "originalPixelFormat"))
    return -[MOVStreamDefaultPostProcessor originalPixelFormat](self, "originalPixelFormat");
  else
    return 1278226488;
}

- (__CVBuffer)processedPixelBufferFrom:(__CVBuffer *)a3 metadata:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  size_t Width;
  size_t Height;
  __CVBuffer *v13;
  __CVBuffer *v14;
  void *v16;
  __CVBuffer *v17;
  uint64_t v18;

  v8 = a4;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("RawBayerFormat"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntValue");

  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  LODWORD(v18) = 1;
  HIDWORD(v18) = -[MOVStreamDefaultPostProcessor bufferCacheMode](self, "bufferCacheMode");
  v13 = +[MIOPixelBufferUtility createRawPixelBufferWithWidth:height:extendedRows:extendedPixelsPerRow:pixelFormat:bytesPerRowAlignment:planeAlignment:bufferCacheMode:](MIOPixelBufferUtility, "createRawPixelBufferWithWidth:height:extendedRows:extendedPixelsPerRow:pixelFormat:bytesPerRowAlignment:planeAlignment:bufferCacheMode:", Width, Height, 0, 0, v10, 1, v18);
  if (+[MIOPixelBufferUtility joinCompandedWarholBuffer:intoCompandedBayerBuffer:](MIOPixelBufferUtility, "joinCompandedWarholBuffer:intoCompandedBayerBuffer:", a3, v13))
  {
    if (-[MOVStreamDefaultPostProcessor shouldRemovePaddingOfPixelBuffer:metadata:](self, "shouldRemovePaddingOfPixelBuffer:metadata:", v13, v8))
    {
      v14 = -[MOVStreamDefaultPostProcessor pixelBufferWithoutPaddingFromPixelBuffer:error:](self, "pixelBufferWithoutPaddingFromPixelBuffer:error:", v13, a5);
      CVPixelBufferRelease(v13);
      v13 = v14;
    }
    else if (-[MOVStreamDefaultPostProcessor shouldChangeBytesPerRowOfPixelBuffer:](self, "shouldChangeBytesPerRowOfPixelBuffer:", a3))
    {
      -[MOVStreamDefaultPostProcessor exactBytesPerRow](self, "exactBytesPerRow");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[MOVStreamDefaultPostProcessor pixelBufferWithExactBytesPerRow:fromPixelBuffer:error:](self, "pixelBufferWithExactBytesPerRow:fromPixelBuffer:error:", v16, a3, a5);

      CVPixelBufferRelease(v13);
      v13 = v17;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "populateStreamError:message:code:", a5, CFSTR("Error joining Warhol-Buffer for Companded-RawBayer pixel buffer."), 2);
    v13 = 0;
  }

  return v13;
}

@end
