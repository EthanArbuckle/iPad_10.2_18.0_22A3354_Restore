@implementation RTPredictedDate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTPredictedDate)initWithCoder:(id)a3
{
  id v4;
  RTPredictedDate *v5;
  uint64_t v6;
  NSDate *date;
  double v8;
  double v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RTPredictedDate;
  v5 = -[RTPredictedDate init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
    v6 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSDate *)v6;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("uncertainty"));
    v5->_uncertainty = v8;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("confidence"));
    v5->_confidence = v9;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *date;
  id v5;

  date = self->_date;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", date, CFSTR("date"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("uncertainty"), self->_uncertainty);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("confidence"), self->_confidence);

}

- (RTPredictedDate)initWithDate:(id)a3 uncertainty:(double)a4 confidence:(double)a5
{
  id v8;
  RTPredictedDate *v9;
  uint64_t v10;
  NSDate *date;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RTPredictedDate;
  v9 = -[RTPredictedDate init](&v13, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    date = v9->_date;
    v9->_date = (NSDate *)v10;

    v9->_uncertainty = a4;
    v9->_confidence = a5;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[RTPredictedDate date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPredictedDate uncertainty](self, "uncertainty");
  v7 = v6;
  -[RTPredictedDate confidence](self, "confidence");
  v9 = (void *)objc_msgSend(v4, "initWithDate:uncertainty:confidence:", v5, v7, v8);

  return v9;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  if (qword_1ECF931D8 != -1)
    dispatch_once(&qword_1ECF931D8, &__block_literal_global_4);
  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NSDate timeIntervalSinceReferenceDate](self->_date, "timeIntervalSinceReferenceDate");
  v5 = v4;
  objc_msgSend((id)_MergedGlobals_8, "stringFromDate:", self->_date);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%f, %@, uncertainty, %.2f, confidence, %.1f"), v5, v6, *(_QWORD *)&self->_uncertainty, *(_QWORD *)&self->_confidence);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __30__RTPredictedDate_description__block_invoke()
{
  id v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_MergedGlobals_8;
  _MergedGlobals_8 = (uint64_t)v0;

  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_MergedGlobals_8, "setLocale:", v2);

  objc_msgSend((id)_MergedGlobals_8, "setDateStyle:", 1);
  return objc_msgSend((id)_MergedGlobals_8, "setTimeStyle:", 3);
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  RTPredictedDate *v5;
  RTPredictedDate *v6;
  RTPredictedDate *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  BOOL v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  char v20;

  v5 = (RTPredictedDate *)a3;
  v6 = v5;
  if (v5 == self)
  {
    v12 = 1;
    goto LABEL_19;
  }
  if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v12 = 0;
    goto LABEL_19;
  }
  v7 = v6;
  -[RTPredictedDate date](self, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    -[RTPredictedDate date](v7, "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v11 = 1;
LABEL_11:

      goto LABEL_12;
    }
  }
  -[RTPredictedDate date](self, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPredictedDate date](v7, "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqualToDate:", v10);

  if (!v8)
    goto LABEL_11;
LABEL_12:

  -[RTPredictedDate uncertainty](self, "uncertainty");
  v14 = v13;
  -[RTPredictedDate uncertainty](v7, "uncertainty");
  v16 = v15;
  -[RTPredictedDate confidence](self, "confidence");
  v18 = v17;
  -[RTPredictedDate confidence](v7, "confidence");
  if (v14 == v16)
    v20 = v11;
  else
    v20 = 0;
  if (v18 == v19)
    v12 = v20;
  else
    v12 = 0;

LABEL_19:
  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;

  -[RTPredictedDate date](self, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[RTPredictedDate uncertainty](self, "uncertainty");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash") ^ v4;
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[RTPredictedDate confidence](self, "confidence");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v7 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (NSDate)date
{
  return self->_date;
}

- (double)uncertainty
{
  return self->_uncertainty;
}

- (double)confidence
{
  return self->_confidence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
}

@end
