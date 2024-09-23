@implementation EFProcessTransaction

- (void)invalidate
{
  OS_os_transaction *transaction;

  transaction = self->_transaction;
  self->_transaction = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
}

+ (id)transactionWithDescription:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescription:", v4);

  return v5;
}

- (EFProcessTransaction)initWithDescription:(id)a3
{
  __CFString *v4;
  EFProcessTransaction *v5;
  __CFString *v6;
  __CFString *v7;
  uint64_t v8;
  OS_os_transaction *transaction;
  objc_super v11;

  v4 = (__CFString *)a3;
  v11.receiver = self;
  v11.super_class = (Class)EFProcessTransaction;
  v5 = -[EFProcessTransaction init](&v11, sel_init);
  if (v5)
  {
    v6 = CFSTR("<unnamed>");
    if (v4)
      v6 = v4;
    v7 = v6;

    v4 = objc_retainAutorelease(v7);
    -[__CFString UTF8String](v4, "UTF8String");
    v8 = os_transaction_create();
    transaction = v5->_transaction;
    v5->_transaction = (OS_os_transaction *)v8;

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;

  if (self->_transaction)
  {
    v3 = (void *)os_transaction_copy_description();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p> %s"), objc_opt_class(), self, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    free(v3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p> <invalidated>"), objc_opt_class(), self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (BOOL)extend
{
  return os_transaction_needs_more_time();
}

@end
