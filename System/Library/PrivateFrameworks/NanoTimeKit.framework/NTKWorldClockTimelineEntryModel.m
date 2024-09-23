@implementation NTKWorldClockTimelineEntryModel

- (id)templateForComplicationFamily:(int64_t)a3
{
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v5 = 0;
  v6 = 1;
  switch(a3)
  {
    case 0:
      -[NTKWorldClockTimelineEntryModel _smallModularTemplate](self, "_smallModularTemplate");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 1:
      -[NTKWorldClockTimelineEntryModel _largeModularTemplate](self, "_largeModularTemplate");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 2:
    case 6:
      -[NTKWorldClockTimelineEntryModel _smallInlineTemplate](self, "_smallInlineTemplate");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 3:
      -[NTKWorldClockTimelineEntryModel _largeInlineTemplate](self, "_largeInlineTemplate");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 4:
      -[NTKWorldClockTimelineEntryModel _circularSmallTemplate](self, "_circularSmallTemplate");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 7:
      -[NTKWorldClockTimelineEntryModel _extraLargeTemplate](self, "_extraLargeTemplate");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 8:
      -[NTKWorldClockTimelineEntryModel _graphicCornerTemplate](self, "_graphicCornerTemplate");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 9:
      -[NTKWorldClockTimelineEntryModel _graphicBezelTemplate](self, "_graphicBezelTemplate");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 10:
      -[NTKWorldClockTimelineEntryModel _graphicCircularTemplate](self, "_graphicCircularTemplate");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 11:
      -[NTKWorldClockTimelineEntryModel _graphicRectangularTemplate](self, "_graphicRectangularTemplate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 0;
      break;
    case 12:
      -[NTKWorldClockTimelineEntryModel _graphicExtraLargeCircularTemplate](self, "_graphicExtraLargeCircularTemplate");
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_13:
      v5 = (void *)v7;
      break;
    default:
      break;
  }
  if (*MEMORY[0x1E0C93E90] == a3)
  {
    -[NTKWorldClockTimelineEntryModel _circularMediumTemplate](self, "_circularMediumTemplate");
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }
  if (v6)
  {
    +[NTKWorldClockTimelineEntryModel _appPrimaryColor](NTKWorldClockTimelineEntryModel, "_appPrimaryColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTintColor:", v9);

  }
  return v5;
}

- (id)_graphicRectangularTemplate
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
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  uint64_t v27;
  void *v28;
  _QWORD v29[2];
  _QWORD v30[2];
  const __CFString *v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[NTKWorldClockTimelineEntryModel _graphicRectangularTemplate].cold.1((uint64_t)self, v3);

  if (self->_isPrivacy)
  {
    +[NTKWorldClockTimelineEntryModel _uppercaseAppNameTextProvider](NTKWorldClockTimelineEntryModel, "_uppercaseAppNameTextProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKWorldClockTimelineEntryModel _appPrimaryColor](NTKWorldClockTimelineEntryModel, "_appPrimaryColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTintColor:", v5);
  }
  else
  {
    -[NTKWorldClockTimelineEntryModel _abbreviationTextProvider](self, "_abbreviationTextProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "ntk_wc_sunYellowColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTintColor:", v6);

    -[NTKWorldClockTimelineEntryModel _timeAndDifferenceOffsetTextProvider](self, "_timeAndDifferenceOffsetTextProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTintColor:", v8);

    v9 = (void *)MEMORY[0x1E0C94540];
    NTKClockFaceLocalizedString(CFSTR("WORLD_CLOCK_ABBREVIATION_TIME_OFFSET_FORMAT"), CFSTR("%1$@ %2$@"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "textProviderWithFormat:", v10, v5, v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0C944D8], "fullColorImageProviderWithImageViewClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_isPrivacy)
  {
    v31 = CFSTR("IsPrivacy");
    v32[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setMetadata:", v12);
  }
  else
  {
    v29[0] = CFSTR("Latitude");
    v13 = (void *)MEMORY[0x1E0CB37E8];
    -[NTKWorldClockTimelineEntryModel city](self, "city");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "alCity");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "latitude");
    objc_msgSend(v13, "numberWithFloat:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v14;
    v29[1] = CFSTR("Longitude");
    v15 = (void *)MEMORY[0x1E0CB37E8];
    -[NTKWorldClockTimelineEntryModel city](self, "city");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "alCity");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "longitude");
    objc_msgSend(v15, "numberWithFloat:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setMetadata:", v19);

  }
  v20 = objc_alloc(MEMORY[0x1E0C94140]);
  -[NTKWorldClockTimelineEntryModel _solarGradientColors](self, "_solarGradientColors");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v20, "initWithGradientBackgroundColors:", v21);

  objc_msgSend(MEMORY[0x1E0C943A8], "templateWithTextProvider:imageProvider:", v4, v11);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = *MEMORY[0x1E0C94110];
  v28 = &unk_1E6CA1248;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setMetadata:", v24);

  objc_msgSend(v23, "setUISensitivity:", 0);
  objc_msgSend(v23, "setBackgroundDescriptor:", v22);

  return v23;
}

- (id)_smallInlineTemplate
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  if (self->_isPrivacy)
  {
    +[NTKWorldClockTimelineEntryModel _uppercaseAppNameTextProvider](NTKWorldClockTimelineEntryModel, "_uppercaseAppNameTextProvider");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKWorldClockTimelineEntryModel _globeImageProvider](NTKWorldClockTimelineEntryModel, "_globeImageProvider");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!self->_showIdealizedTime)
    {
      -[NTKWorldClockTimelineEntryModel _timeAndAbbreviationTextProvider](self, "_timeAndAbbreviationTextProvider");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = 0;
      goto LABEL_6;
    }
    -[NTKWorldClockTimelineEntryModel _abbreviationTextProvider](self, "_abbreviationTextProvider");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKWorldClockTimelineEntryModel _analogImageProvider](NTKWorldClockTimelineEntryModel, "_analogImageProvider");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v4 = (void *)v3;
