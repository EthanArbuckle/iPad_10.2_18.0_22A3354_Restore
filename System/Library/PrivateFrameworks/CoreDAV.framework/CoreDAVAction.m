@implementation CoreDAVAction

- (CoreDAVAction)initWithAction:(int)a3 context:(id)a4
{
  id v7;
  CoreDAVAction *v8;
  CoreDAVAction *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CoreDAVAction;
  v8 = -[CoreDAVAction init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_action = a3;
    objc_storeStrong(&v8->_context, a4);
  }

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p> { Change type %d, Context: %@"), objc_opt_class(), self, self->_action, self->_context);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_changeContext)
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(", ChangeContext: %@ }"), self->_changeContext);
  else
    objc_msgSend(v3, "stringByAppendingString:", CFSTR(" }"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int)action
{
  return self->_action;
}

- (id)context
{
  return self->_context;
}

- (id)changeContext
{
  return self->_changeContext;
}

- (void)setChangeContext:(id)a3
{
  objc_storeStrong(&self->_changeContext, a3);
}

- (BOOL)ignoresGuardianRestrictions
{
  return self->_ignoresGuardianRestrictions;
}

- (void)setIgnoresGuardianRestrictions:(BOOL)a3
{
  self->_ignoresGuardianRestrictions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_changeContext, 0);
  objc_storeStrong(&self->_context, 0);
}

@end
