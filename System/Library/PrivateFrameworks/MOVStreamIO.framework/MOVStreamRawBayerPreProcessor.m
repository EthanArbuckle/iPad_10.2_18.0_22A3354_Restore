@implementation MOVStreamRawBayerPreProcessor

- (unsigned)encodedPixelFormatFromStreamData:(StreamRecordingData *)a3
{
  return 1278226736;
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
  void *v10;
  __CVBuffer *v11;
  __CVBuffer *v12;
  void *v13;
  void *v14;

  p_var12 = &a4->var12;
  v9 = a4->var12;
  if (v9)
    goto LABEL_4;
  +[MIOPixelBufferPool createNewL010MIOPixelBufferPoolWithReferencePixelBuffer:minBufferCount:bufferCacheMode:](MIOPixelBufferPool, "createNewL010MIOPixelBufferPoolWithReferencePixelBuffer:minBufferCount:bufferCacheMode:", a3, 10, a4->var22);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v9 = v10;
    objc_storeStrong(p_var12, v10);
LABEL_4:
    v11 = (__CVBuffer *)objc_msgSend(v9, "getPixelBuffer");
    if (+[MIOPixelBufferUtility bufferHasPadding:](MIOPixelBufferUtility, "bufferHasPadding:", a3))
    {
      v12 = +[MIOPixelBufferUtility stripBufferPadding:](MIOPixelBufferUtility, "stripBufferPadding:", a3);
      +[MIOPixelBufferUtility splitBayerBuffer:intoWarholPixelBuffer:shiftBitsLeftBy:](MIOPixelBufferUtility, "splitBayerBuffer:intoWarholPixelBuffer:shiftBitsLeftBy:", v12, v11, 2);
      CVPixelBufferRelease(v12);
    }
    else
    {
      +[MIOPixelBufferUtility splitBayerBuffer:intoWarholPixelBuffer:shiftBitsLeftBy:](MIOPixelBufferUtility, "splitBayerBuffer:intoWarholPixelBuffer:shiftBitsLeftBy:", a3, v11, 2);
    }
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", CFSTR("Cannot create pixel buffer pool for RawBayer stream."), 19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (a5)
    *a5 = objc_retainAutorelease(v13);

  v9 = 0;
  v11 = 0;
LABEL_10:

  return v11;
}

- (opaqueCMFormatDescription)createTrackFormatDescriptionFromStreamData:(StreamRecordingData *)a3
{
  return +[MOVStreamIOUtility createL010FormatDescriptionFromRawBayerFormatDescription:](MOVStreamIOUtility, "createL010FormatDescriptionFromRawBayerFormatDescription:", a3->var0);
}

@end
