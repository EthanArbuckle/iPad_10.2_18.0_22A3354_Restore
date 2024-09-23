@implementation AVMobileChromeControlsStyleSheet

- (CGSize)minimumScrubberSize
{
  double width;
  double height;
  CGSize result;

  width = self->_minimumScrubberSize.width;
  height = self->_minimumScrubberSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)defaultItemInlineSize
{
  double width;
  double height;
  CGSize result;

  width = self->_defaultItemInlineSize.width;
  height = self->_defaultItemInlineSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)minimumSingleButtonTransportControlsWidth
{
  return self->_minimumSingleButtonTransportControlsWidth;
}

- (CGSize)routePickerButtonInlineSize
{
  double width;
  double height;
  CGSize result;

  width = self->_routePickerButtonInlineSize.width;
  height = self->_routePickerButtonInlineSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)maximumProminentPlayButtonDimension
{
  return self->_maximumProminentPlayButtonDimension;
}

- (double)volumeSliderInlineWidth
{
  return self->_volumeSliderInlineWidth;
}

- (double)standardInteritemPadding
{
  return self->_standardInteritemPadding;
}

- (double)minimumTransportControlsWidth
{
  return self->_minimumTransportControlsWidth;
}

- (double)minimumProminentPlayButtonDimension
{
  return self->_minimumProminentPlayButtonDimension;
}

