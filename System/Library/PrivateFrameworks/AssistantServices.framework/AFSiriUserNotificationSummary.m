@implementation AFSiriUserNotificationSummary

- (AFSiriUserNotificationSummary)initWithSummary:(id)a3 summaryType:(int64_t)a4 error:(id)a5
{
  id v9;
  id v10;
  AFSiriUserNotificationSummary *v11;
  AFSiriUserNotificationSummary *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)AFSiriUserNotificationSummary;
  v11 = -[AFSiriUserNotificationSummary init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_summary, a3);
    v12->_summaryType = a4;
    objc_storeStrong((id *)&v12->_error, a5);
  }

  return v12;
}

- (id)description
{
  void *v3;
  unint64_t summaryType;
  NSString *summary;
  __CFString *v6;
  __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  summary = self->_summary;
  summaryType = self->_summaryType;
  if (summaryType > 2)
    v6 = CFSTR("(unknown)");
  else
    v6 = off_1E3A31088[summaryType];
  v7 = v6;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("AFSiriUserNotificationSummary<summary: %@ summaryType: %@, error: %@>"), summary, v7, self->_error);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[AFSiriUserNotificationSummary summary](self, "summary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("summary"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[AFSiriUserNotificationSummary summaryType](self, "summaryType"), CFSTR("summaryType"));
  -[AFSiriUserNotificationSummary error](self, "error");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("error"));

}

- (AFSiriUserNotificationSummary)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  AFSiriUserNotificationSummary *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("summary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("summaryType"));
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("error"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[AFSiriUserNotificationSummary initWithSummary:summaryType:error:](self, "initWithSummary:summaryType:error:", v5, v6, v7);
  return v8;
}

- (NSString)summary
{
  return self->_summary;
}

- (int64_t)summaryType
{
  return self->_summaryType;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_summary, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
