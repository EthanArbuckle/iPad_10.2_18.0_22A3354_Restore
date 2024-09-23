@implementation _MKLocalizedHoursBuilder

+ (id)testGetMonthAndDayFormatter
{
  return (id)_MergedGlobals_160;
}

+ (id)testGetDayOfWeekFormatterFull
{
  return (id)qword_1ECE2DC90;
}

+ (id)testGetDayOfWeekFormatterShort
{
  return (id)qword_1ECE2DC98;
}

+ (id)testGetHoursFormatter
{
  return (id)qword_1ECE2DCA0;
}

+ (id)localizedHoursStringNormalHours
{
  return _MKLocalizedStringFromThisBundle(CFSTR("Normal Hours"));
}

+ (id)localizedHoursStringSpecialHours
{
  return _MKLocalizedStringFromThisBundle(CFSTR("Special Hours"));
}

+ (id)hoursDelimeter
{
  return _MKLocalizedStringFromThisBundle(CFSTR(", "));
}

+ (id)localizedHoursDayRangeString:(id)a3
{
  id v3;
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

  v3 = a3;
  objc_msgSend(v3, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "endDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)MEMORY[0x1E0CB3940];
    if (v5)
    {
      _MKLocalizedStringFromThisBundle(CFSTR("Placecard Full Hours Weekday Range"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)_MergedGlobals_160;
      objc_msgSend(v3, "startDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringFromDate:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)_MergedGlobals_160;
      objc_msgSend(v3, "endDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringFromDate:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", v7, v10, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      _MKLocalizedStringFromThisBundle(CFSTR("Placecard Full Hours Starting Day"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)_MergedGlobals_160;
      objc_msgSend(v3, "startDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringFromDate:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", v7, v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (_MKLocalizedHoursBuilder)initWithBusinessHours:(id)a3 timeZone:(id)a4 localizedHoursStringOptions:(unint64_t)a5
{
  return -[_MKLocalizedHoursBuilder initWithBusinessHours:timeZone:localizedHoursStringOptions:conciseStyle:openAt:](self, "initWithBusinessHours:timeZone:localizedHoursStringOptions:conciseStyle:openAt:", a3, a4, a5, 0, 0);
}

- (_MKLocalizedHoursBuilder)initWithBusinessHours:(id)a3 timeZone:(id)a4 localizedHoursStringOptions:(unint64_t)a5 conciseStyle:(BOOL)a6 openAt:(id)a7
{
  id v13;
  id v14;
  id v15;
  _MKLocalizedHoursBuilder *v16;
  _MKLocalizedHoursBuilder *v17;
  NSDate *v18;
  uint64_t v19;
  unint64_t v20;
  NSDate *compareDate;
  objc_super v23;

  v13 = a3;
  v14 = a4;
  v15 = a7;
  v23.receiver = self;
  v23.super_class = (Class)_MKLocalizedHoursBuilder;
  v16 = -[_MKLocalizedHoursBuilder init](&v23, sel_init);
  v17 = v16;
  if (v16)
  {
    -[_MKLocalizedHoursBuilder _commonInit](v16, "_commonInit");
    v17->_isUsingConciseStyle = a6;
    objc_storeStrong((id *)&v17->_openAt, a7);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v18 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(MEMORY[0x1E0D271D0], "_geoMapItemOpeningHoursOptionsForBusinessHours:compareDate:timeZone:", v13, v18, v14);
    if (!v14 || (v20 = v19, (v19 & 1) != 0))
    {
      -[_MKLocalizedHoursBuilder _resetLocalizedBuilder:](v17, "_resetLocalizedBuilder:", v14 == 0);

    }
    else
    {
      objc_storeStrong((id *)&v17->_operatingHours, a3);
      v17->_geoMapItemOpeningHourOptions = v20;
      v17->_localizedHoursStringOptions = a5;
      compareDate = v17->_compareDate;
      v17->_compareDate = v18;

      -[_MKLocalizedHoursBuilder setTimeZone:](v17, "setTimeZone:", v14);
    }
  }

  return v17;
}

- (_MKLocalizedHoursBuilder)initWithMapItem:(id)a3 localizedHoursStringOptions:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _MKLocalizedHoursBuilder *v10;

  v6 = a3;
  objc_msgSend(v6, "_businessHours");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[_MKLocalizedHoursBuilder initWithBusinessHours:timeZone:localizedHoursStringOptions:conciseStyle:openAt:](self, "initWithBusinessHours:timeZone:localizedHoursStringOptions:conciseStyle:openAt:", v8, v9, a4, 0, 0);
  return v10;
}

- (_MKLocalizedHoursBuilder)initWithMapItem:(id)a3 localizedHoursStringOptions:(unint64_t)a4 conciseStyle:(BOOL)a5 openAt:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _MKLocalizedHoursBuilder *v15;

  v6 = a5;
  v10 = a6;
  v11 = a3;
  objc_msgSend(v11, "_businessHours");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndex:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeZone");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[_MKLocalizedHoursBuilder initWithBusinessHours:timeZone:localizedHoursStringOptions:conciseStyle:openAt:](self, "initWithBusinessHours:timeZone:localizedHoursStringOptions:conciseStyle:openAt:", v13, v14, a4, v6, v10);
  return v15;
}

- (_MKLocalizedHoursBuilder)initWithMapItemForMessageForBusiness:(id)a3 localizedHoursStringOptions:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _MKLocalizedHoursBuilder *v13;

  v6 = a3;
  objc_msgSend(v6, "_geoMapItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_messageLink");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "messageBusinessHours");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_geoMapItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "_messageLink");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeZone");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[_MKLocalizedHoursBuilder initWithBusinessHours:timeZone:localizedHoursStringOptions:conciseStyle:openAt:](self, "initWithBusinessHours:timeZone:localizedHoursStringOptions:conciseStyle:openAt:", v9, v12, a4, 0, 0);

  return v13;
}

- (void)_commonInit
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39___MKLocalizedHoursBuilder__commonInit__block_invoke;
  block[3] = &unk_1E20D7D98;
  block[4] = self;
  if (onceToken != -1)
    dispatch_once(&onceToken, block);
}

- (void)_resetLocalizedBuilder:(BOOL)a3
{
  _BOOL8 v3;
  NSTimeZone *timeZone;
  GEOBusinessHours *operatingHours;
  UIColor *v7;
  UIColor *hoursStateLabelColor;

  v3 = a3;
  *(_OWORD *)&self->_geoMapItemOpeningHourOptions = xmmword_18B2A9880;
  timeZone = self->_timeZone;
  self->_timeZone = 0;

  operatingHours = self->_operatingHours;
  self->_operatingHours = 0;

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v7 = (UIColor *)objc_claimAutoreleasedReturnValue();
  hoursStateLabelColor = self->_hoursStateLabelColor;
  self->_hoursStateLabelColor = v7;

  self->_state = 0;
  -[_MKLocalizedHoursBuilder _resetLocalizedStrings:](self, "_resetLocalizedStrings:", v3);
}

- (void)_resetLocalizedStrings:(BOOL)a3
{
  NSString *localizedOpenState;
  NSString *localizedOperatingHours;

  localizedOpenState = self->_localizedOpenState;
  self->_localizedOpenState = (NSString *)&stru_1E20DFC00;

  localizedOperatingHours = self->_localizedOperatingHours;
  self->_localizedOperatingHours = (NSString *)&stru_1E20DFC00;

}

- (void)setTimeZone:(id)a3
{
  id v5;

  v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)&self->_timeZone, a3);
    objc_msgSend((id)_MergedGlobals_160, "setTimeZone:", self->_timeZone);
    objc_msgSend((id)qword_1ECE2DC90, "setTimeZone:", v5);
    objc_msgSend((id)qword_1ECE2DC98, "setTimeZone:", v5);
    objc_msgSend((id)qword_1ECE2DCA0, "setTimeZone:", v5);
    -[_MKLocalizedHoursBuilder _updateLocalizedString](self, "_updateLocalizedString");
  }
  else
  {
    -[_MKLocalizedHoursBuilder _resetLocalizedBuilder:](self, "_resetLocalizedBuilder:", 1);
  }

}

