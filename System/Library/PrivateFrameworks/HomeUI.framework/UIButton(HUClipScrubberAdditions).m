@implementation UIButton(HUClipScrubberAdditions)

+ (id)hu_clipScrubberLiveButtonWithMaximimumLineHeight:()HUClipScrubberAdditions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  double v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "systemOrangeColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v3);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTintColor:", v4);

  objc_msgSend(v2, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAdjustsFontSizeToFitWidth:", 1);

  _HULocalizedStringWithDefaultValue(CFSTR("HUCameraLive"), CFSTR("HUCameraLive"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0CEA230]);
  LODWORD(v8) = 1.0;
  objc_msgSend(v7, "setHyphenationFactor:", v8);
  objc_msgSend(v7, "setMaximumLineHeight:", 18.0);
  v9 = objc_alloc(MEMORY[0x1E0CB3778]);
  v10 = *MEMORY[0x1E0CEA098];
  v19[0] = *MEMORY[0x1E0CEA0D0];
  v19[1] = v10;
  v20[0] = v7;
  objc_msgSend(MEMORY[0x1E0CEA5E8], "boldSystemFontOfSize:", 16.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v9, "initWithString:attributes:", v6, v12);

  objc_msgSend(v13, "size");
  if (v14 > 54.0)
  {
    objc_msgSend(MEMORY[0x1E0CEA5E8], "boldSystemFontOfSize:", 12.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "string");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addAttribute:value:range:", v10, v15, 0, objc_msgSend(v16, "length"));

    objc_msgSend(v7, "setMaximumLineHeight:", a1);
  }
  objc_msgSend(v2, "setAttributedTitle:forState:", v13, 0);
  objc_msgSend(v2, "titleLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setNumberOfLines:", 3);

  return v2;
}

+ (uint64_t)hu_clipScrubberLiveButton
{
  return objc_msgSend(MEMORY[0x1E0CEA3A0], "hu_clipScrubberLiveButtonWithMaximimumLineHeight:", 12.0);
}

+ (id)hu_clipScrubberNearbyAccessoryButton
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("square.grid.2x2.fill"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setImage:forState:", v1, 0);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setTintColor:", v2);

  return v0;
}

+ (uint64_t)hu_talkStateForButton:()HUClipScrubberAdditions usingStandardSymbolConfiguration:
{
  return objc_msgSend(a1, "hu_microphoneButton:forTalkingState:usingStandardSymbolConfiguration:", a3, 0, a4);
}

+ (uint64_t)hu_doneStateForButton:()HUClipScrubberAdditions usingStandardSymbolConfiguration:
{
  return objc_msgSend(a1, "hu_microphoneButton:forTalkingState:usingStandardSymbolConfiguration:", a3, 1, a4);
}

+ (void)hu_microphoneButton:()HUClipScrubberAdditions forTalkingState:usingStandardSymbolConfiguration:
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  double v12;
  __CFString *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0CEA478], "systemYellowColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v8);

  objc_msgSend(MEMORY[0x1E0CEA638], "hu_microphoneGlyphForTalkingState:usingStandardSymbolConfiguration:", a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v7, "setImage:forState:", v9, 0);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTintColor:", v10);

  objc_msgSend(v7, "setContentEdgeInsets:", 0.0, 18.0, 0.0, 18.0);
  v11 = objc_msgSend(MEMORY[0x1E0CEABB0], "userInterfaceLayoutDirectionForSemanticContentAttribute:", objc_msgSend(v7, "semanticContentAttribute"));
  v12 = -9.0;
  if (v11)
    v12 = 9.0;
  objc_msgSend(v7, "setImageEdgeInsets:", 0.0, v12, 0.0, 0.0);
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v7, "_setContinuousCornerRadius:", 16.0);
  if ((_DWORD)a4)
  {
    if (v11)
      v13 = CFSTR("HUCameraMicrophoneDoneRTLText");
    else
      v13 = CFSTR("HUCameraMicrophoneDoneLTRText");
  }
  else
  {
    v13 = CFSTR("HUCameraMicrophoneTalkText");
  }
  _HULocalizedStringWithDefaultValue(v13, v13, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc(MEMORY[0x1E0CB3778]);
  v19 = *MEMORY[0x1E0CEA098];
  objc_msgSend(MEMORY[0x1E0CEA5E8], "boldSystemFontOfSize:", 16.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v15, "initWithString:attributes:", v14, v17);

  objc_msgSend(v7, "setAttributedTitle:forState:", v18, 0);
}

@end
