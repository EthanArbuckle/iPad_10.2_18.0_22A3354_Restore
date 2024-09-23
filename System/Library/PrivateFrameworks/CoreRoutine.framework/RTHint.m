@implementation RTHint

- (RTLocation)location
{
  return self->_location;
}

- (int64_t)source
{
  return self->_source;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

- (RTHint)initWithLocation:(id)a3 source:(int64_t)a4 date:(id)a5
{
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  RTHint *v13;
  RTHint *v14;
  RTHint *v15;
  NSObject *v16;
  const char *v17;
  objc_super v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = v10;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
LABEL_13:

      v15 = 0;
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    v17 = "Invalid parameter not satisfying: location";
LABEL_16:
    _os_log_error_impl(&dword_1A5E26000, v16, OS_LOG_TYPE_ERROR, v17, buf, 2u);
    goto LABEL_13;
  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    *(_WORD *)buf = 0;
    v17 = "Invalid parameter not satisfying: date";
    goto LABEL_16;
  }
  if ((unint64_t)(a4 + 1) >= 0xC)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[RTHint initWithLocation:source:date:]";
      v22 = 1024;
      v23 = 89;
      _os_log_error_impl(&dword_1A5E26000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: source >= RTHintSourceFirst() && source <= RTHintSourceLast() (in %s:%d)", buf, 0x12u);
    }

  }
  v19.receiver = self;
  v19.super_class = (Class)RTHint;
  v13 = -[RTHint init](&v19, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_location, a3);
    v14->_source = a4;
    objc_storeStrong((id *)&v14->_date, a5);
  }
  self = v14;
  v15 = self;
LABEL_14:

  return v15;
}

+ (id)hintSourceToString:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) > 0xB)
    return CFSTR("Bluetooth");
  else
    return off_1E4FB1708[a3 + 1];
}

- (RTHint)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithLocation_source_date_);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[RTHint location](self, "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTHint hintSourceToString:](RTHint, "hintSourceToString:", -[RTHint source](self, "source"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTHint date](self, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("location, %@, source, %@, date, %@"), v4, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *date;
  void *v5;
  id v6;

  date = self->_date;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", date, CFSTR("date"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_source);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("source"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_location, CFSTR("location"));
}

- (RTHint)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  RTHint *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("source"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("location"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[RTHint initWithLocation:source:date:](self, "initWithLocation:source:date:", v8, v7, v5);
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  RTHint *v4;
  RTHint *v5;
  RTHint *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  BOOL v17;
  char v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  int64_t v28;
  void *v30;

  v4 = (RTHint *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_7;
  if (self == v4)
  {
    v18 = 1;
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    -[RTHint location](self, "location");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "latitude");
    v9 = v8;
    -[RTHint location](v6, "location");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "latitude");
    if (v9 == v11)
    {
      -[RTHint location](self, "location");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "longitude");
      v14 = v13;
      -[RTHint location](v6, "location");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "longitude");
      if (v14 == v16)
      {
        -[RTHint location](self, "location");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "horizontalUncertainty");
        v21 = v20;
        -[RTHint location](v6, "location");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "horizontalUncertainty");
        if (v21 == v23)
        {
          -[RTHint date](self, "date");
          v24 = objc_claimAutoreleasedReturnValue();
          -[RTHint date](v6, "date");
          v25 = objc_claimAutoreleasedReturnValue();
          v30 = (void *)v24;
          v26 = (void *)v24;
          v27 = (void *)v25;
          if (objc_msgSend(v26, "isEqualToDate:", v25))
          {
            v28 = -[RTHint source](self, "source");
            v17 = v28 != -[RTHint source](v6, "source");
          }
          else
          {
            v17 = 1;
          }

        }
        else
        {
          v17 = 1;
        }

      }
      else
      {
        v17 = 1;
      }

    }
    else
    {
      v17 = 1;
    }

    v18 = !v17;
  }
  else
  {
LABEL_7:
    v18 = 0;
  }
LABEL_19:

  return v18;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[RTHint location](self, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[RTHint date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[RTHint source](self, "source"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

@end
