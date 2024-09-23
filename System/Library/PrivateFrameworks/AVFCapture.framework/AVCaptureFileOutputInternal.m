@implementation AVCaptureFileOutputInternal

- (AVCaptureFileOutputInternal)init
{
  AVCaptureFileOutputInternal *result;
  uint64_t v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVCaptureFileOutputInternal;
  result = -[AVCaptureFileOutputInternal init](&v4, sel_init);
  if (result)
  {
    v3 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)&result->maxRecordedDuration.value = *MEMORY[0x1E0CA2E18];
    result->maxRecordedDuration.epoch = *(_QWORD *)(v3 + 16);
  }
  return result;
}

@end
