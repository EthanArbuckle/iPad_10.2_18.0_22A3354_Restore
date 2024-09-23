@implementation ATXUsageInsightsInferredModeEvent

- (ATXUsageInsightsInferredModeEvent)initWithATXMode:(unint64_t)a3 startTime:(id)a4 endTime:(id)a5
{
  id v9;
  id v10;
  ATXUsageInsightsInferredModeEvent *v11;
  ATXUsageInsightsInferredModeEvent *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ATXUsageInsightsInferredModeEvent;
  v11 = -[ATXUsageInsightsInferredModeEvent init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_atxMode = a3;
    objc_storeStrong((id *)&v11->_startTime, a4);
    objc_storeStrong((id *)&v12->_endTime, a5);
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[ATXUsageInsightsInferredModeEvent atxMode](self, "atxMode"), CFSTR("atxMode"));
  -[ATXUsageInsightsInferredModeEvent startTime](self, "startTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("startTime"));

  -[ATXUsageInsightsInferredModeEvent endTime](self, "endTime");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("endTime"));

}

- (ATXUsageInsightsInferredModeEvent)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  ATXUsageInsightsInferredModeEvent *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("atxMode"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startTime"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endTime"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[ATXUsageInsightsInferredModeEvent initWithATXMode:startTime:endTime:](self, "initWithATXMode:startTime:endTime:", v5, v6, v7);
  return v8;
}

- (unint64_t)atxMode
{
  return self->_atxMode;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (NSDate)endTime
{
  return self->_endTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
}

@end
