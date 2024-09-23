@implementation AVCaptureStillImageOutputInternal

- (AVCaptureStillImageOutputInternal)init
{
  AVCaptureStillImageOutputInternal *v2;
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVCaptureStillImageOutputInternal;
  v2 = -[AVCaptureStillImageOutputInternal init](&v5, sel_init);
  if (v2)
  {
    v2->stillImageRequests = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    v3 = objc_alloc(MEMORY[0x1E0C99D80]);
    v2->outputSettings = (NSDictionary *)objc_msgSend(v3, "initWithObjectsAndKeys:", *MEMORY[0x1E0CF2C90], *MEMORY[0x1E0CF2C58], 0);
    v2->imageDataFormatType = 1785750887;
    v2->noiseReductionEnabled = 1;
    v2->shutterSoundID = 1108;
    v2->SISEnabled = 1;
    v2->prepareRequests = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v2->greenTeaLogger = (ct_green_tea_logger_s *)ct_green_tea_logger_create();
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  ct_green_tea_logger_destroy();
  v3.receiver = self;
  v3.super_class = (Class)AVCaptureStillImageOutputInternal;
  -[AVCaptureStillImageOutputInternal dealloc](&v3, sel_dealloc);
}

@end
