@implementation CLKTimeTextProvider

- (CLKTimeTextProvider)initWithDate:(NSDate *)date
{
  return -[CLKTimeTextProvider initWithDate:timeZone:](self, "initWithDate:timeZone:", date, 0);
}

- (CLKTimeTextProvider)initWithDate:(NSDate *)date timeZone:(NSTimeZone *)timeZone
{
  NSDate *v6;
  NSTimeZone *v7;
  CLKTimeTextProvider *v8;
  CLKTimeTextProvider *v9;
  objc_super v11;

  v6 = date;
  v7 = timeZone;
  v11.receiver = self;
  v11.super_class = (Class)CLKTimeTextProvider;
  v8 = -[CLKTextProvider initPrivate](&v11, sel_initPrivate);
  v9 = v8;
  if (v8)
  {
    -[CLKTimeTextProvider setDate:](v8, "setDate:", v6);
    -[CLKTimeTextProvider setTimeZone:](v9, "setTimeZone:", v7);
  }

  return v9;
}

+ (CLKTimeTextProvider)textProviderWithDate:(NSDate *)date
{
  return (CLKTimeTextProvider *)objc_msgSend(a1, "textProviderWithDate:timeZone:", date, 0);
}

+ (CLKTimeTextProvider)textProviderWithDate:(NSDate *)date timeZone:(NSTimeZone *)timeZone
{
  NSTimeZone *v6;
  NSDate *v7;
  void *v8;

  v6 = timeZone;
  v7 = date;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDate:timeZone:", v7, v6);

  return (CLKTimeTextProvider *)v8;
}

