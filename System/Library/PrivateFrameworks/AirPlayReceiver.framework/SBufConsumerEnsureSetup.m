@implementation SBufConsumerEnsureSetup

void ___SBufConsumerEnsureSetup_block_invoke(uint64_t a1)
{
  uint64_t v1;
  double v2;
  unint64_t v3;
  CMItemCount v4;
  size_t v5;
  void *v6;
  const __CFAllocator *v7;
  const size_t *sampleSizeArray;
  uint64_t v9;
  CFTypeRef v10;
  uint64_t (*v11)(uint64_t);
  NSObject *v12;
  uint64_t (*v13)(uint64_t, CFTypeRef);
  int v14;
  uint64_t v15;
  CMSampleTimingInfo sampleTimingArray;
  CMBlockBufferRef dataBuffer;
  CFTypeRef cf;
  CMTime block;
  void *v20;
  uint64_t *v21;
  uint64_t v22;
  CFTypeRef v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  int v27;

  v1 = *(_QWORD *)(a1 + 32);
  dataBuffer = 0;
  cf = 0;
  *(_OWORD *)&sampleTimingArray.duration.value = *MEMORY[0x24BDC0D40];
  sampleTimingArray.duration.epoch = *(_QWORD *)(MEMORY[0x24BDC0D40] + 16);
  sampleTimingArray.presentationTimeStamp = sampleTimingArray.duration;
  sampleTimingArray.decodeTimeStamp = sampleTimingArray.duration;
  v15 = 0;
  if (!*(_QWORD *)(v1 + 128))
    goto LABEL_25;
  if ((int)dispatch_source_get_data(*(dispatch_source_t *)(v1 + 144)) < 1)
  {
LABEL_17:
    v6 = 0;
    goto LABEL_18;
  }
  v2 = (double)mach_absolute_time();
  v3 = (unint64_t)(*(double *)(v1 + 80) * (v2 / (double)(unint64_t)UpTicksPerSecond()));
  v4 = v3 - *(_QWORD *)(v1 + 160);
  v15 = *(unsigned int *)(v1 + 104);
  v5 = v4 * v15;
  v6 = malloc_type_malloc(v4 * v15, 0x50091875uLL);
  if (!APReceiverAudioSessionReadAudio(*(_QWORD *)(v1 + 24)))
  {
    CMTimeMake(&sampleTimingArray.presentationTimeStamp, *(_QWORD *)(v1 + 160) + *(int *)(v1 + 168), (int)*(double *)(v1 + 80));
    CMTimeMake(&block, 1, (int)*(double *)(v1 + 80));
    sampleTimingArray.duration = block;
    *(_QWORD *)(v1 + 160) = v3;
    v7 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    if (!CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x24BDBD240], v6, v5, (CFAllocatorRef)*MEMORY[0x24BDBD248], 0, 0, v5, 0, &dataBuffer))
    {
      sampleSizeArray = (const size_t *)&v15;
      if ((*(_DWORD *)(v1 + 92) & 0x20) != 0)
        sampleSizeArray = 0;
      if (CMSampleBufferCreate(v7, dataBuffer, 1u, 0, 0, *(CMFormatDescriptionRef *)(v1 + 120), v4, 1, &sampleTimingArray, (*(_DWORD *)(v1 + 92) & 0x20) == 0, sampleSizeArray, (CMSampleBufferRef *)&cf))
      {
        goto LABEL_25;
      }
      v9 = *(_QWORD *)(v1 + 128);
      v10 = cf;
      v24 = 0;
      v25 = &v24;
      v26 = 0x2020000000;
      v27 = 0;
      v11 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
      if (v11)
      {
        v12 = v11(v9);
        if (!v12)
        {
          v13 = *(uint64_t (**)(uint64_t, CFTypeRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
          if (v13)
            v14 = v13(v9, v10);
          else
            v14 = -12782;
          *((_DWORD *)v25 + 6) = v14;
LABEL_16:
          _Block_object_dispose(&v24, 8);
          if (!v14)
            goto LABEL_17;
LABEL_25:
          APSLogErrorAt();
          goto LABEL_17;
        }
      }
      else
      {
        v12 = MEMORY[0x24BDAC9B8];
      }
      block.value = MEMORY[0x24BDAC760];
      *(_QWORD *)&block.timescale = 3221225472;
      block.epoch = (CMTimeEpoch)__APReceiverSBufConsumerPushAudioSBuf_block_invoke;
      v20 = &unk_24E21FA68;
      v21 = &v24;
      v22 = v9;
      v23 = v10;
      dispatch_sync(v12, &block);
      v14 = *((_DWORD *)v25 + 6);
      goto LABEL_16;
    }
  }
  APSLogErrorAt();
LABEL_18:
  if (dataBuffer)
    CFRelease(dataBuffer);
  if (cf)
    CFRelease(cf);
  free(v6);
}

@end