- (void)setGeoMapItemOpeningHourOptions:(unint64_t)a3
{
  if (self->_geoMapItemOpeningHourOptions != a3)
  {
    self->_geoMapItemOpeningHourOptions = a3;
    -[_MKLocalizedHoursBuilder _updateLocalizedString](self, "_updateLocalizedString");
  }
}

- (void)setLocalizedHoursStringOptions:(unint64_t)a3
{
  if (self->_localizedHoursStringOptions != a3)
  {
    self->_localizedHoursStringOptions = a3;
    -[_MKLocalizedHoursBuilder _updateLocalizedString](self, "_updateLocalizedString");
  }
}

- (void)setOperatingHours:(id)a3
{
  GEOBusinessHours *v5;
  GEOBusinessHours *v6;

  v5 = (GEOBusinessHours *)a3;
  if (self->_operatingHours != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_operatingHours, a3);
    self->_geoMapItemOpeningHourOptions = objc_msgSend(MEMORY[0x1E0D271D0], "_geoMapItemOpeningHoursOptionsForBusinessHours:compareDate:timeZone:", self->_operatingHours, self->_compareDate, self->_timeZone);
    -[_MKLocalizedHoursBuilder _updateLocalizedString](self, "_updateLocalizedString");
    v5 = v6;
  }

}

- (NSString)localizedOperatingHours
{
  NSString *localizedOperatingHours;

  localizedOperatingHours = self->_localizedOperatingHours;
  if (!localizedOperatingHours)
  {
    -[_MKLocalizedHoursBuilder _updateLocalizedString](self, "_updateLocalizedString");
    localizedOperatingHours = self->_localizedOperatingHours;
  }
  return localizedOperatingHours;
}

- (NSString)localizedOpenState
{
  __CFString *localizedOpenState;

  if (!self->_localizedOpenState)
    -[_MKLocalizedHoursBuilder _updateLocalizedString](self, "_updateLocalizedString");
  if ((self->_localizedHoursStringOptions & 0x40) != 0)
    localizedOpenState = &stru_1E20DFC00;
  else
    localizedOpenState = (__CFString *)self->_localizedOpenState;
  return (NSString *)localizedOpenState;
}

- (NSDate)compareDate
{
  NSDate *compareDate;
  NSDate *v4;
  NSDate *v5;

  compareDate = self->_compareDate;
  if (!compareDate)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v5 = self->_compareDate;
    self->_compareDate = v4;

    compareDate = self->_compareDate;
  }
  return compareDate;
}

- (UIColor)hoursStateLabelColor
{
  UIColor *hoursStateLabelColor;

  hoursStateLabelColor = self->_hoursStateLabelColor;
  if (!hoursStateLabelColor)
  {
    -[_MKLocalizedHoursBuilder _updateLocalizedString](self, "_updateLocalizedString");
    hoursStateLabelColor = self->_hoursStateLabelColor;
  }
  return hoursStateLabelColor;
}

- (void)_updateLocalizedString
{
  NSTimeZone *timeZone;
  NSString *v4;
  NSString *localizedOperatingHours;
  NSString *v6;
  NSString *localizedOpenState;

  timeZone = self->_timeZone;
  if (timeZone && self->_operatingHours && (self->_geoMapItemOpeningHourOptions & 1) == 0)
  {
    -[_MKLocalizedHoursBuilder _updateLocalizedOperatingHoursString:](self, "_updateLocalizedOperatingHoursString:", self->_localizedHoursStringOptions);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    localizedOperatingHours = self->_localizedOperatingHours;
    self->_localizedOperatingHours = v4;

    -[_MKLocalizedHoursBuilder _updateLocalizedOperatingHoursString:](self, "_updateLocalizedOperatingHoursString:", 1);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    localizedOpenState = self->_localizedOpenState;
    self->_localizedOpenState = v6;

    -[_MKLocalizedHoursBuilder updateHoursLabelColor](self, "updateHoursLabelColor");
  }
  else
  {
    -[_MKLocalizedHoursBuilder _resetLocalizedStrings:](self, "_resetLocalizedStrings:", timeZone == 0);
  }
}

- (int64_t)state
{
  if (self->_isClosedTodayAllDay || self->_isCurrentlyClosed)
    return 1;
  if (self->_isClosingSoon)
    return 4;
  if (self->_isOpeningSoon)
    return 6;
  if (self->_isPermanentlyClosed)
    return 3;
  if (self->_isTemporarilyClosed)
    return 2;
  if (self->_isOpenTodayAllDay)
    return 5;
  if (self->_isCurrentlyOpen)
    return 5;
  return 0;
}

