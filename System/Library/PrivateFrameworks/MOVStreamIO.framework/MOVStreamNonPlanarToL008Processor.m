@implementation MOVStreamNonPlanarToL008Processor

- (unsigned)encodedPixelFormatFromStreamData:(StreamRecordingData *)a3
{
  return 1278226488;
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
  double BytesPerPixel;
  void *v13;
  __CVBuffer *v14;
  void *v16;
  void *v17;

  p_var12 = &a4->var12;
  v9 = a4->var12;
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  BytesPerPixel = MIOCVPixelBufferGetBytesPerPixel(a3);
  if (v9)
    goto LABEL_4;
  +[MIOPixelBufferPool createMIOPixelBufferPoolWithWidth:height:pixelFormat:extendedPixelsPerRow:minBufferCount:bufferCacheMode:](MIOPixelBufferPool, "createMIOPixelBufferPoolWithWidth:height:pixelFormat:extendedPixelsPerRow:minBufferCount:bufferCacheMode:", (unint64_t)(BytesPerPixel * (double)Width), Height, 1278226488, 0, 10, a4->var22);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_storeStrong(p_var12, v13);
    v9 = v13;
LABEL_4:
    v14 = (__CVBuffer *)objc_msgSend(v9, "getPixelBuffer", BytesPerPixel);
    +[MIOPixelBufferUtility copyPixelBuffer:toPixelBuffer:](MIOPixelBufferUtility, "copyPixelBuffer:toPixelBuffer:", a3, v14);
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", CFSTR("Cannot create L008 pixel buffer pool for Non-Planar stream."), 19);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (a5)
    *a5 = objc_retainAutorelease(v16);

  v9 = 0;
  v14 = 0;
LABEL_5:

  return v14;
}

- (opaqueCMFormatDescription)createTrackFormatDescriptionFromStreamData:(StreamRecordingData *)a3
{
  return +[MOVStreamIOUtility createL008FormatDescriptionFromNonPlanarFormatDescription:](MOVStreamIOUtility, "createL008FormatDescriptionFromNonPlanarFormatDescription:", a3->var0);
}

@end
