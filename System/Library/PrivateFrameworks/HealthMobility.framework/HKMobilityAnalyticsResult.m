@implementation HKMobilityAnalyticsResult

+ (id)resultWithStatus:(unint64_t)a3 error:(id)a4
{
  id v5;
  HKMobilityAnalyticsResult *v6;

  v5 = a4;
  v6 = -[HKMobilityAnalyticsResult initWithStatus:error:]([HKMobilityAnalyticsResult alloc], "initWithStatus:error:", a3, v5);

  return v6;
}

- (HKMobilityAnalyticsResult)initWithStatus:(unint64_t)a3 error:(id)a4
{
  id v7;
  HKMobilityAnalyticsResult *v8;
  HKMobilityAnalyticsResult *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HKMobilityAnalyticsResult;
  v8 = -[HKMobilityAnalyticsResult init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_status = a3;
    objc_storeStrong((id *)&v8->_error, a4);
  }

  return v9;
}

- (unint64_t)status
{
  return self->_status;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

@end
