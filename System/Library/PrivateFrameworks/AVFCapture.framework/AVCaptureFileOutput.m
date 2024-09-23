@implementation AVCaptureFileOutput

+ (void)initialize
{
  objc_opt_class();
}

- (id)initSubclass
{
  _QWORD *v2;
  AVCaptureFileOutputInternal *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVCaptureFileOutput;
  v2 = -[AVCaptureOutput initSubclass](&v5, sel_initSubclass);
  if (v2)
  {
    v3 = objc_alloc_init(AVCaptureFileOutputInternal);
    v2[2] = v3;
    if (!v3)
    {

      return 0;
    }
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVCaptureFileOutput;
  -[AVCaptureOutput dealloc](&v3, sel_dealloc);
}

- (NSURL)outputFileURL
{
  return 0;
}

- (BOOL)isRecording
{
  return 0;
}

- (BOOL)isRecordingPaused
{
  return 0;
}

- (BOOL)pausesRecordingOnInterruption
{
  return self->_fileOutputInternal->pausesRecordingOnInterruption;
}

- (void)setPausesRecordingOnInterruption:(BOOL)a3
{
  self->_fileOutputInternal->pausesRecordingOnInterruption = a3;
}

- (CMTime)recordedDuration
{
  CMTime *result;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3810000000;
  v9 = &unk_19EF10DB5;
  v10 = *MEMORY[0x1E0CA2E68];
  v11 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__AVCaptureFileOutput_recordedDuration__block_invoke;
  v5[3] = &unk_1E42163E0;
  v5[4] = self;
  v5[5] = &v6;
  -[AVCaptureOutput performFigCaptureSessionOperationSafelyUsingBlock:](self, "performFigCaptureSessionOperationSafelyUsingBlock:", v5);
  *retstr = *(CMTime *)(v7 + 4);
  _Block_object_dispose(&v6, 8);
  return result;
}

void __39__AVCaptureFileOutput_recordedDuration__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, _QWORD, _QWORD, CFDictionaryRef *);
  uint64_t v6;
  CFDictionaryRef v7;
  CMTime v8;
  CFDictionaryRef dictionaryRepresentation;

  if (a2)
  {
    dictionaryRepresentation = 0;
    v4 = objc_msgSend(*(id *)(a1 + 32), "sinkID");
    v5 = *(void (**)(uint64_t, uint64_t, _QWORD, _QWORD, CFDictionaryRef *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                + 16)
                                                                                    + 16);
    if (v5)
    {
      v5(a2, v4, *MEMORY[0x1E0D04200], *MEMORY[0x1E0C9AE00], &dictionaryRepresentation);
      if (dictionaryRepresentation)
      {
        CMTimeMakeFromDictionary(&v8, dictionaryRepresentation);
        v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        *(_OWORD *)(v6 + 32) = *(_OWORD *)&v8.value;
        v7 = dictionaryRepresentation;
        *(_QWORD *)(v6 + 48) = v8.epoch;
        CFRelease(v7);
      }
    }
  }
}

- (int64_t)recordedFileSize
{
  int64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__AVCaptureFileOutput_recordedFileSize__block_invoke;
  v4[3] = &unk_1E42163E0;
  v4[4] = self;
  v4[5] = &v5;
  -[AVCaptureOutput performFigCaptureSessionOperationSafelyUsingBlock:](self, "performFigCaptureSessionOperationSafelyUsingBlock:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __39__AVCaptureFileOutput_recordedFileSize__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, _QWORD, _QWORD, CFNumberRef *);
  CFNumberRef number;

  if (a2)
  {
    number = 0;
    v4 = objc_msgSend(*(id *)(a1 + 32), "sinkID");
    v5 = *(void (**)(uint64_t, uint64_t, _QWORD, _QWORD, CFNumberRef *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                            + 16)
                                                                                + 16);
    if (v5)
    {
      v5(a2, v4, *MEMORY[0x1E0D04208], *MEMORY[0x1E0C9AE00], &number);
      if (number)
      {
        CFNumberGetValue(number, kCFNumberSInt64Type, (void *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
        CFRelease(number);
      }
    }
  }
}

- (CMTime)maxRecordedDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)(self->epoch + 8);
  return self;
}

- (void)setMaxRecordedDuration:(CMTime *)maxRecordedDuration
{
  AVCaptureFileOutputInternal *fileOutputInternal;
  CMTimeEpoch epoch;

  fileOutputInternal = self->_fileOutputInternal;
  epoch = maxRecordedDuration->epoch;
  *(_OWORD *)&fileOutputInternal->maxRecordedDuration.value = *(_OWORD *)&maxRecordedDuration->value;
  fileOutputInternal->maxRecordedDuration.epoch = epoch;
}

- (int64_t)maxRecordedFileSize
{
  return self->_fileOutputInternal->maxRecordedFileSize;
}

- (void)setMaxRecordedFileSize:(int64_t)maxRecordedFileSize
{
  self->_fileOutputInternal->maxRecordedFileSize = maxRecordedFileSize;
}

- (int64_t)minFreeDiskSpaceLimit
{
  return self->_fileOutputInternal->minFreeDiskSpaceLimit;
}

- (void)setMinFreeDiskSpaceLimit:(int64_t)minFreeDiskSpaceLimit
{
  self->_fileOutputInternal->minFreeDiskSpaceLimit = minFreeDiskSpaceLimit;
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)delegate
{
  self->_delegate = (AVCaptureFileOutputDelegate *)delegate;
}

- (BOOL)isVirtualCaptureCardSupported
{
  return 0;
}

- (BOOL)usesVirtualCaptureCard
{
  return 0;
}

@end