- (id)_sessionAttributedTextForIndex:(unint64_t)a3 withStyle:(id)a4
{
  id v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSMutableArray *sizingFallbackBlocks;
  NSMutableArray *v14;
  NSMutableArray *v15;
  uint64_t v16;
  NSMutableArray *v17;
  void *v18;
  void *v19;
  NSMutableArray *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSMutableArray *v24;
  void *v25;
  uint64_t v26;
  NSMutableArray *v27;
  void *v28;
  void (**v29)(_QWORD, _QWORD);
  void *v30;
  void *v31;
  uint64_t v32;
  id *v34;
  uint64_t v35;
  uint64_t v36;
  id (*v37)(uint64_t, void *);
  void *v38;
  id v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[4];
  id v43;
  id location[2];

  v6 = a4;
  -[CLKTimeTextProvider date](self, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (CLKCurrentLocaleIs24HourMode())
    {
      v8 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CLKTimeTextProvider date](self, "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "components:fromDate:", 64, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v12, "minute") == 0;

    }
    sizingFallbackBlocks = self->_sizingFallbackBlocks;
    if (!sizingFallbackBlocks)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v14 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      v15 = self->_sizingFallbackBlocks;
      self->_sizingFallbackBlocks = v14;

      objc_initWeak(location, self);
      v16 = MEMORY[0x24BDAC760];
      if (!self->_disallowBothMinutesAndDesignator)
      {
        v17 = self->_sizingFallbackBlocks;
        v42[0] = MEMORY[0x24BDAC760];
        v42[1] = 3221225472;
        v42[2] = __64__CLKTimeTextProvider__sessionAttributedTextForIndex_withStyle___block_invoke;
        v42[3] = &unk_24CBF90F8;
        objc_copyWeak(&v43, location);
        v18 = (void *)MEMORY[0x212BDBEAC](v42);
        -[NSMutableArray addObject:](v17, "addObject:", v18);

        objc_destroyWeak(&v43);
      }
      v40[0] = v16;
      v40[1] = 3221225472;
      v40[2] = __64__CLKTimeTextProvider__sessionAttributedTextForIndex_withStyle___block_invoke_2;
      v40[3] = &unk_24CBF90F8;
      v34 = &v41;
      objc_copyWeak(&v41, location);
      v19 = (void *)objc_msgSend(v40, "copy");
      v20 = self->_sizingFallbackBlocks;
      v21 = (void *)MEMORY[0x212BDBEAC]();
      -[NSMutableArray addObject:](v20, "addObject:", v21);

      if (v8)
      {
        v35 = v16;
        v36 = 3221225472;
        v37 = __64__CLKTimeTextProvider__sessionAttributedTextForIndex_withStyle___block_invoke_3;
        v38 = &unk_24CBF90F8;
        objc_copyWeak(&v39, location);
        v22 = MEMORY[0x212BDBEAC](&v35);
        v23 = (void *)v22;
        v24 = self->_sizingFallbackBlocks;
        if (self->_prefersDesignatorToMinutes)
        {
          v25 = (void *)MEMORY[0x212BDBEAC](v19);
          v26 = -[NSMutableArray indexOfObject:](v24, "indexOfObject:", v25, &v41, v35, v36, v37, v38);

          v27 = self->_sizingFallbackBlocks;
          v28 = (void *)MEMORY[0x212BDBEAC](v23);
          -[NSMutableArray insertObject:atIndex:](v27, "insertObject:atIndex:", v28, v26);
        }
        else
        {
          v28 = (void *)MEMORY[0x212BDBEAC](v22);
          -[NSMutableArray addObject:](v24, "addObject:", v28, &v41, v35, v36, v37, v38);
        }

        objc_destroyWeak(&v39);
      }

      objc_destroyWeak(v34);
      objc_destroyWeak(location);
      sizingFallbackBlocks = self->_sizingFallbackBlocks;
    }
    if (-[NSMutableArray count](sizingFallbackBlocks, "count", v34) <= a3)
    {
      v9 = 0;
    }
    else
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_sizingFallbackBlocks, "objectAtIndexedSubscript:", a3);
      v29 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id))v29)[2](v29, v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (objc_msgSend(v6, "shouldEmbedTintColors"))
    {
      -[CLKTextProvider tintColor](self, "tintColor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
      {
        -[CLKTextProvider tintColor](self, "tintColor");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "_attributedStringWithForegroundColor:", v31);
        v32 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v32;
      }
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

id __64__CLKTimeTextProvider__sessionAttributedTextForIndex_withStyle___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_timeAttributedTextWithStyle:dropMinutes:dropDesignator:", v3, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __64__CLKTimeTextProvider__sessionAttributedTextForIndex_withStyle___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_timeAttributedTextWithStyle:dropMinutes:dropDesignator:", v3, 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __64__CLKTimeTextProvider__sessionAttributedTextForIndex_withStyle___block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_timeAttributedTextWithStyle:dropMinutes:dropDesignator:", v3, 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_timeAttributedTextWithStyle:(id)a3 dropMinutes:(BOOL)a4 dropDesignator:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  id v8;
  NSDateFormatter *v9;
  NSDateFormatter *dateFormatter;
  __CFString **v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSDateFormatter *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  _QWORD v34[4];
  id v35;
  CLKTimeTextProvider *v36;
  id v37;
  char v38;
  uint64_t v39;
  _QWORD v40[2];

  v5 = a5;
  v6 = a4;
  v40[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if (!self->_dateFormatter)
  {
    v9 = (NSDateFormatter *)objc_opt_new();
    dateFormatter = self->_dateFormatter;
    self->_dateFormatter = v9;

    if (self->_timeZone)
      -[NSDateFormatter setTimeZone:](self->_dateFormatter, "setTimeZone:");
  }
  v11 = &_CLKNoMinutesTimeFormatTemplate;
  if (!v6)
    v11 = _CLKStandardTimeFormatTemplate;
  v12 = *v11;
  v13 = (void *)MEMORY[0x24BDD1500];
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dateFormatFromTemplate:options:locale:", v12, 0, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = 0;
  -[CLKTextProvider _timeFormatByRemovingWhitespaceAroundDesignatorOfTimeFormat:andRemovingDesignator:designatorExists:](self, "_timeFormatByRemovingWhitespaceAroundDesignatorOfTimeFormat:andRemovingDesignator:designatorExists:", v15, v5, &v38);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSDateFormatter setDateFormat:](self->_dateFormatter, "setDateFormat:", v16);
  objc_msgSend(v8, "font");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKTextProvider fontFeatures](self, "fontFeatures");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[CLKTextProvider fontFeatures](self, "fontFeatures");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "CLKFontByApplyingFeatureSettings:", v19);
    v20 = objc_claimAutoreleasedReturnValue();

    v17 = (void *)v20;
  }
  v39 = *MEMORY[0x24BEBD270];
  v40[0] = v17;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = self->_dateFormatter;
  -[CLKTimeTextProvider date](self, "date");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter _attributedStringWithFieldsFromDate:](v22, "_attributedStringWithFieldsFromDate:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = objc_alloc(MEMORY[0x24BDD1688]);
  objc_msgSend(v24, "string");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v25, "initWithString:attributes:", v26, v21);

  if (!v38 || v5)
  {
    v31 = v27;
  }
  else
  {
    v28 = objc_msgSend(v24, "length");
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __79__CLKTimeTextProvider__timeAttributedTextWithStyle_dropMinutes_dropDesignator___block_invoke;
    v34[3] = &unk_24CBF9120;
    v35 = v8;
    v36 = self;
    v29 = v27;
    v37 = v29;
    objc_msgSend(v24, "enumerateAttributesInRange:options:usingBlock:", 0, v28, 0, v34);
    v30 = v29;

  }
  objc_msgSend(v27, "_attributedStringWithOtherAttributesFromStyle:", v8);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

