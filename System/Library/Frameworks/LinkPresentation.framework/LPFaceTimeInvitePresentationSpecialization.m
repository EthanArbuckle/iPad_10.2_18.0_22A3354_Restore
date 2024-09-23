@implementation LPFaceTimeInvitePresentationSpecialization

+ (id)captionButtonProperties
{
  LPCaptionButtonPresentationProperties *v2;
  void *v3;
  LPCaptionButtonCollapsedPresentationProperties *v4;
  void *v5;

  v2 = objc_alloc_init(LPCaptionButtonPresentationProperties);
  LPLocalizedString(CFSTR("Join"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPCaptionButtonPresentationProperties setText:](v2, "setText:", v3);

  -[LPCaptionButtonPresentationProperties setType:](v2, "setType:", 1);
  v4 = objc_alloc_init(LPCaptionButtonCollapsedPresentationProperties);
  objc_msgSend((id)objc_opt_class(), "collapsedButtonIcon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPCaptionButtonCollapsedPresentationProperties setIcon:](v4, "setIcon:", v5);

  -[LPCaptionButtonCollapsedPresentationProperties setLayoutRatioThreshold:](v4, "setLayoutRatioThreshold:", 0.349999994);
  -[LPCaptionButtonPresentationProperties setCollapsedButton:](v2, "setCollapsedButton:", v4);

  return v2;
}

+ (id)collapsedButtonIcon
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v2 = (id)*MEMORY[0x1E0DC4AE8];
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", v2, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configurationWithPaletteColors:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configurationByApplyingConfiguration:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[LPImage _systemImageNamed:withSymbolConfiguration:](LPImage, "_systemImageNamed:withSymbolConfiguration:", CFSTR("video.circle.fill"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
