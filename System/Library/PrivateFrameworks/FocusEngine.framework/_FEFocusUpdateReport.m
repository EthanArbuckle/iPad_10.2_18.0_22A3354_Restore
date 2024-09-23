@implementation _FEFocusUpdateReport

- (_FEFocusUpdateReport)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusUpdateReport.m"), 20, CFSTR("-init is not a valid initializer for this class."));

  return 0;
}

- (_FEFocusUpdateReport)initWithFocusSystem:(id)a3
{
  id v5;
  _FEFocusUpdateReport *v6;
  _FEFocusUpdateReport *v7;
  void *v9;
  objc_super v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusUpdateReport.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("focusSystem"));

  }
  v10.receiver = self;
  v10.super_class = (Class)_FEFocusUpdateReport;
  v6 = -[_FEFocusUpdateReport init](&v10, sel_init);
  v7 = v6;
  if (v6)
    objc_storeWeak((id *)&v6->_focusSystem, v5);

  return v7;
}

- (BOOL)shouldLog
{
  id WeakRetained;
  _FEFocusUpdateContext *context;
  _FEFocusUpdateContext *v5;
  BOOL v6;
  void *v7;
  void *v8;
  BOOL v9;
  BOOL v10;
  void *v11;

  WeakRetained = objc_loadWeakRetained((id *)&self->_focusSystem);
  if (WeakRetained && (context = self->_context) != 0)
  {
    v5 = context;
    v6 = -[_FEFocusUpdateContext _isValidInFocusSystem:](v5, "_isValidInFocusSystem:", WeakRetained);
    -[_FEFocusUpdateContext _validationReport](v5, "_validationReport");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_FEFocusUpdateContext _preferredFocusReport](v5, "_preferredFocusReport");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v9 = 0;
    }
    else if (v7)
    {
      objc_msgSend(v7, "issues");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "count"))
      {
        v9 = 0;
      }
      else if (v8)
      {
        v9 = objc_msgSend(v8, "messageCount") == 0;
      }
      else
      {
        v9 = 1;
      }

    }
    else if (v8)
    {
      v9 = objc_msgSend(v8, "messageCount") == 0;
    }
    else
    {
      v9 = 1;
    }
    v10 = !v9;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (_FEFocusSystem)focusSystem
{
  return (_FEFocusSystem *)objc_loadWeakRetained((id *)&self->_focusSystem);
}

- (_FEFocusUpdateContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_focusSystem);
}

@end