- (id)_updateLocalizedOperatingHoursString:(unint64_t)a3
{
  int16x8_t v3;
  unint64_t geoMapItemOpeningHourOptions;
  __CFString *v5;
  char v6;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __CFString *v28;
  __CFString *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  _QWORD *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  __CFString *v42;
  uint64_t v43;
  uint64_t v44;
  __CFString *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _QWORD v59[2];
  _QWORD v60[2];
  _QWORD v61[2];
  _QWORD v62[2];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  geoMapItemOpeningHourOptions = self->_geoMapItemOpeningHourOptions;
  *(int16x4_t *)v3.i8 = vdup_n_s16(geoMapItemOpeningHourOptions);
  v3.i32[0] &= 0xFF00FFu;
  v3.i16[2] = v3.u8[4];
  v3.i16[3] = v3.u8[6];
  *(uint16x4_t *)v3.i8 = vshl_u16(*(uint16x4_t *)v3.i8, (uint16x4_t)0xFFFBFFFAFFFEFFFDLL);
  v3.i32[0] &= 0xFF01FF01;
  v3.i16[2] &= 0xFF01u;
  v3.i16[3] &= 0xFF01u;
  *(_DWORD *)&self->_isClosedTodayAllDay = vmovn_s16(v3).u32[0];
  self->_isPermanentlyClosed = (geoMapItemOpeningHourOptions & 0x80) != 0;
  self->_isTemporarilyClosed = BYTE1(geoMapItemOpeningHourOptions) & 1;
  self->_isOpenTodayAllDay = (geoMapItemOpeningHourOptions & 0x10) != 0;
  self->_isCurrentlyOpen = (geoMapItemOpeningHourOptions & 2) != 0;
  if ((geoMapItemOpeningHourOptions & 0x80) != 0)
  {
    v5 = CFSTR("Permanently Closed");
LABEL_18:
    _MKLocalizedStringFromThisBundle(v5);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  if (((geoMapItemOpeningHourOptions >> 8) & 1) != 0)
  {
    v5 = CFSTR("Temporarily Closed");
    goto LABEL_18;
  }
  v6 = a3;
  v8 = (void *)MEMORY[0x1E0D27350];
  -[_MKLocalizedHoursBuilder compareDate](self, "compareDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOBusinessHours placeDailyNormalizedHours](self->_operatingHours, "placeDailyNormalizedHours");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "getWeekdayForDate:inNormalizedHours:timeZone:", v9, v10, self->_timeZone);

  v12 = (void *)MEMORY[0x1E0D27348];
  -[GEOBusinessHours placeDailyHours](self->_operatingHours, "placeDailyHours");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v11;
  objc_msgSend(v12, "getPlaceDailyHoursForWeekday:placeDailyHours:", v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_opt_new();
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v54 = v14;
  objc_msgSend(v14, "openIntervals");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v56 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
        objc_msgSend(v21, "startDate");
        v22 = objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          v23 = (void *)v22;
          objc_msgSend(v21, "endDate");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v24)
          {
            objc_msgSend(v21, "startDate");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "addObject:", v25);

            objc_msgSend(v21, "endDate");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "addObject:", v26);

          }
        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
    }
    while (v18);
  }

  if (!MapsFeature_IsEnabled_SearchAndDiscovery() || !self->_isUsingConciseStyle)
  {
    if (self->_isClosedTodayAllDay)
    {
      if ((v6 & 0x10) == 0)
      {
        v30 = CFSTR("Closed Today");
LABEL_22:
        _MKLocalizedStringFromThisBundle(v30);
        v31 = objc_claimAutoreleasedReturnValue();
LABEL_23:
        v28 = (__CFString *)v31;
LABEL_27:
        v27 = v54;
        goto LABEL_28;
      }
LABEL_26:
      v28 = &stru_1E20DFC00;
      goto LABEL_27;
    }
    if (self->_isOpenTodayAllDay)
    {
      if ((v6 & 0x28) != 0)
        goto LABEL_26;
      _MKLocalizedStringFromThisBundle(CFSTR("Placecard Full Hours, open"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = (void *)MEMORY[0x1E0CB3940];
      if ((v6 & 4) != 0)
        v39 = (void *)qword_1ECE2DCA8;
      else
        v39 = (void *)qword_1ECE2DCB0;
      objc_msgSend(v39, "stringFromTimeInterval:", 86400.0);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "localizedStringWithFormat:", v37, v40);
      v28 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_48:
      goto LABEL_27;
    }
    if (self->_isCurrentlyClosed)
    {
      if (self->_isOpeningSoon)
      {
        if ((v6 & 1) != 0)
        {
          v30 = CFSTR("Opening Soon");
          goto LABEL_22;
        }
        if ((v6 & 2) == 0)
        {
          if (v6 < 0)
          {
            -[_MKLocalizedHoursBuilder _formattedStringForHourRangesWithStartAndEndDates:timeZone:](self, "_formattedStringForHourRangesWithStartAndEndDates:timeZone:", v15, self->_timeZone);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v32, "length");
            _MKLocalizedStringFromThisBundle(CFSTR("Opening Soon"));
            v34 = objc_claimAutoreleasedReturnValue();
            v28 = (__CFString *)v34;
            if (v33)
            {
              v62[0] = v34;
              v62[1] = v32;
              v35 = (void *)MEMORY[0x1E0C99D20];
              v36 = v62;
LABEL_75:
              objc_msgSend(v35, "arrayWithObjects:count:", v36, 2);
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              -[_MKLocalizedHoursBuilder concatenateStrings:joinedByString:](self, "concatenateStrings:joinedByString:", v50, CFSTR(" · "));
              v51 = objc_claimAutoreleasedReturnValue();

              v28 = (__CFString *)v51;
              goto LABEL_27;
            }
            goto LABEL_76;
          }
          goto LABEL_52;
        }
        -[_MKLocalizedHoursBuilder _formattedStringForHourRangesWithStartAndEndDates:timeZone:](self, "_formattedStringForHourRangesWithStartAndEndDates:timeZone:", v15, self->_timeZone);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v37, "length"))
        {
          v41 = (void *)MEMORY[0x1E0CB3940];
          v42 = CFSTR("%@, Opening Soon");
LABEL_80:
          _MKLocalizedStringFromThisBundle(v42);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "stringWithFormat:", v52, v37);
          v28 = (__CFString *)objc_claimAutoreleasedReturnValue();

          goto LABEL_48;
        }
        v45 = CFSTR("Opening Soon");
      }
      else
      {
        if ((v6 & 1) != 0)
        {
          v30 = CFSTR("Closed Now");
          goto LABEL_22;
        }
        if ((v6 & 2) == 0)
        {
          if (v6 < 0)
          {
            -[_MKLocalizedHoursBuilder _formattedStringForHourRangesWithStartAndEndDates:timeZone:](self, "_formattedStringForHourRangesWithStartAndEndDates:timeZone:", v15, self->_timeZone);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = objc_msgSend(v32, "length");
            _MKLocalizedStringFromThisBundle(CFSTR("Closed Now"));
            v47 = objc_claimAutoreleasedReturnValue();
            v28 = (__CFString *)v47;
            if (v46)
            {
              v61[0] = v47;
              v61[1] = v32;
              v35 = (void *)MEMORY[0x1E0C99D20];
              v36 = v61;
              goto LABEL_75;
            }
            goto LABEL_76;
          }
          goto LABEL_52;
        }
        -[_MKLocalizedHoursBuilder _formattedStringForHourRangesWithStartAndEndDates:timeZone:](self, "_formattedStringForHourRangesWithStartAndEndDates:timeZone:", v15, self->_timeZone);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v37, "length"))
        {
          v41 = (void *)MEMORY[0x1E0CB3940];
          v42 = CFSTR("%@, Closed");
          goto LABEL_80;
        }
        v45 = CFSTR("Closed Now");
      }
    }
    else
    {
      if (!self->_isCurrentlyOpen)
        goto LABEL_52;
      if (self->_isClosingSoon)
      {
        if ((v6 & 1) != 0)
        {
          v30 = CFSTR("Closing Soon");
          goto LABEL_22;
        }
        if ((v6 & 2) == 0)
        {
          if (v6 < 0)
          {
            -[_MKLocalizedHoursBuilder _formattedStringForHourRangesWithStartAndEndDates:timeZone:](self, "_formattedStringForHourRangesWithStartAndEndDates:timeZone:", v15, self->_timeZone);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = objc_msgSend(v32, "length");
            _MKLocalizedStringFromThisBundle(CFSTR("Closing Soon"));
            v49 = objc_claimAutoreleasedReturnValue();
            v28 = (__CFString *)v49;
            if (v48)
            {
              v60[0] = v49;
              v60[1] = v32;
              v35 = (void *)MEMORY[0x1E0C99D20];
              v36 = v60;
              goto LABEL_75;
            }
            goto LABEL_76;
          }
          if ((v6 & 8) != 0)
            goto LABEL_26;
          goto LABEL_52;
        }
        -[_MKLocalizedHoursBuilder _formattedStringForHourRangesWithStartAndEndDates:timeZone:](self, "_formattedStringForHourRangesWithStartAndEndDates:timeZone:", v15, self->_timeZone);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v37, "length"))
        {
          v41 = (void *)MEMORY[0x1E0CB3940];
          v42 = CFSTR("%@, Closing Soon");
          goto LABEL_80;
        }
        v45 = CFSTR("Closing Soon");
      }
      else
      {
        if ((v6 & 8) != 0)
          goto LABEL_26;
        if ((v6 & 1) != 0)
        {
          v30 = CFSTR("Open");
          goto LABEL_22;
        }
        if ((v6 & 2) == 0)
        {
          if (v6 < 0)
          {
            -[_MKLocalizedHoursBuilder _formattedStringForHourRangesWithStartAndEndDates:timeZone:](self, "_formattedStringForHourRangesWithStartAndEndDates:timeZone:", v15, self->_timeZone);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = objc_msgSend(v32, "length");
            _MKLocalizedStringFromThisBundle(CFSTR("Open"));
            v44 = objc_claimAutoreleasedReturnValue();
            v28 = (__CFString *)v44;
            if (v43)
            {
              v59[0] = v44;
              v59[1] = v32;
              v35 = (void *)MEMORY[0x1E0C99D20];
              v36 = v59;
              goto LABEL_75;
            }
LABEL_76:

            goto LABEL_27;
          }
LABEL_52:
          -[_MKLocalizedHoursBuilder _formattedStringForHourRangesWithStartAndEndDates:timeZone:](self, "_formattedStringForHourRangesWithStartAndEndDates:timeZone:", v15, self->_timeZone);
          v31 = objc_claimAutoreleasedReturnValue();
          goto LABEL_23;
        }
        -[_MKLocalizedHoursBuilder _formattedStringForHourRangesWithStartAndEndDates:timeZone:](self, "_formattedStringForHourRangesWithStartAndEndDates:timeZone:", v15, self->_timeZone);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v37, "length"))
        {
          v41 = (void *)MEMORY[0x1E0CB3940];
          v42 = CFSTR("%@, Open");
          goto LABEL_80;
        }
        v45 = CFSTR("Open");
      }
    }
    _MKLocalizedStringFromThisBundle(v45);
    v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_48;
  }
  v27 = v54;
  -[_MKLocalizedHoursBuilder _formatedOperatingHourString:timeZone:weekday:](self, "_formatedOperatingHourString:timeZone:weekday:", v54, self->_timeZone, v53);
  v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_28:

  return v28;
}

