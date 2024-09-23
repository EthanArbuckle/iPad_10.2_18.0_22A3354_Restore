@implementation JFXMatting

+ (void)postNotification:(unint64_t)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__JFXMatting_postNotification___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __31__JFXMatting_postNotification___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v4 = CFSTR("kMattingStatusWarning");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("kMattingStatusWarning"), 0, v2);

}

+ (id)depthDataForCVPixelBuffer:(__CVBuffer *)a3
{
  size_t Height;
  size_t Width;
  size_t BytesPerRow;
  uint64_t PixelFormatType;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  id v20;
  uint8_t buf[4];
  _BYTE v22[10];
  __int16 v23;
  unsigned int v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (!a3)
    return 0;
  Height = CVPixelBufferGetHeight(a3);
  Width = CVPixelBufferGetWidth(a3);
  BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  v8 = PixelFormatType;
  if ((_DWORD)PixelFormatType == 1717855600 || (_DWORD)PixelFormatType == 1751410032)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", Width);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BDD9760]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", Height);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BDD9638]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", BytesPerRow);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BDD92C0]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BDD96B8]);

    CVPixelBufferLockBaseAddress(a3, 1uLL);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", CVPixelBufferGetBaseAddress(a3), BytesPerRow * Height);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, *MEMORY[0x24BDD91C0]);

    objc_msgSend(v14, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BDD91C8]);
    v20 = 0;
    objc_msgSend(MEMORY[0x24BDB2548], "depthDataFromDictionaryRepresentation:error:", v14, &v20);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v20;
    CVPixelBufferUnlockBaseAddress(a3, 1uLL);
    if (!v17)
    {

      goto LABEL_13;
    }
    JFXLog_matting();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v22 = v17;
      _os_log_impl(&dword_2269A9000, v18, OS_LOG_TYPE_DEFAULT, "Error: failed to create depthdata. %@", buf, 0xCu);
    }

    v9 = v16;
  }
  else
  {
    JFXLog_matting();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)v22 = BYTE3(v8);
      *(_WORD *)&v22[4] = 1024;
      *(_DWORD *)&v22[6] = WORD1(v8);
      v23 = 1024;
      v24 = v8 >> 8;
      v25 = 1024;
      v26 = v8;
      _os_log_impl(&dword_2269A9000, v9, OS_LOG_TYPE_DEFAULT, "Error: unexpected depth format: %c%c%c%c", buf, 0x1Au);
    }
  }
  v16 = 0;
LABEL_13:

  return v16;
}

+ (BOOL)isCVASegMattingSPIWorking
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__JFXMatting_isCVASegMattingSPIWorking__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (isCVASegMattingSPIWorking_onceToken != -1)
    dispatch_once(&isCVASegMattingSPIWorking_onceToken, block);
  return isCVASegMattingSPIWorking_working;
}

void __39__JFXMatting_isCVASegMattingSPIWorking__block_invoke()
{
  double v0;
  int v1;
  double v2;
  int v3;
  const __CFAllocator *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  CMSampleTimingInfo v10;
  CMVideoFormatDescriptionRef formatDescriptionOut;
  CVPixelBufferRef v12;
  CVPixelBufferRef pixelBufferOut;
  CMSampleBufferRef sampleBufferOut;

  +[JFXRGBDMatte mattingDepthInputSize](JFXRGBDMatte, "mattingDepthInputSize");
  v1 = (int)v0;
  v3 = (int)v2;
  pixelBufferOut = 0;
  sampleBufferOut = 0;
  formatDescriptionOut = 0;
  v12 = 0;
  memset(&v10, 0, sizeof(v10));
  CMTimeMake(&v10.duration, 1, 30);
  v10.presentationTimeStamp = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D88];
  v10.decodeTimeStamp = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D40];
  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0x500uLL, 0x2D0uLL, 0x34323076u, 0, &pixelBufferOut);
  CMVideoFormatDescriptionCreateForImageBuffer(v4, pixelBufferOut, &formatDescriptionOut);
  CMSampleBufferCreateReadyWithImageBuffer(v4, pixelBufferOut, formatDescriptionOut, &v10, &sampleBufferOut);
  CVPixelBufferCreate(v4, v1, v3, 0x66646570u, 0, &v12);
  objc_msgSend((id)objc_opt_class(), "depthDataForCVPixelBuffer:", v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CVPixelBufferRelease(v12);
  CVPixelBufferRelease(pixelBufferOut);
  v6 = objc_alloc(MEMORY[0x24BE78FF0]);
  v7 = (void *)objc_msgSend(v6, "initWithSampleBuffer:", sampleBufferOut);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE79020]), "initWithColorBuffer:depthData:metadata:", v7, v5, 0);
  if (v8)
  {
    v9 = -[JFXCVASegMatting initForFrameSet:]([JFXCVASegMatting alloc], "initForFrameSet:", v8);
    isCVASegMattingSPIWorking_working = objc_msgSend(v9, "ready");

  }
  if (formatDescriptionOut)
    CFRelease(formatDescriptionOut);
  if (sampleBufferOut)
    CFRelease(sampleBufferOut);

}

