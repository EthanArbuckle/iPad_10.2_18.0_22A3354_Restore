@implementation CLKDateTextProvider

- (CLKDateTextProvider)initWithDate:(NSDate *)date units:(NSCalendarUnit)calendarUnits
{
  return -[CLKDateTextProvider initWithDate:units:timeZone:](self, "initWithDate:units:timeZone:", date, calendarUnits, 0);
}

- (CLKDateTextProvider)initWithDate:(NSDate *)date units:(NSCalendarUnit)calendarUnits timeZone:(NSTimeZone *)timeZone
{
  NSDate *v8;
  NSTimeZone *v9;
  CLKDateTextProvider *v10;
  CLKDateTextProvider *v11;
  objc_super v13;

  v8 = date;
  v9 = timeZone;
  v13.receiver = self;
  v13.super_class = (Class)CLKDateTextProvider;
  v10 = -[CLKTextProvider initPrivate](&v13, sel_initPrivate);
  v11 = v10;
  if (v10)
  {
    -[CLKDateTextProvider setDate:](v10, "setDate:", v8);
    -[CLKDateTextProvider setCalendarUnits:](v11, "setCalendarUnits:", calendarUnits);
    -[CLKDateTextProvider setTimeZone:](v11, "setTimeZone:", v9);
    -[CLKDateTextProvider setFormattingContext:](v11, "setFormattingContext:", 2);
  }

  return v11;
}

+ (CLKDateTextProvider)textProviderWithDate:(NSDate *)date units:(NSCalendarUnit)calendarUnits
{
  return (CLKDateTextProvider *)objc_msgSend(a1, "textProviderWithDate:units:timeZone:", date, calendarUnits, 0);
}

+ (CLKDateTextProvider)textProviderWithDate:(NSDate *)date units:(NSCalendarUnit)calendarUnits timeZone:(NSTimeZone *)timeZone
{
  NSTimeZone *v8;
  NSDate *v9;
  void *v10;

  v8 = timeZone;
  v9 = date;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDate:units:timeZone:", v9, calendarUnits, v8);

  return (CLKDateTextProvider *)v10;
}

