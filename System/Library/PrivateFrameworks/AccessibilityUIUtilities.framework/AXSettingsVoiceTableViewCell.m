@implementation AXSettingsVoiceTableViewCell

- (AXSettingsVoiceTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  AXSettingsVoiceTableViewCell *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  SUUIItemOfferButton *downloadButton;
  void *v13;
  void *v14;
  uint64_t v15;
  SUUIItemOfferButton *sampleButton;
  void *v17;
  void *v18;
  uint64_t v19;
  UIButton *perVoiceSettingsButton;
  UIButton *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  UILabel *infoLabel;
  void *v27;
  void *v28;
  void *v29;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)AXSettingsVoiceTableViewCell;
  v5 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v31, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, a5);
  if (v5)
  {
    v6 = objc_alloc((Class)getSUUIItemOfferButtonClass());
    v7 = *MEMORY[0x1E0C9D648];
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v11 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], v8, v9, v10);
    downloadButton = v5->_downloadButton;
    v5->_downloadButton = (SUUIItemOfferButton *)v11;

    -[SUUIItemOfferButton setDelegate:](v5->_downloadButton, "setDelegate:", v5);
    -[SUUIItemOfferButton setHidden:](v5->_downloadButton, "setHidden:", 1);
    -[SUUIItemOfferButton addTarget:action:forControlEvents:](v5->_downloadButton, "addTarget:action:forControlEvents:", v5, sel__axDownload, 64);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIItemOfferButton setBackgroundColor:](v5->_downloadButton, "setBackgroundColor:", v13);

    -[AXSettingsVoiceTableViewCell contentView](v5, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", v5->_downloadButton);

    v15 = objc_msgSend(objc_alloc((Class)getSUUIItemOfferButtonClass()), "initWithFrame:", v7, v8, v9, v10);
    sampleButton = v5->_sampleButton;
    v5->_sampleButton = (SUUIItemOfferButton *)v15;

    -[SUUIItemOfferButton setDelegate:](v5->_sampleButton, "setDelegate:", v5);
    -[SUUIItemOfferButton addTarget:action:forControlEvents:](v5->_sampleButton, "addTarget:action:forControlEvents:", v5, sel__axPlaySample, 64);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIItemOfferButton setBackgroundColor:](v5->_sampleButton, "setBackgroundColor:", v17);

    -[AXSettingsVoiceTableViewCell contentView](v5, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSubview:", v5->_sampleButton);

    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 3);
    v19 = objc_claimAutoreleasedReturnValue();
    perVoiceSettingsButton = v5->_perVoiceSettingsButton;
    v5->_perVoiceSettingsButton = (UIButton *)v19;

    v21 = v5->_perVoiceSettingsButton;
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("info.circle"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setImage:forState:](v21, "setImage:forState:", v22, 0);

    -[UIButton addTarget:action:forControlEvents:](v5->_perVoiceSettingsButton, "addTarget:action:forControlEvents:", v5, sel__axPerVoiceSettings, 64);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setBackgroundColor:](v5->_perVoiceSettingsButton, "setBackgroundColor:", v23);

    -[UIButton setHidden:](v5->_perVoiceSettingsButton, "setHidden:", 1);
    -[AXSettingsVoiceTableViewCell contentView](v5, "contentView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addSubview:", v5->_perVoiceSettingsButton);

    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v7, v8, v9, v10);
    infoLabel = v5->_infoLabel;
    v5->_infoLabel = (UILabel *)v25;

    objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A98]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5->_infoLabel, "setFont:", v27);

    -[AXSettingsVoiceTableViewCell contentView](v5, "contentView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addSubview:", v5->_infoLabel);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v5->_infoLabel, "setBackgroundColor:", v29);

    -[UILabel setHidden:](v5->_infoLabel, "setHidden:", 1);
  }
  return v5;
}

- (id)infoLabel
{
  return self->_infoLabel;
}

