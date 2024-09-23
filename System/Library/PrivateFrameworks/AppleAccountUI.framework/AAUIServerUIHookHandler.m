@implementation AAUIServerUIHookHandler

- (AAUIServerUIHookHandler)init
{
  AAUIServerUIHookHandler *v2;
  AAUIServerHookHandlerDelegate *v3;
  AAUIServerHookHandlerDelegate *delegate;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AAUIServerUIHookHandler;
  v2 = -[AAUIServerUIHookHandler init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(AAUIServerHookHandlerDelegate);
    delegate = v2->_delegate;
    v2->_delegate = v3;

    -[RUIServerHookHandler setDelegate:](v2, "setDelegate:", v2->_delegate);
  }
  return v2;
}

- (UIViewController)presentingControllerOverride
{
  return self->_presentingControllerOverride;
}

- (void)setPresentingControllerOverride:(id)a3
{
  objc_storeStrong((id *)&self->_presentingControllerOverride, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentingControllerOverride, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
