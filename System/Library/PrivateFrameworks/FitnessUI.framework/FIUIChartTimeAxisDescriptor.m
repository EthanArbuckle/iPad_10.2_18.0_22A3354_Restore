@implementation FIUIChartTimeAxisDescriptor

- (FIUIChartTimeAxisDescriptor)init
{
  FIUIChartTimeAxisDescriptor *v2;
  FIUIChartTimeAxisDescriptor *v3;
  NSArray *cachedAxisLabels;
  NSArray *cachedAxisSubLabels;
  uint64_t v6;
  NSMutableArray *cachedAxisLabelColors;
  uint64_t v8;
  UIFont *labelFont;
  uint64_t v10;
  UIFont *subLabelFont;
  FIUIChartDateAnchorRule *v12;
  FIUIChartDateAnchorRule *anchorRule;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)FIUIChartTimeAxisDescriptor;
  v2 = -[FIUIChartTimeAxisDescriptor init](&v15, sel_init);
  v3 = v2;
  if (v2)
  {
    cachedAxisLabels = v2->_cachedAxisLabels;
    v2->_cachedAxisLabels = 0;

    cachedAxisSubLabels = v3->_cachedAxisSubLabels;
    v3->_cachedAxisSubLabels = 0;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    cachedAxisLabelColors = v3->_cachedAxisLabelColors;
    v3->_cachedAxisLabelColors = (NSMutableArray *)v6;

    v3->_hideClippedLabels = 0;
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 12.0);
    v8 = objc_claimAutoreleasedReturnValue();
    labelFont = v3->_labelFont;
    v3->_labelFont = (UIFont *)v8;

    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 12.0);
    v10 = objc_claimAutoreleasedReturnValue();
    subLabelFont = v3->_subLabelFont;
    v3->_subLabelFont = (UIFont *)v10;

    v12 = objc_alloc_init(FIUIChartDateAnchorRule);
    anchorRule = v3->_anchorRule;
    v3->_anchorRule = v12;

    -[FIUIChartDateAnchorRule setRoundingValue:](v3->_anchorRule, "setRoundingValue:", 3);
    -[FIUIChartDateAnchorRule setCalendarUnit:](v3->_anchorRule, "setCalendarUnit:", 32);
    -[FIUIChartTimeAxisDescriptor setTextStyle:](v3, "setTextStyle:", 4);
    -[FIUIChartTimeAxisDescriptor setSubTextStyle:](v3, "setSubTextStyle:", 4);
    v3->_timeInterval = 6;
    v3->_subTimeInterval = 6;
  }
  return v3;
}

- (void)setAxisSpacing:(id)a3
{
  NSArray *cachedAxisLabels;
  id v6;

  objc_storeStrong((id *)&self->_axisSpacing, a3);
  v6 = a3;
  cachedAxisLabels = self->_cachedAxisLabels;
  self->_cachedAxisLabels = 0;

  -[NSMutableArray removeAllObjects](self->_cachedAxisLabelColors, "removeAllObjects");
}

- (void)setSubAxisSpacing:(id)a3
{
  NSArray *cachedAxisSubLabels;
  id v6;

  objc_storeStrong((id *)&self->_subAxisSpacing, a3);
  v6 = a3;
  cachedAxisSubLabels = self->_cachedAxisSubLabels;
  self->_cachedAxisSubLabels = 0;

}

- (id)_hourMinuteFormatterWithTextStyle:(unint64_t)a3
{
  NSMutableDictionary *hourMinuteFormatters;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSMutableDictionary *v12;
  void *v13;
  void *v15;
  id v16;
  const __CFString *v17;
  uint64_t v18[2];
  uint64_t v19[2];

  hourMinuteFormatters = self->_hourMinuteFormatters;
  if (!hourMinuteFormatters)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v7 = self->_hourMinuteFormatters;
    self->_hourMinuteFormatters = v6;

    hourMinuteFormatters = self->_hourMinuteFormatters;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](hourMinuteFormatters, "objectForKeyedSubscript:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v9 = objc_alloc_init(MEMORY[0x24BDD1500]);
    objc_msgSend(v9, "setDateStyle:", 0);
    switch(a3)
    {
      case 0uLL:
      case 1uLL:
      case 3uLL:
      case 4uLL:
        v10 = v9;
        v11 = 1;
        goto LABEL_8;
      case 2uLL:
        objc_msgSend(v9, "setTimeStyle:", 1);
        objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v19[0] = 0;
        v19[1] = 0;
        v18[0] = 0;
        v18[1] = 0;
        v16 = GetFormatAndHourFieldRangesFor_ha(v15, v19, v18);
        if (v19[0] >= (unint64_t)v18[0])
          v17 = CFSTR("ah:mm");
        else
          v17 = CFSTR("h:mma");
        objc_msgSend(v9, "setDateFormat:", v17);

        break;
      case 5uLL:
        v10 = v9;
        v11 = 2;
        goto LABEL_8;
      case 6uLL:
        v10 = v9;
        v11 = 3;
LABEL_8:
        objc_msgSend(v10, "setTimeStyle:", v11);
        break;
      default:
        break;
    }
    v12 = self->_hourMinuteFormatters;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v9, v13);

  }
  return v9;
}

