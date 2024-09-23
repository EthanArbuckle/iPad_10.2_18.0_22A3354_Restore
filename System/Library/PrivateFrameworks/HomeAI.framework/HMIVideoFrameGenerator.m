@implementation HMIVideoFrameGenerator

- (HMIVideoFrameGenerator)initWithVideoFragment:(id)a3
{
  id v4;
  HMIVideoFrameGenerator *v5;
  HMIMemoryAVAsset *v6;
  void *v7;
  HMIMemoryAVAsset *v8;
  HMIVideoAssetReader *v9;
  HMIVideoAssetReader *reader;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HMIVideoFrameGenerator;
  v5 = -[HMIVideoFrameGenerator init](&v12, sel_init);
  if (v5)
  {
    v6 = [HMIMemoryAVAsset alloc];
    objc_msgSend(v4, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[HMIMemoryAVAsset initWithData:](v6, "initWithData:", v7);

    v9 = -[HMIVideoAssetReader initWithAsset:]([HMIVideoAssetReader alloc], "initWithAsset:", v8);
    reader = v5->_reader;
    v5->_reader = v9;

  }
  return v5;
}

- (void)generateVideoFramesForTimes:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, id);
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  opaqueCMSampleBuffer *v14;
  const void *CopyWithoutEdits;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, opaqueCMSampleBuffer *);
  void *v19;
  id v20;
  id v21;

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  v8 = (void *)objc_opt_new();
  v9 = (void *)objc_opt_new();
  objc_msgSend(v8, "setDelegate:", v9);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x24BDAC760];
  v17 = 3221225472;
  v18 = __72__HMIVideoFrameGenerator_generateVideoFramesForTimes_completionHandler___block_invoke;
  v19 = &unk_24DBEBF50;
  v11 = v6;
  v20 = v11;
  v12 = v10;
  v21 = v12;
  objc_msgSend(v9, "setDecoderDidDecodeSampleBuffer:", &v16);
  while (1)
  {
    -[HMIVideoFrameGenerator reader](self, "reader", v16, v17, v18, v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (opaqueCMSampleBuffer *)objc_msgSend(v13, "copyNextSampleBuffer");

    if (!v14)
      break;
    if (HMICMSampleBufferIsVideo(v14))
    {
      CopyWithoutEdits = (const void *)HMICMSampleBufferCreateCopyWithoutEdits(v14);
      objc_msgSend(v8, "handleSampleBuffer:outputFrame:", CopyWithoutEdits, 1);
      CFRelease(CopyWithoutEdits);
    }
    CFRelease(v14);
  }
  objc_msgSend(v8, "flush");
  v7[2](v7, v12);

}

void __72__HMIVideoFrameGenerator_generateVideoFramesForTimes_completionHandler___block_invoke(uint64_t a1, uint64_t a2, opaqueCMSampleBuffer *a3)
{
  void *v5;
  void *v6;
  HMIVideoFrame *v7;
  _QWORD v8[4];
  CMTimeRange v9;
  CMTimeRange v10;

  memset(&v10, 0, sizeof(v10));
  HMICMSampleBufferGetPresentationTimeRange(a3, &v10);
  v5 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __72__HMIVideoFrameGenerator_generateVideoFramesForTimes_completionHandler___block_invoke_2;
  v8[3] = &__block_descriptor_80_e17_B16__0__NSValue_8l;
  v9 = v10;
  if (objc_msgSend(v5, "na_any:", v8))
  {
    v6 = *(void **)(a1 + 40);
    v7 = -[HMIVideoFrame initWithSampleBuffer:]([HMIVideoFrame alloc], "initWithSampleBuffer:", a3);
    objc_msgSend(v6, "addObject:", v7);

  }
}

BOOL __72__HMIVideoFrameGenerator_generateVideoFramesForTimes_completionHandler___block_invoke_2(_OWORD *a1, void *a2)
{
  __int128 v3;
  CMTimeRange v5;
  CMTime time;

  if (a2)
    objc_msgSend(a2, "CMTimeValue");
  else
    memset(&time, 0, sizeof(time));
  v3 = a1[3];
  *(_OWORD *)&v5.start.value = a1[2];
  *(_OWORD *)&v5.start.epoch = v3;
  *(_OWORD *)&v5.duration.timescale = a1[4];
  return CMTimeRangeContainsTime(&v5, &time) != 0;
}

- (HMIVideoAssetReader)reader
{
  return (HMIVideoAssetReader *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