- (id)_formatedOperatingHourString:(id)a3 timeZone:(id)a4 weekday:(int64_t)a5
{
  id v8;
  id v9;
  __CFString *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v37;
  __CFString *v38;
  void *v39;
  void *v40;
  _MKLocalizedHoursBuilder *v41;
  void *v42;
  void *v43;
  __CFString *v45;
  __CFString *v46;
  void *v47;
  void *v48;
  void *v49;
  int64_t v50;
  id v51;
  id v52;
  id obj;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (self->_isClosedTodayAllDay)
  {
    -[_MKLocalizedHoursBuilder _findNextOperatingWeekday:](self, "_findNextOperatingWeekday:", a5);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_37;
  }
  if (self->_isOpenTodayAllDay)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    _MKLocalizedStringFromThisBundle(CFSTR("Business Hours [Open All Day]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", v12);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_36;
  }
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTimeZone:", v9);
  if (-[GEOResultRefinementTime isSelected](self->_openAt, "isSelected"))
  {
    -[GEOResultRefinementTime timeStamp](self->_openAt, "timeStamp");
    if (v13 > 0.0)
    {
      objc_msgSend(v8, "openIntervals");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "lastObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "endDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        if (-[_MKLocalizedHoursBuilder _isOpenAtClosingSoon](self, "_isOpenAtClosingSoon"))
        {
          -[_MKLocalizedHoursBuilder showClosingSoonHour:timeZone:](self, "showClosingSoonHour:timeZone:", v16, v9);
          v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (-[_MKLocalizedHoursBuilder _isCurrentTimeSingular:](self, "_isCurrentTimeSingular:", v16))
            v46 = CFSTR("Business Hours [Open till] 1:xx");
          else
            v46 = CFSTR("Business Hours [Open till]");
          _MKLocalizedStringFromThisBundle(v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = (void *)MEMORY[0x1E0CB3940];
          -[_MKLocalizedHoursBuilder _localizedTimeStringFromDate:timezone:](self, "_localizedTimeStringFromDate:timezone:", v16, v9);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "stringWithFormat:", v47, v49);
          v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
      }
      else
      {
        v10 = &stru_1E20DFC00;
      }
LABEL_35:

      goto LABEL_36;
    }
  }
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  objc_msgSend(v8, "openIntervals");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
  if (!v17)
    goto LABEL_22;
  v18 = v17;
  v54 = *(_QWORD *)v56;
  v51 = v9;
  v52 = v8;
  v50 = a5;
  while (2)
  {
    for (i = 0; i != v18; ++i)
    {
      if (*(_QWORD *)v56 != v54)
        objc_enumerationMutation(obj);
      v20 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
      -[_MKLocalizedHoursBuilder compareDate](self, "compareDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v12, "component:fromDate:", 32, v21);

      objc_msgSend(v20, "startDate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v12, "component:fromDate:", 32, v23);

      objc_msgSend(v20, "startDate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v12, "component:fromDate:", 64, v25);

      objc_msgSend(v20, "endDate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "startDate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "timeIntervalSinceDate:", v28);
      v30 = (uint64_t)(v29 + (double)(60 * v26)) / 3600;

      v31 = v30 + v24;
      objc_msgSend(v20, "endDate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v12, "component:fromDate:", 64, v32);

      -[_MKLocalizedHoursBuilder compareDate](self, "compareDate");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v12, "component:fromDate:", 64, v34);

      if (v22 >= v31 && (v22 != v31 || v35 > v33))
        continue;
      objc_msgSend(v20, "startDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "endDate");
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (self->_isOpeningSoon && v16)
      {
        v9 = v51;
        v8 = v52;
        if (-[_MKLocalizedHoursBuilder _isCurrentTimeSingular:](self, "_isCurrentTimeSingular:", v16))
          v38 = CFSTR("Business Hours [Opening Soon] 1:xx");
        else
          v38 = CFSTR("Business Hours [Opening Soon]");
      }
      else
      {
        v9 = v51;
        v8 = v52;
        if (self->_isClosingSoon && v37)
        {
          -[_MKLocalizedHoursBuilder showClosingSoonHour:timeZone:](self, "showClosingSoonHour:timeZone:", v37, v51);
          v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_34:

          goto LABEL_35;
        }
        if (self->_isCurrentlyOpen && v37)
        {
          if (-[_MKLocalizedHoursBuilder _isCurrentTimeSingular:](self, "_isCurrentTimeSingular:", v37))
            v45 = CFSTR("Business Hours [Open till] 1:xx");
          else
            v45 = CFSTR("Business Hours [Open till]");
          _MKLocalizedStringFromThisBundle(v45);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = (void *)MEMORY[0x1E0CB3940];
          v41 = self;
          v42 = v37;
          goto LABEL_33;
        }
        if (!self->_isCurrentlyClosed)
          goto LABEL_49;
        if (!v16)
        {
          a5 = v50;
          goto LABEL_23;
        }
        if (-[_MKLocalizedHoursBuilder _isCurrentTimeSingular:](self, "_isCurrentTimeSingular:", v16))
          v38 = CFSTR("Business Hours [Closed till time] 1:xx");
        else
          v38 = CFSTR("Business Hours [Closed till time]");
      }
      _MKLocalizedStringFromThisBundle(v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (void *)MEMORY[0x1E0CB3940];
      v41 = self;
      v42 = v16;
LABEL_33:
      -[_MKLocalizedHoursBuilder _localizedTimeStringFromDate:timezone:](v41, "_localizedTimeStringFromDate:timezone:", v42, v9);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "stringWithFormat:", v39, v43);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_34;
    }
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
    v9 = v51;
    v8 = v52;
    a5 = v50;
    if (v18)
      continue;
    break;
  }
LABEL_22:

  v37 = 0;
  v16 = 0;
  if (self->_isCurrentlyClosed)
  {
LABEL_23:
    -[_MKLocalizedHoursBuilder _findNextOperatingWeekday:](self, "_findNextOperatingWeekday:", a5);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_36;
  }
LABEL_49:

  v10 = &stru_1E20DFC00;
LABEL_36:

LABEL_37:
  return v10;
}

- (id)showClosingSoonHour:(id)a3 timeZone:(id)a4
{
  id v6;
  id v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  if (-[_MKLocalizedHoursBuilder _isCurrentTimeSingular:](self, "_isCurrentTimeSingular:", v7))
    v8 = CFSTR("Business Hours [Closing Soon] 1:xx");
  else
    v8 = CFSTR("Business Hours [Closing Soon]");
  _MKLocalizedStringFromThisBundle(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB3940];
  -[_MKLocalizedHoursBuilder _localizedTimeStringFromDate:timezone:](self, "_localizedTimeStringFromDate:timezone:", v7, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "stringWithFormat:", v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)_isCurrentTimeSingular:(id)a3
{
  uint64_t v3;
  id v4;
  uint64_t v5;

  v3 = qword_1ECE2DCB8;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qword_1ECE2DCB8, &__block_literal_global_76);
  v5 = objc_msgSend((id)qword_1ECE2DCC0, "component:fromDate:", 32, v4);

  return v5 == 1;
}

- (id)_localizedTimeStringFromDate:(id)a3 timezone:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  const __CFString *v12;
  void *v13;
  _QWORD block[4];
  id v16;

  v5 = a3;
  v6 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66___MKLocalizedHoursBuilder__localizedTimeStringFromDate_timezone___block_invoke;
  block[3] = &unk_1E20D7D98;
  v7 = v6;
  v16 = v7;
  if (qword_1ECE2DCE0 != -1)
    dispatch_once(&qword_1ECE2DCE0, block);
  objc_msgSend((id)qword_1ECE2DCC8, "dateFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "rangeOfString:", CFSTR("a"));

  v10 = objc_msgSend((id)qword_1ECE2DCD8, "component:fromDate:", 64, v5);
  objc_msgSend((id)qword_1ECE2DCC8, "setTimeZone:", v7);
  if (v10)
    v11 = 1;
  else
    v11 = v9 == 0x7FFFFFFFFFFFFFFFLL;
  if (v11)
    v12 = CFSTR("jmm");
  else
    v12 = CFSTR("j a");
  objc_msgSend((id)qword_1ECE2DCC8, "setLocalizedDateFormatFromTemplate:", v12);
  objc_msgSend((id)qword_1ECE2DCC8, "stringFromDate:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_findNextOperatingWeekday:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;

  -[GEOBusinessHours operatingWeekdays](self->_operatingHours, "operatingWeekdays");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v6 = a3 % 7 + 1;
    v7 = 7;
    while (1)
    {
      v8 = (void *)MEMORY[0x1E0D27348];
      -[GEOBusinessHours placeDailyHours](self->_operatingHours, "placeDailyHours");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "getPlaceDailyHoursForWeekday:placeDailyHours:", v6, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "openIntervals");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

      if (v12)
        break;

      v6 = v6 % 7 + 1;
      if (!--v7)
        goto LABEL_8;
    }

LABEL_8:
    if (qword_1ECE2DCF0 != -1)
      dispatch_once(&qword_1ECE2DCF0, &__block_literal_global_154);
    v16 = (void *)qword_1ECE2DCE8;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      _MKLocalizedStringFromThisBundle(CFSTR("Business Hours [Closed till weekday]"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v18, v14);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = &stru_1E20DFC00;
    }
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    _MKLocalizedStringFromThisBundle(CFSTR("Business Hours [Permanently Closed]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", v14);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (BOOL)_isOpenAtClosingSoon
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  BOOL isClosingSoon;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKLocalizedHoursBuilder timeZone](self, "timeZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimeZone:", v4);

  v5 = (void *)MEMORY[0x1E0D27350];
  -[_MKLocalizedHoursBuilder compareDate](self, "compareDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOBusinessHours placeDailyNormalizedHours](self->_operatingHours, "placeDailyNormalizedHours");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "getWeekdayForDate:inNormalizedHours:timeZone:", v6, v7, self->_timeZone);

  v9 = (void *)MEMORY[0x1E0D27348];
  -[GEOBusinessHours placeDailyHours](self->_operatingHours, "placeDailyHours");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "getPlaceDailyHoursForWeekday:placeDailyHours:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "openIntervals");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lastObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "endDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[_MKLocalizedHoursBuilder compareDate](self, "compareDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "components:fromDate:", 224, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "components:fromDate:", 224, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "hour");
    if (v18 < objc_msgSend(v16, "hour"))
      objc_msgSend(v17, "setHour:", objc_msgSend(v17, "hour") + 24);
    v19 = objc_msgSend(v17, "hour");
    v20 = objc_msgSend(v17, "minute");
    v21 = objc_msgSend(v16, "hour");
    v22 = (double)(v20 - objc_msgSend(v16, "minute") + 60 * (v19 - v21)) * 60.0;
    isClosingSoon = v22 < (double)-[GEOBusinessHours closingSoonThresdholdInSeconds](self->_operatingHours, "closingSoonThresdholdInSeconds");

  }
  else
  {
    isClosingSoon = self->_isClosingSoon;
  }

  return isClosingSoon;
}

- (id)_formattedStringForHourRangesWithStartAndEndDates:(id)a3 timeZone:(id)a4
{
  if ((self->_localizedHoursStringOptions & 0x100) != 0)
    objc_msgSend(MEMORY[0x1E0CB3940], "_navigation_formattedStringForHourRanges:timeZone:delimeter:", a3, a4, CFSTR("\n"));
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "_navigation_formattedStringForHourRanges:timeZone:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)updateHoursLabelColor
{
  -[_MKLocalizedHoursBuilder updateHoursLabelColorWithDefaultLabelColor:](self, "updateHoursLabelColorWithDefaultLabelColor:", 0);
}

- (void)updateHoursLabelColorWithDefaultLabelColor:(id)a3
{
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  UIColor *v9;
  void *v10;
  UIColor *v11;
  UIColor *hoursStateLabelColor;
  id v13;

  v13 = a3;
  if (!MapsFeature_IsEnabled_SearchAndDiscovery()
    || !-[GEOResultRefinementTime isSelected](self->_openAt, "isSelected")
    || (-[GEOResultRefinementTime timeStamp](self->_openAt, "timeStamp"), v4 <= 0.0)
    || -[_MKLocalizedHoursBuilder _isOpenAtClosingSoon](self, "_isOpenAtClosingSoon"))
  {
    if (self->_isOpeningSoon || self->_isClosingSoon)
    {
      v5 = (void *)MEMORY[0x1E0CEA478];
      v6 = 0.568627477;
      v7 = 1.0;
      v8 = 0.0;
LABEL_8:
      objc_msgSend(v5, "colorWithRed:green:blue:alpha:", v7, v6, v8, 1.0);
      v9 = (UIColor *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    if (self->_isClosedTodayAllDay
      || self->_isCurrentlyClosed
      || self->_isPermanentlyClosed
      || self->_isTemporarilyClosed)
    {
      v5 = (void *)MEMORY[0x1E0CEA478];
      v7 = 0.949019611;
      v6 = 0.286274523;
      v8 = 0.200000003;
      goto LABEL_8;
    }
  }
  if (!v13)
  {
    +[MKInfoCardThemeManager currentTheme](MKInfoCardThemeManager, "currentTheme");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "textColor");
    v11 = (UIColor *)objc_claimAutoreleasedReturnValue();
    hoursStateLabelColor = self->_hoursStateLabelColor;
    self->_hoursStateLabelColor = v11;

    goto LABEL_10;
  }
  v9 = (UIColor *)v13;
LABEL_9:
  v10 = self->_hoursStateLabelColor;
  self->_hoursStateLabelColor = v9;
LABEL_10:

}

- (id)formatData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _MKLocalizedHoursBuilder *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  void *v58;
  uint64_t i;
  void *v60;
  double v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  const __CFString *v84;
  uint64_t v85;
  void *v86;
  const __CFString *v87;
  void *v88;
  void *v89;
  void *v91;
  id obj;
  id v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  void *v97;
  void *v98;
  void *v99;
  uint64_t v100;
  id v101;
  void *v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  _MKLocalizedHoursBuilder *v108;
  void *v109;
  void *v110;
  uint64_t v111;
  void *v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  _QWORD v121[7];
  _QWORD v122[7];
  _QWORD v123[2];
  _BYTE v124[128];
  _BYTE v125[128];
  uint64_t v126;

  v126 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C9AA60];
  v104 = objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  v7 = (void *)objc_msgSend(v5, "mutableCopy");
  v8 = (void *)objc_msgSend(v5, "mutableCopy");
  v9 = objc_msgSend(v5, "mutableCopy");
  v10 = (void *)v9;
  if (self->_timeZone)
  {
    v98 = (void *)v9;
    v11 = self;
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTimeZone:", v11->_timeZone);
    v108 = v11;
    -[_MKLocalizedHoursBuilder compareDate](v11, "compareDate");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "components:fromDate:", 512);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = objc_msgSend(v91, "weekday");
    v117 = 0u;
    v118 = 0u;
    v119 = 0u;
    v120 = 0u;
    obj = v4;
    v99 = v8;
    v100 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v117, v125, 16);
    v103 = v12;
    if (v100)
    {
      v94 = *(_QWORD *)v118;
      v93 = v4;
      v102 = v6;
      v95 = v7;
      do
      {
        v13 = 0;
        do
        {
          v14 = (void *)v104;
          if (*(_QWORD *)v118 != v94)
            objc_enumerationMutation(obj);
          v15 = v4;
          v16 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * v13);
          objc_msgSend(v12, "components:fromDate:", 28, v97);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setDay:", objc_msgSend(v16, "dayOfWeekRange") - v96 + objc_msgSend(v17, "day"));
          objc_msgSend(v16, "dayOfWeekRange");
          v19 = v18;
          v105 = v13;
          v106 = v17;
          if (v18 == 1)
          {
            v20 = (void *)qword_1ECE2DC90;
            objc_msgSend(v12, "dateFromComponents:", v17);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "stringFromDate:", v21);
            v107 = objc_claimAutoreleasedReturnValue();

            v22 = (void *)qword_1ECE2DC98;
            objc_msgSend(v12, "dateFromComponents:", v17);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "stringFromDate:", v23);
            v24 = (id)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            objc_msgSend(v16, "dayOfWeekRange");
            if (v25 == 7)
            {
              _MKLocalizedStringFromThisBundle(CFSTR("Every Day"));
              v24 = (id)objc_claimAutoreleasedReturnValue();
              v107 = (uint64_t)v24;
            }
            else
            {
              v26 = (id)qword_1ECE2DC90;
              v110 = (void *)objc_msgSend(v17, "copy");
              v27 = (void *)objc_msgSend(v110, "copy");
              objc_msgSend(v16, "dayOfWeekRange");
              objc_msgSend(v27, "setDay:", v28 + objc_msgSend(v27, "day") - 1);
              objc_msgSend(v103, "dateFromComponents:", v110);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "stringFromDate:", v29);
              v30 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v103, "dateFromComponents:", v27);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "stringFromDate:", v31);
              v32 = objc_claimAutoreleasedReturnValue();

              v33 = (void *)MEMORY[0x1E0CB3940];
              _MKLocalizedStringFromThisBundle(CFSTR("Placecard Full Hours Weekday Range"));
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = (void *)v32;
              objc_msgSend(v33, "stringWithFormat:", v34, v30, v32);
              v107 = objc_claimAutoreleasedReturnValue();

              v36 = (id)qword_1ECE2DC98;
              objc_msgSend(v103, "dateFromComponents:", v110);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "stringFromDate:", v37);
              v38 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v103, "dateFromComponents:", v27);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "stringFromDate:", v39);
              v40 = (void *)objc_claimAutoreleasedReturnValue();

              v41 = (void *)MEMORY[0x1E0CB3940];
              _MKLocalizedStringFromThisBundle(CFSTR("Placecard Full Hours Weekday Range"));
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "stringWithFormat:", v42, v38, v40);
              v24 = (id)objc_claimAutoreleasedReturnValue();

              v6 = v102;
              v14 = (void *)v104;
              v15 = v93;

            }
          }
          objc_msgSend(v14, "addObject:", v107);
          objc_msgSend(v6, "addObject:", v24);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v19 == 1);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "addObject:", v43);

          v44 = (void *)MEMORY[0x1E0C99DE8];
          objc_msgSend(v16, "openIntervals");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "arrayWithCapacity:", objc_msgSend(v45, "count"));
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          v47 = (void *)MEMORY[0x1E0C99DE8];
          objc_msgSend(v16, "openIntervals");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "arrayWithCapacity:", objc_msgSend(v48, "count"));
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v16, "openIntervals");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = objc_msgSend(v50, "count");

          v52 = (void *)v107;
          v53 = v24;
          if (v51)
          {
            v112 = v49;
            v109 = v46;
            v101 = v24;
            v115 = 0u;
            v116 = 0u;
            v113 = 0u;
            v114 = 0u;
            objc_msgSend(v16, "openIntervals");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v113, v124, 16);
            if (v55)
            {
              v56 = v55;
              v111 = *(_QWORD *)v114;
              v57 = 0x1E0CB3000uLL;
              v58 = v109;
              do
              {
                for (i = 0; i != v56; ++i)
                {
                  if (*(_QWORD *)v114 != v111)
                    objc_enumerationMutation(v54);
                  v60 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * i);
                  objc_msgSend(v60, "duration");
                  if (v61 == 86400.0)
                  {
                    _MKLocalizedStringFromThisBundle(CFSTR("Placecard Full Hours, open"));
                    v62 = (void *)objc_claimAutoreleasedReturnValue();
                    v63 = *(void **)(v57 + 2368);
                    objc_msgSend((id)qword_1ECE2DCB0, "stringFromTimeInterval:", 86400.0);
                    v64 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v63, "localizedStringWithFormat:", v62, v64);
                    v65 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v58, "addObject:", v65);
                    v66 = *(void **)(v57 + 2368);
                    objc_msgSend((id)qword_1ECE2DCA8, "stringFromTimeInterval:", 86400.0);
                    v67 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v66, "localizedStringWithFormat:", v62, v67);
                    v68 = (void *)objc_claimAutoreleasedReturnValue();

                    v69 = v112;
                    objc_msgSend(v112, "addObject:", v68);
                  }
                  else
                  {
                    v70 = (void *)qword_1ECE2DCA0;
                    objc_msgSend(v60, "startDate");
                    v71 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v70, "stringFromDate:", v71);
                    v68 = (void *)objc_claimAutoreleasedReturnValue();

                    v72 = (void *)qword_1ECE2DCA0;
                    objc_msgSend(v60, "endDate");
                    v73 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v72, "stringFromDate:", v73);
                    v74 = (void *)objc_claimAutoreleasedReturnValue();

                    v75 = *(void **)(v57 + 2368);
                    _MKLocalizedStringFromThisBundle(CFSTR("Operating Hours Range"));
                    v76 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v75, "stringWithFormat:", v76, v68, v74);
                    v77 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v58, "addObject:", v77);
                    objc_msgSend(v60, "startDate");
                    v78 = (void *)objc_claimAutoreleasedReturnValue();
                    v123[0] = v78;
                    objc_msgSend(v60, "endDate");
                    v79 = (void *)objc_claimAutoreleasedReturnValue();
                    v123[1] = v79;
                    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v123, 2);
                    v80 = (void *)objc_claimAutoreleasedReturnValue();
                    -[_MKLocalizedHoursBuilder _formattedStringForHourRangesWithStartAndEndDates:timeZone:](v108, "_formattedStringForHourRangesWithStartAndEndDates:timeZone:", v80, v108->_timeZone);
                    v62 = (void *)objc_claimAutoreleasedReturnValue();

                    v58 = v109;
                    v57 = 0x1E0CB3000;

                    v69 = v112;
                    objc_msgSend(v112, "addObject:", v62);

                  }
                }
                v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v113, v124, 16);
              }
              while (v56);
              v15 = v93;
              v7 = v95;
              v52 = (void *)v107;
              v49 = v69;
              v53 = v101;
              v6 = v102;
            }
            else
            {
              v7 = v95;
              v53 = v24;
              v6 = v102;
              v58 = v109;
            }
          }
          else
          {
            _MKLocalizedStringFromThisBundle(CFSTR("Closed"));
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "addObject:", v54);
            objc_msgSend(v49, "addObject:", v54);
            v7 = v95;
            v58 = v46;
            v6 = v102;
          }

          objc_msgSend(v7, "addObject:", v58);
          v8 = v99;
          objc_msgSend(v99, "addObject:", v49);

          v13 = v105 + 1;
          v12 = v103;
          v4 = v15;
        }
        while (v105 + 1 != v100);
        v100 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v117, v125, 16);
      }
      while (v100);
    }

    v121[0] = CFSTR("DaysFull");
    v121[1] = CFSTR("DaysShort");
    v81 = (void *)v104;
    v122[0] = v104;
    v122[1] = v6;
    v121[2] = CFSTR("HoursFull");
    v121[3] = CFSTR("HoursShort");
    v122[2] = v7;
    v122[3] = v8;
    v121[4] = CFSTR("CurrentHours");
    -[_MKLocalizedHoursBuilder localizedOperatingHours](v108, "localizedOperatingHours");
    v82 = objc_claimAutoreleasedReturnValue();
    v83 = (void *)v82;
    if (v82)
      v84 = (const __CFString *)v82;
    else
      v84 = &stru_1E20DFC00;
    v122[4] = v84;
    v121[5] = CFSTR("CurrentOpenState");
    -[_MKLocalizedHoursBuilder localizedOpenState](v108, "localizedOpenState");
    v85 = objc_claimAutoreleasedReturnValue();
    v86 = (void *)v85;
    if (v85)
      v87 = (const __CFString *)v85;
    else
      v87 = &stru_1E20DFC00;
    v121[6] = CFSTR("SingularWeekdayIdentifier");
    v122[5] = v87;
    v122[6] = v98;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v122, v121, 7);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = (void *)objc_msgSend(v88, "mutableCopy");

    v10 = v98;
    v8 = v99;
    -[_MKLocalizedHoursBuilder calculateWidthsForData:](v108, "calculateWidthsForData:", v89);

  }
  else
  {
    v89 = 0;
    v81 = (void *)v104;
  }

  return v89;
}