- (id)hourFormatter:(unint64_t)a3
{
  NSMutableDictionary *hourFormatters;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  int v20;
  const __CFString *v21;
  __CFString *v22;
  id v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  void *v27;
  NSMutableDictionary *v28;
  void *v29;
  uint64_t v31[2];
  uint64_t v32[2];

  hourFormatters = self->_hourFormatters;
  if (!hourFormatters)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v7 = self->_hourFormatters;
    self->_hourFormatters = v6;

    hourFormatters = self->_hourFormatters;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](hourFormatters, "objectForKeyedSubscript:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v9 = objc_alloc_init(MEMORY[0x24BDD1500]);
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLocale:", v10);

    v11 = objc_alloc_init(MEMORY[0x24BDD1500]);
    objc_msgSend(v9, "locale");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLocale:", v12);

    objc_msgSend(v11, "setTimeStyle:", 1);
    objc_msgSend(MEMORY[0x24BDD14A8], "alphanumericCharacterSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "mutableCopy");

    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "formUnionWithCharacterSet:", v15);

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringFromDate:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringByTrimmingCharactersInSet:", v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v18, "length"))
    {
      objc_msgSend(v18, "substringToIndex:", 1);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = &stru_24CF339D8;
    }
    v20 = _FIUICPTimeFormatIs24HourMode();
    v21 = CFSTR("h");
    if (v20 && a3 <= 7)
      v21 = off_24CF31770[a3];
    if (a3 != 1)
    {
      if (a3)
      {
        if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
        {
          objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale", v21);
          v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v32[0] = 0;
          v32[1] = 0;
          v31[0] = 0;
          v31[1] = 0;
          v23 = GetFormatAndHourFieldRangesFor_ha(v22, v32, v31);
          v24 = CFSTR("ah");
          if (a3 == 3)
            v24 = CFSTR("a h");
          v25 = CFSTR("h a");
          if (a3 != 3)
            v25 = CFSTR("ha");
          if (v32[0] >= (unint64_t)v31[0])
            v26 = v24;
          else
            v26 = v25;
          v27 = v9;
        }
        else
        {
          if (a3 == 6)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@mm a"), v21, v19);
          }
          else
          {
            if (a3 != 5 && a3 != 4)
              goto LABEL_30;
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@mm"), v21, v19);
          }
          v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v27 = v9;
          v26 = v22;
        }
        objc_msgSend(v27, "setDateFormat:", v26);

LABEL_30:
        v28 = self->_hourFormatters;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v9, v29);

        return v9;
      }
      v21 = CFSTR("a");
    }
    objc_msgSend(v9, "setDateFormat:", v21);
    goto LABEL_30;
  }
  return v9;
}

- (id)dayFormatter:(unint64_t)a3
{
  NSMutableDictionary *dayFormatters;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  void *v8;
  id v9;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;

  dayFormatters = self->_dayFormatters;
  if (!dayFormatters)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v7 = self->_dayFormatters;
    self->_dayFormatters = v6;

    dayFormatters = self->_dayFormatters;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](dayFormatters, "objectForKeyedSubscript:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v9 = objc_alloc_init(MEMORY[0x24BDD1500]);
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLocale:", v10);

    if (a3 <= 6 && ((1 << a3) & 0x73) != 0)
      objc_msgSend(v9, "setDateFormat:", CFSTR("d"));
    v11 = self->_dayFormatters;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v9, v12);

  }
  return v9;
}

- (id)weekdayFormatter:(unint64_t)a3
{
  NSMutableDictionary *weekdayFormatters;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  void *v8;
  id v9;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;

  weekdayFormatters = self->_weekdayFormatters;
  if (!weekdayFormatters)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v7 = self->_weekdayFormatters;
    self->_weekdayFormatters = v6;

    weekdayFormatters = self->_weekdayFormatters;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](weekdayFormatters, "objectForKeyedSubscript:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v9 = objc_alloc_init(MEMORY[0x24BDD1500]);
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLocale:", v10);

    if (a3 <= 6 && ((0x73u >> a3) & 1) != 0)
      objc_msgSend(v9, "setDateFormat:", off_24CF317B0[a3]);
    v11 = self->_weekdayFormatters;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v9, v12);

  }
  return v9;
}

