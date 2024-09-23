@implementation VNAsyncStatus

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

- (VNAsyncStatus)initWithStatus:(BOOL)a3 error:(id)a4
{
  id v7;
  VNAsyncStatus *v8;
  VNAsyncStatus *v9;
  BOOL v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  VNAsyncStatus *v16;
  id v18;
  objc_super v19;

  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)VNAsyncStatus;
  v8 = -[VNAsyncStatus init](&v19, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_completed = a3;
    objc_storeStrong((id *)&v8->_error, a4);
    v18 = 0;
    v10 = +[VNValidationUtilities validateAsyncStatusState:error:](VNValidationUtilities, "validateAsyncStatusState:error:", v9, &v18);
    v11 = v18;
    v12 = v11;
    if (!v10)
    {
      v13 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v11, "localizedDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("Invalid async state - %@"), v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[VNError VNAssert:log:](VNError, "VNAssert:log:", 0, v15);

    }
    v16 = v9;

  }
  return v9;
}

- (BOOL)completed
{
  return self->_completed;
}

- (NSError)error
{
  return self->_error;
}

- (VNAsyncStatus)init
{
  return -[VNAsyncStatus initWithStatus:error:](self, "initWithStatus:error:", 1, 0);
}

- (id)description
{
  id v3;
  _BOOL4 v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = -[VNAsyncStatus completed](self, "completed");
  -[VNAsyncStatus error](self, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("completed: %d: error: %@"), v4, v5);

  return v6;
}

@end