- (id)resources
{
  void *v2;
  void *v3;

  -[PSTableCell specifier](self, "specifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "propertyForKey:", CFSTR("Resources"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)updateInformation
{
  AXPerformBlockAsynchronouslyOnMainThread();
}

uint64_t __49__AXSettingsVoiceTableViewCell_updateInformation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutSubviews");
}

- (void)_updateInfoLabelText
{
  AXSettingsVoiceTableViewCell *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  __CFString *v28;
  char v29;
  char v30;
  char v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  int v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  const __CFString *v67;
  const __CFString *v68;
  id *p_isa;
  void *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  uint64_t v76;

  v2 = self;
  v76 = *MEMORY[0x1E0C80C00];
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_infoLabel, "setAdjustsFontSizeToFitWidth:", 1);
  if (!-[AXSettingsVoiceTableViewCell showsInfoLabel](v2, "showsInfoLabel")
    && !-[AXSettingsVoiceTableViewCell showsUsageInfo](v2, "showsUsageInfo"))
  {
    -[UILabel setHidden:](v2->_infoLabel, "setHidden:", 1);
    -[UILabel setText:](v2->_infoLabel, "setText:", 0);
    return;
  }
  -[AXSettingsVoiceTableViewCell resources](v2, "resources");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 == 1)
  {
    -[AXSettingsVoiceTableViewCell resources](v2, "resources");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "speechVoice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "canBeDownloaded");

    if (v8)
    {
      -[AXSettingsVoiceTableViewCell resources](v2, "resources");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isInstalled");

      if (v11)
      {
        if (-[AXSettingsVoiceTableViewCell showsUsageInfo](v2, "showsUsageInfo"))
        {
          -[AXSettingsVoiceTableViewCell resources](v2, "resources");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "firstObject");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = AXResourceActivelyUsed();

          if (v14)
          {
            -[AXSettingsVoiceTableViewCell resources](v2, "resources");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "firstObject");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            AXClientsForSiriResource();
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            v73 = 0u;
            v74 = 0u;
            v71 = 0u;
            v72 = 0u;
            v18 = v17;
            v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v71, v75, 16);
            p_isa = (id *)&v2->super.super.super.super.super.isa;
            if (v19)
            {
              v20 = v19;
              v21 = 0;
              v22 = *(_QWORD *)v72;
              do
              {
                for (i = 0; i != v20; ++i)
                {
                  v24 = v21;
                  if (*(_QWORD *)v72 != v22)
                    objc_enumerationMutation(v18);
                  v25 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
                  AXAppNameForBundleId(v25);
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!v26)
                  {
                    v27 = objc_msgSend(v25, "isEqualToString:", CFSTR("com.apple.AssistantServices"));
                    v28 = CFSTR("SIRI_CLIENT");
                    if ((v27 & 1) != 0
                      || (v29 = objc_msgSend(v25, "isEqualToString:", CFSTR("com.apple.MapsSupport")),
                          v28 = CFSTR("MAPS_CLIENT"),
                          (v29 & 1) != 0)
                      || (v30 = objc_msgSend(v25, "isEqualToString:", CFSTR("com.apple.translationd")),
                          v28 = CFSTR("TRANSLATE_CLIENT"),
                          (v30 & 1) != 0)
                      || (v31 = objc_msgSend(v25, "isEqualToString:", CFSTR("com.apple.accessibility.AccessibilityUIServer")), v28 = CFSTR("UNKNOWN_CLIENT"), (v31 & 1) == 0))
                    {
                      AXUILocalizedStringForKey(v28);
                      v26 = (void *)objc_claimAutoreleasedReturnValue();
                    }
                    else
                    {
                      v26 = 0;
                    }
                  }
                  __AXStringForVariables();
                  v21 = (void *)objc_claimAutoreleasedReturnValue();

                }
                v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v71, v75, 16, v26, CFSTR("__AXStringForVariablesSentinel"));
              }
              while (v20);
            }
            else
            {
              v21 = 0;
            }

            objc_msgSend(MEMORY[0x1E0CF4E98], "sharedInstance");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "selectedSpeechVoiceIdentifiersForSourceKey:", *MEMORY[0x1E0CF37F0]);
            v41 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CF4E98], "sharedInstance");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "selectedSpeechVoiceIdentifiersForSourceKey:", *MEMORY[0x1E0CF37D8]);
            v70 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CF4E98], "sharedInstance");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "selectedSpeechVoiceIdentifiersForSourceKey:", *MEMORY[0x1E0CF37E0]);
            v44 = (void *)objc_claimAutoreleasedReturnValue();

            v2 = (AXSettingsVoiceTableViewCell *)p_isa;
            objc_msgSend(p_isa, "resources");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "firstObject");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "voiceId");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = objc_msgSend(v41, "containsObject:", v47);

            if (v48)
            {
              AXUILocalizedStringForKey(CFSTR("VOICEOVER_CLIENT"));
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              v67 = CFSTR("__AXStringForVariablesSentinel");
              __AXStringForVariables();
              v49 = objc_claimAutoreleasedReturnValue();

              v21 = (void *)v49;
            }
            objc_msgSend(p_isa, "resources", v64, v67);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "firstObject");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "voiceId");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = objc_msgSend(v70, "containsObject:", v52);

            if (v53)
            {
              AXUILocalizedStringForKey(CFSTR("SPOKEN_CONTENT_CLIENT"));
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              v68 = CFSTR("__AXStringForVariablesSentinel");
              __AXStringForVariables();
              v54 = objc_claimAutoreleasedReturnValue();

              v21 = (void *)v54;
            }
            objc_msgSend(p_isa, "resources", v65, v68);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "firstObject");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "voiceId");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v58 = objc_msgSend(v44, "containsObject:", v57);

            if (v58)
            {
              AXUILocalizedStringForKey(CFSTR("SWITCH_CONTROL_CLIENT"));
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              __AXStringForVariables();
              v59 = objc_claimAutoreleasedReturnValue();

              v21 = (void *)v59;
            }
            v60 = (void *)MEMORY[0x1E0CB3940];
            AXUILocalizedStringForKey(CFSTR("VOICE_USAGE"));
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "stringWithFormat:", v61, v21);
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(p_isa[153], "setText:", v62);

            goto LABEL_36;
          }
        }
        -[AXSettingsVoiceTableViewCell resources](v2, "resources");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "firstObject");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "assetSize");

        if (v38)
        {
          -[AXSettingsVoiceTableViewCell resources](v2, "resources");
          v18 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "firstObject");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          AXLocalizedTileForResourceOnDiskSizeUsed(v21);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILabel setText:](v2->_infoLabel, "setText:", v39);