- (id)monthFormatter:(unint64_t)a3
{
  NSMutableDictionary *monthFormatters;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  void *v8;
  id v9;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;

  monthFormatters = self->_monthFormatters;
  if (!monthFormatters)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v7 = self->_monthFormatters;
    self->_monthFormatters = v6;

    monthFormatters = self->_monthFormatters;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](monthFormatters, "objectForKeyedSubscript:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v9 = objc_alloc_init(MEMORY[0x24BDD1500]);
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLocale:", v10);

    if (a3 <= 6 && ((0x73u >> a3) & 1) != 0)
      objc_msgSend(v9, "setDateFormat:", off_24CF317E8[a3]);
    v11 = self->_monthFormatters;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v9, v12);

  }
  return v9;
}

- (id)yearFormatter:(unint64_t)a3
{
  NSMutableDictionary *yearFormatters;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  void *v8;
  id v9;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;

  yearFormatters = self->_yearFormatters;
  if (!yearFormatters)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v7 = self->_yearFormatters;
    self->_yearFormatters = v6;

    yearFormatters = self->_yearFormatters;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](yearFormatters, "objectForKeyedSubscript:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v9 = objc_alloc_init(MEMORY[0x24BDD1500]);
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLocale:", v10);

    if (a3 <= 6 && ((1 << a3) & 0x73) != 0)
      objc_msgSend(v9, "setDateFormat:", CFSTR("YYYY"));
    v11 = self->_yearFormatters;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v9, v12);

  }
  return v9;
}

- (void)setMinValue:(id)a3
{
  id v4;
  id minValue;

  v4 = a3;
  if (objc_msgSend(self->_minValue, "compare:", v4))
    -[FIUIChartTimeAxisDescriptor _clearCache](self, "_clearCache");
  minValue = self->_minValue;
  self->_minValue = v4;

}

- (void)setMaxValue:(id)a3
{
  id v4;
  id maxValue;

  v4 = a3;
  if (objc_msgSend(self->_maxValue, "compare:", v4))
    -[FIUIChartTimeAxisDescriptor _clearCache](self, "_clearCache");
  maxValue = self->_maxValue;
  self->_maxValue = v4;

}

- (void)invalidateCaches
{
  NSArray *cachedAxisLabels;
  NSArray *cachedAxisSubLabels;

  cachedAxisLabels = self->_cachedAxisLabels;
  self->_cachedAxisLabels = 0;

  cachedAxisSubLabels = self->_cachedAxisSubLabels;
  self->_cachedAxisSubLabels = 0;

  -[FIUIChartTimeAxisDescriptor _clearFormatters](self, "_clearFormatters");
}

- (void)_clearCache
{
  NSArray *cachedAxisLabels;
  NSArray *cachedAxisSubLabels;

  cachedAxisLabels = self->_cachedAxisLabels;
  self->_cachedAxisLabels = 0;

  cachedAxisSubLabels = self->_cachedAxisSubLabels;
  self->_cachedAxisSubLabels = 0;

  -[NSMutableArray removeAllObjects](self->_cachedAxisLabelColors, "removeAllObjects");
}

- (void)_clearFormatters
{
  NSMutableDictionary *hourFormatters;
  NSMutableDictionary *dayFormatters;
  NSMutableDictionary *weekdayFormatters;
  NSMutableDictionary *monthFormatters;
  NSMutableDictionary *yearFormatters;

  hourFormatters = self->_hourFormatters;
  self->_hourFormatters = 0;

  dayFormatters = self->_dayFormatters;
  self->_dayFormatters = 0;

  weekdayFormatters = self->_weekdayFormatters;
  self->_weekdayFormatters = 0;

  monthFormatters = self->_monthFormatters;
  self->_monthFormatters = 0;

  yearFormatters = self->_yearFormatters;
  self->_yearFormatters = 0;

}

- (void)_generateAxisLabels
{
  unint64_t timeInterval;
  NSArray *v4;
  NSArray *cachedAxisLabels;

  if (-[FIUIChartTimeAxisDescriptor _validateProperties](self, "_validateProperties"))
  {
    timeInterval = self->_timeInterval;
    if (timeInterval == 6)
      timeInterval = objc_msgSend((id)objc_opt_class(), "_spacingIntervalFromAxisSpacing:", self->_axisSpacing);
    -[FIUIChartTimeAxisDescriptor _labelsForSpacingInterval:withSpacing:textStyle:](self, "_labelsForSpacingInterval:withSpacing:textStyle:", timeInterval, self->_axisSpacing, self->_textStyle);
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    cachedAxisLabels = self->_cachedAxisLabels;
    self->_cachedAxisLabels = v4;
  }
  else
  {
    cachedAxisLabels = self->_cachedAxisLabels;
    self->_cachedAxisLabels = 0;
  }

}

