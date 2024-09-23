@implementation NTKFaceSnapshotContext

+ (id)currentContext
{
  NTKFaceSnapshotContext *v2;
  void *v3;
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

  v2 = objc_alloc_init(NTKFaceSnapshotContext);
  +[CLKDate unmodifiedDate](NTKDate, "unmodifiedDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFaceSnapshotContext setDate:](v2, "setDate:", v3);

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFaceSnapshotContext setCalendar:](v2, "setCalendar:", v4);

  +[NTKLocationManager sharedLocationManager](NTKLocationManager, "sharedLocationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anyLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFaceSnapshotContext setLocation:](v2, "setLocation:", v6);

  +[NTKCustomMonogramStore sharedInstance](NTKCustomMonogramStore, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "customMonogram");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFaceSnapshotContext setMonogram:](v2, "setMonogram:", v8);

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localeIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFaceSnapshotContext setLocale:](v2, "setLocale:", v10);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", CLKLocaleIs24HourMode());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFaceSnapshotContext setUses24hTime:](v2, "setUses24hTime:", v11);

  NTKBuildVersion();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFaceSnapshotContext setBuildVersion:](v2, "setBuildVersion:", v12);

  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneDataVersion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFaceSnapshotContext setTzVersion:](v2, "setTzVersion:", v13);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", _AXSEnhanceTextLegibilityEnabled());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFaceSnapshotContext setEnhanceTextLegibilityEnabled:](v2, "setEnhanceTextLegibilityEnabled:", v14);

  NTKLunarCalendarLocaleID();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFaceSnapshotContext setLunarCalendarLocaleID:](v2, "setLunarCalendarLocaleID:", v15);

  return v2;
}

- (BOOL)calendarDateMatchesContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NTKFaceSnapshotContext _yearMonthDay](self, "_yearMonthDay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_yearMonthDay");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqual:", v6);
  return (char)v4;
}

- (BOOL)timeZoneMatchesContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  -[NTKFaceSnapshotContext calendar](self, "calendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "calendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqual:", v8))
  {
    -[NTKFaceSnapshotContext tzVersion](self, "tzVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tzVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqualToString:", v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)localeMatchesContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[NTKFaceSnapshotContext locale](self, "locale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    -[NTKFaceSnapshotContext uses24hTime](self, "uses24hTime");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uses24hTime");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToNumber:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)buildVersionMatchesContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NTKFaceSnapshotContext buildVersion](self, "buildVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "buildVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToString:", v6);
  return (char)v4;
}

- (BOOL)enhanceTextLegibilityEnabledMatchesContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NTKFaceSnapshotContext enhanceTextLegibilityEnabled](self, "enhanceTextLegibilityEnabled");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enhanceTextLegibilityEnabled");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToNumber:", v6);
  return (char)v4;
}

- (double)distanceInKilometersFromContext:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;

  v4 = a3;
  -[NTKFaceSnapshotContext location](self, "location");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = 0.0;
  if (v5)
  {
    v7 = (void *)v5;
    objc_msgSend(v4, "location");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[NTKFaceSnapshotContext location](self, "location");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "location");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "distanceFromLocation:", v10);
      v6 = v11 / 1000.0;

    }
  }

  return v6;
}

- (BOOL)locationSignificantlyDiffersFromContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  BOOL v9;
  void *v10;
  double v11;

  v4 = a3;
  -[NTKFaceSnapshotContext location](self, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(v4, "location");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v9 = 1;
LABEL_12:

      goto LABEL_13;
    }
  }
  -[NTKFaceSnapshotContext location](self, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v4, "location");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[NTKFaceSnapshotContext distanceInKilometersFromContext:](self, "distanceInKilometersFromContext:", v4);
      v9 = v8 > 50000.0;
    }
    else
    {
      v9 = 1;
    }

  }
  else
  {
    -[NTKFaceSnapshotContext distanceInKilometersFromContext:](self, "distanceInKilometersFromContext:", v4);
    v9 = v11 > 50000.0;
  }

  if (!v5)
  {
    v10 = 0;
    goto LABEL_12;
  }