LABEL_36:
        }
      }
      else
      {
        v32 = (void *)MEMORY[0x1E0CB34E8];
        -[AXSettingsVoiceTableViewCell resources](v2, "resources");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "firstObject");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "stringFromByteCount:countStyle:", objc_msgSend(v34, "assetSize"), 0);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setText:](v2->_infoLabel, "setText:", v35);

      }
      -[UILabel setHidden:](v2->_infoLabel, "setHidden:", 0);
      -[UILabel sizeToFit](v2->_infoLabel, "sizeToFit");
    }
  }
  else
  {
    -[UILabel setHidden:](v2->_infoLabel, "setHidden:", 1);
    -[UILabel setText:](v2->_infoLabel, "setText:", 0);
  }
  -[PSTableCell titleLabel](v2, "titleLabel");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "sizeToFit");

}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AXSettingsVoiceTableViewCell;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v4, sel_refreshCellContentsWithSpecifier_, a3);
  -[AXSettingsVoiceTableViewCell layoutSubviews](self, "layoutSubviews");
}

- (id)accessibilityCustomActions
{
  void *v3;
  char v4;
  void *v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;

  -[AXSettingsVoiceTableViewCell resources](self, "resources");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") != 1
    || !-[SUUIItemOfferButton isEnabled](self->_sampleButton, "isEnabled"))
  {
    v5 = 0;
LABEL_6:

    return v5;
  }
  v4 = -[SUUIItemOfferButton isHidden](self->_sampleButton, "isHidden");

  if ((v4 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc(MEMORY[0x1E0DC33F0]);
    AXUILocalizedStringForKey(CFSTR("PLAY_VOICE_SAMPLE"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithName:target:selector:", v8, self, sel__axPlaySample);
    objc_msgSend(v5, "addObject:", v9);

    if (!-[AXSettingsVoiceTableViewCell showsPerVoiceSettingsButton](self, "showsPerVoiceSettingsButton"))
      return v5;
    -[AXSettingsVoiceTableViewCell resources](self, "resources");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isInstalled"))
    {
      -[AXSettingsVoiceTableViewCell resources](self, "resources");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "speechVoice");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "synthesisProviderVoice");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "hasPerVoiceSettings");

      if (!v15)
        return v5;
      v16 = objc_alloc(MEMORY[0x1E0DC33F0]);
      AXUILocalizedStringForKey(CFSTR("OPEN_PER_VOICE_SETTINGS"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v16, "initWithName:target:selector:", v3, self, sel__axPerVoiceSettings);
      objc_msgSend(v5, "addObject:", v10);
    }

    goto LABEL_6;
  }
  v5 = 0;
  return v5;
}

- (BOOL)_axPerVoiceSettings
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;

  -[AXSettingsVoiceTableViewCell infoDelegate](self, "infoDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[AXSettingsVoiceTableViewCell infoDelegate](self, "infoDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSettingsVoiceTableViewCell resources](self, "resources");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "openVoiceSettingsFor:", v7);

  }
  return 0;
}

- (BOOL)_axDownload
{
  uint64_t v3;
  NSObject *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!-[SUUIItemOfferButton isEnabled](self->_downloadButton, "isEnabled"))
    return 0;
  v3 = -[SUUIItemOfferButton progressType](self->_downloadButton, "progressType");
  if (v3 != 2)
  {
    if (!v3)
    {
      AXLogSpeechAssetDownload();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BD892000, v4, OS_LOG_TYPE_DEFAULT, "No status, start downloading", buf, 2u);
      }

      v5 = 1;
      -[SUUIItemOfferButton setProgress:animated:](self->_downloadButton, "setProgress:animated:", 1, 0.0);
      -[SUUIItemOfferButton setProgressType:animated:](self->_downloadButton, "setProgressType:animated:", 2, 1);
      -[AXSettingsVoiceTableViewCell infoDelegate](self, "infoDelegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXSettingsVoiceTableViewCell resources](self, "resources");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "startDownloadForResource:", v8);

      LODWORD(v6) = *MEMORY[0x1E0DC44C8];
      v9 = (void *)MEMORY[0x1E0CB3940];
      AXUILocalizedStringForKey(CFSTR("STARTED_DOWNLOAD"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSTableCell titleLabel](self, "titleLabel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "accessibilityLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", v10, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      UIAccessibilityPostNotification((UIAccessibilityNotifications)v6, v13);

      AXPerformBlockOnMainThreadAfterDelay();
      return v5;
    }
    return 0;
  }
  AXLogSpeechAssetDownload();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    -[AXSettingsVoiceTableViewCell resources](self, "resources");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v22 = v17;
    _os_log_impl(&dword_1BD892000, v15, OS_LOG_TYPE_DEFAULT, "Asset downloading, stop it %{public}@", buf, 0xCu);

  }
  -[AXSettingsVoiceTableViewCell infoDelegate](self, "infoDelegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSettingsVoiceTableViewCell resources](self, "resources");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "firstObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stopDownloadForResource:", v20);

  -[SUUIItemOfferButton removeButtonStateAnimations](self->_downloadButton, "removeButtonStateAnimations");
  v5 = 1;
  -[SUUIItemOfferButton setProgressType:animated:](self->_downloadButton, "setProgressType:animated:", 0, 1);
  -[AXSettingsVoiceTableViewCell _axShowCloudImageFor:](self, "_axShowCloudImageFor:", self->_downloadButton);
  -[SUUIItemOfferButton layoutSubviews](self->_downloadButton, "layoutSubviews");
  return v5;
}

