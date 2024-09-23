@implementation MOVStreamCompandedRawBayerPreProcessor

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
  __CVBuffer *v10;
  __CVBuffer *v11;

  p_var12 = &a4->var12;
  v9 = a4->var12;
  if (!v9)
  {
    +[MIOPixelBufferPool createNewL008MIOPixelBufferPoolWithReferencePixelBuffer:minBufferCount:bufferCacheMode:](MIOPixelBufferPool, "createNewL008MIOPixelBufferPoolWithReferencePixelBuffer:minBufferCount:bufferCacheMode:", a3, 10, a4->var22);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "populateStreamError:message:code:", a5, CFSTR("Cannot create pixel buffer pool for RawBayer stream."), 19);
      v10 = 0;
      goto LABEL_8;
    }
    objc_storeStrong(p_var12, v9);
  }
  v10 = (__CVBuffer *)objc_msgSend(v9, "getPixelBuffer");
  if (+[MIOPixelBufferUtility bufferHasPadding:](MIOPixelBufferUtility, "bufferHasPadding:", a3))
  {
    v11 = +[MIOPixelBufferUtility stripBufferPadding:](MIOPixelBufferUtility, "stripBufferPadding:", a3);
    +[MIOPixelBufferUtility splitCompandedBayerBuffer:intoCompandedWarholPixelBuffer:](MIOPixelBufferUtility, "splitCompandedBayerBuffer:intoCompandedWarholPixelBuffer:", v11, v10);
    CVPixelBufferRelease(v11);
  }
  else
  {
    +[MIOPixelBufferUtility splitCompandedBayerBuffer:intoCompandedWarholPixelBuffer:](MIOPixelBufferUtility, "splitCompandedBayerBuffer:intoCompandedWarholPixelBuffer:", a3, v10);
  }
LABEL_8:

  return v10;
}

- (opaqueCMFormatDescription)createTrackFormatDescriptionFromStreamData:(StreamRecordingData *)a3
{
  return +[MOVStreamIOUtility createL008FormatDescriptionFromCompandedRawBayerFormatDescription:](MOVStreamIOUtility, "createL008FormatDescriptionFromCompandedRawBayerFormatDescription:", a3->var0);
}

@end
