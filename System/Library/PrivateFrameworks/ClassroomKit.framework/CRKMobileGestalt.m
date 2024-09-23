@implementation CRKMobileGestalt

+ (CRKMobileGestalt)sharedGestalt
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__CRKMobileGestalt_sharedGestalt__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedGestalt_onceToken != -1)
    dispatch_once(&sharedGestalt_onceToken, block);
  return (CRKMobileGestalt *)(id)sharedGestalt_result;
}

void __33__CRKMobileGestalt_sharedGestalt__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedGestalt_result;
  sharedGestalt_result = v0;

}

- (NSString)serialNumber
{
  return (NSString *)-[CRKMobileGestalt answerForQuestion:ofClass:](self, "answerForQuestion:ofClass:", CFSTR("SerialNumber"), objc_opt_class());
}

- (double)mainScreenScale
{
  void *v2;
  double v3;
  double v4;

  -[CRKMobileGestalt answerForQuestion:ofClass:](self, "answerForQuestion:ofClass:", CFSTR("main-screen-scale"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (CGSize)mainScreenSizeInPixels
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[CRKMobileGestalt answerForQuestion:ofClass:](self, "answerForQuestion:ofClass:", CFSTR("main-screen-width"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKMobileGestalt answerForQuestion:ofClass:](self, "answerForQuestion:ofClass:", CFSTR("main-screen-height"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v6 = v5;
  objc_msgSend(v4, "doubleValue");
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (unint64_t)availableBytes
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[CRKMobileGestalt answerForQuestion:ofClass:](self, "answerForQuestion:ofClass:", CFSTR("DiskUsage"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BED8690]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedLongLongValue");

  return v4;
}

- (NSString)buildVersion
{
  return (NSString *)-[CRKMobileGestalt answerForQuestion:ofClass:](self, "answerForQuestion:ofClass:", CFSTR("BuildVersion"), objc_opt_class());
}

- (NSString)productVersion
{
  return (NSString *)-[CRKMobileGestalt answerForQuestion:ofClass:](self, "answerForQuestion:ofClass:", CFSTR("ProductVersion"), objc_opt_class());
}

- (id)answerForQuestion:(__CFString *)a3 ofClass:(Class)a4
{
  void *v4;
  void *v5;
  id v6;

  -[CRKMobileGestalt answerForQuestion:](self, "answerForQuestion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

- (id)answerForQuestion:(__CFString *)a3
{
  return (id)MGCopyAnswer();
}

@end
