@implementation MediaControlsTheme

+ (UIImage)playImage
{
  return (UIImage *)objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("play.fill"));
}

+ (UIImage)pauseImage
{
  return (UIImage *)objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("pause.fill"));
}

+ (UIImage)stopImage
{
  return (UIImage *)objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("stop.fill"));
}

+ (UIImage)forwardImage
{
  return (UIImage *)objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("forward.fill"));
}

+ (UIImage)backwardImage
{
  return (UIImage *)objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("backward.fill"));
}

+ (id)goBackwardImageForTimeInterval:(double)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("gobackward.%i"), llround(fabs(a3)));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("gobackward.minus"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

+ (id)goForwardImageForTimeInterval:(double)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("goforward.%i"), llround(fabs(a3)));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("goforward.plus"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

+ (UIImage)captionsImage
{
  return (UIImage *)objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("captions.bubble"));
}

+ (UIImage)starImage
{
  return (UIImage *)objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("star"));
}

+ (UIImage)starFillImage
{
  return (UIImage *)objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("star.fill"));
}

+ (UIImage)hamburgerImage
{
  return (UIImage *)objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("line.horizontal.3"));
}

+ (UIImage)volumeMinImage
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:", 4, 16.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("volume.1.fill"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageByApplyingSymbolConfiguration:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v4;
}

+ (UIImage)volumeMaxImage
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:", 4, 16.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("volume.3.fill"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageByApplyingSymbolConfiguration:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v4;
}

+ (UIImage)airplayVideoImage
{
  return (UIImage *)objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("airplayvideo"));
}

+ (UIImage)appleTVRemote
{
  return (UIImage *)objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", CFSTR("appletvremote"));
}

@end
