@implementation AVMobileChromelessControlsStyleSheet

- (AVMobileChromelessControlsStyleSheet)initWithTraitCollection:(id)a3
{
  id v4;
  char *v5;
  char *v6;
  __int128 v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVMobileChromelessControlsStyleSheet;
  v5 = -[AVMobileControlsStyleSheet initWithTraitCollection:](&v9, sel_initWithTraitCollection_, v4);
  if (v5)
  {
    if (objc_msgSend(v4, "userInterfaceIdiom"))
    {
      *((_QWORD *)v5 + 19) = 0x4020000000000000;
      *((_QWORD *)v5 + 20) = 0x4018000000000000;
      *(_OWORD *)(v5 + 56) = xmmword_1AC5F8250;
      *(_OWORD *)(v5 + 72) = xmmword_1AC5F8260;
      v6 = v5 + 88;
      *((_QWORD *)v5 + 11) = 0x4047000000000000;
      v7 = xmmword_1AC5F8270;
    }
    else
    {
      *((_QWORD *)v5 + 19) = 0x4020000000000000;
      *((_QWORD *)v5 + 20) = 0x4018000000000000;
      *(_OWORD *)(v5 + 56) = xmmword_1AC5F8280;
      *(_OWORD *)(v5 + 72) = xmmword_1AC5F8290;
      v6 = v5 + 88;
      *((_QWORD *)v5 + 11) = 0x4045C00000000000;
      v7 = xmmword_1AC5F82A0;
    }
    *(_OWORD *)(v6 + 8) = v7;
    *((_QWORD *)v6 + 3) = v7;
    *(_OWORD *)(v5 + 120) = xmmword_1AC5F82B0;
    *(_OWORD *)(v5 + 136) = xmmword_1AC5F82C0;
  }

  return (AVMobileChromelessControlsStyleSheet *)v5;
}

- (UIFont)contentTagFont
{
  -[AVMobileChromelessControlsStyleSheet _loadFontsIfNeeded](self);
  return self->_contentTagFont;
}

- (UIFont)infoAffordanceButtonFont
{
  -[AVMobileChromelessControlsStyleSheet _loadFontsIfNeeded](self);
  return self->_infoAffordanceButtonFont;
}

- (UIFont)prominentContentTagFont
{
  -[AVMobileChromelessControlsStyleSheet _loadFontsIfNeeded](self);
  return self->_prominentContentTagFont;
}

- (UIFont)subtitleFont
{
  -[AVMobileChromelessControlsStyleSheet _loadFontsIfNeeded](self);
  return self->_subtitleFont;
}

- (UIFont)timeLabelFont
{
  -[AVMobileChromelessControlsStyleSheet _loadFontsIfNeeded](self);
  return self->_timeLabelFont;
}

- (UIFont)titleFont
{
  -[AVMobileChromelessControlsStyleSheet _loadFontsIfNeeded](self);
  return self->_titleFont;
}

- (UIFont)playPauseButtonFont
{
  -[AVMobileChromelessControlsStyleSheet _loadFontsIfNeeded](self);
  return self->_playPauseButtonFont;
}

- (UIFont)secondaryPlaybackControlsFont
{
  -[AVMobileChromelessControlsStyleSheet _loadFontsIfNeeded](self);
  return self->_secondaryPlaybackControlsFont;
}

- (UIFont)contentTabLabelFont
{
  -[AVMobileChromelessControlsStyleSheet _loadFontsIfNeeded](self);
  return self->_contentTabLabelFont;
}

- (UIEdgeInsets)landscapeFullscreenInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_landscapeFullscreenInsets.top;
  left = self->_landscapeFullscreenInsets.left;
  bottom = self->_landscapeFullscreenInsets.bottom;
  right = self->_landscapeFullscreenInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIEdgeInsets)portraitFullscreenInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_portraitFullscreenInsets.top;
  left = self->_portraitFullscreenInsets.left;
  bottom = self->_portraitFullscreenInsets.bottom;
  right = self->_portraitFullscreenInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIEdgeInsets)embeddedInlineInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_embeddedInlineInsets.top;
  left = self->_embeddedInlineInsets.left;
  bottom = self->_embeddedInlineInsets.bottom;
  right = self->_embeddedInlineInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (double)standardPaddingFullScreen
{
  return self->_standardPaddingFullScreen;
}