- (AVMobileChromeControlsStyleSheet)initWithTraitCollection:(id)a3 shouldUseCompactFullScreenSize:(BOOL)a4
{
  unsigned int v4;
  AVMobileChromeControlsStyleSheet *v5;
  AVMobileChromeControlsStyleSheet *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  __int128 v15;
  double v16;
  double v17;
  double v18;
  int32x2_t v19;
  int64x2_t v20;
  double standardPaddingInline;
  double v22;
  void *v23;
  double Width;
  double Height;
  double v26;
  double v27;
  double v28;
  double v31;
  float64x2_t v32;
  objc_super v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  v4 = a4;
  v33.receiver = self;
  v33.super_class = (Class)AVMobileChromeControlsStyleSheet;
  v5 = -[AVMobileControlsStyleSheet initWithTraitCollection:](&v33, sel_initWithTraitCollection_, a3);
  v6 = v5;
  if (v5)
  {
    -[AVMobileControlsStyleSheet traitCollection](v5, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "userInterfaceIdiom");

    -[AVMobileControlsStyleSheet traitCollection](v6, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "userInterfaceIdiom");

    -[AVMobileControlsStyleSheet traitCollection](v6, "traitCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "userInterfaceIdiom");

    if (v8 == 5)
      v14 = 0.77;
    else
      v14 = 1.0;
    v15 = *(_OWORD *)(MEMORY[0x1E0DC49E8] + 16);
    *(_OWORD *)&v6->_fullscreenInsets.top = *MEMORY[0x1E0DC49E8];
    *(_OWORD *)&v6->_fullscreenInsets.bottom = v15;
    if (!v12 || v10 == 1)
    {
      v16 = 24.0;
      v17 = 27.0;
      if (v12)
        v17 = 32.0;
      else
        v16 = 27.0;
      v6->_fullscreenInsets.top = v17;
      v6->_fullscreenInsets.left = v16;
      v6->_fullscreenInsets.bottom = v17;
      v6->_fullscreenInsets.right = v16;
    }
    v18 = 6.0;
    v6->_shouldUseCompactFullScreenSize = v4;
    v32 = vmulq_n_f64((float64x2_t)xmmword_1AC5F81B0, v14);
    v6->_defaultItemInlineSize = (CGSize)v32;
    v19 = vdup_n_s32(v4);
    v20.i64[0] = v19.u32[0];
    v20.i64[1] = v19.u32[1];
    v6->_defaultItemFullScreenSize = (CGSize)vmulq_n_f64((float64x2_t)vbslq_s8((int8x16_t)vcltzq_s64(vshlq_n_s64(v20, 0x3FuLL)), (int8x16_t)xmmword_1AC5F81D0, (int8x16_t)xmmword_1AC5F81C0), v14);
    if (v8 == 5)
      v18 = 20.0;
    if (v10 == 1)
      v18 = 8.0;
    v6->_standardPaddingFullScreen = v18;
    if (v8 == 5)
      v18 = 8.0;
    v6->_standardPaddingInline = v18;
    v6->_standardInteritemPadding = v14 * 11.0;
    v6->_additionalInlinePaddingForDodgingSafeArea = v14 * 20.0;
    standardPaddingInline = v6->_standardPaddingInline;
    v6->_embeddedInlineInsets.top = standardPaddingInline;
    v6->_embeddedInlineInsets.left = standardPaddingInline;
    v6->_embeddedInlineInsets.bottom = standardPaddingInline;
    v6->_embeddedInlineInsets.right = standardPaddingInline;
    v6->_routePickerButtonInlineSize.width = v14 * 18.0;
    v6->_routePickerButtonInlineSize.height = v14 * 18.0;
    v6->_routePickerButtonFullScreenSize.width = v14 * 19.0;
    v6->_routePickerButtonFullScreenSize.height = v14 * 19.0;
    v6->_audioRoutePickerFullScreenSize.width = v14 * 20.0;
    v6->_audioRoutePickerFullScreenSize.height = v14 * 20.0;
    v6->_volumeSliderInlineWidth = v14 * 88.0;
    v22 = v14 * 100.0;
    v6->_volumeSliderCompactFullScreenWidth = v14 * 100.0;
    v6->_volumeSliderRegularFullScreenWidth = v14 * 128.0;
    v6->_volumeSliderPadding = v14 * 14.0;
    v6->_volumeButtonInlineSize.width = v14 * 18.0;
    v6->_volumeButtonInlineSize.height = v14 * 18.0;
    v6->_volumeButtonFullScreenSize.width = v14 * 19.0;
    v6->_volumeButtonFullScreenSize.height = v14 * 19.0;
    v6->_minimumProminentPlayButtonDimension = 31.0;
    v6->_maximumProminentPlayButtonDimension = 60.0;
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen", *(_QWORD *)&v14, v13);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bounds");
    Width = CGRectGetWidth(v34);
    objc_msgSend(v23, "bounds");
    Height = CGRectGetHeight(v35);
    if (Width >= Height)
      v26 = Height;
    else
      v26 = Width;
    objc_msgSend(v23, "bounds");
    v27 = CGRectGetWidth(v36);
    objc_msgSend(v23, "bounds");
    v28 = CGRectGetHeight(v37);
    if (v27 >= v28)
      v28 = v27;
    if (v8 == 5 || v10 == 1)
      v28 = v26;
    v6->_maximumTransportControlsWidth = v31 * v28;
    v6->_maximumMultiRowTransportControlsWidth = 402.0;
    v6->_minimumTransportControlsWidth = v31 * 210.0;
    v6->_minimumSingleButtonTransportControlsWidth = v32.f64[0];
    v6->_minimumScrubberSize.width = v22;
    v6->_minimumScrubberSize.height = v31 * 9.0;
    *(_OWORD *)&v6->_doubleRowLayoutMargins.top = xmmword_1AC5F81E0;
    *(_OWORD *)&v6->_doubleRowLayoutMargins.bottom = xmmword_1AC5F81F0;
    *(_OWORD *)&v6->_doubleRowLayoutMarginsWhenShowingScrubInstructions.top = xmmword_1AC5F8200;
    *(_OWORD *)&v6->_doubleRowLayoutMarginsWhenShowingScrubInstructions.bottom = xmmword_1AC5F81F0;
    *(_OWORD *)&v6->_doublerowLayoutMarginsWhenShowingCustomContentInfo.top = xmmword_1AC5F8210;
    *(_OWORD *)&v6->_doublerowLayoutMarginsWhenShowingCustomContentInfo.bottom = xmmword_1AC5F81F0;
    v6->_spacingBetweenScrubInstructionsAndScrubber = 10.0;
    v6->_liveBroadcastLabelTopToBackdropTopDistance = v31 * 15.0;

  }
  return v6;
}

- (UIFont)scrubberTimeLabelFont
{
  -[AVMobileChromeControlsStyleSheet _loadFontsIfNeeded](self);
  return self->_scrubberTimeLabelFont;
}

- (void)_loadFontsIfNeeded
{
  void *v2;
  uint64_t v3;
  id *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  if (a1 && !a1[19])
  {
    objc_msgSend(a1, "traitCollection");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "userInterfaceIdiom");

    v4 = (id *)MEMORY[0x1E0DC4A90];
    if (v3 != 5)
      v4 = (id *)MEMORY[0x1E0DC4AA0];
    v5 = (void *)MEMORY[0x1E0DC1350];
    v6 = *v4;
    objc_msgSend(a1, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredFontForTextStyle:compatibleWithTraitCollection:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pointSize");
    v10 = v9;

    objc_msgSend(MEMORY[0x1E0DC1350], "monospacedDigitSystemFontOfSize:weight:", v10, *MEMORY[0x1E0DC1440]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x1E0DC13D0];
    v30[0] = *MEMORY[0x1E0DC13D8];
    v30[1] = v12;
    v31[0] = &unk_1E5BF36F0;
    v31[1] = &unk_1E5BF3708;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "fontDescriptor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10, *MEMORY[0x1E0DC1380], *MEMORY[0x1E0DC1390], v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "fontDescriptorByAddingAttributes:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)MEMORY[0x1E0DC1350];
    v20 = *MEMORY[0x1E0DC4AB8];
    objc_msgSend(a1, "traitCollection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "preferredFontForTextStyle:compatibleWithTraitCollection:", v20, v21);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)a1[18];
    a1[18] = v22;

    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", v10);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)a1[19];
    a1[19] = v24;

    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v18, v10);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)a1[20];
    a1[20] = v26;

  }
}

