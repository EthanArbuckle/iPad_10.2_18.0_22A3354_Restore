@implementation MediaCaptureActivity

- (id)activityTitleWithTabDocument:(id)a3
{
  __CFString *v3;

  if (objc_msgSend(a3, "mediaStateIcon"))
  {
    SFTitleForTogglingMediaStateIcon();
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_1E9CFDBB0;
  }
  return v3;
}

- (BOOL)canPerformWithTabDocument:(id)a3
{
  return objc_msgSend(a3, "mediaStateIcon") != 0;
}

- (id)activityImageWithTabDocument:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "mediaStateIcon");
  SFSystemImageNameForTogglingMediaStateIcon();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "size");
      SFTintImage();
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_wantsOriginalImageColor
{
  return 1;
}

- (id)_activityStatusTintColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
}

- (id)activityType
{
  return (id)*MEMORY[0x1E0CD5828];
}

- (void)performActivityWithTabDocument:(id)a3
{
  objc_msgSend(a3, "toggleMediaStateMuted");
  -[_SFActivity activityDidFinish:](self, "activityDidFinish:", 1);
}

@end
