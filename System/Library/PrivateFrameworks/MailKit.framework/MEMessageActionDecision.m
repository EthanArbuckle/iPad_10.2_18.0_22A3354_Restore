@implementation MEMessageActionDecision

+ (MEMessageActionDecision)decisionApplyingAction:(MEMessageAction *)action
{
  MEMessageAction *v3;
  MEMessageActionDecision *v4;
  void *v5;
  MEMessageActionDecision *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v3 = action;
  v4 = [MEMessageActionDecision alloc];
  v8[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MEMessageActionDecision initWithActions:invokeAgainWithBody:](v4, "initWithActions:invokeAgainWithBody:", v5, 0);

  return v6;
}

+ (MEMessageActionDecision)decisionApplyingActions:(NSArray *)actions
{
  NSArray *v3;
  MEMessageActionDecision *v4;

  v3 = actions;
  v4 = -[MEMessageActionDecision initWithActions:invokeAgainWithBody:]([MEMessageActionDecision alloc], "initWithActions:invokeAgainWithBody:", v3, 0);

  return v4;
}

+ (MEMessageActionDecision)invokeAgainWithBody
{
  return -[MEMessageActionDecision initWithActions:invokeAgainWithBody:]([MEMessageActionDecision alloc], "initWithActions:invokeAgainWithBody:", 0, 1);
}

- (MEMessageActionDecision)initWithActions:(id)a3 invokeAgainWithBody:(BOOL)a4
{
  id v7;
  MEMessageActionDecision *v8;
  MEMessageActionDecision *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MEMessageActionDecision;
  v8 = -[MEMessageActionDecision init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_actions, a3);
    v9->_invokeAgainWithBody = a4;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MEMessageActionDecision)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSArray *v9;
  NSArray *actions;
  NSArray *v11;
  MEMessageActionDecision *v12;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("EFPropertyKey_invokeAgainWithBody"));
  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("EFPropertyKey_actions"));
  v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
  actions = self->_actions;
  self->_actions = v9;

  v11 = v9;
  v12 = -[MEMessageActionDecision initWithActions:invokeAgainWithBody:](self, "initWithActions:invokeAgainWithBody:", v11, v5);

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MEMessageActionDecision actions](self, "actions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("EFPropertyKey_actions"));

  objc_msgSend(v5, "encodeBool:forKey:", -[MEMessageActionDecision invokeAgainWithBody](self, "invokeAgainWithBody"), CFSTR("EFPropertyKey_invokeAgainWithBody"));
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  int v10;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  if ((objc_msgSend(v5, "isEqual:", objc_opt_class()) & 1) != 0)
  {
    v6 = v4;
    -[MEMessageActionDecision actions](self, "actions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "actions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (EFArraysAreEqual())
    {
      v9 = -[MEMessageActionDecision invokeAgainWithBody](self, "invokeAgainWithBody");
      v10 = v9 ^ objc_msgSend(v6, "invokeAgainWithBody") ^ 1;
    }
    else
    {
      LOBYTE(v10) = 0;
    }

  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[MEMessageActionDecision actions](self, "actions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("MEMessageActionDecision: Actions:%@, invokeAgainWithBody: %ld"), v4, -[MEMessageActionDecision invokeAgainWithBody](self, "invokeAgainWithBody"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSArray)actions
{
  return self->_actions;
}

- (BOOL)invokeAgainWithBody
{
  return self->_invokeAgainWithBody;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
}

@end