void __79__CLKTimeTextProvider__timeAttributedTextWithStyle_dropMinutes_dropDesignator___block_invoke(id *a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  void *v12;
  id v13;

  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x24BDBCA78]);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "hasPrefix:", CFSTR("a")))
  {
    objc_msgSend(a1[4], "smallCapsBaseFont");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "fontFeatures");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(a1[5], "fontFeatures");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "CLKFontByApplyingFeatureSettings:", v9);
      v10 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v10;
    }
    if ((CTFontGetSymbolicTraits((CTFontRef)v7) & 1) != 0)
    {
      objc_msgSend(v7, "pointSize");
      objc_msgSend(v7, "fontWithSize:", v11 * 0.75);
    }
    else
    {
      objc_msgSend(v7, "CLKFontWithLocalizedSmallCaps");
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1[6], "addAttribute:value:range:", *MEMORY[0x24BEBD270], v12, a3, a4);
  }

}

- (BOOL)_validate
{
  _BOOL4 v3;
  void *v4;
  NSObject *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLKTimeTextProvider;
  v3 = -[CLKTextProvider _validate](&v7, sel__validate);
  if (v3)
  {
    -[CLKTimeTextProvider date](self, "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      CLKLoggingObjectForDomain(10);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[CLKTimeTextProvider _validate].cold.1((uint64_t)self, v5);

      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLKTimeTextProvider;
  -[CLKTextProvider description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)copyWithZone:(_NSZone *)a3
{
  CLKTimeTextProvider *v4;
  uint64_t v5;
  NSDate *date;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLKTimeTextProvider;
  v4 = -[CLKTextProvider copyWithZone:](&v8, sel_copyWithZone_, a3);
  if (v4 != self)
  {
    -[CLKTimeTextProvider date](self, "date");
    v5 = objc_claimAutoreleasedReturnValue();
    date = v4->_date;
    v4->_date = (NSDate *)v5;

    objc_storeStrong((id *)&v4->_timeZone, self->_timeZone);
    v4->_disallowBothMinutesAndDesignator = self->_disallowBothMinutesAndDesignator;
    v4->_prefersDesignatorToMinutes = self->_prefersDesignatorToMinutes;
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void **v4;
  void *v5;
  BOOL v6;
  objc_super v8;

  v4 = (void **)a3;
  v8.receiver = self;
  v8.super_class = (Class)CLKTimeTextProvider;
  if (-[CLKTextProvider isEqual:](&v8, sel_isEqual_, v4) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[CLKTimeTextProvider date](self, "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = CLKEqualObjects(v5, v4[19])
      && CLKEqualObjects(self->_timeZone, v4[20])
      && self->_prefersDesignatorToMinutes == *((unsigned __int8 *)v4 + 145)
      && self->_disallowBothMinutesAndDesignator == *((unsigned __int8 *)v4 + 144);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  double v3;
  void *v4;
  double v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  double v9;
  unint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CLKTimeTextProvider;
  v3 = (double)-[CLKTextProvider hash](&v12, sel_hash);
  -[CLKTimeTextProvider date](self, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3 + (double)(unint64_t)objc_msgSend(v4, "hash") * 100.0;
  v6 = -[NSTimeZone hash](self->_timeZone, "hash");
  v7 = 0x408F400000000000;
  LOBYTE(v7) = self->_prefersDesignatorToMinutes;
  *(double *)&v8 = (double)v7;
  v9 = v5 + (double)v6 * 1000.0 + *(double *)&v8 * 10000.0;
  LOBYTE(v8) = self->_disallowBothMinutesAndDesignator;
  v10 = (unint64_t)(v9 + (double)v8 * 100000.0);

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLKTimeTextProvider;
  v4 = a3;
  -[CLKTextProvider encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[CLKTimeTextProvider date](self, "date", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_date"));

  objc_msgSend(v4, "encodeObject:forKey:", self->_timeZone, CFSTR("_timeZone"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_disallowBothMinutesAndDesignator, CFSTR("_disallowBothMinutesAndDesignator"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_prefersDesignatorToMinutes, CFSTR("_prefersDesignatorToMinutes"));

}

- (CLKTimeTextProvider)initWithCoder:(id)a3
{
  id v4;
  CLKTimeTextProvider *v5;
  uint64_t v6;
  NSDate *date;
  uint64_t v8;
  NSTimeZone *timeZone;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CLKTimeTextProvider;
  v5 = -[CLKTextProvider initWithCoder:](&v11, sel_initWithCoder_, v4);
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

    v5->_disallowBothMinutesAndDesignator = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_disallowBothMinutesAndDesignator"));
    v5->_prefersDesignatorToMinutes = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_prefersDesignatorToMinutes"));
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
  uint64_t v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CLKTimeTextProvider;
  v5 = -[CLKTextProvider _initWithJSONObjectRepresentation:](&v13, sel__initWithJSONObjectRepresentation_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("date"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE60]), "initWithJSONObjectRepresentation:", v6);
    v8 = (void *)v5[19];
    v5[19] = v7;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeZone"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF38]), "initWithJSONObjectRepresentation:", v9);
      v11 = (void *)v5[20];
      v5[20] = v10;

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
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLKTimeTextProvider;
  -[CLKTextProvider JSONObjectRepresentation](&v8, sel_JSONObjectRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKTimeTextProvider date](self, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "JSONObjectRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("date"));

  -[NSTimeZone JSONObjectRepresentation](self->_timeZone, "JSONObjectRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("timeZone"));

  return v3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(NSDate *)date
{
  objc_storeStrong((id *)&self->_date, date);
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(NSTimeZone *)timeZone
{
  objc_storeStrong((id *)&self->_timeZone, timeZone);
}

- (BOOL)disallowBothMinutesAndDesignator
{
  return self->_disallowBothMinutesAndDesignator;
}

- (void)setDisallowBothMinutesAndDesignator:(BOOL)a3
{
  self->_disallowBothMinutesAndDesignator = a3;
}

- (BOOL)prefersDesignatorToMinutes
{
  return self->_prefersDesignatorToMinutes;
}

- (void)setPrefersDesignatorToMinutes:(BOOL)a3
{
  self->_prefersDesignatorToMinutes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_sizingFallbackBlocks, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
}

- (void)_validate
{
  void *v3;
  id v4;
  id v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_class();
  v4 = v3;
  v6 = 138412802;
  v7 = CFSTR("date");
  v8 = 2112;
  v9 = v3;
  v10 = 2112;
  v11 = (id)objc_opt_class();
  v5 = v11;
  _os_log_fault_impl(&dword_2114F4000, a2, OS_LOG_TYPE_FAULT, "Property '%@' is not set on %@. This property must not be nil when passing %@ to the complication data handler.", (uint8_t *)&v6, 0x20u);

}

@end
