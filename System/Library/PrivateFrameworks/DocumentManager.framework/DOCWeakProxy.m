@implementation DOCWeakProxy

- (DOCWeakProxy)initWithTarget:(id)a3
{
  id v4;
  DOCWeakProxy *v5;
  DOCWeakProxy *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DOCWeakProxy;
  v5 = -[DOCWeakProxy init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[DOCWeakProxy setTarget:](v5, "setTarget:", v4);

  return v6;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  void *v5;
  void *v7;

  -[DOCWeakProxy target](self, "target", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DOCRemoteViewController.m"), 42, CFSTR("DocumentManager service tried to send a message to a deallocated host proxy"));

  }
  return -[DOCWeakProxy target](self, "target");
}

- (NSObject)target
{
  return objc_loadWeakRetained((id *)&self->_target);
}

- (void)setTarget:(id)a3
{
  objc_storeWeak((id *)&self->_target, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_target);
}

@end
