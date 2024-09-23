@implementation AMSAuthenticateMetricsContext

- (AMSAuthenticateMetricsContext)initWithOptions:(id)a3 account:(id)a4
{
  id v7;
  id v8;
  AMSAuthenticateMetricsContext *v9;
  AMSAuthenticateMetricsContext *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSAuthenticateMetricsContext;
  v9 = -[AMSAuthenticateMetricsContext init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a4);
    objc_storeStrong((id *)&v10->_options, a3);
  }

  return v10;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (BOOL)isServerRequested
{
  return self->_isServerRequested;
}

- (void)setIsServerRequested:(BOOL)a3
{
  self->_isServerRequested = a3;
}

- (AMSAuthenticateOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
