@implementation AFMetrics

- (AFMetrics)initWithOriginalCommandId:(id)a3 category:(int64_t)a4 duration:(id)a5
{
  return -[AFMetrics initWithOriginalCommandId:category:eventInfo:duration:](self, "initWithOriginalCommandId:category:eventInfo:duration:", a3, a4, 0, a5);
}

- (AFMetrics)initWithOriginalCommandId:(id)a3 category:(int64_t)a4 eventInfo:(id)a5 duration:(id)a6
{
  id v10;
  id v11;
  id v12;
  AFMetrics *v13;
  uint64_t v14;
  NSString *originalCommandId;
  uint64_t v16;
  NSDictionary *eventInfo;
  objc_super v19;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)AFMetrics;
  v13 = -[AFMetrics init](&v19, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    originalCommandId = v13->_originalCommandId;
    v13->_originalCommandId = (NSString *)v14;

    v13->_category = a4;
    v16 = objc_msgSend(v11, "copy");
    eventInfo = v13->_eventInfo;
    v13->_eventInfo = (NSDictionary *)v16;

    objc_storeStrong((id *)&v13->_duration, a6);
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *originalCommandId;
  id v5;

  originalCommandId = self->_originalCommandId;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", originalCommandId, CFSTR("_originalCommandId"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_category, CFSTR("_category"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_eventInfo, CFSTR("_eventInfo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_duration, CFSTR("_duration"));

}

- (AFMetrics)initWithCoder:(id)a3
{
  id v4;
  AFMetrics *v5;
  uint64_t v6;
  NSString *originalCommandId;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSDictionary *eventInfo;
  uint64_t v13;
  NSNumber *duration;
  objc_super v16;
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AFMetrics;
  v5 = -[AFMetrics init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_originalCommandId"));
    v6 = objc_claimAutoreleasedReturnValue();
    originalCommandId = v5->_originalCommandId;
    v5->_originalCommandId = (NSString *)v6;

    v5->_category = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_category"));
    v8 = (void *)MEMORY[0x1E0C99E60];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    v17[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("_eventInfo"));
    v11 = objc_claimAutoreleasedReturnValue();
    eventInfo = v5->_eventInfo;
    v5->_eventInfo = (NSDictionary *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_duration"));
    v13 = objc_claimAutoreleasedReturnValue();
    duration = v5->_duration;
    v5->_duration = (NSNumber *)v13;

  }
  return v5;
}

- (id)aceMetrics
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0D882C8]);
  -[AFMetrics originalCommandId](self, "originalCommandId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOriginalCommandId:", v4);

  -[AFMetrics categoryString](self, "categoryString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCategory:", v5);

  -[AFMetrics eventInfo](self, "eventInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEventInformation:", v6);

  -[AFMetrics duration](self, "duration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "doubleValue");
    -[AFMetrics _roundDouble:toSignificantDigits:](self, "_roundDouble:toSignificantDigits:", 2);
    v13 = CFSTR("Duration");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", fmin(v9, 3600.0));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = (void *)MEMORY[0x1E0C9AA70];
  }
  objc_msgSend(v3, "setTimings:", v11);

  return v3;
}

- (double)_roundDouble:(double)a3 toSignificantDigits:(unint64_t)a4
{
  double result;
  double v8;
  double v9;

  result = 0.0;
  if (a3 != 0.0 && a4 != 0)
  {
    v8 = log10(fabs(a3));
    v9 = __exp10((double)(uint64_t)(a4 - vcvtpd_s64_f64(v8)));
    return (double)(uint64_t)round(v9 * a3) / v9;
  }
  return result;
}

- (id)categoryString
{
  unint64_t category;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  category = self->_category;
  if (category <= 8)
    return off_1E3A31330[category];
  v4 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    v5 = 136315138;
    v6 = "-[AFMetrics categoryString]";
    _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s Invalid AFMetrics category", (uint8_t *)&v5, 0xCu);
  }
  return &stru_1E3A37708;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)AFMetrics;
  -[AFMetrics description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFMetrics originalCommandId](self, "originalCommandId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFMetrics categoryString](self, "categoryString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFMetrics duration](self, "duration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFMetrics eventInfo](self, "eventInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - originalCommandId: %@, category: %@, duration: %@, eventInfo: %@"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)originalCommandId
{
  return self->_originalCommandId;
}

- (void)setOriginalCommandId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)category
{
  return self->_category;
}

- (void)setCategory:(int64_t)a3
{
  self->_category = a3;
}

- (NSDictionary)eventInfo
{
  return self->_eventInfo;
}

- (void)setEventInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)duration
{
  return self->_duration;
}

- (void)setDuration:(id)a3
{
  objc_storeStrong((id *)&self->_duration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_eventInfo, 0);
  objc_storeStrong((id *)&self->_originalCommandId, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
