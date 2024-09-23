@implementation MCMResultPromise

- (void)completeWithResult:(id)a3
{
  MCMResultPromise *v5;
  _QWORD *p_result;
  void (**v7)(_QWORD, _QWORD);
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = self;
  objc_sync_enter(v5);
  p_result = &v5->_result;
  objc_storeStrong((id *)&v5->_result, a3);
  v5->_complete = 1;
  -[MCMResultPromise completion](v5, "completion");
  v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  if (v7)
  {
    v7[2](v7, *p_result);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)*p_result;
    *p_result = v8;

  }
}

- (id)completion
{
  return self->_completion;
}

- (MCMResultPromise)initWithCompletion:(id)a3
{
  id v4;
  MCMResultPromise *v5;
  MCMResultPromise *v6;
  MCMResult *v7;
  uint64_t v8;
  id completion;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MCMResultPromise;
  v5 = -[MCMResultPromise init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    v7 = v5->_result;
    v5->_result = 0;

    v8 = MEMORY[0x1D17D71B4](v4);
    completion = v6->_completion;
    v6->_completion = (id)v8;

    v6->_complete = 0;
  }

  return v6;
}

- (BOOL)complete
{
  return self->_complete;
}

- (MCMResult)result
{
  MCMResultPromise *v2;
  MCMResult *v3;
  MCMResult *v4;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_result;
  if (!v3)
  {
    _os_crash();
    __break(1u);
  }
  v4 = v3;
  objc_sync_exit(v2);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_result, 0);
}

- (MCMResultPromise)init
{
  MCMResultPromise *v2;
  MCMResultPromise *v3;
  MCMResult *v4;
  id completion;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)MCMResultPromise;
  v2 = -[MCMResultPromise init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = v2->_result;
    v2->_result = 0;

    completion = v3->_completion;
    v3->_completion = 0;

    v3->_complete = 0;
  }
  return v3;
}

@end
