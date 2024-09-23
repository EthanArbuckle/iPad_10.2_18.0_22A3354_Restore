@implementation BWMetadataSourceNode

+ (void)initialize
{
  objc_opt_class();
}

- (id)nodeSubType
{
  return CFSTR("Metadata");
}

- (BOOL)start:(id *)a3
{
  NSObject *emitSamplesDispatchQueue;
  _QWORD block[5];

  emitSamplesDispatchQueue = self->_emitSamplesDispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__BWMetadataSourceNode_start___block_invoke;
  block[3] = &unk_1E491E720;
  block[4] = self;
  dispatch_sync(emitSamplesDispatchQueue, block);
  return 1;
}

_BYTE *__30__BWMetadataSourceNode_start___block_invoke(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (!result[96])
  {
    result = (_BYTE *)objc_msgSend((id)objc_msgSend(result, "output"), "makeConfiguredFormatLive");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 96) = 1;
  }
  return result;
}

- (BOOL)stop:(id *)a3
{
  NSObject *emitSamplesDispatchQueue;
  _QWORD block[5];

  emitSamplesDispatchQueue = self->_emitSamplesDispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__BWMetadataSourceNode_stop___block_invoke;
  block[3] = &unk_1E491E720;
  block[4] = self;
  dispatch_sync(emitSamplesDispatchQueue, block);
  return 1;
}

uint64_t __29__BWMetadataSourceNode_stop___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v1 + 96))
  {
    *(_BYTE *)(v1 + 96) = 0;
    return objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 16), "markEndOfLiveOutput");
  }
  return result;
}

- (OpaqueCMClock)clock
{
  return self->_clock;
}

- (BWMetadataSourceNode)initWithFormatDescription:(opaqueCMFormatDescription *)a3 clock:(OpaqueCMClock *)a4
{
  BWMetadataSourceNode *v6;
  BWNodeOutput *v7;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  objc_super v12;

  if (!a3)
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99778];
    v11 = CFSTR("Need a format description");
    goto LABEL_8;
  }
  if (!a4)
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99778];
    v11 = CFSTR("Need a clock");
LABEL_8:
    objc_exception_throw((id)objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, v11, 0));
  }
  v12.receiver = self;
  v12.super_class = (Class)BWMetadataSourceNode;
  v6 = -[BWNode init](&v12, sel_init);
  if (v6)
  {
    v6->_formatDescription = (opaqueCMFormatDescription *)CFRetain(a3);
    v6->_clock = (OpaqueCMClock *)CFRetain(a4);
    v6->_emitSamplesDispatchQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
    v7 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1835365473, v6);
    -[BWNodeOutput setFormat:](v7, "setFormat:", +[BWMetadataFormat formatWithMetadataFormatDescription:](BWMetadataFormat, "formatWithMetadataFormatDescription:", v6->_formatDescription));
    -[BWNode addOutput:](v6, "addOutput:", v7);

  }
  return v6;
}

- (void)dealloc
{
  opaqueCMFormatDescription *formatDescription;
  OpaqueCMClock *clock;
  objc_super v5;

  formatDescription = self->_formatDescription;
  if (formatDescription)
    CFRelease(formatDescription);
  clock = self->_clock;
  if (clock)
    CFRelease(clock);

  v5.receiver = self;
  v5.super_class = (Class)BWMetadataSourceNode;
  -[BWNode dealloc](&v5, sel_dealloc);
}

- (void)appendMetadataSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  NSObject *emitSamplesDispatchQueue;
  _QWORD v6[6];

  if (a3)
  {
    if (self->_running)
    {
      CFRetain(a3);
      emitSamplesDispatchQueue = self->_emitSamplesDispatchQueue;
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __51__BWMetadataSourceNode_appendMetadataSampleBuffer___block_invoke;
      v6[3] = &unk_1E491F158;
      v6[4] = self;
      v6[5] = a3;
      dispatch_async(emitSamplesDispatchQueue, v6);
    }
  }
}

void __51__BWMetadataSourceNode_appendMetadataSampleBuffer___block_invoke(uint64_t a1)
{
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "output"), "emitSampleBuffer:", *(_QWORD *)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

- (opaqueCMFormatDescription)formatDescription
{
  return self->_formatDescription;
}

@end