void __43__AXSettingsVoiceTableViewCell__axDownload__block_invoke()
{
  UIAccessibilityPostNotification(*MEMORY[0x1E0DC4578], (id)*MEMORY[0x1E0CF4480]);
}

- (void)_axPlaySample
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  if (-[SUUIItemOfferButton isEnabled](self->_sampleButton, "isEnabled"))
  {
    -[AXSettingsVoiceTableViewCell infoDelegate](self, "infoDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSettingsVoiceTableViewCell resources](self, "resources");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __45__AXSettingsVoiceTableViewCell__axPlaySample__block_invoke;
    v6[3] = &unk_1E76AB330;
    v6[4] = self;
    objc_msgSend(v3, "playSampleForResource:completion:", v5, v6);

  }
}

uint64_t __45__AXSettingsVoiceTableViewCell__axPlaySample__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1208), "removeButtonStateAnimations");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1208), "setProgressType:animated:", 5, 1);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1208), "layoutSubviews");
}

- (id)colorFromHexString:(id)a3 alpha:(float)a4
{
  id v5;
  void *v6;
  void *v7;
  int v9;

  v5 = a3;
  if (objc_msgSend(v5, "length"))
  {
    v6 = 0;
    if (objc_msgSend(v5, "characterAtIndex:", 0) == 35)
    {
      v9 = 0;
      objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setScanLocation:", 1);
      objc_msgSend(v7, "scanHexInt:", &v9);
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", (double)BYTE2(v9) / 255.0, (double)BYTE1(v9) / 255.0, (double)v9 / 255.0, a4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  double v11;
  double v12;
  NSObject *v13;
  void *v14;
  AXSettingsVoiceTableViewCell *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  BOOL v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  NSObject *v36;
  AXSettingsVoiceTableViewCell *v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  SUUIItemOfferButton *sampleButton;
  double v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  int v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  UIButton *perVoiceSettingsButton;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  SUUIItemOfferButton *downloadButton;
  double v78;
  UIButton *v79;
  double v80;
  double v81;
  double v82;
  SUUIItemOfferButton *v83;
  double v84;
  void *v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  CGFloat v91;
  double v92;
  double v93;
  double v94;
  double v95;
  void *v96;
  BOOL v97;
  void *v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  void *v105;
  BOOL v106;
  _BOOL4 v107;
  void *v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  void *v115;
  double v116;
  double v117;
  void *v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double MaxX;
  double v127;
  void *v128;
  void *v129;
  void *v130;
  uint64_t v131;
  void *v132;
  double v133;
  id v134;
  UILabel **p_infoLabel;
  void *v136;
  void *v137;
  void *v138;
  _QWORD v139[4];
  id v140;
  id v141;
  id location;
  _QWORD block[5];
  objc_super v144;
  uint64_t v145;
  void *v146;
  uint8_t buf[4];
  AXSettingsVoiceTableViewCell *v148;
  __int16 v149;
  void *v150;
  __int16 v151;
  _BOOL4 v152;
  uint64_t v153;
  CGRect v154;
  CGRect v155;
  CGRect v156;
  CGRect v157;

  v153 = *MEMORY[0x1E0C80C00];
  -[PSTableCell specifier](self, "specifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSettingsVoiceTableViewCell _updateInfoLabelText](self, "_updateInfoLabelText");
  objc_msgSend(v3, "propertyForKey:", CFSTR("IsSelected"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  -[PSTableCell setChecked:](self, "setChecked:", v5);
  v144.receiver = self;
  v144.super_class = (Class)AXSettingsVoiceTableViewCell;
  -[PSTableCell layoutSubviews](&v144, sel_layoutSubviews);
  v6 = -[AXSettingsVoiceTableViewCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  -[AXSettingsVoiceTableViewCell resources](self, "resources");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") != 1)
    goto LABEL_68;
  -[AXSettingsVoiceTableViewCell infoDelegate](self, "infoDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    goto LABEL_69;
  -[SUUIItemOfferButton setHidden:](self->_downloadButton, "setHidden:", 0);
  objc_msgSend(v3, "propertyForKey:", CFSTR("DownloadProgress"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  v12 = v11;

  AXLogSpeechAssetDownload();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    -[AXSettingsVoiceTableViewCell resources](self, "resources");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
    v15 = (AXSettingsVoiceTableViewCell *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "properties");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[AXSettingsVoiceTableViewCell showsPlayButton](self, "showsPlayButton");
    *(_DWORD *)buf = 138412802;
    v148 = v15;
    v149 = 2112;
    v150 = v16;
    v151 = 1024;
    v152 = v17;
    _os_log_impl(&dword_1BD892000, v13, OS_LOG_TYPE_DEFAULT, "Voice: %@: %@ (show play: %d)", buf, 0x1Cu);

  }
  -[AXSettingsVoiceTableViewCell resources](self, "resources");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "firstObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isInstalled");

  if (v20)
  {
    if (v12 != 0.0)
      goto LABEL_16;
    -[AXSettingsVoiceTableViewCell resources](self, "resources");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "firstObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "speechVoice");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "canBeDownloaded");

    if (v24)
    {
      -[SUUIItemOfferButton setProgressType:](self->_downloadButton, "setProgressType:", 1);
      -[UIButton setHidden:](self->_perVoiceSettingsButton, "setHidden:", 1);
    }
    else
    {
LABEL_16:
      AXLogSpeechAssetDownload();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v148 = self;
        _os_log_impl(&dword_1BD892000, v31, OS_LOG_TYPE_DEFAULT, "Hiding download button, voice does not show play button: %@", buf, 0xCu);
      }

      -[SUUIItemOfferButton setHidden:](self->_downloadButton, "setHidden:", 1);
    }
    goto LABEL_35;
  }
  if (v12 == 0.0)
  {
    -[AXSettingsVoiceTableViewCell resources](self, "resources");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "firstObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "speechVoice");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v27, "canBeDownloaded") & 1) != 0)
    {
      v28 = -[SUUIItemOfferButton progressType](self->_downloadButton, "progressType") == 2;

      if (!v28)
      {
        AXLogSpeechAssetDownload();
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = v29;
        if ((_DWORD)v5)
        {
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1BD892000, v30, OS_LOG_TYPE_DEFAULT, "Hiding download button, swapping maui identifier in progress.", buf, 2u);
          }

          -[SUUIItemOfferButton setHidden:](self->_downloadButton, "setHidden:", 1);
        }
        else
        {
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1BD892000, v30, OS_LOG_TYPE_INFO, "No progress, setting type back to none", buf, 2u);
          }

          -[SUUIItemOfferButton setProgress:animated:](self->_downloadButton, "setProgress:animated:", 0, 0.0);
          -[SUUIItemOfferButton setProgressType:](self->_downloadButton, "setProgressType:", 0);
          -[AXSettingsVoiceTableViewCell _axShowCloudImageFor:](self, "_axShowCloudImageFor:", self->_downloadButton);
          dispatch_get_global_queue(17, 0);
          v39 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __46__AXSettingsVoiceTableViewCell_layoutSubviews__block_invoke;
          block[3] = &unk_1E76AB330;
          block[4] = self;
          dispatch_async(v39, block);

        }
        goto LABEL_35;
      }
    }
    else
    {

    }
  }
  if (v12 >= 1.0)
    goto LABEL_25;
  -[AXSettingsVoiceTableViewCell resources](self, "resources");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "firstObject");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "speechVoice");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "canBeDownloaded");

  if (v35)
  {
    AXLogSpeechAssetDownload();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
      v37 = (AXSettingsVoiceTableViewCell *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v148 = v37;
      _os_log_impl(&dword_1BD892000, v36, OS_LOG_TYPE_INFO, "Set download progress to: %@", buf, 0xCu);

    }
    -[SUUIItemOfferButton setProgress:animated:](self->_downloadButton, "setProgress:animated:", 1, v12);
    -[SUUIItemOfferButton setProgressType:](self->_downloadButton, "setProgressType:", 2);
  }
  else
  {
LABEL_25:
    if (v12 == 1.0)
    {
      if (-[SUUIItemOfferButton progressType](self->_downloadButton, "progressType") == 2)
      {
        AXLogSpeechAssetDownload();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BD892000, v38, OS_LOG_TYPE_INFO, "Progress done, completed download", buf, 2u);
        }

      }
      else if (!-[SUUIItemOfferButton progressType](self->_downloadButton, "progressType"))
      {
        -[SUUIItemOfferButton setProgressType:](self->_downloadButton, "setProgressType:", 1);
      }
    }
  }
