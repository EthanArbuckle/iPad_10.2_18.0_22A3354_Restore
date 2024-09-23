@implementation HMFFulfilledFuture

- (id)initWithValue:(id *)a1
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
  id v2;
  int64_t v3;
  _HMFFutureBlockOutcome result;

  v2 = self->_value;
  v3 = 1;
  result.var1 = v2;
  result.var0 = v3;
  return result;
}

- (void)getResultWithCompletion:(id)a3
{
  (*((void (**)(id, id, _QWORD))a3 + 2))(a3, self->_value, 0);
}

- (id)then:(id)a3
{
  uint64_t (**v4)(id, id);
  __objc2_class *v5;
  uint64_t v6;
  void *v7;

  v4 = (uint64_t (**)(id, id))a3;
  v5 = HMFFuture;
  v6 = v4[2](v4, self->_value);
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

- (id)inContext:(id)a3 then:(id)a4
{
  return +[HMFFuture _inContext:transform:with:]((uint64_t)HMFFuture, a3, self->_value, a4);
}

- (id)then:(id)a3 orRecover:(id)a4
{
  uint64_t (**v6)(id, id);
  id v7;
  __objc2_class *v8;
  uint64_t v9;
  void *v10;

  v6 = (uint64_t (**)(id, id))a3;
  v7 = a4;
  v8 = HMFFuture;
  v9 = v6[2](v6, self->_value);
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
  return +[HMFFuture _inContext:transform:with:]((uint64_t)HMFFuture, a3, self->_value, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
}

@end
