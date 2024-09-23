@implementation ICDeviceSupport

+ (BOOL)isRunningUnitTests
{
  if (isRunningUnitTests_onceToken != -1)
    dispatch_once(&isRunningUnitTests_onceToken, &__block_literal_global_71);
  return isRunningUnitTests_isRunningUnitTests;
}

void __37__ICDeviceSupport_isRunningUnitTests__block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "environment");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("IC_TEST_PLAN"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  isRunningUnitTests_isRunningUnitTests = objc_msgSend(v1, "length") != 0;

}

void __41__ICDeviceSupport_notesDeviceDrawingSize__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  double v4;
  double v5;
  double v6;
  int v7;
  int v8;
  float v9;
  double v10;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[14];
  _QWORD v35[16];

  v35[14] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ic_isAppExtension");

  if ((v3 & 1) != 0)
  {
    v4 = 1.0;
    v5 = 1024.0;
    v6 = 768.0;
  }
  else
  {
    v7 = MGGetSInt32Answer();
    v8 = MGGetSInt32Answer();
    MGGetFloat32Answer();
    v5 = (double)v7;
    v6 = (double)v8;
    v4 = v9;
  }
  if (v6 <= v5)
    v10 = v6;
  else
    v10 = v5;
  if (v6 > v5)
    v5 = v6;
  if (v5 <= 2048.0 || v10 <= 1536.0)
  {
    v12 = 2.0;
    if (v4 <= 2.0)
      v12 = v4;
    v13 = v12 * *(double *)&notesDeviceDrawingSize_drawingSize_0;
    v10 = v12 * *(double *)&notesDeviceDrawingSize_drawingSize_1;
  }
  else
  {
    v13 = round(v10 * 1.33333333);
  }
  notesDeviceDrawingSize_drawingSize_1 = *(_QWORD *)&v10;
  notesDeviceDrawingSize_drawingSize_0 = *(_QWORD *)&v13;
  objc_msgSend(*(id *)(a1 + 32), "notesProductType");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = CFSTR("iPhone4,1");
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", 1024.0, 768.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v33;
  v34[1] = CFSTR("iPhone5,1");
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", 1280.0, 960.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v32;
  v34[2] = CFSTR("iPhone5,2");
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", 1280.0, 960.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v35[2] = v30;
  v34[3] = CFSTR("iPhone5,3");
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", 1280.0, 960.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v35[3] = v29;
  v34[4] = CFSTR("iPhone5,4");
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", 1280.0, 960.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v35[4] = v28;
  v34[5] = CFSTR("iPhone6,1");
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", 1024.0, 768.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v35[5] = v14;
  v34[6] = CFSTR("iPhone6,2");
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", 1024.0, 768.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v35[6] = v15;
  v34[7] = CFSTR("iPhone8,4");
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", 1024.0, 768.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v35[7] = v16;
  v34[8] = CFSTR("iPhone7,2");
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", 1280.0, 960.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v35[8] = v17;
  v34[9] = CFSTR("iPhone8,1");
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", 1280.0, 960.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v35[9] = v18;
  v34[10] = CFSTR("iPhone9,1");
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", 1280.0, 960.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v35[10] = v19;
  v34[11] = CFSTR("iPhone9,3");
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", 1280.0, 960.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v35[11] = v20;
  v34[12] = CFSTR("iPod5,1");
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", 1024.0, 768.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v35[12] = v21;
  v34[13] = CFSTR("iPod7,1");
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", 1024.0, 768.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v35[13] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 14);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "objectForKeyedSubscript:", v31);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v24)
  {
    objc_msgSend(v24, "CGSizeValue");
    notesDeviceDrawingSize_drawingSize_0 = v26;
    notesDeviceDrawingSize_drawingSize_1 = v27;
  }

}

uint64_t __39__ICDeviceSupport_deviceSupportsPencil__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  deviceSupportsPencil_supportsPencil = result;
  return result;
}

void __35__ICDeviceSupport_notesProductType__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = MGCopyAnswer();
  v1 = (void *)notesProductType_productType;
  notesProductType_productType = v0;

}

