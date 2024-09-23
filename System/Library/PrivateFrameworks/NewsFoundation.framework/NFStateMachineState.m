@implementation NFStateMachineState

- (id)onWillEnter:(id)a3
{
  -[NFStateMachineState setWillEnterBlock:](self, "setWillEnterBlock:", a3);
  return self;
}

- (void)setWillEnterBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NFStateMachineState)initWithName:(id)a3
{
  id v5;
  NFStateMachineState *v6;
  NFStateMachineState *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NFStateMachineState;
  v6 = -[NFStateMachineState init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_name, a3);

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[NFStateMachineState name](self, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)name
{
  return self->_name;
}

- (id)didEnter:(id)a3 withOwner:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;

  v6 = a3;
  v7 = a4;
  -[NFStateMachineState didEnterBlock](self, "didEnterBlock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NFStateMachineState didEnterBlock](self, "didEnterBlock");
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v9)[2](v9, v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[NFPromise asVoid](NFPromise, "asVoid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)didEnterBlock
{
  return self->_didEnterBlock;
}

- (void)willExit:(id)a3 withOwner:(id)a4
{
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;

  v9 = a3;
  v6 = a4;
  -[NFStateMachineState willExitBlock](self, "willExitBlock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NFStateMachineState willExitBlock](self, "willExitBlock");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v8)[2](v8, v9, v6);

  }
}

- (void)willEnter:(id)a3 withOwner:(id)a4
{
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;

  v9 = a3;
  v6 = a4;
  -[NFStateMachineState willEnterBlock](self, "willEnterBlock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NFStateMachineState willEnterBlock](self, "willEnterBlock");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v8)[2](v8, v9, v6);

  }
}

- (id)willEnterBlock
{
  return self->_willEnterBlock;
}

- (id)didExit:(id)a3 withOwner:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;

  v6 = a3;
  v7 = a4;
  -[NFStateMachineState didExitBlock](self, "didExitBlock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NFStateMachineState didExitBlock](self, "didExitBlock");
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v9)[2](v9, v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[NFPromise asVoid](NFPromise, "asVoid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (BOOL)canTry:(id)a3 withOwner:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t (**v9)(_QWORD, _QWORD, _QWORD);
  char v10;

  v6 = a3;
  v7 = a4;
  -[NFStateMachineState canTryBlock](self, "canTryBlock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NFStateMachineState canTryBlock](self, "canTryBlock");
    v9 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v10 = ((uint64_t (**)(_QWORD, id, id))v9)[2](v9, v6, v7);

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (id)willExitBlock
{
  return self->_willExitBlock;
}

- (id)didExitBlock
{
  return self->_didExitBlock;
}

- (id)canTryBlock
{
  return self->_canTryBlock;
}

- (id)onWillExit:(id)a3
{
  -[NFStateMachineState setWillExitBlock:](self, "setWillExitBlock:", a3);
  return self;
}

- (void)setWillExitBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)onDidEnter:(id)a3
{
  -[NFStateMachineState setDidEnterBlock:](self, "setDidEnterBlock:", a3);
  return self;
}

- (void)setDidEnterBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)isEqual:(id)a3
{
  NFStateMachineState *v4;
  NFStateMachineState *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (NFStateMachineState *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[NFStateMachineState name](self, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NFStateMachineState name](v5, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqualToString:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[NFStateMachineState name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{%p name=%@}"), self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)onCanTry:(id)a3
{
  -[NFStateMachineState setCanTryBlock:](self, "setCanTryBlock:", a3);
  return self;
}

- (id)onDidExit:(id)a3
{
  -[NFStateMachineState setDidExitBlock:](self, "setDidExitBlock:", a3);
  return self;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setCanTryBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setDidExitBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didEnterBlock, 0);
  objc_storeStrong(&self->_didExitBlock, 0);
  objc_storeStrong(&self->_willEnterBlock, 0);
  objc_storeStrong(&self->_willExitBlock, 0);
  objc_storeStrong(&self->_canTryBlock, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
