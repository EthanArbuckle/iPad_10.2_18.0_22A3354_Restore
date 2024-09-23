@implementation UIImage(HUAdditions)

+ (id)hu_cameraErrorImage
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:", CFSTR("video.slash.fill"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithTextStyle:", *MEMORY[0x1E0CEB580]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageWithConfiguration:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)hu_waveformImage
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("waveform"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "hu_navigationBarGlyphSize");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithConfiguration:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (uint64_t)hu_navigationBarGlyphSize
{
  return objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:", 17.0);
}

+ (uint64_t)hu_standardSymbolConfiguration
{
  return objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithWeight:", 4);
}

+ (uint64_t)hu_largeSymbolConfiguration
{
  return objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:", 18.0);
}

+ (uint64_t)hu_semiboldSymbolConfiguration
{
  return objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithWeight:", 6);
}

+ (id)hu_navigationBarGlyphHouse
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("house"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "hu_navigationBarGlyphSize");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithConfiguration:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)hu_navigationBarGlyphPlus
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:", CFSTR("plus"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithTextStyle:scale:", *MEMORY[0x1E0CEB538], -1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageWithConfiguration:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (uint64_t)hu_navigationBarGlyphList
{
  return objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("list.bullet"));
}

+ (id)hu_largeQRBadgeTemplateImage
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:", CFSTR("QRBadgeLg"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageWithRenderingMode:", 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)hu_smallQRBadgeTemplateImage
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:", CFSTR("QRBadgeSm"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageWithRenderingMode:", 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)hu_cellCheckmarkImage
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  if (objc_msgSend(MEMORY[0x1E0D319D0], "useMacIdiom"))
    v0 = 1;
  else
    v0 = 2;
  objc_msgSend(MEMORY[0x1E0D33718], "staticPreferredFontForTextStyle:traits:", *MEMORY[0x1E0CEB538], v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithFont:scale:", v1, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:", CFSTR("checkmark"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageWithConfiguration:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)hu_exclamationMarkImage
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithTextStyle:", *MEMORY[0x1E0CEB568]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", CFSTR("exclamationmark.circle.fill"), v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)hu_closeButtonImage
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:", CFSTR("xmark.circle.fill"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithTextStyle:scale:", *MEMORY[0x1E0CEB5B0], 3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageWithConfiguration:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)hu_recordingButtonWaveformImage
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:", CFSTR("waveform"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:weight:", 7, 32.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageWithConfiguration:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithTintColor:renderingMode:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)hu_recordingButtonStopImage
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:", CFSTR("stop.fill"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithTextStyle:scale:", *MEMORY[0x1E0CEB538], -1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageWithConfiguration:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithTintColor:renderingMode:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)hu_recordingButtonSendImage
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:", CFSTR("arrow.up"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithTextStyle:scale:", *MEMORY[0x1E0CEB538], -1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageWithConfiguration:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithTintColor:renderingMode:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)hu_recordingButtonMicOnImage
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CEA638], "hu_standardSymbolConfiguration");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:", CFSTR("mic.slash.fill"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "imageWithConfiguration:", v0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithTintColor:renderingMode:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)hu_recordingButtonMicOffImage
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CEA638], "hu_standardSymbolConfiguration");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:", CFSTR("mic.fill"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "imageWithConfiguration:", v0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithTintColor:renderingMode:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)hu_connectedCheckmarkImage
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (objc_msgSend(MEMORY[0x1E0D319D0], "useMacIdiom"))
    v0 = 1;
  else
    v0 = 2;
  objc_msgSend(MEMORY[0x1E0D33718], "staticPreferredFontForTextStyle:traits:", *MEMORY[0x1E0CEB580], v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithFont:scale:", v1, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:", CFSTR("checkmark"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageWithConfiguration:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA478], "systemGreenColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageWithTintColor:renderingMode:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)hu_fastForwardButtonImage
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:", CFSTR("forward.fill"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:weight:", 6, 20.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageWithConfiguration:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithTintColor:renderingMode:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)hu_airPlaySpeakerImage
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:weight:", 4, 90.0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("hifispeaker.fill"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "imageWithConfiguration:", v0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithTintColor:renderingMode:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)hu_smallAirPlayAudioImage
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:", CFSTR("airplayaudio"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:weight:", 7, 18.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageWithConfiguration:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithTintColor:renderingMode:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)hu_playButton
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:", CFSTR("play.circle.fill"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithTextStyle:scale:", *MEMORY[0x1E0CEB5C0], 3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageWithConfiguration:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)hu_pauseButton
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:", CFSTR("pause.circle.fill"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithTextStyle:scale:", *MEMORY[0x1E0CEB5C0], 3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageWithConfiguration:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)hu_stopButtonImage
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v0 = objc_alloc(MEMORY[0x1E0CEA638]);
  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "systemLightGrayColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v0, "_initWithFilledSystemImageNamed:fillColor:symbolColor:", CFSTR("stop.circle.fill"), v1, v2);
  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithTextStyle:scale:", *MEMORY[0x1E0CEB580], 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageWithConfiguration:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)hu_playButtonImageForAnnouncementPlaybackButton
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v0 = objc_alloc(MEMORY[0x1E0CEA638]);
  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "systemLightGrayColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v0, "_initWithFilledSystemImageNamed:fillColor:symbolColor:", CFSTR("play.circle.fill"), v1, v2);
  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithTextStyle:scale:", *MEMORY[0x1E0CEB580], 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageWithConfiguration:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)hu_recordingDeleteButton
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:", CFSTR("xmark.circle.fill"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithTextStyle:scale:", *MEMORY[0x1E0CEB5B8], 3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageWithConfiguration:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)hu_microphoneGlyphForTalkingState:()HUAdditions usingStandardSymbolConfiguration:
{
  void *v5;
  void *v6;
  void *v7;

  if ((a4 & 1) != 0)
    objc_msgSend(MEMORY[0x1E0CEA638], "hu_standardSymbolConfiguration");
  else
    objc_msgSend(MEMORY[0x1E0CEA638], "hu_largeSymbolConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((a3 & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:", CFSTR("mic.fill"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageWithConfiguration:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

+ (id)hu_settingsImageUsingStandardSymbolConfiguration:()HUAdditions
{
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:", CFSTR("gear"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((a3 & 1) != 0)
    objc_msgSend(a1, "hu_standardSymbolConfiguration");
  else
    objc_msgSend(a1, "hu_largeSymbolConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageWithConfiguration:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)hu_gearImageWithBadgeCount:()HUAdditions
{
  __CFString *v3;

  if (a3)
    v3 = CFSTR("gear-with-badge");
  else
    v3 = CFSTR("gear");
  HUImageNamed(v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)hu_gearSymbolImageWithBadgeCount:()HUAdditions
{
  void *v3;
  void *v4;
  uint64_t v5;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("gear.badge"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(MEMORY[0x1E0D319D0], "isAMac") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CEA650], "configurationPreferringMulticolor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "imageByApplyingSymbolConfiguration:", v4);
      v5 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v5;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("gear"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

+ (id)hu_avatarImageWithSymbolNamed:()HUAdditions textStyle:scale:diameter:
{
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CGContext *CurrentContext;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGContext *v27;
  void *v28;
  CGSize v30;

  v9 = (void *)MEMORY[0x1E0CEA478];
  v10 = a5;
  v11 = a4;
  objc_msgSend(v9, "grayColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithTextStyle:scale:", v10, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "imageWithSymbolConfiguration:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "imageWithTintColor:renderingMode:", v12, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v30.width = a1;
  v30.height = a1;
  UIGraphicsBeginImageContextWithOptions(v30, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetBlendMode(CurrentContext, kCGBlendModeCopy);
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, a1, a1, a1 * 0.5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "set");

  objc_msgSend(v18, "setLineWidth:", 1.0);
  objc_msgSend(v18, "addClip");
  objc_msgSend(v18, "fill");
  objc_msgSend(v16, "size");
  v21 = v20;
  objc_msgSend(v16, "size");
  v23 = v21 + v22 * 0.5;
  objc_msgSend(v16, "size");
  v25 = v24;
  objc_msgSend(v16, "size");
  objc_msgSend(v16, "drawInRect:blendMode:alpha:", 0, (a1 - v23) * 0.5, (a1 - (v25 + v26 * 0.5)) * 0.5, v23, v25 + v26 * 0.5, 1.0);
  v27 = UIGraphicsGetCurrentContext();
  CGContextSetBlendMode(v27, kCGBlendModeCopy);
  objc_msgSend(v18, "stroke");
  UIGraphicsGetImageFromCurrentImageContext();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v28;
}

+ (id)hu_circleImageWithDiameter:()HUAdditions
{
  CGContext *CurrentContext;
  void *v4;
  void *v5;
  CGContext *v6;
  void *v7;

  UIGraphicsBeginImageContextWithOptions(*(CGSize *)&a1, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetBlendMode(CurrentContext, kCGBlendModeCopy);
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, a1, a1, a1 * 0.5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "set");

  objc_msgSend(v4, "setLineWidth:", 1.0);
  objc_msgSend(v4, "addClip");
  objc_msgSend(v4, "fill");
  v6 = UIGraphicsGetCurrentContext();
  CGContextSetBlendMode(v6, kCGBlendModeCopy);
  objc_msgSend(v4, "stroke");
  UIGraphicsGetImageFromCurrentImageContext();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v7;
}

+ (id)hu_mutedMicrophoneImageWithTintColor:()HUAdditions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CEA638];
  v4 = a3;
  objc_msgSend(v3, "_systemImageNamed:", CFSTR("mic.slash.circle.fill"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithTextStyle:scale:", *MEMORY[0x1E0CEB558], 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageWithConfiguration:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "imageWithTintColor:renderingMode:", v4, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)hu_mutedMicrophoneImageInCircleWithTintColor:()HUAdditions backgroundColor:
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGContext *CurrentContext;
  void *v15;
  CGContext *v16;
  void *v17;
  CGSize v19;

  v5 = (void *)MEMORY[0x1E0CEA638];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "_systemImageNamed:", CFSTR("mic.slash.circle.fill"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageWithTintColor:renderingMode:", v7, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "size");
  v11 = v10;
  objc_msgSend(v9, "size");
  v13 = v12;
  v19.width = v11 + 2.0;
  v19.height = v11 + 2.0;
  UIGraphicsBeginImageContextWithOptions(v19, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetBlendMode(CurrentContext, kCGBlendModeCopy);
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v11 + 2.0, v11 + 2.0, (v11 + 2.0) * 0.5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "set");

  objc_msgSend(v15, "setLineWidth:", 1.0);
  objc_msgSend(v15, "addClip");
  objc_msgSend(v15, "fill");
  objc_msgSend(v9, "drawInRect:blendMode:alpha:", 0, (v11 + 2.0 - v11) * 0.5, (v11 + 2.0 - v13) * 0.5, v11, v13, 1.0);
  v16 = UIGraphicsGetCurrentContext();
  CGContextSetBlendMode(v16, kCGBlendModeCopy);
  objc_msgSend(v15, "stroke");
  UIGraphicsGetImageFromCurrentImageContext();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v17;
}

+ (id)hu_walletAppIconImage
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithTextStyle:scale:", *MEMORY[0x1E0CEB558], 3);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:", CFSTR("wallet.fill"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "imageWithConfiguration:", v0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithRenderingMode:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (__CFString)hu_symbolNameForDescriptionBadgeType:()HUAdditions
{
  if ((unint64_t)(a3 - 1) > 4)
    return 0;
  else
    return off_1E6F4DA78[a3 - 1];
}

+ (id)hu_imageForDescriptionBadgeType:()HUAdditions tintColor:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CEA638], "hu_symbolNameForDescriptionBadgeType:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithTextStyle:scale:", *MEMORY[0x1E0CEB558], -1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageWithConfiguration:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "imageWithTintColor:renderingMode:", v5, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
