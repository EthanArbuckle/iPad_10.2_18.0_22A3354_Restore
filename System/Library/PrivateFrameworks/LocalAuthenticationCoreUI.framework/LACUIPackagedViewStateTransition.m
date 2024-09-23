@implementation LACUIPackagedViewStateTransition

- (LACUIPackagedViewStateTransition)initWithFromState:(id)a3 toState:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  LACUIPackagedViewStateTransition *v12;
  LACUIPackagedViewStateTransition *v13;
  uint64_t v14;
  id handler;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)LACUIPackagedViewStateTransition;
  v12 = -[LACUIPackagedViewStateTransition init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_fromState, a3);
    objc_storeStrong((id *)&v13->_toState, a4);
    v14 = objc_msgSend(v11, "copy");
    handler = v13->_handler;
    v13->_handler = (id)v14;

  }
  return v13;
}

- (void)dealloc
{
  objc_super v3;

  -[LACUIPackagedViewStateTransition complete:](self, "complete:", 0);
  v3.receiver = self;
  v3.super_class = (Class)LACUIPackagedViewStateTransition;
  -[LACUIPackagedViewStateTransition dealloc](&v3, sel_dealloc);
}

- (void)complete:(BOOL)a3
{
  id handler;
  _BOOL8 v5;
  id v6;
  void (**v7)(id, _BOOL8);

  handler = self->_handler;
  if (handler)
  {
    v5 = a3;
    v7 = (void (**)(id, _BOOL8))objc_msgSend(handler, "copy");
    v6 = self->_handler;
    self->_handler = 0;

    v7[2](v7, v5);
  }
}

- (LACUIPackagedViewState)fromState
{
  return self->_fromState;
}

- (LACUIPackagedViewState)toState
{
  return self->_toState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toState, 0);
  objc_storeStrong((id *)&self->_fromState, 0);
  objc_storeStrong(&self->_handler, 0);
}

@end
