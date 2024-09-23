@implementation BPSCompletion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

- (NSError)error
{
  return self->_error;
}

- (int64_t)state
{
  return self->_state;
}

+ (id)success
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithState:error:", 0, 0);
}

- (BPSCompletion)initWithState:(int64_t)a3 error:(id)a4
{
  id v7;
  BPSCompletion *v8;
  BPSCompletion *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BPSCompletion;
  v8 = -[BPSCompletion init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_state = a3;
    objc_storeStrong((id *)&v8->_error, a4);
  }

  return v9;
}

+ (id)failureWithError:(id)a3
{
  id v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "domain");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v6 = v4;
  if (v5 != CFSTR("BiomePubSubError"))
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v11 = *MEMORY[0x1E0CB3388];
    v12[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("BiomePubSubError"), 0, v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithState:error:", 1, v6);

  return v9;
}

- (id)description
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = -[BPSCompletion state](self, "state");
  v4 = (void *)MEMORY[0x1E0CB3940];
  if (v3)
  {
    -[BPSCompletion error](self, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("failure (%@)"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("success"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

@end
