@implementation CAMOrientationUtilities

+ (int64_t)imageOrientationOfResult:(id)a3 withCaptureDevice:(int64_t)a4 captureOrientation:(int64_t)a5
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int64_t v9;

  objc_msgSend(a3, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CBCFF0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "intValue");
    v8 = PLImageOrientationFromExifOrientation();
  }
  else
  {
    PLSensorOrientationFromCaptureOrientation();
    v8 = PLImageOrientationFromDeviceOrientation();
  }
  v9 = v8;

  return v9;
}

+ (int64_t)imageOrientationForVideoRequest:(id)a3
{
  id v3;
  int v4;
  uint64_t v5;
  BOOL v6;
  int64_t v7;
  int64_t v8;
  int64_t result;

  v3 = a3;
  v4 = objc_msgSend(v3, "isCaptureMirrored");
  v5 = objc_msgSend(v3, "captureOrientation");

  switch(v5)
  {
    case 0:
    case 1:
      v6 = v4 == 0;
      v7 = 3;
      v8 = 6;
      goto LABEL_5;
    case 2:
      v6 = v4 == 0;
      v7 = 2;
      v8 = 7;
LABEL_5:
      if (v6)
        result = v7;
      else
        result = v8;
      break;
    case 3:
      if (v4)
        result = 4;
      else
        result = 0;
      break;
    case 4:
      if (v4)
        result = 5;
      else
        result = 1;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

+ (int64_t)videoTrackOrientationForVideoRequest:(id)a3
{
  id v3;
  unsigned int v4;
  uint64_t v5;
  int64_t result;

  v3 = a3;
  v4 = objc_msgSend(v3, "isCaptureMirrored");
  v5 = objc_msgSend(v3, "captureOrientation");

  switch(v5)
  {
    case 0:
    case 1:
      if (v4)
        result = 2;
      else
        result = 3;
      break;
    case 2:
      if (v4)
        result = 3;
      else
        result = 2;
      break;
    case 3:
      result = v4;
      break;
    case 4:
      result = v4 ^ 1;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

+ (int)exifOrientationForVideoRequest:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "isCaptureMirrored");
  objc_msgSend(v3, "captureDevicePosition");
  objc_msgSend(v3, "captureOrientation");

  return PLExifOrientationFromImageOrientation();
}

+ (int64_t)panoramaCaptureOrientationFromCaptureOrientation:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 2)
    return 3;
  else
    return qword_1DB9A4A98[a3 - 2];
}

+ (int64_t)captureOrientationFromPanoramaCaptureOrientation:(int64_t)a3
{
  if ((unint64_t)a3 > 4)
    return 0;
  else
    return qword_1DB9A4AB0[a3];
}

@end
