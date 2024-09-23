@implementation AMSBridgedBagValue

- (AMSPromise)valuePromise
{
  return self->_valuePromise;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valuePromise, 0);
}

- (AMSBridgedBagValue)initWithKey:(id)a3 valueType:(unint64_t)a4 valuePromise:(id)a5
{
  id v9;
  AMSBridgedBagValue *v10;
  AMSBridgedBagValue *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)AMSBridgedBagValue;
  v10 = -[AMSFrozenBagValue initWithKey:value:valueType:](&v13, sel_initWithKey_value_valueType_, a3, 0, a4);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_valuePromise, a5);

  return v11;
}

- (AMSBridgedBagValue)valueWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  AMSBridgedBagValue *result;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[AMSBridgedBagValue valuePromise](self, "valuePromise");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__AMSBridgedBagValue_valueWithCompletion___block_invoke;
  v8[3] = &unk_1E253F8E8;
  v6 = v4;
  v9 = v6;
  objc_msgSend(v5, "addFinishBlock:", v8);

  return result;
}

uint64_t __42__AMSBridgedBagValue_valueWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setValuePromise:(id)a3
{
  objc_storeStrong((id *)&self->_valuePromise, a3);
}

@end
