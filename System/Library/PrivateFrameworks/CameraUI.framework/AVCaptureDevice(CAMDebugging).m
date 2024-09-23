@implementation AVCaptureDevice(CAMDebugging)

- (void)cam_debugFocusState
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  const __CFString *v7;
  unint64_t v8;
  const __CFString *v9;

  if (objc_msgSend(a1, "isFocusPointOfInterestSupported"))
  {
    objc_msgSend(a1, "focusPointOfInterest");
    v3 = v2;
    v5 = v4;
    v6 = objc_msgSend(a1, "focusMode");
    if (v6 > 2)
      v7 = CFSTR("Unknown focus mode");
    else
      v7 = off_1EA32A440[v6];
    NSLog(CFSTR("*** Focus: %@, (%.2f, %.2f), smooth=%d"), v7, v3, v5, objc_msgSend(a1, "isSmoothAutoFocusEnabled"));
  }
  else
  {
    v8 = objc_msgSend(a1, "focusMode");
    if (v8 > 2)
      v9 = CFSTR("Unknown focus mode");
    else
      v9 = off_1EA32A440[v8];
    NSLog(CFSTR("*** Focus: %@"), v9);
  }
}

- (void)cam_debugExposureState
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  const __CFString *v7;
  unint64_t v8;
  const __CFString *v9;
  float v10;
  float v11;

  if (objc_msgSend(a1, "isExposurePointOfInterestSupported"))
  {
    objc_msgSend(a1, "exposurePointOfInterest");
    v3 = v2;
    v5 = v4;
    v6 = objc_msgSend(a1, "exposureMode");
    if (v6 > 2)
      v7 = CFSTR("Unknown exposure mode");
    else
      v7 = off_1EA32A458[v6];
    objc_msgSend(a1, "exposureTargetBias");
    NSLog(CFSTR("*** Exposure: %@, (%.2f, %.2f), bias = %.2f"), v7, v3, v5, v10);
  }
  else
  {
    v8 = objc_msgSend(a1, "exposureMode");
    if (v8 > 2)
      v9 = CFSTR("Unknown exposure mode");
    else
      v9 = off_1EA32A458[v8];
    objc_msgSend(a1, "exposureTargetBias");
    NSLog(CFSTR("*** Exposure: %@, bias = %.2f"), v9, v11);
  }
}

- (uint64_t)cam_debugFocusAndExposureState
{
  objc_msgSend(a1, "cam_debugFocusState");
  return objc_msgSend(a1, "cam_debugExposureState");
}

@end
