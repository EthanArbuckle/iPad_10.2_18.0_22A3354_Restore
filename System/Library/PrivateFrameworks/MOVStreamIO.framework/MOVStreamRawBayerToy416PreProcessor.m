@implementation MOVStreamRawBayerToy416PreProcessor

- (unsigned)encodedPixelFormatFromStreamData:(StreamRecordingData *)a3
{
  return 2033463606;
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
  +[MIOPixelBufferPool createMIOPixelBufferPoolWithWidth:height:pixelFormat:extendedPixelsPerRow:minBufferCount:bufferCacheMode:](MIOPixelBufferPool, "createMIOPixelBufferPoolWithWidth:height:pixelFormat:extendedPixelsPerRow:minBufferCount:bufferCacheMode:", Width, Height, 2033463606, 0, 10, a4->var22);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_storeStrong(p_var12, v12);
    v9 = v12;
LABEL_4:
    v13 = (__CVBuffer *)objc_msgSend(v9, "getPixelBuffer");
    +[MIOPixelBufferUtility copyMonochromeBuffer:toAlphaChannelOfBuffer:](MIOPixelBufferUtility, "copyMonochromeBuffer:toAlphaChannelOfBuffer:", a3, v13);
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
  CMVideoDimensions Dimensions;
  const __CFDictionary *v4;
  opaqueCMFormatDescription *v5;
  CVPixelBufferRef texture;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  Dimensions = CMVideoFormatDescriptionGetDimensions(a3->var0);
  texture = 0;
  v8 = *MEMORY[0x24BDC5668];
  v9[0] = MEMORY[0x24BDBD1B8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v4 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], Dimensions.width, *(uint64_t *)&Dimensions >> 32, 0x79343136u, v4, &texture);
  v5 = +[MOVStreamIOUtility formatForPixelBuffer:](MOVStreamIOUtility, "formatForPixelBuffer:", texture);
  CVPixelBufferRelease(texture);

  return v5;
}

@end