- (void)_generateAxisSubLabels
{
  unint64_t subTimeInterval;
  NSArray *v4;
  NSArray *cachedAxisSubLabels;

  if (-[FIUIChartTimeAxisDescriptor _validateProperties](self, "_validateProperties"))
  {
    subTimeInterval = self->_subTimeInterval;
    if (subTimeInterval == 6)
      subTimeInterval = objc_msgSend((id)objc_opt_class(), "_spacingIntervalFromAxisSpacing:", self->_subAxisSpacing);
    -[FIUIChartTimeAxisDescriptor _subLabelsForSpacingInterval:withSpacing:textStyle:](self, "_subLabelsForSpacingInterval:withSpacing:textStyle:", subTimeInterval, self->_subAxisSpacing, self->_subTextStyle);
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    cachedAxisSubLabels = self->_cachedAxisSubLabels;
    self->_cachedAxisSubLabels = v4;
  }
  else
  {
    cachedAxisSubLabels = self->_cachedAxisSubLabels;
    self->_cachedAxisSubLabels = 0;
  }

}

- (BOOL)_validateProperties
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSDateComponents *axisSpacing;
  NSDateComponents *subAxisSpacing;

  -[FIUIChartTimeAxisDescriptor minValue](self, "minValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIChartTimeAxisDescriptor maxValue](self, "maxValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "compare:", v4);

  if (v5 == 1)
    goto LABEL_4;
  axisSpacing = self->_axisSpacing;
  if (axisSpacing)
  {
    if (_ZeroDateComponents(axisSpacing))
    {
LABEL_4:
      LOBYTE(axisSpacing) = 0;
      return (char)axisSpacing;
    }
    subAxisSpacing = self->_subAxisSpacing;
    if (subAxisSpacing)
      LOBYTE(axisSpacing) = !_ZeroDateComponents(subAxisSpacing);
    else
      LOBYTE(axisSpacing) = 1;
  }
  return (char)axisSpacing;
}

- (id)_labelsForSpacingInterval:(unint64_t)a3 withSpacing:(id)a4 textStyle:(unint64_t)a5
{
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  _BOOL4 forceAMPMOnFirstLabel;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  FIUIChartAxisLabel *v18;
  _BOOL8 v19;
  void *v20;
  int v21;
  UIColor **p_unhighlightedLabelColor;
  int v23;
  void *v26;
  unint64_t v27;
  id v29;
  id v30;
  void *v31;

  v29 = a4;
  v27 = a3;
  -[FIUIChartTimeAxisDescriptor _startDateFromTimeInterval:](self, "_startDateFromTimeInterval:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIChartTimeAxisDescriptor maxValue](self, "maxValue");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v30 = 0;
  if (v7 && v8)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v30 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v7;
    v10 = v7;
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    forceAMPMOnFirstLabel = self->_forceAMPMOnFirstLabel;
    v13 = objc_msgSend(v11, "component:fromDate:", 32, v10);
    if ((objc_msgSend(v10, "hk_isAfterDate:", v9) & 1) == 0)
    {
      v14 = forceAMPMOnFirstLabel;
      v15 = v13 < 12;
      do
      {
        v16 = v10;
        objc_msgSend(v11, "dateByAddingComponents:toDate:options:", v29, v10, 0, v26);
        v10 = (id)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v11, "component:fromDate:", 32, v10) < 12;
        v18 = objc_alloc_init(FIUIChartAxisLabel);
        v19 = v14 || self->_useMinMaxLabelPlacement;
        -[FIUIChartTimeAxisDescriptor _stringFromDate:withTimeInterval:textStyle:forceAMPM:](self, "_stringFromDate:withTimeInterval:textStyle:forceAMPM:", v16, v27, a5, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[FIUIChartAxisLabel setText:](v18, "setText:", v20);
        -[FIUIChartAxisLabel setLocation:](v18, "setLocation:", v16);
        -[FIUIChartAxisLabel setLabelColor:](v18, "setLabelColor:", self->_unhighlightedLabelColor);
        if (self->_useMinMaxLabelPlacement && objc_msgSend(v10, "hk_isAfterDate:", v9))
          -[FIUIChartAxisLabel setUseReversePlacement:](v18, "setUseReversePlacement:", 1);
        v21 = objc_msgSend(v10, "hk_isAfterDate:", v31);
        p_unhighlightedLabelColor = &self->_unhighlightedLabelColor;
        if (v21)
        {
          v23 = objc_msgSend(v16, "hk_isBeforeDate:", v31);
          p_unhighlightedLabelColor = &self->_unhighlightedLabelColor;
          if (v23)
          {
            -[FIUIChartAxisLabel setLabelColor:](v18, "setLabelColor:", self->_highlightedLabelColor);
            p_unhighlightedLabelColor = &self->_highlightedLabelColor;
          }
        }
        -[NSMutableArray addObject:](self->_cachedAxisLabelColors, "addObject:", *p_unhighlightedLabelColor);
        objc_msgSend(v30, "addObject:", v18);
        v14 = self->_forceAMPMOnFirstLabel && v15 != v17;

        v15 = v17;
      }
      while (!objc_msgSend(v10, "hk_isAfterDate:", v9));
    }

    v7 = v26;
  }

  return v30;
}