- (id)_sessionAttributedTextForIndex:(unint64_t)a3 withStyle:(id)a4
{
  id v6;
  NSDateFormatter *v7;
  NSDateFormatter *dateFormatter;
  void *v9;
  NSArray *templateSeries;
  NSArray *v11;
  NSArray *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  int v20;
  char v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  uint64_t v41;
  id v42;
  id v43;
  void *v44;
  void *v46;
  _QWORD v47[4];
  id v48;
  id v49;
  id v50;

  v6 = a4;
  if (!self->_date)
    goto LABEL_14;
  if (!self->_dateFormatter)
  {
    v7 = (NSDateFormatter *)objc_opt_new();
    dateFormatter = self->_dateFormatter;
    self->_dateFormatter = v7;

    if (self->_timeZone)
      -[NSDateFormatter setTimeZone:](self->_dateFormatter, "setTimeZone:");
    if (-[NSString length](self->_alternateCalendarLocaleID, "length"))
    {
      objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", self->_alternateCalendarLocaleID);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDateFormatter setLocale:](self->_dateFormatter, "setLocale:", v9);

      -[NSDateFormatter setDateStyle:](self->_dateFormatter, "setDateStyle:", 2);
    }
    -[NSDateFormatter setFormattingContext:](self->_dateFormatter, "setFormattingContext:", self->_formattingContext);
  }
  templateSeries = self->_templateSeries;
  if (!templateSeries)
  {
    -[CLKDateTextProvider _completeDateTemplateSeries](self, "_completeDateTemplateSeries");
    v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v12 = self->_templateSeries;
    self->_templateSeries = v11;

    templateSeries = self->_templateSeries;
  }
  if (-[NSArray count](templateSeries, "count") <= a3)
  {
LABEL_14:
    v14 = 0;
    goto LABEL_38;
  }
  -[NSArray objectAtIndex:](self->_templateSeries, "objectAtIndex:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v13, "isEqualToString:", CFSTR("d")))
  {
    if (!_isWeekdayDayTemplate(v13))
      goto LABEL_18;
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", *MEMORY[0x24BDBCB20]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v15) = objc_msgSend(v16, "isEqualToString:", CFSTR("en"));
    if (!(_DWORD)v15)
      goto LABEL_18;
LABEL_17:
    -[NSDateFormatter setDateFormat:](self->_dateFormatter, "setDateFormat:", v13);
    goto LABEL_19;
  }
  if ((CLKIsCurrentLocaleCJK() & 1) != 0)
    goto LABEL_17;
LABEL_18:
  -[NSDateFormatter setLocalizedDateFormatFromTemplate:](self->_dateFormatter, "setLocalizedDateFormatFromTemplate:", v13);
LABEL_19:
  -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", self->_date);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v13;
  objc_msgSend(CFSTR("MMMMM"), "stringByAppendingString:", CFSTR("d"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "isEqualToString:", v19);

  if (v20 && (CLKIsCurrentLocaleCJK() & 1) != 0)
  {
    v21 = 1;
  }
  else
  {
    v22 = v17;
    v17 = v22;
    if (_isWeekdayDayTemplate(v18))
    {
      v17 = v22;
      if (CLKRemovesPunctuationFromWeekdayDay())
      {
        if (!_removePunctationIfNecessaryFromTextForTemplate_punctuationExceptDash)
        {
          objc_msgSend(MEMORY[0x24BDD1690], "punctuationCharacterSet");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "removeCharactersInString:", CFSTR("-"));
          v24 = (void *)_removePunctationIfNecessaryFromTextForTemplate_punctuationExceptDash;
          _removePunctationIfNecessaryFromTextForTemplate_punctuationExceptDash = (uint64_t)v23;

        }
        objc_msgSend(v22, "componentsSeparatedByCharactersInSet:");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "componentsJoinedByString:", &stru_24CBFCB28);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }

    v21 = 0;
  }
  if ((objc_msgSend(v6, "uppercase") & 1) != 0 || self->_uppercase)
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "uppercaseStringWithLocale:", v26);
    v27 = objc_claimAutoreleasedReturnValue();

    v17 = (void *)v27;
  }
  v28 = (void *)objc_opt_new();
  objc_msgSend(v6, "font");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = *MEMORY[0x24BEBD270];
  objc_msgSend(v28, "setObject:forKeyedSubscript:", v29, *MEMORY[0x24BEBD270]);

  objc_msgSend(v6, "otherAttributes");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addEntriesFromDictionary:", v31);

  if (objc_msgSend(v6, "shouldEmbedTintColors"))
  {
    -[CLKTextProvider tintColor](self, "tintColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      -[CLKTextProvider tintColor](self, "tintColor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setObject:forKeyedSubscript:", v33, *MEMORY[0x24BEBD278]);

    }
  }
  if ((v21 & 1) != 0)
  {
    objc_msgSend(v28, "objectForKeyedSubscript:", v30);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend(v28, "mutableCopy");
    objc_msgSend(v46, "pointSize");
    objc_msgSend(v46, "fontWithSize:", v35 + -2.0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setObject:forKeyedSubscript:", v36, v30);

    -[NSDateFormatter _attributedStringWithFieldsFromDate:](self->_dateFormatter, "_attributedStringWithFieldsFromDate:", self->_date);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_alloc(MEMORY[0x24BDD1688]);
    objc_msgSend(v37, "string");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)objc_msgSend(v38, "initWithString:", v39);

    v41 = objc_msgSend(v37, "length");
    v47[0] = MEMORY[0x24BDAC760];
    v47[1] = 3221225472;
    v47[2] = __64__CLKDateTextProvider__sessionAttributedTextForIndex_withStyle___block_invoke;
    v47[3] = &unk_24CBF9120;
    v42 = v40;
    v48 = v42;
    v49 = v34;
    v50 = v28;
    v43 = v34;
    objc_msgSend(v37, "enumerateAttributesInRange:options:usingBlock:", 0, v41, 0, v47);
    v44 = v50;
    v14 = v42;

  }
  else
  {
    v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v17, v28);
  }

