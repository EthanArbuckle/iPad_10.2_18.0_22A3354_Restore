@implementation MOVStreamRawBayerTo1stPlaneYUVPreProcessor

- (unsigned)encodedPixelFormatFromStreamData:(StreamRecordingData *)a3
{
  return 2019963440;
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
  void *v11;
  __CVBuffer *v12;
  void *v14;
  void *v15;

  p_var12 = &a4->var12;
  v9 = a4->var12;
  if (v9)
    goto LABEL_4;
  Width = CVPixelBufferGetWidth(a3);
  +[MIOPixelBufferPool createMIOPixelBufferPoolWithWidth:height:pixelFormat:extendedPixelsPerRow:minBufferCount:bufferCacheMode:](MIOPixelBufferPool, "createMIOPixelBufferPoolWithWidth:height:pixelFormat:extendedPixelsPerRow:minBufferCount:bufferCacheMode:", Width, CVPixelBufferGetHeight(a3), 2019963440, 0, 10, a4->var22);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v9 = v11;
    objc_storeStrong(p_var12, v11);
LABEL_4:
    v12 = (__CVBuffer *)objc_msgSend(v9, "getPixelBuffer");
    +[MIOPixelBufferUtility splitBayerBuffer:intoWarholPixelBuffer:shiftBitsLeftBy:](MIOPixelBufferUtility, "splitBayerBuffer:intoWarholPixelBuffer:shiftBitsLeftBy:", a3, v12, 2);
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", CFSTR("Cannot create pixel buffer pool for RawBayer stream."), 19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (a5)
    *a5 = objc_retainAutorelease(v14);

  v9 = 0;
  v12 = 0;
LABEL_5:

  return v12;
}

- (opaqueCMFormatDescription)createTrackFormatDescriptionFromStreamData:(StreamRecordingData *)a3
{
  return +[MOVStreamIOUtility createxf20FormatDescriptionFromRawBayerFormatDescription:usingFirstPlaneOnly:](MOVStreamIOUtility, "createxf20FormatDescriptionFromRawBayerFormatDescription:usingFirstPlaneOnly:", a3->var0, 1);
}

@end