- (double)standardPaddingInline
{
  return self->_standardPaddingInline;
}

- (UIFont)buttonFont
{
  return self->_buttonFont;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonFont, 0);
  objc_storeStrong((id *)&self->_contentTabLabelFont, 0);
  objc_storeStrong((id *)&self->_playPauseButtonFont, 0);
  objc_storeStrong((id *)&self->_secondaryPlaybackControlsFont, 0);
  objc_storeStrong((id *)&self->_prominentContentTagFont, 0);
  objc_storeStrong((id *)&self->_contentTagFont, 0);
  objc_storeStrong((id *)&self->_infoAffordanceButtonFont, 0);
  objc_storeStrong((id *)&self->_subtitleFont, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_timeLabelFont, 0);
}

- (void)_loadFontsIfNeeded
{
  uint64_t v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  double v19;
  uint64_t v20;
  void *v21;
  double v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  _QWORD v40[2];
  _QWORD v41[2];
  void *v42;
  _QWORD v43[2];
  _QWORD v44[3];

  v44[2] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (!a1[21])
    {
      v2 = *MEMORY[0x1E0DC4AA0];
      v3 = (void *)MEMORY[0x1E0DC1350];
      objc_msgSend(a1, "traitCollection");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "preferredFontForTextStyle:compatibleWithTraitCollection:", v2, v4);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v39, "pointSize");
      v6 = v5;
      v7 = *MEMORY[0x1E0DC1440];
      objc_msgSend(MEMORY[0x1E0DC1350], "monospacedDigitSystemFontOfSize:weight:");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *MEMORY[0x1E0DC13D0];
      v43[0] = *MEMORY[0x1E0DC13D8];
      v43[1] = v9;
      v44[0] = &unk_1E5BF3990;
      v44[1] = &unk_1E5BF39A8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "fontDescriptor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *MEMORY[0x1E0DC1390];
      v40[0] = *MEMORY[0x1E0DC1380];
      v40[1] = v13;
      v41[0] = v11;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v41[1] = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "fontDescriptorByAddingAttributes:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v16, v6);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)a1[21];
      a1[21] = v17;

      v19 = *MEMORY[0x1E0DC1420];
      objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:weight:", *MEMORY[0x1E0DC4B58], *MEMORY[0x1E0DC1420]);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)a1[22];
      a1[22] = v20;

      v22 = *MEMORY[0x1E0DC1448];
      objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:weight:", *MEMORY[0x1E0DC4AB8], *MEMORY[0x1E0DC1448]);
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = (void *)a1[23];
      a1[23] = v23;

      objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:weight:", *MEMORY[0x1E0DC4A90], v22);
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = (void *)a1[24];
      a1[24] = v25;

      objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 15.0, v19);
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = (void *)a1[26];
      a1[26] = v27;

      objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 10.0, v22);
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = (void *)a1[25];
      a1[25] = v29;

      objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 39.0, *MEMORY[0x1E0DC1418]);
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = (void *)a1[28];
      a1[28] = v31;

      objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 31.0, v7);
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = (void *)a1[27];
      a1[27] = v33;

      objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:variant:maximumContentSizeCategory:", *MEMORY[0x1E0DC4B08], 1024, *MEMORY[0x1E0DC4918]);
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = (void *)a1[29];
      a1[29] = v35;

      objc_msgSend(MEMORY[0x1E0DC1350], "avkit_nonScalingFontWithTextStyle:weight:", *MEMORY[0x1E0DC4B60], v7);
      v37 = objc_claimAutoreleasedReturnValue();
      v38 = (void *)a1[30];
      a1[30] = v37;

    }
  }
}

@end
