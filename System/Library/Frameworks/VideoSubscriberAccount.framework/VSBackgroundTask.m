@implementation VSBackgroundTask

- (VSBackgroundTask)init
{
  VSBackgroundTask *v2;
  VSBackgroundTask *v3;
  NSString *name;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VSBackgroundTask;
  v2 = -[VSBackgroundTask init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    name = v2->_name;
    v2->_name = (NSString *)&stru_1E93A8CC0;

  }
  return v3;
}

- (BOOL)begin
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D87DF8], "currentProcess");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.common"), CFSTR("FinishTaskUninterruptable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0D87C98]);
  -[VSBackgroundTask name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithExplanation:target:attributes:", v6, v3, v7);

  v13 = 0;
  LOBYTE(v7) = objc_msgSend(v8, "acquireWithError:", &v13);
  v9 = v13;
  if ((v7 & 1) == 0)
  {
    VSErrorLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[VSBackgroundTask begin].cold.1((uint64_t)v9, v10);

    -[VSBackgroundTask delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "backgroundTaskExpired:", self);

  }
  -[VSBackgroundTask setAssertion:](self, "setAssertion:", v8);

  return 1;
}

- (void)end
{
  void *v3;

  -[VSBackgroundTask assertion](self, "assertion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[VSBackgroundTask setAssertion:](self, "setAssertion:", 0);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (VSBackgroundTaskDelegate)delegate
{
  return (VSBackgroundTaskDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (RBSAssertion)assertion
{
  return self->_assertion;
}

- (void)setAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_assertion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)begin
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D2419000, a2, OS_LOG_TYPE_ERROR, "Failed to acquire assertion: %@", (uint8_t *)&v2, 0xCu);
}

@end
