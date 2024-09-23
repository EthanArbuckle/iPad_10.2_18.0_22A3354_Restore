@implementation HDAudioAnalyticsResult

- (HDAudioAnalyticsResult)initWithStatus:(int64_t)a3 error:(id)a4
{
  id v7;
  HDAudioAnalyticsResult *v8;
  HDAudioAnalyticsResult *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HDAudioAnalyticsResult;
  v8 = -[HDAudioAnalyticsResult init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_status = a3;
    objc_storeStrong((id *)&v8->_error, a4);
  }

  return v9;
}

- (int64_t)status
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
