@implementation RTMotionActivity

+ (id)motionActivityTypeToString:(unint64_t)a3
{
  if (a3 > 6)
    return CFSTR("Invalid");
  else
    return off_1E4FB1620[a3];
}

+ (id)motionActivityConfidenceToString:(unint64_t)a3
{
  if (a3 > 3)
    return CFSTR("Invalid");
  else
    return off_1E4FB1658[a3];
}

+ (unint64_t)motionActivityTypeFromString:(id)a3
{
  void *v3;
  unint64_t v4;

  objc_msgSend(&unk_1E4FC1350, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

+ (unint64_t)motionActivityConfidenceFromString:(id)a3
{
  void *v3;
  unint64_t v4;

  objc_msgSend(&unk_1E4FC1378, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (RTMotionActivity)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithType_confidence_startDate_);
}

- (RTMotionActivity)initWithType:(unint64_t)a3 confidence:(unint64_t)a4 startDate:(id)a5
{
  id v8;
  RTMotionActivity *v9;
  RTMotionActivity *v10;
  uint64_t v11;
  NSDate *startDate;
  RTMotionActivity *v13;
  NSObject *v14;
  objc_super v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (v8)
  {
    v16.receiver = self;
    v16.super_class = (Class)RTMotionActivity;
    v9 = -[RTMotionActivity init](&v16, sel_init);
    v10 = v9;
    if (v9)
    {
      v9->_type = a3;
      v9->_confidence = a4;
      v11 = objc_msgSend(v8, "copy");
      startDate = v10->_startDate;
      v10->_startDate = (NSDate *)v11;

    }
    self = v10;
    v13 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[RTMotionActivity initWithType:confidence:startDate:]";
      v19 = 1024;
      v20 = 97;
      _os_log_error_impl(&dword_1A5E26000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startDate (in %s:%d)", buf, 0x12u);
    }

    v13 = 0;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  RTMotionActivity *v4;
  RTMotionActivity *v5;
  unint64_t v6;
  unint64_t v7;
  BOOL v8;

  v4 = (RTMotionActivity *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[RTMotionActivity type](self, "type");
      v8 = 0;
      if (v6 == -[RTMotionActivity type](v5, "type"))
      {
        v7 = -[RTMotionActivity confidence](self, "confidence");
        if (v7 == -[RTMotionActivity confidence](v5, "confidence"))
          v8 = 1;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_type);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_confidence);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "motionActivityTypeToString:", self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "motionActivityConfidenceToString:", self->_confidence);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate stringFromDate](self->_startDate, "stringFromDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("type, %@, confidence, %@, startDate, %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTMotionActivity)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  RTMotionActivity *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("confidence"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[RTMotionActivity initWithType:confidence:startDate:](self, "initWithType:confidence:startDate:", v6, v8, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  unint64_t type;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  type = self->_type;
  v8 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", type);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("type"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_confidence);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("confidence"));

  objc_msgSend(v8, "encodeObject:forKey:", self->_startDate, CFSTR("startDate"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithType:confidence:startDate:", self->_type, self->_confidence, self->_startDate);
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)confidence
{
  return self->_confidence;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