LABEL_38:
  return v14;
}

uint64_t __64__CLKDateTextProvider__sessionAttributedTextForIndex_withStyle___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;

  v7 = objc_msgSend(a2, "count");
  v8 = 48;
  if (!v7)
    v8 = 40;
  return objc_msgSend(*(id *)(a1 + 32), "setAttributes:range:", *(_QWORD *)(a1 + v8), a3, a4);
}

- (BOOL)_validate
{
  _BOOL4 v3;
  NSObject *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLKDateTextProvider;
  v3 = -[CLKTextProvider _validate](&v6, sel__validate);
  if (v3)
  {
    if (self->_date)
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      CLKLoggingObjectForDomain(10);
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
        -[CLKTimeTextProvider _validate].cold.1((uint64_t)self, v4);

      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLKDateTextProvider;
  -[CLKTextProvider description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)copyWithZone:(_NSZone *)a3
{
  CLKDateTextProvider *v4;
  CLKDateTextProvider *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLKDateTextProvider;
  v4 = -[CLKTextProvider copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4 != self)
  {
    objc_storeStrong((id *)&v4->_date, self->_date);
    v5->_calendarUnits = self->_calendarUnits;
    objc_storeStrong((id *)&v5->_timeZone, self->_timeZone);
    v5->_shortUnits = self->_shortUnits;
    v5->_allowsNarrowUnits = self->_allowsNarrowUnits;
    v5->_narrowStandaloneWeekdayDay = self->_narrowStandaloneWeekdayDay;
    objc_storeStrong((id *)&v5->_alternateCalendarLocaleID, self->_alternateCalendarLocaleID);
    v5->_formattingContext = self->_formattingContext;
    v5->_uppercase = self->_uppercase;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  void **v4;
  BOOL v5;
  objc_super v7;

  v4 = (void **)a3;
  v7.receiver = self;
  v7.super_class = (Class)CLKDateTextProvider;
  v5 = -[CLKTextProvider isEqual:](&v7, sel_isEqual_, v4)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && CLKEqualObjects(self->_date, v4[19])
    && CLKEqualObjects(self->_timeZone, v4[21])
    && (void *)self->_calendarUnits == v4[20]
    && self->_shortUnits == *((unsigned __int8 *)v4 + 145)
    && self->_allowsNarrowUnits == *((unsigned __int8 *)v4 + 146)
    && self->_narrowStandaloneWeekdayDay == *((unsigned __int8 *)v4 + 147)
    && CLKEqualObjects(self->_alternateCalendarLocaleID, v4[22])
    && self->_formattingContext == (_QWORD)v4[23];

  return v5;
}

- (unint64_t)hash
{
  char *v3;
  char *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLKDateTextProvider;
  v3 = -[CLKTextProvider hash](&v7, sel_hash);
  v4 = &v3[-[NSDate hash](self->_date, "hash")];
  v5 = (unint64_t)&v4[0x10000 * (unint64_t)self->_allowsNarrowUnits
                           + 256 * (unint64_t)self->_shortUnits
                           + 16 * self->_calendarUnits
                           + 4 * -[NSTimeZone hash](self->_timeZone, "hash")];
  return v5
       + -[NSString hash](self->_alternateCalendarLocaleID, "hash")
       + (self->_formattingContext << 17)
       + ((unint64_t)self->_narrowStandaloneWeekdayDay << 18);
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
  v5.super_class = (Class)CLKDateTextProvider;
  v4 = a3;
  -[CLKTextProvider encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_date, CFSTR("_date"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_calendarUnits, CFSTR("_calendarUnits"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_timeZone, CFSTR("_timeZone"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_shortUnits, CFSTR("_shortUnits"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_allowsNarrowUnits, CFSTR("_allowsNarrowUnits"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_narrowStandaloneWeekdayDay, CFSTR("_narrowStandaloneWeekdayDay"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_alternateCalendarLocaleID, CFSTR("_alternateCalendarLocaleID"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_formattingContext, CFSTR("_formattingContext"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_formattingContext, CFSTR("_formattingContext"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_uppercase, CFSTR("_uppercase"));

}

- (CLKDateTextProvider)initWithCoder:(id)a3
{
  id v4;
  CLKDateTextProvider *v5;
  uint64_t v6;
  NSDate *date;
  uint64_t v8;
  NSTimeZone *timeZone;
  uint64_t v10;
  NSString *alternateCalendarLocaleID;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CLKDateTextProvider;
  v5 = -[CLKTextProvider initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_date"));
    v6 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_timeZone"));
    v8 = objc_claimAutoreleasedReturnValue();
    timeZone = v5->_timeZone;
    v5->_timeZone = (NSTimeZone *)v8;

    v5->_calendarUnits = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_calendarUnits"));
    v5->_shortUnits = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_shortUnits"));
    v5->_allowsNarrowUnits = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_allowsNarrowUnits"));
    v5->_narrowStandaloneWeekdayDay = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_narrowStandaloneWeekdayDay"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_alternateCalendarLocaleID"));
    v10 = objc_claimAutoreleasedReturnValue();
    alternateCalendarLocaleID = v5->_alternateCalendarLocaleID;
    v5->_alternateCalendarLocaleID = (NSString *)v10;

    v5->_formattingContext = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_formattingContext"));
    v5->_uppercase = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_uppercase"));
  }

  return v5;
}

- (id)_initWithJSONObjectRepresentation:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CLKDateTextProvider;
  v5 = -[CLKTextProvider _initWithJSONObjectRepresentation:](&v15, sel__initWithJSONObjectRepresentation_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("date"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE60]), "initWithJSONObjectRepresentation:", v6);
    v8 = (void *)v5[19];
    v5[19] = v7;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("calendarUnits"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v5[20] = (int)objc_msgSend(v9, "intValue");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeZone"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF38]), "initWithJSONObjectRepresentation:", v10);
      v12 = (void *)v5[21];
      v5[21] = v11;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_uppercase"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("CLKComplicationBundleException"), CFSTR("value for key '%@' must be a number - invalid value: %@"), CFSTR("_uppercase"), v13);
      *((_BYTE *)v5 + 144) = objc_msgSend(v13, "BOOLValue");
    }

  }
  return v5;
}

- (id)JSONObjectRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CLKDateTextProvider;
  -[CLKTextProvider JSONObjectRepresentation](&v9, sel_JSONObjectRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate JSONObjectRepresentation](self->_date, "JSONObjectRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("date"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_calendarUnits);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("calendarUnits"));

  -[NSTimeZone JSONObjectRepresentation](self->_timeZone, "JSONObjectRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("timeZone"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_uppercase);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("_uppercase"));

  return v3;
}

- (id)_completeDateTemplateSeries
{
  unint64_t calendarUnits;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  calendarUnits = self->_calendarUnits;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((calendarUnits & 0x21C) != 0)
    v5 = calendarUnits & 0x21C;
  else
    v5 = 16;
  do
  {
    -[CLKDateTextProvider _partialDateTemplateSeriesForUnits:](self, "_partialDateTemplateSeriesForUnits:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v6);

    if ((v5 & 8) != 0)
      v7 = -9;
    else
      v7 = -17;
    if ((v5 & 0x200) != 0)
      v7 = -513;
    if ((v5 & 4) != 0)
      v7 = -5;
    v5 &= v7;
  }
  while (v5);
  return v4;
}

- (id)_partialDateTemplateSeriesForUnits:(unint64_t)a3
{
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  __CFString *v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _QWORD v27[2];
  _QWORD v28[4];

  v28[3] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_opt_new();
  v6 = v5;
  if (a3 == 528)
  {
    if (self->_narrowStandaloneWeekdayDay)
    {
      v7 = CFSTR("ccccc d");
    }
    else
    {
      if (!self->_shortUnits)
        objc_msgSend(v5, "addObject:", CFSTR("EEEE d"));
      v7 = CFSTR("EEE d");
    }
    objc_msgSend(v6, "addObject:", v7);
    return v6;
  }
  if ((~(_DWORD)a3 & 0x208) == 0)
  {
    if (!self->_shortUnits)
    {
      v28[0] = CFSTR("MMMMEEEE");
      v28[1] = CFSTR("MMMMEEE");
      v28[2] = CFSTR("MMMEEEE");
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObjectsFromArray:", v8);

    }
    objc_msgSend(v6, "addObject:", CFSTR("MMMEEE"));
    if (self->_allowsNarrowUnits)
    {
      v27[0] = CFSTR("MMMEEEEEE");
      v27[1] = CFSTR("MMMMMEEE");
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObjectsFromArray:", v9);

    }
    goto LABEL_25;
  }
  if ((a3 & 8) != 0)
  {
    if (!self->_shortUnits)
      objc_msgSend(v5, "addObject:", CFSTR("MMMM"));
    objc_msgSend(v6, "addObject:", CFSTR("MMM"));
    if (self->_allowsNarrowUnits)
    {
      v10 = CFSTR("MMMMM");
      goto LABEL_24;
    }
  }
  else
  {
    if ((a3 & 0x200) == 0)
    {
      v10 = &stru_24CBFCB28;
LABEL_24:
      objc_msgSend(v6, "addObject:", v10);
      goto LABEL_25;
    }
    if (!self->_shortUnits)
      objc_msgSend(v5, "addObject:", CFSTR("EEEE"));
    objc_msgSend(v6, "addObject:", CFSTR("EEE"));
    if (self->_allowsNarrowUnits)
    {
      v10 = CFSTR("EEEEEE");
      goto LABEL_24;
    }
  }
LABEL_25:
  if ((a3 & 0x10) == 0)
  {
    v11 = &stru_24CBFCB28;
    if ((a3 & 4) == 0)
      goto LABEL_33;
LABEL_29:
    if (self->_alternateCalendarLocaleID)
      v12 = CFSTR("U");
    else
      v12 = CFSTR("y");
    -[__CFString stringByAppendingString:](v11, "stringByAppendingString:", v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v11 = (__CFString *)v13;
    goto LABEL_33;
  }
  objc_msgSend(&stru_24CBFCB28, "stringByAppendingString:", CFSTR("d"));
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ((a3 & 4) != 0)
    goto LABEL_29;
LABEL_33:
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v15 = v6;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v23 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "stringByAppendingString:", v11, (_QWORD)v22);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v20);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v17);
  }

  v6 = v14;
  return v6;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(NSDate *)date
{
  objc_storeStrong((id *)&self->_date, date);
}

- (NSCalendarUnit)calendarUnits
{
  return self->_calendarUnits;
}

- (void)setCalendarUnits:(NSCalendarUnit)calendarUnits
{
  self->_calendarUnits = calendarUnits;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(NSTimeZone *)timeZone
{
  objc_storeStrong((id *)&self->_timeZone, timeZone);
}

- (BOOL)uppercase
{
  return self->_uppercase;
}

- (void)setUppercase:(BOOL)uppercase
{
  self->_uppercase = uppercase;
}

- (BOOL)shortUnits
{
  return self->_shortUnits;
}

- (void)setShortUnits:(BOOL)a3
{
  self->_shortUnits = a3;
}

- (BOOL)allowsNarrowUnits
{
  return self->_allowsNarrowUnits;
}

- (void)setAllowsNarrowUnits:(BOOL)a3
{
  self->_allowsNarrowUnits = a3;
}

- (BOOL)narrowStandaloneWeekdayDay
{
  return self->_narrowStandaloneWeekdayDay;
}

- (void)setNarrowStandaloneWeekdayDay:(BOOL)a3
{
  self->_narrowStandaloneWeekdayDay = a3;
}

- (NSString)alternateCalendarLocaleID
{
  return self->_alternateCalendarLocaleID;
}

- (void)setAlternateCalendarLocaleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (int64_t)formattingContext
{
  return self->_formattingContext;
}

- (void)setFormattingContext:(int64_t)a3
{
  self->_formattingContext = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateCalendarLocaleID, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_templateSeries, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
}

@end
