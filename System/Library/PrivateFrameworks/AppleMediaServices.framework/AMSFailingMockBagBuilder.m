@implementation AMSFailingMockBagBuilder

- (id)createMockBag
{
  AMSBagFailingDataSource *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  AMSBagFailingDataSource *v11;
  AMSBag *v12;

  v3 = [AMSBagFailingDataSource alloc];
  -[AMSMockBagBuilder profile](self, "profile");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = CFSTR("AMSFailingMockBag");
  -[AMSMockBagBuilder profileVersion](self, "profileVersion");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (const __CFString *)v7;
  else
    v9 = CFSTR("@");
  -[AMSFailingMockBagBuilder error](self, "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSFailingMockBagBuilder delay](self, "delay");
  v11 = -[AMSBagFailingDataSource initWithProfile:profileVersion:error:delay:](v3, "initWithProfile:profileVersion:error:delay:", v6, v9, v10);

  v12 = -[AMSBag initWithDataSource:]([AMSBag alloc], "initWithDataSource:", v11);
  return v12;
}

- (double)delay
{
  return self->_delay;
}

- (void)setDelay:(double)a3
{
  self->_delay = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

@end
