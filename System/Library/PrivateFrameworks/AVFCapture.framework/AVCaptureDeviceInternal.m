@implementation AVCaptureDeviceInternal

- (AVCaptureDeviceInternal)init
{
  AVCaptureDeviceInternal *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVCaptureDeviceInternal;
  v2 = -[AVCaptureDeviceInternal init](&v4, sel_init);
  if (v2)
    v2->activeReactions = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVCaptureDeviceInternal;
  -[AVCaptureDeviceInternal dealloc](&v3, sel_dealloc);
}

@end
