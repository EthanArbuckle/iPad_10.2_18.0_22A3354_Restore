@implementation NFStateMachineEvent

- (NFStateMachineEvent)initWithName:(id)a3 transitionFromStates:(id)a4 toState:(id)a5
{
  id v9;
  id v10;
  id v11;
  NFStateMachineEvent *v12;
  NFStateMachineEvent *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)NFStateMachineEvent;
  v12 = -[NFStateMachineEvent init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_name, a3);
    objc_storeStrong((id *)&v13->_states, a4);
    objc_storeStrong((id *)&v13->_destinationState, a5);
  }

  return v13;
}

- (NSString)name
{
  return self->_name;
}

- (id)fired:(id)a3 withOwner:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;

  v6 = a3;
  v7 = a4;
  -[NFStateMachineEvent fireBlock](self, "fireBlock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NFStateMachineEvent fireBlock](self, "fireBlock");
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

- (id)fireBlock
{
  return self->_fireBlock;
}

- (NSSet)states
{
  return self->_states;
}

- (NFStateMachineState)destinationState
{
  return self->_destinationState;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[NFStateMachineEvent name](self, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  NFStateMachineEvent *v4;
  NFStateMachineEvent *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (NFStateMachineEvent *)a3;
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
      -[NFStateMachineEvent name](self, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NFStateMachineEvent name](v5, "name");
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
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[NFStateMachineEvent name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NFStateMachineEvent states](self, "states");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NFStateMachineEvent destinationState](self, "destinationState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{%p name=%@, from=%@, to=%@}"), self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)onFire:(id)a3
{
  -[NFStateMachineEvent setFireBlock:](self, "setFireBlock:", a3);
  return self;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setStates:(id)a3
{
  objc_storeStrong((id *)&self->_states, a3);
}

- (void)setDestinationState:(id)a3
{
  objc_storeStrong((id *)&self->_destinationState, a3);
}

- (void)setFireBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fireBlock, 0);
  objc_storeStrong((id *)&self->_destinationState, 0);
  objc_storeStrong((id *)&self->_states, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
