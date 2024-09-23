@implementation HUCameraRecordingLearnMoreViewController

- (HUCameraRecordingLearnMoreViewController)init
{
  void *v3;
  void *v4;
  HUCameraRecordingLearnMoreViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  _HULocalizedStringWithDefaultValue(CFSTR("HUCameraAndRecordingLearnMoreTitle"), CFSTR("HUCameraAndRecordingLearnMoreTitle"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUCameraAndRecordingLearnMoreBody"), CFSTR("HUCameraAndRecordingLearnMoreBody"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)HUCameraRecordingLearnMoreViewController;
  v5 = -[OBTextWelcomeController initWithTitle:detailText:symbolName:contentLayout:](&v10, sel_initWithTitle_detailText_symbolName_contentLayout_, v3, v4, 0, 2);

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _HULocalizedStringWithDefaultValue(CFSTR("HUDoneTitle"), CFSTR("HUDoneTitle"), 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitle:forState:", v7, 0);

    objc_msgSend(v6, "setAccessibilityIdentifier:", CFSTR("Home.OnboardingView.CameraRecording.LearnMore.DoneButton"));
    objc_msgSend(v6, "addTarget:action:forControlEvents:", v5, sel_dismiss, 64);
    -[HUCameraRecordingLearnMoreViewController buttonTray](v5, "buttonTray");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addButton:", v6);

  }
  return v5;
}

- (void)dismiss
{
  id v2;

  -[HUCameraRecordingLearnMoreViewController presentingViewController](self, "presentingViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

@end