+ (id)notesProductType
{
  if (notesProductType_onceToken != -1)
    dispatch_once(&notesProductType_onceToken, &__block_literal_global_5);
  return (id)notesProductType_productType;
}

+ (CGSize)notesDeviceDrawingSize
{
  double v2;
  double v3;
  _QWORD block[5];
  CGSize result;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__ICDeviceSupport_notesDeviceDrawingSize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (notesDeviceDrawingSize_onceToken != -1)
    dispatch_once(&notesDeviceDrawingSize_onceToken, block);
  v2 = *(double *)&notesDeviceDrawingSize_drawingSize_0;
  v3 = *(double *)&notesDeviceDrawingSize_drawingSize_1;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (BOOL)deviceSupportsPencil
{
  if (deviceSupportsPencil_onceToken != -1)
    dispatch_once(&deviceSupportsPencil_onceToken, &__block_literal_global_46);
  return deviceSupportsPencil_supportsPencil;
}

+ (BOOL)deviceIsMac
{
  return 0;
}

+ (BOOL)deviceIsVision
{
  return 0;
}

+ (BOOL)processIsSiri
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1EA832510);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "processName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "containsObject:", v4);

  return v5;
}

+ (BOOL)deviceSupportsFirstGenPencil
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__ICDeviceSupport_deviceSupportsFirstGenPencil__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (deviceSupportsFirstGenPencil_onceToken != -1)
    dispatch_once(&deviceSupportsFirstGenPencil_onceToken, block);
  return deviceSupportsFirstGenPencil_supportsFirstGenPencil;
}

uint64_t __47__ICDeviceSupport_deviceSupportsFirstGenPencil__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "deviceSupportsPencil");
  if ((_DWORD)result)
  {
    result = MGIsDeviceOneOfType();
    deviceSupportsFirstGenPencil_supportsFirstGenPencil = result;
  }
  return result;
}

+ (BOOL)deviceSupportsSystemPaper
{
  if (deviceSupportsSystemPaper_onceToken != -1)
    dispatch_once(&deviceSupportsSystemPaper_onceToken, &__block_literal_global_66);
  return deviceSupportsSystemPaper_supportsSystemPaper;
}

uint64_t __44__ICDeviceSupport_deviceSupportsSystemPaper__block_invoke()
{
  uint64_t result;

  result = MGIsDeviceOneOfType();
  deviceSupportsSystemPaper_supportsSystemPaper = result ^ 1;
  return result;
}

+ (BOOL)deviceIsSimulator
{
  return 0;
}

+ (BOOL)isRunningDuoTests
{
  if (isRunningDuoTests_onceToken != -1)
    dispatch_once(&isRunningDuoTests_onceToken, &__block_literal_global_74);
  return isRunningDuoTests_isRunningDuoTests;
}

void __36__ICDeviceSupport_isRunningDuoTests__block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "environment");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("XCTestBundlePath"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  isRunningDuoTests_isRunningDuoTests = objc_msgSend(v1, "containsString:", CFSTR("DuoTests.xctest"));

}

+ (BOOL)isRunningInApp
{
  if (isRunningInApp_onceToken != -1)
    dispatch_once(&isRunningInApp_onceToken, &__block_literal_global_79);
  return isRunningInApp_isRunningInApp;
}

void __33__ICDeviceSupport_isRunningInApp__block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  ICNotesAppBundleIdentifier();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  isRunningInApp_isRunningInApp = objc_msgSend(v2, "isEqualToString:", v1);

}

+ (NSString)deviceName
{
  if (deviceName_onceToken != -1)
    dispatch_once(&deviceName_onceToken, &__block_literal_global_80);
  return (NSString *)(id)deviceName_deviceName;
}

void __29__ICDeviceSupport_deviceName__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = MGCopyAnswer();
  v1 = (void *)deviceName_deviceName;
  deviceName_deviceName = v0;

}

+ (NSString)productName
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D36A10], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "productName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)productVersion
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D36A10], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "productVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)productBuildVersion
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D36A10], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "productBuildVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

@end