LABEL_6:
  objc_msgSend(MEMORY[0x1E0C94468], "templateWithTextProvider:imageProvider:", v2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_smallModularTemplate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C94450];
  -[NTKWorldClockTimelineEntryModel _abbreviationTextProvider](self, "_abbreviationTextProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKWorldClockTimelineEntryModel _timeTextProvider](self, "_timeTextProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "templateWithLine1TextProvider:line2TextProvider:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_largeModularTemplate
{
  void *v2;
  void *v3;
  void *v5;
  void *v6;

  if (self->_isPrivacy)
  {
    +[NTKWorldClockTimelineEntryModel _genericPrivacyRedactionTextProvider](NTKWorldClockTimelineEntryModel, "_genericPrivacyRedactionTextProvider");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKWorldClockTimelineEntryModel _genericPrivacyRedactionTextProvider](NTKWorldClockTimelineEntryModel, "_genericPrivacyRedactionTextProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKWorldClockTimelineEntryModel _genericPrivacyRedactionTextProvider](NTKWorldClockTimelineEntryModel, "_genericPrivacyRedactionTextProvider");
  }
  else
  {
    -[NTKWorldClockTimelineEntryModel _cityNameTextProvider](self, "_cityNameTextProvider");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKWorldClockTimelineEntryModel _timeAndDayOffsetTextProvider](self, "_timeAndDayOffsetTextProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKWorldClockTimelineEntryModel _differenceTextProvider](self, "_differenceTextProvider");
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C943F8], "templateWithHeaderTextProvider:body1TextProvider:body2TextProvider:", v2, v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_circularSmallTemplate
{
  void *v2;
  void *v4;
  void *v5;

  if (self->_isPrivacy)
  {
    +[NTKWorldClockTimelineEntryModel _genericPrivacyRedactionTextProvider](NTKWorldClockTimelineEntryModel, "_genericPrivacyRedactionTextProvider");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKWorldClockTimelineEntryModel _genericPrivacyRedactionTextProvider](NTKWorldClockTimelineEntryModel, "_genericPrivacyRedactionTextProvider");
  }
  else
  {
    -[NTKWorldClockTimelineEntryModel _abbreviationTextProvider](self, "_abbreviationTextProvider");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKWorldClockTimelineEntryModel _timeTextProvider](self, "_timeTextProvider");
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C941D8], "templateWithLine1TextProvider:line2TextProvider:", v2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_circularMediumTemplate
{
  void *v2;
  void *v4;
  void *v5;

  if (self->_isPrivacy)
  {
    +[NTKWorldClockTimelineEntryModel _genericPrivacyRedactionTextProvider](NTKWorldClockTimelineEntryModel, "_genericPrivacyRedactionTextProvider");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKWorldClockTimelineEntryModel _genericPrivacyRedactionTextProvider](NTKWorldClockTimelineEntryModel, "_genericPrivacyRedactionTextProvider");
  }
  else
  {
    -[NTKWorldClockTimelineEntryModel _abbreviationTextProvider](self, "_abbreviationTextProvider");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKWorldClockTimelineEntryModel _timeTextProvider](self, "_timeTextProvider");
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C94198], "templateWithLine1TextProvider:line2TextProvider:", v2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_extraLargeTemplate
{
  void *v2;
  void *v4;
  void *v5;

  if (self->_isPrivacy)
  {
    +[NTKWorldClockTimelineEntryModel _genericPrivacyRedactionTextProvider](NTKWorldClockTimelineEntryModel, "_genericPrivacyRedactionTextProvider");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKWorldClockTimelineEntryModel _genericPrivacyRedactionTextProvider](NTKWorldClockTimelineEntryModel, "_genericPrivacyRedactionTextProvider");
  }
  else
  {
    -[NTKWorldClockTimelineEntryModel _abbreviationTextProvider](self, "_abbreviationTextProvider");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKWorldClockTimelineEntryModel _timeTextProvider](self, "_timeTextProvider");
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C94230], "templateWithLine1TextProvider:line2TextProvider:", v2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_largeInlineTemplate
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_isPrivacy)
  {
    +[NTKWorldClockTimelineEntryModel _uppercaseAppNameTextProvider](NTKWorldClockTimelineEntryModel, "_uppercaseAppNameTextProvider");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKWorldClockTimelineEntryModel _globeImageProvider](NTKWorldClockTimelineEntryModel, "_globeImageProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NTKWorldClockTimelineEntryModel _timeAndCityNameOffsetTextProvider](self, "_timeAndCityNameOffsetTextProvider");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C94460], "templateWithTextProvider:imageProvider:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_graphicCornerTemplate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v7;
  void *v8;

  if (self->_isPrivacy)
  {
    +[NTKWorldClockTimelineEntryModel _uppercaseAppNameTextProvider](NTKWorldClockTimelineEntryModel, "_uppercaseAppNameTextProvider");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKWorldClockTimelineEntryModel _appPrimaryColor](NTKWorldClockTimelineEntryModel, "_appPrimaryColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setTintColor:", v3);

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKWorldClockTimelineEntryModel _fullColorGlobeImageProviderWithTintColor:](NTKWorldClockTimelineEntryModel, "_fullColorGlobeImageProviderWithTintColor:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C94308], "templateWithTextProvider:imageProvider:", v2, v5);
  }
  else
  {
    -[NTKWorldClockTimelineEntryModel _timeAndDifferenceOffsetTextProvider](self, "_timeAndDifferenceOffsetTextProvider");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKWorldClockTimelineEntryModel _appPrimaryColor](NTKWorldClockTimelineEntryModel, "_appPrimaryColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setTintColor:", v7);

    -[NTKWorldClockTimelineEntryModel _abbreviationTextProvider](self, "_abbreviationTextProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C94300], "templateWithInnerTextProvider:outerTextProvider:", v2, v5);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_graphicCircularMetadata
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_city, CFSTR("NTKWorldClockComplicationCityKey"));
  -[NTKWorldClockTimelineEntryModel _timeZone](self, "_timeZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("NTKWorldClockComplicationTimeZoneKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NTKWorldClockTimelineEntryModel showIdealizedTime](self, "showIdealizedTime"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("NTKWorldClockComplicationShowIdealizedTimeKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NTKWorldClockTimelineEntryModel isPrivacy](self, "isPrivacy"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("NTKWorldClockComplicationIsPrivacyKey"));

  return v3;
}

- (id)_graphicCircularTemplate
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C94268];
  -[NTKWorldClockTimelineEntryModel _graphicCircularMetadata](self, "_graphicCircularMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "templateWithMetadata:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_graphicExtraLargeCircularTemplate
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C94338];
  -[NTKWorldClockTimelineEntryModel _graphicCircularMetadata](self, "_graphicCircularMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "templateWithMetadata:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_graphicBezelTemplate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (self->_isPrivacy)
    +[NTKWorldClockTimelineEntryModel _uppercaseAppNameTextProvider](NTKWorldClockTimelineEntryModel, "_uppercaseAppNameTextProvider");
  else
    -[NTKWorldClockTimelineEntryModel _timeCityNameTimeZoneOffsetTextProvider](self, "_timeCityNameTimeZoneOffsetTextProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C94238];
  -[NTKWorldClockTimelineEntryModel _graphicCircularTemplate](self, "_graphicCircularTemplate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "templateWithCircularTemplate:textProvider:", v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_appPrimaryColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
}

+ (id)_genericPrivacyRedactionTextProvider
{
  void *v2;
  void *v3;

  NTKClockFaceLocalizedString(CFSTR("WORLDCLOCK_PRIVACY_REDACTION_TEXT"), CFSTR("--"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_uppercaseAppNameTextProvider
{
  void *v2;
  void *v3;
  void *v4;

  NTKClockFaceLocalizedString(CFSTR("WORLDCLOCK_TITLE"), CFSTR("World Clock"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedUppercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_timeTextProvider
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C94498];
  -[NTKWorldClockTimelineEntryModel _timeZone](self, "_timeZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textProviderWithTimeZone:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setDisallowBothMinutesAndDesignator:", 1);
  if (self->_showIdealizedTime)
  {
    NTKIdealizedDate();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setOverrideDate:", v6);

  }
  else
  {
    objc_msgSend(v5, "setOverrideDate:", 0);
  }
  return v5;
}

- (id)_dayOffsetTextProvider
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C94580];
  -[NTKWorldClockTimelineEntryModel _timeZoneOffset](self, "_timeZoneOffset");
  objc_msgSend(v2, "dayForOffset:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_differenceTextProvider
{
  return -[NTKWorldClockTimelineEntryModel _differenceTextProviderWithSize:andCaps:](self, "_differenceTextProviderWithSize:andCaps:", 0, 0);
}

- (id)_differenceTextProviderWithSize:(int64_t)a3 andCaps:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a4;
  v6 = (void *)MEMORY[0x1E0C94580];
  -[NTKWorldClockTimelineEntryModel _timeZoneOffset](self, "_timeZoneOffset");
  objc_msgSend(v6, "differenceForOffset:caps:suppressZero:size:", v4, 0, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_abbreviationTextProvider
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C94530];
  NTKWorldClockCityAbbreviation(self->_city);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textProviderWithText:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_cityNameTextProvider
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C94530];
  -[WorldClockCity name](self->_city, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textProviderWithText:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_timeAndDayOffsetTextProvider
{
  void *v3;
  void *v4;
  void *v5;

  -[NTKWorldClockTimelineEntryModel _timeTextProvider](self, "_timeTextProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDisallowBothMinutesAndDesignator:", 0);
  -[NTKWorldClockTimelineEntryModel _dayOffsetTextProvider](self, "_dayOffsetTextProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C94540], "textProviderWithFormat:", CFSTR("%@ %@"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_timeAndAbbreviationTextProvider
{
  void *v3;
  void *v4;
  void *v5;

  -[NTKWorldClockTimelineEntryModel _abbreviationTextProvider](self, "_abbreviationTextProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKWorldClockTimelineEntryModel _timeTextProvider](self, "_timeTextProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C94540], "textProviderWithFormat:", CFSTR("%@ %@"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_timeAndCityNameOffsetTextProvider
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[NTKWorldClockTimelineEntryModel _timeTextProvider](self, "_timeTextProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDisallowBothMinutesAndDesignator:", 0);
  v4 = (void *)MEMORY[0x1E0C94530];
  -[WorldClockCity name](self->_city, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textProviderWithText:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C94540], "textProviderWithFormat:", CFSTR("%@ %@"), v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_timeCityNameTimeZoneOffsetTextProvider
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[NTKWorldClockTimelineEntryModel _timeTextProvider](self, "_timeTextProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDisallowBothMinutesAndDesignator:", 0);
  -[NTKWorldClockTimelineEntryModel _dayOffsetTextProvider](self, "_dayOffsetTextProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKWorldClockTimelineEntryModel _differenceTextProvider](self, "_differenceTextProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NTKClockFaceLocalizedString(CFSTR("WORLD_CLOCK_BEZEL_TEXT_FORMAT"), CFSTR("%1$@ %2$@ • %3$@"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C94540], "textProviderWithFormat:", v6, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_timeAndDifferenceOffsetTextProvider
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[NTKWorldClockTimelineEntryModel _timeTextProvider](self, "_timeTextProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDisallowBothMinutesAndDesignator:", 0);
  -[NTKWorldClockTimelineEntryModel _differenceTextProviderWithSize:andCaps:](self, "_differenceTextProviderWithSize:andCaps:", 0, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUseLowercaseSmallCaps:", 1);

  objc_msgSend(MEMORY[0x1E0C94540], "textProviderWithFormat:", CFSTR("%@, %@"), v3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_timeZone
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E80];
  -[WorldClockCity timeZone](self->_city, "timeZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeZoneWithName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)_timeZoneOffset
{
  void *v2;
  uint64_t v3;
  void *v4;
  double v5;

  -[NTKWorldClockTimelineEntryModel _timeZone](self, "_timeZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "secondsFromGMT");
  objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (double)(v3 - objc_msgSend(v4, "secondsFromGMT"));

  return v5;
}

+ (id)_analogImageProvider
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  os_unfair_lock_lock((os_unfair_lock_t)&_analogImageProvider___lock);
  WeakRetained = objc_loadWeakRetained(&_analogImageProvider___cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v3 = WeakRetained;
  objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "device");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_loadWeakRetained(&_analogImageProvider___cachedDevice);
  if (v5 != v6)
  {

LABEL_5:
    objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "device");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak(&_analogImageProvider___cachedDevice, v12);

    v13 = objc_loadWeakRetained(&_analogImageProvider___cachedDevice);
    _analogImageProvider___previousCLKDeviceVersion = objc_msgSend(v13, "version");

    objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "device");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    __55__NTKWorldClockTimelineEntryModel__analogImageProvider__block_invoke();

    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "version");
  v10 = _analogImageProvider___previousCLKDeviceVersion;

  if (v9 != v10)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_analogImageProvider___lock);
  return (id)_analogImageProvider_imageProvider;
}

void __55__NTKWorldClockTimelineEntryModel__analogImageProvider__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0C94538], "symbolImageProviderWithSystemName:", CFSTR("globe"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_analogImageProvider_imageProvider;
  _analogImageProvider_imageProvider = v0;

  v2 = (void *)_analogImageProvider_imageProvider;
  +[NTKWorldClockTimelineEntryModel _appPrimaryColor](NTKWorldClockTimelineEntryModel, "_appPrimaryColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTintColor:", v3);

}

+ (id)_globeImageProvider
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  os_unfair_lock_lock((os_unfair_lock_t)&_globeImageProvider___lock);
  WeakRetained = objc_loadWeakRetained(&_globeImageProvider___cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v3 = WeakRetained;
  objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "device");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_loadWeakRetained(&_globeImageProvider___cachedDevice);
  if (v5 != v6)
  {

LABEL_5:
    objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "device");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak(&_globeImageProvider___cachedDevice, v12);

    v13 = objc_loadWeakRetained(&_globeImageProvider___cachedDevice);
    _globeImageProvider___previousCLKDeviceVersion = objc_msgSend(v13, "version");

    objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "device");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    __54__NTKWorldClockTimelineEntryModel__globeImageProvider__block_invoke();

    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "version");
  v10 = _globeImageProvider___previousCLKDeviceVersion;

  if (v9 != v10)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_globeImageProvider___lock);
  return (id)_globeImageProvider_imageProvider;
}

void __54__NTKWorldClockTimelineEntryModel__globeImageProvider__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0C94538], "symbolImageProviderWithSystemName:", CFSTR("globe"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_globeImageProvider_imageProvider;
  _globeImageProvider_imageProvider = v0;

  v2 = (void *)_globeImageProvider_imageProvider;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTintColor:", v3);

}

+ (id)_fullColorGlobeImageProviderWithTintColor:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0DC3870];
  v4 = a3;
  objc_msgSend(v3, "systemImageNamed:", CFSTR("globe"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageWithRenderingMode:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C944D8], "providerWithFullColorImage:monochromeFilterType:applyScalingAndCircularMasking:", v6, 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTintColor:", v4);

  return v7;
}

- (void)setShowIdealizedTime:(BOOL)a3
{
  self->_showIdealizedTime = a3;
}

- (id)_solarGradientColors
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  float v10;
  double v11;
  void *v12;
  void *v13;
  float v14;
  void *v15;
  void *v16;
  void *v17;

  -[NTKWorldClockTimelineEntryModel city](self, "city");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alCity");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {

    goto LABEL_5;
  }
  v5 = (void *)v4;
  -[NTKTimelineEntryModel entryDate](self, "entryDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0DC3658], "ntk_wc_defaultSolarGradientColors");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    return v17;
  }
  v7 = objc_alloc(MEMORY[0x1E0C9E3B8]);
  -[NTKWorldClockTimelineEntryModel city](self, "city");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "alCity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "latitude");
  v11 = v10;
  -[NTKWorldClockTimelineEntryModel city](self, "city");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "alCity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "longitude");
  v15 = (void *)objc_msgSend(v7, "initWithLatitude:longitude:", v11, v14);

  -[NTKTimelineEntryModel entryDate](self, "entryDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKWorldClockTimelineEntryModel _getSolarColorsForLocation:atDate:](self, "_getSolarColorsForLocation:atDate:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)_getSolarColorsForLocation:(id)a3 atDate:(id)a4
{
  id v5;
  id v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  void *v11;

  v5 = a4;
  v6 = a3;
  +[NTKSiderealDataSource reverseInterpolateBetweenCalendricalMidnights:](NTKSiderealDataSource, "reverseInterpolateBetweenCalendricalMidnights:", v5);
  v8 = v7;
  +[NTKSiderealDataSource siderealDataForLocation:atDate:useXR:](NTKSiderealDataSource, "siderealDataForLocation:atDate:useXR:", v6, v5, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  *(float *)&v10 = v8;
  objc_msgSend(v9, "gradientWithSunsetFilterForDayProgress:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (WorldClockCity)city
{
  return self->_city;
}

- (void)setCity:(id)a3
{
  objc_storeStrong((id *)&self->_city, a3);
}

- (BOOL)showIdealizedTime
{
  return self->_showIdealizedTime;
}

- (BOOL)isPrivacy
{
  return self->_isPrivacy;
}

- (void)setIsPrivacy:(BOOL)a3
{
  self->_isPrivacy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_city, 0);
}

- (void)_graphicRectangularTemplate
{
  void *v4;
  void *v5;
  void *v6;
  float v7;
  double v8;
  void *v9;
  float v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  double v16;
  __int16 v17;
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  NTKWorldClockCityAbbreviation(*(void **)(a1 + 24));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 24), "unlocalizedCityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 24), "alCity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "latitude");
  v8 = v7;
  objc_msgSend(*(id *)(a1 + 24), "alCity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "longitude");
  v11 = 138544130;
  v12 = v4;
  v13 = 2114;
  v14 = v5;
  v15 = 2048;
  v16 = v8;
  v17 = 2048;
  v18 = v10;
  _os_log_debug_impl(&dword_1B72A3000, a2, OS_LOG_TYPE_DEBUG, "[World Clock] Building graphic rectangular template for %{public}@: %{public}@ <%f, %f>.", (uint8_t *)&v11, 0x2Au);

}

@end
