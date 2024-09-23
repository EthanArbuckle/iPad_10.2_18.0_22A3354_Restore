@implementation CoreDAVActionBackedTask

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v7.receiver = self;
  v7.super_class = (Class)CoreDAVActionBackedTask;
  -[CoreDAVTask description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("[%@ "), v4);

  -[CoreDAVActionBackedTask backingAction](self, "backingAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("| Backing Action: [%@]"), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR("]"));
  return v3;
}

- (CoreDAVAction)backingAction
{
  return self->_backingAction;
}

- (void)setBackingAction:(id)a3
{
  objc_storeStrong((id *)&self->_backingAction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingAction, 0);
}

@end
