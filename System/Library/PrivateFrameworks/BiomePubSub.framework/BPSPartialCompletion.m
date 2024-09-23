@implementation BPSPartialCompletion

- (BPSPartialCompletion)initWithState:(int64_t)a3 value:(id)a4 error:(id)a5
{
  id v9;
  id v10;
  BPSPartialCompletion *v11;
  BPSPartialCompletion *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BPSPartialCompletion;
  v11 = -[BPSPartialCompletion init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_state = a3;
    objc_storeStrong(&v11->_value, a4);
    objc_storeStrong((id *)&v12->_error, a5);
  }

  return v12;
}

+ (id)withState:(int64_t)a3 value:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithState:value:error:", a3, v6, 0);

  return v7;
}

+ (id)withState:(int64_t)a3 error:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithState:value:error:", a3, 0, v6);

  return v7;
}

+ (id)withState:(int64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithState:value:error:", a3, 0, 0);
}

- (int64_t)state
{
  return self->_state;
}

- (id)value
{
  return self->_value;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_value, 0);
}

@end
