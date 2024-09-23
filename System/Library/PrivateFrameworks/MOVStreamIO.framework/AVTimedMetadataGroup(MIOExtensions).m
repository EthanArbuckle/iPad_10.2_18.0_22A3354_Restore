@implementation AVTimedMetadataGroup(MIOExtensions)

+ (id)attachmentsMIOTimedMetadataGroupForSampleBuffer:()MIOExtensions pts:error:
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  CMTime v10;
  CMTimeRange v11;
  CMTime start;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  start = *a4;
  objc_msgSend(MEMORY[0x24BDB2588], "attachmentsMIOTimedMetadataItemForSampleBuffer:pts:error:", a3, &start);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x24BDB26C0]);
  v13[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  start = *a4;
  v10 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D38];
  CMTimeRangeMake(&v11, &start, &v10);
  v8 = (void *)objc_msgSend(v6, "initWithItems:timeRange:", v7, &v11);

  return v8;
}

+ (id)attachmentsMIOTimedMetadataGroupForPixelBuffer:()MIOExtensions pts:error:
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  CMTime v10;
  CMTimeRange v11;
  CMTime start;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  start = *a4;
  objc_msgSend(MEMORY[0x24BDB2588], "attachmentsMIOMetadataItemForPixelBuffer:pts:error:", a3, &start);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x24BDB26C0]);
    v13[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    start = *a4;
    v10 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D38];
    CMTimeRangeMake(&v11, &start, &v10);
    v8 = (void *)objc_msgSend(v6, "initWithItems:timeRange:", v7, &v11);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)attachmentsMIOTimedMetadataGroupForDictionary:()MIOExtensions pts:error:
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  CMTime v10;
  CMTimeRange v11;
  CMTime start;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  start = *a4;
  objc_msgSend(MEMORY[0x24BDB2588], "attachmentsMIOMetadataItemForDictionary:pts:error:", a3, &start);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x24BDB26C0]);
    v13[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    start = *a4;
    v10 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D38];
    CMTimeRangeMake(&v11, &start, &v10);
    v8 = (void *)objc_msgSend(v6, "initWithItems:timeRange:", v7, &v11);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)metadataGroupForMetadataStreamFromData:()MIOExtensions timeStamp:copyData:
{
  void *v6;
  id v7;
  void *v8;
  CMTime v10;
  CMTime start;
  CMTimeRange v12;

  objc_msgSend(MEMORY[0x24BDB2588], "metadataItemsForMetadataStreamFromData:copyData:", a3, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x24BDB26C0]);
    start = *a4;
    v10 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D38];
    CMTimeRangeMake(&v12, &start, &v10);
    v8 = (void *)objc_msgSend(v7, "initWithItems:timeRange:", v6, &v12);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
