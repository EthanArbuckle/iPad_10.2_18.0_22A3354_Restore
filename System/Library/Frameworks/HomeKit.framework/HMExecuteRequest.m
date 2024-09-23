@implementation HMExecuteRequest

- (HMExecuteRequest)initWithActionSet:(id)a3
{
  id v5;
  id *v6;
  HMExecuteRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMExecuteRequest;
  v6 = -[HMRequestBase _init](&v9, sel__init);
  v7 = (HMExecuteRequest *)v6;
  if (v6)
    objc_storeStrong(v6 + 1, a3);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  HMExecuteRequest *v4;
  HMExecuteRequest *v5;
  HMExecuteRequest *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (HMExecuteRequest *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      -[HMExecuteRequest actionSet](self, "actionSet");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMExecuteRequest actionSet](v6, "actionSet");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqual:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMExecuteRequest actionSet](self, "actionSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (HMActionSet)actionSet
{
  return self->_actionSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionSet, 0);
}

+ (id)executeRequestWithActionSet:(id)a3
{
  id v3;
  HMExecuteRequest *v4;

  v3 = a3;
  v4 = -[HMExecuteRequest initWithActionSet:]([HMExecuteRequest alloc], "initWithActionSet:", v3);

  return v4;
}

@end
