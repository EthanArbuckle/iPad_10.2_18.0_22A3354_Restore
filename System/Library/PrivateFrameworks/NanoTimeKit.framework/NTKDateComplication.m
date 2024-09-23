@implementation NTKDateComplication

- (id)ntk_sectionIdentifier
{
  __CFString *v2;

  v2 = CFSTR("com.apple.NanoCalendar");
  if (NTKIsSystemAppRestrictedOrRemoved(CFSTR("com.apple.NanoCalendar")))
    v2 = CFSTR("com.apple.DateComplicationsHost");
  return v2;
}

- (id)ntk_localizedNameWithOptions:(unint64_t)a3 forRichComplicationSlot:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  uint64_t v8;
  objc_super v10;

  v4 = a4;
  +[NTKDateComplicationController textForDateStyle:](NTKDateComplicationController, "textForDateStyle:", -[NTKDateComplication dateStyle](self, "dateStyle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "length"))
  {
    v10.receiver = self;
    v10.super_class = (Class)NTKDateComplication;
    -[NTKComplication ntk_localizedNameWithOptions:forRichComplicationSlot:](&v10, sel_ntk_localizedNameWithOptions_forRichComplicationSlot_, a3, v4);
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }
  return v7;
}

+ (id)complicationWithDateStyle:(unint64_t)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;

  v4 = (_QWORD *)objc_msgSend(objc_alloc((Class)a1), "initWithComplicationType:", 1);
  v4[4] = a3;
  objc_msgSend(v4, "_generateUniqueIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (NTKDateComplication)initWithComplicationType:(unint64_t)a3
{
  NTKDateComplication *v3;
  NTKDateComplication *v4;
  uint64_t v5;
  NSString *uniqueIdentifier;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NTKDateComplication;
  v3 = -[NTKComplication initWithComplicationType:](&v8, sel_initWithComplicationType_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_dateStyle = 0;
    -[NTKDateComplication _generateUniqueIdentifier](v3, "_generateUniqueIdentifier");
    v5 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v4->super._uniqueIdentifier;
    v4->super._uniqueIdentifier = (NSString *)v5;

  }
  return v4;
}

- (BOOL)appearsInDailySnapshotForFamily:(int64_t)a3
{
  return a3 != 3;
}

- (id)customDailySnapshotKeyForFamily:(int64_t)a3 device:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), a4, self->_dateStyle);
}

- (BOOL)snapshotContext:(id)a3 isStaleRelativeToContext:(id)a4
{
  id v6;
  id v7;
  int v8;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "localeMatchesContext:", v7))
  {
    if (-[NTKComplication complicationType](self, "complicationType") == 16)
      v8 = objc_msgSend(v6, "lunarCalendarLocaleIDMatchesContext:", v7) ^ 1;
    else
      LOBYTE(v8) = 0;
  }
  else
  {
    LOBYTE(v8) = 1;
  }

  return v8;
}

- (id)_generateUniqueIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NTKComplication complicationType](self, "complicationType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_dateStyle);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-datestyle:%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKDateComplication;
  return -[NTKComplication hash](&v3, sel_hash) + 1000000 * self->_dateStyle;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKDateComplication;
  result = -[NTKComplication copyWithZone:](&v5, sel_copyWithZone_, a3);
  *((_QWORD *)result + 4) = self->_dateStyle;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKDateComplication;
  v4 = a3;
  -[NTKComplication encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_dateStyle, CFSTR("DateComplicationDateStyleKey"), v5.receiver, v5.super_class);

}

- (NTKDateComplication)initWithCoder:(id)a3
{
  id v4;
  NTKDateComplication *v5;
  uint64_t v6;
  NSString *uniqueIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NTKDateComplication;
  v5 = -[NTKComplication initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("DateComplicationDateStyleKey")))
      v5->_dateStyle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("DateComplicationDateStyleKey"));
    else
      -[NTKDateComplication _migrateFromSkiHillWithCoder:](v5, "_migrateFromSkiHillWithCoder:", v4);
    -[NTKDateComplication _generateUniqueIdentifier](v5, "_generateUniqueIdentifier");
    v6 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v5->super._uniqueIdentifier;
    v5->super._uniqueIdentifier = (NSString *)v6;

  }
  return v5;
}

- (void)_migrateFromSkiHillWithCoder:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = -[NTKComplication complicationType](self, "complicationType", a3);
  switch(v4)
  {
    case 0x4000000uLL:
      v5 = 8;
LABEL_7:
      self->_dateStyle = v5;
      break;
    case 0x2000000uLL:
      v5 = 4;
      goto LABEL_7;
    case 1uLL:
      self->_dateStyle = 0;
      break;
    default:
      v6 = (void *)MEMORY[0x1E0C99DA0];
      v7 = *MEMORY[0x1E0CB2C88];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "raise:format:", v7, CFSTR("Unknown date complication type %@"), v8);

      break;
  }
  -[NTKComplication _setComplicationType:](self, "_setComplicationType:", 1);
}

- (void)_addKeysToJSONDictionary:(id)a3
{
  id v4;
  unint64_t dateStyle;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NTKDateComplication;
  -[NTKComplication _addKeysToJSONDictionary:](&v7, sel__addKeysToJSONDictionary_, v4);
  dateStyle = self->_dateStyle;
  if (dateStyle)
  {
    NTKFaceBundleStringFromDateStyle(dateStyle);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("date style"));

  }
}

- (id)_initWithComplicationType:(unint64_t)a3 JSONDictionary:(id)a4
{
  id v6;
  _QWORD *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)NTKDateComplication;
  v7 = -[NTKComplication _initWithComplicationType:JSONDictionary:](&v13, sel__initWithComplicationType_JSONDictionary_, a3, v6);
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("date style"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("NTKFaceBundleException"), CFSTR("value for key '%@' must be a string - invalid value: %@"), CFSTR("date style"), v8);
      v12 = 0;
      if (!NTKFaceBundleGetDateStyleFromString(v8, &v12))
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("NTKFaceBundleException"), CFSTR("invalid value for '%@': %@"), CFSTR("date style"), v8);
      v7[4] = v12;
    }
    else
    {
      v7[4] = 0;
    }
    objc_msgSend(v7, "_generateUniqueIdentifier");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v7[1];
    v7[1] = v9;

  }
  return v7;
}

- (unint64_t)dateStyle
{
  return self->_dateStyle;
}

@end
