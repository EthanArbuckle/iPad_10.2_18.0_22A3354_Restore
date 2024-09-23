@implementation CUTResult

- (CUTResult)initWithState:(int64_t)a3 value:(id)a4 error:(id)a5
{
  id v9;
  id v10;
  CUTResult *v11;
  CUTResult *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CUTResult;
  v11 = -[CUTResult init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_inError, a5);
    objc_storeStrong(&v12->_inValue, a4);
    v12->_state = a3;
  }

  return v12;
}

- (CUTResult)initWithError:(id)a3
{
  return (CUTResult *)MEMORY[0x1E0DE7D20](self, sel_initWithState_value_error_);
}

- (CUTResult)initWithSuccess:(id)a3
{
  return (CUTResult *)MEMORY[0x1E0DE7D20](self, sel_initWithState_value_error_);
}

- (id)value
{
  void *v5;

  if (-[CUTResult state](self, "state"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CUTResult.m"), 39, CFSTR("Unexpected state: Success"));

  }
  return self->_inValue;
}

- (NSError)error
{
  void *v5;

  if (-[CUTResult state](self, "state") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CUTResult.m"), 44, CFSTR("Unexpected state: Fail"));

  }
  return self->_inError;
}

- (int64_t)state
{
  return self->_state;
}

- (NSError)inError
{
  return self->_inError;
}

- (void)setInError:(id)a3
{
  objc_storeStrong((id *)&self->_inError, a3);
}

- (id)inValue
{
  return self->_inValue;
}

- (void)setInValue:(id)a3
{
  objc_storeStrong(&self->_inValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_inValue, 0);
  objc_storeStrong((id *)&self->_inError, 0);
}

@end
