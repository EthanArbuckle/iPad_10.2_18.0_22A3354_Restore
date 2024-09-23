@implementation MKTransitDepartureServiceGapFormatter

- (MKTransitDepartureServiceGapFormatter)initWithTimeZone:(id)a3 departureCutoffDate:(id)a4
{
  id v7;
  id v8;
  MKTransitDepartureServiceGapFormatter *v9;
  MKTransitDepartureServiceGapFormatter *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MKTransitDepartureServiceGapFormatter;
  v9 = -[MKTransitDepartureServiceGapFormatter init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_timeZone, a3);
    objc_storeStrong((id *)&v10->_departureCutoffDate, a4);
  }

  return v10;
}

- (id)lastDepartureString
{
  MKTransitDepartureServiceGapFormatterResult *v2;
  void *v3;
  MKTransitDepartureServiceGapFormatterResult *v4;

  v2 = [MKTransitDepartureServiceGapFormatterResult alloc];
  _MKLocalizedStringFromThisBundle(CFSTR("Last departure"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MKTransitDepartureServiceGapFormatterResult initWithFormat:dateDescription:dateFormat:](v2, "initWithFormat:dateDescription:dateFormat:", v3, 0, 0);

  return v4;
}

- (id)lastDepartureUntilStringFromDate:(id)a3
{
  void *v3;
  void *v4;
  MKTransitDepartureServiceGapFormatterResult *v5;
  MKTransitDepartureServiceGapFormatterResult *v6;
  uint64_t v8;

  v8 = 0;
  -[MKTransitDepartureServiceGapFormatter _descriptionForDepartureDate:canIncludeDate:outDateFormat:](self, "_descriptionForDepartureDate:canIncludeDate:outDateFormat:", a3, 1, &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  if ((unint64_t)(v8 - 1) <= 3)
  {
    _MKLocalizedStringFromThisBundle(off_1E20DBC60[v8 - 1]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = [MKTransitDepartureServiceGapFormatterResult alloc];
  v6 = -[MKTransitDepartureServiceGapFormatterResult initWithFormat:dateDescription:dateFormat:](v5, "initWithFormat:dateDescription:dateFormat:", v4, v3, v8);

  return v6;
}

- (id)lastDepartureAtStringFromDate:(id)a3
{
  void *v3;
  void *v4;
  MKTransitDepartureServiceGapFormatterResult *v5;
  MKTransitDepartureServiceGapFormatterResult *v6;
  uint64_t v8;

  v8 = 0;
  -[MKTransitDepartureServiceGapFormatter _descriptionForDepartureDate:canIncludeDate:outDateFormat:](self, "_descriptionForDepartureDate:canIncludeDate:outDateFormat:", a3, 0, &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  if ((unint64_t)(v8 - 1) <= 3)
  {
    _MKLocalizedStringFromThisBundle(CFSTR("Last departure at <hours:minutes> format"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = [MKTransitDepartureServiceGapFormatterResult alloc];
  v6 = -[MKTransitDepartureServiceGapFormatterResult initWithFormat:dateDescription:dateFormat:](v5, "initWithFormat:dateDescription:dateFormat:", v4, v3, v8);

  return v6;
}

- (id)_descriptionForDepartureDate:(id)a3 canIncludeDate:(BOOL)a4 outDateFormat:(unint64_t *)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v19;
  uint64_t v20;
  uint64_t v21;

  v6 = a4;
  v8 = a3;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[MKTransitDepartureServiceGapFormatter timeZone](self, "timeZone");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "_navigation_isDateInToday:inTimeZone:", v8, v10))
    {

    }
    else
    {
      -[MKTransitDepartureServiceGapFormatter departureCutoffDate](self, "departureCutoffDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "timeIntervalSinceDate:", v11);
      v13 = v12;

      if (v13 >= 43200.0)
      {
        v21 = 0;
        -[MKTransitDepartureServiceGapFormatter timeZone](self, "timeZone");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "_navigation_transitRelativeDateStringForDate:context:inTimeZone:outUsedFormat:", v8, 5, v19, &v21);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = 2;
        if (v21 == 1)
          v20 = 3;
        v17 = 4;
        if (v21 != 2)
          v17 = v20;
        if (a5)
          goto LABEL_8;
        goto LABEL_9;
      }
    }
  }
  if (qword_1ECE2DC38 != -1)
    dispatch_once(&qword_1ECE2DC38, &__block_literal_global_64);
  v14 = (void *)_MergedGlobals_156;
  -[MKTransitDepartureServiceGapFormatter timeZone](self, "timeZone");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTimeZone:", v15);

  objc_msgSend((id)_MergedGlobals_156, "stringFromDate:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 1;
  if (a5)
LABEL_8:
    *a5 = v17;
LABEL_9:

  return v16;
}

uint64_t __99__MKTransitDepartureServiceGapFormatter__descriptionForDepartureDate_canIncludeDate_outDateFormat___block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_MergedGlobals_156;
  _MergedGlobals_156 = (uint64_t)v0;

  v2 = (void *)_MergedGlobals_156;
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  return objc_msgSend((id)_MergedGlobals_156, "setLocalizedDateFormatFromTemplate:", CFSTR("jma"));
}

- (NSDate)departureCutoffDate
{
  return self->_departureCutoffDate;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_departureCutoffDate, 0);
}

@end
