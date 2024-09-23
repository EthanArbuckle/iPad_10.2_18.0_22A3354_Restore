@implementation LACUIPackagedViewState

- (LACUIPackagedViewState)initWithName:(id)a3
{
  id v4;
  LACUIPackagedViewStateAnimationOptions *v5;
  LACUIPackagedViewState *v6;

  v4 = a3;
  v5 = objc_alloc_init(LACUIPackagedViewStateAnimationOptions);
  v6 = -[LACUIPackagedViewState initWithName:animationOptions:](self, "initWithName:animationOptions:", v4, v5);

  return v6;
}

- (LACUIPackagedViewState)initWithName:(id)a3 animationOptions:(id)a4
{
  id v7;
  id v8;
  LACUIPackagedViewState *v9;
  LACUIPackagedViewState *v10;
  NSMutableArray *v11;
  NSMutableArray *substates;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)LACUIPackagedViewState;
  v9 = -[LACUIPackagedViewState init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    substates = v10->_substates;
    v10->_substates = v11;

    objc_storeStrong((id *)&v10->_animationOptions, a4);
  }

  return v10;
}

- (void)addSubstate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[LACUIPackagedViewState substates](self, "substates");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (BOOL)finishesWithStateNamed:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[LACUIPackagedViewState substates](self, "substates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    -[LACUIPackagedViewState substates](self, "substates");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "finishesWithStateNamed:", v4);

    v4 = v8;
  }
  else
  {
    -[LACUIPackagedViewState name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v4, "isEqualToString:", v7);
  }

  return v9;
}

- (BOOL)containsStateNamed:(id)a3
{
  id v4;
  void *v5;
  char v6;
  BOOL v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[LACUIPackagedViewState name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", v4);

  if ((v6 & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    -[LACUIPackagedViewState substates](self, "substates");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __45__LACUIPackagedViewState_containsStateNamed___block_invoke;
    v10[3] = &unk_2510F8478;
    v11 = v4;
    v7 = objc_msgSend(v8, "indexOfObjectPassingTest:", v10) != 0x7FFFFFFFFFFFFFFFLL;

  }
  return v7;
}

uint64_t __45__LACUIPackagedViewState_containsStateNamed___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsStateNamed:", *(_QWORD *)(a1 + 32));
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[LACUIPackagedViewState name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACUIPackagedViewState substates](self, "substates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACUIPackagedViewState animationOptions](self, "animationOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@; %p; name:%@; substates:%@; animationOptons:%@>"),
    v4,
    self,
    v5,
    v6,
    v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (LACUIPackagedViewStateAnimationOptions)animationOptions
{
  return self->_animationOptions;
}

- (void)setAnimationOptions:(id)a3
{
  objc_storeStrong((id *)&self->_animationOptions, a3);
}

- (NSMutableArray)substates
{
  return self->_substates;
}

- (void)setSubstates:(id)a3
{
  objc_storeStrong((id *)&self->_substates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_substates, 0);
  objc_storeStrong((id *)&self->_animationOptions, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
