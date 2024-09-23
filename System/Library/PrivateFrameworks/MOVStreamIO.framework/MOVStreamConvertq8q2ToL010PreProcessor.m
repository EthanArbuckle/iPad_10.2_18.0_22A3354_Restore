@implementation MOVStreamConvertq8q2ToL010PreProcessor

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
  MIOPixelBufferPool *v9;
  size_t Width;
  size_t Height;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  __CVBuffer *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  _QWORD v32[6];
  _QWORD v33[8];

  v33[6] = *MEMORY[0x24BDAC8D0];
  p_var12 = &a4->var12;
  v9 = (MIOPixelBufferPool *)a4->var12;
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  if (!v9)
  {
    v12 = Height;
    v32[0] = *MEMORY[0x24BDC5628];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", (unint64_t)-((double)Width - ceil((double)Width * 0.015625) * 64.0));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v13;
    v32[1] = *MEMORY[0x24BDC5650];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v14;
    v32[2] = *MEMORY[0x24BDC5668];
    v30 = *MEMORY[0x24BDD8E40];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a4->var22);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *MEMORY[0x24BDC56B8];
    v33[2] = v16;
    v33[3] = &unk_24CA5BD48;
    v18 = *MEMORY[0x24BDC5708];
    v32[3] = v17;
    v32[4] = v18;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", Width);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v33[4] = v19;
    v32[5] = *MEMORY[0x24BDC5610];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", (unint64_t)-((double)v12 - ceil((double)v12 * 0.015625) * 64.0));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v33[5] = v20;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 6);
    v21 = (id)objc_claimAutoreleasedReturnValue();

    v28 = *MEMORY[0x24BDC56F0];
    v29 = &unk_24CA5BD60;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MIOPixelBufferPool initWithPixelBuffer:bufferAttributes:poolAttributes:error:]([MIOPixelBufferPool alloc], "initWithPixelBuffer:bufferAttributes:poolAttributes:error:", 0, v21, v22, 0);
    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", CFSTR("Cannot create L008 pixel buffer pool for Non-Planar stream."), 19);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (a5)
        *a5 = objc_retainAutorelease(v25);

      v9 = 0;
      goto LABEL_10;
    }
    objc_storeStrong(p_var12, v9);

  }
  v23 = -[MIOPixelBufferPool getPixelBuffer](v9, "getPixelBuffer");
  if (!+[MIOPixelBufferUtility transferq8q2PixelBuffer:toL010PixelBuffer:](MIOPixelBufferUtility, "transferq8q2PixelBuffer:toL010PixelBuffer:", a3, v23))
  {
    CVPixelBufferRelease(v23);
    CVPixelBufferRelease(a3);
    objc_msgSend(MEMORY[0x24BDD1540], "streamErrorWithMessage:code:", CFSTR("Cannot convert q8q2 to L010 buffer."), 20);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v24;
    if (a5)
    {
      v21 = objc_retainAutorelease(v24);
      *a5 = v21;
    }
LABEL_10:

    v23 = 0;
  }

  return v23;
}

- (opaqueCMFormatDescription)createTrackFormatDescriptionFromStreamData:(StreamRecordingData *)a3
{
  return +[MOVStreamIOUtility createL010FormatDescriptionFromL016FormatDescription:](MOVStreamIOUtility, "createL010FormatDescriptionFromL016FormatDescription:", a3->var0);
}

@end