- (UIFont)scrubberInfoLabelFont
{
  -[AVMobileChromeControlsStyleSheet _loadFontsIfNeeded](self);
  return self->_scrubberInfoLabelFont;
}

- (UIFont)infoLabelFont
{
  -[AVMobileChromeControlsStyleSheet _loadFontsIfNeeded](self);
  return self->_infoLabelFont;
}

- (CGSize)defaultItemFullScreenSize
{
  double width;
  double height;
  CGSize result;

  width = self->_defaultItemFullScreenSize.width;
  height = self->_defaultItemFullScreenSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UIEdgeInsets)landscapeFullscreenInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_fullscreenInsets.top;
  left = self->_fullscreenInsets.left;
  bottom = self->_fullscreenInsets.bottom;
  right = self->_fullscreenInsets.right;
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

  top = self->_fullscreenInsets.top;
  left = self->_fullscreenInsets.left;
  bottom = self->_fullscreenInsets.bottom;
  right = self->_fullscreenInsets.right;
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

- (double)additionalInlinePaddingForDodgingSafeArea
{
  return self->_additionalInlinePaddingForDodgingSafeArea;
}

- (CGSize)routePickerButtonFullScreenSize
{
  double width;
  double height;
  CGSize result;

  width = self->_routePickerButtonFullScreenSize.width;
  height = self->_routePickerButtonFullScreenSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)audioRoutePickerFullScreenSize
{
  double width;
  double height;
  CGSize result;

  width = self->_audioRoutePickerFullScreenSize.width;
  height = self->_audioRoutePickerFullScreenSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)volumeSliderCompactFullScreenWidth
{
  return self->_volumeSliderCompactFullScreenWidth;
}

- (double)volumeSliderRegularFullScreenWidth
{
  return self->_volumeSliderRegularFullScreenWidth;
}

- (double)volumeSliderPadding
{
  return self->_volumeSliderPadding;
}

- (CGSize)volumeButtonInlineSize
{
  double width;
  double height;
  CGSize result;

  width = self->_volumeButtonInlineSize.width;
  height = self->_volumeButtonInlineSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)volumeButtonFullScreenSize
{
  double width;
  double height;
  CGSize result;

  width = self->_volumeButtonFullScreenSize.width;
  height = self->_volumeButtonFullScreenSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)maximumTransportControlsWidth
{
  return self->_maximumTransportControlsWidth;
}

- (double)maximumMultiRowTransportControlsWidth
{
  return self->_maximumMultiRowTransportControlsWidth;
}

- (NSDirectionalEdgeInsets)doubleRowLayoutMargins
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_doubleRowLayoutMargins.top;
  leading = self->_doubleRowLayoutMargins.leading;
  bottom = self->_doubleRowLayoutMargins.bottom;
  trailing = self->_doubleRowLayoutMargins.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (NSDirectionalEdgeInsets)doubleRowLayoutMarginsWhenShowingScrubInstructions
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_doubleRowLayoutMarginsWhenShowingScrubInstructions.top;
  leading = self->_doubleRowLayoutMarginsWhenShowingScrubInstructions.leading;
  bottom = self->_doubleRowLayoutMarginsWhenShowingScrubInstructions.bottom;
  trailing = self->_doubleRowLayoutMarginsWhenShowingScrubInstructions.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (NSDirectionalEdgeInsets)doublerowLayoutMarginsWhenShowingCustomContentInfo
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_doublerowLayoutMarginsWhenShowingCustomContentInfo.top;
  leading = self->_doublerowLayoutMarginsWhenShowingCustomContentInfo.leading;
  bottom = self->_doublerowLayoutMarginsWhenShowingCustomContentInfo.bottom;
  trailing = self->_doublerowLayoutMarginsWhenShowingCustomContentInfo.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (double)spacingBetweenScrubInstructionsAndScrubber
{
  return self->_spacingBetweenScrubInstructionsAndScrubber;
}

- (double)liveBroadcastLabelTopToBackdropTopDistance
{
  return self->_liveBroadcastLabelTopToBackdropTopDistance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrubberTimeLabelFont, 0);
  objc_storeStrong((id *)&self->_scrubberInfoLabelFont, 0);
  objc_storeStrong((id *)&self->_infoLabelFont, 0);
}

@end
