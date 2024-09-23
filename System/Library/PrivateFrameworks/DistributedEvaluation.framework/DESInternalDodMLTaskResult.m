@implementation DESInternalDodMLTaskResult

- (DESInternalDodMLTaskResult)initWithJSONResult:(id)a3 binaryResult:(id)a4 deferred:(BOOL)a5 deferralURL:(id)a6 duration:(double)a7
{
  id v13;
  id v14;
  id v15;
  DESInternalDodMLTaskResult *v16;
  DESInternalDodMLTaskResult *v17;
  objc_super v19;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)DESInternalDodMLTaskResult;
  v16 = -[DESInternalDodMLTaskResult init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_JSONResult, a3);
    objc_storeStrong((id *)&v17->_binaryResult, a4);
    v17->_deferred = a5;
    objc_storeStrong((id *)&v17->_deferralURL, a6);
    v17->_duration = a7;
  }

  return v17;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DESInternalDodMLTaskResult binaryResult](self, "binaryResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");
  -[DESInternalDodMLTaskResult deferralURL](self, "deferralURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DESInternalDodMLTaskResult JSONResult](self, "JSONResult");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DESInternalDodMLTaskResult duration](self, "duration");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(binaryResult.length=%lu, deferralURL=%@, JSONResult=%@, duration=%.1f)"), v5, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSDictionary)JSONResult
{
  return self->_JSONResult;
}

- (NSData)binaryResult
{
  return self->_binaryResult;
}

- (BOOL)deferred
{
  return self->_deferred;
}

- (NSURL)deferralURL
{
  return self->_deferralURL;
}

- (double)duration
{
  return self->_duration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferralURL, 0);
  objc_storeStrong((id *)&self->_binaryResult, 0);
  objc_storeStrong((id *)&self->_JSONResult, 0);
}

@end
