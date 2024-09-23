id CarPlayUIGeneralLogging()
{
  if (CarPlayUIGeneralLogging_onceToken != -1)
    dispatch_once(&CarPlayUIGeneralLogging_onceToken, &__block_literal_global_0);
  return (id)CarPlayUIGeneralLogging_facility;
}

id CPUIChevronRightGlyph()
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x24BDF6A70], "_preferredFontForTextStyle:variant:", *MEMORY[0x24BDF77B8], 1024);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithFont:scale:", v0, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:withConfiguration:", CFSTR("chevron.forward"), v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id CPUIMessageComposeGlyph(void *a1, double a2)
{
  return _CPUIGlyphFactoryWithTraitCollection(CFSTR("square.and.pencil"), 6, a1, a2);
}

id CPUIImageUpIndicatorGlyph(void *a1)
{
  return _CPUIGlyphFactoryWithTraitCollection(CFSTR("chevron.up"), 6, a1, 20.0);
}

id CPUIImageDownIndicatorGlyph(void *a1)
{
  return _CPUIGlyphFactoryWithTraitCollection(CFSTR("chevron.down"), 6, a1, 20.0);
}

id CPUIImageMinimizeGlyph(void *a1)
{
  return _CPUIGlyphFactoryWithTraitCollection(CFSTR("chevron.down.circle.fill"), 4, a1, 18.0);
}

id CPUIImageMaximizeGlyph(void *a1)
{
  return _CPUIGlyphFactoryWithTraitCollection(CFSTR("chevron.up.circle.fill"), 4, a1, 18.0);
}

id CPUIImageCancelGlyph(void *a1)
{
  return _CPUIGlyphFactoryWithTraitCollection(CFSTR("xmark.circle.fill"), 4, a1, 18.0);
}

id CPUIImageZoomInGlyph(void *a1)
{
  return _CPUIGlyphFactoryWithTraitCollection(CFSTR("plus"), 5, a1, 18.0);
}

id CPUIImageZoomOutGlyph(void *a1)
{
  return _CPUIGlyphFactoryWithTraitCollection(CFSTR("minus"), 5, a1, 18.0);
}

