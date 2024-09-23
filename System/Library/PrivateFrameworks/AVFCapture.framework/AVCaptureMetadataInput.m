@implementation AVCaptureMetadataInput

+ (void)initialize
{
  objc_opt_class();
}

+ (AVCaptureMetadataInput)metadataInputWithFormatDescription:(CMMetadataFormatDescriptionRef)desc clock:(CMClockRef)clock
{
  return (AVCaptureMetadataInput *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFormatDescription:clock:", desc, clock);
}

- (AVCaptureMetadataInput)init
{
  return -[AVCaptureMetadataInput initWithFormatDescription:clock:](self, "initWithFormatDescription:clock:", 0, 0);
}

- (AVCaptureMetadataInput)initWithFormatDescription:(CMMetadataFormatDescriptionRef)desc clock:(CMClockRef)clock
{
  void *v7;
  uint64_t v8;
  void *v9;
  AVCaptureMetadataInput *v10;
  AVCaptureMetadataInputInternal *v12;
  id v13;
  objc_class *v14;
  objc_super v15;

  if (!desc)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99778];
    goto LABEL_7;
  }
  if (!clock)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99778];
    goto LABEL_7;
  }
  if (AVCaptureMetadataObjectsOnly())
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0CB2FC0];
LABEL_7:
    v9 = (void *)objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, AVMethodExceptionReasonWithObjectAndSelector(), 0);

    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v9);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v9);
    return 0;
  }
  v15.receiver = self;
  v15.super_class = (Class)AVCaptureMetadataInput;
  v10 = -[AVCaptureInput initSubclass](&v15, sel_initSubclass);
  if (!v10)
    return v10;
  v12 = objc_alloc_init(AVCaptureMetadataInputInternal);
  v10->_internal = v12;
  if (v12)
  {
    v13 = objc_alloc(MEMORY[0x1E0CB3940]);
    v14 = (objc_class *)objc_opt_class();
    v10->_internal->sourceID = (NSString *)objc_msgSend(v13, "initWithFormat:", CFSTR("<%@ %p>"), NSStringFromClass(v14), v10);
    v10->_internal->desc = (opaqueCMFormatDescription *)CFRetain(desc);
    v10->_internal->clock = (OpaqueCMClock *)CFRetain(clock);
    return v10;
  }

  return 0;
}

- (void)dealloc
{
  AVCaptureMetadataInputInternal *internal;
  AVCaptureMetadataInputInternal *v4;
  opaqueCMFormatDescription *desc;
  OpaqueCMClock *clock;
  OpaqueCMBlockBuffer *emptyBoxedMetadata;
  objc_super v8;

  internal = self->_internal;
  if (internal)
  {

    v4 = self->_internal;
    desc = v4->desc;
    if (desc)
    {
      CFRelease(desc);
      v4 = self->_internal;
    }
    clock = v4->clock;
    if (clock)
    {
      CFRelease(clock);
      v4 = self->_internal;
    }
    emptyBoxedMetadata = v4->emptyBoxedMetadata;
    if (emptyBoxedMetadata)
    {
      CFRelease(emptyBoxedMetadata);
      v4 = self->_internal;
    }

  }
  v8.receiver = self;
  v8.super_class = (Class)AVCaptureMetadataInput;
  -[AVCaptureInput dealloc](&v8, sel_dealloc);
}

- (id)ports
{
  AVCaptureMetadataInputInternal *internal;
  AVCaptureInputPort *metadataPort;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  internal = self->_internal;
  metadataPort = internal->metadataPort;
  if (!metadataPort)
  {
    self->_internal->metadataPort = +[AVCaptureInputPort portWithInput:mediaType:formatDescription:enabled:sourceDeviceType:sourceDevicePosition:](AVCaptureInputPort, "portWithInput:mediaType:formatDescription:enabled:sourceDeviceType:sourceDevicePosition:", self, *MEMORY[0x1E0CF2B78], internal->desc, 1, 0, 0);
    metadataPort = self->_internal->metadataPort;
  }
  v6[0] = metadataPort;
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
}

- (OpaqueCMClock)clock
{
  return self->_internal->clock;
}

- (id)sourceID
{
  return self->_internal->sourceID;
}

- (BOOL)appendTimedMetadataGroup:(AVTimedMetadataGroup *)metadata error:(NSError *)outError
{
  void *v7;
  BOOL v8;
  NSArray *v9;
  NSArray *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  const void *BoxedMetadataFromFaceObjectAndFormatDescription;
  int v18;
  OpaqueCMBlockBuffer *BlockBuffer;
  AVCaptureMetadataInputInternal *internal;
  CMBlockBufferRef *blockBufferOut;
  OpaqueCMBlockBuffer *emptyBoxedMetadata;
  OSStatus v23;
  OSStatus DataPointer;
  OSStatus v25;
  NSError **v27;
  _QWORD v28[7];
  size_t sampleSizeArray;
  CMTime v30;
  __int128 v31;
  CMTimeEpoch v32;
  CMSampleTimingInfo sampleTimingArray;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  char *dataPointerOut;
  char v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  int v43;
  CMSampleBufferRef v44;
  CFTypeRef v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v44 = 0;
  v45 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 0;
  if (!metadata)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v7);
    goto LABEL_6;
  }
  -[AVTimedMetadataGroup timeRange](metadata, "timeRange");
  if ((v39 & 1) == 0)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v7);
