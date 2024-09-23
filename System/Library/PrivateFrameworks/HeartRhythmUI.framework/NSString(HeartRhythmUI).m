@implementation NSString(HeartRhythmUI)

+ (id)hrui_explanationVideoPath
{
  void *v0;
  void *v1;

  HRHeartRhythmUIFrameworkBundle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "pathForResource:ofType:", CFSTR("Explanation_Loop_h264"), CFSTR("mov"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)hrui_sinusRhythmVideoPath
{
  void *v0;
  void *v1;

  HRHeartRhythmUIFrameworkBundle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "pathForResource:ofType:", CFSTR("Sinus_Rhythm_Result_Loop_h264"), CFSTR("mov"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)hrui_atrialFibrillationVideoPath
{
  void *v0;
  void *v1;

  HRHeartRhythmUIFrameworkBundle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "pathForResource:ofType:", CFSTR("Atrial_Fibrillation_Result_Loop_h264"), CFSTR("mov"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)hrui_highOrLowHeartRateVideoPath
{
  void *v0;
  void *v1;

  HRHeartRhythmUIFrameworkBundle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "pathForResource:ofType:", CFSTR("High_Low_Heart_Rate_Result_Loop_h264"), CFSTR("mov"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)hrui_inconclusiveVideoPath
{
  void *v0;
  void *v1;

  HRHeartRhythmUIFrameworkBundle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "pathForResource:ofType:", CFSTR("Inconclusive_Result_Loop_h264"), CFSTR("mov"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

@end
