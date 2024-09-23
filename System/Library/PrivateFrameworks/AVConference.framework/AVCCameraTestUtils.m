@implementation AVCCameraTestUtils

+ (id)defaultCameraUID
{
  return CFSTR("com.apple.avfoundation.avcapturedevice.built-in_video:1");
}

+ (BOOL)isReactionAvailable
{
  void *v2;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0C8B0A0], "deviceWithUniqueID:", +[AVCCameraTestUtils defaultCameraUID](AVCCameraTestUtils, "defaultCameraUID"));
  if (v2)
    LOBYTE(v2) = objc_msgSend(v2, "canPerformReactionEffects");
  return (char)v2;
}

+ (BOOL)performReaction
{
  void *v2;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0C8B0A0], "deviceWithUniqueID:", +[AVCCameraTestUtils defaultCameraUID](AVCCameraTestUtils, "defaultCameraUID"));
  if (v2)
  {
    LODWORD(v2) = objc_msgSend(v2, "canPerformReactionEffects");
    if ((_DWORD)v2)
    {
      AVControlCenterVideoEffectsModulePerformReactionEffect();
      LOBYTE(v2) = 1;
    }
  }
  return (char)v2;
}

+ (BOOL)isCameraAvailable
{
  return +[AVCCameraTestUtils isCameraAvailable:](AVCCameraTestUtils, "isCameraAvailable:", 0);
}

+ (BOOL)isCameraAvailable:(int64_t)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[7];

  v9[6] = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0C89F78];
  v9[0] = *MEMORY[0x1E0C89FA0];
  v9[1] = v4;
  v5 = *MEMORY[0x1E0C89F58];
  v9[2] = *MEMORY[0x1E0C89F98];
  v9[3] = v5;
  v6 = *MEMORY[0x1E0C89F88];
  v9[4] = *MEMORY[0x1E0C89F60];
  v9[5] = v6;
  v7 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 6);
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C8B0A8], "discoverySessionWithDeviceTypes:mediaType:position:", v7, *MEMORY[0x1E0C8A808], a3), "devices"), "count") != 0;
}

+ (BOOL)isCenterStageActive
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C8B0A0], "deviceWithUniqueID:", CFSTR("com.apple.avfoundation.avcapturedevice.built-in_video:1")), "isCenterStageActive");
}

+ (BOOL)isCenterStageAvailable
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t i;
  _BYTE v9[128];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C8B0A0], "deviceWithUniqueID:", CFSTR("com.apple.avfoundation.avcapturedevice.built-in_video:1")), "formats");
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v2);
        v5 |= objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "isCenterStageSupported");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
    }
    while (v4);
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5 & 1;
}

+ (BOOL)expectedPreviewResolutionForDevice:(id)a3 width:(int *)a4 height:(int *)a5
{
  void *v8;
  void *v9;
  void *v10;

  if (expectedPreviewResolutionForDevice_width_height__onceToken != -1)
    dispatch_once(&expectedPreviewResolutionForDevice_width_height__onceToken, &__block_literal_global_39);
  v8 = (void *)objc_msgSend((id)expectedPreviewResolutionForDevice_width_height___resolutionForDeviceTypeDict, "objectForKeyedSubscript:", a3);
  v9 = v8;
  if (v8)
  {
    v10 = (void *)objc_msgSend(v8, "componentsSeparatedByString:", CFSTR("x"));
    *a4 = objc_msgSend((id)objc_msgSend(v10, "objectAtIndexedSubscript:", 0), "integerValue");
    *a5 = objc_msgSend((id)objc_msgSend(v10, "objectAtIndexedSubscript:", 1), "integerValue");
  }
  return v9 != 0;
}

void __70__AVCCameraTestUtils_expectedPreviewResolutionForDevice_width_height___block_invoke()
{
  expectedPreviewResolutionForDevice_width_height___resolutionForDeviceTypeDict = (uint64_t)&unk_1E9EFB290;
}

+ (BOOL)findExpectedFramerate:(float *)a3 forDevice:(id)a4
{
  BOOL v6;
  int v7;
  int v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v10[0] = 0;
  v9 = 0;
  v6 = -[VCVideoRuleCollectionsCamera getBestFrameWidth:frameHeight:frameRate:](+[VCVideoRuleCollectionsCamera sharedInstance](VCVideoRuleCollectionsCamera, "sharedInstance"), "getBestFrameWidth:frameHeight:frameRate:", (char *)v10 + 4, v10, &v9);
  if (findExpectedFramerate_forDevice__onceToken != -1)
    dispatch_once(&findExpectedFramerate_forDevice__onceToken, &__block_literal_global_45);
  if (objc_msgSend((id)findExpectedFramerate_forDevice___exceptionDeviceFramerateDict, "objectForKeyedSubscript:", a4))
    objc_msgSend((id)objc_msgSend((id)findExpectedFramerate_forDevice___exceptionDeviceFramerateDict, "objectForKeyedSubscript:", a4), "floatValue");
  else
    v7 = v9;
  *(_DWORD *)a3 = v7;
  return v6;
}

void __54__AVCCameraTestUtils_findExpectedFramerate_forDevice___block_invoke()
{
  findExpectedFramerate_forDevice___exceptionDeviceFramerateDict = (uint64_t)&unk_1E9EFB2B8;
}

+ (BOOL)expectedGFTResolutionForDevice:(id)a3 ratio:(CGSize *)a4
{
  void *v6;
  void *v7;
  BOOL v8;

  if (!a4)
    return 0;
  if (expectedGFTResolutionForDevice_ratio__onceToken != -1)
    dispatch_once(&expectedGFTResolutionForDevice_ratio__onceToken, &__block_literal_global_58);
  v6 = (void *)objc_msgSend((id)expectedGFTResolutionForDevice_ratio___gftResolutionForDeviceTypeDict, "objectForKeyedSubscript:", a3);
  if (!v6)
    return 0;
  v7 = (void *)objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("x"));
  a4->width = (double)objc_msgSend((id)objc_msgSend(v7, "objectAtIndexedSubscript:", 0), "integerValue");
  v8 = 1;
  a4->height = (double)objc_msgSend((id)objc_msgSend(v7, "objectAtIndexedSubscript:", 1), "integerValue");
  return v8;
}

void __59__AVCCameraTestUtils_expectedGFTResolutionForDevice_ratio___block_invoke()
{
  expectedGFTResolutionForDevice_ratio___gftResolutionForDeviceTypeDict = (uint64_t)&unk_1E9EFB2E0;
}

@end