LABEL_35:
  -[AXSettingsVoiceTableViewCell contentView](self, "contentView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "frame");
  v42 = v41;

  if (-[AXSettingsVoiceTableViewCell showsPlayButton](self, "showsPlayButton"))
  {
    -[SUUIItemOfferButton setHidden:](self->_sampleButton, "setHidden:", 0);
    -[SUUIItemOfferButton setProgressType:](self->_sampleButton, "setProgressType:", 5);
    -[SUUIItemOfferButton layoutSizeThatFits:](self->_sampleButton, "layoutSizeThatFits:", 100.0, 100.0);
    v44 = v43;
    v46 = v45;
    sampleButton = self->_sampleButton;
    -[AXSettingsVoiceTableViewCell frame](self, "frame");
    if (v6 == 1)
    {
      v49 = v42 - v44 + -20.0;
      v50 = v48 * 0.5 - v46 * 0.5;
    }
    else
    {
      v50 = v48 * 0.5 - v46 * 0.5;
      v49 = 20.0;
    }
    -[SUUIItemOfferButton setFrame:](sampleButton, "setFrame:", v49, v50, v44, v46);
    AXUILocalizedStringForKey(CFSTR("PLAY_VOICE_SAMPLE"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIItemOfferButton setAccessibilityLabel:](self->_sampleButton, "setAccessibilityLabel:", v51);

    objc_initWeak((id *)buf, self);
    objc_initWeak(&location, self->_sampleButton);
    objc_msgSend(MEMORY[0x1E0DBEF08], "sharedInstance");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSettingsVoiceTableViewCell resources](self, "resources");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "firstObject");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "voiceId");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v139[0] = MEMORY[0x1E0C809B0];
    v139[1] = 3221225472;
    v139[2] = __46__AXSettingsVoiceTableViewCell_layoutSubviews__block_invoke_241;
    v139[3] = &unk_1E76ABD28;
    objc_copyWeak(&v140, (id *)buf);
    objc_copyWeak(&v141, &location);
    objc_msgSend(v52, "sampleURLForVoiceId:completion:", v55, v139);

    objc_destroyWeak(&v141);
    objc_destroyWeak(&v140);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
  }
  if (!-[AXSettingsVoiceTableViewCell showsPerVoiceSettingsButton](self, "showsPerVoiceSettingsButton"))
  {
LABEL_49:
    -[SUUIItemOfferButton layoutSizeThatFits:](self->_downloadButton, "layoutSizeThatFits:", 100.0, 100.0);
    v72 = v75;
    v74 = v76;
    if (v6 == 1)
      goto LABEL_50;
    goto LABEL_52;
  }
  -[AXSettingsVoiceTableViewCell resources](self, "resources");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "firstObject");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v57, "isInstalled") & 1) == 0)
  {

    goto LABEL_49;
  }
  -[AXSettingsVoiceTableViewCell resources](self, "resources");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "firstObject");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "speechVoice");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "synthesisProviderVoice");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v61, "hasPerVoiceSettings");

  if (!v62)
    goto LABEL_49;
  -[UIButton setHidden:](self->_perVoiceSettingsButton, "setHidden:", 0);
  AXUILocalizedStringForKey(CFSTR("OPEN_PER_VOICE_SETTINGS"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setAccessibilityLabel:](self->_perVoiceSettingsButton, "setAccessibilityLabel:", v63);

  -[UIButton sizeThatFits:](self->_perVoiceSettingsButton, "sizeThatFits:", 100.0, 100.0);
  v65 = v64;
  v67 = v66;
  if (-[PSTableCell isChecked](self, "isChecked"))
    v68 = 0.0;
  else
    v68 = 20.0;
  if (v6 == 1)
  {
    perVoiceSettingsButton = self->_perVoiceSettingsButton;
    -[AXSettingsVoiceTableViewCell frame](self, "frame");
    -[UIButton setFrame:](perVoiceSettingsButton, "setFrame:", v68, v70 * 0.5 - v67 * 0.5, v65, v67);
    -[SUUIItemOfferButton layoutSizeThatFits:](self->_downloadButton, "layoutSizeThatFits:", 100.0, 100.0);
    v72 = v71;
    v74 = v73;
LABEL_50:
    downloadButton = self->_downloadButton;
    -[AXSettingsVoiceTableViewCell frame](self, "frame");
    -[SUUIItemOfferButton setFrame:](downloadButton, "setFrame:", 20.0, v78 * 0.5 - v74 * 0.5, v72, v74);
    goto LABEL_53;
  }
  v79 = self->_perVoiceSettingsButton;
  -[AXSettingsVoiceTableViewCell frame](self, "frame");
  -[UIButton setFrame:](v79, "setFrame:", v42 - v65 - v68, v80 * 0.5 - v67 * 0.5, v65, v67);
  -[SUUIItemOfferButton layoutSizeThatFits:](self->_downloadButton, "layoutSizeThatFits:", 100.0, 100.0);
  v72 = v81;
  v74 = v82;
LABEL_52:
  v83 = self->_downloadButton;
  -[AXSettingsVoiceTableViewCell frame](self, "frame");
  -[SUUIItemOfferButton setFrame:](v83, "setFrame:", v42 - v72 + -20.0, v84 * 0.5 - v74 * 0.5, v72, v74);
LABEL_53:
  -[PSTableCell titleLabel](self, "titleLabel");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "frame");
  v87 = v86;
  v89 = v88;
  v91 = v90;
  v93 = v92;

  -[SUUIItemOfferButton frame](self->_downloadButton, "frame");
  v95 = v42 + -20.0 - v94;
  if (v6 == 1)
  {
    v154.origin.x = v87;
    v154.origin.y = v89;
    v154.size.width = v91;
    v154.size.height = v93;
    v87 = v87 - (v95 - CGRectGetWidth(v154));
  }
  -[AXSettingsVoiceTableViewCell siriImageView](self, "siriImageView");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = v96 == 0;

  if (!v97)
  {
    -[AXSettingsVoiceTableViewCell siriImageView](self, "siriImageView");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "frame");
    v100 = v99;

    v101 = -(v100 + 20.0);
    if (v6 != 1)
      v101 = v100 + 20.0;
    v87 = v87 + v101;
    v95 = v95 - (v100 + 20.0);
  }
  -[SUUIItemOfferButton frame](self->_sampleButton, "frame");
  v103 = v102 + 20.0;
  if (v6 == 1)
  {
    -[SUUIItemOfferButton frame](self->_downloadButton, "frame");
    v104 = CGRectGetMaxX(v155) + 20.0;
    if (v87 < v104)
      v87 = v104;
    if ((-[SUUIItemOfferButton isHidden](self->_sampleButton, "isHidden") & 1) != 0)
      goto LABEL_67;
    v87 = v87 - v103;
    goto LABEL_66;
  }
  if ((-[SUUIItemOfferButton isHidden](self->_sampleButton, "isHidden") & 1) == 0)
  {
    v87 = v87 + v103;
LABEL_66:
    v95 = v95 - v103;
  }