id CPUIImagePanGlyph(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = (void *)MEMORY[0x24BDF6AC8];
  v2 = a1;
  CPUIFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("CarPan"), v3, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "imageWithRenderingMode:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id CPUIImageRecenterGlyph(void *a1)
{
  return _CPUIGlyphFactoryWithTraitCollection(CFSTR("location.fill"), 4, a1, 16.0);
}

id CPUIImageStarRatingEmpty(void *a1, int a2)
{
  double v2;

  v2 = 18.0;
  if (a2)
    v2 = 9.0;
  return _CPUIGlyphFactoryWithTraitCollection(CFSTR("star"), 5, a1, v2);
}

id CPUIImageStarRatingHalf(void *a1, int a2)
{
  double v2;

  v2 = 18.0;
  if (a2)
    v2 = 9.0;
  return _CPUIGlyphFactoryWithTraitCollection(CFSTR("star.leadinghalf.fill"), 5, a1, v2);
}

id CPUIImageStarRatingFull(void *a1, int a2)
{
  double v2;

  v2 = 18.0;
  if (a2)
    v2 = 9.0;
  return _CPUIGlyphFactoryWithTraitCollection(CFSTR("star.fill"), 5, a1, v2);
}

id CPUIFilteredString(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = (void *)MEMORY[0x24BDD14A8];
  v2 = a1;
  objc_msgSend(v1, "newlineCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsSeparatedByCharactersInSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "componentsJoinedByString:", &stru_24DF24E68);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

const __CFString *CPUILocalizedExplicitLabelString()
{
  void *v0;
  void *v1;
  uint64_t v2;

  objc_msgSend(MEMORY[0x24BEC8750], "defaultManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "ageVerificationState");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "treatment");

  if (v2 == 1)
    return CFSTR("⓳");
  else
    return CFSTR("🅴");
}

id CPUILocalizedExplicitImageForTraitCollection(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;

  v1 = (void *)MEMORY[0x24BEC8750];
  v2 = a1;
  objc_msgSend(v1, "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ageVerificationState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "treatment");

  if (v5 == 1)
    v6 = CFSTR("ExplicitGlyph19");
  else
    v6 = CFSTR("ExplicitGlyph");
  CPUIImageNamedWithTraitCollection(v6, v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id CPUITableCellExplicitLabel()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v0 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 15.0, *MEMORY[0x24BDF7888]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setFont:", v1);

  CPUILocalizedExplicitLabelString();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setText:", v2);

  objc_msgSend(MEMORY[0x24BDF6950], "_carSystemSecondaryColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setTextColor:", v3);

  objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusSecondaryColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setHighlightedTextColor:", v4);

  objc_msgSend(v0, "sizeToFit");
  return v0;
}

id CPUIFormattedNumberString(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;

  v1 = CPUIFormattedNumberString_sOnceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&CPUIFormattedNumberString_sOnceToken, &__block_literal_global_2);
  objc_msgSend((id)CPUIFormattedNumberString_sNumberFormatter, "stringFromNumber:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t CPUITimeDurationForSeconds(float a1)
{
  if (CPUITimeDurationForSeconds_sOnceToken != -1)
    dispatch_once(&CPUITimeDurationForSeconds_sOnceToken, &__block_literal_global_15);
  return objc_msgSend((id)CPUITimeDurationForSeconds_sTimeFormatter, "stringFromSeconds:", a1);
}

id CPUIFormattedPlaybackRateString(void *a1)
{
  id v1;
  __CFString *v2;
  void *v3;
  void *v5;
  void *v6;
  void *v7;

  v1 = a1;
  if (objc_msgSend(v1, "isEqualToNumber:", &unk_24DF30438))
  {
    v2 = CFSTR("PLAYBACK_RATE_SPEED_HALF");
  }
  else if (objc_msgSend(v1, "isEqualToNumber:", &unk_24DF30448))
  {
    v2 = CFSTR("PLAYBACK_RATE_SPEED_THREE_QUARTERS");
  }
  else if (objc_msgSend(v1, "isEqualToNumber:", &unk_24DF30208))
  {
    v2 = CFSTR("PLAYBACK_RATE_SPEED_ONE");
  }
  else if (objc_msgSend(v1, "isEqualToNumber:", &unk_24DF30458))
  {
    v2 = CFSTR("PLAYBACK_RATE_SPEED_ONE_AND_QUARTER");
  }
  else if (objc_msgSend(v1, "isEqualToNumber:", &unk_24DF30468))
  {
    v2 = CFSTR("PLAYBACK_RATE_SPEED_ONE_AND_HALF");
  }
  else if (objc_msgSend(v1, "isEqualToNumber:", &unk_24DF30478))
  {
    v2 = CFSTR("PLAYBACK_RATE_SPEED_ONE_AND_THREE_QUARTERS");
  }
  else
  {
    if (!objc_msgSend(v1, "isEqualToNumber:", &unk_24DF30220))
    {
      v5 = (void *)MEMORY[0x24BDD17C8];
      CPUILocalizedStringForKey(CFSTR("PLAYBACK_RATE_%@"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      CPUIFormattedNumberString(v1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", v6, v7);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_16;
    }
    v2 = CFSTR("PLAYBACK_RATE_SPEED_TWO");
  }
  CPUILocalizedStringForKey(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

  return v3;
}

id CPUIAccessiblePlaybackRateString(void *a1)
{
  id v1;
  __CFString *v2;
  void *v3;
  void *v5;
  void *v6;
  void *v7;

  v1 = a1;
  if (objc_msgSend(v1, "isEqualToNumber:", &unk_24DF30438))
  {
    v2 = CFSTR("ACCESSIBLE_PLAYBACK_RATE_SPEED_HALF");
  }
  else if (objc_msgSend(v1, "isEqualToNumber:", &unk_24DF30448))
  {
    v2 = CFSTR("ACCESSIBLE_PLAYBACK_RATE_SPEED_THREE_QUARTERS");
  }
  else if (objc_msgSend(v1, "isEqualToNumber:", &unk_24DF30208))
  {
    v2 = CFSTR("ACCESSIBLE_PLAYBACK_RATE_SPEED_ONE");
  }
  else if (objc_msgSend(v1, "isEqualToNumber:", &unk_24DF30458))
  {
    v2 = CFSTR("ACCESSIBLE_PLAYBACK_RATE_SPEED_ONE_AND_QUARTER");
  }
  else if (objc_msgSend(v1, "isEqualToNumber:", &unk_24DF30468))
  {
    v2 = CFSTR("ACCESSIBLE_PLAYBACK_RATE_SPEED_ONE_AND_HALF");
  }
  else if (objc_msgSend(v1, "isEqualToNumber:", &unk_24DF30478))
  {
    v2 = CFSTR("ACCESSIBLE_PLAYBACK_RATE_SPEED_ONE_AND_THREE_QUARTERS");
  }
  else
  {
    if (!objc_msgSend(v1, "isEqualToNumber:", &unk_24DF30220))
    {
      v5 = (void *)MEMORY[0x24BDD17C8];
      CPUILocalizedStringForKey(CFSTR("ACCESSIBLE_PLAYBACK_RATE_%@"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      CPUIFormattedNumberString(v1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", v6, v7);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_16;
    }
    v2 = CFSTR("ACCESSIBLE_PLAYBACK_RATE_SPEED_TWO");
  }
  CPUILocalizedStringForKey(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

  return v3;
}

id _CPUIGlyphFactoryWithTraitCollection(void *a1, uint64_t a2, void *a3, double a4)
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = (void *)MEMORY[0x24BDF6AE0];
  v8 = a3;
  v9 = a1;
  objc_msgSend(v7, "configurationWithPointSize:weight:", a2, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:compatibleWithTraitCollection:", v9, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "imageWithSymbolConfiguration:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id _CPUISiriGlyph(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithPointSize:weight:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "_systemImageNamed:withConfiguration:", CFSTR("siri"), v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id CPUIPlaybackProgressCompleteGlyphWithSize(void *a1, double a2)
{
  return _CPUIGlyphFactoryWithTraitCollection(CFSTR("checkmark.circle"), 6, a1, a2);
}

id CPUIShuffleGlyph(void *a1)
{
  return _CPUIGlyphFactoryWithTraitCollection(CFSTR("shuffle"), 4, a1, 16.0);
}

id CPUIEllipsisGlyph(void *a1)
{
  return _CPUIGlyphFactoryWithTraitCollection(CFSTR("ellipsis"), 4, a1, 16.0);
}

id CPUIAddGlyph(void *a1)
{
  return _CPUIGlyphFactoryWithTraitCollection(CFSTR("plus"), 4, a1, 16.0);
}

id CPUIRepeatGlyph(void *a1)
{
  return _CPUIGlyphFactoryWithTraitCollection(CFSTR("repeat"), 4, a1, 16.0);
}

id CPUIRepeatOneGlyph(void *a1)
{
  return _CPUIGlyphFactoryWithTraitCollection(CFSTR("repeat.1"), 4, a1, 16.0);
}

id CPUIPauseGlyph(void *a1)
{
  return _CPUIGlyphFactoryWithTraitCollection(CFSTR("pause.fill"), 4, a1, 26.0);
}

id CPUIBackGlyph(void *a1)
{
  return _CPUIGlyphFactoryWithTraitCollection(CFSTR("backward.fill"), 4, a1, 20.0);
}

id CPUIForwardGlyph(void *a1)
{
  return _CPUIGlyphFactoryWithTraitCollection(CFSTR("forward.fill"), 4, a1, 20.0);
}

id CPUIQuestionmarkGlyph(void *a1)
{
  return _CPUIGlyphFactoryWithTraitCollection(CFSTR("questionmark.app.dashed"), 4, a1, 16.0);
}

id CPUIImageForTransportButton(unint64_t a1, void *a2, void *a3, double a4)
{
  id v7;
  id v8;
  __CFString *v9;
  void *v10;

  v7 = a2;
  v8 = a3;
  if (a1 <= 6)
  {
    v9 = off_24DF24220[a1];
    if (!v7)
      goto LABEL_6;
    goto LABEL_5;
  }
  v9 = 0;
  if (v7)
  {
LABEL_5:
    -[__CFString stringByAppendingFormat:](v9, "stringByAppendingFormat:", CFSTR(".%@"), v7);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
LABEL_6:
  _CPUIGlyphFactoryWithTraitCollection(v9, 4, v8, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id CPUIHighlightedImageForTransportButton(unint64_t a1, void *a2, void *a3, double a4)
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = (void *)MEMORY[0x24BDF6950];
  v8 = a3;
  v9 = a2;
  objc_msgSend(v7, "labelColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "colorWithAlphaComponent:", 0.2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  CPUIImageForTransportButton(a1, v9, v8, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "flattenedImageWithColor:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t CPUIPlaceholderTypeForBundleIdentifier(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CPUINewsBundleIdentifier) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CPUIAudiobooksBundleIdentifier) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CPUIPodcastsBundleIdentifier) & 1) != 0)
  {
    v2 = 2;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CPUIClassicalBundleIdentifier))
  {
    v2 = 5;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

id CPUIImageForPlaceholderTypeWithTraitCollection(uint64_t a1, void *a2)
{
  id v3;
  __CFString *v4;
  void *v5;

  v3 = a2;
  if ((unint64_t)(a1 - 1) > 8)
    v4 = CFSTR("PlaceholderMusic");
  else
    v4 = off_24DF24258[a1 - 1];
  CPUIImageNamedWithTraitCollection(v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t _touchesContainDirectTouch(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = a1;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v7;
    while (2)
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v7 != v3)
          objc_enumerationMutation(v1);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * i), "type", (_QWORD)v6))
        {
          v2 = 1;
          goto LABEL_11;
        }
      }
      v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
      if (v2)
        continue;
      break;
    }
  }
LABEL_11:

  return v2;
}

id CPUIImageByScalingImageToSize(void *a1, double a2, double a3)
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  void *v15;

  v5 = a1;
  objc_msgSend(v5, "size");
  if (v6 <= a2 && (objc_msgSend(v5, "size"), v7 <= a3))
  {
    v14 = v5;
  }
  else
  {
    objc_msgSend(v5, "size");
    v9 = a2 / v8;
    objc_msgSend(v5, "size");
    if (v9 >= a3 / v10)
      v9 = a3 / v10;
    objc_msgSend(v5, "size");
    v12 = v11 * v9;
    objc_msgSend(v5, "size");
    objc_msgSend(v5, "_imageWithSize:", v12, v13 * v9);
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;

  return v15;
}

id CPUIFrameworkBundle()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 8uLL, 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectAtIndex:", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)GSSystemRootDirectory(), "stringByAppendingPathComponent:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("PrivateFrameworks/CarPlayUI.framework"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id CPUIImageNamedWithTraitCollection(void *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDF6AC8];
  v4 = a2;
  v5 = a1;
  CPUIFrameworkBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageNamed:inBundle:compatibleWithTraitCollection:", v5, v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

unint64_t CPUITraitCollectionSupportsFocus(void *a1)
{
  id v1;
  unint64_t v2;

  v1 = a1;
  if (objc_msgSend(v1, "primaryInteractionModel") == 8)
    v2 = 1;
  else
    v2 = ((unint64_t)objc_msgSend(v1, "interactionModel") >> 1) & 1;

  return v2;
}

id CPUILocalizedStringForKey(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  CPUIFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_24DF24E68, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

double CPUIRectByApplyingUserInterfaceLayoutDirectionInRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5, double a6, double a7, double a8)
{
  double v12;
  void *v13;
  uint64_t v14;
  double MaxX;
  double v16;
  _BYTE v18[32];
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  *(double *)&v18[16] = a7;
  *(double *)&v18[24] = a8;
  *(double *)v18 = a5;
  *(double *)&v18[8] = a6;
  *(_QWORD *)&v12 = (unint64_t)CGRectIntegral(*(CGRect *)&a1);
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "userInterfaceLayoutDirection");

  if (v14 == 1)
  {
    MaxX = CGRectGetMaxX(*(CGRect *)v18);
    v19.origin.x = a1;
    v19.origin.y = a2;
    v19.size.width = a3;
    v19.size.height = a4;
    v16 = MaxX - CGRectGetMinX(v19);
    v20.origin.x = a1;
    v20.origin.y = a2;
    v20.size.width = a3;
    v20.size.height = a4;
    v12 = v16 - CGRectGetWidth(v20);
    v21.origin.x = a1;
    v21.origin.y = a2;
    v21.size.width = a3;
    v21.size.height = a4;
    CGRectGetMinY(v21);
    v22.origin.x = a1;
    v22.origin.y = a2;
    v22.size.width = a3;
    v22.size.height = a4;
    CGRectGetWidth(v22);
    v23.origin.x = a1;
    v23.origin.y = a2;
    v23.size.width = a3;
    v23.size.height = a4;
    CGRectGetHeight(v23);
  }
  return v12;
}

const __CFString *CPUIDescriptionForUserInterfaceStyle(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("invalid style");
  else
    return off_24DF242A0[a1];
}

id CPUINowPlayingLayoutForSafeAreaFrameScaleArtwork(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, double a6, double a7, double a8, double a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect v31;

  v18 = a9;
  v19 = a8;
  v20 = a7;
  v21 = a6;
  if ((_DWORD)a1)
  {
    CGRectGetWidth(*(CGRect *)&a2);
    v31.origin.x = a2;
    v31.origin.y = a3;
    v31.size.width = a4;
    v31.size.height = a5;
    CGRectGetHeight(v31);
    v18 = a9;
    v19 = a8;
    v20 = a7;
    v21 = a6;
  }
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSafeArea:frame:displayScale:showsArtwork:", a1, a2, a3, a4, a5, v21, v20, v19, v18, a17);
}

void sub_21B709110(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL _nonCapturedPressType_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "type") != 3
    && objc_msgSend(v2, "type") != 2
    && objc_msgSend(v2, "type")
    && objc_msgSend(v2, "type") != 1;

  return v3;
}

double UIEdgeInsetsFromRectWithRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  double MinY;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  v10 = *MEMORY[0x24BDF7718];
  v11 = *MEMORY[0x24BDBF090];
  v12 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v14 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v13 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v30.origin.x = *(CGFloat *)MEMORY[0x24BDBF090];
  v30.origin.y = v12;
  v30.size.width = v14;
  v30.size.height = v13;
  if (CGRectEqualToRect(*(CGRect *)&a1, v30))
    return v10;
  v23.size.height = a8;
  v23.origin.x = a5;
  v23.origin.y = a6;
  v23.size.width = a7;
  v31.origin.x = v11;
  v31.origin.y = v12;
  v31.size.width = v14;
  v31.size.height = v13;
  MinY = v10;
  if (!CGRectEqualToRect(v23, v31))
  {
    v24.origin.x = a1;
    v24.origin.y = a2;
    v24.size.width = a3;
    v24.size.height = a4;
    MinY = CGRectGetMinY(v24);
    v25.origin.x = a1;
    v25.origin.y = a2;
    v25.size.width = a3;
    v25.size.height = a4;
    CGRectGetMinX(v25);
    v26.origin.x = a5;
    v26.origin.y = a6;
    v26.size.width = a7;
    v26.size.height = a8;
    CGRectGetHeight(v26);
    v27.origin.x = a1;
    v27.origin.y = a2;
    v27.size.width = a3;
    v27.size.height = a4;
    CGRectGetMaxY(v27);
    v28.origin.x = a5;
    v28.origin.y = a6;
    v28.size.width = a7;
    v28.size.height = a8;
    CGRectGetWidth(v28);
    v29.origin.x = a1;
    v29.origin.y = a2;
    v29.size.width = a3;
    v29.size.height = a4;
    CGRectGetMaxX(v29);
  }
  return MinY;
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD900](retstr, t, sx, sy);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFE0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF008]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF010]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF030]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x24BDBF038]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBF048]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

uint64_t GSSystemRootDirectory()
{
  return MEMORY[0x24BE3D630]();
}

uint64_t MPURectByApplyingUserInterfaceLayoutDirectionInRect()
{
  return MEMORY[0x24BE63528]();
}

uint64_t MRMediaRemoteSetWantsNowPlayingNotifications()
{
  return MEMORY[0x24BE65270]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x24BDD1208](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x24BDF6670]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

uint64_t UIImageGetUnreadIndicator()
{
  return MEMORY[0x24BDF7918]();
}

uint64_t UIRectCenteredYInRect()
{
  return MEMORY[0x24BDF7CB0]();
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x24BDF7CD8]();
}

uint64_t _AXSCarPlayEnhanceTextLegibilityEnabled()
{
  return MEMORY[0x24BED2118]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAF688](__x, __y);
  return result;
}

