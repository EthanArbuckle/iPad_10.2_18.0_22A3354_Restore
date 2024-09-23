@implementation AVCaptureMovieFileOutputInternal

- (AVCaptureMovieFileOutputInternal)init
{
  char *v2;
  CMTime v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVCaptureMovieFileOutputInternal;
  v2 = -[AVCaptureMovieFileOutputInternal init](&v5, sel_init);
  if (v2)
  {
    *((_QWORD *)v2 + 2) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    *((_QWORD *)v2 + 3) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    CMTimeMake(&v4, 10, 1);
    *(CMTime *)(v2 + 32) = v4;
    v2[88] = 0;
    *((_QWORD *)v2 + 8) = objc_alloc_init(MEMORY[0x1E0C99D20]);
    v2[129] = 0;
  }
  return (AVCaptureMovieFileOutputInternal *)v2;
}

- (void)dealloc
{
  objc_super v3;

  ct_green_tea_logger_destroy();
  v3.receiver = self;
  v3.super_class = (Class)AVCaptureMovieFileOutputInternal;
  -[AVCaptureMovieFileOutputInternal dealloc](&v3, sel_dealloc);
}

@end