LABEL_67:
  -[PSTableCell titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFrame:", v87, v89, v95, v93);
LABEL_68:

LABEL_69:
  -[UILabel text](self->_infoLabel, "text");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = v105 == 0;

  if (!v106)
  {
    v107 = v6 == 1;
    -[PSTableCell titleLabel](self, "titleLabel");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "frame");
    v110 = v109;
    v112 = v111;
    v114 = v113;

    -[AXSettingsVoiceTableViewCell contentView](self, "contentView");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "frame");
    v117 = v116;

    -[PSTableCell titleLabel](self, "titleLabel");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v119 = v117 * 0.5 + v114 * -0.85;
    objc_msgSend(v118, "setFrame:", v110, v119, v112, v114);

    -[UILabel frame](self->_infoLabel, "frame");
    v121 = v120;
    -[SUUIItemOfferButton frame](self->_downloadButton, "frame");
    if (v107)
    {
      MaxX = CGRectGetMaxX(*(CGRect *)&v122);
      v156.origin.x = v110;
      v156.origin.y = v119;
      v156.size.width = v112;
      v156.size.height = v114;
      v127 = CGRectGetMaxX(v156) - MaxX;
    }
    else
    {
      v127 = v122 - v110;
      MaxX = v110;
    }
    v157.origin.x = v110;
    v157.origin.y = v119;
    v157.size.width = v112;
    v157.size.height = v114;
    -[UILabel setFrame:](self->_infoLabel, "setFrame:", MaxX, CGRectGetMaxY(v157), v127, v121);
    -[PSTableCell titleLabel](self, "titleLabel");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "attributedText");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "attributesAtIndex:effectiveRange:", 0, 0);
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    v131 = *MEMORY[0x1E0DC32C0];
    objc_msgSend(v130, "objectForKey:", *MEMORY[0x1E0DC32C0]);
    v132 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v132, "firstLineHeadIndent");
    if (v133 > 0.0)
    {
      v134 = objc_alloc(MEMORY[0x1E0CB3498]);
      p_infoLabel = &self->_infoLabel;
      -[UILabel text](self->_infoLabel, "text");
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      v145 = v131;
      v146 = v132;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v146, &v145, 1);
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      v138 = (void *)objc_msgSend(v134, "initWithString:attributes:", v136, v137);
      -[UILabel setAttributedText:](*p_infoLabel, "setAttributedText:", v138);

      -[UILabel _setOverallWritingDirectionFollowsLayoutDirection:](*p_infoLabel, "_setOverallWritingDirectionFollowsLayoutDirection:", 1);
    }

  }
}