+ (Class)defaultMatteGeneratorClass
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("JFXMattingClassAutoSelectionPref"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "integerForKey:", CFSTR("JFXMattingClassAutoSelectionPref"));

  }
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

+ (CGSize)mattingDepthInputSize
{
  double v2;
  double v3;
  CGSize result;

  -[objc_class mattingDepthInputSize](+[JFXMatting defaultMatteGeneratorClass](JFXMatting, "defaultMatteGeneratorClass"), "mattingDepthInputSize");
  result.height = v3;
  result.width = v2;
  return result;
}

+ (BOOL)canMatteWithANE
{
  if (canMatteWithANE_onceToken != -1)
    dispatch_once(&canMatteWithANE_onceToken, &__block_literal_global_61);
  return canMatteWithANE_hasAppleNeuralEngine;
}

uint64_t __29__JFXMatting_canMatteWithANE__block_invoke()
{
  uint64_t result;
  char v1;
  BOOL v2;
  int v3;
  size_t v5;
  int v6;

  v6 = 0;
  v5 = 4;
  result = sysctlbyname("hw.cpufamily", &v6, &v5, 0, 0);
  v1 = 0;
  if (v6 <= 747742333)
  {
    v2 = v6 == -1829029944;
    v3 = -400654602;
  }
  else
  {
    v2 = v6 == 747742334 || v6 == 933271106;
    v3 = 1741614739;
  }
  if (!v2 && v6 != v3)
    v1 = 1;
  canMatteWithANE_hasAppleNeuralEngine = v1;
  return result;
}

+ (BOOL)defaultMatteGeneratorPrefersDepth
{
  return objc_msgSend((id)objc_msgSend(a1, "defaultMatteGeneratorClass"), "_defaultMatteGeneratorPrefersDepth");
}

+ (BOOL)_defaultMatteGeneratorPrefersDepth
{
  return 1;
}

+ (id)defaultMatteGenerator:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "defaultMatteGeneratorClass")), "initForFrameSet:", v4);

  return v5;
}

- (id)initForFrameSet:(id)a3
{
  id v4;
  JFXMatting *v5;
  void *v6;
  CGFloat v7;
  CGFloat v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)JFXMatting;
  v5 = -[JFXMatting init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "colorImageBuffer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "size");
    v5->_colorBufferSize.width = v7;
    v5->_colorBufferSize.height = v8;

    objc_msgSend(v4, "metadataObjectForKey:", *MEMORY[0x24BE79580]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_cameraLocation = objc_msgSend(v9, "cameraPosition");

  }
  return v5;
}

- (BOOL)isValidForCameraFrameSet:(id)a3
{
  id v4;
  int64_t cameraLocation;
  void *v6;
  void *v7;
  double v8;
  double v9;
  BOOL v10;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "defaultMatteGeneratorClass");
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    cameraLocation = self->_cameraLocation;
    objc_msgSend(v4, "metadataObjectForKey:", *MEMORY[0x24BE79580]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (cameraLocation == objc_msgSend(v6, "cameraPosition"))
    {
      objc_msgSend(v4, "colorImageBuffer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "size");
      v10 = self->_colorBufferSize.height == v9 && self->_colorBufferSize.width == v8;

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)ready
{
  return self->_ready;
}

- (void)setReady:(BOOL)a3
{
  self->_ready = a3;
}

@end