LABEL_13:

  return v9;
}

- (BOOL)lunarCalendarLocaleIDMatchesContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NTKFaceSnapshotContext lunarCalendarLocaleID](self, "lunarCalendarLocaleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lunarCalendarLocaleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToString:", v6);
  return (char)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NTKFaceSnapshotContext)initWithCoder:(id)a3
{
  id v4;
  NTKFaceSnapshotContext *v5;
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
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)NTKFaceSnapshotContext;
  v5 = -[NTKFaceSnapshotContext init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Location"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceSnapshotContext setLocation:](v5, "setLocation:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Date"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceSnapshotContext setDate:](v5, "setDate:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Calendar"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceSnapshotContext setCalendar:](v5, "setCalendar:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Monogram"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceSnapshotContext setMonogram:](v5, "setMonogram:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Locale"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceSnapshotContext setLocale:](v5, "setLocale:", v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Uses24h"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceSnapshotContext setUses24hTime:](v5, "setUses24hTime:", v11);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BuildVersion"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceSnapshotContext setBuildVersion:](v5, "setBuildVersion:", v12);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TZVersion"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceSnapshotContext setTzVersion:](v5, "setTzVersion:", v13);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BoldText"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceSnapshotContext setEnhanceTextLegibilityEnabled:](v5, "setEnhanceTextLegibilityEnabled:", v14);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LunarCalendarLocaleID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceSnapshotContext setLunarCalendarLocaleID:](v5, "setLunarCalendarLocaleID:", v15);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  -[NTKFaceSnapshotContext location](self, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("Location"));

  -[NTKFaceSnapshotContext date](self, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("Date"));

  -[NTKFaceSnapshotContext calendar](self, "calendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("Calendar"));

  -[NTKFaceSnapshotContext monogram](self, "monogram");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("Monogram"));

  -[NTKFaceSnapshotContext locale](self, "locale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("Locale"));

  -[NTKFaceSnapshotContext uses24hTime](self, "uses24hTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("Uses24h"));

  -[NTKFaceSnapshotContext buildVersion](self, "buildVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("BuildVersion"));

  -[NTKFaceSnapshotContext tzVersion](self, "tzVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("TZVersion"));

  -[NTKFaceSnapshotContext enhanceTextLegibilityEnabled](self, "enhanceTextLegibilityEnabled");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("BoldText"));

  -[NTKFaceSnapshotContext lunarCalendarLocaleID](self, "lunarCalendarLocaleID");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("LunarCalendarLocaleID"));

}

- (id)_yearMonthDay
{
  void *v3;
  void *v4;
  void *v5;

  -[NTKFaceSnapshotContext calendar](self, "calendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFaceSnapshotContext date](self, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "components:fromDate:", 28, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (void)setCalendar:(id)a3
{
  objc_storeStrong((id *)&self->_calendar, a3);
}

- (NSString)monogram
{
  return self->_monogram;
}

- (void)setMonogram:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)uses24hTime
{
  return self->_uses24hTime;
}

- (void)setUses24hTime:(id)a3
{
  objc_storeStrong((id *)&self->_uses24hTime, a3);
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (void)setBuildVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)tzVersion
{
  return self->_tzVersion;
}

- (void)setTzVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSNumber)enhanceTextLegibilityEnabled
{
  return self->_enhanceTextLegibilityEnabled;
}

- (void)setEnhanceTextLegibilityEnabled:(id)a3
{
  objc_storeStrong((id *)&self->_enhanceTextLegibilityEnabled, a3);
}

- (NSString)lunarCalendarLocaleID
{
  return self->_lunarCalendarLocaleID;
}

- (void)setLunarCalendarLocaleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lunarCalendarLocaleID, 0);
  objc_storeStrong((id *)&self->_enhanceTextLegibilityEnabled, 0);
  objc_storeStrong((id *)&self->_tzVersion, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_uses24hTime, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_monogram, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

@end