- (int64_t)_hourComponentFromDate:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v3 = (void *)MEMORY[0x24BDBCE48];
  v4 = a3;
  objc_msgSend(v3, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 32, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "hour");
  return v7;
}

- (id)_newSubLabelFromDate:(id)a3 withTimeInterval:(unint64_t)a4 textStyle:(unint64_t)a5
{
  id v8;
  FIUIChartAxisLabel *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v8 = a3;
  v9 = objc_alloc_init(FIUIChartAxisLabel);
  -[FIUIChartTimeAxisDescriptor _stringFromDate:withTimeInterval:textStyle:forceAMPM:](self, "_stringFromDate:withTimeInterval:textStyle:forceAMPM:", v8, a4, a5, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (self->_subAxisCapitalize)
  {
    objc_msgSend(v10, "localizedUppercaseString");
    v12 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v12;
  }
  -[FIUIChartAxisLabel setText:](v9, "setText:", v11);
  -[FIUIChartAxisLabel setLocation:](v9, "setLocation:", v8);
  -[FIUIChartAxisLabel setLabelColor:](v9, "setLabelColor:", self->_unhighlightedSubLabelColor);

  return v9;
}

- (id)_subLabelsForSpacingInterval:(unint64_t)a3 withSpacing:(id)a4 textStyle:(unint64_t)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  unint64_t v16;
  id v17;
  void *v19;

  v7 = a4;
  -[FIUIChartTimeAxisDescriptor _startDateFromTimeInterval:](self, "_startDateFromTimeInterval:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIChartTimeAxisDescriptor maxValue](self, "maxValue");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = 0;
  if (v8 && v9)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v8;
    v13 = v8;
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "hk_isAfterDate:", v10) & 1) == 0)
    {
      while (1)
      {
        v15 = v13;
        objc_msgSend(v14, "dateByAddingComponents:toDate:options:", v7, v13, 0, v19);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        if (!self->_generateSubAxisDescriptorOnlyForNoonMidnight)
          break;
        v16 = -[FIUIChartTimeAxisDescriptor _hourComponentFromDate:](self, "_hourComponentFromDate:", v15);
        if (v16 > 0x18 || ((1 << v16) & 0x1001001) == 0 || (_FIUICPTimeFormatIs24HourMode() & 1) != 0)
          goto LABEL_15;
        v17 = -[FIUIChartTimeAxisDescriptor _newSubLabelFromDate:withTimeInterval:textStyle:](self, "_newSubLabelFromDate:withTimeInterval:textStyle:", v15, a3, a5);
        if (objc_msgSend(v13, "hk_isAfterDate:", v12)
          && (objc_msgSend(v15, "hk_isBeforeDate:", v12) & 1) != 0)
        {
          goto LABEL_13;
        }
LABEL_14:
        objc_msgSend(v11, "addObject:", v17);

LABEL_15:
        if (objc_msgSend(v13, "hk_isAfterDate:", v10))
          goto LABEL_16;
      }
      v17 = -[FIUIChartTimeAxisDescriptor _newSubLabelFromDate:withTimeInterval:textStyle:](self, "_newSubLabelFromDate:withTimeInterval:textStyle:", v15, a3, a5);
      if (!objc_msgSend(v13, "hk_isAfterDate:", v12)
        || !objc_msgSend(v15, "hk_isBeforeDate:", v12))
      {
        goto LABEL_14;
      }
LABEL_13:
      objc_msgSend(v17, "setLabelColor:", self->_highlightedSubLabelColor);
      goto LABEL_14;
    }
LABEL_16:

    v8 = v19;
  }

  return v11;
}

