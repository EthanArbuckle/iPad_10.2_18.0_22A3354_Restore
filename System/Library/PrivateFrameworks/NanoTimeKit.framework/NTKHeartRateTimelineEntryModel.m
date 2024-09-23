@implementation NTKHeartRateTimelineEntryModel

- (id)templateForComplicationFamily:(int64_t)a3
{
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  int v12;
  id v13;
  __int16 v14;
  int64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  _NTKLoggingObjectForDomain(14, (uint64_t)"NTKLoggingDomainDebug");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543618;
    v13 = (id)objc_opt_class();
    v14 = 2048;
    v15 = a3;
    v6 = v13;
    _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Requesting template for %ld family.", (uint8_t *)&v12, 0x16u);

  }
  v7 = 0;
  switch(a3)
  {
    case 0:
      v8 = -[NTKHeartRateTimelineEntryModel _newModularSmallTemplate](self, "_newModularSmallTemplate");
      goto LABEL_16;
    case 1:
      v8 = -[NTKHeartRateTimelineEntryModel _newModularLargeTemplate](self, "_newModularLargeTemplate");
      goto LABEL_16;
    case 2:
      v8 = -[NTKHeartRateTimelineEntryModel _newUtilitarianSmallTemplate](self, "_newUtilitarianSmallTemplate");
      goto LABEL_16;
    case 3:
      v8 = -[NTKHeartRateTimelineEntryModel _newUtilitarianLargeTemplate](self, "_newUtilitarianLargeTemplate");
      goto LABEL_16;
    case 4:
      v8 = -[NTKHeartRateTimelineEntryModel _newCircularTemplateUsingMediumSize:](self, "_newCircularTemplateUsingMediumSize:", 0);
      goto LABEL_16;
    case 6:
      v8 = -[NTKHeartRateTimelineEntryModel _newUtilitarianSmallFlatTemplate](self, "_newUtilitarianSmallFlatTemplate");
      goto LABEL_16;
    case 7:
      v8 = -[NTKHeartRateTimelineEntryModel _newExtraLargeTemplate](self, "_newExtraLargeTemplate");
      goto LABEL_16;
    case 8:
      v8 = -[NTKHeartRateTimelineEntryModel _newSignatureCornerTemplate](self, "_newSignatureCornerTemplate");
      goto LABEL_16;
    case 9:
      v8 = -[NTKHeartRateTimelineEntryModel _newSignatureBezelTemplate](self, "_newSignatureBezelTemplate");
      goto LABEL_16;
    case 10:
      v8 = -[NTKHeartRateTimelineEntryModel _newSignatureCircularTemplate](self, "_newSignatureCircularTemplate");
      goto LABEL_16;
    case 11:
      v8 = -[NTKHeartRateTimelineEntryModel _newSignatureRectangularTemplate](self, "_newSignatureRectangularTemplate");
      goto LABEL_16;
    case 12:
      v8 = -[NTKHeartRateTimelineEntryModel _newSignatureExtraLargeCircularTemplate](self, "_newSignatureExtraLargeCircularTemplate");
LABEL_16:
      v7 = v8;
      break;
    default:
      break;
  }
  if (*MEMORY[0x1E0C93E90] == a3)
  {
    v9 = -[NTKHeartRateTimelineEntryModel _newCircularTemplateUsingMediumSize:](self, "_newCircularTemplateUsingMediumSize:", 1);
LABEL_21:
    v10 = v9;

    v7 = v10;
    return v7;
  }
  if (a3 == 104)
  {
    v9 = -[NTKHeartRateTimelineEntryModel _newUtilitarianLargeTemplate](self, "_newUtilitarianLargeTemplate");
    goto LABEL_21;
  }
  return v7;
}

