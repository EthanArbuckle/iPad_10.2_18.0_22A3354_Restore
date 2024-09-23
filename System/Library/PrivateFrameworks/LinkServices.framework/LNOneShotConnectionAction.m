@implementation LNOneShotConnectionAction

- (LNOneShotConnectionAction)initWithIdentifier:(id)a3 action:(id)a4 executorOptions:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  LNOneShotConnectionAction *v13;
  LNOneShotConnectionAction *v14;
  LNOneShotConnectionAction *v15;
  void *v17;
  void *v18;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNOneShotConnectionAction.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("oneShotAction"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNOneShotConnectionAction.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("executorOptions"));

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)LNOneShotConnectionAction;
  v13 = -[LNConnectionAction initWithIdentifier:metadataVersion:](&v19, sel_initWithIdentifier_metadataVersion_, v9, 1);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_action, a4);
    objc_storeStrong((id *)&v14->_executorOptions, a5);
    v15 = v14;
  }

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)LNOneShotConnectionAction;
  v4 = a3;
  -[LNConnectionAction encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[LNOneShotConnectionAction action](self, "action", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("action"));

  -[LNOneShotConnectionAction executorOptions](self, "executorOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("executorOptions"));

}

- (LNOneShotConnectionAction)initWithCoder:(id)a3
{
  id v4;
  LNOneShotConnectionAction *v5;
  uint64_t v6;
  LNAction *action;
  uint64_t v8;
  LNActionExecutorOptions *executorOptions;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)LNOneShotConnectionAction;
  v5 = -[LNConnectionAction initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("action"));
    v6 = objc_claimAutoreleasedReturnValue();
    action = v5->_action;
    v5->_action = (LNAction *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("executorOptions"));
    v8 = objc_claimAutoreleasedReturnValue();
    executorOptions = v5->_executorOptions;
    v5->_executorOptions = (LNActionExecutorOptions *)v8;

  }
  return v5;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[LNConnectionAction identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  objc_msgSend(v4, "encodeInt64:forKey:", -[LNConnectionAction metadataVersion](self, "metadataVersion"), CFSTR("metadataVersion"));
  -[LNOneShotConnectionAction action](self, "action");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("action"));

  -[LNOneShotConnectionAction executorOptions](self, "executorOptions");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("executorOptions"));

}

- (LNOneShotConnectionAction)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  LNOneShotConnectionAction *v6;
  uint64_t v7;
  LNAction *action;
  uint64_t v9;
  LNActionExecutorOptions *executorOptions;
  LNOneShotConnectionAction *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[LNConnectionAction initWithIdentifier:metadataVersion:](self, "initWithIdentifier:metadataVersion:", v5, objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("metadataVersion")));
    if (v6)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("action"));
      v7 = objc_claimAutoreleasedReturnValue();
      action = v6->_action;
      v6->_action = (LNAction *)v7;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("executorOptions"));
      v9 = objc_claimAutoreleasedReturnValue();
      executorOptions = v6->_executorOptions;
      v6->_executorOptions = (LNActionExecutorOptions *)v9;

    }
    self = v6;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (LNAction)action
{
  return self->_action;
}

- (LNActionExecutorOptions)executorOptions
{
  return self->_executorOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executorOptions, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

@end
