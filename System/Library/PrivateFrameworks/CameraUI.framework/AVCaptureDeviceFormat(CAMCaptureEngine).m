@implementation AVCaptureDeviceFormat(CAMCaptureEngine)

- (double)cam_frameRateForVideoConfiguration:()CAMCaptureEngine
{
  double v3;
  double result;

  switch(a3)
  {
    case 1:
    case 9:
      v3 = 60.0;
      goto LABEL_10;
    case 2:
    case 4:
    case 13:
      v3 = 120.0;
      goto LABEL_10;
    case 3:
    case 8:
      v3 = 240.0;
      goto LABEL_10;
    case 5:
    case 6:
    case 7:
      goto LABEL_4;
    case 10:
      return 24.0;
    case 11:
    case 12:
      return 25.0;
    case 14:
      v3 = 100.0;
LABEL_10:
      result = v3;
      break;
    default:
      result = 0.0;
      if (a3 == 10003)
LABEL_4:
        result = 30.0;
      break;
  }
  return result;
}

- (CMTime)cam_frameDurationForVideoConfiguration:()CAMCaptureEngine
{
  double v3;

  objc_msgSend(a1, "cam_frameRateForVideoConfiguration:");
  return CMTimeMake(a2, 1, (int)v3);
}

- (uint64_t)_expectedVideoDimensionsForVideoConfiguration:()CAMCaptureEngine
{
  uint64_t v3;
  uint64_t v4;

  if (a3 <= 0xE)
  {
    if (((1 << a3) & 0x7620) != 0)
    {
      v3 = 0x87000000000;
      v4 = 3840;
      return v4 | v3;
    }
    if (((1 << a3) & 0x992) != 0)
    {
      v3 = 0x43800000000;
      v4 = 1920;
      return v4 | v3;
    }
    if (((1 << a3) & 0x4C) != 0)
    {
      v3 = 0x2D000000000;
      v4 = 1280;
      return v4 | v3;
    }
  }
  v3 = 0x1E000000000;
  v4 = 640;
  if (a3 != 10003)
  {
    v3 = 0;
    v4 = 0;
  }
  return v4 | v3;
}

- (uint64_t)cam_supportsVideoConfiguration:()CAMCaptureEngine colorSpace:enableProResVideo:
{
  double v9;
  double v10;
  uint64_t v11;

  objc_msgSend(a1, "cam_frameRateForVideoConfiguration:");
  v10 = v9;
  v11 = objc_msgSend(a1, "_expectedVideoDimensionsForVideoConfiguration:", a3);
  return objc_msgSend(a1, "cam_supportsFrameRate:width:height:colorSpace:enableProResVideo:", (int)v11, v11 >> 32, a4, a5, v10);
}

- (uint64_t)cam_supportsFrameRate:()CAMCaptureEngine width:height:colorSpace:enableProResVideo:
{
  const opaqueCMFormatDescription *v13;
  int64_t v14;
  int64_t v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  uint64_t Dimensions;
  uint64_t result;
  char v22;

  v13 = (const opaqueCMFormatDescription *)objc_msgSend(a1, "formatDescription");
  if (CMFormatDescriptionGetMediaType(v13) != 1986618469)
    return 0;
  v22 = 0;
  v14 = +[CAMCaptureConversions AVCaptureColorSpaceForColorSpace:hasValidConversion:](CAMCaptureConversions, "AVCaptureColorSpaceForColorSpace:hasValidConversion:", a6, &v22);
  if (v22)
  {
    v15 = v14;
    objc_msgSend(a1, "supportedColorSpaces");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "containsObject:", v17);

    if (!v18)
      return 0;
  }
  if ((a7 & 1) != 0)
    v19 = 2016686642;
  else
    v19 = a6 > 3 ? 0 : dword_1DB9A7E60[a6];
  if (CMFormatDescriptionGetMediaSubType(v13) != v19)
    return 0;
  if (!a4)
    return objc_msgSend(a1, "cam_supportsFrameRate:", a2);
  if (!a5)
    return objc_msgSend(a1, "cam_supportsFrameRate:", a2);
  Dimensions = (uint64_t)CMVideoFormatDescriptionGetDimensions(v13);
  result = 0;
  if (a5 == Dimensions >> 32 && (int)Dimensions == a4)
    return objc_msgSend(a1, "cam_supportsFrameRate:", a2);
  return result;
}