void __46__AXSettingsVoiceTableViewCell_layoutSubviews__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  _QWORD v4[5];
  char v5;

  objc_msgSend(*(id *)(a1 + 32), "infoDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowedToDownload");

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__AXSettingsVoiceTableViewCell_layoutSubviews__block_invoke_2;
  v4[3] = &unk_1E76ABCD8;
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v4);
}

uint64_t __46__AXSettingsVoiceTableViewCell_layoutSubviews__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1200), "setEnabled:", *(unsigned __int8 *)(a1 + 40));
}

void __46__AXSettingsVoiceTableViewCell_layoutSubviews__block_invoke_241(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__AXSettingsVoiceTableViewCell_layoutSubviews__block_invoke_2_242;
  block[3] = &unk_1E76ABD00;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v8);

  objc_destroyWeak(&v7);
}

void __46__AXSettingsVoiceTableViewCell_layoutSubviews__block_invoke_2_242(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(a1 + 5);
  objc_msgSend(WeakRetained, "resources");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isInstalled"))
  {

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "fileExistsAtPath:", v5);

    if ((v6 & 1) != 0)
      return;
    WeakRetained = objc_loadWeakRetained(a1 + 6);
    objc_msgSend(WeakRetained, "setEnabled:", 0);
  }

}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  char v11;
  int v12;
  uint64_t v13;
  unint64_t v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)AXSettingsVoiceTableViewCell;
  v3 = -[AXSettingsVoiceTableViewCell accessibilityTraits](&v16, sel_accessibilityTraits);
  -[PSTableCell specifier](self, "specifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyForKey:", CFSTR("IsSelected"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  v7 = *MEMORY[0x1E0DC46B0];
  if (!v6)
    v7 = 0;
  v8 = v7 | v3;
  if ((-[SUUIItemOfferButton isHidden](self->_downloadButton, "isHidden") & 1) == 0)
  {
    -[AXSettingsVoiceTableViewCell resources](self, "resources");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isInstalled");

    if ((v11 & 1) == 0)
      v8 |= -[SUUIItemOfferButton accessibilityTraits](self->_downloadButton, "accessibilityTraits");
  }
  v12 = -[SUUIItemOfferButton isEnabled](self->_downloadButton, "isEnabled");
  v13 = *MEMORY[0x1E0DC4698];
  if (v12)
    v13 = 0;
  v14 = v13 | v8;

  return v14;
}

- (void)itemOfferButtonDidAnimateTransition:(id)a3
{
  UIAccessibilityPostNotification(*MEMORY[0x1E0DC4578], (id)*MEMORY[0x1E0CF4480]);
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AXSettingsVoiceTableViewCell;
  -[AXSettingsVoiceTableViewCell accessibilityValue](&v7, sel_accessibilityValue);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIItemOfferButton accessibilityValue](self->_downloadButton, "accessibilityValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __AXStringForVariables();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v14;

  if ((-[SUUIItemOfferButton isHidden](self->_downloadButton, "isHidden") & 1) != 0
    || (-[AXSettingsVoiceTableViewCell resources](self, "resources"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "firstObject"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isInstalled"),
        v4,
        v3,
        (v5 & 1) != 0))
  {
    -[PSTableCell titleLabel](self, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessibilityLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel accessibilityLabel](self->_infoLabel, "accessibilityLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    __AXStringForVariables();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    if (-[SUUIItemOfferButton progressType](self->_downloadButton, "progressType"))
      v11 = CFSTR("STOP_DOWNLOAD_NAME");
    else
      v11 = CFSTR("DOWNLOAD_NAME");
    AXUILocalizedStringForKey(v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSTableCell titleLabel](self, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accessibilityLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringWithFormat:", v6, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel accessibilityLabel](self->_infoLabel, "accessibilityLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    __AXStringForVariables();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  int v3;
  void *v4;
  void *v5;
  char v6;

  v3 = -[SUUIItemOfferButton isEnabled](self->_downloadButton, "isEnabled");
  if (v3)
  {
    if ((-[SUUIItemOfferButton isHidden](self->_downloadButton, "isHidden") & 1) != 0
      || (-[AXSettingsVoiceTableViewCell resources](self, "resources"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v4, "firstObject"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v6 = objc_msgSend(v5, "isInstalled"),
          v5,
          v4,
          (v6 & 1) != 0))
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      -[SUUIItemOfferButton sendActionsForControlEvents:](self->_downloadButton, "sendActionsForControlEvents:", 64);
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (void)_axShowCloudImageFor:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0DC3870];
  v5 = a3;
  objc_msgSend(v4, "systemImageNamed:", CFSTR("icloud.and.arrow.down"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[AXSettingsVoiceTableViewCell tintColor](self, "tintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageWithTintColor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v7);

}

- (BOOL)showsInfoLabel
{
  return self->_showsInfoLabel;
}

- (void)setShowsInfoLabel:(BOOL)a3
{
  self->_showsInfoLabel = a3;
}

- (BOOL)showsUsageInfo
{
  return self->_showsUsageInfo;
}

- (void)setShowsUsageInfo:(BOOL)a3
{
  self->_showsUsageInfo = a3;
}

- (BOOL)showsPlayButton
{
  return self->_showsPlayButton;
}

- (void)setShowsPlayButton:(BOOL)a3
{
  self->_showsPlayButton = a3;
}

- (BOOL)indentsForVoiceGraphic
{
  return self->_indentsForVoiceGraphic;
}

- (void)setIndentsForVoiceGraphic:(BOOL)a3
{
  self->_indentsForVoiceGraphic = a3;
}

- (BOOL)showsPerVoiceSettingsButton
{
  return self->_showsPerVoiceSettingsButton;
}

- (void)setShowsPerVoiceSettingsButton:(BOOL)a3
{
  self->_showsPerVoiceSettingsButton = a3;
}

- (AXResourceDownloadInformationDelegate)infoDelegate
{
  return (AXResourceDownloadInformationDelegate *)objc_loadWeakRetained((id *)&self->_infoDelegate);
}

- (void)setInfoDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_infoDelegate, a3);
}

- (UIImageView)siriImageView
{
  return self->_siriImageView;
}

- (void)setSiriImageView:(id)a3
{
  objc_storeStrong((id *)&self->_siriImageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriImageView, 0);
  objc_destroyWeak((id *)&self->_infoDelegate);
  objc_storeStrong((id *)&self->_infoLabel, 0);
  objc_storeStrong((id *)&self->_perVoiceSettingsButton, 0);
  objc_storeStrong((id *)&self->_sampleButton, 0);
  objc_storeStrong((id *)&self->_downloadButton, 0);
}

@end
