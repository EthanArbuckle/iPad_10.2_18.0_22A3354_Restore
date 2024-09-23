@implementation HMFRejectedFuture

- (id)initWithError:(id *)a1
{
  id v4;
  id *v5;

  v4 = a2;
  if (a1)
  {
    objc_storeStrong(a1 + 1, a2);
    v5 = a1;
  }

  return a1;
}

- (BOOL)isPending
{
  return 0;
}

- (_HMFFutureBlockOutcome)outcomeIfSettled
{
  NSError *v2;
  NSError *v3;
  NSError *v4;
  NSError *v5;
  int64_t v6;
  NSError *v7;
  _HMFFutureBlockOutcome result;

  v2 = self->_error;
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfUnspecifiedError");
    v4 = (NSError *)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  v6 = 2;
  v7 = v5;
  result.var1 = v7;
  result.var0 = v6;
  return result;
}

- (void)getResultWithCompletion:(id)a3
{
  (*((void (**)(id, _QWORD, NSError *))a3 + 2))(a3, 0, self->_error);
}

- (id)recover:(id)a3
{
  uint64_t (**v4)(id, NSError *);
  __objc2_class *v5;
  uint64_t v6;
  void *v7;

  v4 = (uint64_t (**)(id, NSError *))a3;
  v5 = HMFFuture;
  v6 = v4[2](v4, self->_error);
  if (HMFFuture)
  {
    +[HMFFuture _futureWithOutcome:]((uint64_t)HMFFuture, v6, v7);
    v5 = (__objc2_class *)objc_claimAutoreleasedReturnValue();
  }
  else
  {

  }
  return v5;
}

- (id)inContext:(id)a3 recover:(id)a4
{
  return +[HMFFuture _inContext:transform:with:]((uint64_t)HMFFuture, a3, self->_error, a4);
}

- (id)then:(id)a3 orRecover:(id)a4
{
  id v6;
  uint64_t (**v7)(id, NSError *);
  __objc2_class *v8;
  uint64_t v9;
  void *v10;

  v6 = a3;
  v7 = (uint64_t (**)(id, NSError *))a4;
  v8 = HMFFuture;
  v9 = v7[2](v7, self->_error);
  if (HMFFuture)
  {
    +[HMFFuture _futureWithOutcome:]((uint64_t)HMFFuture, v9, v10);
    v8 = (__objc2_class *)objc_claimAutoreleasedReturnValue();
  }
  else
  {

  }
  return v8;
}

- (id)inContext:(id)a3 then:(id)a4 orRecover:(id)a5
{
  return +[HMFFuture _inContext:transform:with:]((uint64_t)HMFFuture, a3, self->_error, a5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

@end
