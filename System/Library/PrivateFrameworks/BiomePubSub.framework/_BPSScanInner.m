@implementation _BPSScanInner

- (_BPSScanInner)initWithDownstream:(id)a3 nextPartialResult:(id)a4 initialResult:(id)a5
{
  id v9;
  id v10;
  id v11;
  _BPSScanInner *v12;
  _BPSScanInner *v13;
  uint64_t v14;
  id nextPartialResult;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_BPSScanInner;
  v12 = -[_BPSScanInner init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_downstream, a3);
    v14 = objc_msgSend(v10, "copy");
    nextPartialResult = v13->_nextPartialResult;
    v13->_nextPartialResult = (id)v14;

    objc_storeStrong(&v13->_result, a5);
  }

  return v13;
}

- (void)receiveSubscription:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_BPSScanInner downstream](self, "downstream");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "receiveSubscription:", v4);

}

- (int64_t)receiveInput:(id)a3
{
  _BPSScanInner *v4;
  id v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;

  v4 = self;
  v5 = a3;
  -[_BPSScanInner nextPartialResult](v4, "nextPartialResult");
  v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[_BPSScanInner result](v4, "result");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, id))v6)[2](v6, v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[_BPSScanInner setResult:](v4, "setResult:", v8);
  -[_BPSScanInner downstream](v4, "downstream");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_BPSScanInner result](v4, "result");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "receiveInput:", v10);

  return v11;
}

- (void)receiveCompletion:(id)a3
{
  _BPSScanInner *v4;
  id v5;
  NSObject *v6;
  void *v7;

  v4 = self;
  v5 = a3;
  __biome_log_for_category();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[_BPSScanInner receiveCompletion:].cold.1();

  -[_BPSScanInner downstream](v4, "downstream");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "receiveCompletion:", v5);

}

- (void)cancel
{
  void *v2;
  _BPSScanInner *v3;

  v3 = self;
  -[_BPSScanInner downstream](v3, "downstream");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancel");

}

- (BPSSubscriber)downstream
{
  return self->_downstream;
}

- (void)setDownstream:(id)a3
{
  objc_storeStrong((id *)&self->_downstream, a3);
}

- (id)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong(&self->_result, a3);
}

- (id)nextPartialResult
{
  return self->_nextPartialResult;
}

- (void)setNextPartialResult:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_nextPartialResult, 0);
  objc_storeStrong(&self->_result, 0);
  objc_storeStrong((id *)&self->_downstream, 0);
}

- (void)receiveCompletion:.cold.1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)objc_opt_class();
  v1 = OUTLINED_FUNCTION_4(v0);
  OUTLINED_FUNCTION_0(&dword_1A956A000, v2, v3, "%@ - completion", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

@end
