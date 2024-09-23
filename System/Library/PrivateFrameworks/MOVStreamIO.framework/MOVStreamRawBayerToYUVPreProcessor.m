@implementation MOVStreamRawBayerToYUVPreProcessor

- (unsigned)encodedPixelFormatFromStreamData:(StreamRecordingData *)a3
{
  return 2019963442;
}

- (opaqueCMFormatDescription)formatDescriptionForPixelBuffer:(__CVBuffer *)a3 streamData:(StreamRecordingData *)a4
{
  opaqueCMFormatDescription *result;

  result = a4->var0;
  if (!a4->var1)
  {
    if (result)
      CFRelease(result);
    result = +[MOVStreamIOUtility formatForPixelBuffer:](MOVStreamIOUtility, "formatForPixelBuffer:", a3);
    a4->var0 = result;
    a4->var1 = 1;
  }
  return result;
}

- (unsigned)inputPixelFormatFromStreamData:(StreamRecordingData *)a3
{
  return +[MOVStreamWriter getPixelFormatFromStreamData:](MOVStreamWriter, "getPixelFormatFromStreamData:", a3);
}

- (__CVBuffer)processedPixelBufferCopyOf:(__CVBuffer *)a3 streamData:(StreamRecordingData *)a4 error:(id *)a5
{
  id *p_var12;
  id v9;
  size_t Width;
  size_t Height;
  void *v12;
  __CVBuffer *v13;
  void *v15;
  void *v16;

  p_var12 = &a4->var12;
  v9 = a4->var12;
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  if (v9)
    goto LABEL_4;
  +[MIOPixelBufferPool createMIOPixelBufferPoolWithWidth:height:pixelFormat:extendedPixelsPerRow:minBufferCount:bufferCacheMode:](MIOPixelBufferPool, "createMIOPixelBufferPoolWithWidth:height:pixelFormat:extendedPixelsPerRow:minBufferCount:bufferCacheMode:", Width, Height >> 1, 2019963442, 0, 10, a4->var22);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_storeStrong(p_var12, v12);
    v9 = v12;
LABEL_4:
    v13 = (__CVBuffer *)objc_msgSend(v9, "getPixelBuffer");
    +[MIOPixelBufferUtility splitBayerBuffer:intoYUVPixelBuffer:shiftBitsLeftBy:](MIOPixelBufferUtility, "splitBayerBuffer:intoYUVPixelBuffer:shiftBitsLeftBy:", a3, v13, 2);
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", CFSTR("Cannot create pixel buffer pool for RawBayer stream."), 19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (a5)
    *a5 = objc_retainAutorelease(v15);

  v9 = 0;
  v13 = 0;
LABEL_5:

  return v13;
}

- (opaqueCMFormatDescription)createTrackFormatDescriptionFromStreamData:(StreamRecordingData *)a3
{
  return +[MOVStreamIOUtility createL008FormatDescriptionFromCompandedRawBayerFormatDescription:](MOVStreamIOUtility, "createL008FormatDescriptionFromCompandedRawBayerFormatDescription:", a3->var0);
}

@end
