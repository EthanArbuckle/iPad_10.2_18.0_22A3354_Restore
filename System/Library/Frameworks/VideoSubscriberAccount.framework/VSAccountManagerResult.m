@implementation VSAccountManagerResult

- (VSAccountManagerResult)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ initializer is not available."), v5);

  return 0;
}

- (VSAccountManagerResult)initWithOperation:(id)a3
{
  id v5;
  VSAccountManagerResult *v6;
  VSAccountManagerResult *v7;
  objc_super v9;

  v5 = a3;
  if (!v5)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The operation parameter must not be nil."));
  v9.receiver = self;
  v9.super_class = (Class)VSAccountManagerResult;
  v6 = -[VSAccountManagerResult init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_operation, a3);

  return v7;
}

- (void)cancel
{
  id v2;

  -[VSAccountManagerResult operation](self, "operation");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancel");

}

- (NSOperation)operation
{
  return self->_operation;
}

- (void)setOperation:(id)a3
{
  objc_storeStrong((id *)&self->_operation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operation, 0);
}

@end