- (uint64_t)cam_supportsFrameRate:()CAMCaptureEngine
{
  void *v3;
  uint64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  objc_msgSend(a1, "videoSupportedFrameRateRanges");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__AVCaptureDeviceFormat_CAMCaptureEngine__cam_supportsFrameRate___block_invoke;
  v6[3] = &unk_1EA32F620;
  *(double *)&v6[5] = a2;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);

  v4 = *((unsigned __int8 *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (uint64_t)cam_supportsFrameDuration:()CAMCaptureEngine
{
  void *v4;
  uint64_t v5;
  _QWORD v7[5];
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  objc_msgSend(a1, "videoSupportedFrameRateRanges");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__AVCaptureDeviceFormat_CAMCaptureEngine__cam_supportsFrameDuration___block_invoke;
  v7[3] = &unk_1EA32F648;
  v8 = *a3;
  v9 = *((_QWORD *)a3 + 2);
  v7[4] = &v10;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);

  v5 = *((unsigned __int8 *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v5;
}

- (BOOL)cam_supportsPanoramaConfiguration:()CAMCaptureEngine
{
  id v4;
  const opaqueCMFormatDescription *v5;
  uint64_t Dimensions;
  void *v7;
  _BOOL8 v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = a3;
  v5 = (const opaqueCMFormatDescription *)objc_msgSend(a1, "formatDescription");
  Dimensions = (uint64_t)CMVideoFormatDescriptionGetDimensions(v5);
  if (objc_msgSend(v4, "sampleBufferWidth") == (int)Dimensions
    && objc_msgSend(v4, "sampleBufferHeight") == Dimensions >> 32
    && CMFormatDescriptionGetMediaSubType(v5) == 875704422)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    objc_msgSend(a1, "videoSupportedFrameRateRanges");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __77__AVCaptureDeviceFormat_CAMCaptureEngine__cam_supportsPanoramaConfiguration___block_invoke;
    v10[3] = &unk_1EA32F670;
    v11 = v4;
    v12 = &v13;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);
    v8 = *((_BYTE *)v14 + 24) != 0;

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)cam_supportsPortraitFrontFacingZoomed
{
  const opaqueCMFormatDescription *v2;
  void *v3;
  _BOOL8 v4;

  v2 = (const opaqueCMFormatDescription *)objc_msgSend(a1, "formatDescription");
  if (CMVideoFormatDescriptionGetDimensions(v2) != 0x90C00000C10
    || CMFormatDescriptionGetMediaSubType(v2) != 875704422)
  {
    return 0;
  }
  objc_msgSend(a1, "supportedDepthDataFormats");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (uint64_t)cam_compareUsingDimensions:()CAMCaptureEngine
{
  id v4;
  unint64_t Dimensions;
  int32_t v6;
  unint64_t v7;
  const opaqueCMFormatDescription *v8;
  CMVideoDimensions v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  v4 = a3;
  Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)objc_msgSend(a1, "formatDescription"));
  v6 = Dimensions;
  v7 = HIDWORD(Dimensions);
  v8 = (const opaqueCMFormatDescription *)objc_msgSend(v4, "formatDescription");

  v9 = CMVideoFormatDescriptionGetDimensions(v8);
  v10 = (int)v7 < v9.height && v6 < v9.width;
  v11 = (int)v7 <= v9.height || v6 <= v9.width;
  v12 = v10 << 63 >> 63;
  if (v11)
    return v12;
  else
    return 1;
}

- (uint64_t)cam_compareUsingQuality:()CAMCaptureEngine
{
  id v4;
  uint64_t v5;

  v4 = a3;
  v5 = objc_msgSend(a1, "cam_compareUsingBinning:", v4);
  if (!v5)
    v5 = objc_msgSend(a1, "cam_compareUsingMaximumFramerate:", v4);

  return v5;
}

- (uint64_t)cam_compareUsingBinning:()CAMCaptureEngine
{
  id v4;
  unsigned int v5;

  v4 = a3;
  LODWORD(a1) = objc_msgSend(a1, "isVideoBinned");
  v5 = objc_msgSend(v4, "isVideoBinned");

  if ((_DWORD)a1)
    return v5 - 1;
  else
    return v5;
}

- (uint64_t)cam_compareUsingMaximumFramerate:()CAMCaptureEngine
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a1, "cam_maximumFrameRate");
  v6 = v5;
  objc_msgSend(v4, "cam_maximumFrameRate");
  v8 = v7;

  v9 = -1;
  if (v6 <= v8)
    v9 = 0;
  if (v6 >= v8)
    return v9;
  else
    return 1;
}

- (double)cam_maximumFrameRate
{
  void *v1;
  double v2;
  _QWORD v4[5];
  uint64_t v5;
  double *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = (double *)&v5;
  v7 = 0x2020000000;
  v8 = 0;
  objc_msgSend(a1, "videoSupportedFrameRateRanges");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__AVCaptureDeviceFormat_CAMCaptureEngine__cam_maximumFrameRate__block_invoke;
  v4[3] = &unk_1EA32F698;
  v4[4] = &v5;
  objc_msgSend(v1, "enumerateObjectsUsingBlock:", v4);

  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

@end
