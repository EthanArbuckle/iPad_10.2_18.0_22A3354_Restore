@implementation AVCaptionOutputSettings

+ (id)eligibleOutputSettingsDictionaryKeys
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("AVCaptionTimeCodeFrameDurationKey"), CFSTR("AVCaptionUseDropFrameTimeCodeKey"), 0);
}

+ (id)_outputSettingsWithOutputSettingsDictionary:(id)a3 mediaType:(id)a4 exceptionReason:(id *)a5
{
  return -[AVCaptionOutputSettings initWithCaptionSettingsDictionary:exceptionReason:]([AVCaptionOutputSettings alloc], "initWithCaptionSettingsDictionary:exceptionReason:", a3, a5);
}

+ (BOOL)supportsEmptyOutputSettingsDictionary
{
  return 1;
}

- (AVCaptionOutputSettings)initWithCaptionSettingsDictionary:(id)a3 exceptionReason:(id *)a4
{
  AVCaptionOutputSettings *v5;
  AVCaptionOutputSettings *v6;
  uint64_t v7;
  const __CFDictionary *v8;
  int v9;
  const __CFString *v10;
  uint64_t v11;
  CMTime v13;
  int v14;
  objc_super v15;
  __CFString *v16;

  v16 = 0;
  v15.receiver = self;
  v15.super_class = (Class)AVCaptionOutputSettings;
  v5 = -[AVOutputSettings initWithOutputSettingsDictionary:exceptionReason:](&v15, sel_initWithOutputSettingsDictionary_exceptionReason_, a3, &v16);
  if (!v5)
    goto LABEL_19;
  v6 = v5;
  v7 = -[NSDictionary valueForKey:](-[AVOutputSettings outputSettingsDictionary](v5, "outputSettingsDictionary"), "valueForKey:", CFSTR("AVCaptionTimeCodeFrameDurationKey"));
  if (!v7)
    goto LABEL_8;
  v8 = (const __CFDictionary *)v7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v9 = 0;
      v10 = CFSTR("The value of AVCaptionTimeCodeFrameDurationKey is neither NSValue nor NSDictionary.");
      goto LABEL_11;
    }
    CMTimeMakeFromDictionary(&v13, v8);
    if ((v13.flags & 0x1D) != 1)
    {
      v9 = 0;
      v10 = CFSTR("NSDictionary for AVCaptionTimeCodeFrameDurationKey is not convertible to a numeric CMTime.");
      goto LABEL_11;
    }
LABEL_8:
    v9 = 1;
    goto LABEL_12;
  }
  -[__CFDictionary CMTimeValue](v8, "CMTimeValue");
  if ((v14 & 0x1D) == 1)
    goto LABEL_8;
  v9 = 0;
  v10 = CFSTR("NSValue for AVCaptionTimeCodeFrameDurationKey is not convertible to a numeric CMTime.");
LABEL_11:
  v16 = (__CFString *)v10;
LABEL_12:
  v11 = -[NSDictionary valueForKey:](-[AVOutputSettings outputSettingsDictionary](v6, "outputSettingsDictionary"), "valueForKey:", CFSTR("AVCaptionUseDropFrameTimeCodeKey"));
  if (v9 && v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v16 = CFSTR("The value of AVCaptionUseDropFrameTimeCodeKey is not NSNumber.");
  }
  else if ((v9 & 1) != 0)
  {
    return v6;
  }

LABEL_19:
  v6 = 0;
  if (a4)
    *a4 = v16;
  return v6;
}

- (id)compatibleMediaTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", AVMediaTypesForCaptionEditing());
}

- (BOOL)willYieldCompressedSamples
{
  return 0;
}

- (BOOL)canFullySpecifyOutputFormatReturningReason:(id *)a3
{
  return 1;
}

- (BOOL)validateUsingOutputSettingsValidator:(id)a3 reason:(id *)a4
{
  return 1;
}

- (BOOL)encoderIsAvailableOnCurrentSystemReturningError:(id *)a3
{
  return 1;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)captionTimeCodeFrameDuration
{
  id v4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  CMTime v6;

  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  v4 = -[NSDictionary valueForKey:](-[AVOutputSettings outputSettingsDictionary](self, "outputSettingsDictionary"), "valueForKey:", CFSTR("AVCaptionTimeCodeFrameDurationKey"));
  objc_opt_class();
  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)objc_opt_isKindOfClass();
  if ((result & 1) != 0)
  {
    if (v4)
      result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)objc_msgSend(v4, "CMTimeValue");
    else
      memset(&v6, 0, sizeof(v6));
  }
  else
  {
    objc_opt_class();
    result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)objc_opt_isKindOfClass();
    if ((result & 1) == 0)
      return result;
    result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMakeFromDictionary(&v6, (CFDictionaryRef)v4);
  }
  *(CMTime *)retstr = v6;
  return result;
}

- (BOOL)useDropFrameTimeCode
{
  id v2;

  v2 = -[NSDictionary valueForKey:](-[AVOutputSettings outputSettingsDictionary](self, "outputSettingsDictionary"), "valueForKey:", CFSTR("AVCaptionUseDropFrameTimeCodeKey"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend(v2, "BOOLValue");
  else
    return 0;
}

@end
