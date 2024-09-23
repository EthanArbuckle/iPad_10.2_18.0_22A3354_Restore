@implementation CLTimerWeakHolder

+ (id)holderWithTimer:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTimer:", v4);

  return v5;
}

- (CLTimerWeakHolder)initWithTimer:(id)a3
{
  id v4;
  CLTimerWeakHolder *v5;
  CLTimerWeakHolder *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CLTimerWeakHolder;
  v5 = -[CLTimerWeakHolder init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_timer, v4);

  return v6;
}

- (CLTimer)timer
{
  return (CLTimer *)objc_loadWeakRetained((id *)&self->_timer);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_timer);
}

@end
