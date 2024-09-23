@implementation _CNFlatMapInnerSubscriptionContext

- (CNCancelable)token
{
  return self->_token;
}

- (_CNFlatMapInnerSubscriptionContext)initWithDecorator:(id)a3 token:(id)a4
{
  id v7;
  id v8;
  _CNFlatMapInnerSubscriptionContext *v9;
  _CNFlatMapInnerSubscriptionContext *v10;
  _CNFlatMapInnerSubscriptionContext *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_CNFlatMapInnerSubscriptionContext;
  v9 = -[_CNFlatMapInnerSubscriptionContext init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_decorator, a3);
    objc_storeStrong((id *)&v10->_token, a4);
    v11 = v10;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_decorator, 0);
}

- (CNSuspendableSchedulerDecorator)decorator
{
  return self->_decorator;
}

@end
