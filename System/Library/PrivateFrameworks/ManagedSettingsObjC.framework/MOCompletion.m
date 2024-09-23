@implementation MOCompletion

- (MOCompletion)initWithState:(unint64_t)a3 error:(id)a4
{
  NSError *v6;
  MOCompletion *v7;
  NSError *error;
  objc_super v10;

  v6 = (NSError *)a4;
  v10.receiver = self;
  v10.super_class = (Class)MOCompletion;
  v7 = -[MOCompletion init](&v10, sel_init);
  error = v7->_error;
  v7->_state = a3;
  v7->_error = v6;

  return v7;
}

+ (id)success
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithState:error:", 0, 0);
}

+ (id)failureWithError:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithState:error:", 1, v4);

  return v5;
}

- (unint64_t)state
{
  return self->_state;
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
