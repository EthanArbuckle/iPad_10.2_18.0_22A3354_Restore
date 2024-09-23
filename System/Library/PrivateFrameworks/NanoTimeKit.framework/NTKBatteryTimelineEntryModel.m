@implementation NTKBatteryTimelineEntryModel

- (id)templateForComplicationFamily:(int64_t)a3
{
  void *v5;
  id v6;
  id v7;

  v5 = 0;
  switch(a3)
  {
    case 0:
    case 2:
    case 4:
    case 7:
      v6 = -[NTKBatteryTimelineEntryModel _newBatteryTemplateForFamily:](self, "_newBatteryTemplateForFamily:", a3);
      goto LABEL_9;
    case 3:
      v6 = -[NTKBatteryTimelineEntryModel _newUtilitarianLargeTemplate](self, "_newUtilitarianLargeTemplate");
      goto LABEL_9;
    case 6:
      v6 = -[NTKBatteryTimelineEntryModel _newUtilitarianSmallFlatTemplate](self, "_newUtilitarianSmallFlatTemplate");
      goto LABEL_9;
    case 8:
      -[NTKBatteryTimelineEntryModel _signatureCornerTemplate](self, "_signatureCornerTemplate");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 9:
      -[NTKBatteryTimelineEntryModel _signatureBezelTemplate](self, "_signatureBezelTemplate");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 10:
      -[NTKBatteryTimelineEntryModel _signatureCircularTemplate](self, "_signatureCircularTemplate");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 12:
      -[NTKBatteryTimelineEntryModel _graphicExtraLargeCircularTemplate](self, "_graphicExtraLargeCircularTemplate");
      v6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
      v5 = v6;
      break;
    default:
      break;
  }
  if (*MEMORY[0x1E0C93E90] == a3)
  {
    v7 = -[NTKBatteryTimelineEntryModel _newBatteryTemplateForFamily:](self, "_newBatteryTemplateForFamily:", a3);

    v5 = v7;
  }
  return v5;
}

- (id)_newUtilitarianSmallFlatTemplate
{
  void *v2;
  void *v3;
  void *v4;

  -[NTKBatteryTimelineEntryModel level](self, "level");
  +[NTKRing fillFractionStringWithSymbolForFillFraction:](NTKRing, "fillFractionStringWithSymbolForFillFraction:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C94530], "finalizedTextProviderWithText:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C94468], "templateWithTextProvider:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finalize");

  return v4;
}

- (id)_newUtilitarianLargeTemplate
{
  double v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v15[5];
  id v16;

  *(float *)&v2 = self->_level;
  +[NTKRing fillFractionStringWithSymbolForFillFraction:](NTKRing, "fillFractionStringWithSymbolForFillFraction:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKBatteryUtilities chargingStringForState:](NTKBatteryUtilities, "chargingStringForState:", self->_state);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uppercaseStringWithLocale:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  NTKClockFaceLocalizedString(CFSTR("BATTERY_FORMAT"), CFSTR("%@ %@"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v8, v4, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0C94500];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __60__NTKBatteryTimelineEntryModel__newUtilitarianLargeTemplate__block_invoke;
  v15[3] = &unk_1E6BD6BD8;
  v15[4] = self;
  v16 = v4;
  v11 = v4;
  objc_msgSend(v10, "textProviderWithText:overrideBlock:", v9, v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C94460], "templateWithTextProvider:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __60__NTKBatteryTimelineEntryModel__newUtilitarianLargeTemplate__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (a3)
  {
    v9 = 0;
  }
  else
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v7);
    objc_msgSend(*(id *)(a1 + 32), "_levelTintColor");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
    {
      v20 = *MEMORY[0x1E0DC1140];
      v21[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v7, "rangeOfString:", *(_QWORD *)(a1 + 40));
      objc_msgSend(v9, "setAttributes:range:", v12, v13, v14);

    }
    v18 = *MEMORY[0x1E0DC1138];
    objc_msgSend(v8, "font");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAttributes:range:", v16, 0, objc_msgSend(v7, "length"));

  }
  return v9;
}

- (id)_newBatteryTemplateForFamily:(int64_t)a3
{
  void *v5;
  void *v6;
  float v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0C94168];
  -[NTKBatteryTimelineEntryModel _ringTextProvider](self, "_ringTextProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKBatteryTimelineEntryModel level](self, "level");
  objc_msgSend(v5, "templateWithFamily:textProvider:level:charging:", a3, v6, +[NTKBatteryUtilities chargingForState:](NTKBatteryUtilities, "chargingForState:", -[NTKBatteryTimelineEntryModel state](self, "state")), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_signatureCornerTemplate
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[NTKBatteryTimelineEntryModel _levelTintColor](self, "_levelTintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  v7 = (void *)MEMORY[0x1E0C94520];
  -[NTKBatteryTimelineEntryModel level](self, "level");
  objc_msgSend(v7, "gaugeProviderWithStyle:gaugeColor:fillFraction:", 1, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKBatteryTimelineEntryModel level](self, "level");
  +[NTKRing fillFractionStringWithSymbolForFillFraction:](NTKRing, "fillFractionStringWithSymbolForFillFraction:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C942D8], "templateWithGaugeProvider:outerTextProvider:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_signatureCircularTemplate
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[NTKBatteryTimelineEntryModel _levelTintColor](self, "_levelTintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  v7 = (void *)MEMORY[0x1E0C94520];
  -[NTKBatteryTimelineEntryModel level](self, "level");
  objc_msgSend(v7, "gaugeProviderWithStyle:gaugeColor:fillFraction:", 1, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKBatteryTimelineEntryModel level](self, "level");
  +[NTKRing fillFractionStringForFillFraction:](NTKRing, "fillFractionStringForFillFraction:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C94250], "templateWithGaugeProvider:centerTextProvider:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_graphicExtraLargeCircularTemplate
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[NTKBatteryTimelineEntryModel _levelTintColor](self, "_levelTintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  v7 = (void *)MEMORY[0x1E0C94520];
  -[NTKBatteryTimelineEntryModel level](self, "level");
  objc_msgSend(v7, "gaugeProviderWithStyle:gaugeColor:fillFraction:", 1, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKBatteryTimelineEntryModel level](self, "level");
  +[NTKRing fillFractionStringForFillFraction:](NTKRing, "fillFractionStringForFillFraction:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C94320], "templateWithGaugeProvider:centerTextProvider:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_signatureBezelTemplate
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C94238];
  -[NTKBatteryTimelineEntryModel _signatureCircularTemplate](self, "_signatureCircularTemplate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "templateWithCircularTemplate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_levelTintColor
{
  int v3;
  int v4;
  int64_t v5;
  double v6;

  -[NTKBatteryTimelineEntryModel level](self, "level");
  v4 = v3;
  v5 = -[NTKBatteryTimelineEntryModel state](self, "state");
  LODWORD(v6) = v4;
  return +[NTKBatteryUtilities colorForLevel:andState:](NTKBatteryUtilities, "colorForLevel:andState:", v5, v6);
}

- (id)_ringTextProvider
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C94530];
  -[NTKBatteryTimelineEntryModel level](self, "level");
  +[NTKRing fillFractionStringForFillFraction:](NTKRing, "fillFractionStringForFillFraction:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textProviderWithText:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (float)level
{
  return self->_level;
}

- (void)setLevel:(float)a3
{
  self->_level = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

@end