- (void)calculateWidthsForData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  void *v28;
  double v29;
  double v30;
  void *v31;
  uint64_t v32;
  double v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t m;
  void *v38;
  double v39;
  double v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t n;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t ii;
  void *v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  uint64_t v90;
  _QWORD v91[3];

  v91[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v90 = *MEMORY[0x1E0CEA098];
  +[MKFontManager sharedManager](MKFontManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bodyFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v91[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v91, &v90, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("DaysFull"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v80, v89, 16);
  v9 = 0.0;
  v10 = 0.0;
  if (v8)
  {
    v11 = v8;
    v12 = *(_QWORD *)v81;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v81 != v12)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
        objc_msgSend(v14, "sizeWithAttributes:", v6);
        if (v10 <= v15)
        {
          objc_msgSend(v14, "sizeWithAttributes:", v6);
          v10 = v16;
        }
      }
      v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v80, v89, 16);
    }
    while (v11);
  }

  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  v59 = v3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("HoursFull"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v76, v88, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v77;
    v9 = 0.0;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v77 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * j);
        v72 = 0u;
        v73 = 0u;
        v74 = 0u;
        v75 = 0u;
        v23 = v22;
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v72, v87, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v73;
          do
          {
            for (k = 0; k != v25; ++k)
            {
              if (*(_QWORD *)v73 != v26)
                objc_enumerationMutation(v23);
              v28 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * k);
              objc_msgSend(v28, "sizeWithAttributes:", v6);
              if (v9 <= v29)
              {
                objc_msgSend(v28, "sizeWithAttributes:", v6);
                v9 = v30;
              }
            }
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v72, v87, 16);
          }
          while (v25);
        }

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v76, v88, 16);
    }
    while (v19);
  }

  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("DaysShort"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v68, v86, 16);
  v33 = 0.0;
  v34 = 0.0;
  if (v32)
  {
    v35 = v32;
    v36 = *(_QWORD *)v69;
    do
    {
      for (m = 0; m != v35; ++m)
      {
        if (*(_QWORD *)v69 != v36)
          objc_enumerationMutation(v31);
        v38 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * m);
        objc_msgSend(v38, "sizeWithAttributes:", v6);
        if (v34 <= v39)
        {
          objc_msgSend(v38, "sizeWithAttributes:", v6);
          v34 = v40;
        }
      }
      v35 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v68, v86, 16);
    }
    while (v35);
  }

  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("HoursShort"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v64, v85, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v65;
    v33 = 0.0;
    do
    {
      for (n = 0; n != v43; ++n)
      {
        if (*(_QWORD *)v65 != v44)
          objc_enumerationMutation(v41);
        v46 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * n);
        v60 = 0u;
        v61 = 0u;
        v62 = 0u;
        v63 = 0u;
        v47 = v46;
        v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v60, v84, 16);
        if (v48)
        {
          v49 = v48;
          v50 = *(_QWORD *)v61;
          do
          {
            for (ii = 0; ii != v49; ++ii)
            {
              if (*(_QWORD *)v61 != v50)
                objc_enumerationMutation(v47);
              v52 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * ii);
              objc_msgSend(v52, "sizeWithAttributes:", v6);
              if (v33 <= v53)
              {
                objc_msgSend(v52, "sizeWithAttributes:", v6);
                v33 = v54;
              }
            }
            v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v60, v84, 16);
          }
          while (v49);
        }

      }
      v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v64, v85, 16);
    }
    while (v43);
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setObject:forKeyedSubscript:", v55, CFSTR("DaysFullWidth"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setObject:forKeyedSubscript:", v56, CFSTR("HoursFullWidth"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v34);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setObject:forKeyedSubscript:", v57, CFSTR("DaysShortWidth"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v33);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setObject:forKeyedSubscript:", v58, CFSTR("HoursShortWidth"));

}