LABEL_6:
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v7);
    v8 = 0;
    goto LABEL_41;
  }
  v9 = -[AVTimedMetadataGroup items](metadata, "items");
  v10 = v9;
  if (!v9 || !-[NSArray count](v9, "count"))
  {
    internal = self->_internal;
    emptyBoxedMetadata = internal->emptyBoxedMetadata;
    blockBufferOut = &internal->emptyBoxedMetadata;
    BlockBuffer = emptyBoxedMetadata;
    if (!emptyBoxedMetadata)
    {
      v23 = CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 8uLL, (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 8uLL, 1u, blockBufferOut);
      *((_DWORD *)v41 + 6) = v23;
      if (v23)
        goto LABEL_43;
      dataPointerOut = 0;
      DataPointer = CMBlockBufferGetDataPointer(self->_internal->emptyBoxedMetadata, 0, 0, 0, &dataPointerOut);
      *((_DWORD *)v41 + 6) = DataPointer;
      if (DataPointer)
      {
        FigDebugAssert3();
        goto LABEL_32;
      }
      *(_QWORD *)dataPointerOut = 0x8000000;
      BlockBuffer = self->_internal->emptyBoxedMetadata;
    }
LABEL_29:
    memset(&sampleTimingArray, 0, sizeof(sampleTimingArray));
    -[AVTimedMetadataGroup timeRange](metadata, "timeRange");
    *(_OWORD *)&sampleTimingArray.duration.value = v31;
    sampleTimingArray.duration.epoch = v32;
    -[AVTimedMetadataGroup timeRange](metadata, "timeRange");
    sampleTimingArray.presentationTimeStamp = v30;
    sampleTimingArray.decodeTimeStamp = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
    sampleSizeArray = CMBlockBufferGetDataLength(BlockBuffer);
    v25 = CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], BlockBuffer, 1u, 0, 0, self->_internal->desc, 1, 1, &sampleTimingArray, 1, &sampleSizeArray, &v44);
    *((_DWORD *)v41 + 6) = v25;
    if (v25)
    {
      FigDebugAssert3();
    }
    else
    {
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __57__AVCaptureMetadataInput_appendTimedMetadataGroup_error___block_invoke;
      v28[3] = &unk_1E4216678;
      v28[4] = self;
      v28[5] = &v40;
      v28[6] = v44;
      -[AVCaptureInput performFigCaptureSessionOperationSafelyUsingBlock:](self, "performFigCaptureSessionOperationSafelyUsingBlock:", v28);
      if (*((_DWORD *)v41 + 6))
        FigDebugAssert3();
    }
    goto LABEL_32;
  }
  v11 = FigBoxedMetadataCreateForConstruction();
  *((_DWORD *)v41 + 6) = v11;
  if (v11)
  {
LABEL_43:
    FigDebugAssert3();
    goto LABEL_32;
  }
  v27 = outError;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v35 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v15, "identifier");
        objc_msgSend(v15, "dataType");
        objc_msgSend(v15, "locale");
        if (FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors())
        {
          v16 = (void *)objc_msgSend(v15, "value");
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            BoxedMetadataFromFaceObjectAndFormatDescription = (const void *)AVMetadataObjectCreateBoxedMetadataFromFaceObjectAndFormatDescription(v16, (uint64_t)self->_internal->desc, 0);
            if (BoxedMetadataFromFaceObjectAndFormatDescription)
            {
              *((_DWORD *)v41 + 6) = FigBoxedMetadataAppendCFTypedValue();
              CFRelease(BoxedMetadataFromFaceObjectAndFormatDescription);
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              *((_DWORD *)v41 + 6) = FigBoxedMetadataAppendCFTypedValue();
          }
        }
      }
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
    }
    while (v12);
  }
  v18 = FigBoxedMetadataEndConstruction();
  outError = v27;
  *((_DWORD *)v41 + 6) = v18;
  if (!v18)
  {
    BlockBuffer = (OpaqueCMBlockBuffer *)FigBoxedMetadataGetBlockBuffer();
    goto LABEL_29;
  }
  FigDebugAssert3();
LABEL_32:
  if (outError && *((_DWORD *)v41 + 6) && !*outError)
    *outError = (NSError *)AVLocalizedErrorWithUnderlyingOSStatus();
  if (v45)
    CFRelease(v45);
  if (v44)
    CFRelease(v44);
  v8 = *((_DWORD *)v41 + 6) == 0;
LABEL_41:
  _Block_object_dispose(&v40, 8);
  return v8;
}

uint64_t __57__AVCaptureMetadataInput_appendTimedMetadataGroup_error___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, _QWORD, uint64_t);

  if (a2)
  {
    v3 = result;
    v4 = objc_msgSend(*(id *)(result + 32), "sourceID");
    v5 = *(_QWORD *)(v3 + 48);
    v6 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
    if (v6)
      result = v6(a2, v4, *MEMORY[0x1E0D042F0], v5);
    else
      result = 4294954514;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 40) + 8) + 24) = result;
  }
  return result;
}

@end
