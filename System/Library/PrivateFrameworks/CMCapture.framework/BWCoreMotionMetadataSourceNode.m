@implementation BWCoreMotionMetadataSourceNode

+ (void)initialize
{
  objc_opt_class();
}

- (id)nodeSubType
{
  return CFSTR("CoreMotionMetadata");
}

- (BOOL)start:(id *)a3
{
  NSObject *emitSamplesDispatchQueue;
  _QWORD block[5];

  emitSamplesDispatchQueue = self->_emitSamplesDispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__BWCoreMotionMetadataSourceNode_start___block_invoke;
  block[3] = &unk_1E491E720;
  block[4] = self;
  dispatch_sync(emitSamplesDispatchQueue, block);
  return 1;
}

uint64_t __40__BWCoreMotionMetadataSourceNode_start___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _OWORD *v5;
  _BYTE v6[32];

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 112))
  {
    v2 = result;
    memset(v6, 0, 28);
    if (*(int *)(v1 + 108) >= 1)
    {
      v3 = 0;
      v4 = 0;
      do
      {
        v5 = (_OWORD *)(*(_QWORD *)(v1 + 120) + v3);
        *v5 = 0u;
        v5[1] = 0u;
        v5[2] = *(_OWORD *)v6;
        *(_OWORD *)((char *)v5 + 44) = *(_OWORD *)&v6[12];
        ++v4;
        v1 = *(_QWORD *)(result + 32);
        v3 += 60;
      }
      while (v4 < *(int *)(v1 + 108));
    }
    *(_DWORD *)(v1 + 128) = 0;
    objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 16), "makeConfiguredFormatLive", 0, 0, 0, 0, 0, 0, 0, *(_QWORD *)&v6[24]);
    *(_BYTE *)(*(_QWORD *)(v2 + 32) + 112) = 1;
    return objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 96), "setDeviceMotionCallback:info:interval:fsync:", cmmsn_deviceMotionCallback, *(_QWORD *)(v2 + 32), 1, 1.0 / (double)(*(_DWORD *)(*(_QWORD *)(v2 + 32) + 108) * *(_DWORD *)(*(_QWORD *)(v2 + 32) + 104)));
  }
  return result;
}

- (BOOL)stop:(id *)a3
{
  NSObject *emitSamplesDispatchQueue;
  _QWORD block[5];

  if (self->_running)
  {
    -[CMMotionManager setDeviceMotionCallback:info:interval:fsync:](self->_motionManager, "setDeviceMotionCallback:info:interval:fsync:", 0, 0, 0, 0.0);
    emitSamplesDispatchQueue = self->_emitSamplesDispatchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__BWCoreMotionMetadataSourceNode_stop___block_invoke;
    block[3] = &unk_1E491E720;
    block[4] = self;
    dispatch_async(emitSamplesDispatchQueue, block);
  }
  return 1;
}

uint64_t __39__BWCoreMotionMetadataSourceNode_stop___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(v2 + 128))
  {
    -[BWCoreMotionMetadataSourceNode _emitMetadataSampleBuffer](v2);
    v2 = *(_QWORD *)(a1 + 32);
  }
  result = objc_msgSend(*(id *)(v2 + 16), "markEndOfLiveOutput");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 112) = 0;
  return result;
}