- (id)_startDateFromTimeInterval:(unint64_t)a3
{
  void *v4;
  FIUIChartDateAnchorRule *anchorRule;
  void *v6;
  void *v7;

  -[FIUIChartTimeAxisDescriptor minValue](self, "minValue", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    anchorRule = self->_anchorRule;
    -[FIUIChartTimeAxisDescriptor minValue](self, "minValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FIUIChartDateAnchorRule generateAnchorFromDate:](anchorRule, "generateAnchorFromDate:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)_stringFromDate:(id)a3 withTimeInterval:(unint64_t)a4 textStyle:(unint64_t)a5 forceAMPM:(BOOL)a6
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  FIUIChartTimeAxisDescriptor *v17;
  unint64_t v18;

  v9 = a3;
  switch(a4)
  {
    case 0uLL:
      -[FIUIChartTimeAxisDescriptor _hourMinuteFormatterWithTextStyle:](self, "_hourMinuteFormatterWithTextStyle:", a5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    case 1uLL:
      if (a5 == 7)
      {
        objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "component:fromDate:", 32, v9);

        if (v13 == 12)
        {
          FIUIBundle(v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("NOON"), &stru_24CF339D8, CFSTR("Localizable"));
          v16 = objc_claimAutoreleasedReturnValue();
          goto LABEL_18;
        }
        v17 = self;
        v18 = 4;
      }
      else
      {
        -[FIUIChartTimeAxisDescriptor _hourComponentFromDate:](self, "_hourComponentFromDate:", v9);
        if ((a5 & 0xFFFFFFFFFFFFFFFELL) == 2 && (_FIUICPTimeFormatIs24HourMode() & 1) != 0)
        {
          v17 = self;
          v18 = 1;
        }
        else
        {
          v17 = self;
          v18 = a5;
        }
      }
      -[FIUIChartTimeAxisDescriptor hourFormatter:](v17, "hourFormatter:", v18);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:
      v15 = v10;
      objc_msgSend(v10, "stringFromDate:", v9);
      v16 = objc_claimAutoreleasedReturnValue();
LABEL_18:
      v11 = (void *)v16;

LABEL_19:
      return v11;
    case 2uLL:
      -[FIUIChartTimeAxisDescriptor weekdayFormatter:](self, "weekdayFormatter:", a5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    case 3uLL:
      -[FIUIChartTimeAxisDescriptor dayFormatter:](self, "dayFormatter:", a5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    case 4uLL:
      -[FIUIChartTimeAxisDescriptor monthFormatter:](self, "monthFormatter:", a5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    case 5uLL:
      -[FIUIChartTimeAxisDescriptor yearFormatter:](self, "yearFormatter:", a5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    default:
      v11 = 0;
      goto LABEL_19;
  }
}

+ (unint64_t)_spacingIntervalFromAxisSpacing:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v11;
  uint64_t v12;
  unint64_t v13;

  v3 = a3;
  v4 = objc_msgSend(v3, "day");
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    v5 = 0;
  else
    v5 = v4;
  v6 = objc_msgSend(v3, "weekOfYear");
  v7 = objc_msgSend(v3, "month");
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    v8 = 0;
  else
    v8 = v7;
  v9 = objc_msgSend(v3, "year");

  if ((unint64_t)(v9 - 1) <= 0x7FFFFFFFFFFFFFFDLL && !v8)
    return 5;
  v11 = (unint64_t)(v6 - 1) >= 0x7FFFFFFFFFFFFFFELL && v5 <= 0;
  v12 = 3;
  if (v11)
    v12 = 1;
  if ((unint64_t)(v5 - 1) >= 6)
    v13 = v12;
  else
    v13 = 2;
  if (v8 <= 0)
    return v13;
  else
    return 4;
}

- (id)_labelAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[FIUIChartTimeAxisDescriptor axisLabels](self, "axisLabels");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)axisLabels
{
  NSArray *cachedAxisLabels;

  cachedAxisLabels = self->_cachedAxisLabels;
  if (!cachedAxisLabels)
  {
    -[FIUIChartTimeAxisDescriptor _generateAxisLabels](self, "_generateAxisLabels");
    cachedAxisLabels = self->_cachedAxisLabels;
  }
  return cachedAxisLabels;
}

- (unint64_t)numLabels
{
  void *v2;
  unint64_t v3;

  -[FIUIChartTimeAxisDescriptor axisLabels](self, "axisLabels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)positionForLabelAtIndex:(unint64_t)a3
{
  void *v3;
  void *v4;

  -[FIUIChartTimeAxisDescriptor _labelAtIndex:](self, "_labelAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)textForLabelAtIndex:(unint64_t)a3
{
  void *v3;
  void *v4;

  -[FIUIChartTimeAxisDescriptor _labelAtIndex:](self, "_labelAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)selectLabel:(BOOL)a3 atIndex:(unint64_t)a4
{
  _BOOL4 v5;
  void *v7;
  UIColor *v8;
  UIColor *v9;
  id v10;

  v5 = a3;
  if (-[FIUIChartTimeAxisDescriptor numLabels](self, "numLabels") <= a4)
  {
    v7 = 0;
  }
  else
  {
    -[FIUIChartTimeAxisDescriptor _labelAtIndex:](self, "_labelAtIndex:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = v7;
  if (v5)
  {
    objc_msgSend(v7, "setLabelColor:", self->_selectedLabelColor);
  }
  else
  {
    if (-[NSMutableArray count](self->_cachedAxisLabelColors, "count") <= a4)
    {
      v8 = self->_unhighlightedLabelColor;
    }
    else
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_cachedAxisLabelColors, "objectAtIndexedSubscript:", a4);
      v8 = (UIColor *)objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;
    objc_msgSend(v10, "setLabelColor:", v8);

  }
}

- (id)_subLabelAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;

  if (self->_subAxisSpacing)
  {
    -[FIUIChartTimeAxisDescriptor axisSubLabels](self, "axisSubLabels");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)axisSubLabels
{
  NSArray *cachedAxisSubLabels;
  NSArray *v4;

  if (self->_subAxisSpacing)
  {
    cachedAxisSubLabels = self->_cachedAxisSubLabels;
    if (!cachedAxisSubLabels)
    {
      -[FIUIChartTimeAxisDescriptor _generateAxisSubLabels](self, "_generateAxisSubLabels");
      cachedAxisSubLabels = self->_cachedAxisSubLabels;
    }
    v4 = cachedAxisSubLabels;
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (unint64_t)numSubLabels
{
  void *v2;
  unint64_t v3;

  if (!self->_subAxisSpacing)
    return 0;
  -[FIUIChartTimeAxisDescriptor axisSubLabels](self, "axisSubLabels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)positionForSubLabelAtIndex:(unint64_t)a3
{
  void *v3;
  void *v4;

  if (self->_subAxisSpacing)
  {
    -[FIUIChartTimeAxisDescriptor _subLabelAtIndex:](self, "_subLabelAtIndex:", a3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "location");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)textForSubLabelAtIndex:(unint64_t)a3
{
  void *v3;
  void *v4;

  if (self->_subAxisSpacing)
  {
    -[FIUIChartTimeAxisDescriptor _subLabelAtIndex:](self, "_subLabelAtIndex:", a3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "text");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (Class)expectedDataType
{
  return (Class)objc_opt_class();
}

- (id)minValue
{
  return self->_minValue;
}

- (id)maxValue
{
  return self->_maxValue;
}

- (unint64_t)labelAlignment
{
  return self->_labelAlignment;
}

- (void)setLabelAlignment:(unint64_t)a3
{
  self->_labelAlignment = a3;
}

- (unint64_t)subLabelAlignment
{
  return self->_subLabelAlignment;
}

- (void)setSubLabelAlignment:(unint64_t)a3
{
  self->_subLabelAlignment = a3;
}

- (UIFont)labelFont
{
  return self->_labelFont;
}

- (void)setLabelFont:(id)a3
{
  objc_storeStrong((id *)&self->_labelFont, a3);
}

- (UIColor)highlightedLabelColor
{
  return self->_highlightedLabelColor;
}

- (void)setHighlightedLabelColor:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedLabelColor, a3);
}

- (UIColor)unhighlightedLabelColor
{
  return self->_unhighlightedLabelColor;
}

- (void)setUnhighlightedLabelColor:(id)a3
{
  objc_storeStrong((id *)&self->_unhighlightedLabelColor, a3);
}

- (UIColor)selectedLabelColor
{
  return self->_selectedLabelColor;
}

- (void)setSelectedLabelColor:(id)a3
{
  objc_storeStrong((id *)&self->_selectedLabelColor, a3);
}

- (double)axisDescriptorPadding
{
  return self->_axisDescriptorPadding;
}

- (void)setAxisDescriptorPadding:(double)a3
{
  self->_axisDescriptorPadding = a3;
}

- (double)subAxisDescriptorPadding
{
  return self->_subAxisDescriptorPadding;
}

- (void)setSubAxisDescriptorPadding:(double)a3
{
  self->_subAxisDescriptorPadding = a3;
}

- (BOOL)hideClippedLabels
{
  return self->_hideClippedLabels;
}

- (void)setHideClippedLabels:(BOOL)a3
{
  self->_hideClippedLabels = a3;
}

- (UIFont)subLabelFont
{
  return self->_subLabelFont;
}

- (void)setSubLabelFont:(id)a3
{
  objc_storeStrong((id *)&self->_subLabelFont, a3);
}

- (UIColor)highlightedSubLabelColor
{
  return self->_highlightedSubLabelColor;
}

- (void)setHighlightedSubLabelColor:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedSubLabelColor, a3);
}

- (UIColor)unhighlightedSubLabelColor
{
  return self->_unhighlightedSubLabelColor;
}

- (void)setUnhighlightedSubLabelColor:(id)a3
{
  objc_storeStrong((id *)&self->_unhighlightedSubLabelColor, a3);
}

- (unint64_t)textStyle
{
  return self->_textStyle;
}

- (void)setTextStyle:(unint64_t)a3
{
  self->_textStyle = a3;
}

- (NSDateComponents)axisSpacing
{
  return self->_axisSpacing;
}

- (FIUIChartDateAnchorRule)anchorRule
{
  return self->_anchorRule;
}

- (void)setAnchorRule:(id)a3
{
  objc_storeStrong((id *)&self->_anchorRule, a3);
}

- (unint64_t)timeInterval
{
  return self->_timeInterval;
}

- (void)setTimeInterval:(unint64_t)a3
{
  self->_timeInterval = a3;
}

- (BOOL)forceAMPMOnFirstLabel
{
  return self->_forceAMPMOnFirstLabel;
}

- (void)setForceAMPMOnFirstLabel:(BOOL)a3
{
  self->_forceAMPMOnFirstLabel = a3;
}

- (BOOL)useMinMaxLabelPlacement
{
  return self->_useMinMaxLabelPlacement;
}

- (void)setUseMinMaxLabelPlacement:(BOOL)a3
{
  self->_useMinMaxLabelPlacement = a3;
}

- (unint64_t)subTextStyle
{
  return self->_subTextStyle;
}

- (void)setSubTextStyle:(unint64_t)a3
{
  self->_subTextStyle = a3;
}

- (NSDateComponents)subAxisSpacing
{
  return self->_subAxisSpacing;
}

- (FIUIChartDateAnchorRule)subAnchorRule
{
  return self->_subAnchorRule;
}

- (void)setSubAnchorRule:(id)a3
{
  objc_storeStrong((id *)&self->_subAnchorRule, a3);
}

- (unint64_t)subTimeInterval
{
  return self->_subTimeInterval;
}

- (void)setSubTimeInterval:(unint64_t)a3
{
  self->_subTimeInterval = a3;
}

- (BOOL)generateSubAxisDescriptorOnlyForNoonMidnight
{
  return self->_generateSubAxisDescriptorOnlyForNoonMidnight;
}

- (void)setGenerateSubAxisDescriptorOnlyForNoonMidnight:(BOOL)a3
{
  self->_generateSubAxisDescriptorOnlyForNoonMidnight = a3;
}

- (BOOL)subAxisCapitalize
{
  return self->_subAxisCapitalize;
}

- (void)setSubAxisCapitalize:(BOOL)a3
{
  self->_subAxisCapitalize = a3;
}

- (double)subAxisVerticalPadding
{
  return self->_subAxisVerticalPadding;
}

- (void)setSubAxisVerticalPadding:(double)a3
{
  self->_subAxisVerticalPadding = a3;
}

- (UIFont)labelAMPMFont
{
  return self->_labelAMPMFont;
}

- (void)setLabelAMPMFont:(id)a3
{
  objc_storeStrong((id *)&self->_labelAMPMFont, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelAMPMFont, 0);
  objc_storeStrong((id *)&self->_subAnchorRule, 0);
  objc_storeStrong((id *)&self->_subAxisSpacing, 0);
  objc_storeStrong((id *)&self->_anchorRule, 0);
  objc_storeStrong((id *)&self->_axisSpacing, 0);
  objc_storeStrong((id *)&self->_unhighlightedSubLabelColor, 0);
  objc_storeStrong((id *)&self->_highlightedSubLabelColor, 0);
  objc_storeStrong((id *)&self->_subLabelFont, 0);
  objc_storeStrong((id *)&self->_selectedLabelColor, 0);
  objc_storeStrong((id *)&self->_unhighlightedLabelColor, 0);
  objc_storeStrong((id *)&self->_highlightedLabelColor, 0);
  objc_storeStrong((id *)&self->_labelFont, 0);
  objc_storeStrong(&self->_maxValue, 0);
  objc_storeStrong(&self->_minValue, 0);
  objc_storeStrong((id *)&self->_yearFormatters, 0);
  objc_storeStrong((id *)&self->_monthFormatters, 0);
  objc_storeStrong((id *)&self->_dayFormatters, 0);
  objc_storeStrong((id *)&self->_weekdayFormatters, 0);
  objc_storeStrong((id *)&self->_hourFormatters, 0);
  objc_storeStrong((id *)&self->_hourMinuteFormatters, 0);
  objc_storeStrong((id *)&self->_cachedAxisLabelColors, 0);
  objc_storeStrong((id *)&self->_cachedAxisSubLabels, 0);
  objc_storeStrong((id *)&self->_cachedAxisLabels, 0);
}

@end
