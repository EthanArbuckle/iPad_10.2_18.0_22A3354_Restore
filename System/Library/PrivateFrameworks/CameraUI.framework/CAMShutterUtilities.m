@implementation CAMShutterUtilities

+ (BOOL)isStopMode:(int64_t)a3
{
  return (unint64_t)(a3 - 5) < 5;
}

+ (BOOL)shouldUseImageViewForMode:(int64_t)a3
{
  return a3 == 7 || a3 == 2;
}

+ (BOOL)shouldUseTimelapseOuterViewForMode:(int64_t)a3
{
  return a3 == 8 || a3 == 3;
}

+ (id)spinnerViewForLayoutStyle:(int64_t)a3
{
  const __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (a3 == 4)
    v3 = CFSTR("CAMShutterButtonSpinner-d22");
  else
    v3 = CFSTR("CAMShutterButtonSpinner");
  v4 = (void *)MEMORY[0x1E0DC3870];
  CAMCameraUIFrameworkBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageNamed:inBundle:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v6);
  return v7;
}

+ (id)spinnerAnimation
{
  void *v2;
  void *v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform.rotation.z"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFromValue:", &unk_1EA3B0FA0);
  objc_msgSend(v2, "setToValue:", &unk_1EA3B1AC0);
  objc_msgSend(v2, "setDuration:", 0.666);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3058]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTimingFunction:", v3);

  LODWORD(v4) = 2139095040;
  objc_msgSend(v2, "setRepeatCount:", v4);
  return v2;
}

@end
