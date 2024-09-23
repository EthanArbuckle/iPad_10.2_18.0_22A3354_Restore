@implementation AVCaptureInputPortInternal

- (AVCaptureInputPortInternal)init
{
  AVCaptureInputPortInternal *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVCaptureInputPortInternal;
  result = -[AVCaptureInputPortInternal init](&v3, sel_init);
  if (result)
    result->enabled = 1;
  return result;
}

- (void)dealloc
{
  opaqueCMFormatDescription *formatDescription;
  OpaqueCMClock *clock;
  objc_super v5;

  self->input = 0;

  formatDescription = self->formatDescription;
  if (formatDescription)
    CFRelease(formatDescription);
  clock = self->clock;
  if (clock)
    CFRelease(clock);

  v5.receiver = self;
  v5.super_class = (Class)AVCaptureInputPortInternal;
  -[AVCaptureInputPortInternal dealloc](&v5, sel_dealloc);
}

@end