- (id)_newUtilitarianSmallFlatTemplate
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t v15[16];

  v3 = (void *)MEMORY[0x1E0C944E8];
  NTKImageNamed(CFSTR("UtilityHeartrate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageProviderWithOnePieceImage:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_hasBPM)
  {
    _NTKLoggingObjectForDomain(38, (uint64_t)"NTKLoggingDomainHeartRate");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1B72A3000, v6, OS_LOG_TYPE_DEFAULT, "hasBPM for family: newUtilitarianSmallFlat", v15, 2u);
    }

    v7 = (void *)MEMORY[0x1E0C94530];
    -[NTKHeartRateTimelineEntryModel _bpmString](self, "_bpmString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textProviderWithText:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = (void *)MEMORY[0x1E0C94530];
    NTKClockFaceLocalizedString(CFSTR("HEART_RATE_UTILITY_SMALL_FLAT_NODATA"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "textProviderWithText:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0C94468], "templateWithTextProvider:imageProvider:", v9, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKHeartRateComplicationUtilties heartrateTintColor](NTKHeartRateComplicationUtilties, "heartrateTintColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTintColor:", v13);

  return v12;
}

- (id)_newUtilitarianSmallTemplate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0C944E8];
  NTKImageNamed(CFSTR("UtilityHeartrate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageProviderWithOnePieceImage:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C94488], "templateWithImageProvider:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKHeartRateComplicationUtilties heartrateTintColor](NTKHeartRateComplicationUtilties, "heartrateTintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTintColor:", v6);

  return v5;
}

- (id)_newUtilitarianLargeTemplate
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t buf[16];

  if (self->_hasBPM)
  {
    _NTKLoggingObjectForDomain(38, (uint64_t)"NTKLoggingDomainHeartRate");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "hasBPM for family: _newUtilitarianLarge", buf, 2u);
    }

    v4 = (void *)MEMORY[0x1E0C944E8];
    NTKImageNamed(CFSTR("ColorHeartrate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageProviderWithOnePieceImage:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    NTKClockFaceLocalizedString(CFSTR("HEART_RATE_UTILITY_LARGE_FORMAT"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_lessThanMinute)
    {
      v8 = (void *)MEMORY[0x1E0C94540];
      -[NTKHeartRateTimelineEntryModel _heartrateString](self, "_heartrateString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NTKClockFaceLocalizedString(CFSTR("HEART_RATE_TIME_NOW"), CFSTR("Now"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "textProviderWithFormat:", v7, v9, v10);
    }
    else
    {
      v14 = NTKCanUseShortRelativeDateStyleForHeartRateComplicationStrings();
      v15 = (_QWORD *)MEMORY[0x1E0C94068];
      if (!v14)
        v15 = (_QWORD *)MEMORY[0x1E0C94060];
      objc_msgSend(MEMORY[0x1E0C94508], "textProviderWithDate:style:units:", self->_measurementDate, *v15, 112);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTimeTravelUpdateFrequency:", 0);
      v16 = (void *)MEMORY[0x1E0C94540];
      -[NTKHeartRateTimelineEntryModel _heartrateString](self, "_heartrateString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "textProviderWithFormat:", v7, v10, v9);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = (void *)MEMORY[0x1E0C94530];
    NTKClockFaceLocalizedString(CFSTR("HEART_RATE_TITLE"), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "textProviderWithText:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C94460], "templateWithTextProvider:imageProvider:", v13, v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKHeartRateComplicationUtilties heartrateTintColor](NTKHeartRateComplicationUtilties, "heartrateTintColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTintColor:", v18);

  return v17;
}

- (id)_newCircularTemplateUsingMediumSize:(BOOL)a3
{
  void *v3;
  __CFString *v4;
  id *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0C944E8];
  if (a3)
    v4 = CFSTR("VictoryNTKHeartrate");
  else
    v4 = CFSTR("ColorHeartrate");
  if (a3)
    v5 = (id *)0x1E0C94180;
  else
    v5 = (id *)0x1E0C941C0;
  NTKImageNamed(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageProviderWithOnePieceImage:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*v5, "templateWithImageProvider:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKHeartRateComplicationUtilties heartrateTintColor](NTKHeartRateComplicationUtilties, "heartrateTintColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTintColor:", v9);

  return v8;
}

- (id)_newModularSmallTemplate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0C944E8];
  NTKImageNamed(CFSTR("ModularSmallHeartrate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageProviderWithOnePieceImage:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C94438], "templateWithImageProvider:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKHeartRateComplicationUtilties heartrateTintColor](NTKHeartRateComplicationUtilties, "heartrateTintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTintColor:", v6);

  return v5;
}

- (id)_newModularLargeTemplate
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  _QWORD *v18;
  void *v19;
  void *v20;
  uint8_t v22[16];

  if (self->_hasBPM)
  {
    _NTKLoggingObjectForDomain(38, (uint64_t)"NTKLoggingDomainHeartRate");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "hasBPM for family: _newUtilitarianLarge", v22, 2u);
    }

    v4 = (void *)MEMORY[0x1E0C94530];
    NTKClockFaceLocalizedString(CFSTR("HEART_RATE_TITLE"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "textProviderWithText:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x1E0C94530];
    -[NTKHeartRateTimelineEntryModel _heartrateString](self, "_heartrateString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textProviderWithText:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (self->_lessThanMinute)
    {
      v10 = (void *)MEMORY[0x1E0C94530];
      NTKClockFaceLocalizedString(CFSTR("HEART_RATE_TIME_NOW"), CFSTR("Now"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "textProviderWithText:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v17 = NTKCanUseShortRelativeDateStyleForHeartRateComplicationStrings();
      v18 = (_QWORD *)MEMORY[0x1E0C94068];
      if (!v17)
        v18 = (_QWORD *)MEMORY[0x1E0C94060];
      objc_msgSend(MEMORY[0x1E0C94508], "textProviderWithDate:style:units:", self->_measurementDate, *v18, 112);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setTimeTravelUpdateFrequency:", 0);
      objc_msgSend(v12, "setDisableOffsetPrefix:", 1);
      objc_msgSend(v12, "setDisableSmallCapUnits:", 1);
      objc_msgSend(v12, "setItalicized:", 1);
    }
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0C94530];
    NTKClockFaceLocalizedString(CFSTR("HEART_RATE_TITLE"), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "textProviderWithText:", v14);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x1E0C94530];
    NTKClockFaceLocalizedString(CFSTR("HEART_RATE_LARGE_MODULAR_NODATA"), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "textProviderWithText:", v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C943F8], "templateWithHeaderTextProvider:body1TextProvider:body2TextProvider:", v6, v9, v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKHeartRateComplicationUtilties heartrateTintColor](NTKHeartRateComplicationUtilties, "heartrateTintColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTintColor:", v20);

  return v19;
}

- (id)_newExtraLargeTemplate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0C944E8];
  NTKImageNamed(CFSTR("ExtraLargeHeartrate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageProviderWithOnePieceImage:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C94218], "templateWithImageProvider:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKHeartRateComplicationUtilties heartrateTintColor](NTKHeartRateComplicationUtilties, "heartrateTintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTintColor:", v6);

  return v5;
}

- (id)_newSignatureCornerTemplate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  NTKImageNamed(CFSTR("rich-corner_heartrate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithRenderingMode:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C944D8], "providerWithFullColorImage:monochromeFilterType:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKHeartRateComplicationUtilties heartrateTintColor](NTKHeartRateComplicationUtilties, "heartrateTintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTintColor:", v5);

  objc_msgSend(MEMORY[0x1E0C942C0], "templateWithImageProvider:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0C94118];
  v10[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMetadata:", v7);

  return v6;
}

- (id)_newSignatureCircularTemplate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  NTKImageNamed(CFSTR("VictoryNTKHeartrate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithRenderingMode:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C944D8], "providerWithFullColorImage:monochromeFilterType:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKHeartRateComplicationUtilties heartrateTintColor](NTKHeartRateComplicationUtilties, "heartrateTintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTintColor:", v5);

  objc_msgSend(MEMORY[0x1E0C94260], "templateWithImageProvider:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0C94118];
  v10[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMetadata:", v7);

  return v6;
}

- (id)_newSignatureExtraLargeCircularTemplate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  NTKImageNamed(CFSTR("HeartrateGraphicXLGlyph"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithRenderingMode:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C944D8], "providerWithFullColorImage:monochromeFilterType:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKHeartRateComplicationUtilties heartrateTintColor](NTKHeartRateComplicationUtilties, "heartrateTintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTintColor:", v5);

  objc_msgSend(MEMORY[0x1E0C94330], "templateWithImageProvider:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0C94118];
  v10[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMetadata:", v7);

  return v6;
}

- (id)_newSignatureBezelTemplate
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C94238];
  v4 = -[NTKHeartRateTimelineEntryModel _newSignatureCircularTemplate](self, "_newSignatureCircularTemplate");
  -[NTKHeartRateTimelineEntryModel _signatureBezelTextProvider](self, "_signatureBezelTextProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "templateWithCircularTemplate:textProvider:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_signatureBezelTextProvider
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  uint8_t buf[16];

  if (-[NTKHeartRateTimelineEntryModel isLocked](self, "isLocked"))
  {
    NTKClockFaceLocalizedString(CFSTR("HEART_RATE_SIGNATURE_LARGE_LOCKED"), CFSTR("Unlock to View"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!-[NTKHeartRateTimelineEntryModel hasBPM](self, "hasBPM"))
    {
      v11 = (void *)MEMORY[0x1E0C94530];
      NTKClockFaceLocalizedString(CFSTR("HEART_RATE_LARGE_MODULAR_NODATA"), 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "textProviderWithText:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      return v13;
    }
    _NTKLoggingObjectForDomain(38, (uint64_t)"NTKLoggingDomainHeartRate");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "hasBPM for family: _signaturebezel", buf, 2u);
    }

    v6 = (void *)MEMORY[0x1E0C94530];
    -[NTKHeartRateTimelineEntryModel _heartrateString](self, "_heartrateString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textProviderWithText:", v7);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (self->_lessThanMinute)
    {
      v8 = (void *)MEMORY[0x1E0C94530];
      NTKClockFaceLocalizedString(CFSTR("HEART_RATE_TIME_NOW"), CFSTR("Now"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "textProviderWithText:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = NTKCanUseShortRelativeDateStyleForHeartRateComplicationStrings();
      v16 = (_QWORD *)MEMORY[0x1E0C94068];
      if (!v15)
        v16 = (_QWORD *)MEMORY[0x1E0C94060];
      objc_msgSend(MEMORY[0x1E0C94508], "textProviderWithDate:style:units:", self->_measurementDate, *v16, 112);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTimeTravelUpdateFrequency:", 0);
      objc_msgSend(v10, "setDisableOffsetPrefix:", 1);
      objc_msgSend(v10, "setDisableSmallCapUnits:", 1);
    }
    v17 = (void *)MEMORY[0x1E0C94540];
    NTKClockFaceLocalizedString(CFSTR("HEART_RATE_BEZEL_FORMAT"), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "textProviderWithFormat:", v18, v3, v10);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)_metadataWithCurrentMeasurements
{
  void *v3;
  void *v4;
  __CFString **v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NTKHeartRateTimelineEntryModel isLocked](self, "isLocked"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NTKHeartRateTimelineEntryModel isLocked](self, "isLocked"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = NTKHeartRateRichComplicationMetadataKeyIsLocked;
LABEL_8:
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, *v5);

    goto LABEL_9;
  }
  if (-[NTKHeartRateTimelineEntryModel hasBPM](self, "hasBPM"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_BPM);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("NTKHeartRateRichComplicationMetadataKeyBPM"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_lessThanMinute);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("NTKHeartRateRichComplicationMetadataKeyIsNow"));

    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_measurementDate, CFSTR("NTKHeartRateRichComplicationMetadataKeyDate"));
  }
  if (-[NTKHeartRateTimelineEntryModel hasSummary](self, "hasSummary"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_dailyHighBPM);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("NTKHeartRateRichComplicationMetadataKeyDailyHighBPM"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_dailyLowBPM);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("NTKHeartRateRichComplicationMetadataKeyDailyLowBPM"));

    -[NTKHeartRateTimelineEntryModel chartPoints](self, "chartPoints");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[NTKHeartRateTimelineEntryModel chartPoints](self, "chartPoints");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = NTKHeartRateRichComplicationMetadataKeyChartPoints;
      goto LABEL_8;
    }
  }
LABEL_9:
  v11 = (void *)objc_msgSend(v3, "copy");

  return v11;
}

- (id)_newSignatureRectangularTemplate
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C943C0];
  -[NTKHeartRateTimelineEntryModel _metadataWithCurrentMeasurements](self, "_metadataWithCurrentMeasurements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "templateWithMetadata:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_heartrateString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  NTKClockFaceLocalizedString(CFSTR("HEART_RATE_READING"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKHeartRateTimelineEntryModel _bpmString](self, "_bpmString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_bpmString
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37F0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_BPM);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringFromNumber:numberStyle:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSDate)measurementDate
{
  return self->_measurementDate;
}

- (void)setMeasurementDate:(id)a3
{
  objc_storeStrong((id *)&self->_measurementDate, a3);
}

- (int64_t)BPM
{
  return self->_BPM;
}

- (void)setBPM:(int64_t)a3
{
  self->_BPM = a3;
}

- (BOOL)hasBPM
{
  return self->_hasBPM;
}

- (void)setHasBPM:(BOOL)a3
{
  self->_hasBPM = a3;
}

- (BOOL)lessThanMinute
{
  return self->_lessThanMinute;
}

- (void)setLessThanMinute:(BOOL)a3
{
  self->_lessThanMinute = a3;
}

- (BOOL)isLocked
{
  return self->_locked;
}

- (void)setLocked:(BOOL)a3
{
  self->_locked = a3;
}

- (BOOL)hasSummary
{
  return self->_hasSummary;
}

- (void)setHasSummary:(BOOL)a3
{
  self->_hasSummary = a3;
}

- (int64_t)dailyLowBPM
{
  return self->_dailyLowBPM;
}

- (void)setDailyLowBPM:(int64_t)a3
{
  self->_dailyLowBPM = a3;
}

- (int64_t)dailyHighBPM
{
  return self->_dailyHighBPM;
}

- (void)setDailyHighBPM:(int64_t)a3
{
  self->_dailyHighBPM = a3;
}

- (NSArray)chartPoints
{
  return self->_chartPoints;
}

- (void)setChartPoints:(id)a3
{
  objc_storeStrong((id *)&self->_chartPoints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chartPoints, 0);
  objc_storeStrong((id *)&self->_measurementDate, 0);
}

@end
