@implementation HMResponseBase

- (NSError)error
{
  return self->_error;
}

- (HMRequestBase)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (HMResponseBase)initWithRequest:(id)a3 value:(id)a4 error:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMResponseBase *v12;
  HMResponseBase *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMResponseBase;
  v12 = -[HMResponseBase init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_request, a3);
    objc_storeStrong((id *)&v13->_value, a4);
    objc_storeStrong((id *)&v13->_error, a5);
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

- (HMResponseBase)initWithRequest:(id)a3 error:(id)a4
{
  return -[HMResponseBase initWithRequest:value:error:](self, "initWithRequest:value:error:", a3, 0, a4);
}

- (NSCopying)value
{
  return self->_value;
}

@end
