@implementation HMCameraSnapshot(HFAdditions)

+ (id)hf_localizedAgeForCaptureDate:()HFAdditions
{
  double v3;
  void *v4;
  double v5;

  objc_msgSend(a3, "timeIntervalSinceNow");
  if (v3 <= -1.0)
  {
    v5 = -v3;
    if (qword_1ED379D20 != -1)
      dispatch_once(&qword_1ED379D20, &__block_literal_global_212);
    objc_msgSend((id)_MergedGlobals_314, "stringFromTimeInterval:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _HFLocalizedStringWithDefaultValue(CFSTR("HFCameraSnapshotAgeNow"), CFSTR("HFCameraSnapshotAgeNow"), 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)hf_localizedAge
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_opt_class();
  objc_msgSend(a1, "captureDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_localizedAgeForCaptureDate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