- (void)_emitMetadataSampleBuffer
{
  size_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  char *v7;
  _OWORD *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  const __CFAllocator *v12;
  __int128 v13;
  __int128 v14;
  void *v15;
  size_t sampleSizeArray;
  CMSampleTimingInfo v17;
  CMSampleBufferRef v18;
  CMBlockBufferRef blockBufferOut;

  if (!a1)
    return;
  v18 = 0;
  blockBufferOut = 0;
  v2 = 68 * *(int *)(a1 + 128);
  v3 = (char *)malloc_type_malloc(v2, 0x6D304B65uLL);
  if (*(int *)(a1 + 128) < 1)
  {
    v6 = 0;
  }
  else
  {
    v4 = 0;
    v5 = 0;
    v6 = 0;
    do
    {
      v7 = &v3[v6];
      *(_DWORD *)v7 = 1140850688;
      *((_DWORD *)v7 + 1) = *(_DWORD *)(a1 + 144);
      v8 = (_OWORD *)(*(_QWORD *)(a1 + 120) + v4);
      v10 = v8[1];
      v9 = v8[2];
      v11 = *(_OWORD *)((char *)v8 + 44);
      *(_OWORD *)(v7 + 8) = *v8;
      *(_OWORD *)(v7 + 52) = v11;
      *(_OWORD *)(v7 + 40) = v9;
      *(_OWORD *)(v7 + 24) = v10;
      v6 += 68;
      ++v5;
      v4 += 60;
    }
    while (v5 < *(int *)(a1 + 128));
  }
  *(_DWORD *)(a1 + 128) = 0;
  v12 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  if (CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v3, v2, (CFAllocatorRef)*MEMORY[0x1E0C9AE10], 0, 0, v6, 0, &blockBufferOut))
  {
    fig_log_get_emitter();
LABEL_17:
    FigDebugAssert3();
    goto LABEL_10;
  }
  v13 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 48);
  *(_OWORD *)&v17.presentationTimeStamp.timescale = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 32);
  *(_OWORD *)&v17.decodeTimeStamp.value = v13;
  v17.decodeTimeStamp.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E90] + 64);
  v14 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 16);
  *(_OWORD *)&v17.duration.value = *MEMORY[0x1E0CA2E90];
  *(_OWORD *)&v17.duration.epoch = v14;
  CMTimeMakeWithSeconds(&v17.presentationTimeStamp, *(Float64 *)(*(_QWORD *)(a1 + 120) + 8), 1000000000);
  sampleSizeArray = CMBlockBufferGetDataLength(blockBufferOut);
  if (CMSampleBufferCreate(v12, blockBufferOut, 1u, 0, 0, *(CMFormatDescriptionRef *)(a1 + 136), 1, 1, &v17, 1, &sampleSizeArray, &v18))
  {
    fig_log_get_emitter();
    goto LABEL_17;
  }
  v15 = (void *)objc_msgSend((id)a1, "output");
  objc_msgSend(v15, "emitSampleBuffer:", v18);
LABEL_10:
  if (blockBufferOut)
    CFRelease(blockBufferOut);
  if (v18)
    CFRelease(v18);
}

