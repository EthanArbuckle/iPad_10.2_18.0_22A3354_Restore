@implementation DDRemoteActionViewControllerProvider

- (DDRemoteActionViewControllerProvider)initWithContext:(id)a3
{
  id v5;
  DDRemoteActionViewControllerProvider *v6;
  DDRemoteActionViewControllerProvider *v7;
  DDRemoteActionViewControllerProvider *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DDRemoteActionViewControllerProvider;
  v6 = -[DDRemoteActionViewControllerProvider init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_actionContext, a3);
    v8 = v7;
  }

  return v7;
}

- (void)createViewControllerWithCompletionHandler:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DDRemoteAction.m"), 532, CFSTR("This method should never be called in the class DDRemoteActionViewControllerProvider. This method should be overriden."));

}

- (DDRemoteActionContext)actionContext
{
  return (DDRemoteActionContext *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionContext, 0);
}

@end