- (id)concatenateStrings:(id)a3 joinedByString:(id)a4
{
  id v5;
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v5 = a3;
  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62___MKLocalizedHoursBuilder_concatenateStrings_joinedByString___block_invoke;
  v12[3] = &unk_1E20D8078;
  v12[4] = &v13;
  v7 = (void (**)(_QWORD))MEMORY[0x18D778DB8](v12);
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    v7[2](v7);
  else
    dispatch_sync(MEMORY[0x1E0C80D38], v7);
  if (*((_BYTE *)v14 + 24))
  {
    objc_msgSend(v5, "reverseObjectEnumerator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allObjects");
    v9 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v9;
  }
  objc_msgSend(v5, "componentsJoinedByString:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v13, 8);
  return v10;
}

- (NSArray)AMPMSymbols
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
  objc_msgSend((id)qword_1ECE2DCA0, "AMSymbol");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    objc_msgSend((id)qword_1ECE2DCA0, "AMSymbol");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v5);

  }
  objc_msgSend((id)qword_1ECE2DCA0, "PMSymbol");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    objc_msgSend((id)qword_1ECE2DCA0, "PMSymbol");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v8);

  }
  v9 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v9;
}

- (void)setCompareDate:(id)a3
{
  objc_storeStrong((id *)&self->_compareDate, a3);
}

- (unint64_t)geoMapItemOpeningHourOptions
{
  return self->_geoMapItemOpeningHourOptions;
}

- (unint64_t)localizedHoursStringOptions
{
  return self->_localizedHoursStringOptions;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (GEOBusinessHours)operatingHours
{
  return self->_operatingHours;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operatingHours, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_compareDate, 0);
  objc_storeStrong((id *)&self->_hoursStateLabelColor, 0);
  objc_storeStrong((id *)&self->_localizedOpenState, 0);
  objc_storeStrong((id *)&self->_localizedOperatingHours, 0);
  objc_storeStrong((id *)&self->_openAt, 0);
}

@end