+ (int)extractBWCoreMotionMetadataFromBlockBuffer:(OpaqueCMBlockBuffer *)a3 intoNativeEndianSampleData:(BWCoreMotionMetadataSampleData *)a4
{
  OSStatus DataPointer;
  int v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  size_t lengthAtOffsetOut;
  char *dataPointerOut;

  if (a4 && a3)
  {
    lengthAtOffsetOut = 0;
    dataPointerOut = 0;
    DataPointer = CMBlockBufferGetDataPointer(a3, 0, &lengthAtOffsetOut, 0, &dataPointerOut);
    if (DataPointer)
    {
      v6 = DataPointer;
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else if (lengthAtOffsetOut <= 0x43)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      return 0;
    }
    else
    {
      v6 = 0;
      v7 = *(_OWORD *)(dataPointerOut + 24);
      v8 = *(_OWORD *)(dataPointerOut + 40);
      v9 = *(_OWORD *)(dataPointerOut + 8);
      *(_OWORD *)((char *)&a4->var6 + 4) = *(_OWORD *)(dataPointerOut + 52);
      *(_OWORD *)&a4->var3 = v7;
      *(_OWORD *)&a4->var5 = v8;
      *(_OWORD *)&a4->var0 = v9;
      a4->var1 = 0;
      if ((a4->var0 & 0x2000000) != 0)
      {
        v6 = 0;
        *(_QWORD *)&a4->var6 = bswap64(*(_QWORD *)&a4->var6);
        LODWORD(a4->var9) = bswap32(LODWORD(a4->var9));
        *(int8x16_t *)&a4->var2 = vrev64q_s8(*(int8x16_t *)&a4->var2);
        *(int8x16_t *)&a4->var4 = vrev64q_s8(*(int8x16_t *)&a4->var4);
        *(int8x8_t *)&a4->var7 = vrev32_s8(*(int8x8_t *)&a4->var7);
      }
    }
    return v6;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

+ (int)extractBWCoreMotionMetadataFromSampleBuffer:(opaqueCMSampleBuffer *)a3 intoNativeEndianSampleData:(BWCoreMotionMetadataSampleData *)a4
{
  return +[BWCoreMotionMetadataSourceNode extractBWCoreMotionMetadataFromBlockBuffer:intoNativeEndianSampleData:](BWCoreMotionMetadataSourceNode, "extractBWCoreMotionMetadataFromBlockBuffer:intoNativeEndianSampleData:", CMSampleBufferGetDataBuffer(a3), a4);
}

- (BWCoreMotionMetadataSourceNode)initWithBufferGenerationRate:(int)a3 samplesPerBuffer:(int)a4
{
  BWCoreMotionMetadataSourceNode *v6;
  CMMotionManager *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFArray *v11;
  unsigned int LocalIDForMetadataIdentifyingFactors;
  BWNodeOutput *v14;
  void *v15;
  uint64_t v16;
  const __CFString *v17;
  objc_super v18;
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = *MEMORY[0x1E0C99778];
    v17 = CFSTR("Need a non-zero buffer generation rate");
    goto LABEL_13;
  }
  if (!a4)
  {
    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = *MEMORY[0x1E0C99778];
    v17 = CFSTR("Need a non-zero samplesPerBuffer");
LABEL_13:
    objc_exception_throw((id)objc_msgSend(v15, "exceptionWithName:reason:userInfo:", v16, v17, 0));
  }
  v18.receiver = self;
  v18.super_class = (Class)BWCoreMotionMetadataSourceNode;
  v6 = -[BWNode init](&v18, sel_init);
  if (v6)
  {
    v7 = (CMMotionManager *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5670]), "initUsing6AxisSensorFusion");
    v6->_motionManager = v7;
    if (!-[CMMotionManager isDeviceMotionAvailable](v7, "isDeviceMotionAvailable"))
      goto LABEL_7;
    if (!-[CMMotionManager isAccelerometerAvailable](v6->_motionManager, "isAccelerometerAvailable"))
      goto LABEL_7;
    v8 = *MEMORY[0x1E0CA4BE8];
    v9 = *MEMORY[0x1E0CA2518];
    v19[0] = *MEMORY[0x1E0CA2528];
    v19[1] = v9;
    v10 = *MEMORY[0x1E0CA2440];
    v20[0] = v8;
    v20[1] = v10;
    v21[0] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
    v11 = (const __CFArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    if (CMMetadataFormatDescriptionCreateWithMetadataSpecifications((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0x6D656278u, v11, &v6->_boxedMetadataFormatDescription))
    {
      goto LABEL_7;
    }
    LocalIDForMetadataIdentifyingFactors = FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors();
    v6->_localIDOfCoreMotionMetadata_BE = bswap32(LocalIDForMetadataIdentifyingFactors);
    if (LocalIDForMetadataIdentifyingFactors)
    {
      v6->_sampleDataForBuffer = (BWCoreMotionMetadataSampleData *)malloc_type_malloc(60 * a4, 0x1000040C2DCA394uLL);
      v6->_emitSamplesDispatchQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
      v14 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1835365473, v6);
      -[BWNodeOutput setFormat:](v14, "setFormat:", +[BWMetadataFormat formatWithMetadataFormatDescription:](BWMetadataFormat, "formatWithMetadataFormatDescription:", v6->_boxedMetadataFormatDescription));
      -[BWNode addOutput:](v6, "addOutput:", v14);

      v6->_bufferGenerationRate = a3;
      v6->_samplesPerBuffer = a4;
    }
    else
    {
LABEL_7:

      return 0;
    }
  }
  return v6;
}

- (void)dealloc
{
  opaqueCMFormatDescription *boxedMetadataFormatDescription;
  objc_super v4;

  boxedMetadataFormatDescription = self->_boxedMetadataFormatDescription;
  if (boxedMetadataFormatDescription)
    CFRelease(boxedMetadataFormatDescription);
  free(self->_sampleDataForBuffer);

  v4.receiver = self;
  v4.super_class = (Class)BWCoreMotionMetadataSourceNode;
  -[BWNode dealloc](&v4, sel_dealloc);
}

- (opaqueCMFormatDescription)formatDescription
{
  return self->_formatDescription;
}

@end
